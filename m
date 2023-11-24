Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725E9C61D97
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 11:02:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8D810E1BC;
	Fri, 24 Nov 2023 11:02:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F3110E1BC
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 11:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700823752; x=1732359752;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=ZkvvNXiexwou9KomPMtKYK+x2LK5FRu0uB4v78SV5v8=;
 b=DlbGE+jV1SWT3DkhZ86fFVp9H55qHBoGanFA+Wczk1+LTs/f0K4ndjy8
 jFl4w2KdOXPrDjSWoHOr61MDPiUEpFgcbVfu2YTjaB0MPdOQa+3vujMl1
 POV3UWEWcBsrkCcQv2MFrArulXo2/cpaTztM2LDVqVgJVkSf4vb7TFCr3
 YyHz/HAFuV5Z0SvPz2p1qY6lwvs5hN8OB+thPMeQq0BnJhL+I43JJ1PDR
 rUOlXGEqymFL6OgCvzZDz2VTYvXY0okKXTFAo0M8easvblIdXBt0y5xnL
 dGBwWB+hCjF4z2HRoLJxIJfU3vYK4GnxKXRkprSTVRxaR7uCGm73ajBZf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="392172080"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; d="scan'208";a="392172080"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 03:02:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="760928948"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; d="scan'208";a="760928948"
Received: from cschimpe-mobl1.ger.corp.intel.com (HELO [10.249.254.175])
 ([10.249.254.175])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 03:02:28 -0800
Message-ID: <0a468d2ac94069233f474bf6c965d8deeacc70e5.camel@linux.intel.com>
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, 
 intel-xe@lists.freedesktop.org
Date: Fri, 24 Nov 2023 12:02:26 +0100
In-Reply-To: <20231121100906.3587649-2-himal.prasad.ghimiray@intel.com>
References: <20231121100906.3587649-1-himal.prasad.ghimiray@intel.com>
 <20231121100906.3587649-2-himal.prasad.ghimiray@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Subject: Re: [Intel-xe] [RFC v2 1/6] drm/xe/xe2: Support flat ccs.
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

On Tue, 2023-11-21 at 15:39 +0530, Himal Prasad Ghimiray wrote:
> Enable flat ccs for XE2_GFX_FEATURES.
>=20
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray
> <himal.prasad.ghimiray@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_pci.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)

Typically you add the implementation first and then enable it, so this
patch should go last. (Rule is the driver should not misbehave if
bisecting lands in the middle of a patch series).

/Thomas



>=20
> diff --git a/drivers/gpu/drm/xe/xe_pci.c
> b/drivers/gpu/drm/xe/xe_pci.c
> index 682ba188e456..d9754f3d45f7 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -157,7 +157,7 @@ static const struct xe_graphics_desc
> graphics_xelpg =3D {
> =C2=A0#define XE2_GFX_FEATURES \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.dma_mask_size =3D 46, \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.has_asid =3D 1, \
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.has_flat_ccs =3D 0 /* FIXME: =
implementation missing */, \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.has_flat_ccs =3D 1, \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.has_range_tlb_invalidati=
on =3D 1, \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.supports_usm =3D 0 /* FI=
XME: implementation missing */, \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.va_bits =3D 48, \

