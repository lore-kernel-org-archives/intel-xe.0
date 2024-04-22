Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE456C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 17:08:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9485D10E476;
	Mon, 22 Apr 2024 17:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TwaWTG0r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E82910E476
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 17:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713805702; x=1745341702;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dREdB9kymz2NOlyYoo/nMmGuojdwIQkRBTx9QwNjI+o=;
 b=TwaWTG0rz0nIdvU1q5ZieJ1gTmL5bC7FbFmkD7VJ9zVwQLzCbxKX+oJj
 qOU7hyg7jb72qii8MnnRhxG/srw4Y1kv/YlBa1nKcklNyJe37Vn4TmC1J
 awuaGNEZxMbS2f6hbhHBcHcCya72n98feaTfdgQxn9M/xnrdkQRlukHA5
 Vamuq/8ZD9orbzA1cBPXE97+0sDMoG24e84o8FsXJx734YSHLdA5iiAQI
 uptn/RY3sYh26h48QXtWmolNO7OFknx7fLCtfV9KMVuvSyUVMMIGhLePO
 FuMJs45/WwErJuW/cHCaKygtwhazX0qvDAkmDr2uoIfY3XoikhxaPgHBT g==;
X-CSE-ConnectionGUID: E1xhJT6UTNuzimrnA0g6+g==
X-CSE-MsgGUID: av+kwoZ+SiSeyUF//M/Myw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9221905"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="9221905"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 10:08:21 -0700
X-CSE-ConnectionGUID: 4tmCxyEJT7Kc20O+5jXm3g==
X-CSE-MsgGUID: LAJZHAaPRnajRWCRxG0cgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="55287850"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 10:08:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 10:08:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 10:08:20 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 10:08:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WxBbIYhjVOZTeYhz9l5uEPUujVVPtV5LR8hHPkdifS6/EsCV9bF/9zMxWLtZLce90SgGMo1x9VHfEGzn59O/Pnh24NE+nmxlE57Cm8BoRFQ4uk5Y6FcMIrs07AGAZEWduYVa19/tGfRnxByn+teC/dvKTfCOz9D0a1rWAvHGX1TDAqdVTOVO0ti5PxUVZUx0zubsythXo6atAbH3ygr5RSqPiCaRIxseGuJShHdVIV2bjsYpJ1+/L/uP1JtvRQlf6B70e2wRYpKgLZxWxiTrEP78Il2b2iRtLhMlEtiS4PyF2oVS90gge2PMf3PoHchfhcYmTtfBuRTUNE7sT9dvJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxOd+mAFVSdN+7syj0kSdMHNnoiAM1PYveAEG8nPvWI=;
 b=LCeA7SpsNvK+RcmytDlom4SYsdsRY3oGyVFzT/W5Btfz3I+AADFwW8YFS7X5lUNlyL2F2NCai0+UYx5AJMlA7pWnVfYt0XGCr/46dtuDda68+eD1/hGrXKBEC1sDXKdQ3lRdt/TB1/ZAfqPKA635QDeS++PC2O3axs9o8pru7CGuvVy8nMiV5I1x3G/x60mE0WpLBcaC3JrZBQdE8MkPDhipK/4exW07rXQQwuHnKw2xDqCT0Jt8kFnqYlbT/H2rkWR6RPIMpPaNVjjusZsUlv6DWJ1Rpyvnvr1pbKsc7Qzt30IkEv4KXtN0o2pd80z+WiHBMi8ljtc6dZNu1pA+zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MW4PR11MB7031.namprd11.prod.outlook.com (2603:10b6:303:22c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.11; Mon, 22 Apr
 2024 17:08:17 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 17:08:17 +0000
Date: Mon, 22 Apr 2024 19:08:14 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/pf: Fix
 xe_gt_sriov_pf_config_print_available_ggtt()
Message-ID: <20240422170814.rzepa4ymdwucg3fq@intel.com>
References: <20240419141000.314-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240419141000.314-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI0P293CA0011.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::11) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MW4PR11MB7031:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c168408-6bba-4d6a-a0d0-08dc62eecd8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3A4S1IyOG0wa3JtRnhpWkR6ck1sc0ZkNlB1NHAzeXR2YkM4ZVc4cEt0UTJs?=
 =?utf-8?B?SUhoV2s5K2RPNmo1R285SGxBa2RhZEJ4dlM3RnpCSU5PU0Y2YVlRTWo4NTBy?=
 =?utf-8?B?dlMwQ1NuQTRzb1JPczYrN1Y0SEpiMUpWNDdmckl1d0tjNDBrRnVLTExnbFBi?=
 =?utf-8?B?d083M2MxQy9wb1YyZTNDa3FiMEFXbndxaTdhT3RoMWprL284a202bngzN1BF?=
 =?utf-8?B?UVNrNEV4bFo5WUUzaFRJRkRBYnRFZHVNT0ROT0JBdFRNYkVZaVkwVVRWdW4w?=
 =?utf-8?B?OUpRdkhiZjNmNnZHdmxIR0hNS1NVKzExSlJ2Ykk4NlU4b0JvdmFKaDBjTjRt?=
 =?utf-8?B?U3dVM1IvWXNIYjhUWWpScGIyUmpValhTdktoQVNGdHJUczhCQXR5b2RKcEtz?=
 =?utf-8?B?cjZUMjNpMTlNb0NjMFFaSXMzQzV3T2RSeVBrcGhldFNJWW5zQU5taUY5R1I5?=
 =?utf-8?B?VklCc0NiQmVxSlQwa0IwS1NMV2QwYlAxWWRjVCtjZHJ2d3ZPTkQ3d3lUaXc2?=
 =?utf-8?B?bTg0OE5jMU9NWjFWY2ZRM1o1R09zVW9rdVVnQzRPRTVSb3V0azZQcXNUVDhk?=
 =?utf-8?B?Ynh4bzBWQkxPNVZHaXBXdU9NN3ZLdy9lOEFEeHU2SUV5dDhLWGZZK05FMEhT?=
 =?utf-8?B?ZTZLc01rSDVwLzhKODdKUk5GUWNqbmVrQ0M4ODJFVHpzV1M2aVlnNGIzNzBJ?=
 =?utf-8?B?dlpxN3VzaDBOMUozTjk0bW1pQmtkN282Zm9vYWEyQjlhTkVleHc5R0VmREhw?=
 =?utf-8?B?bDljRDNuMFBLQVd0aXFXWk5wSUtXOTF0bi8vUEtWcWJvcFFCSmZqd1ZlRU9B?=
 =?utf-8?B?TU9TY1duTlRSTnBtRHVqZVR6MHNXdWNjcm13VytseFNFUWphTUtOeEszMXZ5?=
 =?utf-8?B?KzBFS3RzeWdZRWFGYVlmRVFGcXlGSUtzdGNEQXBUTzM2WUdRL0F4MXhMdnVT?=
 =?utf-8?B?VWRrdzVpT0lxK3pYZ0cxcnRJNnhOMEVSTDZtUTZMYmt1L0llZ09La2tCcVVG?=
 =?utf-8?B?bFZiS0tBaTk0b0J4NXhLclppWmVtanhlVGhydjNPZC9Dd1dxc1JSNG9sUThM?=
 =?utf-8?B?ZXVRRXpRQTJqQVgreHYvN1NMSUhTVEVhQlZMYThHRkhESzRxSlNCa3o0anFC?=
 =?utf-8?B?V3FaRHc1ejdlRHU0TWVyNHZzQk1haUpTeVlxTUp2U1JXMjdsRU9GUDIzRzNk?=
 =?utf-8?B?UkFMTE9tcTNzTzhvY0c4ODAxazdCMHFoME5nTHFBWFJ2MTYydnZhVnhiQm9l?=
 =?utf-8?B?WHUwanVIaUpiVG14UHpxTDlLRFBPWHVCRUpGalk5eVdJNHdNc1RFQlpGSG1v?=
 =?utf-8?B?eGR5WlhUMzJ3YllkTGJRS1hEd3g0cWVXMEMxVGVNMUdKTmZnSXVZbVQ2UUlm?=
 =?utf-8?B?U3loVDN6NlhtTStMbERnZHdMVEFEby9xZnBxUjZIUkhJdFMxWTFrTG05MHdk?=
 =?utf-8?B?ZnI3czQ3KzRJY2o0a1BGYk52dlRaVGJXVVRIVWk4SFJGaUFJcmhCaVNMVFlU?=
 =?utf-8?B?MWtCN1czZXlyemVkV3J3QVJRRG5kNlhCdGFXRmJ5bTVGT1R1OHo5bjlKcmhF?=
 =?utf-8?B?QW15STBzS214UUdZNHFaOGZyOGhEb0xtTm1ZLzQxMTZraEIrM25kek9XRXlh?=
 =?utf-8?B?QXJKMlFpSFdkYm15MmllblRzdWdDNG4xeWRjejFMNm92d2xabnIxVXJ5Zkxs?=
 =?utf-8?B?bU50OG1DdndEdE9rb1NzSXA3WTNqNWpodUZkNGNRcVAvNzBTbWczZDR3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlhhWGdxMkFqZlBpeEo5THAvbTQ0cjh0SnV2MlpLVHdOYkFpUlBoVTJHWm5K?=
 =?utf-8?B?OTI1TzZwWGdROGxrdGw1YW01cmhXNkh5ZW5KRVdVZ0Q3ZUlqUi9nTlk0THpV?=
 =?utf-8?B?THYvNVpLVXlOSEg1NlNXcmcvL1ZWaHJBRmFsSWhkdTB4ZFFHaGJUM016Zkxq?=
 =?utf-8?B?SGNlcEV2M2NvTVVtcG5LUDRzc3gvODk0b3pkT09STWVzS0YxVUphZ1B2Wk4w?=
 =?utf-8?B?U2RLeUpxM1JvSGJJc2IrT3lqcTg3SU84WEFabWgzVUlyczdFS2JrL28wZ2tW?=
 =?utf-8?B?MmIvdENlZ3BHZ3dMMjhlNHcwTG4rRDZnandVUVBVRVZmTTV0UEhrM1V3MThi?=
 =?utf-8?B?Y0F3VU1LOUJwWkNJT0dhT242UUx3VXRHL3BlWStNbEVGNFYwem9GODhZNFhs?=
 =?utf-8?B?ZGNMaDBtNk9IVHQrQ2JPdmJsblEyQk0yUEdIWEtKUnFJSFVwT09PM0xHcmt3?=
 =?utf-8?B?ZW5mQzNYajJ5ZUxuL1o3TTZoOVJ3WVB3Ym5EMW0yQlZsY0tzUzFOOHdGT3V6?=
 =?utf-8?B?VDhQZHFVU0NGUFI1dkRZQlJRRDR6MkxPRWdxRkhmZE4vLzlXTk9sY2lSVVV3?=
 =?utf-8?B?VjNIZW1XZUlPU250Si8wZXdUcWJyeHhsMncxQkRWMnZRK2YvRkx0c3MyKzZX?=
 =?utf-8?B?Y0M1MElOTURzcGZpT2hOYTN4UUFUTndBbHdaaFNQV1ZkVTZMc1R2dWNMdmls?=
 =?utf-8?B?R1FQUFNad3VBOExGTVI2cEJqb3M3cGxWTVU1M3dnMHFqTDVWbG5NUDdVeGRy?=
 =?utf-8?B?UjVjS2Zic2dmVGw4T3ZUeEhIZG5zK3BkeGZIVk01QUxZWWlQRGVLbkcwMk93?=
 =?utf-8?B?cnFRUEQ3UTB4RStBYUxXWGVNT1o3dTk0eFJhWTBlVWorYUpyK25nNEZ0TkFQ?=
 =?utf-8?B?S1RwRExPL2wwNWs4N3d2RFgzUTlzbXN0cGFNTVhCQW5qNWEyZ2FWTTlUZm11?=
 =?utf-8?B?OVA0ZHppc2FwcENBS2ZRNUlDSmd0eG53ZFI3YmhDd3lpRlhWemNlZnVhMG9m?=
 =?utf-8?B?RXlVSm04MHJzcUQvUm52aHZwcjlMS0x4cnhnMUJFM3p1T2UxQXU5L1IzUzBa?=
 =?utf-8?B?cEtXR0l0VzIzd01mUldOanQ4TmY4WWtoMndQMzBld00wWElyYnRIOXduelpx?=
 =?utf-8?B?U1JWTWNDb2tiR0Vpa2RpREl5SEUremdaSVpzeEhXYjN0SllpMHJtL0p1UUk2?=
 =?utf-8?B?TDVLMEw1SGRDRi9lajFPMEVUendRcjRVbDJxdHlFa3BHaDFMRFhpck8xeHQ3?=
 =?utf-8?B?cUVicElNOE5tdVVoUCtYcWkwdFRTSkw0dnlkUkNlR2l3ZW10c2kyb1dwME4w?=
 =?utf-8?B?cStsRGpMYisva1pPanEzbkQ3TGlxeHcvT0RyK3J0WHRQbmg2SlpKR29MMHdY?=
 =?utf-8?B?VDZtbDYrL0FSd2pCZU5GalduVUdtQ1VucTA5NmR0bFRZcHM4dVQrUHpUSld2?=
 =?utf-8?B?cmhydEhkd2M1enR2VUVxckFhYUJaSFVwTUxncjRmMnVDRUtTdmRYM3pWS2Rl?=
 =?utf-8?B?THo4cnY3MFpLUldISWJ5NzRxa004V0xXRjNmYXNpOWVobytMOEgyUFJ3aU1I?=
 =?utf-8?B?eWhEaHVFdEl6dWVHTzJlMXpPQVVnZU14RzlwN085QWtHMnArSDNVc0MySTBR?=
 =?utf-8?B?SzF0eEV1aTlFSHRoeTJTTW1yZENZNmlmTTBXV1F1QVFLYmJUbi9COTZCYS9F?=
 =?utf-8?B?dFdKcHhQWFhJcjlCWTI2bG1BV1JUVjlBUTkzN0tXQkhjU3d2VG00UnFpdk9M?=
 =?utf-8?B?em5ITE1DRDR2S2FuUlVlSjFuTm1WMHpRVDlRR0NObk9tdWhxakowZjMwVS9V?=
 =?utf-8?B?S21VaUoxbFBqd3I1bThxR09ZalNkK2lGVzFvNERFVE9mR3RPRnZTRE4ydFY0?=
 =?utf-8?B?b3MvcklwTkl3NWxId28xR1dldTVSTWV6bnV6SDFaMndrYnFCUHdGb2NLWVF5?=
 =?utf-8?B?b3NKMVoyL21tSk12MitleWNWYkJrTGQ4eElTQ3kzc0FCQVNBcUU1Vjd6eHpv?=
 =?utf-8?B?Z2hzZzcyNFJmWjJVUEJMcXB4UzNmODRGd2ZWeWJaeHZNcnNEU2xkTERRdnZB?=
 =?utf-8?B?L3FpYlArT2Z6WHJhVDc2eExGSHhlTExhQ1lmdHp1NGJMUzhpWEZoOTYwYTFX?=
 =?utf-8?B?dUoxWW5sVDJZOUs1VHNHY3hZbkJTN290ZnhCVXl3TGlSQkN4TUsxVWNLVFB5?=
 =?utf-8?B?MFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c168408-6bba-4d6a-a0d0-08dc62eecd8f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 17:08:17.1352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jD21oHss1EGT/41cDGpMn+szV4RaoHWTe3TibEPz4GxODbNlggJ9cq76ef9ErE1CNSTf4lsn2Ke3TdnqD5+kl2ulK9d8SqDTJRkGepSX3NY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7031
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2024-kwi-19 16:10:00 +0200]:
> This function is using internal helper pf_get_spare_ggtt() that
> expects PF's master mutex to be locked. Fix that.
> 
> Fixes: ac6598aed1b3 ("drm/xe/pf: Add support to configure SR-IOV VFs")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 0f5614877770..79116ad58620 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1932,14 +1932,17 @@ int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_prin
>  	const struct drm_mm *mm = &ggtt->mm;
>  	const struct drm_mm_node *entry;
>  	u64 alignment = pf_get_ggtt_alignment(gt);
> -	u64 spare = pf_get_spare_ggtt(gt);
>  	u64 hole_min_start = xe_wopcm_size(gt_to_xe(gt));
>  	u64 hole_start, hole_end, hole_size;
> -	u64 avail, total = 0;
> +	u64 spare, avail, total = 0;
>  	char buf[10];
>  
>  	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>  
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	spare = pf_get_spare_ggtt(gt);
> +
>  	mutex_lock(&ggtt->lock);
>  
>  	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
> @@ -1957,6 +1960,7 @@ int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_prin
>  	}
>  
>  	mutex_unlock(&ggtt->lock);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>  
>  	string_get_size(total, 1, STRING_UNITS_2, buf, sizeof(buf));
>  	drm_printf(p, "total:\t%llu\t(%s)\n", total, buf);
> -- 

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> 2.43.0
> 

-- 
