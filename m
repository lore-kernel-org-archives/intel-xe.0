Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8649BC636F0
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 19:15:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5056E10E5AD;
	Wed, 28 Aug 2024 19:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mYl+X1cc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C07210E5AD
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 19:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724872525; x=1756408525;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=hMk85nCZv9L6F1KAwA5HveA3e27JpFeCA0J3AJ73Ndc=;
 b=mYl+X1cc17XYlE9CUmxWhgMkWVAXRJGtHnj1GLfM+l5ulA5YhuYRqFh2
 JxrcsNHRiQaj7i7q4yTQLc7sTZi2idXDcZ3so0Wn06+z7TwrmUBRcXrV/
 y6hd0TduTSs5kUR0KNKQnyLnUydMlJWVI3s8ntrIrK/H5Wcj5bXPO8v8B
 TgCmTdhzszRVO5ChfNtVC1ciP+GffGrxHSYTeP6+Ta2HQDIURniszXZ2G
 zQrJMXs99oKgyveid8y+n4TicobiScQGSOop3bo87Z3xupbKLYIvPUIpN
 yZb3S7/kKyt6Dn/X8/QApQew3vvFdWik9wD7uiJ+Lw0e2MwL9y7mNaan8 w==;
X-CSE-ConnectionGUID: EobIXWRbSrmwVCVWF0m5pw==
X-CSE-MsgGUID: iNVJuTrQQOGKi3ZTBulNlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="27195130"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="27195130"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 12:15:25 -0700
X-CSE-ConnectionGUID: SpG1ayjdSjmXtchfwO3ryw==
X-CSE-MsgGUID: Lou4YmFZS2WVerhIaWkNbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="67468133"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.168])
 ([10.245.244.168])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 12:15:23 -0700
Message-ID: <bcb82824e592ca32e515e858f258651aad249c01.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/bmg: Drop force_probe requirement
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>, 
 intel-xe@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Date: Wed, 28 Aug 2024 21:15:21 +0200
In-Reply-To: <Zs9UWpFXsON6JAMk@intel.com>
References: <20240828082152.3194814-1-balasubramani.vivekanandan@intel.com>
 <kbmz3xqpsngb7yq6fhrtxvfxilh5wzpgbz5cgwujwrmv5s572k@vjedhdbwvukt>
 <Zs9UWpFXsON6JAMk@intel.com>
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

On Wed, 2024-08-28 at 12:46 -0400, Rodrigo Vivi wrote:
> On Wed, Aug 28, 2024 at 07:22:16AM -0500, Lucas De Marchi wrote:
> > On Wed, Aug 28, 2024 at 01:51:52PM GMT, Balasubramani Vivekanandan
> > wrote:
> > > Battlemage platform is sufficiently tested and found stable. CI
> > > is also
> > > pretty stable.
> > > Removing the force_probe requirement to enable the platform
> > > support by
> > > default.
> > >=20
> > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > Signed-off-by: Balasubramani Vivekanandan
> > > <balasubramani.vivekanandan@intel.com>
> >=20
> > main caveat is that there are things needed that's going through
> > the
> > drm-intel-next branch. That is known and we are testing with the
> > merged
> > result. We need to get this in and drm-intel-next needs to get a
> > pull
> > request done.
>=20
> No worries, the 64k-size-alignment for display is already in drm-
> intel-next
> and going in tomorrow's PR towards drm-next.
>=20
> So, let's just add this here in Xe and send in this week's PR as
> well.
>=20
> Next week we do backmerge no both sides to bring everything to a sync
> again in our -next branches.
>=20
> >=20
> >=20
> > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>=20
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


>=20
> >=20
> >=20
> > Lucas De Marchi
> >=20
> > > ---
> > > drivers/gpu/drm/xe/xe_pci.c | 1 -
> > > 1 file changed, 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c
> > > b/drivers/gpu/drm/xe/xe_pci.c
> > > index fa57996f9c37..330cd2d785bc 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -348,7 +348,6 @@ static const struct xe_device_desc bmg_desc =3D
> > > {
> > > 	DGFX_FEATURES,
> > > 	PLATFORM(BATTLEMAGE),
> > > 	.has_display =3D true,
> > > -	.require_force_probe =3D true,
> > > 	.has_heci_cscfi =3D 1,
> > > };
> > >=20
> > > --=20
> > > 2.34.1
> > >=20

