Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30CAC54E67
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 21:31:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742A711258B;
	Fri, 15 Mar 2024 21:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a0yfeBc5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7592611258B
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 21:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710538306; x=1742074306;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5BlMkT14LwAHo4t66H8IW2f7jIxiagZKh0U83MTndCs=;
 b=a0yfeBc53Wul33FlaoVKyUlrcivlhSoG0qp7HjnfUYvvQnLW6Qbctris
 7vkisW27p+gVeR7kf21mKk38ApEUrLFHAJCcloCMhkmpNSqD5dgOfjNwh
 1IZ6aXv9wgJYKZvjNos19aELcGBSXV9nkJd6jB5sSuDz9ErwlSeaY1l6q
 5u1pdLqdK9kpttuDU7jkM0E2kze8cxACPHzKK/MAOBQsNEHKuA5cjCqXp
 4S+N88pxs1qzGz5wJFke1jV1JMpxYC+iAkzMGaIgxxv6SFMKmXi6AWwap
 qzLY1mac+VidonFxW6aHMkAeXlLQ08eIe5BoGb8OFCOBkmHkpWaRTf2Qj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="16076433"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="16076433"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 14:31:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="12727761"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 14:31:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 14:31:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 14:31:26 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 14:31:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTJJXTSWmkb9ijYDrf8iaD+qCWCbHrP4C72vUyz2jYhCZui8rZdWPHwSdJYjQ7xwqRxTCn8/m64mLk0jr2p7fmP7UtNslr/Hlr+alNKLpGUvFKQ4SoAFP2jIf/B7pSNz05dchtbK8b6mI7hbpTLJp8RMJAVal6v1ADqWluOfJlL9qsV2lGiSbjBc7kuUlBPG+dmRNdsyEdfMF7OQEHSebSNfH5jPQGLcBvUNF8Jga9yiYKOmMhbVPH4sALokSWv+5ZjtaW9wkdlYyz7BO6cOn2OV0lu5IKWgpb1urJq5CiUghx9CaPdCL1B21SmU/ioroI8WzihA1wRVGWYWOmqeaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hTt4HdIQ6ALfZb4lNRiVSdYbEdMAl6ock6SwZAAkP4=;
 b=TPUCKrSF7n05f4XQvcnNarFcjb/tW2vveAWNudXku5TqAtwx4/eLiPQ+6tJDUCdfPNzdV8oK53aZeDVQC9v+Jz0UhPDWb4IShlCPs7POeCcbD2JxzcOcG3RVUth/QAzJrrlvfg2y7KzSbFeIsDEVSHx5GLqk1auXzsDHP0+PzDvo9dgUrnIPyFHzXMSpbRkuP1voOuieEhclx2YHg3NPkCcSkYJIeS30ZuDdRHEPA7GvvaCccjqxM/kQcb3ZjXV2ehwuBjigr8LMvbL3jEqCmyLYnfX3RlOZrR+f4A6rHopvGfDMGyS+1cteRnN2uBqW+3k+xiToj2I4/1bQPcLkSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by CH3PR11MB7250.namprd11.prod.outlook.com (2603:10b6:610:149::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Fri, 15 Mar
 2024 21:31:24 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Fri, 15 Mar 2024
 21:31:24 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "Welty, Brian" <brian.welty@intel.com>, "Ghimiray, Himal
 Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH 1/5] drm/xe/svm: Remap and provide memmap backing for GPU
 vram
Thread-Topic: [PATCH 1/5] drm/xe/svm: Remap and provide memmap backing for GPU
 vram
Thread-Index: AQHadb8YemanJm4MK0iW0Qj9YyIrJ7E3e6GAgAAKcICAADCNgIAAbvWggAEgvACAAATdAA==
Date: Fri, 15 Mar 2024 21:31:24 +0000
Message-ID: <SA1PR11MB6991A38E8BD181BFA0C1701892282@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240314033553.1379444-1-oak.zeng@intel.com>
 <20240314033553.1379444-2-oak.zeng@intel.com>
 <ZfMxR/YHY/LP88KZ@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB6991042C806081949493087592292@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZfNiw+M8ClCaR9Xn@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB6991E3115AC96F4A6FF257A792282@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZfSyDEioCxXpJrTc@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZfSyDEioCxXpJrTc@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|CH3PR11MB7250:EE_
x-ms-office365-filtering-correlation-id: 6406f960-a1e1-451e-8ed1-08dc453743cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WXvf5YcJrBI+IANYSeJpyqGB/YuyVmMBOmUlUSqDiS8FX2eeGrJNWbcz3HSKGYtPz+19RlOAqgGApRDlQVDGKV7hxNB+LhRh9iJ//yGP2r22XHXhFk/IQ0ablHvOuFxdnNybKtWQcNDdmOvW3bTWN05ImCe8USjvPqWypRbOAzPHn5d9O6u0Mr2Fyixa8TV82j7R9f/a3P/5E0qO/1JNoaUe/DndkEkLyHJQoCT/o2fFjP5Q/mShqr0wpl18j+NP4XnlazBrI9UKUS0HjbDedgX6arBH4iEsTLptNeTrZOgXRGze4SNVTXeFuYlDOylJnjQe1fbtJ9atGMXM+qcPEEOQfzDaDHwKPIGrlGVY6kWmFGfIDiHy8NT9QJ3TgpwSOGiiB88QBb5CmRqAcCwT4QIxTqiIR99wnc6AUzoclDbmrIu1YLYpdUuhTMQotfZ67/9hWyeO5xejH0YMPPKB/IJokcePlCR32tcGu+y3+FbPLVxIZ4/5fN3f68hd9VMbMRtjaJs5be4MQPG/F3NKYX6lpg1bDgL1mSkkQ/IHWb3dEyxdvhz8dqI2ELLnnxZtylOzX/Kl1CvQywfvFEeSsYOHnydat4n72uN4vPWVW8j/VWBFmlYwqBntaVERJ99hiEnaSx2W5oZaMAzApS+3Aqu9Dx102r5OPu2fV08CsXU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tMGW8wI5lJHLYtNGYYdSi6GJF3TZDs6pIMUbmANVkvYij42+0H0WD4w66X?=
 =?iso-8859-1?Q?1yCa+2DwJAeQHhE+/8livmaOnqvcqTdn3egztyOYqiXAqEMivy3kHKzBPn?=
 =?iso-8859-1?Q?tC8NiJEfbmO1HpfN3D5JiLkRr/xV9TqhkOhDG9h9J0thKFZ27zuNwsI0SS?=
 =?iso-8859-1?Q?3X4zNEuJaTe8izzXjnbHy8MCbqp/5UpYuCHsrT0ghq1h5Htk2OO4fGZmGx?=
 =?iso-8859-1?Q?PCmWXbLMPGEea2/YQmqshD1Iy+4Neu14RDE+uAz19k4K9pGLfSzU8Hp8/m?=
 =?iso-8859-1?Q?c+4hAg4QLpP4vpYfFKoMUlggvK0oOq6Qf40GFb7PYrzpjCiJM+C13Y9cX9?=
 =?iso-8859-1?Q?a8EY5w3klikWHU22fEkoeaRFnQlNHJpsctzX5VqyIqQWK5Uu6FUj2rzf9m?=
 =?iso-8859-1?Q?wFJywHm8t8OgZn8kly7UFvLYzuO7SCmY9kLPj8aree0CJu5B7JwdKYBFOV?=
 =?iso-8859-1?Q?n6Nwp2Bo+0Fv5gSWi/KHkre/BPd3u3X9VOlwShhaoHoKlnZFpHN5Sa1jpx?=
 =?iso-8859-1?Q?r4S5J3A79Vg6EwwPmx4MCOMfMnjQFK2K4q2vcK05VnGUNJsRsQK8ThnvOM?=
 =?iso-8859-1?Q?mk27pwRoRbOGiU4rK/5b0r/KzEbjv/LvKlfOx73lHGcVElxsH+kVzIkYI6?=
 =?iso-8859-1?Q?XsY96Wm6c5HIXs203CcyZRnN9qhwsMYhrn0cfFXWOkm84qjazLz+zcbqV4?=
 =?iso-8859-1?Q?ybiZvtGE801Xt06EdI9C4I7hSChNuWwQ87rmSgIZzIUOFNU8vinETIP7wG?=
 =?iso-8859-1?Q?gfl42HzJyYtBB48FvSi8Gnl43sYVOW72xrnq2qVjnQuFi5WFb5lZKVwirI?=
 =?iso-8859-1?Q?cvN3RHD8vQbD5VPMpykCdBEFdAv61+aHAfIXvVoqlNg1R2FEQBjmAu4UP8?=
 =?iso-8859-1?Q?Hd3T8BnWE59LhgXpCvpzpeBfisijEB0/ZHQwytfu+wa4aeuwpnBTRdzqo3?=
 =?iso-8859-1?Q?IcvgM18jARpGhkzaA/tzqMhEzEuYYcrlghAPNqXe0QpWf32XgL6apbMNsQ?=
 =?iso-8859-1?Q?/Z9DzOHRZwWvVRdAvyc7CPsGQmZrPWeiSO6/UK5FF9tSmTYp+WliOkieqZ?=
 =?iso-8859-1?Q?7FfeW0hjqhyS+fVBdIdf8yOKVuwt0U4M/AkVUnxZ79HaULKXRxH54+coYT?=
 =?iso-8859-1?Q?r02izlVd42ziAsLkOEiCo7R0EUJVUSb7gV5ubmeNkiDxNLZdry0KCyRZMy?=
 =?iso-8859-1?Q?E2Ny6Ddf9/xEYit0oAaMYAnzNGS8aZO7WztcAmtfW68M2f1I1g0z+pURe2?=
 =?iso-8859-1?Q?CqQpvxURXK6svRATitCiS9KYS8ZPmgnvHLJlq00Pfhu/PQKkFh4qbUARH7?=
 =?iso-8859-1?Q?YFUS9/PHqI2Jm8JuVMJcjNobPAbBPSDDwsh1Xe0FlqiDRwdahhPpyrS49z?=
 =?iso-8859-1?Q?dRzyq22RKoP7SERkhIvyN8+ocSuPQkzH55j3ebo77JLp7QT9VwjWvjce3i?=
 =?iso-8859-1?Q?77+e5nzHtfjFQxwKgLkmIzxnHp6/sBox3mDX7/5fyK2oMVRa0OwYpiT/0K?=
 =?iso-8859-1?Q?ShCl2k1oskZWsgcGyzW8E78j0lFywfe5n8bzt0nHEyS24JbxcDy3M0dRqa?=
 =?iso-8859-1?Q?Oxn/cr8ExW20F7yazLQ2KTwNGhCGu+hw9/ABtdsHA6HoJK/fCvsiHZtCs6?=
 =?iso-8859-1?Q?nleLgP6zZE0SU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6406f960-a1e1-451e-8ed1-08dc453743cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2024 21:31:24.2636 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ej1qox/FzW9FU2FW1FverB4wPqG6YwLqZWqeqOx/oT2mPbZkKYd0upGDBQmGfNdRSDFEldgCGiuMP1I34CxuPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7250
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
> Sent: Friday, March 15, 2024 4:40 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Hellstrom, Thomas
> <thomas.hellstrom@intel.com>; airlied@gmail.com; Welty, Brian
> <brian.welty@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: Re: [PATCH 1/5] drm/xe/svm: Remap and provide memmap backing for
> GPU vram
>=20
> On Fri, Mar 15, 2024 at 10:00:06AM -0600, Zeng, Oak wrote:
> >
> >
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: Thursday, March 14, 2024 4:49 PM
> > > To: Zeng, Oak <oak.zeng@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org; Hellstrom, Thomas
> > > <thomas.hellstrom@intel.com>; airlied@gmail.com; Welty, Brian
> > > <brian.welty@intel.com>; Ghimiray, Himal Prasad
> > > <himal.prasad.ghimiray@intel.com>
> > > Subject: Re: [PATCH 1/5] drm/xe/svm: Remap and provide memmap backing
> for
> > > GPU vram
> > >
> > > On Thu, Mar 14, 2024 at 12:32:36PM -0600, Zeng, Oak wrote:
> > > > Hi Matt,
> > > >
> > > > > -----Original Message-----
> > > > > From: Brost, Matthew <matthew.brost@intel.com>
> > > > > Sent: Thursday, March 14, 2024 1:18 PM
> > > > > To: Zeng, Oak <oak.zeng@intel.com>
> > > > > Cc: intel-xe@lists.freedesktop.org; Hellstrom, Thomas
> > > > > <thomas.hellstrom@intel.com>; airlied@gmail.com; Welty, Brian
> > > > > <brian.welty@intel.com>; Ghimiray, Himal Prasad
> > > > > <himal.prasad.ghimiray@intel.com>
> > > > > Subject: Re: [PATCH 1/5] drm/xe/svm: Remap and provide memmap
> backing
> > > for
> > > > > GPU vram
> > > > >
> > > > > On Wed, Mar 13, 2024 at 11:35:49PM -0400, Oak Zeng wrote:
> > > > > > Memory remap GPU vram using devm_memremap_pages, so each
> GPU
> > > vram
> > > > > > page is backed by a struct page.
> > > > > >
> > > > > > Those struct pages are created to allow hmm migrate buffer b/t
> > > > > > GPU vram and CPU system memory using existing Linux migration
> > > > > > mechanism (i.e., migrating b/t CPU system memory and hard disk)=
.
> > > > > >
> > > > > > This is prepare work to enable svm (shared virtual memory) thro=
ugh
> > > > > > Linux kernel hmm framework. The memory remap's page map type is
> set
> > > > > > to MEMORY_DEVICE_PRIVATE for now. This means even though each
> GPU
> > > > > > vram page get a struct page and can be mapped in CPU page table=
,
> > > > > > but such pages are treated as GPU's private resource, so CPU ca=
n't
> > > > > > access them. If CPU access such page, a page fault is triggered
> > > > > > and page will be migrate to system memory.
> > > > > >
> > > > >
> > > > > Is this really true? We can map VRAM BOs to the CPU without havin=
g
> > > > > migarte back and forth. Admittedly I don't know the inner working=
s of
> > > > > how this works but in IGTs we do this all the time.
> > > > >
> > > > >   54         batch_bo =3D xe_bo_create(fd, vm, batch_size,
> > > > >   55                                 vram_if_possible(fd, 0),
> > > > >   56
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > > >   57         batch_map =3D xe_bo_map(fd, batch_bo, batch_size);
> > > > >
> > > > > The BO is created in VRAM and then mapped to the CPU.
> > > > >
> > > > > I don't think there is an expectation of coherence rather caching=
 mode
> > > > > and exclusive access of the memory based on synchronization.
> > > > >
> > > > > e.g.
> > > > > User write BB/data via CPU to GPU memory
> > > > > User calls exec
> > > > > GPU read / write memory
> > > > > User wait on sync indicating exec done
> > > > > User reads result
> > > > >
> > > > > All of this works without migration. Are we not planing supportin=
g flow
> > > > > with SVM?
> > > > >
> > > > > Afaik this migration dance really only needs to be done if the CP=
U and
> > > > > GPU are using atomics on a shared memory region and the GPU devic=
e
> > > > > doesn't support a coherent memory protocol (e.g. PVC).
> > > >
> > > > All you said is true. On many of our HW, CPU can actually access de=
vice
> memory,
> > > cache coherently or not.
> > > >
> > > > The problem is, this is not true for all GPU vendors. For example, =
on some
> HW
> > > from some vendor, CPU can only access partially of device memory. The=
 so
> called
> > > small bar concept.
> > > >
> > > > So when HMM is defined, such factors were considered, and
> > > MEMORY_DEVICE_PRIVATE is defined. With this definition, CPU can't acc=
ess
> > > device memory.
> > > >
> > > > So you can think it is a limitation of HMM.
> > > >
> > >
> > > Is it though? I see other type MEMORY_DEVICE_FS_DAX,
> > > MEMORY_DEVICE_GENERIC, and MEMORY_DEVICE_PCI_P2PDMA. From my
> > > limited
> > > understanding it looks to me like one of those modes would support my
> > > example.
> >
> >
> > No, above are for other purposes. HMM only support DEVICE_PRIVATE and
> DEVICE_COHERENT.
> >
> > >
> > > > Note this is only part 1 of our system allocator work. We do plan t=
o support
> > > DEVICE_COHERENT for our newer device, see below. With this option, we
> don't
> > > have unnecessary migration back and forth.
> > > >
> > > > You can think this is just work out all the code path. 90% of the d=
river code
> for
> > > DEVICE_PRIVATE and DEVICE_COHERENT will be same. Our real use of syst=
em
> > > allocator will be DEVICE_COHERENT mode. While DEVICE_PRIVATE mode
> allow us
> > > to exercise the code on old HW.
> > > >
> > > > Make sense?
> > > >
> > >
> > > I guess if we want the system allocator to always coherent, then yes =
you
> > > need this dynamic migration with faulting on either side.
> > >
> > > I was thinking the system allocator would be behave like my example
> > > above with madvise dictating the coherence rules.
> > >
> > > Maybe I missed this in system allocator design but my feeling is we
> > > shouldn't arbitrarily enforce coherence as that could lead to poor
> > > performance due to constant migration.
> >
> > System allocator itself doesn't enforce coherence. Coherence is built i=
n user
> programming model. So system allocator allow both GPU and CPU access syst=
em
> allocated pointers, but it doesn't necessarily guarantee the data accesse=
d from
> CPU/GPU is coherent. It is user program's responsibility to maintain data
> coherence.
> >
> > Data migration in driver is optional, depending on platform capability,=
 user
> preference, correctness and performance consideration. Driver internal da=
ta
> migration of course shouldn't break data coherence.
> >
> > Of course different vendor can have different data coherence scheme. Fo=
r
> example, it is completely designer's flexibility to build model that is H=
W automatic
> data coherence or software explicit data coherence. On our platform, we a=
llow
> user program to select different coherence mode by setting pat_index for =
gpu
> and cpu_caching mode for CPU. So we have completely give the flexibility =
to user
> program. Nothing of this contract is changed in system allocator design.
> >
> > Going back to the question of what memory type we should use to registe=
r our
> vram to core mm. HMM currently support two types: PRIVATE and COHERENT.
> The coherent type requires some HW and BIOS support which we don't have
> right now. So the only available is PRIVATE. We have not other option rig=
ht now.
> As said, we plan to support coherent type where we can avoid unnecessary =
data
> migration. But that is stage 2.
> >
>=20
> Thanks for the explaination. After reading your replies, the HMM doc,
> and looking at code this all makes sense.
>=20
> > >
> > > >
> > > > >
> > > > > > For GPU device which supports coherent memory protocol b/t CPU =
and
> > > > > > GPU (such as CXL and CAPI protocol), we can remap device memory=
 as
> > > > > > MEMORY_DEVICE_COHERENT. This is TBD.
> > > > > >
> > > > > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > > > > Co-developed-by: Niranjana Vishwanathapura
> > > > > <niranjana.vishwanathapura@intel.com>
> > > > > > Signed-off-by: Niranjana Vishwanathapura
> > > > > <niranjana.vishwanathapura@intel.com>
> > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > Cc: Thomas Hellstr=F6m <thomas.hellstrom@intel.com>
> > > > > > Cc: Brian Welty <brian.welty@intel.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/xe/Makefile          |  3 +-
> > > > > >  drivers/gpu/drm/xe/xe_device_types.h |  9 +++
> > > > > >  drivers/gpu/drm/xe/xe_mmio.c         |  8 +++
> > > > > >  drivers/gpu/drm/xe/xe_svm.h          | 14 +++++
> > > > > >  drivers/gpu/drm/xe/xe_svm_devmem.c   | 91
> > > > > ++++++++++++++++++++++++++++
> > > > > >  5 files changed, 124 insertions(+), 1 deletion(-)
> > > > > >  create mode 100644 drivers/gpu/drm/xe/xe_svm.h
> > > > > >  create mode 100644 drivers/gpu/drm/xe/xe_svm_devmem.c
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/Makefile
> b/drivers/gpu/drm/xe/Makefile
> > > > > > index c531210695db..840467080e59 100644
> > > > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > > > @@ -142,7 +142,8 @@ xe-y +=3D xe_bb.o \
> > > > > >  	xe_vram_freq.o \
> > > > > >  	xe_wait_user_fence.o \
> > > > > >  	xe_wa.o \
> > > > > > -	xe_wopcm.o
> > > > > > +	xe_wopcm.o \
> > > > > > +	xe_svm_devmem.o
> > > > >
> > > > > These should be in alphabetical order.
> > > >
> > > > Will fix
> > > > >
> > > > > >
> > > > > >  # graphics hardware monitoring (HWMON) support
> > > > > >  xe-$(CONFIG_HWMON) +=3D xe_hwmon.o
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > > > b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > > index 9785eef2e5a4..f27c3bee8ce7 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > > @@ -99,6 +99,15 @@ struct xe_mem_region {
> > > > > >  	resource_size_t actual_physical_size;
> > > > > >  	/** @mapping: pointer to VRAM mappable space */
> > > > > >  	void __iomem *mapping;
> > > > > > +	/** @pagemap: Used to remap device memory as ZONE_DEVICE
> */
> > > > > > +    struct dev_pagemap pagemap;
> > > > > > +    /**
> > > > > > +     * @hpa_base: base host physical address
> > > > > > +     *
> > > > > > +     * This is generated when remap device memory as ZONE_DEVI=
CE
> > > > > > +     */
> > > > > > +    resource_size_t hpa_base;
> > > > >
> > > > > Weird indentation. This goes for the entire series, look at check=
patch.
> > > >
> > > > Will fix
> > > > >
> > > > > > +
> > > > > >  };
> > > > > >
> > > > > >  /**
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> > > b/drivers/gpu/drm/xe/xe_mmio.c
> > > > > > index e3db3a178760..0d795394bc4c 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > > > > @@ -22,6 +22,7 @@
> > > > > >  #include "xe_module.h"
> > > > > >  #include "xe_sriov.h"
> > > > > >  #include "xe_tile.h"
> > > > > > +#include "xe_svm.h"
> > > > > >
> > > > > >  #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
> > > > > >  #define TILE_COUNT		REG_GENMASK(15, 8)
> > > > > > @@ -286,6 +287,7 @@ int xe_mmio_probe_vram(struct xe_device *xe=
)
> > > > > >  		}
> > > > > >
> > > > > >  		io_size -=3D min_t(u64, tile_size, io_size);
> > > > > > +		xe_svm_devm_add(tile, &tile->mem.vram);
> > > > >
> > > > > Do we want to do this probe for all devices with VRAM or only a s=
ubset?
> > > >
> > > > All
> > >
> > > Can you explain why?
> >
> > It is natural for me to add all device memory to hmm. In hmm design, de=
vice
> memory is used as a special swap out for system memory. I would ask why w=
e
> only want to add a subset of vram? By a subset, do you mean only vram of =
one
> tile instead of all tiles?
> >
>=20
> I think we talking about different things, my bad on wording in the
> original question.
>=20
> Let me ask again - should be calling xe_svm_devm_add on all *platforms*
> that have VRAM. i.e. Should we do this on PVC but not DG2?


Oh, I see. Good question. On i915, this feature was only tested on PVC. We =
don't have a plan to enable it on older platform than PVC.=20

Let me add a check here, only enabled it on platform newer than PVC

Oak=20

>=20
> Matt
>=20
> > Oak
> >
> >
> > >
> > > > >
> > > > > >  	}
> > > > > >
> > > > > >  	xe->mem.vram.actual_physical_size =3D total_size;
> > > > > > @@ -354,10 +356,16 @@ void xe_mmio_probe_tiles(struct xe_device
> *xe)
> > > > > >  static void mmio_fini(struct drm_device *drm, void *arg)
> > > > > >  {
> > > > > >  	struct xe_device *xe =3D arg;
> > > > > > +    struct xe_tile *tile;
> > > > > > +    u8 id;
> > > > > >
> > > > > >  	pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
> > > > > >  	if (xe->mem.vram.mapping)
> > > > > >  		iounmap(xe->mem.vram.mapping);
> > > > > > +
> > > > > > +	for_each_tile(tile, xe, id)
> > > > > > +		xe_svm_devm_remove(xe, &tile->mem.vram);
> > > > >
> > > > > This should probably be above existing code. Typical on fini to d=
o
> > > > > things in reverse order from init.
> > > >
> > > > Will fix
> > > > >
> > > > > > +
> > > > > >  }
> > > > > >
> > > > > >  static int xe_verify_lmem_ready(struct xe_device *xe)
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> b/drivers/gpu/drm/xe/xe_svm.h
> > > > > > new file mode 100644
> > > > > > index 000000000000..09f9afb0e7d4
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > > > > @@ -0,0 +1,14 @@
> > > > > > +// SPDX-License-Identifier: MIT
> > > > > > +/*
> > > > > > + * Copyright =A9 2023 Intel Corporation
> > > > >
> > > > > 2024?
> > > >
> > > > This patch was actually written 2023
> > > > >
> > > > > > + */
> > > > > > +
> > > > > > +#ifndef __XE_SVM_H
> > > > > > +#define __XE_SVM_H
> > > > > > +
> > > > > > +#include "xe_device_types.h"
> > > > >
> > > > > I don't think you need to include this. Rather just forward decl =
structs
> > > > > used here.
> > > >
> > > > Will fix
> > > > >
> > > > > e.g.
> > > > >
> > > > > struct xe_device;
> > > > > struct xe_mem_region;
> > > > > struct xe_tile;
> > > > >
> > > > > > +
> > > > > > +int xe_svm_devm_add(struct xe_tile *tile, struct xe_mem_region
> *mem);
> > > > > > +void xe_svm_devm_remove(struct xe_device *xe, struct
> xe_mem_region
> > > > > *mem);
> > > > >
> > > > > The arguments here are incongruent here. Typically we want these =
to
> > > > > match.
> > > >
> > > > Will fix
> > > > >
> > > > > > +
> > > > > > +#endif
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > > > b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > > >
> > > > > Incongruent between xe_svm.h and xe_svm_devmem.c.
> > > >
> > > > Did you mean mem vs mr? if yes, will fix
> > > >
> > > > Again these two
> > > > > should
> > > > > match.
> > > > >
> > > > > > new file mode 100644
> > > > > > index 000000000000..63b7a1961cc6
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > > > > @@ -0,0 +1,91 @@
> > > > > > +// SPDX-License-Identifier: MIT
> > > > > > +/*
> > > > > > + * Copyright =A9 2023 Intel Corporation
> > > > >
> > > > > 2024?
> > > > It is from 2023
> > > > >
> > > > > > + */
> > > > > > +
> > > > > > +#include <linux/mm_types.h>
> > > > > > +#include <linux/sched/mm.h>
> > > > > > +
> > > > > > +#include "xe_device_types.h"
> > > > > > +#include "xe_trace.h"
> > > > >
> > > > > xe_trace.h appears to be unused.
> > > >
> > > > Will fix
> > > > >
> > > > > > +#include "xe_svm.h"
> > > > > > +
> > > > > > +
> > > > > > +static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
> > > > > > +{
> > > > > > +	return 0;
> > > > > > +}
> > > > > > +
> > > > > > +static void xe_devm_page_free(struct page *page)
> > > > > > +{
> > > > > > +}
> > > > > > +
> > > > > > +static const struct dev_pagemap_ops xe_devm_pagemap_ops =3D {
> > > > > > +	.page_free =3D xe_devm_page_free,
> > > > > > +	.migrate_to_ram =3D xe_devm_migrate_to_ram,
> > > > > > +};
> > > > > > +
> > > > >
> > > > > Assume these are placeholders that will be populated later?
> > > >
> > > >
> > > > corrrect
> > > > >
> > > > > > +/**
> > > > > > + * xe_svm_devm_add: Remap and provide memmap backing for
> device
> > > > > memory
> > > > > > + * @tile: tile that the memory region blongs to
> > > > > > + * @mr: memory region to remap
> > > > > > + *
> > > > > > + * This remap device memory to host physical address space and=
 create
> > > > > > + * struct page to back device memory
> > > > > > + *
> > > > > > + * Return: 0 on success standard error code otherwise
> > > > > > + */
> > > > > > +int xe_svm_devm_add(struct xe_tile *tile, struct xe_mem_region=
 *mr)
> > > > >
> > > > > Here I see the xe_mem_region is from tile->mem.vram, wondering ra=
ther
> > > > > than using the tile->mem.vram we should use xe->mem.vram when
> enabling
> > > > > svm? Isn't the idea behind svm the entire memory is 1 view?
> > > >
> > > > Still need to use tile. The reason is, memory of different tile can=
 have
> different
> > > characteristics, such as latency. So we want to differentiate memory =
b/t tiles
> also
> > > in svm. I need to change below " mr->pagemap.owner =3D tile->xe->drm.=
dev ".
> the
> > > owner should also be tile. This is the way hmm differentiate memory o=
f
> different
> > > tile.
> > > >
> > > > With svm it is 1 view, from virtual address space perspective and f=
rom
> physical
> > > struct page perspective. You can think of all the tile's vram is stac=
ked together
> to
> > > form a unified view together with system memory. This doesn't prohibi=
t us
> from
> > > differentiate memory from different tile. This differentiation allow =
us to
> optimize
> > > performance, i.e., we can wisely place memory in specific tile. If we=
 don't
> > > differentiate, this is not possible.
> > > >
> > >
> > > Ok makes sense.
> > >
> > > Matt
> > >
> > > > >
> > > > > I suppose if we do that we also only use 1 TTM VRAM manager / bud=
dy
> > > > > allocator too. I thought I saw some patches flying around for tha=
t too.
> > > >
> > > > Ttm vram manager is not in the picture. We deliberately avoided it =
per
> previous
> > > discussion
> > > >
> > > > Yes same buddy allocator. It is in my previous POC:
> https://lore.kernel.org/dri-
> > > devel/20240117221223.18540-12-oak.zeng@intel.com/. I didn't put those
> patches
> > > in this series because I want to merge this small patches separately.
> > > > >
> > > > > > +{
> > > > > > +	struct device *dev =3D &to_pci_dev(tile->xe->drm.dev)->dev;
> > > > > > +	struct resource *res;
> > > > > > +	void *addr;
> > > > > > +	int ret;
> > > > > > +
> > > > > > +	res =3D devm_request_free_mem_region(dev, &iomem_resource,
> > > > > > +					   mr->usable_size);
> > > > > > +	if (IS_ERR(res)) {
> > > > > > +		ret =3D PTR_ERR(res);
> > > > > > +		return ret;
> > > > > > +	}
> > > > > > +
> > > > > > +	mr->pagemap.type =3D MEMORY_DEVICE_PRIVATE;
> > > > > > +	mr->pagemap.range.start =3D res->start;
> > > > > > +	mr->pagemap.range.end =3D res->end;
> > > > > > +	mr->pagemap.nr_range =3D 1;
> > > > > > +	mr->pagemap.ops =3D &xe_devm_pagemap_ops;
> > > > > > +	mr->pagemap.owner =3D tile->xe->drm.dev;
> > > > > > +	addr =3D devm_memremap_pages(dev, &mr->pagemap);
> > > > > > +	if (IS_ERR(addr)) {
> > > > > > +		devm_release_mem_region(dev, res->start,
> resource_size(res));
> > > > > > +		ret =3D PTR_ERR(addr);
> > > > > > +		drm_err(&tile->xe->drm, "Failed to remap tile %d
> memory,
> > > > > errno %d\n",
> > > > > > +				tile->id, ret);
> > > > > > +		return ret;
> > > > > > +	}
> > > > > > +	mr->hpa_base =3D res->start;
> > > > > > +
> > > > > > +	drm_info(&tile->xe->drm, "Added tile %d memory [%llx-%llx] to
> devm,
> > > > > remapped to %pr\n",
> > > > > > +			tile->id, mr->io_start, mr->io_start + mr-
> >usable_size,
> > > > > res);
> > > > > > +	return 0;
> > > > > > +}
> > > > > > +
> > > > > > +/**
> > > > > > + * xe_svm_devm_remove: Unmap device memory and free resources
> > > > > > + * @xe: xe device
> > > > > > + * @mr: memory region to remove
> > > > > > + */
> > > > > > +void xe_svm_devm_remove(struct xe_device *xe, struct
> xe_mem_region
> > > > > *mr)
> > > > > > +{
> > > > > > +	/*FIXME: below cause a kernel hange during moduel remove*/
> > > > > > +#if 0
> > > > > > +	struct device *dev =3D &to_pci_dev(xe->drm.dev)->dev;
> > > > > > +
> > > > > > +	if (mr->hpa_base) {
> > > > > > +		devm_memunmap_pages(dev, &mr->pagemap);
> > > > > > +		devm_release_mem_region(dev, mr-
> >pagemap.range.start,
> > > > > > +			mr->pagemap.range.end - mr-
> >pagemap.range.start +1);
> > > > > > +	}
> > > > > > +#endif
> > > > >
> > > > > This would need to be fixed too.
> > > >
> > > >
> > > > Yes...
> > > >
> > > > Oak
> > > > >
> > > > > Matt
> > > > >
> > > > > > +}
> > > > > > +
> > > > > > --
> > > > > > 2.26.3
> > > > > >
