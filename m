Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37A6C25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 14:46:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 952EC10E252;
	Fri, 24 May 2024 14:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DRHacN+C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC7F10EA8A
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 14:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716561978; x=1748097978;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=76DB7mqcn3RXiqy3mjVPSvQ0hHmog9U8C+4jVupjnu8=;
 b=DRHacN+CjK/1/tu37HFtLwD0rUX+gYhUpoPPttI3o7L6MLUL5r5M1zDq
 1y9HCRoz1Mt1Kk0Xcln33o2DGJ2IsITwQJUpNy+5zj2s8j5CB/mKftt4y
 jGgxZzxbyj9LRY1gTvCyfR2ks6kNmAKciPUKiQ8UddPiB/SBSUJlVwheB
 AubomltZnE79szCX/DqrDpmNO5HG/vWpitALqvUo3ErKRg9CAljmXu0nk
 5UGN5lEd15T692PDaHDLdxmeB6AZsAlKdi4u668TN/nA/K7aEPnzRVH11
 ODQeZifrA6p2oWKlYQHK5hBi7Wz4Jsmh3b143zjkH5aGLeK8F8gDURLlm w==;
X-CSE-ConnectionGUID: cJq0/WEyROeNKTjm0DND3w==
X-CSE-MsgGUID: WREllloxRQ258IrHhlQNNg==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="23547802"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="23547802"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 07:46:17 -0700
X-CSE-ConnectionGUID: C/R79eaBQMmkasHLsIOugg==
X-CSE-MsgGUID: m7C5Y84lTt6DjnKq+xPgCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="57284986"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO [10.245.246.112])
 ([10.245.246.112])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 07:46:15 -0700
Message-ID: <d871256ab4f0fcb955ff50c672b4d842f58bd167.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: allow unaligned start and size xe_res_cursor
 parameters
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, "Kuoppala, Mika"
 <mika.kuoppala@intel.com>
Date: Fri, 24 May 2024 16:46:12 +0200
In-Reply-To: <fa111202-bd70-4ec2-bdb5-ac11786693f6@intel.com>
References: <20240418-xe_res_cursor-no-align-v1-1-8df7834266c9@intel.com>
 <fa111202-bd70-4ec2-bdb5-ac11786693f6@intel.com>
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

On Fri, 2024-05-24 at 16:26 +0200, Andrzej Hajda wrote:
> On 18.04.2024 16:03, Andrzej Hajda wrote:
> > xe_res_cursor code does not depend on the alignment. On the other
> > side
> > unaligned accesses are useful from pread/pwrite point of view.
> >=20
> > Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>=20
> Gently ping.

I think these asserts are aimed at catching weird
values from the page-table code.

But agree that the res_cursor code works without them AFAICT.
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

>=20
> Regards
> Andrzej
>=20
> > ---
> > =C2=A0 drivers/gpu/drm/xe/xe_res_cursor.h | 2 --
> > =C2=A0 1 file changed, 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h
> > b/drivers/gpu/drm/xe/xe_res_cursor.h
> > index 0a306963aa8e..655af89b31a9 100644
> > --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> > +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> > @@ -157,8 +157,6 @@ static inline void xe_res_first_sg(const struct
> > sg_table *sg,
> > =C2=A0=C2=A0				=C2=A0=C2=A0 struct xe_res_cursor *cur)
> > =C2=A0 {
> > =C2=A0=C2=A0	XE_WARN_ON(!sg);
> > -	XE_WARN_ON(!IS_ALIGNED(start, PAGE_SIZE) ||
> > -		=C2=A0=C2=A0 !IS_ALIGNED(size, PAGE_SIZE));
> > =C2=A0=C2=A0	cur->node =3D NULL;
> > =C2=A0=C2=A0	cur->start =3D start;
> > =C2=A0=C2=A0	cur->remaining =3D size;
> >=20
> > ---
> > base-commit: f9116f658a6217b101e3b4e89f845775b6fb05d9
> > change-id: 20240418-xe_res_cursor-no-align-a3bd26482244
> >=20
> > Best regards,
>=20

