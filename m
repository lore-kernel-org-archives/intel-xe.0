Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F728C282C1
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 16:34:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA4C88BE3;
	Fri, 28 Feb 2025 16:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pan5RbtK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACB810ECFA
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 16:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740760444; x=1772296444;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7/WwATKBOyasfgu/G33cbBCWVT2kI2qHddhdJCNgeuc=;
 b=Pan5RbtK/7fln7V3A6JCGGRvxXDSmRl3o4RljO/wBcTs66XbCJzGNcTJ
 mUU1yjysprJEbXYXKNCGZNP4aUAcYN8zVwVJGNOc2OazOyVYGZr34v5Xq
 TRe7ZIfjPH4xkLGk0zLyI6pPeqQkfzaGGCiUWGLgSU17Zb7glygsAm0Lz
 4BMRx9KtrsCwhEQH/GVOLPg22LZJyusxyBvN2NoKXglFPMQtiHcphG5+Q
 3mPcrArViFmeLJDlMDmYBevwIuf5G3Qsiu77IRT0mMBaeGVSeEtandpax
 c4IDILuDJvVrniLK6v8XsfSyIPLJzhpbhvP0jgeAZKK9eD9M1ASl/SSGi w==;
X-CSE-ConnectionGUID: 3780PydaQayK7epJlEEqWg==
X-CSE-MsgGUID: lGywTW9gSDmQbyeHPnkH5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="59233584"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="59233584"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 08:34:03 -0800
X-CSE-ConnectionGUID: bxr+Ya6nSIyTmCajFSWNxQ==
X-CSE-MsgGUID: BrDhiZl7RGW03lNLZmrTWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="117403563"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 08:34:03 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 28 Feb 2025 08:34:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 28 Feb 2025 08:34:02 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 08:34:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XwLcqbqC0WbZ6RLhHXVqPIQMvE3pDnwzklKW325RFDeS9bONxLxRIBDCnNWJZ0zZGJK8ycylpTB49tBA/itrO99+Q+qi788Z/zUuxibo7jZsiBpdauYFimfdJhSCJv8YU6gVCiJP/Pr4L8y23ukny070/CZdN+Z7JpEq5FTL7D+646eK7aVpZqMeKOo4LunxN/TqsS7EsboWDmYYdYxkU+3D9AqNcoppCD9qYI2akER3q9SF4V3KA7JSmjbUJMkX11GaTO6XRzkfmIOllD7fVe2qL5/WjoOhjVKkg2fS/LJKpg9VSKRv9Dmtf9xSbJ/XPVCwKUqejnpp1jE4QTljdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZeLcteut0E4UgJfrybQawsvNlyXerIQ9ULWtf+P8Cq8=;
 b=VW+OQpuwr0SerYrO75cJms8gX71EkCU5uKWkV6BGwWQW6+FllrdiEJqVqW9U5tlO5R6kiqPrfHG2BkEt5RMY2pJJXXzByxEFlGM2FB8Yf6HnTKpqYoOT5Wv1P4vq1XnarwtLyFWGcMjQzivNHoAYxzCN6llLQdpIrQkvT2iDHFp40c87WAPhXHVg5GjjwrfkSNxmwOYqa9WUwAdIO2wc5zqHLF0hFJbOYkmbXBTBEHB2oiqmgR757ZWiASUgmuv5pKk6dPATc2u2AWCFYHHiTj6SzOZ9VwKbHq+0/MudN0erMOahM2aiybTNzJpAc/k3mwdchVEv1vd32EJtx7AySw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH8PR11MB6830.namprd11.prod.outlook.com (2603:10b6:510:22e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Fri, 28 Feb
 2025 16:33:44 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%5]) with mapi id 15.20.8489.018; Fri, 28 Feb 2025
 16:33:44 +0000
Message-ID: <dc8a78ea-e61b-4820-ae4f-573951bcfcae@intel.com>
Date: Fri, 28 Feb 2025 08:33:42 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc_pc: Do not stop probe or resume if GuC PC
 fails
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20250214172503.502320-1-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20250214172503.502320-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:40::16) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH8PR11MB6830:EE_
X-MS-Office365-Filtering-Correlation-Id: ea712e28-c66a-4317-ac5f-08dd5815aad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2FXMFo4aE5PZUZEYzhic1JwaTFjZUx1WTEzaE9oV2ViTy9vUUlweStEay93?=
 =?utf-8?B?cGR4d2xldHJ4aXFEdHlRK0FnRjlkVms1NWV1eko4NkEzbnpuOG1xalV1Nit1?=
 =?utf-8?B?d3JXUmlSRk1WNENWU1dGdkVueCsvampkQjZ2cWRVVUIyQ1dITnRjMHNVM2hL?=
 =?utf-8?B?QnI2dmpTSVJiTmRaR1ZFSkowa0lNZGdjRHBIdXJ1RjJCRXZmTmVRY1pHcE1t?=
 =?utf-8?B?R3c2M0UwTk9MVXMyK1d1V1RzVlhudUovQTFiYTNYK1dleGhpTFhFRWN0bHJ2?=
 =?utf-8?B?WFpwa3JQV3V5U01HVzRjS3dEcmR4VVp0TE1oQy9mUkcweHhRVldxQVlDR2F1?=
 =?utf-8?B?MG03cjRwUlMvamJjUDV0UDZFNnU0OHJ3VlRVb2pPS1QvNXloandEbFVuZTls?=
 =?utf-8?B?MFJYT1ZIVCtuK1Z4Q214ZXdzeGtzcTBKeTBqMlhLc084QldRMUsrdytnQVhG?=
 =?utf-8?B?UU5lYmltdW9HcjVPYUwrODZwb2cxVXpzcXFxaGozNGdJaHBQa25sK2ZqN1lV?=
 =?utf-8?B?bUJ0SXhlQUtjNWo0dlBTNUlkMlRPblRKaEdzNHVhaFNNa2V0WUVYeTYyWDFG?=
 =?utf-8?B?M1lFakxINklHc1MxZWNlbEkvVlF6RmxPUTByaTV5VXh0L1BaY0E0VE01TGpm?=
 =?utf-8?B?UlVSc1RBNE5IT0V4bld2aHdXUDJVVTZZWjhnNlZod3BOSFBONm5ZME9FbzAz?=
 =?utf-8?B?UlRFL25HdmJlYnhvdWp3cCs2VDBkY2JDSC91SDI3SEFpVFYwK0ZZNHdIR3dv?=
 =?utf-8?B?L1RrbVYxMzBYRFJKQXBKMTRIM3dGdGRFQWFxcHY4MFNreTBCdVFIWnZTd1Fh?=
 =?utf-8?B?YjhrNENOMjZkbzRocFd0b3U3T1VUS0JaWkFuYjBBTGxpVkp3N3pyMnlGeXJK?=
 =?utf-8?B?WDRadUprSGZsRGo2L0ppb0FMTkNlS1JtU1laSG9PL2pMVE4xZy9KbTl1RmYw?=
 =?utf-8?B?VC9nanBDYWNNRW03T0dSMGtCR1ZYZC9rMHdGYkpOdXV5NVVKd0ZMdFR1UHZy?=
 =?utf-8?B?TVJJbkh4eWduK1RRWXUyUnlFOSsvdlNmMExUcEYzSFZybWlZazhTNTN6emZL?=
 =?utf-8?B?Q1hYN2diWjlJQ25mbUkxeE5xV2J6Ym0xNVk2cmlmWjV0cVdEdWhEWXhiOXZL?=
 =?utf-8?B?ZklGOHVESmkzY0hYMEFRSFFKanlINjQzOEQxenFwMWpUZjFlamRqMW9DTUdX?=
 =?utf-8?B?VHRXd3pyWkhKTkxrVUZKMk53aDBUdWdoWUxYdm53NWUyd0MxN0plRTU1UmNw?=
 =?utf-8?B?Vi9yWElWT2MrTjJ6SmlqeCtxbXpaYUxCMEZpZVNNQ0VhOHZGZjlmdGZzUkYr?=
 =?utf-8?B?V0ZQZzZkbGtzbWNkaUlNUVpjWVN0UTlsN2drcFJsOTR5RWxHeXdIai9CaHE3?=
 =?utf-8?B?Y3dPRkNyZm15bVk4eEhzUFlpRzBnTHQ1UmJVVmJ2WENFU2xUdjdGakpQVWM4?=
 =?utf-8?B?MG14ellySHpETXBzVm1ZT3E4NmxIOUEwUU90Wnp3SGh3VWJxYkpqVlBuNitx?=
 =?utf-8?B?WFpoRWJIZG0wa2VpRUNJNHVFZ1Rua0cxWXVYR3dSSUFaUEF0NzF5VysxSUpV?=
 =?utf-8?B?aytkNjlmS1lMUy9yYzV4Y3ZtSnhIMDNQY0FJNzNROWFHcGNTTWlNYW9EUWE5?=
 =?utf-8?B?Q2M3VDFXNTdoK1hyUWY0NWRyVnhzRUttcWVVT2lmbkEzRTkvQ3lBTlpHbk1x?=
 =?utf-8?B?Rkx6MlJhSkIycTlySVhVOGh6dHFUUDE0UU9JRmcyUUs3b240VHBTLzZXUjhj?=
 =?utf-8?B?eHlmQk9TOUsxZ0tPaTZGZXVrNEJYSFdlZkVvVHR4TTJ3MzFHQ3FVWXdtK1ZV?=
 =?utf-8?B?NE5ET3JZMlZxU1pjRWt5V05VcmdzcllMcElCTGl5d3Z1eVFkQkt4SFNZVkJL?=
 =?utf-8?Q?Ees2pVlQSaLJ0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEV0ZFFrdVZ1ME1neUk3SWM1RkpMTnZ4MGxFTm1TM2kvb00vMzNjbmFTVXFS?=
 =?utf-8?B?bG9SSTJEbXZBWmFHL3ZzbFZSdXdxdXdjSGgveS9WU2JIYTcwWmRNR1RlYUFs?=
 =?utf-8?B?WFBIeHFSSWJRa1hKWE96TTY5WlVpTk54ek5NdGlyYlNKQXh3U3gzV09iaFpE?=
 =?utf-8?B?QkxrbURUeWMvKzg1TjdZc3FLeFdIajY2Wm5aZkxkOWdXcmEyMTFrWjhrdHg5?=
 =?utf-8?B?K2FiTFV1aFNSK0JKWjBSdUtKZXpZaXJ4d1RzOWVWb1lRK0UyS3FOcVpHQUxU?=
 =?utf-8?B?Qmwxa0VwVVJic3VRbzhwTG1uUm5PaER3RVd6RElXUzRUVGorWXBmTnk1YnFK?=
 =?utf-8?B?YnEyczQ2NjZRS0k4MUVyUGlvSWJFMExpbUVvVkhncmZ1N0x2S2xDdXRub0c4?=
 =?utf-8?B?bzQrYTlSeXZSZkJPS0RUV2dWSzhZemQ1a0d3d0lNMkJVWlVSdkJHL05kTVdH?=
 =?utf-8?B?bkRYWFlzRjZ0Ym9SM3h0NHV5clJkNjNIek1KcmgveXc1bStFdFp4OXZPdXZa?=
 =?utf-8?B?bCtRVnhSSE5WZWwraExFQ01McG1IR0I3QVdQM3FhV1Bvdi9ZMTFSaTNTRkFY?=
 =?utf-8?B?TnlCQXZTTllRUEdQZDVNZnVKV0JFK0dFbG8wUzZkVDhPVWhsR0NkVEVEdCs5?=
 =?utf-8?B?OC90SjFxdk9JQ0Y3eEI3TVlWS2EweitUZm5nTlBady9Lc1N4cFBRNWs2SXFW?=
 =?utf-8?B?M2p6Z3E3bjhyQUVOTVNxL2E4T1hxeU92RE5XK09LNGZ6Z1VFU3htN2F6WDNl?=
 =?utf-8?B?YUsrcnNidzlvNHU4Y2lQZ2NUN1VWVklyNUJxaEd1aWF5dVd0YUZzblZpemcy?=
 =?utf-8?B?a3BBbzhsNnFsT29kVXpQbkVNZFNrdWt6b05xZlU2ZHBwR2FhT29uQ0UyMzU1?=
 =?utf-8?B?aXZrNDc0WDg0RlBJbjVmMnR3SnpNWUZ0WldhMi9hN093N3V0RDJleVN3Mlpq?=
 =?utf-8?B?Nk9KSytCMjdKWEl3OW9Db3NZeWFyUkROK1FvREZHd1g2UEFYTzVEdi81Tjky?=
 =?utf-8?B?Y3VoaXdmamhIaW9iUTBnTDlIdjYzUmZJMm5DWkJqTDJQcGF4cXFvWVVteG5w?=
 =?utf-8?B?UElHUGp4VW5uSXJtZW5pa1dxYkx1dDd1cllPMFE4SUdRbjVDYjJOWjEyNmZ5?=
 =?utf-8?B?TVVTZ3pvWnNjeVpSaDdJZVZYSU5xeEZpMzUxYXBYSDlIWW9KbnVVMklMZE53?=
 =?utf-8?B?SHJIMU51VnJwWlpLcVVSSWNoMFMzT2FOaDdwYktTYnlQVnhoMEhjUWhUT2hm?=
 =?utf-8?B?djdzb1h6bmppMWFZYk5QeDAzNzgwUGlXSzlxcjVycXd5aHhpT3R4UFRDNTBG?=
 =?utf-8?B?YkJveGlsdy9rbTd1RVphTGpCWFYxY3oveUw1SGQ5TlA2eU42K2l6TkpkeHJq?=
 =?utf-8?B?TTdvSG9KTkMwdXZjaVF1Mkw5YXpBRG5LTGdSZFl2OU50aXp1WUowVGNrUCs2?=
 =?utf-8?B?NWVVM2RRQlUzNEJiREZGZTA3THg0aVZYeU5lM2NRWC9SRUkzMHJoVnhHVzg3?=
 =?utf-8?B?Y3Z6TE9Xc3FjM09VVXlNVGNXZ1hrT1hsQ25UUmRYaU5PcmEyMGVwYUM1eTFV?=
 =?utf-8?B?RHZGRmNDQ0ZZbVZqaCtzV2E4OSsrTERCM3YvclZyVTBGWHF6TFpoRHFNTjln?=
 =?utf-8?B?VUI2eGxGaDZyTjFOU1NrY2Qwcm5qOGZnSHBVdWtETDdvUUFqdTRzdWtPczNz?=
 =?utf-8?B?UXZOTFRuclV0N0lYZlZxMFVCQTQrWVBrTkVzekp0Y2M1L1FwQTFrbitoOFlq?=
 =?utf-8?B?d3dza3BkL2o5REc1TXZoZFlBRTBNYzVwRWhFc3RmTS9FZGFVb0ppNlNoK3c1?=
 =?utf-8?B?Tk0wVGVVR0xVa2ZaVXdSTGxzdVdKUnRITDVCZlRxZytjNTRDbVFKVXIxLzJl?=
 =?utf-8?B?Q3dMblpESk9LQ1dBaW1CKzRocC9xYmdQNXYzTGZtNVBDK05uRFRncnJwVlVj?=
 =?utf-8?B?NktxOFhVYW5xU2k3M1FkdW1pNTFCQ2tSNEdBYkczNEhwNnpCN2dFNTRYUlJs?=
 =?utf-8?B?Zi96eTV4alBKdFR2S1lrQ3NtbU5SYVlNUDArdEhiWFhMZVJSV05FMGFiSWd5?=
 =?utf-8?B?WUZERVk2b2pXNm54M3FDQjYrbml3Z3lmbWpZRE9Kbnlrd2Y2UW5vNHdTbDAv?=
 =?utf-8?B?RUJ2TkFrNmRzQmJEREhPb2M5c2dxWmJxKytHa1ZjcmJyRzJIeklYWnIvRkRr?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea712e28-c66a-4317-ac5f-08dd5815aad8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 16:33:44.2820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/ssCvtog0g228XwptuG7xmrBnx18VUm3FA4SVJ+195hTxv9mdkZjyC7lUy4G6K8pEvtq6yaLBF/vBhgIhnuMxrDay/n1xhahwqnOZHKUoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6830
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


On 2/14/2025 9:25 AM, Rodrigo Vivi wrote:
> In a rare situation of thermal limit during resume, GuC can
> be slow and run into delays like this:
>
> xe 0000:00:02.0: [drm] GT1: excessive init time: 667ms! \
>     		 [status = 0x8002F034, timeouts = 0]
> xe 0000:00:02.0: [drm] GT1: excessive init time: \
>     		 [freq = 100MHz (req = 800MHz), before = 100MHz, \
>     		 perf_limit_reasons = 0x1C001000]
> xe 0000:00:02.0: [drm] *ERROR* GT1: GuC PC Start failed
> ------------[ cut here ]------------
> xe 0000:00:02.0: [drm] GT1: Failed to start GuC PC: -EIO
>
> If this happens, this can block entirely the GPU to be used.
> However, GPU can still be used, although the GT frequencies might be
> messed up.
>
> Let's report the error, but not block the flow.
> But, instead of just giving up and moving on, let's re-attempt a wait
> with a very long second timeout.
>
> v2: Keep the precision comment (Jonathan)
>      Use a define for the regular SLPC reset timeout.
> v3: Improve messages (Vinay)
>      Only skip initialization if the second full-second wait failed.
>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> #v2
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_pc.c | 46 ++++++++++++++++++++++++----------
>   1 file changed, 33 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 02409eedb914..74cc13012532 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -20,6 +20,7 @@
>   #include "xe_gt.h"
>   #include "xe_gt_idle.h"
>   #include "xe_gt_printk.h"
> +#include "xe_gt_throttle.h"
>   #include "xe_gt_types.h"
>   #include "xe_guc.h"
>   #include "xe_guc_ct.h"
> @@ -50,6 +51,8 @@
>   #define LNL_MERT_FREQ_CAP	800
>   #define BMG_MERT_FREQ_CAP	2133
>   
> +#define SLPC_RESET_TIMEOUT_MS 5 /* rought 5ms, but no need for precision */
> +
>   /**
>    * DOC: GuC Power Conservation (PC)
>    *
> @@ -114,9 +117,10 @@ static struct iosys_map *pc_to_maps(struct xe_guc_pc *pc)
>   	 FIELD_PREP(HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC, count))
>   
>   static int wait_for_pc_state(struct xe_guc_pc *pc,
> -			     enum slpc_global_state state)
> +			     enum slpc_global_state state,
> +			     int timeout_ms)
>   {
> -	int timeout_us = 5000; /* rought 5ms, but no need for precision */
> +	int timeout_us = 1000 * timeout_ms;
>   	int slept, wait = 10;
>   
>   	xe_device_assert_mem_access(pc_to_xe(pc));
> @@ -165,7 +169,8 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
>   	};
>   	int ret;
>   
> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> +			      SLPC_RESET_TIMEOUT_MS))
>   		return -EAGAIN;
>   
>   	/* Blocking here to ensure the results are ready before reading them */
> @@ -188,7 +193,8 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
>   	};
>   	int ret;
>   
> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> +			      SLPC_RESET_TIMEOUT_MS))
>   		return -EAGAIN;
>   
>   	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> @@ -209,7 +215,8 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
>   	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
>   	int ret;
>   
> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> +			      SLPC_RESET_TIMEOUT_MS))
>   		return -EAGAIN;
>   
>   	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> @@ -443,6 +450,15 @@ u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc)
>   	return freq;
>   }
>   
> +static u32 get_cur_freq(struct xe_gt *gt)
> +{
> +	u32 freq;
> +
> +	freq = xe_mmio_read32(&gt->mmio, RPNSWREQ);
Now that this is split off into another method, so we need to add an 
assert to ensure we are holding fwake?
> +	freq = REG_FIELD_GET(REQ_RATIO_MASK, freq);
> +	return decode_freq(freq);
> +}
> +
>   /**
>    * xe_guc_pc_get_cur_freq - Get Current requested frequency
>    * @pc: The GuC PC
> @@ -466,10 +482,7 @@ int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq)
>   		return -ETIMEDOUT;
>   	}
>   
> -	*freq = xe_mmio_read32(&gt->mmio, RPNSWREQ);
> -
> -	*freq = REG_FIELD_GET(REQ_RATIO_MASK, *freq);
> -	*freq = decode_freq(*freq);
> +	*freq = get_cur_freq(gt);
>   
>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	return 0;
> @@ -1033,10 +1046,17 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>   	if (ret)
>   		goto out;
>   
> -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING)) {
> -		xe_gt_err(gt, "GuC PC Start failed\n");
> -		ret = -EIO;
> -		goto out;
> +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING,
> +			      SLPC_RESET_TIMEOUT_MS)) {
> +		xe_gt_warn(gt, "GuC PC excessive start time: [freq = %dMHz (req = %dMHz), perf_limit_reasons = 0x%08X]\n",
> +			   xe_guc_pc_get_act_freq(pc), get_cur_freq(gt),
> +			   xe_gt_throttle_get_limit_reasons(gt));
> +		if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 1000)) {
> +			xe_gt_err(gt, "GuC PC Start failed: Dynamic GT frequency control and GT sleep states are now disabled.\n");
> +			/* Although GuC PC failed, do not block the usage of GPU */
> +			ret = 0;
> +			goto out;
> +		}

Other than above nit, LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>   	}
>   
>   	ret = pc_init_freqs(pc);
