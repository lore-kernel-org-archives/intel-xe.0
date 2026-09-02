Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F57C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 16:29:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444D910F2C3;
	Wed,  2 Sep 2026 16:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HIGr/swy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D151710F2BE;
 Wed,  2 Sep 2026 16:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788366569; x=1819902569;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GVemaGkm1e3RJe7Evu+3M22a5n38XX429hRiJ+m0LpA=;
 b=HIGr/swy7jYCwUV5HbXIo9xyKFtHJtiR+KYR8I/x1lNSedRZef27F8dd
 HaZj3GCbJDsaxo35IDjTfMKRGgzmvu7XTJhOJTRPsM0SNvBHWrhX6FEoc
 ga/HRzN7MvQuqW6gnBGuIIoqczXiNTEBW81oK7wbY/4VcgZ+/rl/iLsiJ
 EZezhbXwR5t3nGKAAGURrodUddleike6bBP0GvO312Ax3zxjCfiNvvaO4
 20VZJJsPUAwtnJ7rKWTUwpukhyMiO+5PEt2npSHKpzQShpMipec2CFBFe
 gt4sd7XMX4nRX8QE1dkmX7Nxrr1hvS90af8JGx85Fr8DOmhf2bKfzjqA+ A==;
X-CSE-ConnectionGUID: Yi6MlAbSSZ2OI8kx53171Q==
X-CSE-MsgGUID: 9alOjBS+SKmTpQzQEUJOrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88881899"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="88881899"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 09:29:29 -0700
X-CSE-ConnectionGUID: ZG24gEDZQKyc5HzEcMboXg==
X-CSE-MsgGUID: RqufSz2cQ6aHT8ewATWpAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="292962687"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 09:29:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 09:29:27 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 09:29:27 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 09:29:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqZddGxDNBi39z08zGeLiJ8QyJWbPRMbqeRF3yiCeFwHVQbom6ZSFeabsHUzt6h9h2VeFq6cERmoWDgoMCfIplTJ4QYhBAKDUU35RPg+sgvj4FDcq3Wv4nCVk/XUvh36ZAld0Ono+Gwi4EVQmB3jBpaI3qLpEz3+K1bPlWp7GjpD/PrczA8ccnW0u7X57ziRsrcSxe5HQenhEAQnXTC4lsHG3sPOgqVTBy38EKUvB4Mzed87qMHTEAYkMRTd9l27JB6SpaqZyuLHasrcI5tXhVLwmDOp5qZ+LBHerCrot8uL9G+m9ooF325BZq6BfXqyezesljl2bZ0egYeBWhdMGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96WAd+uPiWU3Owe9NMqvGCy3nudBkSWk9fJO56WRGJM=;
 b=ZCybkz4QeGxrGz3sidcwYQebmzv50Iz8YgKHLLpKOIjUusX4+Ix4hJOlgMoxtUPdbmLBkOfLT548fjIOqESiq4tNNL6NaFNdYgmlSiSR/f1PJiR0VRVtAR/Ln3SpGNtIgWZ5p6zcLO3tKtow1Wdeu1hqwJLXpfyrBjPWgK+BzaSMAUtCDxk/svocays5Pjgb78P0DxglW+S4/l5B/MveUGEFlfOsWxePeDNAKx7CsPHgY7vQEV1AqEcopZu6SV5SzU2n4v9sAZ94m7CFNa2plOMt6Kci43ZgaYtIGsg3xcCdl7QBO7yINTimkyOWxN8Q4qxkmk1XYVP4LYHonQrgkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7183.namprd11.prod.outlook.com (2603:10b6:8:111::10)
 by CY8PR11MB7798.namprd11.prod.outlook.com (2603:10b6:930:77::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 16:29:21 +0000
Received: from DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1]) by DM4PR11MB7183.namprd11.prod.outlook.com
 ([fe80::d9c7:d2fb:680d:1ee1%4]) with mapi id 15.21.0360.006; Wed, 2 Sep 2026
 16:29:21 +0000
Message-ID: <a94db05a-aa39-4b28-851b-fc512f574833@intel.com>
Date: Wed, 2 Sep 2026 21:59:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v4 2/4] drm/i915/display: Force disable DC3co when AS SDP skip
 frames is enabled
To: Uma Shankar <uma.shankar@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20260831213421.1804635-1-uma.shankar@intel.com>
 <20260831213421.1804635-3-uma.shankar@intel.com>
Content-Language: en-US
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20260831213421.1804635-3-uma.shankar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::13) To DM4PR11MB7183.namprd11.prod.outlook.com
 (2603:10b6:8:111::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7183:EE_|CY8PR11MB7798:EE_
X-MS-Office365-Filtering-Correlation-Id: 891bde95-55d9-4572-9522-08df090f57c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|22082099003|18002099003|3023799007|56012099006|6133799003|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: YR8XxUEjIsnJQncyxZNbyN73xkNKZ57+DhPNFh68JWBzWFhZqywfRQcWWQKw35NPTJ2eNzUzWMPFbMxXBoCmZ02KDAUXqfM7TSGFprnH7pvWkV+wf1rDkuBKTxanAHTFtf/tL7xMmb0vqHesKjHaF8872dLO5CUY+OUPq5CiH6A+BhObXTMPN8aLt5uBOp1mY921N89AkRhxpeFHpFXZgZpkkm6ZGkKXcOyJvhNNgeLswVjXTwT8I3+i8wNuFBENLciTU8+JFeyIS+jvqSHC5l+78HocUpTrJZVuWQa0I59qTj+8NFsozD/Q3HQ8eEgVXUug6V5DWGU2fvVcPnDn9pwX++fWitU5it+jFqS1oKK8mXCbJZNJWBsCOrsCiEXfNoLkgdn7asy3vEcN/ut83f90YpEBtkv+Jhlx7Ahv9NfhtislYYRAgJjP4QRCYwJixZ/faJor/ZnCwjX1R51YIrYQWD3dz/bam28HjVlGoY9Kj62FZitQmiJ/BETbOsk/6IxMXIhTQ3NMVXPSQU/p4f97LjvXILCKZ49KEyQWBfK6ZeebyRuGBy4TVZ9+3TqFsGVWWmKsTYU1pBkJV2rXo41F2ldOKPu1voi2ymBAkHNZY+QWI+NfKK4SRue4UyLC+zfZ8oeZ9iOrO0KG5ss9dhbl5m7c/tF+6GUvFIPAvTY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7183.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(3023799007)(56012099006)(6133799003)(4143699003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1YvTlExWSt2ejREOEk5TERwV3hLL0k1a2Y0ZlhWZExGQ2czSG5DYkFQT1lu?=
 =?utf-8?B?Um9uYmQ5N3RzL0s0MWRtVm1USzdraUZUY0hDTHJ5bk1DN0NNSGVSVW9FQjc4?=
 =?utf-8?B?OFNiamdvaTExbW02UERmL3JoVy9kMkUxK1k5T3JUNGxaRHdxdk9oTjZQT3RO?=
 =?utf-8?B?ck84Sml2UzNNTzM0dEdGVzhEbEk0U3BpVFljQnJESVU1MlhwNUFFSmMvNmlD?=
 =?utf-8?B?dGhvazJqUVNaKzYreFdFdUF1cmdnN1NHS0tEbU5ubXU3RFJGNkd1SmFnc2Ez?=
 =?utf-8?B?c0dubFVCQkR6YWd4WTZkTkhmUWNGVWpId1JBOVVOb3Vsc0JNNEYrSTQzYVRJ?=
 =?utf-8?B?eHJ2RDBHWkFyc0VzQlNLWUY0aG9qL0wzUU1VbHFqQytaTUZyZ3oyUFJveXpU?=
 =?utf-8?B?R00rRWRvWnE0a2NXdFd4VGU3TFE0eUZqcW54MmVSM25xOU1Ib1V6UkFqSGx1?=
 =?utf-8?B?TFdTK0d6RHlyWk1yYWlqeTk4em16SmVzenZjVDBRd1N2VmhJY2dIbFdBZldo?=
 =?utf-8?B?THJob0FVdTFIL0doczl3aG9kUGZOSWVKNGpReGVwbGhSV1V0Y1d3WDV1Z2NS?=
 =?utf-8?B?Zi83RWFuZlB1cUxiejNBN1FPSkN4elNtZXlPdTIrRStwTlF3S1dieEE0QWYy?=
 =?utf-8?B?THFnNEpxZ1M4YVJpWGFiclJUNzFGMlNqeXZlbzZYRnpiZSsvSkw2MmxtbWZW?=
 =?utf-8?B?Q3o0UjRBNmE0MUU0TnhWc3hYOWx0blFyWHRscGhrNDBoRmhhTUZ4b25mMzhX?=
 =?utf-8?B?NzRpNVNxR21sVWVBSENkSW9CWU9zRmVvZzFEekxwbkczVWhxSDBWMzVOMDhv?=
 =?utf-8?B?SEptL21IK0dJbXo1ekRWdlBBUkl5VkZMRzZlRHRSakNrWmg3a1JnZmJKaXRP?=
 =?utf-8?B?TUoyZEw2V3hxcnhqZ2pRQllZRU1hR1VuV29pWGw4SE5odWxOMlBNWTBJcldD?=
 =?utf-8?B?aGVURUFvZ0VtWFh5YVcyVXlpZGo4NE9iMmlpZnZzbFIyd1UyUUMwRGRnd2lj?=
 =?utf-8?B?bkRUWjlzQUZtNHM2RGFlM3pXbmRaRy9pcEJESzRlUHRsYWVUSnJOVUFibE1B?=
 =?utf-8?B?SWVSWUlxMUhEWXpyc00zcG4zS050dzJnMUtoblNYbUlwNVJ5WmovNDY5WkFK?=
 =?utf-8?B?OG5pSTdnTlcwSVNUbFRXMmhwZnB5QW8yMlBSN0xZRDFZbnBKRDVRcjBqSkh3?=
 =?utf-8?B?ZjFaQ0NyK2pSOCtXM0t6NUtjMGFTOFZUUVF1SEVyUGIvUmJXMnBpRlRDUVVi?=
 =?utf-8?B?cEdjSnc3YXdUK0FDbUFlTjB1eEd2Wk1WS0hSdVczeEF2dnZSTXUra2xqSkhx?=
 =?utf-8?B?SU54TEkwOERJVmtjbjhUWUI4WHY5c09zVEtac0puNWZkZm44SERzcGdmeXZC?=
 =?utf-8?B?OGMvb0t0VzBsOXkrL1l0VFBlOUt6ZDhhKzRwZGFZTk45VXZRSXJxT3pFNVYr?=
 =?utf-8?B?YmF2ZEF4MnpjQWgyWHA3TWh6eE5Zb3NwbElDUjZoVTdtZ09KUlFxcTZnRGdJ?=
 =?utf-8?B?bmZzQksvc1hpUGl5azdoK3VOT2FyTEhFY3lVN29iM0VVVGhpR3E3THEzWmNt?=
 =?utf-8?B?bkNBcHBZQ3pnTFN6emtVU0ZlOVZqbjBLK2NkVlZLbWxGZmI2bDNJZ2VXdTAv?=
 =?utf-8?B?NWUzT3BuUm5hMUFKSkdKbE9WeWI2Q2RXa05Fdk9NbXdhNVZjNitFMHhRRU1Y?=
 =?utf-8?B?bEVHaElZT3pLeDVLOUFUVGs0bHJPd2VwQmljTGlPbGxZUXQ4VEQzTXlJTCsx?=
 =?utf-8?B?SGs4bFVCdENTZFIzUGUrWTBWY3Z3aUVHY1dkWHpEQkRJTkFIeG5Gdkdra3RB?=
 =?utf-8?B?RkFoSjF4dnVXY0pVbnl1ODBZY1FOcHI2dUFVL0JIZzFYZ2xQOXAwbmUwa2dV?=
 =?utf-8?B?Y2tTUUVsNWY2Qm82QzZzWEkwalhjYXZtQ3E5OVVTbUtML1Y4bWJTWE1sNjc3?=
 =?utf-8?B?M0hwVzMxc0VlOEFhRGJ2NzNZZUhYNkxsSkY2Y1RXcGpYK0pxSTJRZ25Gam55?=
 =?utf-8?B?eXpidnQzaThTVzJJZi9sek5TWTZ6NXQ3TnNuVkFaKzZTZzU2dVNsR2o3M1BB?=
 =?utf-8?B?N2lxbVpMTXdsbWphUm01RmUxWkQzeVhncnFuem1lTS9memphSGVxejd1WVVq?=
 =?utf-8?B?UWVDTDE5cUxzRGdOUDA2cVMxTGVaKzYyQnkyK2JPckFrR3l6ejdNQW5taWp6?=
 =?utf-8?B?M3gvRTM0REl2TkhON1VsZWxIcmd5cXVweVhEZmJFbXR0UFdTNWY5WHNDUEx1?=
 =?utf-8?B?Y0N3ZSt1V0k3U0pPZndRdXVqZ3dlTVZ5bksyMUFzTFRMbTdGVWFGa0dreWg0?=
 =?utf-8?B?dmp5b2ExS0xXblUxblZXdDhGeUx2SzdKTHoyZi84SkRwdTg4dkhpN3R5SHNu?=
 =?utf-8?Q?ZCt2BNYgbiOeBatZKmNexn6lC15cy2TKbicTV?=
X-Exchange-RoutingPolicyChecked: lW0CMgn05LokhMcWusm8yHBHdlqwfQOmJ5v5x5RJ2uv2cOzS76hZju1IYr73PvgxgXFVwhCeoL6Uf8nbwfjr0riS2EGjgtNwoozkK7WYPGPRs3cvmhM5JfQ2BnEs/8eZqAikOj3RUC0ssEcHKSUtDNdQHK+t43AJf6p8YxO3ekDjehjzIXcmgYT8jrgMaBtVrIHO0512c1vifiDK6RzBPL991KsRsilTB4+VHrlzjf49KhiRvhckl7xJgOdhNZ2geUzUtwppq6laap+BKll8bB2cfwIwsfNaj8EE5rOdOjqoLfqdkBV4bfqAyZXkKc2JnibU6wRxcYLRjEZwNKAnAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 891bde95-55d9-4572-9522-08df090f57c1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7183.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 16:29:21.3683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t76Kp5IEqU/8yypdCbM/+pD4EjRPBaHZG9Xo/P3nBRjYtfDU9th1M9aSAMhwLVIXAxw1NQd7JaYa22vEL+TyHYpYexHbbOyaeOAizlPSkoE5YGt4lyyPRpcaTK49mJVV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7798
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

On 9/1/2026 3:04 AM, Uma Shankar wrote:
> Periodic AS SDP (skip frames) relies on the AS SDP still being
> transmitted while Panel Replay is active. DC3co uses the idle protocol
> which suppresses AS SDP transmission entirely, so the two are mutually
> exclusive: leaving DC3co enabled while skip frames is programmed breaks
> the periodic AS SDP and the panel never sees the slower refresh.
>
> Add intel_alpm_pr_as_sdp_skip_frames_enabled() as the single predicate
> for "skip frames will be programmed" (mirroring the gating in
> lnl_alpm_configure(), including that it only applies when VRR is not
> active) and use it in intel_display_power_dc3co_compute() to force the
> DC3co trigger to NONE. This drops the pipe onto the
> DC_STATE_EN_UPTO_DC6 target instead of DC3co whenever skip frames is
> active, without touching the DC state module parameter or the allowed
> DC mask, and only for the skip-frame case.
>
> v2: Fixed Sashiko review findings
>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_alpm.c     | 23 +++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_alpm.h     |  2 ++
>   .../drm/i915/display/intel_display_power.c    |  9 ++++++++
>   3 files changed, 34 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
> index a6838e0fd3aa..0a33a89975bc 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -404,6 +404,29 @@ static u32 intel_pr_as_sdp_skip_frames(struct intel_dp *intel_dp)
>   		     REG_FIELD_MAX(PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK));
>   }
>   
> +/*
> + * Whether periodic AS SDP transmission (AS SDP skip frames) will be programmed
> + * for this Panel Replay config. The skip counter needs the AS SDP to keep
> + * flowing during PR active, which is incompatible with DC3co, so this is used
> + * to keep DC3co disabled while skip frames is enabled.
> + */
> +bool intel_alpm_pr_as_sdp_skip_frames_enabled(struct intel_dp *intel_dp,
> +					      const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(intel_dp);
> +
> +	/*
> +	 * The AS SDP skip frames field only exists on Xe3p_LPD+. Periodic AS SDP
> +	 * drives the panel down to its minimum refresh rate on its own, so it is
> +	 * only used when VRR is not actively driving the refresh rate.
> +	 */
> +	if (DISPLAY_VER(display) < 35 || !intel_dp->as_sdp_supported ||
> +	    !crtc_state->has_panel_replay || crtc_state->vrr.enable)
> +		return false;
> +
> +	return intel_pr_as_sdp_skip_frames(intel_dp) > 0;
> +}
> +
>   static void lnl_alpm_configure(struct intel_dp *intel_dp,
>   			       const struct intel_crtc_state *crtc_state)
>   {
> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
> index 1cf70668ab1b..328920027f1c 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.h
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.h
> @@ -34,6 +34,8 @@ bool intel_alpm_aux_wake_supported(struct intel_dp *intel_dp);
>   bool intel_alpm_aux_less_wake_supported(struct intel_dp *intel_dp);
>   bool intel_alpm_is_alpm_aux_less(struct intel_dp *intel_dp,
>   				 const struct intel_crtc_state *crtc_state);
> +bool intel_alpm_pr_as_sdp_skip_frames_enabled(struct intel_dp *intel_dp,
> +					      const struct intel_crtc_state *crtc_state);
>   void intel_alpm_disable(struct intel_dp *intel_dp);
>   bool intel_alpm_get_error(struct intel_dp *intel_dp);
>   void intel_alpm_lobf_compute_config_late(struct intel_dp *intel_dp,
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
> index 0ebec6e0c240..1b60ce2dd00c 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power.c
> @@ -10,6 +10,7 @@
>   #include <drm/intel/intel_pcode_regs.h>
>   #include <drm/intel/step.h>
>   
> +#include "intel_alpm.h"
>   #include "intel_backlight_regs.h"
>   #include "intel_cdclk.h"
>   #include "intel_clock_gating.h"
> @@ -488,6 +489,14 @@ void intel_display_power_dc3co_compute(struct intel_atomic_state *state)
>   	if (crtc_state->has_sel_update)
>   		trigger |= DC3CO_TRIGGER_PSR2;
>   
> +	/*
> +	 * Periodic AS SDP (skip frames) needs the AS SDP to keep flowing during
> +	 * PR active, which is incompatible with DC3co. Keep DC3co disabled while
> +	 * skip frames is enabled.
> +	 */
> +	if (intel_alpm_pr_as_sdp_skip_frames_enabled(intel_dp, crtc_state))
> +		trigger = DC3CO_TRIGGER_NONE;

I think this condition can be moved inside the for loop,
where we already have similar checks:
if (intel_alpm_pr_as_sdp_skip_frames_enabled(intel_dp, crtc_state))
     goto done;
This aligns with the existing checks for DC3CO entry.

Other than this, LGTM.
Reviewed-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>

> +
>   done:
>   	intel_display_power_dc3co_update(display, trigger);
>   }

