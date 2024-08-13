Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F552C52D7C
	for <intel-xe@archiver.kernel.org>; Tue, 13 Aug 2024 10:47:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D18F710E2E6;
	Tue, 13 Aug 2024 10:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aj5DwPDR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FCF10E2E7
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Aug 2024 10:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723546069; x=1755082069;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=fXqq2Hel8tORpDuQqonQAmoLRDAt/wXC2ogO3HAbOys=;
 b=aj5DwPDRhrx/bpxnc5YGN73oA+c78ZfpIh5BK8PVAuhcBEO8OM0NixTD
 oq5nFmp6Ppv+q7s77jYEWfx//PHmcP7/ZqnNpu+B5OsdjHeuZDXuyls8m
 O60yX+BII8jrfWBJ7ShftwiKoOl8aI/pg/8lz14fyfpOaQOYcTIsmEhJy
 HFwhHf6jcHwqmLusueOSnLIXi86YTgmfRg4g5grgxb6uOJXTS02xI1l+K
 PuQ1bYZ7gczpAyeCZuC8789Ju09DzZYqcIMbton/UVep6ZfhVJylaH1LH
 T/Ff5z12BD+RtbaLovI6fxl9Z8WFkNbpLd0E1YP/h0ZEvFiHkL4k8IF9+ g==;
X-CSE-ConnectionGUID: F8WeiScFQFu2FuiJ/OuN7A==
X-CSE-MsgGUID: 1l6Q6qs7RTSjB/GXQUs1QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21673101"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="21673101"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 03:47:30 -0700
X-CSE-ConnectionGUID: doBfAH/qSr2TltAjGV23PQ==
X-CSE-MsgGUID: Pbg9wC5ST6GYTGjjRwgK4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="58504517"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.234])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 03:47:29 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [RFC PATCH 0/1] Add driver load error injection
In-Reply-To: <20240809224424.3212551-1-matthew.brost@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240809224424.3212551-1-matthew.brost@intel.com>
Date: Tue, 13 Aug 2024 13:47:26 +0300
Message-ID: <87wmkkzold.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 09 Aug 2024, Matthew Brost <matthew.brost@intel.com> wrote:
> Start porting over driver load error injectin from the i915. Eventually
> idea would be make this error injection a bit more generic (drm level,
> or kernel level) but to ensure a stable driver starting with the i915
> implementation.
>
> Not complete as many more injection points need to be added.

Please also bolt this into __i915_inject_probe_error() in
display/ext/i915_utils.c, exercising all the display error handling with
xe too.

BR,
Jani.


>
> Can be tested with:
> for i in {1..200}; do echo "Run $i"; modprobe xe inject_driver_load_error=$i; rmmod xe; done
>
> Will need to a version of this series [1] to avoid lockdep turning off
> after 30ish module loads.
>
> Kernel is currently blowing up on injection point #11 on TGL w/o
> display, will need to start debug their. Stack trace below.
>
> [  196.326118] Setting dangerous option inject_driver_load_error - tainting kernel
> [  196.328408] xe 0000:00:02.0: vgaarb: deactivate vga console
> [  196.328975] xe 0000:00:02.0: [drm:xe_pci_probe [xe]] TIGERLAKE  9a49:0001 dgfx:0 gfx:Xe_LP (12.00) media:Xe_M (12.00) display:no dma_m_s:39 tc:1 gscfi:0 cscfi:0
> [  196.329016] xe 0000:00:02.0: [drm:xe_pci_probe [xe]] Stepping = (G:B0, M:B0, D:D0, B:**)
> [  196.329039] xe 0000:00:02.0: [drm:xe_pci_probe [xe]] SR-IOV support: no (mode: none)
> [  196.330746] xe 0000:00:02.0: [drm] Using GuC firmware from i915/tgl_guc_70.bin version 70.30.0
> [  196.331047] xe 0000:00:02.0: [drm] Injecting failure -19 at checkpoint 11 [xe_guc_log_init:98]
> [  196.331050] xe 0000:00:02.0: [drm] *ERROR* GT0: GuC init failed with -ENODEV
> [  196.338208] xe 0000:00:02.0: [drm] *ERROR* GT0: Failed to initialize uC (-ENODEV)
> [  196.347009] BUG: unable to handle page fault for address: 000000000000a188
> [  196.353903] #PF: supervisor write access in kernel mode
> [  196.359138] #PF: error_code(0x0002) - not-present page
> [  196.364289] PGD 0 P4D 0
> [  196.366842] Oops: Oops: 0002 [#1] PREEMPT SMP NOPTI
> [  196.371735] CPU: 6 UID: 0 PID: 1233 Comm: modprobe Tainted: G     U             6.11.0-rc2-xe+ #3796
> [  196.380875] Tainted: [U]=USER
> [  196.383857] Hardware name: Intel Corporation Tiger Lake Client Platform/TigerLake U DDR4 SODIMM RVP, BIOS TGLSFWI1.R00.3243.A01.2006102133 06/10/2020
> [  196.397237] RIP: 0010:xe_mmio_write32+0x67/0x290 [xe]
> [  196.402332] Code: 48 0f a3 05 c3 c9 5b e2 0f 82 c6 00 00 00 45 89 e6 41 c1 ee 18 41 f7 c4 00 00 00 40 74 7f 45 84 f6 78 74 49 8b 47 28 48 01 c3 <44> 89 2b 48 83 c4 58 5b 5d 41 5c 41 5d 41 5e 41 5f c3 cc cc cc cc
> [  196.421085] RSP: 0018:ffffc9000152b820 EFLAGS: 00010006
> [  196.426322] RAX: 0000000000000000 RBX: 000000000000a188 RCX: 0000000000000000
> [  196.433466] RDX: 0000000000010001 RSI: ffffffff82426f19 RDI: ffffffff824343c6
> [  196.440608] RBP: ffff888152678028 R08: 00000000000d6398 R09: 0000000000000001
> [  196.447748] R10: 00000000ffffffff R11: ffff888152628000 R12: 000000000000a188
> [  196.454893] R13: 0000000000010001 R14: 0000000000000000 R15: ffff88815262a308
> [  196.462037] FS:  00007ff3ae103000(0000) GS:ffff88849fb80000(0000) knlGS:0000000000000000
> [  196.470137] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  196.475893] CR2: 000000000000a188 CR3: 0000000156d2a004 CR4: 0000000000f70ef0
> [  196.483036] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  196.490177] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [  196.497323] PKRU: 55555554
> [  196.500051] Call Trace:
> [  196.502517]  <TASK>
> [  196.504640]  ? __die+0x1f/0x70
> [  196.507719]  ? page_fault_oops+0x155/0x470
> [  196.511831]  ? stack_trace_save+0x49/0x70
> [  196.515861]  ? do_user_addr_fault+0x63/0x720
> [  196.520151]  ? exc_page_fault+0x63/0x1d0
> [  196.524091]  ? asm_exc_page_fault+0x26/0x30
> [  196.528293]  ? xe_mmio_write32+0x67/0x290 [xe]
> [  196.532777]  xe_force_wake_get+0xc8/0x2b0 [xe]
> [  196.537260]  ? lock_acquire+0xcd/0x300
> [  196.541031]  xe_gt_tlb_invalidation_ggtt+0xa8/0x310 [xe]
> [  196.546380]  ? rcu_is_watching+0x11/0x50
> [  196.550322]  ? __mutex_lock+0x12f/0xd70
> [  196.554179]  ? find_held_lock+0x2b/0x80
> [  196.558031]  ? xe_ggtt_remove_node+0xbf/0xf0 [xe]
> [  196.562772]  xe_ggtt_invalidate+0x19/0x80 [xe]
> [  196.567251]  xe_ggtt_remove_node+0xdf/0xf0 [xe]
> [  196.571818]  xe_ttm_bo_destroy+0x11a/0x220 [xe]
> [  196.576388]  drm_managed_release+0xb0/0x160
> [  196.580593]  devm_drm_dev_init_release+0x54/0x70
> [  196.585232]  release_nodes+0x2e/0xf0
> [  196.588827]  devres_release_all+0x8a/0xc0
> [  196.592858]  device_unbind_cleanup+0x9/0x70
> [  196.597058]  really_probe+0x1a0/0x380
> [  196.600740]  __driver_probe_device+0x73/0x150
> [  196.605108]  driver_probe_device+0x19/0x90
> [  196.609222]  __driver_attach+0xd5/0x1d0
> [  196.613073]  ? __pfx___driver_attach+0x10/0x10
> [  196.617534]  bus_for_each_dev+0x77/0xd0
> [  196.621389]  bus_add_driver+0x110/0x240
> [  196.625238]  driver_register+0x5b/0x110
> [  196.629086]  xe_init+0x3b/0x80 [xe]
> [  196.632615]  ? __pfx_xe_init+0x10/0x10 [xe]
> [  196.636829]  do_one_initcall+0x5e/0x2b0
> [  196.640683]  ? rcu_is_watching+0x11/0x50
> [  196.644622]  ? __kmalloc_cache_noprof+0x24e/0x2f0
> [  196.649343]  do_init_module+0x5f/0x210
> [  196.653113]  init_module_from_file+0x86/0xd0
> [  196.657402]  idempotent_init_module+0x17c/0x230
> [  196.661946]  __x64_sys_finit_module+0x59/0xb0
> [  196.666323]  do_syscall_64+0x68/0x140
> [  196.670006]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
> Matt
>
> [1] https://patchwork.freedesktop.org/series/136701/
>
>
> Matthew Brost (1):
>   drm/xe: Add driver load error injection
>
>  drivers/gpu/drm/xe/xe_device.c       | 31 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_device.h       | 15 ++++++++++++++
>  drivers/gpu/drm/xe/xe_device_types.h |  4 ++++
>  drivers/gpu/drm/xe/xe_gt.c           |  5 +++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c  |  4 ++++
>  drivers/gpu/drm/xe/xe_guc.c          |  8 +++++++
>  drivers/gpu/drm/xe/xe_guc_ads.c      |  5 +++++
>  drivers/gpu/drm/xe/xe_guc_ct.c       |  4 ++++
>  drivers/gpu/drm/xe/xe_guc_log.c      |  5 +++++
>  drivers/gpu/drm/xe/xe_mmio.c         |  5 +++++
>  drivers/gpu/drm/xe/xe_module.c       |  5 +++++
>  drivers/gpu/drm/xe/xe_module.h       |  3 +++
>  drivers/gpu/drm/xe/xe_pci.c          |  9 ++++++++
>  drivers/gpu/drm/xe/xe_pm.c           |  8 +++++++
>  drivers/gpu/drm/xe/xe_sriov.c        |  8 ++++++-
>  drivers/gpu/drm/xe/xe_tile.c         |  4 ++++
>  drivers/gpu/drm/xe/xe_uc.c           |  4 ++++
>  drivers/gpu/drm/xe/xe_wa.c           |  5 +++++
>  drivers/gpu/drm/xe/xe_wopcm.c        |  4 ++++
>  19 files changed, 135 insertions(+), 1 deletion(-)

-- 
Jani Nikula, Intel
