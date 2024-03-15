Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4392C54E58
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 16:00:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F33112321;
	Fri, 15 Mar 2024 16:00:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LecuuCwr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D4511231C
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 16:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710518443; x=1742054443;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2nHyOCAFY97FmVrLF7m2Wm9/ZPV7T5vIY1NsEiLortc=;
 b=LecuuCwrixND4+os/nme6z2AU/A4vFGDmdkSpOkpcn7Pcq73jk3VMm86
 U8jYc8ty1vuR8tzJhyLIeg3EqxHK9eLPbKLKABGEb55TX8fZS8NPq8Yla
 5Uz61YTB0d+0GsTWVYZ65+4r5OGdTESfoccyKzAx/FFkkpI0eTPVch1v6
 f/bB3lLPt90m6gLjSXbLQJSpG6gsjaCDXcS3rgYrAHJI9h7REbrdO7RGx
 004avKrgwadyRVGTCoz10zWZIG2hVgwopSA6C1WvMR1EI4JCBWbS4JsWe
 M4fzPrTrf782cP+pahNt5HjSiwNttxTC0v/HOzpfX0FACB+tIpPajKLEE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="16117510"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="16117510"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 09:00:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="17309286"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 09:00:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 09:00:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 09:00:10 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 09:00:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jvYSgvKCfZEiAJ7Dgzayc1MnHMqnHXj/3VsDCBliFBitVabD4dLbK99LpwcAT3SvuanXlqvXzsn66VDaXDoMy8ns9ldb+kkfqlAb5qKLH60IiJ2o+Fp23xspzjNhJA/AR2yDGI8noZyK4FEGS2fEY62eplxSS9abSXvnZgjpUG9FiPPYdhrsNNyJxYA5ZZcJU0WNsyB3wZAtZ5GKd+S63O6gC7T11VepkngkWR3qJbQymIizY/4a3P0ivYaGuR+VOuF2crVVy1wXu+Ck3yIhMvUiepJrmEipwMCbLpfwlor7t58stdpszS+R8o/7TNouH3JtaOhGvPnttj7FmgiRKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDDBCwoOjRtINsCuCf8Dxme+5rwaPXeH0Q1rD0L3Cso=;
 b=Qp7LEfZk9HLL7N5DgK1Ym7wy+X31S8Ajiowq2QmLiUcFtRO69cWUE4nWl15YMpsCLql+N/JwirmHceytvceIpKJM4jNRyeLR6WlZWb1YbW9TZfjQ/pOxbS1yJGws0Yw1nZW/swZ+dD0clX8AJuF8UNDVD8TDOtCSbXKoYcZyfqnxsMqxCBt7MzQIYZYn62bvNI6vHOPMMnidtG3bBwgX7xx8rVFTb6odt+rWjh1d0eMBYYGWJ4qArAIDqAWNn1qjzTAwWN4iX8YE8ONfrF2xGDUeYv3z0ADOPT4+4URW0Uk8udW5vG32Kbt8Rj2j53LTmkH5QRr+ptPBzFAXonz5lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Fri, 15 Mar
 2024 16:00:07 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Fri, 15 Mar 2024
 16:00:06 +0000
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
Thread-Index: AQHadb8YemanJm4MK0iW0Qj9YyIrJ7E3e6GAgAAKcICAADCNgIAAbvWg
Date: Fri, 15 Mar 2024 16:00:06 +0000
Message-ID: <SA1PR11MB6991E3115AC96F4A6FF257A792282@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240314033553.1379444-1-oak.zeng@intel.com>
 <20240314033553.1379444-2-oak.zeng@intel.com>
 <ZfMxR/YHY/LP88KZ@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB6991042C806081949493087592292@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZfNiw+M8ClCaR9Xn@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZfNiw+M8ClCaR9Xn@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|CH3PR11MB8443:EE_
x-ms-office365-filtering-correlation-id: 4ef1b824-8bda-49ea-7a93-08dc4508fbd4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K7PCAnlKqTnV9pnl384S31xxedvSkIVFv0jlaOcgNzWU21dEcKbzO70x4j34dxVrYvj1u8KZGCSW5QB3panh2Pql1X8qJBMX841NkWOrI96SGuN4uiT3C24cX/7vJna8wjNHrF4sQwZx4DptnMhbqD/SeIJNljl8TOCVAz80Sw4LnFxWqX1rVyT8KNYizzyWbGIP35cl3oV5+QvKrS7RYF5f2eFGbUaRKCN6e7hv4iHeK23wMajwLrHAuF3gqoC5GpvuEjyeLCP7gWDuCXXNiVRXMDS0vJ3jv82ltJ+WyDZIiTtJZMqSbAJXXgC1BvrAWwDbFsvXO+xD07K1J31HB2LVzD/vfl9dM8zTb+Zrkkw0q8ibq7eOUG9RGOni5HJczb5nlSCX04cVHA3I+2SAvg2HHt0+LbyULzLhpVRBJV0R8k9aSg6rshzpeR521p63U3MMl9elcR1ODj4E0RXkf/BIpsBu9XVohVIMgvnZ+qJ3v+fijQzSKVFhZ+JkiBEpwtFuyL4HXBZugn/EtFDAuMV9J8is5lbaTaO5SOgU4S3KSC0QjU/nXFXg3DmKTeFpGTgBO9jIAv9OUjNNe8E5lh1okNcp9ikEn0UlxutJyTrkudidngang18B2deAiwmgRcozh1kIEzLIUiwX7t0bJ4LvhTPBinKCDJU8LWEH4nI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?VWFpP1uz8mHcp22yNChasQVk/mOXVFoQTCttfsRCll8fES+bCfnuX0u169?=
 =?iso-8859-1?Q?+diI6txJsomBw6p0lfCujUtlTcL0Lj4jCHH7f3C25gpuqbD4ksopsfBSN0?=
 =?iso-8859-1?Q?bgYK+I1/Ij3/2SCz1egvMqBTjB/Gd4uXovB4VN9Nh5ZKUKgJ+x2ZSwNfza?=
 =?iso-8859-1?Q?745f3Wye9xycQq6OfzHPp2Ty5Mlp14dGPwh4kqT9UcbgoiwcL52CeoN0Qh?=
 =?iso-8859-1?Q?AWK4rH13IHsSqowCW+c/IlpbBtKUlvZeKMTa+NIcdJLoZbN/i/JffH2Eri?=
 =?iso-8859-1?Q?QrAKOTsYIQfY6U6ZXjcFMOxxH5S1g5YkUB9PFR/KNgbTN9og3E4MLU1qeq?=
 =?iso-8859-1?Q?kGOUs4w0B2ViNOxsak1fc18cfEV7kMJXR0A/1tnoH5gqJ03IyS+bQR4Fg3?=
 =?iso-8859-1?Q?0LNUDvhZLEojVqNXrQlaeKSXgeXPTmBo13+iOJfMtRybgxsFTE3EkQgZpc?=
 =?iso-8859-1?Q?fSql7K9Uq0N2ktsIcFW6OAEen81IaHNjb/eSQ1H55ChoVnSAnUR7j4cpsG?=
 =?iso-8859-1?Q?o5dtXa3/FT8NBrbArhgtkwUuqmD/ZXzg0MmYojXvpgSqROYrDCY0ajpqkF?=
 =?iso-8859-1?Q?wHs0NItoJ2DpZIBD3dUmrPheDtvpTS9LOoBh15867ynnyM4V1qdn/WKS+Z?=
 =?iso-8859-1?Q?6OwWJlymfGc3RrgnrUm3ZMNwmn0UPApwqT0lx/4axScWE4YvzO2Qy7M28k?=
 =?iso-8859-1?Q?T0jhh7oYwUQlnrJP+nnvCJYLqTFxkl/C+Ho1nU52xqSNzhQaSSp7sJcaYX?=
 =?iso-8859-1?Q?9YZ3mmkweBIu1DJpXshq8R+wEzU+UT13KKss9mfM4g9UvW+e1pnD+0s4bc?=
 =?iso-8859-1?Q?s3gUVgcy9Lc2yRkdTblp4qmbbjITimUYjfHcSDdtD4Mw3H2EGFgRUJ4jCY?=
 =?iso-8859-1?Q?ybJGSnQjZ1pf8mM47FK+nAGsi4FtnWsOBJIlBdpHlbdKm1/syUGIdieNwr?=
 =?iso-8859-1?Q?BSXky2XKwcJU/hWPru/d9Ox7lbuKu044BkohHuHhhm1tgFQ+SpgGBVyt3f?=
 =?iso-8859-1?Q?QsLkoXlXl9RHIckB9LugR7j3xgRIZWqA0nG/41dUqMni+7GiGVTaeghj7j?=
 =?iso-8859-1?Q?Dih+fr6r1fYZhUsfeeBut3N1RVq9Q2iHYiwQVa6bZbUm9XBOcEyZl99r8V?=
 =?iso-8859-1?Q?sT4EtIUKKhowmy7PldiN55kmRTkDGKkWfcAQgXMsa8+XLRL/BIlQkTu3k5?=
 =?iso-8859-1?Q?pj0zeI3VMc53ftGoE12862XSvKWeHnPcDyaCXg9V28qwJ6FG9OPRw6nU6D?=
 =?iso-8859-1?Q?jGkMOTMjYlGfj/niPn+XDJNip9LID3R3P7Fq36XsWknKpscDViVTL+KELm?=
 =?iso-8859-1?Q?0J1nfDidil4/RAQgWcIo+OBJmxvgsf2EZsUgrzyaakeJ0aOt151x74LO2f?=
 =?iso-8859-1?Q?dU3tlIE0MbgVo26Tf585hUw0jBYiQIF3e6SIKYhzL8wQQSbXr7/hornQpw?=
 =?iso-8859-1?Q?7XP2XoabVIAcdW951nnCvjynpa3CFAZt1BXmgq6q+WULiZxeA0/+eX0ULG?=
 =?iso-8859-1?Q?dXLAU95Y59uZJAQVM5k5rMqB5/R5TdfSTEh5nrwYjbT4fllMPlRLz2QPlV?=
 =?iso-8859-1?Q?dFQmLRWYVWsG9RbsusFvox9rlE0M558a0r+Eg+VYyMCW29TLeslsWEiE+N?=
 =?iso-8859-1?Q?rNZdVoZ/nfbrk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ef1b824-8bda-49ea-7a93-08dc4508fbd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2024 16:00:06.6097 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A11Hpliyohk3pi7DY5/rw+bLJrajHTL79JKVNOo7DP1HzlqrFQYu6Zj3EpV43jzeZIEoE2XCPzMS6sluNn27rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8443
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
> Sent: Thursday, March 14, 2024 4:49 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Hellstrom, Thomas
> <thomas.hellstrom@intel.com>; airlied@gmail.com; Welty, Brian
> <brian.welty@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: Re: [PATCH 1/5] drm/xe/svm: Remap and provide memmap backing for
> GPU vram
>=20
> On Thu, Mar 14, 2024 at 12:32:36PM -0600, Zeng, Oak wrote:
> > Hi Matt,
> >
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: Thursday, March 14, 2024 1:18 PM
> > > To: Zeng, Oak <oak.zeng@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org; Hellstrom, Thomas
> > > <thomas.hellstrom@intel.com>; airlied@gmail.com; Welty, Brian
> > > <brian.welty@intel.com>; Ghimiray, Himal Prasad
> > > <himal.prasad.ghimiray@intel.com>
> > > Subject: Re: [PATCH 1/5] drm/xe/svm: Remap and provide memmap backing
> for
> > > GPU vram
> > >
> > > On Wed, Mar 13, 2024 at 11:35:49PM -0400, Oak Zeng wrote:
> > > > Memory remap GPU vram using devm_memremap_pages, so each GPU
> vram
> > > > page is backed by a struct page.
> > > >
> > > > Those struct pages are created to allow hmm migrate buffer b/t
> > > > GPU vram and CPU system memory using existing Linux migration
> > > > mechanism (i.e., migrating b/t CPU system memory and hard disk).
> > > >
> > > > This is prepare work to enable svm (shared virtual memory) through
> > > > Linux kernel hmm framework. The memory remap's page map type is set
> > > > to MEMORY_DEVICE_PRIVATE for now. This means even though each GPU
> > > > vram page get a struct page and can be mapped in CPU page table,
> > > > but such pages are treated as GPU's private resource, so CPU can't
> > > > access them. If CPU access such page, a page fault is triggered
> > > > and page will be migrate to system memory.
> > > >
> > >
> > > Is this really true? We can map VRAM BOs to the CPU without having
> > > migarte back and forth. Admittedly I don't know the inner workings of
> > > how this works but in IGTs we do this all the time.
> > >
> > >   54         batch_bo =3D xe_bo_create(fd, vm, batch_size,
> > >   55                                 vram_if_possible(fd, 0),
> > >   56                                 DRM_XE_GEM_CREATE_FLAG_NEEDS_VIS=
IBLE_VRAM);
> > >   57         batch_map =3D xe_bo_map(fd, batch_bo, batch_size);
> > >
> > > The BO is created in VRAM and then mapped to the CPU.
> > >
> > > I don't think there is an expectation of coherence rather caching mod=
e
> > > and exclusive access of the memory based on synchronization.
> > >
> > > e.g.
> > > User write BB/data via CPU to GPU memory
> > > User calls exec
> > > GPU read / write memory
> > > User wait on sync indicating exec done
> > > User reads result
> > >
> > > All of this works without migration. Are we not planing supporting fl=
ow
> > > with SVM?
> > >
> > > Afaik this migration dance really only needs to be done if the CPU an=
d
> > > GPU are using atomics on a shared memory region and the GPU device
> > > doesn't support a coherent memory protocol (e.g. PVC).
> >
> > All you said is true. On many of our HW, CPU can actually access device=
 memory,
> cache coherently or not.
> >
> > The problem is, this is not true for all GPU vendors. For example, on s=
ome HW
> from some vendor, CPU can only access partially of device memory. The so =
called
> small bar concept.
> >
> > So when HMM is defined, such factors were considered, and
> MEMORY_DEVICE_PRIVATE is defined. With this definition, CPU can't access
> device memory.
> >
> > So you can think it is a limitation of HMM.
> >
>=20
> Is it though? I see other type MEMORY_DEVICE_FS_DAX,
> MEMORY_DEVICE_GENERIC, and MEMORY_DEVICE_PCI_P2PDMA. From my
> limited
> understanding it looks to me like one of those modes would support my
> example.


No, above are for other purposes. HMM only support DEVICE_PRIVATE and DEVIC=
E_COHERENT.

>=20
> > Note this is only part 1 of our system allocator work. We do plan to su=
pport
> DEVICE_COHERENT for our newer device, see below. With this option, we don=
't
> have unnecessary migration back and forth.
> >
> > You can think this is just work out all the code path. 90% of the drive=
r code for
> DEVICE_PRIVATE and DEVICE_COHERENT will be same. Our real use of system
> allocator will be DEVICE_COHERENT mode. While DEVICE_PRIVATE mode allow u=
s
> to exercise the code on old HW.
> >
> > Make sense?
> >
>=20
> I guess if we want the system allocator to always coherent, then yes you
> need this dynamic migration with faulting on either side.
>=20
> I was thinking the system allocator would be behave like my example
> above with madvise dictating the coherence rules.
>=20
> Maybe I missed this in system allocator design but my feeling is we
> shouldn't arbitrarily enforce coherence as that could lead to poor
> performance due to constant migration.

System allocator itself doesn't enforce coherence. Coherence is built in us=
er programming model. So system allocator allow both GPU and CPU access sys=
tem allocated pointers, but it doesn't necessarily guarantee the data acces=
sed from CPU/GPU is coherent. It is user program's responsibility to mainta=
in data coherence.

Data migration in driver is optional, depending on platform capability, use=
r preference, correctness and performance consideration. Driver internal da=
ta migration of course shouldn't break data coherence.=20

Of course different vendor can have different data coherence scheme. For ex=
ample, it is completely designer's flexibility to build model that is HW au=
tomatic data coherence or software explicit data coherence. On our platform=
, we allow user program to select different coherence mode by setting pat_i=
ndex for gpu and cpu_caching mode for CPU. So we have completely give the f=
lexibility to user program. Nothing of this contract is changed in system a=
llocator design.=20

Going back to the question of what memory type we should use to register ou=
r vram to core mm. HMM currently support two types: PRIVATE and COHERENT. T=
he coherent type requires some HW and BIOS support which we don't have righ=
t now. So the only available is PRIVATE. We have not other option right now=
. As said, we plan to support coherent type where we can avoid unnecessary =
data migration. But that is stage 2.

>=20
> >
> > >
> > > > For GPU device which supports coherent memory protocol b/t CPU and
> > > > GPU (such as CXL and CAPI protocol), we can remap device memory as
> > > > MEMORY_DEVICE_COHERENT. This is TBD.
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
> > > >  drivers/gpu/drm/xe/Makefile          |  3 +-
> > > >  drivers/gpu/drm/xe/xe_device_types.h |  9 +++
> > > >  drivers/gpu/drm/xe/xe_mmio.c         |  8 +++
> > > >  drivers/gpu/drm/xe/xe_svm.h          | 14 +++++
> > > >  drivers/gpu/drm/xe/xe_svm_devmem.c   | 91
> > > ++++++++++++++++++++++++++++
> > > >  5 files changed, 124 insertions(+), 1 deletion(-)
> > > >  create mode 100644 drivers/gpu/drm/xe/xe_svm.h
> > > >  create mode 100644 drivers/gpu/drm/xe/xe_svm_devmem.c
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makef=
ile
> > > > index c531210695db..840467080e59 100644
> > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > @@ -142,7 +142,8 @@ xe-y +=3D xe_bb.o \
> > > >  	xe_vram_freq.o \
> > > >  	xe_wait_user_fence.o \
> > > >  	xe_wa.o \
> > > > -	xe_wopcm.o
> > > > +	xe_wopcm.o \
> > > > +	xe_svm_devmem.o
> > >
> > > These should be in alphabetical order.
> >
> > Will fix
> > >
> > > >
> > > >  # graphics hardware monitoring (HWMON) support
> > > >  xe-$(CONFIG_HWMON) +=3D xe_hwmon.o
> > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > b/drivers/gpu/drm/xe/xe_device_types.h
> > > > index 9785eef2e5a4..f27c3bee8ce7 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > @@ -99,6 +99,15 @@ struct xe_mem_region {
> > > >  	resource_size_t actual_physical_size;
> > > >  	/** @mapping: pointer to VRAM mappable space */
> > > >  	void __iomem *mapping;
> > > > +	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
> > > > +    struct dev_pagemap pagemap;
> > > > +    /**
> > > > +     * @hpa_base: base host physical address
> > > > +     *
> > > > +     * This is generated when remap device memory as ZONE_DEVICE
> > > > +     */
> > > > +    resource_size_t hpa_base;
> > >
> > > Weird indentation. This goes for the entire series, look at checkpatc=
h.
> >
> > Will fix
> > >
> > > > +
> > > >  };
> > > >
> > > >  /**
> > > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> b/drivers/gpu/drm/xe/xe_mmio.c
> > > > index e3db3a178760..0d795394bc4c 100644
> > > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > > @@ -22,6 +22,7 @@
> > > >  #include "xe_module.h"
> > > >  #include "xe_sriov.h"
> > > >  #include "xe_tile.h"
> > > > +#include "xe_svm.h"
> > > >
> > > >  #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
> > > >  #define TILE_COUNT		REG_GENMASK(15, 8)
> > > > @@ -286,6 +287,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> > > >  		}
> > > >
> > > >  		io_size -=3D min_t(u64, tile_size, io_size);
> > > > +		xe_svm_devm_add(tile, &tile->mem.vram);
> > >
> > > Do we want to do this probe for all devices with VRAM or only a subse=
t?
> >
> > All
>=20
> Can you explain why?

It is natural for me to add all device memory to hmm. In hmm design, device=
 memory is used as a special swap out for system memory. I would ask why we=
 only want to add a subset of vram? By a subset, do you mean only vram of o=
ne tile instead of all tiles?

Oak


>=20
> > >
> > > >  	}
> > > >
> > > >  	xe->mem.vram.actual_physical_size =3D total_size;
> > > > @@ -354,10 +356,16 @@ void xe_mmio_probe_tiles(struct xe_device *xe=
)
> > > >  static void mmio_fini(struct drm_device *drm, void *arg)
> > > >  {
> > > >  	struct xe_device *xe =3D arg;
> > > > +    struct xe_tile *tile;
> > > > +    u8 id;
> > > >
> > > >  	pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
> > > >  	if (xe->mem.vram.mapping)
> > > >  		iounmap(xe->mem.vram.mapping);
> > > > +
> > > > +	for_each_tile(tile, xe, id)
> > > > +		xe_svm_devm_remove(xe, &tile->mem.vram);
> > >
> > > This should probably be above existing code. Typical on fini to do
> > > things in reverse order from init.
> >
> > Will fix
> > >
> > > > +
> > > >  }
> > > >
> > > >  static int xe_verify_lmem_ready(struct xe_device *xe)
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_sv=
m.h
> > > > new file mode 100644
> > > > index 000000000000..09f9afb0e7d4
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > > @@ -0,0 +1,14 @@
> > > > +// SPDX-License-Identifier: MIT
> > > > +/*
> > > > + * Copyright =A9 2023 Intel Corporation
> > >
> > > 2024?
> >
> > This patch was actually written 2023
> > >
> > > > + */
> > > > +
> > > > +#ifndef __XE_SVM_H
> > > > +#define __XE_SVM_H
> > > > +
> > > > +#include "xe_device_types.h"
> > >
> > > I don't think you need to include this. Rather just forward decl stru=
cts
> > > used here.
> >
> > Will fix
> > >
> > > e.g.
> > >
> > > struct xe_device;
> > > struct xe_mem_region;
> > > struct xe_tile;
> > >
> > > > +
> > > > +int xe_svm_devm_add(struct xe_tile *tile, struct xe_mem_region *me=
m);
> > > > +void xe_svm_devm_remove(struct xe_device *xe, struct xe_mem_region
> > > *mem);
> > >
> > > The arguments here are incongruent here. Typically we want these to
> > > match.
> >
> > Will fix
> > >
> > > > +
> > > > +#endif
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > >
> > > Incongruent between xe_svm.h and xe_svm_devmem.c.
> >
> > Did you mean mem vs mr? if yes, will fix
> >
> > Again these two
> > > should
> > > match.
> > >
> > > > new file mode 100644
> > > > index 000000000000..63b7a1961cc6
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > > @@ -0,0 +1,91 @@
> > > > +// SPDX-License-Identifier: MIT
> > > > +/*
> > > > + * Copyright =A9 2023 Intel Corporation
> > >
> > > 2024?
> > It is from 2023
> > >
> > > > + */
> > > > +
> > > > +#include <linux/mm_types.h>
> > > > +#include <linux/sched/mm.h>
> > > > +
> > > > +#include "xe_device_types.h"
> > > > +#include "xe_trace.h"
> > >
> > > xe_trace.h appears to be unused.
> >
> > Will fix
> > >
> > > > +#include "xe_svm.h"
> > > > +
> > > > +
> > > > +static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
> > > > +{
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static void xe_devm_page_free(struct page *page)
> > > > +{
> > > > +}
> > > > +
> > > > +static const struct dev_pagemap_ops xe_devm_pagemap_ops =3D {
> > > > +	.page_free =3D xe_devm_page_free,
> > > > +	.migrate_to_ram =3D xe_devm_migrate_to_ram,
> > > > +};
> > > > +
> > >
> > > Assume these are placeholders that will be populated later?
> >
> >
> > corrrect
> > >
> > > > +/**
> > > > + * xe_svm_devm_add: Remap and provide memmap backing for device
> > > memory
> > > > + * @tile: tile that the memory region blongs to
> > > > + * @mr: memory region to remap
> > > > + *
> > > > + * This remap device memory to host physical address space and cre=
ate
> > > > + * struct page to back device memory
> > > > + *
> > > > + * Return: 0 on success standard error code otherwise
> > > > + */
> > > > +int xe_svm_devm_add(struct xe_tile *tile, struct xe_mem_region *mr=
)
> > >
> > > Here I see the xe_mem_region is from tile->mem.vram, wondering rather
> > > than using the tile->mem.vram we should use xe->mem.vram when enablin=
g
> > > svm? Isn't the idea behind svm the entire memory is 1 view?
> >
> > Still need to use tile. The reason is, memory of different tile can hav=
e different
> characteristics, such as latency. So we want to differentiate memory b/t =
tiles also
> in svm. I need to change below " mr->pagemap.owner =3D tile->xe->drm.dev =
". the
> owner should also be tile. This is the way hmm differentiate memory of di=
fferent
> tile.
> >
> > With svm it is 1 view, from virtual address space perspective and from =
physical
> struct page perspective. You can think of all the tile's vram is stacked =
together to
> form a unified view together with system memory. This doesn't prohibit us=
 from
> differentiate memory from different tile. This differentiation allow us t=
o optimize
> performance, i.e., we can wisely place memory in specific tile. If we don=
't
> differentiate, this is not possible.
> >
>=20
> Ok makes sense.
>=20
> Matt
>=20
> > >
> > > I suppose if we do that we also only use 1 TTM VRAM manager / buddy
> > > allocator too. I thought I saw some patches flying around for that to=
o.
> >
> > Ttm vram manager is not in the picture. We deliberately avoided it per =
previous
> discussion
> >
> > Yes same buddy allocator. It is in my previous POC: https://lore.kernel=
.org/dri-
> devel/20240117221223.18540-12-oak.zeng@intel.com/. I didn't put those pat=
ches
> in this series because I want to merge this small patches separately.
> > >
> > > > +{
> > > > +	struct device *dev =3D &to_pci_dev(tile->xe->drm.dev)->dev;
> > > > +	struct resource *res;
> > > > +	void *addr;
> > > > +	int ret;
> > > > +
> > > > +	res =3D devm_request_free_mem_region(dev, &iomem_resource,
> > > > +					   mr->usable_size);
> > > > +	if (IS_ERR(res)) {
> > > > +		ret =3D PTR_ERR(res);
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	mr->pagemap.type =3D MEMORY_DEVICE_PRIVATE;
> > > > +	mr->pagemap.range.start =3D res->start;
> > > > +	mr->pagemap.range.end =3D res->end;
> > > > +	mr->pagemap.nr_range =3D 1;
> > > > +	mr->pagemap.ops =3D &xe_devm_pagemap_ops;
> > > > +	mr->pagemap.owner =3D tile->xe->drm.dev;
> > > > +	addr =3D devm_memremap_pages(dev, &mr->pagemap);
> > > > +	if (IS_ERR(addr)) {
> > > > +		devm_release_mem_region(dev, res->start, resource_size(res));
> > > > +		ret =3D PTR_ERR(addr);
> > > > +		drm_err(&tile->xe->drm, "Failed to remap tile %d memory,
> > > errno %d\n",
> > > > +				tile->id, ret);
> > > > +		return ret;
> > > > +	}
> > > > +	mr->hpa_base =3D res->start;
> > > > +
> > > > +	drm_info(&tile->xe->drm, "Added tile %d memory [%llx-%llx] to dev=
m,
> > > remapped to %pr\n",
> > > > +			tile->id, mr->io_start, mr->io_start + mr->usable_size,
> > > res);
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_svm_devm_remove: Unmap device memory and free resources
> > > > + * @xe: xe device
> > > > + * @mr: memory region to remove
> > > > + */
> > > > +void xe_svm_devm_remove(struct xe_device *xe, struct xe_mem_region
> > > *mr)
> > > > +{
> > > > +	/*FIXME: below cause a kernel hange during moduel remove*/
> > > > +#if 0
> > > > +	struct device *dev =3D &to_pci_dev(xe->drm.dev)->dev;
> > > > +
> > > > +	if (mr->hpa_base) {
> > > > +		devm_memunmap_pages(dev, &mr->pagemap);
> > > > +		devm_release_mem_region(dev, mr->pagemap.range.start,
> > > > +			mr->pagemap.range.end - mr->pagemap.range.start +1);
> > > > +	}
> > > > +#endif
> > >
> > > This would need to be fixed too.
> >
> >
> > Yes...
> >
> > Oak
> > >
> > > Matt
> > >
> > > > +}
> > > > +
> > > > --
> > > > 2.26.3
> > > >
