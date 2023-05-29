Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553EAC77B7E
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 15:23:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A2B10E02A;
	Mon, 29 May 2023 15:23:38 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2BA10E02A
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 15:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685373815; x=1716909815;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=X1BSaKui2ObwtR86V73lNZr3xg8FFe3P29v/RS6o794=;
 b=Qoy8W4Drb62DK6MnjaKjw1bnBGNhm5rWWt+zerW3ig9FYMru5NIzBc5w
 NCFWGulOtglLlbOfoLD8a2KgwTgKRAWdkPgj8svyzeILQDMunQOQu8NSo
 4lTl1PNwIkTZ28bRbxGbfm7VG+fYaBlThN5VP7gk9Cj+YdxZwcexS3VxO
 6piLapYsTHULhXFGVEmSecycCz9v6tzrKhHMZA5Xpy/OrarrgZ497FRiz
 PV/R2kvqQBB5dvoIgu57+DRSpmOjBBRzQihxWhz1HvGkGuf77i3r7w47B
 4DoAOwuXN+XJcJvRRFYDcWjCM0QEVx5TIo6E1xV69gcPjOfezG0Rlgs+0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="354742143"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="354742143"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 08:23:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="830426167"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; d="scan'208";a="830426167"
Received: from olhomerx-mobl.ger.corp.intel.com (HELO [10.252.46.198])
 ([10.252.46.198])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 08:23:31 -0700
Message-ID: <a8e9c44a-84b3-36f6-ba89-d05962bc3491@linux.intel.com>
Date: Mon, 29 May 2023 17:23:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230526121101.1619278-1-maarten.lankhorst@linux.intel.com>
 <20230526121101.1619278-5-maarten.lankhorst@linux.intel.com>
 <b6be6ecf-5737-0f2a-2e7b-7737ef52af50@linux.intel.com>
 <10e2a992-dcc4-8316-8e8b-f674641bed87@linux.intel.com>
 <5fece445-89eb-0e97-e934-1c896fb27bd7@linux.intel.com>
 <30734f17-58d0-bf50-ac83-dc4e7d65550d@linux.intel.com>
 <0d897527-d80b-5fd9-f338-2a5d83d6c682@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <0d897527-d80b-5fd9-f338-2a5d83d6c682@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 4/5] drm/xe: Prevent evicting for page tables
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


On 2023-05-29 17:13, Thomas Hellström wrote:
>
> On 5/29/23 17:11, Maarten Lankhorst wrote:
>> Hey,
>>
>> On 2023-05-29 17:02, Thomas Hellström wrote:
>>> On 5/29/23 15:44, Maarten Lankhorst wrote:
>>>> On 2023-05-26 14:35, Thomas Hellström wrote:
>>>>> On 5/26/23 14:11, Maarten Lankhorst wrote:
>>>>>> When creating page tables from xe_exec_ioctl, we may end up freeing
>>>>>> memory we just validated. To be certain this does not happen, do not
>>>>>> allow the current reservation to be evicted from the ioctl.
>>>>>>
>>>>>> Callchain:
>>>>>> [  109.008522]  xe_bo_move_notify+0x5c/0xf0 [xe]
>>>>>> [  109.008548]  xe_bo_move+0x90/0x510 [xe]
>>>>>> [  109.008573]  ttm_bo_handle_move_mem+0xb7/0x170 [ttm]
>>>>>> [  109.008581]  ttm_bo_swapout+0x15e/0x360 [ttm]
>>>>>> [  109.008586]  ttm_device_swapout+0xc2/0x110 [ttm]
>>>>>> [  109.008592]  ttm_global_swapout+0x47/0xc0 [ttm]
>>>>>> [  109.008598]  ttm_tt_populate+0x7a/0x130 [ttm]
>>>>>> [  109.008603]  ttm_bo_handle_move_mem+0x160/0x170 [ttm]
>>>>>> [  109.008609]  ttm_bo_validate+0xe5/0x1d0 [ttm]
>>>>>> [  109.008614]  ttm_bo_init_reserved+0xac/0x190 [ttm]
>>>>>> [  109.008620]  __xe_bo_create_locked+0x153/0x260 [xe]
>>>>>> [  109.008645]  xe_bo_create_locked_range+0x77/0x360 [xe]
>>>>>> [  109.008671]  xe_bo_create_pin_map_at+0x33/0x1f0 [xe]
>>>>>> [  109.008695]  xe_bo_create_pin_map+0x11/0x20 [xe]
>>>>>> [  109.008721]  xe_pt_create+0x69/0xf0 [xe]
>>>>>> [  109.008749]  xe_pt_stage_bind_entry+0x208/0x430 [xe]
>>>>>> [  109.008776]  xe_pt_walk_range+0xe9/0x2a0 [xe]
>>>>>> [  109.008802]  xe_pt_walk_range+0x223/0x2a0 [xe]
>>>>>> [  109.008828]  xe_pt_walk_range+0x223/0x2a0 [xe]
>>>>>> [  109.008853]  __xe_pt_bind_vma+0x28d/0xbd0 [xe]
>>>>>> [  109.008878]  xe_vm_bind_vma+0xc7/0x2f0 [xe]
>>>>>> [  109.008904]  xe_vm_rebind+0x72/0x160 [xe]
>>>>>> [  109.008930]  xe_exec_ioctl+0x22b/0xa70 [xe]
>>>>>> [  109.008955]  drm_ioctl_kernel+0xb9/0x150 [drm]
>>>>>> [  109.008972]  drm_ioctl+0x210/0x430 [drm]
>>>>>> [  109.008988]  __x64_sys_ioctl+0x85/0xb0
>>>>>> [  109.008990]  do_syscall_64+0x38/0x90
>>>>>> [  109.008991]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
>>>>>>
>>>>>> Original warning:
>>>>>> [ 5613.149126] WARNING: CPU: 3 PID: 45883 at drivers/gpu/drm/xe/xe_vm.c:504 xe_vm_unlock_dma_resv+0x43/0x50 [xe]
>>>>>> ...
>>>>>> [ 5613.226398] RIP: 0010:xe_vm_unlock_dma_resv+0x43/0x50 [xe]
>>>>>> [ 5613.316098] Call Trace:
>>>>>> [ 5613.318595]  <TASK>
>>>>>> [ 5613.320743]  xe_exec_ioctl+0x383/0x8a0 [xe]
>>>>>> [ 5613.325278]  ? __is_insn_slot_addr+0x8e/0x110
>>>>>> [ 5613.329719]  ? __is_insn_slot_addr+0x8e/0x110
>>>>>> [ 5613.334116]  ? kernel_text_address+0x75/0xf0
>>>>>> [ 5613.338429]  ? __pfx_stack_trace_consume_entry+0x10/0x10
>>>>>> [ 5613.343778]  ? __kernel_text_address+0x9/0x40
>>>>>> [ 5613.348181]  ? unwind_get_return_address+0x1a/0x30
>>>>>> [ 5613.353013]  ? __pfx_stack_trace_consume_entry+0x10/0x10
>>>>>> [ 5613.358362]  ? arch_stack_walk+0x99/0xf0
>>>>>> [ 5613.362329]  ? rcu_read_lock_sched_held+0xb/0x70
>>>>>> [ 5613.366996]  ? lock_acquire+0x287/0x2f0
>>>>>> [ 5613.370873]  ? rcu_read_lock_sched_held+0xb/0x70
>>>>>> [ 5613.375530]  ? rcu_read_lock_sched_held+0xb/0x70
>>>>>> [ 5613.380181]  ? lock_release+0x225/0x2e0
>>>>>> [ 5613.384059]  ? __pfx_xe_exec_ioctl+0x10/0x10 [xe]
>>>>>> [ 5613.389092]  drm_ioctl_kernel+0xc0/0x170
>>>>>> [ 5613.393068]  drm_ioctl+0x1b7/0x490
>>>>>> [ 5613.396519]  ? __pfx_xe_exec_ioctl+0x10/0x10 [xe]
>>>>>> [ 5613.401547]  ? lock_release+0x225/0x2e0
>>>>>> [ 5613.405432]  __x64_sys_ioctl+0x8a/0xb0
>>>>>> [ 5613.409232]  do_syscall_64+0x37/0x90
>>>>>>
>>>>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/239
>>>>> Did you look at passing around the ttm_operation_ctx, or a "allow_res_evict" bool?
>>>>> In any case would be good to have this fixed asap, so
>>>>>
>>>>> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>>
>>>> I considered it, but the original callchain was too long. I don't think there is any usecase
>>>> in which we want to evict from the current context to make room for new pagetables for VM_BIND.
>>>> Anything locked is most likely used, making room by evicting from current VM (or its bound extobjs)
>>>> will likely lead to ENOSPC anyway.
>>> Well, I think the use-case where this will cause problems is if we're doing a single VM_BIND on a brand new VRAM BO, and need to evict other VRAM bos from the same VM to make room.
>>>
>>> This will then ofc ENOSPC on the next exec, but if we were to introduce a two-pass validation scheme, where we explicitly move suitable BOs with multiple placement options to TT on the first ENOSPC, we could avoid that...
>> Allowing same-reservation eviction will allow you to evict the BO its VM_BIND page table, leaving no entries to write. :-)
>
> Aren't those pinned?
>
> /Thomas

Not the bo itself.

~Maarten

