Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7BFC83F11
	for <intel-xe@archiver.kernel.org>; Mon, 28 Aug 2023 13:08:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48E510E2CE;
	Mon, 28 Aug 2023 13:08:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5857810E2CE
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Aug 2023 13:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693228129; x=1724764129;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=C/vzf9gCFMHs1nxJUh3pTl4ejdihcZJnr9b1KHOfUd4=;
 b=N2cnrq+3u9qcX7wL7B6gUOFYIMoaklY5kdHoaYW4c61GhwcAvM7znqiU
 JVbZJR/SmWciDYUrWVNKyR8hix6BHh/XbGMZnDrr1MrCgudf6BlJcaSK3
 TuRl24N76Oxqm+IYmBT4JCokijQPwXgJpsoIHilmmbK8zNV3qAqdoQeWM
 2dcroHk90X2wT8ry5mnnjDp/cy4A7i1/6l/MMyXzrXN5ZmpCYLQ9S04zT
 X2yiqYHc9DaEQ6emoKiHsL8EU91yCbu/Zt6mAQsOo4X5eucMq3zE6Wc5o
 J9PDzYQe6eWmxJMh8y8/q3sFefLHzz+0D86EeT9idl+LXh9Pu5uEwMIjF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="406085112"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; d="scan'208";a="406085112"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 06:08:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="984871599"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; d="scan'208";a="984871599"
Received: from ymahmud-mobl.gar.corp.intel.com (HELO [10.249.254.249])
 ([10.249.254.249])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 06:07:59 -0700
Message-ID: <ad083a3f-a2c2-9464-c5f6-cb61ae9266a5@linux.intel.com>
Date: Mon, 28 Aug 2023 15:07:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20230626144239.158345-1-zbigniew.kempczynski@intel.com>
 <06d040ea-c25b-9fdc-aa22-6e0f543a734f@linux.intel.com>
 <20230626152234.f5ud4klmqqm5lb72@zkempczy-mobl2>
 <797860c4-2033-1e2d-c2d7-3776e902db7f@linux.intel.com>
 <20230626180658.othglez5d53efdka@zkempczy-mobl2>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230626180658.othglez5d53efdka@zkempczy-mobl2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v3] drm/xe/bo: Return object bo size on create
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi!

On 6/26/23 20:06, Zbigniew Kempczyński wrote:
> On Mon, Jun 26, 2023 at 06:16:06PM +0200, Thomas Hellström wrote:
>> On 6/26/23 17:22, Zbigniew Kempczyński wrote:
>>> On Mon, Jun 26, 2023 at 04:55:29PM +0200, Thomas Hellström wrote:
>>>> Hi, Zbigniew,
>>>>
>>>> On 6/26/23 16:42, Zbigniew Kempczyński wrote:
>>>>> Driver may alter bo size requested by the user. Return real object
>>>>> size to make userspace aware how to arrange vm bindings.
>>>> I think for Xe VM_BIND, the space needed for a bo with given size must be
>>>>
>>>> ALIGN_TO(bo->size, xe_get_default_alignment())
>>>>
>>>> (xe_get_default_alignment() being an igt xe lib function).
>>> You mean I can't glue 4K system object with 64K one after another,
>>> for example:
>>>
>>> * bo on system: offset = 0x1000, size 0x1000
>>> * bo on vram:   offset = 0x2000, size 0x10000
>>>
>>> This won't work as vram object should be aligned on vm to 0x10000?
>> Yes that won't work, since a VRAM-capable bo needs 64K alignment.
>>
>> Although the explanation above ignores that system-only bo objects appears
>> to always allow 4K offset and size, which of course can be discussed.
>>
>> So with the current uAPI, it appears the bind alignment and size could
>> always be calculated using:
>>
>> if (bo_has_VRAM_placement() && xe_get_default_alignment() > 4K) {
>>     bind_size = ALIGN_TO(bo->size, xe_get_default_alignment());
>>     offset_alignment = xe_get_default_alignment();
>> } else {
>>     bind_size = bo->size;
>>     offset_alignment = 4K;
>> }
> offset_alignment = xe_get_default_alignment() is enough, as for
> integrated we got only one region and min_page_size is 4K. For discrete
> system objects just won't be adjacent (if I'm not wrong this lead to
> bigger ppgtt).
>
>> What I'm a bit afraid of is that if we return a size different from
>> bo->size, then UMD might start using that extra size for data, while it
>> really shouldn't. Would it be possible to return an alignment instead that
>> needs to be used by UMD for bind offset and bind size?
> Technically we got those alignments (for regions) - they can be get from
> min_page_size for some region. Problem I see is when user will create
> an object with flags = SYSTEM | VRAM. How to properly do vmbind in case?
> I mean sth like snippet below:
>
> size = 0x2000;
> bo = xe_bo_create_flags(fd, size, SYSTEM | VRAM);
>
> If I don't know on which region this object is created how can I prepare
> vm-bind range properly? May I use 0x2000 as size for object created
> in vram or this gpu mapping should be aligned to 64K?

Since KMD can in theory even move the object behind the back of UMD, it 
must be bound to the greatest alignment required by any of the regions. 
So if VRAM requires 64K, then any object that includes VRAM in one of 
the placements need to be aligned to 64K.


/Thomas


>
> --
> Zbigniew
>
>> /Thomas
>>
>>> --
>>> Zbigniew
>>>
>>>> Even the padded bo->size returned with this patch is lower than the value
>>>> above. If you use that value, will the value assigned below still be needed.
>>>>
>>>> /Thomas
>>>>
>>>>> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>>>>> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>>>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/xe/xe_bo.c | 1 +
>>>>>     1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>>>> index 71a14e1f25be..55dbb374a787 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>>>> @@ -1744,6 +1744,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>>>>>     		return err;
>>>>>     	args->handle = handle;
>>>>> +	args->size = bo->size;
>>>>>     	return 0;
>>>>>     }
