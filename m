Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C11EC3DA64
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 07:45:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61A410E2FB;
	Tue,  6 Aug 2024 07:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SbrnQY39";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A7610E2FB
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Aug 2024 07:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722930303; x=1754466303;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=5koxlQqn3xhUjEjlxIpKTOwR2EcOorVhcxVmikl3hkk=;
 b=SbrnQY39uj32d7ABTI0R/q7m++k86FuyBkyT9JfQdbYgQ35TG9/3Hv01
 GQ5APGyaeGw3WNTxFiMMJ8bLDlSQ8RosZ1Y9rib/kXfTxTOXDTnmFLOau
 Dbb+m/lgtKJ2GaKXESIh2gx7bDfo2NwG92VIPuTNISm+C41+xRBgIQW8c
 vFFseN0FnrtxOlJxyaCjIuSPWpbcnngzGkbVYBXji2runQpdN5pmCePxa
 SKBQbzHGNduSmX+Hofr3ES+TVXFLKjPnb+ZL71sfWMqyJtZXswB1BP4F0
 aDR22utSMfVCHtiF9ZpumfBC0D0p+A4n38YUtDYzoAT81gHUH/XjVBJ4Y g==;
X-CSE-ConnectionGUID: IkauFryxQdqVgQu0f4Lnmg==
X-CSE-MsgGUID: G1MKHMOhRHmc1TsTxI6X/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20895960"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; d="scan'208";a="20895960"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 00:45:01 -0700
X-CSE-ConnectionGUID: ajRkoSP9Rg2UGzmi7+q2Vw==
X-CSE-MsgGUID: mgi0GHcdSQaNm9CkPCCaiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; d="scan'208";a="61392614"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.4])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 00:45:00 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: imre.deak@intel.com, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/xe/display: Match i915 driver suspend/resume
 sequences better
In-Reply-To: <ZrEdT1mxvBpeeRFe@ideak-desk.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240805151309.461021-1-maarten.lankhorst@linux.intel.com>
 <20240805151309.461021-2-maarten.lankhorst@linux.intel.com>
 <ZrEdT1mxvBpeeRFe@ideak-desk.fi.intel.com>
Date: Tue, 06 Aug 2024 10:44:45 +0300
Message-ID: <87mslq5c42.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 05 Aug 2024, Imre Deak <imre.deak@intel.com> wrote:
> On Mon, Aug 05, 2024 at 05:13:08PM +0200, Maarten Lankhorst wrote:
>> Suspend fbdev sooner, and disable user access before suspending to
>> prevent some races. I've noticed this when comparing xe suspend to
>> i915's.
>
> This is only part of
>
> 24b412b1bfeb ("drm/i915: Disable intel HPD poll after DRM poll init/enable")
> f4ed123ae295 ("drm/i915: Suspend the framebuffer console during driver shutdown")
> 1ef28d86bea9 ("drm/i915: Suspend the framebuffer console earlier during system suspend")
> bd738d859e71 ("drm/i915: Prevent modesets during driver init/shutdown")
>
> done for i915, imo all the above changes should be applied to xe.

Really, all of should happen inside drivers/gpu/drm/i915/display/, not
duplicated in i915 and xe drivers.

BR,
Jani.


>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>  drivers/gpu/drm/xe/display/xe_display.c | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
>> index ca4468c820788..44405f17c1d28 100644
>> --- a/drivers/gpu/drm/xe/display/xe_display.c
>> +++ b/drivers/gpu/drm/xe/display/xe_display.c
>> @@ -294,8 +294,12 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
>>  	 * properly.
>>  	 */
>>  	intel_power_domains_disable(xe);
>> -	if (has_display(xe))
>> +	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
>> +
>> +	if (has_display(xe)) {
>>  		drm_kms_helper_poll_disable(&xe->drm);
>> +		intel_display_driver_disable_user_access(xe);
>> +	}
>>  
>>  	if (!runtime)
>>  		intel_display_driver_suspend(xe);
>> @@ -308,8 +312,6 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
>>  
>>  	intel_opregion_suspend(xe, s2idle ? PCI_D1 : PCI_D3cold);
>>  
>> -	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
>> -
>>  	intel_dmc_suspend(xe);
>>  }
>>  
>> @@ -353,8 +355,10 @@ void xe_display_pm_resume(struct xe_device *xe, bool runtime)
>>  		intel_display_driver_resume(xe);
>>  
>>  	intel_hpd_poll_disable(xe);
>> -	if (has_display(xe))
>> +	if (has_display(xe)) {
>>  		drm_kms_helper_poll_enable(&xe->drm);
>> +		intel_display_driver_enable_user_access(xe);
>> +	}
>>  
>>  	intel_opregion_resume(xe);
>>  
>> -- 
>> 2.45.2
>> 

-- 
Jani Nikula, Intel
