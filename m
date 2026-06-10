Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F21ECD98CE
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 18:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021A110EBA4;
	Wed, 10 Jun 2026 18:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UsQo0tbA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D61E10EB9C;
 Wed, 10 Jun 2026 18:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781117685; x=1812653685;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=T3Vn+n5c0DHViaMxNrdKeHogSMpVzQsGdlXLC1tvHHw=;
 b=UsQo0tbAB5haIDKVVER0LFe0uYRIdJMc9y4gIdJmU7JZq64ffyw1l24B
 hkKBOEvV8WYh3G/IxQNkGiJ1jYykvPmIPueVYkrLw9QvxVvoF0SbzWu4u
 d4DTSFyUXKJveil7r88RjLAD7Gbd9NED75Uq2mf6KZ94Q+1fGK0oepe2a
 3VkP6RgkMKBvzDTbsfJVI7IChIEA+GdxGrgr4wbjnX9eQtcbrtcdMzMIf
 90f0sSLhYL+jwjBZY6rSDubHujeo5RMNt1TMYoJCd2xAOg7IX31Z378PR
 VEHNgDCS+9ZDW+2UNRsln+xlmOzTM0DZHpeFjEE/SvO/KqPH+d8LdiZ0n Q==;
X-CSE-ConnectionGUID: XkBbZ220QWiPVmg+8Elg1w==
X-CSE-MsgGUID: bAVE4/GeQz+dhooS+CC8xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="104585840"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="104585840"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 11:54:45 -0700
X-CSE-ConnectionGUID: K5gi68zrRcOQvp/o8qFW+A==
X-CSE-MsgGUID: UQrNdxn/SrWvzpNcnLhFVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="250166004"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.62])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 11:54:43 -0700
Date: Wed, 10 Jun 2026 21:54:39 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 02/14] drm/i915/cdclk: Pass CDCLK in MHz to pcode on DG2
Message-ID: <aimy71wEwM-ky0Tw@intel.com>
References: <20260610170652.5320-1-ville.syrjala@linux.intel.com>
 <20260610170652.5320-3-ville.syrjala@linux.intel.com>
 <4e72aea4331149f4f54016dfb884e171255ba483@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e72aea4331149f4f54016dfb884e171255ba483@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Wed, Jun 10, 2026 at 08:31:48PM +0300, Jani Nikula wrote:
> On Wed, 10 Jun 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > We are currently trying to pass the CDCLK in kHz to the pcode
> > on DG2, while the pcode expects a value in MHz units. Adjust
> > the units appropriately.
> 
> How is it working? :o

I don't think DG2 pcode does all that much a with the information.
Eg. AFAIK it doesn't actually adjust any voltages due to this stuff.
I think it's more for some internal power usage estimates or something,
but dunno what that really means in practice.

> 
> Fixes: ?
> 
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_cdclk.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
> > index 9ca56bab281f..9718062d8d6c 100644
> > --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> > +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> > @@ -2703,8 +2703,10 @@ static void intel_cdclk_pcode_pre_notify(struct intel_atomic_state *state)
> >  	 * if CDCLK is decreasing or not changing, set bits 25:16 to current CDCLK,
> >  	 * which basically means we choose the maximum of old and new CDCLK, if we know both
> >  	 */
> > -	if (change_cdclk)
> > +	if (change_cdclk) {
> >  		cdclk = max(new_cdclk_state->actual.cdclk, old_cdclk_state->actual.cdclk);
> > +		cdclk = DIV_ROUND_UP(cdclk, 1000);
> > +	}
> 
> I'd consider s/cdclk/cdclk_mhz/g here and in intel_pcode_notify() to
> emphasize it's not kHz.
> 
> >  	/*
> >  	 * According to "Sequence For Pipe Count Change",
> > @@ -2740,8 +2742,10 @@ static void intel_cdclk_pcode_post_notify(struct intel_atomic_state *state)
> >  	 * According to "Sequence After Frequency Change",
> >  	 * set bits 25:16 to current CDCLK
> >  	 */
> > -	if (update_cdclk)
> > +	if (update_cdclk) {
> >  		cdclk = new_cdclk_state->actual.cdclk;
> > +		cdclk = DIV_ROUND_UP(cdclk, 1000);
> > +	}
> 
> Ditto.
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> >  
> >  	/*
> >  	 * According to "Sequence For Pipe Count Change",
> 
> -- 
> Jani Nikula, Intel

-- 
Ville Syrjälä
Intel
