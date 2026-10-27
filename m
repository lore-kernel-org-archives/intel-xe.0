Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED5A606A31A
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 05:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Autq4O1l
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7EAE10E212;
	Tue, 27 Oct 2026 05:20:06 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F07D10E212
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 05:20:00 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 60D03600CB;
 Tue, 27 Oct 2026 05:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB5F1F01825;
 Tue, 27 Oct 2026 05:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793078399;
 bh=fz9F5pL4K9aXFf8ZF6StEDFS7uCHifiXD5pV61qxiLU=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Autq4O1ljSZlpLZae+QuHvLP+gpVFDw641MN31/L/5+Ruw86mh38jQYHUPTlXyXk6
 tOIF6BrKjQfasIz24dnF0utq3byfsf6FgPkayhobnWrDUssDkisHzved9w7cebM+qb
 PlujfpW8idnhCmyJvNuLVQNa4OH6Xkr8eLUi3uH8ufH/KjLofW0GOx04pbOfHPtbRr
 k6WkzRrieVH+F03KWmjbdwMMixIGoMnerLGMANYyzGOY7rT/5skrWWbgaXeBTIy+k5
 B+KAoxdrQdGrwhrx8MtuHvAVhRnIQdd/6ied9wKSozTPyZlOMOMJHxvMcrC4Z6zchX
 TWvum8fENrKIA==
Message-ID: <sashiko-outbox-186107@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/7] drm/xe: capture L3 node status registers in
 devcoredump
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261027051024.465587-7-naresh.kumar.g@intel.com>
References: <20261027051024.465587-1-naresh.kumar.g@intel.com>
 <20261027051024.465587-7-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 05:19:58 +0000
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
- [Medium] drm/xe: MCR read of L3_NODE_IDLE warns on Xe_LP in devcoredump_s=
napshot()
--

commit 6a7de0ef91ea8ee5535f4119f192d0149d614014
Author: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

drm/xe: capture L3 node status registers in devcoredump

This commit adds definitions for the L3_NODE_IDLE and L3STAT_LBCF_GFX
registers and captures them in a new node status section during devcoredump
snapshots.

> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/re=
gs/xe_gt_regs.h
> index f884fc2e38aaf..28331505bb34e 100644
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
> index 90e16c89dd963..714b63e9653df 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -121,6 +121,11 @@ static const struct xe_reg_desc xe_dbg_gam_pf_reglis=
t[] =3D {
>  	XE_REG_DESC_MCR(PAGE_FLTRPTQ_TAIL, "PAGE_FLTRPTQ_TAIL"),
>  };
> =20
> +static const struct xe_reg_desc xe_dbg_l3_node_reglist[] =3D {
> +	XE_REG_DESC_MCR(L3_NODE_IDLE, "L3_NODE_IDLE"),
> +	XE_REG_DESC_MCR(L3STAT_LBCF_GFX, "L3STAT_LBCF_GFX"),
> +};

[ ... ]

> @@ -609,6 +625,10 @@ static void xe_devcoredump_capture_gt_regs(struct xe=
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
a kernel warning on Xe_LP platforms (such as TGL, RKL, ADL, and DG1) during
devcoredump_snapshot()?

In xe_devcoredump_capture_gt_regs(), xe_dbg_gt_snapshot_capture() is called
for XE_DBG_REGSET_L3_NODE without a platform or MCR range check, which leads
to xe_dbg_reg_snapshot_capture_target() reading L3_NODE_IDLE (0xb0b0) throu=
gh
xe_gt_mcr_unicast_read_any() because reg.mcr is set:

drivers/gpu/drm/xe/xe_devcoredump.c:xe_dbg_reg_snapshot_capture_target() {
	...
	for (i =3D 0; i < reglist->num_regs; i++) {
		if (reglist->regs[i].reg.mcr)
			snap->values[i] =3D xe_gt_mcr_unicast_read_any(gt,
								     reglist->regs[i].mcr_reg);
		else
			snap->values[i] =3D xe_mmio_read32(&gt->mmio, reglist->regs[i].reg);
	}
	...
}

However, in xe_gt_mcr_init_early(), the 0x00b000-0x00b0ff range is not
registered in any MCR steering table on Xe_LP platforms (or on Xe3p platfor=
ms
where GRAPHICS_VERx100(xe) >=3D 3510):

drivers/gpu/drm/xe/xe_gt_mcr.c:xe_gt_mcr_init_early() {
		...
		} else {
			gt->steering[L3BANK].ranges =3D xelp_l3bank_steering_table;
			gt->steering[DSS].ranges =3D xelp_dss_steering_table;
		}
}

When a GPU hang or job timeout occurs on those platforms, calling
xe_gt_mcr_unicast_read_any() for L3_NODE_IDLE reaches
xe_gt_mcr_get_nonterminated_steering() and fires xe_gt_WARN():

drivers/gpu/drm/xe/xe_gt_mcr.c:xe_gt_mcr_get_nonterminated_steering() {
	...
	xe_gt_WARN(gt, true,
		   "Did not find MCR register %#x in any MCR steering table\n",
		   reg.addr);
	*group =3D 0;
	*instance =3D 0;

	return true;
}

Should xe_dbg_reg_snapshot_capture_target() check xe_gt_mcr_check_reg() bef=
ore
using xe_gt_mcr_unicast_read_any(), or should the L3_NODE capture be guarded
by the appropriate platform version check?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027051024.4655=
87-1-naresh.kumar.g@intel.com?part=3D6
