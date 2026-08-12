Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE75C5CFC1
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 00:33:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53EF10EDD7;
	Wed, 12 Aug 2026 00:32:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W5NHXPMm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D128B10EDD7
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 00:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786494778; x=1818030778;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pLY4wM+A5sSULct7pem156RYTgJsmAx2kNMNX7+pCqw=;
 b=W5NHXPMmsqj2d3wFYCov1I+hbdkIbO562TIpm4UNfkWPdGhIy1wYvGQV
 7c3LY3Bm8hI5X1BqlyFAg5ouSxztXLlLiYQ588aF72ER/JGPoEL1ZasOi
 ESHlovQxxlzcMBUg07cecYCbOWmQmNebuJsG5DQbiKrsOBCOrAJZCFMuD
 /pS6/57N5gEpwtOFZpfOHA/WmrfFsDFSXY2UX3kcYCNjg8vHj0S/lbKm2
 45mz8uiGLqcIECYU2bNAo4GP5lSZvwuNDe9qwAV/PGpngzEWccJqNniZc
 kRyvWilDgGcjPCAthLHSun2hHkt+NSGsk8xMBpAmJTXcYYa0/ozHTjtoB g==;
X-CSE-ConnectionGUID: S7SQZkfFTEOe57+O1lBJyg==
X-CSE-MsgGUID: RVa/qhHuRVy3y1pF5PsNLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86159451"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="86159451"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 17:32:57 -0700
X-CSE-ConnectionGUID: Jr3EPJZ3QQ6IEE/7IEzbYQ==
X-CSE-MsgGUID: nfSf0UeOQ4SzkVwKA2MxyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="262986087"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 17:32:57 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 17:32:56 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 17:32:56 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.10) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 17:32:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t7u8oaAoiOo0F3EcjOdhR6ftsn2rWbiWq6NKd8PvZsiFiKxE28XG2CoeGRwCdDdqDAChZNG4BclyDsYmf4q1VzYgo3t0ZPX7EEhNaAGVnMIkv35izCjQ+taruNKWDF4eXjIfJRvKYBxZLLjQTs480V4UznlyacHytP+hqV2LJ/oMDalczEdDPV3UKLjjQaT7ilKZ3aynuguAMJZid75hs2NuQGluc3ad1+wh02rXrNNM0/KkPkUhSYsQMzY0kozwURguLAcajT8Bi5wD93JkEO5Xrxk4tdhvWAwWNMH50FjORAzuF1B8O+Z/2OAusOwYkDn+nFig9/4GrGtHTwkMfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TzioGZQAT4IwBG+M5+cNUjDC+HZ6/zKnhjX8XGAeyM=;
 b=SdRw2E9GOGMkThMqEaz0iZanbCo9/jKiFRLhhRSJRAakW5t/u6C8Kc8bOw/mGLsALaXEhMeOjKWf1Bdju2kjEHlYQXrlG/3yg++nI03WzpMC7eiLFVlWF2pubK2f1luo1+OAKe2bXH6Bar1Dz/lxFCKAe2QybNtk3Kdt0242BkQM9CEOO9IUZf5EIsNEM6UYYDV4U+/xiLo6KrZA3qbqbLhkjzr5vwZETo/cEbATCj9PdmaOCY28dFKEQXjKoMl6QYA1OO5CPMkXe2/qADa8/5TzeOy5E/QclVRXpdvabQyM8xH0UfwFYkkh1iyxDEOCUwtOUW6r9mcmYudQZIF2nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by DS7PR11MB6015.namprd11.prod.outlook.com (2603:10b6:8:74::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 00:32:41 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 00:32:36 +0000
Message-ID: <fdd16748-4647-4172-aaa5-290a386f65ce@intel.com>
Date: Wed, 12 Aug 2026 06:02:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/23] drm/xe: Report 'device wedged' errors using SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-18-michal.wajdeczko@intel.com>
 <f219c563-7703-4703-a832-28da4a8b3421@intel.com>
 <2cf706a3-93cf-4f47-b772-c07c35e1668f@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <2cf706a3-93cf-4f47-b772-c07c35e1668f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::16) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|DS7PR11MB6015:EE_
X-MS-Office365-Filtering-Correlation-Id: d2a89648-e8fb-497c-780a-08def80934f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|10067099003|11063799006|56012099006|5023799004|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: pv8l51Ux4OTUU98uYBVyyzi8VRo23m8nIX/Vi1ltfm+3ZBrq2whuZDeKvRUNHVznWafrupQ8Zg+2xSB6mLbNxw5sKKNi9tmzy82MaAioy4f6Arti4n3rOK1KSuQUfZfUWISeWkLKN3fD8AifofmU+VKF2BMj9BAIJKUHMGUrui8vMJJCYIfk1ma5eEu8OiS8+lBSK8+voFjnpyO1pnQkBVbqBhrV8AvxBTmyNcGQbv5+2+vTwgqMol08FLpnvtvTpk5LzO7D/8w39pwpXnE4TJOi8yoLGU08AWVrdc+VZ4HsrIP+LZzJBCksgKBdwgxmgTwMRA7o1yDW/8PnIY7PAKxifT//TYXPtFr5FvQ7o0IynHOi48dlBO7w54VeaLaSSDQVaIGbcTiMTVNx8DhoQs+sWFIcuOhPE2Acvn+nT0QyJUWoRSqt7sttC0oGXFpP3S5ghKEfuGGURJM5k1qXgK26Uzw2eb/jMO1TU/4ZnT+Xqg876KEDxyeH/5owAMjTQblc3cIo9MhwpR7dR1EpoHcUH8HCHkIsb44XVIwRZBa3Zl1rdtHCrsO4sXWjEx6GpjzDf1ShQLj416LPtm1oyWJTt6sff1qTcOKGxgezeSE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(5023799004)(18002099003)(22082099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2laUEpmUFpkMTVEbUozNHRNdGFGUmtCWTdrSk1nWGZOaUFOZlJtM25EOFJG?=
 =?utf-8?B?T3h6dWNEY2p5dkxJVFVHUnNaaVhXZ3pWTUM0dmZxa0VzNzc2bjgvdG1rNVJO?=
 =?utf-8?B?aFJVMzIybzdVVEIrdS82elNZREk4aHd2ejNIOEdXUFYxV0RvZXFsVWhIY1Fj?=
 =?utf-8?B?VGNpYWNIY1VUOGNCRmRPOUNkMnJBYnJIdkJxV0NDREk4WUwrYzkwcjhIcWpz?=
 =?utf-8?B?ZnBPekRaU1JnWTU1SjZHcXFVVkIzWlA4WVU5ZTM1YjNMV0Z2eVAzYk9lb0lU?=
 =?utf-8?B?Vm01ZXIvSlBTQTZTYXZnOWN4QkNUNUpQWXR1OUVTcU51MWhhYUM1SkV2bVh1?=
 =?utf-8?B?Y0VVUlFTVWRvOVBqVUxHNUJvRzJITlcrd1lFUnV5bWNmY1lXeExRNllxV1Rn?=
 =?utf-8?B?akVMTjZGN2tHbkUxcHNad0NXVHllVHpxSC9hWk5ISHNkRDNvUnlBaEhkRmdz?=
 =?utf-8?B?QTdCOUlzU2p2UldCNFlxdXpRNGZqcHJPUHQ0WlFGZ0VxNlRhRnlieTBwbU5N?=
 =?utf-8?B?dVY1UGhBQktvVHJXUDdpR0dWQ0NWSVVKTFA3c2ozN2RVOC9sRGJweW02N3Rr?=
 =?utf-8?B?ZjgzMHJieUlHdlA2ZU81djl0dUh4M216VTNKRGs0OUh4U1ZBbGF4Yzhwa0JP?=
 =?utf-8?B?MkJXTjNDRktWa1EvbW9RaEpLNUl3N1lyWDd4cVkvTEh2N2YxVjZpenBQUlkz?=
 =?utf-8?B?Z1Boa0IraDZCWHcrOXdCMFMxSlNFRmZmZTJzRFViWkRXRUhGU3I2SFpzajFn?=
 =?utf-8?B?eFR1LzJ6T0I2Ly81OUpWZUVKVFZEWEk5d1RsaVVNZkE2MFBPemtXTVBQVUcv?=
 =?utf-8?B?bWJKbkNScHBRQmlzUFpDMWdqTS95SVlKVHBJMDlSR3J0THJTQUJpSlpKU3RD?=
 =?utf-8?B?Mi9FbkkrT05FU2RyN24zZy90cTd6S2swcDM1UWhtbERuaG5vcldxZHhBSGFB?=
 =?utf-8?B?UnZBY0JFQ1hPeDg2aEdENXlkcGxZUkhsamhCd1lOTWl0d3BHM0wyU1JZWnlw?=
 =?utf-8?B?T3Zram92QWN4TktpKzREQzZLVW5TTTJueU9ZTExXbE1HeWdIM3FYeklGbkNp?=
 =?utf-8?B?K0tnWkszVTJzbExId0NBVWpnUUh6ZlhvQUdvWHB4Zk5lenNzc1MvVkFYOCtE?=
 =?utf-8?B?S040bEp2RHpIZVdqN0FPU1ZudWI3eEFBUUNBTFA3VXhwUTdsdk11dFY4OFQz?=
 =?utf-8?B?d0tLMFZEWkJZQnVpZm9WQVNROWN1aXlHNHNhaDFJUEZUVUczdE44ZEwxVjlh?=
 =?utf-8?B?Zm5JaERzb3YxaGJUZUZlZTRFM0VMa2NsOC92MVlRV1REZXEwZXBndWxGb1cx?=
 =?utf-8?B?c1k4YVpiU3hxNGdxaGN1c3Z0MnNpdy9NL0pjLzVheWJNK1l3SWl4RVpDUzhi?=
 =?utf-8?B?bXRGazdTZEk1WFRhRzk3dkQyT2J6WVI1Q1BUSHZtTERpcnNGSVNDREhwY0d0?=
 =?utf-8?B?WnI2L2tmd0QxRythOWdLNnBxMXZIYXFoUUZpbnhBdWpPbjA4cTVxQU43NmI5?=
 =?utf-8?B?UUNnUC9UNVMyeGs3UTlWU1RlQjR2ME16N1pucGFpdzkrRzNWc2J4QWdBZ1I5?=
 =?utf-8?B?TFZEZHF2QzdraUM1N1BmVEdnRTRGVHYwZnZyVEwrbFdYVldUajdEY0EyaDlR?=
 =?utf-8?B?VHhybVB1MzkxM3FYS096ZUIxUk41UHB3cXZOK3hZcVJ4MmIrYW9wL1BCZFht?=
 =?utf-8?B?MGZoN1EyUWw4a3Jxb0JESHNGK2VETkF0Z3Nvb1J3UDFFZEkrMnBLcEJaNkZr?=
 =?utf-8?B?ZFFPNWhBMmgzeHFjVk94eXdTM0ZYV1BqV3cyLy9VMTdCN2xyZ215d3R0L1RR?=
 =?utf-8?B?cGdldW5lMTFVS3A2UnpuQW44NjNHbENjSHc5Q3FUWUdUVk51NXJrQUc5SmNm?=
 =?utf-8?B?eE82S2xLWEFhTHdrak9lTUZlcFRTcFR4dWZ5VHU0RTZnS0N3UEVoZkZsRE5T?=
 =?utf-8?B?SnVLUWxQY1hFSWpxcENkM1FhSkJDT3A1M0pBSjZ3RXRtMk4vVmlZclQyNHIv?=
 =?utf-8?B?cXB5VVFPUVdxcExSa3Bwdm10d2dQN09HL1I5ekZJNGo4QnhOYW15d3ZpM0VT?=
 =?utf-8?B?MkxISFYxVlh3SHlKZ09lcWhkak5HdWFCa3Rqdjk3aWZRdUgvb3I1K0tOeExv?=
 =?utf-8?B?aU5IZDRtRm5VOEdKMlQyRjB2Z05iNjZWQmZOb0tSeWJxalpEVG43OGFpYWZ4?=
 =?utf-8?B?Rko3UWNSV2RrNXZ1YnpUYTJjS3pzSFRxMlFGSS9admdxeS9BS0lLdFlrRnB4?=
 =?utf-8?B?STQrd09VMkFZamozV25HRmk0WlJNcXVtWmFDKytKblhsdWNXQ0ZaR3VFK28x?=
 =?utf-8?B?RW9rZnJTMkNObG9vaEFIQ0crSGpOS09JdlJhU2hsQXltd3lROW1LaVU5NGlV?=
 =?utf-8?Q?CqkQVvzxejyd1vOs=3D?=
X-Exchange-RoutingPolicyChecked: UMeECVx+C4JtLI/6MsR6bJ5dOWrobQ8BVSi6Yns8OcYGvtxhiO/rXvNHp/uWWh+9Bk+NuJ7VVm6yz2/h93jL0NsonAsUKL8aaUcYwX/QMCrDnuF03Toq23kFMoQl4Z8C+O2nS+puSxrLx6SyTCSl9gHvPWwcEFHaf1qyCF70zWVp3N+zC4u0yLo+tVLAmmHIsW0WAezu08h6Q9FLXL3m6Bs9fSFhIFlN1QtIEpT1pR0MsNexvmpyWvU3XSqmKcs2UAeFZ2UC+u3qv+v1ifvjWjZIcsOZjAyme4T6zRgS85/ekHu0AvAZdgijvw/f3tvxUTDeegMBamBN+n+4u9a1lA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a89648-e8fb-497c-780a-08def80934f6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 00:32:36.2002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ce2TaztsxqUnDo8T3mRlV8yD8fpp1XG+jtkWPcnqh7/sqwLwNiUWRlbo+QFXDE+wg2dEmaSq/72a1P3wwWFnAag1EcsndDFGbCqCCXHF4Ls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6015
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


On 07-08-2026 03:54 pm, Michal Wajdeczko wrote:
>
> On 8/7/2026 11:56 AM, Mallesh, Koujalagi wrote:
>> On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
>>> Report 'device wedged' error using xe_log_err_fatal() helper.
>>> Use -EIO as the error cause, as nothing else is provided here.
>>> The hints about the recovery method and bug filling are now
>> Typo 'filing'
>>> separated as it only needs to be printed once.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_device.c | 16 ++++++++++------
>>>    1 file changed, 10 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>> index 4eed9a251e65..b1e9bcd9f5b4 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -48,6 +48,7 @@
>>>    #include "xe_i2c.h"
>>>    #include "xe_irq.h"
>>>    #include "xe_late_bind_fw.h"
>>> +#include "xe_log.h"
>>>    #include "xe_mmio.h"
>>>    #include "xe_module.h"
>>>    #include "xe_nvm.h"
>>> @@ -1396,6 +1397,9 @@ void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
>>>        xe->wedged.method = method;
>>>    }
>>>    +#define WEDGED_URL    "https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
>>> +#define XE_BUG_URL    "https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
>> We can directly used url string, instead of define as macro, since we are not using anywhere else. OR
> URLs change from time to time
> IMO it is easier to change a dedicated macro then full message,
> that will remain unchanged otherwise

In that case, I would prefer keeping macros, even if they are currently 
used only once, it's good for readability and future updates.

>> Please make scope to file only.
> hmm?
>
> we can try to promote WEDGED_URL to drm/drm_device.h as DRM_WEDGE_URL_DOC
> and move XE_BUG_URL to xe/xe_drv.h, but I don't want to this right now

Longer term, I agree it could make sense to move those macros to a more 
common location, e.g

a generic DRM_WEDGE_URL in drm_device.h and XE_BUF_URL in xe_drv.h. I 
would like keep this change focused

rather than refactoring the patch.

>>> +
>>>    /**
>>>     * xe_device_declare_wedged - Declare device wedged
>>>     * @xe: xe device instance
>>> @@ -1427,12 +1431,12 @@ void xe_device_declare_wedged(struct xe_device *xe)
>>>        if (!atomic_xchg(&xe->wedged.flag, 1)) {
>>>            xe->needs_flr_on_fini = true;
>>>            xe_pm_runtime_get_noresume(xe);
>>> -        drm_err(&xe->drm,
>>> -            "CRITICAL: Xe has declared device %s as wedged.\n"
>>> -            "IOCTLs and executions are blocked.\n"
>>> -            "For recovery procedure, refer to https://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
>>> -            "Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
>>> -            dev_name(xe->drm.dev));
>>> +
>>> +        xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
>> Using -EIO is right? since we called this function with difference location (since we are not propagating errors), we may have different errors.
>>
>> which may be misleading with -EIO.
> true, but there is no errno available at this point
> and most callers don't use any errno at all

That's  a fair point.

-EIO was chosen as a generic one, but there is no meaning errno 
available at the point where the device is declared

wedged and most callers don't propagate that.

> we can change that to -ENOTRECOVERABLE, which was introduced
> recently to indicate a WEDGED state, but then it will be
> little redundant
This would be arguable be more accurate right. We can remove log message 
right? since errno itself explainable.
>
> or
>
> change the xe_device_declare_wedged signature and require
> errno to be assigned by the callers (but that would be
> a separate task/patch from this example
>
Agreed! I'd view that as a separate cleanup/refactoring task.

OR

xe_device struct we can keep sigid_errno as member we can use it 
whenever required rather than passing arguments. any thoughts?

Thanks,

-/Mallesh

>>
>> Thanks,
>>
>> -/Mallesh
>>
>>> +        xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
>>> +                "For recovery procedure, refer to %s\n"
>>> +                "Please file a _new_ bug report at %s\n",
>>> +                WEDGED_URL, XE_BUG_URL);
>>>        }
>>>          for_each_gt(gt, xe, id)
