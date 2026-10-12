Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2389CA9EDD
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 15:03:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617CF10F19E;
	Mon, 12 Oct 2026 15:02:59 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A181610F183
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 15:02:52 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 55B184341F;
 Mon, 12 Oct 2026 15:02:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B0E91F0089B;
 Mon, 12 Oct 2026 15:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791817372;
 bh=jr5M370Yh2/cFPl/xCyk7gLBpYidGlkWy478epxHigA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=jAiPgvG27VjOBlC/0+ngj3beGaQnzu7imi8AJju9+IrCLf8D+W+DMlP2QMWpYLQAF
 tUvKZpk2n0FvmHT++H4kAFCiYqQuu4hrT3MXmc7O53G7f7WrjoGT+FuCfluTDMfbv1
 fKtl2m9lrZ2Is58hBmG5JyZIHGcXn3psQhQVcIQYDBbXjBBw7IyTiK5y8TncxC/sA5
 Mf/ggfRY3Vr3itP2a3brTLfixE5kz0GfvYO+TaqC/hWQ0Yb8RN24OrH8FbR41zOGOO
 AfreUaGh4FDOq6n9BoEf4+NIIqXlv94ff8btFwcK80UmNHSdaUwnv1R53RXVWjfX0f
 Y478nq/oA6eHw==
Message-ID: <sashiko-outbox-168306@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/7] drm/xe/devcoredump: Capture GT fuse registers in
 devcoredump
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261012145237.3788198-2-naresh.kumar.g@intel.com>
References: <20261012145237.3788198-1-naresh.kumar.g@intel.com>
 <20261012145237.3788198-2-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 15:02:51 +0000
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
- [High] xe: NULL pointer dereference of q when triggering devcoredump with=
out exec queue
- [Medium] xe: premature release of forcewake reference for other_gt due to=
 scoping
--

commit 2590b539053b321d9d5162da600031b95e05357f
Author: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

drm/xe/devcoredump: Capture GT fuse registers in devcoredump

This commit captures fuse-related GT register state in the Xe devcoredump
for postmortem debugging. It adds generic register snapshot storage and
helpers to capture, print, and free MMIO register dumps, recording primary
and media GT fuse and RPM register states.

> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_=
devcoredump.c
> index ab681b148869f..1dbee725f55a1 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
[ ... ]
> @@ -345,8 +534,34 @@ static void devcoredump_snapshot(struct xe_devcoredu=
mp *coredump,
>  	/* keep going if fw fails as we still want to save the memory and SW da=
ta */
>  	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> =20
> +	other_gt =3D q->gt->tile->media_gt =3D=3D q->gt ? q->gt->tile->primary_=
gt
> +					    : q->gt->tile->media_gt;

[Severity: High]
Does this code trigger a NULL pointer dereference if q is NULL?

For hangs not tied to an exec queue (e.g., TLB invalidation timeouts), the
q parameter to __xe_devcoredump() and devcoredump_snapshot() is explicitly
documented as potentially being NULL.=20

Unconditionally dereferencing q here to calculate other_gt and later=20
passing q->gt to xe_dbg_gt_snapshot_capture() would cause a kernel panic=20
during the crash dumping process.

Should this use the gt parameter passed directly to the function instead
of q->gt?

> +	if (other_gt) {
> +		CLASS(xe_force_wake, fw_ref_other)(gt_to_fw(other_gt),
> +						   XE_FORCEWAKE_ALL);
> +		if (!xe_force_wake_ref_has_domain(fw_ref_other.domains, XE_FORCEWAKE_A=
LL))
> +			other_gt =3D NULL;
> +	}

[Severity: Medium]
Are we dropping the forcewake reference for other_gt prematurely here?

The CLASS(xe_force_wake, fw_ref_other) macro uses __cleanup() to
automatically release the forcewake lock when the variable goes out of scop=
e.
Since it is declared inside the if (other_gt) { ... } block, its scope
ends at the closing brace of the if block, immediately running the
destructor (xe_force_wake_put).

Consequently, when xe_dbg_gt_snapshot_capture() and xe_mmio_read32() are
later called to capture registers for other_gt, the device power domain
has already lost its active forcewake reference. Accessing GT MMIO registers
without holding forcewake can lead to hardware timeouts or read failures.

Could the forcewake lock scope be extended to cover the register capture
functions?

> +
>  	cookie =3D dma_fence_begin_signalling();
> =20
> +	ss->gt_fuse      =3D xe_dbg_gt_snapshot_capture(q->gt,
> +						      other_gt,
> +						      XE_DBG_REGSET_FUSE,
> +						      XE_GT_TYPE_MAIN);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012145237.3788=
198-1-naresh.kumar.g@intel.com?part=3D1
