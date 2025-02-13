Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E88FC021A0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 22:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA4C10E00F;
	Thu, 13 Feb 2025 22:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FldIQjzc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DB310E00F
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 22:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739487070; x=1771023070;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fvMqQwyWajvGZVKWSfqvLz2Iza4L4Jj0IWeVbIB2UTw=;
 b=FldIQjzc7Xzy6QZ14POoEkzzoZez7qQSbG14XHgIUZ2HDN5P/fGHtH83
 AX0UE1hpR5RImihQqlKHu55WFzEB1hGtnZjuqqFmeGf3+FY60+TnlmfgI
 Asrqv2eoSRe3oN7KQnZNz6Yue7wK6gQzwg920KnJ0943cZmuzc4eIeF9u
 hCjOA+xGJbWCpsc7o5UJKESB+HTIIjmXlk1kiN63P1VOO7JCk9uzAYpIs
 GhklkcoWB3ztcCCytA23kodlVjER1Mab/acmbSgyal3VyPlR2Xd9zQCUl
 r+9lzAb98g+hc5kkJS1Ubn4gg8MVhICjEF80p3toOEhN8I9Qziu0Ezuzm A==;
X-CSE-ConnectionGUID: jF8PmifPQriVpvTg6DTxEQ==
X-CSE-MsgGUID: rr14oLdyQ92HZ1Nti1vazQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="62684681"
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; d="scan'208";a="62684681"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 14:51:10 -0800
X-CSE-ConnectionGUID: PNZzTFc1Sla7/ZhLG9C6hg==
X-CSE-MsgGUID: alkPe4I3SKiYSqiBjepWbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; d="scan'208";a="113163467"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 14:51:06 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 13 Feb 2025 14:51:00 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 13 Feb 2025 14:51:00 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 14:51:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2oHFeA3BsSv3Z0mClePTBP66HJ+/dZQeKl3lTqwmYXETXpS6VAl2M+yNbFZZqg9qe0AhhsBOY3uK8YZh5XH/z+AO3fzRfK9hs6hA9TQt2gmvtDGTtHVZypsMhdGsIKPXgjK+T9AjlibmWsxoaJduwddABbV0p6JPUSABBNnUf8bHAPEcwpO/bBmeXsRMx0dc47Y+TbarD6ODYQwEShagMxKgKfH/RkxxnWRqFOTc/YzgeeYtu50IZ91tyRDxqkWRLS5sci+qGKVGtZ/tARIdbno21EFGJKlA8omtmrMNp1R4YKAquodSKR+iTNxJSUfYoLVj2gHAvCAaivv1HJR7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EP4naBP4IG9JhMkdxYGxIBqyalZZY6IN4bhCqEl0X1I=;
 b=XiQ2kT/TmAXcECVPRVv0o9/w1Y4KXet52sZEAW60aSY6jw3BXTy+sWV8CFdWKBEVmlWYN5u3rXbnhkMEP4Y9/XWRqLsrq0LxHA0Jg4y7fRM8Nn/7qZwj4xvwPo+NGm2q4IOTgA2I5EzvSYtapiHRswXsVX1wT73TnjN+wFO1yh1nvPJfrcL4IZU4GfHac3XSxqWABe3oSwIIkYFzr1B9jJEFxjs7HFw8YGrPNWhFSb6LUvxj/A+ROtnBnssxd9fJvsfofwAjAu/u9F1tmyeEgzo+vWXDcJlMP5Ead+js/GpY/wSgm7woV22jWCvGVkDtmQVOAwXSwK69Vo62RU0Nzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SN7PR11MB7089.namprd11.prod.outlook.com (2603:10b6:806:298::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Thu, 13 Feb
 2025 22:50:58 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8445.015; Thu, 13 Feb 2025
 22:50:58 +0000
Message-ID: <ad9268df-0e8e-4cbb-9a04-6cd4a41030fb@intel.com>
Date: Thu, 13 Feb 2025 14:50:54 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Stop reading masks from device memory when
 populating the ADS
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250213214053.2191635-1-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250213214053.2191635-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0221.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::16) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SN7PR11MB7089:EE_
X-MS-Office365-Filtering-Correlation-Id: bd4be229-1360-4c49-b3c5-08dd4c80e166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2pvUFViZTU1eGdwcTlXU2poaFFXNjNvbGxadnFQUVEwUVRBRml4eENlMFJs?=
 =?utf-8?B?TGt4Rm1HZHdpVWNrNmlHQVhuajhyWS9IRXRnVDRtQkhDZUsybTF5VlVNY3RM?=
 =?utf-8?B?R29PUkYrVjZsMWYra204RzQrWGZtOEZzRlUrcXRJVElMQ3JqRlJqZUpZYmxl?=
 =?utf-8?B?SEs0bnM1UHY5b3E4OExJSTZTb3g0dkNycEpxZStjcmg0VWJQMTlTNExmSUdp?=
 =?utf-8?B?SkYycS9VbjlzNHZENmJ1OUxLTzU2QWpoa29XTHJpamN4bCtYVXVwejg4RENN?=
 =?utf-8?B?eWlBeC9NWXAzYS9vV1J0VXhDMGQxOU9ZRzNiSWJtQW1MOU83S0R2VHVXTkZX?=
 =?utf-8?B?b3I4Z1czS2RTTUZCREpzMGpPeDNvQ29KTVNBbkRpaWhmcHo1dG04TGpuRGl4?=
 =?utf-8?B?U3JiRkx3SVhOQXA1WlFvVjg1ZmZQUjk2a3c0dGM3Mlc4cEVYNTZnN0t4TWUx?=
 =?utf-8?B?WCtFQ3pGMENlOUxzZnpqWkExdTNEUVBtcFdiL0JDaEozMjdMT2ljZ0J1S05Q?=
 =?utf-8?B?Vk9VczBsak9pRkJRdkJvb1FhQWlzUWJkbThsKys3NjRUbDRZQUpiNGFhelZl?=
 =?utf-8?B?YnBycm5McS9ScmNGek5MOUxxNGZZaGpkdVdZYm5LK3hjdER3M21XSzFDNVlI?=
 =?utf-8?B?WHpaamFETWc2ZnNvTEVISmFDaFVrc0twUUM4cjJvODBlNm9XTnA1aENvNTFE?=
 =?utf-8?B?aHM3NWw1K2JicUxrUWNUWDRtdEVHRVBRZ1Y2ZFpxaEl4TkpCYlUyNmd1elN2?=
 =?utf-8?B?UkxpSUFOaldaeDViZVZIdGZBV3JyT0R3M0pad1QyMFFDZGVkdlFLazBoS1Bt?=
 =?utf-8?B?UUhHSndFbXpia0J4L0poRW1DK1lsOG5lMUN4aXpxMnMydXRrNWVRVDlUMzBT?=
 =?utf-8?B?WUVTQlNmWEpjN0hNNnpXNlh5YlVKaklQWU9FVkpEZmZLTkRwT2NTK0ZpZWtw?=
 =?utf-8?B?VUZFS0dDdzBMYmZET0Q2VWltTHA0elJBMENEUXM3Mk1FN0lWOWpsRG5LaU9w?=
 =?utf-8?B?bEFORUZ1Q0JhSlFJS3hjUlJSMUsvdkdQL29mSEx6ZHJyZjlNWlZYelpuR3Qw?=
 =?utf-8?B?eFg5R0tocVRqTGpNR2FFMDZzbGo3NDdsc1V1ZTlsbHVsRlQzdDNheFF2ODc0?=
 =?utf-8?B?dVdpRUlLc1FHenJtT3V0aTNUQjlEYng3eXdLV2xUQkpIWGx6NlFxejU5UCt5?=
 =?utf-8?B?WE52TW14WGxUd3FoQWZjYjJVK1B5c0lYbVNxRFFCTFcvTHRwTlpOV0JTalJp?=
 =?utf-8?B?ZnFEaWFac0U2bVNvNHJha0dmekFnZ2RUT1Y4U0V3UGlQaGNCWmZ3YUs1cXBS?=
 =?utf-8?B?c2hpZWppVm9oS1ZPUEN1UTl6MzAwekJ2OUFKa3VTUkw3OEM4K2lQTDVqUzhI?=
 =?utf-8?B?VUJMNFRueTZUOFc5M3dKRHN1VVhPQThvNnlHazVyTkEzWUlyd0ZuT04vOFR1?=
 =?utf-8?B?bXNOMnptUWJ0VVU3SzJmSHFLMlArSHJ2TFZ2TzlXOStpcDVKOVByWTlrVFRQ?=
 =?utf-8?B?L2p0SGtnVTdoOWgwZnA1SzBRZzZMTUM1eHhpTXVlRjdKc3BRQjNoTk9XTEkw?=
 =?utf-8?B?c0l1L1BiaUxmTWlnOThmcEx6K1dUOWhkam56MTU5dDY2MEEzZ2Z0Sk0wMk1F?=
 =?utf-8?B?SnZoMzBXNjJxT2FMT3hSclFmczNGK1pGenpKbzJ6a3I3Mk5BQmtzczJHckNs?=
 =?utf-8?B?YnRjNXBsT1Fsd2phSzdRMlhhaVhBcE1EckZ5YTVuUnhKcUIxbFNuSjN0ZDBr?=
 =?utf-8?B?Y1cvT2FURnlzQUhvUmJqMUlCQy9URDlPaFBDVisrYTIxcjJkdVExNVM5MVlF?=
 =?utf-8?B?aklNbG1IaHppbERUeGoxU1Mzb25tYlVDem9nc3hBVkxVUDFZN3BlckRwdHFw?=
 =?utf-8?Q?ytCSAXqfIyzAR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHJrM00wUDBOa0VWZ2k5a29vaUtDM3BNMHpObStMdjlFRjFuSGF0TFpOSVo0?=
 =?utf-8?B?NUw2S3VXY1Y3aWZwR0ZCNllmQlg5WklXUGRQckNnS2NqeUxpVGV0NmYzM09V?=
 =?utf-8?B?a0N6VGZMQ3BLRGNtS1lqaFlyV1Vubml1eGp3eUpCZmdXNmZRT1RGMHZGMVRr?=
 =?utf-8?B?TStOVlhpQ3JjYVFRMEE2WFNsS3JKejA3QW45c2FuTTdTVnQ1cGZhVnMxQm95?=
 =?utf-8?B?a3pxTFdZbVNQMC9WVFFLaG53aEM1dkJqN1VlZ3pxK0JXbU9aSzZCMlN1b1BJ?=
 =?utf-8?B?WFhRUDNZbk14V0ZENFZ1OE9rUlVpSkJQbWNMcVg1di8zSGU5MnR5dTF1L3dm?=
 =?utf-8?B?UFZkbG45amVXaklmRzFkQ3VBSFJOeDMvMkxuSGF0UTBHU242ai92RlZyZ1hi?=
 =?utf-8?B?MXVWZndxMU84MTZQU2ZlejVCVDdqWmptRS8yWlYydWFVVmlTTXBROWg2bytV?=
 =?utf-8?B?SkM2cE9pbk5EOVhpMUJTSmF6NlFTUGE3K3d4QlBXWk4wMStybVVuaTVrcWRr?=
 =?utf-8?B?NDBUVGF4T28raGJtWW1xR2R5UzdTbEkzdENHUFc5TVI1YlFCWEhhaEVyWUZ5?=
 =?utf-8?B?RDhnUi9qN2RCMytndTlmY3pHamE3bWNTWTZUMzUrVmsrN0FVbGYwTmFMdElz?=
 =?utf-8?B?dVZyeVR5aTRHSFE0cnhRZ01NUzY4STV2TVhIZk8rY0x4SWtnQ3lnbE5LYU9x?=
 =?utf-8?B?Ym1XSnZxK2xkT3NOd00rOTd0bTZPeS8weHY5R2RaZzR1Um1lZkdSazA3azJS?=
 =?utf-8?B?Q0Y3M2w1TXEzbGtva1o1YWJmVzJyRnErZEFCeTMwajBsVm5VQlU4Wjl1UGRU?=
 =?utf-8?B?QnFpazRSKzdCaTVKdzg1Sm1SbWxhMS9qRlpwbGJEY0RnNDhGMk5uMUpmQjU2?=
 =?utf-8?B?bGdDcVU5VEwwb00xbTFLUXdLVDlLaUVrMGxUWDdkY2lLdHc1b2luNVlJZnZN?=
 =?utf-8?B?Z3hRd0pkMmk4ZElhRk5MVFNsNktlSFFJdE04TzZyZ0dmU3RHTmYvVnVKWk5T?=
 =?utf-8?B?SmJQTTBDOUM5WnNNK21yY1RIcXk5dDhnZHVKdlRpS0lNOGR6SC8vRFZpaFdj?=
 =?utf-8?B?L0thMXNUYW1iUEsrckdZdG5kRHd3eXJ1cnY3VGRiVU9jeWE1T25qUXhoK1Vi?=
 =?utf-8?B?aUhOSVphRkxoVnVHQkJwNGxpVHJUYmZBa2o2dFFKbmpaVUxPUlA5MWw1ckEr?=
 =?utf-8?B?YmtjakROQm9RU21zV2ZHVGpFUk14N3dnRmRFTkxTK0RzTkFGRTRUcUlBQ0pm?=
 =?utf-8?B?VWYxM1FCQjdWOE1QOE9zMjVGaXc2NTRJbkJCczNWVEYxSm16UElJU1o0aUhY?=
 =?utf-8?B?TkZObFdMYTRuQTFJQ0k4Qk1La2xoQ3gwMnVBdGRVTGVtYWRES1FpelA1eldZ?=
 =?utf-8?B?TDk3Q3Jqa2wzYWhZSXdzdDh2MFF1SVBncjVtVWR3ZWVyRit2djVYaEQ1cG93?=
 =?utf-8?B?RFRzWXg0bVRtNlN4eDBmOUFtbzRFcktVU3NjbVB0ZjZHZTU4UmJ1ci9qVjFw?=
 =?utf-8?B?eHVHSjhyQnNuSUMxZDUyYWJ0eFN2dENhR0xYY0s5Y1hFUTE2RWdVbXpUV01v?=
 =?utf-8?B?Zzg0NnlPay9EZDRxU0h3d1EydUZ6VmFnbmFKNkg2YzBPYng4TVpCdzJSaFZz?=
 =?utf-8?B?RHVsRjdZODE5MUxXbEdFUTYrdDAvSTNRMDVXTUpmNng0NWdIQlQxRzFRSmpI?=
 =?utf-8?B?VU5NcEpRZG1FQ21SZkFRcVVBWTA1akVRUThTTGR2VHRiZHhIS2VKRnNBWjdY?=
 =?utf-8?B?QTBKQzA3bXhwZ0FWcHZHWXdlMGRYNUhSMG0xY240b2EzZlJ5T2N0WVhjRGFx?=
 =?utf-8?B?Y08wL1ZQWkZZVXZxVmx5amdvTUJzdHhwNXFHOHg5dXRJNDBTZStOdDd0RXBJ?=
 =?utf-8?B?YzNjRUIxUnZGMHhkbWFlMzlOVXJtTmFtVEVQVVZ3TlpkMWJiRnptK3YrVlBI?=
 =?utf-8?B?eDVyOU5wcnI5NXRIYkR0M3hLWEVWRU9EYTU4R2g3bmpHZjkzVmF0eXo0TjEx?=
 =?utf-8?B?V0syd2FidXdSbGROQjl0Zk1hT0dLanE3d1Eybmx3dlk0T01IY2FZY2puSTB3?=
 =?utf-8?B?UldWQ0lSMitSWkZpVnMxaU0vUGNVS0JXcHVwd0FFVTZmRlViMlJSbFBjZ3cv?=
 =?utf-8?B?RlgxOWxGZjFWUkZQT2c2SUdOSEtMMWVYWktvVzFrVGkzT2dRVk9yUVFoU00v?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4be229-1360-4c49-b3c5-08dd4c80e166
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 22:50:57.9701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kiA7UJPasWei2QIzUN1djyts3BcXwk4AjhKsgBsVBt1lZCfWzThCS9gMBFVwFkyHjLTJATbSJzvaYkcStIK059pgWnxoqWxGuINDmjl3Qew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7089
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

On 2/13/2025 13:40, Daniele Ceraolo Spurio wrote:
> If the device memory is corrupted during the suspend/resume flow, the
> masks might end up being random values and using them might lead us to
> trying to set values for engines that do not exist, which in turns might
> lead to invalid memory accesses.
Which is all bad and should be fixed, but that is not the only problems 
we would get from a corrupted ADS blob. E.g. GuC itself is going to have 
exactly the same problem given that this is where it gets its engine 
masks from.

Is it worth adding some kind of check on the memory being valid? Add a 
magic word somewhere unused and check that it is still correct? And if 
not, fail the re-init with a meaningful error message.

>
> Given that the driver does know which engines are available, we can just
> calculate the masks instead of reading them out of memory.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ads.c | 36 ++++++++++++---------------------
>   1 file changed, 13 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index fab259adc380..10e2ab5791b7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -129,9 +129,6 @@ struct __guc_ads_blob {
>   #define info_map_write(xe_, map_, field_, val_) \
>   	xe_map_wr_field(xe_, map_, 0, struct guc_gt_system_info, field_, val_)
>   
> -#define info_map_read(xe_, map_, field_) \
> -	xe_map_rd_field(xe_, map_, 0, struct guc_gt_system_info, field_)
> -
>   static size_t guc_ads_regset_size(struct xe_guc_ads *ads)
>   {
>   	struct xe_device *xe = ads_to_xe(ads);
> @@ -493,13 +490,12 @@ static void fill_engine_enable_masks(struct xe_gt *gt,
>   static void guc_prep_golden_lrc_null(struct xe_guc_ads *ads)
>   {
>   	struct xe_device *xe = ads_to_xe(ads);
> -	struct iosys_map info_map = IOSYS_MAP_INIT_OFFSET(ads_to_map(ads),
> -			offsetof(struct __guc_ads_blob, system_info));
> -	u8 guc_class;
> +	u8 class;
>   
> -	for (guc_class = 0; guc_class <= GUC_MAX_ENGINE_CLASSES; ++guc_class) {
> -		if (!info_map_read(xe, &info_map,
> -				   engine_enabled_masks[guc_class]))
> +	for (class = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
> +		u8 guc_class = xe_engine_class_to_guc_class(class);
> +
> +		if (!engine_enable_mask(ads_to_gt(ads), class))
>   			continue;
>   
>   		ads_blob_write(ads, ads.eng_state_size[guc_class],
> @@ -546,25 +542,24 @@ static void guc_mapping_table_init(struct xe_gt *gt,
>   static u32 guc_get_capture_engine_mask(struct xe_gt *gt, struct iosys_map *info_map,
>   				       enum guc_capture_list_class_type capture_class)
>   {
> -	struct xe_device *xe = gt_to_xe(gt);
>   	u32 mask;
>   
>   	switch (capture_class) {
>   	case GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE:
> -		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_RENDER_CLASS]);
> -		mask |= info_map_read(xe, info_map, engine_enabled_masks[GUC_COMPUTE_CLASS]);
> +		mask = engine_enable_mask(gt, XE_ENGINE_CLASS_RENDER);
> +		mask |= engine_enable_mask(gt, XE_ENGINE_CLASS_COMPUTE);
Seems odd to have '; mask |=' rather than just '|'.

Not a blocker, but given you are changing this anyway, might as well 
clean it up?

John.

>   		break;
>   	case GUC_CAPTURE_LIST_CLASS_VIDEO:
> -		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_VIDEO_CLASS]);
> +		mask = engine_enable_mask(gt, XE_ENGINE_CLASS_VIDEO_DECODE);
>   		break;
>   	case GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE:
> -		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_VIDEOENHANCE_CLASS]);
> +		mask = engine_enable_mask(gt, XE_ENGINE_CLASS_VIDEO_ENHANCE);
>   		break;
>   	case GUC_CAPTURE_LIST_CLASS_BLITTER:
> -		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_BLITTER_CLASS]);
> +		mask = engine_enable_mask(gt, XE_ENGINE_CLASS_COPY);
>   		break;
>   	case GUC_CAPTURE_LIST_CLASS_GSC_OTHER:
> -		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_GSC_OTHER_CLASS]);
> +		mask = engine_enable_mask(gt, XE_ENGINE_CLASS_OTHER);
>   		break;
>   	default:
>   		mask = 0;
> @@ -907,8 +902,6 @@ static void guc_populate_golden_lrc(struct xe_guc_ads *ads)
>   {
>   	struct xe_device *xe = ads_to_xe(ads);
>   	struct xe_gt *gt = ads_to_gt(ads);
> -	struct iosys_map info_map = IOSYS_MAP_INIT_OFFSET(ads_to_map(ads),
> -			offsetof(struct __guc_ads_blob, system_info));
>   	size_t total_size = 0, alloc_size, real_size;
>   	u32 addr_ggtt, offset;
>   	int class;
> @@ -917,12 +910,9 @@ static void guc_populate_golden_lrc(struct xe_guc_ads *ads)
>   	addr_ggtt = xe_bo_ggtt_addr(ads->bo) + offset;
>   
>   	for (class = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
> -		u8 guc_class;
> +		u8 guc_class = xe_engine_class_to_guc_class(class);
>   
> -		guc_class = xe_engine_class_to_guc_class(class);
> -
> -		if (!info_map_read(xe, &info_map,
> -				   engine_enabled_masks[guc_class]))
> +		if (!engine_enable_mask(gt, class))
>   			continue;
>   
>   		xe_gt_assert(gt, gt->default_lrc[class]);

