Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6B8CF9C69
	for <intel-xe@archiver.kernel.org>; Tue, 24 Sep 2024 17:14:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D848810E8D5;
	Tue, 24 Sep 2024 17:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BPh/Ekqr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B890110E8D5
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Sep 2024 17:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727198091; x=1758734091;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=mBXhu9sRoaUc/9E1PpWp8B4tids0vLiXoZN0ehASRl4=;
 b=BPh/Ekqr0DDT0SaOCm+hrOnZrb+vWbos7YoJjf4dQ5ZlSjcEvtJEJAfh
 XglTonNTOwsvgJsGsIViirBZ5v/+vSVl4lydsc1cGqVELuZ6R5Zhd8YM+
 qcEbCo9dGXP1tFAELWt+t3RB0nqFihzRPSUjUJYHs1s9tzBD3XK5qS5Lx
 g1iw5nbSy7LLmqAtsewu5nllXoOIhACZcgPby94zXCRgxxk50lfIsu1+2
 7uVqkkTk0R5fskjyKwjiEr/d3+wnirTNC6jZ4Jgw0Um18qJ8FMraX8A3L
 O0YFXY6YYR7u7QI5nGYXbH2svwOg7omxhJTHCrc8WxSL6GoQ5biykLHpS A==;
X-CSE-ConnectionGUID: vu//c4VwTDKb6J4DvugY7Q==
X-CSE-MsgGUID: ZAcglpsyT5y5Tmw9odwl4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26329278"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="26329278"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 10:14:50 -0700
X-CSE-ConnectionGUID: XnhBzVl3RVqIZRqKblYS3A==
X-CSE-MsgGUID: BMvSUyEUQ1q6dAaoOrYsrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="72330770"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.100])
 ([10.245.244.100])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 10:14:49 -0700
Message-ID: <ab2a5f1f90b52f315bc071275d6f5a1ae2737b40.camel@linux.intel.com>
Subject: Re: [PATCH v2 1/1] drm/xe: Prevent null pointer access in
 xe_migrate_copy
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
Cc: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, Zhanjun Dong
 <zhanjun.dong@intel.com>, intel-xe@lists.freedesktop.org
Date: Tue, 24 Sep 2024 19:14:46 +0200
In-Reply-To: <Zu4SJzsF5Tg6zLyo@DUT025-TGLU.fm.intel.com>
References: <20240919224220.1325739-1-zhanjun.dong@intel.com>
 <20240919224220.1325739-2-zhanjun.dong@intel.com>
 <f9269ec3-dc9b-4863-9e41-e7a9946d9e1c@intel.com>
 <20240920214456.GW5774@mdroper-desk1.amr.corp.intel.com>
 <Zu4SJzsF5Tg6zLyo@DUT025-TGLU.fm.intel.com>
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

On Sat, 2024-09-21 at 00:24 +0000, Matthew Brost wrote:
> On Fri, Sep 20, 2024 at 02:44:56PM -0700, Matt Roper wrote:
> > On Fri, Sep 20, 2024 at 09:58:14AM +0530, Ghimiray, Himal Prasad
> > wrote:
> > >=20
> > >=20
> > > On 20-09-2024 04:12, Zhanjun Dong wrote:
> > > > Update lacks source flag to include resource is null case. This
> > > > will
> > > > prevent null pointer derefrence in xe_migrate_copy.

Please add relevant parts of the NULL pointer trace to the commit
message and add a Fixes: tag for the commit that caused the bug. Also
please describe how this patch fixes the bug.

> > > >=20
> > > > Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> > > > ---
> > > > =C2=A0 drivers/gpu/drm/xe/xe_bo.c | 4 ++--
> > > > =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > b/drivers/gpu/drm/xe/xe_bo.c
> > > > index 5f2f1ec46b57..5e8f60a8d431 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > @@ -682,8 +682,8 @@ static int xe_bo_move(struct
> > > > ttm_buffer_object *ttm_bo, bool evict,
> > > > =C2=A0=C2=A0	tt_has_data =3D ttm && (ttm_tt_is_populated(ttm) ||
> > > > =C2=A0=C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (ttm->page_flags &
> > > > TTM_TT_FLAG_SWAPPED));
> > > > -	move_lacks_source =3D handle_system_ccs ? (!bo-
> > > > >ccs_cleared)=C2=A0 :
> > > > -
> > > > 						(!mem_type_is_vram(old_mem_type) && !tt_has_data);
> > > > +	move_lacks_source =3D !old_mem || (handle_system_ccs ?
> > > > (!bo->ccs_cleared) :
> > > > +				=09
> > > > (!mem_type_is_vram(old_mem_type) && !tt_has_data));
> > >=20
> > >=20
> > > Just for curiosity, isn't !old_mem implicitly taken care here ?
> > > shouldn't ttm be NULL, if resource is NULL ? IIRC, this was what
> > > Thomas had
> > > confirmed during handle_system_ccs implementation.

I think in that case I might have been wrong.
If we're creating a PL_TT bo then IIRC bo->ttm is non-NULL and old_mem
=3D=3D NULL.

Thanks,
Thomas



>=20
> This was my original comment too.=20
>=20
> But I guess we do have a this:
>=20
> =C2=A0673=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Bo creation =
path, moving to system or TT. */
> =C2=A0674=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((!old_mem &=
& ttm) && !handle_system_ccs) {
>=20
> Which seems to indicates !old_mem && ttm can be possible. So I think
> the
> patch is actually correct?=20
>=20
> >=20
> > Drive-by comment:=C2=A0 If this is an invariant, it might still be wort=
h
> > adding an xe_assert() so that CI can ensure the condition never
> > gets
> > violated by future code refactors and design changes.
> >=20
> >=20
> > Matt
> >=20
> > >=20
> > > Thomas/Matt,
> > > Can you confirm here ?
> > >=20
>=20
> I'd have to dig into TTM a bit more to really understand what is
> going
> on here. Thomas might just know how !old_mem && ttm can evalulate to
> true.
>=20
> Matt
>=20
> > > BR
> > > Himal
> > >=20
> > >=20
> > > > =C2=A0=C2=A0	needs_clear =3D (ttm && ttm->page_flags &
> > > > TTM_TT_FLAG_ZERO_ALLOC) ||
> > > > =C2=A0=C2=A0		(!ttm && ttm_bo->type =3D=3D ttm_bo_type_device);
> >=20
> > --=20
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

