�i(�i(        hX    unc (param i32) (result i32)))
  (type (;1;) (func))
  (type (;2;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;3;) (func (result i32)))
  (type (;4;) (func (param i32)))
  (import "env" "emscripten_resize_heap" (func (;0;) (type 0)))
  (import "env" "abort" (func (;1;) (type 1)))
  (import "env" "memory" (memory (;0;) 1024 1024))
  (func (;2;) (type 1))
  (func (;3;) (type 2) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 f64 f64 f64 f64 f64)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 13
    global.set 0
    local.get 13
    local.get 3
    i32.store offset=12
    local.get 13
    local.get 2
    i32.store offset=8
    local.get 13
    local.get 1
    i32.store offset=4
    local.get 13
    local.get 0
    i32.store
    local.get 13
    i32.load offset=12
    local.set 8
    local.get 13
    i32.load offset=8
    local.set 12
    i32.const 1024
    local.set 5
    block  ;; label = @1
      loop  ;; label = @2
        i32.const 0
        local.set 2
        global.get 0
        i32.const 16
        i32.sub
        local.tee 15
        global.set 0
        block  ;; label = @3
          i32.const 1104
          i32.load
          local.tee 6
          i32.const 10
          i32.shr_u
          local.tee 0
          i32.const 3
          i32.and
          if  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.const -1
              i32.xor
              i32.const 1
              i32.and
              i32.const 10
              i32.add
              local.tee 10
              i32.const 3
              i32.shl
              local.tee 4
              i32.const 1144
              i32.add
              local.tee 0
              local.get 4
              i32.const 1152
              i32.add
              i32.load
              local.tee 4
              i32.load offset=8
              local.tee 1
              i32.eq
              if  ;; label = @6
                i32.const 1104
                local.get 6
                i32.const -2
                local.get 10
                i32.rotl
                i32.and
                i32.store
                br 1 (;@5;)
              end
              local.get 1
              local.get 0
              i32.store offset=12
              local.get 0
              local.get 1
              i32.store offset=8
            end
            local.get 4
            i32.const 8
            i32.add
            local.set 0
            local.get 4
            local.get 10
            i32.const 3
            i32.shl
            local.tee 10
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 4
            local.get 10
            i32.add
            local.tee 4
            local.get 4
            i32.load offset=4
            i32.const 1
            i32.or
            i32.store offset=4
            br 1 (;@3;)
          end
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        i32.const 1112
                        i32.load
                        local.tee 9
                        i32.const 80
                        i32.ge_u
                        br_if 0 (;@10;)
                        local.get 0
                        if  ;; label = @11
                          block  ;; label = @12
                            local.get 0
                            i32.const 10
                            i32.shl
                            i32.const -2048
                            i32.and
                            i32.ctz
                            local.tee 4
                            i32.const 3
                            i32.shl
                            local.tee 0
                            i32.const 1144
                            i32.add
                            local.tee 1
                            local.get 0
                            i32.const 1152
                            i32.add
                            i32.load
                            local.tee 0
                            i32.load offset=8
                            local.tee 2
                            i32.eq
                            if  ;; label = @13
                              i32.const 1104
                              local.get 6
                              i32.const -2
                              local.get 4
                              i32.rotl
                              i32.and
                              local.tee 6
                              i32.store
                              br 1 (;@12;)
                            end
                            local.get 2
                            local.get 1
                            i32.store offset=12
                            local.get 1
                            local.get 2
                            i32.store offset=8
                          end
                          local.get 0
                          i32.const 83
                          i32.store offset=4
                          local.get 0
                          i32.const 80
                          i32.add
                          local.tee 2
                          local.get 4
                          i32.const 3
                          i32.shl
                          local.tee 4
                          i32.const 80
                          i32.sub
                          local.tee 10
                          i32.const 1
                          i32.or
                          i32.store offset=4
                          local.get 0
                          local.get 4
                          i32.add
                          local.get 10
                          i32.store
                          local.get 9
                          if  ;; label = @12
                            local.get 9
                            i32.const -8
                            i32.and
                            i32.const 1144
                            i32.add
                            local.set 1
                            i32.const 1124
                            i32.load
                            local.set 4
                            block (result i32)  ;; label = @13
                              local.get 6
                              i32.const 1
                              local.get 9
                              i32.const 3
                              i32.shr_u
                              i32.shl
                              local.tee 3
                              i32.and
                              i32.eqz
                              if  ;; label = @14
                                i32.const 1104
                                local.get 3
                                local.get 6
                                i32.or
                                i32.store
                                local.get 1
                                br 1 (;@13;)
                              end
                              local.get 1
                              i32.load offset=8
                            end
                            local.set 3
                            local.get 1
                            local.get 4
                            i32.store offset=8
                            local.get 3
                            local.get 4
                            i32.store offset=12
                            local.get 4
                            local.get 1
                            i32.store offset=12
                            local.get 4
                            local.get 3
                            i32.store offset=8
                          end
                          local.get 0
                          i32.const 8
                          i32.add
                          local.set 0
                          i32.const 1124
                          local.get 2
                          i32.store
                          i32.const 1112
                          local.get 10
                          i32.store
                          br 8 (;@3;)
                        end
                        i32.const 1108
                        i32.load
                        local.tee 14
                        i32.eqz
                        br_if 0 (;@10;)
                        local.get 14
                        i32.ctz
                        i32.const 2
                        i32.shl
                        i32.const 1408
                        i32.add
                        i32.load
                        local.tee 2
                        i32.load offset=4
                        i32.const -8
                        i32.and
                        i32.const 80
                        i32.sub
                        local.set 4
                        local.get 2
                        local.set 1
                        loop  ;; label = @11
                          block  ;; label = @12
                            local.get 1
                            i32.load offset=16
                            local.tee 0
                            i32.eqz
                            if  ;; label = @13
                              local.get 1
                              i32.load offset=20
                              local.tee 0
                              i32.eqz
                              br_if 1 (;@12;)
                            end
                            local.get 0
                            i32.load offset=4
                            i32.const -8
                            i32.and
                            i32.const 80
                            i32.sub
                            local.tee 1
                            local.get 4
                            local.get 1
                            local.get 4
                            i32.lt_u
                            local.tee 1
                            select
                            local.set 4
                            local.get 0
                            local.get 2
                            local.get 1
                            select
                            local.set 2
                            local.get 0
                            local.set 1
                            br 1 (;@11;)
                          end
                        end
                        local.get 2
                        i32.load offset=24
                        local.set 11
                        local.get 2
                        local.get 2
                        i32.load offset=12
                        local.tee 0
                        i32.ne
                        if  ;; label = @11
                          i32.const 1120
                          i32.load
                          drop
                          local.get 2
                          i32.load offset=8
                          local.tee 1
                          local.get 0
                          i32.store offset=12
                          local.get 0
                          local.get 1
                          i32.store offset=8
                          br 7 (;@4;)
                        end
                        local.get 2
                        i32.load offset=20
                        local.tee 1
                        if (result i32)  ;; label = @11
                          local.get 2
                          i32.const 20
                          i32.add
                        else
                          local.get 2
                          i32.load offset=16
                          local.tee 1
                          i32.eqz
                          br_if 2 (;@9;)
                          local.get 2
                          i32.const 16
                          i32.add
                        end
                        local.set 3
                        loop  ;; label = @11
                          local.get 3
                          local.set 10
                          local.get 1
                          local.tee 0
                          i32.const 20
                          i32.add
                          local.set 3
                          local.get 1
                          i32.load offset=20
                          local.tee 1
                          br_if 0 (;@11;)
                          local.get 0
                          i32.const 16
                          i32.add
                          local.set 3
                          local.get 0
                          i32.load offset=16
                          local.tee 1
                          br_if 0 (;@11;)
                        end
                        local.get 10
                        i32.const 0
                        i32.store
                        br 6 (;@4;)
                      end
                      i32.const 1112
                      i32.load
                      local.tee 0
                      i32.const 80
                      i32.ge_u
                      if  ;; label = @10
                        i32.const 1124
                        i32.load
                        local.set 4
                        block  ;; label = @11
                          local.get 0
                          i32.const 80
                          i32.sub
                          local.tee 1
                          i32.const 16
                          i32.ge_u
                          if  ;; label = @12
                            local.get 4
                            i32.const 80
                            i32.add
                            local.tee 2
                            local.get 1
                            i32.const 1
                            i32.or
                            i32.store offset=4
                            local.get 0
                            local.get 4
                            i32.add
                            local.get 1
                            i32.store
                            local.get 4
                            i32.const 83
                            i32.store offset=4
                            br 1 (;@11;)
                          end
                          local.get 4
                          local.get 0
                          i32.const 3
                          i32.or
                          i32.store offset=4
                          local.get 0
                          local.get 4
                          i32.add
                          local.tee 0
                          local.get 0
                          i32.load offset=4
                          i32.const 1
                          i32.or
                          i32.store offset=4
                          i32.const 0
                          local.set 1
                        end
                        i32.const 1112
                        local.get 1
                        i32.store
                        i32.const 1124
                        local.get 2
                        i32.store
                        local.get 4
                        i32.const 8
                        i32.add
                        local.set 0
                        br 7 (;@3;)
                      end
                      i32.const 1116
                      i32.load
                      local.tee 2
                      i32.const 80
                      i32.gt_u
                      if  ;; label = @10
                        i32.const 1116
                        local.get 2
                        i32.const 80
                        i32.sub
                        local.tee 4
                        i32.store
                        i32.const 1128
                        i32.const 1128
                        i32.load
                        local.tee 0
                        i32.const 80
                        i32.add
                        local.tee 1
                        i32.store
                        local.get 1
                        local.get 4
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get 0
                        i32.const 83
                        i32.store offset=4
                        local.get 0
                        i32.const 8
                        i32.add
                        local.set 0
                        br 7 (;@3;)
                      end
                      i32.const 0
                      local.set 0
                      block (result i32)  ;; label = @10
                        i32.const 1576
                        i32.load
                        if  ;; label = @11
                          i32.const 1584
                          i32.load
                          br 1 (;@10;)
                        end
                        i32.const 1588
                        i64.const -1
                        i64.store align=4
                        i32.const 1580
                        i64.const 17592186048512
                        i64.store align=4
                        i32.const 1576
                        local.get 15
                        i32.const 12
                        i32.add
                        i32.const -16
                        i32.and
                        i32.const 1431655768
                        i32.xor
                        i32.store
                        i32.const 1596
                        i32.const 0
                        i32.store
                        i32.const 1548
                        i32.const 0
                        i32.store
                        i32.const 4096
                      end
                      local.tee 4
                      i32.const 127
                      i32.add
                      local.tee 6
                      i32.const 0
                      local.get 4
                      i32.sub
                      local.tee 10
                      i32.and
                      local.tee 3
                      i32.const 80
                      i32.le_u
                      br_if 6 (;@3;)
                      i32.const 1544
                      i32.load
                      local.tee 4
                      if  ;; label = @10
                        i32.const 1536
                        i32.load
                        local.tee 1
                        local.get 3
                        i32.add
                        local.tee 11
                        local.get 1
                        i32.le_u
                        br_if 7 (;@3;)
                        local.get 4
                        local.get 11
                        i32.lt_u
                        br_if 7 (;@3;)
                      end
                      block  ;; label = @10
                        i32.const 1548
                        i32.load8_u
                        i32.const 4
                        i32.and
                        i32.eqz
                        if  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  i32.const 1128
                                  i32.load
                                  local.tee 4
                                  if  ;; label = @16
                                    i32.const 1552
                                    local.set 0
                                    loop  ;; label = @17
                                      local.get 4
                                      local.get 0
                                      i32.load
                                      local.tee 1
                                      i32.ge_u
                                      if  ;; label = @18
                                        local.get 1
                                        local.get 0
                                        i32.load offset=4
                                        i32.add
                                        local.get 4
                                        i32.gt_u
                                        br_if 3 (;@15;)
                                      end
                                      local.get 0
                                      i32.load offset=8
                                      local.tee 0
                                      br_if 0 (;@17;)
                                    end
                                  end
                                  i32.const 0
                                  call 4
                                  local.tee 2
                                  i32.const -1
                                  i32.eq
                                  br_if 3 (;@12;)
                                  local.get 3
                                  local.set 6
                                  i32.const 1580
                                  i32.load
                                  local.tee 0
                                  i32.const 1
                                  i32.sub
                                  local.tee 4
                                  local.get 2
                                  i32.and
                                  if  ;; label = @16
                                    local.get 3
                                    local.get 2
                                    i32.sub
                                    local.get 2
                                    local.get 4
                                    i32.add
                                    i32.const 0
                                    local.get 0
                                    i32.sub
                                    i32.and
                                    i32.add
                                    local.set 6
                                  end
                                  local.get 6
                                  i32.const 80
                                  i32.le_u
                                  br_if 3 (;@12;)
                                  i32.const 1544
                                  i32.load
                                  local.tee 0
                                  if  ;; label = @16
                                    i32.const 1536
                                    i32.load
                                    local.tee 4
                                    local.get 6
                                    i32.add
                                    local.tee 1
                                    local.get 4
                                    i32.le_u
                                    br_if 4 (;@12;)
                                    local.get 0
                                    local.get 1
                                    i32.lt_u
                                    br_if 4 (;@12;)
                                  end
                                  local.get 6
                                  call 4
                                  local.tee 0
                                  local.get 2
                                  i32.ne
                                  br_if 1 (;@14;)
                                  br 5 (;@10;)
                                end
                                local.get 6
                                local.get 2
                                i32.sub
                                local.get 10
                                i32.and
                                local.tee 6
                                call 4
                                local.tee 2
                                local.get 0
                                i32.load
                                local.get 0
                                i32.load offset=4
                                i32.add
                                i32.eq
                                br_if 1 (;@13;)
                                local.get 2
                                local.set 0
                              end
                              local.get 0
                              i32.const -1
                              i32.eq
                              br_if 1 (;@12;)
                              local.get 6
                              i32.const 128
                              i32.ge_u
                              if  ;; label = @14
                                local.get 0
                                local.set 2
                                br 4 (;@10;)
                              end
                              i32.const 1584
                              i32.load
                              local.tee 4
                              i32.const 127
                              local.get 6
                              i32.sub
                              i32.add
                              i32.const 0
                              local.get 4
                              i32.sub
                              i32.and
                              local.tee 4
                              call 4
                              i32.const -1
                              i32.eq
                              br_if 1 (;@12;)
                              local.get 4
                              local.get 6
                              i32.add
                              local.set 6
                              local.get 0
                              local.set 2
                              br 3 (;@10;)
                            end
                            local.get 2
                            i32.const -1
                            i32.ne
                            br_if 2 (;@10;)
                          end
                          i32.const 1548
                          i32.const 1548
                          i32.load
                          i32.const 4
                          i32.or
                          i32.store
                        end
                        local.get 3
                        call 4
                        local.set 2
                        i32.const 0
                        call 4
                        local.set 0
                        local.get 2
                        i32.const -1
                        i32.eq
                        br_if 4 (;@6;)
                        local.get 0
                        i32.const -1
                        i32.eq
                        br_if 4 (;@6;)
                        local.get 0
                        local.get 2
                        i32.le_u
                        br_if 4 (;@6;)
                        local.get 0
                        local.get 2
                        i32.sub
                        local.tee 6
                        i32.const 120
                        i32.le_u
                        br_if 4 (;@6;)
                      end
                      i32.const 1536
                      i32.const 1536
                      i32.load
                      local.get 6
                      i32.add
                      local.tee 0
                      i32.store
                      i32.const 1540
                      i32.load
                      local.get 0
                      i32.lt_u
                      if  ;; label = @10
                        i32.const 1540
                        local.get 0
                        i32.store
                      end
                      block  ;; label = @10
                        i32.const 1128
                        i32.load
                        local.tee 4
                        if  ;; label = @11
                          i32.const 1552
                          local.set 0
                          loop  ;; label = @12
                            local.get 2
                            local.get 0
                            i32.load
                            local.tee 1
                            local.get 0
                            i32.load offset=4
                            local.tee 3
                            i32.add
                            i32.eq
                            br_if 2 (;@10;)
                            local.get 0
                            i32.load offset=8
                            local.tee 0
                            br_if 0 (;@12;)
                          end
                          br 3 (;@8;)
                        end
                        i32.const 1120
                        i32.load
                        local.tee 0
                        i32.const 0
                        local.get 0
                        local.get 2
                        i32.le_u
                        select
                        i32.eqz
                        if  ;; label = @11
                          i32.const 1120
                          local.get 2
                          i32.store
                        end
                        i32.const 0
                        local.set 0
                        i32.const 1556
                        local.get 6
                        i32.store
                        i32.const 1552
                        local.get 2
                        i32.store
                        i32.const 1136
                        i32.const -1
                        i32.store
                        i32.const 1140
                        i32.const 1576
                        i32.load
                        i32.store
                        i32.const 1564
                        i32.const 0
                        i32.store
                        loop  ;; label = @11
                          local.get 0
                          i32.const 3
                          i32.shl
                          local.tee 4
                          i32.const 1152
                          i32.add
                          local.get 4
                          i32.const 1144
                          i32.add
                          local.tee 1
                          i32.store
                          local.get 4
                          i32.const 1156
                          i32.add
                          local.get 1
                          i32.store
                          local.get 0
                          i32.const 1
                          i32.add
                          local.tee 0
                          i32.const 32
                          i32.ne
                          br_if 0 (;@11;)
                        end
                        i32.const 1116
                        local.get 6
                        i32.const 40
                        i32.sub
                        local.tee 0
                        i32.const -8
                        local.get 2
                        i32.sub
                        i32.const 7
                        i32.and
                        local.tee 4
                        i32.sub
                        local.tee 1
                        i32.store
                        i32.const 1128
                        local.get 2
                        local.get 4
                        i32.add
                        local.tee 4
                        i32.store
                        local.get 4
                        local.get 1
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get 0
                        local.get 2
                        i32.add
                        i32.const 40
                        i32.store offset=4
                        i32.const 1132
                        i32.const 1592
                        i32.load
                        i32.store
                        br 3 (;@7;)
                      end
                      local.get 2
                      local.get 4
                      i32.le_u
                      br_if 1 (;@8;)
                      local.get 1
                      local.get 4
                      i32.gt_u
                      br_if 1 (;@8;)
                      local.get 0
                      i32.load offset=12
                      i32.const 8
                      i32.and
                      br_if 1 (;@8;)
                      local.get 0
                      local.get 3
                      local.get 6
                      i32.add
                      i32.store offset=4
                      i32.const 1128
                      local.get 4
                      i32.const -8
                      local.get 4
                      i32.sub
                      i32.const 7
                      i32.and
                      local.tee 0
                      i32.add
                      local.tee 1
                      i32.store
                      i32.const 1116
                      i32.const 1116
                      i32.load
                      local.get 6
                      i32.add
                      local.tee 2
                      local.get 0
                      i32.sub
                      local.tee 0
                      i32.store
                      local.get 1
                      local.get 0
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 2
                      local.get 4
                      i32.add
                      i32.const 40
                      i32.store offset=4
                      i32.const 1132
                      i32.const 1592
                      i32.load
                      i32.store
                      br 2 (;@7;)
                    end
                    i32.const 0
                    local.set 0
                    br 4 (;@4;)
                  end
                  i32.const 1120
                  i32.load
                  local.get 2
                  i32.gt_u
                  if  ;; label = @8
                    i32.const 1120
                    local.get 2
                    i32.store
                  end
                  local.get 2
                  local.get 6
                  i32.add
                  local.set 1
                  i32.const 1552
                  local.set 0
                  block  ;; label = @8
                    loop  ;; label = @9
                      local.get 1
                      local.get 0
                      i32.load
                      i32.ne
                      if  ;; label = @10
                        local.get 0
                        i32.load offset=8
                        local.tee 0
                        br_if 1 (;@9;)
                        br 2 (;@8;)
                      end
                    end
                    local.get 0
                    i32.load8_u offset=12
                    i32.const 8
                    i32.and
                    i32.eqz
                    br_if 3 (;@5;)
                  end
                  i32.const 1552
                  local.set 0
                  loop  ;; label = @8
                    block  ;; label = @9
                      local.get 4
                      local.get 0
                      i32.load
                      local.tee 1
                      i32.ge_u
                      if  ;; label = @10
                        local.get 1
                        local.get 0
                        i32.load offset=4
                        i32.add
                        local.tee 1
                        local.get 4
                        i32.gt_u
                        br_if 1 (;@9;)
                      end
                      local.get 0
                      i32.load offset=8
                      local.set 0
                      br 1 (;@8;)
                    end
                  end
                  i32.const 1116
                  local.get 6
                  i32.const 40
                  i32.sub
                  local.tee 0
                  i32.const -8
                  local.get 2
                  i32.sub
                  i32.const 7
                  i32.and
                  local.tee 3
                  i32.sub
                  local.tee 10
                  i32.store
                  i32.const 1128
                  local.get 2
                  local.get 3
                  i32.add
                  local.tee 3
                  i32.store
                  local.get 3
                  local.get 10
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 0
                  local.get 2
                  i32.add
                  i32.const 40
                  i32.store offset=4
                  i32.const 1132
                  i32.const 1592
                  i32.load
                  i32.store
                  local.get 4
                  local.get 1
                  i32.const 39
                  local.get 1
                  i32.sub
                  i32.const 7
                  i32.and
                  i32.add
                  i32.const 47
                  i32.sub
                  local.tee 0
                  local.get 0
                  local.get 4
                  i32.const 16
                  i32.add
                  i32.lt_u
                  select
                  local.tee 3
                  i32.const 27
                  i32.store offset=4
                  local.get 3
                  i32.const 1560
                  i64.load align=4
                  i64.store offset=16 align=4
                  local.get 3
                  i32.const 1552
                  i64.load align=4
                  i64.store offset=8 align=4
                  i32.const 1560
                  local.get 3
                  i32.const 8
                  i32.add
                  i32.store
                  i32.const 1556
                  local.get 6
                  i32.store
                  i32.const 1552
                  local.get 2
                  i32.store
                  i32.const 1564
                  i32.const 0
                  i32.store
                  local.get 3
                  i32.const 24
                  i32.add
                  local.set 0
                  loop  ;; label = @8
                    local.get 0
                    i32.const 7
                    i32.store offset=4
                    local.get 0
                    i32.const 8
                    i32.add
                    local.set 2
                    local.get 0
                    i32.const 4
                    i32.add
                    local.set 0
                    local.get 1
                    local.get 2
                    i32.gt_u
                    br_if 0 (;@8;)
                  end
                  local.get 3
                  local.get 4
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 3
                  local.get 3
                  i32.load offset=4
                  i32.const -2
                  i32.and
                  i32.store offset=4
                  local.get 4
                  local.get 3
                  local.get 4
                  i32.sub
                  local.tee 2
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 3
                  local.get 2
                  i32.store
                  block (result i32)  ;; label = @8
                    local.get 2
                    i32.const 255
                    i32.le_u
                    if  ;; label = @9
                      local.get 2
                      i32.const -8
                      i32.and
                      i32.const 1144
                      i32.add
                      local.set 0
                      block (result i32)  ;; label = @10
                        i32.const 1104
                        i32.load
                        local.tee 1
                        i32.const 1
                        local.get 2
                        i32.const 3
                        i32.shr_u
                        i32.shl
                        local.tee 2
                        i32.and
                        i32.eqz
                        if  ;; label = @11
                          i32.const 1104
                          local.get 1
                          local.get 2
                          i32.or
                          i32.store
                          local.get 0
                          br 1 (;@10;)
                        end
                        local.get 0
                        i32.load offset=8
                      end
                      local.set 1
                      local.get 0
                      local.get 4
                      i32.store offset=8
                      local.get 1
                      local.get 4
                      i32.store offset=12
                      i32.const 12
                      local.set 2
                      i32.const 8
                      br 1 (;@8;)
                    end
                    i32.const 31
                    local.set 0
                    local.get 2
                    i32.const 16777215
                    i32.le_u
                    if  ;; label = @9
                      local.get 2
                      i32.const 38
                      local.get 2
                      i32.const 8
                      i32.shr_u
                      i32.clz
                      local.tee 0
                      i32.sub
                      i32.shr_u
                      i32.const 1
                      i32.and
                      local.get 0
                      i32.const 1
                      i32.shl
                      i32.sub
                      i32.const 62
                      i32.add
                      local.set 0
                    end
                    local.get 4
                    local.get 0
                    i32.store offset=28
                    local.get 4
                    i64.const 0
                    i64.store offset=16 align=4
                    local.get 0
                    i32.const 2
                    i32.shl
                    i32.const 1408
                    i32.add
                    local.set 1
                    block  ;; label = @9
                      block  ;; label = @10
                        i32.const 1108
                        i32.load
                        local.tee 3
                        i32.const 1
                        local.get 0
                        i32.shl
                        local.tee 6
                        i32.and
                        i32.eqz
                        if  ;; label = @11
                          i32.const 1108
                          local.get 3
                          local.get 6
                          i32.or
                          i32.store
                          local.get 1
                          local.get 4
                          i32.store
                          local.get 4
                          local.get 1
                          i32.store offset=24
                          br 1 (;@10;)
                        end
                        local.get 2
                        i32.const 25
                        local.get 0
                        i32.const 1
                        i32.shr_u
                        i32.sub
                        i32.const 0
                        local.get 0
                        i32.const 31
                        i32.ne
                        select
                        i32.shl
                        local.set 0
                        local.get 1
                        i32.load
                        local.set 3
                        loop  ;; label = @11
                          local.get 3
                          local.tee 1
                          i32.load offset=4
                          i32.const -8
                          i32.and
                          local.get 2
                          i32.eq
                          br_if 2 (;@9;)
                          local.get 0
                          i32.const 29
                          i32.shr_u
                          local.set 3
                          local.get 0
                          i32.const 1
                          i32.shl
                          local.set 0
                          local.get 1
                          local.get 3
                          i32.const 4
                          i32.and
                          i32.add
                          i32.const 16
                          i32.add
                          local.tee 6
                          i32.load
                          local.tee 3
                          br_if 0 (;@11;)
                        end
                        local.get 6
                        local.get 4
                        i32.store
                        local.get 4
                        local.get 1
                        i32.store offset=24
                      end
                      i32.const 8
                      local.set 2
                      local.get 4
                      local.tee 1
                      local.set 0
                      i32.const 12
                      br 1 (;@8;)
                    end
                    local.get 1
                    i32.load offset=8
                    local.tee 0
                    local.get 4
                    i32.store offset=12
                    local.get 1
                    local.get 4
                    i32.store offset=8
                    local.get 4
                    local.get 0
                    i32.store offset=8
                    i32.const 0
                    local.set 0
                    i32.const 24
                    local.set 2
                    i32.const 12
                  end
                  local.get 4
                  i32.add
                  local.get 1
                  i32.store
                  local.get 2
                  local.get 4
                  i32.add
                  local.get 0
                  i32.store
                end
                i32.const 1116
                i32.load
                local.tee 0
                i32.const 80
                i32.le_u
                br_if 0 (;@6;)
                i32.const 1116
                local.get 0
                i32.const 80
                i32.sub
                local.tee 4
                i32.store
                i32.const 1128
                i32.const 1128
                i32.load
                local.tee 0
                i32.const 80
                i32.add
                local.tee 1
                i32.store
                local.get 1
                local.get 4
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 0
                i32.const 83
                i32.store offset=4
                local.get 0
                i32.const 8
                i32.add
                local.set 0
                br 3 (;@3;)
              end
              i32.const 1100
              i32.const 48
              i32.store
              i32.const 0
              local.set 0
              br 2 (;@3;)
            end
            local.get 0
            local.get 2
            i32.store
            local.get 0
            local.get 0
            i32.load offset=4
            local.get 6
            i32.add
            i32.store offset=4
            local.get 2
            i32.const -8
            local.get 2
            i32.sub
            i32.const 7
            i32.and
            i32.add
            local.tee 10
            i32.const 83
            i32.store offset=4
            local.get 1
            i32.const -8
            local.get 1
            i32.sub
            i32.const 7
            i32.and
            i32.add
            local.tee 11
            local.get 10
            i32.const 80
            i32.add
            local.tee 9
            i32.sub
            local.set 3
            block  ;; label = @5
              i32.const 1128
              i32.load
              local.get 11
              i32.eq
              if  ;; label = @6
                i32.const 1128
                local.get 9
                i32.store
                i32.const 1116
                i32.const 1116
                i32.load
                local.get 3
                i32.add
                local.tee 4
                i32.store
                local.get 9
                local.get 4
                i32.const 1
                i32.or
                i32.store offset=4
                br 1 (;@5;)
              end
              i32.const 1124
              i32.load
              local.get 11
              i32.eq
              if  ;; label = @6
                i32.const 1124
                local.get 9
                i32.store
                i32.const 1112
                i32.const 1112
                i32.load
                local.get 3
                i32.add
                local.tee 4
                i32.store
                local.get 9
                local.get 4
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 4
                local.get 9
                i32.add
                local.get 4
                i32.store
                br 1 (;@5;)
              end
              local.get 11
              i32.load offset=4
              local.tee 1
              i32.const 3
              i32.and
              i32.const 1
              i32.eq
              if  ;; label = @6
                local.get 1
                i32.const -8
                i32.and
                local.set 6
                local.get 11
                i32.load offset=12
                local.set 4
                block  ;; label = @7
                  local.get 1
                  i32.const 255
                  i32.le_u
                  if  ;; label = @8
                    local.get 1
                    i32.const 3
                    i32.shr_u
                    local.set 2
                    local.get 11
                    i32.load offset=8
                    local.tee 0
                    local.get 4
                    i32.eq
                    if  ;; label = @9
                      i32.const 1104
                      i32.const 1104
                      i32.load
                      i32.const -2
                      local.get 2
                      i32.rotl
                      i32.and
                      i32.store
                      br 2 (;@7;)
                    end
                    local.get 0
                    local.get 4
                    i32.store offset=12
                    local.get 4
                    local.get 0
                    i32.store offset=8
                    br 1 (;@7;)
                  end
                  local.get 11
                  i32.load offset=24
                  local.set 14
                  block  ;; label = @8
                    local.get 4
                    local.get 11
                    i32.ne
                    if  ;; label = @9
                      i32.const 1120
                      i32.load
                      drop
                      local.get 11
                      i32.load offset=8
                      local.tee 1
                      local.get 4
                      i32.store offset=12
                      local.get 4
                      local.get 1
                      i32.store offset=8
                      br 1 (;@8;)
                    end
                    block  ;; label = @9
                      local.get 11
                      i32.load offset=20
                      local.tee 1
                      if (result i32)  ;; label = @10
                        local.get 11
                        i32.const 20
                        i32.add
                      else
                        local.get 11
                        i32.load offset=16
                        local.tee 1
                        i32.eqz
                        br_if 1 (;@9;)
                        local.get 11
                        i32.const 16
                        i32.add
                      end
                      local.set 0
                      loop  ;; label = @10
                        local.get 0
                        local.set 2
                        local.get 1
                        local.tee 4
                        i32.const 20
                        i32.add
                        local.set 0
                        local.get 1
                        i32.load offset=20
                        local.tee 1
                        br_if 0 (;@10;)
                        local.get 4
                        i32.const 16
                        i32.add
                        local.set 0
                        local.get 4
                        i32.load offset=16
                        local.tee 1
                        br_if 0 (;@10;)
                      end
                      local.get 2
                      i32.const 0
                      i32.store
                      br 1 (;@8;)
                    end
                    i32.const 0
                    local.set 4
                  end
                  local.get 14
                  i32.eqz
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    local.get 11
                    i32.load offset=28
                    local.tee 0
                    i32.const 2
                    i32.shl
                    i32.const 1408
                    i32.add
                    local.tee 1
                    i32.load
                    local.get 11
                    i32.eq
                    if  ;; label = @9
                      local.get 1
                      local.get 4
                      i32.store
                      local.get 4
                      br_if 1 (;@8;)
                      i32.const 1108
                      i32.const 1108
                      i32.load
                      i32.const -2
                      local.get 0
                      i32.rotl
                      i32.and
                      i32.store
                      br 2 (;@7;)
                    end
                    local.get 14
                    i32.const 16
                    i32.const 20
                    local.get 14
                    i32.load offset=16
                    local.get 11
                    i32.eq
                    select
                    i32.add
                    local.get 4
                    i32.store
                    local.get 4
                    i32.eqz
                    br_if 1 (;@7;)
                  end
                  local.get 4
                  local.get 14
                  i32.store offset=24
                  local.get 11
                  i32.load offset=16
                  local.tee 1
                  if  ;; label = @8
                    local.get 4
                    local.get 1
                    i32.store offset=16
                    local.get 1
                    local.get 4
                    i32.store offset=24
                  end
                  local.get 11
                  i32.load offset=20
                  local.tee 1
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 4
                  local.get 1
                  i32.store offset=20
                  local.get 1
                  local.get 4
                  i32.store offset=24
                end
                local.get 3
                local.get 6
                i32.add
                local.set 3
                local.get 6
                local.get 11
                i32.add
                local.tee 11
                i32.load offset=4
                local.set 1
              end
              local.get 11
              local.get 1
              i32.const -2
              i32.and
              i32.store offset=4
              local.get 9
              local.get 3
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 3
              local.get 9
              i32.add
              local.get 3
              i32.store
              local.get 3
              i32.const 255
              i32.le_u
              if  ;; label = @6
                local.get 3
                i32.const -8
                i32.and
                i32.const 1144
                i32.add
                local.set 4
                block (result i32)  ;; label = @7
                  i32.const 1104
                  i32.load
                  local.tee 1
                  i32.const 1
                  local.get 3
                  i32.const 3
                  i32.shr_u
                  i32.shl
                  local.tee 3
                  i32.and
                  i32.eqz
                  if  ;; label = @8
                    i32.const 1104
                    local.get 1
                    local.get 3
                    i32.or
                    i32.store
                    local.get 4
                    br 1 (;@7;)
                  end
                  local.get 4
                  i32.load offset=8
                end
                local.set 3
                local.get 4
                local.get 9
                i32.store offset=8
                local.get 3
                local.get 9
                i32.store offset=12
                local.get 9
                local.get 4
                i32.store offset=12
                local.get 9
                local.get 3
                i32.store offset=8
                br 1 (;@5;)
              end
              i32.const 31
              local.set 4
              local.get 3
              i32.const 16777215
              i32.le_u
              if  ;; label = @6
                local.get 3
                i32.const 38
                local.get 3
                i32.const 8
                i32.shr_u
                i32.clz
                local.tee 4
                i32.sub
                i32.shr_u
                i32.const 1
                i32.and
                local.get 4
                i32.const 1
                i32.shl
                i32.sub
                i32.const 62
                i32.add
                local.set 4
              end
              local.get 9
              local.get 4
              i32.store offset=28
              local.get 9
              i64.const 0
              i64.store offset=16 align=4
              local.get 4
              i32.const 2
              i32.shl
              i32.const 1408
              i32.add
              local.set 1
              block  ;; label = @6
                block  ;; label = @7
                  i32.const 1108
                  i32.load
                  local.tee 0
                  i32.const 1
                  local.get 4
                  i32.shl
                  local.tee 11
                  i32.and
                  i32.eqz
                  if  ;; label = @8
                    i32.const 1108
                    local.get 0
                    local.get 11
                    i32.or
                    i32.store
                    local.get 1
                    local.get 9
                    i32.store
                    local.get 9
                    local.get 1
                    i32.store offset=24
                    br 1 (;@7;)
                  end
                  local.get 3
                  i32.const 25
                  local.get 4
                  i32.const 1
                  i32.shr_u
                  i32.sub
                  i32.const 0
                  local.get 4
                  i32.const 31
                  i32.ne
                  select
                  i32.shl
                  local.set 4
                  local.get 1
                  i32.load
                  local.set 0
                  loop  ;; label = @8
                    local.get 0
                    local.tee 1
                    i32.load offset=4
                    i32.const -8
                    i32.and
                    local.get 3
                    i32.eq
                    br_if 2 (;@6;)
                    local.get 4
                    i32.const 29
                    i32.shr_u
                    local.set 0
                    local.get 4
                    i32.const 1
                    i32.shl
                    local.set 4
                    local.get 1
                    local.get 0
                    i32.const 4
                    i32.and
                    i32.add
                    i32.const 16
                    i32.add
                    local.tee 11
                    i32.load
                    local.tee 0
                    br_if 0 (;@8;)
                  end
                  local.get 11
                  local.get 9
                  i32.store
                  local.get 9
                  local.get 1
                  i32.store offset=24
                end
                local.get 9
                local.get 9
                i32.store offset=12
                local.get 9
                local.get 9
                i32.store offset=8
                br 1 (;@5;)
              end
              local.get 1
              i32.load offset=8
              local.tee 4
              local.get 9
              i32.store offset=12
              local.get 1
              local.get 9
              i32.store offset=8
              local.get 9
              i32.const 0
              i32.store offset=24
              local.get 9
              local.get 1
              i32.store offset=12
              local.get 9
              local.get 4
              i32.store offset=8
            end
            local.get 10
            i32.const 8
            i32.add
            local.set 0
            br 1 (;@3;)
          end
          block  ;; label = @4
            local.get 11
            i32.eqz
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 2
              i32.load offset=28
              local.tee 3
              i32.const 2
              i32.shl
              i32.const 1408
              i32.add
              local.tee 1
              i32.load
              local.get 2
              i32.eq
              if  ;; label = @6
                local.get 1
                local.get 0
                i32.store
                local.get 0
                br_if 1 (;@5;)
                i32.const 1108
                local.get 14
                i32.const -2
                local.get 3
                i32.rotl
                i32.and
                i32.store
                br 2 (;@4;)
              end
              local.get 11
              i32.const 16
              i32.const 20
              local.get 11
              i32.load offset=16
              local.get 2
              i32.eq
              select
              i32.add
              local.get 0
              i32.store
              local.get 0
              i32.eqz
              br_if 1 (;@4;)
            end
            local.get 0
            local.get 11
            i32.store offset=24
            local.get 2
            i32.load offset=16
            local.tee 1
            if  ;; label = @5
              local.get 0
              local.get 1
              i32.store offset=16
              local.get 1
              local.get 0
              i32.store offset=24
            end
            local.get 2
            i32.load offset=20
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            local.get 1
            i32.store offset=20
            local.get 1
            local.get 0
            i32.store offset=24
          end
          block  ;; label = @4
            local.get 4
            i32.const 15
            i32.le_u
            if  ;; label = @5
              local.get 2
              local.get 4
              i32.const 80
              i32.add
              local.tee 0
              i32.const 3
              i32.or
              i32.store offset=4
              local.get 0
              local.get 2
              i32.add
              local.tee 0
              local.get 0
              i32.load offset=4
              i32.const 1
              i32.or
              i32.store offset=4
              br 1 (;@4;)
            end
            local.get 2
            i32.const 83
            i32.store offset=4
            local.get 2
            i32.const 80
            i32.add
            local.tee 10
            local.get 4
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 4
            local.get 10
            i32.add
            local.get 4
            i32.store
            local.get 9
            if  ;; label = @5
              local.get 9
              i32.const -8
              i32.and
              i32.const 1144
              i32.add
              local.set 1
              i32.const 1124
              i32.load
              local.set 0
              block (result i32)  ;; label = @6
                i32.const 1
                local.get 9
                i32.const 3
                i32.shr_u
                i32.shl
                local.tee 3
                local.get 6
                i32.and
                i32.eqz
                if  ;; label = @7
                  i32.const 1104
                  local.get 3
                  local.get 6
                  i32.or
                  i32.store
                  local.get 1
                  br 1 (;@6;)
                end
                local.get 1
                i32.load offset=8
              end
              local.set 3
              local.get 1
              local.get 0
              i32.store offset=8
              local.get 3
              local.get 0
              i32.store offset=12
              local.get 0
              local.get 1
              i32.store offset=12
              local.get 0
              local.get 3
              i32.store offset=8
            end
            i32.const 1124
            local.get 10
            i32.store
            i32.const 1112
            local.get 4
            i32.store
          end
          local.get 2
          i32.const 8
          i32.add
          local.set 0
        end
        local.get 15
        i32.const 16
        i32.add
        global.set 0
        local.get 0
        br_if 1 (;@1;)
        i32.const 1600
        i32.load
        local.tee 0
        if  ;; label = @3
          local.get 0
          call_indirect (type 1)
          br 1 (;@2;)
        end
      end
      call 1
      unreachable
    end
    local.get 0
    i32.const 72
    i32.add
    local.set 3
    block  ;; label = @1
      local.get 0
      i32.const 1024
      i32.xor
      i32.const 3
      i32.and
      i32.eqz
      if  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.const 3
          i32.and
          i32.eqz
          if  ;; label = @4
            local.get 0
            local.set 1
            br 1 (;@3;)
          end
          local.get 0
          local.set 1
          loop  ;; label = @4
            local.get 1
            local.get 5
            i32.load8_u
            i32.store8
            local.get 5
            i32.const 1
            i32.add
            local.set 5
            local.get 1
            i32.const 1
            i32.add
            local.tee 1
            i32.const 3
            i32.and
            i32.eqz
            br_if 1 (;@3;)
            local.get 1
            local.get 3
            i32.lt_u
            br_if 0 (;@4;)
          end
        end
        block  ;; label = @3
          local.get 3
          i32.const -4
          i32.and
          local.tee 4
          i32.const 64
          i32.lt_u
          br_if 0 (;@3;)
          local.get 1
          local.get 4
          i32.const -64
          i32.add
          local.tee 2
          i32.gt_u
          br_if 0 (;@3;)
          loop  ;; label = @4
            local.get 1
            local.get 5
            i32.load
            i32.store
            local.get 1
            local.get 5
            i32.load offset=4
            i32.store offset=4
            local.get 1
            local.get 5
            i32.load offset=8
            i32.store offset=8
            local.get 1
            local.get 5
            i32.load offset=12
            i32.store offset=12
            local.get 1
            local.get 5
            i32.load offset=16
            i32.store offset=16
            local.get 1
            local.get 5
            i32.load offset=20
            i32.store offset=20
            local.get 1
            local.get 5
            i32.load offset=24
            i32.store offset=24
            local.get 1
            local.get 5
            i32.load offset=28
            i32.store offset=28
            local.get 1
            local.get 5
            i32.load offset=32
            i32.store offset=32
            local.get 1
            local.get 5
            i32.load offset=36
            i32.store offset=36
            local.get 1
            local.get 5
            i32.load offset=40
            i32.store offset=40
            local.get 1
            local.get 5
            i32.load offset=44
            i32.store offset=44
            local.get 1
            local.get 5
            i32.load offset=48
            i32.store offset=48
            local.get 1
            local.get 5
            i32.load offset=52
            i32.store offset=52
            local.get 1
            local.get 5
            i32.load offset=56
            i32.store offset=56
            local.get 1
            local.get 5
            i32.load offset=60
            i32.store offset=60
            local.get 5
            i32.const -64
            i32.sub
            local.set 5
            local.get 1
            i32.const -64
            i32.sub
            local.tee 1
            local.get 2
            i32.le_u
            br_if 0 (;@4;)
          end
        end
        local.get 1
        local.get 4
        i32.ge_u
        br_if 1 (;@1;)
        loop  ;; label = @3
          local.get 1
          local.get 5
          i32.load
          i32.store
          local.get 5
          i32.const 4
          i32.add
          local.set 5
          local.get 1
          i32.const 4
          i32.add
          local.tee 1
          local.get 4
          i32.lt_u
          br_if 0 (;@3;)
        end
        br 1 (;@1;)
      end
      local.get 3
      i32.const 4
      i32.lt_u
      if  ;; label = @2
        local.get 0
        local.set 1
        br 1 (;@1;)
      end
      local.get 0
      local.get 3
      i32.const 4
      i32.sub
      local.tee 4
      i32.gt_u
      if  ;; label = @2
        local.get 0
        local.set 1
        br 1 (;@1;)
      end
      local.get 0
      local.set 1
      loop  ;; label = @2
        local.get 1
        local.get 5
        i32.load8_u
        i32.store8
        local.get 1
        local.get 5
        i32.load8_u offset=1
        i32.store8 offset=1
        local.get 1
        local.get 5
        i32.load8_u offset=2
        i32.store8 offset=2
        local.get 1
        local.get 5
        i32.load8_u offset=3
        i32.store8 offset=3
        local.get 5
        i32.const 4
        i32.add
        local.set 5
        local.get 1
        i32.const 4
        i32.add
        local.tee 1
        local.get 4
        i32.le_u
        br_if 0 (;@2;)
      end
    end
    local.get 1
    local.get 3
    i32.lt_u
    if  ;; label = @1
      loop  ;; label = @2
        local.get 1
        local.get 5
        i32.load8_u
        i32.store8
        local.get 5
        i32.const 1
        i32.add
        local.set 5
        local.get 1
        i32.const 1
        i32.add
        local.tee 1
        local.get 3
        i32.ne
        br_if 0 (;@2;)
      end
    end
    local.get 0
    local.set 1
    block  ;; label = @1
      local.get 8
      i32.const 0
      i32.le_s
      br_if 0 (;@1;)
      local.get 8
      local.get 12
      i32.add
      local.tee 2
      local.get 8
      i32.add
      local.set 0
      loop  ;; label = @2
        local.get 7
        i32.const 2
        i32.shr_u
        local.tee 8
        local.get 8
        local.get 13
        i32.load
        local.tee 10
        i32.div_s
        local.tee 8
        local.get 10
        i32.mul
        i32.sub
        i32.const 4
        i32.sub
        local.set 6
        i32.const 0
        local.get 8
        i32.sub
        local.get 8
        local.get 13
        i32.load offset=4
        local.tee 12
        i32.const 1
        i32.shl
        local.get 8
        i32.sub
        i32.const 2
        i32.sub
        local.get 8
        local.get 12
        i32.lt_s
        select
        local.get 8
        i32.const 0
        i32.lt_s
        select
        local.get 10
        i32.mul
        local.set 5
        local.get 10
        i32.const 1
        i32.shl
        i32.const 2
        i32.sub
        local.set 4
        local.get 13
        i32.load offset=8
        local.set 3
        f64.const 0x0p+0 (;=0;)
        local.set 16
        i32.const 0
        local.set 12
        f64.const 0x0p+0 (;=0;)
        local.set 17
        f64.const 0x0p+0 (;=0;)
        local.set 18
        f64.const 0x0p+0 (;=0;)
        local.set 19
        loop  ;; label = @3
          local.get 3
          i32.const 0
          local.get 6
          local.get 12
          i32.add
          local.tee 8
          i32.sub
          local.get 8
          local.get 4
          local.get 8
          i32.sub
          local.get 8
          local.get 10
          i32.lt_s
          select
          local.get 8
          i32.const 0
          i32.lt_s
          select
          local.get 10
          i32.rem_s
          local.get 5
          i32.add
          i32.const 2
          i32.shl
          i32.add
          local.tee 8
          i32.load8_u
          f64.convert_i32_u
          local.get 1
          local.get 12
          i32.const 3
          i32.shl
          i32.add
          f64.load
          local.tee 20
          f64.mul
          local.get 16
          f64.add
          local.set 16
          local.get 8
          i32.load8_u offset=3
          f64.convert_i32_u
          local.get 20
          f64.mul
          local.get 19
          f64.add
          local.set 19
          local.get 8
          i32.load8_u offset=2
          f64.convert_i32_u
          local.get 20
          f64.mul
          local.get 18
          f64.add
          local.set 18
          local.get 8
          i32.load8_u offset=1
          f64.convert_i32_u
          local.get 20
          f64.mul
          local.get 17
          f64.add
          local.set 17
          local.get 12
          i32.const 1
          i32.add
          local.tee 12
          i32.const 9
          i32.ne
          br_if 0 (;@3;)
        end
        local.get 2
        local.get 7
        i32.add
        local.tee 8
        block (result i32)  ;; label = @3
          local.get 16
          f64.const 0x1p+32 (;=4.29497e+09;)
          f64.lt
          local.get 16
          f64.const 0x0p+0 (;=0;)
          f64.ge
          i32.and
          if  ;; label = @4
            local.get 16
            i32.trunc_f64_u
            br 1 (;@3;)
          end
          i32.const 0
        end
        i32.store8
        local.get 8
        block (result i32)  ;; label = @3
          local.get 19
          f64.const 0x1p+32 (;=4.29497e+09;)
          f64.lt
          local.get 19
          f64.const 0x0p+0 (;=0;)
          f64.ge
          i32.and
          if  ;; label = @4
            local.get 19
            i32.trunc_f64_u
            br 1 (;@3;)
          end
          i32.const 0
        end
        i32.store8 offset=3
        local.get 8
        block (result i32)  ;; label = @3
          local.get 18
          f64.const 0x1p+32 (;=4.29497e+09;)
          f64.lt
          local.get 18
          f64.const 0x0p+0 (;=0;)
          f64.ge
          i32.and
          if  ;; label = @4
            local.get 18
            i32.trunc_f64_u
            br 1 (;@3;)
          end
          i32.const 0
        end
        i32.store8 offset=2
        local.get 8
        block (result i32)  ;; label = @3
          local.get 17
          f64.const 0x1p+32 (;=4.29497e+09;)
          f64.lt
          local.get 17
          f64.const 0x0p+0 (;=0;)
          f64.ge
          i32.and
          if  ;; label = @4
            local.get 17
            i32.trunc_f64_u
            br 1 (;@3;)
          end
          i32.const 0
        end
        i32.store8 offset=1
        local.get 7
        i32.const 4
        i32.add
        local.tee 7
        local.get 13
        i32.load offset=12
        local.tee 8
        i32.lt_s
        br_if 0 (;@2;)
      end
      local.get 8
      i32.const 0
      i32.le_s
      br_if 0 (;@1;)
      i32.const 0
      local.set 7
      loop  ;; label = @2
        local.get 13
        i32.load
        local.tee 10
        i32.const 1
        i32.shl
        local.get 7
        i32.const 2
        i32.shr_u
        local.tee 8
        local.get 8
        local.get 10
        i32.div_s
        local.tee 8
        local.get 10
        i32.mul
        i32.sub
        local.tee 12
        i32.sub
        i32.const 2
        i32.sub
        local.get 12
        local.get 10
        i32.const 0
        i32.lt_s
        select
        local.get 10
        i32.rem_s
        local.set 6
        local.get 13
        i32.load offset=4
        local.tee 4
        i32.const 1
        i32.shl
        local.set 3
        local.get 8
        i32.const 4
        i32.sub
        local.set 5
        f64.const 0x0p+0 (;=0;)
        local.set 16
        i32.const 0
        local.set 8
        f64.const 0x0p+0 (;=0;)
        local.set 17
        f64.const 0x0p+0 (;=0;)
        local.set 18
        f64.const 0x0p+0 (;=0;)
        local.set 19
        loop  ;; label = @3
          block  ;; label = @4
            local.get 5
            local.get 8
            i32.add
            local.tee 12
            i32.const 0
            i32.lt_s
            if  ;; label = @5
              i32.const 0
              local.get 12
              i32.sub
              local.set 12
              br 1 (;@4;)
            end
            local.get 4
            local.get 12
            i32.gt_s
            br_if 0 (;@4;)
            local.get 3
            local.get 12
            i32.sub
            i32.const 2
            i32.sub
            local.set 12
          end
          local.get 2
          local.get 6
          local.get 10
          local.get 12
          i32.mul
          i32.add
          i32.const 2
          i32.shl
          i32.add
          local.tee 12
          i32.load8_u
          f64.convert_i32_u
          local.get 1
          local.get 8
          i32.const 3
          i32.shl
          i32.add
          f64.load
          local.tee 20
          f64.mul
          local.get 19
          f64.add
          local.set 19
          local.get 12
          i32.load8_u offset=3
          f64.convert_i32_u
          local.get 20
          f64.mul
          local.get 16
          f64.add
          local.set 16
          local.get 12
          i32.load8_u offset=2
          f64.convert_i32_u
          local.get 20
          f64.mul
          local.get 17
          f64.add
          local.set 17
          local.get 12
          i32.load8_u offset=1
          f64.convert_i32_u
          local.get 20
          f64.mul
          local.get 18
          f64.add
          local.set 18
          local.get 8
          i32.const 1
          i32.add
          local.tee 8
          i32.const 9
          i32.ne
          br_if 0 (;@3;)
        end
        local.get 0
        local.get 7
        i32.add
        local.tee 8
        block (result i32)  ;; label = @3
          local.get 19
          f64.const 0x1p+32 (;=4.29497e+09;)
          f64.lt
          local.get 19
          f64.const 0x0p+0 (;=0;)
          f64.ge
          i32.and
          if  ;; label = @4
            local.get 19
            i32.trunc_f64_u
            br 1 (;@3;)
          end
          i32.const 0
        end
        i32.store8
        local.get 8
        block (result i32)  ;; label = @3
          local.get 16
          f64.const 0x1p+32 (;=4.29497e+09;)
          f64.lt
          local.get 16
          f64.const 0x0p+0 (;=0;)
          f64.ge
          i32.and
          if  ;; label = @4
            local.get 16
            i32.trunc_f64_u
            br 1 (;@3;)
          end
          i32.const 0
        end
        i32.store8 offset=3
        local.get 8
        block (result i32)  ;; label = @3
          local.get 17
          f64.const 0x1p+32 (;=4.29497e+09;)
          f64.lt
          local.get 17
          f64.const 0x0p+0 (;=0;)
          f64.ge
          i32.and
          if  ;; label = @4
            local.get 17
            i32.trunc_f64_u
            br 1 (;@3;)
          end
          i32.const 0
        end
        i32.store8 offset=2
        local.get 8
        block (result i32)  ;; label = @3
          local.get 18
          f64.const 0x1p+32 (;=4.29497e+09;)
          f64.lt
          local.get 18
          f64.const 0x0p+0 (;=0;)
          f64.ge
          i32.and
          if  ;; label = @4
            local.get 18
            i32.trunc_f64_u
            br 1 (;@3;)
          end
          i32.const 0
        end
        i32.store8 offset=1
        local.get 7
        i32.const 4
        i32.add
        local.tee 7
        local.get 13
        i32.load offset=12
        local.tee 8
        i32.lt_s
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.const 8
      i32.sub
      local.tee 5
      local.get 1
      i32.const 4
      i32.sub
      i32.load
      local.tee 3
      i32.const -8
      i32.and
      local.tee 7
      i32.add
      local.set 4
      block  ;; label = @2
        local.get 3
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 3
        i32.const 2
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 5
        local.get 5
        i32.load
        local.tee 1
        i32.sub
        local.tee 5
        i32.const 1120
        i32.load
        i32.lt_u
        br_if 1 (;@1;)
        local.get 1
        local.get 7
        i32.add
        local.set 7
        block  ;; label = @3
          block  ;; label = @4
            i32.const 1124
            i32.load
            local.get 5
            i32.ne
            if  ;; label = @5
              local.get 5
              i32.load offset=12
              local.set 3
              local.get 1
              i32.const 255
              i32.le_u
              if  ;; label = @6
                local.get 1
                i32.const 3
                i32.shr_u
                local.set 2
                local.get 5
                i32.load offset=8
                local.tee 0
                local.get 3
                i32.eq
                if  ;; label = @7
                  i32.const 1104
                  i32.const 1104
                  i32.load
                  i32.const -2
                  local.get 2
                  i32.rotl
                  i32.and
                  i32.store
                  br 5 (;@2;)
                end
                local.get 0
                local.get 3
                i32.store offset=12
                local.get 3
                local.get 0
                i32.store offset=8
                br 4 (;@2;)
              end
              local.get 5
              i32.load offset=24
              local.set 6
              local.get 3
              local.get 5
              i32.ne
              if  ;; label = @6
                local.get 5
                i32.load offset=8
                local.tee 1
                local.get 3
                i32.store offset=12
                local.get 3
                local.get 1
                i32.store offset=8
                br 3 (;@3;)
              end
              local.get 5
              i32.load offset=20
              local.tee 1
              if (result i32)  ;; label = @6
                local.get 5
                i32.const 20
                i32.add
              else
                local.get 5
                i32.load offset=16
                local.tee 1
                i32.eqz
                br_if 2 (;@4;)
                local.get 5
                i32.const 16
                i32.add
              end
              local.set 0
              loop  ;; label = @6
                local.get 0
                local.set 2
                local.get 1
                local.tee 3
                i32.const 20
                i32.add
                local.set 0
                local.get 1
                i32.load offset=20
                local.tee 1
                br_if 0 (;@6;)
                local.get 3
                i32.const 16
                i32.add
                local.set 0
                local.get 3
                i32.load offset=16
                local.tee 1
                br_if 0 (;@6;)
              end
              local.get 2
              i32.const 0
              i32.store
              br 2 (;@3;)
            end
            local.get 4
            i32.load offset=4
            local.tee 3
            i32.const 3
            i32.and
            i32.const 3
            i32.ne
            br_if 2 (;@2;)
            i32.const 1112
            local.get 7
            i32.store
            local.get 4
            local.get 3
            i32.const -2
            i32.and
            i32.store offset=4
            local.get 5
            local.get 7
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 4
            local.get 7
            i32.store
            br 3 (;@1;)
          end
          i32.const 0
          local.set 3
        end
        local.get 6
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 5
          i32.load offset=28
          local.tee 0
          i32.const 2
          i32.shl
          i32.const 1408
          i32.add
          local.tee 1
          i32.load
          local.get 5
          i32.eq
          if  ;; label = @4
            local.get 1
            local.get 3
            i32.store
            local.get 3
            br_if 1 (;@3;)
            i32.const 1108
            i32.const 1108
            i32.load
            i32.const -2
            local.get 0
            i32.rotl
            i32.and
            i32.store
            br 2 (;@2;)
          end
          local.get 6
          i32.const 16
          i32.const 20
          local.get 6
          i32.load offset=16
          local.get 5
          i32.eq
          select
          i32.add
          local.get 3
          i32.store
          local.get 3
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 3
        local.get 6
        i32.store offset=24
        local.get 5
        i32.load offset=16
        local.tee 1
        if  ;; label = @3
          local.get 3
          local.get 1
          i32.store offset=16
          local.get 1
          local.get 3
          i32.store offset=24
        end
        local.get 5
        i32.load offset=20
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.get 1
        i32.store offset=20
        local.get 1
        local.get 3
        i32.store offset=24
      end
      local.get 4
      local.get 5
      i32.le_u
      br_if 0 (;@1;)
      local.get 4
      i32.load offset=4
      local.tee 1
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.const 2
              i32.and
              i32.eqz
              if  ;; label = @6
                i32.const 1128
                i32.load
                local.get 4
                i32.eq
                if  ;; label = @7
                  i32.const 1128
                  local.get 5
                  i32.store
                  i32.const 1116
                  i32.const 1116
                  i32.load
                  local.get 7
                  i32.add
                  local.tee 7
                  i32.store
                  local.get 5
                  local.get 7
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 5
                  i32.const 1124
                  i32.load
                  i32.ne
                  br_if 6 (;@1;)
                  i32.const 1112
                  i32.const 0
                  i32.store
                  i32.const 1124
                  i32.const 0
                  i32.store
                  br 6 (;@1;)
                end
                i32.const 1124
                i32.load
                local.get 4
                i32.eq
                if  ;; label = @7
                  i32.const 1124
                  local.get 5
                  i32.store
                  i32.const 1112
                  i32.const 1112
                  i32.load
                  local.get 7
                  i32.add
                  local.tee 7
                  i32.store
                  local.get 5
                  local.get 7
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 5
                  local.get 7
                  i32.add
                  local.get 7
                  i32.store
                  br 6 (;@1;)
                end
                local.get 1
                i32.const -8
                i32.and
                local.get 7
                i32.add
                local.set 7
                local.get 4
                i32.load offset=12
                local.set 3
                local.get 1
                i32.const 255
                i32.le_u
                if  ;; label = @7
                  local.get 4
                  i32.load offset=8
                  local.set 0
                  local.get 1
                  i32.const 3
                  i32.shr_u
                  local.set 4
                  local.get 0
                  local.get 3
                  i32.eq
                  if  ;; label = @8
                    i32.const 1104
                    i32.const 1104
                    i32.load
                    i32.const -2
                    local.get 4
                    i32.rotl
                    i32.and
                    i32.store
                    br 5 (;@3;)
                  end
                  local.get 0
                  local.get 3
                  i32.store offset=12
                  local.get 3
                  local.get 0
                  i32.store offset=8
                  br 4 (;@3;)
                end
                local.get 4
                i32.load offset=24
                local.set 6
                local.get 3
                local.get 4
                i32.ne
                if  ;; label = @7
                  i32.const 1120
                  i32.load
                  drop
                  local.get 4
                  i32.load offset=8
                  local.tee 1
                  local.get 3
                  i32.store offset=12
                  local.get 3
                  local.get 1
                  i32.store offset=8
                  br 3 (;@4;)
                end
                local.get 4
                i32.load offset=20
                local.tee 1
                if (result i32)  ;; label = @7
                  local.get 4
                  i32.const 20
                  i32.add
                else
                  local.get 4
                  i32.load offset=16
                  local.tee 1
                  i32.eqz
                  br_if 2 (;@5;)
                  local.get 4
                  i32.const 16
                  i32.add
                end
                local.set 0
                loop  ;; label = @7
                  local.get 0
                  local.set 2
                  local.get 1
                  local.tee 3
                  i32.const 20
                  i32.add
                  local.set 0
                  local.get 1
                  i32.load offset=20
                  local.tee 1
                  br_if 0 (;@7;)
                  local.get 3
                  i32.const 16
                  i32.add
                  local.set 0
                  local.get 3
                  i32.load offset=16
                  local.tee 1
                  br_if 0 (;@7;)
                end
                local.get 2
                i32.const 0
                i32.store
                br 2 (;@4;)
              end
              local.get 4
              local.get 1
              i32.const -2
              i32.and
              i32.store offset=4
              local.get 5
              local.get 7
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 5
              local.get 7
              i32.add
              local.get 7
              i32.store
              br 3 (;@2;)
            end
            i32.const 0
            local.set 3
          end
          local.get 6
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 4
            i32.load offset=28
            local.tee 0
            i32.const 2
            i32.shl
            i32.const 1408
            i32.add
            local.tee 1
            i32.load
            local.get 4
            i32.eq
            if  ;; label = @5
              local.get 1
              local.get 3
              i32.store
              local.get 3
              br_if 1 (;@4;)
              i32.const 1108
              i32.const 1108
              i32.load
              i32.const -2
              local.get 0
              i32.rotl
              i32.and
              i32.store
              br 2 (;@3;)
            end
            local.get 6
            i32.const 16
            i32.const 20
            local.get 6
            i32.load offset=16
            local.get 4
            i32.eq
            select
            i32.add
            local.get 3
            i32.store
            local.get 3
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 3
          local.get 6
          i32.store offset=24
          local.get 4
          i32.load offset=16
          local.tee 1
          if  ;; label = @4
            local.get 3
            local.get 1
            i32.store offset=16
            local.get 1
            local.get 3
            i32.store offset=24
          end
          local.get 4
          i32.load offset=20
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          local.get 1
          i32.store offset=20
          local.get 1
          local.get 3
          i32.store offset=24
        end
        local.get 5
        local.get 7
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 5
        local.get 7
        i32.add
        local.get 7
        i32.store
        local.get 5
        i32.const 1124
        i32.load
        i32.ne
        br_if 0 (;@2;)
        i32.const 1112
        local.get 7
        i32.store
        br 1 (;@1;)
      end
      local.get 7
      i32.const 255
      i32.le_u
      if  ;; label = @2
        local.get 7
        i32.const -8
        i32.and
        i32.const 1144
        i32.add
        local.set 3
        block (result i32)  ;; label = @3
          i32.const 1104
          i32.load
          local.tee 1
          i32.const 1
          local.get 7
          i32.const 3
          i32.shr_u
          i32.shl
          local.tee 7
          i32.and
          i32.eqz
          if  ;; label = @4
            i32.const 1104
            local.get 1
            local.get 7
            i32.or
            i32.store
            local.get 3
            br 1 (;@3;)
          end
          local.get 3
          i32.load offset=8
        end
        local.set 7
        local.get 3
        local.get 5
        i32.store offset=8
        local.get 7
        local.get 5
        i32.store offset=12
        local.get 5
        local.get 3
        i32.store offset=12
        local.get 5
        local.get 7
        i32.store offset=8
        br 1 (;@1;)
      end
      i32.const 31
      local.set 3
      local.get 7
      i32.const 16777215
      i32.le_u
      if  ;; label = @2
        local.get 7
        i32.const 38
        local.get 7
        i32.const 8
        i32.shr_u
        i32.clz
        local.tee 3
        i32.sub
        i32.shr_u
        i32.const 1
        i32.and
        local.get 3
        i32.const 1
        i32.shl
        i32.sub
        i32.const 62
        i32.add
        local.set 3
      end
      local.get 5
      local.get 3
      i32.store offset=28
      local.get 5
      i64.const 0
      i64.store offset=16 align=4
      local.get 3
      i32.const 2
      i32.shl
      i32.const 1408
      i32.add
      local.set 4
      block (result i32)  ;; label = @2
        block  ;; label = @3
          block (result i32)  ;; label = @4
            i32.const 1108
            i32.load
            local.tee 1
            i32.const 1
            local.get 3
            i32.shl
            local.tee 0
            i32.and
            i32.eqz
            if  ;; label = @5
              i32.const 1108
              local.get 0
              local.get 1
              i32.or
              i32.store
              i32.const 24
              local.set 3
              local.get 4
              local.set 0
              i32.const 8
              br 1 (;@4;)
            end
            local.get 7
            i32.const 25
            local.get 3
            i32.const 1
            i32.shr_u
            i32.sub
            i32.const 0
            local.get 3
            i32.const 31
            i32.ne
            select
            i32.shl
            local.set 3
            local.get 4
            i32.load
            local.set 0
            loop  ;; label = @5
              local.get 0
              local.tee 1
              i32.load offset=4
              i32.const -8
              i32.and
              local.get 7
              i32.eq
              br_if 2 (;@3;)
              local.get 3
              i32.const 29
              i32.shr_u
              local.set 0
              local.get 3
              i32.const 1
              i32.shl
              local.set 3
              local.get 1
              local.get 0
              i32.const 4
              i32.and
              i32.add
              i32.const 16
              i32.add
              local.tee 4
              i32.load
              local.tee 0
              br_if 0 (;@5;)
            end
            i32.const 24
            local.set 3
            local.get 1
            local.set 0
            i32.const 8
          end
          local.set 7
          local.get 5
          local.tee 1
          br 1 (;@2;)
        end
        local.get 1
        i32.load offset=8
        local.tee 0
        local.get 5
        i32.store offset=12
        i32.const 8
        local.set 3
        local.get 1
        i32.const 8
        i32.add
        local.set 4
        i32.const 24
        local.set 7
        i32.const 0
      end
      local.set 2
      local.get 4
      local.get 5
      i32.store
      local.get 3
      local.get 5
      i32.add
      local.get 0
      i32.store
      local.get 5
      local.get 1
      i32.store offset=12
      local.get 5
      local.get 7
      i32.add
      local.get 2
      i32.store
      i32.const 1136
      i32.const 1136
      i32.load
      i32.const 1
      i32.sub
      local.tee 5
      i32.const -1
      local.get 5
      select
      i32.store
    end
    local.get 13
    i32.const 16
    i32.add
    global.set 0
    local.get 8)
  (func (;4;) (type 0) (param i32) (result i32)
    (local i32 i32)
    i32.const 1096
    i32.load
    local.tee 1
    local.get 0
    i32.const 7
    i32.add
    i32.const -8
    i32.and
    local.tee 2
    i32.add
    local.set 0
    block  ;; label = @1
      local.get 2
      i32.const 0
      local.get 0
      local.get 1
      i32.le_u
      select
      i32.eqz
      if  ;; label = @2
        local.get 0
        memory.size
        i32.const 16
        i32.shl
        i32.le_u
        br_if 1 (;@1;)
        local.get 0
        call 0
        br_if 1 (;@1;)
      end
      i32.const 1100
      i32.const 48
      i32.store
      i32.const -1
      return
    end
    i32.const 1096
    local.get 0
    i32.store
    local.get 1)
  (func (;5;) (type 3) (result i32)
    global.get 0)
  (func (;6;) (type 4) (param i32)
    local.get 0
    global.set 0)
  (func (;7;) (type 0) (param i32) (result i32)
    global.get 0
    local.get 0
    i32.sub
    i32.const -16
    i32.and
    local.tee 0
    global.set 0
    local.get 0)
  (table (;0;) 1 1 funcref)
  (global (;0;) (mut i32) (i32.const 67152))
  (export "__wasm_call_ctors" (func 2))
  (export "blur" (func 3))
  (export "__indirect_function_table" (table 0))
  (export "stackSave" (func 5))
  (export "stackRestore" (func 6))
  (export "stackAlloc" (func 7))
  (data (;0;) (i32.const 1024) "\9a\99\99\99\99\99\a9?\0a\d7\a3p=\0a\b7?\b8\1e\85\ebQ\b8\be?333333\c3?\0a\d7\a3p=\0a\c7?333333\c3?\b8\1e\85\ebQ\b8\be?\0a\d7\a3p=\0a\b7?\9a\99\99\99\99\99\a9?")
  (data (;1;) (i32.const 1096) "P\06\01"))
