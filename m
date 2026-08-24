Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E0CC5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 18:57:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12EF910E589;
	Mon, 24 Aug 2026 18:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CpArdByo";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F7210E126
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 18:57:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id CEA636011F;
 Mon, 24 Aug 2026 18:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 659FC1F000E9;
 Mon, 24 Aug 2026 18:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787597876;
 bh=IGuxQj4Zqiyj5TqQ5onyJ7bXzuZCNf9m7hGgnYVLagA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=CpArdByoL8R9xyh+qOnPIeyM4FzYPefUqG9qmxdxAFY6FmYckjr329LleEGhAVPq6
 0AgHgcaj0N+efFd73shHBl9LlBkm5gj2SDY7q/JTwyM9HW29/nolCNefaJviZnXY2e
 9+Cw1Qt5tbhnOPNBGJtjlFZrKAjP+Q7IADltIgheYYcudr+AjPfnYvgKKfRKtI+Ed5
 XYiJrVIzDhMvK+vl8tJXSIErAjzk5EPoI7WSWcw5iAqS80cvQ9l7JOLUN+fsQP+B0o
 XYk9NhyyQfMQOBqvp5FfF5g95b/Pt22jFcW2CcN64KCY1BdFY2tLAYlJbVz1EHGrzK
 3uK+DKQhUYE6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/7] drm/xe/devcoredump: Capture GT fuse registers in
 devcoredump
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260824184356.1960708-2-naresh.kumar.g@intel.com>
References: <20260824184356.1960708-1-naresh.kumar.g@intel.com>
 <20260824184356.1960708-2-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 18:57:56 +0000
Message-Id: <20260824185756.659FC1F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect register and bitmask used to determine render awake st=
atus in devcoredump.
--

--- Patch [1]: [PATCH v2 1/7] drm/xe/devcoredump: Capture GT fuse registers=
 in devcoredump ---
commit 963c6786cf6616eea5a69f2bd77da1dc93b6d6ff
Author: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>

drm/xe/devcoredump: Capture GT fuse registers in devcoredump
   =20
Capture fuse-related GT register state in the Xe devcoredump to preserve
additional hardware configuration information for postmortem debugging.

> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_=
devcoredump.c
> index 5f2b90b18f97b..e5c33bc941030 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
[ ... ]
> @@ -69,6 +71,232 @@
>  /* 1 hour timeout */
>  #define XE_COREDUMP_TIMEOUT_JIFFIES (60 * 60 * HZ)
> =20
[ ... ]
> +static const struct xe_reg_desc xe3p_gt_rpm_reglist[] =3D {
> +	XE_REG_DESC(RPM_GCD, "RPM_GCD"),
> +	XE_REG_DESC(POWERGATE_ENABLE, "POWERGATE_ENABLE"),
> +};
[ ... ]
> +static void xe_gt_rpm_snapshot_print(struct drm_printer *p,
> +				     const struct xe_dbg_reg_snapshot *snap)
> +{
> +	xe_dbg_reg_snapshot_print(p, snap);
> +
> +	if (snap && snap->num_regs >=3D 2 && !(snap->regs[1].value & 0x2))
> +		drm_puts(p, "render is not awake\n");
> +}

[Severity: Medium]
Are we checking the correct register and bit for the render awake status he=
re?

It looks like xe3p_gt_rpm_reglist captures POWERGATE_ENABLE at index 1,
instead of POWERGATE_DOMAIN_STATUS. If so, evaluating
!(snap->regs[1].value & 0x2) would check the media powergate enable status
(bit 0x2 of POWERGATE_ENABLE) rather than the actual render awake status.

This could result in incorrect diagnostic information being printed in the
devcoredump.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824184356.1960=
708-1-naresh.kumar.g@intel.com?part=3D1
