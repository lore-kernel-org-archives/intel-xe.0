Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE177C54E60
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 18:32:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A34C10E744;
	Thu, 14 Mar 2024 18:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YzDCuVeM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F6E10FCBB
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 18:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710441160; x=1741977160;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Sy1DfjJWiK7a9Iyq1e2cuPykiZlSZktsxdn5qadnRgM=;
 b=YzDCuVeMtYaBTkJ3iVkpBu4mGMzLSUtMS8nwFAxFlzPzBOTlIZKoXLBo
 tGoHXOp26i/vvmMdiM5qOlkJmhII4+fQcUUwWgZCjgtukcd7QCUYv0i5Z
 6dbiseQRBSOGNv+uPMesZ+ICW4s0B7wgxJQIkoCZoBodTZCg/DBQMIyMO
 71vKs26g3RfI2zqF0dXcYWlTBjMTItpcn+mfUHqroPkEu95eiKyrpjaRW
 UpdqhipNzWHXh0c92/q+OVoGNFZ71pBbv/1fh+7q5GNZTYL+hlqFO0u0Q
 8UCoLnkKos1OmdXyCCHUbHNtzlr5QYEREmZ80k2R6AyKMDn1fxF0HmhyC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="9096226"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="9096226"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 11:32:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="12991620"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 11:32:40 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 11:32:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 11:32:39 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 11:32:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/yFTjV4fXUe+ljyPHkFoc/Vv1Hx0pbaUFSxXD6VRJxk4NjqjUb4gGeB7rLq8s01wgDjeiI2F+IQTn39wFgl5vw12NQgZxWlaer5XDJPt7tFS+1HRMsObRuRXeLbohLSlvmm27QSkj4JyfLVoq6N129LFkFVzDFBciJ7ZteTGKVmxkA/4amLQ7lIAor8mq2Ps0NBhsXxmKfPKFyx1EJtbfii1H2cgFOpl71Tf0bXo/NxFUaC6k4TlWncj0VqE2BUZ3nRn51PnT1RGQwsHU6SCwWYAS0Z/T0d9oIQrirXluitfT0NyIILCb8eWGip2L1MPCHD4DXIOMqHm0CyxCYeuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KpDPUkxDgiFIvxQqVnPudx6FCClhpEYr4ARn6lEYdI=;
 b=KJHaEupVS+Eo1+U/LgQ/zQvLx1CgrIvIGUl8IAC2BjN1LNpyaTudU4tuezsaaz4KfKxiyxyzdX8/es/ejeEUY0Qxl8aFTRT1uRvJsfNaWXHWfqwynhTc4lFxPD6VIzrafpWEtR37Va1d1fdlSB4Uj5odj8fpWAc3IW/GxcR/OGY98ai3UYhJ4025r7M0CnHt1Z0lXOLsmHS15K3F1CtQHL1W0birozQjND7hUAIZbnvkO/H4VlTiYiD0Km/JVtTmyHoSd948K1xvRpKitqUhwZeq6nqOaaXPEd6alRMc8E88+lsT73p3fMxyXYgYgk8HBJdy6H/mXE/NCoe7TZhfUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SJ0PR11MB5070.namprd11.prod.outlook.com (2603:10b6:a03:2d5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Thu, 14 Mar
 2024 18:32:36 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Thu, 14 Mar 2024
 18:32:36 +0000
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
Thread-Index: AQHadb8YemanJm4MK0iW0Qj9YyIrJ7E3e6GAgAAKcIA=
Date: Thu, 14 Mar 2024 18:32:36 +0000
Message-ID: <SA1PR11MB6991042C806081949493087592292@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240314033553.1379444-1-oak.zeng@intel.com>
 <20240314033553.1379444-2-oak.zeng@intel.com>
 <ZfMxR/YHY/LP88KZ@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZfMxR/YHY/LP88KZ@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SJ0PR11MB5070:EE_
x-ms-office365-filtering-correlation-id: 2e9e987a-131f-4aff-59cf-08dc44551f58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jHiqmhqsmLOHHmjlrvDppjEUiUyWr34dfnnVAinXPbB21COX9Rlm+qFT8c/crHXu6ECyRBPsM8q8Up6ZAZAAAmbzI0joukY0o7P3h9hQCRNg2ftH7Jm/4F/SjjsUIc7Yp5VXBkR9cXb4pTfBhV8pJZCfl5ZyaHDODYzBM0kd2iC6nnLeYJAvatMI+jv6K4P1tl9JKKFk/YPsd7xH4ipDT3g0dqkgVpodWWbQkpOyXIY7NFF/P3uXGT6JUVPy/ayN9ChXvC+GhyxMK8tPFB3q41F5C1dmnB4NHcvWLahYbILHR4EIhueZdkdq8jhjjZ8fe90wUuLlQxBtRbINnmYVipCExaZCB46t3m37EbUnV+N6M5a2gebeQQzTx2rk7G9w1B92vOUvZNTPb/b1kyYYbcRgTn+vG3PaoaBE5sr7vblT8v9uts5f7eDCEaKkUGpJ3qqR24x2Y6RLw6PTi1Kevo63a5hOnXefnRRciikAOA5VF2HF97XolMT9YOhbX0G6Zp/n+EqIJUsYVko6Mye0CGz8ZAssXauu/lIzA1W98IP8A46Ic/NjCsRuuYOTLVjNoC01z3WwIxj8Qh4E6juPArMxIWBD97tuPPJTmU1eOLifYbp2gzs0uEX4fgoTh6wTszwu+BwYnGzkVniDoZGra1VMD+fQVdDiJRbpMPM+8l0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?SSElXaLEORr7xuFAEiNEY7DbKjCdG736YBNwNH11wiyWqKtCNASAz4mjq6?=
 =?iso-8859-1?Q?Pd+AWjHH5/jjeWUQYLvO3b4Ow+PUxZJ7oJwi8lGRE97ijii55dtPATaulk?=
 =?iso-8859-1?Q?I+hFAQCpPQ9LDyghkxzsy+hcI/sdL15xi8HqB7qNiiWpWCcdYY63tEq8M/?=
 =?iso-8859-1?Q?wfEzOo+IheiCoBPK3s0OhgglwkrLghskFIYLvBimzv9NLO2qf9EkRZqswv?=
 =?iso-8859-1?Q?wAqXud1jzK368TA2pBJfgicJK8eBi/C1doOYNgp+a2kv/eZky3jUvkmmze?=
 =?iso-8859-1?Q?hqTrPcmIzPE29KECmOh9znHOm8URJ+KikWgSvNNNl/mi3bkr1TQVxWzNpe?=
 =?iso-8859-1?Q?4Htdceo/DSvJqpNw+DNCINLgM6tE1zaqgc5TJCy2Ha+A8VLUYyPtrn3S+G?=
 =?iso-8859-1?Q?SBHG6DzIjSQ9nKVkuDJxdlfdq7+Zj4VxnhiWx4FAxXrsRDAGuKpoFJaf0A?=
 =?iso-8859-1?Q?Ak+aIqmot2CtpP4yWvCi9nDm3YR93HBfw8E+n33IWkQFgAX1u4++H3TPbo?=
 =?iso-8859-1?Q?4fbYyLUy9Ke6S+93bzcIdWPSRx5jSMGPuXsi85YWQLqqlkjiBUX8WNFiXy?=
 =?iso-8859-1?Q?LK51Xq71VYV/1tJ8hmWPYUKEubIQiJxSBKqv5IUQ2glEC9bHagP2nqkBDR?=
 =?iso-8859-1?Q?sHYl4F1vRtcnJIWl7WSg4gDAEg/+DsrEMX8eqnl9oIxmIfZCTpqh9WZ+x+?=
 =?iso-8859-1?Q?1oRHdUgaAjgzcJVYwZNhyq5mzYSPfDLRrKnuwBv6NQzrT7VehPsn7r2FgB?=
 =?iso-8859-1?Q?I7AP6TfqoKrWB7lwbXz9yaaz5L1nug222znf0FsLL1TrzTHkGabPFj7riL?=
 =?iso-8859-1?Q?HG+WMq5aHVizM9bm7X9XOKqdn7Hbb+I76N45xmyWMre2DsR/Edlm3lwDzo?=
 =?iso-8859-1?Q?xg6PeyyqZI4OVAPH4bImoudBBJxhgyOi9haY682fJXz0WmCJs+rYkHFA3D?=
 =?iso-8859-1?Q?YO4Y2O4r+NdvoOBOLArlpv2YzB47sz3OZECAl3pl4L+LD95ElZhg7fgsTP?=
 =?iso-8859-1?Q?4ZUn7Xwyaw05+LFcjYy23StiliFA3Ly8OJvV/wSBNq/SnBCJx4GOfhNGQM?=
 =?iso-8859-1?Q?YH2TAtV8arhZ4hBysNeudyoG2Qg2MNJHJ/rV9vyw7yvl6nhgEJ/PH8Cm6Y?=
 =?iso-8859-1?Q?ItiYh9oSVodTVqQcTSEFEOUOt1he2s8gVvHRCBQRhlPnj7S+a7rh//s1bD?=
 =?iso-8859-1?Q?MqH24hFkAW2gqvMHOatiBCfRJzKWrh8F9To42YLu/RE1tiO82Ns1CaxVha?=
 =?iso-8859-1?Q?hYD+n8At5eb2DdDhDpvtBbxGvMidSVfBNEvKXwJFcPfY9ks8MEmnZ2Oesj?=
 =?iso-8859-1?Q?MTWbiTLK1CW2bouaphH61xoGQ02mHozcKRAabAnw4YNruJViwA/rBqRNye?=
 =?iso-8859-1?Q?5ZcuU4bu3dVq/gC864KeBG3IEQTZmohetx5x/8Ac2PKnn0k1MPh2XJsvWs?=
 =?iso-8859-1?Q?YNaI3jaAs/AAZeVIuniWsYp5PUsGVaIg1pW1niRo6TLbHGgU9aptdCxAcR?=
 =?iso-8859-1?Q?6u+1Ec8I8Rjyi9y7BC4CsXcneIQVFGi3c/1xnuYy6SDSuNs7ePrCSK1y52?=
 =?iso-8859-1?Q?01W4GUNFuZuqTDRRErZ//TCGuIXyhOU2iN+2s9aOZbdvPPS1PEy2izcoYC?=
 =?iso-8859-1?Q?ycqnfkMyKvckw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9e987a-131f-4aff-59cf-08dc44551f58
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2024 18:32:36.8481 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +/BVQ6SGTvp7D/XsQx9DSNKmMP4v53Tmsr9CmBVCQ336AgXDcL3XbyhXpinJrmZfo9dWOg8oAwl6JJZNHIwoSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5070
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
> Sent: Thursday, March 14, 2024 1:18 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Hellstrom, Thomas
> <thomas.hellstrom@intel.com>; airlied@gmail.com; Welty, Brian
> <brian.welty@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: Re: [PATCH 1/5] drm/xe/svm: Remap and provide memmap backing for
> GPU vram
>=20
> On Wed, Mar 13, 2024 at 11:35:49PM -0400, Oak Zeng wrote:
> > Memory remap GPU vram using devm_memremap_pages, so each GPU vram
> > page is backed by a struct page.
> >
> > Those struct pages are created to allow hmm migrate buffer b/t
> > GPU vram and CPU system memory using existing Linux migration
> > mechanism (i.e., migrating b/t CPU system memory and hard disk).
> >
> > This is prepare work to enable svm (shared virtual memory) through
> > Linux kernel hmm framework. The memory remap's page map type is set
> > to MEMORY_DEVICE_PRIVATE for now. This means even though each GPU
> > vram page get a struct page and can be mapped in CPU page table,
> > but such pages are treated as GPU's private resource, so CPU can't
> > access them. If CPU access such page, a page fault is triggered
> > and page will be migrate to system memory.
> >
>=20
> Is this really true? We can map VRAM BOs to the CPU without having
> migarte back and forth. Admittedly I don't know the inner workings of
> how this works but in IGTs we do this all the time.
>=20
>   54         batch_bo =3D xe_bo_create(fd, vm, batch_size,
>   55                                 vram_if_possible(fd, 0),
>   56                                 DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE=
_VRAM);
>   57         batch_map =3D xe_bo_map(fd, batch_bo, batch_size);
>=20
> The BO is created in VRAM and then mapped to the CPU.
>=20
> I don't think there is an expectation of coherence rather caching mode
> and exclusive access of the memory based on synchronization.
>=20
> e.g.
> User write BB/data via CPU to GPU memory
> User calls exec
> GPU read / write memory
> User wait on sync indicating exec done
> User reads result
>=20
> All of this works without migration. Are we not planing supporting flow
> with SVM?
>=20
> Afaik this migration dance really only needs to be done if the CPU and
> GPU are using atomics on a shared memory region and the GPU device
> doesn't support a coherent memory protocol (e.g. PVC).

All you said is true. On many of our HW, CPU can actually access device mem=
ory, cache coherently or not.=20

The problem is, this is not true for all GPU vendors. For example, on some =
HW from some vendor, CPU can only access partially of device memory. The so=
 called small bar concept.

So when HMM is defined, such factors were considered, and MEMORY_DEVICE_PRI=
VATE is defined. With this definition, CPU can't access device memory.

So you can think it is a limitation of HMM.

Note this is only part 1 of our system allocator work. We do plan to suppor=
t DEVICE_COHERENT for our newer device, see below. With this option, we don=
't have unnecessary migration back and forth.

You can think this is just work out all the code path. 90% of the driver co=
de for DEVICE_PRIVATE and DEVICE_COHERENT will be same. Our real use of sys=
tem allocator will be DEVICE_COHERENT mode. While DEVICE_PRIVATE mode allow=
 us to exercise the code on old HW.=20

Make sense?


>=20
> > For GPU device which supports coherent memory protocol b/t CPU and
> > GPU (such as CXL and CAPI protocol), we can remap device memory as
> > MEMORY_DEVICE_COHERENT. This is TBD.
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
> >  drivers/gpu/drm/xe/Makefile          |  3 +-
> >  drivers/gpu/drm/xe/xe_device_types.h |  9 +++
> >  drivers/gpu/drm/xe/xe_mmio.c         |  8 +++
> >  drivers/gpu/drm/xe/xe_svm.h          | 14 +++++
> >  drivers/gpu/drm/xe/xe_svm_devmem.c   | 91
> ++++++++++++++++++++++++++++
> >  5 files changed, 124 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/gpu/drm/xe/xe_svm.h
> >  create mode 100644 drivers/gpu/drm/xe/xe_svm_devmem.c
> >
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index c531210695db..840467080e59 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -142,7 +142,8 @@ xe-y +=3D xe_bb.o \
> >  	xe_vram_freq.o \
> >  	xe_wait_user_fence.o \
> >  	xe_wa.o \
> > -	xe_wopcm.o
> > +	xe_wopcm.o \
> > +	xe_svm_devmem.o
>=20
> These should be in alphabetical order.

Will fix
>=20
> >
> >  # graphics hardware monitoring (HWMON) support
> >  xe-$(CONFIG_HWMON) +=3D xe_hwmon.o
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> > index 9785eef2e5a4..f27c3bee8ce7 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -99,6 +99,15 @@ struct xe_mem_region {
> >  	resource_size_t actual_physical_size;
> >  	/** @mapping: pointer to VRAM mappable space */
> >  	void __iomem *mapping;
> > +	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
> > +    struct dev_pagemap pagemap;
> > +    /**
> > +     * @hpa_base: base host physical address
> > +     *
> > +     * This is generated when remap device memory as ZONE_DEVICE
> > +     */
> > +    resource_size_t hpa_base;
>=20
> Weird indentation. This goes for the entire series, look at checkpatch.

Will fix
>=20
> > +
> >  };
> >
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.=
c
> > index e3db3a178760..0d795394bc4c 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -22,6 +22,7 @@
> >  #include "xe_module.h"
> >  #include "xe_sriov.h"
> >  #include "xe_tile.h"
> > +#include "xe_svm.h"
> >
> >  #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
> >  #define TILE_COUNT		REG_GENMASK(15, 8)
> > @@ -286,6 +287,7 @@ int xe_mmio_probe_vram(struct xe_device *xe)
> >  		}
> >
> >  		io_size -=3D min_t(u64, tile_size, io_size);
> > +		xe_svm_devm_add(tile, &tile->mem.vram);
>=20
> Do we want to do this probe for all devices with VRAM or only a subset?

All
>=20
> >  	}
> >
> >  	xe->mem.vram.actual_physical_size =3D total_size;
> > @@ -354,10 +356,16 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
> >  static void mmio_fini(struct drm_device *drm, void *arg)
> >  {
> >  	struct xe_device *xe =3D arg;
> > +    struct xe_tile *tile;
> > +    u8 id;
> >
> >  	pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
> >  	if (xe->mem.vram.mapping)
> >  		iounmap(xe->mem.vram.mapping);
> > +
> > +	for_each_tile(tile, xe, id)
> > +		xe_svm_devm_remove(xe, &tile->mem.vram);
>=20
> This should probably be above existing code. Typical on fini to do
> things in reverse order from init.

Will fix
>=20
> > +
> >  }
> >
> >  static int xe_verify_lmem_ready(struct xe_device *xe)
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > new file mode 100644
> > index 000000000000..09f9afb0e7d4
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -0,0 +1,14 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright =A9 2023 Intel Corporation
>=20
> 2024?

This patch was actually written 2023=20
>=20
> > + */
> > +
> > +#ifndef __XE_SVM_H
> > +#define __XE_SVM_H
> > +
> > +#include "xe_device_types.h"
>=20
> I don't think you need to include this. Rather just forward decl structs
> used here.

Will fix
>=20
> e.g.
>=20
> struct xe_device;
> struct xe_mem_region;
> struct xe_tile;
>=20
> > +
> > +int xe_svm_devm_add(struct xe_tile *tile, struct xe_mem_region *mem);
> > +void xe_svm_devm_remove(struct xe_device *xe, struct xe_mem_region
> *mem);
>=20
> The arguments here are incongruent here. Typically we want these to
> match.

Will fix
>=20
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c
> b/drivers/gpu/drm/xe/xe_svm_devmem.c
>=20
> Incongruent between xe_svm.h and xe_svm_devmem.c.=20

Did you mean mem vs mr? if yes, will fix

Again these two
> should
> match.
>=20
> > new file mode 100644
> > index 000000000000..63b7a1961cc6
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > @@ -0,0 +1,91 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright =A9 2023 Intel Corporation
>=20
> 2024?
It is from 2023
>=20
> > + */
> > +
> > +#include <linux/mm_types.h>
> > +#include <linux/sched/mm.h>
> > +
> > +#include "xe_device_types.h"
> > +#include "xe_trace.h"
>=20
> xe_trace.h appears to be unused.

Will fix
>=20
> > +#include "xe_svm.h"
> > +
> > +
> > +static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
> > +{
> > +	return 0;
> > +}
> > +
> > +static void xe_devm_page_free(struct page *page)
> > +{
> > +}
> > +
> > +static const struct dev_pagemap_ops xe_devm_pagemap_ops =3D {
> > +	.page_free =3D xe_devm_page_free,
> > +	.migrate_to_ram =3D xe_devm_migrate_to_ram,
> > +};
> > +
>=20
> Assume these are placeholders that will be populated later?


corrrect
>=20
> > +/**
> > + * xe_svm_devm_add: Remap and provide memmap backing for device
> memory
> > + * @tile: tile that the memory region blongs to
> > + * @mr: memory region to remap
> > + *
> > + * This remap device memory to host physical address space and create
> > + * struct page to back device memory
> > + *
> > + * Return: 0 on success standard error code otherwise
> > + */
> > +int xe_svm_devm_add(struct xe_tile *tile, struct xe_mem_region *mr)
>=20
> Here I see the xe_mem_region is from tile->mem.vram, wondering rather
> than using the tile->mem.vram we should use xe->mem.vram when enabling
> svm? Isn't the idea behind svm the entire memory is 1 view?

Still need to use tile. The reason is, memory of different tile can have di=
fferent characteristics, such as latency. So we want to differentiate memor=
y b/t tiles also in svm. I need to change below " mr->pagemap.owner =3D til=
e->xe->drm.dev ". the owner should also be tile. This is the way hmm differ=
entiate memory of different tile.

With svm it is 1 view, from virtual address space perspective and from phys=
ical struct page perspective. You can think of all the tile's vram is stack=
ed together to form a unified view together with system memory. This doesn'=
t prohibit us from differentiate memory from different tile. This different=
iation allow us to optimize performance, i.e., we can wisely place memory i=
n specific tile. If we don't differentiate, this is not possible.=20

>=20
> I suppose if we do that we also only use 1 TTM VRAM manager / buddy
> allocator too. I thought I saw some patches flying around for that too.

Ttm vram manager is not in the picture. We deliberately avoided it per prev=
ious discussion

Yes same buddy allocator. It is in my previous POC: https://lore.kernel.org=
/dri-devel/20240117221223.18540-12-oak.zeng@intel.com/. I didn't put those =
patches in this series because I want to merge this small patches separatel=
y.
>=20
> > +{
> > +	struct device *dev =3D &to_pci_dev(tile->xe->drm.dev)->dev;
> > +	struct resource *res;
> > +	void *addr;
> > +	int ret;
> > +
> > +	res =3D devm_request_free_mem_region(dev, &iomem_resource,
> > +					   mr->usable_size);
> > +	if (IS_ERR(res)) {
> > +		ret =3D PTR_ERR(res);
> > +		return ret;
> > +	}
> > +
> > +	mr->pagemap.type =3D MEMORY_DEVICE_PRIVATE;
> > +	mr->pagemap.range.start =3D res->start;
> > +	mr->pagemap.range.end =3D res->end;
> > +	mr->pagemap.nr_range =3D 1;
> > +	mr->pagemap.ops =3D &xe_devm_pagemap_ops;
> > +	mr->pagemap.owner =3D tile->xe->drm.dev;
> > +	addr =3D devm_memremap_pages(dev, &mr->pagemap);
> > +	if (IS_ERR(addr)) {
> > +		devm_release_mem_region(dev, res->start, resource_size(res));
> > +		ret =3D PTR_ERR(addr);
> > +		drm_err(&tile->xe->drm, "Failed to remap tile %d memory,
> errno %d\n",
> > +				tile->id, ret);
> > +		return ret;
> > +	}
> > +	mr->hpa_base =3D res->start;
> > +
> > +	drm_info(&tile->xe->drm, "Added tile %d memory [%llx-%llx] to devm,
> remapped to %pr\n",
> > +			tile->id, mr->io_start, mr->io_start + mr->usable_size,
> res);
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_svm_devm_remove: Unmap device memory and free resources
> > + * @xe: xe device
> > + * @mr: memory region to remove
> > + */
> > +void xe_svm_devm_remove(struct xe_device *xe, struct xe_mem_region
> *mr)
> > +{
> > +	/*FIXME: below cause a kernel hange during moduel remove*/
> > +#if 0
> > +	struct device *dev =3D &to_pci_dev(xe->drm.dev)->dev;
> > +
> > +	if (mr->hpa_base) {
> > +		devm_memunmap_pages(dev, &mr->pagemap);
> > +		devm_release_mem_region(dev, mr->pagemap.range.start,
> > +			mr->pagemap.range.end - mr->pagemap.range.start +1);
> > +	}
> > +#endif
>=20
> This would need to be fixed too.


Yes...

Oak
>=20
> Matt
>=20
> > +}
> > +
> > --
> > 2.26.3
> >
