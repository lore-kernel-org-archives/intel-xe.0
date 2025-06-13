Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EB7C61CE8
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 02:35:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9979910E097;
	Fri, 13 Jun 2025 02:34:58 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 743F310E097;
 Fri, 13 Jun 2025 02:34:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Use_TLB_innvali?=
 =?utf-8?q?dation_context_for_invalidations_issued_from_bind_queues?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Jun 2025 02:34:57 -0000
Message-ID: <174978209747.74585.4439477102058143492@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250612214041.235258-1-matthew.brost@intel.com>
In-Reply-To: <20250612214041.235258-1-matthew.brost@intel.com>
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

Series: drm/xe: Use TLB innvalidation context for invalidations issued from bind queues
URL   : https://patchwork.freedesktop.org/series/150188/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a61608d8edf953d0330e2fcd78bf2074130fa64d
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Jun 12 14:40:41 2025 -0700

    drm/xe: Use TLB innvalidation context for invalidations issued from bind queues
    
    In order to avoid adding tons of invalidation fences to dma-resv
    BOOKKEEP slots, and thus jobs dependencies, when stream of unbinds
    arrives (e.g., many user frees or unmaps), use a dma fence tlb
    invalidation context associated with the queue issuing the bind
    operation.
    
    Two fence contexts are needed - one for each GT as TLB invalidations
    are only ordered on a GT. A per GT ordered wq is needed to queue the
    invalidations to maintain dma fence ordering as well.
    
    This fixes the below splat when the number of invalidations gets out of
    hand:
    
    [ 1661.638258] watchdog: BUG: soft lockup - CPU#2 stuck for 26s!
    [kworker/u65:8:75257]
    [ 1661.638262] Modules linked in: xe drm_gpusvm drm_gpuvm
    drm_ttm_helper ttm drm_exec gpu_sched drm_suballoc_helper drm_buddy
    drm_kms_helper x86_pkg_temp_thermal coretemp snd_hda_cod      ec_realtek
    snd_hda_codec_generic snd_hda_scodec_component mei_pxp mei_hdcp wmi_bmof
    snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hwdep i2c_i801
    snd_hda_core i2c_mux snd_pcm i2c_s      mbus video wmi mei_me mei fuse
    igb e1000e i2c_algo_bit ptp ghash_clmulni_intel pps_core intel_lpss_pci
    [last unloaded: xe]
    [ 1661.638278] CPU: 2 UID: 0 PID: 75257 Comm: kworker/u65:8
    Tainted: G S                  6.16.0-rc1-xe+ #397 PREEMPT(undef)
    [ 1661.638280] Tainted: [S]=CPU_OUT_OF_SPEC
    [ 1661.638280] Hardware name: Intel Corporation Raptor Lake Client
    Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS
    RPLSFWI1.R00.3492.A00.2211291114 11/29/2022
    [ 1661.638281] Workqueue: xe_gt_page_fault_work_queue
    xe_svm_garbage_collector_work_func [xe]
    [ 1661.638311] RIP: 0010:xas_start+0x47/0xd0
    [ 1661.638317] Code: 07 48 8b 57 08 48 8b 40 08 48 89 c1 83 e1 03
    48 83 f9 02 75 08 48 3d 00 10 00 00 77 21 48 85 d2 75 29 48 c7 47 18 00
    00 00 00 <c3> cc cc cc cc 48 c1 fa 02 85 d2       74 c7 31 c0 c3 cc cc
    cc cc 0f b6
    [ 1661.638317] RSP: 0018:ffffc90003d9b968 EFLAGS: 00000297
    [ 1661.638318] RAX: ffff88810459b232 RBX: ffffc90003d9b9a0 RCX:
    0000000000000006
    [ 1661.638319] RDX: 0000000000000009 RSI: 0000000000000003 RDI:
    ffffc90003d9b9a0
    [ 1661.638320] RBP: ffffffffffffffff R08: ffff888197a0a600 R09:
    0000000000000228
    [ 1661.638320] R10: ffffffffffffffff R11: ffffffffffffffc0 R12:
    0000000000000241
    [ 1661.638320] R13: ffffffffffffffff R14: 0000000000000040 R15:
    ffff8881014db000
    [ 1661.638321] FS:  0000000000000000(0000)
    GS:ffff88890aee8000(0000) knlGS:0000000000000000
    [ 1661.638322] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    [ 1661.638322] CR2: 00007fc07287fff8 CR3: 000000000242c003 CR4:
    0000000000f70ef0
    [ 1661.638323] PKRU: 55555554
    [ 1661.638323] Call Trace:
    [ 1661.638325]  <TASK>
    [ 1661.638326]  xas_load+0xd/0xb0
    [ 1661.638328]  xas_find+0x187/0x1d0
    [ 1661.638330]  xa_find_after+0x10f/0x130
    [ 1661.638332]  drm_sched_job_add_dependency+0x80/0x1e0
    [gpu_sched]
    [ 1661.638335]  drm_sched_job_add_resv_dependencies+0x62/0x120
    [gpu_sched]
    [ 1661.638337]  xe_pt_vm_dependencies+0x5b/0x2f0 [xe]
    [ 1661.638359]  xe_pt_svm_pre_commit+0x59/0x1a0 [xe]
    [ 1661.638376]  xe_migrate_update_pgtables+0x67f/0x910 [xe]
    [ 1661.638397]  ? xe_pt_stage_unbind+0x92/0xd0 [xe]
    [ 1661.638416]  xe_pt_update_ops_run+0x12e/0x7f0 [xe]
    [ 1661.638433]  ops_execute+0x1b1/0x430 [xe]
    [ 1661.638449]  xe_vm_range_unbind+0x260/0x2a0 [xe]
    [ 1661.638465]  xe_svm_garbage_collector+0xfe/0x1c0 [xe]
    [ 1661.638478]  xe_svm_garbage_collector_work_func+0x25/0x30 [xe]
    [ 1661.638491]  process_one_work+0x16b/0x2e0
    [ 1661.638495]  worker_thread+0x284/0x410
    [ 1661.638496]  ? __pfx_worker_thread+0x10/0x10
    [ 1661.638496]  kthread+0xe9/0x210
    [ 1661.638498]  ? __pfx_kthread+0x10/0x10
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 07cb1c19ef8056f2f964909c9273b3c45049760e drm-intel
a61608d8edf9 drm/xe: Use TLB innvalidation context for invalidations issued from bind queues
-:322: WARNING:MISSING_FIXES_TAG: The commit message has 'Call Trace:', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 193 lines checked


