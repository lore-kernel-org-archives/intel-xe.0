Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6861CE7A94
	for <intel-xe@archiver.kernel.org>; Mon, 25 Sep 2023 13:12:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70B610E170;
	Mon, 25 Sep 2023 13:12:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA78110E170
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Sep 2023 13:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695647562; x=1727183562;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=++du6zrTKqbJ6H6/DVHB3rriIpqQB18X4GU5OeIFYDA=;
 b=XLxXLt6edZOTSkwvXXBL4kHUxs4Sk6IiLRiEpWd9wXz0Rj8sL7zx9cPV
 NtJkBqTYg8AQYq63fDqhJgsGqK/eGfJGmwi5DudghOTefjCDjQ5rW7bDa
 R+Lap3tMrSuwhF3yLRWaqHgvABEw9evwcckomT/ez0pKHMD9HFicAnNgV
 aCkTncG+W9DkcMFKzbTy6G6JoZ2dwq7crFE7mIoJa2Allny63FQ1jCufo
 6pAW1XkLzE2MnIan2IRU3/cB+XucSgTcq3ePBWw4jXTB0tZQw1Rt5VeFs
 BWASYXNz2yZP5cRWQSe9M7j1eP3KHfhrVYPRQaTT7ttTiFDvWF0ckaPbu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="445356679"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="445356679"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 06:12:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="1079199283"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="1079199283"
Received: from ngorb-mobl.ger.corp.intel.com (HELO [10.252.27.97])
 ([10.252.27.97])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 06:12:40 -0700
Message-ID: <2b2bfa52-bffd-1adc-8f63-16d2bfcda51a@intel.com>
Date: Mon, 25 Sep 2023 14:12:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-GB
To: "Souza, Jose" <jose.souza@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230914153112.455547-8-matthew.auld@intel.com>
 <8130c42f6a0a562a7fe8578f0e8e1f93da609577.camel@intel.com>
 <14454c9aa6b951cecd5832e4d8549c0699bdea56.camel@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <14454c9aa6b951cecd5832e4d8549c0699bdea56.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2 0/6] PAT and cache coherency support
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

On 21/09/2023 18:19, Souza, Jose wrote:
> On Mon, 2023-09-18 at 15:51 +0000, Souza, Jose wrote:
>> On Thu, 2023-09-14 at 16:31 +0100, Matthew Auld wrote:
>>> Branch available here (lightly tested):
>>> https://gitlab.freedesktop.org/mwa/kernel/-/tree/xe-pat-index?ref_type=heads
>>>
>>> Series still needs some more testing. Also note that the series directly depends
>>> on the WIP patch here: https://patchwork.freedesktop.org/series/122708/
>>>
>>> Goal here is to allow userspace to directly control the pat_index when mapping
>>> memory via the ppGTT, in addtion to the CPU caching mode for system memory. This
>>> is very much needed on newer igpu platforms which allow incoherent GT access,
>>> where the choice over the cache level and expected coherency is best left to
>>> userspace depending on their usecase.  In the future there may also be other
>>> stuff encoded in the pat_index, so giving userspace direct control will also be
>>> needed there.
>>>
>>> To support this we added new gem_create uAPI for selecting the CPU cache
>>> mode to use for system memory, including the expected GPU coherency mode. There
>>> are various restrictions here for the selected coherency mode and compatible CPU
>>> cache modes.  With that in place the actual pat_index can now be provided as
>>> part of vm_bind. The only restriction is that the coherency mode of the
>>> pat_index must be at least as coherent as the gem_create coherency mode. There
>>> are also some special cases like with userptr and dma-buf.
>>>
>>> v2:
>>>    - Loads of improvements/tweaks. Main changes are to now allow
>>>      gem_create.coh_mode <= coh_mode(pat_index), rather than it needing to match
>>>      exactly. This simplifies the dma-buf policy from userspace pov. Also we now
>>>      only consider COH_NONE and COH_AT_LEAST_1WAY.
>>>
>>
>>
>> Getting constant DMAR errors after loading Xe KMD on TGL with your branch in framebuffer console, logs attached.
>>
>>
> 
> Another issue report, when starting Xorg I'm getting this KMD crash with your branch:

Thanks for the reports Jose. Hopefully both issues are now fixed. Just 
pushed an updated branch.

> 
> [ 2376.624393] xe 0000:00:02.0: [drm:intel_hdmi_detect [xe]] [CONNECTOR:347:HDMI-A-3]
> [ 2376.624465] [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:347:HDMI-A-3] disconnected
> [ 2376.726753] xe 0000:00:02.0: [drm:intel_power_well_disable [xe]] disabling TC_cold_off
> [ 2376.727183] xe 0000:00:02.0: [drm:__intel_display_power_put_domain [xe]] TC cold unblock succeeded
> [ 2378.896672] dmar_fault: 915847 callbacks suppressed
> [ 2378.896675] DMAR: DRHD: handling fault status reg 3
> [ 2378.896684] DMAR: [DMA Read NO_PASID] Request device [00:02.0] fault addr 0x70600000 [fault reason 0x0c] non-zero reserved fields in PTE
> [ 2378.896711] DMAR: DRHD: handling fault status reg 3
> [ 2378.896715] DMAR: [DMA Read NO_PASID] Request device [00:02.0] fault addr 0x70603000 [fault reason 0x0c] non-zero reserved fields in PTE
> [ 2378.896722] DMAR: DRHD: handling fault status reg 3
> [ 2378.896726] DMAR: [DMA Read NO_PASID] Request device [00:02.0] fault addr 0x70607000 [fault reason 0x0c] non-zero reserved fields in PTE
> [ 2378.896737] DMAR: DRHD: handling fault status reg 3
> [ 2379.479148] xe 0000:00:02.0: [drm:drm_mode_addfb2] [FB:353]
> [ 2379.480368] xe 0000:00:02.0: [drm:skl_compute_wm [xe]] [PLANE:31:plane 1A]   level *wm0,*wm1,*wm2,*wm3,*wm4,*wm5,*wm6,*wm7,*twm,*swm,*stwm ->
> *wm0,*wm1,*wm2,*wm3,*wm4,*wm5,*wm6,*wm7,*twm,*swm,*stwm
> [ 2379.480464] xe 0000:00:02.0: [drm:skl_compute_wm [xe]] [PLANE:31:plane 1A]   lines    1,   4,   4,   4,   4,   5,   8,   8,   0,   2,    0 ->    4,
> 4,   4,   4,   4,   5,   8,   8,   0,   4,    0
> [ 2379.480535] xe 0000:00:02.0: [drm:skl_compute_wm [xe]] [PLANE:31:plane 1A]  blocks   16,  65,  65,  65,  65,  81, 129, 129,  30,  19,   33 ->   62,
> 62,  62,  62,  62,  78, 123, 123, 137,  62,  137
> [ 2379.480604] xe 0000:00:02.0: [drm:skl_compute_wm [xe]] [PLANE:31:plane 1A] min_ddb   19,  73,  73,  73,  73,  91, 143, 143,  31,  22,   34 ->  123,
> 123, 123, 123, 123, 184, 184, 184, 138, 123,  138
> [ 2379.481280] BUG: kernel NULL pointer dereference, address: 0000000000000068
> [ 2379.481286] #PF: supervisor read access in kernel mode
> [ 2379.481289] #PF: error_code(0x0000) - not-present page
> [ 2379.481291] PGD 0 P4D 0
> [ 2379.481296] Oops: 0000 [#1] PREEMPT SMP NOPTI
> [ 2379.481300] CPU: 7 PID: 24658 Comm: gnome-shell Not tainted 6.5.0-rc7+zeh-xe+ #1108
> [ 2379.481304] Hardware name: Dell Inc. Latitude 5420/01M3M4, BIOS 1.27.0 03/17/2023
> [ 2379.481306] RIP: 0010:xe_ggtt_pte_encode+0x1c/0x90 [xe]
> [ 2379.481382] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 90 41 55 ba 00 10 00 00 41 54 55 53 48 8b 87 d0 02 00 00 48 89 fb 4c 8b a7 20 02 00 00
> <4c> 8b 68 68 e8 bb 4e ff ff 48 89 df 48 89 c5 e8 20 24 ff ff 84 c0
> [ 2379.481385] RSP: 0018:ffffc90001b0bb20 EFLAGS: 00010206
> [ 2379.481390] RAX: 0000000000000000 RBX: ffff8881071fe800 RCX: 0000000000000000
> [ 2379.481394] RDX: 0000000000001000 RSI: 0000000000000000 RDI: ffff8881071fe800
> [ 2379.481396] RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000001
> [ 2379.481397] R10: 0000000000000001 R11: 0000000000000659 R12: ffff8881133f0f78
> [ 2379.481399] R13: 0000000000001000 R14: 0000000000809000 R15: ffff888134feb850
> [ 2379.481400] FS:  00007f47ff7335c0(0000) GS:ffff888287b80000(0000) knlGS:0000000000000000
> [ 2379.481402] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 2379.481404] CR2: 0000000000000068 CR3: 0000000183252001 CR4: 0000000000770ee0
> [ 2379.481406] PKRU: 55555554
> [ 2379.481407] Call Trace:
> [ 2379.481409]  <TASK>
> [ 2379.481411]  ? __die+0x1a/0x60
> [ 2379.481415]  ? page_fault_oops+0x158/0x450
> [ 2379.481419]  ? drm_atomic_commit+0x8e/0xc0
> [ 2379.481423]  ? drm_mode_atomic_ioctl+0x96a/0xbd0
> [ 2379.481426]  ? drm_ioctl+0x212/0x470
> [ 2379.481428]  ? do_user_addr_fault+0x61/0x7c0
> [ 2379.481432]  ? exc_page_fault+0x6a/0x1b0
> [ 2379.481436]  ? asm_exc_page_fault+0x22/0x30
> [ 2379.481440]  ? xe_ggtt_pte_encode+0x1c/0x90 [xe]
> [ 2379.481492]  __xe_pin_fb_vma+0x396/0x840 [xe]
> [ 2379.481570]  intel_plane_pin_fb+0x34/0x90 [xe]
> [ 2379.481647]  intel_prepare_plane_fb+0x2c/0x70 [xe]
> [ 2379.481753]  drm_atomic_helper_prepare_planes+0x6b/0x210
> [ 2379.481764]  intel_atomic_commit+0x4d/0x360 [xe]
> [ 2379.481885]  drm_atomic_commit+0x8e/0xc0
> [ 2379.481889]  ? __pfx___drm_printfn_info+0x10/0x10
> [ 2379.481894]  drm_mode_atomic_ioctl+0x96a/0xbd0
> [ 2379.481902]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> [ 2379.481906]  drm_ioctl_kernel+0xc0/0x170
> [ 2379.481909]  drm_ioctl+0x212/0x470
> [ 2379.481912]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
> [ 2379.481918]  __x64_sys_ioctl+0x8d/0xb0
> [ 2379.481924]  do_syscall_64+0x38/0x90
> [ 2379.481928]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> [ 2379.481932] RIP: 0033:0x7f4802b1aaff
> [ 2379.481935] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05
> <41> 89 c0 3d 00 f0 ff ff 77 1f 48 8b 44 24 18 64 48 2b 04 25 28 00
> [ 2379.481939] RSP: 002b:00007ffc8bafb730 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> [ 2379.481943] RAX: ffffffffffffffda RBX: 00007ffc8bafb7d0 RCX: 00007f4802b1aaff
> [ 2379.481946] RDX: 00007ffc8bafb7d0 RSI: 00000000c03864bc RDI: 0000000000000009
> [ 2379.481948] RBP: 00000000c03864bc R08: 0000000000000026 R09: 0000000000000026
> [ 2379.481950] R10: 0000000000000001 R11: 0000000000000246 R12: 000055fe14331f40
> [ 2379.481953] R13: 0000000000000009 R14: 000055fe1430f4c0 R15: 000055fe1430d6f0
> [ 2379.481958]  </TASK>
> [ 2379.481959] Modules linked in: xe drm_ttm_helper drm_exec gpu_sched drm_suballoc_helper i2c_algo_bit drm_buddy ttm drm_display_helper btusb btrtl
> btbcm btintel bluetooth snd_hda_codec_hdmi cdc_ncm cdc_ether usbnet mii ecdh_generic ecc snd_ctl_led mei_pxp mei_hdcp snd_hda_codec_realtek
> snd_hda_codec_generic ledtrig_audio wmi_bmof x86_pkg_temp_thermal snd_hda_intel coretemp crct10dif_pclmul snd_intel_dspcfg crc32_pclmul snd_hda_codec
> ghash_clmulni_intel snd_hwdep snd_hda_core e1000e kvm_intel video ptp snd_pcm i2c_i801 mei_me pps_core i2c_smbus mei wmi pinctrl_tigerlake fuse
> [ 2379.482015] CR2: 0000000000000068
> [ 2379.482018] ---[ end trace 0000000000000000 ]---
> [ 2379.661641] xe 0000:00:02.0: [drm:intel_pps_vdd_off_sync_unlocked [xe]] [ENCODER:307:DDI A/PHY A] PPS 0 turning VDD off
> [ 2379.661861] xe 0000:00:02.0: [drm:intel_pps_vdd_off_sync_unlocked [xe]] [ENCODER:307:DDI A/PHY A] PPS 0 PP_STATUS: 0x80000008 PP_CONTROL:
> 0x00000067
> [ 2379.873152] RIP: 0010:xe_ggtt_pte_encode+0x1c/0x90 [xe]
> [ 2379.873325] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 90 41 55 ba 00 10 00 00 41 54 55 53 48 8b 87 d0 02 00 00 48 89 fb 4c 8b a7 20 02 00 00
> <4c> 8b 68 68 e8 bb 4e ff ff 48 89 df 48 89 c5 e8 20 24 ff ff 84 c0
> [ 2379.873328] RSP: 0018:ffffc90001b0bb20 EFLAGS: 00010206
> [ 2379.873330] RAX: 0000000000000000 RBX: ffff8881071fe800 RCX: 0000000000000000
> [ 2379.873332] RDX: 0000000000001000 RSI: 0000000000000000 RDI: ffff8881071fe800
> [ 2379.873333] RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000001
> [ 2379.873334] R10: 0000000000000001 R11: 0000000000000659 R12: ffff8881133f0f78
> [ 2379.873335] R13: 0000000000001000 R14: 0000000000809000 R15: ffff888134feb850
> [ 2379.873336] FS:  00007f47ff7335c0(0000) GS:ffff888287b80000(0000) knlGS:0000000000000000
> [ 2379.873338] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 2379.873339] CR2: 0000000000000068 CR3: 0000000183252001 CR4: 0000000000770ee0
> [ 2379.873340] PKRU: 55555554
> [ 2379.873342] note: gnome-shell[24658] exited with irqs disabled
> [ 2383.896731] dmar_fault: 1159924 callbacks suppressed
> [ 2383.896733] DMAR: DRHD: handling fault status reg 3
> [ 2383.896739] DMAR: [DMA Read NO_PASID] Request device [00:02.0] fault addr 0x70617000 [fault reason 0x0c] non-zero reserved fields in PTE
> [ 2383.896749] DMAR: DRHD: handling fault status reg 3
> [ 2383.896751] DMAR: [DMA Read NO_PASID] Request device [00:02.0] fault addr 0x70619000 [fault reason 0x0c] non-zero reserved fields in PTE
> [ 2383.896757] DMAR: DRHD: handling fault status reg 3
> [ 2383.896759] DMAR: [DMA Read NO_PASID] Request device [00:02.0] fault addr 0x7061b000 [fault reason 0x0c] non-zero reserved fields in PTE
> [ 2383.896762] DMAR: DRHD: handling fault status reg 2
> [ 2388.897730] dmar_fault: 1298750 callbacks suppressed
> [ 2388.897733] DMAR: DRHD: handling fault status reg 3
> [ 2388.897738] DMAR: [DMA Read NO_PASID] Request device [00:02.0] fault addr 0x706a5000 [fault reason 0x0c] non-zero reserved fields in PTE
> [ 2388.897747] DMAR: DRHD: handling fault status reg 3
> [ 2388.897748] DMAR: [DMA Read NO_PASID] Request device [00:02.0] fault addr 0x706a6000 [fault reason 0x0c] non-zero reserved fields in PTE
> [ 2388.897752] DMAR: DRHD: handling fault status reg 3
> [ 2388.897754] DMAR: [DMA Read NO_PASID] Request device [00:02.0] fault addr 0x706a8000 [fault reason 0x0c] non-zero reserved fields in PTE
> [ 2388.897757] DMAR: DRHD: handling fault status reg 3
> [ 2393.898732] dmar_fault: 1164851 callbacks suppressed
> 
> 
> 
> This might help debug:
> (gdb) list *(xe_ggtt_pte_encode+0x1c)
> 0x101fc is in xe_ggtt_pte_encode (drivers/gpu/drm/xe/xe_ggtt.c:34).
> 29	#define GUC_GGTT_TOP	0xFEE00000
> 30
> 31	u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset)
> 32	{
> 33	        struct xe_device *xe = xe_bo_device(bo);
> 34	        struct xe_ggtt *ggtt = (bo->tile)->mem.ggtt;
> 35	        u64 pte;
> 
> 
> 
> 
> 
