Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36753EE57CF
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 20:25:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F173810EA98;
	Wed, 11 Sep 2024 20:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TPB/L2+J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C38A10EA98
 for <Intel-Xe@lists.freedesktop.org>; Wed, 11 Sep 2024 20:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726086337; x=1757622337;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EHlc2XIV6K10o8MXssor7PU0cJe7FyHamekWWu3fmjw=;
 b=TPB/L2+JzxMHvyvy3v9jz3xNGcVK+u1LYJCUieH4enKAMxN0aOab3jJl
 L2TDEJNMLwRSgf/SGlF0vk94GuTyKOj23EiMnKmhOwut+y/gcw8e/6d7M
 3SYhS/Y8k0eAeLGMAtirnZ5hWhmlJLj/IVFy8Iub/MEAFcs0Py5gW2EnD
 2MLxlQXrojoNkKsvk1zrxbyxBGGp+CGoyIsQQJOvQ0Ol2HwuIpGdnbbmp
 gGkBrlDQiQ1Eo+2Xi8pcBEhvHzdoUxdz6m6NybPSQcNgzLcEyw2wTfY+w
 WZEPIAyxPgB4UPUrBeFIGpW7SiI0mjAZ+ohiLXkTA662BkLIVE1rGyEiP w==;
X-CSE-ConnectionGUID: TedMbS8mSsiKO9G4RIcRng==
X-CSE-MsgGUID: VXHVfgRtSmitKJHpRptGhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25069911"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="25069911"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 13:25:37 -0700
X-CSE-ConnectionGUID: MdGO3mNQSvm5/7Lkx0o4QQ==
X-CSE-MsgGUID: MybAPOh+Q0+Orpm1YJPFAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="67314533"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 13:25:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 13:25:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 13:25:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 13:25:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4ThYu7ADrnNTLYi0ywC7EQJSQqvVGGsnvRMAJlf4M4LaUMBBqOWLmvzJfF3iiAss/a8aSWmw2nguF3klj0LU0mjT74omNnWKf0n9YMvEgd8nVu845c3ehV+XXAB07T0CAko16L5qhi/dsmFyRa8ovMojHzBt+JVNYOygwpvqyA3JfJs2KwqlrOeTQzXlxWg4UkyRdEo1SdOwzIRYcHw2b2IPR+NQ8a8wZbMiZZV8Yj4QEYsGtL7OPNKkbyTX7lDPmN5FI/DqSy5THQ8D6QSsa7pu5BPBz12b1Q1PFFPw2b4+FA19bnzMqDDdUGQm/AC+8vFDQqcUarwb5oQ2O+Jjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHlc2XIV6K10o8MXssor7PU0cJe7FyHamekWWu3fmjw=;
 b=eY9BxV/khlcA49V8blAItoqktMfi6NA+hSBidyykWGsG+QeztOapVGr5zQZSTADiu1o5q3iGXGgcd+Mx4BSlt0By2C3e1LNEshXS73MvrEtg9/Xo/w1E0IRMLUAft54WW85uVRwnPdbfMtyOzE5lgdyRMJpdGfF9kD6Ay2uicGavPBd45vK0K4P31luoClcXjqVcO12aIQkrRIehp3fgF6VpzbX+y0+3ryFc7kn/a4saYvxV30x7DIoddcpOXEKBf5r5Z4gFRcnIh9w0RiMraIVcu/YC8KMJ/BtonBxngzPDMU7hyVAMlyrnDLawKgyOu+G9U5brXdUl21ZhM9g8cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by SA1PR11MB5801.namprd11.prod.outlook.com (2603:10b6:806:23d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 20:25:19 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%3]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 20:25:19 +0000
Message-ID: <a4057f8e-4ce4-4357-8485-bd8c7c7e6d84@intel.com>
Date: Wed, 11 Sep 2024 13:25:16 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/10] drm/xe/guc: Add GuC log to devcoredump captures
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
 <20240905205106.1063091-10-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20240905205106.1063091-10-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0344.namprd04.prod.outlook.com
 (2603:10b6:303:8a::19) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|SA1PR11MB5801:EE_
X-MS-Office365-Filtering-Correlation-Id: a46078e9-ea43-4592-fb6a-08dcd29fdac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3VkNW4rQzZrT0JWcUIrREovZWQzSDZCTzlMbjRYZEp0TGpuODVwbTZtd1p2?=
 =?utf-8?B?M2lxYVZCQkxhV1p3RThaanFtOHYyZHE4N1hGdHhETlZ4MXFSSGZpbU9ublR3?=
 =?utf-8?B?NVBiZVEvdGErczZPUEV1YWljS1ZjVXZNK0ZxM2pBQ01FMTBRWkt5aHB2ZVZl?=
 =?utf-8?B?Q2I5NVd4TFdINlUwRTdXUXYrT2FId01NSjY3alBWL0lPSTVCSWZRREZCSlZU?=
 =?utf-8?B?RmxId2RyL2JCSzZ1ZDB1b0ZyeUxBSEVvR3o4RURGNTlqcjZsVnQ0Y2xITGpv?=
 =?utf-8?B?eVFpZVFZaVFvcEFSLzc2ejFTd3NyUHVub2RZZzBjbFZTM1lvNG10Lyt5VDJF?=
 =?utf-8?B?TjlSTGFYd1VJSU1HNlJJOEpPL3lQZ2JzZk5CZWs5dC9ra004Q2l0d3FwL1VV?=
 =?utf-8?B?aCtuK05FakcyaUd0aE9qbGI1S0g1WEZLZjdZRWpFdlc4dlNlU243SDlkQVZ5?=
 =?utf-8?B?RHVhTHh4NGVPWFEzdmU3Q2NrWWRNU0hYZWI1TkJXdFFlYjhkZUhRcjhMODZW?=
 =?utf-8?B?UjducXVRTW5vc3lZcldvNkdrKzFLOWpicGgrTTlyaE5XenM4VFBtM204dGIr?=
 =?utf-8?B?Qys3WGZBU3VRS0kvODhEUVh5ekx1b2o3SjdNQnJNN3l4andaOW84aHRSUmo3?=
 =?utf-8?B?VUNLM3RrRVY1aXFOMlBMOThrUnMvRnkxeDl5UWJpYnluN0ZWWnVqQU9OdlJH?=
 =?utf-8?B?Ti9hZEdMaFdaK0Y1SWpOazJscDllNVBkNjNKa2w3QklLem5aRTM5eU05dlQ2?=
 =?utf-8?B?MmZ1KzFqZ0IyeGFlY2NobVJjTmViMHI3TWlJcFZSTWJPMmNraXJOaFFGQ0g0?=
 =?utf-8?B?WlZuTGt4UUkwMzV0M3RlUDhGcW9oTnZWUktOYWpjSUhUaTZ4ZHEzaU13bFk4?=
 =?utf-8?B?TzZ5SDNyVFdmejB2WGYxQmdHQyt5N3FJVm94MFZSTWNUQzRnZzZ2bHNpWkJz?=
 =?utf-8?B?VCtlY0ZuYTdiWjFZcERjbG9CRnB4emk1MWVhUGNiOGxQcjJoZ3ArMW5pU3Zk?=
 =?utf-8?B?MmZ1U2EyOTRKa3dwbHZzUmJkNzZESDFyU25nOG1aUjVVNVFsK0tFcVErMWdo?=
 =?utf-8?B?c29UOHBrMkVsK0RPcFg1aUFnckRPWXNyd2M3bDhBcyszZGxVL0FYUTFqSXZI?=
 =?utf-8?B?cXl6RGMvUVcrLzdBR2p6MkFyM0NSQytVS1I0ZU5JamtocWJRWEsxTy83bFMv?=
 =?utf-8?B?ekdWSTc3RysranVpekUrNDhvVlRaL21HUklRUUZ2WFp0d3dkZEVacGdrN09h?=
 =?utf-8?B?MmdnaGdRNGFiSGhFM3RxZ0kzdFBNTnFvMlFCc1BHM2tSU2JjMngxWUFIT3Fq?=
 =?utf-8?B?RTVXbWIyZ2xBazJ3c3hkYnV0US8vaFRGb1hscHo5SkYzVElvSHFzbWhCbm5B?=
 =?utf-8?B?bWtqOXV0dDJaRXVBeEJmVmhWY293THd3RVdGK2dUbzBQMWlyZzNvYitTVkdj?=
 =?utf-8?B?aDRaSW1mSXJURVZudkpSQW9pdUlGRlgwUXBGUDZRMmxxRE9ub1gwM25IdHdZ?=
 =?utf-8?B?MHhsMTVUL1VHTjlRUzBBS3FIOFd6ZFp4WFh1ZG5UY2c0cGM5Tmk1VThBQUZT?=
 =?utf-8?B?NEdIQ2FSellBVy8ycTU1U3RsOTh3ZDlSb1BBb1ZMVlRXWUE3MXFWWVYzd3Ja?=
 =?utf-8?B?T0sxMEpzYWZadHMrYkp2WnJJenZjWFcxbjVjZ3pMb1lyOVNjS0ZyWnkwMkJJ?=
 =?utf-8?B?aG9vUVRCcENPQUNjMlUxWG1OMGFPQ0l6WnlLS3YwUWF3VFhDQkVXZkRFS2hE?=
 =?utf-8?B?OXoydWs2bWZHT0dJVDRDbUFHMk02eEwvaG9lOU83T1JDSzM3WHowVGNOZU5S?=
 =?utf-8?B?Q0ZEVG0zWTdHbUYxV2RDQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFNzTFZJZ0hvTWtKdHpQaWJMSDRtd2hHaThpbGJtSURxem5tcDRSa2V4eXZ4?=
 =?utf-8?B?OVhXcnNCcWJ5Tk8vdkQzOVFESkdQWmxkeDZreTNXbmtwRU5GQ3JIdjgrak4y?=
 =?utf-8?B?cFF5TFI1ZFJaSk83U0RIWlNaMFJXbXkxMWw3Q2ZqV2FLVXZSK3dId2x2MHN1?=
 =?utf-8?B?T3ZqU0tGV3RtaEl2KzlUVThWUWRHNXB1MjVyTHBNM1VZZ2xMd0NFdUpMcVVL?=
 =?utf-8?B?UVR1YkY4V0xhV0tpdEx3bTAyTVkwQzJRRDVNY0JNWjlJR2FGbHF5eU13NElw?=
 =?utf-8?B?YzBhZHRIWUdRYXdSM0M1WW5SdW0rdExwcnN0dmgyTUx6ZnFkc3ROQjZ4WTVy?=
 =?utf-8?B?MGw5NzJjUVpLWVd0UTFONW5lcW4yQjNlcElIZlk1SGF0L0hDZWp2UGZVQnI0?=
 =?utf-8?B?MERGVzV6UHd5YWVCWU8wWEZ0ZDFkYU1Ta2wwSWdDdFNuSlJzZmdZKytaMUFP?=
 =?utf-8?B?dFJUWXRzZ0pJbXJiQkhHQ0E4KzJwa3dpWEJqR3o3dUdzQkc3alNwdjA4cjhm?=
 =?utf-8?B?cUY3SXVUMldrTTRmUjJtQ3pJa2FiZVJwL2VZOW1JZTdMcFRnTTRIL0VKNUZk?=
 =?utf-8?B?YVFmL1hjZnJyeVRIK2prK04zdTd6QUZHOFNlRHR1TEdTem5IM1FqNTAxODFx?=
 =?utf-8?B?OXBMTktzaDVBVHliQjlmaXNyTzQyN3FSSEc1VzBqNWpwalE0R0d3UERLTjBa?=
 =?utf-8?B?NmVwS0dpdmdaUDJkaGVoVDEvNG1IUHIyTVJ1NVhSM05QVk9hSkk1TWttVGhy?=
 =?utf-8?B?anNMSUpibTlocE9hTC9zaC8zZGR3R25VdW82VnpJTEQ2c1d4U1FiVmNNaVl4?=
 =?utf-8?B?ZDJjQmY5OGlqOWZLWXYreHBmRU5GYXFYaU1USFo2QUc3QmJWUENBV3M1TVdp?=
 =?utf-8?B?amRHMHA5MGlUaU84UkNzanlYdEI0WTRpUytNSjBGM2c5c0psRTRlMTZSb3d1?=
 =?utf-8?B?RTU0ODR5L2hmb0VtMU96TXRxdHBaaVJQUjFGUkU5eFRtdkx4WWVzUmx5cDlT?=
 =?utf-8?B?T2JwTnZySHRIamsyMUVSUXl5LzRIZVhvNDlTcTVJdlZOcGFGeWVLSFc4UGJj?=
 =?utf-8?B?S05SODhmbjAxWkE1LzEwa2hZZEJiZ0FqWWZUcFcwVnlMQklzcVZiL2VzYTdD?=
 =?utf-8?B?cU9haU9kWk53RkZaK21hbDdCRWpuYkdQMEdDYXJLN09JNGcyZUpQYytrcksy?=
 =?utf-8?B?bnVKeHQ2WWp0czBYV0ZrUFpQdjFjVXByUDdMZHFRUlRoZVoxTTdWZ3ZJVGFi?=
 =?utf-8?B?bWlzdldQZ1UzbExtcmJsRnRoMTBhb3RVbjhFZm5SSzIvUHNtR0FDVm5pL3pJ?=
 =?utf-8?B?NzZUMWtyREQrZUJyYlI3Zm9vNVZtQ2l3UlZUcG1KQTdablRaZm5UbXJwKzRP?=
 =?utf-8?B?TUl6Y0UrNkdLYmQvMTRCdHdVSjRxbjdMc0N6UGY0Y01ia1kySjR6VlJ4NVpp?=
 =?utf-8?B?eXdqMjJteHQzbUNTWG9ManREU3kvR3d4RUFFRlVMWHVtaU04U0tQcldsMjJI?=
 =?utf-8?B?U05xUFQ0Y2V4UzBDSHBETlRtb1M4T2JTSHlNclJHM1EwY0J0eWdrejNZMWsz?=
 =?utf-8?B?YUhmZ09sLzJhNGt1aUp5SEQ5Vi9jOTdidTZubnhlWkdJWkR4cEsrWkVQY2Iw?=
 =?utf-8?B?TXJVSGVCQ1ZmUDhXaUJ3SUJRL3RaZDFTRW9Eb0NpWCt6dVBua1IyYmpWUlVa?=
 =?utf-8?B?bllzUDcveHFaTS9ZTmJvK1hCSkpCVDl5Z3pHcGkwc2tMc3lIanhMY09ZWkVq?=
 =?utf-8?B?QW8wSXFHaHEwL1NMYlVPYWdYMTNqbkoyK0srb3lQMzZMSkM3SzVaTjRoZlNN?=
 =?utf-8?B?ZUs5S2xUd2hxWHllZzZTcU1obld6Q0NURjJDWlJqS0ZNZGtGelU1ODNsNjVq?=
 =?utf-8?B?Visxay9lamUzekIreXdKdXlFL3B4M0toV3Yyb0VJYWR0OTFhenE3RUszaGpG?=
 =?utf-8?B?Wk4wTkgvOGo0TjRSY0l2aDZrN3lBbXlmZEcrbGRPNGF0YUlXOTYyZ0ZpRjNT?=
 =?utf-8?B?V204ZVEyRVhYa1hJdGdTTXlxSUZIak1TdlNhWGR5eHUwRkNta0tZRXJKNURm?=
 =?utf-8?B?YSs2VStUY2loSzNYTXRUYnpMT2lMK3lwU2Q5ZjhMODg2anoyR0VYQ05YWkxk?=
 =?utf-8?B?QVd0RHljS2c0SFVOZ0kvd3ZPYUl6dGhwdkhNZzNOLzRyVEkzNXJwdnlVNWR0?=
 =?utf-8?B?NHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a46078e9-ea43-4592-fb6a-08dcd29fdac7
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 20:25:19.3896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aY8Sfp6C/HxPxtoh4q1V5DUzsEdlyK6MKX2CoEE2JgX4ZEaZOIRznro9A2wITvOLPQcVk5KEpIE/qGQ+MOnHH+2fvgZkS2NnovYofRpQgTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5801
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

LGTM

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
