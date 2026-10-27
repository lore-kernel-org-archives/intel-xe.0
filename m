Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EF5606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 05:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SHsJC0NT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A43110E212;
	Tue, 27 Oct 2026 05:21:13 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A020010E212
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 05:21:07 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5E8DE437C5;
 Tue, 27 Oct 2026 05:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 221581F01825;
 Tue, 27 Oct 2026 05:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793078467;
 bh=7BYZYBdcCFTdWrFN0i9loFTYl2O1pnbcCXKm6BUybUE=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=SHsJC0NTNW4sGCuP5KCXxgxGzJV7ffvwT+7KKcr1XYyMsv0fBkbyuXukSew2CHJJn
 aPM0y4WWUCv3gkv+kyxNqFgNuwEqIGSiQaTP7A1q5wUXMAaKeibbiihAs4BpT0Vd1D
 3lyfM4bIApY/9Z1s3JlUXRK2L5Y1AkqQ/wfbGlFbYHWP4hWfozoqlnG7I/mRgmlDAr
 AKjD7pg3P3Zw22114CQSXxGd4RbpMurszY9gE4EhFLKJqHr0vNS1sqgK04E6+hUP2N
 uAvlYCV3cjTuQyQiZIdbHNnwAUqTVBhRxFnlq9JLP4kHh7Dpm60l9CQtFbgaZpqJxN
 PpolFD2fixYGQ==
Message-ID: <sashiko-outbox-186109@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/7] drm/xe: dump GAM page fault report registers in
 devcoredump
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261027051024.465587-5-naresh.kumar.g@intel.com>
References: <20261027051024.465587-1-naresh.kumar.g@intel.com>
 <20261027051024.465587-5-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 05:21:05 +0000
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
- [High] drm/xe: WARN in xe_gt_mcr_get_nonterminated_steering() on Xe_LP co=
redump
--

commit 31c25256bd390a37c67cb669e115b03a4e53d6f2
Author: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

drm/xe: dump GAM page fault report registers in devcoredump

This commit adds PAGE_FLTRPTQ_HEAD and PAGE_FLTRPTQ_TAIL as MCR register
definitions and captures them in the devcoredump snapshot for the main GT.

> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/re=
gs/xe_gt_regs.h
> index 220f0968f9db8..ad8aa6e10e361 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -530,6 +530,9 @@
>  #define   LMEM_EN				REG_BIT(31)
>  #define   LMTT_DIR_PTR				REG_GENMASK(30, 0) /* in multiples of 64KB */
> =20
> +#define PAGE_FLTRPTQ_HEAD			XE_REG_MCR(0xcf90)
> +#define PAGE_FLTRPTQ_TAIL			XE_REG_MCR(0xcf94)
> +
>  #define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188, XE_REG_OPTION_MASKED)
>  #define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
> =20
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_=
devcoredump.c
> index cd2c641111d68..90e16c89dd963 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
[ ... ]
> @@ -114,6 +116,11 @@ static const struct xe_reg_desc xe_dbg_media_gt_rpm_=
reglist[] =3D {
>  	XE_REG_DESC(MIRROR_PM_DEBUG, "MIRROR_PM_DEBUG"),
>  };
> =20
> +static const struct xe_reg_desc xe_dbg_gam_pf_reglist[] =3D {
> +	XE_REG_DESC_MCR(PAGE_FLTRPTQ_HEAD, "PAGE_FLTRPTQ_HEAD"),
> +	XE_REG_DESC_MCR(PAGE_FLTRPTQ_TAIL, "PAGE_FLTRPTQ_TAIL"),
> +};
> +
[ ... ]
> @@ -234,8 +264,13 @@ xe_dbg_reg_snapshot_capture_target(struct xe_gt *gt,
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
> @@ -565,6 +605,10 @@ static void xe_devcoredump_capture_gt_regs(struct xe=
_devcoredump_snapshot *ss,
>  							  other_gt,
>  							  XE_DBG_REGSET_GUC,
>  							  XE_GT_TYPE_MEDIA);
> +	ss->gam_pf_report =3D xe_dbg_gt_snapshot_capture(gt,
> +						       other_gt,
> +						       XE_DBG_REGSET_GAM_PF,
> +						       XE_GT_TYPE_MAIN);
>  }

[Severity: High]
Will capturing XE_DBG_REGSET_GAM_PF unconditionally on all platforms trigge=
r a
kernel warning in xe_gt_mcr_get_nonterminated_steering() on Xe_LP platforms
(such as TGL, DG1, and ADL)?

When a devcoredump is taken, the capture path runs:

  devcoredump_snapshot()
    -> xe_devcoredump_capture_gt_regs()
      -> xe_dbg_gt_snapshot_capture(..., XE_DBG_REGSET_GAM_PF, XE_GT_TYPE_M=
AIN)
        -> xe_dbg_reg_snapshot_capture_target()
          -> xe_gt_mcr_unicast_read_any()
            -> xe_gt_mcr_get_nonterminated_steering()

Because PAGE_FLTRPTQ_HEAD (0xcf90) and PAGE_FLTRPTQ_TAIL (0xcf94) are defin=
ed
with XE_REG_MCR(), reglist->regs[i].reg.mcr is always set, so
xe_dbg_reg_snapshot_capture_target() unconditionally calls
xe_gt_mcr_unicast_read_any().

However, in drivers/gpu/drm/xe/xe_gt_mcr.c:xe_gt_mcr_init_early(), the
0x00c800 to 0x00cfff range is only added to MCR steering tables on DG2, PVC,
and platforms with GRAPHICS_VERx100(xe) >=3D 1270. On Xe_LP platforms, only=
 the
L3BANK and DSS tables are registered:

    } else {
        gt->steering[L3BANK].ranges =3D xelp_l3bank_steering_table;
        gt->steering[DSS].ranges =3D xelp_dss_steering_table;
    }

Neither table covers 0xcf90 or 0xcf94, so
xe_gt_mcr_get_nonterminated_steering() will not find a match and will hit:

    xe_gt_WARN(gt, true,
               "Did not find MCR register %#x in any MCR steering table\n",
               reg.addr);

before attempting a steered read on a non-MCR register range.

Should xe_dbg_reg_snapshot_capture_target() check xe_gt_mcr_check_reg(), or
should capturing XE_DBG_REGSET_GAM_PF be restricted to platforms that suppo=
rt
these GAM page fault registers as MCR?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027051024.4655=
87-1-naresh.kumar.g@intel.com?part=3D4
