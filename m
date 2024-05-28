Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C212FC25B78
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 17:06:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB95112497;
	Tue, 28 May 2024 17:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lpi9LaoU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2920112497
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 17:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716915959; x=1748451959;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oetEApEySmnSkPWkGA2USH4XD9DLgbHiylcYO4s1+uc=;
 b=Lpi9LaoUw+si0OjfUSZQDDLgpa89moTxg7bwKKupT1LHOls7R3YYMJse
 VwkvA25YNDZLcj0WBE3D4YKVW/AJ2eWtXO5pr3WDNR2kkIkpVSXObY/CO
 8MpxoUZBH0WSsagZtiaeVG6p5lbKZ5+PFVHjFvzqDKHjeDrP13Z33jH3q
 Mzby7UWlJFtySaBVacIxGDZoJxXGFzZ1M//OHMU4lmP0fXYChHk5y80xo
 UxFndD9de0WMwilXcFyWClC23WjxOzH31AF/kQBlJvvFY+7b2u2zm6WTu
 bUV8vzNmqt51vwHs1ReDppaShprZSLgAQfWqFQHcjlaJ1uUqUWzsnan3o A==;
X-CSE-ConnectionGUID: oWPh3wgtSIGsXr32oijIsA==
X-CSE-MsgGUID: ejelp54GRteF3vkgA7Ekvw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13152403"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="13152403"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 10:05:58 -0700
X-CSE-ConnectionGUID: o1UhAcgaSD6NFR01IQT5ug==
X-CSE-MsgGUID: Q/IJb3tWRLmspGa3cyldnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; d="scan'208";a="35167331"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 10:05:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 10:05:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 10:05:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 10:05:57 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 10:05:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJaLUmxid2t91qVqkxMlNUHUNMfE8cqss1+AQQOxqjgB6TgNqtQsFyicSKUoy81Q0vKrcGwu683k5T6JNEibgiskyGcXPLlOypCn7/DOYwFUeFtXEwVrNlgRUTarUmzsYovMsoj5F0UTR7K1CyrDZbkYGgYAhzsmCWHnTlrkxgOK5L6tcNKnPH6G733aDXOlRxFqmKufNX3kji8FuJOnbQgoGGdCff7JaU4j8nxnI4e2aOxQkIkpfKg/4bqzjByHKG+99EZN+elxEo5G4JfVSeD7XF7Uzeo4BdzTdCuTSD7tg+RX4nNquoMisAgYI8NgdyLzMWpiojlD9wglkl1aAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9HtHld3gOiJjCjiensebwBC/KkCu1NXrgBzTPivWnM=;
 b=NyK+7VPBhVJnerqqPHuCOx5JZJ8mUyNQ4pklCqA546RlUr/0Ym2LKbBLvrjj+FCUGwLVAAwu1h7qRZP7grkNWrKlgv29KS3Z3jebbngGbA044BIoYl9LCR8LunXBg3BjulwZnTkDgCjgTzPr1CFgDhi65aJiBRwftWqFxiAdDoYR+yDJJS6bFvqSBmMestHAojHAQoMPWVEUeIeZYtSWmfGB1eWOcHZX9G19HY7L7DKzUx95xHKQx+6a6rweElOuOMx3nOO/plMLJyfDldRj3w+xBRsCX1va9P64ulmw5vS6zwtMc7I32pgu+3ZVtls91u/Kw1phtBfXzDsvO5wLVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA0PR11MB4735.namprd11.prod.outlook.com (2603:10b6:806:92::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 28 May
 2024 17:05:54 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7611.016; Tue, 28 May 2024
 17:05:54 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Subject: RE: [PATCH] drm/xe/xe2lpm: Add Wa_15015404425
Thread-Topic: [PATCH] drm/xe/xe2lpm: Add Wa_15015404425
Thread-Index: AQHaraQshAgJuj6UU0qzi8irFp7Nr7Gs5fZw
Date: Tue, 28 May 2024 17:05:54 +0000
Message-ID: <CH0PR11MB54441FF292F5CFF4CE26E529E5F12@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240524063228.127423-1-tejas.upadhyay@intel.com>
In-Reply-To: <20240524063228.127423-1-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA0PR11MB4735:EE_
x-ms-office365-filtering-correlation-id: f12b28cb-f7f2-42af-4d41-08dc7f386f87
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?EIYGvp5R2Wrfsq8If9oVxgk1bgMV9dyLyjDSCYOx4S86a3RiGYfHaTbaemSF?=
 =?us-ascii?Q?jlSApuiYhmC1eNSVwfuUFXO3q9iNZeXQGfl2fS/dtV7jUiLrgNoLfPb/88S2?=
 =?us-ascii?Q?YDRO904hGpLmVLr8hHAY6RsQpXHYVVJ4k2Yax7EKl0e/XNyM5N5OBnWUh4UY?=
 =?us-ascii?Q?O2mKsSKasvd0oRI/ztEcu4lRq6tdgt82c6iz3Zt4c695g1y9yLtPAXb20G9q?=
 =?us-ascii?Q?ORa9eFqGJXYnFq83tNwWKSN5sTalZRFoWE58erUHvAWAPQ7nxgZ90RZgw6EY?=
 =?us-ascii?Q?2vbr/CwwsjXNaZXg6ZxhcbWjJ37OlpTPXw4rVXzaBTnOnJK3it8nSxqDrfNH?=
 =?us-ascii?Q?NaPBxa22I5jghBZaXj4n7Ng1dwLOS+/L+HBpXg3NJeVR6i0nxkITWe4o2b+U?=
 =?us-ascii?Q?R7jvLNjd6G73vVzNZid6Uw0B/bAAe2u6LUtbheIX+Et+UFDdDwROwwjjmNcV?=
 =?us-ascii?Q?y+EZp85WP4Et4jxB4b18SSWAgjASumyukODHTst3uGlxMHT8E988iarIBfSo?=
 =?us-ascii?Q?AH38lKkYvWP2FgG4DUdbxDKKFLcAlwT8ofkZsx9Ojt+e22xWseWP8r5prniq?=
 =?us-ascii?Q?CVEs9WU09Gxdyyy7s0CBG+wgOqEUU0estBKyTP+WPXQk/SsfJqeg5TtCvbWX?=
 =?us-ascii?Q?EoH+kIfjb0rYi8dDW1xJGxCbnw1XdHg3DCCAm7cogbYFVkm3b6C9HMkWiyR5?=
 =?us-ascii?Q?NDXwa+wXzHWRMr6RSXFaupNKgHtUNmw3ldZE0vEqatf8+84VkzvBLU8UwV0n?=
 =?us-ascii?Q?ZXRBgAvYNR5EafvlGtyvfBvkcjQpZnLrYyjdltY+VTs8biUBy7D5IGsBP/9j?=
 =?us-ascii?Q?P1v3AyNtvICvgWd9AIoUEOrp2p1SZn+yEJ41ikNPXtIyi+sV3pX5vNZDrT9u?=
 =?us-ascii?Q?XM7UlcqQSP2+IO0UBKaFGLn4sWOwllZERfYq0Y8Q+Gi53wnzBnWxe5b3lamu?=
 =?us-ascii?Q?MlpLxJZAfhT/65FB3UGa/6QP3j5O1Ynt3GddHq38dnLGXmGuPCAvhLG+B8ZZ?=
 =?us-ascii?Q?W6NrRXL7RgJ9I2RzHhE4xVnT8RqJiUBtorpd7YLo8B3AUiFvY9BvCQjpbLs1?=
 =?us-ascii?Q?KJlOB/74BQdGaIMPBsoVoJkj9KeDDsV1AQ86yyPiCcra+ACNuD36fEzo+1XS?=
 =?us-ascii?Q?rC12kSWSQssVGVPlFk5CkU1KKYV02YH+eDDxwWjtbp9ls4ayfRZ6MnjIkb2f?=
 =?us-ascii?Q?XcYlC0ObE3OqkprlLrrq2fQPO91EiRV4rf91amsPowEXYKO13mi/sEz5sqLn?=
 =?us-ascii?Q?nj3cn/hnxqIpTDr9nNsoto04MF+r/PDyie9YWIzL0GnpngyK7fcjgfKJ2N4R?=
 =?us-ascii?Q?+NyxOjTugCgmh12L49PF/gMkMe/yfQiH4tS7Jtgvz7Yvcw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nIE7/76ZOu92jvVxmfafkzIRIO5AsZ/J76JupwZp9P5jO9Pru6yLSxYl9FNl?=
 =?us-ascii?Q?sewFLGvzMxugbQRR0TX4bPpDY7iiWPDRazihyH5EYqmgI6XRBVasjAzIWalX?=
 =?us-ascii?Q?OVoGkrnriVZqhqked9MBftBSHNzxZEEqYKAQkuM5SzjsbCnpENqxGhqmrK6M?=
 =?us-ascii?Q?ZH3wXMtsE+AtUQ6I6p/8kh35rRbrU482x2HJqaRxg0tAyY1dULZoSlZ1pVEv?=
 =?us-ascii?Q?O/wchDVzu75lzqzwCzGwP37Bvzu6G5IKUeVMSz4p6hpZcI23+n49TXxzZ05X?=
 =?us-ascii?Q?BulRxKDtZC6pdC6iMsEsMAKx/g3COgI5BSnsauiWlEKsKyctNZeMoqNyxWaX?=
 =?us-ascii?Q?mSfDMMgh8cW9cE9KirixAyU4udoxQfmHkjBFJxkkl30A+vYlk0eWd2ujMsDK?=
 =?us-ascii?Q?QDueoRoiUoQWMQN0lIpYsNuRopUPDf5Epy5K85he7h4klJOq9GmlAeKUKU5U?=
 =?us-ascii?Q?DjnhffmymdjLwumLylgzCK2r+9qp/vQXxXeGpWVhB4kMu+6jmmtyqr16T/Ym?=
 =?us-ascii?Q?q/QiHWv+fsK86TnSZnDFLaXqDLSc+epYsBipYVkWMDxSNAFbBERNQfh/Dphl?=
 =?us-ascii?Q?Wdtg7uGBDbjMMmyXkwj/u+SK6Wxo+LlhstwBsIc/AkN2qrt54dV993CzFo4c?=
 =?us-ascii?Q?kI1kjsWhSgJInyHurC2fClJq75qzmSH+IBOIaPqpzTvy5k2y6Cpsw/ozm2Dt?=
 =?us-ascii?Q?SNvzSogoQQU1T1iheU3mkykh7I5gy5OMVrhDxk5dToTCnbSoVib2B4iEPGcB?=
 =?us-ascii?Q?3WA3hW+sKD2NtN1Ej9oNHoMVq2lUcddzpE/0rP1HWeEt2x9Oy1XfnaeJdicw?=
 =?us-ascii?Q?CwkRMaPIQImGZh8eEvdxXAo97RASPFz6FIo49YKOe0vPm+LeNgrE0bmkssI9?=
 =?us-ascii?Q?7RYo7sD4H2I+jkT6bNVOzdnvF0FU3/8+NTcRZJESXnDtF8BgHCEx6tFldU6h?=
 =?us-ascii?Q?3mb3mjayUH4UO+CmdAbjVQTDkJOVs7pCdbUNugE7J0cmHC1KqkNuwF1fXOzf?=
 =?us-ascii?Q?aeKPvd4EpTHyVfYRiY3up3dQ630BSooLsB/bqdyLvrmPjyB87ZsrCxJXA2To?=
 =?us-ascii?Q?piTFAWTwRmIiE5F1/0bQqzcS0TfN2fZZPDsRGGLwBnFEzPOgOZ1mfNx9LjHa?=
 =?us-ascii?Q?l9QySK7lMhK9JiL7I9qcTCbh0S8Q1qG14WQkg5KTee/srCPwWHn7YAP5CGf+?=
 =?us-ascii?Q?hnq4gBqmbLQfYUK34VfaSI2YjXXXFdba4UQO2akDeNRQvpRThuiTk24OyFU1?=
 =?us-ascii?Q?esyJXlqeO8oSTlHNQppRqixaJ9SBbLKovCBDJbEKcs5huCKGkZ3Zkfrfl0ho?=
 =?us-ascii?Q?CagOvFFha7NOT0khCzdSzVql2OQ+HnJJm0pHSwul2McbXch1AkP1JwOvKBiK?=
 =?us-ascii?Q?HvGEbPTzOtWq32qr5GV8qv6LrMDQRV45FTl8N+f9FGmCFhWOGH5+YMZxCKmK?=
 =?us-ascii?Q?OcY5jIgrptQ4YLjwYRPAfFp3JwevbatFtm9DyX7wS1JG56x6Kt3yNTTcQy3L?=
 =?us-ascii?Q?ZPjsTesZbfKWQbqdc3mPsyDMLA4kCp1x1/XeQdstqjykmctmBxOKeVF7awHI?=
 =?us-ascii?Q?Nii14g6WHxw2g+w6QfDVEYeh20PHMHM8w0kGwqmu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f12b28cb-f7f2-42af-4d41-08dc7f386f87
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2024 17:05:54.5375 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nlw6Md0/cefHjhqK0ov7UsI6jjYq5ht9z7me8Ed4xLGX4h4hrQT6kpoiXh5qCi2FcUTd0mp8gXLxNTh5HU36fLjzfj2+YKaX5cEF2URTeh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4735
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Tejas =
Upadhyay
Sent: Thursday, May 23, 2024 11:32 PM
To: intel-xe@lists.freedesktop.org
Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe/xe2lpm: Add Wa_15015404425
>=20
> Wa_15015404425 applies to xe2_lpm all steppings
>=20
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_regs.h |  1 +
>  drivers/gpu/drm/xe/xe_mmio.c      | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/=
xe_regs.h
> index 722fb6dbb72e..07c8a23bd7c2 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -42,6 +42,7 @@
>  #define STOLEN_RESERVED				XE_REG(0x1082c0)
>  #define   WOPCM_SIZE_MASK			REG_GENMASK64(9, 7)
> =20
> +#define MEDIA_DUMMY_REG				XE_REG(0x138000)
>  #define MTL_RP_STATE_CAP			XE_REG(0x138000)
> =20
>  #define MTL_GT_RPE_FREQUENCY			XE_REG(0x13800c)
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index ff7a7cf99530..e1dc87078387 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -450,6 +450,21 @@ int xe_mmio_init(struct xe_device *xe)
>  	return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
>  }
> =20
> +static void mmio_flush_pending_writes(struct xe_gt *gt)
> +{
> +	struct xe_device *xe =3D gt_to_xe(gt);
> +
> +	if (!(xe->info.platform =3D=3D XE_LUNARLAKE))
> +		return;
> +
> +	if (xe_gt_is_media_type(gt) &&  MEDIA_VER(xe) =3D=3D 20) {

IMO it might be better to combine both checks into one, I.E.:
	If (xe->info.platform =3D=3D XE_LUNARLAKE &&
	    xe_gt_is_media_type(gt) && MEDIA_VER(xe) =3D=3D 20) {

To that end, it might be better to have a boolean helper function
for this purpose, such as xe_gt_needs_mmio_pending_write_flush()
or xe_gt_needs_wa_15015404425()

I won't block on it, though.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> +		int itr =3D 4;
> +		/* 4 dummy writes */
> +		while (itr--)
> +			xe_mmio_write32(gt, MEDIA_DUMMY_REG, 0);
> +	}
> +}
> +
>  u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
>  {
>  	struct xe_tile *tile =3D gt_to_tile(gt);
> @@ -479,6 +494,9 @@ u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg re=
g)
>  	struct xe_tile *tile =3D gt_to_tile(gt);
>  	u32 addr =3D xe_mmio_adjusted_addr(gt, reg.addr);
> =20
> +	/* Wa_15015404425 */
> +	mmio_flush_pending_writes(gt);
> +
>  	return readl((reg.ext ? tile->mmio_ext.regs : tile->mmio.regs) + addr);
>  }
> =20
> --=20
> 2.25.1
>=20
>=20
