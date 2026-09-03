Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472A9C624A4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 14:33:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FAA10E123;
	Thu,  3 Sep 2026 14:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cPRDTh7z";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17CD710E123
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 14:33:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id DEC0541861;
 Thu,  3 Sep 2026 14:33:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E771F00A3E;
 Thu,  3 Sep 2026 14:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788446033;
 bh=TIxL+3hikHIRfFII3cQKl3aNk36uehIs0i0JJeAXZy8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=cPRDTh7ztsw+g469GePdVJt4iSFjZ63EUfI4WzXgH0uzIbrvT7g0lsnWSYQID6mWx
 IOPPyt34YiHKUrUl5V0PHzpwrKqyrLzg4ldO/qahDW4XlPM3SHmozdnipOdfKfU+eH
 7WLQ33KKa5HnlXY4h8Cwf0upOCKQw6D4Rn/Cli3g2dQNQeDPq1emH05HjmBRHN/Bmw
 S+HW6QJMpwrMiFTwfBlwkruOIewcdxfDrlxp13Od25d6TcW0WlJfWB2V375z2Pjln4
 wzrxqvyajkTQ+bpmwEfKg90Ti2o3/DZNnQvil1v9vGzfYOMpfhLkMf6abc1EuKgShd
 +GZkAXgC8Of6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/7] drm/xe/guc: capture additional engine state
 registers
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903141834.1315675-8-naresh.kumar.g@intel.com>
References: <20260903141834.1315675-1-naresh.kumar.g@intel.com>
 <20260903141834.1315675-8-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 14:33:53 +0000
Message-Id: <20260903143353.97E771F00A3E@smtp.kernel.org>
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
- [Medium] Regression in pre-Xe3 Render error capture due to registers omit=
ted from `xe_rc_inst_regs`.
- [Medium] Engine-specific registers are incorrectly grouped into a shared =
capture list, causing GuC to read invalid MMIO offsets during error capture=
 for mismatched engines.
--

commit 8561ce6705d44fcd9f5bafeb5f1a5d85ebea0ebb
Author: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

    drm/xe/guc: capture additional engine state registers
   =20
    Add a wider set of engine state registers to GuC error capture to impro=
ve
    post-mortem debugging of engine hangs and reset-related failures.

> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_=
guc_capture.c
> index 026e8d628c30c..7f8f9aaf8465d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -127,11 +127,7 @@ struct __guc_capture_parsed_output {
>  	{ RING_START(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
>  	{ RING_START_UDW(0),		REG_64BIT_HI_DW, 0,	0,	0,	"RING_START"}, \
>  	{ RING_DMA_FADD(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
> -	{ RING_DMA_FADD_UDW(0),		REG_64BIT_HI_DW, 0,	0,	0,	"RING_DMA_FADD"}, \
> -	{ RING_EXECLIST_STATUS_LO(0),	REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
> -	{ RING_EXECLIST_STATUS_HI(0),	REG_64BIT_HI_DW, 0,	0,	0,	"RING_EXECLIST_=
STATUS"}, \
> -	{ RING_EXECLIST_SQ_CONTENTS_LO(0), REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
> -	{ RING_EXECLIST_SQ_CONTENTS_HI(0), REG_64BIT_HI_DW, 0,	0,	0,	"RING_EXEC=
LIST_SQ_CONTENTS"}
> +	{ RING_DMA_FADD_UDW(0),		REG_64BIT_HI_DW, 0,	0,	0,	"RING_DMA_FADD"}

[Severity: Medium]
Will this cause a regression in pre-Xe3 Render error capture?

By removing the RING_EXECLIST_STATUS and RING_EXECLIST_SQ_CONTENTS register=
s=20
from the COMMON_BASE_ENGINE_INSTANCE macro, they are no longer included in=
=20
xe_rc_inst_regs:

static const struct __guc_mmio_reg_descr xe_rc_inst_regs[] =3D {
	COMMON_BASE_ENGINE_INSTANCE,
};

When a GPU hang occurs on a pre-Xe3 Render engine, GuC will now fail to=20
capture these critical registers because XE_BCS_RCS_ENGINE_INSTANCE is not=
=20
included in xe_rc_inst_regs.

[ ... ]

> +#define XE_BCS_RCS_ENGINE_INSTANCE \
> +	{ RING_EXECLIST_STATUS_LO(0), REG_64BIT_LOW_DW, 0, 0, 0, NULL}, \
> +	{ RING_EXECLIST_STATUS_HI(0), REG_64BIT_HI_DW, 0, 0, 0, "RING_EXECLIST_=
STATUS"}, \
> +	{ RING_EXECLIST_SQ_CONTENTS_LO(0), REG_64BIT_LOW_DW, 0, 0, 0, NULL}, \
> +	{ RING_EXECLIST_SQ_CONTENTS_HI(0), REG_64BIT_HI_DW, 0, 0, 0, "RING_EXEC=
LIST_SQ_CONTENTS"}, \
> +	{ RESET_CTRL(0), REG_32BIT, 0, 0, 0, "RESET_CTRL"}, \
> +	{ RING_CSBEFSM3(0), REG_32BIT, 0, 0, 0, "RING_CSBEFSM3"}, \
> +	{ RING_CSFESM(0), REG_32BIT, 0, 0, 0, "RING_CSFESM"}, \
> +	{ RING_CSFESM2(0), REG_32BIT, 0, 0, 0, "RING_CSFESM2"}, \
> +	{ RING_CSFESM3(0), REG_32BIT, 0, 0, 0, "RING_CSFESM3"}, \
> +	{ RING_CSPWRFSM(0), REG_32BIT, 0, 0, 0, "RING_CSPWRFSM"}, \
> +	{ RING_CSBEFSM(0), REG_32BIT, 0, 0, 0, "RING_CSBEFSM"}, \
> +	{ BCS_SWCTRL(0), REG_32BIT, 0, 0, 0, "BCS_SWCTRL"}, \
> +	{ RING_CSFE_GLB_CHICKEN3(0), REG_32BIT, 0, 0, 0, "RING_CSFE_GLB_CHICKEN=
3"}, \
> +	{ RING_PSMI_CTL(0), REG_32BIT, 0, 0, 0, "RING_PSMI_CTL"}, \
> +	{ RING_INSTPS(0), REG_32BIT, 0, 0, 0, "RING_INSTPS"}, \
> +	{ RING_BB_ADDR_DIFF(0), REG_32BIT, 0, 0, 0, "RING_BB_ADDR_DIFF"}, \
> +	{ RING_BB_STATE(0), REG_32BIT, 0, 0, 0, "RING_BB_STATE"}, \
> +	{ CS_DEBUG_MODE1(0), REG_32BIT, 0, 0, 0, "CS_DEBUG_MODE1"}, \
> +	{ CS_CHICKEN1(0), REG_32BIT, 0, 0, 0, "CS_CHICKEN1"}, \
> +	{ CS_PREEMPTION_STATUS(0), REG_32BIT, 0, 0, 0, "CS_PREEMPTION_STATUS"}

[ ... ]

> @@ -189,6 +211,7 @@ static const struct __guc_mmio_reg_descr xe_vec_inst_=
regs[] =3D {
>  /* Blitter Per-Engine-Instance */
>  static const struct __guc_mmio_reg_descr xe_blt_inst_regs[] =3D {
>  	COMMON_BASE_ENGINE_INSTANCE,
> +	XE_BCS_RCS_ENGINE_INSTANCE,
>  };
> =20
>  /* XE_LP - GSC Per-Engine-Instance */
> @@ -200,6 +223,8 @@ static const struct __guc_mmio_reg_descr xe_lp_gsc_in=
st_regs[] =3D {
>  static const struct __guc_mmio_reg_descr xe3p_rc_inst_regs[] =3D {
>  	COMMON_BASE_ENGINE_INSTANCE,
>  	XE3P_BASE_ENGINE_INSTANCE,
> +	XE_BCS_RCS_ENGINE_INSTANCE,
> +	XE3P_RC_SLICE_INSTANCE,
>  };

[Severity: Medium]
Will this mix engine-specific registers when capturing error state?

The XE_BCS_RCS_ENGINE_INSTANCE macro groups registers that belong exclusive=
ly=20
to different engine classes. For example, it includes BCS_SWCTRL=20
(Blitter-specific) alongside CS_CHICKEN1, CS_DEBUG_MODE1, and=20
CS_PREEMPTION_STATUS (Render-specific).

Because this macro is added to both xe_blt_inst_regs and xe3p_rc_inst_regs,=
=20
GuC will read Render-specific registers on Blitter engines, and=20
Blitter-specific registers on Render and Compute engines.=20

Could this corrupt the error capture dump with garbage data and potentially=
=20
cause speculative hardware timeouts or unclaimed register errors if the MMI=
O=20
offsets are unbacked on the mismatched engines?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903141834.1315=
675-1-naresh.kumar.g@intel.com?part=3D7
