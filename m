Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531DCC47DD9
	for <intel-xe@archiver.kernel.org>; Wed, 28 Feb 2024 14:47:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3E810E9F2;
	Wed, 28 Feb 2024 14:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P9YsC9MU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4EC410E9F1
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Feb 2024 14:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709131637; x=1740667637;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=gX4PJkk4G7jBayhi66ZMIHlBrcZ/vPyCa9vdAPgjm4E=;
 b=P9YsC9MUQbg2rnK/rmKicN8fQ65wpPk1FI/Wl2gglONE00UIjR4SSEKK
 sp9EGoSYOVYc3MxE1z4htFC2X+mX3FQa7amKGd5WCSW1YcBLk+GkkqQxl
 MGAg1VGqF1I9L2wJK90JETMiitl+6rSAuvsJ/KUPmc6wHdY54RgefgZ2N
 kOxrO9zmnXzA6A/GpXcd1FvDl7qNpzIQDAjUcIinkqAbT5J+lyTeBFMU+
 3jSsQGB1nDlw35Ihtps1GwfgIoTswQSe+Y0gXkoNk1O6ZynrpiyolJ+zz
 UPwnYsPR9+0S9OXfDENMr6j/5DA0qS7AvEgjgrFNkVU+XePDScV1bPUOc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3649454"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="3649454"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:47:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7406105"
Received: from badunne-mobl1.ger.corp.intel.com (HELO [10.252.3.58])
 ([10.252.3.58])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:47:16 -0800
Message-ID: <2552f1145d30d79669cfae860abbeb361ce723c4.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Fix build error in xe_ggtt.c
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Date: Wed, 28 Feb 2024 15:47:13 +0100
In-Reply-To: <Zdyw6OT/SDir+3Op@DUT025-TGLU.fm.intel.com>
References: <20240225001448.81513-1-matthew.brost@intel.com>
 <98e9c8ea0f51cb308f02a1cf2ce61d06fd5bbc0a.camel@linux.intel.com>
 <Zdyw6OT/SDir+3Op@DUT025-TGLU.fm.intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
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

On Mon, 2024-02-26 at 15:40 +0000, Matthew Brost wrote:
> On Mon, Feb 26, 2024 at 10:05:58AM +0100, Thomas Hellstr=C3=B6m wrote:
> > On Sat, 2024-02-24 at 16:14 -0800, Matthew Brost wrote:
> > > Need to include io-64-nonatomic-lo-hi.h for writeq function.
> >=20
> > As I understand it, the choice of header here determines the dword
> > write order on 32-bit systems that don't have an atomic writeq(),
> >=20
> > So is writing the low dword first the correct order in this case?
> > Perhaps add a motivation in the commit message?
> >=20
>=20
> "Cleanup some layering in GGTT" removed xe_mmio.h from xe_gt.c and
> that
> file includes linux/io-64-nonatomic-lo-hi.h. Perhaps it is better
> just
> to include xe_mmio.h again in xe_gt.c?

I think it then makes sense to use your original patch, so that it's
easier to follow for each subsystem what ordering is used.

Also note Jani's comment. We should use "dim fixes <hash>" to get the
fixes tag correct.

Thanks,
Thomas


>=20
> Matt
>=20
> > /Thomas
> >=20
> >=20
> > >=20
> > > Fixes: 3121fed0c51b drm/xe: ("Cleanup some layering in GGTT")
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes:
> > > https://lore.kernel.org/oe-kbuild-all/202402241903.R5J8hKVI-lkp@intel=
.com/
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/xe/xe_ggtt.c | 1 +
> > > =C2=A01 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c
> > > b/drivers/gpu/drm/xe/xe_ggtt.c
> > > index 5d46958e3144..717d0e76277a 100644
> > > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > > @@ -5,6 +5,7 @@
> > > =C2=A0
> > > =C2=A0#include "xe_ggtt.h"
> > > =C2=A0
> > > +#include <linux/io-64-nonatomic-lo-hi.h>
> > > =C2=A0#include <linux/sizes.h>
> > > =C2=A0
> > > =C2=A0#include <drm/drm_managed.h>
> >=20

