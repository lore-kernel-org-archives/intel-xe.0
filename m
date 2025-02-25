Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC2DC021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 22:53:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF9510E811;
	Tue, 25 Feb 2025 22:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T/zyoiOF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3BC10E811
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 22:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740524029; x=1772060029;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=z3dG3W7r21v0zbSpmUKa9/nwl0ipO3N3Xl1cWJ6aLwQ=;
 b=T/zyoiOFAcx8VoBEylLuni7n8syLK73ctOnwVE3LYL875GGGm5Zvrd6M
 8qq/6JwLZiRNOGJFAHnnkhP+g+3chnAbjxU9A22hun9Deu+mx4H1jUDp+
 ySJ7+LEwi2nP3JCkURnn+Wv6pwfYVrf6xv/jAWJhZPHt5SIsb5DCwuegY
 Ath9gozRsOpmXjDsrst2mdwjkguzkbQpuz6ou2tJ8f2Exc6vQ9DPo5aVt
 +z2m8BECwk1kEfVjLPSP/RxX8IdqlW/h1fWYqDg5saeXJ9Q/JZbneYA9v
 UnBOhqUtOMSbzmPUeZZJww0by9VkjfUGwVxyFiPnaZt4AmMLYb606cSX8 A==;
X-CSE-ConnectionGUID: 7LY20OPISKeIS+M37Q/7jw==
X-CSE-MsgGUID: kH6Uxiz5QLSDfgcco2UW2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="52351638"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="52351638"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 14:53:49 -0800
X-CSE-ConnectionGUID: wq0hsBFITMevlkGUMSrJSw==
X-CSE-MsgGUID: x5aQrRK2SI28CSjGeVNQoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="116722371"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 14:53:49 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Feb 2025 14:53:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 14:53:31 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 14:53:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOg5lw/f1oD1FTaE3adgjfcHFlnrYF/DmLNkQMAfMEGyPdnVd61hoELYyG/DB4HZulqAIF6D63esKBkLXvsXxJSZIGtJLdko6+9ULwXz0to/pscXix5uUFBNK3aHYaZOp1QFnEVUxIcqe+PXYMg0Ppog9jZdvJ+laJ7VRTQ9DAjVV0RCXNSXMHeLaPdE+mgcoOploHniCdWy8XVDa9BjWI/UPwF6GLXvKZRlRLxMAG4Y2ijxXOzl0BNF5FidUVEiycPcLm7GWkA1UWYJEGNs23WQvn7TYaVW3EIc+bDDoWYnFzosO5Pd8QUw9m2OLH3Sm12+b0sXaGp6suz/hYyGSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4cAb+Q1aESYPspi5TowGWph+V0v5zO3fsSuUYNcBs8=;
 b=aV7pog/3b2MS3SBsdNS7vdkU1Vb9lhcox90Wcmc1fhZ+BG+FwloYbADGhYQZFVL44d1/6WCF+zUqawb6LxiC7bnzWZqR0QXm1NqiIo2/RRl8k+N6HfVj68yfGLtMz6qvO/IfwqMzA9V2yo+ztka4O/o4Qs2Yf227SsLvVluVf7Vyk4SFFAgCzfBo5nFaSJATLPNnVoQwO2xRBItQ8G6XFjYBffg68bvxeuZh6ZLakoEH08x94LWH89QZEU3NqzQCo+uUzxixTqvmPPiB2+WWwRO47AxMp6gs0yVKIDhn2e+bcufJUC4VmvpUM+63IIJDUgLgocU4EsYqh5QfKacVjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5926.namprd11.prod.outlook.com (2603:10b6:510:14d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Tue, 25 Feb
 2025 22:53:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 22:53:26 +0000
Date: Tue, 25 Feb 2025 14:54:29 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <Thomas.Hellstrom@linux.intel.com>,
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Clear scratch page on vm_bind
Message-ID: <Z75KJSx/uB3rOg+Q@lstrano-desk.jf.intel.com>
References: <20250213022331.265424-1-oak.zeng@intel.com>
 <20250213022331.265424-2-oak.zeng@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250213022331.265424-2-oak.zeng@intel.com>
X-ClientProxiedBy: MW4PR04CA0380.namprd04.prod.outlook.com
 (2603:10b6:303:81::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5926:EE_
X-MS-Office365-Filtering-Correlation-Id: 38a7a4ba-2d13-4a2e-7218-08dd55ef3688
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVNhSmorTDZtOE05QXBhemhCTWpydnJ0SFRxTXNuTzN0MStQKy94dWJKeDhI?=
 =?utf-8?B?RGo5b3pkN1A5UjNOUWRVaXVDcHE4azIrVzRzaG5CdXhPb20wVEVweEd3VXZE?=
 =?utf-8?B?SFR5OWl0Z0pkeGFpVVRMeE1RQ2laRVU5SUxrcHpiQXJXdkxlalFmdGFTSGRS?=
 =?utf-8?B?eG91UHYwTWEraWVHTlRzVGFCUXY3LzhTcVRGOUh4THVYcStYUlIrZGZTUFdv?=
 =?utf-8?B?MDg1dHF1UXd6andCekhwZzZSbGtjYjRvbTJ3MUFTL1RNUlB0RFpxZDFJeDdQ?=
 =?utf-8?B?MElTWHlhWXlVZ21ETGVaVUJPNmN3aUNtUHFpc21MZ290ZzZpd3g5MkZLcWEy?=
 =?utf-8?B?bmlaKzNuRnAzSU0vdnIwMi9Od0t4aE5xV0wwSGl4c0NWR0hsQ3ZtWXhqNmJz?=
 =?utf-8?B?VG1nRElPcmRkU0FOWmxSeWdhNStCZm5DSW95OG5pemZVejkyR2YxZlFuK2xX?=
 =?utf-8?B?Q3ZyZlIwWDJYZ0hPR2pERUkvU1gvVXpGOGcxVzF5bytqVTFVNHJsWWZQYW5C?=
 =?utf-8?B?U1NkYlhXQ2VrQ0NhZ1NnQzlkMEdYaHhiajRwd1V3WXQ2d29ScTVkK21DbXdE?=
 =?utf-8?B?ekJ5Wml6Rk5Ub0d2NGJLdGRVbTNyenFOYWlhRTBqQTIxQlJJMVhjSm1jVDEz?=
 =?utf-8?B?blFiM0VkdWpVVzEyc0hiMXJEd0xTYzFaWWRFc3F2TlRFdWZZQ1orRXY3U21i?=
 =?utf-8?B?SE05eSs4c2JJWjl4ZmRYVkpwcVF1OGZZWEptUTVoaytTL1BQK25IVlNSZXdP?=
 =?utf-8?B?cVk0M0hiZnN2cjFMZlp4T2ZpOG1kUTBGOHdxMHFsQTJMYlBYWVl1TU4wN3JG?=
 =?utf-8?B?aTE1MDRBakEyMEwzVnZ4ZkhiTkJJK2F5TUY3M0FTSDhkcXFvYUU4aUg2d3Vu?=
 =?utf-8?B?emNMVWlON3NuMWY5b2pDMXQ4RmdvREZDRzVNMDRWWDR3NGtENHcxOE5XMCtM?=
 =?utf-8?B?QnlWdWhsQUVhQ3lQSnVUc3pCandtb1BJeUdLR0RpNDVabng2TnZNNTBTUE1X?=
 =?utf-8?B?U3pYZlVqb0FFT0JnNTFGb2Q5d3NiRE4vSkczcktWcnA5blFhS2lkTmxFNFJB?=
 =?utf-8?B?N05pR0dONWpRM2NIU2RGVjFiRUh1czV4OURjS0t1TVFOTjQza3h0R2JTYlpH?=
 =?utf-8?B?VEtpajkvQkFoOWw2QkxWd1ZXcWhUeEkxajM4VmtKbTdVUkhsSE9Ud1lBN2RD?=
 =?utf-8?B?M3JJV085aXdQR1lDbGtiWTlsWlVnUUR2cFk5VW12cHpEUVdGUmpmdFh1TXdE?=
 =?utf-8?B?VDR1MTQ4SmI5aGRHK0VpTVhWTm5mNGtxOVdPTkFWM3ZFTGQxSnpiRWlFWkJ3?=
 =?utf-8?B?RnlLMmxYQ1B0cW5OZXVkcC9Vb3NsVjN2em1ya2MzbzI3N1pkdzZpMG5VVGM4?=
 =?utf-8?B?RkduMWtQVUlZZk9pc1JweEpVSk9EVTdoWWdEQU1TZEZsYXdkdllnOHNxcGVR?=
 =?utf-8?B?djQyeVlROHBWWkh5Q1JrbTlveFJ0ZW9QV3EyZ3pLT0lBeGlBaGdCbFByYURY?=
 =?utf-8?B?aDNuSW1vMUlTd0VNNnVidjdPQWNmcFV0cVBzUkNmanFMbEh1aWtCWnhNekE2?=
 =?utf-8?B?TDQ5bWlqa3FiV3RaL0RxK3dKclN6YW83VjZQbmIrTWtIMlpsSGpza2poeWk4?=
 =?utf-8?B?aDZnbk5WazZZWDMwUGFUS1VpblpucW93NUhyL1pDdENHb0NNbWZhekNPUTZm?=
 =?utf-8?B?QW9HNjhmUng1SGVDU0lxSkNMSkp4VlJweFJ5S2kvbHJZMzFDQXFqRTFWZytw?=
 =?utf-8?B?WFcvREg1aklrUk93a0pheEV5N0VIK3JIUzhMb2k3U3c2UGYwOFU1QW52RVRm?=
 =?utf-8?B?K2QwenpQWEt1eDFFRDFpMG5zTytZd3pqSnJUMTViYkxrM3NSdUVacXhHRDVO?=
 =?utf-8?Q?vK2bbyK8eJepQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1BSQWtMRHlIenBVTGI2bWpHOVBnaVlYa21jNmRxODZJa2pEeEd5emtMRGkr?=
 =?utf-8?B?djNWa3R6U2l5aWpta1ZVaTRsNkwyZWxnNHhNWUZDYTA4c0EyTEJyY282V2t0?=
 =?utf-8?B?S1NjVG40VVZWaTJha2RPRHp5ZVFrdmJZcXF6YzV0ZzcrMHhFSWhhTStQeUhI?=
 =?utf-8?B?RElELzNwT3FXZHlYejB0MHdQcy9pME1WYzFwdTVYVzlVYmNlQ0lnOHZjRFVO?=
 =?utf-8?B?OWVMbVZjM3gyNldMSVc4V2Nqa0F4S3laT1lpQUtXS05LaGZuL0ZlRGE5b2w4?=
 =?utf-8?B?V2crMjBWT0sxbXVuUDlyb1RvTlloK011aUV6aDM4cDMwMGVMT0pSQ1dSZEp5?=
 =?utf-8?B?UC9INVE0NU9kNlppWGZSdWk3eUdvMVd1U3hERHRIM0N3THRsdExwaHhqMUFz?=
 =?utf-8?B?MlJtanFxWnpoL0M2KzFlYmpPOUlsRHlZNXVFZTdma2dkYm51VWtxTDFObUtV?=
 =?utf-8?B?WFUxYllTb0FuNmhVN0pIY0Z2dU5yMFd3WGd3SlRGZlhMZlRmT2RqN2MvU2R2?=
 =?utf-8?B?SVJaSGhVVTRXMzdKQjMxOWxieWNRVmJILzE1Q0ZyMkxNMmROT0N3NWFzYXRI?=
 =?utf-8?B?eEdRNlArbUUvazhJTjM1T01TS0dzNlRYTHU3V3IwOWhMRXJUUG54VWFsUDBG?=
 =?utf-8?B?ZWxadDZZU0NYOW9xMmhZc1Bxd1l0b0VNakF5RGhvbXpqU1JTVkRnYnZsd2Fz?=
 =?utf-8?B?U2tFeXdGTWQ1a0lWTnlRc3lBU3dBbFJrM3JmeGV5YjNkalIwMUxzQ0hSTkRW?=
 =?utf-8?B?S0VXSFVPbXhGdmNTaGZzY0ZHbHkyOFBtZVA5MTIwRkFTZWxKcWZoUkdDS2J2?=
 =?utf-8?B?MEtzQ20xQ0VOWW9mc1FDRDZOTkhzMzFyUHhaSjRuNXdWSFpQZUdyQXVMTzBI?=
 =?utf-8?B?N0ZvOFNSdjAxTUhNOVdwRW9sbVBGbEsraCt4UTBac3JKMWFkcGk1cmRGZHBu?=
 =?utf-8?B?ZCtqcGlwV1BwRU9qQ0JhL2JtVkgvRDN6a2F2eC9YcHM3S01sQnB2NVRLV3hr?=
 =?utf-8?B?QnFmN3VzQ1VMRnRxUkZmWnVuMEFVZmhzcFVIaUU3MjQ1RWJLU0JqMFJLSlJl?=
 =?utf-8?B?RnpsazNIaDROS1JSQ3VoMWJKNnd1bXpjdmVENEdJYWpxVDhTZGFmQ2Mza3JB?=
 =?utf-8?B?aFV0cUtLdEpYU2ZIRCtuMGhBTGpPN1ZMWEVVVys4NWwrWXZOZHM1NUNJQkZ2?=
 =?utf-8?B?SnBQMkx5RWVhelk1TUVRYmpiOVlRZ0xYd0tTV2M3eGh2Z3hBYXp6MDAwVGoy?=
 =?utf-8?B?eEFhU1pHNG16dnhvVC9qR0VHWHV5dnQ1Q2xFOFpJWm1zUmhGdUJnUWZQbDFx?=
 =?utf-8?B?NDZ0WU9WVWY1WUxIVWtGOTh5OVlZTDV2Sk1URW9kcWo0YWtoZVdRdTNsdGI3?=
 =?utf-8?B?aUR1V2tpMmg0SURLcGczZzk5bnJvd0JUYmxuUEFLTnZldGYyQXV1aFhneUp5?=
 =?utf-8?B?TEZndUVqSnp4L0ViNzVZUEtTMzc1anJqcTRwZUsvZ3JmbjRZS1VYL0pBSHBE?=
 =?utf-8?B?VVdITTB0dU9ONEEvNTVESWtzZCsxUXAraGpQMlBFZHMxcXJSOXhBaWU4NldK?=
 =?utf-8?B?MkNjNzVEbS8rWHNTSHViREQwQzc3M0pDcTJ0dE1xa3JOdU9FMjhPZHB4blBM?=
 =?utf-8?B?T2NNN21abURjRzdrc2h0OVVOZ2xUWnIwVndUeU1JRnFwS3pjdDlnbGpUTG45?=
 =?utf-8?B?czRKeGVoUWMxbk9HRzNOaURxeGtFSVpST3JtVjcwMElJVmZuZkp0YUtsNU5j?=
 =?utf-8?B?M0wxYUNWcEptZytIS2h6VEcyOTdJT2EvWnh1YzhWL0ZjSnZvMlV0dHduN2FS?=
 =?utf-8?B?eHNQc3dRa0h3MTdlQ0dwS2Y0U0lKZU9GOVJCdU5mc0hlN0hCZGdmVFgxUGdZ?=
 =?utf-8?B?MVo4MDJtaXg4Y093eTJrc3IybjI4c0JOUUdsbW8ySjErZGdhaGFLSCtUaWJF?=
 =?utf-8?B?b1AzOXA2TllWTVJ0L240TlppVGFvSW5RbDEzTG8yS0FzUG9QVUsrRkpSZ0tm?=
 =?utf-8?B?MHl5RE1YZER5NFdBY2dIT2dBbkFpcDhlN0MyTkxVb3F1WDFOeHIvTjBaTGFH?=
 =?utf-8?B?NmM3dnZ5SmhwcXRESC91WGFKTnpIWks1bVd1ZGFsdFExR0FBcTE3M09ZQkov?=
 =?utf-8?B?SC9sMURXSWlWNkpQQTVKVGgrSVQ0enV1V0EwM042Q094M2NjNWtKTnZobGZa?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a7a4ba-2d13-4a2e-7218-08dd55ef3688
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 22:53:25.9061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XdVYGxDL586EmMQsCjCwv+BRpy6QUc0vBcdXFp+mCNwmOsPuHnP1QIabGo2ppQPxA4b8mOFqo0Q6Ezu/4OBYfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5926
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

On Wed, Feb 12, 2025 at 09:23:30PM -0500, Oak Zeng wrote:
> When a vm runs under fault mode, if scratch page is enabled, we need
> to clear the scratch page mapping on vm_bind for the vm_bind address
> range. Under fault mode, we depend on recoverable page fault to
> establish mapping in page table. If scratch page is not cleared, GPU
> access of address won't cause page fault because it always hits the
> existing scratch page mapping.
> 
> When vm_bind with IMMEDIATE flag, there is no need of clearing as
> immediate bind can overwrite the scratch page mapping.
> 
> So far only is xe2 and xe3 products are allowed to enable scratch page
> under fault mode. On other platform we don't allow scratch page under
> fault mode, so no need of such clearing.
> 
> v2: Rework vm_bind pipeline to clear scratch page mapping. This is similar
> to a map operation, with the exception that PTEs are cleared instead of
> pointing to valid physical pages. (Matt, Thomas)
> 
> TLB invalidation is needed after clear scratch page mapping as larger
> scratch page mapping could be backed by physical page and cached in
> TLB. (Matt, Thomas)
> 
> v3: Fix the case of clearing huge pte (Thomas)
> 
> Improve commit message (Thomas)
> 
> v4: TLB invalidation on all LR cases, not only the clear on bind
> cases (Thomas)
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c       | 53 ++++++++++++++++++++++++--------
>  drivers/gpu/drm/xe/xe_pt_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_vm.c       | 29 ++++++++++++++---
>  drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
>  4 files changed, 70 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 1ddcc7e79a93..319769056893 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -268,6 +268,8 @@ struct xe_pt_stage_bind_walk {
>  	 * granularity.
>  	 */
>  	bool needs_64K;
> +	/* @clear_pt: clear page table entries during the bind walk */
> +	bool clear_pt;
>  	/**
>  	 * @vma: VMA being mapped
>  	 */
> @@ -415,6 +417,10 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
>  	if (xe_vma_is_null(xe_walk->vma))
>  		return true;
>  
> +	/* if we are clearing page table, no dma addresses*/
> +	if (xe_walk->clear_pt)
> +		return true;
> +
>  	/* Is the DMA address huge PTE size aligned? */
>  	size = next - addr;
>  	dma = addr - xe_walk->va_curs_start + xe_res_dma(xe_walk->curs);
> @@ -497,16 +503,19 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  
>  		XE_WARN_ON(xe_walk->va_curs_start != addr);
>  
> -		pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
> -						 xe_res_dma(curs) + xe_walk->dma_offset,
> -						 xe_walk->vma, pat_index, level);
> +		pte = vm->pt_ops->pte_encode_vma(is_null || xe_walk->clear_pt ?

The alignment is wrong now, and the flow control is also strange.

You check xe_walk->clear_pt as an argument and then check it again
later, which overrides the result of the function.

A possible fix could be:

if (xe_walk->clear_pt)
	pte = 0;
else
	pte = vm->pt_ops->pte_encode_vma(...

> +				0 : xe_res_dma(curs) + xe_walk->dma_offset,
> +				xe_walk->vma, pat_index, level);
>  		pte |= xe_walk->default_pte;
>  
> +		if (xe_walk->clear_pt)
> +			pte = 0;
> +
>  		/*
>  		 * Set the XE_PTE_PS64 hint if possible, otherwise if
>  		 * this device *requires* 64K PTE size for VRAM, fail.
>  		 */
> -		if (level == 0 && !xe_parent->is_compact) {
> +		if (level == 0 && !xe_parent->is_compact && !xe_walk->clear_pt) {
>  			if (xe_pt_is_pte_ps64K(addr, next, xe_walk)) {
>  				xe_walk->vma->gpuva.flags |= XE_VMA_PTE_64K;
>  				pte |= XE_PTE_PS64;
> @@ -519,7 +528,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  		if (unlikely(ret))
>  			return ret;
>  
> -		if (!is_null)
> +		if (!is_null && !xe_walk->clear_pt)
>  			xe_res_next(curs, next - addr);
>  		xe_walk->va_curs_start = next;
>  		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K << level);
> @@ -589,6 +598,7 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
>   * @vma: The vma indicating the address range.
>   * @entries: Storage for the update entries used for connecting the tree to
>   * the main tree at commit time.
> + * @clear_pt: Clear the page table entries.
>   * @num_entries: On output contains the number of @entries used.
>   *
>   * This function builds a disconnected page-table tree for a given address
> @@ -602,7 +612,8 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
>   */
>  static int
>  xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> -		 struct xe_vm_pgtable_update *entries, u32 *num_entries)
> +		 struct xe_vm_pgtable_update *entries,
> +		 bool clear_pt, u32 *num_entries)
>  {
>  	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_bo *bo = xe_vma_bo(vma);
> @@ -622,10 +633,19 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  		.vma = vma,
>  		.wupd.entries = entries,
>  		.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAG_64K) && is_devmem,
> +		.clear_pt = clear_pt,
>  	};
>  	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
>  	int ret;
>  
> +	if (clear_pt) {
> +		ret = xe_pt_walk_range(&pt->base, pt->level, xe_vma_start(vma),
> +				       xe_vma_end(vma), &xe_walk.base);
> +
> +		*num_entries = xe_walk.wupd.num_used_entries;
> +		return ret;

If possible, avoid short-circuiting this function and instead call
xe_pt_walk_range only once. Perhaps use a goto or conditionally skip the
statements below that cause a NULL pointer dereference.

> +	}
> +
>  	/**
>  	 * Default atomic expectations for different allocation scenarios are as follows:
>  	 *
> @@ -981,12 +1001,14 @@ static void xe_pt_free_bind(struct xe_vm_pgtable_update *entries,
>  
>  static int
>  xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
> -		   struct xe_vm_pgtable_update *entries, u32 *num_entries)
> +		   struct xe_vm_pgtable_update *entries,
> +		   bool invalidate_on_bind, u32 *num_entries)

I’d avoid using a bool if possible (one bool is meh, but two are
definitely a no-go). However, if you do add a bool, I’d place it as the
last argument.

>  {
>  	int err;
>  
>  	*num_entries = 0;
> -	err = xe_pt_stage_bind(tile, vma, entries, num_entries);
> +	err = xe_pt_stage_bind(tile, vma, entries, invalidate_on_bind,
> +			       num_entries);
>  	if (!err)
>  		xe_tile_assert(tile, *num_entries);
>  
> @@ -1661,6 +1683,7 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
>  		return err;
>  
>  	err = xe_pt_prepare_bind(tile, vma, pt_op->entries,
> +				 pt_update_ops->invalidate_on_bind,

See below — I think this needs to be wired in from op->map.invalidate_on_bind.

>  				 &pt_op->num_entries);
>  	if (!err) {
>  		xe_tile_assert(tile, pt_op->num_entries <=
> @@ -1681,11 +1704,11 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
>  		 * If !rebind, and scratch enabled VMs, there is a chance the scratch
>  		 * PTE is already cached in the TLB so it needs to be invalidated.
>  		 * On !LR VMs this is done in the ring ops preceding a batch, but on
> -		 * non-faulting LR, in particular on user-space batch buffer chaining,
> -		 * it needs to be done here.
> +		 * LR, in particular on user-space batch buffer chaining, it needs to
> +		 * be done here.
>  		 */
>  		if ((!pt_op->rebind && xe_vm_has_scratch(vm) &&
> -		     xe_vm_in_preempt_fence_mode(vm)))
> +		     xe_vm_in_lr_mode(vm)))
>  			pt_update_ops->needs_invalidation = true;
>  		else if (pt_op->rebind && !xe_vm_in_lr_mode(vm))
>  			/* We bump also if batch_invalidate_tlb is true */
> @@ -1759,9 +1782,13 @@ static int op_prepare(struct xe_vm *vm,
>  
>  	switch (op->base.op) {
>  	case DRM_GPUVA_OP_MAP:
> -		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> +		if (!op->map.immediate && xe_vm_in_fault_mode(vm) &&
> +		    !op->map.invalidate_on_bind)
>  			break;
>  
> +		if (op->map.invalidate_on_bind)
> +			pt_update_ops->invalidate_on_bind = true;

Wrong place, see below.

> +
>  		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma);
>  		pt_update_ops->wait_vm_kernel = true;
>  		break;
> @@ -1871,6 +1898,8 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>  	}
>  	vma->tile_present |= BIT(tile->id);
>  	vma->tile_staged &= ~BIT(tile->id);
> +	if (pt_update_ops->invalidate_on_bind)

I think you need to wire in op->map.invalidate_on_bind here. See below
again.

> +		vma->tile_invalidated |= BIT(tile->id);
>  	if (xe_vma_is_userptr(vma)) {
>  		lockdep_assert_held_read(&vm->userptr.notifier_lock);
>  		to_userptr_vma(vma)->userptr.initial_bind = true;
> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
> index 384cc04de719..3d0aa2a5102e 100644
> --- a/drivers/gpu/drm/xe/xe_pt_types.h
> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> @@ -108,6 +108,8 @@ struct xe_vm_pgtable_update_ops {
>  	bool needs_userptr_lock;
>  	/** @needs_invalidation: Needs invalidation */
>  	bool needs_invalidation;
> +	/** @invalidate_on_bind: Invalidate the range before bind */
> +	bool invalidate_on_bind;

This is the wrong place for this. It is a collection of
xe_vm_pgtable_update_op, and each individual xe_vm_pgtable_update_op
should set or clear invalidate_on_bind. I think you can wire this
directly from op->map.invalidate_on_bind in all cases without needing to
store it.

>  	/**
>  	 * @wait_vm_bookkeep: PT operations need to wait until VM is idle
>  	 * (bookkeep dma-resv slots are idle) and stage all future VM activity
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d664f2e418b2..813d893d9b63 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1921,6 +1921,23 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
>  }
>  #endif
>  
> +static bool __xe_vm_needs_clear_scratch_pages(struct xe_vm *vm, u32 bind_flags)
> +{
> +	if (!xe_vm_in_fault_mode(vm))
> +		return false;
> +
> +	if (!NEEDS_SCRATCH(vm->xe))

As mentioned in other patches, I'd drop this macro.

Matt

> +		return false;
> +
> +	if (!xe_vm_has_scratch(vm))
> +		return false;
> +
> +	if (bind_flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE)
> +		return false;
> +
> +	return true;
> +}
> +
>  /*
>   * Create operations list from IOCTL arguments, setup operations fields so parse
>   * and commit steps are decoupled from IOCTL arguments. This step can fail.
> @@ -1991,6 +2008,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
>  			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
>  			op->map.pat_index = pat_index;
> +			op->map.invalidate_on_bind =
> +				__xe_vm_needs_clear_scratch_pages(vm, flags);
>  		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
>  			op->prefetch.region = prefetch_region;
>  		}
> @@ -2188,7 +2207,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  				return PTR_ERR(vma);
>  
>  			op->map.vma = vma;
> -			if (op->map.immediate || !xe_vm_in_fault_mode(vm))
> +			if (op->map.immediate || !xe_vm_in_fault_mode(vm) ||
> +			    op->map.invalidate_on_bind)
>  				xe_vma_ops_incr_pt_update_ops(vops,
>  							      op->tile_mask);
>  			break;
> @@ -2416,9 +2436,10 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  
>  	switch (op->base.op) {
>  	case DRM_GPUVA_OP_MAP:
> -		err = vma_lock_and_validate(exec, op->map.vma,
> -					    !xe_vm_in_fault_mode(vm) ||
> -					    op->map.immediate);
> +		if (!op->map.invalidate_on_bind)
> +			err = vma_lock_and_validate(exec, op->map.vma,
> +						    !xe_vm_in_fault_mode(vm) ||
> +						    op->map.immediate);
>  		break;
>  	case DRM_GPUVA_OP_REMAP:
>  		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 52467b9b5348..dace04f4ea5e 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -297,6 +297,8 @@ struct xe_vma_op_map {
>  	bool is_null;
>  	/** @dumpable: whether BO is dumped on GPU hang */
>  	bool dumpable;
> +	/** @invalidate: invalidate the VMA before bind */
> +	bool invalidate_on_bind;
>  	/** @pat_index: The pat index to use for this operation. */
>  	u16 pat_index;
>  };
> -- 
> 2.26.3
> 
