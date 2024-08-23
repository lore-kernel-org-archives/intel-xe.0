Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A26C52D7C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 15:20:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F8C10E06B;
	Fri, 23 Aug 2024 15:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="axc9GvIE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB0310E06B
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Aug 2024 15:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724426456; x=1755962456;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=BR4Fe1V9DwglHJqhHkcd3fM8+L46Vt62QYaYxnMGEGU=;
 b=axc9GvIEPKQnP4NEBBS/49vLdVUZmMLmXAARly78S/3MkXBZ+H+neLSE
 AotYQY32JULSbAQCF4zXcLxRqxC8Xcyp0yUARPa/+W7BP5IioFYkS1x7N
 +VcuEUM/ijOC7FFZllbRhD12IHNbPTM24DxrSF+B/+4ISjTdQjpzLaGBi
 c61t1hjUTEf1EjuSZMMMFX6g5WJvTamzpkTUxFa7s1RdNUuwuXBVCB6g3
 xJmpft2TzXYLVXPbUERSmKSiKtl3MzNPEALaaa0asZWdsCt3zJW/IOesj
 oNAgskighpM6gwcaKWq60wEUgi/vjoASAPTjJK6DgfIR1Wz4SAsCM9bff w==;
X-CSE-ConnectionGUID: lOJmuhy4QDeg0JoUVqoKYg==
X-CSE-MsgGUID: yE6H9Hp/SjmL10On8YShAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23080304"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="23080304"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 08:20:56 -0700
X-CSE-ConnectionGUID: XU+nHBt6Qim4KYtCqqohIw==
X-CSE-MsgGUID: 11yUoyzASOC/C3gV0l96wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="62538501"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.39])
 ([10.245.245.39])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 08:20:55 -0700
Message-ID: <ed1f0a1ffb6f199e61c509f4c98fec97983a084b.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Use separate rpm lockdep map for
 non-d3cold-capable devices
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Date: Fri, 23 Aug 2024 17:20:52 +0200
In-Reply-To: <4c75e56030c904cebea2c74544024e308f65bd68.camel@linux.intel.com>
References: <20240823135906.78899-1-thomas.hellstrom@linux.intel.com>
 <Zsif_XiAGPRvAIHa@intel.com>
 <4c75e56030c904cebea2c74544024e308f65bd68.camel@linux.intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, 2024-08-23 at 17:15 +0200, Thomas Hellstr=C3=B6m wrote:
> Hi, Rodrigo.
>=20
> On Fri, 2024-08-23 at 10:43 -0400, Rodrigo Vivi wrote:
> > On Fri, Aug 23, 2024 at 03:59:06PM +0200, Thomas Hellstr=C3=B6m wrote:
> >=20
> > Hi Thomas, first of all, please notice that you used the wrong
> > address from our mailing list ;)
>=20
> You're right. Well it's friday afternoon here...
>=20
> >=20
> > but a few more comments below...
> >=20
> > > For non-d3cold-capable devices we'd like to be able to wake up
> > > the
> > > device from reclaim. In particular, for Lunar Lake we'd like to
> > > be
> > > able to blit CCS metadata to system at shrink time; at least from
> > > kswapd where it's reasonable OK to wait for rpm resume and a
> > > preceding rpm suspend.
> > >=20
> > > Therefore use a separate lockdep map for such devices and prime
> > > it
> > > reclaim-tainted.
> >=20
> > Cc: Matthew Auld <matthew.auld@intel.com>
> >=20
> > >=20
> > > Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
> > > Signed-off-by: Thomas Hellstr=C3=B6m
> > > <thomas.hellstrom@linux.intel.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/xe/xe_pm.c | 45 +++++++++++++++++++++++++++++++=
-
> > > --
> > > ----
> > > =C2=A01 file changed, 37 insertions(+), 8 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_pm.c
> > > b/drivers/gpu/drm/xe/xe_pm.c
> > > index 9f3c14fd9f33..2e9fdb5da8bb 100644
> > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > @@ -70,11 +70,29 @@
> > > =C2=A0 */
> > > =C2=A0
> > > =C2=A0#ifdef CONFIG_LOCKDEP
> > > -static struct lockdep_map xe_pm_runtime_lockdep_map =3D {
> > > -	.name =3D "xe_pm_runtime_lockdep_map"
> > > +static struct lockdep_map xe_pm_runtime_d3cold_map =3D {
> > > +	.name =3D "xe_rpm_d3cold_map"
> > > +};
> > > +
> > > +static struct lockdep_map xe_pm_runtime_nod3cold_map =3D {
> > > +	.name =3D "xe_rpm_nod3cold_map"
> > > =C2=A0};
> > > =C2=A0#endif
> > > =C2=A0
> > > +static void xe_pm_runtime_acquire(const struct xe_device *xe)
> >=20
> > I believe this should have a different name.
> > runtime_acquire and runtime_release sounds like runtime_get and
> > runtime_put...
> >=20
> > since it is static perhaps we should only call it
> > xe_rpm_lockmap_acquire
> > and xe_rpm_lockmap_release
>=20
> Sure, I'll fix
>=20
> >=20
> > or
> > d3_lockmap_acquire
> > d3_lockmap_release ?
> >=20
> > or something like that...
> >=20
> > > +{
> > > +	lock_map_acquire(xe->d3cold.capable ?
> > > +			 &xe_pm_runtime_d3cold_map :
> > > +			 &xe_pm_runtime_nod3cold_map);
> > > +}
> > > +
> > > +static void xe_pm_runtime_release(const struct xe_device *xe)
> > > +{
> > > +	lock_map_release(xe->d3cold.capable ?
> > > +			 &xe_pm_runtime_d3cold_map :
> > > +			 &xe_pm_runtime_nod3cold_map);
> > > +}
> > > +
> > > =C2=A0/**
> > > =C2=A0 * xe_pm_suspend - Helper for System suspend, i.e. S0->S3 / S0-
> > > > S2idle
> > > =C2=A0 * @xe: xe device instance
> > > @@ -354,7 +372,7 @@ int xe_pm_runtime_suspend(struct xe_device
> > > *xe)
> > > =C2=A0	 * annotation here and in xe_pm_runtime_get() lockdep
> > > will
> > > see
> > > =C2=A0	 * the potential lock inversion and give us a nice
> > > splat.
> > > =C2=A0	 */
> > > -	lock_map_acquire(&xe_pm_runtime_lockdep_map);
> > > +	xe_pm_runtime_acquire(xe);
> > > =C2=A0
> > > =C2=A0	/*
> > > =C2=A0	 * Applying lock for entire list op as xe_ttm_bo_destroy
> > > and xe_bo_move_notify
> > > @@ -386,7 +404,7 @@ int xe_pm_runtime_suspend(struct xe_device
> > > *xe)
> > > =C2=A0out:
> > > =C2=A0	if (err)
> > > =C2=A0		xe_display_pm_resume(xe, true);
> > > -	lock_map_release(&xe_pm_runtime_lockdep_map);
> > > +	xe_pm_runtime_release(xe);
> > > =C2=A0	xe_pm_write_callback_task(xe, NULL);
> > > =C2=A0	return err;
> > > =C2=A0}
> > > @@ -407,7 +425,7 @@ int xe_pm_runtime_resume(struct xe_device
> > > *xe)
> > > =C2=A0	/* Disable access_ongoing asserts and prevent recursive
> > > pm
> > > calls */
> > > =C2=A0	xe_pm_write_callback_task(xe, current);
> > > =C2=A0
> > > -	lock_map_acquire(&xe_pm_runtime_lockdep_map);
> > > +	xe_pm_runtime_acquire(xe);
> > > =C2=A0
> > > =C2=A0	if (xe->d3cold.allowed) {
> > > =C2=A0		err =3D xe_pcode_ready(xe, true);
> > > @@ -437,7 +455,7 @@ int xe_pm_runtime_resume(struct xe_device
> > > *xe)
> > > =C2=A0			goto out;
> > > =C2=A0	}
> > > =C2=A0out:
> > > -	lock_map_release(&xe_pm_runtime_lockdep_map);
> > > +	xe_pm_runtime_release(xe);
> > > =C2=A0	xe_pm_write_callback_task(xe, NULL);
> > > =C2=A0	return err;
> > > =C2=A0}
> > > @@ -458,8 +476,19 @@ int xe_pm_runtime_resume(struct xe_device
> > > *xe)
> > > =C2=A0 */
> > > =C2=A0static void pm_runtime_lockdep_prime(void)
> > > =C2=A0{
> > > -	lock_map_acquire(&xe_pm_runtime_lockdep_map);
> > > -	lock_map_release(&xe_pm_runtime_lockdep_map);
> > > +	struct dma_resv lockdep_resv;
> > > +
> > > +	dma_resv_init(&lockdep_resv);
> > > +	lock_map_acquire(&xe_pm_runtime_d3cold_map);
> > > +	/* D3Cold takes the dma_resv locks to evict bos */
> > > +	dma_resv_lock(&lockdep_resv, NULL);
> > > +	fs_reclaim_acquire(GFP_KERNEL);
> > > +	/* Shrinkers like to wake up the device under reclaim.
> > > */
> > > +	lock_map_acquire(&xe_pm_runtime_nod3cold_map);
> > > +	lock_map_release(&xe_pm_runtime_nod3cold_map);
> > > +	fs_reclaim_release(GFP_KERNEL);
> > > +	dma_resv_unlock(&lockdep_resv);
> > > +	lock_map_release(&xe_pm_runtime_d3cold_map);
> >=20
> > do we really need this entire sequence? or checking for d3capable
> > here could have 2 different smaller sequences?
>=20
> Hm. I forgot to check when this function was called. I was assuming
> it
> was called only once per driver instance and in that case we need it
> all since we can have multiple devices with different capabilities,
> but
> it seems to be called on each runtime_get(). Is that intentional?

Otherwise I'd like to change that to be called at module init?

/Thomas



>=20
> /Thomas
>=20
>=20
> >=20
> > > =C2=A0}
> > > =C2=A0
> > > =C2=A0/**
> > > --=20
> > > 2.44.0
> > >=20
>=20

