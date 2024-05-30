Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694AEC25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 21:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E594710E2BF;
	Thu, 30 May 2024 21:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e1MmaHNQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F5010E54F
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 21:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717103268; x=1748639268;
 h=message-id:subject:from:reply-to:to:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=PF9/AQbbZ7/vT8ApF9oVvL7a9o2xfVJ0Cqr2jWZzPZE=;
 b=e1MmaHNQ2wwHPHsd14B9CA7wbbToug/+QYUViXertJKlTnHjRZ3tXMMx
 +WDfRpaDdNe0Z21nhs9OSrAVinvgBk7bmONZoaY59oWf5JRh7nMgLOCUv
 A6NWJAOdAzbIA8dBYOA5sMHnKGeLKoUYdLW013DEPgq4AiJNhvlDKC55V
 KFyuDu4TGyRSY0G5OdDxoXVlZOay2n5+DXRYvKQWmW1X7zFZ0Gsxc7TQ2
 2EsEuotH+fYG2zGh/aROP+As0+YBXNqZSvXxeryzusLVs8ReLhWXuvCXb
 gQPRKaCBi8+RqyrHs21SepzXJroA629XyCxLvrVBpxh8+tsECvhBZRn1Y w==;
X-CSE-ConnectionGUID: +A0jbbiaRUKulDbHXIiDIg==
X-CSE-MsgGUID: zDJw5cdoQQC/qZJi27d1uQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="17426265"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="17426265"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 14:07:47 -0700
X-CSE-ConnectionGUID: MYsOv2B9Qf2XyWsl8ZTfOQ==
X-CSE-MsgGUID: 5LwbkSerRfKFItk74UWycg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="40863681"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 14:07:47 -0700
Received: from [10.54.75.156] (debox1-desk1.jf.intel.com [10.54.75.156])
 by linux.intel.com (Postfix) with ESMTP id 2FB402078A11;
 Thu, 30 May 2024 14:07:47 -0700 (PDT)
Message-ID: <f19e2fc30395dfa55acb5e7cf149682384d28195.camel@linux.intel.com>
Subject: Re: [PATCH 1/6] platform/x86/intel/vsec.h: Move to include/linux
From: "David E. Box" <david.e.box@linux.intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Date: Thu, 30 May 2024 14:07:47 -0700
In-Reply-To: <DS0PR11MB6424F20F1C1AF1FB54D2D71BC1F12@DS0PR11MB6424.namprd11.prod.outlook.com>
References: <20240510205948.904409-1-michael.j.ruhl@intel.com>
 <20240510205948.904409-2-michael.j.ruhl@intel.com>
 <DS0PR11MB6424F20F1C1AF1FB54D2D71BC1F12@DS0PR11MB6424.namprd11.prod.outlook.com>
Autocrypt: addr=david.e.box@linux.intel.com; prefer-encrypt=mutual;
 keydata=mQENBF2w2YABCACw5TpqmFTR6SgsrNqZE8ro1q2lUgVZda26qIi8GeHmVBmu572RfPydisEpCK246rYM5YY9XAps810ZxgFlLyBqpE/rxB4Dqvh04QePD6fQNui/QCSpyZ6j9F8zl0zutOjfNTIQBkcar28hazL9I8CGnnMko21QDl4pkrq1dgLSgl2r2N1a6LJ2l8lLnQ1NJgPAev4BWo4WAwH2rZ94aukzAlkFizjZXmB/6em+lhinTR9hUeXpTwcaAvmCHmrUMxeOyhx+csO1uAPUjxL7olj2J83dv297RrpjMkDyuUOv8EJlPjvVogJF1QOd5MlkWdj+6vnVDRfO8zUwm2pqg25DABEBAAG0KkRhdmlkIEUuIEJveCA8ZGF2aWQuZS5ib3hAbGludXguaW50ZWwuY29tPokBTgQTAQgAOBYhBBFoZ8DYRC+DyeuV6X7Mry1gl3p/BQJdsNmAAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEH7Mry1gl3p/NusIAK9z1xnXphedgZMGNzifGUs2UUw/xNl91Q9qRaYGyNYATI6E7zBYmynsUL/4yNFnXK8P/I7WMffiLoMqmUvNp9pG6oYYj8ouvbCexS21jgw54I3m61M+wTokieRIO/GettVlCGhz7YHlHtGGqhzzWB3CGPSJMwsouDPvyFFE+28p5d2v9l6rXSb7T297Kh50VX9Ele8QEKngrG+Z/u2lr/bHEhvx24vI8ka22cuTaZvThYMwLTSC4kq9L9WgRv31JBSa1pcbcHLOCoUl0RaQwe6J8w9hN2uxCssHrrfhSA4YjxKNIIp3YH4IpvzuDR3AadYz1klFTnEOxIM7fvQ2iGu5AQ0EXbDZgAEIAPGbL3wvbYUDGMoBSN89GtiC6ybWo28JSiYIN5N9LhDTwfWROenkRvmTESaE5fAM24sh8S0h+F+eQ7j/E/RF3pM31gSovTKw0Pxk7GorK
 FSa25CWemxSV97zV8fVegGkgfZkBMLUId+AYCD1d2R+tndtgjrHtVq/AeN0N09xv/d3a+Xzc4ib/SQh9mM50ksqiDY70EDe8hgPddYH80jHJtXFVA7Ar1ew24TIBF2rxYZQJGLe+Mt2zAzxOYeQTCW7WumD/ZoyMm7bg46/2rtricKnpaACM7M0r7g+1gUBowFjF4gFqY0tbLVQEB/H5e9We/C2zLG9r5/Lt22dj7I8A6kAEQEAAYkBNgQYAQgAIBYhBBFoZ8DYRC+DyeuV6X7Mry1gl3p/BQJdsNmAAhsMAAoJEH7Mry1gl3p/Z/AH/Re8YwzY5I9ByPM56B3Vkrh8qihZjsF7/WB14Ygl0HFzKSkSMTJ+fvZv19bk3lPIQi5lUBuU5rNruDNowCsnvXr+sFxFyTbXw0AQXIsnX+EkMg/JO+/V/UszZiqZPkvHsQipCFVLod/3G/yig9RUO7A/1efRi0E1iJAa6qHrPqE/kJANbz/x+9wcx1VfFwraFXbdT/P2JeOcW/USW89wzMRmOo+AiBSnTI4xvb1s/TxSfoLZvtoj2MR+2PW1zBALWYUKHOzhfFKs3cMufwIIoQUPVqGVeH+u6Asun6ZpNRxdDONop+uEXHe6q6LzI/NnczqoZQLhM8d1XqokYax/IZ4=
Organization: David E. Box
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
Reply-To: david.e.box@linux.intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 2024-05-28 at 15:43 +0000, Ruhl, Michael J wrote:
> Hi David,
>=20
> Do you have any comments on the first 3 patches?
>=20
> What are the next steps to move them forward?

I have sent you an update of my patches. You can replace in this series in =
your
V2.

>=20
> Thanks,
>=20
> Mike
>=20
>=20
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Mi=
chael
> > J. Ruhl
> > Sent: Friday, May 10, 2024 5:00 PM
> > To: intel-xe@lists.freedesktop.org
> > Cc: david.e.box@linux.intel.com
> > Subject: [PATCH 1/6] platform/x86/intel/vsec.h: Move to include/linux
> >=20
> > From: "David E. Box" <david.e.box@linux.intel.com>
> >=20
> > Some drivers outside of PDX86 need access to the vsec header. Move it t=
o
> > include/linux to make it easier to include.
> >=20
> > Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> > ---
> > drivers/platform/x86/intel/pmc/core_ssram.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 2 +-
> > drivers/platform/x86/intel/pmt/class.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> > drivers/platform/x86/intel/pmt/class.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> > drivers/platform/x86/intel/pmt/crashlog.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 2 +-
> > drivers/platform/x86/intel/pmt/telemetry.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 2 +-
> > drivers/platform/x86/intel/sdsi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +--
> > drivers/platform/x86/intel/tpmi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +--
> > drivers/platform/x86/intel/vsec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 5 ++---
> > .../platform/x86/intel/vsec.h =3D> include/linux/intel_vsec.h=C2=A0 | 4=
 ++--
> > 9 files changed, 11 insertions(+), 14 deletions(-)
> > rename drivers/platform/x86/intel/vsec.h =3D> include/linux/intel_vsec.=
h (98%)
> >=20
> > diff --git a/drivers/platform/x86/intel/pmc/core_ssram.c
> > b/drivers/platform/x86/intel/pmc/core_ssram.c
> > index 1bde86c54eb9..baddaaec25ee 100644
> > --- a/drivers/platform/x86/intel/pmc/core_ssram.c
> > +++ b/drivers/platform/x86/intel/pmc/core_ssram.c
> > @@ -9,11 +9,11 @@
> > =C2=A0*/
> >=20
> > #include <linux/cleanup.h>
> > +#include <linux/intel_vsec.h>
> > #include <linux/pci.h>
> > #include <linux/io-64-nonatomic-lo-hi.h>
> >=20
> > #include "core.h"
> > -#include "../vsec.h"
> > #include "../pmt/telemetry.h"
> >=20
> > #define SSRAM_HDR_SIZE		0x100
> > diff --git a/drivers/platform/x86/intel/pmt/class.c
> > b/drivers/platform/x86/intel/pmt/class.c
> > index 4b53940a64e2..d7939b28e937 100644
> > --- a/drivers/platform/x86/intel/pmt/class.c
> > +++ b/drivers/platform/x86/intel/pmt/class.c
> > @@ -9,12 +9,12 @@
> > =C2=A0*/
> >=20
> > #include <linux/kernel.h>
> > +#include <linux/intel_vsec.h>
> > #include <linux/io-64-nonatomic-lo-hi.h>
> > #include <linux/module.h>
> > #include <linux/mm.h>
> > #include <linux/pci.h>
> >=20
> > -#include "../vsec.h"
> > #include "class.h"
> >=20
> > #define PMT_XA_START		1
> > diff --git a/drivers/platform/x86/intel/pmt/class.h
> > b/drivers/platform/x86/intel/pmt/class.h
> > index d23c63b73ab7..d6f9ccaf28c8 100644
> > --- a/drivers/platform/x86/intel/pmt/class.h
> > +++ b/drivers/platform/x86/intel/pmt/class.h
> > @@ -2,13 +2,13 @@
> > #ifndef _INTEL_PMT_CLASS_H
> > #define _INTEL_PMT_CLASS_H
> >=20
> > +#include <linux/intel_vsec.h>
> > #include <linux/xarray.h>
> > #include <linux/types.h>
> > #include <linux/bits.h>
> > #include <linux/err.h>
> > #include <linux/io.h>
> >=20
> > -#include "../vsec.h"
> > #include "telemetry.h"
> >=20
> > /* PMT access types */
> > diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
> > b/drivers/platform/x86/intel/pmt/crashlog.c
> > index 4014c02cafdb..9079d5dffc03 100644
> > --- a/drivers/platform/x86/intel/pmt/crashlog.c
> > +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> > @@ -9,6 +9,7 @@
> > =C2=A0*/
> >=20
> > #include <linux/auxiliary_bus.h>
> > +#include <linux/intel_vsec.h>
> > #include <linux/kernel.h>
> > #include <linux/module.h>
> > #include <linux/pci.h>
> > @@ -16,7 +17,6 @@
> > #include <linux/uaccess.h>
> > #include <linux/overflow.h>
> >=20
> > -#include "../vsec.h"
> > #include "class.h"
> >=20
> > /* Crashlog discovery header types */
> > diff --git a/drivers/platform/x86/intel/pmt/telemetry.c
> > b/drivers/platform/x86/intel/pmt/telemetry.c
> > index 09258564dfc4..3478f891ea0b 100644
> > --- a/drivers/platform/x86/intel/pmt/telemetry.c
> > +++ b/drivers/platform/x86/intel/pmt/telemetry.c
> > @@ -9,6 +9,7 @@
> > =C2=A0*/
> >=20
> > #include <linux/auxiliary_bus.h>
> > +#include <linux/intel_vsec.h>
> > #include <linux/kernel.h>
> > #include <linux/module.h>
> > #include <linux/pci.h>
> > @@ -16,7 +17,6 @@
> > #include <linux/uaccess.h>
> > #include <linux/overflow.h>
> >=20
> > -#include "../vsec.h"
> > #include "class.h"
> >=20
> > #define TELEM_SIZE_OFFSET	0x0
> > diff --git a/drivers/platform/x86/intel/sdsi.c
> > b/drivers/platform/x86/intel/sdsi.c
> > index 556e7c6dbb05..322ada188ee9 100644
> > --- a/drivers/platform/x86/intel/sdsi.c
> > +++ b/drivers/platform/x86/intel/sdsi.c
> > @@ -12,6 +12,7 @@
> > #include <linux/bits.h>
> > #include <linux/bitfield.h>
> > #include <linux/device.h>
> > +#include <linux/intel_vsec.h>
> > #include <linux/iopoll.h>
> > #include <linux/kernel.h>
> > #include <linux/module.h>
> > @@ -21,8 +22,6 @@
> > #include <linux/types.h>
> > #include <linux/uaccess.h>
> >=20
> > -#include "vsec.h"
> > -
> > #define ACCESS_TYPE_BARID		2
> > #define ACCESS_TYPE_LOCAL		3
> >=20
> > diff --git a/drivers/platform/x86/intel/tpmi.c
> > b/drivers/platform/x86/intel/tpmi.c
> > index 910df7c654f4..be7ea557b72d 100644
> > --- a/drivers/platform/x86/intel/tpmi.c
> > +++ b/drivers/platform/x86/intel/tpmi.c
> > @@ -51,6 +51,7 @@
> > #include <linux/debugfs.h>
> > #include <linux/delay.h>
> > #include <linux/intel_tpmi.h>
> > +#include <linux/intel_vsec.h>
> > #include <linux/io.h>
> > #include <linux/iopoll.h>
> > #include <linux/module.h>
> > @@ -59,8 +60,6 @@
> > #include <linux/sizes.h>
> > #include <linux/string_helpers.h>
> >=20
> > -#include "vsec.h"
> > -
> > /**
> > =C2=A0* struct intel_tpmi_pfs_entry - TPMI PM Feature Structure (PFS) e=
ntry
> > =C2=A0* @tpmi_id:	TPMI feature identifier (what the feature is and its =
data
> > format).
> > diff --git a/drivers/platform/x86/intel/vsec.c
> > b/drivers/platform/x86/intel/vsec.c
> > index 0fdfaf3a4f5c..5a1e964783cc 100644
> > --- a/drivers/platform/x86/intel/vsec.c
> > +++ b/drivers/platform/x86/intel/vsec.c
> > @@ -17,14 +17,13 @@
> > #include <linux/bits.h>
> > #include <linux/cleanup.h>
> > #include <linux/delay.h>
> > -#include <linux/kernel.h>
> > #include <linux/idr.h>
> > +#include <linux/intel_vsec.h>
> > +#include <linux/kernel.h>
> > #include <linux/module.h>
> > #include <linux/pci.h>
> > #include <linux/types.h>
> >=20
> > -#include "vsec.h"
> > -
> > #define PMT_XA_START			0
> > #define PMT_XA_MAX			INT_MAX
> > #define PMT_XA_LIMIT			XA_LIMIT(PMT_XA_START,
> > PMT_XA_MAX)
> > diff --git a/drivers/platform/x86/intel/vsec.h b/include/linux/intel_vs=
ec.h
> > similarity index 98%
> > rename from drivers/platform/x86/intel/vsec.h
> > rename to include/linux/intel_vsec.h
> > index e23e76129691..7f19a3d90abe 100644
> > --- a/drivers/platform/x86/intel/vsec.h
> > +++ b/include/linux/intel_vsec.h
> > @@ -1,6 +1,6 @@
> > /* SPDX-License-Identifier: GPL-2.0 */
> > -#ifndef _VSEC_H
> > -#define _VSEC_H
> > +#ifndef _INTEL_VSEC_H
> > +#define _INTEL_VSEC_H
> >=20
> > #include <linux/auxiliary_bus.h>
> > #include <linux/bits.h>
> > --
> > 2.44.0
>=20

