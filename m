Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E818E91291
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 08:43:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0175710E7FF;
	Thu,  5 Feb 2026 08:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PKszagUu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D601110E7FC;
 Thu,  5 Feb 2026 08:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770281001; x=1801817001;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Fzn3APnUIf2o0xwfNa6O4Y7qyvZdQVb0pGfw3QFh5Rk=;
 b=PKszagUuhciDdpRcjRSuz1L1JPgozldWlqL2D2s3Ghxig3i1yUcNZc7H
 IKcKFapIALfRhcWD66jWnWDEZUfUsr34c3gXQgDZ2+s1lWM9gtRyo6GxW
 p49vpQsqwWM+UIRTLDilPKlcJd+l26wRurPpFoJ2Ak+/XNhlfKpSXJ2gO
 zFCYS6fG1EUISxZzINfeKJP7G4w6nztaeZnRdbbaHl76pIcLeKX3jxeV/
 ueawJc6Efvc3jzxVAoTiHI58W/Fm7FtsLjEhV8EwmyWTgpWfo1yUJ+HBT
 DvMazxW2b5yDugTeXacmkb/ZITcfVsBK4haF8w92VDf+k9U79UpCIIrv6 A==;
X-CSE-ConnectionGUID: iorWsYkhQbiaoxIFZlNv+w==
X-CSE-MsgGUID: vJYLOO2jTLyayS9ga2FTqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="89055311"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="89055311"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 00:43:20 -0800
X-CSE-ConnectionGUID: LJpft9gRSfOlpDszB5xhsw==
X-CSE-MsgGUID: iT0bfYKfSdm8uhXZLF9xNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="233376987"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.69])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 00:43:17 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Manna, Animesh"
 <animesh.manna@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Cc: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>,
 "Manna, Animesh" <animesh.manna@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [PATCH v2 01/10] drm/i915/cmtg: enable cmtg LNL onwards
In-Reply-To: <DM3PPF208195D8D827F4A684F2F77BFDA37E399A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260203134407.2823406-1-animesh.manna@intel.com>
 <20260203134407.2823406-2-animesh.manna@intel.com>
 <DM3PPF208195D8D827F4A684F2F77BFDA37E399A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Date: Thu, 05 Feb 2026 10:43:14 +0200
Message-ID: <6205ad21c44367b94dcaa09964d63a6494c861cf@intel.com>
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

On Thu, 05 Feb 2026, "Kandpal, Suraj" <suraj.kandpal@intel.com> wrote:
>> Subject: [PATCH v2 01/10] drm/i915/cmtg: enable cmtg LNL onwards
>> 
>> Introduce a flag for cmtg. LNL onwards CMTG support will be added.
>> Set the flag as per DISPLAY_VER() check.
>> 
>
> Use Capitalized versions of acronyms unless unavoidable(if you mention it as a part of a function)
> both in commit subject and message, this review stands for all patch in series it should be *CMTG
>
> Also please Bspec references to registers, sequences on all patches this makes life very easy to review
> This is also a review for all the patches in the series
>
>> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_display_types.h | 4 ++++
>>  drivers/gpu/drm/i915/display/intel_dp.c            | 4 ++++
>>  2 files changed, 8 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
>> b/drivers/gpu/drm/i915/display/intel_display_types.h
>> index e6298279dc89..1081615a14fb 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
>> @@ -1569,6 +1569,10 @@ struct intel_crtc {  #endif
>> 
>>  	bool vblank_psr_notify;
>> +
>> +	struct {
>> +		bool enable;
>> +	} cmtg;
>>  };
>> 
>>  struct intel_plane_error {
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
>> b/drivers/gpu/drm/i915/display/intel_dp.c
>> index e2fd01d1a1e4..ecf8ed0c0265 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -3445,6 +3445,7 @@ intel_dp_compute_config(struct intel_encoder
>> *encoder,
>>  	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
>>  	const struct drm_display_mode *fixed_mode;
>>  	struct intel_connector *connector = intel_dp->attached_connector;
>> +	struct intel_crtc *crtc = to_intel_crtc(pipe_config->uapi.crtc);
>>  	int ret = 0, link_bpp_x16;
>> 
>>  	fixed_mode = intel_panel_fixed_mode(connector, adjusted_mode);
>> @@ -3549,6 +3550,9 @@ intel_dp_compute_config(struct intel_encoder
>> *encoder,
>>  	intel_dp_compute_vsc_sdp(intel_dp, pipe_config, conn_state);
>>  	intel_dp_compute_hdr_metadata_infoframe_sdp(intel_dp,
>> pipe_config, conn_state);
>> 
>> +	if (DISPLAY_VER(display) >= 15 && intel_dp_is_edp(intel_dp))
>> +		crtc->cmtg.enable = true;
>
> Should be >= 20 since LNL's version was 20.
> Also I don't see a point of having this as a variable in intel_crtc this can be checked as a macro or a function

Yeah, compute config should not modify anything but the crtc state.

BR,
Jani.


> Maybe you have to use intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP) instead on intel_dp_is_edp but it should be better option
> According to me.
>
> Regards,
> Suraj Kandpal
>
>> +
>>  	return intel_dp_tunnel_atomic_compute_stream_bw(state, intel_dp,
>> connector,
>>  							pipe_config);
>>  }
>> --
>> 2.29.0
>

-- 
Jani Nikula, Intel
