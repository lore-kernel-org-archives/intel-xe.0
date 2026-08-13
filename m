Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1D5C5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 14:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D838510E390;
	Thu, 13 Aug 2026 14:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VbLjimf8";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B679410E044
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 14:25:40 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 92D4C61884;
 Thu, 13 Aug 2026 14:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 209351F000E9;
 Thu, 13 Aug 2026 14:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786631139;
 bh=W+kDZDuNJpePIf2wgX3hX/SFgeeanIYQ6y2SKee5PgQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=VbLjimf8vAC0t6q8hmmtwnmQXbSGDYdMNfXDeAiiOmQb53gI9Y1dM7U7lzeVi8egx
 n6F6921bttM72P2ufa83HKEjZ0xd5CapZNmCiwVfgdWAdwwAO9BouO/EwRwIoJVGUq
 8Yqa4VnwNF+9zotmBbS1wfhLaB+Xl8ab1ARYZWlTT0Oytq87UFCWGmsznVZ76cGVYW
 GyCirWXMIaAa3hsgOW5/TDJz24tubs8vfWzLmWDy7FmsEB5R3137KTE5kXinD3OFiM
 snX9WMe/IL1Was/IR7YxOiUS4Al5+rlg8ntaUsZpLZy5GGtpIbJVZQBhf9bcKXxjoz
 RCPCQ/NUTBU4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] drm/xe/guc: add TDL gfx registers to capture list
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260813133037.2912699-6-naresh.kumar.g@intel.com>
References: <20260813133037.2912699-1-naresh.kumar.g@intel.com>
 <20260813133037.2912699-6-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 14:25:36 +0000
Message-Id: <20260813142539.209351F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Typographical error in register name 'ROW_INSDONE_TDL_GFX' (miss=
ing 'T' in 'INSTDONE').
- [Low] Improper indentation using spaces instead of tabs.
--

--- Patch [5]: [PATCH 5/6] drm/xe/guc: add TDL gfx registers to capture lis=
t ---
commit 3c0be61d6ad550502777320cdeb9da502f084893
Author: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

drm/xe/guc: add TDL gfx registers to capture list

Add ROW_INSDONE_TDL_GFX and SS_LSC_HDC_IDLE_TDL_GFX register
definitions and include them in the XeHPG extended GuC capture register
list.

> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/re=
gs/xe_gt_regs.h
> index 25014bccd3a69..8c55d766a5a63 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -572,6 +572,9 @@
>  #define EU_SYSTOLIC_LIC_THROTTLE_CTL_WITH_LOCK	XE_REG_MCR(0xe534)
>  #define   EU_SYSTOLIC_LIC_THROTTLE_CTL_LOCK_BIT	REG_BIT(31)
> =20
> +#define ROW_INSDONE_TDL_GFX                    XE_REG_MCR(0xe580)
          ^^^^^^^^^^^^^^^^^^^
[Severity: Medium]
This isn't a bug, but there seems to be a typo in the register name.=20
Should this be ROW_INSTDONE_TDL_GFX (missing 'T' in INSTDONE)? If userspace
telemetry and GPU hang analysis tools rely on substring matching for
'INSTDONE', they will silently miss this register.

> +#define SS_LSC_HDC_IDLE_TDL_GFX                        XE_REG_MCR(0xe584)

[Severity: Low]
This isn't a bug, but it looks like these definitions use spaces instead of
tabs for alignment, unlike the surrounding macros.

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_=
guc_capture.c
> index 368769857c9b8..a6052da717878 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -376,7 +376,9 @@ static const struct __ext_steer_reg xehpg_extregs[] =
=3D {
>  	{"SC_INSTDONE",			XEHPG_SC_INSTDONE},
>  	{"SC_INSTDONE_EXTRA",		XEHPG_SC_INSTDONE_EXTRA},
>  	{"SC_INSTDONE_EXTRA2",		XEHPG_SC_INSTDONE_EXTRA2},
> -	{"INSTDONE_GEOM_SVGUNIT",	XEHPG_INSTDONE_GEOM_SVGUNIT}
> +	{"INSTDONE_GEOM_SVGUNIT",	XEHPG_INSTDONE_GEOM_SVGUNIT},
> +	{"ROW_INSDONE_TDL_GFX",		ROW_INSDONE_TDL_GFX},
         ^^^^^^^^^^^^^^^^^^^^^
[Severity: Medium]
Since this string name is exported to userspace and GuC capture tools, will=
=20
the misspelled "INSDONE" break tooling expectations that look for "INSTDONE=
"?

> +	{"SS_LSC_HDC_IDLE_TDL_GFX",	SS_LSC_HDC_IDLE_TDL_GFX}
>  };
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813133037.2912=
699-1-naresh.kumar.g@intel.com?part=3D5
