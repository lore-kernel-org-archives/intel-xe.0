Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EB2C61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 08:25:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A20510E75A;
	Mon, 31 Aug 2026 08:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E9o4DVNi";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE5F10E75A
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 08:25:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0BBB440316;
 Mon, 31 Aug 2026 08:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBBA61F000E9;
 Mon, 31 Aug 2026 08:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788164717;
 bh=IUn1wWW+DJirXiijg/5qp3Z9cVZ+xyC70ZZXQmWmYXg=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=E9o4DVNiAY2anYUszB35LFjSF5z0AgkSlPKZqBNlrEh2xrfuHM8Q7RTR6Mf3xRuoZ
 2mvyrQfONV7aO+zx9mhPaiY893FHH+zvXZu5QJP1/4lmC9hA2YAQchP0pAy/sq9nkz
 u4L6Hs97WVscdPCWusCZbAT479Zf94PzmNwig3nXe35DZzf57Tk0cMbhxrBSfx54XF
 SYcFyj2BJTAwoaLm0mY17Tg2glIBDoEbllU/MPJqk1i3f+/A0LyO9eMY7d1XJtJizW
 k1Yl0wEcP9ad+/8jk4ElwwuRPNXgERUTgP0fqOsbFwLDubDUt9HmAQ9JqN/igkNxws
 JcDY+KI86Bufw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] drm/xe/gt: Report GT reset failure using SIGID
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260831080507.2364687-5-arvind.yadav@intel.com>
References: <20260831080507.2364687-1-arvind.yadav@intel.com>
 <20260831080507.2364687-5-arvind.yadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 08:25:17 +0000
Message-Id: <20260831082517.CBBA61F000E9@smtp.kernel.org>
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
- [Low] Incorrect time unit in GT reset failure log message (reports 5000 m=
s instead of 5 ms / 5000 us)
--

commit 4b084e884bdfae225e6341823adbd51d6b4fd3dd
Author: Arvind Yadav <arvind.yadav@intel.com>

drm/xe/gt: Report GT reset failure using SIGID

This commit routes the GT reset failure log through the structured SIGID
logging helper using the GT component. It also updates the error message
to describe that the full graphics reset did not complete within the timeou=
t.

> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 478e047031f4f..18a6d5a6686ca 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -830,8 +830,8 @@ static int do_gt_reset(struct xe_gt *gt)
>  	xe_mmio_write32(&gt->mmio, GDRST, GRDOM_FULL);
>  	err =3D xe_mmio_wait32(&gt->mmio, GDRST, GRDOM_FULL, 0, 5000, NULL, fal=
se);
>  	if (err)
> -		xe_gt_err(gt, "failed to clear GRDOM_FULL (%pe)\n",
> -			  ERR_PTR(err));
> +		xe_log_err(gt, GT, err,
> +			   "full graphics reset not completed in %u ms\n", 5000);

[Severity: Low]
Does this log message in do_gt_reset() report the wrong time unit?=20

The timeout parameter passed to xe_mmio_wait32() right before this is 5000
microseconds, but the new error message hardcodes "5000 ms" (5 seconds).
Reporting 5000 ms might significantly mislead anyone diagnosing GT reset
failures into believing the driver waited 1000x longer than it actually did.
Should this be updated to say "5 ms" or "5000 us" to accurately reflect the
wait time?

> =20
>  	xe_gsc_wa_14015076503(gt, false);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831080507.2364=
687-1-arvind.yadav@intel.com?part=3D4
