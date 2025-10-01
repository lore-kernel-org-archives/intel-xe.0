Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CEDCCA470
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 02:50:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471F410E2EF;
	Wed,  1 Oct 2025 02:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O1P2hoJ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D9A10E2EF
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 02:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759287023; x=1790823023;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=X1Fi5LLtdXRPnMvOf1M1GKpPCeabYC+x1Qp0lIVIBGA=;
 b=O1P2hoJ7dl7Vs/7fU2PmK8KikNkB3u58m78L5ALUmEaG2zGZxq10uRFN
 PFN43vMqG251/3mdfCNEYuCG/OswSVVSTOFTUggIBM4zCSmNAHqhkS318
 NXdNwAINI0gUpJ9YarnaTO079VPVhu/iLYyoT35zNRPtxC1gkT8OiBxns
 1lu8Ya33BSCOF6nzvhWu0pUfiYbuIeMKqb0v9+PHXSuYHBF0QH87iMqZd
 GwdxtM04G/UinL9N3e1Gj5LZ4ltQXRww77WOiyNtQDQilVW51gqy9cyxa
 3iS8Mi3OUuZpOjaJwFhA0SgQ6ztfqvLMH/qZ4xRi7kiw+FHn9xIQYGbDr g==;
X-CSE-ConnectionGUID: bKyTyNYGSDeYDmRhImuQ6w==
X-CSE-MsgGUID: gP7c/pWURuCZPl199KCdQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="64172660"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="64172660"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 19:50:23 -0700
X-CSE-ConnectionGUID: CnqeM8Y0R5iqPKzPz5+qAg==
X-CSE-MsgGUID: TYGAfn9lR4yYCL6Y0mdKgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="179094024"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 19:50:22 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 19:50:22 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 19:50:22 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.20)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 19:50:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KUyIkyiIVDpjVykM6iL/EaJ1+OvpJHXV8uCyEGneslbBriw6AK5z1YL4jJ2im2JP7EB8qHpdEDLqj6FEM4ptpPJIM/fNq5lVlVMp52QX+GeqWcnuBU8GYwd5lIsvW8FvQfat/svrf/KqBMj/5QWtFgt0kH+CENSAXN8ZuAQZKGdbmE0rcfPXOxyWY1VswQGBulDu+4e0/dzTEMfm/werssGVkSCwOwhzsf6fjsKrt1G2TUp+TSwAufEEz9B89GQmeOXcXsvgQ8ePiHy9o5i8pbNfIWTlezkbfPY4ja6TYHaM9ehXKQBVgCC8pm9/1nUA7xB3anx6ReW9TZCrlwncZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08ERsT2lAkVbbJlKTEib11aMSPoz15jZI2gDAIeNcuE=;
 b=eJVoIMAaGqlN9V+QFNnoGZFYN5xjgxyjeCFQZTtNPMToSN7ZIcO+oS4i/KVCfIRQafT+BW50iBgijKrLL99gBsAbMgP77l4tbXJhgNMjiTSTptPMfJuAtecwX5oOSbUoN5IOKZiHB8Hj8mWQ5Uw2lyzkGutRMUFoL31Q737Tf4W0bqDGellz/KBZSiRbpBEeuUyshaahqFbIQx3RChEMy+CGUL04jB8mYwGTrFxBj4tkIuyM4w2zfefaUamFb6w6ml/W4Npt65yXNIt3o4wF5N7LPWGskBduHntH0kM+FSFQx73wDLUY9Gy+XysD+jezKMvjN3zKr0oqTzHNMslLZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4936.namprd11.prod.outlook.com (2603:10b6:510:42::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 02:50:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 02:50:19 +0000
Date: Tue, 30 Sep 2025 19:50:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v3] drm/xe/migrate: Atomicize CCS copy command setup
Message-ID: <aNyW6R8KbcMR4HNB@lstrano-desk.jf.intel.com>
References: <20250929164507.2593639-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250929164507.2593639-1-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4P223CA0024.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4936:EE_
X-MS-Office365-Filtering-Correlation-Id: 75e4110e-8abf-4868-d775-08de00954255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nkd6NlpSN21SMXBCS2R3Z04rZ3dSMXB2ZG1jakU4VHJYOUpOb2x0WDI4Wno2?=
 =?utf-8?B?WkUzd1JiaDRyelNjZDNBc292THdCVXJINm1RM1ZYMXlwd1VDSk1PbFlic3do?=
 =?utf-8?B?b2x5MlZTV2paOW1aYjI4bzJjenprVUxSVTZ5SU1OS3lNeHBkc3M0K1ZIQWI0?=
 =?utf-8?B?dFJDK0VyZCt2WkdjcHNnWC9DVGZ4dm5xS0lpVEZmSHJCZGpheUl6WXUxWEUw?=
 =?utf-8?B?VHZOaEs0V2ExYThYamhVSUtpamc3aERONVpMVW5BVEhQRG8vN0tMT2JOVis4?=
 =?utf-8?B?WGpHdVdHL2VpY0FqNzlKZkRLd0ZDcGQ3cnQ0aWJpV1cwVVF0Z2pXeFU4ZmVN?=
 =?utf-8?B?WWZoY3J4eGhEQ3Q0bDhQMDZjTXhWQi8vekRqT3dNemQ1SDZRVFRuTVcvaWdx?=
 =?utf-8?B?a2hJdVlBbnQ0MVQ3Y0FyZDFqWkE3bXlydmt2Qm8vMUxVcEZ6d2I1TkRPTmQ3?=
 =?utf-8?B?TWF5bXdVa2RlWDU1eDZNQXNFaW5MS3pRNmZHRnBzc0o5RDIrRWhoQzF6bUVT?=
 =?utf-8?B?V2craDNpK08wc1B2TFdmaWE2dlhnVHQ0alMySXJLQU83QWVGa1BuMUlBWG9I?=
 =?utf-8?B?QTJ5dTFzRDJYejZpS2U2VFVmZkh6WDFYU1pOQ0JNUVlwd01RTnZqd1FicW9H?=
 =?utf-8?B?YXFPbVNRdlA1eDBYdEtyMStGWTlyUFdUc0E5TGxVRHlISzQzQ1pHODljQ2x3?=
 =?utf-8?B?LytrT3RVc0Z4OEVhYzcwR2hUaGU5MGd1a0dDSkg3K055aDZlb2NtWDJtbUZF?=
 =?utf-8?B?dEdOTmZGWTJ2RlRHOTdXV3lPSkdkN3VjdFVreUFMMk5WVW14azVZV0VWODdZ?=
 =?utf-8?B?WHVtdTFHMzJ6L21yK3JYQXRFS0EzWldpcDdxOHBLQXJwZHVaOFdPb1lTSFNI?=
 =?utf-8?B?RitjbXdaUEJ6M3hXQ3NsSHVoblFOZTdrRWJMSXRTMFY2QVZmYjFDaUJjRGlX?=
 =?utf-8?B?eEdaVUhXck8ySW41UlpRUTVEMDNUZlJNbXdDVExFRU1wSDZLajJWNjdoN1d6?=
 =?utf-8?B?MHJGM2hoS0RkZlYrL01KMmw0RVpuTWdxblIrRzhWd0hLRW9DWjlWYWxqbHYy?=
 =?utf-8?B?MXk0WUVHOGdYOHg1TVdYUlBxUmZTMHRYdy85WTQxZWJUWFpOa2hrWjRVSFlk?=
 =?utf-8?B?ZG1JTzNHT0hBd0paVXNsWHpSakNpbjBNV3B1TjhNOG5hK0JUbmRPaElSNE9F?=
 =?utf-8?B?bHJjdUZ2M0Mzbkp1ck43eVhTeVlUMWhZSTRwYkE4Rjg3eXdZazFDeWt4Z0Jz?=
 =?utf-8?B?TjJKRzFncC9LUC92VWlsczlRN1Aya3NmQWJDVC90aXZES09FR1p2T04rakw1?=
 =?utf-8?B?UTd5NTg4SGV6ZTVQSG15aHJwNVUyRWYrRzdxUDBOeWVXR0xSdW0rUkYzTlpl?=
 =?utf-8?B?WWkrVFpyRjRTS0VoMFhhTU5nQkNMeWFMcjZmVXNWbGVZa0hFaCtKZ3BVc3dt?=
 =?utf-8?B?eHhJQkFiV1FDUXZydlpmM0JoU0htdVFBK3c2dE0vdUF5K2VDZUhHa0ZZbDJX?=
 =?utf-8?B?WFo3WUVNTkpHUTRwRXZ2SGlsTDRJMWtKVENaalJCaFZTQVdqVHZGSEpvSHRy?=
 =?utf-8?B?bDV3RllrVUkzL2NYQkFrNTFXUkYxejZJL0Z5UTRIVU9HemxjVHhrK2dKUFVl?=
 =?utf-8?B?d1B5NGd4YTBxMHlSWTAzZDhNR01lWS9pZ3VSaDVXTUdoT0UrY2trd0hGeFNF?=
 =?utf-8?B?OXpJZS91ZWtadnFIOUlzRW5KUE5hM2UyYm9KaWllbDlaLzNSOXdHWXEzeFpB?=
 =?utf-8?B?VEZXSmZLSGFEZU5ER3hVVENCbG10ZUNVWEI5YVZpaitQQ1M5TUczUDhGbElT?=
 =?utf-8?B?UFY2ZXVLODVPMk9HMmdvR091SG16aW0vYlpXcW50K2ZzQmIxcDhZVVZYdkpw?=
 =?utf-8?B?NjBEdmxDMVFGcktUeUxQOC9tVS9EZVBvL1VsTlc3dlZIZW1mNTZjSkMxWmpP?=
 =?utf-8?Q?BQqu/KHl2sotZMCQOEVzagGmUerPKNao?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2ljTGEwL3J0VG1qVUhtLzFHaHhQc3RidTR4SGc1NnFMQVQzMXRuY1JGaHdW?=
 =?utf-8?B?c3pocW1USE9Pcm9NVlQ5OUFkV1d3S1lONERHMnoyeVJlU2xGUEkrRnVPV0xu?=
 =?utf-8?B?RGpxak5pZHludWVZR2dvdW1rKy9iZ1hyK0QyR2dXd05tYUQyVjBkalhNcGZj?=
 =?utf-8?B?bXNTdEMySnArb2lEUWwzVHFwYzU0NVcwblFmZm90aStNUHVMYUU4bnVJbWRI?=
 =?utf-8?B?VGt5RTM1bjhHNGFLRFF5dEc1Sno5a1MzU3YxQW90azArRm96M2hmOTBjcW9I?=
 =?utf-8?B?M1oyK01pSW1iUDdiLzJuWVFSM002bnRuRmVLQ0l2VDB2Ti8yTWRiUncweUJ3?=
 =?utf-8?B?MFRtVVVnNjN1TW5qaU9LNytFK3ZqdWlkT212SGp1dFB3S0N5ZStvdUZYM1FD?=
 =?utf-8?B?U1RQUUh6cUh0SXNGNXRRWUIvL2JxZFE2c25IU2lRZkw3S2NJUGk2ZmFuMkEw?=
 =?utf-8?B?MFJGUlZWd0hPSzVZbS8rTm5rZHM1ZW9PdGI2N1Aya29aV2dHQ0JkaVpEZXhH?=
 =?utf-8?B?L1licGEwakxVSzN6S0tPVG5QYm5rUTRPZjB2Z3NZOFdSSTFwRVhGdFg4UnVr?=
 =?utf-8?B?NFVvSmNXU0s1aEdUWXljWmdzUElpeUtVNzcxMnBlU2orNUozM09DZXg0b2ky?=
 =?utf-8?B?NnB2aXdCb3k1WXEyL2FFQ1Q2cGhnZTk1YmloWUdmRHFpc0crU0RURERQWktz?=
 =?utf-8?B?eEVoamUwcFpnK0JZTFRjSkFFNzM3d0djWG5RQlFmUG9kaXQ0a05tVTFhT21h?=
 =?utf-8?B?MUF4cmcwam9WME1mdkVMZDBkNzROaklHQWpnWDNjeElSeXliTFVtdkpkcnUz?=
 =?utf-8?B?aU81MXBOMGhjRThzVGVpVlFKU3BnT2lYRUlsR05nYzd5V0t6cU5ObGRZSERH?=
 =?utf-8?B?cXpqcjBoRmgxRHRXd0FzY0FjajJSaEtNSHEyVlpMQVBGeGFoUENtRTNHWU01?=
 =?utf-8?B?VUhmdmgwaEdVUTFoZTFqa0NjY1hVMW01eVI5cUh0RnNkRDBwVTVGbFFQaU83?=
 =?utf-8?B?VjBwR1FYTi9TWCtPcC81eGNFaXRYNkd6a2ZhUWI2cUdmUm5JV1cyaXVpU1Y5?=
 =?utf-8?B?L2FTMFZzaksvZTFxdU5JYUJUZmE3RGFqTjE4L2wydTBLNFBKbHFkUU5YRUNl?=
 =?utf-8?B?eTdVQzhQc3JDejhpS1RibDBjeDlFVlpMbG51elllUG91aE4rN2YyTkNCWC9G?=
 =?utf-8?B?eFZZQVgwNzVaWjNoSDg0K3lzaTVyR2tzN3N2S3AxQ0p2NGtRdlRGN2JsOEo1?=
 =?utf-8?B?eEZYWVhTZG0zTXE2K2hBdXRCb0NHdGN2TWVMLytsWUVPdDAwelk5UnhlUkV2?=
 =?utf-8?B?eGt5bU5CZ0w4UHJvbnBoMVdJL1NyLzFMTGRKYkNkNWdUdkJ4M3dVVlZyRWFh?=
 =?utf-8?B?em4vQno1K2FPbHkzbGdaN0FybVRzZ0xiVG1xOGpWYnRHQzNlS1UyWU5MWHU0?=
 =?utf-8?B?dEU5V05BeGZvSGh5UlgzTEp6V2t0SUFia3k2ayszV0k4d2toTjVaNGZpM0Nr?=
 =?utf-8?B?ZE9qaWdvS2tFMTZOc2RNVGcvNGFYOVBIRVBOeWQ2ZE1rNTJnc2FUTC9saEtU?=
 =?utf-8?B?ckl5STR2WFVlZVcxYmpBWTc2U2RlSGhkVDFESkFuSzhRRkM4bnJ5aWN0Q0FF?=
 =?utf-8?B?MTFUeXN1dmJiMnlkajd1S3liU1ZYdVFOWjRHSldVM0VBSkNvcGswenphTldF?=
 =?utf-8?B?MytMUG1Samh6a1NrWFltdE40ME1nN1BjYnNCMFhsVDhpQTBocXlDdkx6UHhK?=
 =?utf-8?B?S2YrOFd4MGFpcFhDblFuVVVwaUMvT3UyU3UyN0RJZHpCUHNFNm1qUWk0RkdR?=
 =?utf-8?B?NnZwUHprejFuWFhrT3Fvb1F6YWZYTGJXZDNQNjBSa3VkY3ozcjVjZlRZWmdN?=
 =?utf-8?B?NVRlWUtwdUJwQWtqUE1hYUdsMHVYZjJxZWdVQ2RJUlJnQ0RHbTgvSGdpa0N4?=
 =?utf-8?B?RS96bUtFWFF0OTQzb2lBanFvL1dRUDJyQjhvS3RsQ3NNeFgzMXQ0eGF2RzN6?=
 =?utf-8?B?L0dFQW1peURWdVYrbW1jRDZBWG5GaVdFYjlWQ2FMdXUrWTEyVjVjOWx3TVdt?=
 =?utf-8?B?bXJvYjNNVlI1azhnV1B0RFMvSTdxOE55Q0NkN1JoRlMvbTNXa0p3MmNsTkV2?=
 =?utf-8?B?R1VId29uZXJ1dzhrMzk4S0lBVGlCc3dEVE9jeko5QWl2ZEFWTVNmSVd2aWhN?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e4110e-8abf-4868-d775-08de00954255
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 02:50:19.7193 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d8wZgxQL7OXpvqizrHdlxJtdxOpRuBaznSPvirDKG1FUg+BluFMZZnoaHERAmXw9gkywpUuNb2knqyqHG0STJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4936
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

On Mon, Sep 29, 2025 at 04:45:07PM +0000, Satyanarayana K V P wrote:
> The CCS copy command is a 5-dword sequence. If the vCPU halts during
> save/restore while this sequence is being programmed, partial writes may
> trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
> instruction to write the sequence atomically.
> 
> Since VMOVDQU operates on 256-bit chunks, update EMIT_COPY_CCS_DW to emit
> 8 dwords instead of 5 dwords.
> 
> Update emit_flush_invalidate() to use VMOVDQU operating with 128-bit
> chunks.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> 

For this series and the subsequent follow-up that addresses the inverse
side of the problem (i.e., avoiding memset calls on BB detach), I
believe we really need an IGT that focuses solely on creating and
destroying many CCS BOs in a loop, using threads to attempt to trigger
the race condition. With enough iterations, we should be able to get the
save/restore BB to hang on PTL.

Once the patches are applied, the test should pass reliably. In my
opinion, that’s the only way to truly validate the correctness of the
fix—it’s nearly impossible to reason about correctness without such
testing. So this is where we need to start: testing. This is almost
always the case with complex issues.

With that in mind, can we get this IGT implemented and added to VMTB?

Matt 

> ---
> V2 -> V3:
> - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
> - Updated emit_flush_invalidate() to use vmovdqu instruction.
> 
> V1 -> V2:
> - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
>   (Auld, Matthew)
>   - Fix issues reported by patchworks.
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 92 +++++++++++++++++++++++++++------
>  1 file changed, 77 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 1d667fa36cf3..a37d4cb28aac 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_migrate.h"
>  
> +#include <asm/fpu/api.h>
>  #include <linux/bitfield.h>
>  #include <linux/sizes.h>
>  
> @@ -644,18 +645,64 @@ static void emit_pte(struct xe_migrate *m,
>  	}
>  }
>  
> -#define EMIT_COPY_CCS_DW 5
> +/*
> + * The CCS copy command is a 5-dword sequence. If the vCPU halts during
> + * save/restore while this sequence is being issued, partial writes may trigger
> + * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
> + * write the sequence atomically.
> + */
> +static void memcpy_vmovdqu(void *dst, const void *src, u32 size)
> +{
> +	kernel_fpu_begin();
> +
> +#ifdef CONFIG_X86
> +	if (size == SZ_128) {
> +		asm("vmovdqu (%0), %%xmm0\n"
> +		    "vmovups %%xmm0,   (%1)\n"
> +		    :: "r" (src), "r" (dst) : "memory");
> +	} else if (size == SZ_256) {
> +		asm("vmovdqu (%0), %%ymm0\n"
> +		    "vmovups %%ymm0,   (%1)\n"
> +		    :: "r" (src), "r" (dst) : "memory");
> +	}
> +#endif
> +	kernel_fpu_end();
> +}
> +
> +static int xe_migrate_memcpy_atomic(struct xe_gt *gt, void *dst, const void
> +				     *src, u32 size)
> +{
> +	int instr_size = size * SZ_8;
> +
> +	if (IS_SRIOV_VF(gt_to_xe(gt)) && static_cpu_has(X86_FEATURE_AVX)) {
> +		if (instr_size != SZ_128 && instr_size != SZ_256) {
> +			drm_dbg(&gt_to_xe(gt)->drm,
> +				"Invalid size received for atomic copy %d", instr_size);
> +			return -EINVAL;
> +		}
> +
> +		memcpy_vmovdqu(dst, src, instr_size);
> +	} else {
> +		memcpy(dst, src, size);
> +	}
> +
> +	return 0;
> +}
> +
> +#define EMIT_COPY_CCS_DW 8
>  static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>  			  u64 dst_ofs, bool dst_is_indirect,
>  			  u64 src_ofs, bool src_is_indirect,
>  			  u32 size)
>  {
> +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 *cs = bb->cs + bb->len;
>  	u32 num_ccs_blks;
>  	u32 num_pages;
>  	u32 ccs_copy_size;
>  	u32 mocs;
> +	u32 i = 0;
>  
>  	if (GRAPHICS_VERx100(xe) >= 2000) {
>  		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> @@ -673,14 +720,17 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>  		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
>  	}
>  
> -	*cs++ = XY_CTRL_SURF_COPY_BLT |
> -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> -		ccs_copy_size;
> -	*cs++ = lower_32_bits(src_ofs);
> -	*cs++ = upper_32_bits(src_ofs) | mocs;
> -	*cs++ = lower_32_bits(dst_ofs);
> -	*cs++ = upper_32_bits(dst_ofs) | mocs;
> +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
> +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> +		  ccs_copy_size;
> +	dw[i++] = lower_32_bits(src_ofs);
> +	dw[i++] = upper_32_bits(src_ofs) | mocs;
> +	dw[i++] = lower_32_bits(dst_ofs);
> +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
> +
> +	if (!xe_migrate_memcpy_atomic(gt, cs, dw, sizeof(u32) * EMIT_COPY_CCS_DW))
> +		cs += EMIT_COPY_CCS_DW;
>  
>  	bb->len = cs - bb->cs;
>  }
> @@ -980,16 +1030,28 @@ struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate)
>  	return migrate->q->lrc[0];
>  }
>  
> +/*
> + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
> + * save/restore while this sequence is being issued, partial writes may
> + * trigger page faults when saving iGPU CCS metadata. Use
> + * xe_migrate_memcpy_atomic() to write the sequence atomically.
> + */
>  static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *dw, int i,
>  				 u32 flags)
>  {
>  	struct xe_lrc *lrc = xe_exec_queue_lrc(q);
> -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> -		  MI_FLUSH_IMM_DW | flags;
> -	dw[i++] = lower_32_bits(xe_lrc_start_seqno_ggtt_addr(lrc)) |
> -		  MI_FLUSH_DW_USE_GTT;
> -	dw[i++] = upper_32_bits(xe_lrc_start_seqno_ggtt_addr(lrc));
> -	dw[i++] = MI_NOOP;
> +	u32 tmp_dw[SZ_4] = {MI_NOOP}, j = 0;
> +
> +	tmp_dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> +		      MI_FLUSH_IMM_DW | flags;
> +	tmp_dw[j++] = lower_32_bits(xe_lrc_start_seqno_ggtt_addr(lrc)) |
> +		      MI_FLUSH_DW_USE_GTT;
> +	tmp_dw[j++] = upper_32_bits(xe_lrc_start_seqno_ggtt_addr(lrc));
> +	tmp_dw[j++] = MI_NOOP;
> +
> +	if (!xe_migrate_memcpy_atomic(q->gt, &dw[i], tmp_dw, sizeof(u32) * j))
> +		i += j;
> +
>  	dw[i++] = MI_NOOP;
>  
>  	return i;
> -- 
> 2.43.0
> 
