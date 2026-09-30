Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73754CA5FB1
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 12:04:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C2110F350;
	Wed, 30 Sep 2026 12:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kyWRBhbF";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BBC10F34E;
 Wed, 30 Sep 2026 12:04:30 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D120260008;
 Wed, 30 Sep 2026 12:04:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 519401F000FF;
 Wed, 30 Sep 2026 12:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790769869;
 bh=NoLly8Upwuytnlzj5W64jbN0a3f4wCMaLLoCl/ISn0Y=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=kyWRBhbFK7rxqKw172EJR1y58fkBdTNiuhOXnpLEBEwJjilNk+gd+s1kjZvf8KxZ7
 WXA5vk++hLWTJDLcyfIMZZvv18NcB3a7AkY2j1o3LZfnfimm6pr0cLm8r2crdCOoN2
 MSO/nvrcEIyF+2qD252iXPFMH3m+xTr0YeNPWTEYEKsI2SARgVq7Mf0Qa5UppQ7NVx
 RWpDP4LkEvI6cN55stUr+xtdTLPJiS1EsyArkir0Kc93qoYycKNZ0YX7IpvEfbh+M1
 WjGEzJlQJmlnbAzxo6QINI8P/Hjyu6VuEKUQNsK37dAsEHN5j0opNR/k6/yCJZtMEy
 kgQBZB4YHGeIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] drm/i915/gmbus: Switch GMBUS fully to _fw()
 register accesses
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260930115303.24285-1-ville.syrjala@linux.intel.com>
References: <20260930115303.24285-1-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 12:04:28 +0000
Message-Id: <20260930120429.519401F000FF@smtp.kernel.org>
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
- [Medium] drm/i915: accidental use of intel_de_wait_ms() defeats DC optimi=
zation
--

commit 1836a89e6bc24b1ddcaa1396b56e118dff0e2e2c
Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

drm/i915/gmbus: Switch GMBUS fully to _fw() register accesses

This commit switches GMBUS code to use _fw() register accesses rather than
_notrace() variants. The primary goal is to avoid exiting DC5/6 during PCH
register accesses, which was causing significant performance penalties.

> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm=
/i915/display/intel_gmbus.c
> index 60a70dea5d856..09171f3db298d 100644
> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c

[ ... ]

> @@ -454,7 +454,7 @@ gmbus_wait_idle(struct intel_display *display)
>  	add_wait_queue(&display->gmbus.wait_queue, &wait);
>  	intel_de_write_fw(display, GMBUS4(display), irq_enable);
> =20
> -	ret =3D intel_de_wait_fw_ms(display, GMBUS2(display), GMBUS_ACTIVE, 0, =
10, NULL);
> +	ret =3D intel_de_wait_ms(display, GMBUS2(display), GMBUS_ACTIVE, 0, 10,=
 NULL);

[Severity: Medium]
Does replacing intel_de_wait_fw_ms() with intel_de_wait_ms() defeat the DC
optimization intended by this commit?

Looking at intel_de_wait_ms() in intel_de.c, it acquires wakelocks and does
standard register reads:

int intel_de_wait_ms(...)
{
    ...
    intel_dmc_wl_get(display, reg);

    ret =3D intel_de_wait_for_register(display, reg, mask, value,
                                     timeout_ms * 1000,
                                     intel_de_read,
                                     out_value, false);
    ...
}

Since the commit message notes that the extra north FPGA_DBG register
accesses cause DC5/6 exits, it seems calling intel_de_wait_ms() here will p=
ull
in the uncore lock acquisitions and DMC wakelocks that force the hardware o=
ut
of DC5/6.=20

Could this unintended swap cause a performance regression during display
operations that require GMBUS transfers?

> =20
>  	intel_de_write_fw(display, GMBUS4(display), 0);
>  	remove_wait_queue(&display->gmbus.wait_queue, &wait);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930115303.2428=
5-1-ville.syrjala@linux.intel.com?part=3D1
