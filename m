Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB13C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  2 Aug 2024 22:41:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F8210E066;
	Fri,  2 Aug 2024 22:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VoxQXK7r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A4A10E066
 for <Intel-Xe@lists.freedesktop.org>; Fri,  2 Aug 2024 22:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722638489; x=1754174489;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ShcCWtTTbUauc9YDCFgFNcRz6K4g0qv7LOW2tfwPm8w=;
 b=VoxQXK7rgmyTBiFyqT9F6zWeW3Q/uh3wdFbe//PkF/zgnuBc00tV8V+c
 Oyalf4IXWyRJItg9wZb5LK1wCgbx68MJ4UPeWalVswfRuvUmYiEpgm2ao
 1wNXHrtiDkCYqgRBblB8rbXT783DOkaguNd7Y3Uai5Fa3iuWNoSGgd/V3
 JFM5UZ0xmCOdKfGDu1XZuBgYQBYrW+TcEo5aLnAW9gBaXw8CZULnsK6nv
 y1k3O7deOUrh4qvhSIJsv3XIAjG35wirLFBqVSWa6O5OaZ02RYH2lbizw
 1NC+OT8r1sumhEEtIR0LvSSKzDH/yDLqkNek5JB+qKWxk3Mu3mKgJ9Lew Q==;
X-CSE-ConnectionGUID: Slgu9tSqR4m15jCOz8BzXg==
X-CSE-MsgGUID: oK1wg0ORSU2CzdvIfTMtKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20345902"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; d="scan'208";a="20345902"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 15:41:29 -0700
X-CSE-ConnectionGUID: Qpez0UkHS16CmtcH+q0qPg==
X-CSE-MsgGUID: HtzeEPPcTcm8vv2TmP1AiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; d="scan'208";a="60174768"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Aug 2024 15:41:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 2 Aug 2024 15:41:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 2 Aug 2024 15:41:28 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 Aug 2024 15:41:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TRCbUE7QDKxi1VDAKTcg+xne9+XsaSkuNJtsRCyhPAhfl3ZMgAsyGbc7C8oUsxDvBDRSWtGhWaqn0CvjuyyP+bLzIzV0RdmH9T4PmR8dp5nHV6EhEmfLZ3WZt7we988D0NigHuwjkuUTJoySgunQ2LR6fg15CMaYPeGueM6Ggkr9UAys47FT4SuIt7egOpUC9BxIvY22YKx0oODjlTjrCdDQzyO95p84f5kqeX3eniT3sMPG1Y/R0315AMJxWdjV32h0rPD9tHIGNnyXlhss9jkv1dHA1YoXjH9R0kA6weyWaM8jwSHFzZR7iXWLU+l4gwkTum9jOkYaAbolGTru6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rH3TCypbCRP1Ts6C+cCdRf76cC0uCb67sMSffqGjHPg=;
 b=OlQ/Q6ztIdOz6acbSQ0yEbna0F9s8iJ4s9o04OAWJnlKf2G3Xifrnxlr4hnQ9naKcxq4F0Z8re72Z7SN0rCRxIIGAnOVlPjNIjjg0ZqugQZF/8TJg2TwAsGyLnRe1IihsJriJDBybcb1ebYK+Qkw33wLq8pUGn7pTh4ZKI13lNfg1awLaUMmafbmBB7PDRBxLH37AUbsQqleuikV8x71jMTIb7BW/pFiSj9c0Jhhupor10jOzak1nVD5g/hY/gayLXuvuRmP8heV6nml2FH9+LLLktLPnqHoxv0hTtFwe0UR+nt4dldzXyM7Yy3ZryXeHjewg/u+iImWlIv/NwiBlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS7PR11MB6295.namprd11.prod.outlook.com (2603:10b6:8:95::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.20; Fri, 2 Aug
 2024 22:41:25 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.7828.021; Fri, 2 Aug 2024
 22:41:25 +0000
Message-ID: <52943f77-9e1b-4f25-a95c-8bb32b6b2c93@intel.com>
Date: Fri, 2 Aug 2024 15:41:23 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm/xe/guc: Bump minimum required GuC version to
 v70.29.2
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
CC: Julia Filipchuk <julia.filipchuk@intel.com>
References: <20240802222129.3976212-1-John.C.Harrison@Intel.com>
 <20240802222129.3976212-3-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20240802222129.3976212-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::12) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DS7PR11MB6295:EE_
X-MS-Office365-Filtering-Correlation-Id: 54704ae5-e379-484a-9254-08dcb3443dd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnFNUmcwRmhaVEh4UTh5bk1vQWdZekdYOXZLNllPVTFLWG55TE1lTkpwMGM5?=
 =?utf-8?B?MEI4Z1paUElSWFZHV0FITnQrV0JQV2pRSjdmbkxjcXlkdFcxcmZaV1VXajFp?=
 =?utf-8?B?M2ZSeGZydmNvSkhSb1Y1UGxacGl3YThrWndLS3A0R2dBT3BjalhWSjNnclFh?=
 =?utf-8?B?ZXlqQllXZFFXOW1HR0Q5Q2R6YTNrNTdwUEIxV2Q3blYrcWxxWUM4TW9hRW5N?=
 =?utf-8?B?RC95a0dtSnNDSFAzZmxsbFg3ZVpkcCs5cFhEVFhXWmdzTXlKWTNjcDNRSDBi?=
 =?utf-8?B?d2l4aW8vRXNFYlk2UERueHF2Y1VEejUxOHV4YzBCNXRqUU85WUNPMVc1WVNB?=
 =?utf-8?B?b0RrdjBGR3FUUk4rVTRkZ1BVeG9tTnhZNTV6WVBrSVEycEYyeFlSZHNpeG91?=
 =?utf-8?B?TEVPRk41UTRsaXptOUgxODFzVk5FTWpiVkFIdnIrUmdLRXVYdGgzK2Y5WmNu?=
 =?utf-8?B?K1dqRWNQb1BsYWlGTnB4MEpjRWJUSHNPSnd4YkUySTE2YVNhdFRmSTZtMllG?=
 =?utf-8?B?TGpGWlhkVWpxMVdsUkpZVEd0QkpWemdCUlJzMTh3c1F3WGQyaCtiSUNwOXl3?=
 =?utf-8?B?WHpReXVhQlZhRncwSzhMKzhwb1YrVFBWMzkwQ3dmcWNCSGxGMkZtT25rc25C?=
 =?utf-8?B?N1JoMVorNDN4YmE5bXgxSkVUdmV2MzEzeVp0WGRxWE9xRS9wUDNzVEllL1Jq?=
 =?utf-8?B?Q0xYTFFRS3J3TXljRWF0b1ZMSk01Yk1xWVVVdS9vbHJqZ3lna0hsL1FIcVNX?=
 =?utf-8?B?clBIbWY3dXM4WkduMHhxWUpYRXcrZXJLcTI5b0cxMzk4ZGhERlppQjg4c3ZG?=
 =?utf-8?B?WjA5VnFSeGQ5SWpvUFdYMHkrTWlOOUpuVVp3VFpwRGRiMTFWS0pkNFp6T2Ex?=
 =?utf-8?B?enQ2d1RJQXptWkltMVd0WFlFakFWdXA0Skh6MUZ4UTk2K3NCUGMzamRNRFlo?=
 =?utf-8?B?RzRhcXFOaVQvL0ZTb3dmVkxxcnJjNkRydlQwa1krRDcvdjhuc2dMbVFkQmlp?=
 =?utf-8?B?eHgyTHk3b3JKN2Nzcjd3bTNRT0pxcVR4eXo1VmVaSlhPMG9ZTlYxN3dVcDJ3?=
 =?utf-8?B?Y1NIa1FkUTdvT2I3ZUJCVWRpejBmWmk1ZFJ1M1M0b2VlSzRKclVodjExZmZH?=
 =?utf-8?B?dW10TVR4K2JNTkJQeTZ3RG1Va3VvVGYyVXBucEZhRS9wZFRGd0hiUnE1SWdG?=
 =?utf-8?B?RWxPR0tmQ2RzQWlOZ2IvSFlFUjdRbDB6bUdZT0twR2JhYk1LNHR3OTRzeXRu?=
 =?utf-8?B?YWgveHFtN1ZpalA3emY4Vi9pQlU3TFhxajRUcnhFUFZPakNrdmxkaXZMUjJn?=
 =?utf-8?B?TEw2d3Nyc1ltbmd4dzN5TkxlaUI3ZWxLVmI4cUhuSkU2TEhkakxmSmFVb0gv?=
 =?utf-8?B?bk84RU91QUpMWjJSVG1IaFArdTlLQng3M2M1U1p5OUxtc01lU0VQaU15Q2Mr?=
 =?utf-8?B?UG52T1FjMkpoazduLzdoeGFNUjNOREI4RVZRejdmdjlLT3NBWGhnMVhBZ2pC?=
 =?utf-8?B?TmFoaU5VVVkrdktPOXdBdVJzRzRCSFJIRFZNdXk4dTFvdGQ0MHVrZlZlZlcy?=
 =?utf-8?B?OEM0YUZFYk1WUzhmM1FXUTA0ZEhmeHd6L2ZNVEV5L3p2SVZIeER2Q2Fmd1hh?=
 =?utf-8?B?TDVqWWVIOUhnL0sraUtCbVRqRlBWMjFOYWxpdmtWSEU0UWEzWk90R3l1S2VZ?=
 =?utf-8?B?ZGU0bk1peFl2RUxYUmU3SXRtQ2pTam1lRWI3N25xV1ozMzJGK1hCU0JzYlpC?=
 =?utf-8?B?bXJyUFhOWllmL3EyZDF4NVZzM2Y1WFZWM3RENjJFL1g0Q3lmY2orYVVHS1NC?=
 =?utf-8?B?VU5YWVU4MlFIcDNnL0JRQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXN0VHRvdTNicHpGem80aSt2OGhKSnB4b0pzTXRTZFRQaGtZbDcxdHl2dWVa?=
 =?utf-8?B?UmNaOXBRR3M1Slg0bUVZelpBVWlHOHpFWHlXYTYxeHNuYkxNKy8wYXZ1S0Vw?=
 =?utf-8?B?aCt3QzhQUjJpTjR3eEltQnIxM3Q5aXpQWXE2TFB3NjhDVVlVaCtCWWk0NWFT?=
 =?utf-8?B?R3FDcUhySldoTlpZYlRwSndzSC8zazFCa2krQlV5T0RKS2c4S2pFMExORjFt?=
 =?utf-8?B?ZkVGeGFxdzlWelVIK3VIVHhDTU5HWERhb0F2SDU5UngxaitBUUFsbHFYNUc2?=
 =?utf-8?B?L0lFcFNuU3JBUnNTR3Y0TU5zY0VzdWNJY0g3Vi9DZkJQUVlPd2U1VnpaZjl1?=
 =?utf-8?B?UGpLR3c4WEFUM2UxajJSNEpXeDRnRSs5aHdOWnErQW9YT3IzaklMMnlpTkZI?=
 =?utf-8?B?UWdFZmJKcDZGV3U4bkdxQjRLa2ZCdHRTOFR3NlJ6OGUrM1V2RlptSXgwaHA3?=
 =?utf-8?B?dkc2THFzT3BKWTFRKzhabFgxRjlrdm40a1NtV2p6WmVHeWNhNDNCNzNjUTFh?=
 =?utf-8?B?a1cyWDVGSUN1cG5QUFZYV2lGQVhudlhWQUh5Y2JUSXJiOGtZb0QvREVZOGd2?=
 =?utf-8?B?SFdLTGVid0pDb0czOFhwdVprZnN5eDAvUXdiYnViRlYrZ3ZvZHlzemlVZVJS?=
 =?utf-8?B?MEF4UE1OdVJUTy9HYldUSElHZFMvQ1Z2V2VDRSs4N3JzRWlHUjZVdy9ZdFlu?=
 =?utf-8?B?NmlwalRickNMOHR4c3hwRzMwTks3VExTdzNmMDRPekEvZ1RvMjE0MHhFMi8v?=
 =?utf-8?B?cDBFeDdSSjdodTB5N2pERHVkcUdveFk1MnJaVjdyK213UjRiSWJoUlF4TFBB?=
 =?utf-8?B?QjVLQWIwbzV5UTBVcUlmNUJVMTdDa1ZTakJhR09NT3g3NXQ2dHlFWjJJRUxC?=
 =?utf-8?B?elkyQ1VEUHA3ajFVWnNRVGg4aXBEY205ZnBtdWxqSUZ1dS9mY0tGSlBDcEpw?=
 =?utf-8?B?MkJwMGtZeDFuYkZBRlpGcVVtWWM1dVdaTGVuWm9WTkhYVTR5VGtwSDJoMTFs?=
 =?utf-8?B?REZPR1NOVWRaMW54MHRjWHcyK2dpT3VkOXRHTTQ2ZmNsK0VEMHRDSVYrcjZx?=
 =?utf-8?B?c3RDSnhtdTlrRlhSUWM4WTV3L0FQTU13RUZHVW1GcjlCMjQwdFJHaU5yb1Iv?=
 =?utf-8?B?ZFJYRC9KSm14Wjk4b2Zhb1dYT1ZWYlQ1Z01tVC8xVTBFYkVsSStRSzRVWnRQ?=
 =?utf-8?B?MHVIL0huK05CTVNmVng5ZTRlRjkxdUl1bm9wUHhNRUpjOFhtKzZBSHFnbmRP?=
 =?utf-8?B?UFFlS3NKb0JUdTBTcmg3Q3QyZ3dMaG9HbVdybmM3V0tNdXpWMVZLZGFRckZL?=
 =?utf-8?B?ZEFDMm9waWRUcHAwd25jZldkYzVJUHRDejRTVkM1ckE0K1dybUZKMnBhN0hm?=
 =?utf-8?B?Q2wyM1ZxZWFqYWdZMTkyRkJUVnJLS3dFcUlZWkpDMmFRZVRtWkc5Q0VYSEtU?=
 =?utf-8?B?MjJCN1JENC92UmdsR1Axbll6OS9VeE5GR09mQVZZNk5sV0Q5bHFnYXVVU3VZ?=
 =?utf-8?B?b2E4R0xEdUtTb1lkd0F5K2hTK2t1Smo0SzVlL2JUU2c3MEhNYmNlcDlHeFJs?=
 =?utf-8?B?bERnMjNuaTRydGVHK3BXclFTRW5RL2l3UklhUUJwSld6akdrR1BuQnFjR094?=
 =?utf-8?B?ZGMrdkVzbVFnZ1JPWkdFWlJkNDE5aWhXUlNGb0pCTGMxUmdBbjh5ZGJYZlZ4?=
 =?utf-8?B?MEVFTVRnaE14SGorUkhnUkgzNG8zWFFKcnZ4T0lITUVCdFhyRDZINVFxVzdS?=
 =?utf-8?B?STl3ck9BNEp1cFZFRnFCaVBNNjA1YTRSKzdQMkl2NnBrZjc0R053aDFNSllt?=
 =?utf-8?B?cUdodmRZdXErc0NHdlc1aGR3YWNHakF1bGNQKzVXUEY2Z2VtMWhSckhiTDFp?=
 =?utf-8?B?eDAxdUo3NVg0cG9ERUFxbFNZL280aStiYWZaNEYxcGgzYm11Q1JXTzNtdHdQ?=
 =?utf-8?B?eFpSa2pyakJDdUNxUFVoandoK3ptYUJwOTdpd2dHMnp6N0g5RW5IS2FDWktt?=
 =?utf-8?B?TExqNmJLKzBRNjlHZzBQQzM0dklmSnNicnNFVTA5RUYvRjg3TVBqa1RqaXFi?=
 =?utf-8?B?cnFoTEJJZmpidVp4UzkwaThyblV3a2RtWUpIMW15ZEV5VG83cDFzcVRUYUpw?=
 =?utf-8?B?V3hSWGc3a2d2eC8xUHYrRlJubWk1TFlNY1NWWjVid0VSUFBtNjF2U2lzNzBT?=
 =?utf-8?B?a3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54704ae5-e379-484a-9254-08dcb3443dd9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 22:41:25.7447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K0Q0G24qAcknFtdlqj59JUktV/iwfby0J2EnprRXHot1oIua3Z5V9TSnpbLJWD3qMdwOjYhllDwS0UaiNUn9vRT7cv8ZGH55LWiP4Jlfvso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6295
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



On 8/2/2024 3:21 PM, John.C.Harrison@Intel.com wrote:
> From: Julia Filipchuk <julia.filipchuk@intel.com>
>
> The VF API version for this release is 1.13.4.
>
> Bumping the minimum required GuC version just before force-probe
> removal allows us to set a baseline for what API features are expected
> to be available. I.e., at this point there is no need for any version
> checking in the code before using a feature. Of course, if/when the
> API is extended in future GuC releases, those new features will need
> API version checks in the code.
>
> Bump the recommended GuC versions to match.
>
> Also add numerical comparison helpers to simplify the version number
> checks.
>
> v2: Reword commit message and make comparison helpers GuC specific -
> review feedback from Daniele, done by JohnH
>
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_guc.h   | 10 ++++++++++
>   drivers/gpu/drm/xe/xe_uc_fw.c | 27 ++++++++++++++-------------
>   2 files changed, 24 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index e0bbf98f849d..c3e6b51f7a09 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -11,6 +11,16 @@
>   #include "xe_hw_engine_types.h"
>   #include "xe_macros.h"
>   
> +/*
> + * GuC version number components are defined to be only 8-bit size,
> + * so converting to a 32bit 8.8.8 integer allows simple (and safe)
> + * numerical comparisons.
> + */
> +#define MAKE_GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
> +#define MAKE_GUC_VER_STRUCT(ver)	MAKE_GUC_VER((ver).major, (ver).minor, (ver).patch)
> +#define GUC_SUBMIT_VER(guc)		MAKE_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY])
> +#define GUC_FIRMWARE_VER(guc)		MAKE_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_RELEASE])
> +
>   struct drm_printer;
>   
>   void xe_guc_comm_init_early(struct xe_guc *guc);
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 5b70d23724c4..6bd1962bce36 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -15,6 +15,7 @@
>   #include "xe_gsc.h"
>   #include "xe_gt.h"
>   #include "xe_gt_printk.h"
> +#include "xe_guc.h"
>   #include "xe_map.h"
>   #include "xe_mmio.h"
>   #include "xe_module.h"
> @@ -105,15 +106,15 @@ struct fw_blobs_by_type {
>   };
>   
>   #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
> -	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 19, 2))	\
> -	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
> -	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
> -	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 19, 2))	\
> -	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
> -	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 19, 2))	\
> -	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
> -	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
> -	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 19, 2))
> +	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
> +	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
> +	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 29, 2))	\
> +	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 29, 2))	\
> +	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
> +	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 29, 2))	\
> +	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
> +	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
> +	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 29, 2))
>   
>   #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
>   	fw_def(BATTLEMAGE,	no_ver(xe,	huc,		bmg))		\
> @@ -309,10 +310,10 @@ static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
>   
>   	xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
>   
> -	/* We don't support GuC releases older than 70.19 */
> -	if (release->major < 70 || (release->major == 70 && release->minor < 19)) {
> -		xe_gt_err(gt, "Unsupported GuC v%u.%u! v70.19 or newer is required\n",
> -			  release->major, release->minor);
> +	/* We don't support GuC releases older than 70.29.2 */
> +	if (MAKE_GUC_VER_STRUCT(*release) < MAKE_GUC_VER(70, 29, 2)) {
> +		xe_gt_err(gt, "Unsupported GuC v%u.%u.%u! v70.29.2 or newer is required\n",
> +			  release->major, release->minor, release->patch);
>   		return -EINVAL;
>   	}
>   

