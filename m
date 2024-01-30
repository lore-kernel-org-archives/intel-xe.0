Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7C5C46CD2
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 13:30:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876441130B4;
	Tue, 30 Jan 2024 13:30:15 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C5C31130B4;
 Tue, 30 Jan 2024 13:30:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_drm/xe=3A_Use_function_to_emit?=
 =?utf-8?q?_PIPE=5FCONTROL_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Tue, 30 Jan 2024 13:30:14 -0000
Message-ID: <170662141437.824492.5881624820122482921@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240130132249.8615-1-jose.souza@intel.com>
In-Reply-To: <20240130132249.8615-1-jose.souza@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Use function to emit PIPE_CONTROL (rev2)
URL   : https://patchwork.freedesktop.org/series/129281/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[13:29:22] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:29:26] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
../arch/x86/um/user-offsets.c:17:6: warning: no previous prototype for ‘foo’ [-Wmissing-prototypes]
   17 | void foo(void)
      |      ^~~
In file included from ../arch/um/kernel/asm-offsets.c:1:
../arch/x86/um/shared/sysdep/kernel-offsets.h:9:6: warning: no previous prototype for ‘foo’ [-Wmissing-prototypes]
    9 | void foo(void)
      |      ^~~
../arch/x86/um/bugs_64.c:9:6: warning: no previous prototype for ‘arch_check_bugs’ [-Wmissing-prototypes]
    9 | void arch_check_bugs(void)
      |      ^~~~~~~~~~~~~~~
../arch/x86/um/bugs_64.c:13:6: warning: no previous prototype for ‘arch_examine_signal’ [-Wmissing-prototypes]
   13 | void arch_examine_signal(int sig, struct uml_pt_regs *regs)
      |      ^~~~~~~~~~~~~~~~~~~
../arch/x86/um/fault.c:18:5: warning: no previous prototype for ‘arch_fixup’ [-Wmissing-prototypes]
   18 | int arch_fixup(unsigned long address, struct uml_pt_regs *regs)
      |     ^~~~~~~~~~
../arch/x86/um/os-Linux/registers.c:146:15: warning: no previous prototype for ‘get_thread_reg’ [-Wmissing-prototypes]
  146 | unsigned long get_thread_reg(int reg, jmp_buf *buf)
      |               ^~~~~~~~~~~~~~
../arch/x86/um/vdso/um_vdso.c:16:5: warning: no previous prototype for ‘__vdso_clock_gettime’ [-Wmissing-prototypes]
   16 | int __vdso_clock_gettime(clockid_t clock, struct __kernel_old_timespec *ts)
      |     ^~~~~~~~~~~~~~~~~~~~
../arch/x86/um/vdso/um_vdso.c:30:5: warning: no previous prototype for ‘__vdso_gettimeofday’ [-Wmissing-prototypes]
   30 | int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
      |     ^~~~~~~~~~~~~~~~~~~
../arch/x86/um/vdso/um_vdso.c:44:21: warning: no previous prototype for ‘__vdso_time’ [-Wmissing-prototypes]
   44 | __kernel_old_time_t __vdso_time(__kernel_old_time_t *t)
      |                     ^~~~~~~~~~~
../arch/x86/um/vdso/um_vdso.c:57:1: warning: no previous prototype for ‘__vdso_getcpu’ [-Wmissing-prototypes]
   57 | __vdso_getcpu(unsigned *cpu, unsigned *node, struct getcpu_cache *unused)
      | ^~~~~~~~~~~~~
../arch/x86/um/os-Linux/mcontext.c:7:6: warning: no previous prototype for ‘get_regs_from_mc’ [-Wmissing-prototypes]
    7 | void get_regs_from_mc(struct uml_pt_regs *regs, mcontext_t *mc)
      |      ^~~~~~~~~~~~~~~~
../arch/um/os-Linux/skas/process.c:107:6: warning: no previous prototype for ‘wait_stub_done’ [-Wmissing-prototypes]
  107 | void wait_stub_done(int pid)
      |      ^~~~~~~~~~~~~~
../arch/um/os-Linux/skas/process.c:683:6: warning: no previous prototype for ‘__switch_mm’ [-Wmissing-prototypes]
  683 | void __switch_mm(struct mm_id *mm_idp)
      |      ^~~~~~~~~~~
../arch/um/kernel/skas/mmu.c:17:5: warning: no previous prototype for ‘init_new_context’ [-Wmissing-prototypes]
   17 | int init_new_context(struct task_struct *task, struct mm_struct *mm)
      |     ^~~~~~~~~~~~~~~~
../arch/um/kernel/skas/mmu.c:60:6: warning: no previous prototype for ‘destroy_context’ [-Wmissing-prototypes]
   60 | void destroy_context(struct mm_struct *mm)
      |      ^~~~~~~~~~~~~~~
../arch/um/kernel/skas/process.c:36:12: warning: no previous prototype for ‘start_uml’ [-Wmissing-prototypes]
   36 | int __init start_uml(void)
      |            ^~~~~~~~~
../arch/um/os-Linux/main.c:187:7: warning: no previous prototype for ‘__wrap_malloc’ [-Wmissing-prototypes]
  187 | void *__wrap_malloc(int size)
      |       ^~~~~~~~~~~~~
../arch/um/os-Linux/main.c:208:7: warning: no previous prototype for ‘__wrap_calloc’ [-Wmissing-prototypes]
  208 | void *__wrap_calloc(int n, int size)
      |       ^~~~~~~~~~~~~
../arch/um/os-Linux/main.c:222:6: warning: no previous prototype for ‘__wrap_free’ [-Wmissing-prototypes]
  222 | void __wrap_free(void *ptr)
      |      ^~~~~~~~~~~
../arch/um/os-Linux/mem.c:28:6: warning: no previous prototype for ‘kasan_map_memory’ [-Wmissing-prototypes]
   28 | void kasan_map_memory(void *start, size_t len)
      |      ^~~~~~~~~~~~~~~~
../arch/um/os-Linux/mem.c:212:13: warning: no previous prototype for ‘check_tmpexec’ [-Wmissing-prototypes]
  212 | void __init check_tmpexec(void)
      |             ^~~~~~~~~~~~~
../arch/x86/um/ptrace_64.c:111:5: warning: no previous prototype for ‘poke_user’ [-Wmissing-prototypes]
  111 | int poke_user(struct task_struct *child, long addr, long data)
      |     ^~~~~~~~~
../arch/x86/um/ptrace_64.c:171:5: warning: no previous prototype for ‘peek_user’ [-Wmissing-prototypes]
  171 | int peek_user(struct task_struct *child, long addr, long data)
      |     ^~~~~~~~~
../arch/um/os-Linux/signal.c:75:6: warning: no previous prototype for ‘sig_handler’ [-Wmissing-prototypes]
   75 | void sig_handler(int sig, struct siginfo *si, mcontext_t *mc)
      |      ^~~~~~~~~~~
../arch/um/os-Linux/signal.c:111:6: warning: no previous prototype for ‘timer_alarm_handler’ [-Wmissing-prototypes]
  111 | void timer_alarm_handler(int sig, struct siginfo *unused_si, mcontext_t *mc)
      |      ^~~~~~~~~~~~~~~~~~~
../arch/um/os-Linux/start_up.c:301:12: warning: no previous prototype for ‘parse_iomem’ [-Wmissing-prototypes]
  301 | int __init parse_iomem(char *str, int *add)
      |            ^~~~~~~~~~~
../arch/x86/um/signal.c:560:6: warning: no previous prototype for ‘sys_rt_sigreturn’ [-Wmissing-prototypes]
  560 | long sys_rt_sigreturn(void)
      |      ^~~~~~~~~~~~~~~~
../arch/um/kernel/mem.c:202:8: warning: no previous prototype for ‘pgd_alloc’ [-Wmissing-prototypes]
  202 | pgd_t *pgd_alloc(struct mm_struct *mm)
      |        ^~~~~~~~~
../arch/um/kernel/mem.c:215:7: warning: no previous prototype for ‘uml_kmalloc’ [-Wmissing-prototypes]
  215 | void *uml_kmalloc(int size, int flags)
      |       ^~~~~~~~~~~
../arch/x86/um/syscalls_64.c:48:6: warning: no previous prototype for ‘arch_switch_to’ [-Wmissing-prototypes]
   48 | void arch_switch_to(struct task_struct *to)
      |      ^~~~~~~~~~~~~~
../arch/um/kernel/process.c:51:5: warning: no previous prototype for ‘pid_to_processor_id’ [-Wmissing-prototypes]
   51 | int pid_to_processor_id(int pid)
      |     ^~~~~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:87:7: warning: no previous prototype for ‘__switch_to’ [-Wmissing-prototypes]
   87 | void *__switch_to(struct task_struct *from, struct task_struct *to)
      |       ^~~~~~~~~~~
../arch/um/kernel/process.c:140:6: warning: no previous prototype for ‘fork_handler’ [-Wmissing-prototypes]
  140 | void fork_handler(void)
      |      ^~~~~~~~~~~~
../arch/um/kernel/process.c:217:6: warning: no previous prototype for ‘arch_cpu_idle’ [-Wmissing-prototypes]
  217 | void arch_cpu_idle(void)
      |      ^~~~~~~~~~~~~
../arch/um/kernel/process.c:253:5: warning: no previous prototype for ‘copy_to_user_proc’ [-Wmissing-prototypes]
  253 | int copy_to_user_proc(void __user *to, void *from, int size)
      |     ^~~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:263:5: warning: no previous prototype for ‘clear_user_proc’ [-Wmissing-prototypes]
  263 | int clear_user_proc(void __user *buf, int size)
      |     ^~~~~~~~~~~~~~~
../arch/um/kernel/process.c:271:6: warning: no previous prototype for ‘set_using_sysemu’ [-Wmissing-prototypes]
  271 | void set_using_sysemu(int value)
      |      ^~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:278:5: warning: no previous prototype for ‘get_using_sysemu’ [-Wmissing-prototypes]
  278 | int get_using_sysemu(void)
      |     ^~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:316:12: warning: no previous prototype for ‘make_proc_sysemu’ [-Wmissing-prototypes]
  316 | int __init make_proc_sysemu(void)
      |            ^~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:348:15: warning: no previous prototype for ‘arch_align_stack’ [-Wmissing-prototypes]
  348 | unsigned long arch_align_stack(unsigned long sp)
      |               ^~~~~~~~~~~~~~~~
../arch/um/kernel/reboot.c:45:6: warning: no previous prototype for ‘machine_restart’ [-Wmissing-prototypes]
   45 | void machine_restart(char * __unused)
      |      ^~~~~~~~~~~~~~~
../arch/um/kernel/reboot.c:51:6: warning: no previous prototype for ‘machine_power_off’ [-Wmissing-prototypes]
   51 | void machine_power_off(void)
      |      ^~~~~~~~~~~~~~~~~
../arch/um/kernel/reboot.c:57:6: warning: no previous prototype for ‘machine_halt’ [-Wmissing-prototypes]
   57 | void machine_halt(void)
      |      ^~~~~~~~~~~~
../arch/um/kernel/tlb.c:579:6: warning: no previous prototype for ‘flush_tlb_mm_range’ [-Wmissing-prototypes]
  579 | void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
      |      ^~~~~~~~~~~~~~~~~~
../arch/um/kernel/tlb.c:594:6: warning: no previous prototype for ‘force_flush_all’ [-Wmissing-prototypes]
  594 | void force_flush_all(void)
      |      ^~~~~~~~~~~~~~~
../arch/um/kernel/um_arch.c:408:19: warning: no previous prototype for ‘read_initrd’ [-Wmissing-prototypes]
  408 | int __init __weak read_initrd(void)
      |                   ^~~~~~~~~~~
../arch/um/kernel/um_arch.c:461:7: warning: no previous prototype for ‘text_poke’ [-Wmissing-prototypes]
  461 | void *text_poke(void *addr, const void *opcode, size_t len)
      |       ^~~~~~~~~
../arch/um/kernel/um_arch.c:473:6: warning: no previous prototype for ‘text_poke_sync’ [-Wmissing-prototypes]
  473 | void text_poke_sync(void)
      |      ^~~~~~~~~~~~~~
../arch/um/kernel/kmsg_dump.c:60:12: warning: no previous prototype for ‘kmsg_dumper_stdout_init’ [-Wmissing-prototypes]
   60 | int __init kmsg_dumper_stdout_init(void)
      |            ^~~~~~~~~~~~~~~~~~~~~~~
../lib/iomap.c:156:5: warning: no previous prototype for ‘ioread64_lo_hi’ [-Wmissing-prototypes]
  156 | u64 ioread64_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:163:5: warning: no previous prototype for ‘ioread64_hi_lo’ [-Wmissing-prototypes]
  163 | u64 ioread64_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:170:5: warning: no previous prototype for ‘ioread64be_lo_hi’ [-Wmissing-prototypes]
  170 | u64 ioread64be_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:178:5: warning: no previous prototype for ‘ioread64be_hi_lo’ [-Wmissing-prototypes]
  178 | u64 ioread64be_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:264:6: warning: no previous prototype for ‘iowrite64_lo_hi’ [-Wmissing-prototypes]
  264 | void iowrite64_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:272:6: warning: no previous prototype for ‘iowrite64_hi_lo’ [-Wmissing-prototypes]
  272 | void iowrite64_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:280:6: warning: no previous prototype for ‘iowrite64be_lo_hi’ [-Wmissing-prototypes]
  280 | void iowrite64be_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~
../lib/iomap.c:288:6: warning: no previous prototype for ‘iowrite64be_hi_lo’ [-Wmissing-prototypes]
  288 | void iowrite64be_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~
stty: 'standard input': Inappropriate ioctl for device

[13:29:49] Starting KUnit Kernel (1/1)...
[13:29:49] ============================================================
[13:29:49] =================== guc_dbm (7 subtests) ===================
[13:29:49] [PASSED] test_empty
[13:29:49] [PASSED] test_default
[13:29:49] ======================== test_size  ========================
[13:29:49] [PASSED] 4
[13:29:49] [PASSED] 8
[13:29:49] [PASSED] 32
[13:29:49] [PASSED] 256
[13:29:49] ==================== [PASSED] test_size ====================
[13:29:49] ======================= test_reuse  ========================
[13:29:49] [PASSED] 4
[13:29:49] [PASSED] 8
[13:29:49] [PASSED] 32
[13:29:49] [PASSED] 256
[13:29:49] =================== [PASSED] test_reuse ====================
[13:29:49] =================== test_range_overlap  ====================
[13:29:49] [PASSED] 4
[13:29:49] [PASSED] 8
[13:29:49] [PASSED] 32
[13:29:49] [PASSED] 256
[13:29:49] =============== [PASSED] test_range_overlap ================
[13:29:49] =================== test_range_compact  ====================
[13:29:49] [PASSED] 4
[13:29:49] [PASSED] 8
[13:29:49] [PASSED] 32
[13:29:49] [PASSED] 256
[13:29:49] =============== [PASSED] test_range_compact ================
[13:29:49] ==================== test_range_spare  =====================
[13:29:49] [PASSED] 4
[13:29:49] [PASSED] 8
[13:29:49] [PASSED] 32
[13:29:49] [PASSED] 256
[13:29:49] ================ [PASSED] test_range_spare =================
[13:29:49] ===================== [PASSED] guc_dbm =====================
[13:29:49] ================== no_relay (3 subtests) ===================
[13:29:49] [PASSED] xe_drops_guc2pf_if_not_ready
[13:29:49] [PASSED] xe_drops_guc2vf_if_not_ready
[13:29:49] [PASSED] xe_rejects_send_if_not_ready
[13:29:49] ==================== [PASSED] no_relay =====================
[13:29:49] ================== pf_relay (14 subtests) ==================
[13:29:49] [PASSED] pf_rejects_guc2pf_too_short
[13:29:49] [PASSED] pf_rejects_guc2pf_too_long
[13:29:49] [PASSED] pf_rejects_guc2pf_no_payload
[13:29:49] [PASSED] pf_fails_no_payload
[13:29:49] [PASSED] pf_fails_bad_origin
[13:29:49] [PASSED] pf_fails_bad_type
[13:29:49] [PASSED] pf_txn_reports_error
[13:29:49] [PASSED] pf_txn_sends_pf2guc
[13:29:49] [PASSED] pf_sends_pf2guc
[13:29:49] [SKIPPED] pf_loopback_nop
[13:29:49] [SKIPPED] pf_loopback_echo
[13:29:49] [SKIPPED] pf_loopback_fail
[13:29:49] [SKIPPED] pf_loopback_busy
[13:29:49] [SKIPPED] pf_loopback_retry
[13:29:49] ==================== [PASSED] pf_relay =====================
[13:29:49] ================== vf_relay (3 subtests) ===================
[13:29:49] [PASSED] vf_rejects_guc2vf_too_short
[13:29:49] [PASSED] vf_rejects_guc2vf_too_long
[13:29:49] [PASSED] vf_rejects_guc2vf_no_payload
[13:29:49] ==================== [PASSED] vf_relay =====================
[13:29:49] ===================== lmtt (1 subtest) =====================
[13:29:49] ======================== test_ops  =========================
[13:29:49] [PASSED] 2-level
[13:29:49] [PASSED] multi-level
[13:29:49] ==================== [PASSED] test_ops =====================
[13:29:49] ====================== [PASSED] lmtt =======================
[13:29:49] ==================== xe_bo (2 subtests) ====================
[13:29:49] [SKIPPED] xe_ccs_migrate_kunit
[13:29:49] [SKIPPED] xe_bo_evict_kunit
[13:29:49] ===================== [SKIPPED] xe_bo ======================
[13:29:49] ================== xe_dma_buf (1 subtest) ==================
[13:29:49] [SKIPPED] xe_dma_buf_kunit
[13:29:49] =================== [SKIPPED] xe_dma_buf ===================
[13:29:49] ================== xe_migrate (1 subtest) ==================
[13:29:49] [SKIPPED] xe_migrate_sanity_kunit
[13:29:49] =================== [SKIPPED] xe_migrate ===================
[13:29:49] =================== xe_mocs (2 subtests) ===================
[13:29:49] [SKIPPED] xe_live_mocs_kernel_kunit
[13:29:49] [SKIPPED] xe_live_mocs_reset_kunit
[13:29:49] ==================== [SKIPPED] xe_mocs =====================
[13:29:49] =================== xe_pci (2 subtests) ====================
[13:29:49] [PASSED] xe_gmdid_graphics_ip
[13:29:49] [PASSED] xe_gmdid_media_ip
[13:29:49] ===================== [PASSED] xe_pci ======================
[13:29:49] ==================== xe_rtp (1 subtest) ====================
[13:29:49] ================== xe_rtp_process_tests  ===================
[13:29:49] [PASSED] coalesce-same-reg
[13:29:49] [PASSED] no-match-no-add
[13:29:49] [PASSED] no-match-no-add-multiple-rules
[13:29:49] [PASSED] two-regs-two-entries
[13:29:49] [PASSED] clr-one-set-other
[13:29:49] [PASSED] set-field
[13:29:49] [PASSED] conflict-duplicate
[13:29:49] [PASSED] conflict-not-disjoint
[13:29:49] [PASSED] conflict-reg-type
[13:29:49] ============== [PASSED] xe_rtp_process_tests ===============
[13:29:49] ===================== [PASSED] xe_rtp ======================
[13:29:49] ==================== xe_wa (1 subtest) =====================
[13:29:49] ======================== xe_wa_gt  =========================
[13:29:49] [PASSED] TIGERLAKE (B0)
[13:29:49] [PASSED] DG1 (A0)
[13:29:49] [PASSED] DG1 (B0)
[13:29:49] [PASSED] ALDERLAKE_S (A0)
[13:29:49] [PASSED] ALDERLAKE_S (B0)
[13:29:49] [PASSED] ALDERLAKE_S (C0)
[13:29:49] [PASSED] ALDERLAKE_S (D0)
[13:29:49] [PASSED] ALDERLAKE_P (A0)
[13:29:49] [PASSED] ALDERLAKE_P (B0)
[13:29:49] [PASSED] ALDERLAKE_P (C0)
[13:29:49] [PASSED] ALDERLAKE_S_RPLS (D0)
[13:29:49] [PASSED] ALDERLAKE_P_RPLU (E0)
[13:29:49] [PASSED] DG2_G10 (C0)
[13:29:49] [PASSED] DG2_G11 (B1)
[13:29:49] [PASSED] DG2_G12 (A1)
[13:29:49] [PASSED] METEORLAKE (g:A0, m:A0)
[13:29:49] [PASSED] METEORLAKE (g:A0, m:A0)
[13:29:49] [PASSED] LUNARLAKE (g:A0, m:A0)
[13:29:49] [PASSED] LUNARLAKE (g:B0, m:A0)
[13:29:49] ==================== [PASSED] xe_wa_gt =====================
[13:29:49] ====================== [PASSED] xe_wa ======================
[13:29:49] ============================================================
[13:29:49] Testing complete. Ran 80 tests: passed: 69, skipped: 11
[13:29:49] Elapsed time: 27.407s total, 4.176s configuring, 23.011s building, 0.182s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[13:29:49] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[13:29:51] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=48
In file included from ../arch/um/kernel/asm-offsets.c:1:
../arch/x86/um/shared/sysdep/kernel-offsets.h:9:6: warning: no previous prototype for ‘foo’ [-Wmissing-prototypes]
    9 | void foo(void)
      |      ^~~
../arch/x86/um/ptrace_64.c:111:5: warning: no previous prototype for ‘poke_user’ [-Wmissing-prototypes]
  111 | int poke_user(struct task_struct *child, long addr, long data)
      |     ^~~~~~~~~
../arch/x86/um/ptrace_64.c:171:5: warning: no previous prototype for ‘peek_user’ [-Wmissing-prototypes]
  171 | int peek_user(struct task_struct *child, long addr, long data)
      |     ^~~~~~~~~
../arch/um/kernel/mem.c:202:8: warning: no previous prototype for ‘pgd_alloc’ [-Wmissing-prototypes]
  202 | pgd_t *pgd_alloc(struct mm_struct *mm)
      |        ^~~~~~~~~
../arch/um/kernel/mem.c:215:7: warning: no previous prototype for ‘uml_kmalloc’ [-Wmissing-prototypes]
  215 | void *uml_kmalloc(int size, int flags)
      |       ^~~~~~~~~~~
../arch/x86/um/signal.c:560:6: warning: no previous prototype for ‘sys_rt_sigreturn’ [-Wmissing-prototypes]
  560 | long sys_rt_sigreturn(void)
      |      ^~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:51:5: warning: no previous prototype for ‘pid_to_processor_id’ [-Wmissing-prototypes]
   51 | int pid_to_processor_id(int pid)
      |     ^~~~~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:87:7: warning: no previous prototype for ‘__switch_to’ [-Wmissing-prototypes]
   87 | void *__switch_to(struct task_struct *from, struct task_struct *to)
      |       ^~~~~~~~~~~
../arch/um/kernel/process.c:140:6: warning: no previous prototype for ‘fork_handler’ [-Wmissing-prototypes]
  140 | void fork_handler(void)
      |      ^~~~~~~~~~~~
../arch/um/kernel/process.c:217:6: warning: no previous prototype for ‘arch_cpu_idle’ [-Wmissing-prototypes]
  217 | void arch_cpu_idle(void)
      |      ^~~~~~~~~~~~~
../arch/um/kernel/process.c:253:5: warning: no previous prototype for ‘copy_to_user_proc’ [-Wmissing-prototypes]
  253 | int copy_to_user_proc(void __user *to, void *from, int size)
      |     ^~~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:263:5: warning: no previous prototype for ‘clear_user_proc’ [-Wmissing-prototypes]
  263 | int clear_user_proc(void __user *buf, int size)
      |     ^~~~~~~~~~~~~~~
../arch/um/kernel/process.c:271:6: warning: no previous prototype for ‘set_using_sysemu’ [-Wmissing-prototypes]
  271 | void set_using_sysemu(int value)
      |      ^~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:278:5: warning: no previous prototype for ‘get_using_sysemu’ [-Wmissing-prototypes]
  278 | int get_using_sysemu(void)
      |     ^~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:316:12: warning: no previous prototype for ‘make_proc_sysemu’ [-Wmissing-prototypes]
  316 | int __init make_proc_sysemu(void)
      |            ^~~~~~~~~~~~~~~~
../arch/um/kernel/process.c:348:15: warning: no previous prototype for ‘arch_align_stack’ [-Wmissing-prototypes]
  348 | unsigned long arch_align_stack(unsigned long sp)
      |               ^~~~~~~~~~~~~~~~
../arch/um/kernel/reboot.c:45:6: warning: no previous prototype for ‘machine_restart’ [-Wmissing-prototypes]
   45 | void machine_restart(char * __unused)
      |      ^~~~~~~~~~~~~~~
../arch/um/kernel/reboot.c:51:6: warning: no previous prototype for ‘machine_power_off’ [-Wmissing-prototypes]
   51 | void machine_power_off(void)
      |      ^~~~~~~~~~~~~~~~~
../arch/um/kernel/reboot.c:57:6: warning: no previous prototype for ‘machine_halt’ [-Wmissing-prototypes]
   57 | void machine_halt(void)
      |      ^~~~~~~~~~~~
../arch/x86/um/syscalls_64.c:48:6: warning: no previous prototype for ‘arch_switch_to’ [-Wmissing-prototypes]
   48 | void arch_switch_to(struct task_struct *to)
      |      ^~~~~~~~~~~~~~
../arch/um/kernel/tlb.c:579:6: warning: no previous prototype for ‘flush_tlb_mm_range’ [-Wmissing-prototypes]
  579 | void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
      |      ^~~~~~~~~~~~~~~~~~
../arch/um/kernel/tlb.c:594:6: warning: no previous prototype for ‘force_flush_all’ [-Wmissing-prototypes]
  594 | void force_flush_all(void)
      |      ^~~~~~~~~~~~~~~
../arch/um/kernel/um_arch.c:408:19: warning: no previous prototype for ‘read_initrd’ [-Wmissing-prototypes]
  408 | int __init __weak read_initrd(void)
      |                   ^~~~~~~~~~~
../arch/um/kernel/um_arch.c:461:7: warning: no previous prototype for ‘text_poke’ [-Wmissing-prototypes]
  461 | void *text_poke(void *addr, const void *opcode, size_t len)
      |       ^~~~~~~~~
../arch/um/kernel/um_arch.c:473:6: warning: no previous prototype for ‘text_poke_sync’ [-Wmissing-prototypes]
  473 | void text_poke_sync(void)
      |      ^~~~~~~~~~~~~~
../arch/um/kernel/kmsg_dump.c:60:12: warning: no previous prototype for ‘kmsg_dumper_stdout_init’ [-Wmissing-prototypes]
   60 | int __init kmsg_dumper_stdout_init(void)
      |            ^~~~~~~~~~~~~~~~~~~~~~~
../arch/um/kernel/skas/process.c:36:12: warning: no previous prototype for ‘start_uml’ [-Wmissing-prototypes]
   36 | int __init start_uml(void)
      |            ^~~~~~~~~
../arch/um/kernel/skas/mmu.c:17:5: warning: no previous prototype for ‘init_new_context’ [-Wmissing-prototypes]
   17 | int init_new_context(struct task_struct *task, struct mm_struct *mm)
      |     ^~~~~~~~~~~~~~~~
../arch/um/kernel/skas/mmu.c:60:6: warning: no previous prototype for ‘destroy_context’ [-Wmissing-prototypes]
   60 | void destroy_context(struct mm_struct *mm)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:156:5: warning: no previous prototype for ‘ioread64_lo_hi’ [-Wmissing-prototypes]
  156 | u64 ioread64_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:163:5: warning: no previous prototype for ‘ioread64_hi_lo’ [-Wmissing-prototypes]
  163 | u64 ioread64_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~
../lib/iomap.c:170:5: warning: no previous prototype for ‘ioread64be_lo_hi’ [-Wmissing-prototypes]
  170 | u64 ioread64be_lo_hi(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:178:5: warning: no previous prototype for ‘ioread64be_hi_lo’ [-Wmissing-prototypes]
  178 | u64 ioread64be_hi_lo(const void __iomem *addr)
      |     ^~~~~~~~~~~~~~~~
../lib/iomap.c:264:6: warning: no previous prototype for ‘iowrite64_lo_hi’ [-Wmissing-prototypes]
  264 | void iowrite64_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:272:6: warning: no previous prototype for ‘iowrite64_hi_lo’ [-Wmissing-prototypes]
  272 | void iowrite64_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~
../lib/iomap.c:280:6: warning: no previous prototype for ‘iowrite64be_lo_hi’ [-Wmissing-prototypes]
  280 | void iowrite64be_lo_hi(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~
../lib/iomap.c:288:6: warning: no previous prototype for ‘iowrite64be_hi_lo’ [-Wmissing-prototypes]
  288 | void iowrite64be_hi_lo(u64 val, void __iomem *addr)
      |      ^~~~~~~~~~~~~~~~~

[13:30:11] Starting KUnit Kernel (1/1)...
[13:30:11] ============================================================
[13:30:11] ============ drm_test_pick_cmdline (2 subtests) ============
[13:30:11] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[13:30:11] =============== drm_test_pick_cmdline_named  ===============
[13:30:11] [PASSED] NTSC
[13:30:11] [PASSED] NTSC-J
[13:30:11] [PASSED] PAL
[13:30:11] [PASSED] PAL-M
[13:30:11] =========== [PASSED] drm_test_pick_cmdline_named ===========
[13:30:11] ============== [PASSED] drm_test_pick_cmdline ==============
[13:30:11] ================== drm_buddy (4 subtests) ==================
[13:30:11] [PASSED] drm_test_buddy_alloc_limit
[13:30:11] [PASSED] drm_test_buddy_alloc_optimistic
[13:30:11] [PASSED] drm_test_buddy_alloc_pessimistic
[13:30:11] [PASSED] drm_test_buddy_alloc_pathological
[13:30:11] ==================== [PASSED] drm_buddy ====================
[13:30:11] ============= drm_cmdline_parser (40 subtests) =============
[13:30:11] [PASSED] drm_test_cmdline_force_d_only
[13:30:11] [PASSED] drm_test_cmdline_force_D_only_dvi
[13:30:11] [PASSED] drm_test_cmdline_force_D_only_hdmi
[13:30:11] [PASSED] drm_test_cmdline_force_D_only_not_digital
[13:30:11] [PASSED] drm_test_cmdline_force_e_only
[13:30:11] [PASSED] drm_test_cmdline_res
[13:30:11] [PASSED] drm_test_cmdline_res_vesa
[13:30:11] [PASSED] drm_test_cmdline_res_vesa_rblank
[13:30:11] [PASSED] drm_test_cmdline_res_rblank
[13:30:11] [PASSED] drm_test_cmdline_res_bpp
[13:30:11] [PASSED] drm_test_cmdline_res_refresh
[13:30:11] [PASSED] drm_test_cmdline_res_bpp_refresh
[13:30:11] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[13:30:11] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[13:30:11] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[13:30:11] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[13:30:11] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[13:30:11] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[13:30:11] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[13:30:11] [PASSED] drm_test_cmdline_res_margins_force_on
[13:30:11] [PASSED] drm_test_cmdline_res_vesa_margins
[13:30:11] [PASSED] drm_test_cmdline_name
[13:30:11] [PASSED] drm_test_cmdline_name_bpp
[13:30:11] [PASSED] drm_test_cmdline_name_option
[13:30:11] [PASSED] drm_test_cmdline_name_bpp_option
[13:30:11] [PASSED] drm_test_cmdline_rotate_0
[13:30:11] [PASSED] drm_test_cmdline_rotate_90
[13:30:11] [PASSED] drm_test_cmdline_rotate_180
[13:30:11] [PASSED] drm_test_cmdline_rotate_270
[13:30:11] [PASSED] drm_test_cmdline_hmirror
[13:30:11] [PASSED] drm_test_cmdline_vmirror
[13:30:11] [PASSED] drm_test_cmdline_margin_options
[13:30:11] [PASSED] drm_test_cmdline_multiple_options
[13:30:11] [PASSED] drm_test_cmdline_bpp_extra_and_option
[13:30:11] [PASSED] drm_test_cmdline_extra_and_option
[13:30:11] [PASSED] drm_test_cmdline_freestanding_options
[13:30:11] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[13:30:11] [PASSED] drm_test_cmdline_panel_orientation
[13:30:11] ================ drm_test_cmdline_invalid  =================
[13:30:11] [PASSED] margin_only
[13:30:11] [PASSED] interlace_only
[13:30:11] [PASSED] res_missing_x
[13:30:11] [PASSED] res_missing_y
[13:30:11] [PASSED] res_bad_y
[13:30:11] [PASSED] res_missing_y_bpp
[13:30:11] [PASSED] res_bad_bpp
[13:30:11] [PASSED] res_bad_refresh
[13:30:11] [PASSED] res_bpp_refresh_force_on_off
[13:30:11] [PASSED] res_invalid_mode
[13:30:11] [PASSED] res_bpp_wrong_place_mode
[13:30:11] [PASSED] name_bpp_refresh
[13:30:11] [PASSED] name_refresh
[13:30:11] [PASSED] name_refresh_wrong_mode
[13:30:11] [PASSED] name_refresh_invalid_mode
[13:30:11] [PASSED] rotate_multiple
[13:30:11] [PASSED] rotate_invalid_val
[13:30:11] [PASSED] rotate_truncated
[13:30:11] [PASSED] invalid_option
[13:30:11] [PASSED] invalid_tv_option
[13:30:11] [PASSED] truncated_tv_option
[13:30:11] ============ [PASSED] drm_test_cmdline_invalid =============
[13:30:11] =============== drm_test_cmdline_tv_options  ===============
[13:30:11] [PASSED] NTSC
[13:30:11] [PASSED] NTSC_443
[13:30:11] [PASSED] NTSC_J
[13:30:11] [PASSED] PAL
[13:30:11] [PASSED] PAL_M
[13:30:11] [PASSED] PAL_N
[13:30:11] [PASSED] SECAM
[13:30:11] =========== [PASSED] drm_test_cmdline_tv_options ===========
[13:30:11] =============== [PASSED] drm_cmdline_parser ================
[13:30:11] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[13:30:11] ========== drm_test_get_tv_mode_from_name_valid  ===========
[13:30:11] [PASSED] NTSC
[13:30:11] [PASSED] NTSC-443
[13:30:11] [PASSED] NTSC-J
[13:30:11] [PASSED] PAL
[13:30:11] [PASSED] PAL-M
[13:30:11] [PASSED] PAL-N
[13:30:11] [PASSED] SECAM
[13:30:11] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[13:30:11] [PASSED] drm_test_get_tv_mode_from_name_truncated
[13:30:11] ============ [PASSED] drm_get_tv_mode_from_name ============
[13:30:11] ============= drm_damage_helper (21 subtests) ==============
[13:30:11] [PASSED] drm_test_damage_iter_no_damage
[13:30:11] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[13:30:11] [PASSED] drm_test_damage_iter_no_damage_src_moved
[13:30:11] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[13:30:11] [PASSED] drm_test_damage_iter_no_damage_not_visible
[13:30:11] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[13:30:11] [PASSED] drm_test_damage_iter_no_damage_no_fb
[13:30:11] [PASSED] drm_test_damage_iter_simple_damage
[13:30:11] [PASSED] drm_test_damage_iter_single_damage
[13:30:11] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[13:30:11] [PASSED] drm_test_damage_iter_single_damage_outside_src
[13:30:11] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[13:30:11] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[13:30:11] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[13:30:11] [PASSED] drm_test_damage_iter_single_damage_src_moved
[13:30:11] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[13:30:11] [PASSED] drm_test_damage_iter_damage
[13:30:11] [PASSED] drm_test_damage_iter_damage_one_intersect
[13:30:11] [PASSED] drm_test_damage_iter_damage_one_outside
[13:30:11] [PASSED] drm_test_damage_iter_damage_src_moved
[13:30:11] [PASSED] drm_test_damage_iter_damage_not_visible
[13:30:11] ================ [PASSED] drm_damage_helper ================
[13:30:11] ============== drm_dp_mst_helper (3 subtests) ==============
[13:30:11] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[13:30:11] [PASSED] Clock 154000 BPP 30 DSC disabled
[13:30:11] [PASSED] Clock 234000 BPP 30 DSC disabled
[13:30:11] [PASSED] Clock 297000 BPP 24 DSC disabled
[13:30:11] [PASSED] Clock 332880 BPP 24 DSC enabled
[13:30:11] [PASSED] Clock 324540 BPP 24 DSC enabled
[13:30:11] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[13:30:11] ============== drm_test_dp_mst_calc_pbn_div  ===============
[13:30:11] [PASSED] Link rate 2000000 lane count 4
[13:30:11] [PASSED] Link rate 2000000 lane count 2
[13:30:11] [PASSED] Link rate 2000000 lane count 1
[13:30:11] [PASSED] Link rate 1350000 lane count 4
[13:30:11] [PASSED] Link rate 1350000 lane count 2
[13:30:11] [PASSED] Link rate 1350000 lane count 1
[13:30:11] [PASSED] Link rate 1000000 lane count 4
[13:30:11] [PASSED] Link rate 1000000 lane count 2
[13:30:11] [PASSED] Link rate 1000000 lane count 1
[13:30:11] [PASSED] Link rate 810000 lane count 4
[13:30:11] [PASSED] Link rate 810000 lane count 2
[13:30:11] [PASSED] Link rate 810000 lane count 1
[13:30:11] [PASSED] Link rate 540000 lane count 4
[13:30:11] [PASSED] Link rate 540000 lane count 2
[13:30:11] [PASSED] Link rate 540000 lane count 1
[13:30:11] [PASSED] Link rate 270000 lane count 4
[13:30:11] [PASSED] Link rate 270000 lane count 2
[13:30:11] [PASSED] Link rate 270000 lane count 1
[13:30:11] [PASSED] Link rate 162000 lane count 4
[13:30:11] [PASSED] Link rate 162000 lane count 2
[13:30:11] [PASSED] Link rate 162000 lane count 1
[13:30:11] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[13:30:11] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[13:30:11] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[13:30:11] [PASSED] DP_POWER_UP_PHY with port number
[13:30:11] [PASSED] DP_POWER_DOWN_PHY with port number
[13:30:11] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[13:30:11] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[13:30:11] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[13:30:11] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[13:30:11] [PASSED] DP_QUERY_PAYLOAD with port number
[13:30:11] [PASSED] DP_QUERY_PAYLOAD with VCPI
[13:30:11] [PASSED] DP_REMOTE_DPCD_READ with port number
[13:30:11] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[13:30:11] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[13:30:11] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[13:30:11] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[13:30:11] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[13:30:11] [PASSED] DP_REMOTE_I2C_READ with port number
[13:30:11] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[13:30:11] [PASSED] DP_REMOTE_I2C_READ with transactions array
[13:30:11] [PASSED] DP_REMOTE_I2C_WRITE with port number
[13:30:11] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[13:30:11] [PASSED] DP_REMOTE_I2C_WRITE with data array
[13:30:11] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[13:30:11] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[13:30:11] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[13:30:11] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[13:30:11] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[13:30:11] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[13:30:11] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[13:30:11] ================ [PASSED] drm_dp_mst_helper ================
[13:30:11] ================== drm_exec (7 subtests) ===================
[13:30:11] [PASSED] sanitycheck
[13:30:11] [PASSED] test_lock
[13:30:11] [PASSED] test_lock_unlock
[13:30:11] [PASSED] test_duplicates
[13:30:11] [PASSED] test_prepare
[13:30:11] [PASSED] test_prepare_array
[13:30:11] [PASSED] test_multiple_loops
[13:30:11] ==================== [PASSED] drm_exec =====================
[13:30:11] =========== drm_format_helper_test (17 subtests) ===========
[13:30:11] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[13:30:11] [PASSED] single_pixel_source_buffer
[13:30:11] [PASSED] single_pixel_clip_rectangle
[13:30:11] [PASSED] well_known_colors
[13:30:11] [PASSED] destination_pitch
[13:30:11] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[13:30:11] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[13:30:11] [PASSED] single_pixel_source_buffer
[13:30:11] [PASSED] single_pixel_clip_rectangle
[13:30:11] [PASSED] well_known_colors
[13:30:11] [PASSED] destination_pitch
[13:30:11] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[13:30:11] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[13:30:11] [PASSED] single_pixel_source_buffer
[13:30:11] [PASSED] single_pixel_clip_rectangle
[13:30:11] [PASSED] well_known_colors
[13:30:11] [PASSED] destination_pitch
[13:30:11] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[13:30:11] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[13:30:11] [PASSED] single_pixel_source_buffer
[13:30:11] [PASSED] single_pixel_clip_rectangle
[13:30:11] [PASSED] well_known_colors
[13:30:11] [PASSED] destination_pitch
[13:30:11] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[13:30:11] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[13:30:11] [PASSED] single_pixel_source_buffer
[13:30:11] [PASSED] single_pixel_clip_rectangle
[13:30:11] [PASSED] well_known_colors
[13:30:11] [PASSED] destination_pitch
[13:30:11] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[13:30:11] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[13:30:11] [PASSED] single_pixel_source_buffer
[13:30:11] [PASSED] single_pixel_clip_rectangle
[13:30:11] [PASSED] well_known_colors
[13:30:11] [PASSED] destination_pitch
[13:30:11] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[13:30:11] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[13:30:11] [PASSED] single_pixel_source_buffer
[13:30:11] [PASSED] single_pixel_clip_rectangle
[13:30:11] [PASSED] well_known_colors
[13:30:11] [PASSED] destination_pitch
[13:30:11] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[13:30:11] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[13:30:11] [PASSED] single_pixel_source_buffer
[13:30:11] [PASSED] single_pixel_clip_rectangle
[13:30:11] [PASSED] well_known_colors
[13:30:11] [PASSED] destination_pitch
[13:30:11] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[13:30:11] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[13:30:11] [PASSED] single_pixel_source_buffer
[13:30:11] [PASSED] single_pixel_clip_rectangle
[13:30:11] [PASSED] well_known_colors
[13:30:11] [PASSED] destination_pitch
[13:30:11] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[13:30:11] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[13:30:11] [PASSED] single_pixel_source_buffer
[13:30:11] [PASSED] single_pixel_clip_rectangle
[13:30:11] [PASSED] well_known_colors
[13:30:11] [PASSED] destination_pitch
[13:30:11] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[13:30:11] ============== drm_test_fb_xrgb8888_to_mono  ===============
[13:30:11] [PASSED] single_pixel_source_buffer
[13:30:11] [PASSED] single_pixel_clip_rectangle
[13:30:11] [PASSED] well_known_colors
[13:30:11] [PASSED] destination_pitch
[13:30:11] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[13:30:11] ==================== drm_test_fb_swab  =====================
[13:30:11] [PASSED] single_pixel_source_buffer
[13:30:11] [PASSED] single_pixel_clip_rectangle
[13:30:11] [PASSED] well_known_colors
[13:30:11] [PASSED] destination_pitch
[13:30:11] ================ [PASSED] drm_test_fb_swab =================
[13:30:11] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[13:30:11] [PASSED] single_pixel_source_buffer
[13:30:11] [PASSED] single_pixel_clip_rectangle
[13:30:11] [PASSED] well_known_colors
[13:30:11] [PASSED] destination_pitch
[13:30:11] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[13:30:11] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[13:30:11] [PASSED] single_pixel_source_buffer
[13:30:11] [PASSED] single_pixel_clip_rectangle
[13:30:11] [PASSED] well_known_colors
[13:30:11] [PASSED] destination_pitch
[13:30:11] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[13:30:11] ================= drm_test_fb_clip_offset  =================
[13:30:11] [PASSED] pass through
[13:30:11] [PASSED] horizontal offset
[13:30:11] [PASSED] vertical offset
[13:30:11] [PASSED] horizontal and vertical offset
[13:30:11] [PASSED] horizontal offset (custom pitch)
[13:30:11] [PASSED] vertical offset (custom pitch)
[13:30:11] [PASSED] horizontal and vertical offset (custom pitch)
[13:30:11] ============= [PASSED] drm_test_fb_clip_offset =============
[13:30:11] ============== drm_test_fb_build_fourcc_list  ==============
[13:30:11] [PASSED] no native formats
[13:30:11] [PASSED] XRGB8888 as native format
[13:30:11] [PASSED] remove duplicates
[13:30:11] [PASSED] convert alpha formats
[13:30:11] [PASSED] random formats
[13:30:11] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[13:30:11] =================== drm_test_fb_memcpy  ====================
[13:30:11] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[13:30:11] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[13:30:11] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[13:30:11] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[13:30:11] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[13:30:11] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[13:30:11] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[13:30:11] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[13:30:11] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[13:30:11] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[13:30:11] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[13:30:11] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[13:30:11] =============== [PASSED] drm_test_fb_memcpy ================
[13:30:11] ============= [PASSED] drm_format_helper_test ==============
[13:30:11] ================= drm_format (18 subtests) =================
[13:30:11] [PASSED] drm_test_format_block_width_invalid
[13:30:11] [PASSED] drm_test_format_block_width_one_plane
[13:30:11] [PASSED] drm_test_format_block_width_two_plane
[13:30:11] [PASSED] drm_test_format_block_width_three_plane
[13:30:11] [PASSED] drm_test_format_block_width_tiled
[13:30:11] [PASSED] drm_test_format_block_height_invalid
[13:30:11] [PASSED] drm_test_format_block_height_one_plane
[13:30:11] [PASSED] drm_test_format_block_height_two_plane
[13:30:11] [PASSED] drm_test_format_block_height_three_plane
[13:30:11] [PASSED] drm_test_format_block_height_tiled
[13:30:11] [PASSED] drm_test_format_min_pitch_invalid
[13:30:11] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[13:30:11] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[13:30:11] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[13:30:11] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[13:30:11] [PASSED] drm_test_format_min_pitch_two_plane
[13:30:11] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[13:30:11] [PASSED] drm_test_format_min_pitch_tiled
[13:30:11] =================== [PASSED] drm_format ====================
[13:30:11] =============== drm_framebuffer (1 subtest) ================
[13:30:11] =============== drm_test_framebuffer_create  ===============
[13:30:11] [PASSED] ABGR8888 normal sizes
[13:30:11] [PASSED] ABGR8888 max sizes
[13:30:11] [PASSED] ABGR8888 pitch greater than min required
[13:30:11] [PASSED] ABGR8888 pitch less than min required
[13:30:11] [PASSED] ABGR8888 Invalid width
[13:30:11] [PASSED] ABGR8888 Invalid buffer handle
[13:30:11] [PASSED] No pixel format
[13:30:11] [PASSED] ABGR8888 Width 0
[13:30:11] [PASSED] ABGR8888 Height 0
[13:30:11] [PASSED] ABGR8888 Out of bound height * pitch combination
[13:30:11] [PASSED] ABGR8888 Large buffer offset
[13:30:11] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[13:30:11] [PASSED] ABGR8888 Valid buffer modifier
[13:30:11] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[13:30:11] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[13:30:11] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[13:30:11] [PASSED] NV12 Normal sizes
[13:30:11] [PASSED] NV12 Max sizes
[13:30:11] [PASSED] NV12 Invalid pitch
[13:30:11] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[13:30:11] [PASSED] NV12 different  modifier per-plane
[13:30:11] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[13:30:11] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[13:30:11] [PASSED] NV12 Modifier for inexistent plane
[13:30:11] [PASSED] NV12 Handle for inexistent plane
[13:30:11] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[13:30:11] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[13:30:11] [PASSED] YVU420 Normal sizes
[13:30:11] [PASSED] YVU420 Max sizes
[13:30:11] [PASSED] YVU420 Invalid pitch
[13:30:11] [PASSED] YVU420 Different pitches
[13:30:11] [PASSED] YVU420 Different buffer offsets/pitches
[13:30:11] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[13:30:11] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[13:30:11] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[13:30:11] [PASSED] YVU420 Valid modifier
[13:30:11] [PASSED] YVU420 Different modifiers per plane
[13:30:11] [PASSED] YVU420 Modifier for inexistent plane
[13:30:11] [PASSED] X0L2 Normal sizes
[13:30:11] [PASSED] X0L2 Max sizes
[13:30:11] [PASSED] X0L2 Invalid pitch
[13:30:11] [PASSED] X0L2 Pitch greater than minimum required
[13:30:11] [PASSED] X0L2 Handle for inexistent plane
[13:30:11] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[13:30:11] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[13:30:11] [PASSED] X0L2 Valid modifier
[13:30:11] [PASSED] X0L2 Modifier for inexistent plane
[13:30:11] =========== [PASSED] drm_test_framebuffer_create ===========
[13:30:11] ================= [PASSED] drm_framebuffer =================
[13:30:11] ================ drm_gem_shmem (8 subtests) ================
[13:30:11] [PASSED] drm_gem_shmem_test_obj_create
[13:30:11] [PASSED] drm_gem_shmem_test_obj_create_private
[13:30:11] [PASSED] drm_gem_shmem_test_pin_pages
[13:30:11] [PASSED] drm_gem_shmem_test_vmap
[13:30:11] [PASSED] drm_gem_shmem_test_get_pages_sgt
[13:30:11] [PASSED] drm_gem_shmem_test_get_sg_table
[13:30:11] [PASSED] drm_gem_shmem_test_madvise
[13:30:11] [PASSED] drm_gem_shmem_test_purge
[13:30:11] ================== [PASSED] drm_gem_shmem ==================
[13:30:11] ================= drm_managed (2 subtests) =================
[13:30:11] [PASSED] drm_test_managed_release_action
[13:30:11] [PASSED] drm_test_managed_run_action
[13:30:11] =================== [PASSED] drm_managed ===================
[13:30:11] =================== drm_mm (6 subtests) ====================
[13:30:11] [PASSED] drm_test_mm_init
[13:30:11] [PASSED] drm_test_mm_debug
[13:30:11] [PASSED] drm_test_mm_align32
[13:30:11] [PASSED] drm_test_mm_align64
[13:30:11] [PASSED] drm_test_mm_lowest
[13:30:11] [PASSED] drm_test_mm_highest
[13:30:11] ===================== [PASSED] drm_mm ======================
[13:30:11] ============= drm_modes_analog_tv (4 subtests) =============
[13:30:11] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[13:30:11] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[13:30:11] [PASSED] drm_test_modes_analog_tv_pal_576i
[13:30:11] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[13:30:11] =============== [PASSED] drm_modes_analog_tv ===============
[13:30:11] ============== drm_plane_helper (2 subtests) ===============
[13:30:11] =============== drm_test_check_plane_state  ================
[13:30:11] [PASSED] clipping_simple
[13:30:11] [PASSED] clipping_rotate_reflect
[13:30:11] [PASSED] positioning_simple
[13:30:11] [PASSED] upscaling
[13:30:11] [PASSED] downscaling
[13:30:11] [PASSED] rounding1
[13:30:11] [PASSED] rounding2
[13:30:11] [PASSED] rounding3
[13:30:11] [PASSED] rounding4
[13:30:11] =========== [PASSED] drm_test_check_plane_state ============
[13:30:11] =========== drm_test_check_invalid_plane_state  ============
[13:30:11] [PASSED] positioning_invalid
[13:30:11] [PASSED] upscaling_invalid
[13:30:11] [PASSED] downscaling_invalid
[13:30:11] ======= [PASSED] drm_test_check_invalid_plane_state ========
[13:30:11] ================ [PASSED] drm_plane_helper =================
[13:30:11] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[13:30:11] ====== drm_test_connector_helper_tv_get_modes_check  =======
[13:30:11] [PASSED] None
[13:30:11] [PASSED] PAL
[13:30:11] [PASSED] NTSC
[13:30:11] [PASSED] Both, NTSC Default
[13:30:11] [PASSED] Both, PAL Default
[13:30:11] [PASSED] Both, NTSC Default, with PAL on command-line
[13:30:11] [PASSED] Both, PAL Default, with NTSC on command-line
[13:30:11] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[13:30:11] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[13:30:11] ================== drm_rect (9 subtests) ===================
[13:30:11] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[13:30:11] [PASSED] drm_test_rect_clip_scaled_not_clipped
[13:30:11] [PASSED] drm_test_rect_clip_scaled_clipped
[13:30:11] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[13:30:11] ================= drm_test_rect_intersect  =================
[13:30:11] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[13:30:11] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[13:30:11] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[13:30:11] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[13:30:11] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[13:30:11] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[13:30:11] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[13:30:11] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[13:30:11] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[13:30:11] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[13:30:11] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[13:30:11] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[13:30:11] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[13:30:11] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[13:30:11] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[13:30:11] ============= [PASSED] drm_test_rect_intersect =============
[13:30:11] ================ drm_test_rect_calc_hscale  ================
[13:30:11] [PASSED] normal use
[13:30:11] [PASSED] out of max range
[13:30:11] [PASSED] out of min range
[13:30:11] [PASSED] zero dst
[13:30:11] [PASSED] negative src
[13:30:11] [PASSED] negative dst
stty: 'standard input': Inappropriate ioctl for device
[13:30:11] ============ [PASSED] drm_test_rect_calc_hscale ============
[13:30:11] ================ drm_test_rect_calc_vscale  ================
[13:30:11] [PASSED] normal use
[13:30:11] [PASSED] out of max range
[13:30:11] [PASSED] out of min range
[13:30:11] [PASSED] zero dst
[13:30:11] [PASSED] negative src
[13:30:11] [PASSED] negative dst
[13:30:11] ============ [PASSED] drm_test_rect_calc_vscale ============
[13:30:11] ================== drm_test_rect_rotate  ===================
[13:30:11] [PASSED] reflect-x
[13:30:11] [PASSED] reflect-y
[13:30:11] [PASSED] rotate-0
[13:30:11] [PASSED] rotate-90
[13:30:11] [PASSED] rotate-180
[13:30:11] [PASSED] rotate-270
[13:30:11] ============== [PASSED] drm_test_rect_rotate ===============
[13:30:11] ================ drm_test_rect_rotate_inv  =================
[13:30:11] [PASSED] reflect-x
[13:30:11] [PASSED] reflect-y
[13:30:11] [PASSED] rotate-0
[13:30:11] [PASSED] rotate-90
[13:30:11] [PASSED] rotate-180
[13:30:11] [PASSED] rotate-270
[13:30:11] ============ [PASSED] drm_test_rect_rotate_inv =============
[13:30:11] ==================== [PASSED] drm_rect =====================
[13:30:11] ============================================================
[13:30:11] Testing complete. Ran 391 tests: passed: 391
[13:30:11] Elapsed time: 22.140s total, 1.680s configuring, 20.291s building, 0.166s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


