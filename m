Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42274606A31B
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 06:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q+phqceJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58CE10E529;
	Fri, 23 Oct 2026 06:26:36 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442D310E529
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 06:26:30 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 17F1E600E2;
 Fri, 23 Oct 2026 06:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 982D31F01825;
 Fri, 23 Oct 2026 06:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792736788;
 bh=IzrUTti2FTTmQX/kjPRQpYM15zmjZdHcysiXV2hr1OM=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Q+phqceJs/Xw9ETpr4pstN4MU4sEgT1b6LdGh7E+TrVZG6PPMZddI4EHDljh/90P5
 mLLh3vDkQgEsTQftCafhYEUaAt7owP54/JEFIUAcEySRrH5rtbhxOuZrnvmmnXw+Lt
 V06aC2MheTBiktWcBIui7ALFtiVz5ecWJyedCLwpkV48Xlp/pKUE+ukfSGbegtL3/a
 bIV5nc6my2Qg9i9npw+7tJjTjlnlgwCbszgkRW7PSPD1RA+yNPXiLzPzPGFsA+DWPW
 M9PZd44GdbAUoj1EmY9mtShWHCnEvqS6qg/DLV+oMcNRwxmG0gwJXdSWLTNBNRDBGH
 aefb422bPNaVw==
Message-ID: <sashiko-outbox-182346@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 7/7] drm/xe/guc: capture additional engine state
 registers
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261023060554.2643515-8-naresh.kumar.g@intel.com>
References: <20261023060554.2643515-1-naresh.kumar.g@intel.com>
 <20261023060554.2643515-8-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 06:26:28 +0000
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
- [Medium] drm/xe/guc: unused FF_SLICE_CS_CHICKEN2 definition and missing c=
apture entry
- [Medium] drm/xe/guc: use xe3p_blt_inst_regs for GUC_CAPTURE_LIST_CLASS_PA=
GING on Xe3p
--

commit 3bf1615b3ab8603f52d531a35c295135f10f2aa4
Author: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

drm/xe/guc: capture additional engine state registers

This commit defines additional engine state register offsets in
xe_engine_regs.h and includes them in the GuC error capture lists for Xe3p
render/compute and blitter engines, while also splitting out xe2_extregs[]
for steered register capture.

> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/x=
e/regs/xe_engine_regs.h
> index 94033982e6944..9f328b1b18f57 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h

[ ... ]

> @@ -123,15 +128,21 @@
>  #define FF_SLICE_CS_CHICKEN1(base)		XE_REG((base) + 0xe0, XE_REG_OPTION_=
MASKED)
>  #define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
> =20
> +#define FF_SLICE_CS_CHICKEN2(base)		XE_REG((base) + 0xe4, XE_REG_OPTION_=
MASKED)

[ ... ]

> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_=
guc_capture.c
> index 6a20eab0f8204..2e13df97e1068 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c

[ ... ]

> @@ -200,6 +230,15 @@ static const struct __guc_mmio_reg_descr xe_lp_gsc_i=
nst_regs[] =3D {
>  static const struct __guc_mmio_reg_descr xe3p_rc_inst_regs[] =3D {
>  	COMMON_BASE_ENGINE_INSTANCE,
>  	XE3P_BASE_ENGINE_INSTANCE,
> +	XE3P_CS_DEBUG_INSTANCE,
> +	XE3P_RC_CS_PREEMPT_INSTANCE,
> +};

[Severity: Medium]
Was FF_SLICE_CS_CHICKEN2 (along with FF_SLICE_CS_CHICKEN1) accidentally
dropped from xe3p_rc_inst_regs[] in drivers/gpu/drm/xe/xe_guc_capture.c?

The commit message notes that the new register definitions in
drivers/gpu/drm/xe/regs/xe_engine_regs.h are included in the GuC capture
list, and the v3 changelog specifically mentions adding
XE3P_RC_SLICE_INSTANCE with FF_SLICE_CS_CHICKEN1 and FF_SLICE_CS_CHICKEN2 to
xe3p_rc_inst_regs[].

However, XE3P_RC_SLICE_INSTANCE is absent from drivers/gpu/drm/xe/xe_guc_ca=
pture.c,
which leaves FF_SLICE_CS_CHICKEN2 completely unused and omits both registers
when GuC error capture initializes xe3p_rc_inst_regs[] for
GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE.

> +
> +/* Xe3p Blitter Per-Engine-Instance */
> +static const struct __guc_mmio_reg_descr xe3p_blt_inst_regs[] =3D {
> +	XE_BLT_INST_REGS,
> +	XE3P_CS_DEBUG_INSTANCE,
> +	XE3P_BCS_ONLY_INSTANCE,
>  };
> =20
>  /*
> @@ -264,7 +303,7 @@ static const struct __guc_mmio_reg_descr_group xe3p_l=
ists[] =3D {
>  	MAKE_REGLIST(xe_vec_class_regs, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLAS=
S_VIDEOENHANCE),
>  	MAKE_REGLIST(xe_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CL=
ASS_VIDEOENHANCE),
>  	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_=
BLITTER),
> -	MAKE_REGLIST(xe_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CL=
ASS_BLITTER),
> +	MAKE_REGLIST(xe3p_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_=
CLASS_BLITTER),
>  	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_=
GSC_OTHER),
>  	MAKE_REGLIST(xe_lp_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST=
_CLASS_GSC_OTHER),
>  	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_=
PAGING),

[Severity: Medium]
Should the GUC_CAPTURE_LIST_CLASS_PAGING entry right below this in
xe3p_lists[] also be updated from xe_blt_inst_regs to xe3p_blt_inst_regs?

In drivers/gpu/drm/xe/xe_guc_capture.c:xe3p_lists[]:

	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_BLI=
TTER),
	MAKE_REGLIST(xe3p_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLA=
SS_BLITTER),
	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_GSC=
_OTHER),
	MAKE_REGLIST(xe_lp_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CL=
ASS_GSC_OTHER),
	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_PAG=
ING),
	MAKE_REGLIST(xe_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS=
_PAGING),

When xe_guc_has_paging_engine() in drivers/gpu/drm/xe/xe_guc.c is true on
Xe3p platforms, xe_hwe_to_guc_class() maps the USM-reserved physical BCS
engine (gt->usm.paging_hwe0) to GUC_PAGING_CLASS, which
xe_hwe_to_guc_capture_class() maps to GUC_CAPTURE_LIST_CLASS_PAGING.

Leaving GUC_CAPTURE_LIST_CLASS_PAGING pointing to xe_blt_inst_regs means
both ADS capture list population (guc_capture_prep_lists() ->
xe_guc_capture_getlist()) and manual engine snapshots
(xe_engine_manual_capture() -> xe_guc_capture_get_reg_desc_list()) for the
paging BCS engine will omit XE3P_CS_DEBUG_INSTANCE and
XE3P_BCS_ONLY_INSTANCE.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023060554.2643=
515-1-naresh.kumar.g@intel.com?part=3D7
