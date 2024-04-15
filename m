Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91AFC04FF9
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 20:14:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C45F10EC2E;
	Mon, 15 Apr 2024 20:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="izIYzb9s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FB510EC2E
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 20:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713212041; x=1744748041;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2zQfF2rUsICJlyW5iavLORqMPqI7vmwMPVXyKBCzfK0=;
 b=izIYzb9szABRdrqEuMEtONGZYL+MQ5cTqEjXAJR1RpOpkzftkdBmS/mR
 x2N4KH1k6etvTBi6AVmzOqXBSyc8t4HfBW2xmZSGsKEMt8QMOpUiRcHKS
 3M589TZRoMuXQjQJXyyvexNw6sGrq3ynop419tbRf0CwZFQXgP/PsTorR
 4Xsa23WBeBaej5L9jd0luMhHUP2qkf+KmNFftVNs2HKk0YK2IWgU36Nn4
 bv/urAUszf/jf6PVUp4CrIWR30oTLyK6AjvrPth5OvIjInlw+UccdSirW
 ILgvg2taLQou+M/lq5zkPWMxA+TeMqugTvUMqa6A9v0+5Hdu8OOdEd4zT Q==;
X-CSE-ConnectionGUID: V8c5j8xWQsaIRXcT6Q94Pw==
X-CSE-MsgGUID: 5NoZvHRPT+espnZrhVuGZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19772650"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="19772650"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 13:14:00 -0700
X-CSE-ConnectionGUID: s8YvkzzvSYKtRMUG/mHJnQ==
X-CSE-MsgGUID: dTmvprx0QBGvmmZlj1KXOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="26685686"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Apr 2024 13:13:59 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 13:13:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 13:13:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 13:13:58 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 13:13:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UXAtSCO/m74y8JCncU+j5tidUk+olmnB1ATGWBvRnXPbbGWUOjdfLUJyYaLmHZFM0IaxsiYugO0aKhK6e7SuMsVE4JncACa2YxVLNkfC3Bo6I9Ld2q/Lw0TirIovYe+VJ1OT2tKQRnu6aRNWujtzLqNJ5xS20HWIW5fgZ1Xb/NdsFOiiDq81266Aym1orDlCl9S82EGLmdZPeDTNiHsT9hTwmu1yFtI4y0BmQlUCo8vetQ5oRO4nvYTA6h6DrxXNTpPTGxyJkzYNwRMm9jt5aeYlIiREnunQjIaN3cD3dSgHqGozPb610MZMQnU3efQlihl/wJSolALUeyPbi1Y2Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lo9kVG7pSHU+M1m+wL36xW7BzvXjD5+kzebeZTC6s7s=;
 b=hdnKwF2jjIsP7EsynN16+hy72wEuSmcLz9ptcwjkPd6zFxh9eG536jWMvO8zLdYSa43ORcSTLIucfV8lqLZ4GBRImSyg7JCv0athzjEv+Vk5nSpBZJm/VzOj9klsh6PMPaGZhiqX7Lga1lL0oqznrewZq5NRRDtHOMoIk8n4rBawWAEEJxH2bQklLn93YUmGtEuE6UCM9Qhw3BpSXmxjrQRj2VQkkQYMNUqYmuhTxkzDlZ5ma3j/KiVyRSIApWC6XUEYHa6pFDn1eSvO49mh9hh9u9C8OLEMMf+nrTDIG2ERLwBBiAByanT1TmWxl7M7c7altGCkSq2ARBDYaugzig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by PH8PR11MB6756.namprd11.prod.outlook.com (2603:10b6:510:1cb::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 15 Apr
 2024 20:13:56 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Mon, 15 Apr 2024
 20:13:56 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Thomas.Hellstrom@linux.intel.com"
 <Thomas.Hellstrom@linux.intel.com>, "Welty, Brian" <brian.welty@intel.com>
Subject: RE: [v2 22/31] drm/xe/svm: implement functions to allocate and free
 device memory
Thread-Topic: [v2 22/31] drm/xe/svm: implement functions to allocate and free
 device memory
Thread-Index: AQHairldo1MA+p2em0G7f3zr/kPtirFiFhSAgAexwkA=
Date: Mon, 15 Apr 2024 20:13:55 +0000
Message-ID: <SA1PR11MB6991E536947CCFDBEDD9722D92092@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-23-oak.zeng@intel.com>
 <ZhcRdy+QnvrA+sye@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZhcRdy+QnvrA+sye@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|PH8PR11MB6756:EE_
x-ms-office365-filtering-correlation-id: 51aee5c7-629f-46d1-63fb-08dc5d889407
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CA+xLGDxJtF4mxmj5p7lMPcfE9rn1f4WyzAXC2xyIbkrTfVPoRl/Rl+AjnvBpuGxRuoEAF4ad+URWyyNzBuWxuDmZf25n9s/JRzCgtZIdefm/AX4WrCGMO1u4ZsReLsiVMIG43JV/+abKuDihHAV/UpTqEqaYou9QEB6dwsVeZqkynyD/6ZvqBNs1ZMpoghnoSL412hJk7CNdIgMQu4B5QkTUE74mKaPuKjk0+oH+ej3nmE8jDg33HpguZgXw1oLh2TRdLWxXW+STSJqrrlkZKo3Elg106pwXJTUlXEPvrADJ6SksE+ayVeohZtsSnP/YCSyrKttTVpNfVEZLUwpPj2/UYX7JhhlhydwAtJHyPXGqVMbZbsibQkWKPVuwfyrvYNuPrHOQhEeErOT2PZUfbNq+c0eKi+27ItBMZazSOSoR+7RpSjx1l3JyxFX1GOWp99vYq1c+7mVeM2Kb6uxyZ9xRLyCRcpQP7MxZ19eRYYnOfhXeeVYHtRc1zUry54rPcxk3capQnX+HHBcetl2x8FAtVfowdCWgCtSAMEfvQ+wU+wjm31+nt/cfHCwjMbHT3eSK0oVz81QkNyNXRrRUWOqaLy46hRCeLbJt2TVBkjA0jX5+kOMjhWpjyTXP86gZe5UEiuX9sO4c5oaIGVon0iGR0L7X1o9Ur/xU7pZr8C5Kghg2CFMVu8K30DTyNR6Q6gL/bCUIOkoSXqKk5oRMw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?5MkpgYLuYxPAsZdjnxwDDqHys95y0rXQ4zdWJbQHbKtahP0KJZ2CzuxyDD?=
 =?iso-8859-1?Q?oEWpsTtRwvBIskSVEq5+04ol8mUbHGbP1n3OUgGjVyQ49JMKLllgn5aOYe?=
 =?iso-8859-1?Q?rUu22jXSOjMjE6WdXEnqYQ8RrQazDKShqdXREef13cQD2kvQCxGlnmfFbd?=
 =?iso-8859-1?Q?yHiVCFo87AR+ercZGpf+aUHhWNJemnhoRSGOjkbdEjJEtTB++2xb1azV8Q?=
 =?iso-8859-1?Q?Vlue3/cVMI0co0WfkHiXWEHZ6elNXCSp7WaaQ8FcQ/mtP6YJdlhOKyYr9s?=
 =?iso-8859-1?Q?3Gu5SVylFk1trIa51lobF4QRNYOzHhjw2FwRKQNiXLEh2xbLPPqxFOaTvH?=
 =?iso-8859-1?Q?w/X7TZ3vZ+IqqfdkWHzgYnBKemsK8JO7eZXTeq7Lnf3TdWzvrDUusu1iHF?=
 =?iso-8859-1?Q?LB+TiKvfwEaOeSMS6L6OrNlYXh5ZGDX4oob/3+4i0MmhT0RAAhvNSnxwsJ?=
 =?iso-8859-1?Q?A2638qh9RPmHW+Lmc2WIndIsV7g0fOBMla+9hv/vQ0IOL8gaol309PZ0h9?=
 =?iso-8859-1?Q?dWqT+MBkzOPLKFCwUskBVjoVhTxlwW/xSL+YMjDh19qv1FexLput31yG2m?=
 =?iso-8859-1?Q?bIR2U0aciWNdFgyaRCUvMjO42yrBN+GE/y7tMOXAv9WMWXnXAvYMA+6rqn?=
 =?iso-8859-1?Q?Nz86yCI1sACras2pk4Skkk7Jt+YIxt3Go1EmV7Kpj5qakdie3YqWnXD8vQ?=
 =?iso-8859-1?Q?7jULFV6MKaNg2FbRgwNBrFhpfdyuz6Zj95qW86QtBzTP+7rDgWTY8tCrt5?=
 =?iso-8859-1?Q?cvrintAMlQT1nHW++tXF9gx+ONR+aVVRcm/nQmWiqqU7anw3gTeE7uBg4Z?=
 =?iso-8859-1?Q?NBHbF9W2XghELzL2sUbeqh+jI8FPpsypXYT3XJHAFafFjRZcO2LLeu6KnR?=
 =?iso-8859-1?Q?GGjVGq+R7ecqafL0n1fFnIYWwfhMpu/eSRT1ZkeFvc2lqccGBlsZxXDdoU?=
 =?iso-8859-1?Q?eFgNdlFJYhZjq+D9IooY0IuPtKpvBC5BHlU6PNTZcbOr9m/stBQkpt3z2y?=
 =?iso-8859-1?Q?wkrGp1QaHMmoyFCszvAeKK/WTfgOTqE6mgM4me0Vx/nZ6VLur1cio3VYGW?=
 =?iso-8859-1?Q?Otiujr8LICjseYGGgB4rEgLyIKaEVrLIv10cJTM3n1dsFEJQUyVm3zCvIp?=
 =?iso-8859-1?Q?6jrSLW11WxVJGEEnUx8g0j/8vVIidWbbxB7UYk2pJxS+xiBgTYndSQaoRv?=
 =?iso-8859-1?Q?HSLuyVj241KmpyoRzlJCDQqbz80f0Gd5ySROHv75CO6dymsoU+5fTR/MXT?=
 =?iso-8859-1?Q?55BtA3BS/n+erQR8mRfJflx5KKfW7/QZvQYfL2lyUcG8R7TuKtJS0J7sWK?=
 =?iso-8859-1?Q?f+HjQFPnhRrYWwnLKNieQks6+Yz2QNdYrY2cfkoAG72U61xtJgfIr1cI0J?=
 =?iso-8859-1?Q?Rr8UVSjSDTMW8brIyxk0ynafyYHuzgVYxjad5CNGQIANfx5qOOa6cVNYKV?=
 =?iso-8859-1?Q?0Wbz66MYkQa/llqr6GViUfhBrBVq2CxNfwdqjG/EfW9UGkOK6WCAVmbOHP?=
 =?iso-8859-1?Q?zNgGlZx8GZycA/atEQUgv4y/++rIyF+nu5/D7BhCONHpCsPD0LFvortAaw?=
 =?iso-8859-1?Q?ScxgElL8z2Lhik/gLEzbUNgMnAt7kyLSQhTDHiOR8H3+M6SvdYJQfpFSuH?=
 =?iso-8859-1?Q?c+PI583SnRI9w=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51aee5c7-629f-46d1-63fb-08dc5d889407
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2024 20:13:56.0129 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BZWaGv4jrY6TvlJ0mm7+aRcHbdiFG0Frza5LW3VHP7b5oxvP3iRrVoHL05jVqb72MjBL26p0TvImXTcUyr9uZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6756
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

Hi Matt,

> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Wednesday, April 10, 2024 6:24 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> <krishnaiah.bommu@intel.com>; Thomas.Hellstrom@linux.intel.com; Welty,
> Brian <brian.welty@intel.com>
> Subject: Re: [v2 22/31] drm/xe/svm: implement functions to allocate and f=
ree
> device memory
>=20
> On Tue, Apr 09, 2024 at 04:17:33PM -0400, Oak Zeng wrote:
> > Function xe_devm_alloc_pages allocate pages from drm buddy and perform
> > house keeping work for all the pages allocated, such as get a page
> > refcount, keep a bitmap of all pages to denote whether a page is in
> > use, put pages to a drm lru list for eviction purpose.
> >
> > Function xe_devm_free_blocks return list of memory blocks to drm buddy
> > allocator.
> >
> > Function xe_devm_free_page is a call back function from hmm layer. It
> > is called whenever a page's refcount reaches to 1. This function clears
> > the bit of this page in the bitmap. If all the bits in the bitmap is
> > cleared, it means all the pages have been freed, we return all the page=
s
> > in this memory block back to drm buddy.
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
> >  drivers/gpu/drm/xe/xe_svm.h        |   7 ++
> >  drivers/gpu/drm/xe/xe_svm_devmem.c | 147
> ++++++++++++++++++++++++++++-
>=20
> See comments about file in previous patches, they apply here too.
>=20
> >  2 files changed, 152 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > index 624c1581f8ba..92a3ee90d5a7 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -46,4 +46,11 @@ static inline struct xe_mem_region
> *xe_page_to_mem_region(struct page *page)
> >  	return container_of(page->pgmap, struct xe_mem_region, pagemap);
> >  }
> >
> > +int xe_devm_alloc_pages(struct xe_tile *tile,
> > +						unsigned long npages,
> > +						struct list_head *blocks,
> > +						unsigned long *pfn);
> > +
> > +void xe_devm_free_blocks(struct list_head *blocks);
> > +void xe_devm_page_free(struct page *page);
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c
> b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > index 31af56e8285a..5ba0cd9a70b0 100644
> > --- a/drivers/gpu/drm/xe/xe_svm_devmem.c
> > +++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > @@ -5,18 +5,161 @@
> >
> >  #include <linux/mm_types.h>
> >  #include <linux/sched/mm.h>
> > -
> > +#include <linux/gfp.h>
> > +#include <linux/migrate.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/dma-fence.h>
> > +#include <linux/bitops.h>
> > +#include <linux/bitmap.h>
> > +#include <drm/drm_buddy.h>
> >  #include "xe_device_types.h"
> >  #include "xe_svm.h"
> > +#include "xe_migrate.h"
> > +#include "xe_ttm_vram_mgr_types.h"
> > +#include "xe_assert.h"
> >
> > +/**
> > + * struct xe_svm_block_meta - svm uses this data structure to manage e=
ach
> > + * block allocated from drm buddy. This will be set to the
> drm_buddy_block's
> > + * private field.
> > + *
> > + * @lru: used to link this block to drm's lru lists. This will be repl=
ace
> > + * with struct drm_lru_entity later.
> > + * @tile: tile from which we allocated this block
> > + * @bitmap: A bitmap of each page in this block. 1 means this page is =
used,
> > + * 0 means this page is idle. When all bits of this block are 0, it is=
 time
> > + * to return this block to drm buddy subsystem.
> > + */
> > +struct xe_svm_block_meta {
> > +	struct list_head lru;
> > +	struct xe_tile *tile;
> > +	unsigned long bitmap[];
> > +};
>=20
> This looks not needed to me but admittedly haven't looked at the LRU stuf=
f.
>=20
> I am thinking roughly...
>=20
> - I think we drop all this special tracking (kill xe_svm_block_meta)
> - Have functions to allocate / free the buddy blocks, store buddy blocks =
in
> userptr
> - Blocks are allocated before migration to VRAM
> - Blocks can be freed on either CPU fault after migration or on VMA
>   destroy (probably depends on madvive hints for VMA where we free
>   blocks)
> - Blocks allocated / freed at ia chunk (xe_vma in this code) granularity
>   (conceptually the same if we switch to 1 to N ratio between xe_vma &
>   pt_state)
> - block->private =3D=3D memory region so we can get pfn from block
> - When we need migrate_pfns we loop over buddy blocks populating
> migrate.dst

I thought into your scheme. The free of device memory is not completely con=
trolled by driver. Core mm can call back to driver to free a device memory =
page. The xe_devm_page_free in this series is a callback function registere=
d to core mm. this is why in above data structure I have to have a bitmap. =
This bitmap is used to mark which page is freed, when all pages in a buddy =
block are freed, it is time to free the whole buddy block.

In your scheme, we allocate/free at xe_vma granularity. So I imagine you wo=
uld have a list of buddy blocks in usrptr, and free all blocks in the list =
when every pages in all blocks are freed. While my scheme free memory at th=
e buddy block granularity - I think it natural because the buddy free inter=
face is also block based.

You would eventually need to introduce a lru link to link each buddy block =
to a lru list when vram eviction come into picture.

So I just explained why above xe_svm_block_meta was introduced, such as why=
 the bitmap and lru field is necessary to me. if you drop this data structu=
re, they will have to show up in another way.

>=20
> Also I noticed the drm_buddy_* calls in this file are not protected by a
> lock, we will need that. Currently it is tile->mem.vram_mgr->lock in the
> VRAM mgr code, we either need to reach into there or move this lock to
> common place so the VRAM manager and block allocations for SVM don't
> race with each other.
>=20

Yes, the lock has to be added. Thanks for pointing this out. Maybe move the=
 tile->mem.vram_mgr->lock to the xe_tile level so it can be shared b/t BO-d=
river and system allocator?

Oak

> Matt
>=20
> >
> >  static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
> >  {
> >  	return 0;
> >  }
> >
> > -static void xe_devm_page_free(struct page *page)
> > +static u64 block_offset_to_pfn(struct xe_mem_region *mr, u64 offset)
> > +{
> > +	/** DRM buddy's block offset is 0-based*/
> > +	offset +=3D mr->hpa_base;
> > +
> > +	return PHYS_PFN(offset);
> > +}
> > +
> > +/** FIXME: we locked page by calling zone_device_page_init
> > + *  in xe_devm_alloc_pages. Should we unlock pages here?
> > + */
> > +static void free_block(struct drm_buddy_block *block)
> > +{
> > +	struct xe_svm_block_meta *meta =3D
> > +		(struct xe_svm_block_meta *)block->private;
> > +	struct xe_tile *tile  =3D meta->tile;
> > +	struct drm_buddy *mm =3D &tile->mem.vram_mgr->mm;
> > +
> > +	kfree(block->private);
> > +	drm_buddy_free_block(mm, block);
> > +}
> > +
> > +void xe_devm_page_free(struct page *page)
> > +{
> > +	struct drm_buddy_block *block =3D
> > +					(struct drm_buddy_block *)page-
> >zone_device_data;
> > +	struct xe_svm_block_meta *meta =3D
> > +					(struct xe_svm_block_meta *)block-
> >private;
> > +	struct xe_tile *tile  =3D meta->tile;
> > +	struct xe_mem_region *mr =3D &tile->mem.vram;
> > +	struct drm_buddy *mm =3D &tile->mem.vram_mgr->mm;
> > +	u64 size =3D drm_buddy_block_size(mm, block);
> > +	u64 pages_per_block =3D size >> PAGE_SHIFT;
> > +	u64 block_pfn_first =3D
> > +					block_offset_to_pfn(mr,
> drm_buddy_block_offset(block));
> > +	u64 page_pfn =3D page_to_pfn(page);
> > +	u64 i =3D page_pfn - block_pfn_first;
> > +
> > +	xe_assert(tile->xe, i < pages_per_block);
> > +	clear_bit(i, meta->bitmap);
> > +	if (bitmap_empty(meta->bitmap, pages_per_block))
> > +		free_block(block);
> > +}
> > +
> > +/**
> > + * xe_devm_alloc_pages() - allocate device pages from buddy allocator
> > + *
> > + * @xe_tile: which tile to allocate device memory from
> > + * @npages: how many pages to allocate
> > + * @blocks: used to return the allocated blocks
> > + * @pfn: used to return the pfn of all allocated pages. Must be big en=
ough
> > + * to hold at @npages entries.
> > + *
> > + * This function allocate blocks of memory from drm buddy allocator, a=
nd
> > + * performs initialization work: set struct page::zone_device_data to =
point
> > + * to the memory block; set/initialize drm_buddy_block::private field;
> > + * lock_page for each page allocated; add memory block to lru managers=
 lru
> > + * list - this is TBD.
> > + *
> > + * return: 0 on success
> > + * error code otherwise
> > + */
> > +int xe_devm_alloc_pages(struct xe_tile *tile,
> > +						unsigned long npages,
> > +						struct list_head *blocks,
> > +						unsigned long *pfn)
> > +{
> > +	struct drm_buddy *mm =3D &tile->mem.vram_mgr->mm;
> > +	struct drm_buddy_block *block, *tmp;
> > +	u64 size =3D npages << PAGE_SHIFT;
> > +	int ret =3D 0, i, j =3D 0;
> > +
> > +	ret =3D drm_buddy_alloc_blocks(mm, 0, mm->size, size, PAGE_SIZE,
> > +						blocks,
> DRM_BUDDY_TOPDOWN_ALLOCATION);
> > +
> > +	if (unlikely(ret))
> > +		return ret;
> > +
> > +	list_for_each_entry_safe(block, tmp, blocks, link) {
> > +		struct xe_mem_region *mr =3D &tile->mem.vram;
> > +		u64 block_pfn_first, pages_per_block;
> > +		struct xe_svm_block_meta *meta;
> > +		u32 meta_size;
> > +
> > +		size =3D drm_buddy_block_size(mm, block);
> > +		pages_per_block =3D size >> PAGE_SHIFT;
> > +		meta_size =3D BITS_TO_BYTES(pages_per_block) +
> > +					sizeof(struct xe_svm_block_meta);
> > +		meta =3D kzalloc(meta_size, GFP_KERNEL);
> > +		bitmap_fill(meta->bitmap, pages_per_block);
> > +		meta->tile =3D tile;
> > +		block->private =3D meta;
> > +		block_pfn_first =3D
> > +					block_offset_to_pfn(mr,
> drm_buddy_block_offset(block));
> > +		for(i =3D 0; i < pages_per_block; i++) {
> > +			struct page *page;
> > +
> > +			pfn[j++] =3D block_pfn_first + i;
> > +			page =3D pfn_to_page(block_pfn_first + i);
> > +			/**Lock page per hmm requirement, see hmm.rst.*/
> > +			zone_device_page_init(page);
> > +			page->zone_device_data =3D block;
> > +		}
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +/**
> > + * xe_devm_free_blocks() - free all memory blocks
> > + *
> > + * @blocks: memory blocks list head
> > + */
> > +void xe_devm_free_blocks(struct list_head *blocks)
> >  {
> > +	struct drm_buddy_block *block, *tmp;
> > +
> > +	list_for_each_entry_safe(block, tmp, blocks, link)
> > +		free_block(block);
> >  }
> >
> >  static const struct dev_pagemap_ops xe_devm_pagemap_ops =3D {
> > --
> > 2.26.3
> >
