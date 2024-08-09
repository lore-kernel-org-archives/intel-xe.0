Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5AFC52D71
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 08:55:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD81110E887;
	Fri,  9 Aug 2024 08:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KQQq92Ap";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F6210E887
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 08:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723193716; x=1754729716;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=usUk6Ik9N10DNEPkkSPN5scZljiLyq/uoDeIryZ1EfE=;
 b=KQQq92ApBomFP2KP6QjX5gbNFOE5O7DNrtYD4nRJEf/k9g7zYYB3QrRF
 ScRL8bPMsLDl6tkfRXDkitbbpQNpoJIEB7a26xU2kMuD7J2dTcDth7mmu
 eygVB5XsBLYPEDsHJS6iYhUkI4NspMEBWmeDi2xdo3id0lJ7qtaOJgMdY
 TSpgWNfsMhLs5ORTY7LljhI8PNJw9Qvr2pnWnSrqkwdoAzPrfWbpiYs9/
 UhWAWy543eB2KkkrKRg8qPsbQ9Aa5m5EpUjdY+951fOE+qX0QL8IOmsWB
 yVoGL2Ln5Tjy6Fr0v4iI6ER/XxyHkpCuvwvXzibWT/xPPBBvymBXIKh8g w==;
X-CSE-ConnectionGUID: 01PWPs9oSo+5A+YzARUM7Q==
X-CSE-MsgGUID: 8uVeWVbzTPOfNvr5a3LY1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="38811400"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="38811400"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 01:55:16 -0700
X-CSE-ConnectionGUID: Zm4Z4TzOSh6zXE7+Qp5+9Q==
X-CSE-MsgGUID: 033zAQuITGycrEtcKt9T/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208";a="57155617"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO [10.245.245.147])
 ([10.245.245.147])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 01:55:14 -0700
Message-ID: <4a41b168-10de-432f-8535-a719d321823a@intel.com>
Date: Fri, 9 Aug 2024 09:55:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Init MCR before any mcr register read
To: Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240808092826.585276-1-tejas.upadhyay@intel.com>
 <20240808092826.585276-2-tejas.upadhyay@intel.com>
 <20240808195114.GE5091@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240808195114.GE5091@mdroper-desk1.amr.corp.intel.com>
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

On 08/08/2024 20:51, Matt Roper wrote:
> On Thu, Aug 08, 2024 at 02:58:25PM +0530, Tejas Upadhyay wrote:
>> enable host l2 VRAM is example where MCR register is
>> getting read before fully MCR init is done. Lets move
> 
> "is example" makes it sound like this is just one of multiple places
> where we're incorrectly using MCR registers before MCR handling is
> initialized.  If there are indeed other cases, then I'd expect to see
> more patches in this series making other changes as well.
> 
> Also, the title seems slightly misleading as well; it makes it sound
> like we're changing where we do the MCR init (which would run into other
> chicken-and-egg problems with topology and GuC init), but in reality
> we're just moving the L2 thing for Wa_16023588340 a bit later in the
> init process, so it might be best to focus the wording on that.
> 
>  From a quick skim of Wa_16023588340 it just says that we need to do this
> as part of initialization (and GT reset) without really specifying any
> specific ordering with respect to other initialization tasks.  If I
> remember this workaround correctly it's probably something that we want
> to do before we start having a bunch of CPU writes to the LMEMBAR.  I
> think there are some CPU -> VRAM writes during GuC initialization (e.g.,
> the GuC ADS), but maybe not enough to require doing this workaround
> earlier; we should probably test this carefully and/or double check with
> the architects on whether they think this would be a concern.  I know
> the really heavy CPU -> LMEMBAR traffic would probably come later once
> we initialize display and the fbcon starts writing to the fbdev
> framebuffer, so the new placement is still early enough to avoid those
> at least.

Yeah, it seemed reasonable to enable the host l2 caching before we 
started touching vram from the host. I don't recall if it was this 
version of the WA or the one that did the timer reg write thing, but I 
do seem to remember the placement being sensitive even during module 
load (IIRC gt_init vs gt_init_early), where if done too late (gt_init) 
you would sometimes still get the issue with the register read timing 
out in the interrupt handler. But in xe_gt_init_hwconfig perhaps not an 
issue, since it is still quite early.

> 
> 
> Matt
> 
>> enable host l2 VRAM after MCR init.
>>
>> V1(Lucas):
>>   - Reorder patch and reorder flow of L2 VRAM enable
>>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 58895ed22f6e..238c7d1053f0 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -557,7 +557,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
>>   
>>   	xe_gt_mcr_init_early(gt);
>>   	xe_pat_init(gt);
>> -	xe_gt_enable_host_l2_vram(gt);
>>   
>>   	err = xe_uc_init(&gt->uc);
>>   	if (err)
>> @@ -569,6 +568,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
>>   
>>   	xe_gt_topology_init(gt);
>>   	xe_gt_mcr_init(gt);
>> +	xe_gt_enable_host_l2_vram(gt);
>>   
>>   out_fw:
>>   	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>> -- 
>> 2.25.1
>>
> 
