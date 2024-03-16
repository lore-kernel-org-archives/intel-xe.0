Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFE2C54E67
	for <intel-xe@archiver.kernel.org>; Sat, 16 Mar 2024 01:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B032E112892;
	Sat, 16 Mar 2024 01:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z5NG+byT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E634112891
 for <intel-xe@lists.freedesktop.org>; Sat, 16 Mar 2024 01:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710552950; x=1742088950;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jtF9k/9pk+T97PDo2DNUA+0NENWjEDfOPfgRILpzueQ=;
 b=Z5NG+byTAhKKZ7x9Z9+fFIfNj8hN8ZknZruvzJrdw9Rae6CfOx/1SmPa
 IXJj+2OoR1n3K4Awpo5o4W0um2hwTvkz/ZXA2/sIXqQYE7q6HrhpI32ad
 FyOxIP/2duAi2RkrTm/BdeUOoCdu6VBjQlvy88AjFH1ZBpHiQPiTnAmAD
 UTlSD5T2UEL9Z8G7RImvwn5I+TIva/nbOj3rst0ZyiFrUGIYT0m8IZhFk
 ayBGrlXbSLxhN7Qu4UB/4K1xtvQHiFVhuZSXTE09TESmtMCGj7FoGH+1p
 FMCZZbCoJbQtZAzrFgnAVa1CL+jSfWoqj1mOr5IpJ5O/Vx+vYNzYU127u w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="22903614"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="22903614"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 18:35:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="13487897"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 18:35:50 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 18:35:49 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 18:35:49 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 18:35:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FvM0CuZyiH3ncBK6E1A/ojUXPoKtdNZ+yHUk24QmJ4iVB6uEaI5xawgqKg+6HvmkN1VqHt32JL7VnoyymRwzUH/+djZxsbG7O7z3l9fDELnkwQ2wAfcWIXvhaE0/pyo3L8QsrtWwzQ5dZIyWJQA515z1G7ES+K9lmzHUKEgHdBfaK4VP3zI+F+6iLupnotJXJ1MYLgytHFw+NVJyZoe+8VKr2prk7BTE0dDlElfCsL0HwFaYmzef1Toonvkk1WU6NktWBsbJR9AxBBRtTK0bb2GTeU9CLvGgMdunRH4auwxS6xioCAZr/0UYjfVBOn2Oy4HRMQdnYpvmq+/xO41mXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbc3uyT6RNQHtRwRRfUuIZfbHx6fIhi70ZjH+BFYUj0=;
 b=VU3RVDDILlP4etrqrjIsZdkeYT0KXNQYCF+m87CJtqYS2+pfcKqUvBAJF5lk1ivxugHWOqketolaUkLGnyArowSFu56Kjnf6eQxaY1tjrg39+PlXL5+bNCGfsuvrVUAUWVoVmCRlO+vu+aHjCYJH2QMVNkgwMshFua22IjXa1z6YDE7XACM3GBI7pf/KOrk3vVVuVclVXI9xSE2MwWbRhOY/BWUrkm2fMVu+LMlSNr6dttBMpXnbubZeeJMqgoAkdgc/O8zwmj7G9shy4QbKIMdnps3ssyHOKoSPMJBHtWYJuJcxpbjRqim4SKebAzbZPWqN+8Gn0pNjzvMBrN1Q7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Sat, 16 Mar
 2024 01:35:15 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Sat, 16 Mar 2024
 01:35:15 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "Welty, Brian" <brian.welty@intel.com>, "Ghimiray, Himal
 Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH 4/5] drm/xe: Helper to populate a userptr or hmmptr
Thread-Topic: [PATCH 4/5] drm/xe: Helper to populate a userptr or hmmptr
Thread-Index: AQHadb8bm7LA7U9/N0+DYhDF3MBxjbE3r+OAgAFkQiA=
Date: Sat, 16 Mar 2024 01:35:15 +0000
Message-ID: <SA1PR11MB69915347D87B6A97A8E5AD05922F2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240314033553.1379444-1-oak.zeng@intel.com>
 <20240314033553.1379444-5-oak.zeng@intel.com>
 <ZfNdHSODk7eNLA5X@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZfNdHSODk7eNLA5X@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|DS0PR11MB7484:EE_
x-ms-office365-filtering-correlation-id: ea4fdb54-d623-4707-666f-08dc455954d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FiezDjmHyrfiZZTAKkJyVQVyJV4uhSnh3Enq0rdv5DPhQ6dNbeUW70iBSM8xsjgDGVc0j4HwR936sVNru+oFVDNrT72EHote7V3wScSYueKHJc2xkSv354QTFvbt9iyR7yo4OIC3Z7UzLFG0nOkxXdaJTVpYq0AwsYGKj++MHKucOQnWZtAPh4sm44FPKMBL895I9vakXA7V+NCYXEXb/OPVDAY+pv+KvdC6xnDayyodGY8UNoDCevSppRH461wz1yGHE+R5lwaOPZqMn+ZugPiQ6uQGqSMs35NgVkE0PXABNLl9zssXqxifcvN169Os66S2FBETTUp0yRMOu68rTSQA3UkU/OxGMNxbzn1hHyzJM1PGNwIvDUUUifIc6pHzxXml+Zm1WVbPj/2IJW5LnZglb7fQ22ZuojCRGt+M5c2+6kSewYaT4mxZKMcYhBnoPPTRDzRGPgJ4AF1h5BuGTRBFoRsBsU4zPScSQ3OaGjAhwu5B+WcVNk01GJLDiix96eyJvpS+IU3d5bSfoL2bY1BubxarVN0yAyy59kwVHTwD0AOKxlNGM5BCS1hyZACvUL7vX76lkHvHMhyGmC/795SJk0cbK9+8sj1j+gw+F0puZ58jd2rdB5qvnyPc2Xf0+kHhz+GJIk+IzThd57z9Qca8ILc93LJvScfY8wgqf8ydaBLRw5pH8QN1xH4vx+B6ZUevkA3winyyoFReuRowPy6dlVB889ZdKrroAawdv3E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?IQ8CNLfkX8F2IOemLUN6xj6ynhCbhgGDXKLNHq1fYhGvBmsJLgPZFnfePb?=
 =?iso-8859-1?Q?qTa2ckrMfzbChp1K2qaZZQOnZxmkbXkJnPEsUtjgt7bDTHTexnj2dUzm3P?=
 =?iso-8859-1?Q?N8JRDs1deozQuxEFvLK2bQAZ81KLoQHvOdW88aU3uUOOEDSg5r3Wnp++fW?=
 =?iso-8859-1?Q?aJwQ6teVDBNGNrwRzn3wKndHQWKNQWoPWjeJw4wx32TS4Z6IfXlqiEL0re?=
 =?iso-8859-1?Q?YTHIW8gdzl2lp53ZqR5DCFoZmqBDn3Wb1WuyuQSCdy2DCS/5Ivbw5EeMyh?=
 =?iso-8859-1?Q?lCxXtUEdHlLmLxtN7WZKc54iZg0zYX0lHk5cwCVwHuCgNNrvO1Ti9LUXbB?=
 =?iso-8859-1?Q?4vvnD+9sIuoV8feq15JD93pquTOfDqybuLrl9XK9ro2lEEFHDDYR3VGKkE?=
 =?iso-8859-1?Q?WJWT0nmjFdosLGYPFWhA38mIG48GUvC5U6Uw5BF8mLiu34rpbWSFqe7YlV?=
 =?iso-8859-1?Q?Nq9Xo4AjUOH4c+DhsMjsgT/Dq2/8o82VQhnYnk/qaQDg4rtybCVnAyYkxt?=
 =?iso-8859-1?Q?LhIYcanuoH2SVnufvyXYqGOzNsUNSrWpTpaLYKMFW2S7sHepIMCHcyYOfW?=
 =?iso-8859-1?Q?EBSGs5x7xRONBaBG+cVeJYBtBAxz37zmTcdQo4PuJV+P2WH4ZrNwL0F89g?=
 =?iso-8859-1?Q?DAP0oRycVQiSkc9mkleyII9zteVOSXzzxRYwSPDrpxuhO8xOFsNau4w9YX?=
 =?iso-8859-1?Q?0+TgBRvnef506M0iG2vuqqJl8uOhtK9woPT5+RC3xy5pz8WQKkraVbp05f?=
 =?iso-8859-1?Q?IANj/e/4XncUvTuBuYF7Z2SXOL7FspC+tqCyb5GKlXozwQNoby5ZwgWU54?=
 =?iso-8859-1?Q?g9ZxAC/VqGhkswq4CpnvOmB2D611Inw611rIhPbOg2k/Re6AFQEKMtZKQg?=
 =?iso-8859-1?Q?EEH13ZaT+9gQuh+rKYX75sLtC5zw6sY/rC5huzts400Pv+KdU/qm4cj8j3?=
 =?iso-8859-1?Q?I2sy3LCFJ3sFeAeZLpzjKVUaDJ17RB6pFhFs5OO1AJLX4waGtcft2eybXs?=
 =?iso-8859-1?Q?pQ8PmR+jE0s3udCNxMw7z34ESHmVd4cW5jH21wZ1zocq1qFkYM3JUBQBXA?=
 =?iso-8859-1?Q?xQX5y2JiTEUKUWi7bMRAALQVNMKhtWomfZEiSjCHI/XN7h2jLeUql9bp1i?=
 =?iso-8859-1?Q?gcYgqvACa/IODZMd3H2+1FjNFxGM94h7wQE91IcMgwUahYdCMbC+yGVJKm?=
 =?iso-8859-1?Q?DL4szut6kVJhJLeqPNj6PIskfavlLZ1DK3JTqWw98AJEz8JbTAvC/sqiN9?=
 =?iso-8859-1?Q?Xb9h/0p+csqsf4SlSerly5Xi7uyVQ2HVcTue8wMve5NRgixSZFmg5XfIKW?=
 =?iso-8859-1?Q?wkhEcbZuOlHu4amJy3k58/mzOwPBYnqbl/mQFqcgbuwHRfDAogVwP4tkIk?=
 =?iso-8859-1?Q?xZCb866lMk54cgu5UwBCSVRNQna54vQql11i3Ewa4HcsAVynVqTiJ/kWVC?=
 =?iso-8859-1?Q?6ZBvv+Q1HsbtmKk4TGpgdshPPlLyUYCxdxuVUh3F70JxjwR9FzJt62nTjl?=
 =?iso-8859-1?Q?wP44BwqmURDmUS5P+juAIuGfY37rsCKe98KqWcEBAH5HokQmpp/kqzBmqY?=
 =?iso-8859-1?Q?PTVpsbWzOGV0GB9HJg9ZveOf7LDiJ9YHjkRfDyTLxy0RpizWGCuO1zWqRn?=
 =?iso-8859-1?Q?9IuAwB/7Sq4Z4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea4fdb54-d623-4707-666f-08dc455954d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2024 01:35:15.6811 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LWy6sXcIwoJaM7sQts4s8mIlTjYXcZ3cjiJEKS/Tb0UzcH3Cm16OwCZjzFPFhLjVgGzTX/qlYyQWVrWNbx9WLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7484
X-OriginatorOrg: intel.com
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



> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Thursday, March 14, 2024 4:25 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Hellstrom, Thomas
> <thomas.hellstrom@intel.com>; airlied@gmail.com; Welty, Brian
> <brian.welty@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: Re: [PATCH 4/5] drm/xe: Helper to populate a userptr or hmmptr
>=20
> On Wed, Mar 13, 2024 at 11:35:52PM -0400, Oak Zeng wrote:
> > Add a helper function xe_hmm_populate_range to populate
> > a a userptr or hmmptr range. This functions calls hmm_range_fault
> > to read CPU page tables and populate all pfns/pages of this
> > virtual address range.
> >
> > If the populated page is system memory page, dma-mapping is performed
> > to get a dma-address which can be used later for GPU to access pages.
> >
> > If the populated page is device private page, we calculate the dpa (
> > device physical address) of the page.
> >
> > The dma-address or dpa is then saved in userptr's sg table. This is
> > prepare work to replace the get_user_pages_fast code in userptr code
> > path. The helper function will also be used to populate hmmptr later.
> >
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > Co-developed-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> > Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Thomas Hellstr=F6m <thomas.hellstrom@intel.com>
> > Cc: Brian Welty <brian.welty@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile |   3 +-
> >  drivers/gpu/drm/xe/xe_hmm.c | 213
> ++++++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_hmm.h |  12 ++
> >  3 files changed, 227 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/gpu/drm/xe/xe_hmm.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_hmm.h
> >
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 840467080e59..29dcbc938b01 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -143,7 +143,8 @@ xe-y +=3D xe_bb.o \
> >  	xe_wait_user_fence.o \
> >  	xe_wa.o \
> >  	xe_wopcm.o \
> > -	xe_svm_devmem.o
> > +	xe_svm_devmem.o \
> > +	xe_hmm.o
> >
> >  # graphics hardware monitoring (HWMON) support
> >  xe-$(CONFIG_HWMON) +=3D xe_hwmon.o
> > diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
> > new file mode 100644
> > index 000000000000..c45c2447d386
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_hmm.c
> > @@ -0,0 +1,213 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright =A9 2024 Intel Corporation
> > + */
> > +
> > +#include <linux/mmu_notifier.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/memremap.h>
> > +#include <linux/swap.h>
> > +#include <linux/mm.h>
> > +#include "xe_hmm.h"
> > +#include "xe_vm.h"
> > +
> > +/**
> > + * mark_range_accessed() - mark a range is accessed, so core mm
> > + * have such information for memory eviction or write back to
> > + * hard disk
> > + *
> > + * @range: the range to mark
> > + * @write: if write to this range, we mark pages in this range
> > + * as dirty
> > + */
> > +static void mark_range_accessed(struct hmm_range *range, bool write)
> > +{
> > +	struct page *page;
> > +	u64 i, npages;
> > +
> > +	npages =3D ((range->end - 1) >> PAGE_SHIFT) - (range->start >>
> PAGE_SHIFT) + 1;
> > +	for (i =3D 0; i < npages; i++) {
> > +		page =3D hmm_pfn_to_page(range->hmm_pfns[i]);
> > +		if (write) {
> > +			lock_page(page);
> > +			set_page_dirty(page);
> > +			unlock_page(page);
> > +		}
> > +		mark_page_accessed(page);
> > +	}
> > +}
> > +
> > +/**
> > + * build_sg() - build a scatter gather table for all the physical page=
s/pfn
> > + * in a hmm_range. dma-address is save in sg table and will be used to
> program
> > + * GPU page table later.
> > + *
> > + * @xe: the xe device who will access the dma-address in sg table
> > + * @range: the hmm range that we build the sg table from. range-
> >hmm_pfns[]
> > + * has the pfn numbers of pages that back up this hmm address range.
> > + * @st: pointer to the sg table.
> > + * @write: whether we write to this range. This decides dma map direct=
ion
> > + * for system pages. If write we map it bi-diretional; otherwise
> > + * DMA_TO_DEVICE
> > + *
> > + * All the contiguous pfns will be collapsed into one entry in
> > + * the scatter gather table. This is for the convenience of
> > + * later on operations to bind address range to GPU page table.
> > + *
> > + * The dma_address in the sg table will later be used by GPU to
> > + * access memory. So if the memory is system memory, we need to
> > + * do a dma-mapping so it can be accessed by GPU/DMA. If the memory
> > + * is GPU local memory (of the GPU who is going to access memory),
> > + * we need gpu dpa (device physical address), and there is no need
> > + * of dma-mapping.
> > + *
> > + * FIXME: dma-mapping for peer gpu device to access remote gpu's
> > + * memory. Add this when you support p2p
> > + *
> > + * This function allocates the storage of the sg table. It is
> > + * caller's responsibility to free it calling sg_free_table.
> > + *
> > + * Returns 0 if successful; -ENOMEM if fails to allocate memory
> > + */
> > +static int build_sg(struct xe_device *xe, struct hmm_range *range,
>=20
> xe is unused.

It is used in below line
>=20
> > +			     struct sg_table *st, bool write)
> > +{
> > +	struct device *dev =3D xe->drm.dev;

Used here

> > +	struct scatterlist *sg;
> > +	u64 i, npages;
> > +
> > +	sg =3D NULL;
> > +	st->nents =3D 0;
> > +	npages =3D ((range->end - 1) >> PAGE_SHIFT) - (range->start >>
> PAGE_SHIFT) + 1;
> > +
> > +	if (unlikely(sg_alloc_table(st, npages, GFP_KERNEL)))
> > +		return -ENOMEM;
> > +
> > +	for (i =3D 0; i < npages; i++) {
> > +		struct page *page;
> > +		unsigned long addr;
> > +		struct xe_mem_region *mr;
> > +
> > +		page =3D hmm_pfn_to_page(range->hmm_pfns[i]);
> > +		if (is_device_private_page(page)) {
> > +			mr =3D page_to_mem_region(page);
>=20
> Not seeing where page_to_mem_region is defined.


Yah,,,, I forgot to pick up this patch. Will pick up...

>=20
> > +			addr =3D vram_pfn_to_dpa(mr, range->hmm_pfns[i]);
> > +		} else {
> > +			addr =3D dma_map_page(dev, page, 0, PAGE_SIZE,
> > +					write ? DMA_BIDIRECTIONAL :
> DMA_TO_DEVICE);
> > +		}
> > +
> > +		if (sg && (addr =3D=3D (sg_dma_address(sg) + sg->length))) {
> > +			sg->length +=3D PAGE_SIZE;
> > +			sg_dma_len(sg) +=3D PAGE_SIZE;
> > +			continue;
> > +		}
> > +
> > +		sg =3D  sg ? sg_next(sg) : st->sgl;
> > +		sg_dma_address(sg) =3D addr;
> > +		sg_dma_len(sg) =3D PAGE_SIZE;
> > +		sg->length =3D PAGE_SIZE;
> > +		st->nents++;
> > +	}
> > +
> > +	sg_mark_end(sg);
> > +	return 0;
> > +}
> > +
>=20
> Hmm, this looks way to open coded to me.
>=20
> Can't we do something like this:
>=20
> struct page **pages =3D convert from range->hmm_pfns
> sg_alloc_table_from_pages_segment
> if (is_device_private_page())
>         populatue sg table via vram_pfn_to_dpa
> else
>         dma_map_sgtable
> free(pages)
>=20
> This assume we are not mixing is_device_private_page & system memory
> pages in a single struct hmm_range.



that is exactly I pictured. We actually can mixing vram and system memory..=
. the reason is, migration of a hmm range from system memory to vram can fa=
il for whatever reason. And it can end up a range is partially migrated....=
 And migration is best effort in such case. We just map the system memory i=
n that range to gpu for such case. This will come up in the coming system a=
llocator patches...

This case was found during i915 test...

I also checked amd's code. They assume the same, just take a look of functi=
on svm_range_dma_map_dev.

agree that code is not nice. But I don't have a better way assuming above

>=20
>=20
> > +/**
> > + * xe_hmm_populate_range() - Populate physical pages of a virtual
> > + * address range
> > + *
> > + * @vma: vma has information of the range to populate. only vma
> > + * of userptr and hmmptr type can be populated.
> > + * @hmm_range: pointer to hmm_range struct. hmm_rang->hmm_pfns
> > + * will hold the populated pfns.
> > + * @write: populate pages with write permission
> > + *
> > + * This function populate the physical pages of a virtual
> > + * address range. The populated physical pages is saved in
> > + * userptr's sg table. It is similar to get_user_pages but call
> > + * hmm_range_fault.
> > + *
> > + * This function also read mmu notifier sequence # (
> > + * mmu_interval_read_begin), for the purpose of later
> > + * comparison (through mmu_interval_read_retry).
> > + *
> > + * This must be called with mmap read or write lock held.
> > + *
> > + * This function allocates the storage of the userptr sg table.
> > + * It is caller's responsibility to free it calling sg_free_table.
>=20
> I'd add a helper to free the sg_free_table & unmap the dma pages if
> needed.

Ok, due to the reason I explained above, there will be a little complicatio=
n. I will do it in a separate patch.
>=20
> > + *
> > + * returns: 0 for succuss; negative error no on failure
> > + */
> > +int xe_hmm_populate_range(struct xe_vma *vma, struct hmm_range
> *hmm_range,
> > +						bool write)
> > +{
>=20
> The layering is all wrong here, we shouldn't be touching struct xe_vma
> directly in hmm layer.

I have to admit we don't have a clear layering here. This function is suppo=
sed to be a shared function which will be used by both hmmptr and userptr.

Maybe you got an impression from my POC series that we don't have xe_vma in=
 system allocator codes. That was true. But after the design discussion, we=
 have decided to unify userptr code and hmmptr codes, so we will have xe_vm=
a also in system allocator code. Basically xe_vma will replace the xe_svm_r=
ange concept in my patch series.

Of course, per Thomas we can further optimize by splitting xe_vma into muta=
ble and unmutable... but that should be step 2.

>=20
> Pass in a populated hmm_range and sgt. Or alternatively pass in
> arguments and then populate a hmm_range locally.

Xe_vma is the input parameter here.

I will remove Hmm_range from function parameter and make it a local. I figu=
red I don't need this as an output anymore. All we need is already in sg ta=
ble.=20

>=20
> > +	unsigned long timeout =3D
> > +		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> > +	unsigned long *pfns, flags =3D HMM_PFN_REQ_FAULT;
> > +	struct xe_userptr_vma *userptr_vma;
> > +	struct xe_userptr *userptr;
> > +	u64 start =3D vma->gpuva.va.addr;
> > +	u64 end =3D start + vma->gpuva.va.range;
>=20
> We have helper - xe_vma_start and xe_vma_end but I think either of these
> are correct in this case.
>=20
> xe_vma_start is the address which this bound to the GPU, we want the
> userptr address.
>=20
> So I think it would be:
>=20
> start =3D xe_vma_userptr()
> end =3D xe_vma_userptr() + xe_vma_size()

You are correct. Will fix. I mixed this because, in system allocator, cpu a=
ddress always =3D=3D gpu address=20
>=20
>=20
> > +	struct xe_vm *vm =3D xe_vma_vm(vma);
> > +	u64 npages;
> > +	int ret;
> > +
> > +	userptr_vma =3D to_userptr_vma(vma);
> > +	userptr =3D &userptr_vma->userptr;
> > +	mmap_assert_locked(userptr->notifier.mm);
> > +
> > +	npages =3D ((end - 1) >> PAGE_SHIFT) - (start >> PAGE_SHIFT) + 1;
>=20
> This math is done above, if you need this math in next rev add a helper.


Will do.
>=20
> > +	pfns =3D kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> > +	if (unlikely(!pfns))
> > +		return -ENOMEM;
> > +
> > +	if (write)
> > +		flags |=3D HMM_PFN_REQ_WRITE;
> > +
> > +	memset64((u64 *)pfns, (u64)flags, npages);
>=20
> Why is this needed, can't we just set hmm_range->default_flags?

In this case, set default_flags also work.

This is some codes I inherited from Niranjana. Per my test before it works.

Basically there are two way to control the flags:
Default is the coarse grain way applying to all pfns
The way I am using here is a per pfn fine grained flag setting. It also wor=
ks.

>=20
> > +	hmm_range->hmm_pfns =3D pfns;
> > +	hmm_range->notifier_seq =3D mmu_interval_read_begin(&userptr-
> >notifier);
>=20
> We need a userptr->notifier =3D=3D userptr->notifier_seq check that just
> returns, right?

Yes this sequence number is used to decide whether we need to retry. See fu=
nction xe_pt_userptr_pre_commit
>=20
> > +	hmm_range->notifier =3D &userptr->notifier;
> > +	hmm_range->start =3D start;
> > +	hmm_range->end =3D end;
> > +	hmm_range->pfn_flags_mask =3D HMM_PFN_REQ_FAULT |
> HMM_PFN_REQ_WRITE;
>=20
> Is this needed? AMD and Nouveau do not set this argument.


As explained above. Amd and nouveau only use coarse grain setting

>=20
> > +	/**
> > +	 * FIXME:
> > +	 * Set the the dev_private_owner can prevent hmm_range_fault to fault
> > +	 * in the device private pages owned by caller. See function
> > +	 * hmm_vma_handle_pte. In multiple GPU case, this should be set to th=
e
> > +	 * device owner of the best migration destination. e.g., device0/vm0
> > +	 * has a page fault, but we have determined the best placement of
> > +	 * the fault address should be on device1, we should set below to
> > +	 * device1 instead of device0.
> > +	 */
> > +	hmm_range->dev_private_owner =3D vm->xe->drm.dev;
> > +
> > +	while (true) {
>=20
> mmap_read_lock(mm);
>=20
> > +		ret =3D hmm_range_fault(hmm_range);
>=20
> mmap_read_unlock(mm);


This need to be called in caller. The reason is, in the system allocator co=
de path, mmap lock is already hold before calling into this helper.

I will check patch 5 for this purpose.

>=20
> > +		if (time_after(jiffies, timeout))
> > +			break;
> > +
> > +		if (ret =3D=3D -EBUSY)
> > +			continue;
> > +		break;
> > +	}
> > +
> > +	if (ret)
> > +		goto free_pfns;
> > +
> > +	ret =3D build_sg(vm->xe, hmm_range, &userptr->sgt, write);
> > +	if (ret)
> > +		goto free_pfns;
> > +
> > +	mark_range_accessed(hmm_range, write);
> > +	userptr->sg =3D &userptr->sgt;
>=20
> Again this should be set in caller after this function return.

why we can't set it here? It is shared b/t userptr and hmmptr


>=20
> > +	userptr->notifier_seq =3D hmm_range->notifier_seq;
>=20
> This is could be a pass by reference I guess and set here.

Sorry, I don't understand this comment.

>=20
> > +
> > +free_pfns:
> > +	kvfree(pfns);
> > +	return ret;
> > +}
> > +
> > diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
> > new file mode 100644
> > index 000000000000..960f3f6d36ae
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_hmm.h
> > @@ -0,0 +1,12 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright =A9 2024 Intel Corporation
> > + */
> > +
> > +#include <linux/types.h>
> > +#include <linux/hmm.h>
> > +#include "xe_vm_types.h"
> > +#include "xe_svm.h"
>=20
> As per the previous patches no need to xe_*.h files, just forward
> declare any arguments.


Will do.

Oak
>=20
> Matt
>=20
> > +
> > +int xe_hmm_populate_range(struct xe_vma *vma, struct hmm_range
> *hmm_range,
> > +						bool write);
> > --
> > 2.26.3
> >
