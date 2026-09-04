Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD47C79F80
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 08:44:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B77B10F96E;
	Fri,  4 Sep 2026 08:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XC3RGx76";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2751C10F96A;
 Fri,  4 Sep 2026 08:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788511452; x=1820047452;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ly7OS0pQ+cSHHYRhq/4QRvY8bFfBu54mBjaeKPaHHYs=;
 b=XC3RGx76gYiaEDbMfx1n4UeVW4QYfg+MYOokBq46u6F6kPE3QNNEBJTy
 PmVhV+xPRmRS2fEmVVHaGtAKVwgH1vujmWjkB1SmCibp+mLsuuCeJFUSH
 dNo1y3tKcgs9kEJrMqUXNTty31FW1CDd6rKPxSjM6Q9uv/mR54DZQiZiv
 TGODmnePY2ohS29e2qxJ+qiTPReya7AAEeC3m4GuH+0VjERuCON4McW4p
 BQ/i9i5tFAL+7H6xICu96V7itOVlPs2Cn7+d2JS15v67iVyL4E/EyeN50
 r0QosG7X7zQ0fkMdpCi6tBY776zquMF9XxJQp4dpzpHgR+8ljREKk/1vU w==;
X-CSE-ConnectionGUID: b7V6KYTZSDqvN2aoYZMEEg==
X-CSE-MsgGUID: IR4hgfFASZGkycIpHBdFTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="89063666"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="89063666"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 01:44:11 -0700
X-CSE-ConnectionGUID: mNdmyLEiTmWR/W4FznyQHg==
X-CSE-MsgGUID: +zhoXd4VSNCV6TcOhQaiJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="266301349"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.29])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 01:44:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v1] drm/i915/display: Add command line param for DC balance
In-Reply-To: <IA1PR11MB6348B33BDBECAB92F9E5F87EB2B52@IA1PR11MB6348.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260828085037.1430881-1-mitulkumar.ajitkumar.golani@intel.com>
 <23a0819e-35b9-4061-ba87-288601f9fbeb@intel.com>
 <IA1PR11MB6348B33BDBECAB92F9E5F87EB2B52@IA1PR11MB6348.namprd11.prod.outlook.com>
Date: Fri, 04 Sep 2026 11:44:07 +0300
Message-ID: <9d5bd09bf9446fd8142804271d52dbc5964e5e72@intel.com>
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

On Fri, 04 Sep 2026, "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com> wrote:
>> -----Original Message-----
>> From: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
>> Sent: 28 August 2026 15:46
>> To: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
>> intel-gfx@lists.freedesktop.org
>> Cc: intel-xe@lists.freedesktop.org; Nautiyal, Ankit K
>> <ankit.k.nautiyal@intel.com>
>> Subject: Re: [PATCH v1] drm/i915/display: Add command line param for DC
>> balance
>> 
>> 
>> 
>> On 8/28/2026 2:20 PM, Mitul Golani wrote:
>> > Add a new module parameter 'enable_dc_balance' to allow enabling or
>> > disabling the VRR DC balance feature at runtime. The DC balance
>> > computation in intel_vrr_dc_balance_compute_config() now honours this
>> > parameter, so the feature can be toggled without recompiling.
>> >
>> > Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
>> > ---
>> >   drivers/gpu/drm/i915/display/intel_display_params.c | 3 +++
>> >   drivers/gpu/drm/i915/display/intel_display_params.h | 1 +
>> >   drivers/gpu/drm/i915/display/intel_vrr.c            | 4 +++-
>> >   3 files changed, 7 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c
>> > b/drivers/gpu/drm/i915/display/intel_display_params.c
>> > index 2aed110c5b09..ed3aa84c5d43 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_display_params.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_display_params.c
>> > @@ -120,6 +120,9 @@ intel_display_param_named_unsafe(enable_psr, int,
>> 0400,
>> >   	"(0=disabled, 1=enable up to PSR1, 2=enable up to PSR2) "
>> >   	"Default: -1 (use per-chip default)");
>> >
>> > +intel_display_param_named_unsafe(enable_dc_balance, int, 0400,
>> > +	"Enable DC Balance (0=disabled, 1=enable). Default: 1 (use per-chip
>> > +default)");
>> > +
>> >   intel_display_param_named_unsafe(enable_panel_replay, int, 0400,
>> >   	"Enable Panel Replay (0=disabled, 1=enabled). Default: -1 (use
>> > per-chip default)");
>> >
>> > diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h
>> > b/drivers/gpu/drm/i915/display/intel_display_params.h
>> > index b95ecf728daa..8c28c27e2c46 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_display_params.h
>> > +++ b/drivers/gpu/drm/i915/display/intel_display_params.h
>> > @@ -46,6 +46,7 @@ struct drm_printer;
>> >   	param(bool, enable_dp_mst, true, 0600) \
>> >   	param(int, enable_fbc, -1, 0600) \
>> >   	param(int, enable_psr, -1, 0600) \
>> > +	param(int, enable_dc_balance, false, 0600) \
>> 
>> You mean true?
>
> Yes should be true by default. I will update in next revision.

My comment on the rationale of the whole module parameter is more
important, but if we end up with this, the parameter types and values
need to match, i.e. int and integers, bool and true/false.

BR,
Jani.

>
> Thanks
>
>> 
>> >   	param(int, enable_panel_replay, -1, 0600) \
>> >   	param(bool, psr_safest_params, false, 0400) \
>> >   	param(bool, enable_psr2_sel_fetch, true, 0400) \ diff --git
>> > a/drivers/gpu/drm/i915/display/intel_vrr.c
>> > b/drivers/gpu/drm/i915/display/intel_vrr.c
>> > index e36db1174440..1698c54e258b 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_vrr.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
>> > @@ -439,10 +439,12 @@ static bool intel_vrr_dc_balance_possible(const
>> struct intel_crtc_state *crtc_st
>> >   static void
>> >   intel_vrr_dc_balance_compute_config(struct intel_crtc_state *crtc_state)
>> >   {
>> > +	struct intel_display *display = to_intel_display(crtc_state);
>> >   	int guardband_usec, adjustment_usec;
>> >   	struct drm_display_mode *adjusted_mode =
>> > &crtc_state->hw.adjusted_mode;
>> >
>> > -	if (!intel_vrr_dc_balance_possible(crtc_state) || !crtc_state-
>> >vrr.enable)
>> > +	if (!intel_vrr_dc_balance_possible(crtc_state) ||
>> > +	    !crtc_state->vrr.enable || !display->params.enable_dc_balance)
>> >   		return;
>> >
>> >   	crtc_state->vrr.dc_balance.vmax = crtc_state->vrr.vmax;
>

-- 
Jani Nikula, Intel
