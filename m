Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1A0CD3428
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 17:02:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE3910E0EA;
	Wed, 12 Nov 2025 17:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ARAJm1M0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B4510E0EA
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 17:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762966931; x=1794502931;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=KJ6DhWJTVIaPczgsHnrZdOB/NwKsvY8XnwO/X/yL6wg=;
 b=ARAJm1M0LlUDz2ZrgxgO1i/6N8ziMvjXo2jwX7gOurnfOnwGYn2PONhF
 BBIM94xjNJ/5no2SDiAjrMJmpUj8aHIVA6ZrDyBk2aqkeXz2m7pzFdYsd
 9npQDssMQs8t1bf5jk2bLjkGL950xKC9Cb3l6qzWYFCEU1LyVbSWQ2I+M
 IDfv/e2pM4MKadbeF68AJ95+XsUZXpRG+KK4gQuSwEDX2ub7W//9UBcd8
 RtP2M9OtVykBV30TRuzHy+rRN5pLFKyCnCliqNAgmmi2z5DpDty9xdzEC
 gZLd3UI1T+6bZyT5paV1PuT7s6b6EzxI6DyORXyVqKU5o3Hw9ByHiPZ9i g==;
X-CSE-ConnectionGUID: 3z8zmf/gSdK3KpP8FUeQgg==
X-CSE-MsgGUID: Pu2ZGBgfSziU2AlHDYnGKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="75647211"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="75647211"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 09:02:10 -0800
X-CSE-ConnectionGUID: tTN77y76Sl6uZxhSIGi5kw==
X-CSE-MsgGUID: +8k/hXNgSBKYZ3BNJusGTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="220014504"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.254])
 ([10.245.244.254])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 09:02:09 -0800
Message-ID: <09218055-ee5a-45c1-a816-157376b3af39@intel.com>
Date: Wed, 12 Nov 2025 17:02:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Prevent BIT() overflow when handling invalid
 prefetch region
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20251112002331.1897395-2-shuicheng.lin@intel.com>
 <cc8c7cd2-8c92-422d-b6ca-ec892478fc61@intel.com>
 <DM4PR11MB5456E2B0A9E44FE1603FB117EACCA@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <DM4PR11MB5456E2B0A9E44FE1603FB117EACCA@DM4PR11MB5456.namprd11.prod.outlook.com>
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

On 12/11/2025 16:26, Lin, Shuicheng wrote:
> On Wed, Nov 12, 2025 2:24 AM Matthew Auld wrote:
>> On 12/11/2025 00:23, Shuicheng Lin wrote:
>>> If user provides a large value (such as 0x80) for parameter
>>> prefetch_mem_region_instance in vm_bind ioctl, it will cause
>>> BIT(prefetch_region) overflow as below:
>>> "
>>>    ------------[ cut here ]------------
>>>    UBSAN: shift-out-of-bounds in drivers/gpu/drm/xe/xe_vm.c:3414:7
>>>    shift exponent 128 is too large for 64-bit type 'long unsigned int'
>>>    CPU: 8 UID: 0 PID: 53120 Comm: xe_exec_system_ Tainted: G        W
>> 6.18.0-rc1-lgci-xe-kernel+ #200 PREEMPT(voluntary)
>>>    Tainted: [W]=WARN
>>>    Hardware name: ASUS System Product Name/PRIME Z790-P WIFI, BIOS
>> 0812 02/24/2023
>>>    Call Trace:
>>>     <TASK>
>>>     dump_stack_lvl+0xa0/0xc0
>>>     dump_stack+0x10/0x20
>>>     ubsan_epilogue+0x9/0x40
>>>     __ubsan_handle_shift_out_of_bounds+0x10e/0x170
>>>     ? mutex_unlock+0x12/0x20
>>>     xe_vm_bind_ioctl.cold+0x20/0x3c [xe]
>>>    ...
>>> "
>>> Fix it by validating prefetch_region before the BIT() usage.
>>>
>>> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel
>>> GPUs")
>>
>> I think should be:
>>
>> Fixes: c1bb69a2e8e2 ("drm/xe/svm: Consult madvise preferred location in
>> prefetch")
> 
> The UBSAN warning is for the BIT(), and this BIT() check exists since dd08ebf6c352.
> The c1bb69a2e8e2 is for "region_to_mem_type[prefetch_region]", which is truly
> an issue, but not the UBSAN complain about. So I prefer to use dd08ebf6c352.
> What is your idea about it? Thanks.

Oh, I see. Sorry for missing that. That is slightly annoying since we 
will need to be backport this fix to older kernels, but this patch won't 
apply cleanly. The s/region/prefetch_region/ is fairly recent.

In that case, I think we at least need to add:

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: <stable@vger.kernel.org> # v6.8+

So this doesn't fall through the cracks. Once this gets picked up for 
older stable kernels you should get mail(s) for which kernels this patch 
fails to cleanly apply on, and the mail itself will contain instructions 
for how to send a patch. I think that should work?

> 
>>
>> And also:
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6478
> 
> Let me add it. I didn't add it because I cannot open it.
> Maybe it is due to some permission.
> 
>>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
>>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>
>> An IGT that uses a too large prefetch_region would be good also.
> 
> Let me implement it later.
> 
> Shuicheng
> 
>>
>>> ---
>>>    drivers/gpu/drm/xe/xe_vm.c | 6 ++++--
>>>    1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>> index 8fb5cc6a69ec..7cac646bdf1c 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> @@ -3411,8 +3411,10 @@ static int vm_bind_ioctl_check_args(struct
>> xe_device *xe, struct xe_vm *vm,
>>>    				 op == DRM_XE_VM_BIND_OP_PREFETCH) ||
>>>    		    XE_IOCTL_DBG(xe, prefetch_region &&
>>>    				 op != DRM_XE_VM_BIND_OP_PREFETCH) ||
>>> -		    XE_IOCTL_DBG(xe,  (prefetch_region !=
>> DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
>>> -				       !(BIT(prefetch_region) & xe-
>>> info.mem_region_mask))) ||
>>> +		    XE_IOCTL_DBG(xe, (prefetch_region !=
>> DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
>>> +				      /* Guard against undefined shift in
>> BIT(prefetch_region) */
>>> +				      (prefetch_region >= (sizeof(xe-
>>> info.mem_region_mask) * 8) ||
>>> +				      !(BIT(prefetch_region) & xe-
>>> info.mem_region_mask)))) ||
>>>    		    XE_IOCTL_DBG(xe, obj &&
>>>    				 op == DRM_XE_VM_BIND_OP_UNMAP) ||
>>>    		    XE_IOCTL_DBG(xe, (flags &
>>> DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET) &&
> 

