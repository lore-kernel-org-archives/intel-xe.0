Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585C1CD6E5E
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jun 2026 05:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F77112DB1;
	Mon,  1 Jun 2026 05:47:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EjeJ3NMr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68671112DB1
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jun 2026 05:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780292853; x=1811828853;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=67xnfJ8j2svVFn0M3isBW/uLtdcXc84Z7t1SzTSxVKQ=;
 b=EjeJ3NMrHQu/eQJXf9Rl5Z2ey7Tt6tqvz54mjx68qDMGY9X5WQxUFW8D
 /UO+RJ4dmskVspYtreIryVPDpocHpsNeA/nwcgu++Vk2ArwtOEuj/C+GK
 67/iaPX3yfLkunyr4xMingMuqZNq8EGryYGi6IukOzfKycbzDtwK5nDZt
 Anc02viPM/WSApekvDmkujfqYU3l5trDOf1qLr1gVrXQrTOCtdegK2cRa
 YPxkA7SwfFRlnzIMpOxo04YlsN0j7ZVHdYyoYO6JPUEl6bVGWFNWeHvIp
 XgUn+jGKr+bnCYcVeFd3GFmqqMehbLLMKYK9PDta34a2+zaeL9Oac82tF Q==;
X-CSE-ConnectionGUID: TbSU84CMQOekoBbQabt2mQ==
X-CSE-MsgGUID: SmNg2qqmTNqFbnoldzetUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80773999"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="80773999"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2026 22:47:29 -0700
X-CSE-ConnectionGUID: E3GEa76QTFqQ8cTVu37fYA==
X-CSE-MsgGUID: 4lmO2O1PSsGLmSXNiquN0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="237127251"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2026 22:47:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 31 May 2026 22:47:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 31 May 2026 22:47:27 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 31 May 2026 22:47:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZwf7c6EmLlGFiyxoqCnbbWFcyan9BTY1izfdUorbfdUOisxV0loiZbwbhonOXE154F1cpEPbtfLfLQmiIloV/gtKdqVpcCPWhv3gKzCGlvqmQiAL4BGwqdQ6uhRyhZ6aksghX81nPC6rXzaqVTWvpAZBu0CWghjJOn/t2U1R/zi2HgeIbcOyBqEKXm6XE3WuvYAM4zK3UJSw85xcRZf60/xzv+/YlIxxjtZS9gMepb+Y2po2dwDMJJXjienJdRvvZkP/Umj2vEUJjq0xDAQD/7VQ/LqmH3RDJP/JVamfT5NEoGBthmBw4o8KpRoMWTDsdhzZgBIP7f2rt90F42KeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBAeDviWPqCodzPlqulPi44P0AMgEBAIWLgYjwjHw7I=;
 b=bHI9/m3YlvOW0FwcuxDZsW6vO2XMaBMYptQQwlfk9jDucBs2TcLQDbYgX/q72+xpeDQeDpdARXe1Fmqi7Iuex5vqLomvCKIcKE6ODoDseQTx8kOGe+PfEFPjhE+QJjbQrC0G4twGvJMRNZCEN6tC7DMLr7ILzehbGqMCifskdNCOZU0bLdguBrPd4fa+Pe51gclnmsP6WRna4tnFQnf6mo+1R9a5fYSXUJxOy7IgRxAHPLSZlGqAu81s+JkmO6gs8v08KINDDwchq322QoPM+0Gv+eODovZIQKaVHKoGgg4LZkrjU66/a4qkbQHytRIZ6ifxb6EGsIF7Kf/Zm2m9bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB6219.namprd11.prod.outlook.com (2603:10b6:208:3e9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 05:47:24 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 05:47:24 +0000
Message-ID: <8eccfbd9-2154-41c9-8e3a-1d101c0a2752@intel.com>
Date: Mon, 1 Jun 2026 11:17:16 +0530
User-Agent: Mozilla Thunderbird
From: "Tauro, Riana" <riana.tauro@intel.com>
Subject: Re: [PATCH v6] drm/xe: Unify fault injection hooks for CSC, GT reset
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <karthik.poosa@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>
References: <20260522120628.538631-2-mallesh.koujalagi@intel.com>
 <49b334e2-a40c-4d6f-95f0-9cf5e959d717@intel.com>
 <ca4450cb-8bbc-4343-9f87-94918430a93d@intel.com>
Content-Language: en-US
In-Reply-To: <ca4450cb-8bbc-4343-9f87-94918430a93d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0118.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: 0550aa1c-fec7-4d3a-1376-08debfa14184
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|11063799006|56012099006|6133799003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: gYf5oEfvFeKssTneFZVmWKrscSonXKigRrbXw27RnRyHRea3nYcr8kK68rneE3ZGBvhckk77v0oBzqjurx41Ul6XsKJscBuhvH8RRWKGBlqf2Z0ffcZsL/oE7lRfqzktYfEO2M1cTTyYdEsm4TfJ0hiOGK2TXkKXG09YWxTy3amtXf3jMQha/iaZZkpScA+7VaLlO8IM2YXqTLty5+qZkVKYKKQNyL6n/hAIyTluicqRu1uc0/g3PBYAfY6piGYzxOxd3c57zgyXGIK89w7pGDrjGFzWu5OaQj371ioxHKGE40t5xScLRiEbwQS6PWCA5vqI7it/7qivbnWoEIet1+pt0Y7b1T8OEcWnPzXNMZaBgXOYIBkv3+6Ipygvz2Arjvcpxw7YNnttplmoYREvwDA3nCFsE0aeGT9SgyraNoxNNCG2lZ5L9gf3CRaWEf59XFA4jfMFOemazsKaQ0e7dPYlVGwTTqmhT5C9Uf+sT/FT9M4b/DrcAOzbVpKu6jcoW0a44ANp+9GcTBEkTjDUv0hNdFOs7hffT7tMavkaAO4SiwsP3RStwUW5rV3k05bKJ3XrTONR8bn1hMLz6zFySwbEjDZV86kVoe2ChmAQD4U7oDyvVsnIkDWZQSUnFGp2CFv91mxqPhWrQQ9iAbvuVnOKpLRIb2VzTvswS2GNQ7C0+9bqyqW5cVvXGb7THzWC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(11063799006)(56012099006)(6133799003)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUNNTzhSZXJESC9taVkzWUVzcjhLK1VqRGFxYmJUWENxQmRqS3h1bTJOMDN5?=
 =?utf-8?B?RzY0a25XeGluL0NQT0NKOGJZcXFUeFc1eEJJK0c2TU13OGtibWVDR2twU1hV?=
 =?utf-8?B?RnJGZys5SWtWcDRSd1FnUFpUQktIV045aUNJU2dIN3VuQWdyY2JmMU4xclhG?=
 =?utf-8?B?SGlLbHJrVVlwVGQ5dkVqa3JOcXVsWTFjb0E2dG1qdEtWcmd0Q29rRlNKNDVm?=
 =?utf-8?B?WHdTVUJkL2FJOWIzbW52eFJEN3Q0QXFsR2JZeC9TcytRN2ZBQmZxTmw1d01C?=
 =?utf-8?B?ZkhWN2hPTEVRaTZkWEIyMGpLbzY1N1FwNTNUL1dic2JjR3BXVEdORnNXaEpY?=
 =?utf-8?B?VWNuUy9oUjZscWQ0Vmt6M2U2Q2ZwVEt5TlppMUlHdFBMcUFwM0JON0dUN3g4?=
 =?utf-8?B?djNkOEFVK0VjdGN6ckJGN3RKTzB1VmpucnBSRGR4bzFsT25JY1pTMzdGb0Vt?=
 =?utf-8?B?WGJaNWdyV0ZpcVp5VHVoWTV5RG4rYzRGaFRGRm1nbVZYOTE0TlU5WHNYemdy?=
 =?utf-8?B?YlNKVzlkeTE4MWN0R3BHNXZMMDdlUHZxa2s2eHJUcjMrdE1BdzZLMUVBWURB?=
 =?utf-8?B?MkVGY1VMSEpCYi9lclBKU1p4cHNnQTJJNlJiRHZ2WHc1NEdIa1dtV0tOK3Qr?=
 =?utf-8?B?MkJidWx4UnFKN3pWbTMvSW10T1cvMnRNSzJDeS9wdGs3eEtqWDZWU3k2WGVV?=
 =?utf-8?B?a0xhbVdJblRmeHNIeFpFaWo2SVJ5OUM2cEZlN0gzQkVQK3laSmRrMk5RODdw?=
 =?utf-8?B?RzRWRGdWZFZTMTU5OGthRXplRjB3NVUwN1FmZ1JSVzN0K0NmUmRHUDQ0ZFVG?=
 =?utf-8?B?cVZwMDc3cUFoNGQ2NjB3YzlGdDBGSSswMjc5K0NZeEJPekpxSUdNbHU5T2Vx?=
 =?utf-8?B?ckg4d0V0V2J2SUp3azdYMDB6Q2sxa3YyRTRvaVBhRDIvM1VvSUw2S3gxTlhO?=
 =?utf-8?B?Z01zK3RLYk10dFF6TWZFa09nN0NWTzBvWGtCWDF0TEtNVWcxTmVqWWYwU3Bn?=
 =?utf-8?B?d1M4RE5MNkNWRTYrQ25PNTdsSkd6ZGcvRVlhd0lmWVJZRlZDR0x5amZ1U1NY?=
 =?utf-8?B?Y29lN1l1WnhtemsrMXZRQlJiMVJNTFhLZVlKNXhQWUtlOC9LR2gveExFMEUv?=
 =?utf-8?B?b2lZUURXbkY3SVFMSVFGdmRDS3d2RGlmUVNwMi9nK25zSm1BRHp5R0tPOVF6?=
 =?utf-8?B?K1ZUbjhWRGdwanlnU05YeG1VK011Y1BYdnFuajVmZW4zZmFTRzBaVmdKVWhr?=
 =?utf-8?B?eTlhd0dnU0ZkeUdoallCbHdrak56RXJPZHluL1NXdXNxa3d1N0lUd00ySjZE?=
 =?utf-8?B?em41N2J2SEsrcDRoUElhZEs3RlBuOHNFNk1oY2N6MnVtcUFtVE5paTAxcU8v?=
 =?utf-8?B?VVN3eDYzcUFPb242SndGbXM2dzcxSVlMczhlZk1VWnNLaGxLSlZKeDVrcGdN?=
 =?utf-8?B?ZlVDUjY3SmhiZTErWTQrbXNLallzbVNOSDJkMmNKQTRWNDU5aWVQOVEwKytU?=
 =?utf-8?B?azM1djJoQ2oyOWVYOTNrWURBZ0hDQUV1T1ZyWER4dnZqWEdBUjQwU0QrZTUv?=
 =?utf-8?B?TVVCV0IzcG51YkxaTG1wb3Y3N2UzajUyc1MwUGR0S0l2MWZYblkvTXhySEVX?=
 =?utf-8?B?eTQ4YWxLRW9UL3JVakFGRVJ1UkQvS085VEkvNEoxaWMwMmY4VUJhejZsS09B?=
 =?utf-8?B?TE5yQTdkQThiRXFWa1N0anA3QlZROERtUFEvRW5aaUtCODB2Wm5paURINWxr?=
 =?utf-8?B?N2hGUkQwWUVvaUlScXg3WkhtakdDcUpjd3FObTJ1YWxVaDRxRFZXSzdNNW9Y?=
 =?utf-8?B?NWZWQUpBNGVjZlN1Nkord2hhcjRsVnBNQm5VYWVydTd2Sm1Ec01laHNiMVBM?=
 =?utf-8?B?ak1nRTZCVmt2bWpDcmpreDhnaVdGL2ZZOUZnQ0NMLzNOYWt2NmVROUljaXhJ?=
 =?utf-8?B?OVpMbzFWYzVidWMzaHJzK2VzYmwwSzFmMFViVytQbjdWVDVKL1A1ckFjelYw?=
 =?utf-8?B?K2c5cnRaQ3NJWFVuMXpPTi9FU3JZaDVHUGdCQTBFNjBkd1ZYMmZLeFlwMDR5?=
 =?utf-8?B?UjdIS25MdGJRZkNWVStSSm53QmljSEFMT2xtWWQyWHVaUi9KcTQ2NVN5Ym5o?=
 =?utf-8?B?S2lScmtSUXRHLzNjUWtvaTdkR2lyVDFhZGJCcUVHbG5mcWN2YWd3S1djdzVo?=
 =?utf-8?B?WldVUmhCUlU5SDNVSDFqNm9tb3AzbFNtRjRUb09yakpDbDduUFpsTWN6QVph?=
 =?utf-8?B?bHJGRS9kUVZMbmVNQldmM1VxNDVTSDlERFJvYkdGbGRaclV1L2k2Q1BKVnlB?=
 =?utf-8?B?QjJHVXVaRmFqeDNBa2swc3dsbUZ2ZFNxYk13S1ZEeE1TSFZEOGNuUT09?=
X-Exchange-RoutingPolicyChecked: DAdzcMKLJlqKKwZcnd79u76RAz4voEYkKMvJP9Xqfx8jDw9X9uoAMIpi+I3g9qWnM8KXtbswWj1B4YPQyUiSF1A5khw2m4FcJLf1QjBvGLXOrdFlkTnVyZBa8dqQe6yRWK8P9taDWIoGkBir7zmV09WGqB+tTwokapdPiwJv2bFTvhjWxGj7WaQ5cFmXq3Y2wdg2RCypHWJPxre1RoB6LQw7EhF3Y6N1xEQVARva7GJXR6Rb/4mIAKKN5LtB/jq/zrfxDoQkqiYx2MIV4QAHcky/9E0PQGQ3aS8lsFKOK+S9Fq8WKoaHDqFseaFFqmcpoTqBQwUBi20I+lqI/vdf/A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0550aa1c-fec7-4d3a-1376-08debfa14184
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 05:47:24.6324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UPHV7XxsVxrqwXgf0bacVnYUCAWwmPyOnw5Dq8gTtBs1xwK92ZBUinnnAd1tK7QD/YCMNe6TR1+6fZu/tT1Y8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6219
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


On 5/29/2026 5:30 PM, Mallesh, Koujalagi wrote:
> Hi Riana,
>
> On 29-05-2026 01:22 pm, Tauro, Riana wrote:
>>
>> On 5/22/2026 5:36 PM, Mallesh Koujalagi wrote:
>>> The fault injection code was scattered: the GT reset
>>> hook lived in xe_gt.h as an inline function with its own global
>>> variable, the CSC hook had a separate global in xe_hw_error.c with
>>> an extern declaration, and each was individually registered in
>>> xe_debugfs.c. Adding a new error type meant editing many files and
>>> copy-pasting the same boilerplate.
>>
>>
>> Since Xe kmd supports other fault injection mechanisms such as 
>> fail_function which injects error with ALLOW_ERROR_INJECTION.
>> This patch does not cover all fault injection hooks.
>>
>> If we are only picking debugfs hooks. This is not really unifying 
>> fault injection.
>> Can you please elaborate why this is needed?
>>
>> Thanks
>> Riana
>>
> This patch solves a different problem than fail_function and 
> ALLOW_ERROR_INJECTION.
> Although both are used for fault injection, their purpose is different.
>
> ALLOW_ERROR_INJECTION is mainly for generic function-level testing.
> It injects failures at the start of a function and skips normal 
> execution completely.
> Examples include xe_device_create(), xe_pm_init_early(), and 
> xe_pt_create().


The commit message states that this patch is "Unifying fault injection".
But the file only consolidates fault injection using debugfs. If the 
goal is unifying fault injection,
every type should be part of the same file which is not possible.
We cannot have some fault injections part of this file and the rest in 
other files as you
are introducing a layer.

 From my pov, I would retain this in debugfs and keep a separate 
function instead of a separate file.

Thanks
Riana

>
> The debugfs mechanism in this patch is meant for changing specific 
> runtime behavior.
> It allows testing of particular scenarios, such as simulating CSC 
> errors or forcing GT reset failures.
>
> The main issue before this patch was that similar debugfs fault 
> injection code existed in multiple places, with repeated copy-paste 
> implementations.
> This patch improves that by:
>
> a. Reducing duplicate code,
> b. Making new fault injections easier to add,
> c. Providing consistent behavior,
> d. Supporting platform filtering,
> e. Making the code cleaner and easier to maintain.
>
> In short, this patch unifies the debugfs-based fault injection 
> infrastructure for better maintainability and flexibility.
> It does not replace or duplicate ALLOW_ERROR_INJECTION; both 
> mechanisms serve different testing purposes and can coexist.
>
> Thanks
>
> -/Mallesh
>
>>>
>>> Create a single, centralized fault injection module
>>> (xe_fault_inject.c/h) that manages all fault types through
>>> one table. Each type is just an entry in an enum and a one-line
>>> row in a descriptor array -- no more scattered globals,
>>> externs, or per-type inline helpers.
>>>
>>> Debugfs interface (under /sys/kernel/debug/dri/0/):
>>>   - fail_gt_reset         - GT reset failure
>>>   - inject_csc_hw_error   - CSC firmware error
>>>
>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>> Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>> ---
>>> v2:
>>> - Add multiple platform support. (Vinay)
>>> - Handle VF properly.
>>> - Rename to XE_FAULT_GT_RESET/XE_FAULT_CSC_HW_ERROR and
>>>    create xe_fault_inject_types.h file including those name.
>>>
>>> v3:
>>> - Solved patch apply issue on tip.
>>>
>>> v4:
>>> - Add proper header file.
>>>
>>> v5:
>>> - Properly refer FAULT_ATTR_INITIALIZER. (Vinay)
>>> - Change xe_fault_inject_descs to xe_fault_inject_entry.
>>> - Change 2025 to 2026.
>>>
>>> v6:
>>> - Change return comments of xe_fault_inject(). (Riana)
>>> - Remove full description of xe_fault_inject_debugfs_register().
>>> ---
>>>   drivers/gpu/drm/xe/Makefile                |  2 +
>>>   drivers/gpu/drm/xe/xe_debugfs.c            |  9 +---
>>>   drivers/gpu/drm/xe/xe_fault_inject.c       | 62 
>>> ++++++++++++++++++++++
>>>   drivers/gpu/drm/xe/xe_fault_inject.h       | 31 +++++++++++
>>>   drivers/gpu/drm/xe/xe_fault_inject_types.h | 21 ++++++++
>>>   drivers/gpu/drm/xe/xe_gt.c                 |  5 +-
>>>   drivers/gpu/drm/xe/xe_gt.h                 |  8 ---
>>>   drivers/gpu/drm/xe/xe_hw_error.c           | 11 +---
>>>   8 files changed, 123 insertions(+), 26 deletions(-)
>>>   create mode 100644 drivers/gpu/drm/xe/xe_fault_inject.c
>>>   create mode 100644 drivers/gpu/drm/xe/xe_fault_inject.h
>>>   create mode 100644 drivers/gpu/drm/xe/xe_fault_inject_types.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>> index 09661f079d03..d4acb8e9c3b7 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -361,6 +361,8 @@ ifeq ($(CONFIG_DEBUG_FS),y)
>>>         xe-$(CONFIG_PCI_IOV) += xe_gt_sriov_pf_debugfs.o
>>>   +    xe-$(CONFIG_FAULT_INJECTION) += xe_fault_inject.o
>>> +
>>>       xe-$(CONFIG_DRM_XE_DISPLAY) += \
>>>           i915-display/intel_display_debugfs.o \
>>>           i915-display/intel_display_debugfs_params.o \
>>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c 
>>> b/drivers/gpu/drm/xe/xe_debugfs.c
>>> index 22b471303984..8402189b24ef 100644
>>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>>> @@ -6,7 +6,6 @@
>>>   #include "xe_debugfs.h"
>>>     #include <linux/debugfs.h>
>>> -#include <linux/fault-inject.h>
>>>   #include <linux/string_helpers.h>
>>>     #include <drm/drm_debugfs.h>
>>> @@ -14,6 +13,7 @@
>>>   #include "regs/xe_pmt.h"
>>>   #include "xe_bo.h"
>>>   #include "xe_device.h"
>>> +#include "xe_fault_inject.h"
>>>   #include "xe_force_wake.h"
>>>   #include "xe_gt.h"
>>>   #include "xe_gt_debugfs.h"
>>> @@ -38,9 +38,6 @@
>>>   #include "xe_vm.h"
>>>   #endif
>>>   -DECLARE_FAULT_ATTR(gt_reset_failure);
>>> -DECLARE_FAULT_ATTR(inject_csc_hw_error);
>>> -
>>>   static void read_residency_counter(struct xe_device *xe, struct 
>>> xe_mmio *mmio,
>>>                      u32 offset, const char *name, struct 
>>> drm_printer *p)
>>>   {
>>> @@ -563,8 +560,6 @@ void xe_debugfs_register(struct xe_device *xe)
>>>           drm_debugfs_create_files(debugfs_residencies,
>>>                        ARRAY_SIZE(debugfs_residencies),
>>>                        root, minor);
>>> -        fault_create_debugfs_attr("inject_csc_hw_error", root,
>>> -                      &inject_csc_hw_error);
>>>       }
>>>         debugfs_create_file("forcewake_all", 0400, root, xe,
>>> @@ -610,7 +605,7 @@ void xe_debugfs_register(struct xe_device *xe)
>>>         xe_psmi_debugfs_register(xe);
>>>   -    fault_create_debugfs_attr("fail_gt_reset", root, 
>>> &gt_reset_failure);
>>> +    xe_fault_inject_debugfs_register(xe, root);
>>>         if (IS_SRIOV_PF(xe))
>>>           xe_sriov_pf_debugfs_register(xe, root);
>>> diff --git a/drivers/gpu/drm/xe/xe_fault_inject.c 
>>> b/drivers/gpu/drm/xe/xe_fault_inject.c
>>> new file mode 100644
>>> index 000000000000..096e1949624d
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_fault_inject.c
>>> @@ -0,0 +1,62 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2026 Intel Corporation
>>> + */
>>> +
>>> +#include <linux/bits.h>
>>> +#include <linux/fault-inject.h>
>>> +
>>> +#include "xe_device.h"
>>> +#include "xe_fault_inject.h"
>>> +#include "xe_platform_types.h"
>>> +#include "xe_sriov.h"
>>> +
>>> +static struct {
>>> +    const char *name;
>>> +    u32 platforms;
>>> +    bool skip_on_vf;
>>> +    struct fault_attr attr;
>>> +} xe_fault_inject_entry[XE_FAULT_MAX] = {
>>> +    [XE_FAULT_GT_RESET]    = { .name = "fail_gt_reset",
>>> +                    .attr = FAULT_ATTR_INITIALIZER },
>>> +    [XE_FAULT_CSC_HW_ERROR]    = { .name = "inject_csc_hw_error",
>>> +                    .platforms = BIT(XE_BATTLEMAGE),
>>> +                    .skip_on_vf = true,
>>> +                    .attr = FAULT_ATTR_INITIALIZER },
>>> +};
>>> +
>>> +/**
>>> + * xe_fault_inject - Check if a fault should be injected
>>> + * @type: fault injection type to check
>>> + *
>>> + * Return: true if fault injection is triggered, false otherwise.
>>> + */
>>> +bool xe_fault_inject(enum xe_fault_type type)
>>> +{
>>> +    if (type >= XE_FAULT_MAX)
>>> +        return false;
>>> +
>>> +    return should_fail(&xe_fault_inject_entry[type].attr, 1);
>>> +}
>>> +
>>> +/**
>>> + * xe_fault_inject_debugfs_register - Register fault injection 
>>> debugfs entries
>>> + * @xe: xe device instance
>>> + * @root: debugfs root directory
>>> + */
>>> +void xe_fault_inject_debugfs_register(struct xe_device *xe, struct 
>>> dentry *root)
>>> +{
>>> +    int i;
>>> +
>>> +    for (i = 0; i < XE_FAULT_MAX; i++) {
>>> +        if (IS_SRIOV_VF(xe) && xe_fault_inject_entry[i].skip_on_vf)
>>> +            continue;
>>> +
>>> +        if (xe_fault_inject_entry[i].platforms &&
>>> +            !(xe_fault_inject_entry[i].platforms & 
>>> BIT(xe->info.platform)))
>>> +            continue;
>>> +
>>> + fault_create_debugfs_attr(xe_fault_inject_entry[i].name, root,
>>> +                      &xe_fault_inject_entry[i].attr);
>>> +    }
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_fault_inject.h 
>>> b/drivers/gpu/drm/xe/xe_fault_inject.h
>>> new file mode 100644
>>> index 000000000000..91883ffb5f4b
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_fault_inject.h
>>> @@ -0,0 +1,31 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2026 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_FAULT_INJECT_H_
>>> +#define _XE_FAULT_INJECT_H_
>>> +
>>> +#include <linux/types.h>
>>> +
>>> +#include "xe_fault_inject_types.h"
>>> +
>>> +struct xe_device;
>>> +struct dentry;
>>> +
>>> +#if IS_ENABLED(CONFIG_DEBUG_FS) && IS_ENABLED(CONFIG_FAULT_INJECTION)
>>> +bool xe_fault_inject(enum xe_fault_type type);
>>> +void xe_fault_inject_debugfs_register(struct xe_device *xe, struct 
>>> dentry *root);
>>> +#else
>>> +static inline bool xe_fault_inject(enum xe_fault_type type)
>>> +{
>>> +    return false;
>>> +}
>>> +
>>> +static inline void xe_fault_inject_debugfs_register(struct 
>>> xe_device *xe,
>>> +                            struct dentry *root)
>>> +{
>>> +}
>>> +#endif
>>> +
>>> +#endif /* _XE_FAULT_INJECT_H_ */
>>> diff --git a/drivers/gpu/drm/xe/xe_fault_inject_types.h 
>>> b/drivers/gpu/drm/xe/xe_fault_inject_types.h
>>> new file mode 100644
>>> index 000000000000..d5402b5a3fd6
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_fault_inject_types.h
>>> @@ -0,0 +1,21 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2026 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_FAULT_INJECT_TYPES_H_
>>> +#define _XE_FAULT_INJECT_TYPES_H_
>>> +
>>> +/**
>>> + * enum xe_fault_type - Fault injection types
>>> + * @XE_FAULT_GT_RESET: GT reset failure injection
>>> + * @XE_FAULT_CSC_HW_ERROR: CSC hardware error injection
>>> + * @XE_FAULT_MAX: Number of fault injection types
>>> + */
>>> +enum xe_fault_type {
>>> +    XE_FAULT_GT_RESET,
>>> +    XE_FAULT_CSC_HW_ERROR,
>>> +    XE_FAULT_MAX
>>> +};
>>> +
>>> +#endif /* _XE_FAULT_INJECT_TYPES_H_ */
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>> index 783eb6d631b5..242683cd5906 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>> @@ -25,6 +25,7 @@
>>>   #include "xe_eu_stall.h"
>>>   #include "xe_exec_queue.h"
>>>   #include "xe_execlist.h"
>>> +#include "xe_fault_inject.h"
>>>   #include "xe_force_wake.h"
>>>   #include "xe_ggtt.h"
>>>   #include "xe_gsc.h"
>>> @@ -923,7 +924,7 @@ static void gt_reset_worker(struct work_struct *w)
>>>         xe_gt_info(gt, "reset started\n");
>>>   -    if (xe_fault_inject_gt_reset()) {
>>> +    if (xe_fault_inject(XE_FAULT_GT_RESET)) {
>>>           err = -ECANCELED;
>>>           goto err_fail;
>>>       }
>>> @@ -980,7 +981,7 @@ void xe_gt_reset_async(struct xe_gt *gt)
>>>       xe_gt_info(gt, "trying reset from %ps\n", 
>>> __builtin_return_address(0));
>>>         /* Don't do a reset while one is already in flight */
>>> -    if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
>>> +    if (!xe_fault_inject(XE_FAULT_GT_RESET) && 
>>> xe_uc_reset_prepare(&gt->uc))
>>>           return;
>>>         xe_gt_info(gt, "reset queued\n");
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>>> index 4150aa594f05..f8e3ca63aabb 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>>> @@ -6,8 +6,6 @@
>>>   #ifndef _XE_GT_H_
>>>   #define _XE_GT_H_
>>>   -#include <linux/fault-inject.h>
>>> -
>>>   #include <drm/drm_util.h>
>>>     #include "xe_device.h"
>>> @@ -38,12 +36,6 @@
>>>       xe_gt_is_media_type(gt_) ? MEDIA_VER(xe) : GRAPHICS_VER(xe); \
>>>   })
>>>   -extern struct fault_attr gt_reset_failure;
>>> -static inline bool xe_fault_inject_gt_reset(void)
>>> -{
>>> -    return IS_ENABLED(CONFIG_DEBUG_FS) && 
>>> should_fail(&gt_reset_failure, 1);
>>> -}
>>> -
>>>   struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
>>>   int xe_gt_init_early(struct xe_gt *gt);
>>>   int xe_gt_init(struct xe_gt *gt);
>>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c 
>>> b/drivers/gpu/drm/xe/xe_hw_error.c
>>> index 5135e8e4093f..192e68e847a5 100644
>>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>>> @@ -4,7 +4,6 @@
>>>    */
>>>     #include <linux/bitmap.h>
>>> -#include <linux/fault-inject.h>
>>>     #include "regs/xe_gsc_regs.h"
>>>   #include "regs/xe_hw_error_regs.h"
>>> @@ -12,6 +11,7 @@
>>>     #include "xe_device.h"
>>>   #include "xe_drm_ras.h"
>>> +#include "xe_fault_inject.h"
>>>   #include "xe_hw_error.h"
>>>   #include "xe_mmio.h"
>>>   #include "xe_survivability_mode.h"
>>> @@ -25,8 +25,6 @@
>>>                            (PVC_COR_ERR_MASK & REG_BIT(err_bit)) : \
>>>                            (PVC_FAT_ERR_MASK & REG_BIT(err_bit)))
>>>   -extern struct fault_attr inject_csc_hw_error;
>>> -
>>>   static const char * const error_severity[] = 
>>> DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>>>     static const char * const hec_uncorrected_fw_errors[] = {
>>> @@ -167,11 +165,6 @@ 
>>> static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == 
>>> XE_RAS_REG_SIZE);
>>>                            pvc_master_local_fatal_err_reg : \
>>>                            pvc_master_local_nonfatal_err_reg)
>>>   -static bool fault_inject_csc_hw_error(void)
>>> -{
>>> -    return IS_ENABLED(CONFIG_DEBUG_FS) && 
>>> should_fail(&inject_csc_hw_error, 1);
>>> -}
>>> -
>>>   static void csc_hw_error_work(struct work_struct *work)
>>>   {
>>>       struct xe_tile *tile = container_of(work, typeof(*tile), 
>>> csc_hw_error_work);
>>> @@ -507,7 +500,7 @@ void xe_hw_error_irq_handler(struct xe_tile 
>>> *tile, const u32 master_ctl)
>>>   {
>>>       enum hardware_error hw_err;
>>>   -    if (fault_inject_csc_hw_error())
>>> +    if (xe_fault_inject(XE_FAULT_CSC_HW_ERROR))
>>>           schedule_work(&tile->csc_hw_error_work);
>>>         for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
