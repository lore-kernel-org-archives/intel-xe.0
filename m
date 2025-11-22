Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE92CFC539
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 13:52:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6E510E092;
	Sat, 22 Nov 2025 13:52:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GhlCFjIl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CF810E092
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 13:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763819544; x=1795355544;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iQu/jyCDc8m7xDggLUYJXBj1RZXkwRJ7yO7R4Ue+1B4=;
 b=GhlCFjIlM7c3u/mUF8k7iAfOiZKURUIcSU7UQx3mYtSqpQZ2wLnxqTt2
 mVEKxz8REHWcy7ybs4CXJ1EmXNGO9QdJl4oN8+2OotuRl5ly71bilroCL
 2vFulnghhfrWxLniWgq4heUCZZXksvgB0/kOeRBPLm3yLp+BgfL5D5aAa
 baUzKn7+KfHu/aY60Szqe9tLqhjrsWgmrD6EZgUNeeDaCQIbQFfC2tswu
 5pfRR7JZBtz2SgaFqRMuCMocZB4UbYpcAcAW/nfYBu9lB7qBeA/4j6eRD
 dv2dR0p7J7nfdkRVbvcOwKCItB32s06V8zF+r0/x5DZmTBN78ymHxeJKU w==;
X-CSE-ConnectionGUID: PdNn/rTWQeSp9cA0320+Fg==
X-CSE-MsgGUID: 4lrxa4NyS2+AAVXAw0iyxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="68490962"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; d="scan'208";a="68490962"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 05:52:24 -0800
X-CSE-ConnectionGUID: zZMhUb0kRsir/GgQkWmygw==
X-CSE-MsgGUID: clAUwnBrQJ6qyJe/M2ZinA==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 05:52:23 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 05:52:23 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 05:52:23 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.25) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 05:52:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B/EE0vUbx6SWcjazdPu737xCSUTWVNf2fvwWdtmlsJm06CfuhjzuMYb8qNDVk7XfBUrMTylIwXcS2YqlytXe9VhHRJdAB0nr8d/fXZatFHpnDy23Ni54KQDWGn+iwRaGgyrKNDxsAZC+qTIx0EdJcDMLu1y3qocQfrKC4x+02mAZSEodEciOWsZiIxqZtrxYuxVIr5sKkVjdWQvqI3GB3ntmRCOVJcDmL6OBBlZnyKMqcu7kvRNlrNLletDrav9MlPmL+D42F3giI+wQUkXXF4ui9NwyzCq2zEvMvmRSTNNN+yHKXkwWeURBaNzgjzir3xZc/9GukhD3wMDT/unA0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4Ul0HzkksKDK2SXenfpWOcUWtuLgZmQfeEZfacudic=;
 b=ytQqK7t61UV6D5ibqcwA+WkjbeY0LVxcdkjyG925z+xInH+aOEw4xGhudvAziWV5ruqwkUtHur0FDoXyRFGTEP4VurwonQnQZTacwN/0zFE6WgSkOrWaMwUxOD9VoyuHE1eF5E4iaTo7aYaqRJxRZuuf50n/5/W2NVYFl0PRKaKTEW93pU/VIs75j1nXwJkP3y6LjmZQ03bdQLuQOuZkx3ngKGdnTSBqs7Rrh0db48MeN33Yv3ciekmxxOGs5VSzERgkQ4dFbJrg83qJRkC4bx/q5jRnPeqAz1TheHFI+hSUQAejkjlELus3E4OWmvquyPX/yoJF6WFSD3Kjr/bxSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH0PR11MB4982.namprd11.prod.outlook.com (2603:10b6:510:37::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Sat, 22 Nov
 2025 13:52:13 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 13:52:13 +0000
Message-ID: <775a953c-7886-4292-87b4-9ad764609c06@intel.com>
Date: Sat, 22 Nov 2025 14:52:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] drm/xe: Prep page reclaim in tlb inval job
To: Brian Nguyen <brian3.nguyen@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <tejas.upadhyay@intel.com>, <matthew.brost@intel.com>,
 <shuicheng.lin@intel.com>, <stuart.summers@intel.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-9-brian3.nguyen@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251118090552.246243-9-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0027.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::17) To LV2PR11MB6024.namprd11.prod.outlook.com
 (2603:10b6:408:17a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH0PR11MB4982:EE_
X-MS-Office365-Filtering-Correlation-Id: 86b702b5-92cb-4b99-2e2a-08de29ce56eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2FhRDdCd3A0SzExM2ZWS093eDRhazl6bEk1QTR6M3pURmhaRHJCTEtaM29Z?=
 =?utf-8?B?TENxdGRlVnY0dUZ2SnhlS0xSU0FMWXNUYVdOQkNqclpHRmJTTlpTT1BMZmQ2?=
 =?utf-8?B?c08vQ2xzOWk2ejMzbDBWOUlsN1F0ZHNYd1R4T1RqNmt1WjRZK2c2QlpySFYx?=
 =?utf-8?B?b05RaTVyWUdsbTBBSnc2OElzK0tUaTc0SjJrMitEZkxlalR6ajd5b1VLd0ZS?=
 =?utf-8?B?VDRneHRMYUo0cWlUNkFIalFoRG5ZQ3hGZW8vaFNlTWNrbDM1VDRwYTV6UWRL?=
 =?utf-8?B?QkZ2NklTbnE2ZFN5ZzNGY0EyMGFOVnBUVGpkMWVkdzAxelFHNFIyRkRRVkZ6?=
 =?utf-8?B?c09UNHFzN0ZJbmM5ZHEyNmloY3FteHpoZUJZWFZaRzArMDM1eml4U1p3MXVN?=
 =?utf-8?B?eEgrdzgzeVBXSEljODZ2elNpUUdQRmdoRGMzTHFPN21QSGhrYjc5NHFkaVN3?=
 =?utf-8?B?NmlsQ3JQTHpBaDZXQ1dmRkR0ajJZK0g1Q0pPdWpVL2FGV2dGdkNoWXZkdStw?=
 =?utf-8?B?Ny9DcGhJa2R6NGNJbHlvOUtMd1ZWZTViOVdTdzFSL2p2emVsQ1RtQzdGWHZB?=
 =?utf-8?B?VFJkY2tUNEJZZkhjZWJ5dDFROXBDRStKdkhtRWhycXhpVGlycEhTdTZZQ1Mv?=
 =?utf-8?B?MHU5L3o3YlNER1pOZzBZOXh3K3hnbHBRSnl1YVRtNXp3RXp4c0l4cWc5ODkx?=
 =?utf-8?B?S3c1aWsvRDcvUlpWb2FObzNpYlJIZEZUdmhjaTl5OHpLM1lTOFhUVnc3bzdr?=
 =?utf-8?B?ZWJSdEFHbTZyVElTRmlSWVRucEw3TWE1U0Rza3piWHdsUU5oTDY2UE5NR2xP?=
 =?utf-8?B?MVBnbS8xcUJObHc4bU5mK3E2am82YWpOSFBpY2tBRGlqaHhVU1RuS0p3NTNH?=
 =?utf-8?B?UEVKT0tQMm5Oak1LczNCUjduQmxiZDVTZlo2bVJ3VkxnWmJIOCtYaFpSWFpy?=
 =?utf-8?B?b250WEQrOXVYWDN5M3lOOUpJeGhDc1F1MUxoL1RxOE9CZWpsNzROUmMwaDNi?=
 =?utf-8?B?cis2MXZZd2lMNE5OZjJvVmYrdmdsMElBWHdJRnZjVHdGa2U1TkluQ1p5bWRm?=
 =?utf-8?B?Z3F6Z25DcEtBUWNqZTBBZlRhZXpzV1FpVEN1QUlxOThXaU42THBkc3h6TkdX?=
 =?utf-8?B?enlhSDRyWEx2QzRLVDZ6U1JEV2RsQk9mUkdYTUFvWWl5YUkyalpQVDNvS1Fi?=
 =?utf-8?B?ZlVYVjdLNnRvZEdLdUxaWDVjdDNKWkdBaVhVV3U0RFhTSW5KMGxxMmVpanN4?=
 =?utf-8?B?bDdMdUh6STB2UjRaSGNaUngraUJ1MmdPanFnZmRzNWwreGZ0OXdNOWl2TEN5?=
 =?utf-8?B?TEx1MExrTUZzNzBqZ25ZSXllUlI5czVNNWt3MGJCSkM5S1ZEb25nMGNDaDVt?=
 =?utf-8?B?aEJqNStDblVVRWQyT1IzdEgzNEhjV0ZLa0UyRkpaVklwWEVZeTgwT0pwUzli?=
 =?utf-8?B?OFVPdU4wME1DMUphV3FKQWFib1hyR3F5YzhZYUVwM2pyR2R1WU5qbWR5U0NI?=
 =?utf-8?B?MVUrUFdhMHFzR1pGN0pBMG5JN1NXWDJveU40STNaY2hQaWlKZElDS3V5MklE?=
 =?utf-8?B?N1NDQnE0aXBtSkY1TDByNk5JUWx5c3VnRHJGbTNBY3BoS1NjczJUN0pPWEUw?=
 =?utf-8?B?dUE2VVgyT2xZVlA3UDBMMUEvNTB4RlRnemhYM0FzNlRmVkh3amFacTcrVkpt?=
 =?utf-8?B?dkVTUWJxVDE1NS9NYjZ1ZGpSMzJEL09saHpRYnkrbW9OV1FqdUlwRnZTNGp0?=
 =?utf-8?B?OCttRFM1S3hYZWFDVUNwV01waUljV3dtdEtReG9xL2Y3Z3JyYU5OKzkrNjFY?=
 =?utf-8?B?dFloazZ4TE1GbjZ5WElvWVRaRXM1VXpkQ2w3RDcwc0prNGJ4M1dZUVBoN3RQ?=
 =?utf-8?B?ZGlYUEJ6SGszVE1XMlVhdjZXYXAyYTY3b2l4WU4wZ29pY2tKc2RUUUVpR1E0?=
 =?utf-8?Q?Dv42R+ibo9724V+JHmWcaiKpyTMnQPty?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0ppQ0hoSE5Hd1NKZWJiUlRQWVdPTUJHTFIzbWkwZHZZVTNYUkh0Wk5OTkc5?=
 =?utf-8?B?S25GczVnQmtHRzZSck5IRkhvT29DYSs0em0wSGwwQ0hSc0xvTkNHZDJhT1M3?=
 =?utf-8?B?VUZrZndWRkg1ZFRRa0lTUHd1ZTM5bG1laGU5M3o0QUNaeUhwMUx4aDFZaGpx?=
 =?utf-8?B?MG0zdUZrOThvVExxbXI5bTRuNkg1TzVPdkZjMmxodHJKZmNqMUkrS2FxSFRj?=
 =?utf-8?B?RmpZNndWWXNVd2hVZWhodTFYcEp6T0JKRk1hZWhZSXZoWGNvQkJvUU02eWF2?=
 =?utf-8?B?MVJ5bWhQVkcyd2RJRzJGVlhDUlYyN3l3eVp3cUU5NTRySnpCYTZSMnNlczhD?=
 =?utf-8?B?N284TUpWQjhOdk1tNWdQcnUvdUVwcTZxeWNNditJMEVNWmN2b2Y4TmZmMEpr?=
 =?utf-8?B?Smx5ZUdYRmNRcnVReE5KVExtdVpkd0hsNnkwRTN6SXVIbnlBZWJUS3Uyci9Z?=
 =?utf-8?B?bXI0L1JuQXcwaXc5NDl0WEw1R0RJV3VVd3UxallwT3RvbW9oTmxjanljdDIw?=
 =?utf-8?B?S2MrbTdiR0VxaUNFVGgrQlhFbmtnUDFKb203MENiTDJJVnF0OTdVa212TFFM?=
 =?utf-8?B?WTZsY2wrdEFSTlJzYk1TQk0vN3E2K2hKMVVMZUE0dVJRUlIrVUJMVkp1WWhw?=
 =?utf-8?B?SCtjSWsxVmtHczRCd3dsWFNhUkU1ekRsOHVOS1lPaE40MUgyN1R0NHFxYU5M?=
 =?utf-8?B?TVg1ZXFhWjZxYUtpVEZYeERzcVpKL013UHhTbG9VN1FXVjVvWWlWcnJNK1k5?=
 =?utf-8?B?YU9iWmdKbFZTVGJ2VjNXMWlxM0FSeEtqUVcrOTBYSkZiOWgyTXNndkJKRG11?=
 =?utf-8?B?NFdQQUVsMnhuVDhjMlVPQThDS2MxbzZOeW5LMmZBS1FOMkMybWRzaGtRZDNv?=
 =?utf-8?B?bmJUSWtob0puNzVUYXZiQmRObUdXYW5VUkFUNThhMGtvVUZEM09qNlZLalNY?=
 =?utf-8?B?VEp1VGJRTmVzWGFzUjdIS1JZTFpqdUt2bTB4bnVlbldON1hFRjluUHl3a1Jr?=
 =?utf-8?B?NzJZMkV5L3JqV2llRVhZQ0VjQnBPNWlPZXBhcUU4MHk0bzh0N3dWYU0vdEQv?=
 =?utf-8?B?a3ZwNEFWQk1BUWZ3dHpkdTFPWUxySlE3RlNCcGN0WW1VdFlxZDdjWEpCQUhp?=
 =?utf-8?B?RE5DWmRUSmhtbm43ZTV6R2F6RE5NNjlacjV1blIxYW5WdHhGYlNwMk9XaGEr?=
 =?utf-8?B?czRTUEpMaVY4NFhYUW1yNmowYk1ObXRFcmNrMENOUDlySnFueDlXQy9CQkZw?=
 =?utf-8?B?UjNrM050UFlseFdkTmNoQmdZeFBCcFluaXl4eHBkMFd1TlFWejRaU2dSR2RJ?=
 =?utf-8?B?MFJsQWpDZVhnRDVlYURXQTlLaGZmK2RlNWtYWEhTOVhIZXFXanhlS2dKemE1?=
 =?utf-8?B?SnFISUVFTi9tanVHNUJQOWZhWWlQdk9McDhvb3MwZ05wbFlndm9DaU5uQ2My?=
 =?utf-8?B?Q3lhRXd3eTVHK1c0ekNqRGhIbEJ5RnRESFJQWDBqU1Z1ZnpCSXpKVklLZURs?=
 =?utf-8?B?U1hVREYvV3VLZ0tEVUxSZ0hmVEMwMkthQUpQMldIU0crUzZXYzB1RGxIblNJ?=
 =?utf-8?B?eEZldGtZNG5SbVlLVGk5RTdGVkhkR1huK2ZmZkxKY1lNVng2NUx4TkxJRE9P?=
 =?utf-8?B?bmluV1EzalZ5U1VwTThpWlIwS25CWit4MS94UFZIVno4RDhGRHQ3R2tKUXhF?=
 =?utf-8?B?M2FMcUdNU2I1aGppd0V6MVhWaEg0R1l3blVPNTA3N0JMQW15aTk2NFVCZlJ5?=
 =?utf-8?B?UUhTa0x6bzVSVGxHLzA2RlBPV1d2NTVhN1A1TGQwUVFTQzJxSFY3TFdnVXky?=
 =?utf-8?B?aXVLcjNSajRhZU5ZQlBMbEpQZEY3V2U1bFBGemd1ZHpJRS9DQm5uTnhZekpn?=
 =?utf-8?B?L24vM1BaZDROR0t1QXphSWhkemcwS0hqb2c1aCtHTSs0NXNVOUFGTHNTeXI2?=
 =?utf-8?B?dFJ0V1JLelRBMkJQZ1ljdHlvbU1OazZQQy8ySlI4dEZTQWRYOEw1SG9kMXlp?=
 =?utf-8?B?a1ZzWGlBdmdXZXRMQ0M2aFlDNzJFaityTVNqK1JYUE1UakVUUzd2ZUtLWHpy?=
 =?utf-8?B?RmJGcktvd3ZaM0JIc0NLcE1ZOHhHTHdudUJBYkZoV2RObEZWRG8xR3k4Q29P?=
 =?utf-8?B?Y3g0cGZTTzJKWFB0dFlBeVZqY01XcHZGRXNkRHBUQ1F0bTMvam5POEV4RFFT?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86b702b5-92cb-4b99-2e2a-08de29ce56eb
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6024.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 13:52:13.5710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6nX16IxTdNOg2gEVMyYX/gJOnzrUI6bmeU2eGZkitNiVP/GMSO4fLFfjsL7l3SN6DE07YHyeut4xsK+KSDVqYy0P5eiYdndOxg4o+KADY4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4982
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



On 11/18/2025 10:05 AM, Brian Nguyen wrote:
> Use page reclaim list as indicator if page reclaim action is desired and
> pass it to tlb inval fence to handle.
> 
> Job will need to maintain its own embedded copy to ensure lifetime of
> PRL exist until job has run.
> 
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> ---

...

>  
> +/**
> + * xe_tlb_inval_job_add_page_reclaim() - Embed PRL into a TLB job
> + * @job: TLB invalidation job that may trigger reclamation
> + * @prl: Page reclaim list populated during unbind
> + *
> + * Copies @prl into the job and takes an extra reference to the entry page so
> + * ownership can transfer to the TLB fence when the job is pushed.
> + */
> +void xe_tlb_inval_job_add_page_reclaim(struct xe_tlb_inval_job *job,
> +				       struct xe_page_reclaim_list *prl)
> +{
> +	struct xe_device *xe = gt_to_xe(job->q->gt);
> +
> +	WARN_ON(!xe->info.has_page_reclaim_hw_assist);

you can use here debug-only:

	xe_gt_assert(job->q->gt, xe->info.has_page_reclaim_hw_assist);

or if you want keep it in production builds:

	xe_gt_WARN_ON(...

> +	job->prl = *prl;
> +	/* Pair with put after bo creation */
> +	xe_page_reclaim_entries_get(job->prl.entries);
> +}
> +
