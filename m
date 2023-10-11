Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9565CD6E5A
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 10:57:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE4F10E6A9;
	Wed, 11 Oct 2023 10:57:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDCF10E6A4
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 10:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697021824; x=1728557824;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=n2AC9IrEcPQ80YIWHbCcq8spyDurCUfe+Qahx7sAJBI=;
 b=M0wAAZHBzFFWGac8DRH9A5/PoXTCUquk3Tv5hoZhrwjBAUTB4v1lCur2
 9B7ZmrzKCROFCKu06Jx2af89uxYsy4NoLxLKqdUOtX1dyzQ1ZXDfJ5pi4
 dHb4ebPhFAMwDRKtLBfJ/Bvhwlv/W+9LxdChDKfmbmuX3f+kOs3eLcirH
 Jl1hqTZ+mVum8GlItGUqsWxkU3QC9UMlIK/SW9erSTW8TrbkDI63vnbLt
 WS3Js15wIcrEIRWl/8W9FoWRKJ+A47uT0eKC0od5S3aNnrYQGcw3iPAyi
 c7CRdF9rYdBg1pRzo70Sb7jlvTfkx+srasG681uLAaZvD+0merEXLqa9F A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="470895546"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="470895546"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 03:57:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="870102355"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="870102355"
Received: from sorenthe-mobl.ger.corp.intel.com (HELO [10.249.254.174])
 ([10.249.254.174])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 03:57:01 -0700
Message-ID: <bd021e46-c351-4527-bf0f-f2972cbd24bb@linux.intel.com>
Date: Wed, 11 Oct 2023 12:56:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Souza, Jose" <jose.souza@intel.com>, "dev@lankhorst.se"
 <dev@lankhorst.se>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>
References: <20231006171800.1816211-1-maarten.lankhorst@linux.intel.com>
 <d530b1b8303e1f1317d9b97e21af35aebcdb1899.camel@intel.com>
 <85b90a64-bd54-6753-5f04-c3e9034ae5cc@lankhorst.se>
 <e301a32f6e2fb5625b8eaa3a6dda2db19993722b.camel@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <e301a32f6e2fb5625b8eaa3a6dda2db19993722b.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [RFC PATCH] drm/xe: Add uapi for dumpable bos
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

Hey,

Den 2023-10-10 kl. 23:04, skrev Souza, Jose:
> + Lionel
>
> Hi Lionel
>
> Can you please take over this thread while I'm on vacation?
>
> On Fri, 2023-10-06 at 22:12 +0200, Maarten Lankhorst wrote:
>> Hey,
>>
>> On 2023-10-06 20:29, Souza, Jose wrote:
>>> On Fri, 2023-10-06 at 19:18 +0200, maarten.lankhorst@linux.intel.com wrote:
>>>> From: Maarten Lankhorst <dev@lankhorst.se>
>>>>
>>>> Add XE_GEM_CREATE_FLAG_DUMPABLE for use with VM_BIND.
>>>> For BO's with vram regions, XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM
>>>> also needs to be specified.
>>>>
>>>> After this, we can use the flag XE_VM_BIND_FLAG_DUMPABLE to notify
>>>> devcoredump that this mapping should be dumped.
>>>>
>>>> This is not hooked up, but the uapi should be ready before merging.
>>>> If needed, we can relax the restrictions later.
>>>>
>>>> It's also not yet certain whether the BO contents will be preserved,
>>>> or a reference to the BO. The latter allows us to skip a whole lot of
>>>> tricky locking. This requires userspace to destroy all bo's that were
>>>> marked dumpable though, but I feel this is a cleaner solution from
>>>> a kernel perspective.
>>>>
>>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_bo.c |  9 +++++++++
>>>>    drivers/gpu/drm/xe/xe_bo.h |  1 +
>>>>    drivers/gpu/drm/xe/xe_vm.c | 17 ++++++++++++++---
>>>>    include/uapi/drm/xe_drm.h  | 25 +++++++++++++++++++++++++
>>>>    4 files changed, 49 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>>> index 61789c0e88fb..0de0bd5eb825 100644
>>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>>> @@ -1776,6 +1776,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>>>>    			 ~(XE_GEM_CREATE_FLAG_DEFER_BACKING |
>>>>    			   XE_GEM_CREATE_FLAG_SCANOUT |
>>>>    			   XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM |
>>>> +			   XE_GEM_CREATE_FLAG_DUMPABLE |
>>>>    			   xe->info.mem_region_mask)))
>>>>    		return -EINVAL;
>>>>    
>>>> @@ -1810,6 +1811,14 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>>>>    		bo_flags |= XE_BO_NEEDS_CPU_ACCESS;
>>>>    	}
>>>>    
>>>> +	if (args->flags & XE_GEM_CREATE_FLAG_DUMPABLE) {
>>>> +		if (XE_IOCTL_DBG(xe, (bo_flags & XE_BO_CREATE_VRAM_MASK &&
>>>> +				 !(bo_flags & XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM))))
>>>> +			return -EINVAL;
>>>> +
>>>> +		bo_flags |= XE_BO_NEEDS_CPU_ACCESS | XE_BO_DUMPABLE;
>>> It is not viable to just ignore VMAs that can't be mapped in CPU during dump?
>>> Because it will not be viable to dump real applications in small PCIe bar systems, it would run out of CPU mappable memory.
>>>
>>> And if UMD really wants a dump of a small test that fits into the CPU mappable memory it can set XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM and get the
>>> whole dump.
>>>
>>> So we would be able to drop the need of XE_GEM_CREATE_FLAG_DUMPABLE.
>> It would be doable, we could evict the BO's to sysmem if we only take a
>> reference and dump each bo.
>>
>> Taking a reference during crash would require the userspace app to
>> recreate all dumpable bo's after a hang, or it will risk overwriting
>> the state at the time of the dump.
> But what/who would overwrite the bos during dump?
>
> I don't think it is possible to recreate all BOs that are necessary in dump.
> For example vertex information is provided my applications, would not be viable to UMD keep copies of that.

What I mean here is that the bo's are still accessible by the app, but 
it's the apps responsibility of not overwriting it before a crash dump 
is taken. So in this case if you want to keep the vertex data, you can 
copy the contents from the old bo, or hope it's simply not altered 
before the crash dump is taken.

Cheers,

~Maarten

