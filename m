Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61ACC47DAF
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 15:59:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D3010E83C;
	Thu, 18 Jan 2024 15:59:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BFD410E83C
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jan 2024 15:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705593544; x=1737129544;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=9jfca3Yg2Hu/1flwvGlg3xwiklq/EcVmw0V2xWRgFaA=;
 b=Clo4O71B1vT2SsgTGcsENBVg3ijF4uENbtZPceCu/wWku8k+ihDvQGcv
 1plYplr8LpEDe4vLsZ6dE3RPk/IYZGzCvoLqQGeyxCsV3zBqbwBrcx9mO
 Uosy0bvogw/raEzD2eiouAIIZtYdipkQhgU5+F8ZQzi/GfAMBWbOmnlrY
 Eu3K6KFDGQzxs9XiUFh3St0VvJhWWiJp+lJyAqw2ltqnV4+ggiMnpTb54
 F8+l0hyn0llhmtvoo+rTlRGUEuXvEMSQLIvaXEnVeLoZn2viNWvss2fNo
 YMh9a3wjV6YCDvhqtRWgQkEmqJzIc2w6zmrcGgHrCquNIp4Y0WX1TuGvw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="13835945"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="13835945"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 07:59:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="855028029"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="855028029"
Received: from clanggaa-mobl.ger.corp.intel.com (HELO [10.249.254.203])
 ([10.249.254.203])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 07:58:59 -0800
Message-ID: <3618a9939758a4fe2e387d36c8ae3d18b27f9c3a.camel@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe/xe2: Use XE_CACHE_WB pat index
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Date: Thu, 18 Jan 2024 16:58:56 +0100
In-Reply-To: <20240103184531.GD3529480@mdroper-desk1.amr.corp.intel.com>
References: <20240102165142.853141-1-himal.prasad.ghimiray@intel.com>
 <20240103011618.GT1327160@mdroper-desk1.amr.corp.intel.com>
 <MW4PR11MB70565545C05F1C9238438949B360A@MW4PR11MB7056.namprd11.prod.outlook.com>
 <20240103184531.GD3529480@mdroper-desk1.amr.corp.intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 2024-01-03 at 10:45 -0800, Matt Roper wrote:
> On Tue, Jan 02, 2024 at 07:17:22PM -0800, Ghimiray, Himal Prasad
> wrote:
> >=20
> >=20
> > > -----Original Message-----
> > > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > > Sent: 03 January 2024 06:46
> > > To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org
> > > Subject: Re: [PATCH v2] drm/xe/xe2: Use XE_CACHE_WB pat index
> > >=20
> > > On Tue, Jan 02, 2024 at 10:21:42PM +0530, Himal Prasad Ghimiray
> > > wrote:
> > > > Use XE_CACHE_WB pat index by default on xe2 platforms and use
> > > > XE_CACHE_NONE_COMPRESSION pat index only if buffer supports
> > > > compression and indirect access of flat ccs.
> > > >=20
> > > > Fixes the broken "xe_migrate_test kunit test" on LNL.
> > >=20
> > > How/why does it fix it?=C2=A0 Explaining why this is the right thing
> > > to do is more
> > > important than just stating that a test changes from red to
> > > green.
> > > Does the WB vs UC even matter here or is it actually the
> > > coherency with the
> > > CPU cache that matters (meaning UC+1way would also work, but
> > > WB+NonCoh would fail)?
> >=20
> > AFAIU the coherency with CPU cache is main thing that matters here.
> > It shouldn't be really related to=20
> > WB vs UC.=C2=A0 The pat table entry associated with XE_CACHE_WB is
> > coherent whereas XE_CACHE_NONE is=20
> > NonCoherent.=C2=A0 UC+1way would also work, but WB+NonCoh would fail , =
I
> > had tested using pat index as 0 and 5 respectively.
>=20
> If non-coherent is the problem, then how does the compressed case
> work,
> where we always get a non-coherent PAT?=C2=A0 Is the actual problem just
> that
> we're hardcoding a setting in general?=C2=A0 Don't we already have a PAT
> index (selected by userspace at bind time) that we should be using?=C2=A0
> Or
> am I misunderstanding what the PTE's we're emitting here are intended
> for?

For this particular code, my understanding is that the flat CCS
metadata that is accessed is never accessed by nor mappable by the CPU,
so the coherency issue doesn't really apply.

For non-compressed buffer objects, where the selftest breaks, the kunit
assumes coherency. But the migrate code would typically not access the
buffer content itself on igfx, except for page-tables which are assumed
to be coherent, (at least for now).

/Thomas


>=20
>=20
> Matt
>=20
> >=20
> > BR
> > Himal
> >=20
> > >=20
> > >=20
> > > Matt
> > >=20
> > > >=20
> > > > v2
> > > > - Fix the argument to emit_pte, pass the bool directly.
> > > > (Thomas)
> > > >=20
> > > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > > Signed-off-by: Himal Prasad Ghimiray
> > > > <himal.prasad.ghimiray@intel.com>
> > > > ---
> > > > =C2=A0drivers/gpu/drm/xe/xe_migrate.c | 14 +++++++-------
> > > > =C2=A01 file changed, 7 insertions(+), 7 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > > > b/drivers/gpu/drm/xe/xe_migrate.c index
> > > > adf1dab5eba2..e1a849d74826
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > @@ -439,7 +439,7 @@ static void emit_pte(struct xe_migrate *m,
> > > > =C2=A0	/* Indirect access needs compression enabled uncached
> > > > PAT index */
> > > > =C2=A0	if (GRAPHICS_VERx100(xe) >=3D 2000)
> > > > =C2=A0		pat_index =3D is_comp_pte ? xe-
> > > > pat.idx[XE_CACHE_NONE_COMPRESSION] :
> > > > -					=C2=A0 xe-
> > > > >pat.idx[XE_CACHE_NONE];
> > > > +					=C2=A0 xe-
> > > > >pat.idx[XE_CACHE_WB];
> > > > =C2=A0	else
> > > > =C2=A0		pat_index =3D xe->pat.idx[XE_CACHE_WB];
> > > >=20
> > > > @@ -729,14 +729,14 @@ struct dma_fence *xe_migrate_copy(struct
> > > xe_migrate *m,
> > > > =C2=A0		}
> > > >=20
> > > > =C2=A0		if (!src_is_vram)
> > > > -			emit_pte(m, bb, src_L0_pt,
> > > > src_is_vram, true,
> > > &src_it, src_L0,
> > > > -				 src_bo);
> > > > +			emit_pte(m, bb, src_L0_pt,
> > > > src_is_vram,
> > > copy_system_ccs,
> > > > +				 &src_it, src_L0, src_bo);
> > > > =C2=A0		else
> > > > =C2=A0			xe_res_next(&src_it, src_L0);
> > > >=20
> > > > =C2=A0		if (!dst_is_vram)
> > > > -			emit_pte(m, bb, dst_L0_pt,
> > > > dst_is_vram, true,
> > > &dst_it, src_L0,
> > > > -				 dst_bo);
> > > > +			emit_pte(m, bb, dst_L0_pt,
> > > > dst_is_vram,
> > > copy_system_ccs,
> > > > +				 &dst_it, src_L0, dst_bo);
> > > > =C2=A0		else
> > > > =C2=A0			xe_res_next(&dst_it, src_L0);
> > > >=20
> > > > @@ -978,8 +978,8 @@ struct dma_fence *xe_migrate_clear(struct
> > > xe_migrate *m,
> > > > =C2=A0		size -=3D clear_L0;
> > > > =C2=A0		/* Preemption is enabled again by the ring
> > > > ops. */
> > > > =C2=A0		if (!clear_vram) {
> > > > -			emit_pte(m, bb, clear_L0_pt,
> > > > clear_vram, true,
> > > &src_it, clear_L0,
> > > > -				 bo);
> > > > +			emit_pte(m, bb, clear_L0_pt,
> > > > clear_vram,
> > > clear_system_ccs,
> > > > +				 &src_it, clear_L0, bo);
> > > > =C2=A0		} else {
> > > > =C2=A0			xe_res_next(&src_it, clear_L0);
> > > > =C2=A0		}
> > > > --
> > > > 2.25.1
> > > >=20
> > >=20
> > > --
> > > Matt Roper
> > > Graphics Software Engineer
> > > Linux GPU Platform Enablement
> > > Intel Corporation
>=20

