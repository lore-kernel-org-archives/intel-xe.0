Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A224E77187
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 14:52:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27A210EBD6;
	Wed, 18 Dec 2024 14:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Djlhm7xb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A85F810EBD3
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 14:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734533526; x=1766069526;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y0FaHuW0xp5ZJIBZQrIlGj22N0aOI/2BlLrXRvWeA0U=;
 b=Djlhm7xbFEORVhbzU9tpRMd0Xul00Al7Kihxt6TPKqDabD8KMK/9Aixs
 Bnpqmvc87uAShqnHdxvkRi7OIJ5pTFsNRYeu3danu93XIwBUFu4QJgrw9
 gxNzDpfe2j4TPAOPa+OqBBy3IpkB0H14EPcbOXF66T/PTlym84r/M5D5B
 24uahWRmyR7gYWDkYdfChaHxmm2a1yD3HrZqmrOiAZVxiFQy4ZgFPCmc2
 g+DF7ZwtgJQI5y6hCgmkJ7QqqybFR4dcH/+RiOFoG4kWrnjCAJKzrMPTe
 ZS0NQQWw9vQbngsCvo1GrsGWpMuYO+GsI9bbBr2sgm2Brh+tr0+qQnm2H w==;
X-CSE-ConnectionGUID: xSMvGu7tT4iq4MqgrHf4vA==
X-CSE-MsgGUID: ImMEOsFxQfqCfjGmo40OgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="46430523"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="46430523"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 06:52:05 -0800
X-CSE-ConnectionGUID: yRTLWlTeSI6oE0KUiT2nQw==
X-CSE-MsgGUID: lJ3/vgpzSD+PUB2NUPSVag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98703608"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 06:52:05 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 06:52:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 06:52:04 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 06:52:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQJW3UhP0zc2vnv4ndLcmtY8Dm5mjUSjj7xox0cG1jK4fqFt72E3ka2Ifk2zICtOaLNeHS0g0EI6L4TvO37rPTGo895CZhpIlUIKwSJHGONxfGeFM+U+oTSSMJD3u+riPTVCC/AfHpiHjPIASU1kEglBtafjYBb5ueYsSMtxIcsi8F/pwRDCSa/JyABQt+Jt1AOrxzbMgnEergTXFugDIet06nEH7s/vyLwORSLGRS8Zb4g6raOuXdtiyOvZ9nPHmZKCiST66sgdGVBM7N6d+vgi1Doujz3UM3J+G81E7dGurvV5XunN+zkJqV7p9UnkY+Xfuwru1DzlD4eO0eAxAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IiitpIAa8R/5dUXH89miE6C/Mql1y+fyUq5X5IqWMF4=;
 b=VwIUd0gCZbBeaH7sP745O8HOPcBgn9K+Fato7FC5sXh59rky/diaCveADXMgXXvFEheyjjCB5oJxjhFCJWLcSt840ppnj5q8o3HLKmUJ83QtUi0wfxyS2+Zsn5umEAScgakmnoqQkf8GJ0zvsXjQuGt3aXqAi3DdvQcQxYLPf+lJveQG54VbI3bCTNuCHv/CljEBDcIv1KsI21HozB0WP8nJpflZv4qpvuytxgjuqfgcyFCQvxa+mfMBhM+Axll60uO911mlIM/H1SPXweBkyCtNJKyHLbwAWitTR4m/z8kCeZryCCcT9LmLU46i00Mk8b741Em7L+QXdxd5vQiq6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW3PR11MB4572.namprd11.prod.outlook.com (2603:10b6:303:5e::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8272.13; Wed, 18 Dec 2024 14:51:16 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%3]) with mapi id 15.20.8272.013; Wed, 18 Dec 2024
 14:51:16 +0000
Message-ID: <517cea2a-96ae-4f78-9761-ec3f553516dd@intel.com>
Date: Wed, 18 Dec 2024 20:21:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] drm/xe/pmu: Add PMU support for engine busyness
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <rodrigo.vivi@intel.com>,
 <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>,
 <john.c.harrison@intel.com>, <ashutosh.dixit@intel.com>,
 <soham.purkait@intel.com>
References: <20241121063904.3033754-1-riana.tauro@intel.com>
 <20241121063904.3033754-9-riana.tauro@intel.com>
 <4k3j4q3sakdke5fd3l25rrntjtdjxcm6447xg66czx6whofjbb@jel5xjc7kf77>
 <5165cae4-729e-4b78-84d6-fbbbb3470fb9@intel.com>
 <erhe5xquod7e7mlr5nnnaqtlzxsvgytrnxw3xczydibvqcxxtt@v2ta2k3tzip4>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <erhe5xquod7e7mlr5nnnaqtlzxsvgytrnxw3xczydibvqcxxtt@v2ta2k3tzip4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0218.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW3PR11MB4572:EE_
X-MS-Office365-Filtering-Correlation-Id: e8813ca9-55c7-4a8b-3539-08dd1f736cce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wld3VFE0eUR2Rk1FbWd2WVo5SWs0NS90MS9Vb1VTZ0lqRE1NVHRKTkFUTkhr?=
 =?utf-8?B?bUhqYlhvMUFUeGRVWUNSUTJDZFUxYUZDWHdpeWFVSCtpdTBqS2hQVHBuZ3VY?=
 =?utf-8?B?V2tqOHRwMjhJSEd0ME1tdlRlTzNFaUMweUhtKzVuL1lJYWdMVjNaQzMwcWhD?=
 =?utf-8?B?UmRpODlYUXdPKyt2ODFxNTlCMHhJRXZyb203OXlyMm14QXdYZ1cydDlPNFl5?=
 =?utf-8?B?ZEdXb0hkRndacHBQQXZUTEJwNTJwT05aZENkK0hrUVYxRzlsRVdDT1ZwbXFq?=
 =?utf-8?B?M0h4UG5ySjh3K0l3WVFpb1RENHora2I5WTA4NTNyT3JkcHZjTDFITHlKSS9j?=
 =?utf-8?B?RVlIM3lJNG9RaXVmK052aEFEcUlpcURReXlicDNjQ3BEVUdpYkFrMEpiVGp2?=
 =?utf-8?B?NGF0djZwSkEwL050QmxEZ0JwZTN6ejZFSVFEUmFjbnVQZDluNDZPZ2hJckIx?=
 =?utf-8?B?d0gzNDFQRFo3VFZ3N1lWTHh2NVdZczcyYkxDeklaWlNyMGtPRU1GTFFrUkFX?=
 =?utf-8?B?QS9qSFVjUGFaZXMxVEVETC9paWsxT01aSVEvWnVERzVrTExlYVRGOGlHOE8x?=
 =?utf-8?B?ZG5jb0UzMm04WVk4R2kwQmE2MXIxdm1nR3JCVHNla1hUb1lDd2Y4Vm52MXBW?=
 =?utf-8?B?N04yODdITmJ0eUxtVGJWVzFDS0hVZFA3S0NlV2hpeWVGRTBsbkFJanNmcW45?=
 =?utf-8?B?ZVNKT09FbTNkNDNZeEVlc09DSzNlTi81R1AyMDQvSWVDRnpLbVZtQmJMM2NU?=
 =?utf-8?B?U1NYb3hzRXV5ckRXS21XdnZPR1cxR1h5UDBrU3BVczZraUNicVdwbXExSTRh?=
 =?utf-8?B?OFNjNjJ2QWh5bGI2OGJQWEd2TDZPdWxCeDdaNU9YaGJTMUMvZ2s1OGxqTFI4?=
 =?utf-8?B?OVNGSEU3OWZ6VDUwQll4Q0tiOWp6THJqL2hkVmF0VndFT3NFRElpSURLMlNn?=
 =?utf-8?B?VWF6UW1wSllGN215OTJBa2hmNVVUZ2xHOXNPTS9VMzlnM3JFdXlTOXZCcHdX?=
 =?utf-8?B?RXhHUEVVbmd4S0RPN3o3eFB6eGc5ZGNqZzVOOHFMSGRxUDNna2UzUUdNVnBi?=
 =?utf-8?B?S3dnTlE1MGVuVDlQMDM5ZVdWNzh3cXFFUFJXSGlmNWJNV2QyWXc2TWZ4QS9q?=
 =?utf-8?B?bXN4TExCWElwdEp1dTlyKzlmM0J6R2ZkUTNSZWNCWHhscHJtenBZeFBmN09i?=
 =?utf-8?B?cGcxT1lBeGIwcUptd1BxQjJHWWtScGdRZzRZTXVOS0JUUUlHMnNGdGRmdERj?=
 =?utf-8?B?ZVhQQXNnSU9tSDQ1dzZxZ1orbDFkZ2FGOHplVDB4UXJibTRwTkkrVlJuNHNh?=
 =?utf-8?B?QjNOQlVIWmxhb1Nka05sNXhGU2pYd2ZDQVl1bU9reEpLWjl5R3plOGFXcnNZ?=
 =?utf-8?B?QXR5MENFWkgzYWVTSThuUGxmSlNIVUpOSXlKcVBIeS8xQTkrWWhPMS9wQjc1?=
 =?utf-8?B?Tng5dmJSeFdHMDZQb3dUWG9xeDM5dkxNanppaDdaUkw1cXlsUXJKc09SeVZh?=
 =?utf-8?B?ZUhCVHVabTQyZTk0UC93TC9WOWdjZFh4aExzdEl1UTNmcmNoNnpXUkhkcHls?=
 =?utf-8?B?U0tjOWEvN1AwMHF0aTRRei9LeFdsYXdMVVlmb2tsdlAvaFBvNHZVTnhXWVNK?=
 =?utf-8?B?YmdPbWh1c3VFWHFiNC91QUZDU3BubG5wc2FJYTdMeWQ0aEdwelFQUnlmUXF3?=
 =?utf-8?B?VHRIOXpZL2dWaEc2N1ZzN1ZCV2g2anQ1MFlGQkJLQmVtQ1pmM0xMZkp3dGlo?=
 =?utf-8?B?cUY1Si94cHpVL2NvVWlGLzRlakZ1ZlhRTE1PbHJENEZ5OXhGVSs4S01sbjlq?=
 =?utf-8?B?UXdLMTRIRWduN1lJZkVwZnpNWDI1Unk5OXlXSGlScHprZ2ZsUkxORmVTN1Jp?=
 =?utf-8?Q?8INn0gnLj8S1Y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkRRd1diNGl6R0Zyb0ttdTc1Vzc2a2M3bThvSmlGY2h5TlJkQ1I1UWZQUlYw?=
 =?utf-8?B?YzVKeS9OanFITTNLRjVkd2dwQW1Dc2dVZU45L0xJbkc2VDE3U09BdFVpdDNB?=
 =?utf-8?B?MitSK1g2VnU1OGxCbWszSXVVVzE1Y3JWd1Vub3p4R01IWHlvSCtoWnZQaXVr?=
 =?utf-8?B?Uk1YU2RPRmV6UmRtTXVuU1lvakl1SEVxUXp3T2c4WWlTU1JUQTY1U2xxblZM?=
 =?utf-8?B?R1QrU1FrNnpRRmJHdTVXUVkvUjZ5UXMrUkJBVG9Fc1ZDSG5ySGZNWlR1K3Vt?=
 =?utf-8?B?N2lnR0F0blFoN3BUNlFtNzh5U3NhTndkQ2o5amJicFBIZVU5NnBPSTQ3RzNH?=
 =?utf-8?B?WGR1c1NvZTlEZURIdmlhcDRUY3lXYmFpRmdySENjbTNUUGd5TVFGTmNvOS9s?=
 =?utf-8?B?VzVuUlpxRGZOUHVtNUtaWk5obUZhYXlGdGlERXlURkdLK3M1Y3dkR3hyUE9F?=
 =?utf-8?B?cGtxR1VLcG5PdGRCZTBvVVdueXZNbkhVYkVZSnRSdERPMG5pU2JUbHd0L2xy?=
 =?utf-8?B?bkpTWjNRbVhrYTdGbFo5NjJMcmF6QVRnbUR5VmpIeWpQaHpOdldwb2xnME11?=
 =?utf-8?B?NzlURGkvRWpvN0I5T0pqT3gzTm04cExoTmpPWDIyd0VMcmdtL25BZEVaUFMv?=
 =?utf-8?B?M1NFd2g3K0VtNnRUcW9ZR1kzM1U1cU9kdGJlTXI4cmpSSytGYmJJOWNxTk0y?=
 =?utf-8?B?SW1uWlZQNGxaaDhlUnVzMHpPd080RllUT0h0R0Z5czYwOHNQZGI1S3c0dHVx?=
 =?utf-8?B?SjlWLzRxTVduMWg1OW5lMWtKK2R2ZWovUFRQbmU4ODBhbGZZOFlPOUQ3VTBE?=
 =?utf-8?B?NVJ5QlUwb3dsVEhLQjEwbG9TMUYreE1pbHpaZjFneWU5dlIwY2hlZEtRRGJo?=
 =?utf-8?B?MUlkY241T1BKMy9NK2x5QldsOTFtNXR1dE9GRTB5T2Zya0JFOURXbXlOMVVq?=
 =?utf-8?B?dGV4bVN1bFdhSG9GaUFHQ3RBSWZGamdpZVR5aHIyRnRUZFY1djNHUm9QSTJn?=
 =?utf-8?B?K21YZWlHRFBUN1VmaW55Z1FodlBpd0dtcTVWaEthWEl1OFo0VnNqeXZ1VWhC?=
 =?utf-8?B?VUJJYllyT0dhOHdCalhvTktxR0h3S1R2Z3Y1SkdNSERnUGt0bi8yVkllczNV?=
 =?utf-8?B?aEpISGhKL2NrWGhRVmdwbEU3ZUZIY0pmS3VBWVQzc3FFaGVIVTlHMm1WZ0dE?=
 =?utf-8?B?YVJuRHA1VkxkUmNtenZ2TWU5ODAzNlc3NEE5bisvemozR0dRZ2dVQU9SRk12?=
 =?utf-8?B?bXZvdXYvN2VvdGVTRCtTaHpKak5iV0NnWXFVcnlkWDZQWFBFSEVtZFNYZExP?=
 =?utf-8?B?ZXNYWU1RY01ybVpWZzUvNVhncngybmxFejZGUEE3d2VZblI3QXIxY2tmcVpz?=
 =?utf-8?B?Z2tRTXRyUUI2dUZiWWthQUNWYkZWWGNORHF5SUZndFR3UzBQZU5MTHI3Z3ZM?=
 =?utf-8?B?MHFoSGJrSXRTSmRsRWxkYUFxOXdhalh4UkszcmZvNGNLWlFjdVhjK1VVNEUv?=
 =?utf-8?B?a2ZIa0FkblNKb2w5NTFrOEZ3RkRSdXVNVE1HVnhXS1BZdHo1c2Y2eXlKRThi?=
 =?utf-8?B?VzRxeHErcGllbnE3V3VjTG5NaXZUMDhwNGtJNWRoQzc1OTZvN0VHWlR6bTJr?=
 =?utf-8?B?emVZM1E3OVVrR1NoQVlKcDlOY1duWDFzQjA5QTYvVVNqTlpkN1E2TTlnL0hp?=
 =?utf-8?B?QVhwMWlyekdDMEJjcEJIWHFvUXRxVnJTZEVsLytoNk5qUy8vN1NGRzl0SmRN?=
 =?utf-8?B?SkI0bXAxQmllY3A3cnNkMDBYYkRPWmUzT1ZFejVLdGI4TjdQdi8vS085WXRo?=
 =?utf-8?B?ODJjTlFjSW9IZ2JFbWNpNEFHQkRsLzh0ZHVQWVBJUmNaQUVyQThsMjhhY0U2?=
 =?utf-8?B?Uy80cjhWWjkrWFU2U2hpb1ZuNTBvM3hYaysvMVJCdDFLRGVMR3FmcmxqRSt3?=
 =?utf-8?B?UWQyZk02eVlKK1RIenhrUXFsMENyaU9hbEI5M1NiQytHdW5vYmMvRTUxMEN5?=
 =?utf-8?B?V0lOVm14NGpkTXo2bjlJRlBMUFNJRVZDZzJ2UFJKSXlWaHVYVUFUYmZOMHR5?=
 =?utf-8?B?bGlxZXYyOGV0elkxQ2FXdWFrTzdCellOZ210NnMyaGZ1c1pKVUNoMk1jYkt6?=
 =?utf-8?Q?aXOZfkx8huIZFF7LVgSfU1hyo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8813ca9-55c7-4a8b-3539-08dd1f736cce
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 14:51:16.7741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pTN00q0KcQhXS/kxZ2MlPjeD26PRYvoRKFUXTyZrYM22OtR5nzad+L20LM56lC4/GOm9DXuh7ve0QWNyvg7csg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4572
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



On 12/18/2024 7:43 PM, Lucas De Marchi wrote:
> On Wed, Dec 18, 2024 at 10:42:53AM +0530, Riana Tauro wrote:
>> Hi Lucas
>>
>> On 12/13/2024 11:28 AM, Lucas De Marchi wrote:
>>> On Thu, Nov 21, 2024 at 12:09:04PM +0530, Riana Tauro wrote:
>>>> PMU provides two counters (<engine>-busy-ticks-gt<n>,
>>>> <engine>-total-ticks-gt<n>) to calculate engine busyness. When querying
>>>> engine busyness, user must group these 2 counters using the perf_event
>>>> group mechanism to ensure both counters are sampled together.
>>>>
>>>> To list engine busyness counters use the following
>>>>
>>>> ./perf list
>>>>  xe_0000_03_00.0/bcs0-busy-ticks-gt0/               [Kernel PMU event]
>>>
>>> this will need a rebase on latest versions of the pmu patches as we
>>> moved to have gt as a param rather than mangling the event name.
>>
>> In case of multiple gts, there might be different engines for each gt
>> So should we display a common name and unsupported in case the engine 
>> does not belong to the gt?
>>
>> sudo ./perf stat -e xe_0000_00_02.0/vcs0-busy-ticks,gt_id=0/ -I 1000
> 
> why is engine not a param, like gt?
are you suggesting to have both engine and instance too as parameters?
Something like this?

xe_0000_00_02.0/busy-ticks,engine_class=1,engine_instance=0,gt_id=0/


> 
> Lucas De Marchi

