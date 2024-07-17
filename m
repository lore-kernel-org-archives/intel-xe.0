Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8CAC3DA4B
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 08:25:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 337E010EA06;
	Wed, 17 Jul 2024 08:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MBZJA3Yy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D44210E9F4
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 08:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721204705; x=1752740705;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Xz4uDy48rVs/g9aaq3IbQ3POPtplbFmnUdyxw22Q9pY=;
 b=MBZJA3YyrZyRJKGf75Z3X1bdwt9oizaYAs0T+0qEg5Vndw2wXHdIVwFJ
 hc0VaK4GWhx97Swnq1R2gFRFPX3+1lHWRlaqIHME8sNOlq/JLaNAnjQdu
 q3KI4hU/hGs+RKAkkasPp+3ZCx8VhFoE+hekROI02Kvh/sUVaYhKxiFRn
 tZ5pMhZp36azL28PT1UZnQe4pSG2wxBFNjH1k5KAlb29MkwxnvItpcdDX
 fFwEU7QZC7YoahdDVgCWjvixTZRx4wjFj0gbm4I/a2QaEyDbIze+yVvh0
 CPNgwbey5QGMIL43tsPZvbxAniItTn+GkNnXJev3OM/hF8Y404bLBUfpP g==;
X-CSE-ConnectionGUID: MYl4p2wvRuOa/oBzNjTsuA==
X-CSE-MsgGUID: B0xSczYuTyGCelg0JR4tVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18801245"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="18801245"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 01:25:04 -0700
X-CSE-ConnectionGUID: GrxH8p/oQBm2JK72BdUAwQ==
X-CSE-MsgGUID: ccWhLy7uRVa9SUNu6/ruVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="54636920"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 01:24:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 01:24:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 01:24:58 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 01:24:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FBQIj8Pn/W0yo05ToJy+1fwdd0HYV0rW1h3h5FaY74bg5/VnjLoimrsw/J5RUZ4DbaAzCv1a2WfCFhmzN7QTyI73zllYNGaLSpk3BirJVCiRPJ6fO/15opLgVZm4w1b2n/VO645HNKeaqR1aqALBnhMjhnjEBb8UwutT+2XtiE2wo2BynqPEHivemdBM0QVfTwqz5x3kL2HpFPu7QzCAbxl0sT52Ht/MxctDxkc9BhNCc+9uqLgaXKo5K+1fHNRFS3y4Lp0IgfzUZgFxIOv4vtnVbzwl9sezF/vXkNURwpVQ65XL87sHnUkdhLQTROHLe9/KxLbLX5hgxpXK/u72OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itgM6wUtNMJLXNYUs7+2ytS7qDVyRIg/EJqUoDfss9c=;
 b=I5zWagmc9CJhQmggEX8ziN3Uc83Y+FS3UmgoQTD+nYCJbC/tJyb6SCET7zQRFceGipZIRZHLEF7pvjfTNDkiRB3k55t5q888nv3Rp94CZ1FOrJFs4c4Vhbis0vd1sUyeX+ooIfJv9URKOTpF/GdUf2OL/RcZRXeWXZr2nYqG4lmhqpNBC/sSxE4iCmuIoqRxfj759F49YTNWyQUJ3csO/5UDWv51Ateik1Nn0kxKYlGwGJlO35Z1DQgy4UZwI5cQNwTvOqagSzz0HQMA2mgg3ewdNWsIHX/+vQeHfMuYLNk4NISct2bUEfYHCbgLMkbpzQmKCx/DbbtRcoxET4u2wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA0PR11MB7790.namprd11.prod.outlook.com (2603:10b6:208:403::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.30; Wed, 17 Jul
 2024 08:24:55 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7762.027; Wed, 17 Jul 2024
 08:24:55 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Add assert for XE_WA() usage
Thread-Topic: [PATCH] drm/xe: Add assert for XE_WA() usage
Thread-Index: AQHa142yksJAnZqdPkSrC+gTKZL7CLH6krTQ
Date: Wed, 17 Jul 2024 08:24:55 +0000
Message-ID: <SJ1PR11MB6204F828B9BB8DC6E18886CD81A32@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240716143720.2790982-1-lucas.demarchi@intel.com>
In-Reply-To: <20240716143720.2790982-1-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA0PR11MB7790:EE_
x-ms-office365-filtering-correlation-id: f8b2878c-d8d3-48fa-0bfd-08dca639f053
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?BqMNytWSa75QLDCZa37h355pQtrv5G7g1U1L/UHJf8AUpmN1Gko+CPWa0jvZ?=
 =?us-ascii?Q?3zhbKOdfLGy95Z49mcL2mzgBeCRO85qcZL9YQOCstL3sWpMQKulw0OA5lKMx?=
 =?us-ascii?Q?FB28Cr6mrQEkvDm3bo/lW7SRIF82XM0hM/gvO7lDGOjDZycbcCa1WLkl01eV?=
 =?us-ascii?Q?qMyMG2uCiUQum6oASBBmgtoRQDg/yuwtiPes63FVqJqjOCdtAKQJA7Yiz/8l?=
 =?us-ascii?Q?nnAP7Dhgx+Zt+MNxwxTlm+MIPC/LeedxTM7cU4yvTZtmC9vWv7lZyM27ux2m?=
 =?us-ascii?Q?TlXjQi/NdGvU7AWakVgysFQCfVRBjHPjYw1V29chTjQAfnyDASNvYbQxTWWi?=
 =?us-ascii?Q?N3I+j1T2e1WG/RPXXtjrs/EQa845JLnvPR2/swcche0msY6kW7r+pECHwI9U?=
 =?us-ascii?Q?loKMBcoFOqZag9tMbpJz/3mURFKiDwiWkxOPJxiUooj9umobuWirqkrImb2s?=
 =?us-ascii?Q?T4C6dkr72UlM6Wri5bVowvX45bnzfNIK7mYuM5YhJ7MKAcd4sCh+tLRfqx98?=
 =?us-ascii?Q?FWKjePwgmNBEJH/pe8+zkOxR5rn8gyJaErM0AhJWIBiUHaVieb1DiIW2RGAk?=
 =?us-ascii?Q?QlV4ix6uwd5NvY2kUgmDv5/PGfacbuOIyWAhBLq274AaZ8sXTT2biV2fko3X?=
 =?us-ascii?Q?xRgjOAJDzbjNdZjte1kXb042EdDG4uu0CQ7pMCp09BjpoZk1EtIP/fGVrMP4?=
 =?us-ascii?Q?8XDg4MCakaUcyL0EwHWdZ3zgVyb7fO9lgKsJvlF7UZ7PlrSkpKvul4FJqtuK?=
 =?us-ascii?Q?WRX18WVJMHl8g6038e3p1RfqYYng4gZvj6sMhFQVdBh+9W7l/LVDTgv+T6ew?=
 =?us-ascii?Q?rd9/Ouexnw5E1g1xeLUOzP4RQw01oo/MspM5t6G1DLJouuwngNxvn5xPieeL?=
 =?us-ascii?Q?KfHFyl5MC8VXc4nlSSfXMtd4GhdHrWHwqzk3PbPjvVpFqDe51h40VlWgXczS?=
 =?us-ascii?Q?O4FVKr4CYgIBif5bmOGobuO6V2Gh3+NU4mcgCs7kXuK8ky4xzSlulSvKG0ol?=
 =?us-ascii?Q?ZsIpscmW07xnhTQJco6Ry5/7zJJ+tQEGhLA65xNSvY1KYRdhTMoC+AdOBAvo?=
 =?us-ascii?Q?iLARHXw5wT6SEQkywoLugGw1SA19TokOhcLgfTFBVQlyI/hESV3qnOLDsWOS?=
 =?us-ascii?Q?9Jo6aL8UTUMn4EJihfrgOcR0djk/6BhOVdFok0UHcW/afXGXwHGfnjZ+Tg8d?=
 =?us-ascii?Q?rx2it2C71mSFnDBOfUx+VMlPsiPscmWXicgH82csjmymOVVBRW1xCPxcqcr/?=
 =?us-ascii?Q?avuU0a8EDXoL6sS54X5hu5rTnRM58WITLkvitgBATfwEeWqte7AaAuB+KWxU?=
 =?us-ascii?Q?v9aTQAjZoDK8L7mhqnNSYPjxlojEjb5MUpEawjElPgGErV8gtyw6yAof7oAb?=
 =?us-ascii?Q?liIrloTAF70G1z+eooNJYyflxm4E?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cQcqTkdkFIBPMvVNf9RcwiElQ94a37nWoPe4Ox5Id+Ep88o1/elRATutm7yM?=
 =?us-ascii?Q?0PfvuMrKY4gKNnxl1iYLLsgrkle1ScoIqC98Prx6df5za/Ly7a3fuGJd4/mN?=
 =?us-ascii?Q?TZKTeZkiQjsYHpmMi2MS9kHZ0IqpUQV/MAdDRIrgSVEwbyvR5zDTlZLXsL0Z?=
 =?us-ascii?Q?zKBThw7tTB7Ryo0xl6u8QAYi3pPIY/w0bQW9EakALWsL9Ork074sG6/QWZzH?=
 =?us-ascii?Q?EkL4FWVZBmodqQxr7MYUanOVZqM+ewORxlUCVPElDYn2In0ftH/dXBhSPC0B?=
 =?us-ascii?Q?/klXkbbXBSbLncuTYlPJf/y7/xqC1GSxvwSosasdkAoadLURw2jBBKJZZJzq?=
 =?us-ascii?Q?ck4gKBrZ2ysIfXEEoc6f9HiS7TzD8IuBo82fn/gh5kGhxES/0K6u5mXX8u+B?=
 =?us-ascii?Q?ysbJAAnucIwpMDlrBPycDfnFtiZXm0TgPf8+vvir1TBaLdeb+LVZak74bbwe?=
 =?us-ascii?Q?j8asYb898IkyqvqCBkSXsmNtDb/sIHwmBsYVrOCK46ij43kxTaBkleFQaEqs?=
 =?us-ascii?Q?56Nu/SeogIKGcJNb5purxmfM+grHx/dgAdpe+twsn3sDAO2g0xCGug8MwTSX?=
 =?us-ascii?Q?o7R3pB6vwbLVTnAivKqQgvKZWnn3Uf72SnrLnIFy8FFwsIqb5jljd8o20rNs?=
 =?us-ascii?Q?bbsF1yVkmEqR3hhO21f0Rj+G4nzwZfn8goRo1dB3jsLKqx4ftjAGXqGzMrXq?=
 =?us-ascii?Q?dfHtmC562pCKkh2swgKcTOID0X9cRAqm+wMKXC0pk91uCOnqY6fdnd/N6DUC?=
 =?us-ascii?Q?zYGRr4rfVa1zGkqmqFf0IQ+1BImO8A5v6s1UJzXHIKHj63qHT7K0wupw9Hra?=
 =?us-ascii?Q?0b1ixW+Wx2E+g0Q9u+wTp9IBHj5l2GovlaWdv4QRN114kBoW1XLLMgtT6GH5?=
 =?us-ascii?Q?Idut5yje67wEKTGbYgLkOep4pE3I033tS5KLkdahuEcqAYXWC2DyF7sI+ZSv?=
 =?us-ascii?Q?ZFge38AthV0jGX5XIBQ9NG0Z9okOeHwgOkEK1/5tWCnNZSSTPTgNhQHsnonI?=
 =?us-ascii?Q?hBamFJ09HNtvZeAEvh68xj4bi5V8w0eLLAFO80mryGSywRXU6HSTdQR0zOgB?=
 =?us-ascii?Q?6CtiGPKp4oJ/quOQrhvX9lFNH45MNLgtyNqw/QeWA5QCLFGsRf8+RcULD+xS?=
 =?us-ascii?Q?+APO6rZ33CVtfzOEbnzkWhl6/m+SAmtfgIi8Hhbio++vEfZqLvVogxva+vgQ?=
 =?us-ascii?Q?57A6zvOeB7R1hxD1UzWhwmubLc4unzzu2ry7p+cd6xs1/JKcyN52DkEwetfl?=
 =?us-ascii?Q?9y62OfnBeU7O+Lf7+QMd1IdpU3MrHptvWNTMyHPS6IcGDwRE03m8oGXTzvn9?=
 =?us-ascii?Q?vKoXp5FqqzhAVfa2TLfo8VB0fGtKciJIl1Vj5tf2RAOE2wlZkUBf0o94w0nS?=
 =?us-ascii?Q?JRaFvlDLNl+uDTAFJfRWRfQnbrKHaaj+ohHXrlx0BXWB9TZeHRBAb0pqZs2U?=
 =?us-ascii?Q?ZsmIpOyoRQ34w4uyok+XbZ0xgrLIfZF2nrG2GFPRUEpa+kWKvs3rQl4vlnTA?=
 =?us-ascii?Q?amFddHHH2piO0vVOVMZFIzloQGb8rUDBuv4rT/57HvB7nRbgk3p+GnMFgxEe?=
 =?us-ascii?Q?1jBl5hvv0cD75qkgAcupD9PEqEg/q8HZg4h5E/im?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b2878c-d8d3-48fa-0bfd-08dca639f053
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2024 08:24:55.4513 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v1wEK45NwEcPH/rgsh+MQNNNTQ4PnwfvhxVZEZVRu/ZCsLSMe6WApJRcuxWQmcmoOODKpagFgYmjI5NAiQWx71YqauzzmUK3FNEzjvhtoz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7790
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
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Tuesday, July 16, 2024 8:07 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; De Marchi, Lucas
> <lucas.demarchi@intel.com>
> Subject: [PATCH] drm/xe: Add assert for XE_WA() usage
>=20
> It's not always safe to call XE_WA() in the driver initialization. Add a
> xe_gt_assert() so this doesn't go unnoticed.
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_types.h | 6 ++++++
>  drivers/gpu/drm/xe/xe_wa.c       | 2 ++
>  drivers/gpu/drm/xe/xe_wa.h       | 7 ++++++-
>  3 files changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
> b/drivers/gpu/drm/xe/xe_gt_types.h
> index 38a0d0e178c8..1e790ca0be43 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -378,6 +378,12 @@ struct xe_gt {
>  		unsigned long *lrc;
>  		/** @wa_active.oob: bitmap with active OOB workaroudns
> */
>  		unsigned long *oob;
> +		/**
> +		 * @wa_active.oob: mark oob as initialized to help detecting

s/ wa_active.oob /wa_active.oob_initialized

> +		 * misuse of XE_WA() - it can only be called on initialization
> +		 * after OOB WAs have being processed
> +		 */
> +		bool oob_initialized;
>  	} wa_active;
>=20
>  	/** @user_engines: engines present in GT and available to userspace
> */ diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index fd009b2c68fa..de356c024d5d 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -755,6 +755,7 @@ void xe_wa_process_oob(struct xe_gt *gt)
>=20
>  	xe_rtp_process_ctx_enable_active_tracking(&ctx, gt->wa_active.oob,
>  						  ARRAY_SIZE(oob_was));
> +	gt->wa_active.oob_initialized =3D true;
>  	xe_rtp_process(&ctx, oob_was);
>  }
>=20
> @@ -838,6 +839,7 @@ int xe_wa_init(struct xe_gt *gt)
>  	gt->wa_active.lrc =3D p;
>  	p +=3D n_lrc;
>  	gt->wa_active.oob =3D p;
> +	gt->wa_active.oob_initialized =3D false;

Before this init, mmio read in xe_mmio_probe_tiles() will hit in some case,=
 right? I think gt->wa_active.oob_initialized automatically default to fals=
e by kzalloc, do will need to set here?

>=20
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h inde=
x
> db9ddeaf69bf..52337405b5bc 100644
> --- a/drivers/gpu/drm/xe/xe_wa.h
> +++ b/drivers/gpu/drm/xe/xe_wa.h
> @@ -6,6 +6,8 @@
>  #ifndef _XE_WA_
>  #define _XE_WA_
>=20
> +#include "xe_assert.h"
> +
>  struct drm_printer;
>  struct xe_gt;
>  struct xe_hw_engine;
> @@ -25,6 +27,9 @@ void xe_wa_dump(struct xe_gt *gt, struct drm_printer
> *p);
>   * @gt__: gt instance
>   * @id__: XE_OOB_<id__>, as generated by build system in
> generated/xe_wa_oob.h
>   */
> -#define XE_WA(gt__, id__) test_bit(XE_WA_OOB_ ## id__, (gt__)-
> >wa_active.oob)
> +#define XE_WA(gt__, id__) ({						\
> +	xe_gt_assert(gt__, (gt__)->wa_active.oob_initialized);		\
> +	test_bit(XE_WA_OOB_ ## id__, (gt__)->wa_active.oob);		\
> +})
>=20
>  #endif
> --
> 2.43.0

