Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3321C88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 10:11:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9733410E286;
	Wed, 16 Sep 2026 10:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iWrgYwuL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE06A10E286;
 Wed, 16 Sep 2026 10:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789553509; x=1821089509;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=s3hIsw0ocPTkho/KiQ+F1AVPzQKTXUerSYV7s7ET428=;
 b=iWrgYwuLp1v1EL0m60yZcvPc7pi3oJFwxql8NVyImDLHBZw/b2BZF+fD
 2vKMx9xD+bnG3ePiKLMMO/VSk8AykA3+fpipPIyfD4H2l8/blFXHAif5r
 rE+987Vi5eIpigmCpgMZUgo7kBf0Zl8yxSMVVbI3WA8Tl2m3wNFrohhk9
 wLvbkpQD7UHXVW3osUHmhpi8WSfM6sY21BtaQO4drlt5fMNul2IjFtGyQ
 cAPJfgFRDW4LNnzJpQLPA7V56wu/WKACEQjU7CdWoofTg/ukOnb2y8B2Z
 5FQBcT2D/a3GS3JTX08UmgrshNGwWISpHp0AnxnfEe6IA/pADzk29xIHW A==;
X-CSE-ConnectionGUID: RkahT7p8QsmWAGnpfNxYNg==
X-CSE-MsgGUID: gEcUzpDkSQyqbcJdYGo6Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="431137"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="431137"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 03:11:48 -0700
X-CSE-ConnectionGUID: dqQtW6gmRaSgY4XfLufB7g==
X-CSE-MsgGUID: gOLIFpC8SkWyh5hSecVYkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="303178094"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.147])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 03:11:45 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v2] drm/i915/display: Add command line param for DC balance
In-Reply-To: <IA1PR11MB63487EF9C59CDB94B9CD19BFB2B92@IA1PR11MB6348.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260915040015.2451786-1-mitulkumar.ajitkumar.golani@intel.com>
 <cc91cacab48c7134647a12da0bfb8c3832e2fc5b@intel.com>
 <IA1PR11MB63487EF9C59CDB94B9CD19BFB2B92@IA1PR11MB6348.namprd11.prod.outlook.com>
Date: Wed, 16 Sep 2026 13:11:43 +0300
Message-ID: <afe6c530dee1addee7da2f8e1909e2392767518a@intel.com>
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

On Wed, 16 Sep 2026, "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com> wrote:
>> -----Original Message-----
>> From: Jani Nikula <jani.nikula@linux.intel.com>
>> Sent: 16 September 2026 12:56
>> To: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
>> intel-gfx@lists.freedesktop.org
>> Cc: intel-xe@lists.freedesktop.org; Nautiyal, Ankit K
>> <ankit.k.nautiyal@intel.com>
>> Subject: Re: [PATCH v2] drm/i915/display: Add command line param for DC
>> balance
>> 
>> On Tue, 15 Sep 2026, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
>> wrote:
>> > Add an 'enable_dc_balance' display module parameter, disabled by
>> > default, so the feature can be explicitly opted in at driver
>> > initialization on configurations where it is known to be beneficial,
>> > while preserving existing behaviour everywhere else.
>> > intel_vrr_dc_balance_compute_config() honours the parameter, so no
>> > recompilation is needed to try the feature.
>> 
>> How does this preserve existing behaviour? This disables DC balance by
>> default. Why?
>> 
>> What are you trying to do? What is the goal?
>> 
>> We shouldn't be adding module parameters to begin with, and the *only*
>> reason for adding them is *debugging* only. Nothing else.
>> 
>> "feature can be explicitly opted in" is *not* what we use module parameters
>> for at all.
>> 
>> 
>> BR,
>> Jani.
>
>
> Hello Jani,
>  
> The intent is debugging and diagnosis rather than providing a feature opt-in.
>  
> We are currently seeing timing-related issues with DC balance on some panel/TCON
> combinations and are working with the DMC firmware team on the underlying fix.
> We are also identifying affected TCONs for appropriate quirks.
>  
> Keeping DC balance disabled by default allows us to preserve the existing VRR behavior
> while using the parameter to enable/disable DC balance during debugging and isolate issues
> caused by the algorithm versus the underlying VRR/display behavior.
>  
> I will also update commit message accordingly

Right, so the change to highlight is "disable DC balance by default",
not "add module parameter". The module parameter is completely secondary
to the main change.

When was DC balance added? Bacport? Fixes?


BR,
Jani.


>  
> Thanks,
> Mitul
>
>> 
>> 
>> >
>> > --v2:
>> > - Make enable_dc_balance a bool and keep it disabled by default; fix the
>> >   parameter type/value mismatch and correct the description (Chaitanya
>> >   Kumar Borah, Jani Nikula)
>> > - Explain in the commit message why the feature is gated and why a
>> >   module parameter is used (Jani Nikula)
>> >
>> > Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
>> > ---
>> >  drivers/gpu/drm/i915/display/intel_display_params.c | 4 ++++
>> > drivers/gpu/drm/i915/display/intel_display_params.h | 1 +
>> >  drivers/gpu/drm/i915/display/intel_vrr.c            | 4 +++-
>> >  3 files changed, 8 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c
>> > b/drivers/gpu/drm/i915/display/intel_display_params.c
>> > index 2aed110c5b090..ca0ef466bb103 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_display_params.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_display_params.c
>> > @@ -120,6 +120,10 @@ intel_display_param_named_unsafe(enable_psr,
>> int, 0400,
>> >  	"(0=disabled, 1=enable up to PSR1, 2=enable up to PSR2) "
>> >  	"Default: -1 (use per-chip default)");
>> >
>> > +intel_display_param_named_unsafe(enable_dc_balance, bool, 0400,
>> > +	"Enable VRR DC balance (0=disabled, 1=enabled). "
>> > +	"Default: 0 (disabled)");
>> > +
>> >  intel_display_param_named_unsafe(enable_panel_replay, int, 0400,
>> >  	"Enable Panel Replay (0=disabled, 1=enabled). Default: -1 (use
>> > per-chip default)");
>> >
>> > diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h
>> > b/drivers/gpu/drm/i915/display/intel_display_params.h
>> > index ba01aeaf89440..5c5a1a1358c32 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_display_params.h
>> > +++ b/drivers/gpu/drm/i915/display/intel_display_params.h
>> > @@ -46,6 +46,7 @@ struct drm_printer;
>> >  	param(bool, enable_dp_mst, true, 0600) \
>> >  	param(int, enable_fbc, -1, 0600) \
>> >  	param(int, enable_psr, -1, 0600) \
>> > +	param(bool, enable_dc_balance, false, 0600) \
>> >  	param(int, enable_panel_replay, -1, 0600) \
>> >  	param(bool, psr_safest_params, false, 0400) \
>> >  	param(bool, enable_psr2_sel_fetch, true, 0400) \ diff --git
>> > a/drivers/gpu/drm/i915/display/intel_vrr.c
>> > b/drivers/gpu/drm/i915/display/intel_vrr.c
>> > index e36db11744405..1698c54e258b4 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_vrr.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
>> > @@ -439,10 +439,12 @@ static bool intel_vrr_dc_balance_possible(const
>> > struct intel_crtc_state *crtc_st  static void
>> > intel_vrr_dc_balance_compute_config(struct intel_crtc_state
>> > *crtc_state)  {
>> > +	struct intel_display *display = to_intel_display(crtc_state);
>> >  	int guardband_usec, adjustment_usec;
>> >  	struct drm_display_mode *adjusted_mode =
>> > &crtc_state->hw.adjusted_mode;
>> >
>> > -	if (!intel_vrr_dc_balance_possible(crtc_state) || !crtc_state-
>> >vrr.enable)
>> > +	if (!intel_vrr_dc_balance_possible(crtc_state) ||
>> > +	    !crtc_state->vrr.enable || !display->params.enable_dc_balance)
>> >  		return;
>> >
>> >  	crtc_state->vrr.dc_balance.vmax = crtc_state->vrr.vmax;
>> 
>> --
>> Jani Nikula, Intel

-- 
Jani Nikula, Intel
