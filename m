Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E6ECD98C7
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 10:11:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B39D10E896;
	Wed, 10 Jun 2026 10:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fPn3lL0h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3500610E896
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 10:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781086295; x=1812622295;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f7kXf50ki4K4UN4fjIY4y/+/ia6xfYxkbfHe3Tu6bww=;
 b=fPn3lL0hFOmHmxY8wW45OjvJnMXf4g0O0NiEg8Uc/0otud8Ran9iU/DB
 IEMxl2Lw/kbzKoI8Y1cmjzAKYis/dS+54YLiljV9akT1BWzzX3hvDVZB6
 CeyonTuwzwMRLTFISbN66+Sx6vPtcsMk8GCSdBmPjwbkT6d0vlRLqX6yA
 r5lo7qugafMU6/iQypiCez9EPa5YiLJ8RRVmWpSP1Pf7LRvuLi+WZ1YJE
 hNVCII1SfNBH7KE9+ZLVznwdazYtqNG7EQ3YKyYPERYwv47lAru9zJ/kU
 GTbwqIXhD36jh9kYQwABNNvSHexBXWFSsSATqQIlZR96J04XEjpRL7Ron w==;
X-CSE-ConnectionGUID: wkMnASgnSH+0vPBbtYycyw==
X-CSE-MsgGUID: hegy5L0aRP6+V1qilTVxrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="85501845"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="85501845"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 03:11:35 -0700
X-CSE-ConnectionGUID: oqYkSBlFRW+1Vf/x/AAtZw==
X-CSE-MsgGUID: 8JfFjMdMTjem7+XzC4I2Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="245276820"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 03:11:34 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 03:11:33 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 03:11:33 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.13)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 03:11:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdpo3vIgHRAL4ttMJFLrfkLzDzNdpGHW9fhc3AvFIUUGlrP9ZEHafhOZ8Kko/Fxqo+tRTneAh0IN1lJp2a53KS6fs2eUv34worHwf1rturGo+ZSQcQH7xMh1AuFmPUjDNgMB3TMaOBnvQT9cwkjihD5R/RiXeidvZxKJRFh0/fc2KvFDzWTdFOYyfHwQ4ldgZ4hjNIzhMBdn/ncymCNjEgukzegagqX00geANlC6WXo2KF2QO6tqtf+sj1bk+XkGoZRN+Vns1D4nSVW20/qQ5i9Vb40ua6crv0uwq6sZzIPsUmWgzu5YhaF4RmB2K2g+U+BaDtUrFurRvTgJ0m/NMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gBa3ZEX6Rar8h2FKR+NoZWUPoZEcM4s6grzfvnvzh4g=;
 b=crdiaUrJv7ZEoZbzuvrkpG7L5dP5671s8WO4XW8NMR5DszR4mqSRck21Zzhr9xNglb15SV7AFLWdriI3zMn3ZBDVQPB+V0CrMvV7/C45ja3QnZMS//R58AZVB1AzsDuEjet3kBxtzMcoC4eJXZi9dbuDllNbBELe/Y+tUjzCHVOecrmnXALVcmY/w8CLlj7XBJC1+I4FocmYYcEiciqSSocgW6gv1Szu06woTho+n4HPEMxLQXzOO4NHLgj4igqS8q9sVVeSgeylrRXlf450HWrmMmHadbdDhtoHNDvqXJWd7ks2dSBL705GIIC5IG0g7cOOqmjUpew8bX5NIJ9eWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5242.namprd11.prod.outlook.com (2603:10b6:408:133::18)
 by MW4PR11MB8268.namprd11.prod.outlook.com (2603:10b6:303:1ef::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Wed, 10 Jun
 2026 10:11:30 +0000
Received: from BN9PR11MB5242.namprd11.prod.outlook.com
 ([fe80::5657:45bf:d335:24d5]) by BN9PR11MB5242.namprd11.prod.outlook.com
 ([fe80::5657:45bf:d335:24d5%5]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 10:11:29 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Purkait, Soham" <soham.purkait@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Tauro,
 Riana" <riana.tauro@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, 
 Mallesh" <mallesh.koujalagi@intel.com>, "Shyti, Andi" <andi.shyti@intel.com>, 
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "Vijay, Anoop C" <anoop.c.vijay@intel.com>
Subject: RE: [PATCH v4 1/1] drm/xe/xe_ras: Add RAS GPU health indicator
Thread-Topic: [PATCH v4 1/1] drm/xe/xe_ras: Add RAS GPU health indicator
Thread-Index: AQHc+LxV+GNAgE1f+0G5pZyXtYvFarY3kRbg
Date: Wed, 10 Jun 2026 10:11:29 +0000
Message-ID: <BN9PR11MB524249E4353B8EA90D3B1A6C951A2@BN9PR11MB5242.namprd11.prod.outlook.com>
References: <20260610093353.2538576-3-soham.purkait@intel.com>
 <20260610093353.2538576-4-soham.purkait@intel.com>
In-Reply-To: <20260610093353.2538576-4-soham.purkait@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5242:EE_|MW4PR11MB8268:EE_
x-ms-office365-filtering-correlation-id: 7fac660a-786f-4a63-6e76-08dec6d8a3c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|38070700021|6133799003|22082099003|18002099003|921020|3023799007|56012099006|11063799006|4143699003;
x-microsoft-antispam-message-info: 5tNPvUK7Ub0/EL6C8S5IcLIZRqBf2uxPNHBop50ZYQLREQMOn+4LuESfvo4jg2rqP7A5nRYU+cHGkmLImCNMRp3pU3aa4cbkSQKwMtAAr1OZpo/UjqkEaJwcgrhJ1qacKnxx09zPOlA0dnksb5pIYsUq0lUcsvZdttXlGWwgacaMr+TJga+bnIcYKMpzgten5KsTXu5iOgPtv7lMO0jsPZtg0wrPiPP3WFdUEhF+kBo4vdteL/CZXrvWZSC1sCWEgS9EnvqDM4lszQ+1L2VOUTvj6n+OLyW7ZzZ94oFmQzhUA6HuszscZzUbmH4l5fwILlxi4PogVfF4Vsg7KYX7RgJteuEoQ7o43HF93l/CGt+3wyUJaRilJBv2N8ARlld62UJ6/R8SkT5ZBWYI+sjWwsbrCiRbc8RMSBw+oI+YGE8jYC3koCB2sbtFo3Ise16P3g+97rRCWHzOTernl1ADZoZp/XLibuY5Dqfpvxy8hJWi7NbtSoNZCFxgd+SOyB3Noa1ATF4ilDAT88uxt7eXQz8QeQa0eNoPoCz765VI6FPospXsQMuJYEVRipXiJkbR6jouXrVbwMC4rZdfkHGrujb1AGTwShsLtXAFDGy1mFBfEKABFNPg9Q2Psvn/a7hMu+HJC6V+WprMbf/3BOkn2AFy/QCXv8wu5Nx1dq05N4IY3RSRxI6N1LLERsFSQNRr4RUKSpRnEFCfWUcsTCSgdJqguMQp4sQbxWO/Dh5sFp5ZKdjCN3RcQj9Oo3yAt8xm7r/GM0RLVaWZh7sQ4SOU+w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5242.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(6133799003)(22082099003)(18002099003)(921020)(3023799007)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vM0IM5q/kpSuos+Pua46ovhG/0Fx297Aob67uToZyjCWGLKDe49hfDRhKUxV?=
 =?us-ascii?Q?/g2XrJFu9HxHOxdnTeoE2fxO+P2FzzXhX7wA23i0XQP1ym3+QbUDbkXmpWUD?=
 =?us-ascii?Q?tilpigQUsks/1iukwq2DJOD3HhgceWsnhCnh67U1KvBarrCo/RTrnsEdraHJ?=
 =?us-ascii?Q?0db64t3OgCPBh0LSLSo+2PBnGNACkSfy8Bc1lnCDQyTHM6o4nZA/CEUNf9uC?=
 =?us-ascii?Q?pYQsiQSh0nbP38HwhSmuF5CQ/LECNOJQp49iABU4K1lRHArdvhyN5IMz/9/h?=
 =?us-ascii?Q?H41wgnvNUQC4qTPy4J4CFcbYcxqIUVSFPgKlhfOkK7DfiqXWTUUoFb/Dku6u?=
 =?us-ascii?Q?tCx0lvUw/nsONXLj4+OXED5L7H6T4cAAF3nAeRD92vRoUcFKWuPJXLOaJXf5?=
 =?us-ascii?Q?opfvZjRS3UAiUKNX1MPB6xJ4a2MHxPx6+TGvAANh9WgaHg6CVQi6gYPHyJ7/?=
 =?us-ascii?Q?otu6GKLX1S6Vh6McFB+fM778FguJBqOfwXPABhdiiKhcTTWsFpiZDRzh5WTB?=
 =?us-ascii?Q?LThZREc4D8u2QohJNpSyMNjc+pn31R5qIVGFLXwetnqBA18zReAIhRjj4pcx?=
 =?us-ascii?Q?yFXlLOr0El66vwd76idmWZiZhzu+wk+49Nj/gLeg1xU1uzL2D/TVC8QUXj4j?=
 =?us-ascii?Q?x/uVEUs9UP2xf5Uor3USyaKQUdbWUfKDIYyohFM98l5QRwGaLxHG7nxM4kfg?=
 =?us-ascii?Q?vv3iaYffbv5rG+sYFbrBizEyw3I6QiRTwdxTwDDod+6P8+AO82a4BVP+H6xp?=
 =?us-ascii?Q?VMeQjvfQjvAUK4nMK5VEmaB7cS/gc9onk4cq0/ckE/Dmp0TnT0pg+pTk32Hj?=
 =?us-ascii?Q?ZS0TyLZ8WvaleUeCz7tMi9mpUOzqxLrzxsnIBXBb5HXIQD6xydsAeijXIFSx?=
 =?us-ascii?Q?OOETIJBuTn9ykuqbua4DMA+uZZYf+GxKJKw58iUurEsiGsu6IaEDqFUfh6P7?=
 =?us-ascii?Q?dICRWtsPJAFVnvR2KxENDx2iotzw6WuOyr3qZT883Cfz5KmyYiO5Bx6YeGYy?=
 =?us-ascii?Q?0JfGUNegg4uaFJlwtct7KrojYjJDF4RdIbGj6eoR34t17YAESFQuhg58I7/X?=
 =?us-ascii?Q?QGYJKRZgCnDV/dsIG294Xv8rV7pFKFB/BiLii9jzx+NZhjrI7Mn5gOWxuOGy?=
 =?us-ascii?Q?maCaUk9ns4k1oDe32PnH5eGczgTRk5SL6mFfUaSd5MZZaSp3ImtW3LaoCTYi?=
 =?us-ascii?Q?ngAq+DaHNPmRzR888LsglK32sQApZ54QZ+5O4F3Z9Au2iHvSTnQ/SRO1ljvL?=
 =?us-ascii?Q?6CoNv9z8L6RIhQ8pAjwA5o0kPZl1GV4CjWub92vQvrJGN7SlIDw3SJIEzxl1?=
 =?us-ascii?Q?lpHZgaK0rEjo3ShmN1EtxaxKIXcLrl3DK3SG+wUxXRFEesfyvbGB4yHWqj4S?=
 =?us-ascii?Q?JbADJqTGWYUhoYGTW66j6Nbsax1mhH0KRJBMYQ+lDzyvIz8ipD/UfDK1gdyF?=
 =?us-ascii?Q?+LrHX6WKhzVoZH7eoPWwbQu05zU5DA7XdSmKqTsVW0S5Ca1/vpQkxS6Yu+9L?=
 =?us-ascii?Q?NE90G388Fx9n9K0xmcoDh64vR8RVNVDq25uQlZVoTNT+Q3XC4tpMDV+DMRrZ?=
 =?us-ascii?Q?tya70usoeQLaGOMr4jKjgXNZGQxctVf26nEgupqdndhkHS08gFjPGEhY7iSQ?=
 =?us-ascii?Q?In5u4peuUtI6q4jipm51IG6Tj4ltEs2mXcYjwrc5hg4KGDpuncf4S9wX1ulQ?=
 =?us-ascii?Q?BoQ49XS6C8XzPEUbIYm9ZxvYT+3a86tkLyVZ0wKR88HP/d29CHnrc2zZKFGV?=
 =?us-ascii?Q?FZ+aef6wOw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Ur/Osk4lTWPqVfrugcXWKdV+q6U9mpRMZxRMrGWvj4TBTo4Sxjrd9Wf+7YAKs+829TkWrJHnqEwyVGbvqo4lEKN5O13Vdpy6bGsegCIYiPAv5eaKeK8yYPZieL/nIZyKMmj0qM1Jql+r7mJWNTEwOLwkutpBtv80EnThRGtVxhaBF9USaTpHIVqbDTQ6nUJh5pkwVd4s2quT1LIhiOZrm8W7LBOe4dfJ6Dcv+h1kqavqqRvxbK7Cn89HKDzuWfheG9rpJJJdxrZynUP9p7diMrV9kFxymJF8jxzWepBGlYi5QvATO0HhS9hsRslXpCq/QpmFgpC4tay+IcPd3T9r4g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5242.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fac660a-786f-4a63-6e76-08dec6d8a3c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2026 10:11:29.5079 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ANmGC/ESakNBPgSSksXjCZGLy0QNBP0wZDfXYe73UR842yWF79MyoSqfIJTv3/1sc4J3i3tJDj3GOHvJHIFcg0q4KEfiyWco4R2mgkWJGmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8268
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
> From: Purkait, Soham <soham.purkait@intel.com>
> Sent: Wednesday, June 10, 2026 3:04 PM
> To: intel-xe@lists.freedesktop.org; Tauro, Riana <riana.tauro@intel.com>;
> Gupta, Anshuman <anshuman.gupta@intel.com>;
> aravind.iddamsetty@linux.intel.com; Nilawar, Badal
> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; Koujalagi=
,
> Mallesh <mallesh.koujalagi@intel.com>; Shyti, Andi <andi.shyti@intel.com>=
;
> Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Cc: Purkait, Soham <soham.purkait@intel.com>; Vijay, Anoop C
> <anoop.c.vijay@intel.com>
> Subject: [PATCH v4 1/1] drm/xe/xe_ras: Add RAS GPU health indicator
>=20
> Add a sysfs interface that reports the current GPU health state and lets =
admin
> users and management tools update it but is readable by all users. Reques=
ts
> are routed through the sysctrl mailbox. The interface is present only on
> platforms that support the GPU health indicator.
>=20
> The interface is a single read/write file at the device level:
>=20
>   $ cat /sys/.../device/gpu_health
>   ok
>=20
>   $ echo critical > /sys/.../device/gpu_health
>=20
>   $ cat /sys/.../device/gpu_health
>   critical
>=20
> v1:
>  - Add enum for health status. (Andi, Rodrigo)
>  - Return error number instead of error message in _show/_store. (Andi)
>  - Move GPU health sysfs init error logging to xe_ras_init. (Andi)
>  - Return only the current health state for sysfs read. (Andi, Rodrigo)
>  - Add documentation for sysfs interface. (Andi, Rodrigo)
>=20
> v2:
>  - Make logs and structures consistent with their counterparts. (Riana)
>  - Drop unnecessary variables. (Andi, Riana)
>  - Add correct KernelVersion. (Raag)
>=20
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  .../ABI/testing/sysfs-driver-intel-xe-ras     |  30 +++
>  drivers/gpu/drm/xe/xe_ras.c                   | 177 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ras.h                   |   1 +
>  drivers/gpu/drm/xe/xe_ras_types.h             |  60 ++++++
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox.c       |  28 +++
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox.h       |   3 +
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   4 +
>  7 files changed, 303 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-ras
>=20
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
> b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
> new file mode 100644
> index 000000000000..c7f2cf8bb6ad
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-ras
> @@ -0,0 +1,30 @@
> +What:		/sys/bus/pci/drivers/xe/.../gpu_health
> +Date:		April 2026
> +KernelVersion:	7.2
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		This file exposes the current GPU health state and allows the
> GPU
> +		health state to be updated.
> +
> +		This sysfs file is present only on Intel Xe platforms that
> support
> +		the GPU health indicator interface for RAS. Reading the
> current
> +		health state is available to all users, while updating the health
> +		state is restricted to administrative users only.
> +
> +		Read returns a single line containing one of the valid values
> for
> +		the current device health state. Writing one of the valid
> values
> +		updates the current device health state.
> +
> +		The valid values for the device health state are:
> +
> +			ok
> +				The device is healthy and operating within
> normal
> +				parameters.
> +
> +			warning
> +				The device is experiencing minor issues but
> remains
> +				operational.
> +
> +			critical
> +				The device is in a critical state and may not be
> +				operational.
Will above KDoc link to existing XeKMD  doc https://docs.kernel.org/gpu/xe/=
index.html
Thanks,
Anshuman=20
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c in=
dex
> 4cb16b419b0c..b7efd607aadf 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -4,11 +4,14 @@
>   */
>=20
>  #include "xe_device.h"
> +#include "xe_pm.h"
>  #include "xe_printk.h"
>  #include "xe_ras.h"
>  #include "xe_ras_types.h"
>  #include "xe_sysctrl.h"
>  #include "xe_sysctrl_event_types.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
>=20
>  /* Severity of detected errors  */
>  enum xe_ras_severity {
> @@ -31,6 +34,16 @@ enum xe_ras_component {
>  	XE_RAS_COMP_MAX
>  };
>=20
> +/* RAS response status codes */
> +enum xe_ras_response_status {
> +	XE_RAS_STATUS_SUCCESS =3D 0,
> +	XE_RAS_STATUS_INVALID_PARAM,
> +	XE_RAS_STATUS_OP_NOT_SUPPORTED,
> +	XE_RAS_STATUS_TIMEOUT,
> +	XE_RAS_STATUS_HARDWARE_FAILURE,
> +	XE_RAS_STATUS_INSUFFICIENT_RESOURCES
> +};
> +
>  static const char *const xe_ras_severities[] =3D {
>  	[XE_RAS_SEV_NOT_SUPPORTED]		=3D "Not Supported",
>  	[XE_RAS_SEV_CORRECTABLE]		=3D "Correctable Error",
> @@ -50,6 +63,33 @@ static const char *const xe_ras_components[] =3D {  };
>  static_assert(ARRAY_SIZE(xe_ras_components) =3D=3D XE_RAS_COMP_MAX);
>=20
> +static const char * const gpu_health_states[] =3D {
> +	[XE_RAS_HEALTH_STATUS_OK]		=3D "ok",
> +	[XE_RAS_HEALTH_STATUS_WARNING]		=3D "warning",
> +	[XE_RAS_HEALTH_STATUS_CRITICAL]		=3D "critical"
> +};
> +static_assert(ARRAY_SIZE(gpu_health_states) =3D=3D
> +XE_RAS_HEALTH_STATUS_MAX);
> +
> +static int ras_status_to_errno(u32 status) {
> +	switch (status) {
> +	case XE_RAS_STATUS_SUCCESS:
> +		return 0;
> +	case XE_RAS_STATUS_INVALID_PARAM:
> +		return -EINVAL;
> +	case XE_RAS_STATUS_OP_NOT_SUPPORTED:
> +		return -EOPNOTSUPP;
> +	case XE_RAS_STATUS_TIMEOUT:
> +		return -ETIMEDOUT;
> +	case XE_RAS_STATUS_HARDWARE_FAILURE:
> +		return -EIO;
> +	case XE_RAS_STATUS_INSUFFICIENT_RESOURCES:
> +		return -ENOSPC;
> +	default:
> +		return -EPROTO;
> +	}
> +}
> +
>  static inline const char *sev_to_str(u8 severity)  {
>  	if (severity >=3D XE_RAS_SEV_MAX)
> @@ -91,3 +131,140 @@ void xe_ras_counter_threshold_crossed(struct
> xe_device *xe,
>  			comp_to_str(component), sev_to_str(severity));
>  	}
>  }
> +
> +static ssize_t gpu_health_show(struct device *dev, struct
> +device_attribute *attr, char *buf) {
> +	struct xe_ras_get_health_response response =3D {0};
> +	struct xe_sysctrl_mailbox_command command =3D {0};
> +	struct xe_ras_get_health_request request =3D {0};
> +	struct xe_device *xe =3D kdev_to_xe_device(dev);
> +	enum xe_ras_health_status health;
> +	size_t rlen =3D 0;
> +	int ret;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP,
> XE_SYSCTRL_CMD_GET_HEALTH,
> +				  &request, sizeof(request), &response,
> sizeof(response));
> +	guard(xe_pm_runtime)(xe);
> +	ret =3D xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: failed to send get health command %d\n",
> ret);
> +		return ret;
> +	}
> +
> +	if (rlen !=3D sizeof(response)) {
> +		xe_err(xe, "sysctrl: unexpected get health response length
> %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}
> +	if (response.current_health >=3D XE_RAS_HEALTH_STATUS_MAX) {
> +		xe_err(xe, "sysctrl: invalid health state %u\n",
> +		       response.current_health);
> +		return -EIO;
> +	}
> +
> +	health =3D (enum xe_ras_health_status)response.current_health;
> +
> +	xe_dbg(xe, "[RAS]: get health:%s\n", gpu_health_states[health]);
> +
> +	return sysfs_emit(buf, "%s\n", gpu_health_states[health]); }
> +
> +static ssize_t gpu_health_store(struct device *dev, struct device_attrib=
ute
> *attr,
> +				const char *buf, size_t count)
> +{
> +	struct xe_ras_set_health_response response =3D {0};
> +	struct xe_sysctrl_mailbox_command command =3D {0};
> +	struct xe_ras_set_health_request request =3D {0};
> +	struct xe_device *xe =3D kdev_to_xe_device(dev);
> +	enum xe_ras_health_status health;
> +	size_t rlen =3D 0;
> +	int ras_status;
> +	int state;
> +	int ret;
> +
> +	state =3D sysfs_match_string(gpu_health_states, buf);
> +	if (state < 0) {
> +		xe_err(xe, "[RAS]: invalid health state '%.*s'\n",
> +		       (int)strcspn(buf, "\n"), buf);
> +		return -EINVAL;
> +	}
> +
> +	request.new_health =3D (u8)state;
> +
> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP,
> XE_SYSCTRL_CMD_SET_HEALTH,
> +				  &request, sizeof(request), &response,
> sizeof(response));
> +	guard(xe_pm_runtime)(xe);
> +	ret =3D xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: failed to send set health command %d\n",
> ret);
> +		return ret;
> +	}
> +
> +	if (rlen !=3D sizeof(response)) {
> +		xe_err(xe, "sysctrl: unexpected set health response length
> %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}
> +
> +	ras_status =3D ras_status_to_errno(response.status);
> +	if (ras_status) {
> +		xe_err(xe, "sysctrl: set health command failed with status
> %d\n",
> +		       response.status);
> +		return ras_status;
> +	}
> +
> +	if (response.current_health >=3D XE_RAS_HEALTH_STATUS_MAX) {
> +		xe_err(xe, "sysctrl: invalid health state %u\n",
> +		       response.current_health);
> +		return -EIO;
> +	}
> +
> +	health =3D (enum xe_ras_health_status)response.current_health;
> +
> +	xe_dbg(xe, "[RAS]: set health:%s\n", gpu_health_states[health]);
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(gpu_health);
> +
> +static void gpu_health_sysfs_fini(void *arg) {
> +	struct device *dev =3D arg;
> +
> +	device_remove_file(dev, &dev_attr_gpu_health); }
> +
> +static int gpu_health_sysfs_init(struct xe_device *xe) {
> +	struct device *dev =3D xe->drm.dev;
> +	int err;
> +
> +	err =3D device_create_file(dev, &dev_attr_gpu_health);
> +	if (err)
> +		return err;
> +
> +	err =3D devm_add_action_or_reset(dev, gpu_health_sysfs_fini, dev);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_ras_init - Initialize Xe RAS
> + * @xe: xe device instance
> + *
> + * Initialize the RAS GPU health sysfs interface.
> + */
> +void xe_ras_init(struct xe_device *xe)
> +{
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl || IS_SRIOV_VF(xe))
> +		return;
> +
> +	ret =3D gpu_health_sysfs_init(xe);
> +	if (ret)
> +		xe_err(xe, "[RAS]: failed to initialize GPU health sysfs,
> err=3D%d\n",
> +ret); }
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h in=
dex
> ea90593b62dc..8acfd0ffe48e 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -11,5 +11,6 @@ struct xe_sysctrl_event_response;
>=20
>  void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>  				      struct xe_sysctrl_event_response
> *response);
> +void xe_ras_init(struct xe_device *xe);
>=20
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h
> b/drivers/gpu/drm/xe/xe_ras_types.h
> index 4e63c67f806a..4767bcf315a3 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -10,6 +10,21 @@
>=20
>  #define XE_RAS_NUM_COUNTERS			16
>=20
> +/**
> + * enum xe_ras_health_status - Device health status values
> + *
> + * @XE_RAS_HEALTH_STATUS_OK: Device is healthy and operating normally.
> + * @XE_RAS_HEALTH_STATUS_WARNING: Device has minor issues but is still
> operational.
> + * @XE_RAS_HEALTH_STATUS_CRITICAL: Device is in a critical state and may
> not be operational.
> + * @XE_RAS_HEALTH_STATUS_MAX: Sentinel value for validation  */ enum
> +xe_ras_health_status {
> +	XE_RAS_HEALTH_STATUS_OK =3D 0,
> +	XE_RAS_HEALTH_STATUS_WARNING,
> +	XE_RAS_HEALTH_STATUS_CRITICAL,
> +	XE_RAS_HEALTH_STATUS_MAX
> +};
> +
>  /**
>   * struct xe_ras_error_common - Error fields that are common across all
> products
>   */
> @@ -70,4 +85,49 @@ struct xe_ras_threshold_crossed {
>  	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];  }
> __packed;
>=20
> +/**
> + * struct xe_ras_get_health_request - Request structure for GFSP
> +GET_HEALTH
> + *
> + * GET_HEALTH takes no input parameters; the reserved payload is kept
> +to
> + * preserve the firmware wire layout and allow future extensions. The
> + * driver must zero all reserved fields.
> + */
> +struct xe_ras_get_health_request {
> +	/** @reserved: Reserved for future use. */
> +	u32 reserved[2];
> +} __packed;
> +
> +/**
> + * struct xe_ras_get_health_response - Response structure for GFSP
> +GET_HEALTH  */ struct xe_ras_get_health_response {
> +	/** @current_health: Current GPU health, see &enum
> xe_ras_health_status */
> +	u8 current_health;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_set_health_request - Request structure for GFSP
> +SET_HEALTH  */ struct xe_ras_set_health_request {
> +	/** @new_health: New GPU health to set, see &enum
> xe_ras_health_status */
> +	u8 new_health;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_set_health_response - Response structure for GFSP
> +SET_HEALTH  */ struct xe_ras_set_health_response {
> +	/** @status: Status of set health operation, see &enum
> xe_ras_response_status */
> +	u32 status;
> +	/** @current_health: Resulting current GPU health, see &enum
> xe_ras_health_status */
> +	u8 current_health;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +	/** @reserved1: Reserved for future use */
> +	u32 reserved1[2];
> +} __packed;
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> index 3caa9f15875f..9507f68bc2eb 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -293,6 +293,34 @@ static int sysctrl_send_command(struct xe_sysctrl
> *sc,
>  	return 0;
>  }
>=20
> +/**
> + * xe_sysctrl_create_command() - Create system controller command
> + * @command: Sysctrl command structure
> + * @group_id: Command group ID
> + * @cmd_id: Command ID
> + * @request: Pointer to request buffer (can be NULL)
> + * @request_len: Size of request buffer
> + * @response: Pointer to response buffer
> + * @response_len: Size of response buffer
> + *
> + * Helper function to build sysctrl command to be sent via
> +%xe_sysctrl_send_command()  */ void xe_sysctrl_create_command(struct
> +xe_sysctrl_mailbox_command *command, u8 group_id, u8 cmd_id,
> +			       void *request, size_t request_len, void
> *response,
> +			       size_t response_len)
> +{
> +	struct xe_sysctrl_app_msg_hdr header =3D {0};
> +
> +	header.data =3D FIELD_PREP(APP_HDR_GROUP_ID_MASK, group_id) |
> +		      FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_id);
> +
> +	command->header =3D header;
> +	command->data_in =3D request;
> +	command->data_in_len =3D request_len;
> +	command->data_out =3D response;
> +	command->data_out_len =3D response_len;
> +}
> +
>  /**
>   * xe_sysctrl_mailbox_init - Initialize System Controller mailbox interf=
ace
>   * @sc: System controller structure
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> index f67e9234de48..fb434cc165b2 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> @@ -23,6 +23,9 @@ struct xe_sysctrl_mailbox_command;  #define
> XE_SYSCTRL_APP_HDR_VERSION(hdr) \
>  	FIELD_GET(APP_HDR_VERSION_MASK, (hdr)->data)
>=20
> +void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command
> *command, u8 group_id, u8 cmd_id,
> +			       void *request, size_t request_len, void
> *response,
> +			       size_t response_len);
>  void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);  int
> xe_sysctrl_send_command(struct xe_sysctrl *sc,
>  			    struct xe_sysctrl_mailbox_command *cmd, diff --git
> a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 84d7c647e743..f82e3fb9b5ef 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -23,9 +23,13 @@ enum xe_sysctrl_group {
>   * enum xe_sysctrl_gfsp_cmd - Commands supported by GFSP group
>   *
>   * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
> + * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve current health status
> + * @XE_SYSCTRL_CMD_SET_HEALTH: Set new health status
>   */
>  enum xe_sysctrl_gfsp_cmd {
>  	XE_SYSCTRL_CMD_GET_PENDING_EVENT	=3D 0x07,
> +	XE_SYSCTRL_CMD_GET_HEALTH		=3D 0x0B,
> +	XE_SYSCTRL_CMD_SET_HEALTH		=3D 0x0C,
>  };
>=20
>  /**
> --
> 2.43.0

