Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9C6C982DE
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 08:36:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF7610E359;
	Mon, 21 Sep 2026 08:36:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D3RexaMr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F13110E359
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 08:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789979768; x=1821515768;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HF3IXj/iGX36yu0W2e2TR58OqxmFjIcEgflssbtJqzI=;
 b=D3RexaMrElsMsVF1W1KgBXrYcDHwj2cvWpjX2F6P6KETJQBFKKKyg0Xa
 kOcpkBJ8DA6OVwr0bf86enqwtF1o13OUAYj/n4sJ94+2czJB7Om+EM8Ko
 tPhuyPHh8ajb26pjUy327YehQGykVjm37mhmS/momQNCA/9rbo+9ruNPh
 ONwwgLTjqdKu8l77ugG5pf3lFh4LT/4g7uJ+l5V5SzEpcLc/8Q8YQjEpO
 Rk9kw4lBnlLmoZJPh49a9RQ8ahaLeKgzDle8+zj41mty+h77th7OW46ID
 kl6pRq2YfDt//uv6Cl8YHtrQ1fhwXDisYHFXltp3SvWtc/MSPLLUx+LM+ w==;
X-CSE-ConnectionGUID: eLQ5K0pQRACsrSPjjJCYyA==
X-CSE-MsgGUID: xhXVv+TMSC6MGfPp2avd7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="986397"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="986397"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 01:36:08 -0700
X-CSE-ConnectionGUID: tmNZP+LOSH+Zyzlbkc8t+g==
X-CSE-MsgGUID: zIEgEaayToaTyjcDcQKsJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="271096132"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 01:36:07 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 01:36:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 01:36:07 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 01:36:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HJQM75atApc9LxkN72HLlwsQEzMoF4YJ5pA71vpzcdmUQzA6Z0zO++Unr9buPaMmpCHneRgucE4kTOl2ghnltgC5sgmbFwYhW9N6mcIlWteugjmKS1uhKYw8mLLqg9auC7+6UbUY2YB6qij1rg1JPWKNeOoOg122VTPA9Na7AEKJptWgNF7OnuWW9rVZEdmbMWdrYLBDG1AUW8f1/U4Fbj8P9qvCje8dY2oxRHe5jt8tSgxrOxWs/KvDpGPn+1Bl2XYeKb6VpMUkl7/JZWJ1bt9N6wawVknRLdI+R8uqb7O6Htei7XFH6C0V9P2DOW4uRndIeFNuL4PuAjNDhlyf6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YN9ASIYWfIMAJZlWzfzgtzLbMsTvmXSHEsD1IWL/lC0=;
 b=pt3o/vug46pNBu2wCSwrAEFCKVrL29yyo0yzx1vS+irwsFZQgw0ce0vmHd8r5QebnFSl8tJURIHApCBRklDaiej1PafYqOonqY9qcDv3hvrSFjBnBDDbpFXbTs/3k1Z8hmbqRkchngMXTtikdhWKqj0B7NpNDxtwf2TyOlaIQ4HBjx+PxSK4L/ljQfRFgYniv68fI9undB3gnQfFzCaigplM8VWRH/DSeQMzsRq8ZHvXa1feW6vd47nt410acXyaGltcPzWG/lUpLcxcAlxxo22krAPMGzRjjvV+wiYqoD6sMYUaDyJxyCXCnaM5v9T6PBU45BArB042oJvMWJ+sVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 08:36:05 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 08:36:05 +0000
Message-ID: <9ceee528-88be-4913-9ba1-c6e1930f75aa@intel.com>
Date: Mon, 21 Sep 2026 14:05:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 4/4] drm/xe: Bump prefetch BO LRU for already-valid ranges
To: Matthew Brost <matthew.brost@intel.com>, <sashiko-reviews@lists.linux.dev>
CC: <intel-xe@lists.freedesktop.org>
References: <20260916112828.2528881-6-himal.prasad.ghimiray@intel.com>
 <20260916112828.2528881-10-himal.prasad.ghimiray@intel.com>
 <20260916113301.6B98D1F000FF@smtp.kernel.org>
 <aq2s87pHUQarNmFa@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aq2s87pHUQarNmFa@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0188.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::15) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DS0PR11MB7408:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bd10a26-612d-4e0c-7b2e-08df17bb603a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 7dvyayjmbXU03yFprLmpSXXYPmD2F4w4mcvMoJIEtXIqcH7xsdqeaQfZlvSQuOHbEsQNYulbBlPxwrqC6t4aawMzEGpE5ybYge1ATUUT7T8ZaPb/5x5oXkAomFC90puUiDYoOZs+46UjN2N8Wcn+Oc4+6JP6OzE7ADmv+PkIz+S7Oylbp852UfWe5EFE3maqrEOv0x4uRIOC5JkAGzLljGqy9YGfFiZs47YNwG23tNaVGrJiq5KiEVWfc4hs4rE0JEhxgqo9K/tYQ0pXd+iiym+2B8BW43CY13Z+uLiPYfMskK5IuDbf67npNe47TmRX4P3Oa0GYwmyK6w00emJBEvzBoJLcwZ+onutXgDiMYD2YdKhe9wgV+gk2goUaYvPVoKC1tOCmKgLn3NNWlB2wlMQNPBzV9eFzed7zbcgJxHK8WlX3B6J+VCM83ZqKRqNnK5JJAORFl5Rh+RxsIBG6CZ8WdnJ0v1TXjgFJcZSdShN/P55Ul6kjN3XC0mEoC6SRWEjDYHShuaf1joXSpwfdIBkdLdRWUn25bC/ER3D+/iGwGu9PF+B7whQvgkptSOFTYoML8cJoOXn9vC1m3mDWHX+QnI24b3FbKA4IytMqeeU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFRCeEYrL2tYanRQOWM2VStOdGtyalFOTE44Rks0Nlhob1B2V3NWR0ZkVWh3?=
 =?utf-8?B?ZFBhN0NmUHN5SWd0QnNURHNKVlFBVUdkVG1TYmZyc1BJbVJsVWRtdFA3YTV1?=
 =?utf-8?B?MDZ4NmF6Rkpjc0RZYjduS3hRczI5M2RnY2FiWTdDTVN5MlUrQ3B0bmRINDY3?=
 =?utf-8?B?dmVqait1bXN2dXB1b2tVck1zbHlVNjZ2aXhuZ1VsbENtWForUDE0b0VpQVVJ?=
 =?utf-8?B?R0NNNnVpRDJJVVp6L0lkMU13dUY1NUV2WkJxN21rYzV4QUhtQjNwdmsrQy9C?=
 =?utf-8?B?eGo5QkFZbHM2RjlvcUZyVlNSYVlCZitWdm40aWt2WDBHeHpzRDlTUFhaWGJL?=
 =?utf-8?B?bkxoTGE1M3cremRuMk5ETXdkR284Q1gxSnkyNnR4S0MzTVZ4dmpjRUZQSkkz?=
 =?utf-8?B?N2N5ZDFyNzFXcnV4WjBEQjZQTDVnN0RJU2ZEZVpLMkNJTHdMRzNJSUdZWUND?=
 =?utf-8?B?bWFTTXd1K0Z0bEQrcHQxem03QWRwRjc3VG5IVGdRZUw2RWtYUmJEWmY5M3h4?=
 =?utf-8?B?TFBvRkFFYlZ3bU1nd0p3aksrWUpGeVdKdEFPVGI0RjRwTzV0UFloWkZEc1NV?=
 =?utf-8?B?VnRSWVRHMnRXdVlxckVtaVBvQTc3UG16Vmk5cTE2LzFEYUFkaEVnSG5KMzVS?=
 =?utf-8?B?WmtIeWJudHVkcEMvcnQveXI1K1plWkZGQ3gvSDdzTHg4QTRTZWx3WXAyNmE3?=
 =?utf-8?B?cjRUZzlSU3ZpNE5zR3l3citob0dnNlBxVlpBREFxNkJlTkhRSU8wV2dSbUln?=
 =?utf-8?B?QU1uTmN0MkgzdzhDcDJWTUtsNWNLWjlkanhoQnVWSEhJR0RkeDUxLzc5cmJ1?=
 =?utf-8?B?Z0tUcDRBaTd5VnZDQXRQMXJZNDAva1N1VUFjN0JnUWYzb1R3b0RENVpNUWUy?=
 =?utf-8?B?eVY4U1puR2dsbW5OUnhTUVZybEVMYVE3d1ljTDh3MGhYaVYwbnU3SmxkbXBJ?=
 =?utf-8?B?RGdKRGZTS29IaktYbXp2b0g0TlkvV2JtQ2NtNUZrNnRGS000dGgzK0hoQWNP?=
 =?utf-8?B?akJodEdtUTJpZEl5L3Z3VDdDSkt1S2VnTDdhNDQraTlLWUFFS2lIbUhUNDVU?=
 =?utf-8?B?VlZ0RHo5RzR0N0tzLzgxcER3VXJzd0V4TXRlTk5tU00rb3RGMTJ1cXlZQ2xS?=
 =?utf-8?B?RUpCeFJuUGY4azJETENSbFpKejZMTFZSK242NkV0SGtVdngvR1lPbUVBMWh5?=
 =?utf-8?B?MFEza2t2MHlCRlZvVFJSaU9sZm4rKzF1NFByYkdHQVJneXJQODE3WUx4Nm9t?=
 =?utf-8?B?RCthM2ZlRDJPNTZPRUU2K3RxTXF6cE5zeDcyTTVGMzdFeHQzOUQ5dUZEbUJS?=
 =?utf-8?B?THFFVEd4NlhJczdEMlkrMFU5VndIUlpaQnRXanY2eVV5YU9xenJDdzk2aENC?=
 =?utf-8?B?MmVjSjZDcW5NbzNEa3JvdlFvNGxSdHNRVUdLRUJGZFpONTFmZjJVVkRpY0dY?=
 =?utf-8?B?cUUvdFJtb0dkdXUrQjY0RFRUbW1KSHBSSkk5M1lDVElkME5MNVg1UkJpSmRq?=
 =?utf-8?B?OU1tT20wVVBIS3VkRmhwNnVrTVBma01lZW9oYVJWcUY0blhNTDdkSHM5OHFX?=
 =?utf-8?B?M2h0MlpuRExkeEUwYTQ1MHp3eTRUN0RhbE94Q0x0eXdtRHNWQS9VSW5ibnkw?=
 =?utf-8?B?elhvQ3hQS2JvWHBMcHBOZXJpR1lhWGpVMTFLMnZkcWs1VStYTkpReEdsMVlF?=
 =?utf-8?B?WkVqMGNxd2xSQ1U0cnVCeHR4K2JWazlQdk1sK2JKMkhzRnZyTVM4UmpnQmZG?=
 =?utf-8?B?ck5BZm9TME1Kd0tWbGVISWd0Z3dkSjVsNmc4ck9TTS9KNlUxa2Iya3ovelZR?=
 =?utf-8?B?b0RCMVFNeHcyUFVMMGJNcThTZ0pwMkQxNG55ckpXNXpWa0JWYVpWM2NUeFh0?=
 =?utf-8?B?dlFoQ1d0ZUpPSk12cFl0QnY2bmdodTJmZENISUZxVkpDM1MrNm1QYzhPK3hV?=
 =?utf-8?B?ajdWZlJxbmtoOTRLdVNBMUkyMzhUUGlPMjJwZHhFOTRSTWQ5SFF6MDE3Vm83?=
 =?utf-8?B?dG9VaEdMUytJMnVSRVlmUWsxNE5vQndBdUhtcnJLMW54MENPb1l1ZUNmVkE0?=
 =?utf-8?B?NGx5ZFJiSHE1UjF4dUZxWlplZVBSRXp0TlQxK21BdHVEY1JRWEpBWGFhMWl4?=
 =?utf-8?B?a0JKZjI5ZmdBd0hselQzS0RlTkpCQWxOS2JNb05wVFY3ZGpVR3R0QnlsTWov?=
 =?utf-8?B?Z0tjTmFOWEw3VGdYaFN1TnArWHlLNFVqc1BUYlVLZXdTRmErV1MwM2NFaWN0?=
 =?utf-8?B?VVh3QU96Rmt5NXV5QmlNVGFLTitaZHpWdlJTRzUrbHRwQWlMMjVjT0xIN1lD?=
 =?utf-8?B?NGxTbjhDZUljRDlvYWZTQUxHWFR0YjVaSm9RaVdWcVlxTU95TFJoVW5NUTRm?=
 =?utf-8?Q?f1MGULeSpQ+UoDNQ=3D?=
X-Exchange-RoutingPolicyChecked: KFrq17XqdIiYTFF1aE7uAYFFNaGuLnK7np6qmFaW37nyR0H3M5Chy4qlt80Hs308zQ8b5sapqJQnsfY76FSxvFL4bG4xI1MjKaafthXVC8yXK9AY6mPmIVSua4c92Ecni6aytmu6IomLnjHTSSSD3+xReeTHsjLPOJ540KQf5pjGabh2jkyo88QDQFKrsVR8etXcVOrkX04p3BVY6VLQY8ndSqLprv4hwtSGwNzHutlfWBR+HCc60x3Jcfk3svGgP8aDvYCvCHxu3ikGAOdiV5XWy6etJIRik9Gh/cVsY0SLi2jGd/BJ6zvQlduz365q9Le/MfCvg+yKTIYC7O8xPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd10a26-612d-4e0c-7b2e-08df17bb603a
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 08:36:05.2494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DCKIydPEKd/5pjWJT1n6D+DwTpGcH4E00dN/PTfgE8wx8/RNPbe+AP/D841Rg+jR+dV0Qz+VHBK16KvX/AcIQ+UFGPLDVI7+9OrBZdH04w8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7408
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



On 19-09-2026 02:58, Matthew Brost wrote:
> On Wed, Sep 16, 2026 at 11:33:01AM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Medium] drm/xe: memory leak of svm_range on prefetch_lru_bump failure
>> --
>>
>> commit 09ec19c469b99c340c07a04780a85f997af72901
>> Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>
>> drm/xe: Bump prefetch BO LRU for already-valid ranges
>>
>> This commit introduces xe_svm_range_prefetch_lru_bump to re-fault CPU pages
>> without touching DMA mappings and move backing BOs to the LRU tail for
>> already-valid prefetch ranges.
>>
>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>> index fe9ccaa129122..948060a702470 100644
>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>
>> [ ... ]
>>
>>> @@ -2583,6 +2583,15 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>>>   						  dpagemap, &valid_pages)) {
>>>   				xe_svm_range_debug(svm_range, "PREFETCH - RANGE IS VALID");
>>>   				xe_assert(vm->xe, valid_pages);
>>> +
>>> +				if (dpagemap) {
>>> +					err = xe_svm_range_prefetch_lru_bump(vm, vma,
>>> +									     svm_range,
> 
> How about we just make xe_svm_range_prefetch_lru_bump non-failable? All
> prefetching is fundamentally an eager optimization: we hope it succeeds,
> but if it races, oh well, a fault will fix it. I think the LRU bump fits
> that mindset as well.

Makes sense.

> 
> Matt
> 
>>> +									     dpagemap);
>>> +					if (err)
>>> +						goto unwind_prefetch_ops;
>>
>> [Severity: Medium]
>> Does this code leak the svm_range?
>>
>> During a VM_BIND ioctl with prefetch, xe_svm_range_find_or_insert() returns
>> an svm_range with an incremented reference count. If
>> xe_svm_range_prefetch_lru_bump() fails here, we jump to unwind_prefetch_ops.
>>
>> Because this error path is taken before the svm_range is tracked in the
>> op->prefetch_range.range xarray, the cleanup routine
>> xe_svm_prefetch_gpuva_ops_fini() will not know about it and will not free it.
>>
>> Should this error path call xe_svm_range_put(svm_range) before jumping to
>> unwind_prefetch_ops to avoid leaking the reference?
>>
>>> +				}
>>> +
>>>   				need_put = true;
>>>   				goto check_next_range;
>>>   			}
>>
>> -- 
>> Sashiko AI review · https://sashiko.dev/#/patchset/20260916112828.2528881-6-himal.prasad.ghimiray@intel.com?part=4

