Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A001C531DC
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 15:21:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B0910EBE7;
	Fri, 23 Aug 2024 15:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k0zklMA9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A9B10EBE7
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Aug 2024 15:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724426511; x=1755962511;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+ykbfz68p69l28Nf9zOeOltWvk6BJ2bI332tWFuz4NA=;
 b=k0zklMA9GnJF1qpAAwKXl6J6eGGet8zgkoFAFWmBngxT7RRND6bAQ1dR
 xsHzzZUegh6O5yViw5uxi/Owko9GYJJQoecQaN1iGmVZ/jP3IoMkKV2Qu
 zlwxTWSOKR0quQHXry4A9Y1kOT1KlFj7iH8h/wSZbXcP3LOuhCXYnNZjR
 lqixikdBIjCNh+MrFz6zIRiKiQV8NI2C98KUF2/GElbux+GzUDWRplt88
 Bi/N2v68JFVkhNVK1kIVYwYlRS95SZdkITd1Rga8mYb7KjKehGbeUtvTw
 EAwFdYe8Wk9AVjvky44w+THxPA6Y9yW13SxWCk6fTvAGK+hJczGsMhlqb g==;
X-CSE-ConnectionGUID: f9Xhj2AqQEujI6oCLvEl3A==
X-CSE-MsgGUID: TvjaPHKXSFiRjLDhsN0k/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26658563"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="26658563"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 08:21:51 -0700
X-CSE-ConnectionGUID: KmW5/Gs0SqK6YPkYNBJYTQ==
X-CSE-MsgGUID: l5SmMevdTUC4czOwqqk+PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; d="scan'208";a="61527893"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.245.39])
 ([10.245.245.39])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 08:21:50 -0700
Message-ID: <e66c7b2479b56b83aa1bba7c9e1f18dfc36cbd68.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe/lnl: Drop force_probe requirement
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
Date: Fri, 23 Aug 2024 17:21:47 +0200
In-Reply-To: <Zsic6M0jOt_nzzXi@intel.com>
References: <20240822224615.793540-1-lucas.demarchi@intel.com>
 <Zsic6M0jOt_nzzXi@intel.com>
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

On Fri, 2024-08-23 at 10:30 -0400, Rodrigo Vivi wrote:
> On Thu, Aug 22, 2024 at 03:46:15PM -0700, Lucas De Marchi wrote:
> > Lunar Lake has been usable for a while in a desktop setup. Bugs are
> > sporadically showing up in CI, but being promptly fixed. Nothing
> > very
> > concerning.
> >=20
> > All the uapi changes related to fundamental platform usage have
> > been
> > finalized.
> >=20
> > Remove the force_probe requirement and enable the platform by
> > default.
> >=20
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>=20
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

>=20
> > ---
> >=20
> > Last concerning bug[1] should now be fixed since [2] is merged.
> > Mesa CI
> > was hitting it frequently, which was badly impacting their
> > execution.
> >=20
> > [1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1705
> > [2]
> > https://lore.kernel.org/intel-xe/20240821193842.352557-1-rodrigo.vivi@i=
ntel.com/T/#t
> >=20
> > We should probably wait a few more days for this forward-looking
> > patch
> > before merging it though.
> >=20
> > =C2=A0drivers/gpu/drm/xe/xe_pci.c | 1 -
> > =C2=A01 file changed, 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c
> > b/drivers/gpu/drm/xe/xe_pci.c
> > index 0c2342988650..fa57996f9c37 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -342,7 +342,6 @@ static const struct xe_device_desc mtl_desc =3D {
> > =C2=A0static const struct xe_device_desc lnl_desc =3D {
> > =C2=A0	PLATFORM(LUNARLAKE),
> > =C2=A0	.has_display =3D true,
> > -	.require_force_probe =3D true,
> > =C2=A0};
> > =C2=A0
> > =C2=A0static const struct xe_device_desc bmg_desc =3D {
> > --=20
> > 2.43.0
> >=20

