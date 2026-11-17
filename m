Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B976E606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 16:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XJdnSp1b
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DCEC10E0B5;
	Tue, 17 Nov 2026 16:51:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355EE10E03D;
 Tue, 17 Nov 2026 16:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794934254; x=1826470254;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=RVbeGnjq7KaXWOUH6csM05wjSdyXPF70+mDwGauu5sc=;
 b=XJdnSp1bdoA9mnPzc2KAMpxJYQPU+5rsM4NOzE97MFtAm2x8zxSvUEtO
 fjxUI343yUm9ztTlNNCgQHMg/sb3oJUX8YV61YwDYEwBqAW3E3wK/ghr5
 jVs2alORa6I/JJm3EbWFucFwFIUyYudpjcEGBM8v41AnSP1MHy5fJS9Ej
 JTfsXSuxPq9SKe+tvSohvoaQkhILPViMdFH+fNY23gat+JA0rFbsF8uQU
 Se4vfg4qBAhCYS9q7mt0riAkV9K2WefbzHPqtQJry+MWZY7ntnQlTCF6f
 8xwNzj1px0FnQEr3B7yfqzsyGiSynlN6BMqC4uQIQutHNbWOIba/Xjsc2 A==;
X-CSE-ConnectionGUID: wR9CT+8mT+6S1yJgprhoVw==
X-CSE-MsgGUID: GpkCvUIIQ3SMlOryicUsGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3755760"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3755760"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 08:50:54 -0800
X-CSE-ConnectionGUID: mbI+lyCqS9Gaw/OJSLTvlw==
X-CSE-MsgGUID: laHnmQgqRgyydcRUs/9d5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9790438"
Received: from dev-417.igk.intel.com (HELO dev-417) ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 08:50:52 -0800
Date: Tue, 17 Nov 2026 17:50:46 +0100
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
Subject: Re: [PATCH v2 2/2] drm/i915/psr: clean register macro's name from typo
Message-ID: <kaltkkwzj6xocxy4l4ka4gaqrmglwrz6cabijn25ijphykafm7@2nhsrajyo6lj>
References: <20261115132305.3326951-1-michal.grzelak@linux.intel.com>
 <20261115132305.3326951-3-michal.grzelak@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261115132305.3326951-3-michal.grzelak@linux.intel.com>
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
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 15, 2026 at 02:23:05PM GMT, Michał Grzelak wrote:
> Apply s/_CONTINUOS_/_CONTINUOUS_/ for both
> ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME and
> PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME.
> 
> No functional change.
> 
> v1->v2
> - apply correct substitution (Sashiko)

This should include Suraj as well.

> 
> Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>

Missed Suraj's review from previous version:

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_psr.c      | 6 +++---
>  drivers/gpu/drm/i915/display/intel_psr_regs.h | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
> index f1091c85d7018..28d7ec408159f 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -1074,7 +1074,7 @@ static void dg2_activate_panel_replay(struct intel_dp *intel_dp)
>  
>  	intel_de_rmw(display,
>  		     PSR2_MAN_TRK_CTL(display, intel_dp->psr.transcoder),
> -		     0, ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME);
> +		     0, ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOUS_FULL_FRAME);
>  
>  	intel_de_rmw(display, TRANS_DP2_CTL(intel_dp->psr.transcoder), dp2_ctl_clear, dp2_ctl_set);
>  }
> @@ -2618,8 +2618,8 @@ static u32 man_trk_ctl_partial_frame_bit_get(struct intel_display *display)
>  static u32 man_trk_ctl_continuous_full_frame(struct intel_display *display)
>  {
>  	return display->platform.alderlake_p || DISPLAY_VER(display) >= 14 ?
> -	       ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME :
> -	       PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME;
> +	       ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOUS_FULL_FRAME :
> +	       PSR2_MAN_TRK_CTL_SF_CONTINUOUS_FULL_FRAME;
>  }
>  
>  static void intel_psr_force_update(struct intel_dp *intel_dp)
> diff --git a/drivers/gpu/drm/i915/display/intel_psr_regs.h b/drivers/gpu/drm/i915/display/intel_psr_regs.h
> index a57bc111290d1..90e50b616fc5f 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_psr_regs.h
> @@ -241,7 +241,7 @@
>  #define  PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR_MASK		REG_GENMASK(20, 11)
>  #define  PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR(val)		REG_FIELD_PREP(PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR_MASK, val)
>  #define  PSR2_MAN_TRK_CTL_SF_SINGLE_FULL_FRAME			REG_BIT(3)
> -#define  PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME		REG_BIT(2)
> +#define  PSR2_MAN_TRK_CTL_SF_CONTINUOUS_FULL_FRAME		REG_BIT(2)
>  #define  PSR2_MAN_TRK_CTL_SF_PARTIAL_FRAME_UPDATE		REG_BIT(1)
>  #define  ADLP_PSR2_MAN_TRK_CTL_SU_REGION_START_ADDR_MASK	REG_GENMASK(28, 16)
>  #define  ADLP_PSR2_MAN_TRK_CTL_SU_REGION_START_ADDR(val)	REG_FIELD_PREP(ADLP_PSR2_MAN_TRK_CTL_SU_REGION_START_ADDR_MASK, val)
> @@ -249,7 +249,7 @@
>  #define  ADLP_PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR(val)		REG_FIELD_PREP(ADLP_PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR_MASK, val)
>  #define  ADLP_PSR2_MAN_TRK_CTL_SF_PARTIAL_FRAME_UPDATE		REG_BIT(31)
>  #define  ADLP_PSR2_MAN_TRK_CTL_SF_SINGLE_FULL_FRAME		REG_BIT(14)
> -#define  ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME		REG_BIT(13)
> +#define  ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOUS_FULL_FRAME		REG_BIT(13)
>  
>  #define _LNL_SFF_CTL_A				0x60918
>  #define _LNL_SFF_CTL_B				0x61918
> -- 
> 2.45.2
> 
