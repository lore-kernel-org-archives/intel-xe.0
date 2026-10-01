Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E88CA5FD2
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 11:38:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE8510E34D;
	Thu,  1 Oct 2026 11:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KvmnPrYN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3889210E187
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 11:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790854682; x=1822390682;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dRR4232Jf0X/nycBmhM+QCjeq6VD72ELCQVjzQG/w54=;
 b=KvmnPrYNIUxE3R7hKnpzM4Nvk1lXw6aaH67gRBuvFArWYVb13w5s17Kg
 ShoA4Me1/fTJcm5F6IdIV3eE2lrV/LcavuaNKfZRJ7QR7n4R7hBpjDXoo
 fGuH34cm3lzKSXNQwjeNhyWAAB8G8X/oICwzXXwFgRw9Q8ISSCyuu/8nc
 3sPbz1RU+nsXJXUM3x5Yd6bYsgcJh7lfATuiW0iBz2nGTCbydm8vAqBRj
 8XBUiNu55s2fDVf5wndDBlV6c1RbCTqthdYCTTmBVM5HXGpWpIjtl4gSL
 GpgPgVyM8PAgECYHRFIS91/nrrmtXuQCN9ilr9n2GxX0HYp0DjOw1hNwg Q==;
X-CSE-ConnectionGUID: pzlPcQmlTJCK8gfFzczWcA==
X-CSE-MsgGUID: NpJO1GJ4QympJ/olwrM6YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90821304"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="90821304"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:38:01 -0700
X-CSE-ConnectionGUID: NsKi7Y30QaqEfLxb5Y8syQ==
X-CSE-MsgGUID: ZzPU2Gz7TRenIdYlCnKgag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="284026909"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 04:38:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 04:38:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 04:38:01 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 04:38:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NjSKFsnlBo+z0yv4sGs0hqAXCluEUcpUnHmWsWhfWEH6L7JPMirEQC1MHQN4DLR/RoGzAFhumRnQyduAoXCvvSj0oB+2ZsuDdIeWH+U5LFtbi+viR+dR1r5fvbkk0CdJ8lvXveURdZCEWIBqjFS419q8w4JhBpgCgMErKU/e+GqwpRw6s6kmwDWISVSz212WuWMXoYOnFf4lZE+YHzr5dvNG1Ke6mlehhIsxp/PtvdqGZT6QPQhzH3jL1P/zfdmiR3MuhGPEhagmNEysK94zhOiFoZIPk4uBxAo3e8CVY9DybQZ/2w/cvB6j0yme9MUmrKw5FQsFjbK4yO9RXadRkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/Wo4Zrl2mU3xHSDx0wsR1IlJqBp7HjJyGisTMtZzy0=;
 b=egVyDS6m3GCiHCfRohW0Bmcfp2oGWaAH0g2r+7hzcZC5eTI9wGV7YSPgofGEixAjgK3KzLWwlYyRISooDcbi7dsrmeZQRvMCHh6svekUHn0RQ4aVQAIVNmyGTN/Yd8UunhSI8KXCtEXuzAk530CDo4QVwdtfv83rt1ZxcL/HE742hLJ+PHgkyUUN3EiUP6Mlk0y03mN67jWAf1ELCJ7vBA0pKM7ERHbRIfoL99oTKGTGSzL/jHtVOSUC47pqLsL7CmYL0gUp/fwzXJiTi06jrwHfmAPq+6/lDmY2sRG6a4ohTBewjKwmgBrNB5FeisyNR4BLN9SFIcZLrqWk7b053g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by SA2PR11MB4907.namprd11.prod.outlook.com (2603:10b6:806:111::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 11:37:21 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0451.014; Thu, 1 Oct 2026
 11:37:21 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, 
 Mallesh" <mallesh.koujalagi@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH v3 5/6] drm/xe/xe_ttm_vram: Report max_pages reported by
 firmware to userspace
Thread-Topic: [PATCH v3 5/6] drm/xe/xe_ttm_vram: Report max_pages reported by
 firmware to userspace
Thread-Index: AQHdTxFKqFzTrozPdkSFdXjUQ+Mve7bolDZw
Date: Thu, 1 Oct 2026 11:37:21 +0000
Message-ID: <DS0PR11MB87185ED2AE62428ED81D842D818A2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260928061830.417395-8-riana.tauro@intel.com>
 <20260928061830.417395-13-riana.tauro@intel.com>
In-Reply-To: <20260928061830.417395-13-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|SA2PR11MB4907:EE_
x-ms-office365-filtering-correlation-id: bdc7b898-2fd4-4541-37b2-08df1fb05b44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|18002099003|22082099003|38070700021|4143699003|10067099003|11063799006|56012099006;
x-microsoft-antispam-message-info: ckt8vVya5kxDd/r4U+m7FHvWp9DHeulqji3DnRZMz5av3NS+AjaKSkVy+WmqwC+U0+2b5aN/lIDZmhWSOHqNMiEGd+ND8UrTklqaLNS2QU0Eh5LdqDDd/lIYfLOIuk6B6503xAcNaMRIizPkgMhGyDTxbYvb9Ve+niuceR7sIJmeRMdnng/m8qAoGMwoijNKPRbcFi1e4mc9aI0Q0oPy+P2nRwdg4m393OOi1WkVIljdqdXv4jWxNtFP70+jS/5E7zMEyaUb7RjTKGzojo7oZbQFd4FDWoINo3jVqOLIia+HpJ04Bp6sK9XZP0b3s2kVzBpiP8RxiB06rb9023+hp3JgxGDvtea0RbSx2MZAaIpRkFornTOt2uhAfAztyUjmhz30ydS+JbkqL4Wa6vzMk9CjYKVsnihqhqD6C0NSEu+8uJ/opxQOVzf4Uq+bqhKVTPTJ1GGBA9vrr3kmvX0Xjoj5fqDF64rCjuXoP2nfMapVWEygseFCNbfpGnKkyH4h+VTmX07rrabiyoPvgTI5F4gZDlcDIWXEDe3OOJaFbj/DpuBZIvWbF8xJdMvcELQllgwnvhk5qCWtl6vkc57bLH3gGgHSO0XFJCCOqD8RaH50kpQGo0NeTGd02JnttNG0yi9krVCwQQsqk0VjJiG1hkWfNTFrr/b/+X8Yacv54OzTfAolZKFK24qE3t0RYLzM0vZ4gSiXSjAvH2K4Jlk8Y53brMaeTXJcmaHljLn4bwE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(38070700021)(4143699003)(10067099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?N7m7RCvAT/qu1PklM8/u9kUpsMmDpyHsZPZuC2+/PPU+ehXI7lQ/GkHRZncB?=
 =?us-ascii?Q?7LJw6MNWkO29t4CocMizbc0SW1TsjRNeXaD3n2MW+vDioMl/JAtj0omPh+nB?=
 =?us-ascii?Q?0bOz4a/e9q18v7s2sPEE0uAxRBKeAqcEpPOFj+v/gVhTpcBHNwqAxLm8zT2b?=
 =?us-ascii?Q?STlf0QY8Ybb5ODEi64EoiNjEWtv7D0waX7KuZ+FmijkguRSFr+c8z6lnd1VA?=
 =?us-ascii?Q?dcYY2uTgou/ur+smEHQ0vxScNUac4LkWYyxxc4pCCK/Q4IuMUElk/Cmo3PMX?=
 =?us-ascii?Q?gtf+/i3MEWrrv4wcsHhv9bISJL3oLWVK4Q/dOl2tWNWpFMhQ6fm4ISPkRsXY?=
 =?us-ascii?Q?pMhZIbYhgVbzLsCYnwUsw52varSOC1qdBV94bxN6UmK8KWYewnIxkVljOuEt?=
 =?us-ascii?Q?BPBgHG9YMU6P79kWNzbU6xK3ydNMRoUZgaQvBoCKtv9wpKniJ3j4VQJhZVXd?=
 =?us-ascii?Q?4yf7LFXeFcpAb6KJATMZhvhHmcesSk/asIofxopswNKcs7LY3Hl8ivG8x+lV?=
 =?us-ascii?Q?o6U70D9jft1vZFPp95fSm/g7gN2CyVqmdqpLzQTZFr+GklI0YuROSoKnbyha?=
 =?us-ascii?Q?vi84UpQ0yrc3ZKodpPyBELN5OmW+ek+sn4QgnXEjnVueubi5fl3oTLmX6pUz?=
 =?us-ascii?Q?uslPbLMR2SPu8BTrdM6xCFcSL2f3lIDXwi1I73t8J9wexkj4q6PBbiWqlVRt?=
 =?us-ascii?Q?AFb2k1yF3M1f4kyVYn0J9nQ/k+vGBaC8SHriWf8mYFO4BctXVTBL5zz5Xk5n?=
 =?us-ascii?Q?0L8p0iC9dKJ+OPRpkpqzwRss3ftZeJiLplGI8yWnXhQw0R2dXXcjufp84Dr9?=
 =?us-ascii?Q?L7MkyPiyetCu+1E5sdQbU9ccHI1Pj8PyZWZ2miZ2UI1Ud7WM7GFEcAxp2j4w?=
 =?us-ascii?Q?Lv6HwToMuVecBQPNn0Zx6qiLSx4XYs1EBFuSk9QWRcKqK65zQLeZXhTT33Ha?=
 =?us-ascii?Q?3fll6b+MV52vP6ccRh3HHBzRfVdlMrTkjnKuIM1+T2sU0Aml3zeAa1DStIuG?=
 =?us-ascii?Q?lrRjceFP3RktfgrzGF4B+h5QYpUCZfmGO2/qQ2RkO7sFnnD/QenlMl7GNk5B?=
 =?us-ascii?Q?cCfQwEZncA7FWLTDrRhysR2Jdz+eaE1NuWLSYMSZZXJCkiXz9y9fQ/miTyBL?=
 =?us-ascii?Q?owHDIOt4pfbeIFqKOROitzzuVUdf0NXXZgLm8lRfJOAIlCjLWZE51XwpH7Fl?=
 =?us-ascii?Q?a5OSb0k6tZKIo/htefpWdTjaav9n2DawqxXLIHkLpk80uYqHHe+hvbptbzs4?=
 =?us-ascii?Q?SjUGhD9mIuAczv6U+fpHUo5WJEEsXrHwl0MvSjqDCVimt1iURfrZs673Q2OS?=
 =?us-ascii?Q?RSYsz0MTbxFdh4UdYLWiLZUGnHBZOTvoocdf1yO4cmBYUCedDqtbqNAekZy0?=
 =?us-ascii?Q?s3T6K+2jdXMGax/kCdfUdNuG3O134lOEWP33gJJ/fvrBuP8/Sfn2s0SymxDh?=
 =?us-ascii?Q?i1Dfbs4iIEZfHnybv4OxP3B8n91cqDugVQog9BT1U+9xi7usZi8mHuPj/EpQ?=
 =?us-ascii?Q?9BbvVkO6DxmFpoYvp/9dJdisUIduxNlFc2mEB+pqHHJVuaLRcqVySMudLJMP?=
 =?us-ascii?Q?N6hssqBLpSbEFMv+cOOlItrbUj2PqW/1m/vMngIHFa2gmmHAE95DJgSqgTPE?=
 =?us-ascii?Q?UOL52rvS4KNh4uYTMRh9JWdzcS7u8BGs3IYn3iaNIhIYwU3+sywcizWeeMNT?=
 =?us-ascii?Q?bhFeMPViy2JjXuu3IlMzPJGYfMyQ63m06DtceVlftQcLUte1BkhgTK7K2bml?=
 =?us-ascii?Q?4GDmAxKabg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: fcxaQD0roKHboZpDCMkXaLPPftf0o5XjfQ+xDByiuqb+SlniSSxHT8DSetp28zmJpSgr41+i2Rg2TWZpAhU2hUop8GqKqU8w+I8/QH+mCxuPdYIEjXZjlOlB1kM3oqCUAE4xD1caKmQc/eUougKEV/0Waz2vLdaVZX7H7dDKslepA072NJng3bA0Y/58w+vWfAhgihU3ZQ704Z968PSWkGr5l9Ywv97AnZRQIoefF5AdGzlKEcV7wPvXzrResxlBr8ZwmmF/dBWdDB48IC6PaO7R/ZeioaRwltqFCmQ2FNMa1h0X7HcLZPPxly4o90mKMOHJvLQZM1KMvKvMO5sTOw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdc7b898-2fd4-4541-37b2-08df1fb05b44
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2026 11:37:21.5481 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y4CYB/bRvD9HQUDAztBrbqKJ84J8z8WrCBhJIzlKTvXhK67VTh95uhfYGIuenM4bfW9+OKBU/PFPZpmE5oeOW9a9HjbWRlghMwGhyz4n7Zs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4907
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
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: 28 September 2026 11:49
> To: intel-xe@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> aravind.iddamsetty@linux.intel.com; Nilawar, Badal
> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; Koujalagi=
,
> Mallesh <mallesh.koujalagi@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: [PATCH v3 5/6] drm/xe/xe_ttm_vram: Report max_pages reported by
> firmware to userspace
>=20
> Report the maximum number of pages returned by firmware at probe,
> resolving the existing TODO.
>=20
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
> v2: fix commit message (Himal)
> ---
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 6 +-----
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h | 2 --
>  2 files changed, 1 insertion(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 2c4722a956a0..cc33ba7e23c2 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -1012,11 +1012,7 @@ static int vram_bad_pages_show(struct seq_file
> *m, void *unused)
>  	struct xe_tile *tile;
>  	u8 id;
>=20
> -	man =3D ttm_manager_type(&xe->ttm, XE_PL_VRAM0);
> -	if (man)
> -		/* TODO Hook with RAS to show max_pages fetched from FW
> */
> -		seq_printf(m, "max_pages: %d\n",
> -			   to_xe_ttm_vram_mgr(man)->max_pages);
> +	seq_printf(m, "max_pages: %u\n", xe_ras_get_max_pages(xe));

Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
>=20
>  	for_each_tile(tile, xe, id) {
>  		struct xe_vram_region *vr =3D tile->mem.vram; diff --git
> a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> index efcf3e1d4e80..dc97b0ad0e51 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> @@ -37,8 +37,6 @@ struct xe_ttm_vram_mgr {
>  	struct mutex lock;
>  	/** @mem_type: The TTM memory type */
>  	u32 mem_type;
> -	/** @max_pages: max pages that can be in offline queue retrieved
> from FW */
> -	u16 max_pages;
>  };
>=20
>  /**
> --
> 2.47.1

