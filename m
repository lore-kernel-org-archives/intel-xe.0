Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC13C5DF61
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 17:41:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C220410F0CC;
	Wed, 12 Aug 2026 17:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cpyqvTDX";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E69C010E3A7
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 00:01:21 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id D3135431D7;
 Wed, 12 Aug 2026 00:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 988771F000E9;
 Wed, 12 Aug 2026 00:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786492880;
 bh=MxbgxhHn8enXwDpB7m8Y0jxKmhDaOF3SvwiMz67Jy2A=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=cpyqvTDXcS7JJRkDGfG0q+JaBRCJidGERMCpb70xU5f3/aemHJKxglS6LSCHn0ZBr
 BbjhxxLlXD4icyMPwwNnI03J9wKZ/BkSI56e7959LdLhhnpptZk7PW2E8hatmQiao4
 S+Nrfyzyaeoan+nUGOISeP8EFs35FhwKjQGn0zeRry/G2jQU2Q5fpXED1VHDpxlSQ4
 WqcRX7pg2UrDLy73WwQPPUIbzuuMJCiUf+OLAqr6fwmHkRIDFERg1llRkCGyvylKcT
 Q500x+Z7DjubFYXlLouj8+UAANyWUvqhVe+xgNZ/5DT8ILF1OOnBsZyh3r4Mx4mfQf
 JU6BmPPYWp2lA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] drm/xe/pcode: Report pcode errors using SIGID
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260811235254.153783-9-umesh.nerlige.ramappa@intel.com>
References: <20260811235254.153783-6-umesh.nerlige.ramappa@intel.com>
 <20260811235254.153783-9-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 00:01:20 +0000
Message-Id: <20260812000120.988771F000E9@smtp.kernel.org>
X-Mailman-Approved-At: Wed, 12 Aug 2026 17:41:20 +0000
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
- [Medium] Passing a negated error code (`-ret`) to `xe_log_err()` in `xe_p=
code_ready()` creates a positive value, causing the internal `IS_ERR()` che=
ck to fail and silently drop the error code from the log output.
- [Low] Missing newline (`\n`) in the format string for `xe_log_err()` in `=
xe_pcode_request()`.
--

--- Patch [3]: [PATCH 3/4] drm/xe/pcode: Report pcode errors using SIGID ---
commit d093d9ae2e2b45793c1c50dd19b274f80a9f8387
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

drm/xe/pcode: Report pcode errors using SIGID

This commit replaces direct drm_err() logging calls with the xe_log_err()
wrapper in the pcode component. This updates the driver to report pcode=20
errors using the SIGID mechanism.

> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index e9125341481b7..b35c1a77effd1 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c

[ ... ]

> @@ -225,6 +224,9 @@ int xe_pcode_request(struct xe_tile *tile, u32 mbox, =
u32 request,
>  				true, 50 * 1000, true);
>  	preempt_enable();
> =20
> +	if (!status && ret)
> +		xe_log_err(tile, PCODE, ret, "Request timed out on retry");

[Severity: Low]
This isn't a bug, but should this format string end with a newline character
(\n) to prevent subsequent kernel log messages from being appended to the
same line?

> +
>  out:
>  	mutex_unlock(&tile->pcode.lock);
>  	return status ? status : ret;

[ ... ]

> @@ -319,8 +321,8 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
>  		mutex_unlock(&tile->pcode.lock);
> =20
>  	if (ret)
> -		drm_err(&xe->drm,
> -			"PCODE initialization timedout after: 3 min\n");
> +		xe_log_err(xe, PCODE, -ret,
> +			"Initialization timed out after: %d min\n", timeout_us / 60000000);

[Severity: Medium]
The xe_log_err() macro wraps the passed error code in ERR_PTR(). If ret is
already a negative error code (such as -ETIMEDOUT), does passing -ret create
a positive value that will fail the internal IS_ERR() check inside the
logging framework and silently drop the error code?

> =20
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260811235254.1537=
83-6-umesh.nerlige.ramappa@intel.com?part=3D3
