Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DEAD78336
	for <intel-xe@archiver.kernel.org>; Mon,  2 Dec 2024 16:33:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B18C210E7C3;
	Mon,  2 Dec 2024 16:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hapmUIhQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C9510E7BE
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Dec 2024 16:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733157206; x=1764693206;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=N8FT83nh+SBc4KPC/5o4BksMIBQjUtFxeYCLIoVH4EI=;
 b=hapmUIhQC2AdanINXjyI3u0ve16gYjr2d/cTxoTnygSsPatK+GyemxK7
 B2NEFwj3CdcgGK6++HDnvgHMgRX5wFhHkS1x1G44PG4PLRqS2bpffPqar
 6y23K/RHgQGXaqXbHy6syfafyhPzLCEFbLfbAYjK7jSHEfadEQWrRIZha
 bbyyXA8Vys0YCoNACl0Gukdo+FwvDEgvK2JPxkgGWPiY0dOPVWpZ/4/O8
 S0IlzjErUBNcWjty+j0IMLBbcxVuVLRaGoqr5d4OQxEpJLK/ElsUjcpkW
 gvYXuTQ/waEfakOdRWnn4+rVKKHQwboiwWpPEhKH4RkOfUOeTVXNmFpEP g==;
X-CSE-ConnectionGUID: ebNxl+OXT+qoo4lJQEHMTg==
X-CSE-MsgGUID: tOVJebHWTlqRRlk87mNcgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="32690878"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="32690878"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 08:33:26 -0800
X-CSE-ConnectionGUID: 3mnRMGaiQ2ivXLSaBNVYzw==
X-CSE-MsgGUID: JyWoATEoSKG28FEKLKUdRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="123995926"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.72])
 ([10.245.246.72])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 08:33:24 -0800
Message-ID: <e39201e8a53de69a6f4277e29105fddab82c0df8.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/display: fix ttm_bo_access() usage
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Jani Nikula
 <jani.nikula@intel.com>
Date: Mon, 02 Dec 2024 17:33:21 +0100
In-Reply-To: <602c7ab7-cab9-4790-a67c-306b23a75f23@intel.com>
References: <20241202154123.76887-2-matthew.auld@intel.com>
 <a758f27d283bc3aff6aeca05c6002d2d5233ec78.camel@linux.intel.com>
 <602c7ab7-cab9-4790-a67c-306b23a75f23@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
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

On Mon, 2024-12-02 at 16:28 +0000, Matthew Auld wrote:
> On 02/12/2024 15:56, Thomas Hellstr=C3=B6m wrote:
> > On Mon, 2024-12-02 at 15:41 +0000, Matthew Auld wrote:
> > > ttm_bo_access() returns the size on success. Account for that
> > > otherwise
> > > the caller incorrectly thinks this is an error in
> > > intel_atomic_prepare_plane_clear_colors().
> > >=20
> > > Fixes: b6308aaa24a7 ("drm/xe/display: Update
> > > intel_bo_read_from_page
> > > to use ttm_bo_access")
> > > Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3661
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/xe/display/intel_bo.c | 7 ++++++-
> > > =C2=A0=C2=A01 file changed, 6 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/display/intel_bo.c
> > > b/drivers/gpu/drm/xe/display/intel_bo.c
> > > index 43141964f6f2..b2a8d06cc78a 100644
> > > --- a/drivers/gpu/drm/xe/display/intel_bo.c
> > > +++ b/drivers/gpu/drm/xe/display/intel_bo.c
> > > @@ -40,8 +40,13 @@ int intel_bo_fb_mmap(struct drm_gem_object
> > > *obj,
> > > struct vm_area_struct *vma)
> > > =C2=A0=C2=A0int intel_bo_read_from_page(struct drm_gem_object *obj, u=
64
> > > offset,
> > > void *dst, int size)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0	struct xe_bo *bo =3D gem_to_xe_bo(obj);
> > > +	int ret;
> > > =C2=A0=20
> > > -	return ttm_bo_access(&bo->ttm, offset, dst, size, 0);
> > > +	ret =3D ttm_bo_access(&bo->ttm, offset, dst, size, 0);
> > > +	if (ret =3D=3D size)
> > > +		ret =3D 0;
> > > +
> > > +	return ret;
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> >=20
> > Looking at how callers are using struct
> > vm_operations_struct::access()
> > it looks possible that 0 <=3D ret < size, indicating the number of
> > bytes
> > actually processed.
> >=20
> > Now since ttm_bo_access() is actually a helper to implement the
> > above,
> > we strictly don't have to follow that for its interface, but I
> > think it
> > makes sense to assert that ret is either =3D=3D size or something
> > negative.
> > Ideas?
>=20
> hmm, what about if we add something like:
>=20
> +int xe_bo_read(struct xe_bo *bo, u64 offset, void *dst, int size)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D ttm_bo_access(&bo->ttm, off=
set, dst, size, 0);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!(ret < 0) && ret !=3D size)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ret =3D -EIO;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (!(ret < 0))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ret =3D 0;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> +}
>=20
> And then both callers use that?

Yes that should work, although perhaps use ret >=3D 0 instead of=C2=A0
!(ret < 0)

and ret =3D=3D size in the second test?

Thanks,
Thomas



>=20
> >=20
> > /Thomas
> >=20
> >=20
> >=20
> > > =C2=A0=C2=A0struct intel_frontbuffer *intel_bo_get_frontbuffer(struct
> > > drm_gem_object *obj)
> >=20
>=20

