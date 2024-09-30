Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFAAFCF6497
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 07:46:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1D810E3BB;
	Mon, 30 Sep 2024 07:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VipVaZJm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F51210E3BB
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 07:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727682382; x=1759218382;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=sgEQFB3Cl+IJfCuEulFxw1ggBHxxdkEJ2Uo/snI7I5w=;
 b=VipVaZJmbLDhNn4Z2i7VtFtVcpIlWw/3+1PPdcHU1o0u69wuGsqNj+R+
 qs8Db8kXIH0ersi88YoHQ/NhIm880Xi/D3sfCI85EB6WjRCyd8ub1B01P
 ZkfZ65dpI0pKscTVgVJwCZqQNw43jS8bzleFDry29h24iLVeb/47yroSv
 MwuSov8fUVb1HoiV4RptazbHdzyJAzlH96+JXngBhpgwUem9953Kofh8y
 0XekvrbLr1kJc2KraPnIcERkaHbgkXUz6rxymvjjo6wh3hZuaLwJABB7d
 rXW+2Wb5bl8Sa7AUxdNDTv87ymUmqgufYJoek+wKdqwfgnAyA4cWlYnGF Q==;
X-CSE-ConnectionGUID: sxpHMrpDTyeFVUjXSxNl7w==
X-CSE-MsgGUID: 6iAnb4UdRXy+BErMa8LUeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="44218640"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="44218640"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 00:46:21 -0700
X-CSE-ConnectionGUID: Rq2O+pOrTwGduj9q+5hQpA==
X-CSE-MsgGUID: BOJA74AzSwa5V28DlECuVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="78034425"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO [10.245.244.244])
 ([10.245.244.244])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 00:46:21 -0700
Message-ID: <b701e011-16a5-4cd3-88e3-5cf3bf119f73@intel.com>
Date: Mon, 30 Sep 2024 08:46:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] drm/xe: Prevent null pointer access in
 xe_migrate_copy
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>, intel-xe@lists.freedesktop.org
References: <20240927161308.862323-1-zhanjun.dong@intel.com>
 <20240927161308.862323-2-zhanjun.dong@intel.com>
 <80cc7152-4aa1-4618-a9b9-80687e74b301@intel.com>
 <11dd509281e5278eb27f1ad7be2adc3db92058bb.camel@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <11dd509281e5278eb27f1ad7be2adc3db92058bb.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 27/09/2024 17:43, Thomas Hellström wrote:
> On Fri, 2024-09-27 at 17:34 +0100, Matthew Auld wrote:
>> On 27/09/2024 17:13, Zhanjun Dong wrote:
>>> xe_migrate_copy designed to copy content of TTM resources. When
>>> source
>>> resource is null, it will trigger a NULL pointer dereference in
>>> xe_migrate_copy. To avoid this situation, update lacks source flag
>>> to
>>> true for this case, the flag will trigger xe_migrate_clear rather
>>> than
>>> xe_migrate_copy.
>>>
>>> Issue trace:
>>> <7> [317.089847] xe 0000:00:02.0: [drm:xe_migrate_copy [xe]] Pass
>>> 14,
>>>    sizes: 4194304 & 4194304
>>> <7> [317.089945] xe 0000:00:02.0: [drm:xe_migrate_copy [xe]] Pass
>>> 15,
>>>    sizes: 4194304 & 4194304
>>> <1> [317.128055] BUG: kernel NULL pointer dereference, address:
>>>    0000000000000010
>>> <1> [317.128064] #PF: supervisor read access in kernel mode
>>> <1> [317.128066] #PF: error_code(0x0000) - not-present page
>>> <6> [317.128069] PGD 0 P4D 0
>>> <4> [317.128071] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
>>> <4> [317.128074] CPU: 1 UID: 0 PID: 1440 Comm: kunit_try_catch
>>> Tainted:
>>>    G     U           N 6.11.0-rc7-xe #1
>>> <4> [317.128078] Tainted: [U]=USER, [N]=TEST
>>> <4> [317.128080] Hardware name: Intel Corporation Lunar Lake Client
>>>    Platform/LNL-M LP5 RVP1, BIOS LNLMFWI1.R00.3221.D80.2407291239
>>> 07/29/2024
>>> <4> [317.128082] RIP: 0010:xe_migrate_copy+0x66/0x13e0 [xe]
>>> <4> [317.128158] Code: 00 00 48 89 8d e0 fe ff ff 48 8b 40 10 4c 89
>>> 85 c8
>>>    fe ff ff 44 88 8d bd fe ff ff 65 48 8b 3c 25 28 00 00 00 48 89 7d
>>> d0 31
>>>    ff <8b> 79 10 48 89 85 a0 fe ff ff 48 8b 00 48 89 b5 d8 fe ff ff
>>> 83 ff
>>> <4> [317.128162] RSP: 0018:ffffc9000167f9f0 EFLAGS: 00010246
>>> <4> [317.128164] RAX: ffff8881120d8028 RBX: ffff88814d070428 RCX:
>>>    0000000000000000
>>> <4> [317.128166] RDX: ffff88813cb99c00 RSI: 0000000004000000 RDI:
>>>    0000000000000000
>>> <4> [317.128168] RBP: ffffc9000167fbb8 R08: ffff88814e7b1f08 R09:
>>>    0000000000000001
>>> <4> [317.128170] R10: 0000000000000001 R11: 0000000000000001 R12:
>>>    ffff88814e7b1f08
>>> <4> [317.128172] R13: ffff88814e7b1f08 R14: ffff88813cb99c00 R15:
>>>    0000000000000001
>>> <4> [317.128174] FS:  0000000000000000(0000)
>>> GS:ffff88846f280000(0000)
>>>    knlGS:0000000000000000
>>> <4> [317.128176] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> <4> [317.128178] CR2: 0000000000000010 CR3: 000000011f676004 CR4:
>>>    0000000000770ef0
>>> <4> [317.128180] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
>>>    0000000000000000
>>> <4> [317.128182] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7:
>>>    0000000000000400
>>> <4> [317.128184] PKRU: 55555554
>>> <4> [317.128185] Call Trace:
>>> <4> [317.128187]  <TASK>
>>> <4> [317.128189]  ? show_regs+0x67/0x70
>>> <4> [317.128194]  ? __die_body+0x20/0x70
>>> <4> [317.128196]  ? __die+0x2b/0x40
>>> <4> [317.128198]  ? page_fault_oops+0x15f/0x4e0
>>> <4> [317.128203]  ? do_user_addr_fault+0x3fb/0x970
>>> <4> [317.128205]  ? lock_acquire+0xc7/0x2e0
>>> <4> [317.128209]  ? exc_page_fault+0x87/0x2b0
>>> <4> [317.128212]  ? asm_exc_page_fault+0x27/0x30
>>> <4> [317.128216]  ? xe_migrate_copy+0x66/0x13e0 [xe]
>>> <4> [317.128263]  ? __lock_acquire+0xb9d/0x26f0
>>> <4> [317.128265]  ? __lock_acquire+0xb9d/0x26f0
>>> <4> [317.128267]  ? sg_free_append_table+0x20/0x80
>>> <4> [317.128271]  ? lock_acquire+0xc7/0x2e0
>>> <4> [317.128273]  ? mark_held_locks+0x4d/0x80
>>> <4> [317.128275]  ? trace_hardirqs_on+0x1e/0xd0
>>> <4> [317.128278]  ? _raw_spin_unlock_irqrestore+0x31/0x60
>>> <4> [317.128281]  ? __pm_runtime_resume+0x60/0xa0
>>> <4> [317.128284]  xe_bo_move+0x682/0xc50 [xe]
>>> <4> [317.128315]  ? lock_is_held_type+0xaa/0x120
>>> <4> [317.128318]  ttm_bo_handle_move_mem+0xe5/0x1a0 [ttm]
>>> <4> [317.128324]  ttm_bo_validate+0xd1/0x1a0 [ttm]
>>> <4> [317.128328]  shrink_test_run_device+0x721/0xc10 [xe]
>>> <4> [317.128360]  ? find_held_lock+0x31/0x90
>>> <4> [317.128363]  ? lock_release+0xd1/0x2a0
>>> <4> [317.128365]  ?
>>> __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
>>>    [kunit]
>>> <4> [317.128370]  xe_bo_shrink_kunit+0x11/0x20 [xe]
>>> <4> [317.128397]  kunit_try_run_case+0x6e/0x150 [kunit]
>>> <4> [317.128400]  ? trace_hardirqs_on+0x1e/0xd0
>>> <4> [317.128402]  ? _raw_spin_unlock_irqrestore+0x31/0x60
>>> <4> [317.128404]  kunit_generic_run_threadfn_adapter+0x1e/0x40
>>> [kunit]
>>> <4> [317.128407]  kthread+0xf5/0x130
>>> <4> [317.128410]  ? __pfx_kthread+0x10/0x10
>>> <4> [317.128412]  ret_from_fork+0x39/0x60
>>> <4> [317.128415]  ? __pfx_kthread+0x10/0x10
>>> <4> [317.128416]  ret_from_fork_asm+0x1a/0x30
>>> <4> [317.128420]  </TASK>
>>>
>>> Fixes: 266c85885263 ("drm/xe/xe2: Handle flat ccs move for igfx.")
>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_bo.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c
>>> b/drivers/gpu/drm/xe/xe_bo.c
>>> index 5f2f1ec46b57..5e8f60a8d431 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -682,8 +682,8 @@ static int xe_bo_move(struct ttm_buffer_object
>>> *ttm_bo, bool evict,
>>>    	tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
>>>    			      (ttm->page_flags &
>>> TTM_TT_FLAG_SWAPPED));
>>>    
>>> -	move_lacks_source = handle_system_ccs ? (!bo-
>>>> ccs_cleared)  :
>>> -
>>> 						(!mem_type_is_vram(old_mem_type) && !tt_has_data);
>>> +	move_lacks_source = !old_mem || (handle_system_ccs ? (!bo-
>>>> ccs_cleared) :
>>> +					
>>> (!mem_type_is_vram(old_mem_type) && !tt_has_data));
>>
>> So is the issue us leaving bo->ccs_cleared set, even after purging
>> the
>> object? Seems like when purging the object the bo->ccs_cleared should
>> be
>> reset since backing storage is now gone? If we ever have purging for
>> real userspace stuff we probably need that anyway.
> 
> Hmm, good point. But is purging removing the bo->resource. I guess it
> does....

Yeah, AFAICT the bo->resource gets set back to NULL. So seems like we 
can get NULL resource from initial creation and now also after pipeline 
gutting.

> 
> /Thomas
> 
> 
>>
>>>    
>>>    	needs_clear = (ttm && ttm->page_flags &
>>> TTM_TT_FLAG_ZERO_ALLOC) ||
>>>    		(!ttm && ttm_bo->type == ttm_bo_type_device);
> 
