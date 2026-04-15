Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81732F4384E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 15:48:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D1810E13C;
	Wed, 15 Apr 2026 15:48:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PeNTAO0F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 578CC10E13C
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 15:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776268090; x=1807804090;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ssJRb2P2MDa+jdLs0VlEUIuLaksJJ65vxum6T2J/nhc=;
 b=PeNTAO0FxBlyskfKuRZChkNRa6NuwKbqUWVvbqMnaoEKXe3W9c35BR8F
 juw5Sx6yZrECEHMhjPXKpjaF5CfyI/t0PC087l4RU1qMX97X3tHPQE34w
 Ugj3NaNK4oBlSg6yUX+XauSydVMFFFLLJ0Cws9jCdMhLnZ+sXXDUqWt0n
 x/i29GuPnYHfgM+wRVWy0VLnqL4/nHl2JNYHJscZbZrhh0Zd1LBU0qQMf
 T9W58aZeGckZUvBgfJdCbamGO3zWkdNrZEELfzhKnyUVeTsy/isKc9CrA
 3rdfYhr8Rj45bXnLCRBy/FgXeSlkehnaSFquRQfpkdE/YyDc3eD2n63DO w==;
X-CSE-ConnectionGUID: aKfmWysRQLWSnhi1dFoMQA==
X-CSE-MsgGUID: 20noAQODRL6nDUJSbmwScQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="99892075"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="99892075"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 08:48:10 -0700
X-CSE-ConnectionGUID: 1NgP0qbIQwOH5xP8vdPfBg==
X-CSE-MsgGUID: Mqm2JXACSDWXNwNBZYV/OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="253874551"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 08:48:09 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 08:48:09 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 08:48:09 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 08:48:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ab2DPi5mcl79mog/onyGIkN0X54DuHcujvvQgS/EfrR9uPRm5gkGg27b3LQzYyXTujgmrCpafcnmvfM0dWNFkuhn/PmiiLytLKKMAqkMwFcgjltH6pPjVXpqubUTx/IsJ07HqnEj2eYd2h7mNaSnUvqBSPQofuLEiiBbO6cJXfv7ODkU2OQ9S8sfhQ8/K9jhyWt+J5cPm5i91938n4XfNzkz+d0vMBD0CGrb84JW47yt5Z+TW/wG9kGWFf/dfsEAq1eeuUgxBOceRtgn7UIGkISwW5PYbf1dfnATfO1uZGv3qmPw3Az5lU1CGBa3Ki+8q/HFg2857by/7j2kvwCL8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1AIo5Bnw21+Ya5gKbLZ39dmfmZDeK8iX10ODQvPfGo=;
 b=RQL0XtMSkpv5VV3Dj9Bp9q82/uQJ1UaiX6lV5vlLbWKzFvF1lVHNTpBDd44IlPN3rofus/JZGRbrs+g0bolyIeKbg9P6ui8ytVgoDJfq0lTsEIHrc2Nh7MR3WI6wDVU3ZRKdFcsJ09ofPgo4kYdMrhSTlwlGEY6Gaio1OyhnkT3QHmFWNcuqu4z8NyB9AaXKWVa5hvmFoISteY+xhLCtjUuGoD8TWrSG8I6clqdjmP3qZqZ62tQ6T5dGU9GcKqi/kuKHbRSVhKy0BGoNFzsDGZFQm2rovz6TJwbVxVJNYMWu210RDct7n9GNb8vFBRyDaGqPeSM5a/ZxOJ35Utllnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS0PR11MB7263.namprd11.prod.outlook.com (2603:10b6:8:13f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 15:48:04 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 15:48:04 +0000
Message-ID: <adcfe2bd-56af-4368-96ce-32fb9a5c6642@intel.com>
Date: Wed, 15 Apr 2026 08:47:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/9] Introduce Xe PCIe FLR
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>,
 <maarten@lankhorst.se>, <jani.nikula@intel.com>, <lukasz.laguna@intel.com>,
 <zhanjun.dong@intel.com>, <lukas@wunner.de>
References: <20260406140722.154445-1-raag.jadav@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260406140722.154445-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0100.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::41) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DS0PR11MB7263:EE_
X-MS-Office365-Filtering-Correlation-Id: e29741cf-6f4d-427b-df64-08de9b0661c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003|11006099003;
X-Microsoft-Antispam-Message-Info: 0Z8tJDjSdZZhYVvZ8IFN5ECtJ0yvrdcG8ZQD+nFnzFWtTfvVkaBzW42e+nWyPflowHwCRWT0I8jrzXrHvolP+QvxGBpzQdMQbRfXRYC0AAO1z5Qo7v8ZkM4gLIrWPi6PMl9WnTXRH7/cZAcHNBvyOr+Rkm8h3SGgjIpFXEGBLVB0YSJ893PXbjZeqZULP1Er6shm9LX6j74UJErfRb3MqhmXv7Z+Sr8eyfvvMFlAsEaaTCa5lut/jWIu9rZVkrdR6UEkUww9TZBGTIJCNA0PlDiPR5ziqZQ4GFG/Zbr1Dp3DnRUyKber718dyIH2UxAlKDOIOPTETsZ65Q2pDYhwRm1gc5hqNINEZgZjaSZGAUEu6SyODrVkU0cCjQZcok1oh7tT7aagk5ZMKMm1Po/o7cSIIC5LL7vCIJBVfQV9D+PmhHJwd6BSRECKljJhk63O67Z5U8oCtMiL7EUEsPCJTvpYJ2Jc21G8RwzP/s0Yu8dZw5CTEdY7lXFV0CeWtPZgI6gKpQByNsH11f813neIBx7qUSJaKQQESGoj1nXvYXz/rizIOxaQhQuyFEmDYefHDeANNsEh+Fd0Lbw/K6wWFVbQP0AiZ79DMVjLXWfsOZd7wKa6IZt+5SlUVE7khu7cF8UKXzo1CmODH+28yrRSWkHVfe7i0CskJ+fqhPJ0vjaK5Z16bc9iRhKqycm6H/PLAROE9s+GTau0hrVlJtrY0iDPgzFH2nEVPFByubbX7WU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003)(11006099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0hCRkZIaWxSY2lwSXhTSk92Wkp1TDNTT0RSRmsxSWluUEozOWFEdHVqcmU2?=
 =?utf-8?B?RjJwaVJRY1drVEVydzBCUVFxdXU1TnkyS2xzSFRRZDZUQVoxd2g5NEFhVERz?=
 =?utf-8?B?OVlQY2xGN3o3YkZ1VUoyTGNrYzRqMnRLL2lEUUJiZDQ1MVdHR2hORDI3ZU10?=
 =?utf-8?B?NzB2SEY1NG5jVnJzK3pKVHkyWDIwVlkvVkMxMHRqMm96WGJsb0YrZTNTbTU5?=
 =?utf-8?B?L2REWHpGdFlQZnJsTWpWYzFraTdFdDFmRUJsYVU1THg1N1kxbUQ0RnFUdTZD?=
 =?utf-8?B?VE9BUXJuMlFmWWkrdFNLNXRWVHdDSTkrUXBFTk1UeGE0dGxCd3ByOVpHOGdj?=
 =?utf-8?B?Ymw1cUg1SytOU3pFMXd3ZGlIUWg1YmxZOCtVa3FZSCtjbmRXdHBDQ20rOWE4?=
 =?utf-8?B?VWgyYTY0Q05rYXo4TllKZjBuam5sZkw5bVRpVmg3NFFubHYxanNxQTlJVkxj?=
 =?utf-8?B?aWtBY3lhQVZxajF3UUFaSTFkMHo0SFNmRk5CcHVRemZHaU9xWEZZSTFpSDR0?=
 =?utf-8?B?VWNSeVhML09UZ1JHcmsrbnZHZVJ1L0UwQVFGSFhzb2lDQjNTdkM4ZmQ3V2Vk?=
 =?utf-8?B?eWtaMEZZNU41aTdXaDFDMkhBdDhCYjlqb2hPOXYzMFB4NFNDVzc5MTRUcWxE?=
 =?utf-8?B?cjhyc2JPLzlPMTl4NkpZeE5NMjVEYUxTUnFpNmhjVEVyejFsQ2FQYUVrTWgy?=
 =?utf-8?B?TFBPbm44enlQNVVJTHFud2FaWGkzNzh1cGVRak5NejVSL3Y3ZThHMklBcVNq?=
 =?utf-8?B?THBFWFVqbmtKTTFUZHZWQXdJS1R1UTJEVFcrWmRSejJSeFlaY004aHVseHlS?=
 =?utf-8?B?NEZ1cE04MjBQSllVQk1OL2dBM3hvS0hrRjE0dGpheCs0dnBlZlZtU284SG9J?=
 =?utf-8?B?Z2dzai9HVFUyeHdxVDFzOXQ2TDM0Yk0relZJK1Y5bFlXN3J4dU9xdUNSenpt?=
 =?utf-8?B?RHQvNzNZTTRPN2tuOHJNZExEcEtZbEhVY0h0K0F3Nm1jVENxNmk3L1RtcGhB?=
 =?utf-8?B?RTRURlJnOTRRblBFdStUYzYvaTVJUDJrNWFrcU1rVFRuOVlXTDZTQTgvODJR?=
 =?utf-8?B?cDUxY2RhTjd6aDIrT0RLSyt0QThkWHJxNE52cHRmazdlcDNndnFDRkc1WThx?=
 =?utf-8?B?RTgwQThHVVQ2V0pTYkdDajJXSUVnSTFGbi9LVDJpNVdKVVdhamk4STRWVjZt?=
 =?utf-8?B?TkhjZ3lOYXpmZkZBYlNhalZWRUNVMGs0amlnZWZUeEdEZCtINFVIVFh2Wmlv?=
 =?utf-8?B?NnJNczFhM2pmenVXNGFhclduRVZTcldZV3RMNFdTSEVTd2Y1SSt5STZxUTVL?=
 =?utf-8?B?ek1qMkVndWxlWnI4Z3VsWFBrclRoSm1OMWVoanJiUk1rTmp0WlE3bUhZazZ0?=
 =?utf-8?B?Tk80YllUU05xdUtmL1ZsbktSZ3J3R1Vha0x0Mll6emsvWEFSSkhsVG9IY0p1?=
 =?utf-8?B?OHpnSkU3VGgwcjVKNlVVNXRzYzhad2NKdCtEUzBtSXZRejVLZHB5K3hKckdn?=
 =?utf-8?B?ckNocitYSHdpQjRrSkgwak1PQ3NwTHEvZ2JYbnNTR0JvL3VFSDEvZHZOWVkw?=
 =?utf-8?B?TlE4dVF0Ti92SXBQSHRsOTNRREhFblgyUDBNbzF1d1orTUVzdEZmR29nRW5u?=
 =?utf-8?B?Z21xak16VjViTWRaRGJPYXhWQmYzeGpRdXE2MGRtUXRwOTRvK0lMZW9BQkJl?=
 =?utf-8?B?L0hVeDZHTSs1ZGhiRFd4Y0VFT3FJWDlwL1NqU2VYSytlMTdsTm9BR2g3czdm?=
 =?utf-8?B?SlczL2pMem9kazcyN1Q3OWduYS8zSjhQbTY4Y08rYnNUYTVMNVZ6dkl6MFlo?=
 =?utf-8?B?V0VkV2w2dlhiT2M5MWpnSWFqd0lBS1BaWDdjcU9SSWUvU2RhUWtUNnNTYXRx?=
 =?utf-8?B?U2l0ODd3N1M3UU84dUlTUlp6cytDb2U5S2Nmc3FsTmxuM0c4dkNKZzR3TGhs?=
 =?utf-8?B?Y1dRZWUxajRsd2FXbXpFeG05RnJURndpdnB2VU8rM0JZTnpheFRBbElmY25W?=
 =?utf-8?B?Ty9aR2sxdThLTGYxSzBreGNweGlyOGZ5R1c2aWtEaDhnVXlEOFo5bk4rMlJu?=
 =?utf-8?B?S3RyRGQyYXlTVU82d1NEWTlCUzNuK1FsVkZpTlcxRjFkcU0vTkNoTmJ5L3po?=
 =?utf-8?B?VTNpNFpTcTFlWEVYbVJ6cEJlclNOSXdmOWRRUHZyMStsMklGUXkvMXluRHNP?=
 =?utf-8?B?a3pHNjNtNUlVb1BpZmNVU0dPbExaMzJpY3V3MWo2NlA5QTN5REJCWlFJcnk2?=
 =?utf-8?B?amlHaE9hd0toOERkVXBsU0NsZXU4UXdycjBLL1k2OHhoWW1namxubDBRNGQ4?=
 =?utf-8?B?M1grc3h5T3p2QmNCL2NnQWlncDREUzdvQVcxamhMWk51cFF5UjRYT2twUHJJ?=
 =?utf-8?Q?PgYCOEMMlpSne/Gs=3D?=
X-Exchange-RoutingPolicyChecked: RKkUwNaGnxgZOZ/XHPhpn8hxhTzg5OsoSCcYzRk8EeA8t9LQlFInCUM8DDRcbsoOaoeAwfxWrDu0Adsw4rCrqZ2PfFJ9GJnb5GNcdyBH0oBSbNbn5iz5G1EFdU99hZopwhK6iBp0pcKCzo4DUamyAipxA9WSff5uijxcoyaFm+AqqMg3Y5iHNEyHBbJLJNMm0V+FVRCQP3rqRWqiiGsvn4TNqDL/CBocpKPGXQXDjF2425ZcDPYnR1ymfE0009ebONlYbnA6KbEZ6Zo66TZ85PIGiFmYxXLKoLpJ23OAFCe1e4y6xmgk2i8iZ5qtfgh/uCzY7pKG4oitU51sz+Gh8w==
X-MS-Exchange-CrossTenant-Network-Message-Id: e29741cf-6f4d-427b-df64-08de9b0661c7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 15:48:04.7212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bAVdKhiFlgoECjfJRVbzCAEvvT+8uxt9Hf6OuORemaCApKbFfK3Ekzl8WCp1RKwHTGH1mliXCmJQawubFK8PgBBVPfHhUOmFoXmvc4tfgco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7263
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



On 4/6/2026 7:07 AM, Raag Jadav wrote:
> Here's my humble attempt at introducing PCIe Function Level Reset (FLR)
> support in xe driver. This is ofcourse a half baked implementation and
> only limited to re-initializing GT. This needs to be extended for a lot
> of different components which I've skipped here for my lack of competence,
> so feel free to join in and support them.

I'm jumping in to review a bit late, sorry for that.

I think we need a comment (both here and in code) to detail exactly what 
we expect to happen around the FLR (or let me know if it's already 
somewhere because I couldn't spot it). Which objects are expected to 
survive, which ones do we need to recover or discard (and why)?
I'll sprinkle a few question in the relevant patches.

Daniele

>
> PS: All xe_exec_basic tests and clpeak run smoothly after FLR. Give it
> a spin and let me know if any regressions.
>
> Trigger it with:
>
> $ echo 1 > /sys/bus/pci/devices/<BDF>/reset
>
> v2: Re-initialize migrate context (Matthew Brost)
>      Add kernel doc (Matthew Brost)
>      Spell out Function Level Reset (Jani)
>
> v3: Cancel in-flight jobs before FLR
>
> v4: Teardown exec queues instead of mangling scheduler pending list (Matthew Brost)
>
> v5: Re-initialize kernel queues through submission backend (Matthew Brost)
>      Prevent PM ref leak for wedged device (Matthew Brost)
>
> Raag Jadav (9):
>    drm/xe/uc_fw: Allow re-initializing firmware
>    drm/xe/guc_submit: Introduce guc_exec_queue_reinit()
>    drm/xe/gt: Introduce FLR helpers
>    drm/xe/irq: Introduce xe_irq_disable()
>    drm/xe: Introduce xe_device_assert_lmem_ready()
>    drm/xe/bo_evict: Introduce xe_bo_restore_map()
>    drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
>    drm/xe/migrate: Introduce xe_migrate_reinit()
>    drm/xe/pci: Introduce PCIe FLR
>
>   drivers/gpu/drm/xe/Makefile              |   1 +
>   drivers/gpu/drm/xe/xe_bo_evict.c         |  51 ++++++--
>   drivers/gpu/drm/xe/xe_bo_evict.h         |   2 +
>   drivers/gpu/drm/xe/xe_device.c           |  10 +-
>   drivers/gpu/drm/xe/xe_device.h           |   1 +
>   drivers/gpu/drm/xe/xe_device_types.h     |   3 +
>   drivers/gpu/drm/xe/xe_exec_queue.c       |  37 +++++-
>   drivers/gpu/drm/xe/xe_exec_queue.h       |   1 +
>   drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
>   drivers/gpu/drm/xe/xe_gpu_scheduler.h    |   5 +
>   drivers/gpu/drm/xe/xe_gsc.c              |  14 ++
>   drivers/gpu/drm/xe/xe_gsc.h              |   1 +
>   drivers/gpu/drm/xe/xe_gt.c               |  47 +++++++
>   drivers/gpu/drm/xe/xe_gt.h               |   2 +
>   drivers/gpu/drm/xe/xe_gt_types.h         |   9 ++
>   drivers/gpu/drm/xe/xe_guc.c              |  29 ++++
>   drivers/gpu/drm/xe/xe_guc.h              |   2 +
>   drivers/gpu/drm/xe/xe_guc_submit.c       |  11 ++
>   drivers/gpu/drm/xe/xe_huc.c              |  14 ++
>   drivers/gpu/drm/xe/xe_huc.h              |   1 +
>   drivers/gpu/drm/xe/xe_irq.c              |  13 +-
>   drivers/gpu/drm/xe/xe_irq.h              |   1 +
>   drivers/gpu/drm/xe/xe_lrc.c              |  17 +++
>   drivers/gpu/drm/xe/xe_lrc.h              |   2 +
>   drivers/gpu/drm/xe/xe_migrate.c          |  12 ++
>   drivers/gpu/drm/xe/xe_migrate.h          |   1 +
>   drivers/gpu/drm/xe/xe_pci.c              |   1 +
>   drivers/gpu/drm/xe/xe_pci.h              |   2 +
>   drivers/gpu/drm/xe/xe_pci_err.c          | 160 +++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_uc.c               |  37 ++++++
>   drivers/gpu/drm/xe/xe_uc.h               |   2 +
>   drivers/gpu/drm/xe/xe_uc_fw.c            |  39 +++++-
>   drivers/gpu/drm/xe/xe_uc_fw.h            |   1 +
>   33 files changed, 510 insertions(+), 21 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
>

