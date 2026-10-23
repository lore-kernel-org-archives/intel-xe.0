Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C4E606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 06:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WoTIJsf7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A929D10E4D8;
	Fri, 23 Oct 2026 06:24:15 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086E610E4D8
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 06:24:09 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B196443DAC;
 Fri, 23 Oct 2026 06:24:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73BDF1F01825;
 Fri, 23 Oct 2026 06:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792736648;
 bh=Dd743sc1KpNzaMT6kL5E2adoN6aVagKyFYwkRKlwdz4=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=WoTIJsf7/5fkTo2ss6haxlZwb6J2hXPS2Rfz7vMsecLpWZ23tD5ylO68qjSeQZAJE
 r2Wto53DrtjS4bQRPE/2CADHu9ZlnBsMoQVGkvrAmFXelStdJpqALE/YK51mTNSMoD
 mdjlr6XApc6c/eR956p4XcmtDuJqvDpibhiGP6pa08zDrarYJYJAbf4WO5m+LCtNLA
 ZJWy633eakXCI5zx9l6urCeuLim6WOBGU+y1vQU/DTCrWLyYxLkXlfbKOschv6qJa3
 lPppLk2eJIp/S/I3zHocdLM5IS1byM+HPwAZHTtEIAKQCY940Ld9G6Q6nUh1pKA4Jb
 2x8LMQpKs6IdQ==
Message-ID: <sashiko-outbox-182343@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/7] drm/xe: capture L3 node status registers in
 devcoredump
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261023060554.2643515-7-naresh.kumar.g@intel.com>
References: <20261023060554.2643515-1-naresh.kumar.g@intel.com>
 <20261023060554.2643515-7-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 06:24:07 +0000
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/xe: unconditional MCR read of L3_NODE_IDLE in devcoredump wa=
rns on Xe_LP
--

commit a9405a6ae4ac2ac19e20c8fe6b73ddfd266de12d
Author: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

drm/xe: capture L3 node status registers in devcoredump

This commit adds the L3_NODE_IDLE and L3STAT_LBCF_GFX register definitions
and includes them as a node status section in the devcoredump snapshot. It
also extends struct xe_reg_desc to support MCR registers so they can be read
via xe_gt_mcr_unicast_read_any() during snapshot capture.

> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/re=
gs/xe_gt_regs.h
> index 2e4cb4957479f..55f0eee4e20e8 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -454,6 +454,9 @@
>  #define   L3_ESC_MASK				REG_BIT(0)
>  #define   L3_ESC(value)				REG_FIELD_PREP(L3_ESC_MASK, value)
> =20
> +#define L3_NODE_IDLE				XE_REG_MCR(0xb0b0)
> +#define L3STAT_LBCF_GFX				XE_REG_MCR(0xb128)
> +
>  #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
>  #define   XEHP_LNESPARE				REG_BIT(19)
> =20
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_=
devcoredump.c
> index 8d59f80e2929f..de9ef3e0cb5dd 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c

[ ... ]

> @@ -119,6 +121,11 @@ static const struct xe_reg_desc xe_dbg_gam_pf_reglis=
t[] =3D {
>  	XE_REG_DESC(PAGE_FLTRPTQ_TAIL_GAMCTRL, "PAGE_FLTRPTQ_TAIL_GAMCTRL"),
>  };
> =20
> +static const struct xe_reg_desc xe_dbg_l3_node_reglist[] =3D {
> +	XE_REG_DESC_MCR(L3_NODE_IDLE, "L3_NODE_IDLE"),
> +	XE_REG_DESC_MCR(L3STAT_LBCF_GFX, "L3STAT_LBCF_GFX"),
> +};

[ ... ]

> @@ -262,8 +275,13 @@ xe_dbg_reg_snapshot_capture_target(struct xe_gt *gt,
> =20
>  	snap->desc	=3D reglist;
>  	snap->num_regs =3D reglist->num_regs;
> -	for (i =3D 0; i < reglist->num_regs; i++)
> -		snap->values[i] =3D xe_mmio_read32(&gt->mmio, reglist->regs[i].reg);
> +	for (i =3D 0; i < reglist->num_regs; i++) {
> +		if (reglist->regs[i].reg.mcr)
> +			snap->values[i] =3D xe_gt_mcr_unicast_read_any(gt,
> +								     reglist->regs[i].mcr_reg);
> +		else
> +			snap->values[i] =3D xe_mmio_read32(&gt->mmio, reglist->regs[i].reg);
> +	}
> =20
>  	return snap;
>  }

[ ... ]

> @@ -602,6 +625,10 @@ static void xe_devcoredump_capture_gt_regs(struct xe=
_devcoredump_snapshot *ss,
>  						       other_gt,
>  						       XE_DBG_REGSET_GAM_PF,
>  						       XE_GT_TYPE_MAIN);
> +	ss->ns =3D xe_dbg_gt_snapshot_capture(gt,
> +					    other_gt,
> +					    XE_DBG_REGSET_L3_NODE,
> +					    XE_GT_TYPE_MAIN);
>  }

[Severity: Medium]
Will capturing XE_DBG_REGSET_L3_NODE unconditionally on all platforms trigg=
er
a kernel warning in xe_gt_mcr_get_nonterminated_steering() when a devcoredu=
mp
is taken on Xe_LP platforms (such as TGL, RKL, DG1, or ADL)?

L3_NODE_IDLE is defined at offset 0xb0b0 with XE_REG_MCR(), which statically
sets reg.mcr =3D 1 in xe_dbg_l3_node_reglist[]. During a GPU hang or job
timeout, the capture path runs:

  devcoredump_snapshot()
    -> xe_devcoredump_capture_gt_regs()
      -> xe_dbg_gt_snapshot_capture()
        -> xe_dbg_reg_snapshot_capture_target()
          -> xe_gt_mcr_unicast_read_any(gt, L3_NODE_IDLE)
            -> xe_gt_mcr_get_nonterminated_steering()

However, on pre-Xe_HP platforms (GRAPHICS_VERx100(xe) < 1250), the
0x00b000-0x00b0ff LNCF/NODE range is not an MCR range. In
drivers/gpu/drm/xe/xe_gt_mcr.c:xe_gt_mcr_init_early(), only the L3BANK
(0x00b100-0x00b3ff) and DSS steering tables are registered:

	} else {
		gt->steering[L3BANK].ranges =3D xelp_l3bank_steering_table;
		gt->steering[DSS].ranges =3D xelp_dss_steering_table;
	}

When xe_gt_mcr_get_nonterminated_steering() looks up 0xb0b0 on those
platforms, it does not find it in any steering table, fires xe_gt_WARN(), a=
nd
steers MCR_SELECTOR to (0, 0) for a non-MCR register:

	xe_gt_WARN(gt, true,
		   "Did not find MCR register %#x in any MCR steering table\n",
		   reg.addr);
	*group =3D 0;
	*instance =3D 0;

Should xe_dbg_reg_snapshot_capture_target() check xe_gt_mcr_check_reg() (or
should XE_DBG_REGSET_L3_NODE capture be gated on platform version) before
calling xe_gt_mcr_unicast_read_any()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023060554.2643=
515-1-naresh.kumar.g@intel.com?part=3D6
