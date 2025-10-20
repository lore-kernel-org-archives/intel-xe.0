Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2E9CCD193
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 19:22:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D445410E4CA;
	Mon, 20 Oct 2025 19:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D2qimwio";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A468410E4CA
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 19:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760988153; x=1792524153;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Frfi04G7xTIFRBHP2bUD4X2SiCTmK59tL/BCzVYl3HQ=;
 b=D2qimwioUt7ninjDX+bw2CH1DPl/tJtsMEIeXDs8wy22Y1zgrYoVOhu0
 cPNbY/uwuAvLNzOs1i6XiYdKarOfJvY5vvT9/oLWQGPxRrczfSANdEi1Y
 UMBtCLXQWyLFPivusSdVqPrjqzsvwb0e7xBPWsWuPAQ2XRedJaeeNAlZb
 9kxrUv6D97DvyzslGC2KBPNCa+TK0zHCJ4U8v9jPfRYGreF32qdqfWJDc
 SyPgknGNNPJS0mKpJDFRbcpIt6OnyrA3qtOB8A6UNXqom80yFNH5X9QFD
 EviDaSvRQgpVo7aa04iMKuSLgYFWzGq5ahlNeFjkuK0FT9ilvxGDG+OBg g==;
X-CSE-ConnectionGUID: b98dcyHqTV+pq1ubWOg5UQ==
X-CSE-MsgGUID: VWzgSeNWRVKuAq9uQ2aJ5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73715807"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="73715807"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 12:22:32 -0700
X-CSE-ConnectionGUID: R4AfRqjXTla1/ULOusu+Fg==
X-CSE-MsgGUID: QpLW3MhwTMWWXPi6vrgdEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183248242"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 12:22:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 12:22:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 12:22:31 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 12:22:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BctVfLimcuJGozwu0gKjXqpRww+ElKSAtb7X+3dJzW+YO/yCLUsXO/vO/C1y+HHTFb4OP1AZKG3BvhFAznakWBEh2VKURYbHKOW057j2zi/n3hmBvaAmo9Bwi6AqgW88zZPChTtkQgkeyAveAg3bgdkPWR8a6X33LqL4kIZBorMxPNHUaswdd5naYNduLziHbpSnOhMw+jTPNB8Yyd17y6dfPmm67BZ9NrxdNuMzgGB4fZtUM2j1k8L6nOJgxaf0/7Ier3y++6WxgL3KS+ThAs713EiewiZpfAKj/6Ck7XI761cmN+TYg4f07XRvadds+rGszGLUjpNyXpS5YpkYdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0SsapNW7Qd0j3ZOQ6oE/iFtL63lRDwsNLZhYAqg+xs=;
 b=XjxasXeuAQqNy6/MCSyEN9Pu9IHEe7sRhvV8uDK2wicmf0p6sGCkbHj2KvG3cvW5CTrIlELAcGBFeCTpRi+d54RejF4JyYMxGA4KVauno1+b1INQPyCNxNEBwWS2yOpYYbAGKYvXkMnF3BMUGjGXSCPrIpT5IYG6ZQ8BHTwVdb2J9l8aRCEQQIYC9y3C5guAHvcnGSsPp3VhvUl0IQdIupVQEh3KTzgnaGRdEeX6yrkXRA8vz0DOQlSMpwaHlU8otZCJy9cYsUwrliqeWZnYlpPiUL2VOYg/kPMiJz4R6ImWispThDqom/Ld/AjjWtCviQ6X/ZdeNLfQCR5+zzfeWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by SN7PR11MB8065.namprd11.prod.outlook.com (2603:10b6:806:2de::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Mon, 20 Oct
 2025 19:22:28 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 19:22:28 +0000
Message-ID: <62570d09-e03f-4904-88cb-186919655b23@intel.com>
Date: Mon, 20 Oct 2025 21:22:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] drm/xe/vf: Do not disable VF migration on ATS-M
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
References: <20251016120511.856792-1-tomasz.lis@intel.com>
 <20251016120511.856792-6-tomasz.lis@intel.com>
 <0ed38cf2-4b3e-41f2-a1b7-a16533e3896a@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <0ed38cf2-4b3e-41f2-a1b7-a16533e3896a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIYP296CA0012.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::13) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|SN7PR11MB8065:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b8f2a5b-6810-4573-3ec2-08de100e022d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S25oTzFvNEZkNHJwZFF0Mll0K3NvU2tRcC9mWnR5QXBIOGNJSDJ2N0VyZWJT?=
 =?utf-8?B?TWpSaVQ4a2NsWk1HTUdsYjE5dElhVTVqWVhNL2x0cVdSRjdnQmEyeVZvWHFY?=
 =?utf-8?B?OGFXVjhnekttSTE0bEs5dW9HSHJqdEd1dUg0aEpGYUdHOVgvRHJNak5QVkhj?=
 =?utf-8?B?UnVOL1hJUnJiRFc5MU1NVzRvUUJobS8wSkJXNkNSVlRXRFNna1lsVDdMd2lO?=
 =?utf-8?B?TnAwTnhSaVdjTmNydGpRbkpLNWNHTDl2dVJxZFBwcVV2bnoyckdPK2lkRmFi?=
 =?utf-8?B?Vk9Xa21yWGhVTkpwTzNpNStXei81RlI2ZE9MVlpMVTVqWlRHYll2Uk0wQTFN?=
 =?utf-8?B?c2tGcHY1NjdBWU1kZlBoanRRbWdYSWMvaUZNZ1RUMkk0aWFEZWhzQXFWVFZQ?=
 =?utf-8?B?OHUzSXZZWHlnOXAyL1BpdHE1S2Y5WVJmcHF5T0RCWkJSd1JVdkhKblQyMGhx?=
 =?utf-8?B?RXE5T0hYQnVLeGVFMkZFbU1EN1YvTjRTV0hHSzlvOGZFREVVRzRnZG9xS3B3?=
 =?utf-8?B?cXNNNDhSZnNLT2s0RjNrODJvNTdUclJYYi9yS1RNMzYzQ2JFeVdSZFFZWXVN?=
 =?utf-8?B?NVZVcEJDbUlrR212bjdtcmpxRVBPL2UrMlJ2cm8wSVRIWDZMcTRBYUQvaVZ0?=
 =?utf-8?B?MU1vaXRoVW55NmFRVVFOWVpJaVVJUFJxQlZUcUxkSTlKcGlJNjFDbjQ5V1oz?=
 =?utf-8?B?dkUyUW0wcWt6WE5Wck45MUNTYTQ2UmxlQWcxUmY5Si9tSzRnakxJZjg1Qmxt?=
 =?utf-8?B?M1RJSTNvS2tJVUIzRDE1a2tYeDk5aFFrL3N6c0EyZFpCQzV4WkNZZTRRZS8y?=
 =?utf-8?B?bUpiRUt6SlhvdHVqdjZMNnNVYTZVbThSdU5IT0E5SU8rK1h2aExUa0hVQ0U4?=
 =?utf-8?B?cTRRNG5jSnQ3ckw3cGpseiszYnRVUU1WanFFSUE2Skt6TlRHVTk3N3VUOUNi?=
 =?utf-8?B?OE4yRmhqdGRPSDBKdGlBYm4yYnkzVzUrOXhkeG9XMktmRXM1V2JKdW4wcnZF?=
 =?utf-8?B?MmUrMTZmMW1TS0NLK1Vyd2NNd0gxdlFXalMzM1BDYkFHb3NxV0htK2dpdlNR?=
 =?utf-8?B?RmJEUmphai9Qbm1GZ0V1UUJwK2NlbUJoUmUxaHFGV1RqWXphUUk4b3BWbG5Q?=
 =?utf-8?B?NW1JRjNYRUljclV2WlJvZ21Vd1dvb3pXNlRtZ0psRWxXYVUrK0RHOXI0ZUxX?=
 =?utf-8?B?cko5bFk0ckNzVkQveG1nci91RkIrUURpR3E3U1Yza3l2L0ZBNjRjcWV4NmZ5?=
 =?utf-8?B?UUo4VmNJOExFc1ZUMDk3TXVHRE1GWER3SFppaU5rUkZIdy9XZEloMWtuTXJO?=
 =?utf-8?B?MHRueWJHRmNjYUdqOFdnRUdiM1FMUDE0emlIaEhFSVk0UWVNSzdhVUVyZnVI?=
 =?utf-8?B?cGFTUFpEV1pNd1ZGZXBieXlZdERIaUExZmZ6WjZDUjhQMkw5VHVOVVhHUmNV?=
 =?utf-8?B?SHV5YUhwRDNKdFBObXk3KzRKWG5jcVhnSm1mS1ZNMmFYaS9aSGJIWWVXMUh5?=
 =?utf-8?B?ZjV5bDMwMlRsWXg5b1plSEJOOXdnOHpmUE5vQ3JJaWdLWldJNmVEQzN1Uy9C?=
 =?utf-8?B?UzBncG1OZUVzN1ErTFVxV3U5VkV4UTdMaEtpdUx6citBUzZEdllUTVlsbmJL?=
 =?utf-8?B?VXJBb1NTekFiRUNxNzc1OXZnZmFhR2lVdlc3TzY0c2FHSlQxRE1iTkRuRmVm?=
 =?utf-8?B?eUNFcTRGQldxcHlBWE1GYyswRzJhSm5wSVdtSVBObG8zRG9IS1BFZUZNTHRi?=
 =?utf-8?B?L2Z4TFlXTWRuMDNkRXJCZlFMd0NFYWRYTmMrUXp5cE5LNGNQb29LRE1vMXJl?=
 =?utf-8?B?QWVpcU5XYkF2SkRqekhIZnpVaFl4YVNUODM2UWVYb2ZlblNOS2dxOHBJbDZP?=
 =?utf-8?B?RWxTOURMVEEvc0ZvZ3lOTk03b293SU5YYjJHWEp3YkF2QkR4SzltRWdKZXVr?=
 =?utf-8?Q?uUqGNbVAsr9MEaOEL8aTPB1ATw0u4KIj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QndLM2UwV1NaUzFtY0RxSmFFVzk3M3IxZzlRUkw3OFhqU3pFWWtvM3RrcHFT?=
 =?utf-8?B?L0EvWXJjZE1KNzlJUk5LL3NVOFlhVWIzcU9GWmRjMGJhOXYySEdLaWZSUXh3?=
 =?utf-8?B?ZS9DZ3VoaG1GWFc5dUdla3dLVGpsZE5taUpRLzArSUwrTXlBZmpmYmRlbGhX?=
 =?utf-8?B?MzlNOWJyWjQ5SE05bUV1aXlpWnZPRXVsMHA0R3RoTnkzYnR4dGl4eXdUSkZs?=
 =?utf-8?B?Nlh5STROanltQlNZZVVEWFZSbk42VG5EUEExYXRLVGp1dEI4QmFUdW1BYWhN?=
 =?utf-8?B?d3RaeGtEcVU2UkZSekR0ZTh2Q1N5VmhMemlJb2F4aGxZd3diUTdJaVYrMjdM?=
 =?utf-8?B?N3NBQnVTMFNvcmU3SjhLRk93Sk9VdC9qZlNyT3dSbENXK0F6MlB4emlMUHR3?=
 =?utf-8?B?MlJLZW1EeFFVU3V1ZGZHdnFIZnBwZlliclJLV3huWTRQdi9MMFNCQUFCZURC?=
 =?utf-8?B?SHlPTGdQdVpTVmI5NzlpdHRWSGdlTEMzK3IvKzJuR0hVOXErNFlaeldvaDRJ?=
 =?utf-8?B?Z3lwY3NsU01zTVpDN2dPeUF2QnVkVi8xWUh6VGZ0TXo3R1ZDWktLaGgycGQ2?=
 =?utf-8?B?R3pEZ04rWW9wbk01T3Z5OUFPalF0dE9KazVGbWlSVTh6MURGMlZ2bVh5SmR0?=
 =?utf-8?B?RkdNMVpSS2kzZlBlTmU4cm1iU25GeXlXcVNhZ0dQeUxhdEpiYWVod1VhS29h?=
 =?utf-8?B?dnZsb0xvTUtsRGJNQU81aUhabU5VK1ZYZVN2VlYrMkEwazBtQkpvS0xQR1VS?=
 =?utf-8?B?YVJ3NDFZRjduMkFPSjdJQmRTbEY4ODBnbDhWKzkwRmJrenU5OUdUUzZXZHJY?=
 =?utf-8?B?ZXZmWFBsNWdwNFU3U2JPbFVPWi9WWlFrMmNKS1JQWGNxN3REUEFld0hwV2lm?=
 =?utf-8?B?Wm42SkMyZEQ2WHVlWGdNL29aYlhPclY0Wk9vZGlDNlpGVElmK3QyYlhjMFU2?=
 =?utf-8?B?azgvOHlEeXdHZktBckNjQXljZ0EwalNuS0FLdDJTUnBvSkdkODZnTkdoY3Iw?=
 =?utf-8?B?cHE3OFNieG1nWDJVMkM1SVRGd29hdFdmeTYrNXhJQ3hNd3ZzbGFaNG54NWI5?=
 =?utf-8?B?RUo5VWJmMnV3b29uTlkrajRmczFabytsRE1LSGNZeFc5NW9WTW90bnBYd0ZL?=
 =?utf-8?B?Rm5jYVpEZno5V1JaeFcxK0ZyaG8zRklrQ1FFTnVRVTJGR25EODNhTlJoaVBU?=
 =?utf-8?B?NU44M0hHbmZUV2h1eUtwSE1mTFQzcmQ1ejBXVGFYdlpnVzRSWENnclJTQjBU?=
 =?utf-8?B?OGdYV1JqMXp0R0xXT1JGaEVES0JkNTVoNldtdm5EM1hFL3ptNXF4dXNaNTFq?=
 =?utf-8?B?Wi9CRjZiVXNJd3V3MG5zVjNHS1g3ZjRjMXk0Um5HVEhDaExJWk15QTlEZnRh?=
 =?utf-8?B?Q2lMS09IZllnVjYxV2xxNjY4UStndDZraTNaaXphNHpyRVBYN04rQS9Iek9L?=
 =?utf-8?B?Mmk2anFuMXh3bVJaM1hsODhmUXkwZ3JvL1hMS0gvMzA2RDVzZU9hdEd3Qmxw?=
 =?utf-8?B?VEVPQ1dpaXY4dktjMHZmdmk0V2hINVV5bWxiVThlaW9Sd3BVWEhuR29Jcmxs?=
 =?utf-8?B?ZDZPODQzNjJ6dXBmd0NZZzNjMHNkamZrdmNIZ3ZyemNocm9hZCsrS0p4VWNP?=
 =?utf-8?B?VWFoL2NGTDN1TUwvRHFTbjFXV0xrYWdyUHJ5ektnTXJnTkxkUWQrdUVCYUp6?=
 =?utf-8?B?Lyttb2RoR3VpUHcvT09pemFKL1lCWGN5amkyNktWamNMWUZ1ZzNKRkxPMjlu?=
 =?utf-8?B?Y1hzZ1pQNS9zR2pQVXRzVHppbFZiMTdsaDk5UGtvTlNTMHk0WW5lcHhPanB1?=
 =?utf-8?B?aTltWFZxblRDZTBEMkNZTW5vd3MxU1ZTeGdFTEJCSVFRVzl2NnVqQlNpa0dh?=
 =?utf-8?B?OXdWTjJjcHJvSzEzQkJiM2N2STIxMng1WmNwL2d3cUd0UERZVUtybExCQzVw?=
 =?utf-8?B?eS9kL1VRMVhRakIzaFRuVzcrL2FHRFJEekh4Z0dWZ0ppdW92TVA5UzhEV0Uv?=
 =?utf-8?B?eXg5R05SN1F3QUNNa1FsT1A0UnpuZVd6MmNWdXl6Yk9GS28wRkdHRFhHRmtH?=
 =?utf-8?B?bzBodkZXRTVVdjhQYzFOb1ljNG9WNkJPM0prcXN1Wlp5V3JCTDNWUXJQYkxz?=
 =?utf-8?Q?JlZH/lJq26Fw3JLost5mRrd01?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b8f2a5b-6810-4573-3ec2-08de100e022d
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 19:22:28.7780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 947BsX7sikVr8ZHBj93WCJHUDP4vP5GY9RyygoUnniYYtULMjBaUlffw3hRlb6XRFqmfz6TpKbhc2H93FPPnRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8065
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


On 10/17/2025 12:25 AM, Michal Wajdeczko wrote:
>
> On 10/16/2025 2:05 PM, Tomasz Lis wrote:
>> The ATS-M does support VF migration, and it has graphics ver below
>> the currently allowed range. Experimental support of this platform
>> should therefore be available.
>>
>> This change allows experimental VF migration support on ATS-M. It
>> is also explicitly not allowing ADL, by adding condition on MEMIRQ.
>> Supporting VF migration through MMIO interrupts would require
>> some special handling in order to achieve reliability.
>>
>> v2: Add MEMIRQ condition
>>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_sriov_vf.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> index 5fb042c05112..fb2b3d41c610 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>> @@ -159,10 +159,13 @@ static void vf_migration_init_early(struct xe_device *xe)
>>   		return vf_disable_migration(xe,
>>   					    "experimental feature not available on production builds");
>>   
>> -	if (GRAPHICS_VER(xe) < 20)
>> -		return vf_disable_migration(xe, "requires gfx version >= 20, but only %u found",
>> +	if (GRAPHICS_VER(xe) < 12)
>> +		return vf_disable_migration(xe, "requires gfx version >= 12, but only %u found",
>>   					    GRAPHICS_VER(xe));
> maybe just drop it completely and only rely on memirq support ?
>
> it's available from 12.50, see
>
> static inline bool xe_device_has_memirq(struct xe_device *xe)
> {
> 	return GRAPHICS_VERx100(xe) >= 1250;
> }

If/when support on non-MEMIRQ platforms will be added, the condition 
will be removed.

It's unlikely the need for replacement condition will be remembered at 
that point.

Removing the double check would be creating foundations for future mistake.

-Tomasz

>>   > +	if (!xe_device_has_memirq(xe))
>> +		return vf_disable_migration(xe, "requires memory-based IRQ support");
>> +
>>   	xe->sriov.vf.migration.enabled = true;
>>   	xe_sriov_dbg(xe, "migration support enabled\n");
>>   }
