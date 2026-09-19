Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E025C982CC
	for <intel-xe@archiver.kernel.org>; Sat, 19 Sep 2026 05:09:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F228B10E536;
	Sat, 19 Sep 2026 05:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dBU8qBmY";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E9810E0B1
 for <intel-xe@lists.freedesktop.org>; Sat, 19 Sep 2026 05:09:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 82A244004C;
 Sat, 19 Sep 2026 05:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31E8A1F000FF;
 Sat, 19 Sep 2026 05:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789794597;
 bh=ZB7opCpZBbwuXHIYyqpPhSE2Y0hkU9cJ6+5ax85NN0k=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=dBU8qBmYShXpVrdN5kd3ZntZMmH+Qg0KUty8Xjgc5oL1Xq/X7Fuf9HfyklRBJrlC2
 dFf2/4jrBvS0wYSNp/1bT2Nq0WI4KvfAX3GgHYMzYUnysjd/895DkZ50ANP7Pu2c0s
 12iP75tM4IMf3mS4fKtLxV5awBsJOKLAhNoQLUWYFYRJ3nhOuZRSjiutavJkLjn3w2
 19olYpu32XmuMGfPLa/f5/RdomcDhEU49ab/IBCuL2qa4E7/G1AvNxPt1NOxVJDRey
 DkIYt1Oosi5zHX/DtTC7awGffqXcUyo/N02pcWVX0+mIkjEWZ1jYK3UaaLD0eE5haO
 iggSpcLGB7jfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/7] drm/xe/guc: Handle CRASH and EXCEPTION G2H with
 separate helpers
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260919050055.2092579-11-umesh.nerlige.ramappa@intel.com>
References: <20260919050055.2092579-9-umesh.nerlige.ramappa@intel.com>
 <20260919050055.2092579-11-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 19 Sep 2026 05:09:56 +0000
Message-Id: <20260919050957.31E8A1F000FF@smtp.kernel.org>
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
- [Medium] drm/xe: guc_handle_*_msg helpers return -EHOSTDOWN instead of 0
- [Low] drm/xe: unused 'action' parameter in guc_handle_*_msg
--

commit 8c0a0c12a9abfb15d1eb3e3e87b08b081ebd3cd3
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/guc: Handle CRASH and EXCEPTION G2H with separate helpers

This commit refactors the handling of CRASH and EXCEPTION G2H messages
by splitting them into separate helpers. It also removes unreachable
code that existed in the previous implementation.

> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_c=
t.c
> index 5c4733da385c5..b3a6aa37808b4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
[ ... ]
> @@ -1553,22 +1553,22 @@ static int parse_g2h_event(struct xe_guc_ct *ct, =
u32 *msg, u32 len)
>  	return 0;
>  }
> =20
> -static int guc_crash_process_msg(struct xe_guc_ct *ct, u32 action)
> +static int guc_handle_crash_dump_msg(struct xe_guc_ct *ct, u32 action)

[Severity: Low]
Does this code still need the action parameter? It appears to be unused
within the guc_handle_crash_dump_msg() function body.

>  {
> -	struct xe_gt *gt =3D ct_to_gt(ct);
> +	xe_gt_err(ct_to_gt(ct), "GuC Crash dump notification\n");
> +	CT_DEAD(ct, NULL, CRASH);
> +	kick_reset(ct);
> =20
> -	if (action =3D=3D XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED)
> -		xe_gt_err(gt, "GuC Crash dump notification\n");
> -	else if (action =3D=3D XE_GUC_ACTION_NOTIFY_EXCEPTION)
> -		xe_gt_err(gt, "GuC Exception notification\n");
> -	else
> -		xe_gt_err(gt, "Unknown GuC crash notification: 0x%04X\n", action);
> +	return -EHOSTDOWN;

[Severity: Medium]
Does returning -EHOSTDOWN here contradict the v2 changelog intent to "retur=
n 0
from the helpers to retain old behavior"?=20

Returning a failure code here causes process_g2h_msg() to unintentionally
execute its error path:

	if (ret) {
		xe_gt_err(gt, "G2H action %#04x failed (%pe) len %u msg %*ph\n", ...
		CT_DEAD(ct, NULL, PROCESS_FAILED);
	}

This generates an extra false positive error log and overrides the
initial CT_DEAD(ct, NULL, CRASH) reason with PROCESS_FAILED.

> +}
> =20
> +static int guc_handle_exception_msg(struct xe_guc_ct *ct, u32 action)

[Severity: Low]
Similar to guc_handle_crash_dump_msg(), is the action parameter still needed
here since it remains unused?

> +{
> +	xe_gt_err(ct_to_gt(ct), "GuC Exception notification\n");
>  	CT_DEAD(ct, NULL, CRASH);
> -
>  	kick_reset(ct);
> =20
> -	return 0;
> +	return -EHOSTDOWN;

[Severity: Medium]
Does returning -EHOSTDOWN here contradict the v2 changelog intent to "retur=
n 0
from the helpers to retain old behavior"?=20

Returning a failure code here causes process_g2h_msg() to unintentionally
execute its error path:

	if (ret) {
		xe_gt_err(gt, "G2H action %#04x failed (%pe) len %u msg %*ph\n", ...
		CT_DEAD(ct, NULL, PROCESS_FAILED);
	}

This generates an extra false positive error log and overrides the
initial CT_DEAD(ct, NULL, CRASH) reason with PROCESS_FAILED.

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260919050055.2092=
579-9-umesh.nerlige.ramappa@intel.com?part=3D2
