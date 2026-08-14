Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95D9C5DF66
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 00:54:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3DD10E120;
	Fri, 14 Aug 2026 00:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IT0TPz5n";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D460310E120
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 00:54:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 90B184160B;
 Fri, 14 Aug 2026 00:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5234C1F000E9;
 Fri, 14 Aug 2026 00:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786668844;
 bh=L/TlWDnRGJX6KcLSGVZYj6QRKMSl+LnuHR7hKZyQShw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=IT0TPz5ngOT+uU8G8hGXz/20wLQG6WNknlqRt9EuzOrBDspjGN1KgzuVT1Afcb1aN
 5ofrxasbU13JAj3nnHY7YjVkvL+QbNYwnCQ/sxVFU/Ww/3Yn1dccfOJvBecBdW8SMJ
 28+jrURwYYVSj991sZ4ZXiQD0X09BFpY7RqjogIFoO5xxU24FGLBsgpCoVQu27yRDq
 w9gcfZyfPG7xdvXnCM0lI3MYUJp/RXlsqySb3w09lUFriAs8r6mdja3nzSLCZ86DKN
 Acmq2B40Ucv1UCLfRESDzCNj5U1PVUyBBI4Ow2AhatFuNpo/+CirzOPi9WicEY1WS5
 L9AiGXbLI+s7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] drm/xe/hwmon: Enable package and vram temperatures
 for CRI
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260813193546.511093-1-karthik.poosa@intel.com>
References: <20260813193546.511093-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 00:54:02 +0000
Message-Id: <20260814005404.5234C1F000E9@smtp.kernel.org>
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
- [High] Potential division by zero in `get_mc_temp` when the thermal senso=
r count is 3.
--

--- Patch [1]: [PATCH v2] drm/xe/hwmon: Enable package and vram temperature=
s for CRI ---
commit 7fa6b15888cc9f0808566087b3307d62fbda4703
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Enable package and vram temperatures for CRI

This commit enables package and vram temperatures support from hwmon on the
CRI platform. It updates the hwmon register mapping to use the same MMIO
offsets as BMG.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index de3f2aeffc3fb..30059f1de5a82 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c

[ ... ]

>  static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>  {
>  	struct xe_tile *root_tile =3D xe_device_get_root_tile(hwmon->xe);

[ ... ]

>  	for (i =3D TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++)
>  		average +=3D hwmon->temp.value[i];
> =20
>  	average /=3D (hwmon->temp.count - TEMP_INDEX_MCTRL - 1);

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for a division
by zero to occur here in get_mc_temp()?

If the hardware or firmware provides a thermal sensor count of 3, and
TEMP_INDEX_MCTRL is 2, the denominator evaluates to 0.

Since the sysfs file for CHANNEL_MCTRL is visible as long as count > 0,
could a local unprivileged user reading the sysfs attribute trigger a kernel
panic if this condition is met?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813193546.5110=
93-1-karthik.poosa@intel.com?part=3D1
