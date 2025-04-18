Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6BBC369AB
	for <intel-xe@archiver.kernel.org>; Fri, 18 Apr 2025 22:49:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4838810E2D4;
	Fri, 18 Apr 2025 22:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lO2XWjjN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB3510E2DA
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Apr 2025 22:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745016556; x=1776552556;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aeFsBj3SHAy1OV7/jtsLFUTaQ5OhKTieRyuvOgBCdBQ=;
 b=lO2XWjjNy15heDNvf88X9DEKa0YxzfcdLDm1fdXFv6p8aw9Mnaf4Ims6
 izxncJTvzOxgtkjkTLlI52o3A8etZBA7+R0tGVTha5gH0j9N4to9XdwL0
 YEOY1ZoFA98t/X1qTl6lJ1aWl1xAAWzsEe03Hm5na4JA/4Vh7oDi5uR2R
 b3/mYE9in/3BEBCdFOTzPj/RhY1nUQI/jBOVGKyc1haJzZypSGONHO/zy
 uCZsyGWJeKLz2Cz6JVGtIJ2CyX3GY71ZugznT3u7PPyaDFF1I6Rtk2IQC
 Wy2+YIVLOijPRWqXSY44trD1m+V7gj4A8zSj8vie2wM9ohLtCMy5D21Tq Q==;
X-CSE-ConnectionGUID: AaiP3GQ3RsybGRxontxsqg==
X-CSE-MsgGUID: 6k60CTv8SHaFG+ToFmC7lQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="46569891"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="46569891"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 15:49:13 -0700
X-CSE-ConnectionGUID: NFxiCkwWQfCfswnPXrYroQ==
X-CSE-MsgGUID: z/Rkdpz1T52uzgHzDvIwZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="132113532"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 15:49:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 18 Apr 2025 15:49:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 18 Apr 2025 15:49:12 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 18 Apr 2025 15:49:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YWvMZTZoM+CRTVO8VTAKKkGSdGdmWfGh2p4doKZK2+Ft376Uizevt3P3iIM7dcX4WSKksI0f9Nxx8edg4+f++daKOjBJ/aoBkmd1rQhx1e3I4FtZWawghBlmsg+oj0JQH/zCrHQmiFfkqq3IFk/ZKBuKX0uRHlX9RBF6kmr28Ln43P4MBpIqazsUhNUGTL/c/QpGjKhfL9DgmBu+ECDbCdKKYwpIiozIQ/BRw8XrvAI7xMuGJj8KFKfytsUz7FhTeneCw3UbXtzha1fos/0yRGoKKOjKcRSEfwQ+7Kf5O4BUDwtD9ZiGU1Fwd/wd+0QfC8rnk7gn7BqLtvfzSbbA9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjyZUlkNqyBtP6/VgPVOgit9VWRx2HN7zyncQQIOgzg=;
 b=AiYxsWa56m54i0PffAXQNP4TJoYCoToTCOgDd69F+GzBO3jnS3UGfqd4REmmt0VYYr685ev5vC+idfbrS+lON76fw9BqlDVPHjDhfSdQXPOI1cwcJIpH3khMaMo7oqZWIe9gGW6xVrh8dbkZD9Y8clmlwKR+XYVpbHqK9Ae+c4ekdBkQJePwhdUuzs1TmC0/gvRjEZGsedzDXSjDGGiHakqeHIh87hTZwKwvmFWblUVaxCCuqmxPehbBlASs++tpi5ab153OQmec3/6L09WmDmSIAI0q3lYVyKW/Wq6I9e/sUEz5HOLWC62Nr3GOSpReVWJpzXAgI+w3yy6R4NUFRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7010.namprd11.prod.outlook.com (2603:10b6:930:56::19)
 by PH8PR11MB7045.namprd11.prod.outlook.com (2603:10b6:510:217::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.21; Fri, 18 Apr
 2025 22:49:10 +0000
Received: from CY8PR11MB7010.namprd11.prod.outlook.com
 ([fe80::5976:5330:937e:d741]) by CY8PR11MB7010.namprd11.prod.outlook.com
 ([fe80::5976:5330:937e:d741%7]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 22:49:09 +0000
Message-ID: <4768e762-f747-40bc-9c64-ada8effd1a26@intel.com>
Date: Fri, 18 Apr 2025 15:49:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [xe-for-CI] drm/xe/ptl: Update HuC FW version to v10.3.2
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: John Harrison <John.C.Harrison@Intel.com>
References: <20250415231610.1286014-1-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: "Narvaez, Jesus" <jesus.narvaez@intel.com>
Organization: Intel
In-Reply-To: <20250415231610.1286014-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:303:2b::29) To CY8PR11MB7010.namprd11.prod.outlook.com
 (2603:10b6:930:56::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7010:EE_|PH8PR11MB7045:EE_
X-MS-Office365-Filtering-Correlation-Id: 27694cd5-e655-471e-c12d-08dd7ecb3b4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDJaWDlzMHM4YVdCZXVsNC9HcjhReDNLV0tLZlUrbnBqYnp2c290VVZsZy9k?=
 =?utf-8?B?VlBVMjNmb0pWK08wWU9GcGZsMmFqbUNTT0JZRFRENWdRK2xvcHdFNlJrbU1s?=
 =?utf-8?B?Qmt1UEJBTnBFR05SUGdydmRlNitxRUc1WFArNHZINWpCNmNHWldLY0wydlY1?=
 =?utf-8?B?VFIyMS9hb2FQWnNOTktiQUlFMDBHTUJzWEtDMC8zYTc4cEhyU1o5TmhYOExq?=
 =?utf-8?B?ZjBlSTJxVUt2MnREUmp3TDg5d1ZKMVg2dWpPbjMxay96ZXlORElKcDNPd3hk?=
 =?utf-8?B?T3ZsVjVtak1Kb1EvS2sxL29OTkhnbVZ5bFR1cmxreXAraUlhejFRU2pLS3VN?=
 =?utf-8?B?RnU3bTNYZEYrUVJ1aXJUaGZKQ1JzQXczUlNhM1JHYWZUc3F3YzlqUjZNSkEw?=
 =?utf-8?B?NVVpTXp1b3Jad01PZnJOMEF3bjhqOHFIK0tFbHY2WlMvZ1FxRTlLMnBxL1R3?=
 =?utf-8?B?RGNndVZUODZteWRmNE5yNXVQRmx6aVJZdkh3a0Z3L0NnbVgzUFRtaThWMSt4?=
 =?utf-8?B?WmFab0twSVk1cTloeTY4eVlYQnZGRUxCYVBjQXp3cHdCQnoyem93Ky8xKzdW?=
 =?utf-8?B?dm9PYm9JQ1dLd1dWMklKc1NyeXVqN0ZlVW1nYWJockZ6V1Y5ZGUzV0JoVFpL?=
 =?utf-8?B?S21KeFd3SmtGYkRacFZUQTAzRGpwUnA5WVoxNm5pdk53YnVTazYxVlFocTJl?=
 =?utf-8?B?QkZ2QTFDSVBDR3hua054VWk4ZnNOcmhIOHQyWGE5WFVWMmRCMk1NZUQ0eHBy?=
 =?utf-8?B?UUNEZTZFTEJHQ1lKUWVkMUtScHV0NmNBN0xDUEFyOEI1NHVYWkhqbHM3WWNN?=
 =?utf-8?B?YWxJQXJFLzdHclFEbVlveUxtNk8yM0tFS1VqTmZQSzBmcDZBbEhUc0lRV3Ro?=
 =?utf-8?B?NnJ2ajhlTnl3ZFMxSjFDZTJQNXlSV0R2YjcvSTNGdHZBWStFMjZKRVB3Q1lm?=
 =?utf-8?B?Zno1dkJYMm9YbzVLY2YxQkt5TnphSW8yRUJWQUFrWlFzdWloRzB4S0ZGSE5Q?=
 =?utf-8?B?SzMyTXVCeG9nZmIyZU9paDVRTHoyZmFIb2tTSWN3QXFwWjlCK0FXVDc4eWhG?=
 =?utf-8?B?S3dyV3BLN0JzL2dZcTVLOUI4VFp6ZmFYbnk0UTJuUGo3RGtwT1pjNWQ1djYv?=
 =?utf-8?B?dGx0OFJMdENJNWV6SUhSNmtzZlNHRDRwOFVFaDlzdk0wakdXbE53L01zeit1?=
 =?utf-8?B?bnc0bjhBcWwrV1RreVlTNVc5S0JkVkNQaGZteHlmTmszODZjUHc0a08vOGpp?=
 =?utf-8?B?UmRrMVdrdk5UUHdLSzBaNWViazNnRE81c3BTbEc1OWxmbm1FaHIyMjRiWFgy?=
 =?utf-8?B?Qlk2ME5FbXZ2ZzdxRkI5RDNKdG9Ta1hmUXN0ZjNld2k3VERpeEs0T2lJTTd6?=
 =?utf-8?B?dUdjSENSV3pIelVCRTVoaC8veFpRYStjTXBJbGJCN0x1S3BTblB0bFBKR1Bo?=
 =?utf-8?B?ZW9reHYzWFZBMVozaDF4UEtoSjVzKy9TY2t5WWJpOEhmcUltdUhFaERNTFpx?=
 =?utf-8?B?YWN1T1k0MWpSWGxwK0t2ZWNXQ0pPRUI4TGlSYW5SVjQ4WjEzQThMMEZRRVN1?=
 =?utf-8?B?Y2RRdUJKZjZzd3hWQmIvMEN3YkdkQjltNEJnaTVDUGdlSEcrbWFqVVROWFBI?=
 =?utf-8?B?cURvQm95bFcyekxtcTViUzZlSzV0WWhUSE1JWGpmUUpSWVVHUGdSM0hpNjc2?=
 =?utf-8?B?b2tUbUhNU2pabFNOdDlIMDJrcytlS3BPSFREdklsdENYZitDdE5JV0Q3ZlJ2?=
 =?utf-8?B?LytKZ0Y0aVpOdzFXdVc0UmpvVWNoZnZ5Z28yZGdpSElLOTE3M3ZYNExiUG9Z?=
 =?utf-8?B?enFQL2lJem9xZmNnYWNvNWNTSDhTQ2NmZ0JhTWRDUVNITE16SVVRWFNrT3ZI?=
 =?utf-8?B?eUMzUTc4ZlovQVM0Z25VWDl2MUVrNmRTci9TNEtpUFdla3d6MWxYTnpaM2dE?=
 =?utf-8?Q?4mgA0axxGQI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7010.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHV0QW1yZnVlL3NRREtTc21pTmdCQkNlZDFBZUFFQ2pQU2x3RmJ1RDNCQnR3?=
 =?utf-8?B?N1k1UDFUbEdvdlQ2ZW85MkJ6TVRKaUhTNDBENFE0ckU2SkN3S05XNVphUkxR?=
 =?utf-8?B?RDZxU2tuUjRSbnN1clAvNzlLTXBJM0tKd3ZnYVd2SFptbVRaRFIzeUlaelhz?=
 =?utf-8?B?YXpaUDB3R1AvMFI1eENTV0x0T0pNNEg1VFI3NmVFd0x3QUZIaGFaSlBjcGFa?=
 =?utf-8?B?b2cvVnp4TCtRZGNjVDNSbkNPR09BUldmbEx3SzdNRXFWZ3ArSHBZKytMN2g4?=
 =?utf-8?B?bzJnTXhFV3RVV2dTcWN0YVUxYW5LRkxVWGpOOHQzL2s3L3FJcEdhYXJlT2RO?=
 =?utf-8?B?eFpwOGtKLzh6RzNsaDhsWkU0NFJSY01KcDQwbmtKY3llZGMweDdTY0ZweTIy?=
 =?utf-8?B?Rzc5ZEdwTGZLMXlvMEMxUU83WVErOW82SytTbzV1a0JkZnd4bUZrOVh3d1pV?=
 =?utf-8?B?MUJ0ZUZ3cEJJdnZ4QnBuK3hJL2tvYUhvVDNzVFdaeGhYZFdIODlSSEI5b1FF?=
 =?utf-8?B?QVZqeDhYMXVaL0hLeERleDc2K2s1YTB3V213Yk1SZENWNUlUWC81Tm5jNkFv?=
 =?utf-8?B?cENVVEcxLzh1T3RvZWpxaEVQU3ptamtsUDI3OElrR2k5SmQ2OEhNdzJkcXBk?=
 =?utf-8?B?YmU4dVdLSUczdjZPanNUa2VjSWVmd2o5aW5kNVBXMm1wc0tnZWpGSlIvQkxa?=
 =?utf-8?B?VWUvMVNnY2ptNUFCRnQ4VzREcC9hT0pMWE1abUhZUzZjZDQrdEhZaDBuSzZC?=
 =?utf-8?B?S1F5SmkyeGU3ditJMHZtSXBVNEluc1l0WldtQVFMM2ZTc2gvZWdsN2lCdUhS?=
 =?utf-8?B?andCWEpIRVgvTFpXQ09udFpZVmZpTVRMSG1OeDZWYUJvR1Frdno0bXdOZExG?=
 =?utf-8?B?eTFZOGZVQWVPalVCZ2tFblVWZktndHIxMlN5UnJjWmpJL0x4U0Q2VDk0eVNm?=
 =?utf-8?B?cittOTBDTTBBZ3l0RjhQenJZWEJ2cTNjUWlDMW9SYlc1WFNkZDJMcko5azIx?=
 =?utf-8?B?UzhpcmxYR2VHcXd2VHdlaUVoTjJHbnZuclJrUWlVYk5Zc1d6a2FsbTZhaHFX?=
 =?utf-8?B?UHBTWEVQdE5zMnkxRkJhMVlYdENDbHBNUld0VWptRHc4SmR6dXhQSEtFbmFp?=
 =?utf-8?B?NFJNZU1lYmVoU1g5UlBsTi9PeGQ1ZmJZOVR5MWFpcnhMczlyWlArUm1zMVI2?=
 =?utf-8?B?TUsxYm1NeXc3NWE0MFhVWmF1TUtkbjQzVDJRZkMrN01ubk5IaTJERW5aemZW?=
 =?utf-8?B?dDhjSWRnWHIrK2Jxcy9ua0M1c0JUMFU2SG4zVHdFMGhCQTQ2TmRRZnFmSjEw?=
 =?utf-8?B?UDFrRVdGNDNHOFVsb2YzbzI2REpLV1NSOTlvZ3M5T3kwMlovbFBuQ2o3cFNo?=
 =?utf-8?B?NnJRWjNzSGN6Q20vcURkQ21JZXFrZXlYL2NBblZkKzZKZzhvZjVDRkwweUtz?=
 =?utf-8?B?YytoL2U1UkdhWDhkVUl0U0F5TFZQMjl5Ky95OFZrdDl3VCswRlcyR3ZROWtx?=
 =?utf-8?B?TEcreXBmMW1HZXEwbzZXRkkrbGZjN1NrdkExeW5TYngrMmppSlVieEMyMkM4?=
 =?utf-8?B?VWVrU25UTHhIcFBUdWdxQ0VWekNkaGVLMDBTSXZ5am52dTA0aGZIbnlNR0hO?=
 =?utf-8?B?Vm5hOXVQZE9JK0dPSTE2ZkdKRFo3ZFJJQStWaTMvUWdDcXlHaUo3MW5ZY2w5?=
 =?utf-8?B?R1lwQlJ2ZnJCRHVESTIwZnpWTmM5aFJBd3A5T0Q1V2hNVWNsSjZ6MnVCaHov?=
 =?utf-8?B?dkVkdmJaTGV6bGlGZmpKci9DL1duR3pRamtUSWpqa0FxU1lMME9qVE9kZW5n?=
 =?utf-8?B?Y3paS3pSQ0djVzlNNHZGdGRuT3B5Y25pY0tiR0lidXBVdEl5clNRd29RTDZx?=
 =?utf-8?B?NG1RWFVaaGo0N2JJY2dIaDN5VEp3UmNqOXA1QnRteVFvUU5XT3BLSFo4aWtU?=
 =?utf-8?B?Vk4vRHBwNm5Gd0IrUUYzRnJVQVgrUGI2bTFZTVZLamU4RE8wdjczZG9JVFV1?=
 =?utf-8?B?V3BueHRKNmc3VHBma1Q0VnBtNExEV0QyM283c1l2L3NkWjFNSEt0blFlcEhM?=
 =?utf-8?B?WFNZY0djT1BSYnI4VzdkVDNBRGM0Um85QWQ3RXR6ejBjQStPTVVrU3B5MFlu?=
 =?utf-8?Q?3rqafg2PlNyEtaIbPUrS6C+No?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27694cd5-e655-471e-c12d-08dd7ecb3b4c
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7010.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 22:49:09.6478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jtiwBxIRmPMyh95PqOb8Ln/DPT3FSVEE9tNYbEdhlZbcWTL7hXkAdXoKMKIApapcNJYmwPTnZMlhEESoyjvOGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7045
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

LGTM.

Reviewed-by: Jesus Narvaez <jesus.narvaez@intel.com>

On 4/15/2025 4:16 PM, Daniele Ceraolo Spurio wrote:
> This is the latest version recommended by the media team.
>
> Note that this patch should be squashed with the one introducing the FW
> definition in the for-CI branch.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 40d48da19243..7b2d01d39b86 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -128,7 +128,7 @@ struct fw_blobs_by_type {
>   	fw_def(TIGERLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))
>   
>   #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
> -	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	huc,		ptl, 10, 2, 1))	\
> +	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	huc,		ptl, 10, 3, 2))	\
>   	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	no_ver(xe,	huc,		bmg))		\
>   	fw_def(LUNARLAKE,	GT_TYPE_ANY,	no_ver(xe,	huc,		lnl))		\
>   	fw_def(METEORLAKE,	GT_TYPE_ANY,	no_ver(i915,	huc_gsc,	mtl))		\
