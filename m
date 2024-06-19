Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8E3C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 11:40:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66EEA10EC5A;
	Wed, 19 Jun 2024 11:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OPgaoS9r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB0910EC5A
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 11:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718797250; x=1750333250;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5aVZatNn80qhGHti4K/xX2U7nFmlHyliAXd/zMt1pig=;
 b=OPgaoS9reD7yIS+uNrvepODTIr7KphiLrdfbno1LtE/yIle74Jjd1Bst
 eouX5hcLn3w41vndHPjUs5HfXwGXY4V4ZfI436hn7G+bETf3HR2E3a5uY
 kK7K+WSwCsKko0eExhzS0ytMINm3zqFIvymPnvF6VNoB97j+pyaTjRxo9
 xZQWql0DgFaCtKh5mxNELYjMW88mKu90eRsaAiPAkbFDQ3PqDL6RpQ3+T
 A8P/ehKy9CuiwrnemP9Ga70g3EthaE7O2YJi8nWSa4KiOyXfzIsfCpZar
 vc3pULrw0+YnlmqDil+ZeP7lxYUGHn5/zJG3CxUcOXhv1LSL0cjTm4Avv g==;
X-CSE-ConnectionGUID: DwmvfsEGSUiHOg8VU7PqVg==
X-CSE-MsgGUID: TYiSdYSZSUuYFBI/C0TfKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="27148082"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="27148082"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 04:40:50 -0700
X-CSE-ConnectionGUID: UDnDFiUySaS3+7fUx6d93w==
X-CSE-MsgGUID: NGY+V5tTSUiWNjtPm/oBfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="41986955"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.122])
 ([10.245.245.122])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 04:40:48 -0700
Message-ID: <e5e36ef1b2003967bd714f699160f8ebad5fe8e7.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Use ttm_uncached for BO with NEEDS_UC flag
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>, 
 intel-xe@lists.freedesktop.org, Pallavi Mishra <pallavi.mishra@intel.com>, 
 =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza
 <jose.souza@intel.com>, Oak Zeng <oak.zeng@intel.com>
Date: Wed, 19 Jun 2024 13:40:45 +0200
In-Reply-To: <70cbe0f4-5275-4716-b78b-c48fd86e281e@intel.com>
References: <20240606195630.1548-1-michal.wajdeczko@intel.com>
 <3dd4733f3cc7f322f25354c3e9d4a2dd363d2331.camel@linux.intel.com>
 <1b002473-552a-4392-b2b4-b0bdff61c59c@intel.com>
 <20240617202838.GL2905419@mdroper-desk1.amr.corp.intel.com>
 <9c3ee93c4f5fffa5d5dd61ea71066fa231ab3ec5.camel@linux.intel.com>
 <20240618164323.GN2905419@mdroper-desk1.amr.corp.intel.com>
 <8bc380197b6129a458fb177d263ddf4fc7e2dda9.camel@linux.intel.com>
 <20240618185458.GK2906448@mdroper-desk1.amr.corp.intel.com>
 <70cbe0f4-5275-4716-b78b-c48fd86e281e@intel.com>
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

On Wed, 2024-06-19 at 10:44 +0100, Matthew Auld wrote:
> On 18/06/2024 19:54, Matt Roper wrote:
> > On Tue, Jun 18, 2024 at 08:29:24PM +0200, Thomas Hellstr=C3=B6m wrote:
> > > Hi, Matt
> > >=20
> > > On Tue, 2024-06-18 at 09:43 -0700, Matt Roper wrote:
> > > > On Tue, Jun 18, 2024 at 02:38:01PM +0200, Thomas Hellstr=C3=B6m
> > > > wrote:
> > > > > Hi,
> > > > >=20
> > > > > On Mon, 2024-06-17 at 13:28 -0700, Matt Roper wrote:
> > > > > > On Wed, Jun 12, 2024 at 08:03:24PM +0200, Michal Wajdeczko
> > > > > > wrote:
> > > > > > > Hi Thomas,
> > > > > > >=20
> > > > > > > On 11.06.2024 14:47, Thomas Hellstr=C3=B6m wrote:
> > > > > > > > Hi, Michal,
> > > > > > > >=20
> > > > > > > > On Thu, 2024-06-06 at 21:56 +0200, Michal Wajdeczko
> > > > > > > > wrote:
> > > > > > > > > We should honor requested uncached mode also at the
> > > > > > > > > TTM
> > > > > > > > > layer.
> > > > > > > > > Otherwise, we risk losing updates to the memory based
> > > > > > > > > interrupts
> > > > > > > > > source or status vectors, as those require uncached
> > > > > > > > > memory.
> > > > > > > > >=20
> > > > > > > > > Signed-off-by: Michal Wajdeczko
> > > > > > > > > <michal.wajdeczko@intel.com>
> > > > > > > > > Cc: Thomas Hellstr=C3=B6m
> > > > > > > > > <thomas.hellstrom@linux.intel.com>
> > > > > > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > > > > > ---
> > > > > > > > > =C2=A0=C2=A0drivers/gpu/drm/xe/xe_bo.c | 3 +++
> > > > > > > > > =C2=A0=C2=A01 file changed, 3 insertions(+)
> > > > > > > > >=20
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > > > b/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > > > index 2bae01ce4e5b..2573cc118f29 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > > > > > > @@ -378,6 +378,9 @@ static struct ttm_tt
> > > > > > > > > *xe_ttm_tt_create(struct
> > > > > > > > > ttm_buffer_object *ttm_bo,
> > > > > > > > > =C2=A0=C2=A0	=C2=A0=C2=A0=C2=A0 (xe->info.graphics_verx10=
0 >=3D 1270 &&
> > > > > > > > > bo-
> > > > > > > > > > flags &
> > > > > > > > > XE_BO_FLAG_PAGETABLE))
> > > > > > > > > =C2=A0=C2=A0		caching =3D ttm_write_combined;
> > > > > > > > > =C2=A0=20
> > > > > > > > > +	if (bo->flags & XE_BO_FLAG_NEEDS_UC)
> > > > > > > > > +		caching =3D ttm_uncached;
> > > > > > > > > +
> > > > > > > > > =C2=A0=C2=A0	err =3D ttm_tt_init(&tt->ttm, &bo->ttm,
> > > > > > > > > page_flags,
> > > > > > > > > caching,
> > > > > > > > > extra_pages);
> > > > > > > > > =C2=A0=C2=A0	if (err) {
> > > > > > > > > =C2=A0=C2=A0		kfree(tt);
> > > > > > > >=20
> > > > > > > > To me the preferred method is to teach bo->cpu_caching
> > > > > > > > about
> > > > > > > > the
> > > > > > > > uncached mode and then include it in the switch
> > > > > > > > statement
> > > > > > > > above.
> > > > > > > >=20
> > > > > > >=20
> > > > > > > but bo->cpu_caching is currently documented as:
> > > > > > >=20
> > > > > > > /**
> > > > > > > =C2=A0=C2=A0* @cpu_caching: CPU caching mode. Currently only =
used
> > > > > > > for
> > > > > > > userspace
> > > > > > > =C2=A0=C2=A0* objects.
> > > > > > > =C2=A0=C2=A0*/
> > > > > > >=20
> > > > > > > and value 0 is implicitly reserved as kind of default, so
> > > > > > > 'teaching'
> > > > > > > would likely mean either extending uapi with something
> > > > > > > like:
> > > > > > >=20
> > > > > > > =C2=A0=C2=A0 #define DRM_XE_GEM_CPU_CACHING_WB=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > > > > 1
> > > > > > > =C2=A0=C2=A0 #define DRM_XE_GEM_CPU_CACHING_WC=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > > > > 2
> > > > > > > + #define DRM_XE_GEM_CPU_CACHING_UC=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > > > > 3
> > > > > > >=20
> > > > > > > which will introduce lot of undesired right now code
> > > > > > > changes,
> > > > > > > or we
> > > > > > > will
> > > > > > > introduce internal only flag:
> > > > > > >=20
> > > > > > > + #define XE_CPU_CACHING_UC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0
> > > > > > > ((u16)~0)
> > > > > > >=20
> > > > > > > but that doesn't look like a clean solution.
> > > > > > >=20
> > > > > > >=20
> > > > > > > OTOH, just above this new diff chunk, there is already a
> > > > > > > code
> > > > > > > that
> > > > > > > updates caching mode outside the "switch statement
> > > > > > > above":
> > > > > > >=20
> > > > > > > 	if ((!bo->cpu_caching && bo->flags &
> > > > > > > XE_BO_FLAG_SCANOUT)
> > > > > > > > >=20
> > > > > > > 	=C2=A0=C2=A0=C2=A0 (xe->info.graphics_verx100 >=3D 1270 &&
> > > > > > > 	=C2=A0=C2=A0=C2=A0=C2=A0 bo->flags & XE_BO_FLAG_PAGETABLE))
> > > > > > > 		caching =3D ttm_write_combined;
> > > > > > >=20
> > > > > > > so maybe as a short term solution we can keep this patch
> > > > > > > as
> > > > > > > it's
> > > > > > > doing
> > > > > > > similar last resort stuff and return to 'preferred way'
> > > > > > > later:
> > > > > > >=20
> > > > > > > 	if (!bo->cpu_caching && bo->flags &
> > > > > > > XE_BO_FLAG_NEEDS_UC)
> > > > > > > 		caching =3D ttm_uncached;
> > > > > >=20
> > > > > > Yeah, cpu_caching is a "uapi only" thing at the moment (and
> > > > > > even
> > > > > > then
> > > > > > is
> > > > > > only set in some situations).=C2=A0 Given the current design an=
d
> > > > > > assumptions
> > > > > > of the code, maybe it would be more clear to add an
> > > > > > assertion
> > > > > > like
> > > > > > this
> > > > > > to help document why this is special?
> > > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (bo->flags =
& XE_BO_FLAG_NEEDS_UC) {
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Valid only for internally-created
> > > > > > buffers
> > > > > > only,
> > > > > > for
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * which cpu_caching is never initia=
lized.
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_assert(xe, bo->cpu_caching =3D=3D 0);
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 caching =3D ttm_uncached;
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > >=20
> > > > > > If we decide we want a more general redesign of cpu_caching
> > > > > > behavior,
> > > > > > that would probably be a separate change from the direct
> > > > > > functional
> > > > > > fix
> > > > > > here.
> > > > >=20
> > > > > I do think the change should have actually been done before
> > > > > the
> > > > > scanout
> > > > > caching hack. We shouldn't be building special cases like
> > > > > this, but
> > > > > rather fix what's missing.
> > > >=20
> > > > I think things happened the other way around.=C2=A0 The scanout
> > > > caching
> > > > adjustment pre-dates the existence of bo->cpu_caching in the
> > > > driver.
> > > > When bo->cpu_caching got added in commit 622f709ca629
> > > > ("drm/xe/uapi:
> > > > Add
> > > > support for CPU caching mode"), it intentionally left kernel
> > > > objects
> > > > set
> > > > to 0 by design.
> > >=20
> > > I don't really see a discussion around the kernel objects in the
> > > commit
> > > message, it mentions "currently" in the caching mode doc, but
> > > that
> > > sounds more like a documentation of current status than a
> > > guideline.
> > > Ofc, it might be in the review discussion but I haven't looked
> > > too
> > > closely TBH.
> > >=20
> > > Hmm. This commit raises some questions. Do you remember the
> > > reason for
> > > leaving out the kernel bos? Was it because kernel bos relies on
> > > implicit caching mode selection whereas the user-space bo caching
> > > mode
> > > selection is now explicit? Otherwise it's pretty standard in the
> > > driver
> > > to map the DRM_XE user-space flags / enums to XE_ internal ones.
>=20
> Yeah, no real reason IIRC. I don't remember exactly, but I don't
> think=20
> there was a huge need for kmd internal objects needing explicit
> caching=20
> at the time, and didn't seem worth adding just for that scanout case.
>=20
> >=20
> > Unfortunately I don't remember the details here very well myself; I
> > know
> > this patch went through a lot of revisions and morphed a fair bit
> > during
> > the review cycles.=C2=A0 Adding a couple extra Cc's of people who were
> > more
> > actively involved in the review and may have a clearer memory of
> > how we
> > initially settled on the userspace-only design.
> >=20
> > +cc Jose, Oak
> >=20
> >=20
> > Matt
> >=20
> > >=20
> > > (As a complete side note it looks like the system pages for VRAM-
> > > only
> > > user-bo eviction are now forced to be write-combined by the
> > > uAPI?)
>=20
> Yeah, originally we had smem_cpu_caching, where it had to be left as=20
> zero for vram objects. vram caching was then implicit and always wc.
> I=20
> think internally kmd would use wb if it was evicted and vram-only,
> idea=20
> was also to potentially allow umd to also control this with=20
> smem_cpu_caching.
>=20
> There was some discussion here:=20
> https://lore.kernel.org/intel-xe/30454ab26b8df746cfcdc4c1a0548e7c1e676ac0=
.camel@intel.com/
>=20
> Feedback was rather to have single cpu_caching value which would
> always=20
> be respected when mmapping the object. If the cpu_caching is wc then
> the=20
> mmap is always wc, and not sometimes wc and sometimes wb, depending
> on=20
> if it's evicted or not which userspace is unaware of. The downside is
> that wc for evicted vram is going to be common and maybe not ideal.=20
> Maybe this can be revisited?

Yes we will need to do that. System WC is really for integrated only as
not all architectures (any beyond x86?) supports it.

And in addition it comes with performance implications.

We've tried to ensure that discrete never binds system incoherent (even
with incoherent PAT settings), so WB is safe from that POW.

Also when we considered this on i915 we verified with UMD that the
change-of-caching mode under the hood was safe from WC promoted to WB
and back. If that has changed so we *must* have the same caching mode,
then we need to consider to read back stuff from the fault handler...

/Thomas


>=20
> > >=20
> > > >=20
> > > > We can certainly change the design now if everyone agrees that
> > > > it
> > > > makes
> > > > the code cleaner,
> > >=20
> > > This is probably a bigger change than I originally though and
> > > requires
> > > some additional consideration of the above.
> > >=20
> > > > =C2=A0 but I think that the general refactoring and
> > > > repurposing of bo->cpu_caching is orthogonal to the functional
> > > > fix
> > > > that
> > > > Michal is providing here.
> > >=20
> > > Generally I think that if something is missing to be able to
> > > cleanly
> > > add a fix, then we should definitely try our best to add that
> > > something
> > > _first_. In this case it turns out, though, that it requires some
> > > additional afterthought.
> > >=20
> > > So for the patch
> > >=20
> > > Acked-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > >=20
> > >=20
> > >=20
> > > >=20
> > > > +Cc Pallavi, Matt Auld as the authors of the original design in
> > > > case
> > > > they have any thoughts on extending the usage of bo-
> > > > >cpu_caching.
> > > >=20
> > > >=20
> > > > Matt
> > > >=20
> > > > >=20
> > > > > Can't we make bo->cpu_caching valid also for kernel bos with
> > > > > a new
> > > > > enum
> > > > > and do the translation in the ioctl?
> > > > >=20
> > > > > /Thomas
> > > > >=20
> > > > >=20
> > > > > >=20
> > > > > >=20
> > > > > > Matt
> > > > > >=20
> > > > > > >=20
> > > > > > > Michal
> > > > > >=20
> > > > >=20
> > > >=20
> > >=20
> >=20

