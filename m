Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B7BCDE009
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 13:53:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34DA10EB5F;
	Thu, 26 Sep 2024 13:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aecFqhaw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DE410EB5F
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Sep 2024 13:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727358798; x=1758894798;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/nV4YARr7H2jcP9Iptkz/pmO/IteFcqQtxa23paRJnk=;
 b=aecFqhawq3leXNvH3Yay4a+nhHSuZqDCb/F+6eQiTGu/ApVm1CZ5cydg
 iZSOGi5doAhAQ/lyHb6EhBv4nOAGJ4KaQW1mTgO1j9Q4/xk5FeFh/NYR4
 4Cn604lMVkwOvHE26ECOjB85ax8yvRIX1/XXFHvpfBDnRo8kZTzeqN38b
 uymnP3LaDsua8be/cw9EZE4/EKPYBbWNy/v8zeUVpw9Bg2THaiC5PBMcb
 EiMsnf+hrbxs9GC7Pf04vwX6BiLWqyi04SZUV+tSowT/QNvCk1fu0rAEi
 IylJ9arGDzOxQrgqUkyFTVDF+okwM5LUmzgBNfNKzCGAp0OE4dbpCs1d1 g==;
X-CSE-ConnectionGUID: rq0JLV28S0+Ppzhc6vLcog==
X-CSE-MsgGUID: 9qvEjIrgQ7ifU3vxDm+96A==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37018191"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="37018191"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 06:53:18 -0700
X-CSE-ConnectionGUID: P99XaBuvQWmbUwuNMHBbAw==
X-CSE-MsgGUID: 4EpnampeTTiEt22VpoqVRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="76654035"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2024 06:53:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 06:53:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 06:53:17 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 06:53:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 06:53:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1ElXUuCR3611Y7LrRhZ8gLGgNnrUs/LEM3Edj3MvbhnsTk1jyjPn+3UoA0dJ61qI6HGrERL6I+/4ODSBWt8ZjgaqeHg3z7u0prvIh3ToiuNpGV42Qlble9XVFF40Nn512CrScyT+ObagtarWVdixFvXt5MAO8ppEJysT6zTepOZsi+vbkJiPV26XM/lAoX+mVbEJNWzpM2jryhBbW/uSwij586h5bXqESps8m8dT8R48gmXWpfrc9Oi5ZFPlsYvds8N33AHIWd/lhjgVIKnzF3M+0P9P7IVAaARyvkv9W7XLasHOj01ochw8Pmr6HG0BjAkTd5Li9uB/PtB8wWrNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9QYs6GhqdE9f3dJBF18lYmX+zLThG0RqB/Fbg5Fajg=;
 b=dxVEu2GQ18UKrCR2MeOoWediqhKlNF+ue57ICnaebTMRwgqDJoSq/Y7aCYbxqPfOc7wMizG80yxWgyLXAlUj1lLnKml0vbkuZcC1d8nvGLe2hBnVICXd9bWD+XjPyYgaHqmorslRmcVQ9HLJWu+TDkrypoOifNnaRM7rxAXd/B3HKmRFlWu851rIu51CmgSPJ61r+uhNkpPcXZoDtqUwwf0Ddt0fHvG8sGw8LvGb48/D8rqbXsPRMG6WbNCbuiqVLAwr4Wufs+/Mlk7rykkvHPpq7CK8ekl8hqXIdbhYiqVKlbl5Fk6VGK1bAYviFZQ0IS/c12gsvl2WsIkU6kOpkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by DS7PR11MB6104.namprd11.prod.outlook.com (2603:10b6:8:9f::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.28; Thu, 26 Sep 2024 13:53:14 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8005.021; Thu, 26 Sep 2024
 13:53:14 +0000
Message-ID: <75fee094-f70d-4aeb-955c-6e4e142d4f90@intel.com>
Date: Thu, 26 Sep 2024 09:53:11 -0400
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_Prevent?=
 =?UTF-8?Q?_null_pointer_access_in_xe=5Fmigrate=5Fcopy_=28rev2=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20240925012110.493257-1-zhanjun.dong@intel.com>
 <172733234943.1104586.11317164926048870369@2413ebb6fbb6>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <172733234943.1104586.11317164926048870369@2413ebb6fbb6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::9) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|DS7PR11MB6104:EE_
X-MS-Office365-Filtering-Correlation-Id: fcfb263e-9c5a-4ed8-8832-08dcde3290e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qk5PTnlWNGpzTzMvWjNZRkc5blQrUTdCcjZkeW1scS90Q2pFUDNHOE96MXRC?=
 =?utf-8?B?VnhZRllDN1BDYlJ2OU0xamoxK2NIMk9NMDQ0SnUrdWpSMm9ZblIyK3ZrS1Fs?=
 =?utf-8?B?MUc4VkNSZmt2eXcwZ2NNVzRSRmE1MTRsbWV0WksxYk1FQlA3ZFNqM2YxSkdH?=
 =?utf-8?B?MmdxZWpRdzl1UTFZTGMyRXhCTkNHRDhZMTRSUEloSmlXazB4ejFWQjFpMWcx?=
 =?utf-8?B?cmR5dWE2c3E1WEl4dXE0TVRSNWFWK2NlRzV1QkJWaDBoQW5ZOHVGNXpGOEdC?=
 =?utf-8?B?QVcwMkw5VFAzYWJ2eDBSSE1HenRKeHVwczJ1TDc5cWRIbnk0dE5uVG1qWHU1?=
 =?utf-8?B?am8vUnNZK1lOdm5VUUZBV29qdnozTXp3aGo5V0llaE0zTExSOUREeWJLRzlq?=
 =?utf-8?B?VXR0d2pJM1grc1Jla1g4UzlnWUVRK2Rwdko1VXo2WS9wbHhJajZkd1FMOTR0?=
 =?utf-8?B?OU9pbjJScGVuTjZVbGhBeHNEeXBqYW1oMjQ1ZHUyNFVZSHFOQVU0VTl0WVlR?=
 =?utf-8?B?Zm9GK3pQcyt4UlJBdFV6TkRwRmxCK05JdldzMTd0OU5WNVAzK09ZQWRXbmI2?=
 =?utf-8?B?THRVWGhncnI3L0lWZGFjWVc0ckhMdStQUEtXaWNKdmUrUnZjalN6MmRVWVEw?=
 =?utf-8?B?Q2x6ZTlSNXA5eWFTL2MxTm92aEJmeHJhVkNlSWxjekx6YlNKWE8rMll4bHgz?=
 =?utf-8?B?OE9ueEtDYXhTY0dCRVkzd3oxVkxZRG51U0dQOWthSS9HNTdPSlJjTXlFOEpM?=
 =?utf-8?B?SXlZclNKSGdXN2QrRzFGQlFCSDJRRVJiMlJUeUp4V28rbGN2SEhZT0M5SVVT?=
 =?utf-8?B?bzJtNUFiWE50ZVhBYmF3YkFqRzk5VUhXRWxvM1FkYXFzTlMyMG1yZ2w1Sm1x?=
 =?utf-8?B?M3M2TU0vQVN6ckQ0YjJnTUIwZU1qYXZsMDVmZGRoL2o1R1EvNCtndTgydFk4?=
 =?utf-8?B?UENOL1dUYzN5Mmx0UGJ6VUZ1ZDkxZlhKSjJ2NVRVamltMzNoVGR4SXhhOXNI?=
 =?utf-8?B?QmlSSVZxbERHeFozYmRBemQzenZmWW1UMXRwOUFNVUwzT3o4bURJV1o1UWN4?=
 =?utf-8?B?Z2NkM3JQNWJ5SmlDclc2d2xJRnF0djdOWE83UXZJQkR5a0l0Ylp3VUVWaTMv?=
 =?utf-8?B?b0dDc0RReGpjOXg5cExwS1FmY0h0VGpGTEVZK093WXF4ak43UHBmU0RLU2ow?=
 =?utf-8?B?SEx6eXBGR3IzenVSRVFSdkVITEsvMU5qWmh2aHRSY0QwTG1MZWZSVEFLNS9C?=
 =?utf-8?B?bkQ0L3EwQ29ma2RaM2o2V0plNDRUV0lYNFVRdUswSm5mWWxlVFB0TStYSGd6?=
 =?utf-8?B?RGdSUmNJc2xGUlowV0NVWE1FV3ZucVRUQUE4RlRBYWpZaWtlR08zQ2l2bVFN?=
 =?utf-8?B?RXNRUEdHTTl2Q2xWWlArQXYwUkI3N1o0enZMaUIrek9vak9oaExoLzVQdS9n?=
 =?utf-8?B?aU9yTXNhQlI2MGlXWExSdXdPTWdHaE12MVhjR2R2SXB4K2ZMRFVJWkJNcHFD?=
 =?utf-8?B?U1YwNUVwcUE2Z2l5YTI5cGpXNFpSM1d6ZE9vTEFad1Qva1YrTHMvZ0t3K2VX?=
 =?utf-8?B?cGtMRy9yeUFTcEppRjdFdzJpZUhKZjFuSTlDWUM5QVN3UUZmd1BhYXU2YlVv?=
 =?utf-8?B?VmdibjhSNi9FUlJjdlV3NVdidmlnMGZJUjRKeEtyVFl1VFlzNG5uN3NPaVQx?=
 =?utf-8?B?QSs2UVZWVThKUXVHVjU0Y2NwVmZsOXEwYnhkS0F6R2orNDZrSUx3VWFnRmJP?=
 =?utf-8?Q?7cCxvTrgOEihYosAEE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFJtM3pNZnBZeUR1ang2UWxwZkZlU3RIaXBMN3d1elBEMDEySjdpZnIxM2ti?=
 =?utf-8?B?ZUVaaXhhako4ZXJSY1pidTdEMHRFUUp4bGZ5d2tESHZEWWR4TkVHOG1ieUNi?=
 =?utf-8?B?cUo4Z2FlZ2E5ajg5UlhNQTFUWThWT3RnaFRQTWE5NzdydzFneGdhdk0xUWY3?=
 =?utf-8?B?T0dCb3RtRzdoSmd4aFFkOHlPWWl2am9yVGRHRHViN0JuRGpSMHNOT043M25r?=
 =?utf-8?B?aENaNkxxSVMwTmhmS0pRcmJ5bTA3ZWxTS2g4TlFLOG5GWWd2bm5UajJycjhn?=
 =?utf-8?B?UUZNSSs1NXR5NEtZRHJCVW95NzlDbnUwbktZVmI1UmxvSFg2ajFLQVdSMlRj?=
 =?utf-8?B?Z3JBZW00ejNLY0hEU1RiM1ZNSHUxZEhnWTNua0J5N2JIOWNiQzJmenplK1ZG?=
 =?utf-8?B?clNOWTZUMWJDTU03MkZNUndWdk1XSjgwZjFsQkxjZkpiQzlnVWdqSDZRM2p0?=
 =?utf-8?B?RDNtRzVwb3o3WFJZSkFBa0x1bWNKVW5ra0dWNVJ6aEpxMmZyS0lJMFd6OEp5?=
 =?utf-8?B?YU1DRE4xMXhmdTgzQmtmblh3RlIrKzBNOHZtNkhyRlVPMmxGT0djQ0luUkFW?=
 =?utf-8?B?c283MG1DWHNnSnRiOGNZVUJ5dHB0amI4MXVCT2RYbVR5Wmdxemc2Qm9Ya203?=
 =?utf-8?B?bkduMGtqVTVGTlFRY0pXR2RmdHFva2RSZmpmSDRPZkswaGtUSGVXejJOV0x5?=
 =?utf-8?B?NTM1T2xtMTBiV0tYbEI2VXRETVFyblRxLzJldkppYmYvUEpjdlVRd3A2M0hN?=
 =?utf-8?B?RzVzWldoWDQ3RWtkTFR5czJXOUJSY0Z3Wlp0Wm9ldXBqWjZVMzUvUklqdE92?=
 =?utf-8?B?emZTMVAvcWNTbnpnbkc5TnhXS3BySVIrNXJjZ3BkeHFOYldJdEU2QXlwcjgy?=
 =?utf-8?B?OVI5Q2JhbVZhM3M2Vk1KWExQeHV1alZKMnZHM2FzdWVMdjlWZDM3aWhjUTc5?=
 =?utf-8?B?dXlBWmc5UnNhY1JSRzFzYlJaZFhERUNweXBNTmRQQko4d3Z4blNML3Z0RXBP?=
 =?utf-8?B?TXoxOU9hdVVUbUNMRVV3Yk9YWlpEY1phcm1BZVVPcDV0eUJwSHI1NFdqcENv?=
 =?utf-8?B?TDNZa3hBMDhyQTFGdkxjQ2t5SFJZSlBCRGJIQzY0K0FramJwM2FGK2J6Q1NK?=
 =?utf-8?B?bnUweDJyRVYzc21wN2RYSmx0N214Q1lkdjk5UWNDd1hGM3lVY00rdS8wK2Zi?=
 =?utf-8?B?VDJpZWo3NEJXenBHRzl3ZkRMK1ZLZXBIRVpvNUN5cVNOQ3psMFF3WmUvc25s?=
 =?utf-8?B?VC9YTEtiNDNYSTkwOHRCRlI3MDIrOXVkbTVaTjd2ZCtDT0Q4OGUvQnVRVTdZ?=
 =?utf-8?B?Y3FNMEZKSENRcHFIOE1uSzAyb3B5WTJsdjlWQlZMR1pKWDdTSGtsR0JCaE91?=
 =?utf-8?B?WDlOZU5ZR2lSS0x6aXg4UXN1eVpHL1pPUVBIM1VLa0VmRitQcElDa1VWY2o3?=
 =?utf-8?B?d0dEdDdacGtEWDhPL3pJd2ppaTI1dFg1bFkyTysybTA3UjBtVm11VUw1V1FX?=
 =?utf-8?B?anBMR2RmS1JHU0E1UW1jNkhjb2dxZjR3TVUzRTV5ektCTDB2SmxGeFpxdkdV?=
 =?utf-8?B?U245d01SWnNhYjVpSktubnpGTllMUE53Tk1NS0syQlYxQTVwZW83NFlUYkhu?=
 =?utf-8?B?SzdBazllOUpVWHBGcE9TVS9vdGZ4Rk9vdmxwTlBpb3NqL2ZEMC9oelVDVUkr?=
 =?utf-8?B?dDIxa1YyTy82Tk1IaWoxbmZRKzZZWHFUWWtDWStVZzVSbUFpcEdqUXBnWU1l?=
 =?utf-8?B?aHVnL00rYVdqcFRhaENmZVRaaUNTU09scGdVNjVpb3N4cmJaQjRaa3RHZDJE?=
 =?utf-8?B?SUlhWGg3aHhHNG5aRUVCdWhiYzBFZHBiY2VKbVZnQ1Z2T0xrQVExd0tBWFNZ?=
 =?utf-8?B?VFYycUFJTDBIanV3VWszOEdyRXdUODAzUXpKWFk5bERLRHVBOGRmelN2bmcv?=
 =?utf-8?B?SEkyZlA5MUIrbUc4QmJhSXRkRmNUNU01emtPVVk4SnRNMk5TQVk3U0NtMzJL?=
 =?utf-8?B?VGhWNWt6UHNlT2JOeU9Na1hzUmZ0cjdlendXdXQxSlBtNjB3VzhkNklWMXVI?=
 =?utf-8?B?d2V6YU82S2FrRUwrTHo3c0o5eHJ1L2pmQk5mRG9KR2N0NGhaUFFoZDgrSnhT?=
 =?utf-8?Q?71ZVnfGJe9EQn4Atgrq15N/Pv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcfb263e-9c5a-4ed8-8832-08dcde3290e5
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 13:53:14.1916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8gR683VcPnN1C9VwK3lSVrVN9K4Mfrc4LAh01HyftmS9X7jgWkdFEpGt2A0ZldmfekeNPsvhRHn+OZtgNAZOMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6104
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

All failures is not related to this patch.

Regards,
Zhanjun

On 2024-09-26 2:32 a.m., Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe: Prevent null pointer access in xe_migrate_copy (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/138889/ 
> <https://patchwork.freedesktop.org/series/138889/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/index.html 
> <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/index.html>
> 
> 
>   CI Bug Log - changes from
>   xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b_BAT -> xe-pw-138889v2_BAT
> 
> 
>     Summary
> 
> *WARNING*
> 
> Minor unknown changes coming with xe-pw-138889v2_BAT need to be verified
> manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-138889v2_BAT, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (9 -> 9)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> xe-pw-138889v2_BAT:
> 
> 
>       IGT changes
> 
> 
>         Warnings
> 
>   *
> 
>     igt@xe_pat@pat-index-xelpg:
> 
>       o bat-bmg-1: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html> (Intel XE#2236 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html>
>   *
> 
>     igt@xe_pm_residency@gt-c6-on-idle:
> 
>       o bat-adlp-vf: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html> (Intel XE#2468 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2468>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html>
> 
> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   * igt@xe_pat@pat-index-xelpg:
>       o {bat-bmg-2}: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html> (Intel XE#2236 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html>
> 
> 
>     Known issues
> 
> Here are the changes found in xe-pw-138889v2_BAT that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@core_hotunplug@unbind-rebind:
> 
>       o bat-adlp-7: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html>
>   *
> 
>     igt@kms_psr@psr-cursor-plane-move:
> 
>       o bat-adlp-7: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html> (Intel XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html> +3 other tests pass
>   *
> 
>     igt@kms_psr@psr-primary-page-flip@edp-1:
> 
>       o bat-adlp-7: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html> +1 other test pass
> 
> 
>         Warnings
> 
>   * igt@kms_frontbuffer_tracking@basic:
>       o bat-lnl-2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html> (Intel XE#2235 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138889v2/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html> (Intel XE#2235 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235> / Intel XE#2548 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * Linux: xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b ->
>     xe-pw-138889v2
> 
> IGT_8032: 8032
> xe-1976-88d592f72f7bc508d6a027b1f96aa2e53f803e1b: 
> 88d592f72f7bc508d6a027b1f96aa2e53f803e1b
> xe-pw-138889v2: 138889v2
> 
