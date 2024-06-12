Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41502C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 21:56:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AEE882AF;
	Wed, 12 Jun 2024 21:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NcFbA5Z+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9482A10E921
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 21:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718229413; x=1749765413;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gOqM8lt1VvErIshCiMPZE1SG5fRLDGa96oIajVhez6I=;
 b=NcFbA5Z+8wK3lCTiL/7SD6ESEnNP7oFHcFlr+0xe0JKfjXrC4/GIvAnK
 zaFSdYYNmHUuipGT7Hj3QwnU14jrgkllWVz9xA3fwfVroYxAOGyzdXIgf
 sw4a/PDOo8FOSyic4Uk9dpLoR8CAdMDJljPTX+e8zxZg+j/Oge6urRIoB
 rqwYfRuvhhS3ajeVWmNV11fMOgd5p3ylsry+EbfyCf2I5nbAm+yjNsnqr
 mnsGWbLjPoRzBoWQD6A2mJiIWVHpuZp5FeCvfnKErQOoz+lU7r4JrbqZ8
 ufu9L1QEqRFTGoQBiXAe2OAHBsq3FfW3k2awOXwf43BrKUlxZB2IrUgE+ w==;
X-CSE-ConnectionGUID: r24X41gARNiZRU8ot4zirQ==
X-CSE-MsgGUID: R3/nGnYdQVGpPKhzesLyqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15248169"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="15248169"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 14:56:50 -0700
X-CSE-ConnectionGUID: TEYpqty6SmW5xSE+reuedg==
X-CSE-MsgGUID: L73etm6cR66+mMxrREFgog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40556734"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 14:56:51 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 14:56:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 14:56:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 14:56:49 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 14:56:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i3BaIjoQZ/wJt0mC5DaQOliugTKIOrnpRXWgiPlCS4V3cCqiFoQCoX/8igK299Oan1H1ZsQ3G3GpQmBGrjzqnHS2oy670dPJUl9FpYg1etV4muHtIpRNbH2mA6aB0JCxJCdBwGP8pa+RREw1T8sUXjdj8vUBwKjwQa99OMuz0+vutNmmvdmt+YY6FlAbRFWfU9hYMphPffnV941TsehDjPSF9ZjbY2CNcMy0cLdvyy9ZqCCvttOgziNoR9kjsHvaYBarNLb2nkUfRWw23so0Jp5+2olQMl1KveitqjAoxLRbIiZLva+zuD7NBj3/cnNo4liP6gVTobkQ3MxLmaX8xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TiOpiBCE4iji/vE7LAbEjWmllVuGnqmFDoZ22kv8sIo=;
 b=CYcptNuN6AhunuliJjS1OONxZ7ok9C4pocsqHr0WP2MoUbMa2yYxE0ett7LlRD2W3KTrLxFUjUNNhG5drVeemKtUZSUL8QKoU29alRveRQBOP2rs7/ecFaMrM1nvTIE2lraT4fmVVuoTpsx/ERcR0ehXMA7ucTX8DPWVdJGyfP/uaPCnF+gsYt+BC4rz0Hw0WTQlzrcZN12ZunQO/n0DPCv35QGmCluFkiqkczRLTVR5USSU4r49bXdR52SOskY044+m1O9tMg7jWpOhpaXzHhAsKduXwiwAxZ2A0Rv9PBuwPyHUKYZGZtqc30rzTMBsWvakWgalJ1KfZ53PF5KJ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH8PR11MB6659.namprd11.prod.outlook.com (2603:10b6:510:1c2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20; Wed, 12 Jun
 2024 21:56:44 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 21:56:44 +0000
Message-ID: <96d30c2b-76b6-4086-aaad-77190c4af586@intel.com>
Date: Wed, 12 Jun 2024 14:56:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/11] drm/xe: Sample ctx timestamp to determine if
 jobs have timed out
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240611144053.2805091-1-matthew.brost@intel.com>
 <20240611144053.2805091-12-matthew.brost@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240611144053.2805091-12-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0322.namprd03.prod.outlook.com
 (2603:10b6:303:dd::27) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH8PR11MB6659:EE_
X-MS-Office365-Filtering-Correlation-Id: b3b1303e-2895-4fad-b2bf-08dc8b2a8ca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230034|376008|1800799018|366010;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0MwaHVBcTlwRmh6ZWtjVG9nLzFEUk1aQkxybmZjbkJxdzNqOVMvell0cGxo?=
 =?utf-8?B?ZkhSVlFveDh4TXhyYmVJMEg4UEdaLzdGTmZSdlFKSHJBUE5zTTh1bGhtSUdP?=
 =?utf-8?B?WXIrZW1HaDJGdlJpb3laVFlRQzVQMFIyVnpHSFZ6VFBZdDlKSUxVM3dMeVNl?=
 =?utf-8?B?RjgxMndhemhYVFRwd3JnL21mUGRMNUhQNVZCNWtPc3JVbzM4a1lVdldIMnpy?=
 =?utf-8?B?cFQvT29HdWRnWHQ1RmhxbEhyTlIrdXBKUWxHOHJHc1dDQUdHbU4zcHpXTzNU?=
 =?utf-8?B?MmdtcjJPcmtTcXZ2UmhHTy9NakdTQWpLRy9Hd1lhNnVBd05WRS9BTlVaems0?=
 =?utf-8?B?NVJVdnJtMUgxNDZJS09ZcG91RUs5YXptcHdTdjAwb1l6emVMTm5STk9yM1R4?=
 =?utf-8?B?aGYrTitWREZrYkxBenhNT3FpUm5lZmh6S3owYWVjTzlieGdIZHQrS0lka3J5?=
 =?utf-8?B?YVhhNVlwOFZjMW03V1NiUkZWN25BTGdPc2tzMDhXVVZ4c0diSnV5Rk5NNFdR?=
 =?utf-8?B?dFpWeTM0aEhpaytjTkJjaWdSSDRmenpYaWoxS3ZMT0tMRjg5Rks1WG84TVpy?=
 =?utf-8?B?ZUR6Smp5S0tSQWdaNnB6cUg5VDVTcit1UzZHbFkyeXRZWkpvL2FhbzFOaC9C?=
 =?utf-8?B?OGZQWitYN1BPTlR6ZXJ6ZzZQc2luRlJQMXJhVmxWUnQzSjcvY2o5UXo0TzJS?=
 =?utf-8?B?UEUyRTI5YUEzZXVDN09QUmZZYXJhWWR2dkVwOHRZeGVWSDZ3cWljaHRUalph?=
 =?utf-8?B?anlXcno1M2VZdmN6eFJ0cy84VDlQNGlzNTFOQ2hudTZQdXFBOGpOVGNtT0Nh?=
 =?utf-8?B?amgrYXJRU1lFQmJTSElTSXpJT2NCV3E3TTR1a3llelFQZDFDTWZ4alBpK3M5?=
 =?utf-8?B?bUkrYWJlcDh1cUw0bVE1RjB6OENYV3BFdC9GbFRyanA4TmxMdytHTGxLd1dR?=
 =?utf-8?B?c291K3lBZTVnazZzeGRpOEZzOFRjaFU3aUhiU3ZlMUdpdTZGT2FiOE9rOXRM?=
 =?utf-8?B?MGhTUEVrd1JGcStGSm8xblRRTllwQzdpb216dXc4dUsyc2ROaGpBRG1xc3hr?=
 =?utf-8?B?UU42Zm00SzZGRWFidWZzSVhKQXNGOWw0ZWtVaTdHLzY1aURWU0R4NGVWQW5u?=
 =?utf-8?B?ZE44TWZrOUVmKzNiVG9tU3pyN1VpLzBKczlBSktDZVEyZnB3TVdhS2VNRjN6?=
 =?utf-8?B?KzN0THdWNlZqbkFYdlhmZnBVU3pzT3BrRk5ha1JKM2pPNFR2aHJXYzZ3Mmda?=
 =?utf-8?B?YWtwamJzS3Z3aHVuMjhETGp3R2x0SmFjRnN2dVZCK1ltbHhadFhsNHBtMWMz?=
 =?utf-8?B?QjNxaDNLRFdua2pqcFlUNUtqRGkxMDYrL3o4UkRnMU13M1lBTncwVGZaS2Fn?=
 =?utf-8?B?RFJnSmpLa1I4SWNRY0l2d3gxbXRiTWdaZDhhRkhvdkhUTFNGZmRwWENlRG8v?=
 =?utf-8?B?WWZCM0tLa0QzVXFQMXk1UEtsN0tUUDE5NEQ1bkpINHc3Z084Q1RHTXZUNjQ2?=
 =?utf-8?B?NjBxOTJLLzZkeWMyNHB4Z1IzdCtJbzU5KzN4dTVSWDg5dEQxWE5zUmVCOXE0?=
 =?utf-8?B?TTlsMnUzeXlMTlZoVGtEa2tieXBlQTBiNlUybHBhMFhIZXdEOXNqVSsvWUxK?=
 =?utf-8?B?OVdROVNCK1hMeklJTEFhU3ZtelRzRWJKWjRaZWhKUTBTVTAwSXJQZmlUdVJa?=
 =?utf-8?B?bTlaamh4ZDRaUUxpRHFRWUFkVjVnOW1ZNXIrZkNUeGFxNWkyWk8vMFpkUS8v?=
 =?utf-8?Q?y4NnzQrelKwWoR1I/sGzfSvenM0yKM9gLj1BH6J?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230034)(376008)(1800799018)(366010); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHowUTRGRkV0V3M0TFRLWUMvR2VwK2hUYithZnhHVU5jVS9qZXVPb1gxQlFN?=
 =?utf-8?B?N2tKbVlpS2JBZ3E2czFxRXdmYWFpOVBMMFFoMGdaTTV2bmt6SjJwdEJZMEYy?=
 =?utf-8?B?UldUZzhJTGFqTUFWSE1aRVZyTC9xK1dDck1KaXc4d2hLT1B5MURJKzBQOCtO?=
 =?utf-8?B?VnQxaWNHWXBjdFV2eU9GUVpLdVJ6OXJjNVVVaVc2UnlCT3hkTDQ1S3ZRRmlT?=
 =?utf-8?B?alg2WWJPV3ZFUEYrTjRqODZQNGgyamFiWTJabDlVdENidS9iR2tHdlllMnJv?=
 =?utf-8?B?Q2dmZlJlelhsT3RUZmxoYXZNdFdzYitBNXgvR1ArcUdkUXhVRVBJbWpFeTZX?=
 =?utf-8?B?ZTE3NmtNcEp0NkZpdnFHY05maElZV0MzMTZRQk0wU3BCTndIYnJNbWZXeHZ0?=
 =?utf-8?B?dWR5cXh4eEVCeHAwRWNTcHZzTU1aSStSUXR4dnZpZnFMN3BXbFMxNXkxOHlI?=
 =?utf-8?B?SkcrM1pMWFNLdWNDS3NlQnVqZWIzNkhqcmZKYXVVNEFWRUNXK3p6dmtiUDJz?=
 =?utf-8?B?UTdBNnVJc2w2MUsxYi84NFdUYUtzejd5cnkvamNzS3o3VktrUUI4M3NHOVh6?=
 =?utf-8?B?YVN3eUFNYk9kMldqQTgvWDJRbWhvMTNZR1M3cEhyTWFJRmJqVjErQ2RicmpS?=
 =?utf-8?B?a3Q5aDM4dVdIZzh6Tzk2VVBkWmVmUHRhb2FXRWZXM2xvTVR3UXZOQ0pQMHN4?=
 =?utf-8?B?WXkrSlBXR2V0R1BxSTk5MEpDRWZVM05adDk5S2k5cVJyam40UFpIZ015Q0RK?=
 =?utf-8?B?cUp2SXlYRmhRSUVBRnJ4ZXBjMFhLWXJITmQzTVRqWElCMTZFRUxuNGNvbEU4?=
 =?utf-8?B?NVNEcGpNQUY1cHlwZC8raWlCemljU0ZwdzFTZ04zVkhadXNoREpCK1VweW93?=
 =?utf-8?B?dk93bm1iMnNPeGgxajRJekloakxrWVFsVWdYWTRDNnpUazlEa2dyM0NQVmpu?=
 =?utf-8?B?RFpsbkJFVTR2U01vOFIzMnFNQnpYNUdORU5qMzdkOXZvQ2RxSDBEay9HTFI3?=
 =?utf-8?B?a0xiK2gwcisyOFJWaHNCeGVDMlZldzNqcjlRNy8xdDdlZkdMTWhGWW1hTHdW?=
 =?utf-8?B?VGlncnZGUWtBZGxTRUk1MkpmOHo1M1NMbGxCSzlZdHJBVDE1Q3lGSmR5bnNW?=
 =?utf-8?B?RXZrMEFnbFQ1bDIyT1FZdzlXT284K3N1eGdvdFUzSDJqMEFuU2Y0ZlNuVW1G?=
 =?utf-8?B?WUQ1YS9zWUFBeVpxdmJnWU80N2kxZlBIZGFocmV0MTVGN2xrWXVPaU9hcEFs?=
 =?utf-8?B?ZEdEVE1qQ1ZCd1oyM1lUazMwREFrT1JXc1VxNWc4MGNsb1NhQVVjMExhREMx?=
 =?utf-8?B?SkFUWWxwWDFsNCtBbit4UFZUbGhnc2ROSnNDakMvVWNXTTBXa243bXBoWmMw?=
 =?utf-8?B?MS9pWEphd28venV3V1FjaTFiM3M5aHhSd04vT05NZllmaXNnanRaaDRmL2Fw?=
 =?utf-8?B?U3VZWTJ2eHhCcklqa2NSWk5iQTJmbk5tOTZJRmh2WGJOS3loV040Y2piby90?=
 =?utf-8?B?b0p0Z1VQQnVoUFo3blkyQUg4dzdSUmgvSU15Skptc0w1QzQ0dDV5N3hTNGQ4?=
 =?utf-8?B?R3EreVRkN213UWdrMHU4TWY5V01XQTFTSE1OREZLNWtabU5YeDRGNUtYY3lK?=
 =?utf-8?B?a3FDd0VUejhQc0RoRUpBd0NRWC9PTy9ESW5xZWpyS0MxTzVxb2RCbjZVOXdi?=
 =?utf-8?B?ckd0YVVjTkV2SytuS0FpekRHYktaN1pML1Bna0cvMTdpVmdjYS83SWtGdEtK?=
 =?utf-8?B?enMvSW41dlczQU95MW5adUdRenlEYkxNT1VXeWhOandaTE9vQzhpamR3aCsw?=
 =?utf-8?B?dDNWNzQ5ZExYaEYwTWg1c2oxYzc2SEFGUmpEOEF2MVpycjV6ekN6Zk01aXUy?=
 =?utf-8?B?c1RLRXlUcGJ3L042cVFMMjdsTVZwcWVXYTN2cE1jR3NDZk0vN1pDTUZHOWps?=
 =?utf-8?B?R3NhR0NwUEN6aDZNcTEwVzdrdVVoaG5kV2RTK3I0TitIV3U2QnFMVmszV2ls?=
 =?utf-8?B?Y1BOc2ZoeU1GVFdYOFlncEdyMERKTFAxWGo1ZmtCNDVyS3lYREFlVWw5QUJq?=
 =?utf-8?B?SWZ1SVBLNU1xN2ovNFJNNXE5TU1SY2dveTVqb2xTbGprekFGam1GUHJySzll?=
 =?utf-8?B?SDQ4UGxqRGt1YmRTU2R3azkzaDd0c1NJOCtvWDlIYXNXWkZqRkdBOVBjNjJu?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b1303e-2895-4fad-b2bf-08dc8b2a8ca5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 21:56:44.5570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sY8ytcNsWUcRLvbcFoZ3o+SiqOzV0NavdwYUtNEuon2LzmsvwR1WUkNokG526ceccb1EBtwpAUb4oAJ9slTEYVJEK2XSf8BW3P5EuIoxVkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6659
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

On 6/11/2024 07:40, Matthew Brost wrote:
> In GuC TDR sample ctx timestamp to determine if jobs have timed out. The
> scheduling enable needs to be toggled to properly sample the timestamp.
> If a job has not been running for longer than the timeout period,
> re-enable scheduling and restart the TDR.
>
> v2:
>   - Use GT clock to msec helper (Umesh, off list)
>   - s/ctx_timestamp_job/ctx_job_timestamp
> v3:
>   - Fix state machine for TDR, mainly decouple sched disable and
>     deregister (testing)
>   - Rebase (CI)
> v4:
>   - Fix checkpatch && newline issue (CI)
>   - Do not deregister on wedged or unregistered (CI)
>   - Fix refcounting bugs (CI)
>   - Move devcoredump above VM / kernel job check (John H)
>   - Add comment for check_timeout state usage (John H)
>   - Assert pending disable not inflight when enabling scheduling (John H)
>   - Use enable_scheduling in other scheduling enable code (John H)
>   - Add comments on a few steps in TDR (John H)
>   - Add assert for timestamp overflow protection (John H)
> v6:
>   - Use mul_u64_u32_div (CI, checkpath)
>   - Change check time to dbg level (Paulo)
>   - Add immediate mode to sched disable (inspection)
>   - Use xe_gt_* messages (John H)
>   - Fix typo in comment (John H)
>   - Check timeout before clearing pending disable (Paulo)
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 303 +++++++++++++++++++++++------
>   1 file changed, 242 insertions(+), 61 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 671c72caf0ff..cddb391888b6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -10,6 +10,7 @@
>   #include <linux/circ_buf.h>
>   #include <linux/delay.h>
>   #include <linux/dma-fence-array.h>
> +#include <linux/math64.h>
>   
>   #include <drm/drm_managed.h>
>   
> @@ -23,6 +24,7 @@
>   #include "xe_force_wake.h"
>   #include "xe_gpu_scheduler.h"
>   #include "xe_gt.h"
> +#include "xe_gt_clock.h"
>   #include "xe_gt_printk.h"
>   #include "xe_guc.h"
>   #include "xe_guc_ct.h"
> @@ -62,6 +64,8 @@ exec_queue_to_guc(struct xe_exec_queue *q)
>   #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
>   #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
>   #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
> +#define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
> +#define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
>   
>   static bool exec_queue_registered(struct xe_exec_queue *q)
>   {
> @@ -188,6 +192,31 @@ static void set_exec_queue_wedged(struct xe_exec_queue *q)
>   	atomic_or(EXEC_QUEUE_STATE_WEDGED, &q->guc->state);
>   }
>   
> +static bool exec_queue_check_timeout(struct xe_exec_queue *q)
> +{
> +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_CHECK_TIMEOUT;
> +}
> +
> +static void set_exec_queue_check_timeout(struct xe_exec_queue *q)
> +{
> +	atomic_or(EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> +}
> +
> +static void clear_exec_queue_check_timeout(struct xe_exec_queue *q)
> +{
> +	atomic_and(~EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> +}
> +
> +static bool exec_queue_extra_ref(struct xe_exec_queue *q)
> +{
> +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_EXTRA_REF;
> +}
> +
> +static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
> +{
> +	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
> +}
> +
>   static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
>   {
>   	return (atomic_read(&q->guc->state) &
> @@ -920,6 +949,109 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>   	xe_sched_submission_start(sched);
>   }
>   
> +#define ADJUST_FIVE_PERCENT(__t)	mul_u64_u32_div((__t), 105, 100)
> +
> +static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> +{
> +	struct xe_gt *gt = guc_to_gt(exec_queue_to_guc(q));
> +	u32 ctx_timestamp = xe_lrc_ctx_timestamp(q->lrc[0]);
> +	u32 ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
> +	u32 timeout_ms = q->sched_props.job_timeout_ms;
> +	u32 diff;
> +	u64 running_time_ms;
> +
> +	/*
> +	 * Counter wraps at ~223s at the usual 19.2MHz, be paranoid catch
> +	 * possible overflows with a high timeout.
> +	 */
> +	xe_gt_assert(gt, timeout_ms < 100 * MSEC_PER_SEC);
> +
> +	if (ctx_timestamp < ctx_job_timestamp)
> +		diff = ctx_timestamp + U32_MAX - ctx_job_timestamp;
> +	else
> +		diff = ctx_timestamp - ctx_job_timestamp;
> +
> +	/*
> +	 * Ensure timeout is within 5% to account for an GuC scheduling latency
> +	 */
> +	running_time_ms =
> +		ADJUST_FIVE_PERCENT(xe_gt_clock_interval_to_ms(gt, diff));
> +
> +	xe_gt_dbg(gt,
> +		  "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, running_time_ms=%llu, timeout_ms=%u, diff=0x%08x",
> +		  xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> +		  q->guc->id, running_time_ms, timeout_ms, diff);
> +
> +	return running_time_ms >= timeout_ms;
> +}
> +
> +static void enable_scheduling(struct xe_exec_queue *q)
> +{
> +	MAKE_SCHED_CONTEXT_ACTION(q, ENABLE);
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +	int ret;
> +
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
> +
> +	set_exec_queue_pending_enable(q);
> +	set_exec_queue_enabled(q);
> +	trace_xe_exec_queue_scheduling_enable(q);
> +
> +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> +
> +	ret = wait_event_timeout(guc->ct.wq,
> +				 !exec_queue_pending_enable(q) ||
> +				 guc_read_stopped(guc), HZ * 5);
> +	if (!ret || guc_read_stopped(guc)) {
> +		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
> +		set_exec_queue_banned(q);
> +		xe_gt_reset_async(q->gt);
> +		xe_sched_tdr_queue_imm(&q->guc->sched);
> +	}
> +}
> +
> +static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
> +{
> +	MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> +
> +	if (immediate)
> +		set_min_preemption_timeout(guc, q);
> +	clear_exec_queue_enabled(q);
> +	set_exec_queue_pending_disable(q);
> +	trace_xe_exec_queue_scheduling_disable(q);
> +
> +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> +}
> +
> +static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
> +{
> +	u32 action[] = {
> +		XE_GUC_ACTION_DEREGISTER_CONTEXT,
> +		q->guc->id,
> +	};
> +
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> +
> +	set_exec_queue_destroyed(q);
> +	trace_xe_exec_queue_deregister(q);
> +
> +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
> +}
> +
>   static enum drm_gpu_sched_stat
>   guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   {
> @@ -927,10 +1059,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	struct xe_sched_job *tmp_job;
>   	struct xe_exec_queue *q = job->q;
>   	struct xe_gpu_scheduler *sched = &q->guc->sched;
> -	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
> +	struct xe_guc *guc = exec_queue_to_guc(q);
>   	int err = -ETIME;
>   	int i = 0;
> -	bool wedged;
> +	bool wedged, skip_timeout_check;
>   
>   	/*
>   	 * TDR has fired before free job worker. Common if exec queue
> @@ -942,49 +1074,53 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   		return DRM_GPU_SCHED_STAT_NOMINAL;
>   	}
>   
> -	drm_notice(&xe->drm, "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
> -		   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> -		   q->guc->id, q->flags);
> -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> -		   "Kernel-submitted job timed out\n");
> -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> -		   "VM job timed out on non-killed execqueue\n");
> -
> -	if (!exec_queue_killed(q))
> -		xe_devcoredump(job);
> -
> -	trace_xe_sched_job_timedout(job);
> -
> -	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
> -
>   	/* Kill the run_job entry point */
>   	xe_sched_submission_stop(sched);
>   
> +	/* Must check all state after stopping scheduler */
> +	skip_timeout_check = exec_queue_reset(q) ||
> +		exec_queue_killed_or_banned_or_wedged(q) ||
> +		exec_queue_destroyed(q);
> +
> +	/* Job hasn't started, can't be timed out */
> +	if (!skip_timeout_check && !xe_sched_job_started(job))
> +		goto rearm;
> +
>   	/*
> -	 * Kernel jobs should never fail, nor should VM jobs if they do
> -	 * somethings has gone wrong and the GT needs a reset
> +	 * XXX: Sampling timeout doesn't work in wedged mode as we have to
> +	 * modify scheduling state to read timestamp. We could read the
> +	 * timestamp from a register to accumulate current running time but this
> +	 * doesn't work for SRIOV. For now assuming timeouts in wedged mode are
> +	 * genuine timeouts.
>   	 */
> -	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> -			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> -		if (!xe_sched_invalidate_job(job, 2)) {
> -			xe_sched_add_pending_job(sched, job);
> -			xe_sched_submission_start(sched);
> -			xe_gt_reset_async(q->gt);
> -			goto out;
> -		}
> -	}
> +	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>   
> -	/* Engine state now stable, disable scheduling if needed */
> +	/* Engine state now stable, disable scheduling to check timestamp */
>   	if (!wedged && exec_queue_registered(q)) {
> -		struct xe_guc *guc = exec_queue_to_guc(q);
>   		int ret;
>   
>   		if (exec_queue_reset(q))
>   			err = -EIO;
> -		set_exec_queue_banned(q);
> +
>   		if (!exec_queue_destroyed(q)) {
> -			xe_exec_queue_get(q);
> -			disable_scheduling_deregister(guc, q);
> +			/*
> +			 * Wait for any pending G2H to flush out before
> +			 * modifying state
> +			 */
> +			ret = wait_event_timeout(guc->ct.wq,
> +						 !exec_queue_pending_enable(q) ||
> +						 guc_read_stopped(guc), HZ * 5);
> +			if (!ret || guc_read_stopped(guc))
> +				goto trigger_reset;
> +
> +			/*
> +			 * Flag communicates to G2H handler that schedule
> +			 * disable originated from a timeout check. The G2H then
> +			 * avoid triggering cleanup or deregistering the exec
> +			 * queue.
> +			 */
> +			set_exec_queue_check_timeout(q);
> +			disable_scheduling(q, skip_timeout_check);
>   		}
>   
>   		/*
> @@ -1000,15 +1136,60 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   					 !exec_queue_pending_disable(q) ||
>   					 guc_read_stopped(guc), HZ * 5);
>   		if (!ret || guc_read_stopped(guc)) {
> -			drm_warn(&xe->drm, "Schedule disable failed to respond");
> -			xe_sched_add_pending_job(sched, job);
> -			xe_sched_submission_start(sched);
> +trigger_reset:
> +			xe_gt_warn(guc_to_gt(guc), "Schedule disable failed to respond");
Not a problem introduced in this patch set so maybe not necessary to fix 
here either. But we have seen what look like false hits on this warning 
in some of the reset tests. The code gets here if the schedule disable 
genuinely times out which is what the warning is saying. But it also 
gets here if guc_read_stopped() is true and that happens if a reset 
occurs asynchronously to this timeout check. In that situation, there is 
no need to fire a warning - the abort is intentional and expected. It is 
also not necessary to queue up another reset just below. It seems like 
the warning and the reset should be inside a further 'if(!ret)' check.

> +			set_exec_queue_extra_ref(q);
> +			xe_exec_queue_get(q);	/* GT reset owns this */
> +			set_exec_queue_banned(q);
>   			xe_gt_reset_async(q->gt);
>   			xe_sched_tdr_queue_imm(sched);
> -			goto out;
> +			goto rearm;
> +		}
> +	}
> +
> +	/*
> +	 * Check if job is actually timed out, if so restart job execution and TDR
> +	 */
> +	if (!wedged && !skip_timeout_check && !check_timeout(q, job) &&
> +	    !exec_queue_reset(q) && exec_queue_registered(q)) {
> +		clear_exec_queue_check_timeout(q);
> +		goto sched_enable;
> +	}
> +
> +	xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
> +		     xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> +		     q->guc->id, q->flags);
> +	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> +		   "Kernel-submitted job timed out\n");
> +	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> +		   "VM job timed out on non-killed execqueue\n");
I still think it makes more sense to have these two warnings next to the 
comment that says why these are unexpected errors...

> +
> +	trace_xe_sched_job_timedout(job);
> +
> +	if (!exec_queue_killed(q))
> +		xe_devcoredump(job);
> +
> +	/*
> +	 * Kernel jobs should never fail, nor should VM jobs if they do
> +	 * somethings has gone wrong and the GT needs a reset
> +	 */
... i.e. the warning about kernel jobs and VM jobs not failing should be 
here.

John.

> +	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> +			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> +		if (!xe_sched_invalidate_job(job, 2)) {
> +			clear_exec_queue_check_timeout(q);
> +			xe_gt_reset_async(q->gt);
> +			goto rearm;
>   		}
>   	}
>   
> +	/* Finish cleaning up exec queue via deregister */
> +	set_exec_queue_banned(q);
> +	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
> +		set_exec_queue_extra_ref(q);
> +		xe_exec_queue_get(q);
> +		__deregister_exec_queue(guc, q);
> +	}
> +
>   	/* Stop fence signaling */
>   	xe_hw_fence_irq_stop(q->fence_irq);
>   
> @@ -1030,7 +1211,19 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	/* Start fence signaling */
>   	xe_hw_fence_irq_start(q->fence_irq);
>   
> -out:
> +	return DRM_GPU_SCHED_STAT_NOMINAL;
> +
> +sched_enable:
> +	enable_scheduling(q);
> +rearm:
> +	/*
> +	 * XXX: Ideally want to adjust timeout based on current exection time
> +	 * but there is not currently an easy way to do in DRM scheduler. With
> +	 * some thought, do this in a follow up.
> +	 */
> +	xe_sched_add_pending_job(sched, job);
> +	xe_sched_submission_start(sched);
> +
>   	return DRM_GPU_SCHED_STAT_NOMINAL;
>   }
>   
> @@ -1133,7 +1326,6 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
>   			   guc_read_stopped(guc));
>   
>   		if (!guc_read_stopped(guc)) {
> -			MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
>   			s64 since_resume_ms =
>   				ktime_ms_delta(ktime_get(),
>   					       q->guc->resume_time);
> @@ -1144,12 +1336,7 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
>   				msleep(wait_ms);
>   
>   			set_exec_queue_suspended(q);
> -			clear_exec_queue_enabled(q);
> -			set_exec_queue_pending_disable(q);
> -			trace_xe_exec_queue_scheduling_disable(q);
> -
> -			xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> -				       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> +			disable_scheduling(q, false);
>   		}
>   	} else if (q->guc->suspend_pending) {
>   		set_exec_queue_suspended(q);
> @@ -1160,19 +1347,11 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
>   static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
>   {
>   	struct xe_exec_queue *q = msg->private_data;
> -	struct xe_guc *guc = exec_queue_to_guc(q);
>   
>   	if (guc_exec_queue_allowed_to_change_state(q)) {
> -		MAKE_SCHED_CONTEXT_ACTION(q, ENABLE);
> -
>   		q->guc->resume_time = RESUME_PENDING;
>   		clear_exec_queue_suspended(q);
> -		set_exec_queue_pending_enable(q);
> -		set_exec_queue_enabled(q);
> -		trace_xe_exec_queue_scheduling_enable(q);
> -
> -		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> -			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> +		enable_scheduling(q);
>   	} else {
>   		clear_exec_queue_suspended(q);
>   	}
> @@ -1434,8 +1613,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>   
>   	/* Clean up lost G2H + reset engine state */
>   	if (exec_queue_registered(q)) {
> -		if ((exec_queue_banned(q) && exec_queue_destroyed(q)) ||
> -		    xe_exec_queue_is_lr(q))
> +		if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
>   			xe_exec_queue_put(q);
>   		else if (exec_queue_destroyed(q))
>   			__guc_exec_queue_fini(guc, q);
> @@ -1612,6 +1790,8 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>   		smp_wmb();
>   		wake_up_all(&guc->ct.wq);
>   	} else {
> +		bool check_timeout = exec_queue_check_timeout(q);
> +
>   		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
>   		xe_gt_assert(guc_to_gt(guc), exec_queue_pending_disable(q));
>   
> @@ -1619,11 +1799,12 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>   		if (q->guc->suspend_pending) {
>   			suspend_fence_signal(q);
>   		} else {
> -			if (exec_queue_banned(q)) {
> +			if (exec_queue_banned(q) || check_timeout) {
>   				smp_wmb();
>   				wake_up_all(&guc->ct.wq);
>   			}
> -			deregister_exec_queue(guc, q);
> +			if (!check_timeout)
> +				deregister_exec_queue(guc, q);
>   		}
>   	}
>   }
> @@ -1664,7 +1845,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
>   
>   	clear_exec_queue_registered(q);
>   
> -	if (exec_queue_banned(q) || xe_exec_queue_is_lr(q))
> +	if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
>   		xe_exec_queue_put(q);
>   	else
>   		__guc_exec_queue_fini(guc, q);
> @@ -1728,7 +1909,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   	 * guc_exec_queue_timedout_job.
>   	 */
>   	set_exec_queue_reset(q);
> -	if (!exec_queue_banned(q))
> +	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
>   		xe_guc_exec_queue_trigger_cleanup(q);
>   
>   	return 0;
> @@ -1758,7 +1939,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>   
>   	/* Treat the same as engine reset */
>   	set_exec_queue_reset(q);
> -	if (!exec_queue_banned(q))
> +	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
>   		xe_guc_exec_queue_trigger_cleanup(q);
>   
>   	return 0;

