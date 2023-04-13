Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C84C77B6E
	for <intel-xe@archiver.kernel.org>; Thu, 13 Apr 2023 12:38:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7BEB10E157;
	Thu, 13 Apr 2023 12:38:55 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673A610E157
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Apr 2023 12:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681389534; x=1712925534;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=UvUhUZozALa1diCSLE+vmBlZjt7plCDPU/nWG3eiBxk=;
 b=BIYiKJ9yykQ4MDsxUUDhnl25KeQmzLPuvXkctnnLWAY8/EatlAC0uJRp
 8f/L0q1Q61Bu19QtWX3ExmFLhawMKvM3LjuPV+wVxnMO1sb069guFHM97
 N5qKZFQgFXRj0BH+n9shUyFIIMwGeJZf/UWNGqDCu2QyTNZJGBNBvJipq
 lPkNy1oO6PajtG8BRlmU9jID+8hZJ8owKqen2P8m7Zx93c1dmKK1y/zQY
 nES9Py9ZXmhJoyr0cBmYXNDknufMWhhK2rt1eeMG5l7Awm436Q6QPfuc2
 8hdSrTaXrfbBo3rbJcSd6JIbCa3Dv36+NzcHDK0+LW51ptZqAphL7gUK5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="409325241"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; d="scan'208";a="409325241"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 05:38:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="935581134"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; d="scan'208";a="935581134"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 05:38:52 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <8fb02acd-8490-fd8b-bbb8-bbe862705538@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230412225248.3229571-1-matthew.d.roper@intel.com>
 <20230412225248.3229571-5-matthew.d.roper@intel.com>
 <8fb02acd-8490-fd8b-bbb8-bbe862705538@linux.intel.com>
Date: Thu, 13 Apr 2023 15:38:49 +0300
Message-ID: <878rewardy.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH v2 4/8] drm/xe: Fix xe_mmio_rmw32 operation
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

On Thu, 13 Apr 2023, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> wrote:
> Hey,
>
> I thought this was on purpose, and xe_mmio_rmw32 specified which parts 
> to keep,
>
> as opposed to i915 which set a clear mask.

If this is intentionally different from i915 rmw functions, I think it's
a horrible idea, and will trip people over for years to come.

BR,
Jani.


>
> If this was not, can you also fix display/xe_de.h to no longer invert?
>
> Otherwise, you break the entirety of display.
>
> ~Maarten
>
> On 2023-04-13 00:52, Matt Roper wrote:
>> xe_mmio_rmw32 was failing to invert the passed in mask, resulting in a
>> register updated that wasn't the expected RMW operation.  Fortunately
>> the impact of this mistake was limited, since xe_mmio_rmw32() is only
>> used in two places to unmask certain GuC-related interrupts.
>>
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_mmio.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>> index 388a633b438b..a3b7f9f5db67 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.h
>> +++ b/drivers/gpu/drm/xe/xe_mmio.h
>> @@ -40,7 +40,7 @@ static inline u32 xe_mmio_rmw32(struct xe_gt *gt, u32 reg, u32 mask,
>>   	u32 old, reg_val;
>>   
>>   	old = xe_mmio_read32(gt, reg);
>> -	reg_val = (old & mask) | val;
>> +	reg_val = (old & ~mask) | val;
>>   	xe_mmio_write32(gt, reg, reg_val);
>>   
>>   	return old;

-- 
Jani Nikula, Intel Open Source Graphics Center
