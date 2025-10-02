Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05E3CAC5B0
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 22:02:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF7C10E858;
	Thu,  2 Oct 2025 22:02:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Khzzdtl3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069EC10E858
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 22:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759442563; x=1790978563;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2B78MLUBWOohQa3qP18kW9fJQdCtRCo2Xmm61qjDjoI=;
 b=Khzzdtl3RXxBLwtkSy5Hii8bf7eD8eBgDQG+0fsaGEepDqkFpC8ZYZKd
 M1E6zPK0UONrShxP2qEppUq+5AowU3Hws9ZIWsDqxplMClyq1uND7Py9y
 jsEajT9xLCuPEEX/QBeYK38ryikEl8llhArasOhTAl/Mk7mRPP7Ypm9cC
 U1bcZvQB9Bg2gKPfYEVrQzfxFUIiMvd3iRIpLqbiDu02uGOmfhp8o8s9n
 v8l661DHIam/d3aT9UCSZd22OeuVjGiykagRUX3kHcAZ1pi/23QCAmrUn
 xK33RbLX/HVNLGA991repDyBNDSMriGoItGx31EKIojyPiQGbVgrMenVO Q==;
X-CSE-ConnectionGUID: 5/pwUQqES3amR7d7E8I5Ag==
X-CSE-MsgGUID: 2CSvFTqlQ5OgGgeyUXCH0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="72839710"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="72839710"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 15:02:43 -0700
X-CSE-ConnectionGUID: BjGcsMowQDmaO4U3h8vLuw==
X-CSE-MsgGUID: SvQj2shrQaudNKaKSnRUzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="184343352"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 15:02:43 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 15:02:41 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 15:02:41 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 15:02:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WUYTbJa5u6lGa6m+IapEXVbIo2btQYmJBhBFaXTkCvIuC6XkPj5Q0nGzaRxLEln1nF9Pqu08RIt1jqo5CD6AWzDrnb5YNX6kPcxCVmmvGBkptl0oyYII48OL9h+vZzXeQu6SaBHHlRGxwxkTaM34g87ZzfmmV3oT+nsW5Dj8GvxbTN92cr1X4iplEIwKWwc6ZLXMq14Zni6JefuAO4JadzrVovv8+sY8kRgSoIluJeTe7bPav5eSOH4iPUf47xRBNuWka98oN0mIEDFJ+hmul3hwtlw8Ezbiwy9OEckfWF1hjaLzbue49C+Rc/9yrfU0ZCJWvsiRkLO/qzbLRRI/wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b4NMOiJSeOXayMEnDu0H7Bp6C5JjxkRsZ6aBjraIinM=;
 b=Ba2BhlFMIk2GHNADPGUA2e7oljPHg7Q1n6T+xs+Pz/lgglchhWk7HlRpqr6X0Uc7ue2csenuzocL82nxiXTSaH7aUZovnHzzJo+FASlS14Z9A1XzK0uXQtYfzXnMRUoqocvUmx+aiG9ZIeSym00KjuPQlKerCw9ADiQJ5HVlu3DnvfN5mYwKFmqgxidHNRcGW1JDEfACEJdwfIcxJ6uPrG6jCPF20UzjVKILSEbIciT70ED8P3FC1i6mF5dlwrPDMj2KnDMnVUJQJHbzHn7YznjSA59b7Ze1bpfwWZ6iZl9Wq4QKnmK4PVXq9RDd67pnchpzsHRfdZejgzkzof1bQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by IA1PR11MB7754.namprd11.prod.outlook.com (2603:10b6:208:421::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 22:02:35 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Thu, 2 Oct 2025
 22:02:35 +0000
Message-ID: <365c2282-21ae-4a55-8b48-4fdd1b78a6a1@intel.com>
Date: Fri, 3 Oct 2025 00:02:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/34] drm/xe: Add NULL checks to scratch LRC allocation
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-2-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20251002055402.1865880-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0017.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::16) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|IA1PR11MB7754:EE_
X-MS-Office365-Filtering-Correlation-Id: 7349eb00-f219-4bbe-0fd2-08de01ff64c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Slc0aGtBYVBzUEZ5U2tFM3ZoVE05ekltUU9vMkl1UXJWTnRDRFRTNVBxdE5G?=
 =?utf-8?B?WXltSTk3cjNnT2pKbUpjTUpiZUxMT3duVzFWUFFlSWpoM2NjbFMwZzlmNUV3?=
 =?utf-8?B?aXdlWU9mcXZtZUxkVUtoSFZTbnZiMjZDT1RMSnM0ek5PQU1DWnhpWnplcW1z?=
 =?utf-8?B?cDFzY1lmMTZFQ1VDVzl4U2N2Um5TK2VSRnlPZ0hEclo5RER0UWdtSFJJRW96?=
 =?utf-8?B?R3pYM2ZYMlFiZWVUNzlCWklnS2ppL2EwMERtNDZUTjRrNnFrSHBXdXRjU1dl?=
 =?utf-8?B?b0plSEpERitqTTJLY2FXUGJhRE92V2dUc2NoVU9meG1KdGJpbmtmSGZmMEg1?=
 =?utf-8?B?YVhWVzNFemxIbmkwNTZLME5BSFVPcER0ODF5OTlXaHpUS2lNbkFMSkV6WWky?=
 =?utf-8?B?YmgzL3Y2b1JIK2h4eGxudnJUdDBRaEQwaTd5dHRTdWJ1RGthZmlPTXBGVzQv?=
 =?utf-8?B?c2ZvK0M5SnNXQkdCNklRQjhIRjRIVW51bWJIaUYyZzM2Y0Yvcm9KT2V2b3Uv?=
 =?utf-8?B?ZEVwWWlJYU5lS0xqRVRpaldQV0xKRWV5eTBhUm8wMjZXc1JjQmhvUEhtRitS?=
 =?utf-8?B?K2l2ZEhMeUhzd1MrTVFUTVBaOGxnNmtBSC9vOVRqOTd1QVhtWStiQTRCTjJJ?=
 =?utf-8?B?a0plcjg4ek5OY1ZwMU11ai9vbUJCY2c4M2hjZXFMaXRBdytucTBIREhZZDh3?=
 =?utf-8?B?UGl3RWJhcm5OZ1FkbTJHaUoxcHcwYTZjZUt5OEpyNm1TMFB5WDJRSHpZOEZ5?=
 =?utf-8?B?OGhNQzJteEVDTXM5ME1keTB5ZEVBL2lQeUQxeDRoWTU0dVFlYkJteVdJMWx6?=
 =?utf-8?B?WDhpQ09hcnBjaVN3YS9RRDdTdklpc2psaUc2Y05oTmI5dzcxeXh0VEU2dldH?=
 =?utf-8?B?NWoyV1R5dFB0OVhpQXZyS1JJd0huOHlSbWJtaEwxUVg5M29DRXpYcXhsaVps?=
 =?utf-8?B?TFZlNmtiKy9Xc0g4VXFOQXBQcTVxQU1xeEtHTi9BZmJqclJTQloweTh4Z0hu?=
 =?utf-8?B?UDJRRVVEUmFlenYvZkorV1lTVjBWMnVkTUlZcUlTMnRZYWJ5aWprVXJxUXpR?=
 =?utf-8?B?VFRQVnAwN1lPNmNYSVpVczlHajhRZExHQzV5Q3NvKzhpYVhaVlpRdi93S3k0?=
 =?utf-8?B?THdJaFdtSzlIdlpBM1Q4VVNBWmRxTHhaZjJlcWhRWUNxNzhCM25pWXgzcVpT?=
 =?utf-8?B?S2RjZkFZRUdlSEZTQVUxUEtIdGNTVmM5OTFIN0lDKzdEU1pFYjFkWkVoTnFr?=
 =?utf-8?B?aEpzWTBYNDJscmpYenhIUzZOeFU3ZDdxM01sY0lRSGtMTmt2V1pJQUZtNitm?=
 =?utf-8?B?LzZxTFhReUxBeGdMSHB3OXBJbFVkQk5NUHZtTXd1eTN3QXRjZGF2dmFHZUxQ?=
 =?utf-8?B?NVJxZHNsb2l3ZFY2OHVPeTUwamdNcVpxVFhkQUxteVd5V0F2cng3MmlsbDR0?=
 =?utf-8?B?elhkMXBmbE95YmZTRndSSlJiWUlUNHNQWlFoemdQN1YyVTZCRFJ2S21UWEdh?=
 =?utf-8?B?MU0wR1hHeXBJZVNRTVZYYmRUTGFwZ2lUZFM1ZlhnYXlwNjErc2t4YWZuWjZt?=
 =?utf-8?B?YWsyZnVTdFM3Nnk3Wi84bE92NHlZdWtVZFg5WHcwVDNwRGRxTHlJWEZPNFpJ?=
 =?utf-8?B?NHJwRy83VlB0ODlrdGhJaU5TZWt5K1NlSzNnejQzZ3Q4ek5LT3cxdGEyaWNH?=
 =?utf-8?B?ait1UGl0SFE3VSt6UEN2N1dWNURsajB1WTFFcjZ0eUFzT1l3S3F4TnhENTJy?=
 =?utf-8?B?MmFCWXJySEFBVkFZWEQ1MjZDUlp1Q1hZRmJkOFJKRHdmeVlNbitHdWZRQzJj?=
 =?utf-8?B?MXBNWXlvQUFPd0JJZkx4dXArTXNJQmJOcG9peDFEcWxJKzM5S01zNThTNnQv?=
 =?utf-8?B?TXNsWFdqMDJjNERlaTQ1bXFiZFp5Q1Fuc0NtTDdTamJ2ZEY5UEVkTDVaZ2lG?=
 =?utf-8?Q?/HD0ydJUCX5Wud4BxSEMFcYXguYNSqlI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0FlaXh3MzczZzQxMVZOV2NYYXgyU2VCOEt3Z2VSL1l5MUtRM082TFQ0MXF3?=
 =?utf-8?B?Yy9mdExWY1lpdndYenBoZU50R2tabGlJbndmWXpxcHBPd09OUkk1Y2piTFV4?=
 =?utf-8?B?RFBWc2NEK1pMS0x5d3JtbmpyNEd5MzJjUWc3TlNrOGVxbHNyOHRXNkl0Y3V4?=
 =?utf-8?B?czlCZ1Jmd0J2S1ZXZ3ZNczhpb0tVdFlTTC9obk5pRHIyV3d5UEJYOU5nUDlH?=
 =?utf-8?B?b0NFYzZyTXJGWlRhNmJPQ0M3ZmZyVG5CTkhVdm1xMklNVVVhUVFzUkhpeTdH?=
 =?utf-8?B?blowUngzWEQxZGhKOG5wZDV2d3hJYmtJM3ovZVpwTGZjYktMNDFCYlNZd05I?=
 =?utf-8?B?NVJXNVNtUmdyS3BRQkZGdGpWeWlPOFdIUmN0bUthS2JDYm9uZGJBdVA4UkNv?=
 =?utf-8?B?U2IwNzlqS3ZkcUhoNEY2bTVlcHJNZkJRQlFEMXB4NktrU0hUcll6cmxVa2s0?=
 =?utf-8?B?VTRjOUtQbmZqMnFSMzYzR3VaQ2dZT2xrZFhyYzBDb2RBbGxPVnEvRGhiWm16?=
 =?utf-8?B?djBrbkpuakFjTDFFRE1XKzBiUTcxU0NqaS9QcU52SXRVanJzS1JuL01yNG10?=
 =?utf-8?B?d0pCMGI0NFVjQ3hISTRDVFEvRHdPUlYxek84R0c5VXBua1ZydXRHbm1MOW9s?=
 =?utf-8?B?dENOdk03UCtJRDZMdjhyeWtPSTFPYng4bTJLczAxdXlKbXlQc0VrVUVsMTBJ?=
 =?utf-8?B?cWYzKzJsdEFDcW53cUlnRW9pR2N1ZzNNSUxyT1FkRGkwRkdiK1l3ZTBoTlp2?=
 =?utf-8?B?U2kxekYyTU5jRkpRTGY5SHpUeS9WdEYrY01VNHY2c00zY1R2MUVjcVgrb0NB?=
 =?utf-8?B?eU1wSVlQWFhlK2FDNHJJQmhMa0M5bXE3OHpXY2RRb1RGelpYRm9SalYvbWps?=
 =?utf-8?B?bGFaYnc3alprUng2MVZLeTB2Sm8rdWFCMDkxcWp0Rm1qdU9DcUhQaC9QeDg2?=
 =?utf-8?B?TjNpYmJiY0o5SUV4Z1dncVgyQU1lTm51MzR4K1JPNzlmU1M1RVl6LzVRZkJU?=
 =?utf-8?B?ZGVkbTVoZTkrdUZ5UHo4UmxMbElBWkZqK041dzFoUHNGbUhLVkZpM3VDaWZ4?=
 =?utf-8?B?K1UzWEdkWVVEUldTTkhXS28zQzNpYVduNmhmZ1l0WGdsSGJkOWJDZmVoMkts?=
 =?utf-8?B?amdyam96UFY3T09YdGcvcFpGaDQvT01KemdHa1RFekpzT3FOa2NpQnRIWk9M?=
 =?utf-8?B?NGVreDJ2a0ttcUg0RUcvUkV1a3NWWUZueHJZVWN3QnkwaEpxY2JCRDZ5UXlI?=
 =?utf-8?B?aHMyQnl6cStiMndtM3VxTWhDZHh5YmNUT1NaM2g0ZjdPZGhkWEZ4dkdoTkNx?=
 =?utf-8?B?Z2lXSktFU1l4K1VCRnlieDFRemJsMEtlaW9lR1czRHoydmFTbVNZSVdjZFdJ?=
 =?utf-8?B?Zzh4MmwwTXZjdWdZUFJ2LzVTMkQ2RnpMTlF1MmFVY1F2bFN1ZlllL2Y2OUFF?=
 =?utf-8?B?eFE2WnB5bVlPd0NEUGJLTXdDdTdVTlhUaGlUaXVyTnpuVFdGeFdrNm9XSVps?=
 =?utf-8?B?Z3lCY1Fra3VpWGdyNUlKd1hrOEFaZk1LUjlRVEJpWnBrYTV4MmdJL3UrMjND?=
 =?utf-8?B?VUVlTFNIbm0zdkdza09TSjZQSkZYUXBHRG4wOXRQTnQ2SUtLZEpiSmpGR0N5?=
 =?utf-8?B?VythMXdDVDNjUGtLWFJVNG54SXRqSmRER0IzM0FaVHgveUFSampjaU1OOEZz?=
 =?utf-8?B?L1lZbWJSeXdld0pQczdMdmtYVnZxMjVxU2QwWGI2bC9BSTdQZmliTHdKZjVl?=
 =?utf-8?B?OUt3ZDEwR01CWW1EQXcrbnRUSTg1b3UzWE1rMVUyU1R2RWplTFlBVnVEaWR1?=
 =?utf-8?B?ZHg1VExTeXdFaUJiK043QnhoNm5YeHYwblY5ZDdGMEpNMCtvOTlUUWlEY3p5?=
 =?utf-8?B?RmJkVGRORDFKUmlwQXI1MTZSeEdVaEpxdTdQVmdXRjRFN3FkV2I0aDhtL04r?=
 =?utf-8?B?NXZBaXB4NGx2dHIzQnUzOTNIblRpdHFjZklOb0J5ZEFsTWU5WWRFWkJiaDBQ?=
 =?utf-8?B?dVVQb1pHVVJuRFY1VkFELzFYaFZzT2JUdnd6N3laK0pKNjlvTFM0LzJrcWdM?=
 =?utf-8?B?cklaYUpTMHVHQUdaOFhlbG1Pbnk3YmNLRkU5MzV6ZDAxbjBTSHE2bk9SNUht?=
 =?utf-8?Q?vCszS/T7dxBeAs+vWWiDvRZMF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7349eb00-f219-4bbe-0fd2-08de01ff64c9
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 22:02:35.5468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rHxWLTZ52paG5SJB6J9+5iBrICP6CGLB0TCo87s9dPnzJFMuyZYqfNuK/PFs0lN6EjzewQXLHyp1mjapiXa59w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7754
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


On 10/2/2025 7:53 AM, Matthew Brost wrote:
> kmalloc can fail, the returned value must have a NULL check. This should
> be immediately after kmalloc for clarity.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_lrc.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 47e9df775072..e1bc102a6cae 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1303,8 +1303,11 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>   	u32 *buf = NULL;
>   	int ret;
>   
> -	if (lrc->bo->vmap.is_iomem)
> +	if (lrc->bo->vmap.is_iomem) {
>   		buf = kmalloc(LRC_WA_BB_SIZE, GFP_KERNEL);
> +		if (!buf)
> +			return -ENOMEM;
> +	}
>   
>   	ret = xe_lrc_setup_wa_bb_with_scratch(lrc, hwe, buf);
>   
> @@ -1347,8 +1350,11 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>   	if (xe_gt_WARN_ON(lrc->gt, !state.funcs))
>   		return 0;
>   
> -	if (lrc->bo->vmap.is_iomem)
> +	if (lrc->bo->vmap.is_iomem) {
>   		state.buffer = kmalloc(state.max_size, GFP_KERNEL);
> +		if (!state.buffer)
> +			return -ENOMEM;
> +	}
>   
>   	ret = setup_bo(&state);

Now it makes no sense to return -ENOMEM inside `setup_bo()`. We should 
assert that the pointer is not NULL there.

-Tomasz

>   	if (ret) {
