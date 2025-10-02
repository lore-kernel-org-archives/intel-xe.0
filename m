Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860D1CAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 17:34:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2172510E82E;
	Thu,  2 Oct 2025 17:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H+kNJw+H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E5310E156
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 17:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759426448; x=1790962448;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xVckJIlrlBRF0MWWhLUc5wVWk+JIrzw2+CGBx7mBkP8=;
 b=H+kNJw+Hj2xweeVcO/GC7tzZ02qc3MMnZsYik0Kbm/mNwN9ayYc2zPyq
 Lqchaa5pkLEY9QGK6TFuVjRCpdysQ/giw68lJo9miLi2cD9sBHMSZK57e
 BUQeK08LIP9FVhjTKBgl1XL+YxXFmILxIZaLzB+z5RQWh+Dwk84/QB7EJ
 cheD7a5YRJPW7kzr79Dbf/QtY/o60i3lQZLXT9UbPkGM262c6kjx9/p+m
 BRDJ7iPXHiyI12Nb0YLZESd1tnBiuUxX7kVRuYGBsFu43Xh9FXUG9P865
 z1d4GpnEmu4EwD482zkPFEOUpNgzZO115uegea16SsWewa5WvNTTwEa9k Q==;
X-CSE-ConnectionGUID: FGrkZxqQQMOiXFkg6uNpyg==
X-CSE-MsgGUID: Q7E0jOnQTpeuV9e7B84r+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="49270558"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="49270558"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 10:33:29 -0700
X-CSE-ConnectionGUID: Wo97Pdm1Sc6ptbXEEXAWkQ==
X-CSE-MsgGUID: CMMAPfXQQT2KiuQTkZ21Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="183496566"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 10:33:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 10:33:28 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 10:33:28 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.4) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 10:33:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIOgCgfOYrOEu67JcXAFdlLpCoga0JWP1B9JHukZPi9XPMIrbNFCNhHai/kB+jNVgf3YVeSHTpOpNvaaRT5NyQMt54IBadpN4cdMhDDjSLn1AcnBR1wo11o/UjjGTLHFLNFo9S9fkxngNsz3/LtAq1xJ335q9mU7SVb9Wi5TLRPh032KbEuEpIf+I8g+Z9iX4YqaUhE9IdhBfkmP+zNz8zJpv9fhFC6w13Qgtn85nVmECdyx1KHTJYO+LRnsIMIuNAFDlN+bOYeuwYTtC1qKEOor8Ih+wNelIDvkLHXnYN0f+yIWkqfpi2KDMdzp+NvrbxjxlP71xlRTiyr+nArjBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MyRj1FKfM6rCgJL12RKpE37VCmep5eKf2ZIGpGt0mpw=;
 b=V6/buO9qkAfsRjXvH1R+ix42VorClzOJUhJ1Y8KVlo0uDgFCVH6nYY3OX/7JfaCp0Pxz5Cg+vKFCSQePJBFdSzKuOuWd7yHTk+73ehH2moCRecV5/HqhgRsLFtVgf0H850674zKte1817zklPUgJOSUMNtZesT/UIn3Xc8sFznYBW5GllZBqq2ZCp2cETjkmNehzPDBCHrT6bJVH1k2FZodciuLhH/n0rhOt5kP31QeXRmpnUbmlbBFwPSlV9UfYvQWzm46PtEcvcnzhzxIRCBiWOZ9M7sE7eZj21/Hk+92YV7Jhbaw8T3MaFpdsFwaQ8VFFoeL7uZSM8pZ9WxInkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA1PR11MB6218.namprd11.prod.outlook.com (2603:10b6:208:3ea::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 17:33:21 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%3]) with mapi id 15.20.9160.015; Thu, 2 Oct 2025
 17:33:21 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe: Don't force DRM_XE_DEBUG_MEMIRQ for SR-IOV debug
Thread-Topic: [PATCH] drm/xe: Don't force DRM_XE_DEBUG_MEMIRQ for SR-IOV debug
Thread-Index: AQHcM7/nd1NnbFx+C0GV6hrQAZtzmbSvHYNQ
Date: Thu, 2 Oct 2025 17:33:21 +0000
Message-ID: <CH0PR11MB5444E636D05E69EB2267B5E5E5E7A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20251002171308.203127-1-michal.wajdeczko@intel.com>
In-Reply-To: <20251002171308.203127-1-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA1PR11MB6218:EE_
x-ms-office365-filtering-correlation-id: 5d957a1c-a390-4936-f41d-08de01d9c85e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|10070799003|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?vG0pYIrlKpQN+V0WWwGNAZClUKVY+PVivEpbua/r+uuOJWWIh9i1ki80bFmx?=
 =?us-ascii?Q?EnR3X4/QVQ+i2J2wAKb0q1fUVLZXdHmGWYfj1b4uqVj5zicQsDpfEzIt+4UY?=
 =?us-ascii?Q?xCz9wRh1DQ1a6fnbT8dnG/qnnRBYJNHeoF4tT/ADL/es/sBZ5w108Cim54+w?=
 =?us-ascii?Q?zMp+StuK1cFGHyNrtfuuhMfArXrE48PNxJz2qtVuyxQfVf/FbH1X4FtQlycX?=
 =?us-ascii?Q?gMXG8R7chJwCGOKOJpW9u5JqnDMRtagsPkI4vszm2IM51T37GYoMeEan3psU?=
 =?us-ascii?Q?NCZVfdNiw9T+p5jZfbSOBhOqwrl3ffNX4GYyOf9tucR2WTwwFpgTE5hLbYGU?=
 =?us-ascii?Q?R4q8tY/0wKNAGT3lN4U5UoGuIOb+GfwD8j1N1cjFsH5H4s+F+wjcuJI16nkv?=
 =?us-ascii?Q?3jQG1ZUVMo2wL6pXrysNv7Tx0gRhl7RGYK/Mf4tgfRxDfnsAGfMKWkJCutic?=
 =?us-ascii?Q?rxAEEYf2Ti1LQeN4YuQjnwfissIw5grqFry6k9Uv8hbgAmG8JDaKmhHAIVso?=
 =?us-ascii?Q?DtNjf+qxPMLeVso6sVdCIXMr1PWtAq/10K+kzt9Y5yOXaWRPf9DTQT5Cru9a?=
 =?us-ascii?Q?u8PdU4GjJrcnjMqSrsvw2/AZCrgyQ78N2d3X6fYOOsg0VnQUoJFYfCk64Dv7?=
 =?us-ascii?Q?w7Kl9Cz3oBTWvKcrBNVgPdA9EWrr2u48XrA0/paDLWY0sAaUaBQiisSbKfpI?=
 =?us-ascii?Q?SSqGWsCSK+4Z5A2O4WJShYIsxW7dCL9p2JBjM9piPY1y5I1Ww2Nn7tiE1tc7?=
 =?us-ascii?Q?bENAJRdQlQT+sFSzTu2VrerAeQ/nElu96KVdhdB3h33nX+WTBMIISnhVYVIo?=
 =?us-ascii?Q?eak3ZUi7R3Zg2N0Jero2hEsJUWJb2X5qLf7n951lOGw8sriQkdFJNoozlkY3?=
 =?us-ascii?Q?CO2hMLu+ZrLIpFU0SZQfk/pE+9gBJu8Wh4NHUOS/C/V/ESG9SDpO9ba84RwI?=
 =?us-ascii?Q?a3ZZ1s+nfOfjWayPp3I2YA2naTmdIN/t/e8DlFej5/pecjXAWXvfZpCzecPB?=
 =?us-ascii?Q?etQpperKA5uMhM66gaVfq9CaKNkVUGV6Dn9/jHHllVk/JmqLAWq5nje9o26x?=
 =?us-ascii?Q?0uVj74xFbTRX7EngrLMuB7p8taKFsTE+iH5EgMAtCtOASUUhj2o1d8R4Rxji?=
 =?us-ascii?Q?IYiPzTm83PHKlm0cQwrapA2uukM2sem4FMEe2nCqBmj+om+6CmnQrtcLefh2?=
 =?us-ascii?Q?g/F7SKKTtf5QqyXYFEGpMDb6kMcuAQRahsdDBgIsNuMm+qyXTfO+Uy3TIW6R?=
 =?us-ascii?Q?2/dnfP1wTQ49j/PPdw04peCApFUfW8zyPcGwIFEkSt4yuUpRjDtWqySGtN4c?=
 =?us-ascii?Q?bjy4IyBgon9ZPxjf8ogxdhCbTk8jjnbPf3RyW3BN1OPLKCJeeZRaV8pE6QEM?=
 =?us-ascii?Q?nQa8SPG3/xFuoxN3c168t4HP9yZE5znyPUNgXlI/N17YlolQkER+B8K+MzL8?=
 =?us-ascii?Q?rD/Sn9UYAwIPjszgOcTMJZQBwhUL+e7X1/qfMGzk1FVksMgKp7r5jrsa/woe?=
 =?us-ascii?Q?Ovz8JN1U8LdhrNDTW2xM0TJOZfnZfvBpfyP/?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cokwLmPAknne0wTkRTfT+kypBrrxGuDiv1moCTB7Oqp3TxSdN4l+WSQEppQY?=
 =?us-ascii?Q?cXR4dZvL3hB+Fx7OCRMOVTNRQpzg1ou7woaFjJ+ccAZyhq2Pc5BHCA7grfux?=
 =?us-ascii?Q?wIrL0Xk5+8T0igzxtGGl/8hJnIRlkqcZ2bVPZ+Bszb4Q2K/3oU+RDyBv6Rk6?=
 =?us-ascii?Q?AMbeU3uHx2UzKu9zuF7KpWczLf14xfrRuV8zdgHojXl/TwHK4ZlnAaOr8sa0?=
 =?us-ascii?Q?zsNBnMRFYYhfNTV2TZGXSelDJH9sk9lSgN+2KMjJiIrfULdpYfd10Ct9kQeZ?=
 =?us-ascii?Q?8QKScfPOnv2k5lAc3laE4xizx3RPiCySKJfySwlYok/knH2IwVhulIu5ef1A?=
 =?us-ascii?Q?TZlCMOxVyemGs8w9Ge9UXP1qzFtrgSJIXKffF2CjYunegJeIE+9XG3e4OFV4?=
 =?us-ascii?Q?Y5hAip5L5WpvXv4RUlpSLMaj9TYcs09YiWLC6OjeU1wYnKY+/5c08/J80K9Z?=
 =?us-ascii?Q?8Pyimg/t6GplpyEQE/BNz/SW6YI6JYlcIVpnMOFOgqIKGrD8u7733JIvhFaC?=
 =?us-ascii?Q?pcQoYjjTiqnJ+Vb9j4p7Si+OZB54zf/l+XLsAla7kHoUPkJdhtnqCUySNTSH?=
 =?us-ascii?Q?6vp6Nemj5DQogt4oe9RcWj249ouCqueAeeSuUDTzCWyXXAteQE7znyiKWQpv?=
 =?us-ascii?Q?+SL1vawoY5HEe9YZr7dTdKVnBG1gsIlahEUDT9IE4K67YcC2g/OCZLUjcPbl?=
 =?us-ascii?Q?2YXb1/Ah/3psOZe9qcpJgPhqcR3ZFMyz9+qw6/89R75p5nO9w8QnrPjM3BmW?=
 =?us-ascii?Q?sOx7n1hs0o4Y7ooa+4MjjPTITBT6R/wB1Kn/NI+vHE8BpCR7bBJDQy8I8zym?=
 =?us-ascii?Q?Bi4GFGyrBLKXbN2LWgkJnXlgHYIj0RE3vthzgTlblqhrnHwIeWdu7hs3f7fH?=
 =?us-ascii?Q?1CyU/BvSi4hNP5gTn0+qPSotvvKFf5FsyZQcfjZ09rwS2cF2OtK5nfn+FLhG?=
 =?us-ascii?Q?XEOyfpEstFOsrm9iIC1rWmuZLm6gAbUebS/J+FJgn3ibbuXf3/HEVCfQe1DW?=
 =?us-ascii?Q?1oXiKJOuXH/CLOu+jkPJsx6QWWhlfu7fBVpx4m9GQGolVGz+cGKSKb3atbY6?=
 =?us-ascii?Q?XLRRP1LZQ9JZ/oPtGPwXXSwOFaXrDnmVDvGrLFpPo430D9EKlA6XftfInr/l?=
 =?us-ascii?Q?S3Cg4ZHAZAvnoIB53gYTM0wN2rRbga7Bx7pAwvhHaeBMlokixSTpGQV8rauB?=
 =?us-ascii?Q?IPU18KzG6XngxOSR3ljYVhgzLb7Ge3E9IC5mR84aJb/pvubGXORHkfKFkErM?=
 =?us-ascii?Q?luGeSRdt91Xa9FmaTG9XSLuiOK2RwErp6EnCeH+pGmK8ldCGZ6pgT/ds3kK+?=
 =?us-ascii?Q?Pp5wBSoMB555ckHztB3Ta1KPoXBxzmNu0P7JnZwmLUU+e3kqeNmJW1Ut0yH7?=
 =?us-ascii?Q?2q7HP0JMmmVmK/bNkj+EkRguV8Rh/C83+dswXsCIaWK9RJpkYp/pczli3pPc?=
 =?us-ascii?Q?H62Dt7h7GNjGpCMGFgAatpFU5nqs8UQPthQ+J6c9QPRrmqAPly3v5KF/DjGt?=
 =?us-ascii?Q?3SGKZKpW3ci3YaO/VwBZXPGLbInX//jFHFcEV0i8ByQM3irzrmqKMKud+vYO?=
 =?us-ascii?Q?5vZkVvafphpjEeCMjjn08yfglxVREKAu0VwiqV/R4JvBZr4aXm7+5S0/iY85?=
 =?us-ascii?Q?7dG7HAXilWfBLWHSVf4wOI6CN0tBSWmNkgm4t2C+rdTp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d957a1c-a390-4936-f41d-08de01d9c85e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2025 17:33:21.3512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rr28PHveHtp8cdA9kqUKfwsqw6d6/qqbQQp64RbnuvspS3xHDM8j2mOYYbFoZC4piN8YLMY8regzhlEwUIUWoCEybG1NkUomPGiTJbMZqZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6218
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal=
 Wajdeczko
Sent: Thursday, October 2, 2025 10:13 AM
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
Subject: [PATCH] drm/xe: Don't force DRM_XE_DEBUG_MEMIRQ for SR-IOV debug
>=20
> For pure SR-IOV debugging there is no need to select already
> separated config for the debugging of the memory based interrupts,
> as the latter is also very noisy on its own. Change config order
> and use a weak reverse dependency instead.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/Kconfig.debug | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfi=
g.debug
> index 87902b4bd6d3..01227c77f6d7 100644
> --- a/drivers/gpu/drm/xe/Kconfig.debug
> +++ b/drivers/gpu/drm/xe/Kconfig.debug
> @@ -40,6 +40,17 @@ config DRM_XE_DEBUG_VM
> =20
>  	  If in doubt, say "N".
> =20
> +config DRM_XE_DEBUG_SRIOV
> +	bool "Enable extra SR-IOV debugging"
> +	default n
> +	imply DRM_XE_DEBUG_MEMIRQ
> +	help
> +	  Enable extra SR-IOV debugging info.
> +
> +	  Recommended for driver developers only.
> +
> +	  If in doubt, say "N".
> +
>  config DRM_XE_DEBUG_MEMIRQ
>  	bool "Enable extra memirq debugging"
>  	default n
> @@ -51,17 +62,6 @@ config DRM_XE_DEBUG_MEMIRQ
> =20
>  	  If in doubt, say "N".
> =20
> -config DRM_XE_DEBUG_SRIOV
> -	bool "Enable extra SR-IOV debugging"
> -	default n
> -	select DRM_XE_DEBUG_MEMIRQ
> -	help
> -	  Enable extra SR-IOV debugging info.
> -
> -	  Recommended for driver developers only.
> -
> -	  If in doubt, say "N".
> -
>  config DRM_XE_DEBUG_MEM
>  	bool "Enable passing SYS/VRAM addresses to user space"
>  	default n
> --=20
> 2.47.1
>=20
>=20
