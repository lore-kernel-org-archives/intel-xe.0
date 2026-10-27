Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33362606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 05:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FJSA66CP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E715F10E124;
	Tue, 27 Oct 2026 05:21:49 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1F910E124
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 05:21:43 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3805660008;
 Tue, 27 Oct 2026 05:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C49631F01825;
 Tue, 27 Oct 2026 05:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793078502;
 bh=Q1I1PbP/+0MePc2uQKhtjBz8kcQO2f6Qax8OhcrHXnE=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=FJSA66CPKxVsM9MFINiMJQSHeuyR0Wk4M3Tys36XqCLm/b+IDoITo/e1pKrUflu1i
 BBs+FlNTOusMGntDfDXsQp2ZfYwAx7zTkvINfcO4LUL7a5WSrvohIcHALrIab+ssWm
 VGt1qjbMZZFKhsldZvx+9SuHuqGU1GAoRIMa3ktsqM0tna9few5EvLnstkwfG7TowS
 z/AcN5SVO9Ty7usDvHxAkDUmf+yPMZQC7+T02/fjM3Pn5176xYo4N8q7MMDJHhraev
 Ui/x5njGB0hZck/E1QlUYuX3/wOX77TgL4BtViSRnGtUh1m8icTa5tMfzoL2nhvOiR
 fmH1jH44/780g==
Message-ID: <sashiko-outbox-186110@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 7/7] drm/xe/guc: capture additional engine state
 registers
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261027051024.465587-8-naresh.kumar.g@intel.com>
References: <20261027051024.465587-1-naresh.kumar.g@intel.com>
 <20261027051024.465587-8-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 05:21:42 +0000
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] drm/xe/guc: duplicate RING_BB_ADDR_DIFF entry in Xe3p capture li=
sts
- [Medium] drm/xe/guc: wrong regname on BB_START_ADDR 64-bit capture descri=
ptor
--

commit 700a38622c50aa9b624276048304bba0a59f3809
Author: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

drm/xe/guc: capture additional engine state registers

This commit adds additional engine state register offsets in
xe_engine_regs.h and includes them in the GuC error capture register lists
to provide more engine context in post-mortem capture dumps.

> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_=
guc_capture.c
> index a8a3271991e2a..f255799428617 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -124,6 +124,8 @@ struct __guc_capture_parsed_output {
>  	{ RING_ACTHD_UDW(0),		REG_64BIT_HI_DW, 0,	0,	0,	"ACTHD"}, \
>  	{ RING_BBADDR(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
>  	{ RING_BBADDR_UDW(0),		REG_64BIT_HI_DW, 0,	0,	0,	"RING_BBADDR"}, \
> +	{ BB_START_ADDR(0),		REG_64BIT_LOW_DW, 0,	0,	0,	"BB_START_ADDR"}, \
> +	{ BB_START_ADDR_UDW(0),		REG_64BIT_HI_DW, 0,	0,	0,	"BB_START_ADDR_UDW"}=
, \

[Severity: Medium]
Should the regname for BB_START_ADDR(0) in COMMON_BASE_ENGINE_INSTANCE be
NULL and the regname for BB_START_ADDR_UDW(0) be "BB_START_ADDR", matching
the other 64-bit register pairs?

When an engine reset triggers xe_guc_capture_snapshot_print() ->
snapshot_print_by_list_order(), REG_64BIT_LOW_DW only records last_value and
last_address without using reg_desc->regname, while REG_64BIT_HI_DW combines
both dwords and prints reg_desc->regname from the high-dword entry:

drivers/gpu/drm/xe/xe_guc_capture.c:snapshot_print_by_list_order() {
	...
		case REG_64BIT_HI_DW: {
			u64 value_qw =3D ((u64)value << 32) | last_value;

			XE_WARN_ON(!low32_ready);
			low32_ready =3D false;

			drm_printf(p, "\t%s: 0x%016llx [addr=3D0x%x]\n",
				   reg_desc->regname,
				   value_qw,
				   last_address);
			break;
		}
	...
}

With the current descriptors, won't the combined 64-bit value at offset
0x150 be printed as "BB_START_ADDR_UDW" instead of "BB_START_ADDR" in
devcoredump output?

>  	{ RING_START(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
>  	{ RING_START_UDW(0),		REG_64BIT_HI_DW, 0,	0,	0,	"RING_START"}, \
>  	{ RING_DMA_FADD(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
> @@ -131,7 +133,9 @@ struct __guc_capture_parsed_output {
>  	{ RING_EXECLIST_STATUS_LO(0),	REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
>  	{ RING_EXECLIST_STATUS_HI(0),	REG_64BIT_HI_DW, 0,	0,	0,	"RING_EXECLIST_=
STATUS"}, \
>  	{ RING_EXECLIST_SQ_CONTENTS_LO(0), REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
> -	{ RING_EXECLIST_SQ_CONTENTS_HI(0), REG_64BIT_HI_DW, 0,	0,	0,	"RING_EXEC=
LIST_SQ_CONTENTS"}
> +	{ RING_EXECLIST_SQ_CONTENTS_HI(0), REG_64BIT_HI_DW, 0,	0,	0,	"RING_EXEC=
LIST_SQ_CONTENTS"}, \
> +	{ RING_BUFFER_HEAD_PREEMPT_REG(0),		REG_32BIT, 0,	0,	0,	"RING_BUFFER_HE=
AD_PREEMPT_REG"}, \
> +	{ RING_BB_ADDR_DIFF(0),		REG_32BIT, 0,	0,	0,	"RING_BB_ADDR_DIFF"} \
> =20
>  #define COMMON_XELP_RC_CLASS \
>  	{ RCU_MODE,			REG_32BIT,	0,	0,	0,	"RCU_MODE"}
> @@ -150,6 +154,37 @@ struct __guc_capture_parsed_output {
>  #define XE3P_BASE_ENGINE_INSTANCE \
>  	{ RING_CSMQDEBUG(0),		REG_32BIT,	0,	0,	0,	"CSMQDEBUG"}
> =20
> +#define XE3P_RC_SLICE_INSTANCE \
> +	{ FF_SLICE_CS_CHICKEN1(0), REG_32BIT, 0, 0, 0, "FF_SLICE_CS_CHICKEN1"},=
 \
> +	{ FF_SLICE_CS_CHICKEN2(0), REG_32BIT, 0, 0, 0, "FF_SLICE_CS_CHICKEN2"}
> +
> +#define XE3P_CS_DEBUG_INSTANCE \
> +	{ RESET_CTRL(0),		REG_32BIT,	0,	0,	0,	"RESET_CTRL"}, \
> +	{ RING_CSBEFSM3(0),		REG_32BIT,	0,	0,	0,	"RING_CSBEFSM3"}, \
> +	{ RING_CSFESM(0),		REG_32BIT,	0,	0,	0,	"RING_CSFESM"}, \
> +	{ RING_CSFESM2(0),		REG_32BIT,	0,	0,	0,	"RING_CSFESM2"}, \
> +	{ RING_CSFESM3(0),		REG_32BIT,	0,	0,	0,	"RING_CSFESM3"}, \
> +	{ RING_CSPWRFSM(0),		REG_32BIT,	0,	0,	0,	"RING_CSPWRFSM"}, \
> +	{ RING_CSBEFSM(0),		REG_32BIT,	0,	0,	0,	"RING_CSBEFSM"}, \
> +	{ RING_CSFE_GLB_CHICKEN3(0),	REG_32BIT,	0,	0,	0,	"RING_CSFE_GLB_CHICKEN=
3"}, \
> +	{ RING_PSMI_CTL(0),		REG_32BIT,	0,	0,	0,	"RING_PSMI_CTL"}, \
> +	{ RING_INSTPS(0),		REG_32BIT,	0,	0,	0,	"RING_INSTPS"}, \
> +	{ RING_BB_ADDR_DIFF(0),		REG_32BIT,	0,	0,	0,	"RING_BB_ADDR_DIFF"}, \
> +	{ RING_BB_STATE(0),		REG_32BIT,	0,	0,	0,	"RING_BB_STATE"}
> +
> +/*
> + * CS_CHICKEN1 has GPGPU/3D preempt bits; keep with RCS/CCS only.
> + * RCS+CCS share GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE, so these cannot
> + * be RCS-only.
> + */
> +#define XE3P_RC_CS_PREEMPT_INSTANCE \
> +	{ CS_DEBUG_MODE1(0),		REG_32BIT,	0,	0,	0,	"CS_DEBUG_MODE1"}, \
> +	{ CS_CHICKEN1(0),		REG_32BIT,	0,	0,	0,	"CS_CHICKEN1"}, \
> +	{ CS_PREEMPTION_STATUS(0),	REG_32BIT,	0,	0,	0,	"CS_PREEMPTION_STATUS"}
> +
> +#define XE3P_BCS_ONLY_INSTANCE \
> +	{ BCS_SWCTRL(0),		REG_32BIT,	0,	0,	0,	"BCS_SWCTRL"}
> +
>  /* XE_LP Global */
>  static const struct __guc_mmio_reg_descr xe_lp_global_regs[] =3D {
>  	COMMON_XELP_BASE_GLOBAL,
> @@ -186,9 +221,12 @@ static const struct __guc_mmio_reg_descr xe_vec_inst=
_regs[] =3D {
>  	COMMON_BASE_ENGINE_INSTANCE,
>  };
> =20
> +#define XE_BLT_INST_REGS \
> +	COMMON_BASE_ENGINE_INSTANCE
> +
>  /* Blitter Per-Engine-Instance */
>  static const struct __guc_mmio_reg_descr xe_blt_inst_regs[] =3D {
> -	COMMON_BASE_ENGINE_INSTANCE,
> +	XE_BLT_INST_REGS,
>  };
> =20
>  /* XE_LP - GSC Per-Engine-Instance */
> @@ -200,6 +238,16 @@ static const struct __guc_mmio_reg_descr xe_lp_gsc_i=
nst_regs[] =3D {
>  static const struct __guc_mmio_reg_descr xe3p_rc_inst_regs[] =3D {
>  	COMMON_BASE_ENGINE_INSTANCE,
>  	XE3P_BASE_ENGINE_INSTANCE,
> +	XE3P_CS_DEBUG_INSTANCE,
> +	XE3P_RC_CS_PREEMPT_INSTANCE,
> +	XE3P_RC_SLICE_INSTANCE,
> +};
> +
> +/* Xe3p Blitter Per-Engine-Instance */
> +static const struct __guc_mmio_reg_descr xe3p_blt_inst_regs[] =3D {
> +	XE_BLT_INST_REGS,
> +	XE3P_CS_DEBUG_INSTANCE,
> +	XE3P_BCS_ONLY_INSTANCE,
>  };

[Severity: Medium]
Does including RING_BB_ADDR_DIFF(0) in both COMMON_BASE_ENGINE_INSTANCE and
XE3P_CS_DEBUG_INSTANCE duplicate that register in xe3p_rc_inst_regs[] and
xe3p_blt_inst_regs[]?

Because xe3p_rc_inst_regs[] expands both COMMON_BASE_ENGINE_INSTANCE and
XE3P_CS_DEBUG_INSTANCE, and xe3p_blt_inst_regs[] expands XE_BLT_INST_REGS
(which aliases COMMON_BASE_ENGINE_INSTANCE) alongside XE3P_CS_DEBUG_INSTANC=
E,
RING_BB_ADDR_DIFF(0) appears twice in both arrays.

On Xe3p platforms where guc_capture_get_device_reglist() selects
xe3p_lists[], this causes RING_BB_ADDR_DIFF(0) to be registered twice in the
GuC ADS capture list via guc_capture_list_init(), captured twice during
manual engine capture in read_reg_to_node(), and printed twice in
devcoredump output via snapshot_print_by_list_order().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027051024.4655=
87-1-naresh.kumar.g@intel.com?part=3D7
