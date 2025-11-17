Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388E2CE8D6B
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 09:34:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30C710E35A;
	Mon, 17 Nov 2025 09:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jNpXelJu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C6A10E32D
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 09:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763372066; x=1794908066;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=wnjJiODhg3fkoaxgD7HzJvhXpJ/AWSxe5A/XA2O8zjk=;
 b=jNpXelJujrpfws+lhR9pPb1eHIi9W0r0FmVtfyI5qzRhCBQ9YkEjHaCI
 etJdbo4WwVhXzUg+gF4zlSw0McgFA7sL8dPN7CJRhhHYOEn9pxp8x0oF7
 3rTSfhyxH2/GecK+oAXnRn8oDOfJbhgns4+Hg6lWZTLu8FrYTd5HEb4UQ
 LjMYWedqBhGXOADC36pedjDpFGO0vjp8LcX1K+EpRQ9SGnxbTu8mOgvW4
 Mz1pZBex2pgNLDyxEhl7U4+1EyvqKL3Lpg8H5Z3wfYgCVoTxmHf+7E0tF
 5fvxIpIR2BxyEycdKcz8XR/phiCamA3vxsFvIAvzZNW3YXa0EBVe523XL g==;
X-CSE-ConnectionGUID: oUllFlf8T2akWBOsMjIIFA==
X-CSE-MsgGUID: V57WDebARRKYf4xVEyPiKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="75967750"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="75967750"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 01:34:26 -0800
X-CSE-ConnectionGUID: WJI4MjKzQmS1JsrPRLHRGA==
X-CSE-MsgGUID: mWw44/g8SwG9tSXje/hpEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="190198551"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.239])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 01:34:23 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 17 Nov 2025 11:34:20 +0200 (EET)
To: Matt Roper <matthew.d.roper@intel.com>
cc: intel-xe@lists.freedesktop.org, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>, linux-pci@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/xe: Improve rebar log messages
In-Reply-To: <20251114215621.GT3905809@mdroper-desk1.amr.corp.intel.com>
Message-ID: <af1b8517-a48c-0826-b02a-db102424ac8a@linux.intel.com>
References: <20251031-xe-pci-rebar-2-part-2-v1-0-c4a794a39041@intel.com>
 <20251031-xe-pci-rebar-2-part-2-v1-2-c4a794a39041@intel.com>
 <20251114215621.GT3905809@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-363282355-1763371698=:982"
Content-ID: <4b40d736-eff3-bb06-9747-0ebdf7389807@linux.intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-363282355-1763371698=:982
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <5cbdb3e6-8534-9ab8-74b5-db984d067d99@linux.intel.com>

On Fri, 14 Nov 2025, Matt Roper wrote:

> On Fri, Oct 31, 2025 at 02:17:43PM -0700, Lucas De Marchi wrote:
> > Some minor improvements to the log messages in the rebar logic:
> > use xe-oriented printk, switch unit from M to MiB in a few places for
> > consistency and us ilog2(SZ_1M) for clarity.
> >=20
> > Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Suggested-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>=20
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>=20
> > ---
> >  drivers/gpu/drm/xe/xe_pci_rebar.c | 20 +++++++++-----------
> >  1 file changed, 9 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_pci_rebar.c b/drivers/gpu/drm/xe/xe_=
pci_rebar.c
> > index d21e29c95ca33..378447a3be0ca 100644
> > --- a/drivers/gpu/drm/xe/xe_pci_rebar.c
> > +++ b/drivers/gpu/drm/xe/xe_pci_rebar.c
> > @@ -6,12 +6,11 @@
> >  #include <linux/pci.h>
> >  #include <linux/types.h>
> > =20
> > -#include <drm/drm_print.h>
> > -
> >  #include "regs/xe_bars.h"
> >  #include "xe_device_types.h"
> >  #include "xe_module.h"
> >  #include "xe_pci_rebar.h"
> > +#include "xe_printk.h"
> > =20
> >  #define BAR_SIZE_SHIFT 20
> > =20
> > @@ -47,12 +46,12 @@ static void resize_bar(struct xe_device *xe, int re=
sno, resource_size_t size)
> > =20
> >  =09ret =3D pci_resize_resource(pdev, resno, bar_size);
> >  =09if (ret) {
> > -=09=09drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Conside=
r enabling 'Resizable BAR' support in your BIOS\n",
> > -=09=09=09 resno, 1 << bar_size, ERR_PTR(ret));
> > +=09=09xe_info(xe, "Failed to resize BAR%d to %dMiB (%pe). Consider ena=
bling 'Resizable BAR' support in your BIOS\n",
> > +=09=09=09resno, 1 << bar_size, ERR_PTR(ret));
> >  =09=09return;
> >  =09}
> > =20
> > -=09drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
> > +=09xe_info(xe, "BAR%d resized to %dMiB\n", resno, 1 << bar_size);
> >  }
> > =20
> >  /*
> > @@ -93,9 +92,8 @@ void xe_pci_rebar(struct xe_device *xe)
> >  =09=09bar_size_bit =3D bar_size_mask & BIT(pci_rebar_bytes_to_size(reb=
ar_size));
> > =20
> >  =09=09if (!bar_size_bit) {
> > -=09=09=09drm_info(&xe->drm,
> > -=09=09=09=09 "Requested size: %lluMiB is not supported by rebar sizes:=
 0x%x. Leaving default: %lluMiB\n",
> > -=09=09=09=09 (u64)rebar_size >> 20, bar_size_mask, (u64)current_size >=
> 20);
> > +=09=09=09xe_info(xe, "Requested size: %lluMiB is not supported by reba=
r sizes: 0x%x. Leaving default: %lluMiB\n",
> > +=09=09=09=09(u64)rebar_size >> ilog2(SZ_1M), bar_size_mask, (u64)curre=
nt_size >> ilog2(SZ_1M));
> >  =09=09=09return;

I don't remember if I said it already but this will cause more conflicts=20
with what's in the pci/resource branch so preferrably defer this until the=
=20
next cycle so the between trees conflicts are avoided.

--=20
 i.


> >  =09=09}
> > =20
> > @@ -111,8 +109,8 @@ void xe_pci_rebar(struct xe_device *xe)
> >  =09=09=09return;
> >  =09}
> > =20
> > -=09drm_info(&xe->drm, "Attempting to resize bar from %lluMiB -> %lluMi=
B\n",
> > -=09=09 (u64)current_size >> 20, (u64)rebar_size >> 20);
> > +=09xe_info(xe, "Attempting to resize bar from %lluMiB -> %lluMiB\n",
> > +=09=09(u64)current_size >> ilog2(SZ_1M), (u64)rebar_size >> ilog2(SZ_1=
M));
> > =20
> >  =09while (root->parent)
> >  =09=09root =3D root->parent;
> > @@ -124,7 +122,7 @@ void xe_pci_rebar(struct xe_device *xe)
> >  =09}
> > =20
> >  =09if (!root_res) {
> > -=09=09drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is =
missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
> > +=09=09xe_info(xe, "Can't resize VRAM BAR - platform support is missing=
=2E Consider enabling 'Resizable BAR' support in your BIOS\n");
> >  =09=09return;
> >  =09}

--8323328-363282355-1763371698=:982--
