Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7DB606A326
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 08:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gmVVusd/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCDA10E83F;
	Thu,  5 Nov 2026 08:25:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E6610E2C4;
 Thu,  5 Nov 2026 08:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793867145; x=1825403145;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6EBRjcp5G1Ckr8WeOTCb83fZ6iA4VB24J7u8Itoq+54=;
 b=gmVVusd/Wkhq4MWUCN9i5lT7WZqndl1DIwvidcPK/CVWkk71qXPRwmxn
 HzHQUOwhGE7efFH6NUUJmFrNYNsEcK1dtJFPJRKcuoAFXpAuIuJbL8c6h
 gAmpZoOQSwS/ScRGu9rgoY77vvvQ8iyH9GmuZSlr6Ol1CARzrDKQi3db0
 Yu8eq96mF/Y8l+WMM/iOgr9HGRRZlUt2X5FFRuPUid0lwFb9LcJn/8C2Q
 J50WqZWmOQj0skHar7e9Z4rbaKJUm7KyJ24uLQk84XvwwrJ3fDhZkHTgg
 Eh0lO37Cw6LVXmQrlBPm2WyDO9lmNYF9b6IRC1n5wFJqDL/2ubxI1mMx2 A==;
X-CSE-ConnectionGUID: XRm+MLmeTric3ShCainJYg==
X-CSE-MsgGUID: 9LP5rWC3R2+i58PhHzYkEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2738796"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2738796"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 00:25:45 -0800
X-CSE-ConnectionGUID: jhk4GLNOTuCKjxyiEG54tA==
X-CSE-MsgGUID: Mx28KSO3Q9eYAKiNMwYDdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6824973"
Received: from dev-417.igk.intel.com (HELO dev-417) ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 00:25:43 -0800
Date: Thu, 5 Nov 2026 09:25:38 +0100
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v1 2/2] drm/i915/psr: clean register macro's name from typo
Message-ID: <7ejc6pruwt3r55cuwi4ncqyzbzbr7b3piz3xt5zxbdsaft3ohk@asw7lnftulqx>
References: <20261104231812.1704129-1-michal.grzelak@linux.intel.com>
 <20261104231812.1704129-3-michal.grzelak@linux.intel.com>
 <sashiko-outbox-198292@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-198292@kernel.org>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 11:22:37PM GMT, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] drm/i915/psr: macro rename introduces new typo _CONTINOUOS_
> --
> 
> commit 6ee099cfe2ac28d1b7981063a5dd7a20aa5f8373
> Author: Michał Grzelak <michal.grzelak@linux.intel.com>
> 
> drm/i915/psr: clean register macro's name from typo
> 
> This commit renames ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME and
> PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME to fix a spelling typo in the
> register macro names.
> 
> > diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
> > index f7fae75751f54..2fd77313971be 100644
> > --- a/drivers/gpu/drm/i915/display/intel_psr.c
> > +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> > @@ -1074,7 +1074,7 @@ static void dg2_activate_panel_replay(struct intel_dp *intel_dp)
> >  
> >  	intel_de_rmw(display,
> >  		     PSR2_MAN_TRK_CTL(display, intel_dp->psr.transcoder),
> > -		     0, ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME);
> > +		     0, ADLP_PSR2_MAN_TRK_CTL_SF_CONTINOUOS_FULL_FRAME);
> >  
> >  	intel_de_rmw(display, TRANS_DP2_CTL(intel_dp->psr.transcoder), dp2_ctl_clear, dp2_ctl_set);
> >  }
> > @@ -2618,8 +2618,8 @@ static u32 man_trk_ctl_partial_frame_bit_get(struct intel_display *display)
> >  static u32 man_trk_ctl_continuous_full_frame(struct intel_display *display)
> >  {
> >  	return display->platform.alderlake_p || DISPLAY_VER(display) >= 14 ?
> > -	       ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME :
> > -	       PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME;
> > +	       ADLP_PSR2_MAN_TRK_CTL_SF_CONTINOUOS_FULL_FRAME :
> > +	       PSR2_MAN_TRK_CTL_SF_CONTINOUOS_FULL_FRAME;
> >  }
> >  
> >  static void intel_psr_force_update(struct intel_dp *intel_dp)
> > diff --git a/drivers/gpu/drm/i915/display/intel_psr_regs.h b/drivers/gpu/drm/i915/display/intel_psr_regs.h
> > index a57bc111290d1..56df4d2f97286 100644
> > --- a/drivers/gpu/drm/i915/display/intel_psr_regs.h
> > +++ b/drivers/gpu/drm/i915/display/intel_psr_regs.h
> > @@ -241,7 +241,7 @@
> >  #define  PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR_MASK		REG_GENMASK(20, 11)
> >  #define  PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR(val)		REG_FIELD_PREP(PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR_MASK, val)
> >  #define  PSR2_MAN_TRK_CTL_SF_SINGLE_FULL_FRAME			REG_BIT(3)
> > -#define  PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME		REG_BIT(2)
> > +#define  PSR2_MAN_TRK_CTL_SF_CONTINOUOS_FULL_FRAME		REG_BIT(2)
> >  #define  PSR2_MAN_TRK_CTL_SF_PARTIAL_FRAME_UPDATE		REG_BIT(1)
> >  #define  ADLP_PSR2_MAN_TRK_CTL_SU_REGION_START_ADDR_MASK	REG_GENMASK(28, 16)
> >  #define  ADLP_PSR2_MAN_TRK_CTL_SU_REGION_START_ADDR(val)	REG_FIELD_PREP(ADLP_PSR2_MAN_TRK_CTL_SU_REGION_START_ADDR_MASK, val)
> > @@ -249,7 +249,7 @@
> >  #define  ADLP_PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR(val)		REG_FIELD_PREP(ADLP_PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR_MASK, val)
> >  #define  ADLP_PSR2_MAN_TRK_CTL_SF_PARTIAL_FRAME_UPDATE		REG_BIT(31)
> >  #define  ADLP_PSR2_MAN_TRK_CTL_SF_SINGLE_FULL_FRAME		REG_BIT(14)
> > -#define  ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME		REG_BIT(13)
> > +#define  ADLP_PSR2_MAN_TRK_CTL_SF_CONTINOUOS_FULL_FRAME		REG_BIT(13)
> 
> [Severity: Low]
> This isn't a bug, but should _CONTINOUOS_ be _CONTINUOUS_ in
> PSR2_MAN_TRK_CTL_SF_CONTINOUOS_FULL_FRAME and
> ADLP_PSR2_MAN_TRK_CTL_SF_CONTINOUOS_FULL_FRAME (as well as their callers
> dg2_activate_panel_replay() and man_trk_ctl_continuous_full_frame()),
> matching LNL_CFF_CTL_SF_CONTINUOUS_FULL_FRAME?
> 

Yes.

BR,
Michał

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261104231812.1704129-1-michal.grzelak@linux.intel.com?part=2
