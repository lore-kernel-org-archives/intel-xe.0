Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976E9C5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 14:04:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37BBA10F366;
	Thu, 13 Aug 2026 14:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kOqQyA77";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E1410F366
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 14:04:09 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 01C6F6187F;
 Thu, 13 Aug 2026 14:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 844FF1F000E9;
 Thu, 13 Aug 2026 14:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786629848;
 bh=bNjw40y88hy8MU2mbs9j+/Ff20IzGdFeDSfQ0B3rA4Q=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=kOqQyA77rNQJ4KwZHxyv4xe1+n5Fn+NuIpLcUJLvpqp2YK8fRBrd/IpWzoY6LBXkR
 f7CuIwjOuQgZe+FnWSMrB7XRayS4owgyt75+nwcl6RcSt80t9rNSP85u4Cd7UIx5nb
 sA48k8ewO7rROMuF85kKx3xzoB1PXRMwjtwtf7PdZgJ0YexxeyU64XslpzKKChsfKS
 O9eXhMPIFl1BF84P0zB3zWPOj1pVt8o6MAietNURw6jsHNd+JHTn+e4LpyKi03cDTJ
 XG1Xkd/nw8raURxPWDSBb0SCsfE4FeBA7KwEWudgnfhwcAcW75m9NKK8Cb2nbuFYfm
 hk81L7FKGZniQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/6] drm/xe/devcoredump: Add GuC register snapshot to
 devcoredump
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260813133037.2912699-3-naresh.kumar.g@intel.com>
References: <20260813133037.2912699-1-naresh.kumar.g@intel.com>
 <20260813133037.2912699-3-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 14:04:08 +0000
Message-Id: <20260813140408.844FF1F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Devcoredump captures GuC registers using the wrong GT's MMIO and f=
orcewake context, leading to duplicated media GT captures, missing primary =
GT captures, and potential hardware timeouts.
- [High] Unconditional reading of restricted GuC registers during devcoredu=
mp capture can cause MMIO timeouts or hardware failures on SR-IOV Virtual F=
unctions.
- [High] Devcoredump fails to capture the primary GT fuse registers when a =
hang occurs on the media GT, and accesses media fuses without forcewake whe=
n a hang occurs on the primary GT.
--

--- Patch [2]: [PATCH 2/6] drm/xe/devcoredump: Add GuC register snapshot to=
 devcoredump ---
commit ec31bf15e0d277f5f7b46d37e62dd0788024eecc
Author: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

drm/xe/devcoredump: Add GuC register snapshot to devcoredump

Add support for capturing GuC register state as part of the xe
devcoredump snapshot.

> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/r=
egs/xe_guc_regs.h
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -150,6 +150,19 @@
>  #define GUC_INTR_SW_INT_1			REG_BIT(1)
>  #define GUC_INTR_SW_INT_0			REG_BIT(0)
> =20
> +#define GUC_DEVICEID				XE_REG(0xc008)
> +#define GUC_SHIM_ERR_TRAP			XE_REG(0xc070)
> +#define GUC_HW_FATL_ERR				XE_REG(0xc598)
> +#define GUC_HW_NOTIFY_ERR			XE_REG(0xc59c)
> +
> +#define GUC_STATUS_M				XE_REG(0x38c000)

[Severity: High]
By defining hardcoded media GT register addresses like GUC_STATUS_M above
the adj_limit, won't they bypass MMIO adjustment? This could cause them
to behave differently than primary registers when passed a media GT.

> +#define GUC_WOPCM_SIZE_M			XE_REG(0x38c050)
> +#define GUC_DEVICEID_M				XE_REG(0x38c008)
> +#define DMA_CTRL_M				XE_REG(0x38c314)
> +#define GUC_HW_FATL_ERR_M			XE_REG(0x38c598)
> +#define GUC_HW_NOTIFY_ERR_M			XE_REG(0x38c59c)
> +#define GUC_SHIM_ERR_TRAP_M			XE_REG(0x38c070)
> +

> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_=
devcoredump.c
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
[ ... ]
> @@ -201,6 +222,32 @@ static struct xe_dbg_reg_snapshot *xe_media_gt_fuse_=
snapshot_capture(struct xe_g
>  	return xe_dbg_reg_snapshot_capture(gt, &reg_list);
>  }
> =20
> +static struct xe_dbg_reg_snapshot *xe_gt_guc_reg_snapshot_capture(struct=
 xe_gt *gt)
> +{
> +	struct xe_reg_desc_list reg_list;
> +
> +	if (!xe_dbg_reg_snapshot_is_supported(gt_to_xe(gt)))
> +		return NULL;

[Severity: High]
Does this code need an IS_SRIOV_VF() check before capturing GuC registers?

According to the driver pattern for other hardware controllers, accessing
PF-only hardware resources from an SR-IOV Virtual Function causes MMIO
timeouts. If a GPU hang on an SR-IOV VF triggers devcoredump_snapshot(),
this unconditional read might cause a timeout.

> +
> +	reg_list.regs =3D xe_gt_guc_reg_list;
> +	reg_list.num_regs =3D ARRAY_SIZE(xe_gt_guc_reg_list);
> +
> +	return xe_dbg_reg_snapshot_capture(gt, &reg_list);
> +}
> +
> +static struct xe_dbg_reg_snapshot *xe_media_gt_guc_reg_snapshot_capture(=
struct xe_gt *gt)
> +{
> +	struct xe_reg_desc_list reg_list;
> +
> +	if (!xe_dbg_reg_snapshot_is_supported(gt_to_xe(gt)))
> +		return NULL;

[Severity: High]
Does the media GT GuC capture also need a VF check to prevent MMIO timeouts
when running as a guest VM user?

> +
> +	reg_list.regs =3D xe_media_gt_guc_reg_list;
> +	reg_list.num_regs =3D ARRAY_SIZE(xe_media_gt_guc_reg_list);
> +
> +	return xe_dbg_reg_snapshot_capture(gt, &reg_list);
> +}
[ ... ]
> @@ -495,6 +553,8 @@ static void devcoredump_snapshot(struct xe_devcoredum=
p *coredump,
>  	ss->gt_fuse =3D xe_gt_fuse_snapshot_capture(q->gt);
>  	ss->media_fuse =3D xe_media_gt_fuse_snapshot_capture(q->gt);

[Severity: High]
This isn't a bug introduced by this patch, but does capturing both primary
and media GT fuses using the same faulting queue GT (q->gt) cause MMIO
aliasing and missing forcewake?

When the hang is on the primary GT, reading media fuses could happen without
holding the media GT's forcewake domain, risking an MMIO timeout. When on
the media GT, primary fuse reads might be translated by the media GT's
adj_offset, failing to capture the primary GT fuses.

> +
> +	ss->gt_guc_reg =3D xe_gt_guc_reg_snapshot_capture(q->gt);
> +	ss->media_gt_guc_reg =3D xe_media_gt_guc_reg_snapshot_capture(q->gt);

[Severity: High]
Will passing the faulting queue's GT (q->gt) to both primary and media GuC
captures cause similar MMIO aliasing and missing forcewake issues?

If the hang is on the primary GT, reading media GuC registers could occur
without acquiring the media GT's forcewake domain, which may trigger MMIO
timeouts. If the hang is on the media GT, reading primary GuC registers
would be shifted by the media GT's adj_offset (0x380000), causing it to
erroneously read the media GuC registers again and completely lose the
primary GuC state.

>  	ss->guc.log =3D xe_guc_log_snapshot_capture(&guc->log, true);
>  	ss->guc.ct =3D xe_guc_ct_snapshot_capture(&guc->ct);
>  	ss->ge =3D xe_guc_exec_queue_snapshot_capture(q);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813133037.2912=
699-1-naresh.kumar.g@intel.com?part=3D2
