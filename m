Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820EB606A31B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 23:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PykJplve
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDC410E1B0;
	Wed,  4 Nov 2026 23:22:44 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D52210E1B0;
 Wed,  4 Nov 2026 23:22:38 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 25F0E43D7E;
 Wed,  4 Nov 2026 23:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0A8F1F000C1;
 Wed,  4 Nov 2026 23:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793834558;
 bh=IljyPPFNq+as6b6cZLHjGgBRCsbEkQwB8VfsH/OhiQA=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=PykJplveChs/B01O0BRtLn80aDj3IN8Dy5pZYY7X0x9MF1J3CxJlEHCJuK6g32YTt
 TqskJfH99G3b8pZmyy/4gnh28LgeHkp2x5vAOb+IXM+d5yq/q4g4fYZ5cpbaC5jWgA
 5nWpqlaODAMqrtbjo75EonPTPL2JzSrHiVB5nkmAQFyjhbGeGC2MKg7pgPhBC1bqG9
 ycgILqJodXRg2dopdJcKXcXUZXQ8yuFHMzoRRZaMR8EG/tWwlnx33/N40OOILtcvWb
 w+RB9XvychKwLQbEcgX3/vFYQHWdIKFppgN1Z40yygLG1gjQOG1Y37e76WNDQhMjRZ
 K7JOc8VPGvRKg==
Message-ID: <sashiko-outbox-198292@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] drm/i915/psr: clean register macro's name from typo
To: =?utf-8?b?TWljaGHFgiBHcnplbGFr?= <michal.grzelak@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20261104231812.1704129-3-michal.grzelak@linux.intel.com>
References: <20261104231812.1704129-1-michal.grzelak@linux.intel.com>
 <20261104231812.1704129-3-michal.grzelak@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 23:22:37 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] drm/i915/psr: macro rename introduces new typo _CONTINOUOS_
--

commit 6ee099cfe2ac28d1b7981063a5dd7a20aa5f8373
Author: Micha=C5=82 Grzelak <michal.grzelak@linux.intel.com>

drm/i915/psr: clean register macro's name from typo

This commit renames ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME and
PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME to fix a spelling typo in the
register macro names.

> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i=
915/display/intel_psr.c
> index f7fae75751f54..2fd77313971be 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -1074,7 +1074,7 @@ static void dg2_activate_panel_replay(struct intel_=
dp *intel_dp)
> =20
>  	intel_de_rmw(display,
>  		     PSR2_MAN_TRK_CTL(display, intel_dp->psr.transcoder),
> -		     0, ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME);
> +		     0, ADLP_PSR2_MAN_TRK_CTL_SF_CONTINOUOS_FULL_FRAME);
> =20
>  	intel_de_rmw(display, TRANS_DP2_CTL(intel_dp->psr.transcoder), dp2_ctl_=
clear, dp2_ctl_set);
>  }
> @@ -2618,8 +2618,8 @@ static u32 man_trk_ctl_partial_frame_bit_get(struct=
 intel_display *display)
>  static u32 man_trk_ctl_continuous_full_frame(struct intel_display *displ=
ay)
>  {
>  	return display->platform.alderlake_p || DISPLAY_VER(display) >=3D 14 ?
> -	       ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME :
> -	       PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME;
> +	       ADLP_PSR2_MAN_TRK_CTL_SF_CONTINOUOS_FULL_FRAME :
> +	       PSR2_MAN_TRK_CTL_SF_CONTINOUOS_FULL_FRAME;
>  }
> =20
>  static void intel_psr_force_update(struct intel_dp *intel_dp)
> diff --git a/drivers/gpu/drm/i915/display/intel_psr_regs.h b/drivers/gpu/=
drm/i915/display/intel_psr_regs.h
> index a57bc111290d1..56df4d2f97286 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_psr_regs.h
> @@ -241,7 +241,7 @@
>  #define  PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR_MASK		REG_GENMASK(20, 11)
>  #define  PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR(val)		REG_FIELD_PREP(PSR2_M=
AN_TRK_CTL_SU_REGION_END_ADDR_MASK, val)
>  #define  PSR2_MAN_TRK_CTL_SF_SINGLE_FULL_FRAME			REG_BIT(3)
> -#define  PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME		REG_BIT(2)
> +#define  PSR2_MAN_TRK_CTL_SF_CONTINOUOS_FULL_FRAME		REG_BIT(2)
>  #define  PSR2_MAN_TRK_CTL_SF_PARTIAL_FRAME_UPDATE		REG_BIT(1)
>  #define  ADLP_PSR2_MAN_TRK_CTL_SU_REGION_START_ADDR_MASK	REG_GENMASK(28,=
 16)
>  #define  ADLP_PSR2_MAN_TRK_CTL_SU_REGION_START_ADDR(val)	REG_FIELD_PREP(=
ADLP_PSR2_MAN_TRK_CTL_SU_REGION_START_ADDR_MASK, val)
> @@ -249,7 +249,7 @@
>  #define  ADLP_PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR(val)		REG_FIELD_PREP(A=
DLP_PSR2_MAN_TRK_CTL_SU_REGION_END_ADDR_MASK, val)
>  #define  ADLP_PSR2_MAN_TRK_CTL_SF_PARTIAL_FRAME_UPDATE		REG_BIT(31)
>  #define  ADLP_PSR2_MAN_TRK_CTL_SF_SINGLE_FULL_FRAME		REG_BIT(14)
> -#define  ADLP_PSR2_MAN_TRK_CTL_SF_CONTINUOS_FULL_FRAME		REG_BIT(13)
> +#define  ADLP_PSR2_MAN_TRK_CTL_SF_CONTINOUOS_FULL_FRAME		REG_BIT(13)

[Severity: Low]
This isn't a bug, but should _CONTINOUOS_ be _CONTINUOUS_ in
PSR2_MAN_TRK_CTL_SF_CONTINOUOS_FULL_FRAME and
ADLP_PSR2_MAN_TRK_CTL_SF_CONTINOUOS_FULL_FRAME (as well as their callers
dg2_activate_panel_replay() and man_trk_ctl_continuous_full_frame()),
matching LNL_CFF_CTL_SF_CONTINUOUS_FULL_FRAME?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104231812.1704=
129-1-michal.grzelak@linux.intel.com?part=3D2
