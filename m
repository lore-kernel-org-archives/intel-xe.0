Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A56C5DF67
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 22:17:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE88A10F146;
	Wed, 12 Aug 2026 22:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZXockr5U";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1138B10E452
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:49:38 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id ED6AD419B6;
 Wed, 12 Aug 2026 19:49:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B531F000E9;
 Wed, 12 Aug 2026 19:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786564177;
 bh=lqOvWFyajdSkHDxnBxgBXUg1l9UCeoFQ+vhDJDrESjs=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=ZXockr5UeKDNqg9IN8XykGOFWTa2WKh8lfduHr8l7GfKXgo4SHHlHwTufJfZ/ZNTn
 AzomSNgcZMORD0vsbB+Njtgi+VyqRt9IztqdyLyO8Q1OM9WYcIrQdjh9V8dYKzqYJt
 34dArB/88YCyNe6E+e72+Hzr5ioE4ygTsEZ4V15mji77EFW9vvAW3pBhhYpa6plcJj
 fmt4AH/vZEpdXDnZspmtygLGG8mEzF+eGTrt2UOypjGoabLDlnmoLy6sgKtlMaKCtt
 sa7snWxX0NXAg7pNw52ijDB/nD0J8hKJi87q35zO0Foy5IJORhc/WIPxWXLT61z+pt
 aK40TO2Zk+/mw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 27/32] drm/xe/pcode: Report 'initialization timedout'
 error using SIGID
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260812191450.11690-28-michal.wajdeczko@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-28-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 19:49:37 +0000
Message-Id: <20260812194937.A6B531F000E9@smtp.kernel.org>
X-Mailman-Approved-At: Wed, 12 Aug 2026 22:17:09 +0000
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

Pre-existing issues:
- [High] Uncapped exponential backoff causes massive over-sleeping and pote=
ntial kernel panic.
--

--- Patch [27]: [PATCH v4 27/32] drm/xe/pcode: Report 'initialization timed=
out' error using SIGID ---
commit 3feb217014d673b0d9d119f4debacacb0e357e77
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>

drm/xe/pcode: Report 'initialization timedout' error using SIGID

This commit updates the PCODE initialization timeout error to use the
xe_log_err() helper instead of drm_err(). It also refactors the 3 minute
timeout constant to use USEC_PER_SEC.

> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index 14b13a11d1d6d..e1b8062541a91 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -297,7 +297,7 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
[ ... ]
>  	if (locked)
>  		mutex_lock(&tile->pcode.lock);
> =20
>  	ret =3D pcode_try_request(tile, DGFX_PCODE_STATUS, request,
>  				DGFX_INIT_STATUS_COMPLETE,
>  				DGFX_INIT_STATUS_COMPLETE,
>  				&status, false, timeout_us, locked);

[Severity: High]
This is a pre-existing issue, but can the 3-minute timeout passed here
trigger a kernel panic via the Hung Task Detector if PCODE is unresponsive?

Looking at pcode_try_request() in drivers/gpu/drm/xe/xe_pcode.c, the wait
duration is exponentially increased without any cap:

	usleep_range(wait, wait << 1);
	wait <<=3D 1;

When the timeout is 180,000,000 us (3 minutes), the polling loop doubles the
wait variable every iteration. When the total slept time reaches ~167 secon=
ds,
the wait variable becomes ~83.8 seconds. The loop then executes:

	usleep_range(83886080, 167772160);

Since usleep_range() sleeps in TASK_UNINTERRUPTIBLE, sleeping for up to 167=
.7
seconds exceeds the default 120-second hung task watchdog timeout, causing a
panic. Furthermore, if atomic=3Dtrue was used with a large timeout, it would
result in a massive udelay(), violating architectural limits with preemption
disabled.

Could a cap be added to the maximum wait time in pcode_try_request() to
prevent massive over-sleeping?

> =20
>  	if (locked)
>  		mutex_unlock(&tile->pcode.lock);
> =20
>  	if (ret)
> -		drm_err(&xe->drm,
> -			"PCODE initialization timedout after: 3 min\n");
> +		xe_log_err(tile, PCODE, ret, "initialization timedout after %ld second=
s\n",
> +			   timeout_us / USEC_PER_SEC);
> =20
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812191450.1169=
0-1-michal.wajdeczko@intel.com?part=3D27
