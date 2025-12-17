Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735AAD6554F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 11:52:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3FB10E342;
	Wed, 17 Dec 2025 11:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RPpJY1uK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B6610E342
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 11:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765972320; x=1797508320;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=65UyedqO/UV6R2+GT0MeZIXoE0i7q3liblSxLs4yqRE=;
 b=RPpJY1uKqYtIoKo2vfDKo718WOP9J6inprsYW8UHrSvg97un7TvMcscg
 n3gwYxsQQnoRiL5zFi2NeVAwKP+aC0cp6nGGZ6DpOxACtGrHGfIQbFA7Y
 aJSVRShD3enlp1sUawmw/8xW6FrQElXbG5VvN6OocvG2kU6QefGi/C+oS
 qPj37DOLstBcFSyU3m0WjT56PxJtjhBgxg8sOG447VpMOFUbiDoKPKUvu
 RwOFKPWkS+13U+Oy2RdYt/2Ag7yOI7RkW21peVsmsin0zWdyl6pwoY8xl
 WqJP5Zd2VBsCMq9qmXGA+8Kvi6miZryJhAJ27NeW5xhdSGFS81+7WxAjh A==;
X-CSE-ConnectionGUID: WvLqausvTF6XcBFQyYtAQw==
X-CSE-MsgGUID: mM4BXDN9TPyb6wxrqSo44w==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="93381273"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="93381273"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 03:52:00 -0800
X-CSE-ConnectionGUID: iW0MHvJ3Q2qiX+hOFnIzHA==
X-CSE-MsgGUID: qONYhKQDQSGxFf65uv9W1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="202791605"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.245.182])
 ([10.245.245.182])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 03:51:59 -0800
Message-ID: <7c5458b3-8f14-4495-9e0f-f2feb99f411e@intel.com>
Date: Wed, 17 Dec 2025 11:51:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix NULL pointer dereference in xe_exec_ioctl
To: =?UTF-8?Q?Tapani_P=C3=A4lli?= <tapani.palli@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
References: <20251217061728.35768-1-tapani.palli@intel.com>
 <773d97c4-defc-422c-a3a9-c7769f367493@intel.com>
 <e14dc32f-3c4a-453e-b0fe-09da137e172c@intel.com>
 <dfaff8d8-9158-411c-8feb-b2dfddf85e29@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <dfaff8d8-9158-411c-8feb-b2dfddf85e29@intel.com>
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

On 17/12/2025 10:51, Tapani Pälli wrote:
> 
> On 12/17/25 12:31, Matthew Auld wrote:
>> On 17/12/2025 10:27, Matthew Auld wrote:
>>> On 17/12/2025 06:17, Tapani Pälli wrote:
>>>> Helper function xe_sync_needs_wait expects sync->fence when accessing
>>>> flags, patch makes sure we call only when sync->fence exists.
>>>>
>>>> Fixes NULL pointer dereference seen with Vulkan workloads:
>>>>
>>>> [  118.410401] RIP: 0010:xe_sync_needs_wait+0x27/0x50 [xe]
>>>>
>>>> Fixes: 4ac9048d0501 ("drm/xe: Wait on in-syncs when swicthing to 
>>>> dma- fence mode")
>>>> Signed-off-by: Tapani Pälli <tapani.palli@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_exec.c | 3 ++-
>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/ 
>>>> xe_exec.c
>>>> index 730a5c9c2637..ea368f02cb9f 100644
>>>> --- a/drivers/gpu/drm/xe/xe_exec.c
>>>> +++ b/drivers/gpu/drm/xe/xe_exec.c
>>>> @@ -184,7 +184,8 @@ int xe_exec_ioctl(struct drm_device *dev, void 
>>>> *data, struct drm_file *file)
>>>>           if (xe_sync_is_ufence(&syncs[num_syncs]))
>>>>               num_ufence++;
>>>> -        if (!num_in_sync && xe_sync_needs_wait(&syncs[num_syncs]))
>>>> +        if (!num_in_sync && syncs[num_syncs].fence &&
>>>> +            xe_sync_needs_wait(&syncs[num_syncs]))
>>>
>>> In xe_sync_entry_parse() it looks like it will always populate the 
>>> fence for the !signal case, otherwise throwing an error if that is 
>>> not possible. And xe_sync_needs_wait() will only touch the fence if 
>>> it's the signal case? So it seems like this should not be possible?
>>
>> Sorry meant to type:
>>
>> s/touch the fence if it's the signal/touch the fence if it's the !signal/
>>
> I'm not sure of the complete flow but it is quite easy to reproduce.

Oh, I think I see it now.

I assume the below also fixes it? There is also the case in 
xe_sync_entry_wait() which has the same bug, I think, so would also need 
to handle that.

@@ -178,6 +179,9 @@ int xe_sync_entry_parse(struct xe_device *xe, struct 
xe_file *xef,
  
sync_in.timeline_value);
                         if (err)
                                 return err;
+
+                       if (!sync->fence)
+                               sync->fence = dma_fence_get_stub();

So it looks like dma_fence_chain_find_seqno() can return NULL if the 
seqno has already signalled. Also means we are missing some IGT coverage 
for this.

Can you resend your patch but perhaps we move the check into 
needs_wait() and then add a similar check in xe_sync_entry_wait() also? 
Or perhaps might be cleaner to have xe_sync_entry_wait() first check 
needs_wait(), which will now also check for a NULL fence?

> 
> Here is the stacktrace snippet:
> 
> [  118.410401] RIP: 0010:xe_sync_needs_wait+0x27/0x50 [xe]
> [  118.410940] Code: 90 90 90 0f 1f 44 00 00 55 48 89 f1 48 89 e5 48 83 
> ec 08 48 83 7e 08 00 0f 84 79 be 1c 00 31 c0 f6 41 4c 01 75 11 48 8b 41 
> 08 <48> 8b 40 30 48 d1 e8 83 e0 01 83 f0 01 c9 31 d2 31 c9 31 f6 31 ff
> [  118.410949] RSP: 0018:ffffccec8ea7bb18 EFLAGS: 00010246
> [  118.410957] RAX: 0000000000000000 RBX: 00007ff23812f460 RCX: 
> ffff8c1790db4800
> [  118.410964] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
> 0000000000000000
> [  118.410968] RBP: ffffccec8ea7bb20 R08: 0000000000000000 R09: 
> 0000000000000000
> [  118.410973] R10: 0000000000000000 R11: 0000000000000000 R12: 
> ffff8c1790db4800
> [  118.410978] R13: 0000000000000000 R14: ffff8c178b67e000 R15: 
> 0000000000000000
> [  118.410984] FS:  0000000101aff6c0(0000) GS:ffff8c27350d1000(0000) 
> knlGS:000000007fe20000
> [  118.410992] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  118.410998] CR2: 0000000000000030 CR3: 00000001037ef005 CR4: 
> 0000000000772ef0
> [  118.411004] PKRU: 55555554
> [  118.411008] Call Trace:
> [  118.411013]  <TASK>
> [  118.411022]  xe_exec_ioctl+0x375/0xea0 [xe]
> [  118.411377]  ? __x64_sys_ioctl+0xbd/0x100
> [  118.411392]  ? do_syscall_64+0xa7/0x580
> [  118.411403]  ? dma_fence_free+0x1a/0x30
> [  118.411419]  ? __pfx_xe_exec_fn+0x10/0x10 [xe]
> [  118.411752]  ? drm_syncobj_array_free+0x56/0x80 [drm]
> [  118.411915]  ? drm_syncobj_query_ioctl+0x20f/0x460 [drm]
> [  118.412035]  ? __pfx_xe_exec_ioctl+0x10/0x10 [xe]
> [  118.412372]  drm_ioctl_kernel+0xae/0x110 [drm]
> [  118.412524]  drm_ioctl+0x2ee/0x5d0 [drm]
> [  118.412649]  ? __pfx_xe_exec_ioctl+0x10/0x10 [xe]
> [  118.412989]  ? __pm_runtime_resume+0x5f/0x90
> [  118.413002]  xe_drm_ioctl+0x61/0xb0 [xe]
> [  118.413329]  __x64_sys_ioctl+0xa3/0x100
> [  118.413338]  x64_sys_call+0x1060/0x2360
> [  118.413347]  do_syscall_64+0x74/0x580
> [  118.413355]  ? x64_sys_call+0x1060/0x2360
> [  118.413360]  ? do_syscall_64+0xa7/0x580
> [  118.413368]  ? __do_sys_getpid+0x1d/0x30
> [  118.413377]  ? x64_sys_call+0xf9d/0x2360
> [  118.413383]  ? do_syscall_64+0xa7/0x580
> [  118.413389]  ? x64_sys_call+0x1060/0x2360
> [  118.413395]  ? do_syscall_64+0xa7/0x580
> [  118.413401]  ? sysvec_apic_timer_interrupt+0x54/0xd0
> [  118.413410]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [  118.413418] RIP: 0033:0x7ff29c93287d
> 
> 
> 
>>>
>>>>               num_in_sync++;
>>>>       }
>>>
>>

