Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9741EC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 21:17:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E19110E634;
	Thu, 25 Apr 2024 21:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XYun6Dun";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6178D10E632
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 21:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714079877; x=1745615877;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=BwWDrVlF+xGg2h/lU17pM5RYw6tP5AIw65wiBO1ux5Q=;
 b=XYun6DuntBZu/ozrqLfRDlxus8SiIVVUCbI9uY39OSQYpqsB8cMFYZ9t
 FR9QDEPFpNzbmd3z+2eK+HJAToFSFzazMst/M/7pOF+AnCCs2Mv/O0UlW
 m/dAG+YgFzmjvuz7DiqVuZpjTSm3PsmADB8AMqXHc5KQgMWSVTsJXOCoC
 mJDLpbsWksYNe+fS5Zwa4225g/UlWL8iNnrrWMZhVr002MgmvidosqtyW
 5Dpvs6ymmjK5gvRFZ9MiUB4ML8x3HIUjw9iTAD4KL9waomD4S+e967pzq
 MHmZAktgdeRdihsDFmfYUiDyeYN289rr1wNHP8I4FUYVU+Hv3QDNb7QTl A==;
X-CSE-ConnectionGUID: 3FmSfuSAQP62dUCynZ8DsQ==
X-CSE-MsgGUID: 95BxIKB5RmS8+pssduHShg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="21205084"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208,217";a="21205084"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 14:17:57 -0700
X-CSE-ConnectionGUID: ahYibdU3TLydMSkDcKqe3Q==
X-CSE-MsgGUID: UrWnlSUqQ4e3uZnrNGM1ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; d="scan'208,217";a="25849757"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Apr 2024 14:17:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 14:17:56 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 14:17:56 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 14:17:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrABAmzqOhlkacpmr9aqlJyPn9JPgPCQ6lXdoNac7W90FpAcputDY6yiQK1hQfZt+EbgNQ5h2WHYsfDsdUKY8JjUXbWjMYCXrDxvakBvK+ue3akwrFskwxla0b6BW21JKSIXxNWO0rVBhL5rSC0DzX752QzuyBhqX6M2VsZAeksZ+NEOjlIiBGcdhwl+Uq5xpfB92d1q7rjaTNrif3yaroMRDL0JmfU+YZqLNAlI6mcPqBcsYPFRQswZfr9fsvUBzhmAbRApyKj6vcYRM+9/YN4GM9Bv5TpzNXY9mdhY+ymzFITMFUM7MTdnr8PL65gKJjNo3JqY+wX4S5rtLr35nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLVBfVz7BfbXCQs4EAKVyXwgYLBXlem9hj6X2vcfyMM=;
 b=XW47xDj9xrqtGPUKsggUDXijlHQeJ9ph2MMdXQ7IlkYNbs40og2ZiVvbE0TLYBhg+9nm36Q/bT/pD1iTncrhwEE6AUgcdik7uXKX4I0QCwp97tI6iqGTRm5SpmnLwJNnDa7f3xmM46suz0xJNKBbA2lQbYy75Gvsa5WoULYB+RamyD1QLVwVQ6zhK+lWOOxgGrhRgZgC18MiRXTLCnJCaEIyW3yMFA2dtjxhDUxQDHP2NXXzMbYDpEVOUusZQoETRoZk49q8WxGKSlhoMYgCW5LhvF+pgnb7eptA/SDtmWUT+IyGxIG2FvhHUaXJ9liu4DwuI9xW4BvJtSN7d9VbWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SA0PR11MB7160.namprd11.prod.outlook.com (2603:10b6:806:24b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.22; Thu, 25 Apr 2024 21:17:52 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::d616:a889:aeb0:3724%7]) with mapi id 15.20.7519.020; Thu, 25 Apr 2024
 21:17:47 +0000
Content-Type: multipart/alternative;
 boundary="------------60IrPbbT2wYjYCLVXeerMfTy"
Message-ID: <986293dd-43ac-4ba7-8b30-db6cf2d93f5a@intel.com>
Date: Thu, 25 Apr 2024 23:17:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add engine name to the engine reset and cat-err
 log
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240425121856.4500-1-nirmoy.das@intel.com>
 <ZiqW68FPS+vJ8TtR@DUT025-TGLU.fm.intel.com>
 <63adbb9b-ee0e-4a60-866f-135ee59f97dd@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <63adbb9b-ee0e-4a60-866f-135ee59f97dd@intel.com>
X-ClientProxiedBy: MI2P293CA0006.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::18) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SA0PR11MB7160:EE_
X-MS-Office365-Filtering-Correlation-Id: 286739b0-208a-43a4-1664-08dc656d27b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmlyMWtTUXlXKzBpZS8zQTVhOGhxYUNCWTl2b2Z6cmlFVEc1WGFpbEpCeWh2?=
 =?utf-8?B?cEczanVwQWpYcjljSXB5aW5od0lnbnlnbnFGaG84Y1pnaDVSZWpIcDV2RTRE?=
 =?utf-8?B?cTVUTkxDcXptTXV2bVUvUFAxMnVuakFRTmxNaFhzS0FwMWVVUHE2czEzRm1o?=
 =?utf-8?B?VG90a3BjRFdzdFB1ZUVNNTNzUlR2cHpzVytoQy9Rd2FkR25xUXZLNEdYUndN?=
 =?utf-8?B?WWswTDRBbnJNQzhZYUptdGdVMlpEZHZjRFBiVWdkaTNnMmNXUlpEQzFTWXRG?=
 =?utf-8?B?S21mdEV0dlQwdkhvZTdPVDUwTStxZU15UlBTZnlvMmdtOUdtUlVYNmlXbDJ0?=
 =?utf-8?B?d0JuaTVzREVHS21wT1dYdlVLRmVpYXlXRi9qWTIxSG83R3FhV1lsTXNtcTQ0?=
 =?utf-8?B?SkJ1WEg2V3FGckpPbWxHS1lRU25BVFE2K1ExZHhZWXMzTktEU2UxZUJncGdT?=
 =?utf-8?B?bTJObXdMYThROEY1R2xNaWxzbjJHMnpFT0FYNkZyaUxWdHdDNjNVaWdLWTZQ?=
 =?utf-8?B?UkF5dWNyNEtlMTJnRCtzbFJnbWVFa1NqeDI2WVoyUFdJM2ZQbXdKN0plekhY?=
 =?utf-8?B?dHF5TUNYM2pncFRBSVFnSU05dTFsdERCZTduZVRmTko0RDBXUFo5TWJtY1FP?=
 =?utf-8?B?cUdoWXhEbUl1N29wOU5IalI2a0Z3MjBvTnFrUElPZFZSZEtJdHh1QU9mQTBD?=
 =?utf-8?B?ajlrZzRoMHo0aXByT1FuWnRWczNoQjFDYXJZVDBjcnhON3N2SWUydm1LMVJO?=
 =?utf-8?B?VEkwQ2FPbE9FQmJsRXdqa0JXZDlMcmV5OUFja0I1SjBsYXJCWjdSN3FEMWNR?=
 =?utf-8?B?MWZvMGpmSkhpZWtNZ1gxMmZ2OWVkVGl0c28rYmF4SjNuY1h3ZDl2MkxLeDh0?=
 =?utf-8?B?WE5HZE02KzA3LzErazNKZHhoNE5pbG1jdnVOalJnYnJVeDBjR1k0VXltNDlT?=
 =?utf-8?B?Ym13b2VNWFA3QnBYYjdQbTVRYU0yNVpRazVOelB1dVVId2ROYkFiQmhlamRK?=
 =?utf-8?B?WktlQ2syNm5saGJwUHpBQlJJQ28vclN5UjkrZjNlN2RUS21vanR6Rkg4UlBY?=
 =?utf-8?B?UVRYQ0RMYTVLYzBsc3VuamtWZ3hJVlJWQjU2YitMUkI4REI1Rmg2cFRzQ05E?=
 =?utf-8?B?bWYxalVEcGF1cmpYRlBmTXJ0UUJsYWFuODhyeEExMFQrUlVmdlBhU1djMXRv?=
 =?utf-8?B?cDB5dkVQUEtrZ2hYb2RURUZ1NGljQXhWRG9jOTFTTXVubk9kRFIyRVFTUUJ6?=
 =?utf-8?B?aDk1OXJnNXlOamZkNFAvZFM4SG1uMjJBQWRsTlNIWFR2Z1hpbC83MnQ4T2Jz?=
 =?utf-8?B?SzhDTG9XYm05a0ZkaktmdzNnN2FOSWkzNkF6N3FiQmt4NitQZFU1WTF1WTl1?=
 =?utf-8?B?eWhwTkVCSFZpNnpjZldsa2VvUDZjNWJUSmdZaURiS1o5QUJwOHNQWmhDN2hR?=
 =?utf-8?B?RzhwdURkWkRreWdoNlUzNnJsVElJN0kreU1rVXU3NGZLRmJ0OCtRNEl4UWR2?=
 =?utf-8?B?WE5qUFFxblBMb005bHZYT3JjL1dpbmlTUzM2eGh6WGlBK0lIbWZad1pmVHVm?=
 =?utf-8?B?L2pXWTdqWnpaUGFKK215a2xIRFJwN1pQeDk3eTN3RnlJNVZsY3d4VEgzQlRq?=
 =?utf-8?B?ckNPZGdDUW5MU1FXcXZyZ2tUcEpKbXppZ2x4UVowTGZXdnR3aVdYM1Ntendo?=
 =?utf-8?B?eWpmK1lReEtmdXh3TFNiUjR6eUFjaTJBMjYzZyttRFZzdE42V2RxbXZnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHRoK2JveWllYmNXSG1rZlBxYWpURmh5T2xKSlRIbWJRVU9mZGhuN2R6dFMv?=
 =?utf-8?B?QVZWbkdDU2g4MDVsekVmdWE3MTk5STVPODFMMENtUW9nbjZzQ1VEcEI0UDM4?=
 =?utf-8?B?YjRZSXd1V05jN0kzakpPS3pPNWxuRjJndHY1a2pHaDlOcVJtZGVUYzc3Tk55?=
 =?utf-8?B?a3RiSXkyeFhXSFdPSVU1R3o2ZjR3Mk1uTXNwU1lRay8wcjREZDllY2lLV0Jt?=
 =?utf-8?B?T0V1OWlva0YzcjkrQXJwNWdXbmFUZE5QcDF4K0s2SDJ3MFZROExHR0pRaTBW?=
 =?utf-8?B?KzdPTUpiR3NtNllubng2WThMeDMyMkNQVHlMTUt0cmRhczVPQiswQUg3Vlpv?=
 =?utf-8?B?L3lVN0ZleVRTa0xoTXNBT2luQTZ3b0Yzc2RreThjb2RjUjF0U2dVejZ0N3Fj?=
 =?utf-8?B?emNOYXhlTk1Sb3V4Y2JPRWswNlFhK1BXSDk3YUJhK1Z4UEVqdTBtSitjWnht?=
 =?utf-8?B?RUwzeHM4TTUwYmtJbjJnM1V1anRyNkdDZXVFMUg1RTRoNFliTEVoRGIxemp0?=
 =?utf-8?B?WlZrWlJWK3RBQkkzNVIwUWV6bHZic3FXT3ZJcWJObVFmcGcvanZNejQ1cXhJ?=
 =?utf-8?B?WTVQY3ZrQlNvbC81dHo1bjg5TGdzTEdkTnVhWG9lUHk3MmlBZ1dpd1lqVUVy?=
 =?utf-8?B?L05CVTFoOEJ6Njd3NE1PeG8zMFg1VU5GaHdDamRCUDRFRGs1OFEvMDVibFpo?=
 =?utf-8?B?d09SQWxvK0dNbjFjZmdBdE5WSEQyYTZrK0VmNEgzU1UrYXppR2JvcDE3SHh1?=
 =?utf-8?B?cjZzaG1ORXZ6NzM1eVJ0SzIwMUVDS3pQTFVKYlV1S2ZZc003MU1qcW9jMmZX?=
 =?utf-8?B?K2FTdXdYY1E3dHVGSlN5ZnRvOXl5TlhHbEZnQittVHF3aEFQelJMekFsRFZh?=
 =?utf-8?B?eU56WWxpcGxJemRyT0NWNHBlRUdQZHJJeHFOQXBXdWpXLzZxYXRLL01oazZ6?=
 =?utf-8?B?ZUhkdS9YaDh3NThmM1ZJVzJKcndQKzYvaEtBdExlV1lXanBEV1krd1JZYUlp?=
 =?utf-8?B?M1dXUXYxd01VRlQzQkpVbTQ1THNZVFVpTWM2eTBZWkY0engzOE9aMzZLNXo5?=
 =?utf-8?B?dzRYcGxMNnZvNXNoSlNURTZDNnh0eEFOS1YvMHlGK3U5cG5uU0lOTzgxblRZ?=
 =?utf-8?B?ZUUvWDB0amtreWZpdDFrOUNMWDBqWVNiQ3ZTMXJ3NGlhb01NRnlsMnBmaUF4?=
 =?utf-8?B?Wi9MOE1EVWQ3OEZmcnZueTkvdEdZZFRJeXRuS2xNNmlnenBBdXZhSEhDMVZp?=
 =?utf-8?B?dkN5THI0bmMwcTZIR2FYWXIrY0F2RGRtUFBZeTErR2ZHNFBLL0craGkwblJB?=
 =?utf-8?B?WjhWSVNiOU82RGNEVVBNUFVWdlFFSk1wOEZ5UW1QcGY3S3F6UDJjV1VwM3B0?=
 =?utf-8?B?WmhpSFJ6OVNxWURZQjVXTk9sSnowMTBFTHpDYm96MmREdDI4dHowcnRMcmRp?=
 =?utf-8?B?UU16REhNWC9oMGdOSmE4a0ZkT05WSXEvUVdxV3NjTEZLdlE1SnBWNWw2ODE4?=
 =?utf-8?B?bXhMZ3ZoMWtWT0g2SU45WDRpb2hsc3JiY1dtZVBoYmFpYm1GcnNtekNhdjh1?=
 =?utf-8?B?dWZnTjJzZlRMQ3RETFFOZ0RmRk1tR1lVcittdENXMUltNWpDVmltbW1ubkxP?=
 =?utf-8?B?SndsQmJRb245UVphZTRxMUFHMmV5WktMcGhpaVRDT0N5amJSK2RKS3FKKzlq?=
 =?utf-8?B?SWR0b1ZEdkN2bmNCNlV4NEhOcWlRc1RwOGxNbG1hLys4OEFyTmlmYnVJWXc3?=
 =?utf-8?B?WFZtUllzNDBrdFBReXlFZ3YyaE1KVmwrMUIvdlJIZDdHRnpva2paOURxSEJ6?=
 =?utf-8?B?Q3gxMU0za2JXZjBkenl2UnVPb2dtN21LSWF5REJsVUlXcVdDQVZzdHl2L0pZ?=
 =?utf-8?B?dDhnT3JNTGF6MnRmN2pnNnN4UC9PMVJTL2o4V1N6NzBBdFhCbm1rNG41MTRH?=
 =?utf-8?B?Yk9JMG9SNTRsWVZqRkR6dnM5Tlh6UkVTVTJDRUJ5eWlXdzR5UDk1c3VmSEpr?=
 =?utf-8?B?MitIdVQvS2JIMnQ0d2VwUE1YRXN2M1ZBMXRTMlJOYTc3T09Hb0E5OUZLMHFx?=
 =?utf-8?B?NjNiSFJXL0hDWTlFTzNkQ0l1NW56c2lwdEpZeFdMaTJtcFJUWnd4Ly9rOTQz?=
 =?utf-8?Q?bkxu5C9qwjr+3BQcFqZmCx9ps?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 286739b0-208a-43a4-1664-08dc656d27b9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 21:17:47.4471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xHNkzpkgiUAv6z0wMlGzlXbpSRNoPDrgpLHvzD2zu2Ijx3HyffqGq1RTb+FnGn8B9y9Qwb5B1Ov5e+7WasPYnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7160
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

--------------60IrPbbT2wYjYCLVXeerMfTy
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 4/25/2024 9:15 PM, Michal Wajdeczko wrote:
>
> On 25.04.2024 19:46, Matthew Brost wrote:
>> On Thu, Apr 25, 2024 at 02:18:56PM +0200, Nirmoy Das wrote:
>>> Add engine name to the engine reset and cat error log
>>> which should be useful while debugging.
>>>
>>> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_guc_submit.c | 5 +++--
>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> index c7d38469fb46..245e29d095c0 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> @@ -1655,7 +1655,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>>   	if (unlikely(!q))
>>>   		return -EPROTO;
>>>   
>>> -	drm_info(&xe->drm, "Engine reset: guc_id=%d", guc_id);
>>> +	drm_info(&xe->drm, "Engine reset: name=%s, guc_id=%d", q->hwe->name, guc_id);
>> I don't think q->hwe->name name is useful as it might not actually be
>> exec queue is running. I'd drop that, and replace with string indicating
>> the hardware engine class.
> and maybe it's also a good time to switch into GT-oriented logs:
>
> -	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_gt *gt = guc_to_gt(guc);
>
> 	xe_gt_info(gt, "Engine reset....

Yes, gt log will throw more useful info. I will switch to 
xe_gt_info/xe_gt_dbg.

Thanks,

Nirmoy

>
>>>   
>>>   	/* FIXME: Do error capture, most likely async */
>>>   
>>> @@ -1690,7 +1690,8 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>>>   	if (unlikely(!q))
>>>   		return -EPROTO;
>>>   
>>> -	drm_dbg(&xe->drm, "Engine memory cat error: guc_id=%d", guc_id);
>>> +	drm_dbg(&xe->drm, "Engine memory cat error: name=%s, guc_id=%d",
>>> +		q->hwe->name, guc_id);
>> Same here.
>>
>> Matt
>>
>>>   	trace_xe_exec_queue_memory_cat_error(q);
>>>   
>>>   	/* Treat the same as engine reset */
>>> -- 
>>> 2.42.0
>>>
--------------60IrPbbT2wYjYCLVXeerMfTy
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Michal,<br>
    </p>
    <div class="moz-cite-prefix">On 4/25/2024 9:15 PM, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:63adbb9b-ee0e-4a60-866f-135ee59f97dd@intel.com">
      <pre class="moz-quote-pre" wrap="">

On 25.04.2024 19:46, Matthew Brost wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Thu, Apr 25, 2024 at 02:18:56PM +0200, Nirmoy Das wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Add engine name to the engine reset and cat error log
which should be useful while debugging.

Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index c7d38469fb46..245e29d095c0 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1655,7 +1655,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	if (unlikely(!q))
 		return -EPROTO;
 
-	drm_info(&amp;xe-&gt;drm, &quot;Engine reset: guc_id=%d&quot;, guc_id);
+	drm_info(&amp;xe-&gt;drm, &quot;Engine reset: name=%s, guc_id=%d&quot;, q-&gt;hwe-&gt;name, guc_id);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I don't think q-&gt;hwe-&gt;name name is useful as it might not actually be
exec queue is running. I'd drop that, and replace with string indicating
the hardware engine class. 
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
and maybe it's also a good time to switch into GT-oriented logs:

-	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_gt *gt = guc_to_gt(guc);

	xe_gt_info(gt, &quot;Engine reset....</pre>
    </blockquote>
    <p>Yes, gt log will throw more useful info. I will switch to <span style="white-space: pre-wrap">xe_gt_info/</span><span style="white-space: pre-wrap">xe_gt_dbg.</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">Thanks,</span></p>
    <p><span style="white-space: pre-wrap">Nirmoy
</span></p>
    <blockquote type="cite" cite="mid:63adbb9b-ee0e-4a60-866f-135ee59f97dd@intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap=""> 
 	/* FIXME: Do error capture, most likely async */
 
@@ -1690,7 +1690,8 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 	if (unlikely(!q))
 		return -EPROTO;
 
-	drm_dbg(&amp;xe-&gt;drm, &quot;Engine memory cat error: guc_id=%d&quot;, guc_id);
+	drm_dbg(&amp;xe-&gt;drm, &quot;Engine memory cat error: name=%s, guc_id=%d&quot;,
+		q-&gt;hwe-&gt;name, guc_id);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Same here.

Matt

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap=""> 	trace_xe_exec_queue_memory_cat_error(q);
 
 	/* Treat the same as engine reset */
-- 
2.42.0

</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------60IrPbbT2wYjYCLVXeerMfTy--
