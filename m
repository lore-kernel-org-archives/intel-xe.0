Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7BDC2BA15
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 09:54:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3F910E811;
	Wed, 12 Jun 2024 09:54:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hpdHKsbf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC7510E811
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 09:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718186076; x=1749722076;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=F0hh+GBUlRns4YYiltEMiflLzrA37GTLrAKZvv9r6hU=;
 b=hpdHKsbfYYpuslZWVplU3z/X4f5yPUcXHnVhzspgTH4RvZDh/5FcGzt9
 NFy8NqXWEVLk6FI6jCLHGk0QyfbaLLVBkN4v8jtMQaB9g5bgk/jCJwvw2
 ZZ0jlNskDqDujkY39UHYbpJYztbpOtFi2Wqe3ZDpyAMFgSVMl0kKjERv9
 Wngra+izQd9pV/NVNPSIvfdpANcmnt1dTMBwg/GZyhOyZco5Eq+F45r7a
 r+2e2VbvC2S9ttZnglRLbQHGDhvksIPqw/gzHRytp6fPD506do20GtixE
 Af6G5m8Zs0drIGlSuFgpFP532S2vx7h++GQulz5rkjXPg6hwoojG/heIt g==;
X-CSE-ConnectionGUID: UJmkMpf4QHO87CL847VUBw==
X-CSE-MsgGUID: /v48RGqcR/SkZIM8XZV5KA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15171319"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="15171319"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 02:54:35 -0700
X-CSE-ConnectionGUID: gcKkQAtWSQaYbfKUw0s4lg==
X-CSE-MsgGUID: owzdt4JAR7+IHereDULUow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; d="scan'208";a="39846065"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa009.jf.intel.com with ESMTP; 12 Jun 2024 02:54:29 -0700
Received: from [10.245.119.62] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.119.62])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 22641135E8
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 10:54:26 +0100 (IST)
Message-ID: <25a2097e-66d4-4048-82fc-2522768d59a0@intel.com>
Date: Wed, 12 Jun 2024 11:54:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_Prepare_Xe_force?=
 =?UTF-8?Q?-wake_code_for_VFs_=28rev4=29?=
To: intel-xe@lists.freedesktop.org
References: <20240611163537.1944-1-michal.wajdeczko@intel.com>
 <171814482840.68617.7332569811480526026@a6498e030952>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <171814482840.68617.7332569811480526026@a6498e030952>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 12.06.2024 00:27, Patchwork wrote:
> == Series Details ==
> 
> Series: Prepare Xe force-wake code for VFs (rev4)
> URL   : https://patchwork.freedesktop.org/series/134690/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3_full -> xe-pw-134690v4_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-134690v4_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-134690v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-134690v4_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####

seems unrelated to this series

> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html

Dynamic subtest pipe-A-HDMI-A-6: SUCCESS (26.247s)

This test caused an abort condition: Lockdep not active

<3> [602.471153] xe 0000:03:00.0: [drm] *ERROR* GT0: TLB invalidation
time'd out, seqno=30705, recv=30704
<3> [602.479553] xe 0000:03:00.0: [drm] *ERROR* GT0: H2G CTB (all sizes
in DW):
<3> [602.479556] xe 0000:03:00.0: [drm] *ERROR* GT0: 	size: 1024
<3> [602.479557] xe 0000:03:00.0: [drm] *ERROR* GT0: 	resv_space: 0
<3> [602.479559] xe 0000:03:00.0: [drm] *ERROR* GT0: 	head: 442
<3> [602.479560] xe 0000:03:00.0: [drm] *ERROR* GT0: 	tail: 437
<3> [602.479561] xe 0000:03:00.0: [drm] *ERROR* GT0: 	space: 4
<3> [602.479563] xe 0000:03:00.0: [drm] *ERROR* GT0: 	broken: 0
<3> [602.479564] xe 0000:03:00.0: [drm] *ERROR* GT0: 	head (memory): 242
<3> [602.479566] xe 0000:03:00.0: [drm] *ERROR* GT0: 	tail (memory): 437
<3> [602.479567] xe 0000:03:00.0: [drm] *ERROR* GT0: 	status (memory): 0x0
<3> [602.479568] xe 0000:03:00.0: [drm] *ERROR* GT0: 	cmd[242]: 0xfd480003
<3> [602.479570] xe 0000:03:00.0: [drm] *ERROR* GT0: 	cmd[243]: 0x20001001
<3> [602.479572] xe 0000:03:00.0: [drm] *ERROR* GT0: 	cmd[244]: 0x00000137
<3> [602.479573] xe 0000:03:00.0: [drm] *ERROR* GT0: 	cmd[245]: 0x00000001
<3> [602.479575] xe 0000:03:00.0: [drm] *ERROR* GT0: 	cmd[246]: 0xfd490008


but the problems started in earlier test:


<7>[  600.947585] [IGT] xe_exec_reset: starting subtest gt-reset-stress
<5>[  600.949675] xe 0000:03:00.0: [drm] Timedout job: seqno=4294967169,
lrc_seqno=4294967169, guc_id=4, flags=0x0
<5>[  600.950374] xe 0000:03:00.0: [drm] Timedout job: seqno=4294967169,
lrc_seqno=4294967169, guc_id=5, flags=0x0
...
<4>[  601.213185] xe 0000:03:00.0: [drm] Schedule disable failed to respond
<6>[  601.213190] xe 0000:03:00.0: [drm] GT0: trying reset
...
<6>[  601.216057] xe 0000:03:00.0: [drm] GT0: trying reset
<5>[  601.216066] xe 0000:03:00.0: [drm] Timedout job: seqno=4294967169,
lrc_seqno=4294967169, guc_id=95, flags=0x0
<5>[  601.216094] xe 0000:03:00.0: [drm] Timedout job: seqno=4294967169,
lrc_seqno=4294967169, guc_id=18, flags=0x0
<6>[  601.216123] xe 0000:03:00.0: [drm] GT0: reset started
...

<4>[  601.249382] ------------[ cut here ]------------
<4>[  601.249494] xe 0000:03:00.0: [drm] [drm] Assertion
`!(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
exec_queue_banned(q) || exec_queue_suspended(q)` failed!
                  platform: DG2 subplatform: 6
                  graphics: Xe_HPG 12.55 step A1
                  media: Xe_HPM 12.55 step A1
<4>[  601.249517] WARNING: CPU: 12 PID: 217 at
drivers/gpu/drm/xe/xe_guc_submit.c:741
guc_exec_queue_run_job+0x4f1/0x1400 [xe]
<4>[  601.249556] Modules linked in: mei_gsc intel_rapl_msr
intel_rapl_common intel_uncore_frequency intel_uncore_frequency_common
x86_pkg_temp_thermal intel_powerclamp snd_sof_pci_intel_tgl coretemp
snd_sof_pci_intel_cnl snd_sof_intel_hda_generic snd_sof_pci
snd_sof_xtensa_dsp snd_sof_intel_hda_common snd_soc_hdac_hda
snd_sof_intel_hda kvm_intel snd_sof nls_iso8859_1 snd_sof_utils
snd_soc_acpi_intel_match kvm snd_soc_acpi snd_intel_dspcfg snd_hda_codec
snd_hwdep snd_sof_intel_hda_mlink snd_hda_ext_core crct10dif_pclmul
crc32_pclmul snd_hda_core joydev polyval_clmulni xe polyval_generic
snd_soc_core ghash_clmulni_intel snd_compress sha512_ssse3 drm_gpuvm
cmdlinepart sha256_ssse3 i2c_algo_bit sha1_ssse3 hid_generic snd_pcm
spi_nor drm_ttm_helper aesni_intel crypto_simd ttm cryptd mtd snd_seq
gpu_sched rapl snd_seq_device drm_suballoc_helper drm_exec intel_cstate
snd_timer usbhid drm_display_helper hid mei_pxp mei_hdcp efi_pstore snd
igc spi_intel_pci drm_kunit_helpers video i2c_i801 mxm_wmi wmi_bmof
soundcore spi_intel
<4>[  601.249626]  drm_kms_helper i2c_smbus kunit mei_me mei drm_buddy
intel_pmc_core intel_vsec wmi pmt_telemetry pmt_class acpi_pad
pinctrl_alderlake mac_hid acpi_tad sch_fq_codel msr parport_pc ppdev lp
parport drm ip_tables x_tables autofs4
<4>[  601.249650] CPU: 12 PID: 217 Comm: kworker/u80:9 Tainted: G     U
           6.10.0-rc3-xe #1
<4>[  601.249653] Hardware name: Micro-Star International Co., Ltd.
MS-7D25/PRO Z690-A DDR4(MS-7D25), BIOS 1.10 12/13/2021
<4>[  601.249655] Workqueue: gt-ordered-wq gt_reset_worker [xe]
<4>[  601.249688] RIP: 0010:guc_exec_queue_run_job+0x4f1/0x1400 [xe]
<4>[  601.249723] Code: 48 c7 c1 58 61 b9 a0 50 4c 8b 85 48 ff ff ff 41
50 4c 8b 9d 30 ff ff ff 49 89 d8 44 8b 8d 50 ff ff ff 4c 89 da e8 cf ca
7c e0 <0f> 0b 48 83 c4 40 e9 72 fb ff ff c7 45 98 00 10 00 00 89 4d 9c 0f
<4>[  601.249725] RSP: 0018:ffffc9000143fac0 EFLAGS: 00010286
<4>[  601.249728] RAX: 0000000000000000 RBX: ffffffffa0bdb982 RCX:
0000000000000027
<4>[  601.249729] RDX: 0000000000000027 RSI: 0000000100015e53 RDI:
ffff88888f431a48
<4>[  601.249731] RBP: ffffc9000143fc38 R08: 0000000000000000 R09:
0000000100015e53
<4>[  601.249732] R10: ffffc9000143f8a8 R11: ffff8888afacb7c8 R12:
ffff88811abdca40
<4>[  601.249733] R13: ffff88812faeee00 R14: 0000000000000037 R15:
ffffffffa0bdb9f3
<4>[  601.249735] FS:  0000000000000000(0000) GS:ffff88888f400000(0000)
knlGS:0000000000000000
<4>[  601.249736] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[  601.249738] CR2: 00007f9292316ff8 CR3: 0000000012254000 CR4:
0000000000750ef0
<4>[  601.249740] PKRU: 55555554
<4>[  601.249741] Call Trace:
<4>[  601.249742]  <TASK>
<4>[  601.249744]  ? show_regs+0x67/0x70
<4>[  601.249749]  ? __warn+0x94/0x1b0
<4>[  601.249752]  ? guc_exec_queue_run_job+0x4f1/0x1400 [xe]
<4>[  601.249789]  ? report_bug+0x1b7/0x1d0
<4>[  601.249794]  ? handle_bug+0x46/0x80
<4>[  601.249797]  ? exc_invalid_op+0x19/0x70
<4>[  601.249800]  ? asm_exc_invalid_op+0x1b/0x20
<4>[  601.249807]  ? guc_exec_queue_run_job+0x4f1/0x1400 [xe]
<4>[  601.249851]  ? xe_lrc_write_ctx_reg+0x7b/0x1f0 [xe]
<4>[  601.249892]  drm_sched_resubmit_jobs+0x63/0x1d0 [gpu_sched]
<4>[  601.249898]  xe_guc_submit_start+0x113/0x300 [xe]
<4>[  601.249933]  ? __cancel_work_sync+0x81/0xb0
<4>[  601.249939]  xe_guc_start+0x26/0x40 [xe]
<4>[  601.249974]  xe_uc_start+0x28/0x30 [xe]
<4>[  601.250024]  do_gt_restart+0x108/0x530 [xe]
<4>[  601.250071]  ? xe_mmio_wait32+0x52/0x110 [xe]
<4>[  601.250113]  gt_reset_worker+0x1e0/0x250 [xe]


> 
>   
> #### Warnings ####
> 
>   * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:
>     - shard-adlp:         [DMESG-FAIL][3] ([Intel XE#1608]) -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-4/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - {shard-lnl}:        [PASS][5] -> [INCOMPLETE][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-lnl-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-lnl-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
>     - {shard-lnl}:        NOTRUN -> [FAIL][7]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
> 
>   * igt@xe_exec_compute_mode@twice-basic:
>     - {shard-lnl}:        NOTRUN -> [INCOMPLETE][8]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-lnl-7/igt@xe_exec_compute_mode@twice-basic.html
> 
>   * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
>     - {shard-lnl}:        [PASS][9] -> [ABORT][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-lnl-7/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-lnl-6/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-134690v4_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:
>     - shard-adlp:         [PASS][11] -> [DMESG-WARN][12] ([Intel XE#1033] / [Intel XE#1214])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition:
>     - shard-adlp:         [PASS][13] -> [DMESG-WARN][14] ([Intel XE#1214] / [Intel XE#1330])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-466/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [PASS][16] -> [DMESG-FAIL][17] ([Intel XE#324])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#619])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [PASS][19] -> [FAIL][20] ([Intel XE#1231]) +2 other tests fail
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-463/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#308])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_legacy@forked-bo@pipe-b:
>     - shard-dg2-set2:     [PASS][27] -> [DMESG-WARN][28] ([Intel XE#1214] / [Intel XE#282]) +4 other tests dmesg-warn
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-dg2-434/igt@kms_cursor_legacy@forked-bo@pipe-b.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-435/igt@kms_cursor_legacy@forked-bo@pipe-b.html
> 
>   * igt@kms_cursor_legacy@forked-move@pipe-b:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][29] ([Intel XE#1214] / [Intel XE#282]) +2 other tests dmesg-warn
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-435/igt@kms_cursor_legacy@forked-move@pipe-b.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#323])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][31] ([Intel XE#1214] / [Intel XE#1551]) +3 other tests dmesg-warn
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-463/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#455]) +6 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
>     - shard-adlp:         [PASS][33] -> [FAIL][34] ([Intel XE#1874]) +7 other tests fail
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#651]) +8 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#653]) +11 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#417])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-466/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:
>     - shard-dg2-set2:     [PASS][38] -> [FAIL][39] ([Intel XE#616]) +1 other test fail
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-dg2-433/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-435/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][40] ([Intel XE#361]) +2 other tests fail
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1122] / [Intel XE#1201]) +1 other test skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#908])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_rpm@drm-resources-equal:
>     - shard-adlp:         [PASS][43] -> [SKIP][44] ([Intel XE#1201] / [Intel XE#1211]) +1 other test skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-8/igt@kms_pm_rpm@drm-resources-equal.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-2/igt@kms_pm_rpm@drm-resources-equal.html
> 
>   * igt@kms_psr@fbc-psr-cursor-plane-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-435/igt@kms_psr@fbc-psr-cursor-plane-move.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][46] -> [FAIL][47] ([Intel XE#899]) +1 other test fail
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-rpm:
>     - shard-adlp:         [PASS][48] -> [SKIP][49] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-rpm.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-rpm.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-1:
>     - shard-adlp:         [PASS][50] -> [SKIP][51] ([Intel XE#1201] / [Intel XE#1207])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-1.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#756])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-435/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfd:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#1126] / [Intel XE#1201])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     NOTRUN -> [TIMEOUT][54] ([Intel XE#1473])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-464/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-dg2-set2:     [PASS][55] -> [INCOMPLETE][56] ([Intel XE#1195] / [Intel XE#1473])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#288]) +6 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-434/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html
> 
>   * igt@xe_exec_reset@gt-reset-stress:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][58] ([Intel XE#1214] / [Intel XE#1638] / [Intel XE#2056])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-433/igt@xe_exec_reset@gt-reset-stress.html
> 
>   * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
>     - shard-dg2-set2:     [PASS][59] -> [FAIL][60] ([Intel XE#1256])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
> 
>   * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][61] ([Intel XE#1999]) +2 other tests fail
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-463/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
>     - shard-adlp:         NOTRUN -> [FAIL][62] ([Intel XE#1999]) +1 other test fail
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-6/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
> 
>   * igt@xe_module_load@reload-no-display:
>     - shard-dg2-set2:     [PASS][63] -> [FAIL][64] ([Intel XE#1204])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-dg2-433/igt@xe_module_load@reload-no-display.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-466/igt@xe_module_load@reload-no-display.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-dg2-set2:     [PASS][65] -> [DMESG-WARN][66] ([Intel XE#1214] / [Intel XE#1551] / [Intel XE#569])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-dg2-435/igt@xe_pm@s3-basic-exec.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-433/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s3-exec-after:
>     - shard-dg2-set2:     [PASS][67] -> [DMESG-WARN][68] ([Intel XE#1214] / [Intel XE#569])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-dg2-464/igt@xe_pm@s3-exec-after.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-463/igt@xe_pm@s3-exec-after.html
> 
>   * igt@xe_pm@s3-vm-bind-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][69] ([Intel XE#1214] / [Intel XE#569])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-435/igt@xe_pm@s3-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s3-vm-bind-unbind-all:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][70] ([Intel XE#1162] / [Intel XE#1214] / [Intel XE#1941])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-435/igt@xe_pm@s3-vm-bind-unbind-all.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-adlp:         [PASS][71] -> [DMESG-WARN][72] ([Intel XE#1214]) +1 other test dmesg-warn
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-2/igt@xe_pm@s4-basic-exec.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-6/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-adlp:         [PASS][73] -> [ABORT][74] ([Intel XE#1358])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-4/igt@xe_pm@s4-exec-after.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-9/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-adlp:         [PASS][75] -> [ABORT][76] ([Intel XE#1358] / [Intel XE#1794])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-6/igt@xe_pm@s4-multiple-execs.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-guc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#1201] / [Intel XE#944])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-guc.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - shard-dg2-set2:     [INCOMPLETE][78] ([Intel XE#1195] / [Intel XE#1451]) -> [PASS][79]
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-dg2-433/igt@core_hotunplug@unbind-rebind.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-435/igt@core_hotunplug@unbind-rebind.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip:
>     - shard-dg2-set2:     [FAIL][80] ([Intel XE#827]) -> [PASS][81] +1 other test pass
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-dg2-466/igt@kms_async_flips@alternate-sync-async-flip.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-434/igt@kms_async_flips@alternate-sync-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         [FAIL][82] ([Intel XE#1204]) -> [PASS][83]
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-adlp:         [FAIL][84] ([Intel XE#1874]) -> [PASS][85] +5 other tests pass
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [FAIL][86] ([Intel XE#1231]) -> [PASS][87] +1 other test pass
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-dg2-set2:     [DMESG-WARN][88] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][89] +1 other test pass
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
>     - shard-dg2-set2:     [DMESG-WARN][90] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][91] +5 other tests pass
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-dg2-433/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-adlp:         [DMESG-FAIL][92] ([Intel XE#324]) -> [PASS][93] +1 other test pass
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
>     - shard-adlp:         [FAIL][94] ([Intel XE#1861]) -> [PASS][95]
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [DMESG-WARN][96] ([Intel XE#1214]) -> [PASS][97] +2 other tests pass
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_pm_dc@dc5-dpms:
>     - shard-dg2-set2:     [FAIL][98] -> [PASS][99]
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-dg2-433/igt@kms_pm_dc@dc5-dpms.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-433/igt@kms_pm_dc@dc5-dpms.html
>     - shard-adlp:         [FAIL][100] ([Intel XE#718]) -> [PASS][101]
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-6/igt@kms_pm_dc@dc5-dpms.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-1/igt@kms_pm_dc@dc5-dpms.html
> 
>   * igt@kms_pm_rpm@i2c:
>     - shard-adlp:         [SKIP][102] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][103] +2 other tests pass
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-1/igt@kms_pm_rpm@i2c.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-6/igt@kms_pm_rpm@i2c.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp:
>     - {shard-lnl}:        [SKIP][104] ([Intel XE#1211]) -> [PASS][105]
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-lnl-5/igt@kms_pm_rpm@modeset-lpsp.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-lnl-4/igt@kms_pm_rpm@modeset-lpsp.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][106] ([Intel XE#899]) -> [PASS][107]
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-dg2-435/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1:
>     - shard-adlp:         [SKIP][108] ([Intel XE#1201]) -> [PASS][109]
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-1/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-2/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-1:
>     - shard-adlp:         [SKIP][110] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][111] +1 other test pass
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-1/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-1.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-2/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-1.html
> 
>   * igt@xe_evict@evict-large-multi-vm-cm:
>     - shard-dg2-set2:     [FAIL][112] ([Intel XE#1600]) -> [PASS][113]
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-dg2-464/igt@xe_evict@evict-large-multi-vm-cm.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html
> 
>   * igt@xe_gt_freq@freq_reset_multiple:
>     - shard-adlp:         [DMESG-WARN][114] ([Intel XE#1214] / [Intel XE#1975]) -> [PASS][115]
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-1/igt@xe_gt_freq@freq_reset_multiple.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-2/igt@xe_gt_freq@freq_reset_multiple.html
> 
>   * igt@xe_pm@s4-vm-bind-userptr:
>     - shard-adlp:         [DMESG-WARN][116] ([Intel XE#1214]) -> [PASS][117]
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-2/igt@xe_pm@s4-vm-bind-userptr.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html
> 
>   * igt@xe_waitfence@abstime:
>     - {shard-lnl}:        [INCOMPLETE][118] -> [PASS][119]
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-lnl-3/igt@xe_waitfence@abstime.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-lnl-3/igt@xe_waitfence@abstime.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [DMESG-FAIL][120] ([Intel XE#324]) -> [FAIL][121] ([Intel XE#1231])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_content_protection@legacy@pipe-a-dp-4:
>     - shard-dg2-set2:     [FAIL][122] ([Intel XE#1178]) -> [INCOMPLETE][123] ([Intel XE#1195]) +1 other test incomplete
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-dg2-466/igt@kms_content_protection@legacy@pipe-a-dp-4.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-463/igt@kms_content_protection@legacy@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][124] ([Intel XE#616]) -> [DMESG-FAIL][125] ([Intel XE#1551]) +1 other test dmesg-fail
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-dg2-433/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-434/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-adlp:         [DMESG-FAIL][126] ([Intel XE#1191] / [Intel XE#1608] / [Intel XE#2034]) -> [DMESG-FAIL][127] ([Intel XE#1608] / [Intel XE#2034])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-6/igt@kms_flip@flip-vs-suspend.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-4/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
>     - shard-adlp:         [FAIL][128] -> [DMESG-FAIL][129] ([Intel XE#1608]) +1 other test dmesg-fail
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
>     - shard-adlp:         [DMESG-FAIL][130] ([Intel XE#1191]) -> [DMESG-FAIL][131] ([Intel XE#1608]) +1 other test dmesg-fail
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-6/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
>     - shard-adlp:         [DMESG-FAIL][132] ([Intel XE#1608]) -> [FAIL][133] ([Intel XE#2028])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp:
>     - shard-adlp:         [SKIP][134] ([Intel XE#1201] / [Intel XE#1211]) -> [SKIP][135] ([Intel XE#1201] / [Intel XE#836])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-9/igt@kms_pm_rpm@modeset-non-lpsp.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-1/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-adlp:         [SKIP][136] ([Intel XE#1201] / [Intel XE#836]) -> [SKIP][137] ([Intel XE#1201] / [Intel XE#1211])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_pm_rpm@system-suspend-modeset:
>     - shard-adlp:         [SKIP][138] ([Intel XE#1201] / [Intel XE#1211]) -> [FAIL][139] ([Intel XE#2027])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-2/igt@kms_pm_rpm@system-suspend-modeset.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-2/igt@kms_pm_rpm@system-suspend-modeset.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2-set2:     [FAIL][140] ([Intel XE#1729]) -> [SKIP][141] ([Intel XE#1201] / [Intel XE#362])
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-adlp:         [DMESG-FAIL][142] ([Intel XE#1191] / [Intel XE#1608]) -> [DMESG-FAIL][143] ([Intel XE#1608])
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:
>     - shard-adlp:         [DMESG-FAIL][144] ([Intel XE#1191]) -> [FAIL][145] ([Intel XE#2023])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][146] ([Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][147] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-dg2-463/igt@xe_evict@evict-threads-large.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-434/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_exec_reset@cm-cat-error:
>     - shard-adlp:         [DMESG-FAIL][148] ([Intel XE#1330] / [Intel XE#1962]) -> [DMESG-FAIL][149] ([Intel XE#1962])
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-9/igt@xe_exec_reset@cm-cat-error.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-6/igt@xe_exec_reset@cm-cat-error.html
> 
>   * igt@xe_gt_freq@freq_suspend:
>     - shard-adlp:         [DMESG-FAIL][150] ([Intel XE#1608] / [Intel XE#1782] / [Intel XE#2034]) -> [FAIL][151] ([Intel XE#2028])
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-9/igt@xe_gt_freq@freq_suspend.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-1/igt@xe_gt_freq@freq_suspend.html
> 
>   * igt@xe_live_ktest@xe_mocs:
>     - shard-adlp:         [SKIP][152] ([Intel XE#1192] / [Intel XE#1201]) -> [FAIL][153] ([Intel XE#1999])
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-6/igt@xe_live_ktest@xe_mocs.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-6/igt@xe_live_ktest@xe_mocs.html
> 
>   * igt@xe_pm@s2idle-basic-exec:
>     - shard-adlp:         [FAIL][154] ([Intel XE#1924]) -> [DMESG-FAIL][155] ([Intel XE#1608]) +1 other test dmesg-fail
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-9/igt@xe_pm@s2idle-basic-exec.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-2/igt@xe_pm@s2idle-basic-exec.html
> 
>   * igt@xe_pm@s2idle-multiple-execs:
>     - shard-adlp:         [DMESG-FAIL][156] ([Intel XE#1608] / [Intel XE#2034]) -> [FAIL][157] ([Intel XE#1924]) +2 other tests fail
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-8/igt@xe_pm@s2idle-multiple-execs.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-4/igt@xe_pm@s2idle-multiple-execs.html
> 
>   * igt@xe_pm@s2idle-vm-bind-prefetch:
>     - shard-adlp:         [DMESG-FAIL][158] -> [DMESG-FAIL][159] ([Intel XE#1608])
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-4/igt@xe_pm@s2idle-vm-bind-prefetch.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s3-mocs:
>     - shard-adlp:         [FAIL][160] ([Intel XE#2028]) -> [DMESG-FAIL][161] ([Intel XE#1608])
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-1/igt@xe_pm@s3-mocs.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-1/igt@xe_pm@s3-mocs.html
> 
>   * igt@xe_pm@s3-vm-bind-userptr:
>     - shard-adlp:         [DMESG-FAIL][162] ([Intel XE#1608]) -> [FAIL][163] ([Intel XE#1924]) +1 other test fail
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-8/igt@xe_pm@s3-vm-bind-userptr.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-8/igt@xe_pm@s3-vm-bind-userptr.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-dg2-set2:     [DMESG-WARN][164] ([Intel XE#1214] / [Intel XE#1760]) -> [SKIP][165] ([Intel XE#1130] / [Intel XE#1201])
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-dg2-464/igt@xe_wedged@wedged-at-any-timeout.html
>     - shard-adlp:         [DMESG-WARN][166] ([Intel XE#1214] / [Intel XE#1760]) -> [DMESG-WARN][167] ([Intel XE#1214] / [Intel XE#1330] / [Intel XE#1760])
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3/shard-adlp-2/igt@xe_wedged@wedged-at-any-timeout.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/shard-adlp-6/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
>   [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1207]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1207
>   [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
>   [Intel XE#1451]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1451
>   [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
>   [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
>   [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>   [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1782
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1899
>   [Intel XE#1901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901
>   [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
>   [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
>   [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
>   [Intel XE#1962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962
>   [Intel XE#1975]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1975
>   [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
>   [Intel XE#2023]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2023
>   [Intel XE#2027]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2027
>   [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
>   [Intel XE#2034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2034
>   [Intel XE#2056]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2056
>   [Intel XE#2070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2070
>   [Intel XE#2071]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2071
>   [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/355
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7881 -> IGT_7882
>   * Linux: xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3 -> xe-pw-134690v4
> 
>   IGT_7881: 7881
>   IGT_7882: 257418cba11c724111fe0e983649763c407e5bc9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1444-950ce28fe0b31a24c5bddcc337aba9554a41cbb3: 950ce28fe0b31a24c5bddcc337aba9554a41cbb3
>   xe-pw-134690v4: 134690v4
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134690v4/index.html
> 
