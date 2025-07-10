Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA3EC83F1D
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 09:47:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A960A10E05A;
	Thu, 10 Jul 2025 09:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j4A1QiGW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FAE310E05A
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 09:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752140831; x=1783676831;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nO0ujrxXUPYxhsfq/VEPHHOheAFrngjsoeUGU45UPss=;
 b=j4A1QiGWJ1u1Hi3j1eJrWqCdVR0oWWyFPjlGtr9aX+rtDwHuGOnX5dKF
 4IMSACLg9NDHZ3D0ZFYJgnPz5+AVoha+RHzrnQdcNu2RZb0UeFPZH2u7i
 hOawe+Tw/SG01cbcXF66NsZOsp2Ld1rvsk1sHFuOBnwUMzOIot3/qk2uB
 wwTTd7c5XG8pbZHjA9hEI72k1GLO/wWH4r0F/MSwuxJ+FAyNLi8SgZpoT
 I9T2l2UHUPbY+tcI/DsddVNgniI5ilpOVgBLCBKkxCAUJswg9ZNIVPitV
 4ayRZdSenQS6/NmG8C0ldfZwXc9nHgCAn7O7b+BLnrykoOuA9fh4lUv8C w==;
X-CSE-ConnectionGUID: G9vRiq8xRzeV6U2dA+W+uw==
X-CSE-MsgGUID: AJuAFb89R/aKWZ/atNFMnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="64995354"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="64995354"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 02:47:11 -0700
X-CSE-ConnectionGUID: 2OzIo12TTmCRQrT2N9f4yA==
X-CSE-MsgGUID: OzlftGKBTNiLg2+TUMjecw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="179725202"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 02:47:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 02:47:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 02:47:10 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.83)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 02:47:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPNF8ddpirembwR95CoiesUzFXDSGDmG4EgIX8bnqfVgiEVym8v/+GLb2Gh/UVMoBpDeRRvqcnDH214Zowtz5Hn+f1VJWHEWu4w7ryICXYzoKII0TcRo/v12loutBe4zGwuFAQqRZebcw3AUvOfNqt+XQo6GdcTqBYuJyI4VCGEyCctUM/YE0FJKBh9URsLjFjtVUNHrExEvb01sQZS7BMvow5te3NexL21c+bmgrouZ9s7f0f54DTh63nakEJmV3LboOVzbstSjjoPbmw/sFd8Rb+BxLq3aSWEzMfCA4nL2+Yy2K/EpYqBPqhIFk+y3EZ3teeefGEmOWvMVuahEqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrNlkgM/BAdaFiNAs5dQLxa4mnMFt8hUayDnOgpx5To=;
 b=O3XVILCWGUWSoeIZSjB9JE4d19F/0Ap7b0I5dPiRIkNEiDSyJBMd0r1ICBFUvimz19mD7eQx4CSv7dMRm+DSCBlVczb1deiahhQ21M6O6sfWKowXHEFIZM0qBLuslcZeMYVskASf9djdNGHrDKYeMSyVWXH++our9thVOFyH4kK1QjZkuQ8G5vM+vHxEG4StVY8ZB7F0sfHyedomdJvjvzc2/w4gUAGtMNrsmYg9Sk3ORbQqcfAiZCRwKnWf+mcaAxJLogvmScM5roEnz1wQNyG9RYNH6CnuMQ04QWOPgJq12SCsS05EiDMJIcedzMVt7tNBVP3A8g8dQO2xtn6OnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by CY5PR11MB6186.namprd11.prod.outlook.com (2603:10b6:930:26::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Thu, 10 Jul
 2025 09:46:27 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 09:46:27 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH 2/2] drm/xe/sriov: Mark BMG as SR-IOV capable
Thread-Topic: [PATCH 2/2] drm/xe/sriov: Mark BMG as SR-IOV capable
Thread-Index: AQHb8X5HllDqzxBzFUmEH7Bri/j2E7QrGykg
Date: Thu, 10 Jul 2025 09:46:27 +0000
Message-ID: <LV3PR11MB86950B232F1FA73186DCE97DF948A@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250710092630.370341-1-jakub1.kolakowski@intel.com>
 <20250710092630.370341-3-jakub1.kolakowski@intel.com>
In-Reply-To: <20250710092630.370341-3-jakub1.kolakowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|CY5PR11MB6186:EE_
x-ms-office365-filtering-correlation-id: 93f171e4-6a81-414b-6366-08ddbf96a3db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?IVDyG1gxtYZ9p39+inxlZhl6abQbsOq816CT9rfbXk0+87Y2+OpeT4mNzaj9?=
 =?us-ascii?Q?B0y89EKMHg0zevhbbwKFc9jQZyFG5sIS4g9xekGH8srF+vK1KU2aYksHNtFQ?=
 =?us-ascii?Q?Hp6wHvHsepE4IOdPky+ozD2tCxTKkn3XWTWkuCybaXmyLbLl14Q0Gl18Ztjd?=
 =?us-ascii?Q?BFHOU+XW8L4HAsOFUfpEbvAuGI9AkQkrAuh+1eR2o04jyEDvG41Scm01FzKg?=
 =?us-ascii?Q?lyk53N0VNQrrNmIdY+tV5AdUXs33FK9PS9ojNf1bINDf2v9XZxUvZkbD/OWs?=
 =?us-ascii?Q?HNBut6WUUMfebq6Q4hTgcfaLlRv3CqLuVg1c4HwP1f6BA9FVX7DyQfJ80dlB?=
 =?us-ascii?Q?a53D9aJyuQtdaz3GBzLKbRF950/mMHJnEeQ8CtX4132czBfaOs5SSneaIv23?=
 =?us-ascii?Q?80lG700y24ZA4wZU7vKm/TRRa8g+1eX8Ip9iUF5h4QKfmlgMONHgwBiwxNI6?=
 =?us-ascii?Q?Pyzf/82klka0Rzu9tr6DKk7hm8I9HKgPC1hiXc8Mbri8D2zmcf+DfTfWhIqg?=
 =?us-ascii?Q?KWFhctdlp3Z/ycYjVgBD9I0VNYtpncLUBJSwD7oC0rJCxhyLfsrEVyhsbDjG?=
 =?us-ascii?Q?qGkbsRxX/223+4UHmHapymkeKF1w6blSJB83t5h1FtpPjPyXqY7rBDxlXcMc?=
 =?us-ascii?Q?z9Tp3x0U0QPreAW7th8+82hSoJvDMhRHe4XJttIN67WGrUBVyIha48FoqDgG?=
 =?us-ascii?Q?4rTbvJX8zZBdtreikJAuZeM6QMY4RU7RNkjeoRaAc+cURh6ugvtM1KX+Zg9D?=
 =?us-ascii?Q?WJUpz0nWIuTa6cibGJhYOFrVpCUiITEl+Cq+zCg5ImTH+cqWWU3CRkSa27Kx?=
 =?us-ascii?Q?h6KJGU9O8lDw20r0jG0MhQp4Cb0C4Lmar2peMo1ij8t0DJbqIhmYdpPidk7Q?=
 =?us-ascii?Q?3VeeYaRfwPQW+JqcQb4wq5ITeQwfK3cnb0RNZEP6PMFoW7HklwJr/tNjrkU5?=
 =?us-ascii?Q?TtJ9Cm0iSYoUgcWSStgJcSyfpgAVz9z5RHJkRfDjcSNpb24xaytQI36E7/Cd?=
 =?us-ascii?Q?tWrQ4pwubrWWrkqbKS1kvrePjMK9PmnOIEyow4uPNndoTHoWXTzTx+bIIaMA?=
 =?us-ascii?Q?VnhVZtRwf7WeSI/I5zqUtaTJWi1/3qzW66/6QgYjnDxlrnLUrGlixjTIJa3R?=
 =?us-ascii?Q?wDE3Xpp43nbQ9zXzc+D2cYImHowOMIsMecGnk88vBCZe3cdCxahxjwyiQjMu?=
 =?us-ascii?Q?Aq/n7wrZ3lYfculnvXbeMuOXEob4Hyo/wO0X41tl7UtZc1WGAwmN3/a4Y8qV?=
 =?us-ascii?Q?LKV8jrg+8LWUpxMzM6lgkic9DFLFke5T1uUlHLwzXj4+YgkX8UD61XCKo8nY?=
 =?us-ascii?Q?SUR5EPGt6WSYpbuCQUr+cPF5JMQdyFIP1WEF3njZYusGmnpVu8n/DxaDxc9t?=
 =?us-ascii?Q?qnUbyrwyQv3eljFS7hJ7I/taQdZlZhrbsUOrjC62OzMP9vizSWMrVf1Ug97U?=
 =?us-ascii?Q?NJhgDyHJqZtmYazQkACRbg920uvIzfeUCEqQet1adfZiKo9isvpjWg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YjZcx6dQ+YuJYbvMXXz+Wzl+tGxjCL8Le4aRDFfJTJACioS0UNWP8MwiYu/n?=
 =?us-ascii?Q?vnIwI/i1Nyo+Oln/XjM6Xfa1Th3HHfYtY6BjDfgIpqcOHmw9j2vy/T6eJon4?=
 =?us-ascii?Q?rtG0N4X3SENohLwPhVMUvwU1/rdUfkMmnq90IZ44c731FsA/qhDYqIbMphTt?=
 =?us-ascii?Q?JL18XksUJU8bNzTNfAb8+LixymH+EF6tG1MZup8BMqaa+JEF/oh3dk7D6OdG?=
 =?us-ascii?Q?yVVVFAAevWt/zl87HG8gfh6t02yqt13bZdKdWTra90TmT0LIB7Ha9Rt38B1g?=
 =?us-ascii?Q?R2F2xt5WgUBvOdjKftq8H2AxknivYJirjXOICGVl4o1rseepGqsYdVs9K1kg?=
 =?us-ascii?Q?x0rf1gGmZDtkCqnhDdPUhiqtmJCoSUUPWT+H0AMAjjeJ7RE6dJ2mYSTWEDeo?=
 =?us-ascii?Q?fPR5Tvt6n9/V+nVoFlF0G+KVLvDDOBSAVxuSbYsnWupgQ3CRUe5zSCsJV7IF?=
 =?us-ascii?Q?jMSI/iNKn5HMK1wf0DRLbGoa0U9+4PUJIvTr2L/mtMLa4SvnGDnWLLI8R6zP?=
 =?us-ascii?Q?xgUKfy2YJ+nSicu628m7QMLJ12Rt2n7kZOspO4VHeteyQiwhMsXLl5Zf5K6l?=
 =?us-ascii?Q?iSzYuCw1KQEZWzWo1xvgd89kCN6lzkOu95nnE9Twpd/WhrPLB5oIwz6jtrCT?=
 =?us-ascii?Q?8ZNqsLaKCLJgDIvqMcqIAqvwUcJ3c6gCNYo30MV1WfcNox4STWiWDO/bo7qB?=
 =?us-ascii?Q?JM+OM+Jk7qv1XJT6sHHc32IzplpDeGXKVRza9+iRPkcUU51rUJyTW/sBomRy?=
 =?us-ascii?Q?EZmnsm0BmsZ13s5oS98Vw66G9t47wBXK35d0Ix1deCK0kRR2SLUeUS/5h01L?=
 =?us-ascii?Q?g8UL0ulVkZHDmS6TS9o4U3JE0+4INeeAC7+qtSFRQeQmGxKI9atWTA8q/wb5?=
 =?us-ascii?Q?8ec2s8OOM97mM+VJj9EzayGr8XTg0HH+n/TMUo0v7z6qVcjhJJeAGdgEPU2x?=
 =?us-ascii?Q?qgwTo9ehqjk8SK0cg0A13Eg0iNIi7P7CO/uNnoy8oJIpe7Q2MC9TapBTsief?=
 =?us-ascii?Q?qi1i6tosGYNj156/6AhtRRKhgpL4LFiJAYG8CcMehJAZWfcKLdQFtvORaCD8?=
 =?us-ascii?Q?Va4lH5Yy2v3RAGRcDa36FIMb880jxqgVnp7SpLrnOOJpZuXxnzY61eb5GlZk?=
 =?us-ascii?Q?lj4Cu8FIqQ92LpChMsrZyS4YY4o7WrLZd7cNT45K9QOH4W9IWvGlz1XRGS7p?=
 =?us-ascii?Q?mNMHMP1wocSe53k6aYw+JfwUV9K5qaTkhkIo4ZKu9Pdbb0zEoe74X3Qz4/C7?=
 =?us-ascii?Q?Cc5tr9K4mPGJQ4plGDpUK4RW6QeZRG+48lEG6yrQD/F8SRi0ma5kpYiGk2wN?=
 =?us-ascii?Q?hpyTQazklVeIOTBUcdT7jLz/GD4aqe07LMFgTUkoN8h9dX863yP7bm2rcn0g?=
 =?us-ascii?Q?QNgK2Jr2ihiFMtncT6JQz8lJPMbEclgT826gssYsA9yFcWrfkhN94rm17vFT?=
 =?us-ascii?Q?t/qCJo6FObPrN+1uyMpncO/3IzEEoW6M2YGbAcC/B81DEGDEyp5y/ec6D0t3?=
 =?us-ascii?Q?P+OsoHFQVNYTRGMgYD+y5c8PZGogDyFzbjuCQGFsWqHKk/7wjlwh7D66e7l8?=
 =?us-ascii?Q?r6ITQ+o8lNtOXk7NEiQR28JkbWbF5nRx6QaJ+1cVgX+JiGhTb2T6UIGtDc4W?=
 =?us-ascii?Q?Vg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93f171e4-6a81-414b-6366-08ddbf96a3db
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 09:46:27.1064 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vB3D5jB+LtS2kkQIyygS9aUFb8p0lgzq9tw5VkcQFymz5mbvIgmU168KOlVVQwQr1Zo0wCgS0TL9/jtUv2R4Bcbk/US8pHfjNmcs0nBsbm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6186
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Jaku=
b
> Kolakowski
> Sent: Thursday, July 10, 2025 2:57 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> Subject: [PATCH 2/2] drm/xe/sriov: Mark BMG as SR-IOV capable
>=20
> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
>=20
> Some BMG platforms will have SR-IOV enabled.
This commit just enables sriov capability for BMG. How are " Some BMG platf=
orms" identified?
If it is applicable to all, please update commit message.
-Satya.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index e9c5d3150efc..0f5147e26ee4 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -331,6 +331,7 @@ static const struct xe_device_desc bmg_desc =3D {
>  	.has_mbx_power_limits =3D true,
>  	.has_gsc_nvm =3D 1,
>  	.has_heci_cscfi =3D 1,
> +	.has_sriov =3D true,
>  	.max_gt_per_tile =3D 2,
>  	.needs_scratch =3D true,
>  };
> --

> 2.34.1

