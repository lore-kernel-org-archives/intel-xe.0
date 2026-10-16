Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C8ECCA48B
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 07:43:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC9A10E030;
	Fri, 16 Oct 2026 07:43:34 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A7210E030
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 07:43:28 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8849960A56;
 Fri, 16 Oct 2026 07:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145541F000C6;
 Fri, 16 Oct 2026 07:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1792136607;
 bh=kPCa2FuNNHNDFCAzOmFyyJq2gAJaN55LV/HpVGnvdRY=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=jHkGaITtwO8uGuNpFP49QMWcz6/JAlKvKrcwfe2I3zb3NW57xlivcYA8QKJeNDLbD
 2O6LNwNGyx7tcGvmPPBpaSUKTjbrA15jIyvgNI7z2Tfjd1XKrhNDScdRSZ+03VfIRl
 Ti9Yz1Dfa1MOG3GyaA693kL/tBXl3t9q11CyWQbu6RRZdpAuoX7aepZzTV3shCae1E
 ioRgfL1Qzj0ns7D5ieNOGTyBB9NEBzK9HRQLDRM8+XQl8jn7/EWLcKCfpTkC+FB7Tu
 Il2x3AL5jt9XFTYj8MZ2J52rEjNfVpSCprKVEqOrqKMu8A2wVsNJFr9eOIGCaatozM
 CFtKjrqbDKkIQ==
Message-ID: <sashiko-outbox-173956@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 3/9] drm/xe/hw_error: Guard csc_hw_error_work() with
 runtime PM
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261016072623.457392-4-raag.jadav@intel.com>
References: <20261016072623.457392-1-raag.jadav@intel.com>
 <20261016072623.457392-4-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 07:43:26 +0000
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] xe: missing cancel_work_sync() for csc_hw_error_work causes UAF
- [Medium] drm/xe: missing multiple invocation protection in xe_survivabili=
ty_mode_runtime_enable() causes sysfs WARN
- [Low] drm/xe: missing xe_pm.h header inclusion for guard(xe_pm_runtime)
--

commit 8e1fc55f44fb943c373142f62d0ab081c339411d
Author: Raag Jadav <raag.jadav@intel.com>
   =20
drm/xe/hw_error: Guard csc_hw_error_work() with runtime PM
   =20
This commit adds a runtime PM reference around the survivability mode
enablement path in the hardware error worker.

> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_=
error.c
> index f53a6b3055de1..7575cc09cc2a9 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -170,6 +170,7 @@ static void csc_hw_error_work(struct work_struct *wor=
k)
>  	struct xe_tile *tile =3D container_of(work, typeof(*tile), csc_hw_error=
_work);
>  	struct xe_device *xe =3D tile_to_xe(tile);
> =20
> +	guard(xe_pm_runtime)(xe);

[Severity: Low]
Does this compile cleanly?

The guard(xe_pm_runtime) macro requires the corresponding cleanup class
definition class_xe_pm_runtime_t.

This class is defined in xe_pm.h, but it appears xe_hw_error.c doesn't
include it directly or indirectly, which might lead to an unknown type
build error.

[Severity: High]
Is there a missing work cancellation regression during device teardown?

csc_hw_error_work is queued to the system workqueue upon a hardware error.
If the driver is removed or the module unloaded, the DRM and device core
release paths will free the xe and tile structures.

If cancel_work_sync() is missing during teardown, couldn't an executing
or pending worker cause a use-after-free when it tries to dereference xe
in this guard?

>  	xe_survivability_mode_runtime_enable(xe);

[Severity: Medium]
Could multiple hardware errors trigger a sysfs warning regression here?

csc_hw_error_work() can be queued and executed multiple times. If
xe_survivability_mode_runtime_enable() is invoked unconditionally on each
run, it will attempt to re-register the existing sysfs files via
create_survivability_sysfs().

This could fail with -EEXIST and trigger a kernel warning about duplicate
filenames.

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016072623.4573=
92-1-raag.jadav@intel.com?part=3D3
