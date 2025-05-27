Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E5CC54ED1
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 13:45:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5BA10E150;
	Tue, 27 May 2025 13:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YH8L43kg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B62910E3E3
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 13:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748353553; x=1779889553;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dXiANwVNaeBYYWs0enlRHbY1bCHx+i7bn5kGK1nt0pc=;
 b=YH8L43kghroR+OkTaR+PEjR1k3PMQjhLk1qJujfv/bT+dP+MtdlygqI0
 3C1bvolwdSID2nVh+tqdE0XZHTXm+DLu+Gpcc3rbq+cZP4qnGj8uHOS5R
 hT2O73QmzqwhOuHfJFde+RDReX2eEPg9MiavP46F8vGbBJ7Z52f7/B3eH
 2jM90Da1LIddnT8PljEQ761XtQW1cNcGBtSj+UZGIw422s6d2IyZs6+2N
 n7+B6iJn1vRjqt4qdE0ZjoFFTiOpMKGDIBgTl6N9xQD8hr4tAPE3vQle3
 8bJ7H901FXm0T/gl7onI7v9AtSqQVjGPHCuuGXKOqvOWG9k9MfCwS5NSQ Q==;
X-CSE-ConnectionGUID: wC/IZekkRrqVuLBN5Py6YA==
X-CSE-MsgGUID: vcLu8thGS5epy0ADD6e79w==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50398294"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="50398294"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 06:45:52 -0700
X-CSE-ConnectionGUID: YWSElaPZSWiboePy3YsBkQ==
X-CSE-MsgGUID: RXjYs2+eTH6EexC/Ot6/Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; d="scan'208";a="143785206"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 06:45:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 06:45:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 06:45:50 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.44)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 06:45:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XGr32xWIAuLYzsANaRYTB4STlCiWbjj7HuOIObIW53oOXcwfE1HHxt+FltsGVaWsYLsbQd79GrhZ+Syp4W/dgDN399Oj7WYgw3aU5UY9QxVdNkF5KTIvIFQLNoRmTSbC2wJaJwwJNgbcduqh2Vd8umybsr7IO9VCg5JvT03gAMkL5IREwLm/czXoFfWZbQy4bTAiAinSAoS68zl2GMykFHz5OQJhEfg5Oh8u9mw+Kow02rFGy56ow3x2sfzopw4ctT6iVB+CYUkIytyuxlFyiA3ISLmwyqWeLsbqrc6LTLzalHYzQ2K2vEDEnIZeSNfysojskHOuuE4z5n6SMj404w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTldsiMWcy0B1ww5IFJH5nuQuJ8WQOuGOd5gHGlAGsY=;
 b=y5YTCqU8ICiEv6o4r5QntqlPHFl33wAlDfYIRQOPRfxh6CwwVkGg0/N8yd8aAoWKa5fvieFiOXPrtLhitmnlX9MpyDBVF/RWhS3TbXT8grIhkboTA69PEQVRJG2t7bSfOhkavyYq4xLGv/DYgIMgov47XqCR+O5l/ItTm3QWTOlgzVls+GEtXTTrx3mmRyk5lITyKhl0atF/4Jj2QQRRxALJVvUVoAWyj/wQlWcwO5bD7wQJS1dVVP8tHnHw/Y78VHOA2FhQqqjUdJHRCL5yFy8goukKU+4HqoH+V0a2oWy7/Kob+3LUGlaQac64lcyiWxvsokn+wja168Ucjh6uIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by DS0PR11MB7407.namprd11.prod.outlook.com (2603:10b6:8:135::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Tue, 27 May
 2025 13:45:46 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8769.019; Tue, 27 May 2025
 13:45:46 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Winiarski, Michal" <michal.winiarski@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Piorkowski, Piotr"
 <piotr.piorkowski@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH v3 5/7] drm/xe/vf: Rebase HWSP of all contexts after
 migration
Thread-Topic: [PATCH v3 5/7] drm/xe/vf: Rebase HWSP of all contexts after
 migration
Thread-Index: AQHbyRScdOw+H+zsjUWAVvmQk/FD4LPmiI7Q
Date: Tue, 27 May 2025 13:45:46 +0000
Message-ID: <LV3PR11MB8695BBF82377FCDCE35B5545F964A@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250519231925.3196154-1-tomasz.lis@intel.com>
 <20250519231925.3196154-6-tomasz.lis@intel.com>
In-Reply-To: <20250519231925.3196154-6-tomasz.lis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|DS0PR11MB7407:EE_
x-ms-office365-filtering-correlation-id: db3035fd-9303-4d59-6f67-08dd9d24c894
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?q7Rf810HauPHxo7jsuv4nvFiQqExWh0sMUkqQvK4NmA0wdG+tHp7sRfrdx6x?=
 =?us-ascii?Q?0h6t4b5eyvzHnGTsSGzZ5eeLBekETSOTXN00x7+9f6JjfvRFJ5I94DkaRNhq?=
 =?us-ascii?Q?KBYgu+JaPDPorBDsKaZmxYph3r7VbO4j2waYjVGagh12UVUTbkqs58TVLlbr?=
 =?us-ascii?Q?wwPh16Y4aAE5X4nVVHsOAS8WXKNsRX6bQuQ/OYUlbwr3TNWj5jezB7nFkomV?=
 =?us-ascii?Q?5gz6l6LhR2Xuaqa4ZerYB69AAYliM8cJjWDGMnTY0uDFTCwQZuGQzRwl42nb?=
 =?us-ascii?Q?81SrAw+2EAzSbnvhnl7/Fx8zHFC6TnlZ3rx8rHwkhC33TPMoZSR5LrWGaLkD?=
 =?us-ascii?Q?RPquYWpdLJrFfIq7n5iFR5bHQvTj4Y1O84H2FFT6bFF4cslqQLxoomkyVk1s?=
 =?us-ascii?Q?WY650+5pxHtjJyqR3RAxPWVUa2MnDk9eVfW3Q7olWJU3UjkkzMxAsSQv5dly?=
 =?us-ascii?Q?RF+wPPGtR7s8rxvGMcmBO1laktKj1nlM5HyrwsYVhe0ShZo4N3Myg3Y5KSBL?=
 =?us-ascii?Q?yFBb6FZvH2gAb08cT7g4WhPcolHMdT0XHaFKSLsPdMf98ZKs2knTC2TvjOWd?=
 =?us-ascii?Q?B1K+alzUp5qTMsejRksY5+iLa4nC4FP8CW9lSjO86DCfAEcY7rJY2zrV9rBw?=
 =?us-ascii?Q?ySnRzfTCvcMsxuj8eq4IgkyN8M9YV5OFp77OdU05jB3ooLTW+RMMn7Xgjy8U?=
 =?us-ascii?Q?vplVEUtlBFRpYU6nv/a0yaWtfnuJ3qpL6AYBhCvZFQSvU7xc2D4UOYMtzm2v?=
 =?us-ascii?Q?LWCH4VOxT3egwnxcjfE+c7uCqN5u23GcJHwg/vqcAPLYJYTz6kfqeuJQAoTu?=
 =?us-ascii?Q?/tJAWEFdDC92NcBfdfbSqErQfZdUM/q6+NKDe+mrxHcoOsbixdfp1J4CeNoC?=
 =?us-ascii?Q?fNfnp/jgkXNLGjg8VIs0dcpJOuEzRWHV1zKFress0f4BU7cwpIbQ0qV8cRbl?=
 =?us-ascii?Q?p7JNh+/7XM2pxRuhLNSGz9y8MRwtP7lXS/AiRatb0ymBwr0mOwmnN3RAMhuu?=
 =?us-ascii?Q?q3GonoWuHDfin5gmNKZNQCKlrS4QLE/vtF8xbZ4btFrLmlzC+6InqF3NiPbw?=
 =?us-ascii?Q?GsMajZAJ0XdK2aY/h6ZpBoedDueORE6oihfoyoY7qEm7mMfG7kIa7KL8UATA?=
 =?us-ascii?Q?fTj4W1ayYet0qNj3I2BEHwhD5RsMB15oOBiCZEdr06b0rsxgma0WiiLmUHEo?=
 =?us-ascii?Q?iA8xrOrBcLQ0RpVpm1YgPbaJ//JueXG/aZGM929KeraNSlxT6O510nXaJwWj?=
 =?us-ascii?Q?wCQEfWAeULX5ltrOmg6aeuNTbOD99W5ByrE/xv951+Q3ANgK9avyei2x6eYS?=
 =?us-ascii?Q?Y36jUQRCUskEBNQ4cc0VxAymGWFnXs8Uhu3GBToxj9HgYHD7V4UbCzUR2Xlm?=
 =?us-ascii?Q?VTZfdoZJbqYNigFUePPZgmEWfq5aGNB0ZeNhUqLgDfSCDS9ipArLnLNEEVFw?=
 =?us-ascii?Q?Hf5MJ6TRgzv4Lx9m2irStKmsaJODskiYux4gxRiLBBk8k9HLISDIy+CDqWcj?=
 =?us-ascii?Q?PATSZ/CwedXLp3U=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nHxuXBIDYKMLgDy1fzYRlFZYyLXULcZPf0FMwwyOcYXN0dOts0mXyPN1c4Hr?=
 =?us-ascii?Q?6SnTTgzoQ8sEceVJvaTAA/FnZPitWdZqYw4ibOkNNOs3BG33XvU5N6iMkSjh?=
 =?us-ascii?Q?BiXzzhgJTHmFMsG4pCbmhuEgv+NPZCVs2eWYGkxfWHOB4KwrGzAbBSp456UW?=
 =?us-ascii?Q?G2PzMAssvXPW5fenspCz4WG+P4XNE+IM0jmBQAhqKVEZyR+1z6guv4o2Ojza?=
 =?us-ascii?Q?HiVZFz2YxqLoWpe+9YNN4HbaCnHima+oibdVEwhxVdUagJPvMz7O+qEqZlCI?=
 =?us-ascii?Q?72vC00onCc+l6uYACZeI0P9EwEIvzEQg6l/UsTK9QS3mlf8iAr1VDfmyUlKE?=
 =?us-ascii?Q?ciLcbdsEPXR3f4i6TgSOIpqg7LgJkI3+eVpC5Y/Z3/MWSoGMKpiJw2ndGhJt?=
 =?us-ascii?Q?qEwBItfL/lk78p6/IUGEsrFj6JaqYho6P9UTghReORagVX/oApCZQe+y39by?=
 =?us-ascii?Q?dm5ICDf2OUcgjXBJKFZ78B/JaU2DLIEoxM0+V82SrhmeyfqeTS/Na6sP5H7M?=
 =?us-ascii?Q?BE1nWti3Nu/WAWxcW6j/mk3n8kJ93vwP3IT8ABCTx8Vm6IIT26yC3XsVfLsr?=
 =?us-ascii?Q?puShi/kW5AM4J5tOUOmbbmG5vgeHN2Ghe9+aOgqRnr2ttZMBnTyzjnDMc0g8?=
 =?us-ascii?Q?VOxxwIT76p5HQf8laEKeVFpCQK1zjQbAa/5W+cWIffenLmcjHIxg9PM3eg1k?=
 =?us-ascii?Q?LWooaYczjlHDIx27UYNHQwl/dRWrAEwUJf20bqIwlN2PeJmiihUE4ikmqF1W?=
 =?us-ascii?Q?ZZ9KZhA94AIIOhkt58QumsYc6ArQqDfJPTx1/C1V3eftu0HmmvB3EbPz7neF?=
 =?us-ascii?Q?8savFYwn/Q9WbQis5GBmVfwgwHgEZrDSJBiKWdB4rALL3mdZuXQvUgfIlWL5?=
 =?us-ascii?Q?145lxs2TYcg4jfty7f5AkWVNc2lDQlNRoYZ/kbVmE1KCLUVEnTPYBtbGNeAT?=
 =?us-ascii?Q?vCais3ZKYqPYAXhtvch2aIJfDUVnbkiaribsL3yd1/YcnIaRPN1EEGfn4erK?=
 =?us-ascii?Q?JcdFxP0aRTvo2Ad/IlOGxbwg6n/a4Sl8euu/+99P+ZF9dJcnMDcmPRvJs0+e?=
 =?us-ascii?Q?Cw3wkh8IVbVnhCO8LdgpwRyleWf4B7m+KAFQT1w2SVY/n3V7cN8PakGPRp1V?=
 =?us-ascii?Q?fIZTP6nXVJALXYJIUHmqTLgtYQ1LJqrGUdoljha3bSI0JT5WsPNVFAv5wEMN?=
 =?us-ascii?Q?NK2gBU2VdeQjVhleNpIL85Eq+6AWLf0oPKQeJbTaiyxcaeYTlg1hV0tc4uf3?=
 =?us-ascii?Q?xt/93dHHSRG1jAbv3IHCXfEbazqF2ODzmhG0d3Y5oM1P5Rqjx5LsmPxbo7do?=
 =?us-ascii?Q?BQbIlFKbw7F3aBOd2+cew0KWH5IW3eBEuOmDA38jSoaHnsAKhMO0vXAU5A69?=
 =?us-ascii?Q?RxMGQhS96ZotI6mvXTjFPUUQ61Wy2HYCRTHtFJ47Hz/5XOEYpUm1HHvx/G0b?=
 =?us-ascii?Q?F1FEiwiw+7q+MfmXUDxntX7qa8di8QOYgw2p1apgl5uqEjO7aCjxifC+tTZ8?=
 =?us-ascii?Q?wg/FoXngZZblf3V7Mx4J40vOgKMZXx53yE+O+s4U1D24ZBLjnjl9gV7jGddi?=
 =?us-ascii?Q?NOyTAFnwlo9g8M5sopPTr0JBsueUHgZs4G8grmZzoJnlWqriivCm7alBTCiH?=
 =?us-ascii?Q?yQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db3035fd-9303-4d59-6f67-08dd9d24c894
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2025 13:45:46.5487 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3X4AAP01FqLhp91y7afNnv4peecw0t5JBCwfTVUZLgTPNWUQ/tq3ak2Jg8u05udpgDCsiWHYb+VYHcFpZm8Ul6lYK/dIjHxjHFYr0HzUgZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7407
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

Hi.
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Toma=
sz
> Lis
> Sent: Tuesday, May 20, 2025 4:49 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Winiarski, Michal <michal.winiarski@intel.com>; Wajdeczko, Michal
> <Michal.Wajdeczko@intel.com>; Piorkowski, Piotr
> <piotr.piorkowski@intel.com>; Brost, Matthew <matthew.brost@intel.com>;
> De Marchi, Lucas <lucas.demarchi@intel.com>
> Subject: [PATCH v3 5/7] drm/xe/vf: Rebase HWSP of all contexts after
> migration
>=20
> All contexts require an update due to GGTT range shift, as that
> affects their HWSP.
>=20
> The HW status page of a context contains GGTT references, which
> need to be shifted to a new range (or re-computed using the
> previously updated vma nodes). The references include ring start
> address and indirect state address.
>=20
> v2: move some functions to better matched files
> v3: Add missing kerneldocs
>=20
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 13 +++++++++++++
>  drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c | 16 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
>  drivers/gpu/drm/xe/xe_lrc.c        | 16 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_lrc.h        |  1 +
>  drivers/gpu/drm/xe/xe_sriov_vf.c   | 17 +++++++++++++++--
>  7 files changed, 65 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> b/drivers/gpu/drm/xe/xe_exec_queue.c
> index ce78cee5dec6..d696c8410a32 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1041,3 +1041,16 @@ int xe_exec_queue_last_fence_test_dep(struct
> xe_exec_queue *q, struct xe_vm *vm)
>=20
>  	return err;
>  }
> +
> +/**
> + * xe_exec_queue_contexts_hwsp_rebase - Re-compute GGTT references
> + *   within all LRCs of a queue.
> + * @q: the &xe_exec_queue struct instance containing target LRCs
> + */
> +void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < q->width; ++i)
> +		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h
> b/drivers/gpu/drm/xe/xe_exec_queue.h
> index 17bc50a7f05a..1d399a33c5c0 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -90,4 +90,6 @@ int xe_exec_queue_last_fence_test_dep(struct
> xe_exec_queue *q,
>  				      struct xe_vm *vm);
>  void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
>=20
> +void xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 69ccfb2e1cff..990f3265c7ad 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2424,3 +2424,19 @@ void xe_guc_submit_print(struct xe_guc *guc,
> struct drm_printer *p)
>  		guc_exec_queue_print(q, p);
>  	mutex_unlock(&guc->submission_state.lock);
>  }
> +
> +/**
> + * xe_guc_contexts_hwsp_rebase - Re-compute GGTT references within all
> + *   exec queues registered to given GuC.
> + * @guc: the &xe_guc struct instance
> + */
> +void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc)
> +{
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +
> +	mutex_lock(&guc->submission_state.lock);
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> +		xe_exec_queue_contexts_hwsp_rebase(q);
> +	mutex_unlock(&guc->submission_state.lock);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h
> b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 2c2d2936440d..2cc44298465f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -44,4 +44,6 @@ void
>  xe_guc_exec_queue_snapshot_free(struct
> xe_guc_submit_exec_queue_snapshot *snapshot);
>  void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
>=20
> +void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 61a2e87990a9..525565480aef 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1184,6 +1184,22 @@ void xe_lrc_destroy(struct kref *ref)
>  	kfree(lrc);
>  }
>=20
> +/**
> + * xe_lrc_update_hwctx_regs_with_address - Re-compute GGTT references
> within given LRC.
> + * @lrc: the &xe_lrc struct instance
> + */
> +void xe_lrc_update_hwctx_regs_with_address(struct xe_lrc *lrc)
> +{
> +	if (xe_lrc_has_indirect_ring_state(lrc)) {
> +		xe_lrc_write_ctx_reg(lrc, CTX_INDIRECT_RING_STATE,
> +				     __xe_lrc_indirect_ring_ggtt_addr(lrc));
> +
> +		xe_lrc_write_indirect_ctx_reg(lrc, INDIRECT_CTX_RING_START,
> +					      __xe_lrc_ring_ggtt_addr(lrc));
> +	} else
> +		xe_lrc_write_ctx_reg(lrc, CTX_RING_START,
> __xe_lrc_ring_ggtt_addr(lrc));
> +}
> +
>  void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail)
>  {
>  	if (xe_lrc_has_indirect_ring_state(lrc))
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index eb6e8de8c939..e7a99cfd0abe 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -88,6 +88,7 @@ bool xe_lrc_ring_is_idle(struct xe_lrc *lrc);
>  u32 xe_lrc_indirect_ring_ggtt_addr(struct xe_lrc *lrc);
>  u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc);
>  u32 *xe_lrc_regs(struct xe_lrc *lrc);
> +void xe_lrc_update_hwctx_regs_with_address(struct xe_lrc *lrc);
>=20
>  u32 xe_lrc_read_ctx_reg(struct xe_lrc *lrc, int reg_nr);
>  void xe_lrc_write_ctx_reg(struct xe_lrc *lrc, int reg_nr, u32 val);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c
> b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 82b3dd57de73..0f0d1a97ae1d 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -7,12 +7,14 @@
>=20
>  #include "xe_assert.h"
>  #include "xe_device.h"
> +#include "xe_exec_queue_types.h"
>  #include "xe_gt.h"
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_submit.h"
>  #include "xe_irq.h"
> +#include "xe_lrc.h"
>  #include "xe_pm.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_printk.h"
> @@ -223,6 +225,15 @@ static int vf_post_migration_requery_guc(struct
> xe_device *xe)
>  	return ret;
>  }
>=20
> +static void vf_post_migration_fixup_contexts(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +
> +	for_each_gt(gt, xe, id)
> +		xe_guc_contexts_hwsp_rebase(&gt->uc.guc);
> +}
> +
>  static void vf_post_migration_fixup_ctb(struct xe_device *xe)
>  {
>  	struct xe_gt *gt;
> @@ -303,9 +314,11 @@ static void vf_post_migration_recovery(struct
> xe_device *xe)
>  		goto fail;
>=20
>  	need_fixups =3D vf_post_migration_fixup_ggtt_nodes(xe);
> -	/* FIXME: add the recovery steps */
> -	if (need_fixups)
> +	if (need_fixups) {
> +		vf_post_migration_fixup_contexts(xe);
> +		/* FIXME: add the recovery steps */
>  		vf_post_migration_fixup_ctb(xe);
> +	}
>=20
>  	vf_post_migration_kickstart(xe);
>  	vf_post_migration_notify_resfix_done(xe);
LGTM.
Acked-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> --
> 2.25.1

