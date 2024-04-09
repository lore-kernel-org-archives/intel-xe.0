Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8F4C67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 00:09:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F769112766;
	Tue,  9 Apr 2024 00:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A/XaDzVE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97179112766
 for <Intel-Xe@lists.freedesktop.org>; Tue,  9 Apr 2024 00:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712621360; x=1744157360;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HL7c52/42hhZl2oNpWiONV17oCVc/TrxEYVw2xa6F2Q=;
 b=A/XaDzVEVSILeRWAW7Sp9X0E2poI6D8iMMXZ1dMIa6ffedqH10/kJrMj
 /gMIC2OtisQStBbW7zIwKR/4l/cLxWR0TQVF9xDs004mM/6gRsw4tJRwR
 IMEUF5VFcN5bPAFPF61S2uN3eZHPLRc3MGfHtl6xaRinmNhwl1Jk8GQQ6
 DQoRua5VjVbI1posMQFgt06Z2NYEExCRtNRr966eOkCo5hZpX7WCYPDxw
 08O/Unk59njVr+vvGSZlrg++2v8kU4QYevDsdyCj2qeXfPR52CpZMf28+
 7Kob8fJr4CObN56SyJTRVmKkpHE6Wgh5UiY9pj2LNy/Bv3KD5x0o9TnZf g==;
X-CSE-ConnectionGUID: QlptAYTnR3CFowgM87WbKw==
X-CSE-MsgGUID: srN8g0dgSy6zO/vltxisMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7767123"
X-IronPort-AV: E=Sophos;i="6.07,188,1708416000"; 
   d="scan'208";a="7767123"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 17:09:19 -0700
X-CSE-ConnectionGUID: 2Ph4ict4R4G2PbMs9SXG/w==
X-CSE-MsgGUID: pprZTvHVSFOE/8ntr7LobA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,188,1708416000"; d="scan'208";a="24678043"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2024 17:09:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 17:09:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Apr 2024 17:09:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Apr 2024 17:09:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xy6DFTYwkz4O48zaO2CsSkzPOGf2NSr/Igy7sxXdELkTloFhHbNl+fhSjDN998kcXyJLgIWGbJR3Cgy1pftc689G35EmH5hKZV35QzvhkzOpQ66zykUvcnNiMNciF+pRWGD5WAO95l7StlwGm4fOst7UqAtompCxfVfriVTwnkgcV+dqZf8WIjkdLEHuOYbnA+ycrEEs1lEICjClXyjo9maHfV2/CGg/Hoscv66o4q3LjYXP1b6WWnycezihjg9uS5mfvJyi/RgsSjXG5DCuhYfGBqZf/Puq1Gygt3C/k0D5aA8t5MfbZYUSTw3c5ABvrfo1bqrkm/jaSiXKqchXjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgYsXHiDIsSL/P0vLYfJhRmZDJpDeAYbQyv1sE/UMAA=;
 b=m1CaXwLiDW2PYpd7VnB3xDdXKrHrDgoa0uoVl4oWNAaF+aQhk87Bq1LsmLvo/04otvwTR7CsFYDCJl2H5oCLRwpzSt6Q4BkgnXi/fyMp7OaGWwRcn6nHeBuPFhs8Rhm8JxeDRVFv1V6EN3bXrB2vSrBkmQS9ugCHb1WBH4JMnrXBfeHEUe7pdCijr9tf8+MtQGvwx6jXLcBUSja7sbbIX+q3cz+rKf0zFCnd3Kfag2dwPn5UNNyLcsD5SHlRPjFIO/+sOelVIMV+BZsuO+afmfGatZBikIhj4oByjE60gUKxlfabMELVVj7Up1GjTyeVoIktKqNwuLJCfHzjAYbmlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SA3PR11MB7434.namprd11.prod.outlook.com (2603:10b6:806:306::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Tue, 9 Apr
 2024 00:09:16 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 00:09:16 +0000
Message-ID: <bbfdc714-c1e9-4fbf-ab06-dfce94006e6f@intel.com>
Date: Mon, 8 Apr 2024 17:09:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Support/debug for slow GuC loads
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20240228011002.2454419-1-John.C.Harrison@Intel.com>
 <eyb6pt53jy4biywn7rgipk7lgajkz2wxvaul53wzbrpe6a2pvf@afsiviwaf4ix>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <eyb6pt53jy4biywn7rgipk7lgajkz2wxvaul53wzbrpe6a2pvf@afsiviwaf4ix>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::27) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SA3PR11MB7434:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ifIQwKFXBjnhnJGkeSgjJYZIjvPTzqazBYzPvOXxXpocKn1TOU6278Ee6mmo75bcQUv7SI/EXlSL+JZXsXNK4eFrFCxklIusaUMCLbXT0MpejILmERLpzfOZNA/jxEI/sxTicAsqnmoTLV7KSY3xGZJ9KN4nZ2zpd0ZQV1uMoTltJiHvwrC5P33MzyIhAGwTP2sJ5WiTJeQBODEQ7JBEaoHZM/rnNMqC5ee77DfyK5a771TvvTyqUWj2GWpp/XlQ7dnBRkHpAyf9VCevIEOO3SMcnTzDYZo38WTFrOPd6tZWinWZFfq/CJ1kTSMoehQlLp6TtQSYVWVj1PcmHOsp6wO2rUVpqxQ0SPKxSLMaJosuImc0CjeTqiSEiRdhh6OkQHMUI3pUZE8QdpaXYj2oIu0+5e0rJAvSnvP6w6hvJpRlkouoY+9yuvbnhUoouKiD34n0vPp+l80mt5dFHV6wfLUptvsNqUTbqHAtlsbkx5Wdbg5uwuS3aqQ/b9ZxcNzi0M3lit/m3rBSKfFRvikeT5KXirNrRxd4AOG1K8+5Xze3vxc6mxun7i4ZlygfS6DrH61Ji+Q2kdmTAvF2b/jymlc5MgNmUxzVGXcGVkJvgHU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3VMK0pQZExNdG81c1RlcGYzMGR6SkxPVzR2RlFoU0V4VDNab1dPUWVFQ1NO?=
 =?utf-8?B?T2psSjd2dkUvSVBpa3JFbmx0cXhGVGNpMGJHRWZsUkFaa0FoYVNZZnl5T3ZY?=
 =?utf-8?B?NnhoLy91OUg3TW1KOGU2MXFNSXdrNSt5RVlKTFpHZkFBaTNKT2ZsVGxpMVpk?=
 =?utf-8?B?UTNGQXZtREJ5YzhWbzEwNStyVTdGZkFUa21RQzFHRTBLYjlZNytrQnk3N3dC?=
 =?utf-8?B?VWZyM2g5di9jYk5YbmJzVlNwbkVEby9va21WUlFoZ0Nib0ZGQ3NiS1hMYmlN?=
 =?utf-8?B?SUhHM1B1dWZGbWVWREZvRFQ0M09NOTVkaFFxbXFjd2E0WnYvUkVEYUd1Z2hq?=
 =?utf-8?B?TjhjZVNWNTR3dTRiZzlwRTVWS1RvMW1wV2VkK0s4aDc2RkZJZkZJWlFuZ0kr?=
 =?utf-8?B?Z29vdWxRZnM3NFhZdHRlNGg0N3BnUjRMYlFOd3JMZkorK0NyQTBhYXVkMUh4?=
 =?utf-8?B?eHNGb1VHWGxSeDFjeWVNU0IvNnUyMHAzYzNPNGZrRGc3YmtZYWVlbGNRUnJo?=
 =?utf-8?B?WWVPTnRLaVlYMFFuQUpyY1g0VUxWR0VTMHdLdFZ1elUzVE1EZDJZaFVaaHJJ?=
 =?utf-8?B?cHNlVVQ1V1NiUzQvdE1WUGxrZEZEbjgxd2RUK1A3bkx6L1c5eC9wQ0lLcm1r?=
 =?utf-8?B?OG81MzJrK3NJK2Nna1J5aGZ2Q2dqcitsSlVhbUVZOWJXVUpsOXlpelQrcDR5?=
 =?utf-8?B?Skg4Y3FEMWtmSTd4WFphZjB4V2RDT29EdU9EaklncW9TUXdFeEFhNytIN2Y1?=
 =?utf-8?B?U1Vxby8vbEhhK3A4VmllNXkvRjFVRFhmTHpQdjJaWmtTRnBYRkdBZElDSm5t?=
 =?utf-8?B?clAvOERCSG1leXVPMWtnUFNMY1ZGa1FFQUF1QnZicE5mcDcxYVkwYkRuR204?=
 =?utf-8?B?YzBmbTVFNjJ1NEdtSzlLc3B3cm5KaHdzK3RVTTNzUkhIclZESTg3Q3Jua3pk?=
 =?utf-8?B?TVlPZXRTRWFKeW1pYi9ERzN5c3FFQ0Q0akNLMERtQW5JTHoyZEc5UGFsbFh3?=
 =?utf-8?B?L3pNV3FkeFVvanZUak5tVjBwVUtTV010dVg4dEhQWE0yY1VEeUZKZkE0S3hP?=
 =?utf-8?B?ai94c3RCNU1lZW1VSmJ1dW5UUjZKMXEyaU1KRlE2NDlVMkFCRVNzdi9OSVRV?=
 =?utf-8?B?NUV6WmdOZWppSHY1Y0RPYW1PRHd3Y1orSGwrUDlMem9sTGFBVnFGWnh3MVBp?=
 =?utf-8?B?dXdnOHJQbzFmRGgvOTYvMVJVQnNlTlNrY2grNjRKL3ZPam1NUHRGb25IQmNF?=
 =?utf-8?B?bWI4VVV6VnpYYnVmZHROUEtRK251UFhvMFNTTmxUbGJqbEY4U1NTeHJYaUMx?=
 =?utf-8?B?NGFZNGRMbnBzL2NGeXVaRDk0M1VjNUJLRm05V0lLd3NyWDV4clF3WUVkb0d4?=
 =?utf-8?B?QkhGU2NIRG5XVzZQelYydXNUeHRqK0xBQnQzdndabmFDcCtMak9ST3RZUDMw?=
 =?utf-8?B?L09HWDBJWWNZQklIN0lXQnZWNmxQSjFCeDQrbVVTREE5MkpnS1hFa3RNaDZD?=
 =?utf-8?B?R3RaL0FtRk5rV3pPNGcyRGZ2djNodVAydzhsOHhpanRXY2JSRkliT3NNQnpI?=
 =?utf-8?B?OXR2bHlSVVZRT25jU2s5cXdMaFVhcVl1Z3pFaTZuSmw1dXhQNFhmSjltZzFN?=
 =?utf-8?B?MkVCTUVBa21sbSswTnpzK0tKQnVBVnVkL2N4akZwOTViUUFDN3FiY3BTMUI5?=
 =?utf-8?B?MzNtUm1PbmJ5OEV0aVVWS3JOYzVXS05tNmhjVGJvci91eUFybVIycjdPbFZn?=
 =?utf-8?B?QTNucUZaMERFTzlTZlg5KzYwV0xCQXgzbFI0KzB4SXdiTkloZ2FkMmd3SFdw?=
 =?utf-8?B?M016VkFRVFBFMUxYVFpuS1NpcWFpRG5TQ0VCUWR2ekt2NnB4Y1ZGRG5hb016?=
 =?utf-8?B?VXdQbiswMTFzSlA3YjJlMkxtMFpuYlIrN2ViM1JsZHBneTJqVk9MbTZMbkpx?=
 =?utf-8?B?WG9pbkdPS2wzM0tLL2VPQ2JKQUZOQUY0MVoxWkk3cXZBUFgwaGRPaXRWVlZK?=
 =?utf-8?B?R3E4QnozcTlTVUNzdFpBekNkaU5saE9Rd081SGRXdmdmbkdVSUlFWmV4Tk5D?=
 =?utf-8?B?bkhFT1NUbFdrYU5vbHg1dVVET0RJVWhOMnI3R3I1bXJSWVREaUY0dTd1NUtG?=
 =?utf-8?B?cGxYdnk0SkxGQVF1d1ozQlFoaFNKYm4xU0lmY0dKSGVUSnNFZTZQamt0V1F6?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 105f00bc-2d7a-4734-2fba-08dc58294b0f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 00:09:16.1254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2KsGXyYbD6w1rNgoU6uwjhUGfzpgm34q84+RWIJP3A1wY9fiDyeZYz20uQDyxQNQ1tsLPEFv3A0pwGW5a5Nzrird2bJwdFHdfG7ZJZsEof0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7434
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

On 4/4/2024 11:25, Lucas De Marchi wrote:
> On Tue, Feb 27, 2024 at 05:09:54PM -0800, John.C.Harrison@Intel.com 
> wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Sometimes the GuC load is slower that it should be. For end users,
>> that usually means some kind of thermal throttling issue. Internally,
>> there can be any number of bugs that cause it. So don't completely
>> fail to load, just cope with it and report the problem.
>>
>> v2: Revert include order (review feedback from Lucas)
>> v3: Remove '_sysfs' from throttle file names and keep limit query in
>> the same file rather than moving elsewhere (review feedback from
>> Rodrigo). Fix the reporting of requested vs granted frequencies
>> (review feedback from Badal).
>> v4: Manually code the loop timeout/condition checking because helper
>> functions are not allowed (review feedback from Lucas/Rodrigo)
>
> wrong reason. It's not that helper functions are not allowed. Rather
> *this* particular helper was considered bad and counter productive.
>
> For similar reasons as e.g. Linus commented recently on bcachefs moving
> some functions to be shared:
>
> https://lore.kernel.org/all/CAHk-=wg3djFJMeN3L_zx3P-6eN978Y1JTssxy81RhAbxB==L8Q@mail.gmail.com/ 
>
Not seeing how this compares. Linus' complaint is about some algorithmic 
decisions that he disagrees with. It sounds like quite a large chunk of 
code that is doing fundamentally wrong (or at least unnecessary) things.

Whereas this is simply abstracting timeout functionality for a generic 
wait. I have no problems with wanting to have a more specific helper for 
99% of use cases that are a specific but common pattern. But for those 
few cases that do not fit that specific pattern, having a more generic 
wait helper is hardly creating 'disgusting and completely nonsensical 
interfaces'. Certainly the comment 'But the main dealbreaker is the 
insane math.' does not apply to a simple wait helper.

>
> We'd need to spend much more time cleaning it up and making it a good
> interface rather than copying what we have in i915 and stuffing it in a
Not exactly sure what needs large amounts of time to clean up? It would 
simply be the existing xe_mmio_wait32 function but with the "read = 
xe_mmio_read(reg); if(read == val) break;" replaced with a callback. 
Indeed the xe_mmio_wait32 function itself would just be a wrapper around 
the generic wait helper that passes in the read/if as the callback. 
Everything else is identical to what we already have and apparently 
consider clean and a good interface.

Apart from the atomic part. Which is apparently hideous and broken 
according to earlier comments. But still made it in to the Xe re-write 
anyway. And that is the underlying wait helper part, not related to any 
interfaces around the test itself.

> *utils.[hc]. In the past it turned out there were not real good reasons
> for abstracting it and making it generic for all the contexts the caller
> may be on.
That is a failing of the usage not the helper.

With great power...

John.

>
> Lucas De Marchi
>
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>
>>
>> John Harrison (2):
>>  drm/xe: Make read_perf_limit_reasons globally accessible
>>  drm/xe/guc: Port over the slow GuC loading support from i915
>>
>> drivers/gpu/drm/xe/Makefile                   |   2 +-
>> drivers/gpu/drm/xe/abi/guc_errors_abi.h       |  26 +-
>> drivers/gpu/drm/xe/regs/xe_guc_regs.h         |   2 +
>> drivers/gpu/drm/xe/xe_gt_freq.c               |   4 +-
>> ...e_gt_throttle_sysfs.c => xe_gt_throttle.c} |  26 +-
>> drivers/gpu/drm/xe/xe_gt_throttle.h           |  17 ++
>> drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h     |  16 --
>> drivers/gpu/drm/xe/xe_guc.c                   | 226 ++++++++++++++----
>> drivers/gpu/drm/xe/xe_mmio.c                  |  61 +++++
>> drivers/gpu/drm/xe/xe_mmio.h                  |   2 +
>> 10 files changed, 307 insertions(+), 75 deletions(-)
>> rename drivers/gpu/drm/xe/{xe_gt_throttle_sysfs.c => 
>> xe_gt_throttle.c} (86%)
>> create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle.h
>> delete mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>>
>> -- 
>> 2.43.0
>>

