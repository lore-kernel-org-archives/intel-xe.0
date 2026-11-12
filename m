Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328D8606A338
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 11:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hqfl/Gpm;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=aOtF/kpX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF1EB11200D;
	Thu, 12 Nov 2026 11:01:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22CF11200D
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 11:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794481258; x=1826017258;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ddbcBt8kWNd1bnJ7es++h2DpatgplTmyOjkwRkfC75Q=;
 b=hqfl/Gpmhj+DNnxNSJERWUrrW+YephcIOIPUh5ELzBkUzevYo5uRO3Fg
 JMYDyCIQD75nhvXUPJv40TIh8cdw7RciVkNdVL7JdnuVl8m8Va8sd1dnK
 CVU+ecfFjrZgSJ7Bevkr34YtJDYATaIyS5o9gLsVq+AAKCP2Fuoakyuag
 PBj9emJKwhwgUA2eaBZj4u/4iNRC390ZRg488lhTsM/Z3LkZH0d2ZZi8A
 uK6cJHNVVHv1ocNhvdWTR8ujaUK6LzWiq6f/c8bco5kDMBG+Lue+/5IgK
 4/74/3Lm2ggfiZWGJRyeOHyLwtgQos+BPZenzKglOYftCpnqIYadToMyk A==;
X-CSE-ConnectionGUID: RPmgGjlkTdSTeLZL1K6ffA==
X-CSE-MsgGUID: z5jwz7FdRzuUhBqgpOHRHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3160674"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3160674"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 03:00:51 -0800
X-CSE-ConnectionGUID: IlGI1djnTTm5iQzeZhKZ/w==
X-CSE-MsgGUID: GF9nzHSfRvWF1HlG/aoK/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8978221"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 03:00:49 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 03:00:49 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 12 Nov 2026 03:00:49 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.32) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 03:00:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VGf8NljFAVn7jfSuHqS/LA5fc66hI3clJX/3m89cNG6XNov7u1FOA3Hk+RKdy1fw57AzTKPzrf63/BlK3HAkshKel1qBws7yTCxLHaM04uWWKVlyCyTV7Y6ON+SvYcBBSODtp9c4kr5b0UoP/17QDhU5GEJevH/fOn3XsX6enPqsRxt8QWQ3FstFE3uY/vN+SZdYE39eaZOHbcMr9bDKUdohtAVsbGm6pdwNEldKhz/FBfEQ6WzWptAA51mMWzanPA33WVeGAlbI8+zgB5XHDO3VHpwcOhoTKUZL6uIuC9jey02CcNv8tMIrOHu39YJKBJLB00IAZpYOhkDkgBZ45w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/hkssuHE/2rLFr3pgcM8an4NdTrw9J2xAj2/VAuTME=;
 b=mjacktZRMcXMKhp0ybsUt4X4+NIzfLyBI7lU3GGhExYTrSIh2kIsRbd47Q4RJzbYWbxTSwuK+PMkilHeXHCZqGzBkrhQFUdIUjYtOo4WTyuScGQ1nCgi/WCTkpBOoSpGZl4Ym84Add0r+u8Dvd+6gos48YiX1uGVfGNqCEEdKa5XhYZman5sjNuJ+1LbXBoCyWQR8vea6cOvXl72d5YsO3F58QUjR//6N6XvF3Swlj2wHdl7n0uQSrI5aFVQAcZeP86bfTXo8TGqvogDFhi+iYbLwfZ/18pxGS0MQlUIWEDRlV9JBFdqWoxHZwz71VljuGbDOa6+QXi3g6yVhi8qTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/hkssuHE/2rLFr3pgcM8an4NdTrw9J2xAj2/VAuTME=;
 b=aOtF/kpXexxhknbF4vp4guNZ9Qp2Mtn/qwcT5E3H9aSjSW91QfkClDkukuSG4XingEDM7LAaeUGJAL8HEcZp8j4x/YzyoQhAz5ORA1ZSQr473KNrJR8o88gjk/LbGx1yiDpUENdlH4JaeU/p5/F0s0Srx92HIq8bVPdWTDpKFPQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by MW5PR11MB5810.namprd11.prod.outlook.com (2603:10b6:303:192::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 11:00:46 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 11:00:46 +0000
Date: Thu, 12 Nov 2026 12:00:42 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [v7,5/5] drm/xe/ggtt: Add KUnit tests for usable and shareable
 pools
Message-ID: <20261112110042.gqfbm32bmwf26x4f@intel.com>
References: <20261021085716.709503-6-piotr.piorkowski@intel.com>
 <cfb7a910-823d-416d-beab-7a6e3077788f@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cfb7a910-823d-416d-beab-7a6e3077788f@intel.com>
X-ClientProxiedBy: WA2P291CA0023.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::19) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|MW5PR11MB5810:EE_
X-MS-Office365-Filtering-Correlation-Id: af66c804-f57f-43db-788f-08df40ac3411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|6133799003|261009223027099003|4143699003|11063799006|56012099006|261028144727099003|261102123227099003|261021121427099003|261022105027099003|261022075727099003|261026121527099003|261026140227099003|261022113327099003|10067099003;
X-Microsoft-Antispam-Message-Info: xKRID0LznjI7vqCjQb/3ZkKFXzsUXt6u29GWs18eO15SGHpgXVbiMMXXKoKmJa6bbfBV27OxQhi2c1puUdR7EGFIipzggpOq3TTyXNfe2gbzof0ejGLicN2/U4ew/djBvtJw6rMs31Qo/Y3gJcv8MyzQXljz+i5J6ExPSMGT6+BeHv6oGB9BUQ4jtR47mV35TeIzYic5jUlyIXh9088MDi53P+uJC2oRvgysE2l4Fs0zuubVCfQcI8Hs5lZy4GTmw8nY5B36XJt/jZTaQippcMiqzw60rM+7yrFY5g/TY8+BtFO2BwWPqA9J157QeAjWQo9nk1wdmdwjZbARtfAc6q5V8o0NTpgFCCsTlJp0oR5j5Vo8jnDNP5LmF3Jnvx2LGBg2fqa8jdzdBLk9veHFHDn0FAbHZD7GYjHuXLegiZ4jOD/v8TDXagITXe3IRczu047Mn8Etf2JNZVqhPCf1Qy+3GKHwDCuRKKICBZHCNCs+X+7Sz51wjPmJ2AzE8Xx75WpftKZffpF/PEdY1m+HOkGnhI3Or3fb+fd6/RwWSRPTiyizmquGQ8cw3Zvzd3jCcq579ilVtKmPcOyEpN7XI8COkJicrvO1Iq4kxVL3J7xs4kubTUZENBnvsxlo6GZrCpZPH0qKForyO8JYLQzmBSk+AWM1bzHqFjkqlJd9shY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(6133799003)(261009223027099003)(4143699003)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261021121427099003)(261022105027099003)(261022075727099003)(261026121527099003)(261026140227099003)(261022113327099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmJNL2FXVCtzN3dkVEpDY25uNXRuVGJOV1Rpd2RMdGh5WkxlcjQwcG9ocGlQ?=
 =?utf-8?B?RERteXBPMjNwYzNhN3psV0l5L0hLVXBIcXhmOTlUSGhSMmVFZUlRR29LbmRo?=
 =?utf-8?B?emFVV0dTaktienJ3M0FHd3pHU3dtQmRBRDRPYXFoSkZSL3lLczF3Q3NtQlZX?=
 =?utf-8?B?c1dpUWxJNk11dEJFcHVWZHA2NXcyRlRhREk4U0hnaVU1cjRibFNjVE9DTU0x?=
 =?utf-8?B?R2NIWXE5dVlsVXFTdUJ4UVpXRSt3ZjZ2SE5QY0lWNitLK2JyMjZId2ZCRCs0?=
 =?utf-8?B?cDNEV1RVRTVMNXJEOEFkNFJ2Sk5CcHByZTliME9tbHBYSEY0aDE1cm9sU1dK?=
 =?utf-8?B?Tjk5bE1BeWpOVWFJUDZYb2N6Qy81Sk8yUFVOL0txaEZTRE9NN2p1cXdlNVpu?=
 =?utf-8?B?d3FBN0Y3MWZBUXEzdnJ6Zzc0a3o5djNpVjQ2OWt6TytxZk5SS1RUcTJNcjJV?=
 =?utf-8?B?bmpJNWpZaXlySHBzaWU5dkVsMHpJL2dyaGtZTlc2VDJZN1JsVnJwbE0rUXFt?=
 =?utf-8?B?NmtUV2x6cjBnUWt1dmxEc0w4bmY0N3I0My9KRVVWS0VTNVVna2FHSCtuVlps?=
 =?utf-8?B?TXZWbFhUZUdyME5weU55V1JvYXdQTTBoVlZpcjVudW42cnFMOWxKN3VlNVpm?=
 =?utf-8?B?bXZaT0xwVlg0Y01sWHNSdXpvWW9HR2tvTldqVEJHWCtDVjRMUWdrWnlURFJz?=
 =?utf-8?B?alJhSTB5VWtiUkdydEZldkIrTzAxTzd3bUFXWHdxYlpXZ2hjTXhsVHBHTHZ4?=
 =?utf-8?B?Y1pDUlhWSWN6cC9nL1dHNDllQUNpbFppM1REdG9LWTVYVU9Za0g3aStra1ha?=
 =?utf-8?B?V2Y1T1Z4QXQ3b0xBWjArWk1idjNQZTE2ZG1DQnZyZXlVSm9sVlY5d3dMbzVz?=
 =?utf-8?B?QjlYRVU0eS96TzJmeE9IMGpKb294RUluUHMyaHZZenVsdG9mRzhoSEhnQSth?=
 =?utf-8?B?VkxiOW8vWTYvZVNOQiszNlBZWnlLUUVKUTlxdjB3WU43OXJoMUphY2VtUFV3?=
 =?utf-8?B?M2V6UGdGVHJ6Q2ZMRG9MY2tVaGtZc1RzTU9MZXZKZEMvSXYrMDFCVzYyeFdX?=
 =?utf-8?B?alVDU1VUdTROaitEVG1vYm5UOFlRUWhxT1BHTGRUNnpWNVRDeVZSdlVVaUlK?=
 =?utf-8?B?U2RGRGlVNGliMXpSWkgrZm5HTVB3THVjek9oSVlLaXhvM1VyNW5zWWJjTWs5?=
 =?utf-8?B?R3MyVVFPalRyT1pibTJ4ZW9KSllPeEZNbXFjc3JHaHNISXQ4ZXlVekFFRlZM?=
 =?utf-8?B?ajhjZzMyVnYwUEVnT2lyVG5WWWQ5OWZaTXVaTThKaEJJRlBJaU5TdnVaMVFX?=
 =?utf-8?B?K24zM01yc244eVdnYmJWbUw5MUNabkpOQ3ZCcGRIZGg5cXMrRzRqQ3doclZP?=
 =?utf-8?B?MVk3TDBGcnp0akFSUk1MWFEwK2NDZ3pDSkR4NnZqNS8vUTNubmpsQXR5MUR1?=
 =?utf-8?B?WHVXVE9vRDBFWnNtM09jVzB1UFAyTWViU2t4ZFl0VC82UXAwaStFUkRjZDlp?=
 =?utf-8?B?UFc5OHkydUdEQ1VqWGdhU2FUR0NHSTd3VXQwNEJlT3hoWUdzWjcveUh1VmNr?=
 =?utf-8?B?YkNrMlA0MEFxV293cTV4cGNneDhZYmxMM05hYWtaOVQ2Y1Izd2trenByanNX?=
 =?utf-8?B?QktJQTZObXZWTGxwT2NRbDB0QVZZdnl3VnB1amw3OW1sZTRINWhRVGs5RW9R?=
 =?utf-8?B?QzZ2OS9NVnROYXBYem9HNlVZNDN6V0tsWmRENy9EZHNVMWloY00xdkR6ZG9v?=
 =?utf-8?B?M25qUzEwcmZJdDNWMWRpNzlub0ZseWVoMmFWUUZTc2trNkRMZFJEVW9KajNJ?=
 =?utf-8?B?UW1CV0NUd3lhNGo2ZXJ4V3FtUm1oUzY4Z2RxRDZJS09peEdoNjRveXcrTUk0?=
 =?utf-8?B?RCt0eGdheFB5dm9INFpjWHRNN1ptb0l4bUpwMFdYYWFYdEl4UEFUU2xEQ0ZT?=
 =?utf-8?B?ZEc2RTdqd0ZLcE1FQlgvdDM1QUxvekc4bnVKM0xDY0lTNWlDM3daLzVJZlh4?=
 =?utf-8?B?QjZjY3I5OXNkZEgxU3RGUzJpZFlLU09ldVFocld2bWd5azdxeHppRmlFR3cy?=
 =?utf-8?B?aFhQL0I2VUlkNzJCckxrWG5yRE4rOVBlRDU4WGdaMzdaQzNEZGtSL0ZiVWFK?=
 =?utf-8?B?T0g1a1lUN0txLzFRL3Q4dm00YVJ1ME84RkxYdktyUjk2UlhDWHRnZ1JHUnor?=
 =?utf-8?B?eDUweUYva1BIcG1rZWlVUkQxb2U4d1RzWWNnZEpvVWd5NThsdlh6VXZCR3pu?=
 =?utf-8?B?azhmSjUwUXlqeE1ROGpVM3Vwa0VpZlVnRUlrajY0MWJ6MzROb0NUQU5IdFBH?=
 =?utf-8?B?aEtWSDRjb1kvRjlBeHA1bEIra2NWNC9vbzRGVFBvOTgyZ0R1N3NiR3NOa1Fu?=
 =?utf-8?Q?LfxVdwz/tYfLm+mI=3D?=
X-Exchange-RoutingPolicyChecked: brdhId+kXeBS9Q88qRPx8Cp5kN0uXEROmm++yBolkX2kU6P8Je+vFxUjfTlpl15Apqfq7ES7r7DCUt5+RYgY79hQUTPRloHSYQa0/CYBj1FGKuYRwXWrrgI7ztxqxwZfb+ucoUNJ7uAmANl75CrXHZ2Wh3FSb9F1oMe3MSxTmshMyUR8G1AWE4hObsukuE4wmkQiAQ3ij99fNqNcFixReaBJXC5M+4oAyvBMfE8Lx2P20z499sgRL3ELSoKcSwT55Gx8xYmj3XOPUMTjH0I+YwDSB/LcgTlPJ5/E8CWkkpoegICDYmkZI7x6BUr/DRbrGca1Wxr0T4uxq08mMdmB4w==
X-MS-Exchange-CrossTenant-Network-Message-Id: af66c804-f57f-43db-788f-08df40ac3411
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 11:00:46.2958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rg6ftzoQibh1lGsY82XC8fuGYHn7j1S4Az50+IkBdi8aBJ63xV0285TKlCtwbedaRoATrIwCqNwiI0PMH3CjHeZia3BAM+XJ0b5CFebB6Os=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5810
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Laguna, Lukasz <lukasz.laguna@intel.com> wrote on wto [2026-lis-10 16:31:45 +0100]:
> 
> On 10/21/2026 10:57, Piórkowski, Piotr wrote:
> > From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > 
> > Add GGTT KUnit tests focused on the newly introduced usable and
> > shareable pools.
> > 
> > Cover range initialization for native and PF modes, including partially
> > overlapping pools. Exercise allocation direction and conflicts between
> > the pools, as well as the unavailable shareable pool and requests
> > exceeding pool capacity.
> > 
> > v2:
> >   - Init ggtt.lock with mutex_init() in each test.
> > v3:
> >   - Rename the test file to use the _kunit.c suffix.
> >   - Use shared GGTT setup and cleanup helpers.
> >   - Split PCI IOV coverage into a separate KUnit suite.
> > v4:
> >   - Release allocated nodes through KUnit deferred actions, so that an
> >     aborted test does not leak them into drm_mm_takedown() (Sashiko).
> > v5:
> >   - Move ggtt_test_insert_node_shareable() under CONFIG_PCI_IOV to fix
> >     the !CONFIG_PCI_IOV build (Sashiko).
> > 
> > Assisted-by: Claude:claude-5-sonnet
> > Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Maarten Lankhorst <dev@lankhorst.se>
> > ---
> >   drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c | 341 +++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_ggtt.c             |   4 +
> >   2 files changed, 345 insertions(+)
> >   create mode 100644 drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c
> > 
> > diff --git a/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c b/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c
> > new file mode 100644
> > index 0000000000000..53c17d4c1da99
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c
> > @@ -0,0 +1,341 @@
> > +// SPDX-License-Identifier: GPL-2.0 AND MIT
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +
> > +#include <kunit/test.h>
> > +
> > +#include "xe_device.h"
> > +#include "xe_kunit_helpers.h"
> > +
> > +#define GGTT_TEST_START		SZ_1M
> > +
> > +static u64 ggtt_test_accessible_size(struct kunit *test)
> > +{
> > +	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
> > +
> > +	return GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
> > +}
> > +
> > +static void ggtt_test_fini(void *data)
> > +{
> > +	struct xe_ggtt *ggtt = data;
> > +
> > +	drm_mm_takedown(&ggtt->mm);
> > +}
> > +
> > +static struct xe_ggtt *ggtt_test_create(struct kunit *test, u64 full_size,
> > +					u64 usable_size, u64 shareable_size)
> > +{
> > +	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
> > +	struct xe_ggtt *ggtt;
> > +	int err;
> > +
> > +	ggtt = kunit_kzalloc(test, sizeof(*ggtt), GFP_KERNEL);
> 
> Can't we use ggtt = xe_device_get_root_tile(test->priv)->mem.ggtt; ?

Good point, thanks. I'll switch to the tile's GGTT in the next version.

Thanks!

> 
> Thanks,
> Lukasz
> 
> > +	if (!ggtt)
> > +		return NULL;
> > +
> > +	ggtt->tile = tile;
> > +	mutex_init(&ggtt->lock);
> > +	ggtt_init_ranges(ggtt, GGTT_TEST_START, full_size, usable_size, shareable_size);
> > +
> > +	err = kunit_add_action_or_reset(test, ggtt_test_fini, ggtt);
> > +	if (err)
> > +		return NULL;
> > +
> > +	return ggtt;
> > +}
> > +
> > +static void ggtt_test_remove_node(void *data)
> > +{
> > +	struct xe_ggtt_node *node = data;
> > +	struct xe_ggtt *ggtt = node->ggtt;
> > +
> > +	mutex_lock(&ggtt->lock);
> > +	drm_mm_remove_node(&node->base);
> > +	node->base.size = 0;
> > +	mutex_unlock(&ggtt->lock);
> > +
> > +	ggtt_node_fini(node);
> > +}
> > +
> > +/*
> > + * Release the node on test exit, before the GGTT is torn down, so that an
> > + * aborted test does not leave it in the drm_mm.
> > + */
> > +static struct xe_ggtt_node *ggtt_test_track_node(struct kunit *test,
> > +						 struct xe_ggtt_node *node)
> > +{
> > +	if (!IS_ERR_OR_NULL(node) &&
> > +	    kunit_add_action_or_reset(test, ggtt_test_remove_node, node))
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	return node;
> > +}
> > +
> > +static struct xe_ggtt_node *ggtt_test_insert_node(struct kunit *test,
> > +						  struct xe_ggtt *ggtt, u32 size)
> > +{
> > +	return ggtt_test_track_node(test, xe_ggtt_insert_node(ggtt, size, XE_PAGE_SIZE));
> > +}
> > +
> > +static void init_native(struct kunit *test)
> > +{
> > +	u64 accessible = ggtt_test_accessible_size(test);
> > +	u64 usable = min_t(u64, SZ_1G, accessible);
> > +	struct xe_ggtt *ggtt;
> > +
> > +	ggtt = ggtt_test_create(test, usable, usable, 0);
> > +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> > +
> > +	KUNIT_EXPECT_EQ(test, ggtt->start, GGTT_TEST_START);
> > +	KUNIT_EXPECT_EQ(test, ggtt->size, usable);
> > +	KUNIT_EXPECT_EQ(test, ggtt->full_size, usable);
> > +}
> > +
> > +static void alloc_usable_pool_high(struct kunit *test)
> > +{
> > +	u64 accessible = ggtt_test_accessible_size(test);
> > +	u64 usable = (accessible * 3) / 4;
> > +	struct xe_ggtt_node *usable_node;
> > +	struct xe_ggtt *ggtt;
> > +
> > +	ggtt = ggtt_test_create(test, usable, usable, 0);
> > +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> > +
> > +	usable_node = ggtt_test_insert_node(test, ggtt, XE_PAGE_SIZE);
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
> > +	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node),
> > +			GGTT_TEST_START + usable - XE_PAGE_SIZE);
> > +}
> > +
> > +static void alloc_usable_pool_oversized(struct kunit *test)
> > +{
> > +	u64 accessible = ggtt_test_accessible_size(test);
> > +	u64 usable = (accessible * 3) / 4;
> > +	struct xe_ggtt_node *node;
> > +	struct xe_ggtt *ggtt;
> > +
> > +	KUNIT_ASSERT_LE(test, usable + XE_PAGE_SIZE, (u64)U32_MAX);
> > +
> > +	ggtt = ggtt_test_create(test, usable, usable, 0);
> > +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> > +
> > +	node = ggtt_test_insert_node(test, ggtt, usable + XE_PAGE_SIZE);
> > +	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
> > +	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
> > +}
> > +
> > +static struct kunit_case ggtt_test_cases[] = {
> > +	KUNIT_CASE(init_native),
> > +	KUNIT_CASE(alloc_usable_pool_high),
> > +	KUNIT_CASE(alloc_usable_pool_oversized),
> > +	{}
> > +};
> > +
> > +static struct kunit_suite ggtt_suite = {
> > +	.name = "xe_ggtt",
> > +	.test_cases = ggtt_test_cases,
> > +	.init = xe_kunit_helper_xe_device_test_init,
> > +};
> > +
> > +#if IS_ENABLED(CONFIG_PCI_IOV)
> > +static struct xe_ggtt_node *ggtt_test_insert_node_shareable(struct kunit *test,
> > +							    struct xe_ggtt *ggtt, u32 size)
> > +{
> > +	return ggtt_test_track_node(test,
> > +				    xe_ggtt_insert_node_shareable(ggtt, size, XE_PAGE_SIZE));
> > +}
> > +
> > +static void init_shared_pf(struct kunit *test)
> > +{
> > +	u64 accessible = ggtt_test_accessible_size(test);
> > +	struct xe_ggtt *ggtt;
> > +
> > +	ggtt = ggtt_test_create(test, accessible, accessible, accessible);
> > +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> > +
> > +	KUNIT_EXPECT_EQ(test, ggtt->size, accessible);
> > +	KUNIT_EXPECT_EQ(test, ggtt_shareable_offset(ggtt), 0);
> > +	KUNIT_EXPECT_EQ(test, ggtt->shareable_size, accessible);
> > +	KUNIT_EXPECT_EQ(test, ggtt->full_size, accessible);
> > +}
> > +
> > +static void init_partial_overlap(struct kunit *test)
> > +{
> > +	u64 accessible = ggtt_test_accessible_size(test);
> > +	u64 usable = (accessible * 3) / 4;
> > +	u64 shareable = accessible / 2;
> > +	struct xe_ggtt *ggtt;
> > +
> > +	KUNIT_ASSERT_GT(test, accessible, 0ULL);
> > +	KUNIT_ASSERT_GT(test, usable, shareable);
> > +
> > +	ggtt = ggtt_test_create(test, accessible, usable, shareable);
> > +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> > +
> > +	KUNIT_EXPECT_EQ(test, ggtt->size, usable);
> > +	KUNIT_EXPECT_EQ(test, ggtt_shareable_offset(ggtt), accessible - shareable);
> > +	KUNIT_EXPECT_EQ(test, ggtt->shareable_size, shareable);
> > +	KUNIT_EXPECT_LT(test, ggtt_shareable_offset(ggtt), usable);
> > +	KUNIT_EXPECT_EQ(test, ggtt->full_size, accessible);
> > +}
> > +
> > +static void alloc_usable_pool_low(struct kunit *test)
> > +{
> > +	u64 accessible = ggtt_test_accessible_size(test);
> > +	u64 usable = (accessible * 3) / 4;
> > +	u64 shareable = accessible / 2;
> > +	struct xe_ggtt_node *usable_node;
> > +	struct xe_ggtt *ggtt;
> > +
> > +	ggtt = ggtt_test_create(test, accessible, usable, shareable);
> > +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> > +
> > +	usable_node = ggtt_test_insert_node(test, ggtt, XE_PAGE_SIZE);
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
> > +	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node), GGTT_TEST_START);
> > +	KUNIT_EXPECT_EQ(test, xe_ggtt_node_size(usable_node), (u64)XE_PAGE_SIZE);
> > +}
> > +
> > +static void alloc_shareable_pool_high(struct kunit *test)
> > +{
> > +	u64 accessible = ggtt_test_accessible_size(test);
> > +	u64 usable = (accessible * 3) / 4;
> > +	u64 shareable = accessible / 2;
> > +	struct xe_ggtt_node *shareable_node;
> > +	struct xe_ggtt *ggtt;
> > +
> > +	ggtt = ggtt_test_create(test, accessible, usable, shareable);
> > +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> > +
> > +	shareable_node = ggtt_test_insert_node_shareable(test, ggtt, XE_PAGE_SIZE);
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
> > +	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(shareable_node),
> > +			GGTT_TEST_START + accessible - XE_PAGE_SIZE);
> > +	KUNIT_EXPECT_EQ(test, xe_ggtt_node_size(shareable_node), (u64)XE_PAGE_SIZE);
> > +}
> > +
> > +static void alloc_partial_overlap(struct kunit *test)
> > +{
> > +	u64 accessible = ggtt_test_accessible_size(test);
> > +	u64 usable = (accessible * 3) / 4;
> > +	u64 shareable = accessible / 2;
> > +	struct xe_ggtt_node *shareable_node;
> > +	struct xe_ggtt_node *usable_node;
> > +	struct xe_ggtt *ggtt;
> > +
> > +	ggtt = ggtt_test_create(test, accessible, usable, shareable);
> > +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> > +
> > +	usable_node = ggtt_test_insert_node(test, ggtt, XE_PAGE_SIZE);
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
> > +	shareable_node = ggtt_test_insert_node_shareable(test, ggtt, XE_PAGE_SIZE);
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
> > +
> > +	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node), GGTT_TEST_START);
> > +	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(shareable_node),
> > +			GGTT_TEST_START + accessible - XE_PAGE_SIZE);
> > +}
> > +
> > +static void alloc_partial_overlap_usable_full(struct kunit *test)
> > +{
> > +	u64 accessible = ggtt_test_accessible_size(test);
> > +	u64 usable = (accessible * 3) / 4;
> > +	u64 shareable = accessible / 2;
> > +	struct xe_ggtt_node *shareable_node;
> > +	struct xe_ggtt_node *usable_node;
> > +	struct xe_ggtt *ggtt;
> > +
> > +	KUNIT_ASSERT_LE(test, usable, (u64)U32_MAX);
> > +	KUNIT_ASSERT_LE(test, shareable, (u64)U32_MAX);
> > +
> > +	ggtt = ggtt_test_create(test, accessible, usable, shareable);
> > +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> > +
> > +	usable_node = ggtt_test_insert_node(test, ggtt, usable);
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
> > +	shareable_node = ggtt_test_insert_node_shareable(test, ggtt, shareable);
> > +	KUNIT_ASSERT_TRUE(test, IS_ERR(shareable_node));
> > +	KUNIT_EXPECT_EQ(test, PTR_ERR(shareable_node), -ENOSPC);
> > +}
> > +
> > +static void alloc_partial_overlap_shareable_full(struct kunit *test)
> > +{
> > +	u64 accessible = ggtt_test_accessible_size(test);
> > +	u64 usable = (accessible * 3) / 4;
> > +	u64 shareable = accessible / 2;
> > +	struct xe_ggtt_node *shareable_node;
> > +	struct xe_ggtt_node *usable_node;
> > +	struct xe_ggtt *ggtt;
> > +
> > +	KUNIT_ASSERT_LE(test, usable, (u64)U32_MAX);
> > +	KUNIT_ASSERT_LE(test, shareable, (u64)U32_MAX);
> > +
> > +	ggtt = ggtt_test_create(test, accessible, usable, shareable);
> > +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> > +
> > +	shareable_node = ggtt_test_insert_node_shareable(test, ggtt, shareable);
> > +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
> > +	usable_node = ggtt_test_insert_node(test, ggtt, usable);
> > +	KUNIT_ASSERT_TRUE(test, IS_ERR(usable_node));
> > +	KUNIT_EXPECT_EQ(test, PTR_ERR(usable_node), -ENOSPC);
> > +}
> > +
> > +static void alloc_shareable_pool_unavailable(struct kunit *test)
> > +{
> > +	u64 accessible = ggtt_test_accessible_size(test);
> > +	u64 usable = (accessible * 3) / 4;
> > +	struct xe_ggtt_node *node;
> > +	struct xe_ggtt *ggtt;
> > +
> > +	ggtt = ggtt_test_create(test, usable, usable, 0);
> > +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> > +
> > +	node = ggtt_test_insert_node_shareable(test, ggtt, XE_PAGE_SIZE);
> > +	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
> > +	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
> > +}
> > +
> > +static void alloc_shareable_pool_oversized(struct kunit *test)
> > +{
> > +	u64 accessible = ggtt_test_accessible_size(test);
> > +	u64 usable = (accessible * 3) / 4;
> > +	u64 shareable = accessible / 2;
> > +	struct xe_ggtt_node *node;
> > +	struct xe_ggtt *ggtt;
> > +
> > +	KUNIT_ASSERT_LE(test, shareable + XE_PAGE_SIZE, (u64)U32_MAX);
> > +
> > +	ggtt = ggtt_test_create(test, accessible, usable, shareable);
> > +	KUNIT_ASSERT_NOT_NULL(test, ggtt);
> > +
> > +	node = ggtt_test_insert_node_shareable(test, ggtt, shareable + XE_PAGE_SIZE);
> > +	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
> > +	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
> > +}
> > +
> > +static struct kunit_case ggtt_iov_test_cases[] = {
> > +	KUNIT_CASE(init_shared_pf),
> > +	KUNIT_CASE(init_partial_overlap),
> > +	KUNIT_CASE(alloc_usable_pool_low),
> > +	KUNIT_CASE(alloc_shareable_pool_high),
> > +	KUNIT_CASE(alloc_partial_overlap),
> > +	KUNIT_CASE(alloc_partial_overlap_usable_full),
> > +	KUNIT_CASE(alloc_partial_overlap_shareable_full),
> > +	KUNIT_CASE(alloc_shareable_pool_unavailable),
> > +	KUNIT_CASE(alloc_shareable_pool_oversized),
> > +	{}
> > +};
> > +
> > +static struct kunit_suite ggtt_iov_suite = {
> > +	.name = "xe_ggtt_iov",
> > +	.test_cases = ggtt_iov_test_cases,
> > +	.init = xe_kunit_helper_xe_device_test_init,
> > +};
> > +#endif
> > +
> > +kunit_test_suites(&ggtt_suite);
> > +#if IS_ENABLED(CONFIG_PCI_IOV)
> > +kunit_test_suites(&ggtt_iov_suite);
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > index b7e3d626e8cb8..3dd029bc76dfc 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -1395,3 +1395,7 @@ u64 xe_ggtt_node_size(const struct xe_ggtt_node *node)
> >   {
> >   	return node->base.size;
> >   }
> > +
> > +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> > +#include "tests/xe_ggtt_kunit.c"
> > +#endif

-- 
