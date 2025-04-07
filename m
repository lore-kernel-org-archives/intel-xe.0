Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B98C36002
	for <intel-xe@archiver.kernel.org>; Mon,  7 Apr 2025 03:30:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD01910E18C;
	Mon,  7 Apr 2025 03:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fv1h+tzJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9416410E18F
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Apr 2025 03:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743996632; x=1775532632;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=N8eL6VHjOLhBYvEdcubO01PWvAGI9CWluxHho6NrvOk=;
 b=fv1h+tzJjw4/5dTBZkFHFCX/cR7ShFhn+FF1tEve9TmFVzhTtAtvNNeq
 YqWhm2PqYPYRbTikR6hMuytl4OZxZm9xZPjzUbVaMAXW37Fx1Nl6L1oJ0
 qqIOIih5T6ozViNoPCymRrfSLj4F5HdhSd3U6cExhS6M2F7O3R7IzoY4i
 pXEKzpFi+HC2lUuqa2wguMXgEBlz9DRsrIF1I8d0Pqen5FKeCpEG5CsJU
 48C4otRSig9mm+VUzwta5S93rLWfpsntuezk9U8y/wNqZt1hPRjS/5TzB
 91tql5v33Q8RDRcYTPoPr78dP7r2hhTfPyl9JuDIzI9Kfl2jaioBhg4Gl A==;
X-CSE-ConnectionGUID: mR4N6V7wSOS7MGSDHlDdOA==
X-CSE-MsgGUID: ASl9CMUDRcOQsBLJa6PpHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="45078580"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="45078580"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2025 20:30:32 -0700
X-CSE-ConnectionGUID: UtDrb3NZT1a7qfrp3g8cvA==
X-CSE-MsgGUID: 5v1MgT9YRyKvkLDWOQM76g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; d="scan'208";a="127699479"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Apr 2025 20:30:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 6 Apr 2025 20:30:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 6 Apr 2025 20:30:29 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 6 Apr 2025 20:30:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=krFxWcv0pnUBG1yw2vNNOuWXC/VTPNnRZVCsTGQeYA8hYmUeFPdBob5Z2K7YOyVk6szTm7+5qIydQ3HVAQ4fm7SWV7W75KvFjJzRFuAHIGvLMsseAReNxkAFstmtmFMJ2mbXTndELFaOpkGvbxUePguhJooOuzUdjbdD713HrfQbME6Hw75Yj2yx3XVRXnSnu3t3tWMI7dyj/GWVxFpKoNKsUC6kVS7jdhaWPzFWVD2UiY/9fc2fO6cYYZfUj8leerIxlNg5xxkeJWxq9xVm4lG3zys7/M1fnF6WJN5fLXepbbnKnwdtCCjdZQq0Gvztu3/P0/3jKygPoc/unnee2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5N60RaOHuIbz5InOu77aJW5arM5Mdq/6D6NV67Bip0=;
 b=ZShlKeCdFxWQZ6uPWa1SrMGiPfN6jiGYtBwwrVyalqnT13EZBBs1uC/74yI01jBqkqTmg6nC+6tEm1c3FXKI3PzA/Fy/mZd6tYgKNrRezRphTDtMsQbk1zflCbzfzJETdCVJ34gPU9Af8MXXronRWAoB6CAZ31sZUcNOWP465ZPI3odOQmkfYM6ElGXflQtDf7dfCXWpv3biG+03CNhv34Upg0mYrJ085IEAD17ECLZn8weTvVBaXB6KuNfAk+EZyMpT+zn/Rzxu2Bkt6SnDcPhZssgydR0l3m0GXn3QE4AotlrNs88+eKkDFZlFDKq5+CT9AXeumwBImelFDYzj5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA1PR11MB8804.namprd11.prod.outlook.com (2603:10b6:208:597::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 03:30:27 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%7]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 03:30:27 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Thomas, Sobin" <sobin.thomas@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/1] drm/xe: xe_hw_engine_class: Add fault injection
 and improve error handling in kobj_xe_hw_engine_class
Thread-Topic: [PATCH i-g-t 1/1] drm/xe: xe_hw_engine_class: Add fault
 injection and improve error handling in kobj_xe_hw_engine_class
Thread-Index: AQHbpfm65VQcMJZn/0+ao4Ii6Niz2LOXjrMQ
Date: Mon, 7 Apr 2025 03:30:27 +0000
Message-ID: <SJ1PR11MB6204E584A8AD46FBCD1017C081AA2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250405065432.2254703-1-sobin.thomas@intel.com>
In-Reply-To: <20250405065432.2254703-1-sobin.thomas@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA1PR11MB8804:EE_
x-ms-office365-filtering-correlation-id: 18e8768d-e938-4b5f-722d-08dd75848a44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?bx3zrhjscBTozxny4ZTgXFpkQw9/wm9uA+Csw+unF33ytof2GEev4aczO7Zn?=
 =?us-ascii?Q?aFVB4QpxbyyQs2rmS1q+ry6uzSdai3E+1xnpQ++7giENQIq11lEfRuQ+0ua5?=
 =?us-ascii?Q?i6bFCTCxLdgbJCUORpfP4BFcRB3ZYpjPW1IqBy5k0+xZdgU8dUvgjB+4SwKV?=
 =?us-ascii?Q?vLcJudKFSGNJoxZ8n8pmSS+fN5salGSFMs8gjtF4uHTd0xFZjDJIscJ6Bcjf?=
 =?us-ascii?Q?iYG21awuczdAJdtZM3aqS15hnGy+eKft6KVZf4u0fc5xOvHy0Che+/I+EI87?=
 =?us-ascii?Q?CH5P27+VypGXzqCBFnyHTTrJrrw/BjKJE/xjJan+d0dNPsheqqutKAwgXb8e?=
 =?us-ascii?Q?aQJCEao9Gq4ZC1yL/ggZ+WFCpHNDjSPy1tNbDY+qqkjtM+S5tjbYHzgsvDGv?=
 =?us-ascii?Q?twvqrwM/BxsfQ156k6zvOhYw7o/0zLEWlLylkLB2n0zAM5GP0X5k5cn2uo3R?=
 =?us-ascii?Q?0N3juYzcfPpfP7vzxQSZc/7fgs4T1nO8YXt5Rf1Jd645+tHiBbrw1E1O0kOO?=
 =?us-ascii?Q?z2s0rSz8qSFBweSyb4OyCmUMpwRHPdck7w4LIN4SzcLfChHw0BqCqa2JhfVA?=
 =?us-ascii?Q?czcWBk0eXMD/W8i7NNdJSv11CA6Tt8fHKVcMk+gYmljvMwMtltVyTQ28Nlb7?=
 =?us-ascii?Q?ITr9+Xc9M/wvpzhqltm3XmuQmpNdUy4wkmgWlCBN38eS7FG3k5kBHjBPfgov?=
 =?us-ascii?Q?LTmn4svWqk4deyceQxYlxCrB4PI8gmE71NBXPXGForHVDrF6+U/k1m7DYlsi?=
 =?us-ascii?Q?FKpcfAZ4//zD+fB2jvzgJqNgwk36MY5lcNnhKDiIt2D9z4R7WGoGHbkLt7fX?=
 =?us-ascii?Q?g0LuZfDKYTGSYNWH5thvUH6TQuCOCYJqNpx3nQxwTPRhxFfQ8kRaBRgctkrc?=
 =?us-ascii?Q?1Im0jIfRE2r9fPJfE2ViUbaYgjkDnij3xfe05PKlUhnARBhsXjJu58vLBiVk?=
 =?us-ascii?Q?63W7sAQbPlOf2VxwTTlk2F3VwXh4vwJFOpVXme0C2Ems960n7EE7DmiJqZYo?=
 =?us-ascii?Q?Y/DTJMEeHTHlKVOxMTNeDbMIUM++bA+X/qY/3RHOhSfzk2wWp9OTIfm7tbvR?=
 =?us-ascii?Q?yKg+txm+UA+Td82KK88gvYM3/PFFiAKEcvSp7uuJNfWwnwUjSVVw3aidqZIB?=
 =?us-ascii?Q?4Oas50XX8+t1c0pYZADvIBffD98CGr8hPJFb7hkIzyNNZO8mX5XkPzp37SUG?=
 =?us-ascii?Q?S5NxIENJZGskjjUvq8l0YLTR9vM1heQGmvI6t/qDIXonfFJpM0yeMxnw/2nO?=
 =?us-ascii?Q?gdHLKEIK1R3ssn7wXhD2xuMmDqxwj89QohBSmgnKWj++eZBch5MNlQn+Lx5/?=
 =?us-ascii?Q?yGv+MS1ak4Dj8bP4NkcveJppuLbIfri+2eItnMl0Tv/XVG0XiYEtNBuwyy6G?=
 =?us-ascii?Q?37uwpQ+YVX9TWMD4N4ROlp/u83VaVuPySr+fvBYoGyAJHYApb1lmux7zv27b?=
 =?us-ascii?Q?s39JfuPybRstu6FVbJz10Ic8LkzK4tBo?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YTl90mEfhjVR9Wi0OsUO/+QyKJqKknxNJDc8R9m2QNn29WQmT/vdc0UUPbkf?=
 =?us-ascii?Q?5MYFcfM/Z/5Oh1EP6+nHqF4/WmV88lJcEvdOJPuzPkjHE5vah4+0nsxF/0Dj?=
 =?us-ascii?Q?L3lovXzWhRPJi2+jd9LuVca7Cx+/7wGT5Ua0PAbI5W8Y6zAunQtFoQbcVNgo?=
 =?us-ascii?Q?KA6A4H2PtU3pelJxuy7uBtFV3Qvh3N7HsOMmBAWOUkn7y7lMDzq0BpTwHIf8?=
 =?us-ascii?Q?Jv4hFAJqqpLPgXwXYSrUTVgT4qs+LGRf5k4zrp7kqCj3l7uq9pqV0q6QYeHz?=
 =?us-ascii?Q?VcK1r17YIRcmUD6pIX9jCyiii7oq+dY8bOdF1uG8l14UnIq+TafiQb2+6any?=
 =?us-ascii?Q?JhtgPTTagZKE7JhWYIQS4N94egJlvdXeaOY1NFvW54AVQeS/ZHtVLW53/fN0?=
 =?us-ascii?Q?zAtuke7tzaMQk0JNb6bHybauFA0amSGQN5lN828bKvOw//+nihf0M0rFOq0F?=
 =?us-ascii?Q?e8sY2ZGjVtcB70gCwy4bFhl687OHFF5iDeqvPHzNLLqqYch7hf5AKvyazM4r?=
 =?us-ascii?Q?Zz1/WXG/dQF6Ulukd21bIKxLEULWhfelAJtSzukZ6IsMKBk0DYEfR9lUceeM?=
 =?us-ascii?Q?xQs4WzGysNYhhSd/MTorwXF98rxzp0RNWyBtXuHjf3rmLtNhYh+CNgWKA/QE?=
 =?us-ascii?Q?GFYbC2CoJRlFEmvCE+sCQWhOTHngi46G19aaaAnXjDPRLrauJWQrBUuIk5Ww?=
 =?us-ascii?Q?quJOckX6T1LaiuO35gpLQe6xy61jTV6/XzsKSqH057tuRXyG66BI2q/JuGPe?=
 =?us-ascii?Q?ahyJcO//eWAFBg0XCEdircN5IHvFGcBsypPQ+jhHtGrsBxRzPx+1n90plGhE?=
 =?us-ascii?Q?UJBOkaYlnJDsTkhQ4+wrRPgaOft6GmCQdppCWywmPIhjxFbwfEcar/ob3L0K?=
 =?us-ascii?Q?hpqYPD66NVigU1Oe3gn7WgQhZgRstW26mIhovI3+s+UWaJjhVSDwxHSL2C6i?=
 =?us-ascii?Q?BSyCkWKkNiDE6y726L30CgvZI/HIq3leinQfFWh4lB0NEshb38mem/qlp2WS?=
 =?us-ascii?Q?PoV8lPm/abG6cxWLbxjwuwhAs7Sh2kf7QgHOTi5Cv99f7DHM1Y5Bfh89O6Ln?=
 =?us-ascii?Q?/5zFfbnZ0KodF6vrwVZc8ckpmhNjhvGRjYGdirfr5O84gJhbwIQeiMkFTEGV?=
 =?us-ascii?Q?1/zsjfNgcGrPCR/vQi1LyqITboVDw+cxETgi+RjNk1Zi/KLoPXAaQ86fi0ip?=
 =?us-ascii?Q?JunTmNSWoZj2umZFRtePYkzym+C0dLgGA+R3Oe0XHg8PvNxThEz5x0GUZCbG?=
 =?us-ascii?Q?xQfUGAb4cN8VdIennAz6Ykhar3vVy4BoXjmC1hw3BN4Enjc7WLstDuZ5f2xf?=
 =?us-ascii?Q?rMDmH4gChmTh1pwO6lMEciimz4aafSzbSSna07E8jbbUlC4xGMgIzmQsBYb8?=
 =?us-ascii?Q?cWlYxwnlbsitSxFiTpQ+mjZocewUN9RrNgIml7GBNgTclopeW9u2EUjXs+UE?=
 =?us-ascii?Q?UzXUcdsWXr79GDmcau1LOMlmIENGu8CIZu2oIn5MVL0OMOVaD50ASOEB54vA?=
 =?us-ascii?Q?OnhE44COG7fnYsBv6T8u9YduMvM0G6+hhS6eNGg5ZgkZflzeydfFObXjvP+K?=
 =?us-ascii?Q?vu2WjKKW0QmPEiCTzuM68Xuh7WVYpyG4Le4PgNdi?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e8768d-e938-4b5f-722d-08dd75848a44
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 03:30:27.1720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: obDjrUprul74Jiu0jff6uUmQnwkGNd9UcCio22de0fTNdmE4yGDV0BPowwqh+gO7VeIK/0a3T2n/L1X99wbq0f0/iCKRy+mZYcqlRQjnwpg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8804
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

For a kernel change, why are you mentioning i-g-t in subject?

Tejas

> -----Original Message-----
> From: Thomas, Sobin <sobin.thomas@intel.com>
> Sent: 05 April 2025 12:25
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Subject: [PATCH i-g-t 1/1] drm/xe: xe_hw_engine_class: Add fault injectio=
n
> and improve error handling in kobj_xe_hw_engine_class
>=20
> - Added fault injection for `kobj_xe_hw_engine_class` to enhance coverage=
.
> - Improved error handling by checking for `IS_ERR_OR_NULL` on `keclass` a=
nd
>   propagating the error using `PTR_ERR`.
>=20
> Can be tested using inject-fault-probe-function-kobj_xe_hw_engine_class
>=20
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> index 640950172088..0cafe1175389 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> @@ -571,6 +571,7 @@ kobj_xe_hw_engine_class(struct xe_device *xe, struct
> kobject *parent, const char
>=20
>  	return keclass;
>  }
> +ALLOW_ERROR_INJECTION(kobj_xe_hw_engine_class, NULL);
>=20
>  static void hw_engine_class_defaults_fini(void *arg)  { @@ -662,8 +663,8
> @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
>  		}
>=20
>  		keclass =3D kobj_xe_hw_engine_class(xe, kobj, name);
> -		if (!keclass) {
> -			err =3D -EINVAL;
> +		if (IS_ERR_OR_NULL(keclass)) {
> +			err =3D PTR_ERR(keclass);
>  			goto err_object;
>  		}
>=20
> --
> 2.34.1

