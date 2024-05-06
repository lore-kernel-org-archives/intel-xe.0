Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA59C25B4F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 17:25:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0707E10F1BF;
	Mon,  6 May 2024 17:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J74F568Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47D310F1BF
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 17:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715016339; x=1746552339;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=pzDDtqJWiHDRplqryjEcyiCJEbGYq6Mp8gcu63FVxL0=;
 b=J74F568YWXD9HzyZTxAZ1KqSkzbTHolP2Jdc8gf5moaVbbbBbUHtOyuz
 nLf5c2b5ddRU0UeOIOAqim1ZB6o2yrr2iiOK8Aw6VLxZ6kAycqRosUlM7
 wBV6cGR7V/1KYm7VuU9n4N6CsJepZYjGir3qQTe/FHC0UwDdBuItMXlqK
 GkAdx8a/54pCZF+d6YDVp4zRmbtmNzJ5+2tqhJLGC72woJRofdN/OiUA5
 JKsim1YVupGz6hNxIBEBfoFEiVW5geKSBprmo1odDnkAF+5r4C8ekKfMv
 LDYRXGMAhQ99hEdfdLuneLoTo0JUk9nHpDIKLeeIvzItHNDL81QvqPaX9 A==;
X-CSE-ConnectionGUID: j5MGGi0xQW+B0mFCxp5jQA==
X-CSE-MsgGUID: +1yfh91gSLyJcw7q1W2rQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10931204"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="10931204"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 10:25:39 -0700
X-CSE-ConnectionGUID: k8P8nteQQUS/cbBJ/pCF8w==
X-CSE-MsgGUID: GT0+Sy+qSb69FC27AanAIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="32731507"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.246.30.61])
 ([10.246.30.61])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 10:25:38 -0700
Message-ID: <16054da5-fe08-4a48-8c42-a9e1f101e180@intel.com>
Date: Mon, 6 May 2024 19:25:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] drm/xe/device: move xe_device_sanitize over to devm
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240429121436.33013-9-matthew.auld@intel.com>
 <20240429121436.33013-16-matthew.auld@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240429121436.33013-16-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 29.04.2024 14:14, Matthew Auld wrote:
> Disable GuC submission when removing the device.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

I have tried to test whole patchset with
core_hotunplug@hotrebind
and I still observe attempts to call xe runtime_pm callbacks from 
removed driver(???):
[  135.059797] xe 0000:00:02.0: [drm:drm_managed_release [drm]] REL 
ffff88812b63c240 kmalloc (13 bytes)
[  135.059844] xe 0000:00:02.0: [drm:drm_managed_release [drm]] REL 
ffff88812b63d040 drm_gem_init_release (0 bytes)
[  135.059887] xe 0000:00:02.0: [drm:drm_managed_release [drm]] REL 
ffff88814f73b200 kmalloc (304 bytes)
[  135.059931] xe 0000:00:02.0: [drm:drm_managed_release [drm]] REL 
ffff88812b63c740 drm_minor_alloc_release (8 bytes)
[  135.059995] xe 0000:00:02.0: [drm:drm_managed_release [drm]] REL 
ffff888115620708 kmalloc (40 bytes)
[  135.060065] xe 0000:00:02.0: [drm:drm_managed_release [drm]] REL 
ffff88812b63ca40 drm_minor_alloc_release (8 bytes)
[  135.060161] xe 0000:00:02.0: [drm:drm_managed_release [drm]] REL 
ffff888115620a88 kmalloc (40 bytes)
[  135.060229] xe 0000:00:02.0: [drm:drm_managed_release [drm]] REL 
ffff88812d407e40 drm_dev_init_release (0 bytes)
[  135.060323] [drm:drm_managed_release [drm]] drmres release end
[  136.099951] general protection fault, probably for non-canonical 
address 0xdffffc00000004a3: 0000 [#1] PREEMPT SMP KASAN NOPTI
[  136.099969] KASAN: probably user-memory-access in range 
[0x0000000000002518-0x000000000000251f]
[  136.099977] CPU: 0 PID: 9 Comm: kworker/0:1 Not tainted 6.9.0-rc2-xe+ #25
[  136.099985] Hardware name: Intel Corporation Raptor Lake Client 
Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS 
RPLSFWI1.R00.4064.A02.2302091143 02/09/2023
[  136.099994] Workqueue: pm pm_runtime_work
[  136.100010] RIP: 0010:xe_pm_d3cold_allowed_toggle+0x2f/0x2d0 [xe]
[  136.100209] Code: 48 b8 00 00 00 00 00 fc ff df 55 48 89 e5 41 56 41 
55 41 54 53 48 89 fb 48 81 c7 18 25 00 00 48 89 fa 48 c1 ea 03 48 83 ec 
08 <0f> b6 04 02 48 89 fa 83 e2 07 38 d0 7f 08 84 c0 0f 85 21 02 00 00
[  136.100228] RSP: 0018:ffffc900001d7be8 EFLAGS: 00010296
[  136.100237] RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 
0000000000000000
[  136.100246] RDX: 00000000000004a3 RSI: 0000000000000000 RDI: 
0000000000002518
[  136.100255] RBP: ffffc900001d7c10 R08: ffff888117cf43c9 R09: 
ffff888117cf4220
[  136.100263] R10: 0000000000000000 R11: 0000000000000000 R12: 
ffff888117cf40c8
[  136.100271] R13: 0000000000000000 R14: ffffffff82dc8270 R15: 
ffff888117cf43c8
[  136.100280] FS:  0000000000000000(0000) GS:ffff88884dc00000(0000) 
knlGS:0000000000000000
[  136.100290] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  136.100298] CR2: 00005572f1fff388 CR3: 000000012134e000 CR4: 
0000000000750ef0
[  136.100307] PKRU: 55555554
[  136.100312] Call Trace:
[  136.100317]  <TASK>
[  136.100322]  ? show_regs+0x71/0x90
[  136.100331]  ? die_addr+0x41/0xc0
[  136.100339]  ? exc_general_protection+0x15d/0x260
[  136.100352]  ? asm_exc_general_protection+0x27/0x30
[  136.100361]  ? __pfx_pci_pm_runtime_idle+0x10/0x10
[  136.100373]  ? xe_pm_d3cold_allowed_toggle+0x2f/0x2d0 [xe]
[  136.100500]  ? __pfx_pci_pm_runtime_idle+0x10/0x10
[  136.100507]  xe_pci_runtime_idle+0x31/0x50 [xe]
[  136.100629]  pci_pm_runtime_idle+0xb7/0x100
[  136.100637]  rpm_idle+0x1ec/0x5c0
[  136.100646]  pm_runtime_work+0x10e/0x170
[  136.100653]  process_one_work+0x855/0x1a20
[  136.100665]  ? __pfx_process_one_work+0x10/0x10
[  136.100673]  ? move_linked_works+0x12b/0x2d0
[  136.100682]  ? assign_work+0x16f/0x280
[  136.100690]  worker_thread+0x57c/0xd40
[  136.100701]  kthread+0x2f3/0x3f0
[  136.100708]  ? __pfx_worker_thread+0x10/0x10
[  136.100716]  ? __pfx_kthread+0x10/0x10
[  136.100723]  ret_from_fork+0x43/0x90
[  136.100730]  ? __pfx_kthread+0x10/0x10
[  136.100737]  ret_from_fork_asm+0x1a/0x30
[  136.100748]  </TASK>



Regards
Andrzej

> ---
>   drivers/gpu/drm/xe/xe_device.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index ba917e383f8f..8c3415d7635a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -395,7 +395,7 @@ static void xe_driver_flr_fini(void *arg)
>   		xe_driver_flr(xe);
>   }
>   
> -static void xe_device_sanitize(struct drm_device *drm, void *arg)
> +static void xe_device_sanitize(void *arg)
>   {
>   	struct xe_device *xe = arg;
>   	struct xe_gt *gt;
> @@ -661,7 +661,7 @@ int xe_device_probe(struct xe_device *xe)
>   
>   	xe_hwmon_register(xe);
>   
> -	return drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
> +	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>   
>   err_fini_display:
>   	xe_display_driver_remove(xe);

