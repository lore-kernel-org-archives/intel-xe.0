Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBD9CD4F3C
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 08:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712F710EF7E;
	Wed, 20 May 2026 08:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K3ZVKGlh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD26310EF80;
 Wed, 20 May 2026 08:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779265615; x=1810801615;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=KljXN0tuGQ3hI7hkByWX4VM7tUVUiaaAJJLh6IWnWoA=;
 b=K3ZVKGlh//F5zNgJkyDbcOB6eETYjYklKTyreOwDjxhDchH/oEnV2qbS
 2qCbswcmPOlAZNNPnPHFCgBxPoFBFZ4LXejzm7Msipk4P6ZDl0ZXgP/+V
 /N3cBuVIvCc3wOmGTPqURrsSNEFYFOyNonhRJ6YTA2/SKIVQV7s5PDQ8R
 PR5KYnIbSFpFlMZkiYDmP4LgiJv+Mh9ZcGlwByVbqOzvGCOA69aQWLeFX
 /KwT0Jd05o8kk7+O5HZqaU8VuWte83vYAduXBTuykMM3Rc4EiI0B4FYql
 MLc8A7AdPWFTZ1p9r37mXoviVhttZ1sypchjp+W8MfR/uXjHs89FM8ahE Q==;
X-CSE-ConnectionGUID: F5CLQb5qSjikyuwHwCElYQ==
X-CSE-MsgGUID: BV+gMoF8QpmwnDo/j2jlkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="79304109"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="79304109"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 01:26:52 -0700
X-CSE-ConnectionGUID: PbHh0iIWR1i8ShTwC/WtuQ==
X-CSE-MsgGUID: KnEvvWHLQaWmCE/6GBYeaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="235817379"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.148])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 01:26:51 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, Suraj Kandpal
 <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: arun.r.murthy@intel.com
Subject: Re: [PATCH] Revert "drm/i915/backlight: Remove try_vesa_interface"
In-Reply-To: <5ddd368a-6efc-40b6-a411-1dacfb797e2f@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260515155340.1000997-1-suraj.kandpal@intel.com>
 <20260517024709.1016121-1-suraj.kandpal@intel.com>
 <5ddd368a-6efc-40b6-a411-1dacfb797e2f@intel.com>
Date: Wed, 20 May 2026 11:26:48 +0300
Message-ID: <2b7f8ce64f4f26ae041b6002677ca8ed2b53aa1f@intel.com>
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

On Wed, 20 May 2026, "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com> wrote:
> On 5/17/2026 8:17 AM, Suraj Kandpal wrote:
>> This reverts commit 40d2f5820951dee818d05c14677277048bd85f9f.
>>
>> Removing the try_vesa_interface gate caused a backlight regression on
>> panels whose VBT correctly reports INTEL_BACKLIGHT_DISPLAY_DDI and whose
>> PWM path is the actual backlight control, but whose DPCD optimistically
>> advertises DP_EDP_BACKLIGHT_AUX_ENABLE_CAP / _BRIGHTNESS_AUX_SET_CAP.
>> After the commit such panels silently bind to the VESA AUX backlight
>> funcs; AUX writes complete but the panel ignores them, leaving
>> brightness stuck (no-op backlight). Observed on at least KBL and TGL
>> eDP setups.
>>
>> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
>
> This will re-open the gitlab issue: 
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15679
>
> We might need to add a quirk for the above cases where VBT cannot be 
> trusted.
>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

I think this is a mess of a thread, with two completely different things
in one. Needs to be sent separately.

BR,
Jani.

>
>
>> ---
>>   .../drm/i915/display/intel_dp_aux_backlight.c | 19 ++++++++++++-------
>>   1 file changed, 12 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>> index a8d56ebf06a2..7a6c07f6aaeb 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>> @@ -691,10 +691,9 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
>>   	struct intel_dp *intel_dp = intel_attached_dp(connector);
>>   	struct drm_device *dev = connector->base.dev;
>>   	struct intel_panel *panel = &connector->panel;
>> -	bool try_intel_interface = false;
>> +	bool try_intel_interface = false, try_vesa_interface = false;
>>   
>> -	/*
>> -	 * Check the VBT and user's module parameters to figure out which
>> +	/* Check the VBT and user's module parameters to figure out which
>>   	 * interfaces to probe
>>   	 */
>>   	switch (display->params.enable_dpcd_backlight) {
>> @@ -703,6 +702,7 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
>>   	case INTEL_DP_AUX_BACKLIGHT_AUTO:
>>   		switch (panel->vbt.backlight.type) {
>>   		case INTEL_BACKLIGHT_VESA_EDP_AUX_INTERFACE:
>> +			try_vesa_interface = true;
>>   			break;
>>   		case INTEL_BACKLIGHT_DISPLAY_DDI:
>>   			try_intel_interface = true;
>> @@ -715,12 +715,20 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
>>   		if (panel->vbt.backlight.type != INTEL_BACKLIGHT_VESA_EDP_AUX_INTERFACE)
>>   			try_intel_interface = true;
>>   
>> +		try_vesa_interface = true;
>> +		break;
>> +	case INTEL_DP_AUX_BACKLIGHT_FORCE_VESA:
>> +		try_vesa_interface = true;
>>   		break;
>>   	case INTEL_DP_AUX_BACKLIGHT_FORCE_INTEL:
>>   		try_intel_interface = true;
>>   		break;
>>   	}
>>   
>> +	/* For eDP 1.5 and above we are supposed to use VESA interface for brightness control */
>> +	if (intel_dp->edp_dpcd[0] >= DP_EDP_15)
>> +		try_vesa_interface = true;
>> +
>>   	/*
>>   	 * Since Intel has their own backlight control interface, the majority of machines out there
>>   	 * using DPCD backlight controls with Intel GPUs will be using this interface as opposed to
>> @@ -733,9 +741,6 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
>>   	 * panel with Intel's OUI - which is also required for us to be able to detect Intel's
>>   	 * backlight interface at all. This means that the only sensible way for us to detect both
>>   	 * interfaces is to probe for Intel's first, and VESA's second.
>> -	 *
>> -	 * Also there is a chance some VBTs may advertise false Intel backlight support even if the
>> -	 * TCON DPCD says otherwise. This means we keep VESA interface as fallback in that case.
>>   	 */
>>   	if (try_intel_interface && intel_dp->edp_dpcd[0] <= DP_EDP_14b &&
>>   	    intel_dp_aux_supports_hdr_backlight(connector)) {
>> @@ -745,7 +750,7 @@ int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
>>   		return 0;
>>   	}
>>   
>> -	if (intel_dp_aux_supports_vesa_backlight(connector)) {
>> +	if (try_vesa_interface && intel_dp_aux_supports_vesa_backlight(connector)) {
>>   		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Using VESA eDP backlight controls\n",
>>   			    connector->base.base.id, connector->base.name);
>>   		panel->backlight.funcs = &intel_dp_vesa_bl_funcs;

-- 
Jani Nikula, Intel
