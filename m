Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA5DE77180
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 20:07:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B8610E146;
	Thu, 12 Dec 2024 20:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JY+UtMHs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9597610E146
 for <Intel-Xe@lists.freedesktop.org>; Thu, 12 Dec 2024 20:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734034037; x=1765570037;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MyIwbADZJsqdzf1yzTOZB3mxUHKcENCHpBdR8zWZhj8=;
 b=JY+UtMHsa8nVR8NvuHiBl3zkqfahHih/NafS0+9JXFxXml5eIbW9PuKa
 52z+zI/622eqwqMigVZCEo2Nu+072jVGGnQYsnw2RsGF0munPBaJ4FhqD
 ESV3nb2csWAr+t2QhiGk8YXY2UAxmRf2rMk8e5F6AmKfiqBNctEDsaiVk
 nz0qJ7NmW77R9WuxjOh9q+GGcL6ma15czuhCmJ4DgW6EUHDmwOok220zR
 JoPnCHq7mxhg/tMI2z5X4QkmbpigtEJh4TTH8ePMVCAEgaspFEy9lNjHw
 2fpiAnfIadilqtKvwTk4wQAEsX36Odi43pPWKaxJQEuGPpdU0xAvK7NMK w==;
X-CSE-ConnectionGUID: +NuIYNCDSPaZr1Ybmf1tTQ==
X-CSE-MsgGUID: +QvJXkzgTgC/JRo4bm/uFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45857765"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="45857765"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 12:07:17 -0800
X-CSE-ConnectionGUID: Ck0nmV4jQVWUTAQsrFHSSQ==
X-CSE-MsgGUID: yVrLNWJISgSr8d96hFWRSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="100908818"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 12:07:17 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 12:07:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 12:07:16 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Dec 2024 12:07:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rd4qs1upNJUySQGHkzEeJtgWboSZfpb1+FSrQ64b2UiKE1WOzZQNh9QWmnvL+QNVn3mcq82uOnHbP+MoCszrBFJ38uRU4B13WetPL5jewpCPvYnPqxoI12m+cULW2e+dNtkRPvQ3qZ+H5uZVgvZZh+q97IMKXylrzV7Quhn1UABrXmL2QVq5hilNfo4yvAxbyvR6rwpfUYbecvhb0WnFEgdh6+DAuox4jlazFgMc0LlFMpZq26JAx4ZWZV1ZTX9OCLR5XvOIaKFVBqEgPo9HtfyQamTQMbnX0CVjRJZwqzMTtT3cxAlFHBTfIrtYR9qje0WhSeGxO3xQ7oDAIhccnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQlt64SZ88idr01NCFnqWUu1M0JKtWfW5utj3grH8oQ=;
 b=JeA3ewkhN9CLCB5dtpJIr9WTyRmAfp8UYBqE7WGovVJuQtB+4qHjJaX7cxdiTYwBxDPM9OnTQbvjdAolgL0gqwcnte8+eKvn29RDYzf2nt3WX5MltzFQcr5VDiOvZcHdRaMz24MssvulQQfbAtEV38LCThAtuv/n8c9XxDc7jPH4i4PmsRYR6+KKa6t7hCQrvENblw+6bZVgWXeNCt7FGoxqqJjgJ3XFu1lfEqDJrRXMCEsgiTA5eSa2tfCFv2k9xKvJY6AIEYsFxJFpxOn6+qa7oaJF5X43Lb3ewfEgi17jnCGL/iw+KLKcADPo/ihcqAtq2rbm2ZBcF/chfB7eOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by IA0PR11MB7750.namprd11.prod.outlook.com (2603:10b6:208:442::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 20:06:32 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 20:06:32 +0000
Message-ID: <ea46ec11-b7a5-4103-8fdb-493e2489a688@intel.com>
Date: Thu, 12 Dec 2024 12:06:27 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 03/11] drm/xe/devcoredump: Improve section headings and
 add tile info
To: "Souza, Jose" <jose.souza@intel.com>, "Intel-Xe@Lists.FreeDesktop.Org"
 <Intel-Xe@Lists.FreeDesktop.Org>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "Filipchuk, Julia" <julia.filipchuk@intel.com>
References: <20241003004611.2323493-1-John.C.Harrison@Intel.com>
 <20241003004611.2323493-4-John.C.Harrison@Intel.com>
 <ca2978d748368f37e0fd29fd65b059c52b1b755f.camel@intel.com>
 <1cd79769-73cc-4b4b-bac6-c03e6aec0d69@intel.com>
 <0825f33b47eaddf533bb378325b89202a43e34f3.camel@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <0825f33b47eaddf533bb378325b89202a43e34f3.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0057.namprd03.prod.outlook.com
 (2603:10b6:303:8e::32) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|IA0PR11MB7750:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a84c78b-74a2-4056-4c3d-08dd1ae878ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bk9LVW5HaXQzL2tMeHRXbzEwQXEwZmRLbjYrenYrZ3YvcUZWNTIrTHBVL0xp?=
 =?utf-8?B?cEFqeThWaVNmM1ZMRHdvSy8xSS91c2JTQkIwazlOZXVJVDJSVUNVUThwL0ZI?=
 =?utf-8?B?TXJTUm5nQk5KNkZhM0RmcFYvUVB6c2hSWkY2L3JjSGp1Y2RtWkFhVGhaVjFu?=
 =?utf-8?B?ZHlXVGZJTHVVSld6TjV2REZySzE4RmJFS1FsQVVmdEdmTzRoNm0rYVU0WDI2?=
 =?utf-8?B?VDBRQUJzQ2QyUHY0ZWdHM2ZCS2N5bUNSM1NjazhuUTE4Q1YrdWM4ckgyU3Zl?=
 =?utf-8?B?UFd2NjNuSDdaTEVXb3VBbHJ5SG1DakVYSC90S2FKWXBvVVZxZ2pQVjJqVmI4?=
 =?utf-8?B?blNqUmRpdlh6M3c2S05XeUwrYk1Ja0ZENms5OUlvYXRnUUhNNFNEak5adzRy?=
 =?utf-8?B?Z1M3QllhNGhMbW52NUs4ZFRoc2lCclJoT2lIcDBjT1c2cG5iSDFkUVo3M3l5?=
 =?utf-8?B?NDhIaHNmVjdaYnlMWFJYRDNOMndGbDQ4TGF2YktzTlhhWUxzNDZTMzdjTWZv?=
 =?utf-8?B?MVkwbll3MXVWZitjOEdrZS9QZGIzalA5WjdhTi8rMHBnUDBLK3FqQ2V6WlJK?=
 =?utf-8?B?SVl3YUNaVHRMMlJxdTFIcTcxTE4zbHE0aUwzWjNHMm9uRjg0V1NJdVN6TUZu?=
 =?utf-8?B?L0hLL0VwbVBzNFlGeDA1ZENVSHlvZTJwMEp5U0U1RHk2OG80NW5tdjVSS2h4?=
 =?utf-8?B?UkJocVBzNDBDdFpDY3JmWmpUbUFwR3VMWEFGZkJqSDliWFFUUW5rWnhJb3F5?=
 =?utf-8?B?cXNYUnZDdmI2S1h5eSt3TXNLSWFJbUFiV3NDUDBPMUo1S0dnbHQ2Z0FXdUhG?=
 =?utf-8?B?LzJyOEo2RWlmYUVGaHQ5aTdxb1B5NVJlMHZlQWl6T0RoUHVsME1taGFlQ055?=
 =?utf-8?B?NFBScW1TOXR6aWtsRkkxc3p5amt5cldKSkRrc0IreS9qczUzUldRNCs5L2p0?=
 =?utf-8?B?c0VsYTNBOW5WdW9xb0ZPSTh4L0ZxUUVHSlZRakRjZVpuYkd4bmtVeWZ4QUND?=
 =?utf-8?B?ZWZoU0VlbURhTGZLVHUzVFFaeWRES1F2TnFYQlExUm9xdFpFZXlUYkxjaFNs?=
 =?utf-8?B?c1BkeGRaQ2FaV0pIRSt5TThubFdQdnlOakgvaHFNSUJtS2dnU2FYdzBXaTFn?=
 =?utf-8?B?TElQdkVjQzdnVmdTUDlpR2dvM0UzRTdPZkE0QnZTMXRVaU9tWndJTmMzbitZ?=
 =?utf-8?B?OE9nWG9tSVUydnM5TVJaMTVYZ2VxR3AvRFB1NDNFSXZ3Ny9XTHV3dlFmUkcv?=
 =?utf-8?B?UHJLakJSYVpLNW04TzFHMWlNUjdkZ3ZQWm1tUGh2bVNLbUs1SDFKUjZzdmcw?=
 =?utf-8?B?cW9MMGhUVlhyZHVqbkcxcjc1MmpKZi9pZTlQYlB4b3ZMbm5iSXhFU2ZUelVr?=
 =?utf-8?B?YlJTWElGQVduZjFlWmV2c0ljRXIrVHJxbU5oeWxvTG0zL0JJNVRyeFZPa3Ew?=
 =?utf-8?B?S2RBbURWSkdVUlJaODJiSGl0VmJpM3N3Z2FYM3YvZURUOVl4WC8xcStZRGhz?=
 =?utf-8?B?SG03c0dpZG5Mb2E4aENFWEx5VEpqZnZ1bU1nU05aY2hTZHorc0FuRVVBQmRQ?=
 =?utf-8?B?NkMvQ1RXTWlDb0hybVYzRUVJTzNUWHBZcWtncy9OVDZmeEpRRTBYVS9IYk9P?=
 =?utf-8?B?dTRLVHJKM1ptYUtQbzM3TTVsZTloOUlKVGJSZis1N2xuVU0xN2paSTh2dGMz?=
 =?utf-8?B?SHRZKzVITG41Z29tbk0yMFpwUndOVUNLR1I4VmdTZXdRbmlEZjlHOURVWm9T?=
 =?utf-8?B?R2RRK2JWNUpwSVJXbVhnRzMydVl4aExab1Z5b2JPM3VVZGxJN25UWXMxUmtD?=
 =?utf-8?B?NzlDRXJpbU5CYXVOaDFYZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0R2bkdnczNTSmgxaHJUVkJPVUdWVUo0QVhzaFBOTnpPR2J5VmlDQzNvRWlV?=
 =?utf-8?B?SXlUNkUzNWI4M0R3YnhsRHlRYk9mSUwxOERZdEo1TzdSSzEzQXIrR25kRXcx?=
 =?utf-8?B?VnNDQzlqbGtmOU5zV1JQaEl5UGIwRWpmQjF2VXNYNk9jdDZMdnRabW8zamhZ?=
 =?utf-8?B?UlVERHRTeHFnSGV2RmNpeUVMdXN4bGp6a1dadXh6UFF0ZVJwNEcwQ1NoeHJj?=
 =?utf-8?B?S1RENUNEdXJvcDNXK2wySFV3NXV1RFpXK0hLQVRzS3JMb1A4ekxIZG9VUkJG?=
 =?utf-8?B?ZXBUYy9maWIvL05pSTdOYk83UHJLVENzb3c3TmxNN0MxTTZucmd0NGJFdEdM?=
 =?utf-8?B?b1hTbzJkM0ZhV0RWMEZ2bTNtMlJDVGhBSXcxdFFJK2x5d2VUTGxIODlpYSt6?=
 =?utf-8?B?MkNmNTVvUDZueFNJZzVzcGcxbFhqTGg5SkgvRzFpWUxudU0zQnNHUGZJSUdY?=
 =?utf-8?B?dkxoSXFxMlpGUVBHZDI5MDJRcWs3UHMzdThvcDNaK0FVRVhJdUs0V0V4cXEr?=
 =?utf-8?B?M0hlYXdIOHdQWHZ5aDlNcEY5T3ZWaGc3azd2TnFuTy9IWTZORjhBN3c0a2Vu?=
 =?utf-8?B?NTYwUTB6N2hxVVp4K3BJTURmeG50TzB6TFl0VUEwd1h0VWNxcStxYStBa0Rw?=
 =?utf-8?B?S1p5Qm5qZE0zd2VOWGd4RFQyYUd5Mzh2QjlpcFYwMWNqMkRTc0E3QmJhZlBN?=
 =?utf-8?B?TGlEdG14T2Y5azdiQXpIajgyOENvTm9TK2Iwb2RNaUJrMCtmQ2d0dEJreENF?=
 =?utf-8?B?MmFmQ1BMTzdXUmpVMTllZVpRZ3QreDkydEsxU2UzMFhic2N6S3hoT0gvSHM3?=
 =?utf-8?B?YTNzTEZaT25MYk1reHpnSTlLaTJQaGZsVm9aR00rWElrRDBHUjgvbm9Jdjho?=
 =?utf-8?B?QzZ1STdKTDdUVDhRRit0YjBXTURucVhDQnU2YXJ5MzJMNytMT0lOdEVvNUwy?=
 =?utf-8?B?d0xueUdaVEVNbWhKUzRiSmRjNW0xUmJnT1k4bEVNRXJmSi9mWlREN1lSbG9z?=
 =?utf-8?B?eVlMdDhWQ2xyeTFqdnd1ditrNHoxR2VHOW5vdE1HdW9BVjgxT3hRZ3hzT1RS?=
 =?utf-8?B?N25PdTlQMk1RYk9IQjlrMzIxbU1MYXJUOUtFaHBQUUxqaVEycFdVU3RLMzht?=
 =?utf-8?B?R0tQOS9NRCtJR3pidURmMDFmeTNVL0R6aW5IL0hOOG1kOGFob1pRNWZDcnY1?=
 =?utf-8?B?eExxSmd0VmxhSDdnVjlEMW0xa1V1UkZSMStmYTgvVW8zNmU2dit4V1VUYnoy?=
 =?utf-8?B?bnZWR1V6TEVkbzFOdk1oUVZGRWNEeC9TK2poZ005NWRaMGpwdE9OSnp1QU52?=
 =?utf-8?B?WVhwSGpSd09WajVXeFJQZ2cvVG01TEJudWkzV1NUNzQ1STEwbW14V1VHM3RE?=
 =?utf-8?B?M0llQlJGa09aRDRSM0NmaFJKVDlqK21zbDhyMTNTZ0s0cEY5RTYyb1RIN0Vo?=
 =?utf-8?B?blA1VGg5MEV6TUM4Qm5oYklPU21GazRXTTJuWTQ2bmg2K1pobFhmbXVMVUxq?=
 =?utf-8?B?bnd6OURDelZVeTI0MDdkYXBLM3QrNU5LbHV0d2J1bjlIbm0vMS82Vm15NUhL?=
 =?utf-8?B?VkJWTTNqQVNZUEU0Z3BJU2cxdEkwQlJHMlRzd0UyUE9KVjV3cHQvMDBSQlZ3?=
 =?utf-8?B?YnM0T2hLUVZDcVIzQVlCSUdVVDBhSlZSNXExVFpxaEtxSGNaMklTT09GMHZh?=
 =?utf-8?B?b3ZEWmNZN3NxVlNRbjcvZGxMY3BqamFHbTUwUFI4VTlrNFdHL2htd3FlS2pT?=
 =?utf-8?B?eFFvRFBsRE9VVDVyWXVLRHlPWlZtOUJtYS91MkJIMjA0UVBLb1Q2ZXY5dVJu?=
 =?utf-8?B?WmlaV3lzdHpSOEo3WUxJY01rekNqNXMyUDI0SllpbGNlWnE5ek5VcTBLM2Yy?=
 =?utf-8?B?MHFVTE9kUHNiVGFoZENvUU9zSi8vVjc0NVovTWhwUE1hbWM2UTdlM3Zhc1RL?=
 =?utf-8?B?a0ZWcm1pZzZXQS9tR3F1eWI4d3Jmd21yRXFWL1hGMTZMeVVWSWhVeXRRUEdT?=
 =?utf-8?B?WXRMVCs1QnlseFdCVVg2YkhBckFyeDhuTXZZTkxualVPa3VOQy8xNnlEaC93?=
 =?utf-8?B?MnRkK0RCNVhaaW1MTHV5UFdhbmJiKzF5WmcrTVRsTUhaWCs1ZWoyZDNJMERa?=
 =?utf-8?B?dDRFZytOblFMalA0Q0hsMTB2ZnFZYWxpczFsd2VjYmpnbnMycmdDcG9TeHhT?=
 =?utf-8?B?d3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a84c78b-74a2-4056-4c3d-08dd1ae878ff
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 20:06:32.3198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3VHKxbcOWcf9GFGj2atRoNL/lSO9PKQJrQbVlHjdfKVB+8Cw6wySaUSoccA20CAnFhbQjstvnGod1Maz9No9rKKPXAeAFv4DBETzOj3X+94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7750
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

On 12/12/2024 11:31, Souza, Jose wrote:
> On Thu, 2024-12-12 at 10:59 -0800, John Harrison wrote:
>> On 12/12/2024 10:17, Souza, Jose wrote:
>>> On Wed, 2024-10-02 at 17:46 -0700, John.C.Harrison@Intel.com wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> The xe_guc_exec_queue_snapshot is not really a GuC internal thing and
>>>> is definitely not a GuC CT thing. So give it its own section heading.
>>>> The snapshot itself is really a capture of the submission backend's
>>>> internal state. Although all it currently prints out is the submission
>>>> contexts. So label it as 'Contexts'. If more general state is added
>>>> later then it could be change to 'Submission backend' or some such.
>>>>
>>>> Further, everything from the GuC CT section onwards is GT specific but
>>>> there was no indication of which GT it was related to (and that is
>>>> impossible to work out from the other fields that are given). So add a
>>>> GT section heading. Also include the tile id of the GT, because again
>>>> significant information.
>>>>
>>>> Lastly, drop a couple of unnecessary line feeds within sections.
>>>>
>>>> v2: Add GT section heading, add tile id to device section.
>>>>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>> Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_devcoredump.c       | 5 +++++
>>>>    drivers/gpu/drm/xe/xe_devcoredump_types.h | 3 ++-
>>>>    drivers/gpu/drm/xe/xe_device.c            | 1 +
>>>>    drivers/gpu/drm/xe/xe_guc_submit.c        | 2 +-
>>>>    drivers/gpu/drm/xe/xe_hw_engine.c         | 1 -
>>>>    5 files changed, 9 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>> index d23719d5c2a3..2690f1d1cde4 100644
>>>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>> @@ -96,8 +96,13 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
>>>>    	drm_printf(&p, "Process: %s\n", ss->process_name);
>>>>    	xe_device_snapshot_print(xe, &p);
>>>>    
>>>> +	drm_printf(&p, "\n**** GT #%d ****\n", ss->gt->info.id);
>>>> +	drm_printf(&p, "\tTile: %d\n", ss->gt->tile->id);
>>>> +
>>>>    	drm_puts(&p, "\n**** GuC CT ****\n");
>>>>    	xe_guc_ct_snapshot_print(ss->ct, &p);
>>>> +
>>>> +	drm_puts(&p, "\n**** Contexts ****\n");
>>>>    	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
>>> This broke Mesa parser!
>>> It can't now parse the exec_queue context because it was expected to be on the '**** GuC CT ****' section.
>> Then the mesa parse needs to be updated. That was clearly a bug - exec
>> queue contexts are absolutely not GuC CT data and should not be in the
>> GuC CT section.
> Don't matter if it is a bug or not, it broke the parser.
> If this is not reverted we will have older Kernel versions that don't work with newer Mesa and newer Kernel versions that don't with old Mesa.
Debug tools cannot count as UAPI that must never change.

The devcoredump contains much information that is essentially the 
internals of the kernel. It is going to change. That is about the only 
guarantee that we can make about it. And saying that we must 
intentionally break the output of a developer only debug feature in 
order to support older mesa is plain wrong. End users do not care about 
debug tools. All user applications will still work just perfectly.

We can start adding version numbers to the devcoredump format if we 
really need to. But that was already shot down as a bad idea. It is 
debug information and not UAPI. So version incompatibilities are 
expected from time to time.

John.


>
>> John.
>>
>>>>    
>>>>    	drm_puts(&p, "\n**** Job ****\n");
>>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>>>> index 440d05d77a5a..3cc2f095fdfb 100644
>>>> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
>>>> @@ -37,7 +37,8 @@ struct xe_devcoredump_snapshot {
>>>>    	/* GuC snapshots */
>>>>    	/** @ct: GuC CT snapshot */
>>>>    	struct xe_guc_ct_snapshot *ct;
>>>> -	/** @ge: Guc Engine snapshot */
>>>> +
>>>> +	/** @ge: GuC Submission Engine snapshot */
>>>>    	struct xe_guc_submit_exec_queue_snapshot *ge;
>>>>    
>>>>    	/** @hwe: HW Engine snapshot array */
>>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>>> index 09a7ad830e69..030cf703e970 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>>> @@ -961,6 +961,7 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p)
>>>>    
>>>>    	for_each_gt(gt, xe, id) {
>>>>    		drm_printf(p, "GT id: %u\n", id);
>>>> +		drm_printf(p, "\tTile: %u\n", gt->tile->id);
>>>>    		drm_printf(p, "\tType: %s\n",
>>>>    			   gt->info.type == XE_GT_TYPE_MAIN ? "main" : "media");
>>>>    		drm_printf(p, "\tIP ver: %u.%u.%u\n",
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>> index 0ac4a19ec9cc..8690df699170 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>> @@ -2240,7 +2240,7 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
>>>>    	if (!snapshot)
>>>>    		return;
>>>>    
>>>> -	drm_printf(p, "\nGuC ID: %d\n", snapshot->guc.id);
>>>> +	drm_printf(p, "GuC ID: %d\n", snapshot->guc.id);
>>>>    	drm_printf(p, "\tName: %s\n", snapshot->name);
>>>>    	drm_printf(p, "\tClass: %d\n", snapshot->class);
>>>>    	drm_printf(p, "\tLogical mask: 0x%x\n", snapshot->logical_mask);
>>>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>>>> index ea6d9ef7fab6..6c9c27304cdc 100644
>>>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>>>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>>>> @@ -1084,7 +1084,6 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
>>>>    	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
>>>>    		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
>>>>    			   snapshot->reg.rcu_mode);
>>>> -	drm_puts(p, "\n");
>>>>    }
>>>>    
>>>>    /**

