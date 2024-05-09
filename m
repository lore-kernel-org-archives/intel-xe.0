Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D85AC10F1A
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 03:45:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E16010E1C1;
	Thu,  9 May 2024 03:45:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NPd96W7M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C98A10E244
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 03:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715226350; x=1746762350;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i0dBvXAEm4zdbIlMm7ruyLV56cEHRLZ2S8J/BJyTKio=;
 b=NPd96W7Mz0VkCQ2/S3/crtMJbanFTsWOpRA+w7R6wwER7lQepXyU1J2+
 QdqxEjT88p2nNA87xEJWJqcyi//0Vz8s0s+6wmgNdc6RjQEbP9IQEQcQI
 o8/ewbPFgP3KWr1GfmoSdxF//HxtglDcYfbC+pezy8N67+ThS62JueXD8
 sTAt+nlpgdiSgpDnw6KeX7mBXrC2zCgF0hePxfDDVHKez9/msuQ+bUdOt
 kY7VIhXRo5MwQO37R4h+vhzhQEqZXQLHwPd/2lb5TmlsukTPBjSkKOsfW
 b0PJzXA2aivlA6dLxYFVG19zC+jD9ZKbUY4f9QCMAYYPcdHNTLUtToQzv g==;
X-CSE-ConnectionGUID: IP9dwguHRcKNFrCRvswpCA==
X-CSE-MsgGUID: O7rPN8R6RAmXPeHDO7Xp0A==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="22516382"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="22516382"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 20:45:49 -0700
X-CSE-ConnectionGUID: RDURnqFxReeo6OZ18qyzBA==
X-CSE-MsgGUID: 53LM7usTRWm9KYf2esfNNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="29192775"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 20:45:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 20:45:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 20:45:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 20:45:48 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 20:45:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSq9ON8EsbvrefQDTcGi4BHh3Zgn/HhYom+2RNPmg9OesTNe8bunYqNS+OHRcmRu/rVsUkAjEbDSh3EAwDRlfWx0LTHkNsAm6AbgiCoOp/rtOAEii0jO6xvz7ybjqF5qGDmpU8Fha7NoI/rJLItV6GKU7BND9Mb4REAF0B4RQuo1oIzToIVjRIAnYJt5NL/SWojSxYq73gIhOYsRZmpfwQNxa9InHVLRMXhSucHE2tfnQXHjhudI/5ScWyO/oP0PGRROmA2zHTpYHpc8Y1zHnCdldegYU8Sqe3Gq/WpKVzdNTuwbZO35rQH3D65GKXHMfxdhL9NIZ1hr5X6zG8HgGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGnWyaJYS3O8361IoZMoZdjYw/Kw+QsfFHtXKuQAYvE=;
 b=H15YHd/LwmfWZYCjKuZzK904B8/0yLbjqfAVmGHN/+Kog+UXEASS6txe30Vbe1Tup6QvxPEgRU93HpENNd/JgNL32gTXWIdj5YWXP9Ds0dCNyLAW5ACKI6sFcRgHoSIAACuXfJzhFOfWYswdF4AAVgpI9LSwlXpQt6374BCz1MgIKH4xvwNay394YDEOEe4g4JrUp974/ykqS2k9HViOtDgJ9thNABYwORhaFWMEoNkrVYXwiwVzzeDNmULdzyeBVetaVujnw+/fjgrEC+NFZyoppVUFHfeL3M9dj5Z4Mus9Ma5S9qFZyJ1LQWRuihpx9TbCUv7NMh9Vijdcc8ihCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by LV3PR11MB8727.namprd11.prod.outlook.com (2603:10b6:408:20d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Thu, 9 May
 2024 03:45:46 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::513:c8a5:7031:dc2c]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::513:c8a5:7031:dc2c%7]) with mapi id 15.20.7544.045; Thu, 9 May 2024
 03:45:46 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: Nirmoy Das <nirmoy.das@linux.intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Das, Nirmoy" <nirmoy.das@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH] drm/xe: Fix UBSAN shift-out-of-bounds failure
Thread-Topic: [PATCH] drm/xe: Fix UBSAN shift-out-of-bounds failure
Thread-Index: AQHaoFaqzr0e9d5gtk2DaEVVv7JPSrGLvW2AgAAkHICAAiwGkIAANqYAgAABhxA=
Date: Thu, 9 May 2024 03:45:46 +0000
Message-ID: <DM4PR11MB54560F2DCAF1B82DA2580CFDEAE62@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20240507080456.613786-1-shuicheng.lin@intel.com>
 <20240507130411.630361-1-shuicheng.lin@intel.com>
 <8e7aa310-25f3-4318-aa99-20b39c6e438e@linux.intel.com>
 <DM4PR11MB5456DE457A372789DE992861EAE62@DM4PR11MB5456.namprd11.prod.outlook.com>
 <c2tkhqhxf5zr25p3cj6ibljqzvltrb7lwiaauep5dlphhu4k4g@gwitycdsle6u>
In-Reply-To: <c2tkhqhxf5zr25p3cj6ibljqzvltrb7lwiaauep5dlphhu4k4g@gwitycdsle6u>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|LV3PR11MB8727:EE_
x-ms-office365-filtering-correlation-id: bcfa5b90-bded-424a-64d6-08dc6fda82a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?MOdEnxmeIawPhHbeAy/jpnd/7P24Mrp2x4k7pnIvRhpTDHEfJgN5tW6kEhVd?=
 =?us-ascii?Q?Nji6oZ/mpbl3QCeLMVZlbWI8ecHacBMWLF0flHHocvoTRJhfQVQQ+s9X/BZ2?=
 =?us-ascii?Q?GSJuL6qh65HS4HD8xsAD51iphs+zvnRSP+gQKIbA2Sns23euaFiCs0tz33vG?=
 =?us-ascii?Q?JVU7DJElTr4xw16vyQfxv4cjR4AXccUZrDIO0r68Wo2+0xx5AunY1VignvUe?=
 =?us-ascii?Q?+P4wPrF/enUTfz2EaBW6hsA/DWL8mgliy9kDGm5MdVTMYAybv6pevXngLW6V?=
 =?us-ascii?Q?a2u3+KF74/tT5lqMaO23qRf2jrlVnNbcCOUAFvXkpH8l8Z8proH+ZoAsd/6s?=
 =?us-ascii?Q?lumdMxIRpy3VbaeqgnTVSHIk7W3byyUKAupvOIWHkgWv5lMRHgEj8Wrba+8s?=
 =?us-ascii?Q?pOQxjRswnly9gUujbFHtsZG1Y16KuclpvP7i5+T9nmWwfaw+U8xD0fS2g4zy?=
 =?us-ascii?Q?0s5u+edHds/YkVoEYIrjP/feW98nvTNSS65LIm+VAlpeYV7pazWvAWIialGw?=
 =?us-ascii?Q?9ZpCnSMSkrft7olTY75Li81Pv4SyXEQ1fHuZUAdZ35zKkl0ENdqqSmN8X2cU?=
 =?us-ascii?Q?623dmHQw48VHgjrZQD010Sp/ygvrvKOJbXXzMl0hbIuHfEA9Jrx/wQwW+opE?=
 =?us-ascii?Q?KafmSyz4hG5PL/5xnY6uZ6xhXVvHS6vBwa8u2sNvvWM8PNSZ4mbDoBUoQzHA?=
 =?us-ascii?Q?hmayXeLRTLx51LCsVaCcx8Rx//ajcRIjm9iESXjFH4xHpIjrUhftMiUuiskk?=
 =?us-ascii?Q?cHMAYmYHAk6QVJZKB/syB066TSoSBHN9+i0joHU/CUOGszy5EwFZv+CF62ru?=
 =?us-ascii?Q?hoaOhjlyGInZ6vB0uY6XEAl9kNgxsMboy71feShGPZKWSRFJLL+pkRYwTh9V?=
 =?us-ascii?Q?zQQ4G8YGgD6/a6KUN/MmJdpygv6FTd3IUvBhsoxVu3nho+LD/P7bNxasXbMj?=
 =?us-ascii?Q?Lw6pTUw6gS+fGP0bw4pm1vyiWtqW/qQ2DyZCqeQ7wvFa+b1tkTDwlCZQ0HsE?=
 =?us-ascii?Q?FJnMSbMjPs7EjK4oEYHAw31VN73W0TqNDGGdzB5J1IHlr/tfGEqpshYAUCkT?=
 =?us-ascii?Q?zo6bHLIqjzSTtTXI79QHQ5k1+NY2351pXAkLUJJEPDIDLd1zCN11pVyuw+BE?=
 =?us-ascii?Q?zqyLXgkGDlNJ4TMqzljrDtWrHKM5fGzS09gavlMMIvi9XRGr2s8HKhTkTauC?=
 =?us-ascii?Q?2CmDW0bNK7it1faxlQ0ztDTBqiBgDV8T9AclTS3/+39UHQ4RIJU/IAHy4WSL?=
 =?us-ascii?Q?CJlr7SBDGExDrJcoIc2yMs/xe5DU+gft7I9aX2Vu53AVUZi5JEtU9UKzXLjU?=
 =?us-ascii?Q?rG2xhEhckuQyUiOURLNxL5WrLTDkOuwrYHB+k3I9M7ITGA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tGLDxvENHVIh8YVm5yoDxhxIcOjQ/PdI0KozFX+tVAJH/we8Fzl6Y/5VOui5?=
 =?us-ascii?Q?OPo6klyB19R7uY5AR8Paa5Rlp8vh+3r8Rehmb2n4ewR/Wi5UJYJe1/ryWWiv?=
 =?us-ascii?Q?zO+EFaS7P3mHIscMvX127m7sWZNDc5W/PlSogwXDoCps8Tnqxd/XEgub/Bdu?=
 =?us-ascii?Q?8/yTxfyXb3UNrX7WupTBPywUcYmAfdbx+LnEkBcIqoL6PVrlhD7mBNamO6fb?=
 =?us-ascii?Q?q0OePCJP+lMByq5+z3m3UY+tabhZenHeVhkn/AXu75vo9BaDTTHAHkWAGWUX?=
 =?us-ascii?Q?r4/YjBNZpbKBVnXhVTs0XkISTJN3RCqVv/cCmWnz2cZLwteYUNZvCBkygvRt?=
 =?us-ascii?Q?2/TO7Wx0zDxUjv51uqOSG+/B8Si0pd3jKAK4ioMndpM8v2qz0divE+Hqr9lz?=
 =?us-ascii?Q?p6YHYIzGRmmqNjofz66G3gcU5H1TIczXf4rVpf7cRU93Fy961UMiS9yxLF2D?=
 =?us-ascii?Q?gkTR1NQGppzXPS7YkvNKAIzd8Jp0kQHWX4JXAcMfbGBlefRarHPZEhqexJhV?=
 =?us-ascii?Q?tfOinUKXXZai1RWY3mkjEXm7pxki6+Shf5hhQvOO4IzUNVy3ajFyT+VM5xAF?=
 =?us-ascii?Q?YMFw1FYSCCpf3OJByl7IB0229bh7wk4aShqC3Y0m/8oFqAxG81qop8FKxkrN?=
 =?us-ascii?Q?17DNqCVPSjchfiR4RJvzG02AE5MfNl0+6G1a2o4xrAT82Gma6nufiGdiIAw+?=
 =?us-ascii?Q?E26TohcEOic93e922jAI6DLqc8+f9B3O0tfqYDMWSrxapFKdK9/TH0bi3+oo?=
 =?us-ascii?Q?aS03actUFI1GR8xeanasF9RzmGCW8cNob2OPaluYUKHH6cg2Be3H8rM9JeYx?=
 =?us-ascii?Q?NVhiRtyJ3f/s5HjgtgFlYIDqYw9+b03Cgab2N2xLOYTD+r45hOPNGt/eTTbV?=
 =?us-ascii?Q?fKRpMpwpPprU95TNh627F8+62UOlhboN44SuRCyUfv10IDTQcHKVCplJdiV4?=
 =?us-ascii?Q?ke6gDjub4Br0fdXrr0rTiepOAkABChEdeVqdJN1moRvAHB+TaJLjZWsqMXLL?=
 =?us-ascii?Q?RsRO9bofxOcaLQcMe5c5zpow7QcaTO6FP2L8VDIN2XI46G8OB6H0yKZuxBze?=
 =?us-ascii?Q?xvlwhR9MgFlqtb4+lZby9CBlqEz43cS7m0y1jJ8vUjZc4ccWXgDI0M/ljKII?=
 =?us-ascii?Q?mJKY8a/JSzCNwnYAnvevsW7P9ZsjzzRxgAUQsH9cNIuypKKInkIt4im0+0Yx?=
 =?us-ascii?Q?pfZX3k7KMii8QkggEBYJvIu4RQINUBb/yENGHHzRkyXFJNbXGr4pdZl4MdMa?=
 =?us-ascii?Q?ksiEUTbUk9TK110VHZuN6OvV5K4A3uqe3T88Ob5bm6nqP7QnCJaewIEvosvY?=
 =?us-ascii?Q?hRwenAbJDGKynhhIpNQAU4DKCBpq+N5Gnt7AhdNMcbTxKfCsBi8g4zILjmUz?=
 =?us-ascii?Q?ku0f8cYNJwLzHQJqFBPcy6GeUEQaQl4EmvAQgLpUTwctHrBEZW1JV8jI1ycw?=
 =?us-ascii?Q?GwMEV9zasoAnQQni0sYNZsqXFOu+RuGxvGEu5rhdfkJ1D8HXROk1nMW5GI26?=
 =?us-ascii?Q?JJdMBw1BWUQlq04rrCllEGbs6KPyHKtkfeoi7ymKpW8pHO7JQ6wzoVZ9iDIw?=
 =?us-ascii?Q?LqjCHC/Sc399tHp1T4F+rW1Hnrx0ZrHFdB1SviqV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcfa5b90-bded-424a-64d6-08dc6fda82a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2024 03:45:46.5336 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7UnNyBaiaAgy/j8JfoCNDiS8H8spM0Yp8E54CrDshCRmH0gIBIjIdCVCbg8NJ05Pxc4UuoAYZHrlZg8ikmyNNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8727
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

Sure. Please help reword it.
Thanks Lucas.

Best Regards
Shuicheng

> -----Original Message-----
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Thursday, May 9, 2024 11:39 AM
> To: Lin, Shuicheng <shuicheng.lin@intel.com>
> Cc: Nirmoy Das <nirmoy.das@linux.intel.com>; intel-xe@lists.freedesktop.o=
rg;
> Das, Nirmoy <nirmoy.das@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>
> Subject: Re: [PATCH] drm/xe: Fix UBSAN shift-out-of-bounds failure
>=20
> On Thu, May 09, 2024 at 12:25:39AM GMT, Lin, Shuicheng wrote:
> >Thanks Nirmoy for the review.
> >
> >Hi all,
> >Anything should I do in order to get it merged?
> >Thanks.
>=20
> sorry I had replied but I guess it failed to send and got saved in my dra=
fts. I just
> sent it again.
>=20
> Since it's just a commit message change, if you are ok with the reword, I=
 can just
> do it while pushing.
>=20
> Lucas De Marchi
>=20
> >
> >Best Regards
> >Shuicheng
> >
> >> -----Original Message-----
> >> From: Nirmoy Das <nirmoy.das@linux.intel.com>
> >> Sent: Tuesday, May 7, 2024 11:13 PM
> >> To: Lin, Shuicheng <shuicheng.lin@intel.com>;
> >> intel-xe@lists.freedesktop.org
> >> Cc: Das, Nirmoy <nirmoy.das@intel.com>; Brost, Matthew
> >> <matthew.brost@intel.com>; De Marchi, Lucas
> >> <lucas.demarchi@intel.com>
> >> Subject: Re: [PATCH] drm/xe: Fix UBSAN shift-out-of-bounds failure
> >>
> >> +Lucas
> >>
> >> On 5/7/2024 3:04 PM, Shuicheng Lin wrote:
> >> > Here is the failure stack:
> >> > [   12.988209] ------------[ cut here ]------------
> >> > [   12.988216] UBSAN: shift-out-of-bounds in ./include/linux/log2.h:=
57:13
> >> > [   12.988232] shift exponent 64 is too large for 64-bit type 'long =
unsigned
> >> int'
> >> > [   12.988235] CPU: 4 PID: 1310 Comm: gnome-shell Tainted: G     U
> >> 6.9.0-rc6+prerelease1158+ #19
> >> > [   12.988237] Hardware name: Intel Corporation Raptor Lake Client
> >> Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS
> >> RPLSFWI1.R00.3301.A02.2208050712 08/05/2022
> >> > [   12.988239] Call Trace:
> >> > [   12.988240]  <TASK>
> >> > [   12.988242]  dump_stack_lvl+0xd7/0xf0
> >> > [   12.988248]  dump_stack+0x10/0x20
> >> > [   12.988250]  ubsan_epilogue+0x9/0x40
> >> > [   12.988253]  __ubsan_handle_shift_out_of_bounds+0x10e/0x170
> >> > [   12.988260]  dma_resv_reserve_fences.cold+0x2b/0x48
> >> > [   12.988262]  ? ww_mutex_lock_interruptible+0x3c/0x110
> >> > [   12.988267]  drm_exec_prepare_obj+0x45/0x60 [drm_exec]
> >> > [   12.988271]  ? vm_bind_ioctl_ops_execute+0x5b/0x740 [xe]
> >> > [   12.988345]  vm_bind_ioctl_ops_execute+0x78/0x740 [xe]
> >> >
> >> > It is caused by the value 0 of parameter num_fences in function
> >> drm_exec_prepare_obj.
> >> > And lead to in function __rounddown_pow_of_two, "0 - 1" causes the
> >> > shift-
> >> out-of-bounds.
> >> > For num_fences =3D=3D 0 case, drm_exec_prepare_obj is the same as
> >> > drm_exec_lock_obj in function, so call drm_exec_lock_obj instead to =
solve it.
> >> >
> >> > Cc: Nirmoy Das <nirmoy.das@intel.com>
> >> > Cc: Matthew Brost <matthew.brost@intel.com>
> >> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> >>
> >> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> >>
> >>
> >> > ---
> >> >   drivers/gpu/drm/xe/xe_vm.c | 4 ++--
> >> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> >> > b/drivers/gpu/drm/xe/xe_vm.c index d17192c8b7de..c5b1694b292f
> >> > 100644
> >> > --- a/drivers/gpu/drm/xe/xe_vm.c
> >> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> >> > @@ -2692,7 +2692,7 @@ static int vma_lock_and_validate(struct
> >> > drm_exec *exec, struct xe_vma *vma,
> >> >
> >> >   	if (bo) {
> >> >   		if (!bo->vm)
> >> > -			err =3D drm_exec_prepare_obj(exec, &bo->ttm.base, 0);
> >> > +			err =3D drm_exec_lock_obj(exec, &bo->ttm.base);
> >> >   		if (!err && validate)
> >> >   			err =3D xe_bo_validate(bo, xe_vma_vm(vma), true);
> >> >   	}
> >> > @@ -2777,7 +2777,7 @@ static int
> >> vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
> >> >   	struct xe_vma_op *op;
> >> >   	int err;
> >> >
> >> > -	err =3D drm_exec_prepare_obj(exec, xe_vm_obj(vm), 0);
> >> > +	err =3D drm_exec_lock_obj(exec, xe_vm_obj(vm));
> >> >   	if (err)
> >> >   		return err;
> >> >
