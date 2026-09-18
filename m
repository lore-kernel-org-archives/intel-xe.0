Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6FFC982D2
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 00:08:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6DB10E66E;
	Fri, 18 Sep 2026 00:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c7CcGcYp";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37DE10E6DF
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 00:08:33 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8089E41E91;
 Fri, 18 Sep 2026 00:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 398B81F00893;
 Fri, 18 Sep 2026 00:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789690113;
 bh=NDBATjtBMUzZoxrN8U0+3Nbb5WmaBXMP/pUHNSb23rw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=c7CcGcYpv+F8aCz+ptf6nSIvv55paUpgTvhp8VJoLB1LY1PfOmXdgGavZxB2mDJ26
 JFpjH+P+Fv25TqY3gUQwP16kOZ1n5pYV0FpBe75RGFYafjFWfEH+VxfkxUfU1+Yek1
 3ESeS5o9PKPcN2O9tEhvCgz5x5mz+3UBwMvCnIX1JJsd/96caznT2HLpIlcz+zM0yg
 RAkfYX9SrAqSigxRJJu4ry4mTkjZlQw18USRBYuzhHWlSdDiZ8xpp8e1F0zpak7bNI
 syuIQsnkO+t4N41x4QOqfK8F3U4g0VSBWny5pad8ePl0S9kVSsMDHFgXBLk50oVPtk
 gfG7vzwv1K6KA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/7] drm/xe/guc: Handle CRASH and EXCEPTION G2H with
 separate helpers
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260917235923.1521112-11-umesh.nerlige.ramappa@intel.com>
References: <20260917235923.1521112-9-umesh.nerlige.ramappa@intel.com>
 <20260917235923.1521112-11-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 00:08:32 +0000
Message-Id: <20260918000833.398B81F00893@smtp.kernel.org>
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
- [Medium] xe: spurious PROCESS_FAILED on GuC crash due to -EHOSTDOWN return
--

commit 0030c089dd9bc1455460d3cc58697be48bcade56
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/guc: Handle CRASH and EXCEPTION G2H with separate helpers

This commit refactors the handling of CRASH and EXCEPTION G2H messages
into separate helper functions. It also drops an unreachable code path
that existed in the earlier combined function.

> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_c=
t.c
> index 5c4733da385c5..b3a6aa37808b4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1553,22 +1553,22 @@ static int parse_g2h_event(struct xe_guc_ct *ct, =
u32 *msg, u32 len)
>  	return 0;
>  }
> =20
> -static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
> +static int guc_handle_crash_dump_msg(struct xe_guc_ct *ct, u32 action)
>  {
> -	struct xe_gt *gt =3D ct_to_gt(ct);
> +	xe_gt_err(ct_to_gt(ct), "GuC Crash dump notification\n");
> +	CT_DEAD(ct, NULL, CRASH);
> +	kick_reset(ct);
> =20
> -	if (action =3D=3D XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED)
> -		xe_gt_err(gt, "GuC Crash dump notification\n");
[ ... ]
> +	return -EHOSTDOWN;
> +}

[Severity: Medium]
Since this function now returns -EHOSTDOWN instead of 0, will this trigger =
the
failure path in process_g2h_msg()?

When process_g2h_msg() receives a non-zero return value, it logs a spurious
"G2H action failed" error and redundantly flags the CT as dead:

    if (ret) {
        xe_gt_err(gt, "G2H action %#04x failed (%pe) len %u msg %*ph\n", ..=
.);
        CT_DEAD(ct, NULL, PROCESS_FAILED);
    }

Does this misrepresent a successfully processed firmware notification as a
host-side parsing failure?

> =20
> +static int guc_handle_exception_msg(struct xe_guc_ct *ct, u32 action)
> +{
> +	xe_gt_err(ct_to_gt(ct), "GuC Exception notification\n");
>  	CT_DEAD(ct, NULL, CRASH);
> -
>  	kick_reset(ct);
> =20
> -	return 0;
> +	return -EHOSTDOWN;
>  }

[Severity: Medium]
Similarly here, returning -EHOSTDOWN instead of 0 will cause process_g2h_ms=
g()
to execute its error handling path. Should these helpers continue to return=
 0
to indicate the notification was successfully processed by the host?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917235923.1521=
112-9-umesh.nerlige.ramappa@intel.com?part=3D2
