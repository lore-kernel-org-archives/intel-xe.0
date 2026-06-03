Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7528CD6E57
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 14:24:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C01A10FF08;
	Wed,  3 Jun 2026 14:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AH1WlObi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63FA10FF08
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 14:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780496686; x=1812032686;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ghzJlwEDrwRHAODtg6GFiuKCIN0xIYSH4eilJg/QPPQ=;
 b=AH1WlObiOwlmoKolvggn9wGqUjr4QIv7vVpgx423XpSyctNgJTsHQnW/
 BWLxCDfEcKFX3/Id2qK+0iw0gs8yUAEOxukxZoqxC9y3eipZUWwRqLxkR
 2yRYLd5zOuJqchBS7kx2rkvBxh2rZ/7t5dMCH2tOLk/8GxpPp+x1eYyY9
 7Y6ZIEuLbZOBulFIxiprMc/F/ml1fpcR14P3d8vbj5XVUPDcaYgg4bVef
 unKm8dQS0SniuD7PXmyHV1lo/yTycXXS6+JWpu7PcJkVCo5EShilKgyGT
 cG/WPdA5LUzwgLKeHm2LnxNGfbZ0KOCeR/RY9/ldYmoHaHmFC2lPWJ+6m A==;
X-CSE-ConnectionGUID: svANtwrzQDSURwWVZOijGQ==
X-CSE-MsgGUID: YYG/SWBrSJ+AwI0iX9cT0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="91880700"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="91880700"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 07:24:45 -0700
X-CSE-ConnectionGUID: M3VYjAtRSeaYrOoFrBCd2Q==
X-CSE-MsgGUID: BER950qqRpS6J5afAM9sQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="244104690"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 07:24:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 07:24:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 07:24:44 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 07:24:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJ8O2R7NJ+u3+jp9eUn8ZaB2yJC8cHcTosa2AP+Lpft9EzqLJ+YkCsfxa3EyZC1qz1H2hehib50j9+LrYXkXNg68PHEVWMLfxELl5DsRJo/idh6cbKQRbNZ7A41TWlkMP4hMYgG4ILcOyyYMMzvhRVc9HJ0tDn2XBbrrMx9ss4ozr7z2FQQjcikQr22/jOkMDBFhIL7+D9b1MctIgB5jJR+NAlXRtAF8hwVYk9b0hKlRSJYZQPFEwGHKcTj0PJ3SwYTOxQMB8ojAgbxtXnTedGLry6nMpUw9bEBQvQl6Aj/2e6STkOac1TxzIELxfx8gOrR+y6OHh1WOhpvuRhtoCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXZkrIREhav2kpLGv8rIEtgY1vYW8Qdf7AXWHrkazk4=;
 b=Xjq0wKo5l7Vj1lCCzO7KWOiHFUuyHbArw6/rt+GHLUr+76ADsUk6mri7CjonGgmUmntAdb4VjdNc9ts8At9Izp3gGp/dDg7qu/yYcK3KtUjzLCta+MaJBshw1LzxrQJGf/oYQo0XtKpCyrKLUeXkgpYeS0T6tohwcj1C/X6uqOM/Ii0bXmKVyAZZ3AWgDMp8sNrecAN/VcPR8dHomAhkI7K/ikSDmtu01BlInnh0hUEGePvQhHcKdNrbVfRHlevp6VmHXT3uyzIRQJRZkJEYwDG6RxrQEra2Sd5JJDctUDY7eSPO7GuJX1JQVK9yXg8lpYYx+HVD+63azHdBKoL/sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by SJ0PR11MB8271.namprd11.prod.outlook.com (2603:10b6:a03:47a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 14:24:40 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 14:24:40 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, 
 Mallesh" <mallesh.koujalagi@intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH v6 11/15] drm/xe/xe_ras: Add support to query page offline
 queue and list
Thread-Topic: [PATCH v6 11/15] drm/xe/xe_ras: Add support to query page
 offline queue and list
Thread-Index: AQHc7CmYbhWSCZPkyEihBLNSlqUzQbYs8H4A
Date: Wed, 3 Jun 2026 14:24:40 +0000
Message-ID: <DS0PR11MB871883AF9282F1DA287A2E9981132@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260525100619.3155663-17-riana.tauro@intel.com>
 <20260525100619.3155663-28-riana.tauro@intel.com>
In-Reply-To: <20260525100619.3155663-28-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|SJ0PR11MB8271:EE_
x-ms-office365-filtering-correlation-id: 2657a4c2-c886-47c5-f782-08dec17bd943
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|1800799024|366016|18002099003|22082099003|4143699003|11063799006|56012099006|38070700021;
x-microsoft-antispam-message-info: W1Nr1CdHA+pQsLTW6+qQwzcwHl9ifnDKZped+DF1sqObXVJGObiP/RRsbiSG0heQpbLUHlKQLH4sUmJil5UFMj682vDKF7EMCmrqKgtl0kK1uQIQVpTi39R4ltmO9jGA19kpPfgC4YkAQJW42LszhfJQezGON2hoCJ79jX8ennSS6a5EXguG8k6Vt+cmwguzPatkTnkNxF15WNBPJUNj6Tix9inxoqgYAv+KLsUSLE9YnjBZs/jBDvL6soO40EmLTlt+92XcHulEBL2Na7Vj/SUnlVr/LBCFPOtu43zq7Bkc59nvWb+3tt/+aHGYVLzwg5CiB0kKKevqbd+NbJ4SGrR/cauXQZgmNj2u+zYQIkiiTOpI6a+/qTRr1EKOx5F6X5zkavGCBQizdJLQhYw9BUYMTb0m0J9OFJ/qwhpCt5F6DqgICkzCEasmglvNBcef09EOBbeQFOsVhWaCP7J8O8JtB5Ruz3xf6YRCfQrBUKjfoU2cu66jxZREt2XWhVz+5zwgdsVqbeKsgGcL5QrSRKvlpLp7IkK1IKlgmvxrQh8sTwkhdZJkiEezNzXduLqd8mrDOT1g52UrIzkxnMLPD0GkqY7FmuOslfiNe3qLLxWhDBPQ950ofaHQxJyfxcKbrn7uxcJxWwzhD05R5/lqoJ5WLYrA1J8mTiq4HLd6prW+7bDn+VYUMXQdVjNRcSLr3hvFxmXG2CSVzHJnhiVu1rtFaQ/GMySrtt7/WBmA2g2kxhfcUlvvX05Wwa0Vc0RR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wMgSnkxNRBFKHynkh/NpgD5nnmfF8xXdFzrI/DN8uHkWuptO9ZJboTAkxVI8?=
 =?us-ascii?Q?y1bvUCd5f7YQjq2kepAxumgK/lVltktz2ucN9TU0K50w9QNd8LTdo6ctrf/c?=
 =?us-ascii?Q?NHW+4yuK5PW3vpMhwuEm4sguGMtpVrv4M9sqNPI4rb4O/vLgifuGS91hTDwR?=
 =?us-ascii?Q?vaD3leOm2VQLrO5pDuF1ewiAPEfGepYsSJd3q2wKGDtmSMEjenJMDDMPi9Ea?=
 =?us-ascii?Q?Wof8cf7W7sfcMKEzekVlugKJMBceHn9267x6S3zlbrVv79XuTfguzPr39oB5?=
 =?us-ascii?Q?cG+Gk40IvHl/63wdLjEHOBaeiuuzDtNn2D/RHZHtXqOr4MSFIsKhMjXpiDkc?=
 =?us-ascii?Q?FvsIlmSjm4ATyZ+7LZaMx3FAUThdXTq5f9SvmsUbNJf4rc39ZJxjf+aULMj2?=
 =?us-ascii?Q?/Islt+mUZRc2aGjfG7SIPwbtXDn7q29rTXwHv8gc9OyrI4R7I7lATQxo3I4S?=
 =?us-ascii?Q?8dzNH7uz/ufJxUgD4rsXsvsdO+YOyLu7/EcPdYA/SqOJd1J5yi2yWQEEFxbK?=
 =?us-ascii?Q?EhP8XS2f9U8+LGeuu4KDIuGMajatNJxvmRLsIAU1yc10gO2GaYVg+5tTocO5?=
 =?us-ascii?Q?UT11kgQS/jCbnfFB7n3NPHKmzkRiTiE3CugNIa7lsslGdUQyUhq49W9aZimq?=
 =?us-ascii?Q?Jw+i9wmOUvjInZsNzBQCudx/zfn2Fa00stXQFriCh4GbhiVwMiZCgSXvrTYO?=
 =?us-ascii?Q?du1moNhkA6BUVrtruTffgfyakgGG05D7qXnfiC04PBkmqUG4lz8scU1eSQP1?=
 =?us-ascii?Q?p9ORu3I+Xc9p/pDPWFIyyfhOaX9uCJHZHE9gHErYDGieWfanbmeoGhNl8tQb?=
 =?us-ascii?Q?/Xil4eeU2jD8Ozh/7VWXtBAvtty/xKnHEX0lxm9YyQE2lyc6twX6H7zBEh/6?=
 =?us-ascii?Q?erxd46jYAiQijU+lYiLNGhc6/Z8iQdSE0zW7RncOD93+sSBpjsy9OtjI899P?=
 =?us-ascii?Q?BEoeFXdIZ8gPPQKv4Pgc1lhIn8DymVs+fe+lL/iNrogDqr0VWVKGdx3HaDIR?=
 =?us-ascii?Q?EN6JRkfPeGuIf2Evpsix7pm78jD0dkXlt10EPN2Wycx0iPuJNN6RhRgT8E2/?=
 =?us-ascii?Q?ScFwJuTngYBBwIO1ELruSTwFCe9Tc0YeLxiLSXNJRrp7yCCtZ9nDLXdI9zlX?=
 =?us-ascii?Q?I8ao6FlGXeX0XIuUqvdi6YJkrJg6RUcgqYhFFC46oHPFDCEZz+CZVgtRnNam?=
 =?us-ascii?Q?z6OhS8CLB7vq7pjXNN6XN5UwddYTMFc/3L7ChOw+bo7FfhJ3gd6W3GJqnivx?=
 =?us-ascii?Q?ulRIoUsg0jjauAJHj1yDikrmekZrUM4FrlEPckPykYtEc7/td4iETtwn9vjo?=
 =?us-ascii?Q?lf+DHwImQAEA/emtK1DWcrBHgliWeYI3ohqvyltJs0HVkrXh4niKr4HfK/ar?=
 =?us-ascii?Q?XvluAHbkA8yvT8e8enUhyxRWbvV3bIY+eEi6OgQwWDnXGIysVjBdQ0ZPsL1c?=
 =?us-ascii?Q?dn41cShYJbk1hOQLq7PgmlHqN6G4VaFb0+8mKnEa1JAw14lYbCwFgkIkLF1e?=
 =?us-ascii?Q?TSEKInb8xXBpsR77+XCJYNPwxc4mb0m0KlsMHmC+9f97wqywwA3txq11On2o?=
 =?us-ascii?Q?pml2cXM4v8JXPVMw62IY+zO3UDYakbpNi0Ejl64YJfKoGIpBD/rFk6JHqYYG?=
 =?us-ascii?Q?uX18LeQUrt3M31d18gm98Td3FCHbnTOLxp8NZDk3ZKF70H0a63dZdY3n6E+c?=
 =?us-ascii?Q?k0wniD4w7FFxr7lYF8Ak5KTii7o18Ghsl0m4FfaGhIHSSP1W7wtz6S00Ym50?=
 =?us-ascii?Q?Uf8BpK+E/liY0fQDpdKvKOaKAw1PRncBOS7S7ak2WmNVSvIbmHeBYoodTBUy?=
x-ms-exchange-antispam-messagedata-1: QIY/2AQbUEGsEQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: r/2YruUWVfcwLmjFpRW3oX+ns3blYTBmwj7SJ3UKV5/CumSJvP5Imk/koqryD0jgnNn0l6zLz1hThIXejZa6uqefYTUxiUr55Nb2UV8eFD8IoBjAFAURRVAJTHmS0B7Zb6/f1ONuBlhjuGxFBrKNNzRMJi64NnfKMVClYHYv/A6B2EEgTU03dmRLCLaGN2VLJSWo8d0YtivKEdXqf3VI1aWQeySx4SkI7q28IpuSe+tt+mdntpE9+mXITGvBDgN9RKxCiGMgBiJP3UQbVRCqHHjox2IPZ2HJKGhEnb4PH9syMrRrHC7DVPfEIzBNZKFLFZOjSRpe7EevrC1S+PChBQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2657a4c2-c886-47c5-f782-08dec17bd943
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2026 14:24:40.2869 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ww/zy9UE445sbCtdtB/A8E6t2jadiUQP9kwcEmh8M4DmKOPY/j2s5+dZ9+r2vJvb/wv6AMB12EhNX/GVUwx5s96UMJzP0JWo6u45BolJdhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8271
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
> Sent: 25 May 2026 15:37
> To: intel-xe@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> aravind.iddamsetty@linux.intel.com; Nilawar, Badal
> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; Koujalagi=
,
> Mallesh <mallesh.koujalagi@intel.com>; Purkait, Soham
> <soham.purkait@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>;
> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Subject: [PATCH v6 11/15] drm/xe/xe_ras: Add support to query page offlin=
e
> queue and list
>=20
> Add support to query page offline list and queue from firmware during
> module load. The page offline list command retrieves pages that are alrea=
dy
> offlined by the firmware. The page offline queue command retrieves the pa=
ges
> pending to be offlined by the firmware.
> processing pages is done in a later patch.
>=20
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: fix commit message
>     fix log (Tejas)
>=20
> v3: move sysctrl prepare command to sysctrl layer (Raag)
> ---
>  drivers/gpu/drm/xe/xe_ras.c                   | 85 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ras_types.h             | 35 ++++++++
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  4 +
>  3 files changed, 124 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c in=
dex
> fb6da3d06b9a..1710c6080554 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -146,6 +146,88 @@ static enum xe_ras_recovery_action
> handle_device_memory_errors(struct xe_device
>  	return XE_RAS_RECOVERY_ACTION_RESET;
>  }
>=20
> +static void get_queued_pages(struct xe_device *xe) {
> +	struct xe_sysctrl_mailbox_command command =3D {0};
> +	struct xe_ras_page_offline_queue response =3D {0};
> +	u32 count =3D 0;
> +	size_t rlen;
> +	int ret;
> +
> +	/* Supported only on platforms with system controller */
> +	if (!xe->info.has_sysctrl)
> +		return;
> +
> +	xe_sysctrl_build_command(&command, XE_SYSCTRL_GROUP_GFSP,
> XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE,
> +				 NULL, 0, &response, sizeof(response));
> +
> +	do {
> +		memset(&response, 0, sizeof(response));
> +
> +		ret =3D xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +		if (ret) {
> +			xe_err(xe, "sysctrl: failed to get page offline queue
> %d\n", ret);
> +			return;
> +		}
> +
> +		if (rlen !=3D sizeof(response)) {
> +			xe_err(xe, "sysctrl: unexpected page offline queue
> response length %zu (expected %zu)\n",
> +			       rlen, sizeof(response));
> +			return;
> +		}
> +
> +		/* TODO: Process pages and offline them */
> +
> +		count +=3D response.pages_returned;

If this returns 0, wont it be a problem. Also should you have some cap on m=
ax iteration say 100 or something, just in case it got stuck in loop?

Tejas
> +		if (count > response.total_pages) {
> +			xe_err(xe, "sysctrl: Pages returned from queue exceed
> total pages %u, returned %u\n",
> +			       response.total_pages, count);
> +			return;
> +		}
> +	} while (response.additional_data);
> +}
> +
> +static void get_offlined_list(struct xe_device *xe) {
> +	struct xe_sysctrl_mailbox_command command =3D {0};
> +	struct xe_ras_page_offline_list response =3D {0};
> +	u32 count =3D 0;
> +	size_t rlen;
> +	int ret;
> +
> +	/* Supported only on platforms with system controller */
> +	if (!xe->info.has_sysctrl)
> +		return;
> +
> +	xe_sysctrl_build_command(&command, XE_SYSCTRL_GROUP_GFSP,
> XE_SYSCTRL_CMD_GET_OFFLINE_LIST,
> +				 NULL, 0, &response, sizeof(response));
> +
> +	do {
> +		memset(&response, 0, sizeof(response));
> +
> +		ret =3D xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +		if (ret) {
> +			xe_err(xe, "sysctrl: failed to get page offline list %d\n",
> ret);
> +			return;
> +		}
> +
> +		if (rlen !=3D sizeof(response)) {
> +			xe_err(xe, "sysctrl: unexpected page offline list
> response length %zu (expected %zu)\n",
> +			       rlen, sizeof(response));
> +			return;
> +		}
> +
> +		/* TODO: Process pages and offline them */
> +
> +		count +=3D response.pages_returned;
> +		if (count > response.total_pages) {
> +			xe_err(xe, "sysctrl: Pages returned from list exceed
> total pages %u, returned %u\n",
> +			       response.total_pages, count);
> +			return;
> +		}
> +	} while (response.additional_data);
> +}
> +
>  void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>  				      struct xe_sysctrl_event_response
> *response)  { @@ -341,4 +423,7 @@ void xe_ras_init(struct xe_device *xe)
> #ifdef CONFIG_PCIEAER
>  	aer_unmask_and_downgrade_internal_error(xe);
>  #endif
> +
> +	get_queued_pages(xe);
> +	get_offlined_list(xe);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h
> b/drivers/gpu/drm/xe/xe_ras_types.h
> index 8c2d13152b32..fada9802667e 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -12,6 +12,7 @@
>  #define XE_RAS_NUM_COUNTERS			16
>  #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
>  #define XE_RAS_MEMORY_ECC			BIT(1)
> +#define XE_RAS_NUM_PAGES			25
>=20
>  /**
>   * enum xe_ras_recovery_action - RAS recovery actions @@ -192,4 +193,38
> @@ struct xe_ras_memory_error {
>  	/** @reserved1: Reserved */
>  	u32 reserved1[10];
>  } __packed;
> +
> +/**
> + * struct xe_ras_page_offline_list - Response from get offline list
> +command  */ struct xe_ras_page_offline_list {
> +	/** @max_entries: Total no of pages that can be stored in flash */
> +	u32 max_entries;
> +	/** @total_pages: Total number of permanently offlined pages */
> +	u32 total_pages;
> +	/** @pages_returned: Number of pages returned in this response */
> +	u32 pages_returned;
> +	/** @page_addresses: Array of permanently offlined page addresses
> (4KB aligned) */
> +	u64 page_addresses[XE_RAS_NUM_PAGES];
> +	/** @additional_data: Indicates if more data is available */
> +	u8 additional_data;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
> +
> +/**
> + * struct xe_ras_page_offline_queue - Response from get offline queue
> +command  */ struct xe_ras_page_offline_queue {
> +	/** @total_pages: Total number of queued pages */
> +	u32 total_pages;
> +	/** @pages_returned: Number of pages returned in this response */
> +	u32 pages_returned;
> +	/** @page_addresses: Array of page addresses (4KB aligned) */
> +	u64 page_addresses[XE_RAS_NUM_PAGES];
> +	/** @additional_data: Indicates if more data is available */
> +	u8 additional_data;
> +	/** @reserved: Reserved for future use */
> +	u8 reserved[3];
> +} __packed;
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 5ccfc6325a90..b7a5e82c6eb0 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -24,10 +24,14 @@ enum xe_sysctrl_group {
>   *
>   * @XE_SYSCTRL_CMD_GET_SOC_ERROR: Retrieve basic error information
>   * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
> + * @XE_SYSCTRL_CMD_GET_OFFLINE_LIST: Retrieve list of all offlined
> + pages from flash
> + * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Retrieve list of offlined
> queued
> + pages from firmware
>   */
>  enum xe_sysctrl_gfsp_cmd {
>  	XE_SYSCTRL_CMD_GET_SOC_ERROR		=3D 0x01,
>  	XE_SYSCTRL_CMD_GET_PENDING_EVENT	=3D 0x07,
> +	XE_SYSCTRL_CMD_GET_OFFLINE_LIST		=3D 0x09,
> +	XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE	=3D 0x0A,
>  };
>=20
>  /**
> --
> 2.47.1

