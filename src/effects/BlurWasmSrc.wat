(module
  (type (;0;) (func (param i32 i32 f64)))
  (type (;1;) (func (param i32 i32 i32) (result i32)))
  (type (;2;) (func))
  (type (;3;) (func (param i32 i32 i32 i32) (result i32)))
  (import "a" "a" (memory (;0;) 1024 1024))
  (func (;0;) (type 0) (param i32 i32 f64)
    (local f64)
    local.get 0
    block (result i32)  ;; label = @1
      local.get 1
      i32.load8_u
      f64.convert_i32_u
      local.get 2
      f64.mul
      local.tee 3
      f64.const 0x1p+32 (;=4.29497e+09;)
      f64.lt
      local.get 3
      f64.const 0x0p+0 (;=0;)
      f64.ge
      i32.and
      if  ;; label = @2
        local.get 3
        i32.trunc_f64_u
        br 1 (;@1;)
      end
      i32.const 0
    end
    local.get 0
    i32.load8_u
    i32.add
    i32.store8
    local.get 0
    block (result i32)  ;; label = @1
      local.get 1
      i32.load8_u offset=1
      f64.convert_i32_u
      local.get 2
      f64.mul
      local.tee 3
      f64.const 0x1p+32 (;=4.29497e+09;)
      f64.lt
      local.get 3
      f64.const 0x0p+0 (;=0;)
      f64.ge
      i32.and
      if  ;; label = @2
        local.get 3
        i32.trunc_f64_u
        br 1 (;@1;)
      end
      i32.const 0
    end
    local.get 0
    i32.load8_u offset=1
    i32.add
    i32.store8 offset=1
    local.get 0
    block (result i32)  ;; label = @1
      local.get 1
      i32.load8_u offset=2
      f64.convert_i32_u
      local.get 2
      f64.mul
      local.tee 3
      f64.const 0x1p+32 (;=4.29497e+09;)
      f64.lt
      local.get 3
      f64.const 0x0p+0 (;=0;)
      f64.ge
      i32.and
      if  ;; label = @2
        local.get 3
        i32.trunc_f64_u
        br 1 (;@1;)
      end
      i32.const 0
    end
    local.get 0
    i32.load8_u offset=2
    i32.add
    i32.store8 offset=2
    local.get 0
    block (result i32)  ;; label = @1
      local.get 1
      i32.load8_u offset=3
      f64.convert_i32_u
      local.get 2
      f64.mul
      local.tee 2
      f64.const 0x1p+32 (;=4.29497e+09;)
      f64.lt
      local.get 2
      f64.const 0x0p+0 (;=0;)
      f64.ge
      i32.and
      if  ;; label = @2
        local.get 2
        i32.trunc_f64_u
        br 1 (;@1;)
      end
      i32.const 0
    end
    local.get 0
    i32.load8_u offset=3
    i32.add
    i32.store8 offset=3)
  (func (;1;) (type 1) (param i32 i32 i32) (result i32)
    (local i32)
    local.get 0
    i32.load
    local.set 3
    block  ;; label = @1
      local.get 1
      i32.const 0
      i32.lt_s
      if  ;; label = @2
        i32.const 0
        local.get 1
        i32.sub
        local.set 1
        br 1 (;@1;)
      end
      local.get 1
      local.get 3
      i32.lt_s
      br_if 0 (;@1;)
      local.get 3
      i32.const 1
      i32.shl
      local.get 1
      i32.sub
      i32.const 2
      i32.sub
      local.set 1
    end
    block  ;; label = @1
      local.get 2
      i32.const 0
      i32.lt_s
      if  ;; label = @2
        i32.const 0
        local.get 2
        i32.sub
        local.set 2
        br 1 (;@1;)
      end
      local.get 0
      i32.load offset=4
      local.tee 0
      local.get 2
      i32.gt_s
      br_if 0 (;@1;)
      local.get 0
      i32.const 1
      i32.shl
      local.get 2
      i32.sub
      i32.const 2
      i32.sub
      local.set 2
    end
    local.get 2
    local.get 3
    i32.mul
    local.get 1
    local.get 3
    i32.rem_s
    i32.add
    i32.const 2
    i32.shl)
  (func (;2;) (type 2))
  (func (;3;) (type 3) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 6
    global.set 0
    local.get 6
    local.get 3
    i32.store offset=12
    local.get 6
    local.get 2
    i32.store offset=8
    local.get 6
    local.get 1
    i32.store offset=4
    local.get 6
    local.get 0
    i32.store
    global.get 0
    i32.const 96
    i32.sub
    local.tee 4
    global.set 0
    local.get 6
    i32.load offset=12
    local.set 5
    local.get 6
    i32.load offset=8
    local.set 0
    local.get 4
    i64.const 4587366580439587226
    i64.store offset=80
    local.get 4
    i64.const 4591149604126578442
    i64.store offset=72
    local.get 4
    i64.const 4593311331947716280
    i64.store offset=64
    local.get 4
    i64.const 4594572339843380019
    i64.store offset=56
    local.get 4
    i64.const 4595653203753948938
    i64.store offset=48
    local.get 4
    i64.const 4594572339843380019
    i64.store offset=40
    local.get 4
    i64.const 4593311331947716280
    i64.store offset=32
    local.get 4
    i64.const 4591149604126578442
    i64.store offset=24
    local.get 4
    i64.const 4587366580439587226
    i64.store offset=16
    block  ;; label = @1
      local.get 5
      i32.const 0
      i32.le_s
      br_if 0 (;@1;)
      local.get 0
      local.get 5
      i32.add
      local.tee 8
      local.get 5
      i32.add
      local.set 2
      loop  ;; label = @2
        local.get 6
        i32.load
        local.set 3
        local.get 4
        i32.const 0
        i32.store offset=12
        local.get 7
        i32.const 2
        i32.shr_u
        local.tee 0
        local.get 3
        local.get 0
        local.get 3
        i32.div_s
        local.tee 1
        i32.mul
        i32.sub
        i32.const 4
        i32.sub
        local.set 0
        i32.const 0
        local.set 5
        loop  ;; label = @3
          local.get 4
          local.get 6
          i32.load offset=8
          local.get 6
          local.get 0
          local.get 5
          i32.add
          local.get 1
          call 1
          i32.add
          local.tee 3
          i32.load8_u
          i32.store8 offset=8
          local.get 4
          local.get 3
          i32.load8_u offset=1
          i32.store8 offset=9
          local.get 4
          local.get 3
          i32.load8_u offset=2
          i32.store8 offset=10
          local.get 4
          local.get 3
          i32.load8_u offset=3
          i32.store8 offset=11
          local.get 4
          i32.const 12
          i32.add
          local.get 4
          i32.const 8
          i32.add
          local.get 4
          i32.const 16
          i32.add
          local.get 5
          i32.const 3
          i32.shl
          i32.add
          f64.load
          call 0
          local.get 5
          i32.const 1
          i32.add
          local.tee 5
          i32.const 9
          i32.ne
          br_if 0 (;@3;)
        end
        local.get 7
        local.get 8
        i32.add
        local.tee 1
        local.get 4
        i32.load8_u offset=12
        i32.store8
        local.get 1
        local.get 4
        i32.load8_u offset=13
        i32.store8 offset=1
        local.get 4
        i32.load8_u offset=14
        local.set 0
        local.get 1
        i32.const 255
        i32.store8 offset=3
        local.get 1
        local.get 0
        i32.store8 offset=2
        local.get 7
        i32.const 4
        i32.add
        local.tee 7
        local.get 6
        i32.load offset=12
        local.tee 5
        i32.lt_s
        br_if 0 (;@2;)
      end
      local.get 5
      i32.const 0
      i32.le_s
      br_if 0 (;@1;)
      i32.const 0
      local.set 7
      loop  ;; label = @2
        local.get 6
        i32.load
        local.set 1
        local.get 4
        i32.const 0
        i32.store offset=12
        local.get 7
        i32.const 2
        i32.shr_u
        local.tee 0
        local.get 1
        local.get 0
        local.get 1
        i32.div_s
        local.tee 0
        i32.mul
        i32.sub
        local.set 1
        local.get 0
        i32.const 4
        i32.sub
        local.set 0
        i32.const 0
        local.set 5
        loop  ;; label = @3
          local.get 4
          local.get 6
          local.get 1
          local.get 0
          local.get 5
          i32.add
          call 1
          local.get 8
          i32.add
          local.tee 3
          i32.load8_u
          i32.store8 offset=8
          local.get 4
          local.get 3
          i32.load8_u offset=1
          i32.store8 offset=9
          local.get 4
          local.get 3
          i32.load8_u offset=2
          i32.store8 offset=10
          local.get 4
          local.get 3
          i32.load8_u offset=3
          i32.store8 offset=11
          local.get 4
          i32.const 12
          i32.add
          local.get 4
          i32.const 8
          i32.add
          local.get 4
          i32.const 16
          i32.add
          local.get 5
          i32.const 3
          i32.shl
          i32.add
          f64.load
          call 0
          local.get 5
          i32.const 1
          i32.add
          local.tee 5
          i32.const 9
          i32.ne
          br_if 0 (;@3;)
        end
        local.get 2
        local.get 7
        i32.add
        local.tee 1
        local.get 4
        i32.load8_u offset=12
        i32.store8
        local.get 1
        local.get 4
        i32.load8_u offset=13
        i32.store8 offset=1
        local.get 4
        i32.load8_u offset=14
        local.set 0
        local.get 1
        i32.const 255
        i32.store8 offset=3
        local.get 1
        local.get 0
        i32.store8 offset=2
        local.get 7
        i32.const 4
        i32.add
        local.tee 7
        local.get 6
        i32.load offset=12
        local.tee 5
        i32.lt_s
        br_if 0 (;@2;)
      end
    end
    local.get 4
    i32.const 96
    i32.add
    global.set 0
    local.get 6
    i32.const 16
    i32.add
    global.set 0
    local.get 5)
  (table (;0;) 1 1 funcref)
  (global (;0;) (mut i32) (i32.const 66560))
  (export "b" (func 2))
  (export "c" (func 3))
  (export "d" (table 0)))
