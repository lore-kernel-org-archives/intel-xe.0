Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3C5C4345F
	for <intel-xe@archiver.kernel.org>; Wed,  1 May 2024 23:36:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A429610F3E9;
	Wed,  1 May 2024 23:36:21 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BA410F3E9;
 Wed,  1 May 2024 23:36:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2EKUnit=3A_success_for_LNL_GSC_FW_support_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 May 2024 23:36:20 -0000
Message-ID: <171460658010.1793171.1120815924613434908@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240501231829.2122219-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240501231829.2122219-1-daniele.ceraolospurio@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: LNL GSC FW support (rev3)
URL   : https://patchwork.freedesktop.org/series/132475/
State : success

== Summary ==

+ trap cleanup EXIT
+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig
[23:35:23] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:35:27] Building KUnit Kernel ...
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
../arch/x86/um/os-Linux/mcontext.c:7:6: warning: no previous prototype for ‘get_regs_from_mc’ [-Wmissing-prototypes]
    7 | void get_regs_from_mc(struct uml_pt_regs *regs, mcontext_t *mc)
      |      ^~~~~~~~~~~~~~~~
../arch/x86/um/os-Linux/registers.c:146:15: warning: no previous prototype for ‘get_thread_reg’ [-Wmissing-prototypes]
  146 | unsigned long get_thread_reg(int reg, jmp_buf *buf)
      |               ^~~~~~~~~~~~~~
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
../arch/um/os-Linux/signal.c:75:6: warning: no previous prototype for ‘sig_handler’ [-Wmissing-prototypes]
   75 | void sig_handler(int sig, struct siginfo *si, mcontext_t *mc)
      |      ^~~~~~~~~~~
../arch/um/os-Linux/signal.c:111:6: warning: no previous prototype for ‘timer_alarm_handler’ [-Wmissing-prototypes]
  111 | void timer_alarm_handler(int sig, struct siginfo *unused_si, mcontext_t *mc)
      |      ^~~~~~~~~~~~~~~~~~~
../arch/um/os-Linux/start_up.c:301:12: warning: no previous prototype for ‘parse_iomem’ [-Wmissing-prototypes]
  301 | int __init parse_iomem(char *str, int *add)
      |            ^~~~~~~~~~~
../arch/um/kernel/skas/process.c:36:12: warning: no previous prototype for ‘start_uml’ [-Wmissing-prototypes]
   36 | int __init start_uml(void)
      |            ^~~~~~~~~
../arch/x86/um/ptrace_64.c:111:5: warning: no previous prototype for ‘poke_user’ [-Wmissing-prototypes]
  111 | int poke_user(struct task_struct *child, long addr, long data)
      |     ^~~~~~~~~
../arch/x86/um/ptrace_64.c:171:5: warning: no previous prototype for ‘peek_user’ [-Wmissing-prototypes]
  171 | int peek_user(struct task_struct *child, long addr, long data)
      |     ^~~~~~~~~
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

[23:35:53] Starting KUnit Kernel (1/1)...
[23:35:53] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[23:35:53] =================== guc_dbm (7 subtests) ===================
[23:35:53] [PASSED] test_empty
[23:35:53] [PASSED] test_default
[23:35:53] ======================== test_size  ========================
[23:35:53] [PASSED] 4
[23:35:53] [PASSED] 8
[23:35:53] [PASSED] 32
[23:35:53] [PASSED] 256
[23:35:53] ==================== [PASSED] test_size ====================
[23:35:53] ======================= test_reuse  ========================
[23:35:53] [PASSED] 4
[23:35:53] [PASSED] 8
[23:35:53] [PASSED] 32
[23:35:53] [PASSED] 256
[23:35:53] =================== [PASSED] test_reuse ====================
[23:35:53] =================== test_range_overlap  ====================
[23:35:53] [PASSED] 4
[23:35:53] [PASSED] 8
[23:35:53] [PASSED] 32
[23:35:53] [PASSED] 256
[23:35:53] =============== [PASSED] test_range_overlap ================
[23:35:53] =================== test_range_compact  ====================
[23:35:53] [PASSED] 4
[23:35:53] [PASSED] 8
[23:35:53] [PASSED] 32
[23:35:53] [PASSED] 256
[23:35:53] =============== [PASSED] test_range_compact ================
[23:35:53] ==================== test_range_spare  =====================
[23:35:53] [PASSED] 4
[23:35:53] [PASSED] 8
[23:35:53] [PASSED] 32
[23:35:53] [PASSED] 256
[23:35:53] ================ [PASSED] test_range_spare =================
[23:35:53] ===================== [PASSED] guc_dbm =====================
[23:35:53] =================== guc_idm (6 subtests) ===================
[23:35:53] [PASSED] bad_init
[23:35:53] [PASSED] no_init
[23:35:53] [PASSED] init_fini
[23:35:53] [PASSED] check_used
[23:35:53] [PASSED] check_quota
[23:35:53] [PASSED] check_all
[23:35:53] ===================== [PASSED] guc_idm =====================
[23:35:53] ================== no_relay (3 subtests) ===================
[23:35:53] [PASSED] xe_drops_guc2pf_if_not_ready
[23:35:53] [PASSED] xe_drops_guc2vf_if_not_ready
[23:35:53] [PASSED] xe_rejects_send_if_not_ready
[23:35:53] ==================== [PASSED] no_relay =====================
[23:35:53] ================== pf_relay (14 subtests) ==================
[23:35:53] [PASSED] pf_rejects_guc2pf_too_short
[23:35:53] [PASSED] pf_rejects_guc2pf_too_long
[23:35:53] [PASSED] pf_rejects_guc2pf_no_payload
[23:35:53] [PASSED] pf_fails_no_payload
[23:35:53] [PASSED] pf_fails_bad_origin
[23:35:53] [PASSED] pf_fails_bad_type
[23:35:53] [PASSED] pf_txn_reports_error
[23:35:53] [PASSED] pf_txn_sends_pf2guc
[23:35:53] [PASSED] pf_sends_pf2guc
[23:35:53] [SKIPPED] pf_loopback_nop
[23:35:53] [SKIPPED] pf_loopback_echo
[23:35:53] [SKIPPED] pf_loopback_fail
[23:35:53] [SKIPPED] pf_loopback_busy
[23:35:53] [SKIPPED] pf_loopback_retry
[23:35:53] ==================== [PASSED] pf_relay =====================
[23:35:53] ================== vf_relay (3 subtests) ===================
[23:35:53] [PASSED] vf_rejects_guc2vf_too_short
[23:35:53] [PASSED] vf_rejects_guc2vf_too_long
[23:35:53] [PASSED] vf_rejects_guc2vf_no_payload
[23:35:53] ==================== [PASSED] vf_relay =====================
[23:35:53] ================= pf_service (11 subtests) =================
[23:35:53] [PASSED] pf_negotiate_any
[23:35:53] [PASSED] pf_negotiate_base_match
[23:35:53] [PASSED] pf_negotiate_base_newer
[23:35:53] [PASSED] pf_negotiate_base_next
[23:35:53] [SKIPPED] pf_negotiate_base_older
[23:35:53] [PASSED] pf_negotiate_base_prev
[23:35:53] [PASSED] pf_negotiate_latest_match
[23:35:53] [PASSED] pf_negotiate_latest_newer
[23:35:53] [PASSED] pf_negotiate_latest_next
[23:35:53] [SKIPPED] pf_negotiate_latest_older
[23:35:53] [SKIPPED] pf_negotiate_latest_prev
[23:35:53] =================== [PASSED] pf_service ====================
[23:35:53] ===================== lmtt (1 subtest) =====================
[23:35:53] ======================== test_ops  =========================
[23:35:53] [PASSED] 2-level
[23:35:53] [PASSED] multi-level
[23:35:53] ==================== [PASSED] test_ops =====================
[23:35:53] ====================== [PASSED] lmtt =======================
[23:35:53] ==================== xe_bo (2 subtests) ====================
[23:35:53] [SKIPPED] xe_ccs_migrate_kunit
[23:35:53] [SKIPPED] xe_bo_evict_kunit
[23:35:53] ===================== [SKIPPED] xe_bo ======================
[23:35:53] ================== xe_dma_buf (1 subtest) ==================
[23:35:53] [SKIPPED] xe_dma_buf_kunit
[23:35:53] =================== [SKIPPED] xe_dma_buf ===================
[23:35:53] ================== xe_migrate (1 subtest) ==================
[23:35:53] [SKIPPED] xe_migrate_sanity_kunit
[23:35:53] =================== [SKIPPED] xe_migrate ===================
[23:35:53] =================== xe_mocs (2 subtests) ===================
[23:35:53] [SKIPPED] xe_live_mocs_kernel_kunit
[23:35:53] [SKIPPED] xe_live_mocs_reset_kunit
[23:35:53] ==================== [SKIPPED] xe_mocs =====================
[23:35:53] =================== xe_pci (2 subtests) ====================
[23:35:53] [PASSED] xe_gmdid_graphics_ip
[23:35:53] [PASSED] xe_gmdid_media_ip
[23:35:53] ===================== [PASSED] xe_pci ======================
[23:35:53] ==================== xe_rtp (1 subtest) ====================
[23:35:53] ================== xe_rtp_process_tests  ===================
[23:35:53] [PASSED] coalesce-same-reg
[23:35:53] [PASSED] no-match-no-add
[23:35:53] [PASSED] no-match-no-add-multiple-rules
[23:35:53] [PASSED] two-regs-two-entries
[23:35:53] [PASSED] clr-one-set-other
[23:35:53] [PASSED] set-field
[23:35:53] [PASSED] conflict-duplicate
[23:35:53] [PASSED] conflict-not-disjoint
[23:35:53] [PASSED] conflict-reg-type
[23:35:53] ============== [PASSED] xe_rtp_process_tests ===============
[23:35:53] ===================== [PASSED] xe_rtp ======================
[23:35:53] ==================== xe_wa (1 subtest) =====================
[23:35:53] ======================== xe_wa_gt  =========================
[23:35:53] [PASSED] TIGERLAKE (B0)
[23:35:53] [PASSED] DG1 (A0)
[23:35:53] [PASSED] DG1 (B0)
[23:35:53] [PASSED] ALDERLAKE_S (A0)
[23:35:53] [PASSED] ALDERLAKE_S (B0)
[23:35:53] [PASSED] ALDERLAKE_S (C0)
[23:35:53] [PASSED] ALDERLAKE_S (D0)
[23:35:53] [PASSED] ALDERLAKE_P (A0)
[23:35:53] [PASSED] ALDERLAKE_P (B0)
[23:35:53] [PASSED] ALDERLAKE_P (C0)
[23:35:53] [PASSED] ALDERLAKE_S_RPLS (D0)
[23:35:53] [PASSED] ALDERLAKE_P_RPLU (E0)
[23:35:53] [PASSED] DG2_G10 (C0)
[23:35:53] [PASSED] DG2_G11 (B1)
[23:35:53] [PASSED] DG2_G12 (A1)
[23:35:53] [PASSED] METEORLAKE (g:A0, m:A0)
[23:35:53] [PASSED] METEORLAKE (g:A0, m:A0)
[23:35:53] [PASSED] METEORLAKE (g:A0, m:A0)
[23:35:53] [PASSED] LUNARLAKE (g:A0, m:A0)
[23:35:53] [PASSED] LUNARLAKE (g:B0, m:A0)
[23:35:53] ==================== [PASSED] xe_wa_gt =====================
[23:35:53] ====================== [PASSED] xe_wa ======================
[23:35:53] ============================================================
[23:35:53] Testing complete. Ran 98 tests: passed: 84, skipped: 14
[23:35:53] Elapsed time: 29.863s total, 4.253s configuring, 25.339s building, 0.219s running

+ /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/tests/.kunitconfig
[23:35:53] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[23:35:55] Building KUnit Kernel ...
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
../arch/x86/um/signal.c:560:6: warning: no previous prototype for ‘sys_rt_sigreturn’ [-Wmissing-prototypes]
  560 | long sys_rt_sigreturn(void)
      |      ^~~~~~~~~~~~~~~~
../arch/um/kernel/mem.c:202:8: warning: no previous prototype for ‘pgd_alloc’ [-Wmissing-prototypes]
  202 | pgd_t *pgd_alloc(struct mm_struct *mm)
      |        ^~~~~~~~~
../arch/um/kernel/mem.c:215:7: warning: no previous prototype for ‘uml_kmalloc’ [-Wmissing-prototypes]
  215 | void *uml_kmalloc(int size, int flags)
      |       ^~~~~~~~~~~
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
../arch/x86/um/syscalls_64.c:48:6: warning: no previous prototype for ‘arch_switch_to’ [-Wmissing-prototypes]
   48 | void arch_switch_to(struct task_struct *to)
      |      ^~~~~~~~~~~~~~
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
../arch/um/kernel/kmsg_dump.c:60:12: warning: no previous prototype for ‘kmsg_dumper_stdout_init’ [-Wmissing-prototypes]
   60 | int __init kmsg_dumper_stdout_init(void)
      |            ^~~~~~~~~~~~~~~~~~~~~~~
../arch/um/kernel/um_arch.c:408:19: warning: no previous prototype for ‘read_initrd’ [-Wmissing-prototypes]
  408 | int __init __weak read_initrd(void)
      |                   ^~~~~~~~~~~
../arch/um/kernel/um_arch.c:461:7: warning: no previous prototype for ‘text_poke’ [-Wmissing-prototypes]
  461 | void *text_poke(void *addr, const void *opcode, size_t len)
      |       ^~~~~~~~~
../arch/um/kernel/um_arch.c:473:6: warning: no previous prototype for ‘text_poke_sync’ [-Wmissing-prototypes]
  473 | void text_poke_sync(void)
      |      ^~~~~~~~~~~~~~
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

[23:36:17] Starting KUnit Kernel (1/1)...
[23:36:17] ============================================================
Running tests with:
$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[23:36:17] ============ drm_test_pick_cmdline (2 subtests) ============
[23:36:17] [PASSED] drm_test_pick_cmdline_res_1920_1080_60
[23:36:17] =============== drm_test_pick_cmdline_named  ===============
[23:36:17] [PASSED] NTSC
[23:36:17] [PASSED] NTSC-J
[23:36:17] [PASSED] PAL
[23:36:17] [PASSED] PAL-M
[23:36:17] =========== [PASSED] drm_test_pick_cmdline_named ===========
[23:36:17] ============== [PASSED] drm_test_pick_cmdline ==============
[23:36:17] ================== drm_buddy (7 subtests) ==================
[23:36:17] [PASSED] drm_test_buddy_alloc_limit
[23:36:17] [PASSED] drm_test_buddy_alloc_optimistic
[23:36:17] [PASSED] drm_test_buddy_alloc_pessimistic
[23:36:17] [PASSED] drm_test_buddy_alloc_pathological
[23:36:17] [PASSED] drm_test_buddy_alloc_contiguous
[23:36:17] [PASSED] drm_test_buddy_alloc_clear
[23:36:17] [PASSED] drm_test_buddy_alloc_range_bias
[23:36:17] ==================== [PASSED] drm_buddy ====================
[23:36:17] ============= drm_cmdline_parser (40 subtests) =============
[23:36:17] [PASSED] drm_test_cmdline_force_d_only
[23:36:17] [PASSED] drm_test_cmdline_force_D_only_dvi
[23:36:17] [PASSED] drm_test_cmdline_force_D_only_hdmi
[23:36:17] [PASSED] drm_test_cmdline_force_D_only_not_digital
[23:36:17] [PASSED] drm_test_cmdline_force_e_only
[23:36:17] [PASSED] drm_test_cmdline_res
[23:36:17] [PASSED] drm_test_cmdline_res_vesa
[23:36:17] [PASSED] drm_test_cmdline_res_vesa_rblank
[23:36:17] [PASSED] drm_test_cmdline_res_rblank
[23:36:17] [PASSED] drm_test_cmdline_res_bpp
[23:36:17] [PASSED] drm_test_cmdline_res_refresh
[23:36:17] [PASSED] drm_test_cmdline_res_bpp_refresh
[23:36:17] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced
[23:36:17] [PASSED] drm_test_cmdline_res_bpp_refresh_margins
[23:36:17] [PASSED] drm_test_cmdline_res_bpp_refresh_force_off
[23:36:17] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on
[23:36:17] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_analog
[23:36:17] [PASSED] drm_test_cmdline_res_bpp_refresh_force_on_digital
[23:36:17] [PASSED] drm_test_cmdline_res_bpp_refresh_interlaced_margins_force_on
[23:36:17] [PASSED] drm_test_cmdline_res_margins_force_on
[23:36:17] [PASSED] drm_test_cmdline_res_vesa_margins
[23:36:17] [PASSED] drm_test_cmdline_name
[23:36:17] [PASSED] drm_test_cmdline_name_bpp
[23:36:17] [PASSED] drm_test_cmdline_name_option
[23:36:17] [PASSED] drm_test_cmdline_name_bpp_option
[23:36:17] [PASSED] drm_test_cmdline_rotate_0
[23:36:17] [PASSED] drm_test_cmdline_rotate_90
[23:36:17] [PASSED] drm_test_cmdline_rotate_180
[23:36:17] [PASSED] drm_test_cmdline_rotate_270
[23:36:17] [PASSED] drm_test_cmdline_hmirror
[23:36:17] [PASSED] drm_test_cmdline_vmirror
[23:36:17] [PASSED] drm_test_cmdline_margin_options
[23:36:17] [PASSED] drm_test_cmdline_multiple_options
[23:36:17] [PASSED] drm_test_cmdline_bpp_extra_and_option
[23:36:17] [PASSED] drm_test_cmdline_extra_and_option
[23:36:17] [PASSED] drm_test_cmdline_freestanding_options
[23:36:17] [PASSED] drm_test_cmdline_freestanding_force_e_and_options
[23:36:17] [PASSED] drm_test_cmdline_panel_orientation
[23:36:17] ================ drm_test_cmdline_invalid  =================
[23:36:17] [PASSED] margin_only
[23:36:17] [PASSED] interlace_only
[23:36:17] [PASSED] res_missing_x
[23:36:17] [PASSED] res_missing_y
[23:36:17] [PASSED] res_bad_y
[23:36:17] [PASSED] res_missing_y_bpp
[23:36:17] [PASSED] res_bad_bpp
[23:36:17] [PASSED] res_bad_refresh
[23:36:17] [PASSED] res_bpp_refresh_force_on_off
[23:36:17] [PASSED] res_invalid_mode
[23:36:17] [PASSED] res_bpp_wrong_place_mode
[23:36:17] [PASSED] name_bpp_refresh
[23:36:17] [PASSED] name_refresh
[23:36:17] [PASSED] name_refresh_wrong_mode
[23:36:17] [PASSED] name_refresh_invalid_mode
[23:36:17] [PASSED] rotate_multiple
[23:36:17] [PASSED] rotate_invalid_val
[23:36:17] [PASSED] rotate_truncated
[23:36:17] [PASSED] invalid_option
[23:36:17] [PASSED] invalid_tv_option
[23:36:17] [PASSED] truncated_tv_option
[23:36:17] ============ [PASSED] drm_test_cmdline_invalid =============
[23:36:17] =============== drm_test_cmdline_tv_options  ===============
[23:36:17] [PASSED] NTSC
[23:36:17] [PASSED] NTSC_443
[23:36:17] [PASSED] NTSC_J
[23:36:17] [PASSED] PAL
[23:36:17] [PASSED] PAL_M
[23:36:17] [PASSED] PAL_N
[23:36:17] [PASSED] SECAM
[23:36:17] =========== [PASSED] drm_test_cmdline_tv_options ===========
[23:36:17] =============== [PASSED] drm_cmdline_parser ================
[23:36:17] ============= drmm_connector_init (3 subtests) =============
[23:36:17] [PASSED] drm_test_drmm_connector_init
[23:36:17] [PASSED] drm_test_drmm_connector_init_null_ddc
[23:36:17] ========= drm_test_drmm_connector_init_type_valid  =========
[23:36:17] [PASSED] Unknown
[23:36:17] [PASSED] VGA
[23:36:17] [PASSED] DVI-I
[23:36:17] [PASSED] DVI-D
[23:36:17] [PASSED] DVI-A
[23:36:17] [PASSED] Composite
[23:36:17] [PASSED] SVIDEO
[23:36:17] [PASSED] LVDS
[23:36:17] [PASSED] Component
[23:36:17] [PASSED] DIN
[23:36:17] [PASSED] DP
[23:36:17] [PASSED] HDMI-A
[23:36:17] [PASSED] HDMI-B
[23:36:17] [PASSED] TV
[23:36:17] [PASSED] eDP
[23:36:17] [PASSED] Virtual
[23:36:17] [PASSED] DSI
[23:36:17] [PASSED] DPI
[23:36:17] [PASSED] Writeback
[23:36:17] [PASSED] SPI
[23:36:17] [PASSED] USB
[23:36:17] ===== [PASSED] drm_test_drmm_connector_init_type_valid =====
[23:36:17] =============== [PASSED] drmm_connector_init ===============
[23:36:17] ========== drm_get_tv_mode_from_name (2 subtests) ==========
[23:36:17] ========== drm_test_get_tv_mode_from_name_valid  ===========
[23:36:17] [PASSED] NTSC
[23:36:17] [PASSED] NTSC-443
[23:36:17] [PASSED] NTSC-J
[23:36:17] [PASSED] PAL
[23:36:17] [PASSED] PAL-M
[23:36:17] [PASSED] PAL-N
[23:36:17] [PASSED] SECAM
[23:36:17] ====== [PASSED] drm_test_get_tv_mode_from_name_valid =======
[23:36:17] [PASSED] drm_test_get_tv_mode_from_name_truncated
[23:36:17] ============ [PASSED] drm_get_tv_mode_from_name ============
[23:36:17] ============= drm_damage_helper (21 subtests) ==============
[23:36:17] [PASSED] drm_test_damage_iter_no_damage
[23:36:17] [PASSED] drm_test_damage_iter_no_damage_fractional_src
[23:36:17] [PASSED] drm_test_damage_iter_no_damage_src_moved
[23:36:17] [PASSED] drm_test_damage_iter_no_damage_fractional_src_moved
[23:36:17] [PASSED] drm_test_damage_iter_no_damage_not_visible
[23:36:17] [PASSED] drm_test_damage_iter_no_damage_no_crtc
[23:36:17] [PASSED] drm_test_damage_iter_no_damage_no_fb
[23:36:17] [PASSED] drm_test_damage_iter_simple_damage
[23:36:17] [PASSED] drm_test_damage_iter_single_damage
[23:36:17] [PASSED] drm_test_damage_iter_single_damage_intersect_src
[23:36:17] [PASSED] drm_test_damage_iter_single_damage_outside_src
[23:36:17] [PASSED] drm_test_damage_iter_single_damage_fractional_src
[23:36:17] [PASSED] drm_test_damage_iter_single_damage_intersect_fractional_src
[23:36:17] [PASSED] drm_test_damage_iter_single_damage_outside_fractional_src
[23:36:17] [PASSED] drm_test_damage_iter_single_damage_src_moved
[23:36:17] [PASSED] drm_test_damage_iter_single_damage_fractional_src_moved
[23:36:17] [PASSED] drm_test_damage_iter_damage
[23:36:17] [PASSED] drm_test_damage_iter_damage_one_intersect
[23:36:17] [PASSED] drm_test_damage_iter_damage_one_outside
[23:36:17] [PASSED] drm_test_damage_iter_damage_src_moved
[23:36:17] [PASSED] drm_test_damage_iter_damage_not_visible
[23:36:17] ================ [PASSED] drm_damage_helper ================
[23:36:17] ============== drm_dp_mst_helper (3 subtests) ==============
[23:36:17] ============== drm_test_dp_mst_calc_pbn_mode  ==============
[23:36:17] [PASSED] Clock 154000 BPP 30 DSC disabled
[23:36:17] [PASSED] Clock 234000 BPP 30 DSC disabled
[23:36:17] [PASSED] Clock 297000 BPP 24 DSC disabled
[23:36:17] [PASSED] Clock 332880 BPP 24 DSC enabled
[23:36:17] [PASSED] Clock 324540 BPP 24 DSC enabled
[23:36:17] ========== [PASSED] drm_test_dp_mst_calc_pbn_mode ==========
[23:36:17] ============== drm_test_dp_mst_calc_pbn_div  ===============
[23:36:17] [PASSED] Link rate 2000000 lane count 4
[23:36:17] [PASSED] Link rate 2000000 lane count 2
[23:36:17] [PASSED] Link rate 2000000 lane count 1
[23:36:17] [PASSED] Link rate 1350000 lane count 4
[23:36:17] [PASSED] Link rate 1350000 lane count 2
[23:36:17] [PASSED] Link rate 1350000 lane count 1
[23:36:17] [PASSED] Link rate 1000000 lane count 4
[23:36:17] [PASSED] Link rate 1000000 lane count 2
[23:36:17] [PASSED] Link rate 1000000 lane count 1
[23:36:17] [PASSED] Link rate 810000 lane count 4
[23:36:17] [PASSED] Link rate 810000 lane count 2
[23:36:17] [PASSED] Link rate 810000 lane count 1
[23:36:17] [PASSED] Link rate 540000 lane count 4
[23:36:17] [PASSED] Link rate 540000 lane count 2
[23:36:17] [PASSED] Link rate 540000 lane count 1
[23:36:17] [PASSED] Link rate 270000 lane count 4
[23:36:17] [PASSED] Link rate 270000 lane count 2
[23:36:17] [PASSED] Link rate 270000 lane count 1
[23:36:17] [PASSED] Link rate 162000 lane count 4
[23:36:17] [PASSED] Link rate 162000 lane count 2
[23:36:17] [PASSED] Link rate 162000 lane count 1
[23:36:17] ========== [PASSED] drm_test_dp_mst_calc_pbn_div ===========
[23:36:17] ========= drm_test_dp_mst_sideband_msg_req_decode  =========
[23:36:17] [PASSED] DP_ENUM_PATH_RESOURCES with port number
[23:36:17] [PASSED] DP_POWER_UP_PHY with port number
[23:36:17] [PASSED] DP_POWER_DOWN_PHY with port number
[23:36:17] [PASSED] DP_ALLOCATE_PAYLOAD with SDP stream sinks
[23:36:17] [PASSED] DP_ALLOCATE_PAYLOAD with port number
[23:36:17] [PASSED] DP_ALLOCATE_PAYLOAD with VCPI
[23:36:17] [PASSED] DP_ALLOCATE_PAYLOAD with PBN
[23:36:17] [PASSED] DP_QUERY_PAYLOAD with port number
[23:36:17] [PASSED] DP_QUERY_PAYLOAD with VCPI
[23:36:17] [PASSED] DP_REMOTE_DPCD_READ with port number
[23:36:17] [PASSED] DP_REMOTE_DPCD_READ with DPCD address
[23:36:17] [PASSED] DP_REMOTE_DPCD_READ with max number of bytes
[23:36:17] [PASSED] DP_REMOTE_DPCD_WRITE with port number
[23:36:17] [PASSED] DP_REMOTE_DPCD_WRITE with DPCD address
[23:36:17] [PASSED] DP_REMOTE_DPCD_WRITE with data array
[23:36:17] [PASSED] DP_REMOTE_I2C_READ with port number
[23:36:17] [PASSED] DP_REMOTE_I2C_READ with I2C device ID
[23:36:17] [PASSED] DP_REMOTE_I2C_READ with transactions array
[23:36:17] [PASSED] DP_REMOTE_I2C_WRITE with port number
[23:36:17] [PASSED] DP_REMOTE_I2C_WRITE with I2C device ID
[23:36:17] [PASSED] DP_REMOTE_I2C_WRITE with data array
[23:36:17] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream ID
[23:36:17] [PASSED] DP_QUERY_STREAM_ENC_STATUS with client ID
[23:36:17] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream event
[23:36:17] [PASSED] DP_QUERY_STREAM_ENC_STATUS with valid stream event
[23:36:17] [PASSED] DP_QUERY_STREAM_ENC_STATUS with stream behavior
[23:36:17] [PASSED] DP_QUERY_STREAM_ENC_STATUS with a valid stream behavior
[23:36:17] ===== [PASSED] drm_test_dp_mst_sideband_msg_req_decode =====
[23:36:17] ================ [PASSED] drm_dp_mst_helper ================
[23:36:17] ================== drm_exec (7 subtests) ===================
[23:36:17] [PASSED] sanitycheck
[23:36:17] [PASSED] test_lock
[23:36:17] [PASSED] test_lock_unlock
[23:36:17] [PASSED] test_duplicates
[23:36:17] [PASSED] test_prepare
[23:36:17] [PASSED] test_prepare_array
[23:36:17] [PASSED] test_multiple_loops
[23:36:17] ==================== [PASSED] drm_exec =====================
[23:36:17] =========== drm_format_helper_test (17 subtests) ===========
[23:36:17] ============== drm_test_fb_xrgb8888_to_gray8  ==============
[23:36:17] [PASSED] single_pixel_source_buffer
[23:36:17] [PASSED] single_pixel_clip_rectangle
[23:36:17] [PASSED] well_known_colors
[23:36:17] [PASSED] destination_pitch
[23:36:17] ========== [PASSED] drm_test_fb_xrgb8888_to_gray8 ==========
[23:36:17] ============= drm_test_fb_xrgb8888_to_rgb332  ==============
[23:36:17] [PASSED] single_pixel_source_buffer
[23:36:17] [PASSED] single_pixel_clip_rectangle
[23:36:17] [PASSED] well_known_colors
[23:36:17] [PASSED] destination_pitch
[23:36:17] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb332 ==========
[23:36:17] ============= drm_test_fb_xrgb8888_to_rgb565  ==============
[23:36:17] [PASSED] single_pixel_source_buffer
[23:36:17] [PASSED] single_pixel_clip_rectangle
[23:36:17] [PASSED] well_known_colors
[23:36:17] [PASSED] destination_pitch
[23:36:17] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb565 ==========
[23:36:17] ============ drm_test_fb_xrgb8888_to_xrgb1555  =============
[23:36:17] [PASSED] single_pixel_source_buffer
[23:36:17] [PASSED] single_pixel_clip_rectangle
[23:36:17] [PASSED] well_known_colors
[23:36:17] [PASSED] destination_pitch
[23:36:17] ======== [PASSED] drm_test_fb_xrgb8888_to_xrgb1555 =========
[23:36:17] ============ drm_test_fb_xrgb8888_to_argb1555  =============
[23:36:17] [PASSED] single_pixel_source_buffer
[23:36:17] [PASSED] single_pixel_clip_rectangle
[23:36:17] [PASSED] well_known_colors
[23:36:17] [PASSED] destination_pitch
[23:36:17] ======== [PASSED] drm_test_fb_xrgb8888_to_argb1555 =========
[23:36:17] ============ drm_test_fb_xrgb8888_to_rgba5551  =============
[23:36:17] [PASSED] single_pixel_source_buffer
[23:36:17] [PASSED] single_pixel_clip_rectangle
[23:36:17] [PASSED] well_known_colors
[23:36:17] [PASSED] destination_pitch
[23:36:17] ======== [PASSED] drm_test_fb_xrgb8888_to_rgba5551 =========
[23:36:17] ============= drm_test_fb_xrgb8888_to_rgb888  ==============
[23:36:17] [PASSED] single_pixel_source_buffer
[23:36:17] [PASSED] single_pixel_clip_rectangle
[23:36:17] [PASSED] well_known_colors
[23:36:17] [PASSED] destination_pitch
[23:36:17] ========= [PASSED] drm_test_fb_xrgb8888_to_rgb888 ==========
[23:36:17] ============ drm_test_fb_xrgb8888_to_argb8888  =============
[23:36:17] [PASSED] single_pixel_source_buffer
[23:36:17] [PASSED] single_pixel_clip_rectangle
[23:36:17] [PASSED] well_known_colors
[23:36:17] [PASSED] destination_pitch
[23:36:17] ======== [PASSED] drm_test_fb_xrgb8888_to_argb8888 =========
[23:36:17] =========== drm_test_fb_xrgb8888_to_xrgb2101010  ===========
[23:36:17] [PASSED] single_pixel_source_buffer
[23:36:17] [PASSED] single_pixel_clip_rectangle
[23:36:17] [PASSED] well_known_colors
[23:36:17] [PASSED] destination_pitch
[23:36:17] ======= [PASSED] drm_test_fb_xrgb8888_to_xrgb2101010 =======
[23:36:17] =========== drm_test_fb_xrgb8888_to_argb2101010  ===========
[23:36:17] [PASSED] single_pixel_source_buffer
[23:36:17] [PASSED] single_pixel_clip_rectangle
[23:36:17] [PASSED] well_known_colors
[23:36:17] [PASSED] destination_pitch
[23:36:17] ======= [PASSED] drm_test_fb_xrgb8888_to_argb2101010 =======
[23:36:17] ============== drm_test_fb_xrgb8888_to_mono  ===============
[23:36:17] [PASSED] single_pixel_source_buffer
[23:36:17] [PASSED] single_pixel_clip_rectangle
[23:36:17] [PASSED] well_known_colors
[23:36:17] [PASSED] destination_pitch
[23:36:17] ========== [PASSED] drm_test_fb_xrgb8888_to_mono ===========
[23:36:17] ==================== drm_test_fb_swab  =====================
[23:36:17] [PASSED] single_pixel_source_buffer
[23:36:17] [PASSED] single_pixel_clip_rectangle
[23:36:17] [PASSED] well_known_colors
[23:36:17] [PASSED] destination_pitch
[23:36:17] ================ [PASSED] drm_test_fb_swab =================
[23:36:17] ============ drm_test_fb_xrgb8888_to_xbgr8888  =============
[23:36:17] [PASSED] single_pixel_source_buffer
[23:36:17] [PASSED] single_pixel_clip_rectangle
[23:36:17] [PASSED] well_known_colors
[23:36:17] [PASSED] destination_pitch
[23:36:17] ======== [PASSED] drm_test_fb_xrgb8888_to_xbgr8888 =========
[23:36:17] ============ drm_test_fb_xrgb8888_to_abgr8888  =============
[23:36:17] [PASSED] single_pixel_source_buffer
[23:36:17] [PASSED] single_pixel_clip_rectangle
[23:36:17] [PASSED] well_known_colors
[23:36:17] [PASSED] destination_pitch
[23:36:17] ======== [PASSED] drm_test_fb_xrgb8888_to_abgr8888 =========
[23:36:17] ================= drm_test_fb_clip_offset  =================
[23:36:17] [PASSED] pass through
[23:36:17] [PASSED] horizontal offset
[23:36:17] [PASSED] vertical offset
[23:36:17] [PASSED] horizontal and vertical offset
[23:36:17] [PASSED] horizontal offset (custom pitch)
[23:36:17] [PASSED] vertical offset (custom pitch)
[23:36:17] [PASSED] horizontal and vertical offset (custom pitch)
[23:36:17] ============= [PASSED] drm_test_fb_clip_offset =============
[23:36:17] ============== drm_test_fb_build_fourcc_list  ==============
[23:36:17] [PASSED] no native formats
[23:36:17] [PASSED] XRGB8888 as native format
[23:36:17] [PASSED] remove duplicates
[23:36:17] [PASSED] convert alpha formats
[23:36:17] [PASSED] random formats
[23:36:17] ========== [PASSED] drm_test_fb_build_fourcc_list ==========
[23:36:17] =================== drm_test_fb_memcpy  ====================
[23:36:17] [PASSED] single_pixel_source_buffer: XR24 little-endian (0x34325258)
[23:36:17] [PASSED] single_pixel_source_buffer: XRA8 little-endian (0x38415258)
[23:36:17] [PASSED] single_pixel_source_buffer: YU24 little-endian (0x34325559)
[23:36:17] [PASSED] single_pixel_clip_rectangle: XB24 little-endian (0x34324258)
[23:36:17] [PASSED] single_pixel_clip_rectangle: XRA8 little-endian (0x38415258)
[23:36:17] [PASSED] single_pixel_clip_rectangle: YU24 little-endian (0x34325559)
[23:36:17] [PASSED] well_known_colors: XB24 little-endian (0x34324258)
[23:36:17] [PASSED] well_known_colors: XRA8 little-endian (0x38415258)
[23:36:17] [PASSED] well_known_colors: YU24 little-endian (0x34325559)
[23:36:17] [PASSED] destination_pitch: XB24 little-endian (0x34324258)
[23:36:17] [PASSED] destination_pitch: XRA8 little-endian (0x38415258)
[23:36:17] [PASSED] destination_pitch: YU24 little-endian (0x34325559)
[23:36:17] =============== [PASSED] drm_test_fb_memcpy ================
[23:36:17] ============= [PASSED] drm_format_helper_test ==============
[23:36:17] ================= drm_format (18 subtests) =================
[23:36:17] [PASSED] drm_test_format_block_width_invalid
[23:36:17] [PASSED] drm_test_format_block_width_one_plane
[23:36:17] [PASSED] drm_test_format_block_width_two_plane
[23:36:17] [PASSED] drm_test_format_block_width_three_plane
[23:36:17] [PASSED] drm_test_format_block_width_tiled
[23:36:17] [PASSED] drm_test_format_block_height_invalid
[23:36:17] [PASSED] drm_test_format_block_height_one_plane
[23:36:17] [PASSED] drm_test_format_block_height_two_plane
[23:36:17] [PASSED] drm_test_format_block_height_three_plane
[23:36:17] [PASSED] drm_test_format_block_height_tiled
[23:36:17] [PASSED] drm_test_format_min_pitch_invalid
[23:36:17] [PASSED] drm_test_format_min_pitch_one_plane_8bpp
[23:36:17] [PASSED] drm_test_format_min_pitch_one_plane_16bpp
[23:36:17] [PASSED] drm_test_format_min_pitch_one_plane_24bpp
[23:36:17] [PASSED] drm_test_format_min_pitch_one_plane_32bpp
[23:36:17] [PASSED] drm_test_format_min_pitch_two_plane
[23:36:17] [PASSED] drm_test_format_min_pitch_three_plane_8bpp
[23:36:17] [PASSED] drm_test_format_min_pitch_tiled
[23:36:17] =================== [PASSED] drm_format ====================
[23:36:17] =============== drm_framebuffer (1 subtest) ================
[23:36:17] =============== drm_test_framebuffer_create  ===============
[23:36:17] [PASSED] ABGR8888 normal sizes
[23:36:17] [PASSED] ABGR8888 max sizes
[23:36:17] [PASSED] ABGR8888 pitch greater than min required
[23:36:17] [PASSED] ABGR8888 pitch less than min required
[23:36:17] [PASSED] ABGR8888 Invalid width
[23:36:17] [PASSED] ABGR8888 Invalid buffer handle
[23:36:17] [PASSED] No pixel format
[23:36:17] [PASSED] ABGR8888 Width 0
[23:36:17] [PASSED] ABGR8888 Height 0
[23:36:17] [PASSED] ABGR8888 Out of bound height * pitch combination
[23:36:17] [PASSED] ABGR8888 Large buffer offset
[23:36:17] [PASSED] ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
[23:36:17] [PASSED] ABGR8888 Valid buffer modifier
[23:36:17] [PASSED] ABGR8888 Invalid buffer modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
[23:36:17] [PASSED] ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
[23:36:17] [PASSED] ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
[23:36:17] [PASSED] NV12 Normal sizes
[23:36:17] [PASSED] NV12 Max sizes
[23:36:17] [PASSED] NV12 Invalid pitch
[23:36:17] [PASSED] NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
[23:36:17] [PASSED] NV12 different  modifier per-plane
[23:36:17] [PASSED] NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
[23:36:17] [PASSED] NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
[23:36:17] [PASSED] NV12 Modifier for inexistent plane
[23:36:17] [PASSED] NV12 Handle for inexistent plane
[23:36:17] [PASSED] NV12 Handle for inexistent plane without DRM_MODE_FB_MODIFIERS
[23:36:17] [PASSED] YVU420 DRM_MODE_FB_MODIFIERS set without modifier
[23:36:17] [PASSED] YVU420 Normal sizes
[23:36:17] [PASSED] YVU420 Max sizes
[23:36:17] [PASSED] YVU420 Invalid pitch
[23:36:17] [PASSED] YVU420 Different pitches
[23:36:17] [PASSED] YVU420 Different buffer offsets/pitches
[23:36:17] [PASSED] YVU420 Modifier set just for plane 0, without DRM_MODE_FB_MODIFIERS
[23:36:17] [PASSED] YVU420 Modifier set just for planes 0, 1, without DRM_MODE_FB_MODIFIERS
[23:36:17] [PASSED] YVU420 Modifier set just for plane 0, 1, with DRM_MODE_FB_MODIFIERS
[23:36:17] [PASSED] YVU420 Valid modifier
[23:36:17] [PASSED] YVU420 Different modifiers per plane
[23:36:17] [PASSED] YVU420 Modifier for inexistent plane
[23:36:17] [PASSED] X0L2 Normal sizes
[23:36:17] [PASSED] X0L2 Max sizes
[23:36:17] [PASSED] X0L2 Invalid pitch
[23:36:17] [PASSED] X0L2 Pitch greater than minimum required
[23:36:17] [PASSED] X0L2 Handle for inexistent plane
[23:36:17] [PASSED] X0L2 Offset for inexistent plane, without DRM_MODE_FB_MODIFIERS set
[23:36:17] [PASSED] X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
[23:36:17] [PASSED] X0L2 Valid modifier
[23:36:17] [PASSED] X0L2 Modifier for inexistent plane
[23:36:17] =========== [PASSED] drm_test_framebuffer_create ===========
[23:36:17] ================= [PASSED] drm_framebuffer =================
[23:36:17] ================ drm_gem_shmem (8 subtests) ================
[23:36:17] [PASSED] drm_gem_shmem_test_obj_create
[23:36:17] [PASSED] drm_gem_shmem_test_obj_create_private
[23:36:17] [PASSED] drm_gem_shmem_test_pin_pages
[23:36:17] [PASSED] drm_gem_shmem_test_vmap
[23:36:17] [PASSED] drm_gem_shmem_test_get_pages_sgt
[23:36:17] [PASSED] drm_gem_shmem_test_get_sg_table
[23:36:17] [PASSED] drm_gem_shmem_test_madvise
[23:36:17] [PASSED] drm_gem_shmem_test_purge
[23:36:17] ================== [PASSED] drm_gem_shmem ==================
[23:36:17] ================= drm_managed (2 subtests) =================
[23:36:17] [PASSED] drm_test_managed_release_action
[23:36:17] [PASSED] drm_test_managed_run_action
[23:36:17] =================== [PASSED] drm_managed ===================
[23:36:17] =================== drm_mm (6 subtests) ====================
[23:36:17] [PASSED] drm_test_mm_init
[23:36:17] [PASSED] drm_test_mm_debug
[23:36:17] [PASSED] drm_test_mm_align32
[23:36:17] [PASSED] drm_test_mm_align64
[23:36:17] [PASSED] drm_test_mm_lowest
[23:36:17] [PASSED] drm_test_mm_highest
[23:36:17] ===================== [PASSED] drm_mm ======================
[23:36:17] ============= drm_modes_analog_tv (4 subtests) =============
[23:36:17] [PASSED] drm_test_modes_analog_tv_ntsc_480i
[23:36:17] [PASSED] drm_test_modes_analog_tv_ntsc_480i_inlined
[23:36:17] [PASSED] drm_test_modes_analog_tv_pal_576i
[23:36:17] [PASSED] drm_test_modes_analog_tv_pal_576i_inlined
[23:36:17] =============== [PASSED] drm_modes_analog_tv ===============
[23:36:17] ============== drm_plane_helper (2 subtests) ===============
[23:36:17] =============== drm_test_check_plane_state  ================
[23:36:17] [PASSED] clipping_simple
[23:36:17] [PASSED] clipping_rotate_reflect
[23:36:17] [PASSED] positioning_simple
[23:36:17] [PASSED] upscaling
[23:36:17] [PASSED] downscaling
[23:36:17] [PASSED] rounding1
[23:36:17] [PASSED] rounding2
[23:36:17] [PASSED] rounding3
[23:36:17] [PASSED] rounding4
[23:36:17] =========== [PASSED] drm_test_check_plane_state ============
[23:36:17] =========== drm_test_check_invalid_plane_state  ============
[23:36:17] [PASSED] positioning_invalid
[23:36:17] [PASSED] upscaling_invalid
[23:36:17] [PASSED] downscaling_invalid
[23:36:17] ======= [PASSED] drm_test_check_invalid_plane_state ========
[23:36:17] ================ [PASSED] drm_plane_helper =================
[23:36:17] ====== drm_connector_helper_tv_get_modes (1 subtest) =======
[23:36:17] ====== drm_test_connector_helper_tv_get_modes_check  =======
[23:36:17] [PASSED] None
[23:36:17] [PASSED] PAL
[23:36:17] [PASSED] NTSC
[23:36:17] [PASSED] Both, NTSC Default
[23:36:17] [PASSED] Both, PAL Default
[23:36:17] [PASSED] Both, NTSC Default, with PAL on command-line
[23:36:17] [PASSED] Both, PAL Default, with NTSC on command-line
[23:36:17] == [PASSED] drm_test_connector_helper_tv_get_modes_check ===
[23:36:17] ======== [PASSED] drm_connector_helper_tv_get_modes ========
[23:36:17] ================== drm_rect (9 subtests) ===================
[23:36:17] [PASSED] drm_test_rect_clip_scaled_div_by_zero
[23:36:17] [PASSED] drm_test_rect_clip_scaled_not_clipped
[23:36:17] [PASSED] drm_test_rect_clip_scaled_clipped
stty: 'standard input': Inappropriate ioctl for device
[23:36:17] [PASSED] drm_test_rect_clip_scaled_signed_vs_unsigned
[23:36:17] ================= drm_test_rect_intersect  =================
[23:36:17] [PASSED] top-left x bottom-right: 2x2+1+1 x 2x2+0+0
[23:36:17] [PASSED] top-right x bottom-left: 2x2+0+0 x 2x2+1-1
[23:36:17] [PASSED] bottom-left x top-right: 2x2+1-1 x 2x2+0+0
[23:36:17] [PASSED] bottom-right x top-left: 2x2+0+0 x 2x2+1+1
[23:36:17] [PASSED] right x left: 2x1+0+0 x 3x1+1+0
[23:36:17] [PASSED] left x right: 3x1+1+0 x 2x1+0+0
[23:36:17] [PASSED] up x bottom: 1x2+0+0 x 1x3+0-1
[23:36:17] [PASSED] bottom x up: 1x3+0-1 x 1x2+0+0
[23:36:17] [PASSED] touching corner: 1x1+0+0 x 2x2+1+1
[23:36:17] [PASSED] touching side: 1x1+0+0 x 1x1+1+0
[23:36:17] [PASSED] equal rects: 2x2+0+0 x 2x2+0+0
[23:36:17] [PASSED] inside another: 2x2+0+0 x 1x1+1+1
[23:36:17] [PASSED] far away: 1x1+0+0 x 1x1+3+6
[23:36:17] [PASSED] points intersecting: 0x0+5+10 x 0x0+5+10
[23:36:17] [PASSED] points not intersecting: 0x0+0+0 x 0x0+5+10
[23:36:17] ============= [PASSED] drm_test_rect_intersect =============
[23:36:17] ================ drm_test_rect_calc_hscale  ================
[23:36:17] [PASSED] normal use
[23:36:17] [PASSED] out of max range
[23:36:17] [PASSED] out of min range
[23:36:17] [PASSED] zero dst
[23:36:17] [PASSED] negative src
[23:36:17] [PASSED] negative dst
[23:36:17] ============ [PASSED] drm_test_rect_calc_hscale ============
[23:36:17] ================ drm_test_rect_calc_vscale  ================
[23:36:17] [PASSED] normal use
[23:36:17] [PASSED] out of max range
[23:36:17] [PASSED] out of min range
[23:36:17] [PASSED] zero dst
[23:36:17] [PASSED] negative src
[23:36:17] [PASSED] negative dst
[23:36:17] ============ [PASSED] drm_test_rect_calc_vscale ============
[23:36:17] ================== drm_test_rect_rotate  ===================
[23:36:17] [PASSED] reflect-x
[23:36:17] [PASSED] reflect-y
[23:36:17] [PASSED] rotate-0
[23:36:17] [PASSED] rotate-90
[23:36:17] [PASSED] rotate-180
[23:36:17] [PASSED] rotate-270
[23:36:17] ============== [PASSED] drm_test_rect_rotate ===============
[23:36:17] ================ drm_test_rect_rotate_inv  =================
[23:36:17] [PASSED] reflect-x
[23:36:17] [PASSED] reflect-y
[23:36:17] [PASSED] rotate-0
[23:36:17] [PASSED] rotate-90
[23:36:17] [PASSED] rotate-180
[23:36:17] [PASSED] rotate-270
[23:36:17] ============ [PASSED] drm_test_rect_rotate_inv =============
[23:36:17] ==================== [PASSED] drm_rect =====================
[23:36:17] ============================================================
[23:36:17] Testing complete. Ran 417 tests: passed: 417
[23:36:17] Elapsed time: 23.822s total, 1.689s configuring, 21.914s building, 0.200s running

+ cleanup
++ stat -c %u:%g /kernel
+ chown -R 1003:1003 /kernel


