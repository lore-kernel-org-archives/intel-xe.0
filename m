Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C42C5CFEB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 13:52:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A3210E04E;
	Thu, 13 Aug 2026 13:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FwATtBHr";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F9110E04E
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 13:52:43 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 923A161834;
 Thu, 13 Aug 2026 13:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A65D1F000E9;
 Thu, 13 Aug 2026 13:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786629150;
 bh=6SRra5g+frHe6aDJp41zCv9Bc3zfIXTaSv9cZ7+HLow=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=FwATtBHr5ryIyQnsby3V5fI1JSShwWDYG/R5SoKD6yDEnoD0WPY5vWwS1HywP8Huh
 J3R2u9Aq+TMylcQEZGr9/sihqlYeXTWZowJFye6fnAi37r01HaWIRxOrgY/+JcPNrr
 QOEAzqXm/QtzyVxKena23ThzoNxwccttorQSL+1LPuzxToCrG8SHO/II8b4s0pSFnd
 BMtEt1mspMmveaMXx9uC0fqOxZnSNnJgPlrzAXOa6Uj+ENMjwgUHajG752NIv0gp2L
 ZrSILVVgw8oCeXlYg4ByxgwCh8viEb07KMBz9SUJYm9OtcsYCf1XccnRExMCk2lU/3
 gPfW6wqGMBNZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/6] drm/xe/devcoredump: Capture GT fuse registers in
 devcoredump
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260813133037.2912699-2-naresh.kumar.g@intel.com>
References: <20260813133037.2912699-1-naresh.kumar.g@intel.com>
 <20260813133037.2912699-2-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 13:52:29 +0000
Message-Id: <20260813135230.2A65D1F000E9@smtp.kernel.org>
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
- [High] Incorrect GT context passed to fuse capture functions causes MMIO =
offset corruption and missing forcewake.
- [Medium] Attempting to read PF-only physical fuse registers from a Virtua=
l Function (VF) causes kernel warnings.
- [Medium] Unconditional capture of Media GT fuse registers without verifyi=
ng if the hardware actually possesses a Media GT.
--

--- Patch [1]: [PATCH 1/6] drm/xe/devcoredump: Capture GT fuse registers in=
 devcoredump ---
commit 83b02d67e48ca9a916843ba3c9656f4f78b755ae
Author: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
drm/xe/devcoredump: Capture GT fuse registers in devcoredump

This commit captures fuse-related GT register state in the Xe devcoredump to
preserve additional hardware configuration information. It adds generic
register snapshot storage and helpers for capturing and printing MMIO dumps.

> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_=
devcoredump.c
> index 5f2b90b18f97b..35d8101f2a192 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
[ ... ]
> +static struct xe_dbg_reg_snapshot *xe_gt_fuse_snapshot_capture(struct xe=
_gt *gt)
> +{
> +	struct xe_reg_desc_list reg_list;
> +
> +	if (!xe_dbg_reg_snapshot_is_supported(gt_to_xe(gt)))
> +		return NULL;
> +
> +	reg_list.regs =3D xe3p_gt_fuse_reglist;
> +	reg_list.num_regs =3D ARRAY_SIZE(xe3p_gt_fuse_reglist);
> +
> +	return xe_dbg_reg_snapshot_capture(gt, &reg_list);
> +}

[Severity: Medium]
Will this trigger kernel warnings when running as a Virtual Function (VF)?

If a GPU hang occurs in an SR-IOV VF environment,
xe_gt_fuse_snapshot_capture() calls xe_mmio_read32(), which routes to
xe_gt_sriov_vf_read32(). Since physical fuse registers like RPM_GCD are
PF-only and not on the VF MMIO whitelist, the access is rejected,
potentially polluting the kernel log with warnings for every register.

Should there be an IS_SRIOV_VF() guard before attempting to read PF-only
physical fuse registers?

[ ... ]
> @@ -349,6 +492,9 @@ static void devcoredump_snapshot(struct xe_devcoredum=
p *coredump,
> =20
>  	cookie =3D dma_fence_begin_signalling();
> =20
> +	ss->gt_fuse =3D xe_gt_fuse_snapshot_capture(q->gt);
> +	ss->media_fuse =3D xe_media_gt_fuse_snapshot_capture(q->gt);

[Severity: High]
Does this pass the wrong GT context to the capture functions when the fault=
 is
on the Media GT?

The faulting q->gt is passed unconditionally to both captures. xe_mmio_read=
32()
automatically adds a 0x380000 offset to register addresses when invoked on =
the
Media GT. If q->gt is the Media GT, xe_gt_fuse_snapshot_capture() will
erroneously capture Media GT registers instead of Primary GT registers.

Additionally, devcoredump only holds forcewake for the faulting q->gt. If
q->gt is the Primary GT, xe_media_gt_fuse_snapshot_capture() will attempt
to read Media GT registers while the Media GT is asleep, causing Unclaimed
Register errors and returning garbage data.

Should it capture using the specific primary and media GTs with appropriate
forcewake?

[Severity: Medium]
What happens on hardware configurations that do not possess a Media GT?

The unconditional call to xe_media_gt_fuse_snapshot_capture() attempts to
read registers at offset 0x380000. If the Media GT is physically absent or
fused off on the SKU, would this result in Unclaimed Register hardware erro=
rs
and system log spam?

Should there be a check for the existence of a Media GT before attempting
the capture?

> +
>  	ss->guc.log =3D xe_guc_log_snapshot_capture(&guc->log, true);
>  	ss->guc.ct =3D xe_guc_ct_snapshot_capture(&guc->ct);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813133037.2912=
699-1-naresh.kumar.g@intel.com?part=3D1
