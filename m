Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14985C27C4F
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 12:38:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F1A10E656;
	Tue, 18 Jun 2024 12:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V27uVnY+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B0410E656
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 12:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718714286; x=1750250286;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4belszkQiu/eitgIaE9sQPLfbbZxWmP66mQ+r/hm1PY=;
 b=V27uVnY+mo3q+GzlGvovvkZTG4fBLTbzvXV3S4U9TZVpXptra8OOilht
 VrzG77yE65VFHJlbZgRsSy5gfY1UGCmEFOLklXY/o4JTKgsDvQ2E9YUBd
 UrNsLzJzulp443tYkh/3G0ynvYUwSRDHRgaaLlDh4k4AakM12YKF90JWj
 3/lEABgp7gdxeLgFS0wDvHn/5/jmOCxVs8EXro1LHi00ajyqAcBb36bKs
 Duf0Ig+8n9sfbyV1Ns/e2GDBXq6SMnGQsmGVBW0ILms6K3L+4NilA1JPy
 bMLt+b55Ok4ZnIu+psWQFQ2Eu8CKOpHvhjO0zFHFdk/rdz6NH/NstQmPg Q==;
X-CSE-ConnectionGUID: A977AUbkTKqzMGpY4e22wg==
X-CSE-MsgGUID: uwhK2rVXT/uji71IFkygfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15424254"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="15424254"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 05:38:05 -0700
X-CSE-ConnectionGUID: YOU0HjPxRS+XDeOcnDd2eA==
X-CSE-MsgGUID: o68v8uBfQpGQ7M5WDJNYZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41640238"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO [10.245.245.67])
 ([10.245.245.67])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 05:38:04 -0700
Message-ID: <9c3ee93c4f5fffa5d5dd61ea71066fa231ab3ec5.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Use ttm_uncached for BO with NEEDS_UC flag
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Jun 2024 14:38:01 +0200
In-Reply-To: <20240617202838.GL2905419@mdroper-desk1.amr.corp.intel.com>
References: <20240606195630.1548-1-michal.wajdeczko@intel.com>
 <3dd4733f3cc7f322f25354c3e9d4a2dd363d2331.camel@linux.intel.com>
 <1b002473-552a-4392-b2b4-b0bdff61c59c@intel.com>
 <20240617202838.GL2905419@mdroper-desk1.amr.corp.intel.com>
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

Hi,

On Mon, 2024-06-17 at 13:28 -0700, Matt Roper wrote:
> On Wed, Jun 12, 2024 at 08:03:24PM +0200, Michal Wajdeczko wrote:
> > Hi Thomas,
> >=20
> > On 11.06.2024 14:47, Thomas Hellstr=C3=B6m wrote:
> > > Hi, Michal,
> > >=20
> > > On Thu, 2024-06-06 at 21:56 +0200, Michal Wajdeczko wrote:
> > > > We should honor requested uncached mode also at the TTM layer.
> > > > Otherwise, we risk losing updates to the memory based
> > > > interrupts
> > > > source or status vectors, as those require uncached memory.
> > > >=20
> > > > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > ---
> > > > =C2=A0drivers/gpu/drm/xe/xe_bo.c | 3 +++
> > > > =C2=A01 file changed, 3 insertions(+)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > b/drivers/gpu/drm/xe/xe_bo.c
> > > > index 2bae01ce4e5b..2573cc118f29 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > @@ -378,6 +378,9 @@ static struct ttm_tt
> > > > *xe_ttm_tt_create(struct
> > > > ttm_buffer_object *ttm_bo,
> > > > =C2=A0	=C2=A0=C2=A0=C2=A0 (xe->info.graphics_verx100 >=3D 1270 && b=
o->flags &
> > > > XE_BO_FLAG_PAGETABLE))
> > > > =C2=A0		caching =3D ttm_write_combined;
> > > > =C2=A0
> > > > +	if (bo->flags & XE_BO_FLAG_NEEDS_UC)
> > > > +		caching =3D ttm_uncached;
> > > > +
> > > > =C2=A0	err =3D ttm_tt_init(&tt->ttm, &bo->ttm, page_flags,
> > > > caching,
> > > > extra_pages);
> > > > =C2=A0	if (err) {
> > > > =C2=A0		kfree(tt);
> > >=20
> > > To me the preferred method is to teach bo->cpu_caching about the
> > > uncached mode and then include it in the switch statement above.
> > >=20
> >=20
> > but bo->cpu_caching is currently documented as:
> >=20
> > /**
> > =C2=A0* @cpu_caching: CPU caching mode. Currently only used for
> > userspace
> > =C2=A0* objects.
> > =C2=A0*/
> >=20
> > and value 0 is implicitly reserved as kind of default, so
> > 'teaching'
> > would likely mean either extending uapi with something like:
> >=20
> > =C2=A0 #define DRM_XE_GEM_CPU_CACHING_WB=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 1
> > =C2=A0 #define DRM_XE_GEM_CPU_CACHING_WC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 2
> > + #define DRM_XE_GEM_CPU_CACHING_UC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 3
> >=20
> > which will introduce lot of undesired right now code changes, or we
> > will
> > introduce internal only flag:
> >=20
> > + #define XE_CPU_CACHING_UC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ((u16)~0)
> >=20
> > but that doesn't look like a clean solution.
> >=20
> >=20
> > OTOH, just above this new diff chunk, there is already a code that
> > updates caching mode outside the "switch statement above":
> >=20
> > 	if ((!bo->cpu_caching && bo->flags & XE_BO_FLAG_SCANOUT)
> > ||
> > 	=C2=A0=C2=A0=C2=A0 (xe->info.graphics_verx100 >=3D 1270 &&
> > 	=C2=A0=C2=A0=C2=A0=C2=A0 bo->flags & XE_BO_FLAG_PAGETABLE))
> > 		caching =3D ttm_write_combined;
> >=20
> > so maybe as a short term solution we can keep this patch as it's
> > doing
> > similar last resort stuff and return to 'preferred way' later:
> >=20
> > 	if (!bo->cpu_caching && bo->flags & XE_BO_FLAG_NEEDS_UC)
> > 		caching =3D ttm_uncached;
>=20
> Yeah, cpu_caching is a "uapi only" thing at the moment (and even then
> is
> only set in some situations).=C2=A0 Given the current design and
> assumptions
> of the code, maybe it would be more clear to add an assertion like
> this
> to help document why this is special?
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (bo->flags & XE_BO_FLAG_NEE=
DS_UC) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 /*
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 * Valid only for internally-created buffers only,
> for
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 * which cpu_caching is never initialized.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 xe_assert(xe, bo->cpu_caching =3D=3D 0);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 caching =3D ttm_uncached;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> If we decide we want a more general redesign of cpu_caching behavior,
> that would probably be a separate change from the direct functional
> fix
> here.

I do think the change should have actually been done before the scanout
caching hack. We shouldn't be building special cases like this, but
rather fix what's missing.

Can't we make bo->cpu_caching valid also for kernel bos with a new enum
and do the translation in the ioctl?

/Thomas


>=20
>=20
> Matt
>=20
> >=20
> > Michal
>=20

