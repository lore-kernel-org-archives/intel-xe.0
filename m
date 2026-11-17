Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099F9606A32C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 16:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SNLsQ3jv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F6010F7EA;
	Tue, 17 Nov 2026 16:42:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C3410E1E9;
 Tue, 17 Nov 2026 16:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794933737; x=1826469737;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ACghu4UkJaO43l4XeTjYfOaiaydWWXpQ+H2N5YHOvo8=;
 b=SNLsQ3jviIi0nd7AA3nBjsmSqRBctqJprjXL6GS7RTd4LObp1geJyLg1
 c6y3DROsK6jB5Zq8JVL2/yuibwd6qU9mCdGSSYZNqn7djyH5E4GaDMH/e
 ZCRgdfuLS7Ja2oThDWx/oy/RvaMsyoqZhwaDZEiuGyz7qgiO9XoWwpsLw
 XzO9pjc6aoIQo9JBXxf95ZYuR++hDsW1kwhHPxjGx1y2wM8hHWsEbfqS9
 m4drpYT28G0QRYD7FfKTxVG2/YV8y/wAJpFmWr4x09gF641Dh31kKay8m
 Iognjdw5kuZYWpgmxQGFejlAb5i2fqW2JXdXAz78+oNoTFOjzAj3FefTo A==;
X-CSE-ConnectionGUID: yavbjO/5RcOjA6HkjlvP5w==
X-CSE-MsgGUID: JGMJMortRritS7iD4DMbxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3707917"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3707917"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 08:42:16 -0800
X-CSE-ConnectionGUID: oHUh12qLRa6rcm2mpl6jQg==
X-CSE-MsgGUID: 1ye7LhZcQLmYwlS6g+03bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9943149"
Received: from dev-417.igk.intel.com (HELO dev-417) ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 08:42:15 -0800
Date: Tue, 17 Nov 2026 17:41:42 +0100
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@linux.intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1 2/2] drm/i915/psr: clean register macro's name from typo
Message-ID: <x2lfaqsfstljgxzvzewgkepf4yb7vu2vzs2t24joglsmqkwvze@f6e6vntw7zvy>
References: <20261104231812.1704129-1-michal.grzelak@linux.intel.com>
 <20261104231812.1704129-3-michal.grzelak@linux.intel.com>
 <DS4PPFE901A304FC4C5B1FA4B93526BB552E3722@DS4PPFE901A304F.namprd11.prod.outlook.com>
 <DS4PPFE901A304FC60900D006E7FFCD74FDE3722@DS4PPFE901A304F.namprd11.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS4PPFE901A304FC60900D006E7FFCD74FDE3722@DS4PPFE901A304F.namprd11.prod.outlook.com>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 06:29:34AM GMT, Kandpal, Suraj wrote:
> > Subject: RE: [PATCH v1 2/2] drm/i915/psr: clean register macro's name from
> > typo
> > 
> > > Subject: [PATCH v1 2/2] drm/i915/psr: clean register macro's name from
> > > typo
> > >
> > > Apply s/_CONTINUOS_/_CONTINOUOS_/ for both
> > > ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME and
> > > PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME.
> > >
> > > No functional change.
> > >
> > > Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
> > 
> > LGTM,
> > Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > 
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_psr.c      | 6 +++---
> > >  drivers/gpu/drm/i915/display/intel_psr_regs.h | 4 ++--
> > >  2 files changed, 5 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_psr.c
> > > b/drivers/gpu/drm/i915/display/intel_psr.c
> > > index 5bfac64284ef8..5e0cf34e1a819 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_psr.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> > > @@ -1074,7 +1074,7 @@ static void dg2_activate_panel_replay(struct
> > > intel_dp
> > > *intel_dp)
> > >
> > >  	intel_de_rmw(display,
> > >  		     PSR2_MAN_TRK_CTL(display, intel_dp->psr.transcoder),
> > > -		     0,
> > > ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME);
> > > +		     0,
> > > ADLP_PSR2_MAN_TRK_CTL_SF_CONTINOUOS_FULL_FRAME);
> > >
> > >  	intel_de_rmw(display, TRANS_DP2_CTL(intel_dp->psr.transcoder),
> > > dp2_ctl_clear, dp2_ctl_set);  } @@ -2618,8 +2618,8 @@ static u32
> > > man_trk_ctl_partial_frame_bit_get(struct intel_display *display)
> > > static u32 man_trk_ctl_continuous_full_frame(struct intel_display *display)  {
> > >  	return display->platform.alderlake_p || DISPLAY_VER(display) >= 14 ?
> > > -	       ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME :
> > > -	       PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME;
> > > +	       ADLP_PSR2_MAN_TRK_CTL_SF_CONTINOUOS_FULL_FRAME :
> > > +	       PSR2_MAN_TRK_CTL_SF_CONTINOUOS_FULL_FRAME;
> > >  }
> > >
> > >  static void intel_psr_force_update(struct intel_dp *intel_dp) diff
> > > --git a/drivers/gpu/drm/i915/display/intel_psr_regs.h
> > > b/drivers/gpu/drm/i915/display/intel_psr_regs.h
> > > index a57bc111290d1..56df4d2f97286 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_psr_regs.h
> > > +++ b/drivers/gpu/drm/i915/display/intel_psr_regs.h
> > > @@ -241,7 +241,7 @@
> > >  #define  PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR_MASK
> > > 	REG_GENMASK(20, 11)
> > >  #define  PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR(val)
> > > 	REG_FIELD_PREP(PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR_MASK
> > > , val)
> > >  #define  PSR2_MAN_TRK_CTL_SF_SINGLE_FULL_FRAME
> > > 	REG_BIT(3)
> > > -#define  PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME
> > > 	REG_BIT(2)
> > > +#define  PSR2_MAN_TRK_CTL_SF_CONTINOUOS_FULL_FRAME
> > > 	REG_BIT(2)
> > >  #define  PSR2_MAN_TRK_CTL_SF_PARTIAL_FRAME_UPDATE
> > > 	REG_BIT(1)
> > >  #define  ADLP_PSR2_MAN_TRK_CTL_SU_REGION_START_ADDR_MASK
> > > 	REG_GENMASK(28, 16)
> > >  #define  ADLP_PSR2_MAN_TRK_CTL_SU_REGION_START_ADDR(val)
> > > 	REG_FIELD_PREP(ADLP_PSR2_MAN_TRK_CTL_SU_REGION_START_ADD
> > > R_MASK, val)
> > > @@ -249,7 +249,7 @@
> > >  #define  ADLP_PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR(val)
> > > 	REG_FIELD_PREP(ADLP_PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR
> > > _MASK, val)
> > >  #define  ADLP_PSR2_MAN_TRK_CTL_SF_PARTIAL_FRAME_UPDATE
> > > 	REG_BIT(31)
> > >  #define  ADLP_PSR2_MAN_TRK_CTL_SF_SINGLE_FULL_FRAME
> > > 	REG_BIT(14)
> > > -#define  ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME
> > > 	REG_BIT(13)
> > > +#define  ADLP_PSR2_MAN_TRK_CTL_SF_CONTINOUOS_FULL_FRAME
> > > 	REG_BIT(13)
> 
> *Continuous
> 😝

... O:)

> 
> With that fixed LGTM
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> 

Thanks!

Since I somehow lost this email will reply to the newest version with
your R-B. Apologies.

BR,
Michał

> > >
> > >  #define _LNL_SFF_CTL_A				0x60918
> > >  #define _LNL_SFF_CTL_B				0x61918
> > > --
> > > 2.45.2
> 
