Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE65C001DF
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 10:42:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AEC810E004;
	Tue,  8 Aug 2023 10:42:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2074810E004
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 10:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691491334; x=1723027334;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Mk2srlVVXVR4x6J0aGpxgmeP6fx3mJjUKkexWz24f9A=;
 b=Bq7+m+phHcUTuWxv1JeVZ++Xk3aH+oBHJnhv63ZmsY0TITwPsl5TQqeS
 NRIUkqQUm8xY6MQvpef1U4Es9kSqDOEmlhDsohz5vZqpYyps9H37kByhI
 PqBWefaSTCMGjEieVDiLl8PuIGCt4CHT9Ih1N+MFcG3wJLnHIzyIxRKi1
 zknhwRwkNlZtGpi2+5Cd/NzdkE/xQjIUjguQD92aqMYKYB4O7Z0kGS+8s
 EAFZq2OtTXNrFX688vy4m6vqvKiCER2Vh7f01yvQFBrdnx86W2kHXcwRz
 wnb8C8Yan0JUl+gNr7w2DStwalPFz0ulHViVVb2zUuwVCSi6AWibbxM1c w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="374460376"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="374460376"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 03:42:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="905172264"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="905172264"
Received: from sschwar3-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.49.159])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 03:42:11 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Francois Dugast
 <francois.dugast@intel.com>
In-Reply-To: <ZLFXWdDsM6vpPg8D@DUT025-TGLU>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230713150611.7-1-francois.dugast@intel.com>
 <20230713150611.7-3-francois.dugast@intel.com>
 <ZLFXWdDsM6vpPg8D@DUT025-TGLU>
Date: Tue, 08 Aug 2023 13:42:09 +0300
Message-ID: <87il9pu872.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 2/7] drm/xe: Cleanup OPEN_BRACE style issues
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 14 Jul 2023, Matthew Brost <matthew.brost@intel.com> wrote:
> On Thu, Jul 13, 2023 at 03:06:06PM +0000, Francois Dugast wrote:
>> Remove almost all existing style issues of type OPEN_BRACE reported
>> by checkpatch.
>> 
>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>
>> ---
>>  drivers/gpu/drm/xe/display/ext/intel_device_info.c | 11 ++++++++---
>>  drivers/gpu/drm/xe/xe_gt_mcr.c                     |  3 ++-

I don't know what I need to do to drive this point through:


WE MUST **STOP** CHANGING DISPLAY CODE AND XE CODE IN THE SAME COMMITS.


The code in display/ext/intel_device_info.c is a nightmare that needs to
be fixed. The history of it needs to be gone when submitting
upstream. Doing checkpatch fixes to it is utterly pointless, and
combined with changes to rest of xe in the same commit, this makes
display fixes harder than it already is.

Do not touch display code *or* i915 code in the same commits, please.

BR,
Jani.


>>  2 files changed, 10 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/xe/display/ext/intel_device_info.c b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
>> index 29f3909e018a..9e9ccdef81f1 100644
>> --- a/drivers/gpu/drm/xe/display/ext/intel_device_info.c
>> +++ b/drivers/gpu/drm/xe/display/ext/intel_device_info.c
>> @@ -49,9 +49,14 @@ void intel_dvo_init(struct drm_i915_private *i915) {}
>>  int intel_tv_init(struct drm_i915_private *i915) { return 0; }
>>  int assert_dsi_pll_enabled(struct drm_i915_private *i915) { return 0; }
>>  bool intel_sdvo_init(struct drm_i915_private *dev_priv,
>> -		     i915_reg_t sdvo_reg, enum port port) { return false; }
>> +		     i915_reg_t sdvo_reg, enum port port)
>> +
>> +{
>> +	return false;
>> +}
>>  void g4x_hdmi_init(struct drm_i915_private *dev_priv,
>> -		   i915_reg_t hdmi_reg, enum port port) {}
>> +		   i915_reg_t hdmi_reg, enum port port)
>> +{}
>>  int g4x_hdmi_connector_atomic_check(struct drm_connector *connector,
>> -                                    struct drm_atomic_state *state)
>> +				    struct drm_atomic_state *state)
>>  { return -ENODEV; }
>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
>> index 3db550c85e32..ff4075387564 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>> @@ -429,7 +429,8 @@ static void mcr_lock(struct xe_gt *gt)
>>  	drm_WARN_ON_ONCE(&xe->drm, ret == -ETIMEDOUT);
>>  }
>>  
>> -static void mcr_unlock(struct xe_gt *gt) {
>> +static void mcr_unlock(struct xe_gt *gt)
>> +{
>>  	/* Release hardware semaphore */
>>  	if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270)
>>  		xe_mmio_write32(gt, STEER_SEMAPHORE, 0x1);
>> -- 
>> 2.34.1
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
