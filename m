Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B478FC6FD1C
	for <intel-xe@archiver.kernel.org>; Fri, 24 Mar 2023 07:37:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CF2B10E516;
	Fri, 24 Mar 2023 07:37:12 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A66010E516
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Mar 2023 07:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679643430; x=1711179430;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=daQURZVqEV7FXpzZn5qT1UMzoIM4PzzcE06MexbTCQY=;
 b=QDu7baq3FsD8P7+ULQthng7i9Ivm8rY0X9IrqlZ97rlZdmwDr+0nRod7
 vYmqYfQXh1AXZWpuhcAFAHP6B+iUPAPlxwDrwnygdT76ySnaT0WwPsl2G
 9KQi+Gha3q7I1HeHh6SBsHjooqYRFHFxpjjVoVlOERUwWghAdxZ4mLp1B
 vhcLOC2k4N+Wy7nCGuz/chryBvYkEFRIZpygIM5xoShTdMHGbyPn0jw/Y
 V9TE1DYs+4XwyiKEoOth9LxxxARO0A5s20jWcsOoXBuYP3YXb2hhPX9q9
 ArLz3HjvhYo76gKjI0olPvre3/zjjnMvO3N09jks9LX/bSWqoy4yPQTDV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="328131642"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="328131642"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 00:37:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="928557346"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; d="scan'208";a="928557346"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 24 Mar 2023 00:37:08 -0700
Received: from maurocar-mobl2 (hvanhaar-mobl.ger.corp.intel.com [10.252.27.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 12A1C580BF1;
 Fri, 24 Mar 2023 00:37:06 -0700 (PDT)
Date: Fri, 24 Mar 2023 08:37:04 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: "Chang, Yu bruce" <yu.bruce.chang@intel.com>
Message-ID: <20230324083704.645a667c@maurocar-mobl2>
In-Reply-To: <PH8PR11MB6950295C09940BD29EE7EF52C3879@PH8PR11MB6950.namprd11.prod.outlook.com>
References: <20230323202313.3523-1-yu.bruce.chang@intel.com>
 <ZBzYPLlnwL86qo0d@DUT025-TGLU.fm.intel.com>
 <PH8PR11MB6950295C09940BD29EE7EF52C3879@PH8PR11MB6950.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: don't auto fall back to execlist
 mode if guc failed to init
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 23 Mar 2023 23:08:58 +0000
"Chang, Yu bruce" <yu.bruce.chang@intel.com> wrote:

> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Thursday, March 23, 2023 3:53 PM
> > To: Chang, Yu bruce <yu.bruce.chang@intel.com>
> > Cc: intel-xe@lists.freedesktop.org
> > Subject: Re: [Intel-xe] [PATCH] drm/xe: don't auto fall back to execlist mode
> > if guc failed to init
> > 
> > On Thu, Mar 23, 2023 at 08:23:13PM +0000, Chang, Bruce wrote:  
> > > In general, this is due to FW load failure, should just report error
> > > and fail the probe so that user can easily retry again.
> > >
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>  
> > 
> > I have not tested this but assuming you did:
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> >   
> Yes, I tested on PVC and it used to fall back to execlist mode and constantly 
> print out EXECLIST_STATUS. Now all those are not showing after this change.
> 
> There is still other unrelated issues during __pfx_ggtt_fini_noalloc, and need
> to be fixed as below.
> 
> [  223.839894] BUG: KASAN: null-ptr-deref in ttm_resource_free+0xe4/0x140 [ttm]
> [  223.847211] Read of size 8 at addr 0000000000000018 by task systemd-udevd/566
> 
> [  223.856141] CPU: 0 PID: 566 Comm: systemd-udevd Not tainted 6.2.0-xe+ #4
> [  223.864921] Hardware name: Intel Corporation WilsonCity/WilsonCity, BIOS WLYDCRB1.SYS.0020.P84.2103030140 03/03/2021
> [  223.877365] Call Trace:
> [  223.881707]  <TASK>
> [  223.885658]  dump_stack_lvl+0x5b/0x85
> [  223.891200]  print_report+0x499/0x4aa
> [  223.896690]  ? ttm_resource_free+0xe4/0x140 [ttm]
> [  223.903268]  kasan_report+0x99/0x1a0
> [  223.908683]  ? ttm_resource_free+0xe4/0x140 [ttm]
> [  223.915210]  ttm_resource_free+0xe4/0x140 [ttm]
> [  223.921621]  ttm_bo_release+0x3e5/0x550 [ttm]
> [  223.927811]  ? __pfx_ttm_bo_release+0x10/0x10 [ttm]
> [  223.934530]  ? ttm_bo_kunmap+0x11f/0x160 [ttm]
> [  223.940775]  ? __pfx_ggtt_fini_noalloc+0x10/0x10 [xe]

Xe driver release is currently buggy. there's a just added test on
IGT that load/unload the driver 10 times[1].

[1] this is a good way to check if object references are properly 
    released and that the object lifetime cycle is correct.

This is what happens if you run it (tested on TGL):

	$ sudo ./build/tests/xe_module_load --run many-reload --debug
	IGT-Version: 1.27.1-g0682c2b07c7e (x86_64) (Linux: 6.2.0-xe-1ae4dd9e8+ x86_64)
	Starting subtest: many-reload
	(xe_module_load:3070) DEBUG: reload cycle: 0
	(xe_module_load:3070) igt_kmod-DEBUG: Module mei_pxp unloaded immediately
	(xe_module_load:3070) igt_kmod-DEBUG: Module mei_hdcp unloaded immediately
	(xe_module_load:3070) igt_kmod-DEBUG: Module drm_kms_helper could not be found or does not exist. err: -2
	(xe_module_load:3070) igt_kmod-DEBUG: Could not remove module drm_kms_helper (No such file or directory)
	(xe_module_load:3070) igt_kmod-DEBUG: Module drm unloaded immediately
	(xe_module_load:3070) DEBUG: reload cycle: 1
	(xe_module_load:3070) igt_kmod-DEBUG: Module snd_hda_intel unloaded immediately
	(xe_module_load:3070) igt_kmod-DEBUG: Module xe unloaded immediately
	(xe_module_load:3070) igt_kmod-DEBUG: Module drm_display_helper unloaded immediately
	(xe_module_load:3070) igt_kmod-DEBUG: Module drm_kms_helper unloaded immediately
	(xe_module_load:3070) igt_kmod-DEBUG: Module gpu_sched unloaded immediately
	(xe_module_load:3070) igt_kmod-DEBUG: Module drm_suballoc_helper unloaded immediately
	(xe_module_load:3070) igt_kmod-DEBUG: Module drm_buddy unloaded immediately
	(xe_module_load:3070) igt_kmod-DEBUG: Module drm_ttm_helper unloaded immediately
	(xe_module_load:3070) igt_kmod-DEBUG: Module ttm unloaded immediately
	(xe_module_load:3070) igt_kmod-DEBUG: Module drm unloaded immediately
	(xe_module_load:3070) DEBUG: reload cycle: 2
	(xe_module_load:3070) igt_kmod-DEBUG: Module snd_hda_intel unloaded immediately
	(xe_module_load:3070) igt_kmod-DEBUG: Module xe unloaded immediately
	(xe_module_load:3070) igt_kmod-DEBUG: Module drm_display_helper unloaded immediately
	(xe_module_load:3070) igt_kmod-DEBUG: Module drm_kms_helper unloaded immediately
	(xe_module_load:3070) igt_kmod-DEBUG: Module gpu_sched unloaded immediately
	(xe_module_load:3070) igt_kmod-DEBUG: Module drm_suballoc_helper unloaded immediately
	(xe_module_load:3070) igt_kmod-DEBUG: Module drm_buddy unloaded immediately
	(xe_module_load:3070) igt_kmod-DEBUG: Module drm_ttm_helper unloaded immediately
	(xe_module_load:3070) igt_kmod-DEBUG: Module ttm unloaded immediately
	(xe_module_load:3070) igt_kmod-DEBUG: Module drm unloaded immediately
	...

See the dmesg for the above below.

Regards,
Mauro

Dmesg:

[  330.190943] **********************************************************
[  330.190947] **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
[  330.190951] **                                                      **
[  330.190955] ** trace_printk() being used. Allocating extra memory.  **
[  330.190959] **                                                      **
[  330.190962] ** This means that this is a DEBUG kernel and it is     **
[  330.190966] ** unsafe for production use.                           **
[  330.190970] **                                                      **
[  330.190974] ** If you see this message and you are not debugging    **
[  330.190977] ** the kernel, report this immediately to your vendor!  **
[  330.190981] **                                                      **
[  330.190985] **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
[  330.190988] **********************************************************
[  330.260128] xe 0000:00:02.0: vgaarb: deactivate vga console
[  330.302169] xe 0000:00:02.0: vgaarb: deactivate vga console
[  330.306461] xe 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=io+mem:owns=io+mem
[  330.312251] GT topology dss mask (geometry): 00000000,0000003f
[  330.312259] GT topology dss mask (compute):  00000000,00000000
[  330.312264] GT topology EU mask per DSS:     0000ffff
[  330.321566] xe 0000:00:02.0: [drm] Finished loading DMC firmware i915/tgl_dmc_ver2_12.bin (v2.12)
[  330.682290] xe REG[0x2340-0x235f]: allow read access
[  330.682307] xe REG[0x7010-0x7017]: allow rw access
[  330.682334] xe REG[0x7018-0x701f]: allow rw access
[  330.683282] xe REG[0x223a8-0x223af]: allow read access
[  330.684245] xe REG[0x1c03a8-0x1c03af]: allow read access
[  330.685168] xe REG[0x1d03a8-0x1d03af]: allow read access
[  330.686083] xe REG[0x1c83a8-0x1c83af]: allow read access
[  330.805598] [drm] Initialized xe 1.1.0 20201103 for 0000:00:02.0 on minor 0
[  331.008489] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
[  331.056568] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input8
[  331.064576] xe 0000:00:02.0: [drm] Cannot find any crtc or sizes
[  331.075111] xe 0000:00:02.0: [drm] Cannot find any crtc or sizes
[  331.077136] xe 0000:00:02.0: [drm] Cannot find any crtc or sizes
[  331.321351] snd_hda_intel 0000:00:1f.3: enabling device (0000 -> 0002)
[  331.340407] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [xe])
[  331.469991] input: HDA Intel PCH HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input9
[  331.473074] input: HDA Intel PCH HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input10
[  331.476405] input: HDA Intel PCH HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input11
[  331.478857] input: HDA Intel PCH HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input12
[  334.010143] ACPI: bus type drm_connector unregistered
[  334.130906] ACPI: bus type drm_connector registered
[  334.656848] xe 0000:00:02.0: vgaarb: deactivate vga console
[  334.683973] xe 0000:00:02.0: vgaarb: deactivate vga console
[  334.690364] GT topology dss mask (geometry): 00000000,0000003f
[  334.690373] GT topology dss mask (compute):  00000000,00000000
[  334.690377] GT topology EU mask per DSS:     0000ffff
[  334.692551] xe 0000:00:02.0: [drm] Finished loading DMC firmware i915/tgl_dmc_ver2_12.bin (v2.12)
[  335.042555] xe REG[0x2340-0x235f]: allow read access
[  335.042574] xe REG[0x7010-0x7017]: allow rw access
[  335.042580] xe REG[0x7018-0x701f]: allow rw access
[  335.043634] xe REG[0x223a8-0x223af]: allow read access
[  335.044892] xe REG[0x1c03a8-0x1c03af]: allow read access
[  335.045951] xe REG[0x1d03a8-0x1d03af]: allow read access
[  335.047052] xe REG[0x1c83a8-0x1c83af]: allow read access
[  335.120059] [drm] Initialized xe 1.1.0 20201103 for 0000:00:02.0 on minor 0
[  335.283192] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
[  335.342193] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input13
[  335.349695] xe 0000:00:02.0: [drm] Cannot find any crtc or sizes
[  335.363384] xe 0000:00:02.0: [drm] Cannot find any crtc or sizes
[  335.365528] xe 0000:00:02.0: [drm] Cannot find any crtc or sizes
[  335.414725] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [xe])
[  336.447397] snd_hda_intel 0000:00:1f.3: azx_get_response timeout, switching to polling mode: last cmd=0x200f0000
[  337.448522] snd_hda_intel 0000:00:1f.3: No response from codec, disabling MSI: last cmd=0x200f0000
[  338.456521] snd_hda_intel 0000:00:1f.3: Codec #2 probe error; disabling it...
[  339.463518] snd_hda_intel 0000:00:1f.3: azx_get_response timeout, switching to single_cmd mode: last cmd=0x200f0000
[  339.465715] hdaudio hdaudioC0D2: no AFG or MFG node found
[  339.466992] snd_hda_intel 0000:00:1f.3: no codecs initialized
[  339.475013] ==================================================================
[  339.475109] BUG: KASAN: use-after-free in snd_card_free+0x99/0x130
[  339.475125] Read of size 1 at addr ffff88814252ccda by task xe_module_load/3070
[  339.475143] CPU: 1 PID: 3070 Comm: xe_module_load Not tainted 6.2.0-xe-1ae4dd9e8+ #2
[  339.475157] Hardware name: Intel(R) Client Systems NUC11TNHi7/NUC11TNBi7, BIOS TNTGL357.0062.2021.1203.1108 12/03/2021
[  339.475171] Call Trace:
[  339.475179]  <TASK>
[  339.475186]  dump_stack_lvl+0x5b/0x85
[  339.475197]  print_report+0x171/0x4aa
[  339.475210]  ? snd_card_free+0x99/0x130
[  339.475219]  kasan_report+0x99/0x1a0
[  339.475230]  ? snd_card_free+0x99/0x130
[  339.475243]  snd_card_free+0x99/0x130
[  339.475263]  ? __pfx_snd_card_free+0x10/0x10
[  339.475278]  ? azx_remove+0xb4/0xe0 [snd_hda_intel]
[  339.475303]  pci_device_remove+0x66/0x100
[  339.475316]  device_release_driver_internal+0xfa/0x1c0
[  339.475330]  unbind_store+0x13c/0x160
[  339.475340]  ? __pfx_sysfs_kf_write+0x10/0x10
[  339.475351]  kernfs_fop_write_iter+0x1bc/0x260
[  339.475363]  vfs_write+0x57d/0x760
[  339.475374]  ? __pfx_vfs_write+0x10/0x10
[  339.475388]  ? __fget_light+0x9e/0x100
[  339.475399]  ksys_write+0xc7/0x170
[  339.475409]  ? __pfx_ksys_write+0x10/0x10
[  339.475421]  ? lockdep_hardirqs_on_prepare+0x128/0x230
[  339.475433]  ? syscall_enter_from_user_mode+0x21/0x50
[  339.475446]  do_syscall_64+0x3c/0x90
[  339.475457]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
[  339.475469] RIP: 0033:0x7ff883d14a37
[  339.475479] Code: 10 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
[  339.475504] RSP: 002b:00007ffcaa4f7068 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
[  339.475520] RAX: ffffffffffffffda RBX: 0000561562a83f58 RCX: 00007ff883d14a37
[  339.475532] RDX: 000000000000000c RSI: 0000561562a83f6b RDI: 0000000000000003
[  339.475544] RBP: 0000561562a83e80 R08: 0000000000000033 R09: 00007ffcaa4f6ef0
[  339.475556] R10: 0000000000000100 R11: 0000000000000246 R12: 00007ffcaa4f7100
[  339.475568] R13: 0000000000000003 R14: 0000561562a83f6b R15: 00007ff88415b040
[  339.475583]  </TASK>
[  339.475596] Allocated by task 3070:
[  339.475605]  kasan_save_stack+0x22/0x50
[  339.475608]  kasan_set_track+0x25/0x30
[  339.475612]  __kasan_kmalloc+0x82/0x90
[  339.475615]  __kmalloc+0x5f/0x1b0
[  339.475619]  snd_card_new+0x60/0xc0
[  339.475623]  azx_probe+0x14c/0xf90 [snd_hda_intel]
[  339.475632]  pci_device_probe+0x100/0x210
[  339.475636]  really_probe+0x143/0x4d0
[  339.475639]  __driver_probe_device+0xc7/0x220
[  339.475643]  driver_probe_device+0x49/0xf0
[  339.475646]  __driver_attach+0x101/0x200
[  339.475650]  bus_for_each_dev+0xeb/0x150
[  339.475653]  bus_add_driver+0x2a0/0x2f0
[  339.475656]  driver_register+0xdc/0x170
[  339.475660]  do_one_initcall+0xbd/0x400
[  339.475664]  do_init_module+0xe4/0x320
[  339.475668]  load_module+0x3011/0x3320
[  339.475671]  __do_sys_finit_module+0x110/0x1b0
[  339.475675]  do_syscall_64+0x3c/0x90
[  339.475678]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
[  339.475687] Freed by task 89:
[  339.475695]  kasan_save_stack+0x22/0x50
[  339.475698]  kasan_set_track+0x25/0x30
[  339.475701]  kasan_save_free_info+0x2e/0x50
[  339.475705]  __kasan_slab_free+0x109/0x1a0
[  339.475708]  __kmem_cache_free+0x221/0x400
[  339.475712]  device_release+0x5a/0xf0
[  339.475715]  kobject_put+0xde/0x270
[  339.475719]  snd_card_free+0x114/0x130
[  339.475722]  process_one_work+0x527/0x9d0
[  339.475727]  worker_thread+0x2d1/0x640
[  339.475730]  kthread+0x183/0x1c0
[  339.475734]  ret_from_fork+0x29/0x50
[  339.475743] The buggy address belongs to the object at ffff88814252c000
                which belongs to the cache kmalloc-4k of size 4096
[  339.475762] The buggy address is located 3290 bytes inside of
                4096-byte region [ffff88814252c000, ffff88814252d000)
[  339.475786] The buggy address belongs to the physical page:
[  339.475796] page:ffffea0005094a00 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x142528
[  339.475801] head:ffffea0005094a00 order:3 compound_mapcount:0 subpages_mapcount:0 compound_pincount:0
[  339.475804] flags: 0x4000000000010200(slab|head|zone=2)
[  339.475810] raw: 4000000000010200 ffff8881000433c0 ffffea0004c77210 ffffea0004abb410
[  339.475813] raw: 0000000000000000 0000000000020002 00000001ffffffff 0000000000000000
[  339.475816] page dumped because: kasan: bad access detected
[  339.475824] Memory state around the buggy address:
[  339.475833]  ffff88814252cb80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  339.475846]  ffff88814252cc00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  339.475858] >ffff88814252cc80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  339.475870]                                                     ^
[  339.475881]  ffff88814252cd00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  339.475894]  ffff88814252cd80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  339.475906] ==================================================================
[  339.475932] Disabling lock debugging due to kernel taint
[  340.320483] ACPI: bus type drm_connector unregistered
[  340.438735] ACPI: bus type drm_connector registered
...
