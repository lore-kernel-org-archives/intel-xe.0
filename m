Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30F2CD3427
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 12:41:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F72F10F08A;
	Thu,  7 May 2026 12:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UrcJGD3T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7C310F08A
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 12:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778157683; x=1809693683;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XE7DX/dCZBwOBAmLIqhy0zq2SzwOmvL3lPjdUjoBiqc=;
 b=UrcJGD3TUSdEcE6wd8cs8B3wXZsW1Em48Rk90r6cdGuF7EZRaKiMktBb
 mkpebUJVLLzt1qM4wFl6um50p5SwV7WaZU1QQgLkro9ZSic2jCL+jy7tV
 /ekjijQVjhr7bGdagtDYWJ4HjRdlU5c4lZQ9mDEXZqQT73bVcFLVb1yJ5
 /8CRHkBAi1Sb9jG+PWBHVseloSGDM1QiyJytlycG36hxyFtUdngPdn3/6
 C9zZ0PnpVpO7KN7klfZd6lPkOVkUy6SRrpE+gs4G9yDotZ3zqeUIqsxXh
 nsg4NhLcOICLHi1bOMKZZwv4Yxu3nOrRLzR7PH8wS7ah31Yx3wQFDuxvZ w==;
X-CSE-ConnectionGUID: 53XaFt92RIuu+jguRnzFsw==
X-CSE-MsgGUID: cCEv/X94Rvew8PvsIfoG+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="82726809"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="82726809"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 05:41:23 -0700
X-CSE-ConnectionGUID: MfVYJ5IhT1CnVuGCtcv/jA==
X-CSE-MsgGUID: 0eBd31ACRfygZIu7GJDGrQ==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 05:41:23 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 05:41:22 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 05:41:22 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 05:41:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2UcHWdH8LhQjKRuLbkJDdrn4QuhO/mFgYxeI4rmeZWFwVdQS2vY2PH/Iiz3guHN2y1kJ0Vuhhiz+qsB6EXkMNwPJqTIR6VrHlgfzZGbtdcReryh1Ifkw6m3oiWS/wNongejcSr3zvOI/eP7bHUcksEqI699S5JQE61NCwgRfGZfuhgH6g7K+H6u8I6A+iteT5Y5Pw0SLhyjxpiCtINxUuisWiLmbuh4Or7QwBxygMg3tHcf+FlsGBjP8gIkCCQ4+hxgAgR4IHV1MEfv8hEJO63Vz+k2XgprNMlsiuyBJv3oJZndufBK6qKl8Jh8mh2nEj8jCot4OPxXsrGDnjNlzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3100haLJVLiN+b0gsBwoVR+F2dw/PqnVwkUfq+0JEk=;
 b=hXEPEIpLTnHO8Dcn0V14QkZIJx4wEVw5qFeBR3SW1UH3U9hZpUFyC+FDDOCzF9YYsztrIuawt/7oDfizSQ37XKmUFx5UEbj+80vfV72nE1mYpv2+JXOqvOTTOHkYAr3oyGZNuOY3xbsU1N7yBMem8gMPPOQxsg63MMMU7dlVVelmv7dKHyz9bAAHFifrlQJ2R8zi8Yg1klD+vTpM9YUmvMslMiNOdjNEVymWTtl/VWUuH7SYt/WvmHxv8bs1i/d4BKon2vXXLa2r/ZvwjF7TjRFMpr++JXtNgdEAaJJeCaNog0l7uqvB2UbkuPjsZxdk3eNgI29sjNPIJr+BJkTwMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB5900.namprd11.prod.outlook.com (2603:10b6:806:238::21)
 by CY5PR11MB6283.namprd11.prod.outlook.com (2603:10b6:930:21::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 12:41:13 +0000
Received: from SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803]) by SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803%7]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 12:41:13 +0000
Message-ID: <1eb0e018-494e-41a2-9a8b-440711fc30ba@intel.com>
Date: Thu, 7 May 2026 14:41:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/12] drm/xe: Use a single page-fault queue with
 multiple workers
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <arvind.yadav@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <francois.dugast@intel.com>
References: <20260226042834.2963245-1-matthew.brost@intel.com>
 <20260226042834.2963245-5-matthew.brost@intel.com>
 <59b9532d-68ad-42b1-b7eb-c693b648b564@intel.com>
 <afuZq0+X070Inmhk@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <afuZq0+X070Inmhk@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0066.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::14) To SA1PR11MB5900.namprd11.prod.outlook.com
 (2603:10b6:806:238::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB5900:EE_|CY5PR11MB6283:EE_
X-MS-Office365-Filtering-Correlation-Id: a86acd15-701f-4d5c-27e3-08deac35ec21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 09ep3vHjYA3cSMpXsKyh1pJ7iU6NuenykrKQun/aYgB7EhQFmxBJPHgl23tSq1TdXysN2sGGBO20eJhHvO9jvomiTkuMPeR3AiVhx0b90elM+HMqXC6/PykpULilXJji6+wRwpo0NLff69eyNXSPlk99o5zlJ3cfa8VMf4u0m7eksLrbCkbrs0kBp3EwVFEQjpgjS8Uo0t5qVKWhjfBalRybEjatVTg+KkOfbyKhWDOLRiSZTUn0+lzl6pVj3xCcTtvw0hdh5juCf/FEiHb75LM8XKqzgRHHbTSV5kaREDnfQ/upDuyv+oztthmaBcJ7kl745qmqcmFqtrDlr+rluufS+4puizq/MYy5na6Q2/4C3l/ZbUjnB9zLMRkqtlLEOCoFOQIm1TBWHptgghGSUvtXQFK5Tyi9J4Lnxg7z9S9hSIrSR/DZHzjvxtlh96Ch6PB5vHWQUvGeVUeidrRXXdFW4KYFPgq0SDRkK2y6OhK3GCEDvkRFrBdcOOnjSDTRN8/skSRxuXeHOZJzMlwOInlrga//18Xnk1Fvkssqbl6oArzBq7Ok/xqWjOz2EMJDJsv0wWu0eGADW3KUkEKHIg4U2/xa2yqKSGb1Rtu4cYvBV4BTWQ0JBzrqfLB2zHEpxbnWcTBVRaH0r7KgApMCyz8hDrpC2AckCaP03ruA3XyuIYs/fHiL9rVpYF5fEswX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB5900.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzcyNGF2cGZDQmhoNmJrb2lNSUJFL2R5bmdqR3BCZmx1UFo1WVNhR25qamly?=
 =?utf-8?B?eWNxT3NvZXlicjRMM1pHU0FSSXB1aFBTSVFFQi9wdjFFYk5GN2k3SlVmUWpS?=
 =?utf-8?B?RkZVclRWNGNSNUo1b1QvNDZOejIyd3F0Yk5ad3llaytBRWNDVWhPelA5NTlH?=
 =?utf-8?B?UHVpMzlERXY1ZG11UzFFanh6R2lGYkxpRVQycWtHTEZuT09Wd0grQ1FPSS8v?=
 =?utf-8?B?VUtId08ydnBvRDhSdWV0NTZDcENRNEF0clJid2RIcWV3MXdraGJIMkhpVVNQ?=
 =?utf-8?B?MzBnQ0RLT2szdE5HMDBOV0NoN24rQUplSFhBVk9Ga0hhWTkrRC94YUloZmdn?=
 =?utf-8?B?MnZDTDQzcEQzWEFNU3NJaEZKM3BFVWF1aEppc0dFcjJhakJUbDlMNzc3NlhO?=
 =?utf-8?B?WGRhemlMN0FwdzdlOU9tY2JWeXFjWmJFWEFINjRic1p3b0ZRWFVUbUFtNXMz?=
 =?utf-8?B?SCtsbXNzL0hRQ2VWOFRxeGlqTElKRTBHclFCNi80SUlzeGJVSGVtM3FxNEwx?=
 =?utf-8?B?d215WTdKaXB5Q1Q5WlFYdnlsN2VjbXpyNmhMUzJZSEkwMXV1Ymx5WEJVVzRP?=
 =?utf-8?B?YStRY0hOWk5jL3IvRWNHUS83Y1ZTNm9CUStYaERCbHZxeVZpRkN6TE5tLzBS?=
 =?utf-8?B?S3pNT2Y0RzJ3RUV5ampHMmVDTnJ4YTZaM0ZrdzdVU2h1aDM1QnE0QTI1Wmh4?=
 =?utf-8?B?ZjdyaklnR3VEeGhwUDFPa0xSWEVCZFVaYlArK3o0bzdpejVEMjEvZWRnZ1o3?=
 =?utf-8?B?TkFjbUJBa3dqOVErSWhQOUxnOTFETUszcC9PV2JvOXlzN1BVWjVuMkhMTEUr?=
 =?utf-8?B?dnlWRnp3VkxPMmNPcllSWmFjVGhCQTB6TUlaOVZ5azBIenltdDVva3hqYW80?=
 =?utf-8?B?YmRMWDI0bHJJQ2I3MnBHWmNGWGJ4NWFHZjhZOVFscE1YbXhaTVNZMEkzdW0y?=
 =?utf-8?B?NXdJelFoQXhSOStnM3IwdWhTY2ZJMll3MHhTTWdVMUcrTGVPSThuNzlrUjR4?=
 =?utf-8?B?L1lTd05iY3RweUN2aWY4RTZSK3hlcFhUUTZ1WUI4NXZZdWVYSkdic3lRY1Fp?=
 =?utf-8?B?M3hDUlVpM0tGc1JqOEpFenlzNm15RXlMdWR0cjRvSUlRVXNlYnpjZFRNd3Jn?=
 =?utf-8?B?cGVjV0swbC9mbWk1Uk1vT0VyNlRlUFE3OGtvcFZJQVdLTHJIRDc3TGZPVHVR?=
 =?utf-8?B?MVJtYkIxYk5qL3hxQ293ZzRva2h6VWRwdGw3aXBzekZYYjBTcTJVMkVtNTZ4?=
 =?utf-8?B?dGVZS1NYWlk1aHc4UkZ1SjJUWlJVY2dIYXA5VEo3VVBzbnpJMVVpeU45QTFS?=
 =?utf-8?B?NkZRU3RaVjdYeTBXRWZZbUhtaXZ4dFBsQnl5dDIzZkgvUE0zbHlGbGNKTGZl?=
 =?utf-8?B?MDZUaEd1NHQ4Qm40dENNc0I2aW1zQWZEMytIYzhsOXZzTDVVeXFSelgzcVpN?=
 =?utf-8?B?bTJXUUhPQjFpWko3OGNpK1dHSjFnamdFVi9heTB1TnBzYUpqVHdaVTVXTDln?=
 =?utf-8?B?QmVCSGRkbDJlZnAzQmIwV25Bc3hSeC9oWFpsR3ZNS0p1MHJ3eldNRVJ6R3o3?=
 =?utf-8?B?blFScitjdGJaRUpOUUhpZkN3RmFMRnVtSjZldnU2U1YwOUwrOHZSUzJqb2tZ?=
 =?utf-8?B?RHN1TE91c1FBSmhMb3NvUDlpRlRJUjFWMGdQaWs3dVR3WFdubFBzM2FHUU5Q?=
 =?utf-8?B?RFNmckxpM3hnTE5rTkNmcU5JYk9LVFJjdFBOaFNNZGY0TXdlMkdiMDZVN2dz?=
 =?utf-8?B?NHEvSWRsMHc1QXZyOGNXM2J0SHEwOHY5ZUZCdWxNSW5LS0srQXpWMHlwMFFx?=
 =?utf-8?B?UWdQVTVNUytubnQ3MG5lUFRqODlCcEIxbjBaWC9sTC91RlEwR1JITTB5b2JR?=
 =?utf-8?B?VUx4ZEhoRFFYRGRLckpYSy9SVnMvRnJPMVZMamJyTlJiNytsbXMydE5CTm5z?=
 =?utf-8?B?MHhFQmdqQVBuK0FaUUl6U0lrN3NENE5PdWlEQnVqbXVXaXE4RHpyZEI0bk1W?=
 =?utf-8?B?cG5ocmFJdVd0Yk4rQXJpSHhBd0dIWVliN3V0U3NQQlJ0S2orYnBGSXBwTjVD?=
 =?utf-8?B?R2ZiRzVLWTRpdkdUcENhZVdJVXRoQUZvWFNIbUo2TEwyNXVadTRiblpFRitD?=
 =?utf-8?B?QlV4SnhmTkJucm82RmJxRFlWV3U5SzRkaDREVnYwb0FIL3lROVpmVCtuYTFQ?=
 =?utf-8?B?dER0cGV0TzhSRmlRNUtCZFh1b1VPK0NCMUswTUF6WjFMVWNlM28yOEhwY0Rl?=
 =?utf-8?B?cm1ubEhSc0F6dmVOMWVYNTRDQzFNRUFEVFlNTUtvbm9zNjEzaEpmRExvd3M1?=
 =?utf-8?B?TWQvT1pkQWxmaDBUd0NMTUgxZWJDbS9UMzVlMFc0VUdyZm5DV0RqWU1MTGpW?=
 =?utf-8?Q?drDBUI54YTA7jgKo=3D?=
X-Exchange-RoutingPolicyChecked: W8ZhVRVowqxxQy5jzESGdiA7NpaBmhwb2MGC3xdJSWR0iL97/Sf0fQG1hl9h+d060nsnE6M4zmZlQhAvgJoRRhKMwBsfN2py1ChAkIvhkTXt7fS++5JAYQ04c5kxbODOm5bxecEA09gXb5ve0dB4IjuvTSVzfYcesJTFn6MJZKxp2R3m/7yYPBNaesbGG3cRsAN/Bmo1W0tKcgi1BPnb5WcRSZdpunGyMaTVG6PBn0bPntXXt49T68W3LQ5ggp0BGMYjoD280IyyEqRZGVzXpzsbl5/9WZ9sY5IDfPYLIic0QhbQAqpyvv9VY316oFDgQ7MvQu8GHHJFEEAPiNZk9Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: a86acd15-701f-4d5c-27e3-08deac35ec21
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5900.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 12:41:13.0686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pEZ5Qm+w00WM9dK2+rSqYRptmEtR8ru18OC/7ETMnmMu8VMsI5Rq7tXTThNEkU4DkrTuAXPBeGt4oLGSZbEaheMd2sp03stkZgASm4n47oc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6283
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

On 06/05/2026 21:42, Matthew Brost wrote:

> On Wed, May 06, 2026 at 05:46:30PM +0200, Maciej Patelczyk wrote:
>> On 26/02/2026 05:28, Matthew Brost wrote:
>>
>>> With fine-grained page-fault locking, it no longer makes sense to
>>> maintain multiple page-fault queues, as we no longer hash queues based
>>> on the VM’s ASID. Multiple workers can pull page faults from a single
>>> queue, eliminating any head-of-queue blocking. Refactor the structures
>>> and code to use a single shared queue.
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_device_types.h    | 12 +++---
>>>    drivers/gpu/drm/xe/xe_pagefault.c       | 52 +++++++++++++------------
>>>    drivers/gpu/drm/xe/xe_pagefault_types.h | 17 +++++++-
>>>    3 files changed, 50 insertions(+), 31 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>> index 1eb0fe118940..0558dfd52541 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -304,8 +304,8 @@ struct xe_device {
>>>    		struct xarray asid_to_vm;
>>>    		/** @usm.next_asid: next ASID, used to cyclical alloc asids */
>>>    		u32 next_asid;
>>> -		/** @usm.current_pf_queue: current page fault queue */
>>> -		u32 current_pf_queue;
>>> +		/** @usm.current_pf_work: current page fault work item */
>>> +		u32 current_pf_work;
>>>    		/** @usm.lock: protects UM state */
>>>    		struct rw_semaphore lock;
>>>    		/** @usm.pf_wq: page fault work queue, unbound, high priority */
>>> @@ -315,9 +315,11 @@ struct xe_device {
>>>    		 * yields the best bandwidth utilization of the kernel paging
>>>    		 * engine.
>>>    		 */
>>> -#define XE_PAGEFAULT_QUEUE_COUNT	4
>>> -		/** @usm.pf_queue: Page fault queues */
>>> -		struct xe_pagefault_queue pf_queue[XE_PAGEFAULT_QUEUE_COUNT];
>>> +#define XE_PAGEFAULT_WORK_COUNT	4
>>> +		/** @usm.pf_workers: Page fault workers */
>>> +		struct xe_pagefault_work pf_workers[XE_PAGEFAULT_WORK_COUNT];
>>> +		/** @usm.pf_queue: Page fault queue */
>>> +		struct xe_pagefault_queue pf_queue;
>>>    #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
>>>    		/** @usm.pagemap_shrinker: Shrinker for unused pagemaps */
>>>    		struct drm_pagemap_shrinker *dpagemap_shrinker;
>>> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
>>> index a372db7cd839..7880fc7e7eb4 100644
>>> --- a/drivers/gpu/drm/xe/xe_pagefault.c
>>> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
>>> @@ -222,6 +222,7 @@ static void xe_pagefault_queue_retry(struct xe_pagefault_queue *pf_queue,
>>>    		pf_queue->tail = pf_queue->size - xe_pagefault_entry_size();
>>>    	else
>>>    		pf_queue->tail -= xe_pagefault_entry_size();
>>> +	memcpy(pf_queue->data + pf_queue->tail, pf, sizeof(*pf));
>>>    	spin_unlock_irq(&pf_queue->lock);
>>>    }
>>> @@ -267,8 +268,10 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
>>>    static void xe_pagefault_queue_work(struct work_struct *w)
>>>    {
>>> -	struct xe_pagefault_queue *pf_queue =
>>> -		container_of(w, typeof(*pf_queue), worker);
>>> +	struct xe_pagefault_work *pf_work =
>>> +		container_of(w, typeof(*pf_work), work);
>>> +	struct xe_device *xe = pf_work->xe;
>>> +	struct xe_pagefault_queue *pf_queue = &xe->usm.pf_queue;
>>>    	struct xe_pagefault pf;
>>>    	unsigned long threshold;
>>> @@ -285,7 +288,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>>>    		if (err == -EAGAIN) {
>>>    			xe_pagefault_queue_retry(pf_queue, &pf);
>>> -			queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
>>> +			queue_work(xe->usm.pf_wq, w);
>>>    			break;
>>>    		} else if (err) {
>>>    			if (!(pf.consumer.access_type & XE_PAGEFAULT_ACCESS_PREFETCH)) {
>>> @@ -302,7 +305,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>>>    		pf.producer.ops->ack_fault(&pf, err);
>>>    		if (time_after(jiffies, threshold)) {
>>> -			queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
>>> +			queue_work(xe->usm.pf_wq, w);
>>>    			break;
>>>    		}
>>>    	}
>>> @@ -348,7 +351,6 @@ static int xe_pagefault_queue_init(struct xe_device *xe,
>>>    		xe_pagefault_entry_size(), total_num_eus, pf_queue->size);
>>>    	spin_lock_init(&pf_queue->lock);
>>> -	INIT_WORK(&pf_queue->worker, xe_pagefault_queue_work);
>>>    	pf_queue->data = drmm_kzalloc(&xe->drm, pf_queue->size, GFP_KERNEL);
>>>    	if (!pf_queue->data)
>>> @@ -381,14 +383,20 @@ int xe_pagefault_init(struct xe_device *xe)
>>>    	xe->usm.pf_wq = alloc_workqueue("xe_page_fault_work_queue",
>>>    					WQ_UNBOUND | WQ_HIGHPRI,
>>> -					XE_PAGEFAULT_QUEUE_COUNT);
>>> +					XE_PAGEFAULT_WORK_COUNT);
>>>    	if (!xe->usm.pf_wq)
>>>    		return -ENOMEM;
>>> -	for (i = 0; i < XE_PAGEFAULT_QUEUE_COUNT; ++i) {
>>> -		err = xe_pagefault_queue_init(xe, xe->usm.pf_queue + i);
>>> -		if (err)
>>> -			goto err_out;
>>> +	err = xe_pagefault_queue_init(xe, &xe->usm.pf_queue);
>>> +	if (err)
>>> +		goto err_out;
>>> +
>>> +	for (i = 0; i < XE_PAGEFAULT_WORK_COUNT; ++i) {
>>> +		struct xe_pagefault_work *pf_work = xe->usm.pf_workers + i;
>>> +
>>> +		pf_work->xe = xe;
>>> +		pf_work->id = i;
>>> +		INIT_WORK(&pf_work->work, xe_pagefault_queue_work);
>>>    	}
>>>    	return devm_add_action_or_reset(xe->drm.dev, xe_pagefault_fini, xe);
>>> @@ -430,10 +438,7 @@ static void xe_pagefault_queue_reset(struct xe_device *xe, struct xe_gt *gt,
>>>     */
>>>    void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt)
>>>    {
>>> -	int i;
>>> -
>>> -	for (i = 0; i < XE_PAGEFAULT_QUEUE_COUNT; ++i)
>>> -		xe_pagefault_queue_reset(xe, gt, xe->usm.pf_queue + i);
>>> +	xe_pagefault_queue_reset(xe, gt, &xe->usm.pf_queue);
>>>    }
>>>    static bool xe_pagefault_queue_full(struct xe_pagefault_queue *pf_queue)
>>> @@ -448,13 +453,11 @@ static bool xe_pagefault_queue_full(struct xe_pagefault_queue *pf_queue)
>>>     * This function can race with multiple page fault producers, but worst case we
>>>     * stick a page fault on the same queue for consumption.
>>>     */
>>> -static int xe_pagefault_queue_index(struct xe_device *xe)
>>> +static int xe_pagefault_work_index(struct xe_device *xe)
>>>    {
>>> -	u32 old_pf_queue = READ_ONCE(xe->usm.current_pf_queue);
>>> -
>>> -	WRITE_ONCE(xe->usm.current_pf_queue, (old_pf_queue + 1));
>>> +	lockdep_assert_held(&xe->usm.pf_queue.lock);
>>> -	return old_pf_queue % XE_PAGEFAULT_QUEUE_COUNT;
>>> +	return xe->usm.current_pf_work++ % XE_PAGEFAULT_WORK_COUNT;
>>>    }
>>>    /**
>>> @@ -469,22 +472,23 @@ static int xe_pagefault_queue_index(struct xe_device *xe)
>>>     */
>>>    int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
>>>    {
>>> -	int queue_index = xe_pagefault_queue_index(xe);
>>> -	struct xe_pagefault_queue *pf_queue = xe->usm.pf_queue + queue_index;
>>> +	struct xe_pagefault_queue *pf_queue = &xe->usm.pf_queue;
>>>    	unsigned long flags;
>>> +	int work_index;
>>>    	bool full;
>>>    	spin_lock_irqsave(&pf_queue->lock, flags);
>>> +	work_index = xe_pagefault_work_index(xe);
>>>    	full = xe_pagefault_queue_full(pf_queue);
>>>    	if (!full) {
>>>    		memcpy(pf_queue->data + pf_queue->head, pf, sizeof(*pf));
>>>    		pf_queue->head = (pf_queue->head + xe_pagefault_entry_size()) %
>>>    			pf_queue->size;
>>> -		queue_work(xe->usm.pf_wq, &pf_queue->worker);
>>> +		queue_work(xe->usm.pf_wq,
>>> +			   &xe->usm.pf_workers[work_index].work);
>>>    	} else {
>>>    		drm_warn(&xe->drm,
>>> -			 "PageFault Queue (%d) full, shouldn't be possible\n",
>>> -			 queue_index);
>>> +			 "PageFault Queue full, shouldn't be possible\n");
>>>    	}
>>>    	spin_unlock_irqrestore(&pf_queue->lock, flags);
>>> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
>>> index b3289219b1be..45065c25c25f 100644
>>> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
>>> @@ -131,8 +131,21 @@ struct xe_pagefault_queue {
>>>    	u32 tail;
>>>    	/** @lock: protects page fault queue */
>>>    	spinlock_t lock;
>>> -	/** @worker: to process page faults */
>>> -	struct work_struct worker;
>>> +};
>>> +
>>> +/**
>>> + * struct xe_pagefault_work - Xe page fault work item (consumer)
>>> + *
>>> + * Represents a worker that pops a &struct xe_pagefault from the page fault
>>> + * queue and processes it.
>>> + */
>>> +struct xe_pagefault_work {
>>> +	/** @xe: Back-pointer to the Xe device */
>>> +	struct xe_device *xe;
>>> +	/** @id: Identifier for this work item */
>>> +	int id;
>>> +	/** @work: Work item used to process the page fault */
>>> +	struct work_struct work;
>>>    };
>>>    #endif
>> Matt,
>>
>> There were total 4 pf_queues each of size = (total_num_eus +
>> XE_NUM_HW_ENGINES) * xe_pagefault_entry_size() * PF_MULTIPLIER additionally
>> bigger of roundup_pow_of_two().
>>
>> Each of this queue had a dedicated worker.
>>
>> There is a comment on queue calculation size in xe_pagefault_queue_init():
>>
>> "XXX: Multiplier required as compute UMD are getting PF queue errors
>>
>> without it. Follow on why this multiplier is required."
>>
>> PF queue errors could be due to slow pf processing by handler in KMD plus
>> generating PF for a single VM (asid) therefore hitting constantly single
>> queue.
>>
>>
>> Now there is a single queue which is 4 times smaller (overall) but it has 4
>> workers and there are optimizations which potentially drastically decrease
>> processing time.
>>
>> In the end it could resolve to a case where a single queue had 4 workers
>> instead of one which would be still faster than it is now.
>>
>> Still, not sure if queue size is not too small.
>>
>> Did you have a thought about it?
>>
>>
>> And I think this XXX comment becomes obsolete with such change.
>>
> I think the XXX comment was always wrong. We kept increasing the queue
> size because of random overflows, but the actual bug was that we didn’t
> round up to a power of two, and CIRC_SPACE relies on values being powers
> of two.
>
> I believe we never got around to deleting the XXX comment or removing
> the multiplier. We can handle this in a follow-up after this series, as
> I’d like a large change like this to sit for a while so we can test and
> ensure there are no regressions. Then we can clean up the XXX comment
> and the multiplier in a follow-up.
>
> Matt

All right,

Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>


>> Regards,
>>
>> Maciej
>>
>>
