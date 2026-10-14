Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C22CC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 12:16:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389E810FDBE;
	Wed, 14 Oct 2026 12:16:34 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63F110FDCD
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 12:16:28 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id ECADD60218;
 Wed, 14 Oct 2026 12:16:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED151F000FF;
 Wed, 14 Oct 2026 12:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791980187;
 bh=/cA5gIUBjsSk+yr+sUYNYthQd0nxTZyFpgKClVnr0dI=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=jNfHe0ZqSIIoH17t5PzEv/LrdxWt+GvLZjW8xMAErGPEaw/wQcVuRmCM9BsZkxR8g
 f3awlLS4F3dB0TdzDnfVIYaqoy974ujtTlrRw8EbmadP/fWVRBZaRd+c+YwiamEq+Z
 D2Exke+TT9CwczznucCz9CI4KAqXVoeL49ERZ7G9S/lRfjQDx8RqcKnQqNDGK63ibI
 Kf/7CAWmMkVw3sNH5mieqmg1+HpQwkk2oYfZKicI1QmSkkbpeQpOinoh2oddj+GKKL
 gSoXNboa94X5IsWwtlg6Nv6gkfhQrX/Mn4p9/CyetSvxelII5qqcYgGlA28via476e
 7tl3kyu4p+wrw==
Message-ID: <sashiko-outbox-171260@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 03/16] drm/xe/hwmon: Fix thermal sensor data handling
To: "Karthik Poosa" <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261014115806.831459-4-karthik.poosa@intel.com>
References: <20261014115806.831459-1-karthik.poosa@intel.com>
 <20261014115806.831459-4-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 12:16:27 +0000
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
- [Low] hwmon: Subsystem API Violation - Driver uses private custom mutex i=
nstead of hwmon_lock()
--

commit 5b607ffd1e7d970e08aa24f25b6f029c27e76b6d
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe/hwmon: Fix thermal sensor data handling

This commit reads required thermal groups in get_mc_temp() and stores them
in a dword-aligned buffer, avoiding unaligned pcode accesses. It also stores
the pcode thermal data and thermal limit words as little-endian.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 382bf9625a8bd..1b4efbf4ac999 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
[ ... ]
> @@ -840,16 +845,20 @@ static int mbx_temp_decode(u8 value)
>  static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>  {
>  	struct xe_tile *root_tile =3D xe_device_get_root_tile(hwmon->xe);
> -	u32 *dword =3D (u32 *)hwmon->temp.value;
>  	s32 average =3D 0;
>  	int ret, i;
> =20
> -	for (i =3D 0; i < DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32)); i++) {
> +	guard(mutex)(&hwmon->hwmon_lock);

[Severity: Low]
Does this violate the hardware monitoring subsystem locking requirements?

The hwmon subsystem documentation states that drivers implementing locking
required for interrupt handling or for attributes registered by any other
means must use the hwmon_lock() and hwmon_unlock() APIs.

Can we use the hwmon subsystem's locking API here instead of the
driver-specific hwmon_lock mutex?

> +
> +	for (i =3D 0; i < DIV_ROUND_UP(hwmon->temp.count, sizeof(u32)); i++) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014115806.8314=
59-1-karthik.poosa@intel.com?part=3D3
