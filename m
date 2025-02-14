Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B1BC02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 10:16:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 398E510E2BF;
	Fri, 14 Feb 2025 10:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UZQcC4re";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0305710E2BF
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 10:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739528194; x=1771064194;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z27GIIskzRd7L5VBd05rqvLUetFWl2CAnZokzF1zb5A=;
 b=UZQcC4rer23rFR6QwXsDcNEP6RtQg47sFAfuOcFFCKpXCgPOSM3yFTxQ
 HNs33JXhXjMEAAGq9MPXD2YbYJRva5CIFocDqCJb6YzFYTqyk2Ctg5cEj
 e2anSW6s+JxEPLmwmsPwmLnr+bVdHQ+uIO4ZPANZTg6qRoRFcA2T8T4Gh
 e7w5lGvn1NZK32+A8FYfD938AptLSKobUlcZzFsU5yrg31eEg47zwIu9h
 bfXq1LGcsx0oW9mpjiCRtUBdLxFYDETMpzu3E82snDn0BReaNME4EjBNE
 GYmC43cwJX/tEy5HgeHNtlVzs10bxqV3U13s+gy3/UZIQ3i71B8Z5Aeif w==;
X-CSE-ConnectionGUID: p4WPUQDkTlykiiLpnij0Ow==
X-CSE-MsgGUID: r+6GXTLBQBeQoVCsy6eZbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40391997"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="40391997"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 02:16:34 -0800
X-CSE-ConnectionGUID: eJhCg26dQua1zdvqMeYBLg==
X-CSE-MsgGUID: qOkOYKrdQQe2xvWqpwYBHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; d="scan'208";a="114060408"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 02:16:33 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 14 Feb 2025 02:16:32 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 02:16:32 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 02:16:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WG/67JpQ+Yd4vjub1y+nqvGRs9UmF2XoDnXB4dnHuQQOpyUYulIyAKytbUJ7MRtEKFyjjJGxOEKHMuIu8w/vS7dNAaU7iLuqsqHPWuXt1WKxo552fcB9z//ChCUvg6Ni4EYMvd21unJdMpo8/adP4sQdCl6shA1SOchzChw91zHzPudsjR9OlhvYUijetu31BaDJjIv6zXyYhbAvKh6bgPC6RGbF+TvoYq+Z2dsY3+vNcw1YLHvK04HsYxJNCcLBvPouDcM5w62ayZkIE3v8NMVTRZ3+3l1WSMw5QEKjOAXM2n5jCXkQgusGxVYs0hY8KAXFje0Z4rF8L5oOCGAY7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVFEdJgzlReP4DELftNhEe8p32iK9DXqWyiY8P6d0UA=;
 b=f74z6xKuCNL9/Ltzlr3gHE8C3CL8krK/1ioV9cQ7+YYPMcuhKZ7k1h8Zg1OMN32pXYzPwSn5aytezbvL4Z2ltV5bixpzVowFDk+PCJrttsLie5vHIsdIvabbEzpWQjzYJnZheIxn3eyDxljQ7yrhmq+wiEwfmfWUVq0+oNf5puLX+QBgu5aXd7LpG/3/FJvgnz+gmNe1o6Fc4u/RTzjIM9Z6mZ9Id1ph2L7hGYWYEJRTElevzkjbeOvul5eWLYgcHLDoa0XnDfcOFDzF1bSOtNebC+1Vc1H+EMdUCi4+dICfEpy5A4kElYQj6Tb/qJ82Az8zyxwX4f9SharSumMuSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SA1PR11MB6735.namprd11.prod.outlook.com (2603:10b6:806:25e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Fri, 14 Feb
 2025 10:16:28 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8445.015; Fri, 14 Feb 2025
 10:16:28 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Dandamudi,
 Priyanka" <priyanka.dandamudi@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH] drm/xe: Add fault injection for xe_sync_entry_parse
Thread-Topic: [PATCH] drm/xe: Add fault injection for xe_sync_entry_parse
Thread-Index: AQHbfTEXZDDgt/A670u9EtCQD+rkm7NGmBzg
Date: Fri, 14 Feb 2025 10:16:28 +0000
Message-ID: <LV3PR11MB8695DFAC65F77AAA7A2E88DCF9FE2@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250212093212.3069356-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20250212093212.3069356-1-priyanka.dandamudi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|SA1PR11MB6735:EE_
x-ms-office365-filtering-correlation-id: dee77292-98da-408a-c7d9-08dd4ce0a51d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?4ayRN80oZGf1hJM1y0SImum9Q3FeCbG1jT5PzVEsnS4kM/OcFp9rMYw6BmAn?=
 =?us-ascii?Q?LFMCCO/MOGoSviylxCLLDR9qFvSpofuztVKmuUGUWfMmh36vjYEyZFXeN93p?=
 =?us-ascii?Q?ecjJMzfDm91yAoSdKL32iNgCpWP2q/NfwiqZ0ESvD0OMq4rFgOP5f+34Q1my?=
 =?us-ascii?Q?urHytOKlWplA9tjRV+H6wlkeG5d9mbyXK30/ZmEmc395fvcyPTw4uQEJouqd?=
 =?us-ascii?Q?ugq2yiTJQ681dubCo3NfrvWp/vqEmDUVGIfaics+KbD2ZZjIATkYEAYo1mQx?=
 =?us-ascii?Q?oTZHXXZ7yAkmLmzJ07tQXsc1+HnSgBC4uo5a0JU0V0JzBOChArh8XB4XBXK1?=
 =?us-ascii?Q?QMmu/LREJ4EIGr0kKvkLbExUzZZfh0AuVmj1ax/kBH1iZ8SXUXI3jI1jEbPq?=
 =?us-ascii?Q?nsh/6zoW4Ef0cq5e7lgweU7KfEvJKH1fCTv9dg6ORZoFQpYlrkOwjPUFxhJv?=
 =?us-ascii?Q?S+8k83jsmxvgwx9qEZfxsis11POpE9+Lu48GrcWPBsleVCbLZJzlyUC2N7NJ?=
 =?us-ascii?Q?vYuHUL3BXNh2SmleGRrMBqZsx4GX2z0Anuvidip2Fb9d2ejUZFdF21agonIR?=
 =?us-ascii?Q?7Mb1T/e7HzkphkB33BKi8iivJ17+PBdtyjbtZlSK2ZhDzWeG3TFyoWeUHHEr?=
 =?us-ascii?Q?AKIbQKysyKHP+TDUdHobpfie7NM7GoX683WtUk7IYBntQnAlsW+/lqqGP0fi?=
 =?us-ascii?Q?na+N99GMRWIvPduaMHmY5qgiQSDU1C2pBkldCavdYYRz059Tf8m5r/eiGRd5?=
 =?us-ascii?Q?P9zsceUfZHz2GUsHsMWdA0AkQoGC9pms1Bla4fzevM+5XjrPehROkdRYq89x?=
 =?us-ascii?Q?46eCNYkk6XAF5QVmbZd39woueIMjz3UBh+JSBkBssebpg2tHbp4jUOXYlpZ6?=
 =?us-ascii?Q?36Wny6eLIo90fNSO2YkfUb/X0eGooik6J1x1dqgF6c+RGRY4CtK6XpXq9g9P?=
 =?us-ascii?Q?jbW3BwhzRxFza9nqsLmwr5l+L9hx2SOkIxZsrsjPRafp1FdQbXLQwQygQtlb?=
 =?us-ascii?Q?HZdfeqBbj2nmgiaY43drNrtjfp2cNoD844i7kobxJwxW4UAAWJZhK5QfAsVD?=
 =?us-ascii?Q?DxP8O+a5XybjTqYTVhhGPXfVdELlBSxhB7CQxzeRdVu7/7ZfeDwPdTcZrGqu?=
 =?us-ascii?Q?oDs55hO5QOb6lHLmLOm8By9SEMleyBtF9jKgzpSkZ0ZXO0gJ4PkcPwSyd5D2?=
 =?us-ascii?Q?mD6cQqIE/U91qkuGjtuXuj6mGjsuxzJXi09WfdL6b0yKmBfNOvcYMfQDWVPe?=
 =?us-ascii?Q?PN5rC275aCtPRFIe2wgb8trGhYzObFQt1JNjy8/wQZwvaRIQehvSXxQg5Vmy?=
 =?us-ascii?Q?fTG8Itgj6R0tyEKpbqIHnSjXmQK3XR3p7Iao/A547Nr4kyq3r+dwozEhO00R?=
 =?us-ascii?Q?rCInJbdPCl3a8jUW3s3H6uOD7xQG8bl9pfXnTEl7cnNG7zFD035jiqXlqzoS?=
 =?us-ascii?Q?hzw8Awl7Es8FMqrKygdBTmKoTmpRNUjr?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iWneunYg7PEJR+tg11smawZMBKLwj61P/Q3ro+VjpDnnDh5tIuq3MRRkxZQC?=
 =?us-ascii?Q?pi7qYXZVZBv80vah0Nle3b0djWLKZIeNMNW9/qYEuVqluhKZeZScRtB0UW81?=
 =?us-ascii?Q?4pIgCzwbOAG0eZtX85fNn4RPSplVOr+rQDz+jjwLuwugM9Fdhu3IxzcETbkw?=
 =?us-ascii?Q?pX9zD4JuIqN/fyCM1y3PPrK5XHBHSxDCoh1QFG69ztE1KEoXxoJRHmWZvq8/?=
 =?us-ascii?Q?OtdR4DOelZECdw08Tl/YMcJpPqmlCAPNIXmEa6kqb9yV9e5AIHfXa9hWo3tZ?=
 =?us-ascii?Q?LCsD8xarNBOberM7pjrxdSD32tP8sjZrMVkaJJT/V9xphBdYGfgYZJjb9DqW?=
 =?us-ascii?Q?W9i3YhUNlcahrNiNHqfGsE13Z+6L2kJZyVQS0Pqy4dh1LQMI+3BJ4rD/ZwAG?=
 =?us-ascii?Q?gtz/I5sEJbMNlqGeT2Rv5VqtLYgAkqLRKMdFBzOj8w9R8oafZqRD3D/FCcAK?=
 =?us-ascii?Q?jFJcNAE2IstNtBzHL5PY0RDOllb25bUL31mwCwWQbvP1RoAEZBlFoPWvBOji?=
 =?us-ascii?Q?GbDs8jlg8ZO3LdYa1PRhNi77hVhbrr3zYEcF9LHm1e+9QkLGxsKePQliwzIX?=
 =?us-ascii?Q?+/45DpiC7wCnoiWQppuTAUxVGrxFkvxlVyl4Ow6ehdUUIhMr0kE7yb8fnq79?=
 =?us-ascii?Q?vLJ39jP7uRYCU5Jub967u8g8KLRfTV3cz4Yksh71IVNu/lnyFK6vaTfYoC0S?=
 =?us-ascii?Q?v+hEPkYsN3MgKWT0y0D6IlLX7zLwCVLvI2pJZWXbsBG1WpS06zl+IdyxSkej?=
 =?us-ascii?Q?qw1z63Fj6zqvEyZ7bnaHcB6BaoLvIpUnJd6l0Ecc6JvzfRvNQWPeUYX1dXT8?=
 =?us-ascii?Q?U7+3/OI+w2l1WZXLHvpeBHsUgALMUEuONUGx420/+DJKUH39eff36754wxtY?=
 =?us-ascii?Q?p++AcApP5LUJOmhBqAFyPPvA9O7OaDADNOsZ5DApsR7Vhwyf8q1+9ULDpKyM?=
 =?us-ascii?Q?NrKaIkWAGtMhoICHasAaQYE+eSdyJGOHi5JrP9ExPWdwNdNfF58Lgjbjem86?=
 =?us-ascii?Q?IK3iyG1VIsIUC63tr2O28DYbEVA6zOgLouPf3HpH4GpUObX1jTFItVKGnyaY?=
 =?us-ascii?Q?o2w2gyqztWe8/i/gc77sVXPdpvn1g6fTRc/twPU5SFZq700rngt8yKlrSpX8?=
 =?us-ascii?Q?/svIq4Wx5EvKB2shKaqJSAcYVqHPl9wWUrbB9zSoVeS7SD28E5zUwTZNYYzr?=
 =?us-ascii?Q?yzHzIe79wKXCL9oL7NhS3p8YoRFEtvkRXPTnN7qQdoqpM5zEBpBaz5GZ82jj?=
 =?us-ascii?Q?LBykrCnvYRJgbj5GADjXEvvGc5nCgva+UYxbAy1k0hJZ/GRjHL1PRxoIssjv?=
 =?us-ascii?Q?ZF970Ptz7Fqtl6k4EZrgI/ZQxpCCUaoNEEglOZtQ2l392ZD0WoAKF0zwjFZg?=
 =?us-ascii?Q?0hgn7ASUeeNwj7VfcEBnpvjeji+cI5uCYx1Hj+1lZ9aaK+0xrCzxlA1jQI4b?=
 =?us-ascii?Q?Fw4XkvSFTwKa8374ixpBSMCMBZZf2Sj5n547lfp79573V2SfnrPIeV4AbVCs?=
 =?us-ascii?Q?JvSE/7oHuE3rp1rJ+ZWxY3S2YGopNHkwXTrgyY+A73pq5BBnWDy/nYCGiyvI?=
 =?us-ascii?Q?EP9VChkLvp9nu8QXnhubBMwcr1u1wtg+su/R9qwAgz8cBZQQmg9OQSBz4TI9?=
 =?us-ascii?Q?/A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dee77292-98da-408a-c7d9-08dd4ce0a51d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2025 10:16:28.2820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4FHiFkvR1Zduqvcltv0bi4PMiw/PhaEGgBwCSiJ7HnXqxCNDiQr9hJi6vazd7wCVRdbWqBXj3dwz5bCTTXhkelPHZsfpEq/SSpPUgat1zQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6735
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

Hi
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> priyanka.dandamudi@intel.com
> Sent: Wednesday, February 12, 2025 3:02 PM
> To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; Dugast, Francois
> <francois.dugast@intel.com>; intel-xe@lists.freedesktop.org
> Subject: [PATCH] drm/xe: Add fault injection for xe_sync_entry_parse
>=20
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
> Add fault injection for xe_sync_entry_parse to allow it to fail while
> executing xe_vm_bind_ioctl().
> This need to be added as it cannot be reached by injecting error through
> IOCTL arguments.
>=20
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sync.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 42f5bebd09e5..f87276df18f2 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -210,6 +210,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct
> xe_file *xef,
>=20
>  	return 0;
>  }
> +ALLOW_ERROR_INJECTION(xe_sync_entry_parse, ERRNO);
>=20
This change LGTM, but it is better to have an IGT test which can cover this=
 fail_function.
-Satya.
>  int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct xe_sched_j=
ob
> *job)
>  {
> --
> 2.34.1

