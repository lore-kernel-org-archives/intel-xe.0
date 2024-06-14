Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2D6C27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 05:50:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE35510EC31;
	Fri, 14 Jun 2024 05:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hDWeBfDa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC2510EC31
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 05:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718344253; x=1749880253;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rMKpU3jHueTnmXSB7+dKKd0mEs1rxRNnUK9ok+cYTjc=;
 b=hDWeBfDaCEogwRQ/PtgDRajo4KrzmqDlS4JeyMNzu3stcVTr2oL+Ggd0
 V/2pNKQ3RZsqV2LfglBDEwkpS8VdyJhcPDICxe94/ujqtOdYTXBx+X61r
 eeNBTCfke31IH03YPeqx/6ky7MWZFeVsvR2Ku68saLKA28IllzJXVCJBM
 Aei7PUrKpTp9dfef8p6HlCXJ6/wMmALzT9pzhATn5nns1s/JudjYfdt5S
 zi8nPDRjGh1sxmwFBdur7IUYiFo2rEQW/1fU/9MWPyWNy1PL+kB32NbSm
 tdDqhNPv6awp/c83zE3VYIz+CELB/RHhisWnd+oWqhw0Z2PLokbPKtkh5 Q==;
X-CSE-ConnectionGUID: sUGDKfvIS0qQM2gJLeNAEw==
X-CSE-MsgGUID: vh24qt2sS2mvmeTniEFyqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15375724"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="15375724"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 22:50:53 -0700
X-CSE-ConnectionGUID: 6iFF29FnRjqbiXQBFIXK4g==
X-CSE-MsgGUID: aZfOSMYXRxeMLb3KKfjcwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="41120766"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jun 2024 22:50:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 22:50:51 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 22:50:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 22:50:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 22:50:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i+gDLsbcB7bqFCgVMO5uohE2UFwA626nEcdjPBalSHenj6Aq+nr41U78/RwTQH1uE2AKJX5l6Wb2veP2N1ppnV6mp1WxFr6STPF5ZqgeG550gZwOt8uLXbge1Xg2JirCLublOFJlh6bxhAsgZq1BJqOU75mJPySBf7bmGBfuOZO2QjKrC7omPbwpUPO0j3YRZcRhlAJVoTOiQN07ODVs4lNNtIponn6ZT+RpfWKAEp5u67oLAkzbyLr4d/b3ZJIDBU1GOUtwIg7DuBOUlb/fxyPjgNNwwYKk754w954cuuF3VgDsp0f5CdQb0+zA8exDMfc/xTGyJ21kWhT3h/wzhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUOicxMkdog/OaQbA24i7YqELVONvDzV/jsO/tVVnxU=;
 b=cYFlqw+mjPwrTamNPhmMJ4bqwePGI5lDccwVm6ot2HGnym22kZgoAkNsR3iobk58M3boO0Dpi4ukcCAQIGrNCazUihOVzVp0Lp5QN63eGi5Ct0RRJL5aof8EuwUhV3JdTCDU7a4MlKMNfOqwuYYN0wh1UYFkY7yQgpLu8w68p2Az+i32SrR2vid3pX/yLPREjQi1gGtEPWaHu5Bwgr9AE7xyZh4FlHj7butKITWM3dkA3SYrlTmk02HMHguOyQbLGjQ0k/na1y8loJVtpNZ9zN8RNvGCG8kSMjEXeP25FuE/4Q+ZA9u0WRkpZvSj2cOlWrxdbGo8PToti+ZwA6biug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB6244.namprd11.prod.outlook.com (2603:10b6:208:3e6::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.37; Fri, 14 Jun 2024 05:50:48 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%3]) with mapi id 15.20.7633.037; Fri, 14 Jun 2024
 05:50:48 +0000
Message-ID: <af6df0d8-bafa-4fd5-a747-ff9e3092c3c6@intel.com>
Date: Fri, 14 Jun 2024 11:20:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/2] drm/xe/pmu: Enable PMU interface
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <krishnaiah.bommu@intel.com>
References: <20240613100411.1579218-1-riana.tauro@intel.com>
 <878qz8u1on.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <878qz8u1on.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB6244:EE_
X-MS-Office365-Filtering-Correlation-Id: 4825c820-afd9-4eb8-ae79-08dc8c35f0e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|1800799019|366011|376009;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXp6d1FQU0JqNmJuY0NBUDlUR2E4cElwS0p6clhzZWh2RlpNSFJubHZOYnZk?=
 =?utf-8?B?TklZRVc0VWFSeks5TzBxR1IzUlNZSnVDdkEwb3FQUVdZMFQvZm5QODlHVDVh?=
 =?utf-8?B?dUdZZnFXdjJWL1ZpUElDcFp1U2FVT3dCeElLMXRhTjdScnlTcG9DcTVSb1dh?=
 =?utf-8?B?ZXQ1NExLb2JJNTRVMEpTa0NqSTMzWVR2TnRPUmdTVHNObkRBM1pWR3NabEtn?=
 =?utf-8?B?MmdyejNsUHlKQWdUa2d2cVhVdTlMSklpc3RRRDg5ckdkVDZUdVJiZjVTUjVi?=
 =?utf-8?B?a1F3TlptbjJkb0htYUo5Ny95YWc0SGJPc1VOU3NWek1kNUYrK1QwY2NwMHFR?=
 =?utf-8?B?SEVFT3JlWW50ejFVa3pZYWt2aWV1UTVLU29pM0F0cmw0bVhPeTNVWHRoUkt5?=
 =?utf-8?B?Q2RsWVlJZmZZejl6YU82azBJTHRQZE53Q1pJbjJxd3dCekJUenZpendZVWl4?=
 =?utf-8?B?QVJLN1FtTyt6YVl0U2ovOUtmcy9tVFhtSzRqY09kV09pOG1rUS9NTTVFajdj?=
 =?utf-8?B?VW53RSs4dG14dkFycHE2NmFXVWZ4OXU1cW1ZY2FwN1ljRjR5V2lpaVhldmtD?=
 =?utf-8?B?dk50ejh0bVJRM056ZmhxaG4yd1dDQnFEU1RRUXB2T1ZnYThMSWJDa2R4bXRy?=
 =?utf-8?B?dm0zcWovM3ZOdTB0cWxJN0l3RXQzOUdnSDJOWEcxTWVNZUxySEV5TWRyYXlF?=
 =?utf-8?B?TjRNa25rWFBFV2lCdUU4ZnB5QXNpTzA5Uk1FMDM2anZMOWNkTUpydEN6dGZ2?=
 =?utf-8?B?ZjcraUw5aVJKem41ajBRQjNudzJzS0xTSmVoS1hoeDR6T2JiRHlwdWxpTGtI?=
 =?utf-8?B?SHlIREdINmltQnhyUEFSZk5yeHZUR1hTSzFXV093eVZ4V1dEajFFdUhvalBo?=
 =?utf-8?B?WHdxVUdHaThsWFgxQXNDWVJSYXBONkdyRENLRTZ2d0RYY1ZqYWxjRlZ2WDl0?=
 =?utf-8?B?dG5kQ3luTkttT2dmR21ER0ZnUmloQldsbVlqTXJkcUhSM1ZzbnJLOHhnL0FD?=
 =?utf-8?B?UmpkSjBLdXBaUU9tOGYxRUZWY1h6ZmRwQzY1Y1M4KzJHTU9QdkVWeGE1SVpr?=
 =?utf-8?B?NERZLzhYaEUwa0RnSlcySEtsQ3J6SXpnYTBESEl3djNja2ZaOHYyOGluVitO?=
 =?utf-8?B?eER5dG1GYjJjWW9yMW44NzBnNjE5dmtGNVRYZ0pGMFI1Wk0xVU5DcmdBRW4z?=
 =?utf-8?B?SHE0VUhYMVBzSk1ubGRvemlvdkJlS3FZL1hmOTRQM3Eya094NzRNR21RQzZ6?=
 =?utf-8?B?SS9yT3dSU1dPVmRVRVh0RjlhOVhaZVF2cDJyUFRGNlpiVFpUVGNqY2xFN2FM?=
 =?utf-8?B?QWRIRnRIakY0ODdOa0lRRjNPYzBMY2hjWjhLcllpRVBIN2VCSTlpSFErK2NG?=
 =?utf-8?B?RTF4Nm9PWmhUa284NjZMdC9OZ0dvbGxFNXlMRmZvVTU2QzZuRGtvTllVbVV2?=
 =?utf-8?B?Z21kaGxzSERNZU1BZzU3MDgrNGkvMjd1N0htd3BvMGF0bkpHWVdWb29Td3BR?=
 =?utf-8?B?dWdlRHBJYTVISHFuV0h5dGc0RUc0RFFzR0VTNXNBdi8vUFNqeFQzcjF4VlFl?=
 =?utf-8?B?TUhMY3NyWUYrNDhoNzk0NW50UnMrNnUvcE1XQ0tDSk9UZjQ4dzArSlM2bW9E?=
 =?utf-8?B?d0RiLzlOdXloRkxNOXVuTlJtM1JKRUErTTJBTzQ5dkJpeHRGYmNvSXE0TlZQ?=
 =?utf-8?B?Q09uWUZCYjdzNVFleHNrV0txY003V2pka0VYUHZITzY0cU1peFJMbjZLbnhQ?=
 =?utf-8?Q?s250Yxh58zZEv3KhnQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(1800799019)(366011)(376009); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTRpZ1FVa1hwNnlQZXNNQjMwaDNZVkVTeng3WHYwQlhNYUFiVnJSeERvMFBt?=
 =?utf-8?B?T0w3V0hHd3N3OUNnaEMrZll1eDVBZVBwODZQNUtLSDZUcVRDNDR5ZzV6QVFN?=
 =?utf-8?B?WjlBVmlwRUtpQUF1V2ZMVFp3WUdxUzgvendwc0hWK20vZytSa0dubHdOYTBs?=
 =?utf-8?B?SGd2S3lSL2dQbzU3ZGxhYUVLblordFYxL0EvWUk4RjF5d3JFVWs5UnZDWFRt?=
 =?utf-8?B?Vmg5UmZkRlAzc0tkdTY2Wkd3MjBmcUNzdHEydlp5WkZocVIyd3hCa0RSSGYv?=
 =?utf-8?B?bk1rbStSRTVhd29vOGpzUTY3RXNkQkpWZVpzblNWTWhIbnVZd2l2RG1lY25r?=
 =?utf-8?B?WjRSbmVUWmwzYTFlNUgzSFJnNm1YSWhuSXcwTG1uTmJJWHhhNlNOT3VrZFpv?=
 =?utf-8?B?TW4wcEk4azUxTUVmYlBwMjNpclZmZ0toL3dObE9oaU5PMGFGT1VXRk5SNS9X?=
 =?utf-8?B?RWNQeHFaRmd3WGlub2FRK04ySWF3VDBTOHJsSUpYbzY5UE5BS2VFNkt3dFpF?=
 =?utf-8?B?bVBUYWloZWU1UXl5ZTRQV0h6NUJWWk5lNUtmNnRYamlPWGFRdW1oZURUWmVq?=
 =?utf-8?B?UWxqSkpOOFlCUHI2K3JJbEk1a3B4MkRHc2xBaHFuVG8vOGVZc0VkUFFVVi93?=
 =?utf-8?B?RlBzR2NQbWtHTDJFbXlVNTB1a1lQZ1NJM1ZFYm1GcVNrUWRsV2Vwb3I4Q1lZ?=
 =?utf-8?B?MXlmWTY2RG5DaDNhQWs5UHc4MEk0YkFNWlo2YjV5YVhINDRaRTZNZ3ZTSTN6?=
 =?utf-8?B?WVEyMFE2UjlPNlRPdGprYXlZajNMWHdWSnhROVpzaURZaFlHbGxtYWIwenZ5?=
 =?utf-8?B?T2Z3T053R0xDRStKdEJ5QmNQMGc2WlpoeGcxNGZDMHBTWlhYZk1Qd1Qyak4v?=
 =?utf-8?B?ZkVSOFFJYjFiT1RDN1VRL3pCSERTbS8rYTBQdjNlMlRKck42aFBMeHJtTXJ4?=
 =?utf-8?B?L2tkZFhlSUt1ZFRhU0FOS1Q5NUV3TnlmejBkY1ZFT1lFQlRYUGdRRHZOMnAx?=
 =?utf-8?B?NCs1b2gvd3FadE8raHY4b25maWxiNGxjeE5hVzRJUTRyZm1nblVWUm1takcx?=
 =?utf-8?B?UVJEM1NtcGM5WDhENXRoZlJoZ2ZQL0IyWUtOd2JENTdSOHRZazF2cytobThX?=
 =?utf-8?B?TkFBKzlXT2lBOElLbm1TWkM0aDJtaWxRQWhMYW9SanVneHZYc1JSOFFLWEQr?=
 =?utf-8?B?MGxHT1Q2aUNYa3NWYmxOekZZY001Yk9JMTBhZXlIakFqUCt3QjJwTEJPR1Fj?=
 =?utf-8?B?cWpYY3RvbjZOTllwUmVtLzdIaS8xL1BEZ3I2QTBkU21IV1A5RGt3QVd0Sm94?=
 =?utf-8?B?YW5Ea0JERXZaWTJrVUJiYjkrancwLzZIaVNoWkl2ZmpNL2RPZGZNMXJXKzlm?=
 =?utf-8?B?bkNxK2FpYVRNa0JvTkljeE5Samh0OFpJcllaUlQvZjFOWUZ1dlh4ZEhkMlVy?=
 =?utf-8?B?U0VGYVcwOUw3ekZoOGpXVmhWMk9JUk5BQ0d1SzYvMWRoUHo3WVFnZi83OWhO?=
 =?utf-8?B?VFJ0Z3ltczVzQ3V5czBCUzZ1VWF4ZmFvUkRjY0JNK2l2ZmE3RWtLZGw2NWFy?=
 =?utf-8?B?UThDL2xxL0Q3bllQZU9UUlVrVTR4OVJ4VFAzQ3htbXdCZHdTcDMrd1YrMDVQ?=
 =?utf-8?B?WEJkdUphL0JObUhIcTBrbytDSDJ2dEdwWnIwNU41MzJCWHJSKzVLR0k5Zksy?=
 =?utf-8?B?ODVaUndQVy91ajZHTjJXQ2FKdkMwdEhzb0lVZmQ5cjZqd0Z6M09NWGVaaG5j?=
 =?utf-8?B?eVIvMHNXaVVWV1RVOUJxa1Q5dnJiWmN3MFZnUXo2MVVvMmZ0cnh4dWZhcmdw?=
 =?utf-8?B?Qlp3ZmRsZ29UN3ZtOXhLMnZoZU40a3l4MkJjbmdHZVRyb29UTVRzOFlwKzJS?=
 =?utf-8?B?YW9GaHhUN3dpUStwZVVpOTRKQ2JuajJZN3hrYlFJamJFTVlDdmhXUnpFNEky?=
 =?utf-8?B?OHROQ3FaNnczNVhSTmJBWnE4aFFXZ0p6RTJwby9TY3lENS9OMEFZaS9qZzNa?=
 =?utf-8?B?YXpnM3NsUUhRV3pnTVMxblBzMFRwSnhrZlovL0hPWjRqbWs4TTVMemsxdWpR?=
 =?utf-8?B?aDN0L21LSDNFeXY3RERRS3FxWkFmSHJlUUV6eXJGTGlhNEkrWkNPRktxMGVo?=
 =?utf-8?Q?cTSqlL5RNbWcCb+fFIhWOiV1J?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4825c820-afd9-4eb8-ae79-08dc8c35f0e6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 05:50:48.6157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fhD90AOMTXelvMzARy9aPSgE3lJ49p4jTOeQ7HIf7q3VtU+MJMflRPFXL4NJFHLPWxxI18aLRg1y2CoJdEiOhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6244
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

Hi Ashutosh

On 6/14/2024 12:09 AM, Dixit, Ashutosh wrote:
> On Thu, 13 Jun 2024 03:04:09 -0700, Riana Tauro wrote:
>>
> 
> Hi Riana,
> 
>> There are a set of engine group busyness counters provided by HW which are
>> perfect fit to be exposed via PMU perf events.
>>
>> BSPEC: 46559, 46560, 46722, 46729, 52071, 71028
>>
>> events can be listed using:
>> perf list
>>    xe_0000_03_00.0/any-engine-group-busy-gt0/         [Kernel PMU event]
>>    xe_0000_03_00.0/copy-group-busy-gt0/               [Kernel PMU event]
>>    xe_0000_03_00.0/media-group-busy-gt0/              [Kernel PMU event]
>>    xe_0000_03_00.0/render-group-busy-gt0/             [Kernel PMU event]
> 
> PMU patches merged previously were dropped in 90a8b23f9b85 ("drm/xe/pmu:
> Remove PMU from Xe till uapi is finalized") because PMU uapi was expected
> to change. Why are we re-posting these old patches again now, without
> including the planned uapi changes?
The uapi changes were dropped and there are no other upcoming changes 
for Group busyness. So re-posted the old series.

Thanks,
Riana
> 
> Thanks.
> --
> Ashutosh
