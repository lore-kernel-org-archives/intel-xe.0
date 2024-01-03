Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EEDC47073
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jan 2024 17:27:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8539210E332;
	Wed,  3 Jan 2024 17:27:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DC110E332
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jan 2024 17:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704302833; x=1735838833;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=EhaTZB9V+nx4fnNZOvj3Muf9BScn/82liolldlBRl94=;
 b=D5YfdoFYn/cI8s+3jwgczDKxpmOyYHwAHQ82VLDPJyZqqLVbetvxzchO
 MXTH0KyGg5Eq5CrO/6BR6hkg0jclhJd4mMvmlHKJg+xFt6tFntyQrL6PA
 oLuTezzK+M9HQvb/tlaQUJaL3Vigupa8zwJ1rOvlQcSOUe34rYdTtKlM1
 5q09y332ITh9Lo/18g2qG76JamsIfYOWBzZJKlF1O8IB4TYx75roy6oxp
 nCpT9uSdptjZ9aN3xvs9grkZPuZzokHW8U75UioHiN1rCZrB2y0AVvU8s
 cAJ6cc5jbl08KyrJ1nlz89LO4IRPrxUtBuUjn81jQHS47YeWtSUtdT0Bs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="18561827"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; d="scan'208";a="18561827"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 09:27:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="953283699"
X-IronPort-AV: E=Sophos;i="6.04,328,1695711600"; d="scan'208";a="953283699"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.50.249])
 ([10.246.50.249])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 09:27:10 -0800
Message-ID: <e8f46903-298c-419e-89c7-8dfbca3bae75@linux.intel.com>
Date: Wed, 3 Jan 2024 18:27:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/xe2: synchronise CS_CHICKEN1 with WMTP support
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20240103130517.25903-1-nirmoy.das@intel.com>
 <20240103145650.GC3529480@mdroper-desk1.amr.corp.intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240103145650.GC3529480@mdroper-desk1.amr.corp.intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 1/3/2024 3:56 PM, Matt Roper wrote:
> On Wed, Jan 03, 2024 at 02:05:17PM +0100, Nirmoy Das wrote:
>> Recommendation is to read FUSE4 register to check if WMTP has been
>> enabled/disabled by HW. If enabled we don't need to do anything special,
>> however if disabled recommendation is to also disable the WMTP mode in
>> the FF_SLICE_CS_CHICKEN2 register, falling back to thread-group and
>> mid-batch preemption only. However on Linux, the per-context CS_CHICKEN1
>> is how userspace controls pre-emption, so instead use the default lrc to
>> disable WMPT using CS_CHICKEN1, if disabled by HW. Userspace is still
> s/WMPT/WMTP/
>
>> free to set CS_CHICKEN1 to whatever they want later.
>>
>> v2: remove redundant version check and also add descriptive name(Matt)
>>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Co-developed-by: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
>>   drivers/gpu/drm/xe/xe_hw_engine.c    | 28 ++++++++++++++++++++++++++++
>>   2 files changed, 29 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 6aaaf1f63c72..6dfad86aaea6 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -146,6 +146,7 @@
>>   
>>   /* Fuse readout registers for GT */
>>   #define XEHP_FUSE4				XE_REG(0x9114)
>> +#define   CFEG_WMTP_DISABLE			REG_BIT(20)
>>   #define   CCS_EN_MASK				REG_GENMASK(19, 16)
>>   #define   GT_L3_EXC_MASK			REG_GENMASK(6, 4)
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index 832989c83a25..88dcb8cc8beb 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -316,6 +316,26 @@ static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_gt *gt,
>>   	       xe_rtp_match_first_render_or_compute(gt, hwe);
>>   }
>>   
>> +static bool xe_rtp_cfeg_wmtp_disabled(const struct xe_gt *gt,
>> +				      const struct xe_hw_engine *hwe)
>> +{
>> +
>> +	bool mtp_disabled;
>> +
>> +	if (GRAPHICS_VER(gt_to_xe(gt)) < 20)
>> +		return false;
>> +
>> +	if (hwe->class != XE_ENGINE_CLASS_COMPUTE &&
>> +	    hwe->class != XE_ENGINE_CLASS_RENDER)
>> +		return false;
>> +
>> +	mtp_disabled = REG_FIELD_GET(CFEG_WMTP_DISABLE,
>> +				     xe_mmio_read32(hwe->gt,
>> +						    XEHP_FUSE4));
> Since this is just a single bit rather than a field, it's probably
> simpler to just do
>
>          return xe_mmio_read32(hwe->gt, XEHP_FUSE4) & CFEG_WMTP_DISABLE;
>
> instead of the REG_FIELD_GET.
>
> Aside from that,
>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Thanks reviewing this, Matt. I will resend with above changes.


Regards,

Nirmoy

>
>> +	return mtp_disabled;
>> +
>> +}
>> +
>>   void
>>   xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>>   {
>> @@ -346,6 +366,14 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>>   		  XE_RTP_ACTIONS(FIELD_SET(RCU_MODE, RCU_MODE_FIXED_SLICE_CCS_MODE,
>>   					   RCU_MODE_FIXED_SLICE_CCS_MODE))
>>   		},
>> +		/* Disable WMTP if HW doesn't support it */
>> +		{ XE_RTP_NAME("DISABLE_WMTP_ON_UNSUPPORTED_HW"),
>> +		  XE_RTP_RULES(FUNC(xe_rtp_cfeg_wmtp_disabled)),
>> +		  XE_RTP_ACTIONS(FIELD_SET(CS_CHICKEN1(0),
>> +					   PREEMPT_GPGPU_LEVEL_MASK,
>> +					   PREEMPT_GPGPU_THREAD_GROUP_LEVEL)),
>> +		  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE)
>> +		},
>>   		{}
>>   	};
>>   
>> -- 
>> 2.42.0
>>
