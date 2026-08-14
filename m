Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF423C5CFCF
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:33:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8622010E193;
	Fri, 14 Aug 2026 17:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jNe4tWaI";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B4C10E193
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:33:47 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E513442E9E;
 Fri, 14 Aug 2026 17:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E0F51F000E9;
 Fri, 14 Aug 2026 17:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786728826;
 bh=3MZIAcDZy7lNZMVVbpgDgF/G+2GrJLO22/RHOlJsq+k=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=jNe4tWaIlLuDfQe0hdl4Bg1nBnEQPWII32SCDp9uPt9ayi339a0MkjsVRZGN2Ow9a
 NuZ72i1QOs9cTXegCEh8/NiDxWFExdlTbBpHbMnZ0E91tgE2M5A1kO//RXX2ELwHAQ
 PW0cfukfrFQjF77Cwr7/cHHjtulvy6OuJJZ0vlsStUR6odnpigStNvnlNVQHV5RYDD
 6O3rYNNIVKg9Tpe9T2UQhla70ZNLALYdObe0vTVabZYfzmfUKD3ZMvS1RZXBJuWZEY
 pUSwh+KEOmQ5HSFpfgYxp+7Bixi/tdvw+QcUwnhcDegDkyNuxTPX91p4/hDeYt8yoi
 4Z26wxUfCJgMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 28/33] drm/xe/pcode: Report 'initialization timedout'
 error using SIGID
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260814171801.13347-29-michal.wajdeczko@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
 <20260814171801.13347-29-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 17:33:46 +0000
Message-Id: <20260814173346.9E0F51F000E9@smtp.kernel.org>
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
- [High] The polling loop in `pcode_try_request` uses unbounded exponential=
 backoff, causing massive delay intervals, dangerous `udelay()` values, and=
 incorrect timeout calculations.
--

--- Patch [28]: [PATCH v5 28/33] drm/xe/pcode: Report 'initialization timed=
out' error using SIGID ---
commit 37b63ecd447fce41ca2633f291eae720f6ea1ba1
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>

drm/xe/pcode: Report 'initialization timedout' error using SIGID

This commit updates xe_pcode_ready() to report initialization timeouts
using the xe_log_err helper with a SIGID. It also replaces the hardcoded
integer timeout with a calculated value using USEC_PER_SEC.

> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index 14b13a11d1d6d..e1b8062541a91 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -297,7 +297,7 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
>  {
>  	u32 status, request =3D DGFX_GET_INIT_STATUS;
>  	struct xe_tile *tile =3D xe_device_get_root_tile(xe);
> -	int timeout_us =3D 180000000; /* 3 min */
> +	long timeout_us =3D 3 * 60 * USEC_PER_SEC; /* 3 min */

[Severity: High]
This is a pre-existing issue, but does the polling loop in
pcode_try_request() have an uncapped exponential backoff that causes
dangerous wait intervals here?

With timeout_us set to 3 minutes (180,000,000 us), the backoff loop
in pcode_try_request() doubles the wait variable repeatedly:

	for (slept =3D 0; slept < timeout_us; slept +=3D wait) {
...
		if (atomic)
			udelay(wait);
		else
			usleep_range(wait, wait << 1);
		wait <<=3D 1;
	}

Because there is no cap on wait, it will grow exponentially until it
reaches ~83 seconds, leading to a massive sleep interval that could
break hardware responsiveness and stall the kernel thread.

Additionally, when xe_pcode_request() polls with preemption disabled
(atomic =3D true), wait can grow up to ~32ms, leading to udelay(32000),
which exceeds architecture limits for udelay() and risks soft lockups.

Also, since slept adds wait before the actual sleep duration is completed,
and wait is then doubled, does this miscalculate the elapsed time and
effectively halve the actual timeout?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814171801.1334=
7-1-michal.wajdeczko@intel.com?part=3D28
