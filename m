Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0B6C5DF81
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 19:22:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B1510E02D;
	Wed, 19 Aug 2026 19:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g/30mbfS";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5337A10E02D
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 19:22:12 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id CFB30439EF;
 Wed, 19 Aug 2026 19:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 957481F000E9;
 Wed, 19 Aug 2026 19:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787167331;
 bh=koJB6jVxUMa9jtpXbj+ixgrd1dGa/dnDGDaegl6qBfQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=g/30mbfSUyVaCdssSNMSgpuOeVbRrMtwaUpFTx5J7J8uHGyYJfnfc9zeA+/m6LmDL
 /I1wrCHSnaqSCPEJK1hljZGVZK00I6Xh85eO6FJC5d5ee3IvxDP6WfANoHdEeb2kUf
 tT6AxS+tv2Zg9mFGU+BpV/s7fzoxgBsYv1PU+ypBgqUiF8x87MVCHclV3pMFyNAEku
 9h8Jz45gBGEJYRjj1TqQrGzDdI5KzET6tQd/RnUW5QocDuL497tMuXN3IHJZzAPs9p
 L2Uc8mHY6j+PJQvWzH9wA0m7q5zCr4GN5Ulxj/KR3toKWPgATdAXuLhUt3yOi23Eev
 MZ5mxrGcc0nuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/12] drm/xe/reg_whitelist: Report whitelist overflow
 using structured xe_log API
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260819191442.1957986-7-dnyaneshwar.bhadane@intel.com>
References: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
 <20260819191442.1957986-7-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 19:22:11 +0000
Message-Id: <20260819192211.957481F000E9@smtp.kernel.org>
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
- [Medium] Passing the positive error code `EPERM` instead of a negative er=
ror code (`-EPERM`) to `xe_log_err()` causes the error code to be silently =
dropped from the log output.
--

--- Patch [6]: [PATCH 06/12] drm/xe/reg_whitelist: Report whitelist overflo=
w using structured xe_log API ---
commit f104144be2febf4b75435938d8bb0126a65964c3
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

drm/xe/reg_whitelist: Report whitelist overflow using structured xe_log API

This commit replaces xe_gt_err() with the structured xe_log_err() API
when the maximum register whitelist slots are exhausted. It introduces the
REGS component tag to these log messages.

> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/x=
e_reg_whitelist.c
> index cab1b578ca0ef..d58c31b301991 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
[ ... ]
> @@ -186,9 +187,9 @@ static int whitelist_apply_to_hwe(struct xe_hw_engine=
 *hwe, struct xe_reg_sr *in
>  		};
> =20
>  		if (slot =3D=3D RING_MAX_NONPRIV_SLOTS) {
> -			xe_gt_err(hwe->gt,
> -				  "hwe %s: maximum register whitelist slots (%d) reached, refusing t=
o add more\n",
> -				  hwe->name, RING_MAX_NONPRIV_SLOTS);
> +			xe_log_err(hwe->gt, REGS, EPERM,

[Severity: Medium]
Will this drop the error code from the log message?

Looking at the xe_log_err macro definition:

#define xe_log_err(any, TAG, err, fmt, args...) \
	xe_log_comp_recoverable((any), TAG, ERR_PTR(err), 0, fmt, ##args)

The macro passes the error code wrapped in ERR_PTR(). If we pass a positive
value like EPERM, ERR_PTR(EPERM) will evaluate to false under the kernel's
IS_ERR() check, since only values in the [-MAX_ERRNO, -1] range are conside=
red
valid errors.

This can cause the logging infrastructure to completely drop the error code
from the structured output.

Should this be passed as -EPERM instead?

> +				   "hwe %s: maximum register whitelist slots (%d) reached, refusing =
to add more\n",
> +				   hwe->name, RING_MAX_NONPRIV_SLOTS);
>  			break;
>  		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819191442.1957=
986-1-dnyaneshwar.bhadane@intel.com?part=3D6
