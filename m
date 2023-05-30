Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EE1C77B73
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 15:43:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D1210E177;
	Tue, 30 May 2023 15:43:49 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19F710E16E
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 15:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685461427; x=1716997427;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ebhrHNOXCMhFxAs4oxvIQdzHAhjoWg0r56BMoOlU8P0=;
 b=nG2nJwaGGd6tm73eq/l0fDMSu1n5SfkaxXwdDO9enNjPNJuzih8+k7RT
 gJiLtKnDyY1R+a2NAaS3xXyTNDPurZfvmjfzw3fQB0sHxcLwoeqJCrjxV
 kDjB3Ve62gOnTsMPMRp8olOInVqg83n5rwDHyBUxPztTcrEqpUr7m1m+9
 xbuTtMZ3vzDO2JX1nsqcDV5ABWFyTzKn3j5awaS4Cn4KkgzqkSKNeAfWv
 waiFqA1AoC/MUrDb+lJiz2+qoCXMw+Kw/DFbufpm5dPUtiTBuWqD0foWr
 leJB6r98Bx1dRXPSBEykeXIfgPVjsHkI84SzXFOFg5lNPB6V1u1/h2zzf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="358209574"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="358209574"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 08:42:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="818871180"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; d="scan'208";a="818871180"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.251.208.220])
 ([10.251.208.220])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 08:42:43 -0700
Message-ID: <3d066e91-b9b2-81ac-9cf9-7a237de98e31@linux.intel.com>
Date: Tue, 30 May 2023 17:42:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20230524123648.29955-1-nirmoy.das@intel.com>
 <ZG5Xx1R2xh/tf0f8@DUT025-TGLU.fm.intel.com>
 <673b857b-412d-152f-eede-e62fe9454060@linux.intel.com>
 <f8e86b42-0cbd-f2a2-23e5-01d3672e13e1@linux.intel.com>
 <dbab9407-a358-eccb-fc4e-641f7f815a5f@linux.intel.com>
 <851fe3a3-4c51-876c-c928-a46874e6f086@linux.intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <851fe3a3-4c51-876c-c928-a46874e6f086@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [RFC PATCH 0/2] Implement vma madvise ioctl
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
Cc: intel-xe@lists.freedesktop.org, "Zhang, Carl" <carl.zhang@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 5/30/2023 5:37 PM, Thomas Hellström wrote:
> Hi, Nirmoy
>
> On 5/30/23 17:18, Nirmoy Das wrote:
>> On 5/30/2023 3:19 PM, Thomas Hellström wrote:
>>
>>>
>>> On 5/24/23 22:12, Nirmoy Das wrote:
>>>>
>>>> On 5/24/2023 8:30 PM, Matthew Brost wrote:
>>>>> On Wed, May 24, 2023 at 02:36:46PM +0200, Nirmoy Das wrote:
>>>>>> Sending this initial RFC patch series for vma madvise ioctl
>>>>>> to gether feedback if this the correct way to do that.
>>>>>>
>>>>>> I am adding two expected options for userspace to pass
>>>>>>
>>>>>> DRM_XE_VMA_MADVISE_WILLNEED:
>>>>>>     * Set ttm priority to normal/high(if cap permits)
>>>>>>     * Make sure VMAs are in allowed placement and bound.
>>>>>>
>>>>>> DRM_XE_VMA_MADVISE_DONTNEED:
>>>>>>     * Set ttm priority to low so the BO belong to the vma
>>>>>>     become early target for eviction.
>>>>>>     * Make sure VMAs are not bound.
>>>>>>
>>>>>> Questions:
>>>>>> Should this be part of DRM_IOCTL_XE_VM_MADVISE rather than 
>>>>>> creating new ioctl?
>>>>>>
>>>>> Def not a new IOCTL. Let's take a step back, what are you trying to
>>>>> implement that the current DRM_IOCTL_XE_VM_MADVISE IOCTL / VM bind 
>>>>> IOCTL
>>>>> does not support?
>>>>
>>>> AFAIU at this moment:
>>>>
>>>> MADVISE_WILLNEED  ==  XE_VM_BIND_OP_PREFETCH + 
>>>> DRM_XE_VM_MADVISE_PRIORITY
>>>> MADVISE_DONTNEED  ==  XE_VM_BIND_OP_UNMAP + DRM_XE_VM_MADVISE_PRIORITY
>>>>
>>>> So unless we need explicit madvise ioctl or vm_madvise ioctl 
>>>> options for UMD,
>>>> I think we can have madvise equivalent with above vm bind and vm 
>>>> madvise ioctl.
>>>>
>>>> Hi Thomas, Joonas,
>>>>
>>>> What do you think ?
>>>
>>> Hi, Nirmoy,
>>>
>>> the functionality we need for DONTNEED and WILLNEED would, based on 
>>> i915 and the move to vma-based would IMO be something along the 
>>> lines of:
>>>
>>> DONTNEED
>>> 1) if userptr, unbind (or perhaps -EINVAL)
>>> 2) If bo, mark the vma as dontneed. If all other vmas of the bo are 
>>> marked dontneed, mark the bo as dontneed and adjust its priority.
>>> 3) If a dontneed bo is marked for eviction, unbind its vmas, kill 
>>> its storage and mark it as purged. Don't put on rebind list.
>>>
>>> WILLNEED
>>> 1) If userptr, bind (or perhaps -EINVAL)
>>> 2) If bo, remove dontneed marker. If bo was purged, notify 
>>> user-space. (Need feedback from UMD whether they want an error 
>>> message or just a fresh backing store). Adjust its priority, put vma 
>>> on rebind list.
>>>
>>>  So in particular, if no eviction / shrinking happens between 
>>> DONTNEED and WILLNEED they will essentially be NOOPs.
>>>
>>> It sounds like this is a bit different than what can be achieved 
>>> with prefetch/unmap/priority.
>>
>> HI Thomas,
>>
>> Thanks for your detailed response. This is indeed not completely 
>> doable currently.
>>
>> Should we have a separate ioctl for this or two new options in 
>> DRM_IOCTL_XE_VM_MADVISE ?
>
>
> IMHO we should reuse the existing VM_MADVISE ioctl if possible.


Yes, makes sense!


Thanks,

Nirmoy

>
> /Thomas
>
>
>
>>
>>>
>>> /Thomas
>>>
>>>>
>>>>
>>>> Regards,
>>>>
>>>> Nirmoy
>>>>
>>>>>
>>>>> Matt
>>>>>
>>>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>>
>>>>>> Nirmoy Das (2):
>>>>>>    drm/xe: Expose vma bind-unbind functions
>>>>>>    drm/xe: Implement madvise ioctl for vma
>>>>>>
>>>>>>   drivers/gpu/drm/xe/Makefile         |   1 +
>>>>>>   drivers/gpu/drm/xe/xe_device.c      |   2 +
>>>>>>   drivers/gpu/drm/xe/xe_vm.c          |  52 +++----
>>>>>>   drivers/gpu/drm/xe/xe_vm.h          |   3 +
>>>>>>   drivers/gpu/drm/xe/xe_vma_madvise.c | 223 
>>>>>> ++++++++++++++++++++++++++++
>>>>>>   drivers/gpu/drm/xe/xe_vma_madvise.h |  15 ++
>>>>>>   include/uapi/drm/xe_drm.h           |  28 ++++
>>>>>>   7 files changed, 296 insertions(+), 28 deletions(-)
>>>>>>   create mode 100644 drivers/gpu/drm/xe/xe_vma_madvise.c
>>>>>>   create mode 100644 drivers/gpu/drm/xe/xe_vma_madvise.h
>>>>>>
>>>>>> -- 
>>>>>> 2.39.0
>>>>>>
