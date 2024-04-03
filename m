Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF744C6FD1F
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 04:43:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4DF11242E;
	Wed,  3 Apr 2024 04:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XAWkk1LN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C5D11242E
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 04:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712119420; x=1743655420;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pUv5vguiwSa/Ei5PgXgzZIRI4opiTpqnYVfPJ468Xvc=;
 b=XAWkk1LNAJA592189PYJCwuS5cuSR3u1VaKUXBi77Z0qp/le7/kfLvFh
 v6OX9op/+v/fgAVZJ0pu6jZYjkK/pSVyYQMwpoQDIAPYzUKqw/M3ByNC6
 fIMzbiPOV6rMG0UKAZh6fxlTUgtHrAZ8k2yYr49Isw5H9vJncAvu7Rnf4
 /8E0oeMRtYCbsZGnVeUYjOVR3BscTN9DBrOR7r9U1lc1tWdT9tEYnXrrW
 KDZ7abYCfmBDFvqmth0gXa4YfA+WQr8DuE1rOvCStLp1m6AfM1ZP41JX1
 JV0pv/NWVx+sR89YpiyUdyeTlcFFf5mtZFYbzQTuE8cgy2UgEfyIAMtSf g==;
X-CSE-ConnectionGUID: 2aw2zpD9TnKKfTl7S+HHHA==
X-CSE-MsgGUID: Ft4CEXGkQJ6f+iirxz2lwg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29803832"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="29803832"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 21:43:39 -0700
X-CSE-ConnectionGUID: Ivi5e7j0Ri6rrDRHswbt/Q==
X-CSE-MsgGUID: uk7ACerjSl2VwgnAPwgSzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="23053336"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2024 21:43:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 21:43:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Apr 2024 21:43:39 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 21:43:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L1JF21liSytg8rm4AxQzpVvmMgwjyzOlZmT5t6DGsyvLzK1GAHBjIZCh6dMWWICfLIHmWHuYTweFeQtFaHVLNbOezNvd9TGcCF3WUqkD4PYefLUaXOTqpTN5OcGuGl00g9adNPSu1wUptln6xDZLeCFGXdEF7ec3vl/PwdzgVzXUc6fSGTRNm0rzv97uRqbyjXAv9zE6UeHQEUyE3RA5vbiocV7DmyposztloQG9p80U7yZid/y+uqd52RPYzDv7IJqsFi2i+c5m506hnW93TVT2hgwTyX6DWpOICRBGmryqDmkNpjsUjkNHbNxu2M+3lv8tLd4tNNPxAOmPE365ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uftVmjeIFwYVWCDziiaQviscRiKWNfFwTLd7MqVVJ2k=;
 b=FK3YFYm39v8yRsDVMlooaiuBU/x503iLihwwehief4OLMtHu7/xhmuh02RnSKQ40ErvXwxwO6TwHk0JWzxmMg2V6YKYtUvqj/Z5I92nlDIkkr0OOPeISoT4WqjAWSUzJg3K7ttm7Cxi2zh+mbWcPRJ22S6cmtrbqLZPqNDfUVGQ8z4TN4XCSiY0PAWgeMUJzUIqI4DnBERKK+sPlB9ADBLKbd4ffxpd3Acguf1kIxSvSu9/MOtt3+TmVKfAD6nfo3/JsW3Tw7hCBiiYO8LRMQNk1dC/dm9DtVYj+1b2YwpbD1M85RPPoZxIPcM3BX4VpoCVOyzDdzVQO2Biof4RBsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by CY5PR11MB6282.namprd11.prod.outlook.com (2603:10b6:930:22::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 3 Apr
 2024 04:43:36 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Wed, 3 Apr 2024
 04:43:36 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "Welty, Brian"
 <brian.welty@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH 1/3] drm/xe: Introduce helper to populate userptr
Thread-Topic: [PATCH 1/3] drm/xe: Introduce helper to populate userptr
Thread-Index: AQHafAsZ6xz4OouI4kapClQsVF6p6bFV7wqAgAAKhACAAAl4gIAABFyg
Date: Wed, 3 Apr 2024 04:43:36 +0000
Message-ID: <SA1PR11MB6991246DB8FA5458E5E88F48923D2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240322035520.2382600-1-oak.zeng@intel.com>
 <20240322035520.2382600-2-oak.zeng@intel.com>
 <ZgzHG+Qfqvb6ARlu@DUT025-TGLU.fm.intel.com>
 <PH7PR11MB7004585EB926742911DB627F923D2@PH7PR11MB7004.namprd11.prod.outlook.com>
 <ZgzX3yHr3thHMU7n@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZgzX3yHr3thHMU7n@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|CY5PR11MB6282:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wSPC8MK80rmI6s4/F+JcEKtSiXbIxOvlfRwP1+R6YRCmeFXLXeg5ncNbrBQH8YjBn5A3JYz10/BW3AQ7hL04Bi9ls03J3OSKm501DNNHwZzn7yr9JL/rsPwp0LZjzHWRTQ0ZLlxAhwlp6wcc3AFzeGhHaYAXm5+BXH8xwDT1k8vl1TYdA0q0tJPb/TdPBrMRp3BKWExe5uE2lMc6VBl3HHHN0W2IjN913zU0I9MNYZR0qEaVvGzbf2RVdhCQ2cuZZoBZ0bCUpZH4jSKtB6AnciNAq448XnUKbS4lTaFxu5/XRgm5j9k8+YUUdhie9jPd1gNg+gNZfEtlx6+bMrlgyKD3Bl+g0YnZ9xzAziKnwMjRnPv6YwkhLHWroAJq1OoxIlZgsj9rgp6EkE93vKOdVrlfc73Z+9MP6x2GfioJQaCQ5RRJ1Tqoedh4A5rljBdwy1uT2vrS4rnriNZ6erANsZEcOLz+NGxQCN2+IlV4xuwNRAzEIuVWdwX0joFCYHH+qnYJbBb7P43X24cLgsw2uYqzSgzxGUfDlX/i6Fxw9Rfxc1cKH2dmmcG+v/hMvDYBQTnvmduloK8CL3bHQH9PsjI95nl9I96+sI/aHdQ0omCnoO5T7qIv+5iMj92vVTtElI+0gPqaahl8S/vz8Xbny9ncyTy/hORBymqv1D2ckyk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?pNKI1FVcHea5xM+bIMjolo4WY09Z1TtZgvXA/p+3jEWnUHLdPHQ7pVjGZV?=
 =?iso-8859-1?Q?mseSB2cdZYP/ZEMMbwjzT/SiqzPIsJPxVF3UWXVIg7XWYxSw0BSjc0k3yv?=
 =?iso-8859-1?Q?TZNxF3t/CaX2T1c90Z9Fw88sE6UrTPN8P5nvT7DWG8TX51bQDH5lcJ+sxS?=
 =?iso-8859-1?Q?yFkRutDQ1mRXsx0RzB1au2f2W6pTcK04ithP9MOrOzvdG1QiqOmfc+tJlI?=
 =?iso-8859-1?Q?vqWrIxjyzohwIxOIrvbu1RF2uz8sxYDUT40GG1A4kpeEv42xSyg7oHhruz?=
 =?iso-8859-1?Q?ZUaaQ8Y0yAgE8Z9kXFJXgCVEoDKHxKlYsFlRR33K25heXfzd1xiJPlbcxn?=
 =?iso-8859-1?Q?l2YKZ880ZLaqFmEcNssgOn3j8vekHpsnHxTNPka/EbDzrpXLkEiMUpEbun?=
 =?iso-8859-1?Q?Pst3jfoT35wRseeHMMTjQ7yVUL7v4jpOmfMEljErjSxs+dJe6xYnj7s0Zc?=
 =?iso-8859-1?Q?xec0479rKQgJt4VCiXzi17AkkfxnoFAmqdf9JZz5OhyIE0vZqNGsDGMlkC?=
 =?iso-8859-1?Q?98NZ81hplrwyznbrizhH2QqzdhGjbrpuryhXdnsjAr4mxE6skwrSvnLhhS?=
 =?iso-8859-1?Q?Y0fM1AUQrc9Hd2Bifkfwy5zFhAeop2SN0xTDPLMdvzCGMA7Fh66JkVc7z6?=
 =?iso-8859-1?Q?vryaEXHUEgk8O9hF/15BPpu3D9C1e/GCgcH08qqANxd9gWTUWmqwI1Me9L?=
 =?iso-8859-1?Q?I0Q7P1JtPlr/0N9oleUbzgQ/ovROFutiho0lmRAUCh2fDZdJAoRXwklLaF?=
 =?iso-8859-1?Q?CmQmTS+y6xestqdWsi6nRwbFBAbpZII9oDfjXt52AHnCiIj73f6ZNF2/DH?=
 =?iso-8859-1?Q?EHiRUO3PUL+f/ptuCdXbLBm4/hiiyYCB2FVFQLl5TbmXbKqKrbtpPKzDYL?=
 =?iso-8859-1?Q?n0kRREvy8B8JwHKNJZowDNqNrMBj7To/0QWvVX4DpY7Lw6RgUuWwgoxAP8?=
 =?iso-8859-1?Q?mmO7WLvDuajPcfmbk5Iyf1O6mo2TfRzoDE9niOnJyb5fQwrIL5gyzdw5fa?=
 =?iso-8859-1?Q?eQsKUfrMe+6O683LsR+jLPUOdXNOCaQMcNRjMOhv8rnZEIbbwhCj3xYb1H?=
 =?iso-8859-1?Q?nQxCrkIP4fjl22zeo9mjWKl8dvHERhqjE5ud6dfF+zbHnmrwNWfpdGvDmu?=
 =?iso-8859-1?Q?VFf4iUklLudE2ewiPMQ9XFbepLZzyaAjRiu/pZr+9n73/gW5JnnnLnpJ0D?=
 =?iso-8859-1?Q?8V8mz1KcVYu1Drk+qYeERvHVLZLg8jNL17if7Rm1ntVPeHz1jSzasZ6T4a?=
 =?iso-8859-1?Q?IvfB7ZBKEhTBW5YB0xjfVKNiwFW24432KXG+r16lLxiwVIDDQ6NWGWPSVS?=
 =?iso-8859-1?Q?A1sT0Tb9+t3rrLkIVQWR5MjreS8Be5eeOauNWFELYJT7vyU6yUm2yMZvzk?=
 =?iso-8859-1?Q?nx9FNC4GCdr1E8ETfoa+w1lJxReGe5VXkts40U4aslE8G9V5SBEgRClyC+?=
 =?iso-8859-1?Q?31kLrF8AiK+KZXcuGpaLPz3BoHYTE+r2f5SWXW3a6yO5Wyx2zCdSONC/7U?=
 =?iso-8859-1?Q?exTV4Qq8sC+QEQJ3+kmvpT+Ow0vE3Oyy2bUaKcK9q0OCBkZF6IwB2e8cyN?=
 =?iso-8859-1?Q?sCWSUgixywOwLYht2ZFpQoTBDbMcuP/V8UjjYwFzd32bOO14pw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dee5a322-6b0d-4b8d-66a3-08dc53989fe2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2024 04:43:36.1753 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2/Bfl/A2i2RPF0XQJuHBvUpxV83OyWZ7lwluF0ObK5yb8OunFgJNlNeKWrtwxST8eA82MXMdGl4rWakLhnXGAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6282
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
> Sent: Wednesday, April 3, 2024 12:15 AM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Hellstrom, Thomas
> <thomas.hellstrom@intel.com>; Welty, Brian <brian.welty@intel.com>; Ghimi=
ray,
> Himal Prasad <himal.prasad.ghimiray@intel.com>
> Subject: Re: [PATCH 1/3] drm/xe: Introduce helper to populate userptr
>=20
> On Tue, Apr 02, 2024 at 09:54:50PM -0600, Zeng, Oak wrote:
> > Hi Matt,
> >
> > For the comments to the static function, I prefer to keep it. It always=
 helpful to
> have a comments.
> >
> > I agree most of the comments, except the mmap lock one. See inline
> >
> > Also answered a question.
> >
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: Tuesday, April 2, 2024 11:04 PM
> > > To: Zeng, Oak <oak.zeng@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org; Hellstrom, Thomas
> > > <thomas.hellstrom@intel.com>; Welty, Brian <brian.welty@intel.com>;
> Ghimiray,
> > > Himal Prasad <himal.prasad.ghimiray@intel.com>
> > > Subject: Re: [PATCH 1/3] drm/xe: Introduce helper to populate userptr
> > >
> > > On Thu, Mar 21, 2024 at 11:55:18PM -0400, Oak Zeng wrote:
> > > > Introduce a helper function xe_userptr_populate_range to populate
> > > > a a userptr range. This functions calls hmm_range_fault to read
> > > > CPU page tables and populate all pfns/pages of this virtual address
> > > > range.
> > > >
> > > > If the populated page is system memory page, dma-mapping is perform=
ed
> > > > to get a dma-address which can be used later for GPU to access page=
s.
> > > >
> > > > If the populated page is device private page, we calculate the dpa =
(
> > > > device physical address) of the page. This will be handled in futur=
e
> > > > patches.
> > > >
> > > > The dma-address or dpa is then saved in userptr's sg table. This is
> > > > prepare work to replace the get_user_pages_fast code in userptr cod=
e
> > > > path.
> > > >
> > > > v1: Address review comments:
> > > >     separate a npage_in_range function (Matt)
> > > >     reparameterize function xe_userptr_populate_range function (Mat=
t)
> > > >     move mmu_interval_read_begin() call into while loop (Thomas)
> > > >     s/mark_range_accessed/xe_mark_range_accessed (Thomas)
> > > >     use set_page_dirty_lock (vs set_page_dirty) (Thomas)
> > > >     move a few checking in xe_vma_userptr_pin_pages to hmm.c (Matt)
> > > > v2: Remove device private page support. Only support system
> > > >     pages for now. use dma-map-sg rather than dma-map-page
> (Matt/Thomas)
> > > >
> > > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > > Co-developed-by: Niranjana Vishwanathapura
> > > <niranjana.vishwanathapura@intel.com>
> > > > Signed-off-by: Niranjana Vishwanathapura
> > > <niranjana.vishwanathapura@intel.com>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Thomas Hellstr=F6m <thomas.hellstrom@intel.com>
> > > > Cc: Brian Welty <brian.welty@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/Kconfig  |   1 +
> > > >  drivers/gpu/drm/xe/Makefile |   2 +
> > > >  drivers/gpu/drm/xe/xe_hmm.c | 224
> > > ++++++++++++++++++++++++++++++++++++
> > > >  drivers/gpu/drm/xe/xe_hmm.h |  17 +++
> > > >  4 files changed, 244 insertions(+)
> > > >  create mode 100644 drivers/gpu/drm/xe/xe_hmm.c
> > > >  create mode 100644 drivers/gpu/drm/xe/xe_hmm.h
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfi=
g
> > > > index 1a556d087e63..449a1ecbc92a 100644
> > > > --- a/drivers/gpu/drm/xe/Kconfig
> > > > +++ b/drivers/gpu/drm/xe/Kconfig
> > > > @@ -41,6 +41,7 @@ config DRM_XE
> > > >  	select MMU_NOTIFIER
> > > >  	select WANT_DEV_COREDUMP
> > > >  	select AUXILIARY_BUS
> > > > +	select HMM_MIRROR
> > > >  	help
> > > >  	  Experimental driver for Intel Xe series GPUs
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makef=
ile
> > > > index 3c3e67885559..a805a543056d 100644
> > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > @@ -145,6 +145,8 @@ xe-y +=3D xe_bb.o \
> > > >  	xe_wa.o \
> > > >  	xe_wopcm.o
> > > >
> > > > +xe-$(CONFIG_HMM_MIRROR) +=3D xe_hmm.o
> > > > +
> > > >  # graphics hardware monitoring (HWMON) support
> > > >  xe-$(CONFIG_HWMON) +=3D xe_hwmon.o
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_hmm.c
> b/drivers/gpu/drm/xe/xe_hmm.c
> > > > new file mode 100644
> > > > index 000000000000..4011207630a5
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_hmm.c
> > > > @@ -0,0 +1,224 @@
> > > > +// SPDX-License-Identifier: MIT
> > > > +/*
> > > > + * Copyright =A9 2024 Intel Corporation
> > > > + */
> > > > +
> > > > +#include <linux/mmu_notifier.h>
> > > > +#include <linux/dma-mapping.h>
> > > > +#include <linux/memremap.h>
> > > > +#include <linux/swap.h>
> > > > +#include <linux/hmm.h>
> > > > +#include <linux/mm.h>
> > > > +#include "xe_hmm.h"
> > > > +#include "xe_vm.h"
> > > > +#include "xe_bo.h"
> > > > +
> > > > +static u64 xe_npages_in_range(unsigned long start, unsigned long e=
nd)
> > > > +{
> > > > +	return (PAGE_ALIGN(end) - PAGE_ALIGN_DOWN(start)) >> PAGE_SHIFT;
> > >
> > > Nit: start and end should always be page aligned.
> > >
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_mark_range_accessed() - mark a range is accessed, so core mm
> > > > + * have such information for memory eviction or write back to
> > > > + * hard disk
> > > > + *
> > > > + * @range: the range to mark
> > > > + * @write: if write to this range, we mark pages in this range
> > > > + * as dirty
> > > > + */
> > >
> > > Doesn't hurt but kernel doc is not required for static functions.
> > >
> > > > +static void xe_mark_range_accessed(struct hmm_range *range, bool
> write)
> > > > +{
> > > > +	struct page *page;
> > > > +	u64 i, npages;
> > > > +
> > > > +	npages =3D xe_npages_in_range(range->start, range->end);
> > > > +	for (i =3D 0; i < npages; i++) {
> > > > +		page =3D hmm_pfn_to_page(range->hmm_pfns[i]);
> > > > +		if (write)
> > > > +			set_page_dirty_lock(page);
> > > > +
> > > > +		mark_page_accessed(page);
> > > > +	}
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_build_sg() - build a scatter gather table for all the physic=
al pages/pfn
> > > > + * in a hmm_range. dma-map pages if necessary. dma-address is save=
 in sg
> > > table
> > > > + * and will be used to program GPU page table later.
> > > > + *
> > > > + * @xe: the xe device who will access the dma-address in sg table
> > > > + * @range: the hmm range that we build the sg table from. range-
> > > >hmm_pfns[]
> > > > + * has the pfn numbers of pages that back up this hmm address rang=
e.
> > > > + * @st: pointer to the sg table.
> > > > + * @write: whether we write to this range. This decides dma map di=
rection
> > > > + * for system pages. If write we map it bi-diretional; otherwise
> > > > + * DMA_TO_DEVICE
> > > > + *
> > > > + * All the contiguous pfns will be collapsed into one entry in
> > > > + * the scatter gather table. This is for the purpose of efficientl=
y
> > > > + * programming GPU page table.
> > > > + *
> > > > + * The dma_address in the sg table will later be used by GPU to
> > > > + * access memory. So if the memory is system memory, we need to
> > > > + * do a dma-mapping so it can be accessed by GPU/DMA.
> > > > + *
> > > > + * FIXME: This function currently only support pages in system
> > > > + * memory. If the memory is GPU local memory (of the GPU who
> > > > + * is going to access memory), we need gpu dpa (device physical
> > > > + * address), and there is no need of dma-mapping. This is TBD.
> > > > + *
> > > > + * FIXME: dma-mapping for peer gpu device to access remote gpu's
> > > > + * memory. Add this when you support p2p
> > > > + *
> > > > + * This function allocates the storage of the sg table. It is
> > > > + * caller's responsibility to free it calling sg_free_table.
> > > > + *
> > > > + * Returns 0 if successful; -ENOMEM if fails to allocate memory
> > > > + */
> > >
> > > Kinda verbose given a static function but guess that is ok.
> > >
> > > > +static int xe_build_sg(struct xe_device *xe, struct hmm_range *ran=
ge,
> > > > +			     struct sg_table *st, bool write)
> > >
> > > Weird indentation, use look at checkpatch.
> > >
> > > > +{
> > > > +	struct device *dev =3D xe->drm.dev;
> > > > +	struct page **pages;
> > > > +	u64 i, npages;
> > > > +	int ret;
> > > > +
> > > > +	npages =3D xe_npages_in_range(range->start, range->end);
> > > > +	pages =3D kvmalloc_array(npages, sizeof(*pages), GFP_KERNEL);
> > > > +	if (!pages)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	for (i =3D 0; i < npages; i++) {
> > > > +		pages[i] =3D hmm_pfn_to_page(range->hmm_pfns[i]);
> > > > +		xe_assert(xe, !is_device_private_page(pages[i]));
> > > > +	}
> > > > +
> > > > +	ret =3D sg_alloc_table_from_pages_segment(st, pages, npages, 0,
> > > > +			npages << PAGE_SHIFT, xe_sg_segment_size(dev),
> > > GFP_KERNEL);
> > >
> > > Weird indentation here too.
> > >
> > >
> > >
> > > > +	if (ret)
> > > > +		goto free_pages;
> > > > +
> > > > +	ret =3D dma_map_sgtable(dev, st, write ? DMA_BIDIRECTIONAL :
> > > DMA_TO_DEVICE,
> > > > +			DMA_ATTR_SKIP_CPU_SYNC |
> > > DMA_ATTR_NO_KERNEL_MAPPING);
> > > > +
> > > > +free_pages:
> > >
> > > The SG table isn't free'd if dma_map_sgtable fails.
> > >
> > > > +	kvfree(pages);
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_userptr_populate_range() - Populate physical pages of a virt=
ual
> > > > + * address range
> > > > + *
> > > > + * @uvma: userptr vma which has information of the range to popula=
te.
> > > > + *
> > > > + * This function populate the physical pages of a virtual
> > > > + * address range. The populated physical pages is saved in
> > > > + * userptr's sg table. It is similar to get_user_pages but call
> > > > + * hmm_range_fault.
> > > > + *
> > > > + * This function also read mmu notifier sequence # (
> > > > + * mmu_interval_read_begin), for the purpose of later
> > > > + * comparison (through mmu_interval_read_retry).
> > > > + *
> > > > + * This must be called with mmap read or write lock held.
> > > > + *
> > > > + * This function allocates the storage of the userptr sg table.
> > > > + * It is caller's responsibility to free it calling sg_free_table.
> > > > + *
> > > > + * returns: 0 for succuss; negative error no on failure
> > > > + */
> > > > +int xe_userptr_populate_range(struct xe_userptr_vma *uvma)
> > >
> > > See my comments about arguments in previous rev. Still would raather
> > > have this layer accept arguments from xe_userptr_vma rather than that
> > > struct but can live with xe_userptr_vma as an argument I suppose.
> > >
> > > But s/xe_userptr_populate_range/xe_hmm_userptr_populate_range/ given
> > > that this is file xe_hmm.c - exported functions should try to have th=
e
> > > 'xe_hmm' prefix.
> > >
> > > > +{
> > > > +	unsigned long timeout =3D
> > > > +		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> > > > +	unsigned long *pfns, flags =3D HMM_PFN_REQ_FAULT;
> > > > +	struct xe_userptr *userptr;
> > > > +	struct xe_vma *vma =3D &uvma->vma;
> > > > +	u64 start =3D xe_vma_userptr(vma);
> > > > +	u64 end =3D start + xe_vma_size(vma);
> > > > +	struct xe_vm *vm =3D xe_vma_vm(vma);
> > > > +	struct hmm_range hmm_range;
> > > > +	bool write =3D !xe_vma_read_only(vma);
> > > > +	bool in_kthread =3D !current->mm;
> > > > +	unsigned long notifier_seq;
> > > > +	u64 npages;
> > > > +	int ret;
> > > > +
> > > > +	userptr =3D &uvma->userptr;
> > > > +	mmap_assert_locked(userptr->notifier.mm);
> > >
> > > See my comments about locking in an eariler rev, while it may be true
> > > the system allocator code has to call this function with mmap locked =
it
> > > certainly non-system allocator code does not.
> >
> > In the original non-system allocator codes, the mmap lock is just embed=
ded in
> the get_user_page function. So they do have mmap lock.
> >
>=20
> Yes, so that aligns with grabbing / releasing the lock directly before /
> after hmm_range_fault. General a good practice hold a lock for a little
> period of time as possible. This especially is true for a widly used
> lock like mmap lock.
>=20
> > Or do you see a problem to ask caller to hold mmap lock? This scheme is
> suggested by hmm design document. It works for both userptr and hmmptr. I
> don't see an obvious problem.
> >
>=20
> Not a problem, just see above. For non-system allocator code the lock
> only needs to held around the hmm_range_fault call. This lock might need
> to held longer in the system allocator prevent races between a CPU fault
> and a GPU fault. If that is needed, see my suggestion about a locked
> version or argument for this function.

Yes for system allocator we need to hold mmap lock for migration. It looks =
like this:

Mmap lock
Migration
Populate range
Mmap unlock


I have no objection to introduce a bool lock argument to this function

Oak

>=20
> Matt
>=20
> > Oak
> >
> >
> >
> >  I'd rather move the mmap
> > > lock around the hmm_range_fault call for now. If the system allocator
> > > needs to hold mmap, probably add locked argument (or *_locked) functi=
on
> > > with the proper lockdep asserts / do not take mmap lock around
> > > hmm_range_fault.
> > >
> > > > +
> > > > +	if (vma->gpuva.flags & XE_VMA_DESTROYED)
> > > > +		return 0;
> > > > +
> > > > +	notifier_seq =3D mmu_interval_read_begin(&userptr->notifier);
> > > > +	if (notifier_seq =3D=3D userptr->notifier_seq)
> > > > +		return 0;
> > > > +
> > > > +	npages =3D xe_npages_in_range(start, end);
> > > > +	pfns =3D kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
> > > > +	if (unlikely(!pfns))
> > > > +		return -ENOMEM;
> > > > +
> > > > +	if (write)
> > > > +		flags |=3D HMM_PFN_REQ_WRITE;
> > > > +
> > > > +	if (in_kthread) {
> > > > +		if (!mmget_not_zero(userptr->notifier.mm)) {
> > > > +			ret =3D -EFAULT;
> > > > +			goto free_pfns;
> > > > +		}
> > > > +		kthread_use_mm(userptr->notifier.mm);
> > >
> > > I think this can actually be dropped as hmm_range_fault takes the
> > > notifier (and the MM) as an argument. Do you want to test this out?
> > >
> > > If we can drop kthread_use_mm, we blindly (no kthread test) probably
> > > just call mmget_not_zero.
> > >
> > > > +	}
> > > > +
> > > > +	memset64((u64 *)pfns, (u64)flags, npages);
> > >
> > > See my comment in an ealier rev about using default flags. Still vali=
d.
> > >
> > > > +	hmm_range.hmm_pfns =3D pfns;
> > > > +	hmm_range.notifier =3D &userptr->notifier;
> > > > +	hmm_range.start =3D start;
> > > > +	hmm_range.end =3D end;
> > > > +	hmm_range.pfn_flags_mask =3D HMM_PFN_REQ_FAULT |
> > > HMM_PFN_REQ_WRITE;
> > > > +	/**
> > > > +	 * FIXME:
> > > > +	 * Set the dev_private_owner can prevent hmm_range_fault to fault
> > > > +	 * in the device private pages owned by caller. See function
> > > > +	 * hmm_vma_handle_pte. In multiple GPU case, this should be set t=
o the
> > > > +	 * device owner of the best migration destination. e.g., device0/=
vm0
> > > > +	 * has a page fault, but we have determined the best placement of
> > > > +	 * the fault address should be on device1, we should set below to
> > > > +	 * device1 instead of device0.
> > > > +	 */
> > >
> > > I'd drop this FIXME, I prefer not to predict the future in comments.
> > >
> > > > +	hmm_range.dev_private_owner =3D vm->xe;
> > > > +
> > >
> > > Longterm, probably a helper to derive private owner. Likely just
> > > something like:
> > >
> > > xe_dev_private_owner(xe)
> > > 	return xe
> > >
> > > But it help avoid bugs setting the private owner to the wrong value i=
n
> > > various places.
> > >
> > > > +	while (true) {
> > > > +		hmm_range.notifier_seq =3D mmu_interval_read_begin(&userptr-
> > > >notifier);
> > >
> > > We set hmm_range.notifier_seq above... maybe set this after if (ret =
=3D=3D-
> EBUSY)
> > >
> > > Again see my comment about locking.
> > >
> > > > +		ret =3D hmm_range_fault(&hmm_range);
> > > > +		if (time_after(jiffies, timeout))
> > > > +			break;
> > >
> > > Maybe also move this under the if (ret =3D=3D-EBUSY) logic too.
> > >
> > > > +
> > > > +		if (ret =3D=3D -EBUSY)
> > > > +			continue;
> > > > +		break;
> > > > +	}
> > > > +
> > > > +	if (in_kthread) {
> > > > +		kthread_unuse_mm(userptr->notifier.mm);
> > > > +		mmput(userptr->notifier.mm);
> > >
> > > See comment above about kthread_unuse_mm.
> > >
> > > > +	}
> > > > +
> > > > +	if (ret)
> > > > +		goto free_pfns;
> > > > +
> > > > +	ret =3D xe_build_sg(vm->xe, &hmm_range, &userptr->sgt, write);
> > > > +	if (ret)
> > > > +		goto free_pfns;
> > > > +
> > > > +	xe_mark_range_accessed(&hmm_range, write);
> > > > +	userptr->sg =3D &userptr->sgt;
> > > > +	userptr->notifier_seq =3D hmm_range.notifier_seq;
> > > > +
> > > > +free_pfns:
> > > > +	kvfree(pfns);
> > > > +	return ret;
> > > > +}
> > > > +
> > > > diff --git a/drivers/gpu/drm/xe/xe_hmm.h
> b/drivers/gpu/drm/xe/xe_hmm.h
> > > > new file mode 100644
> > > > index 000000000000..91686a751711
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_hmm.h
> > > > @@ -0,0 +1,17 @@
> > > > +// SPDX-License-Identifier: MIT
> > > > +/*
> > > > + * Copyright =A9 2024 Intel Corporation
> > > > + */
> > > > +
> > > > +#include <linux/types.h>
> > > > +
> > > > +struct xe_userptr_vma;
> > > > +
> > > > +#if IS_ENABLED(CONFIG_HMM_MIRROR)
> > >
> > > Do we need this? Don't we just require CONFIG_HMM_MIRROR to build our
> > > driver?
> >
> > Yes we need this. Our driver/userptr should build even if HMM_MIRROR is
> disabled. I had a build error without this.
> >
> > Oak
> >
> >
> > >
> > > Matt
> > >
> > > > +int xe_userptr_populate_range(struct xe_userptr_vma *uvma);
> > > > +#else
> > > > +static inline int xe_userptr_populate_range(struct xe_userptr_vma =
*uvma)
> > > > +{
> > > > +	return -ENODEV;
> > > > +}
> > > > +#endif
> > > > --
> > > > 2.26.3
> > > >
