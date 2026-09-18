Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4428FC982D0
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 00:17:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D4910E532;
	Fri, 18 Sep 2026 00:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LXrJcU9k";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1215510E532
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 00:17:29 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 58109601FF;
 Fri, 18 Sep 2026 00:17:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E63451F000FF;
 Fri, 18 Sep 2026 00:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789690648;
 bh=1o2tsW4NKmmoJ5367EZqVYqyQwFP7xALALfXdsmg4lg=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=LXrJcU9k+BnSiz8AWpV+ldug4QdaRz62tjtjdjprm5rHC1H+xgv2p2WSQU9UqvWa/
 yyonee0bUtGX5qCl2du3oJkQbu9sKjWCMXNdZJkS3pLrjLPzbb9SWvOagfpQyvG7hy
 ZHO4tRKcE7i2Fh6yqioRgVE5n4mg6t1OJ6dqd97ptwgEuE3KJWwm6tUPLGr/zy8b5+
 4OYBi50w4P6rVOUs6O6Rlds6SOPQeq0B3ulAVMXGV6ozU61X91GOgr7ehwhMA3lXda
 NPFLrmr1UvuuYAeC7nwymD0ALfSUTMT1nDMg0xrQiByWQK1AMLOLGuVHTcHPiw3kh2
 rLB1RctGj+cAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/7] drm/xe/guc: Cleanup error codes and handling for
 CT errors
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260917235923.1521112-13-umesh.nerlige.ramappa@intel.com>
References: <20260917235923.1521112-9-umesh.nerlige.ramappa@intel.com>
 <20260917235923.1521112-13-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 00:17:27 +0000
Message-Id: <20260918001727.E63451F000FF@smtp.kernel.org>
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
- [High] drm/xe/guc: retry_failure() not updated for -EPERM breaks no_fail =
requests
- [Low] drm/xe/guc: build failure due to undeclared CT_DEAD_ reason codes
- [Low] drm/xe/guc: kernel-doc mismatch for xe_guc_ct_send return value
--

commit fcb132fd1e8cabdb5fd371a7a87d1bb78381dd54
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: drm/xe/guc: Cleanup error codes and handling for CT errors

This commit updates GuC CT error handling to return more specific error
codes instead of uniformly returning -EPROTO. It retains -EPROTO for
genuine protocol violations while adjusting others to reflect the actual
failure, and simplifies the reset handling logic.

> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_c=
t.c
> index 3353515aa8747..31ecddab30578 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c

[ ... ]

> @@ -953,23 +1035,22 @@ static int h2g_write(struct xe_guc_ct *ct, const u=
32 *action, u32 len,
>  		u32 desc_status;
> =20
>  		desc_status =3D desc_read(xe, h2g, status);
> -		if (desc_status) {
> -			xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
> -			goto corrupted;
> -		}
> +		if (desc_status)
> +			return ct_corrupted(ct,  &ct->ctbs.h2g, ct_id(H2G_WRITE),
> +					    "write: non-zero status: %u\n", desc_status);

[Severity: Low]
Does this code break the build when CONFIG_DRM_XE_DEBUG is disabled?=20

The macro ct_id() evaluates to CT_DEAD_##reason_code. If those enum
values are conditionally defined globally (such as inside an=20
#if IS_ENABLED(CONFIG_DRM_XE_DEBUG) block), using them here in h2g_write()
outside of any #if guards will cause undeclared identifier compilation
errors on non-debug builds.

[ ... ]

> @@ -1060,11 +1137,6 @@ static int __guc_ct_send_locked(struct xe_guc_ct *=
ct, const u32 *action,
>  		goto out;
>  	}
> =20
> -	if (unlikely(ct->ctbs.h2g.info.broken)) {
> -		ret =3D -EPIPE;
> -		goto out;
> -	}
> -
>  	if (ct->state =3D=3D XE_GUC_CT_STATE_DISABLED) {
>  		ret =3D -ENODEV;
>  		goto out;
> @@ -1075,6 +1147,11 @@ static int __guc_ct_send_locked(struct xe_guc_ct *=
ct, const u32 *action,
>  		goto out;
>  	}
> =20
> +	if (unlikely(ct->ctbs.h2g.info.broken)) {
> +		ret =3D -EPERM;
> +		goto out;
> +	}
> +

[Severity: High]
Does this return code change break the retry logic for no-fail requests?

When the H2G CTB is broken, __guc_ct_send_locked() now returns -EPERM=20
instead of the legacy -EPIPE. However, retry_failure() still only checks
for -EPIPE:

	if (!(ret =3D=3D -EDEADLK || ret =3D=3D -EPIPE || ret =3D=3D -ENODEV))
		return false;

Without checking for -EPERM, retry_failure() will return false, causing=20
no-fail messages (such as critical TLB invalidations) to fail immediately=20
instead of waiting for a GT reset and retrying.

[Severity: Low]
Also, does the kernel-doc for xe_guc_ct_send() need an update to reflect
this change?

The documentation for xe_guc_ct_send() still lists -EPIPE for a broken=20
CTB:

 * -EPIPE: the H2G CTB is marked broken. The channel stays unusable until t=
he
 *   CT is restarted, which clears the broken flag.

Since this patch changes the return value for a broken CTB to -EPERM,=20
this documentation might need to be updated to match.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917235923.1521=
112-9-umesh.nerlige.ramappa@intel.com?part=3D4
