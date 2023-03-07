package com.example.ToDo.demo.Controller;

import com.example.ToDo.demo.Repository.ListRepository;
import com.example.ToDo.demo.domain.ListRequestDto;
import com.example.ToDo.demo.domain.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.sql.Timestamp;
import java.util.List;

@RestController
public class ListRestController {

    private final ListRepository listRepository;

    @Autowired
    public ListRestController(ListRepository listRepository) {
        this.listRepository = listRepository;
    }

    @GetMapping("/api/todolist")
    public List<Lists> getlist (){
        return listRepository.findAll();
    }


    @PostMapping("/api/todolist")
    public Lists writelist (@RequestBody ListRequestDto listRequestDto){
        Long datetime = System.currentTimeMillis();
        Timestamp timestamp = new Timestamp(datetime);

        listRequestDto.setUpdated(false);
        listRequestDto.setTimestamp(timestamp);

        //listRequestDto.getUserinfo();


        Lists lists = new Lists(listRequestDto);

        return listRepository.save(lists);
    }



    @PatchMapping("/api/todolist/{id}")
    public boolean patchlist(@PathVariable Long id){
      Lists lists =  listRepository.findById(id).get();
      lists.setUpdated(true);
        Long datetime = System.currentTimeMillis();
        Timestamp timestamp = new Timestamp(datetime);
      lists.setTimestamp(timestamp);

      listRepository.save(lists);


      return true;
    }

    @DeleteMapping("/api/todolist/{id}")
    public boolean deletelist(@PathVariable Long id){
        listRepository.deleteById(id);
        return true;
    }
}
