Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DD5CA9EC5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 15:07:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2920E10E437;
	Mon, 12 Oct 2026 15:07:20 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C666210E437
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 15:07:13 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 1AD546020A;
 Mon, 12 Oct 2026 15:07:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C9BC1F0089B;
 Mon, 12 Oct 2026 15:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791817632;
 bh=3O8DHHyQoErYFG+dKUD7qusJXWKkjYW1DQsnrBF3vsY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=EbjvEyCx7atKOdC85XWKACkie5XJBx7jw9b7+ENj/RJgq+K0mQ6c3C2kBTxrgxyQ5
 x36BwcQ1jMgH14GoGGy7/Ioq34cUp6w2p9YAEn+2qtcD1GCKRnMLx3/fRz84+ScjOB
 yTho/KyLvSLb/CGimdvSUW40vGy8jEfK3rM6nR7p4c0m9Hv+HGBRGSfjuhtO+fDMQZ
 YYilHxkpbZtyxhRZGc1nU+VBt6fMxTudZArKePK/vrokoJ4RdDJTZnnr07hOBT8FNz
 wjNKS0VimiRoTGPlgCCBr4tuRZk3ggWwBc5k7y3K7vbsPIpb8Je3J8UVMKieT9DNdA
 LAcxQY892OB0w==
Message-ID: <sashiko-outbox-168316@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/7] drm/xe/guc: capture additional engine state
 registers
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261012145237.3788198-8-naresh.kumar.g@intel.com>
References: <20261012145237.3788198-1-naresh.kumar.g@intel.com>
 <20261012145237.3788198-8-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 15:07:12 +0000
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
- [Medium] xe: missing GuC capture registers for video and pre-Xe3p render =
engines
- [Medium] xe: invalid MMIO accesses during GuC error capture due to mixed =
BCS/RCS registers
--

commit 5e669b4655462fa28596fd46c77d07300abb8f59
Author: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

    drm/xe/guc: capture additional engine state registers

This patch adds a wider set of engine state registers to the GuC error capt=
ure
to improve post-mortem debugging of engine hangs and reset-related failures.

> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_=
guc_capture.c
> index 6a20eab0f8204..b3c42052b70bb 100644
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
> =20
>  #define COMMON_XELP_RC_CLASS \
>  	{ RCU_MODE,			REG_32BIT,	0,	0,	0,	"RCU_MODE"}

[Severity: Medium]
When removing the execlist registers from COMMON_BASE_ENGINE_INSTANCE,
does this break the capture for engines that rely solely on the common list?

Since the new XE_BCS_RCS_ENGINE_INSTANCE macro is only added to the Blitter
and Xe3p Render lists, this leaves xe_rc_inst_regs (pre-Xe3p render/compute=
),
xe_vd_inst_regs (video), xe_vec_inst_regs (video enhance), and
xe_lp_gsc_inst_regs without any execlist status tracking during a GuC error
capture.

[ ... ]

> @@ -150,6 +146,32 @@ struct __guc_capture_parsed_output {
>  #define XE3P_BASE_ENGINE_INSTANCE \
>  	{ RING_CSMQDEBUG(0),		REG_32BIT,	0,	0,	0,	"CSMQDEBUG"}
> =20
> +#define XE3P_RC_SLICE_INSTANCE \
> +	{ FF_SLICE_CS_CHICKEN1(0), REG_32BIT, 0, 0, 0, "FF_SLICE_CS_CHICKEN1"},=
 \
> +	{ FF_SLICE_CS_CHICKEN2(0), REG_32BIT, 0, 0, 0, "FF_SLICE_CS_CHICKEN2"}
> +
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
> +
>  /* XE_LP Global */
>  static const struct __guc_mmio_reg_descr xe_lp_global_regs[] =3D {
>  	COMMON_XELP_BASE_GLOBAL,

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
> =20
>  /*

[Severity: Medium]
Does mixing Blitter and Render exclusive registers into a single macro cause
invalid MMIO accesses?

BCS_SWCTRL is Blitter-specific, while CS_CHICKEN1, CS_DEBUG_MODE1, and
CS_PREEMPTION_STATUS are Render-specific.

Because XE_BCS_RCS_ENGINE_INSTANCE is added to both xe_blt_inst_regs and
xe3p_rc_inst_regs, the GuC error capture will attempt to read unimplemented
MMIO addresses (Blitter offsets on Render engines and vice versa) during a
hang.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012145237.3788=
198-1-naresh.kumar.g@intel.com?part=3D7
