Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A05DCD4F24
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 18:43:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0FC310E2C0;
	Tue, 12 May 2026 18:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LSx4w7zP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287C910E2C0
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 18:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778611398; x=1810147398;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZmTOaggwK8qlyfOtuUyGnpQsPpKpd/cAcA6P4lJNpE4=;
 b=LSx4w7zP/ZVONiatUTv9rBsJ2i6cuYs3mfnBK7y0s6x7s/d2KhbFEsDg
 yfTwMEcPU4kv09fdR43LsPzpUYpKou0dGyIB4yzaCAfNl08ccg6SZafy3
 FiYGrnb8zIaNZo10c0rGcl1PSDMXf69o9pORSaSOdQW0Chzm+zClNm0x/
 d+j1EpY0ibDmQIakt3LebU+kNW78zSnv7Bp2QO1x928QHg4KgGotvx9Vu
 1Dfi3oOEWrMA4FgmAxNlcoqua3m+DIyPzvBoJYem4kEMRDmTVUmN8jfqD
 hYNab9mLIok0Vl6AgwrIW2Wd5EXKILgf13/kBnCMgGkp43a6E9cdqtrsx g==;
X-CSE-ConnectionGUID: 7ZfMsNHmTk+wkrG2Vd3jSQ==
X-CSE-MsgGUID: p59AryisRD+TwQ+1bR7BGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="82097977"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="82097977"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 11:43:18 -0700
X-CSE-ConnectionGUID: hcxMABtvT3iNcHh3rneeDw==
X-CSE-MsgGUID: rNyp7mb7St+BM9ksKZRggw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="239659470"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 11:43:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 11:43:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 12 May 2026 11:43:17 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 11:43:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EybnMCw9kEyVzhulpK3KDNI0MiT5qRTfDvlPdHI5JDpjIKCz3pYHBSq2mpq/pV6Lr/CQp5FMFd7/lRHrwCaLu3gvUQfW17/e0m/4a2pi1pv3Y5vbTFutYfN5nI2YjQyvBDRC68QEodC/8UAcdUHXqGCqzqaxNBNPXuZfd/oauB1X1euYcVKSHAitz/yG3C/39Mp+bqYa9wYQalNdXrtJ4wpzgZIkQ+QQ9v1yUQdkaCVCbqtrjETARmK55JZ1vmOUcAVuoIERSImM9tn+fF6kRxjLULXyErjBPRk/bv736fTKqjauyESx1Klo5sCEMF04XuD3EiV1/GEZD4jUKx4FBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51panK1wEEhZAd2DCnPiyJtCtcdD+uUEMjeiRXijGt0=;
 b=QTCQRDyq5cgTWC8OYicbjoI26Ooo8+cgJnH5+QWIJTDxqO9ha3A6iNo0SS2roVEddBTmSJCnye01rDPopxTn5DDzSSZ3VXVLye3QvJW7GZ3eqvUr9NrOIn8pLhuJwwY0kmMFhmtOBdV+AMdGWOt2efVkKNqbIQd35ufbM27FtqP5T02x3EagIJadi1zbyBX6o4WhuHObwhO8oMs/rH6cvJp3g/EVLmcDJgIbKSuesVIduNcriNozMNOeaDi0oQ4ZutclxQhGU27vGtrkg0g+MhZC17kOdkNHuIcdpx7Hvys1St7n95Nj3TA2k9Gx0uv/Qx8g5pXGevNCaldqcAhxyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by BL1PR11MB5239.namprd11.prod.outlook.com (2603:10b6:208:31a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 18:43:13 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.20.9891.020; Tue, 12 May 2026
 18:43:13 +0000
Message-ID: <48ac9aac-9d1d-4880-88db-a86fb3bec741@intel.com>
Date: Tue, 12 May 2026 20:43:08 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/memi?=
 =?UTF-8?Q?rq=3A_Update_interrupt_handler_logic?=
To: <intel-xe@lists.freedesktop.org>
References: <20260511172838.2299-1-michal.wajdeczko@intel.com>
 <177858045414.61304.7919735219145170020@5ab824fced77>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <177858045414.61304.7919735219145170020@5ab824fced77>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI6PEPF00000232.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::8fc) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|BL1PR11MB5239:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eba6336-7d64-45fb-e6bd-08deb0565203
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|13003099007|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: z06hod5Y33fpatY3HihQzha6Ab24IfQF9nC3LwQFxNjtXMKdtDKmcE9JzTjvkh4lDH3JRgj85JgFMkzFB3eYwdgTV1JaU5DafDXjCjA0LbVN8IGh2P/0oSQ8/X4bDwfOI61hXBj/VC++7yyFSE4sc7HVtDyQ8cHugsgMXD3wylq+kZ7iQaOGiWwxwto2fYYErv5M5ItE5q5NHvyZKi9mtc8IBy+X+i0JFDRFUXSxgB7vU5qDdoM0prfG0IlZnSTOJsE59kn43Vo8WxK/hKFXeBgI5lo9/OvqQM6Gx5g/c8odqaQlgrTqA4KKtdQAD6QP3gv6mYgqE9SniICMv1Hq+DjQ7jxofrRtYTIG10+vQ2zps1taACWRi7L42r69bH1c0Ls+e2D9VwYMXIS4+GZXWE+IZtRVyzEp9QH4ogoW70tu60XB1MUjJeO3IGXWwj/a2ThA1WOjlfHIlmqn/w+2On72kWXrRTdiEHfh8ujFwJZzDrU3Gsc0B8+a91u9lrzgxZWhikf/BFH8AKHPOLRhPVXJVFWN9BGUVUvR0KzX2MPrSLd95M7wgDVmeCbewJ4VK74voCZtkmnY4r2g7SbejrshkXMFk3XqRu2rVoINa8eJymqA/baLIBDxUAm8pk/1u6qGmbgetvpa6cOaD2YnUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(56012099003)(22082099003)(18002099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0w4ZFlhSXN2djh3NVY1cHZib2RYYWFwT2hXbFo3QzhuU25PeVl0WFUyVXdM?=
 =?utf-8?B?RVJCc2REU3MwSm5HM1IzZTA0MkpCa1ZBZ0NpT1FjV0N2anZ3elJCZWJtd0pj?=
 =?utf-8?B?T20vb21PZGRSTmVWZ1VFV003aWhRTmJoODlCSDdpanVXNm5QejFnT0dnZjkv?=
 =?utf-8?B?bUFBaTZhYnR1SWNwUEFvRys5b3NMdmY0dTNoZGpkbjBIU1NuTVphalRsK2tU?=
 =?utf-8?B?V1FicmI5azdFMWtHS1Q4RHp4NDRyOVd4cEZtNi9DaXgyWnZ2bmlDSU9NaXNK?=
 =?utf-8?B?RVM0MFAzeGNRcVc1WW9ITDVhdzV3WjN3TnVKcTBzQU5HdHJETGJDcjUwMXBT?=
 =?utf-8?B?YkxhWHEwR2F3WWkxV1R4bXhXTjgyNW02eXU3a3pNOVNxODArR2d2VW1aSndW?=
 =?utf-8?B?b3dQWEg0ci9neXpCbTMwSjEyS3FvTlE4VDdsRER6MlhhZzhKNUw5OU04ekJI?=
 =?utf-8?B?MlkySGR0Y2V0MTFCMk1PVFNYRmZrQ2RpQnJjWWczU1FKdVlxbGlFSkdDV1pT?=
 =?utf-8?B?UWFzRWR5L0hPN1hhek5idnJQTVBLYjMwM0s2b1N6YlV0MkdsYXRHNDRqLzha?=
 =?utf-8?B?dkNIZVNQWmFwMm1YR256MUR3enJ4dUx6TDF2VmJJVXo1UHJZWUJrT0NmcVJ3?=
 =?utf-8?B?VDVPZ1VvT09sKzdGMnRWMFdrUmMyeHFQTityeTl4REdLOFcxQncyd045VEdo?=
 =?utf-8?B?Nms2TUM3aXk1bk0xVWVNbjgrcTNvQmY3cC9leXNjaDh1QXhYQW90bDFQOUtk?=
 =?utf-8?B?b1hXd0dQNXh6NXQxS1o0NTAwc09OZjZTc2thMUI5OVpleXlIWlliTzVUaU9H?=
 =?utf-8?B?WVcxeGY3bkd5SlVyYTRzS2hRbXpnZkZ1Z293MnlQVFI0MlVlOVJxTDFXeHM5?=
 =?utf-8?B?S0NYOURYMzFWQm9GOHhqY1pMeWFmM3JqSEtzZVZYR1U2cTJBTW0rZGZXN05h?=
 =?utf-8?B?MkdNejl0dVJTRzlVWVIyVURwOGwyUHEra0VqRjhIVi9vSjhqZTB5MVAvTTV5?=
 =?utf-8?B?L0w0aERqMUtBejR4eGVtQ2huRENsN2x0SG03Ly9VMjQzRkdjbWVSQ2s1UEtx?=
 =?utf-8?B?cGp6MFhZZFdGZGtadWlkL09mMy9laXo2ZmFIOE1uQk80ZC9SU28vTWpuZWJG?=
 =?utf-8?B?aUJvVGlUNmZQUUNHY3dvcEZTcUhVU3IxWFJ3K1Q3VU41ajFDMXJtNGwrQlZy?=
 =?utf-8?B?ZkZ5UWgyVnNENkJ6WlhUMHk4SktoK0tqcXUvdjNvNCsvSmZ5ZTFmMXBkcjBZ?=
 =?utf-8?B?VlBPemRFWmp5TFJZelIwTGU4VGZ0ZDlzbTVWdXFZMXkzVmErc0Z5WkY4YWNW?=
 =?utf-8?B?MkVZVjZrcTRuWms0dG9EcGpKSzZ0Y2ZpTGlKYnkrbU5XenRtMlJlRVVaWkJ1?=
 =?utf-8?B?dnF3dHh0VjFKaHBla25DWXpzeXkwWm9uRkZmSVFHOEh1QVRaV1E5d3RXMVRM?=
 =?utf-8?B?T2ppODM1R2tFSlZoemFGeUZ1L3JuNUNBN0w3K2V6NnZjM1pJWGVDKzUyaHBO?=
 =?utf-8?B?WlRiNzZuc3kvb1gvRVVkOWpSM0lJUGEzNGNhRTZ4NWR0cXlST2VxY2RHTlQ4?=
 =?utf-8?B?Q044OWdzNVdacDVhUXpaVER6eHNMdXBWTVkrd2wxa004anpZK1Y0WjFUd0Zy?=
 =?utf-8?B?NUtoQVUwc1hJYm02NndVQmUwRkNrQk56V3hML0tzZkZaYUYwRGtMUTI2L0pD?=
 =?utf-8?B?SDRIZ2FqMzFVZVRPTUJNc0E2akVLWmI5eFIvc0lHa0F1Y1VlVHB6clpxaElZ?=
 =?utf-8?B?d2YwUGV6Wk5RM0NmajdnaERURFhLeUNwN3hndEtzRE11OFpERUtiVmQ3ZUFQ?=
 =?utf-8?B?VDBHMmNHRzBoVCtBM3BPTWYybDFVc096ZFRiL0pMQStscGVYdGVMN0hEVld4?=
 =?utf-8?B?SktrRGZBY2dmZzJnYUQzWWZWUFMybFdMNFNnQjhPMVRUYzVsRzJkeWYvMFhy?=
 =?utf-8?B?T2hnQ1FZRzd1VGJmc3JIWWwvSXM0SFFmcWk4eFZhWFJaM3dWUDVRS292V2xT?=
 =?utf-8?B?MmVDcVFEaTR2NE9xOUN1MjVpRU9xaU1JU1I4TjVWTy9kRUhRdEppRnA0a212?=
 =?utf-8?B?aSs2ZmxmYitwajArSzUvM3UvQVF4UmNyRzFDM0N6MC9jTXVzOXRPeW14L0ht?=
 =?utf-8?B?NVJIQkFpVXBvWDZnRTdvT0U1WU5YNFhwaDRIbzdBKzVtbVZjS1hQSytqemZW?=
 =?utf-8?B?T0JsZmVybG5uKzArcU00c045dE0rbXBQSW9XVVNtbG5MV3hpZjV4enR5ODdX?=
 =?utf-8?B?RkY5Z2Y0SVpSK2NqTUNISEEyd01SVUJFbGJjLzZxNWlmckpsbXUrVW1qNHdy?=
 =?utf-8?B?TGpFL29Fc2JpdlVaSmYvTm9XcThCNHQ5dGlHYlVWL0hkMU1oeWdaV1JVeVc1?=
 =?utf-8?Q?klNA8I44bs4JuNvw=3D?=
X-Exchange-RoutingPolicyChecked: hQfB2TZbJpRSl3WuFKp1DjS0OnPKdWts+mJfNouBsnIJa/sMsCxcZeLI5IzzerdHMpGHkSoCxK5ezrCU/ADff6LgvBEy0l3LPVQaCAnBWrOBBbBP+/yQVOjQNDzKSHX4tRFhoBYk62FtK7ugAupHvOYaPbDBmKLbIpn/KJwlL5aItF5yeQBC4mf05UJT+yoe5RJoRrICzdwnmMDf9BGVxCYc6qL7iq4hZUMRPf719PtX9JH6hKS8QluMTROp/SAlXKzMCjG5gUa1UgxIw13ns2SVbQ16F6InT6Ty1nrXmqhXEcfIVPN7vEhQBMdo6BdJBa0vt0eSO1ll3vlqpVYaKw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eba6336-7d64-45fb-e6bd-08deb0565203
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 18:43:12.5396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4dXSKmGoL9kfvos4/SLGhcOJ/+izZgvWvjCa711FXzE+RDYcjyTw/Zg6iqqELbXMeysN98H4ShEFRLhoeGlp+sbzdxgMkrLP6GNT37TlgEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5239
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



On 5/12/2026 12:07 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/memirq: Update interrupt handler logic
> *URL:*	https://patchwork.freedesktop.org/series/166351/ <https://patchwork.freedesktop.org/series/166351/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166351v1/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166351v1/index.html>
> 
> 
>   CI Bug Log - changes from xe-5043-0ce1c813197dfbe15ff14143da97ec11161e1795_FULL -> xe-pw-166351v1_FULL
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-166351v1_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-166351v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (2 -> 2)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-166351v1_FULL:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions

all unrelated (KMS or non-VF mode)

> 
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5043-0ce1c813197dfbe15ff14143da97ec11161e1795/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166351v1/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html>


<4> [159.232535] xe 0000:03:00.0: [drm] vblank wait timed out on crtc 0


>   *
> 
>     igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5043-0ce1c813197dfbe15ff14143da97ec11161e1795/shard-bmg-6/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166351v1/shard-bmg-4/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html>

(xe_exec_reset:5234) [thread:5236] xe/xe_ioctl-CRITICAL: Test assertion failure function xe_exec, file ../lib/xe/xe_ioctl.c:652:
(xe_exec_reset:5234) [thread:5236] xe/xe_ioctl-CRITICAL: Failed assertion: __xe_exec(fd, exec) == 0
(xe_exec_reset:5234) [thread:5236] xe/xe_ioctl-CRITICAL: error: -125 != 0


>   *
> 
>     igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5043-0ce1c813197dfbe15ff14143da97ec11161e1795/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166351v1/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html>

<4> [317.960612]  slab kmalloc-rnd-01-512 start ffff8881a10f1800 data offset 512 pointer offset 0 size 512 allocated at xe_guc_capture_steered_list_init+0x673/0x840 [xe]
<6> [317.960721]     drmm_kmalloc+0x3c/0x100
<6> [317.960725]     xe_guc_capture_steered_list_init+0x673/0x840 [xe]
<6> [317.960805]     xe_guc_ads_populate+0x6d6/0x2100 [xe]
<6> [317.960883]     xe_guc_upload+0x19/0x70 [xe]
<6> [317.960958]     xe_uc_load_hw+0x86/0x2a0 [xe]
<6> [317.961093]     xe_gt_init+0x3ae/0xdd0 [xe]
<6> [317.961268]     xe_device_probe+0x32e/0xc10 [xe]
<6> [317.961391]     xe_pci_probe+0x39b/0x620 [xe]
<6> [317.961527]     local_pci_probe+0x47/0xb0
<6> [317.961532]     pci_call_probe+0x6c/0x360
<6> [317.961535]     pci_device_probe+0xa9/0x140
<6> [317.961538]     really_probe+0xf1/0x410
<6> [317.961542]     __driver_probe_device+0x9f/0x1d0
<6> [317.961545]     device_driver_attach+0x57/0xd0
<6> [317.961548]     bind_store+0x77/0xd0
<6> [317.961550]     drv_attr_store+0x24/0x50
<4> [317.961554] ------------[ cut here ]------------
<4> [317.961556] list_del corruption. next->prev should be ffff88817ed4b640, but was 0000000000000000. (next=ffff8881a10f1a00)


