Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E16D25926
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 03:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537EE10E0B8;
	Tue, 27 Jan 2026 03:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OcQcWGSg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86BE10E0B8
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 03:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769483763; x=1801019763;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=n6fgOwlg5np/wSyQbMR7suNw+AvffUcDJ9U92Au5Ru0=;
 b=OcQcWGSgA0wpvimXMVpilzhw2xiiaeWkI9pp5dy5Jp4/PlIOYH7tt6Nl
 FMlmnRVk5Pl9d7ySR8PYlDItu0obH48BciXw/BPd0+hoiOYzeonOvwN6T
 75q6kSf9Vy2dtVGm/ndo1WCKJpEiIf3UJbWvUcI83K0s7EIJ04HuHwPb1
 GQDAmq6UjiIejYO9YQAFYMv5yZAwPYeklI2io8L7MGSN0wOJXRUqSS7IV
 8kbJGnEi+QmQZyv3v7KAChV6esYzk+PMx2y6cbTTjX0oCtioth9Oq5evv
 Z/VILynOyPw3AiO7fyXbQXufSwyQsf3H3N+WG4/f83by8KIr7nuhNYVvI A==;
X-CSE-ConnectionGUID: KG6mum09QFGRQiDZXKXC6w==
X-CSE-MsgGUID: I+Ti5qtLRl6bzaIuNNuWIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70564483"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="70564483"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 19:16:03 -0800
X-CSE-ConnectionGUID: fyZIFP6GQvG5PumqwPUwqQ==
X-CSE-MsgGUID: ppjoKf8eRFC8X2LZbaJElA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="238531276"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 19:16:02 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 19:16:01 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 26 Jan 2026 19:16:01 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.48) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 19:16:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a08QvyH455h+qzNw/CzmRjpNRRjge65P6B6ToyVaM3CQ8aGC88z8LxOepTdrxuMtPB7HOk9DETdQiKxUf3ryT3NHw+ucOToK2easUHVZJtuXFF2P2Jz+3AWDgmJAQOVlZ8495PTsp7VWUx9Vsg888VGKdwQxt5iEzRP37g6Q4TcNkRgY1vsS6fNjuzXT/79ZYlRYCjP5bRsxJcCOQMh/AHJY5yX0DlgH8A0ALMI6Md0zRNg2i0djsF0Ks4omhEdGN9Eme3IsG0khhJCE8OY7/UnG5l4WWRGfQMrLMSXGOE6dHWZ8Hv4B1eSaHmkAhcyZB2vL9VOzm68hjLFb3KL8GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=00/A2Ay472m97lcjaLcADnyIjvcpf8evp6jWoZgfisM=;
 b=eKVj+zKNitk7RptqA1K1A+mE9Eqji0aWaKev8oZtnDFe05viFltnJxUUB5xbEe5TIjgVXFDE7SqIuxC/taiy+qyh0+IwKBnKOAV0nk5GDjQqemOkwkTxnDw/uX4wQYagdvZZRyjodSw6U42Y/wTMMQL2SxwLIbiv6BlN7moP41GYTAu4lAwzLNPzrbsjsM1co2hvVXXmETskTn+7GfuKFl/yPx7TPbSH/552G32urzKPD9U41E/iq1vaKH5V3Xzpgc5XZFnbfg+subShWOILcT0PprRjBwd3pB/UfV5zQ8KfWmA3C68nlw6oW/uCU7BA5tJPKCWHXnx+30bLuuYm9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ5PPFBD6B1667A.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::84f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 03:15:59 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%3]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 03:15:59 +0000
Message-ID: <de637b84-a1b6-40b1-b1bf-850466ad5b62@intel.com>
Date: Tue, 27 Jan 2026 08:45:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] drm/xe: Add a wrapper for set/unset params
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260123235027.379891-1-vinay.belgaumkar@intel.com>
 <20260123235027.379891-3-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20260123235027.379891-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0216.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ5PPFBD6B1667A:EE_
X-MS-Office365-Filtering-Correlation-Id: f9b63dc5-1f3f-42f7-b6e8-08de5d5264ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|18082099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ujd5T1ZuTkxjNXRGQ1VCNUhCTTV1NmJaUDhkSm1YS00xSjFreFBYSHovSmFm?=
 =?utf-8?B?Qi9rOFpiMUdZdmxwNlhSZTJabHpoejcyeENqVExtU003azhiVmVaRGlZWjdh?=
 =?utf-8?B?YjVYd3hlenlGWTZxQkhrK3hxbTkyWTJVdWZlS1NTZ0NZL2dXSEFrSWk0b1R2?=
 =?utf-8?B?ZmlHY1QvL0UxUTlSYnJMYitueVc2TUpGYTVZak1XZVRFSjZiR0ZsYjJiM2Fk?=
 =?utf-8?B?d0dqUllMUldpcmROTEZjOEVKcGIySU9OVHM1VEd3SmlPTzZoaExrTkhzM0Ra?=
 =?utf-8?B?ODhHbTJwNE1mTmNldHdOREJ3NGJHWUE3bGZtZTV0SU1qRWVsTEZxUUJHYTQz?=
 =?utf-8?B?YnFLN0x6N1NsL2M4VTVkT2l4OEg5NEVtU2pidFBYdnU5VEhZT0ROeDVWcTBT?=
 =?utf-8?B?bjF3MFBXakJ4YzMzVnozOFUzVTJ1d1ZpZ0NhN040SkRSemdjMm9NZXVkem5l?=
 =?utf-8?B?eE5ERW9kSTdDL1hTUkJSYWRjOGRkczVaZm9HSXFXbjBXakdiVTM2OEtVTnJL?=
 =?utf-8?B?UUpKWmFUdjAyRHRxRFZucWIwT3JYMmtTWjk5dldjRnVMTU1CdnR4dkZyamxh?=
 =?utf-8?B?ck9JbEd4UW5JemhFcExiZUVlemtCdVZMeHh2L1daU2RYR3R3dVRqU0pyRFEv?=
 =?utf-8?B?U3NEZFNiZnVxcVhSbDh0MndKc3N1azNMU1NpTWxuQkNXUTlSRUhleDlFOUZN?=
 =?utf-8?B?RDZPd25pR0pJT0VDMUQwMmN6WTl0bzlVdDdjRXlRZGI1UXlkTnZETzZGKzZH?=
 =?utf-8?B?bG9OL2NTVGV5V1RtcHgzVTlIeTZsOUI0K0FJeTR1eHZOVytmY0VwRnNBa1l4?=
 =?utf-8?B?U3UwNzN4VGxxYWRYN2svMVYrVXBVY2MzRHhpWlZvY2R3TEhhSlhIZUpPMnZD?=
 =?utf-8?B?d1d3VEF2RXBpS3NjQU51alZuZEZOZmpsODM0cVBoenZPL1k3MVlQN29LTUQ3?=
 =?utf-8?B?TmMvdUhleitQQ0lLM0F4SWxuUjgxS04xTzVEb2x4eFRTWVVNNVBWWUNlSEhv?=
 =?utf-8?B?L1lRS0ZPQ0IwV3haSVpDOXAyN2FrZGp5NTFqR1R5Y2p0RVpHVzZTMWxab256?=
 =?utf-8?B?S2tXYXR5bEZTeS84QU9mMVVad2VWVXNXUUdmay9QaUY4aXdzYkpYMGROaE5J?=
 =?utf-8?B?YjF6NjFBOHNCNXl2RTdDdzNIZnJqeWpsNmNycER6TDI1SkpSRG81VmppTG1j?=
 =?utf-8?B?R05qR0lhdmovbWxBaU1kSnV5SjdBU1lGRmRDazNGL3I1ckRaVHVhOStqalpN?=
 =?utf-8?B?MHc2cWJrdlRxWnVuN053SDVrUDhXS05Sc3hOaW1ZVnJqRHVnVXc3VUFqdGxF?=
 =?utf-8?B?bGRFb0FlRlczUktib2NEWDNRVWZJSHkzN3JjR3Y0WWVzWUNPbFVhbkdKcWhV?=
 =?utf-8?B?K3hvcDY5dU1yY2RjN01QZ3NjOEVwMHIydU5OY0V5bHV5VmpGamo3Lzd2cE9k?=
 =?utf-8?B?cGhSZzQzS0ZRMVpLMjJ4V0F0WnU1dlYwTWw0WW1HbmpzeDltbEdzUmNnYTVw?=
 =?utf-8?B?L3pjVnVUOGlacDZmV3VvdWlwNk1MeXlSUU92M0R1bCtZcWdkVUMyWEZLM1Fm?=
 =?utf-8?B?SEhMcXdua0J5Nngyais4OEtBV2dCTEt5bTg0emtxUUxKRU5BRmVJeUlSaWdQ?=
 =?utf-8?B?VlVkTUF5cTh3SUZaV3I2REx5MGhtNXJrVW5obWZ6Tzg3ZmcrNEhJYzVJL3Y2?=
 =?utf-8?B?b3VqaHBoQmNndEV5WFMyVTBwZlp1MDBWY3Y0d0l5eTBuNVhjZDhUZW51ZEo3?=
 =?utf-8?B?Q2w1NStoZnA4UlNqRnJUU1c2MnNJM0orRGdMSVJkY2wrcmRkK1dxQ0xBYjhu?=
 =?utf-8?B?c2hRbUFpeUR0OWxWeXUvN3ZZZmNaY010VFRLTzFDSzA2a05Qa2hRcmJoY3pP?=
 =?utf-8?B?NFF2NlJDQU5SdENLZERuVThKRUZhUmhTdVhYcGhsTmVYbDFGM0M4UVdjaW80?=
 =?utf-8?B?bkd3QkRDcjNpdmxkVXBncmh1czliM0wydVE5QlNId0dLRWYrbnBCRTh2T3ZN?=
 =?utf-8?B?ekRRcHZqRkZFbERta3lZV1hCdVgxRFM3MzZpa1J0bENYZTFMQlZNUEEzMjN0?=
 =?utf-8?B?MENRUVJyeU41REpFQTVGVk1lYXRIYXBkajVNNzM5bi84MmZjWlp1QmtEUE5q?=
 =?utf-8?Q?gZC8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18082099003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGhEUWI2bzJXOFZiaDRDRjkzZXB3UytNY3EwbFhkeUJzUFRaSjBSUWJSNnEw?=
 =?utf-8?B?QUZqN0dxMUxSOVU2RXpodVpIQytheVRRbFkyODVtdEt2d0NVYW9HSndpOWpE?=
 =?utf-8?B?a1dLUmh4TmF4cUd6d1NQTkJWYkhtZE9wSW91aUpqdCtkbFd1STZWMnlka0Rq?=
 =?utf-8?B?aHp0YUFkd2I0VnNaWFJIUVJDaVhWNkdySm16STdMbU54VzluUUkzZXdxNFcx?=
 =?utf-8?B?dytXTmkvMXhzbmZGYnRHc0trS2VXQUErOHlMRTUwYmhyaVU1cXRoN1NBQUhD?=
 =?utf-8?B?ekZOMVdtTVFiNUF5aEl1eTduNWlOekhTSGZTSDgwUmlLQVZBWEg0cno1TDNZ?=
 =?utf-8?B?TXFWSXh1MGxxdEhwR3hPcjRyTGtBUWxaQUYwNDRzdzdQeERRemt4UkRmRDdF?=
 =?utf-8?B?SXdnZHNJTjluT25NQ2VWUGFuRDRFUlF2dFRlV0dtbmpGYng5N2JwbjRPRTV6?=
 =?utf-8?B?UHJyS0pDRXh6YVAyWlM0NFQrdWdBMVh5UVpFZGUrMEhWR0t4RVlienRUUDdj?=
 =?utf-8?B?bFI0WENmSzRsMUVjRzhpeGpyVktVOG5lOWpaTXZYYm55V1ZkYUFHeHBoTTFm?=
 =?utf-8?B?Tk9DdzJNQUN3UUo0V2UvRDExcHdxRUI2ajBzY2JVQUNlKzdnd0NmMFBITEhT?=
 =?utf-8?B?dlN5QVlVTUI0SzB1c3RmL2JQenFva2dSY25OZzJNTkJmWW8xeEN3QlhKbHlD?=
 =?utf-8?B?a1oyOEg3YzNTODJJODBsQTAzT2tNRFlKQU1OamszVldIZytsZHJ2eGFBOEdM?=
 =?utf-8?B?R21WZnpVbVFmVnhxSjBDdHY0MDVFTXpPaCt3a0YydVpwK3FuYlZ4eFR2a3BR?=
 =?utf-8?B?VHFMaDVCd0tRWllmUlM5YWJoNFJKSEJNZHVENno0Nmk1cnlHNXkyaTVHMlJM?=
 =?utf-8?B?V1VybUhaSGJGMnZHM09jS3RJTTlibXpMNm9WYXhIU2lRMFA1MXdWQm1WU3Nm?=
 =?utf-8?B?UlFYNmh1SkJuTlJyd2kwRTdubkNhb0owOXVVQUpubU1BY1lQaGJxbDFzNlFl?=
 =?utf-8?B?U3Brb0hZL0pOMnVsWGIrVnFSR3FhTG0vL0dwTDZYUVA1VmtiM3YzZWRkZXFX?=
 =?utf-8?B?OU81WG1YaTNWTFdTTitFbWFacS93V0pUNFR2cnNIdm11Qis4N2hPVSszK3I0?=
 =?utf-8?B?Smx5ZnJGVGFxVlFVNENsVzBkTlpCTEJUYlgzbCsvV0RHNEU3WXVGZnRSSzQy?=
 =?utf-8?B?REM5bzlpbGV2aHhzaDloRTBlUVRwcTc1Rmt3NWdudi9jdTBuNHdWaGdpc2lI?=
 =?utf-8?B?ekJ4cFU4cU1mMUFSeUROalI1S0NSczAveXREaVA2TE1TSmw1TGVieHpPTkFw?=
 =?utf-8?B?KzlzdU12d3BTb1NtNDFGcTZPYWdEbU5OQjkwTTg5THRHbUV1WCtrYU4xTENB?=
 =?utf-8?B?bUYrQ1Vwd2o3UGdaYWl0eEpEclk0WjZxQ1JxVCtzVEhrTXdDcklFdkNRaWFx?=
 =?utf-8?B?STFJck54THFGdmJWR1lWSngxUzRlb3dLZ1hSRnU4V2JVZjBuVDljRmhhZTV2?=
 =?utf-8?B?RmlmYndPTFRvL0kwZmJSbUQ2TUlJUmRONXgxMkNUVlFGVzcwWjlvY0s1dnE0?=
 =?utf-8?B?ek5CbWllMVkveGVYMGcvVzhkdkNHRUlPck8zUEkzclVuOFY1NmhnazhyMjhD?=
 =?utf-8?B?VnhleU9PV0EzcWQvUFBFVHBoVzl3MjN3N2xXMFNSa0hyQkFWQ3VYQWZiODBW?=
 =?utf-8?B?aHczWGo0WGJZRDdmMk9yQ04vWjVycWh2dUsrRjJMOUJrRnJtV2xDWmdncUtQ?=
 =?utf-8?B?TXU3L2x3bEZmRDNCZmpEYm16M1FGVzZLVCtka3lQWkkzK1loc2szTGJQWG43?=
 =?utf-8?B?Sk9CaUNpOHVHZUl1WUdzeXZOT1lPbVVTendZam5nSktvWXVBLzNrSk1jQklV?=
 =?utf-8?B?c2pFSlJUdHN2RnQrdTZaY3FBVUU2cm1BS2hVRXJCd2M2cFN0dXVKVEZMcmRZ?=
 =?utf-8?B?M3JCcVp2OHIwR08yaFYzUlQ2Vkp4aDZ2ZWVnOWo5V3NwbXlUWmVkaVc3dG1k?=
 =?utf-8?B?UTdtWWxxT1lqVVN3R1pOMTRuOVhuSVVqVVBKdEI3YUpETjVaVjE4NWszWXpT?=
 =?utf-8?B?a2svRUx6WXI5dzIzZVdrZTkzSjVFbnhMYWFFOE9zclVyWit4VjIyMlJkc2ho?=
 =?utf-8?B?cDRlYmdwdnFEbFUyQXJOZW51OVJUQThsNCtYYjZDUDhCOGNHRXFmUkpnTm50?=
 =?utf-8?B?NHZUd2twNVBmSmpKVmpoNkdzeWZPcE4rcUMvTVh2NGNSaDlTSExEMk1iRjlk?=
 =?utf-8?B?QmM4ZDAvMXF2WFprbFlNYlpXUlJRaVowNGkwcm02UkhLZHB3dGgvRmNpWGlr?=
 =?utf-8?B?VXpobjFVU1hKS0l3OUFMY3BqVFBlMlhnaFkwOEJQcVdSNmwrQ1dsUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b63dc5-1f3f-42f7-b6e8-08de5d5264ba
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 03:15:59.5337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: paFAgcH36Jny3+acIr5e7N4EOYJcY1DWXxq772Hi3JiehcDZDyYL1naFKB4Fs16HclISiTHwuIOqCCeUk1t9IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFBD6B1667A
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



On 1/24/2026 5:20 AM, Vinay Belgaumkar wrote:
> Also, extract out the GuC RC related set/unset param functions
> into xe_guc_rc file. GuC still allows us to override GuC RC mode
> using an SLPC H2G interface. Continue to use that interface, but
> move the related code to the newly created xe_guc_rc file.
> 
> v2: xe_guc_rc functions to use guc pointer instead of gt (Michal W)
> v3: Assert if runtime pm ref is not held (Michal W)
> v4: Review comments (Riana)
> 
> Cc: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Looks good to me.
Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_guc_pc.c | 56 +++++++++++++++++++---------------
>   drivers/gpu/drm/xe/xe_guc_pc.h |  5 ++-
>   drivers/gpu/drm/xe/xe_guc_rc.c | 30 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_rc.h |  3 ++
>   drivers/gpu/drm/xe/xe_oa.c     |  9 +++---
>   5 files changed, 70 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index cf02c53ca3c5..31c6cb111916 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -264,6 +264,37 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
>   	return ret;
>   }
>   
> +/**
> + * xe_guc_pc_action_set_param() - Set value of SLPC param
> + * @pc: Xe_GuC_PC instance
> + * @id: Param id
> + * @value: Value to set
> + *
> + * This function can be used to set any SLPC param.
> + *
> + * Returns: 0 on Success
> + */
> +int xe_guc_pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
> +{
> +	xe_device_assert_mem_access(pc_to_xe(pc));
> +	return pc_action_set_param(pc, id, value);
> +}
> +
> +/**
> + * xe_guc_pc_action_unset_param() - Revert to default value
> + * @pc: Xe_GuC_PC instance
> + * @id: Param id
> + *
> + * This function can be used revert any SLPC param to its default value.
> + *
> + * Returns: 0 on Success
> + */
> +int xe_guc_pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
> +{
> +	xe_device_assert_mem_access(pc_to_xe(pc));
> +	return pc_action_unset_param(pc, id);
> +}
> +
>   static u32 decode_freq(u32 raw)
>   {
>   	return DIV_ROUND_CLOSEST(raw * GT_FREQUENCY_MULTIPLIER,
> @@ -1045,31 +1076,6 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
>   	return ret;
>   }
>   
> -/**
> - * xe_guc_pc_override_gucrc_mode - override GUCRC mode
> - * @pc: Xe_GuC_PC instance
> - * @mode: new value of the mode.
> - *
> - * Return: 0 on success, negative error code on error
> - */
> -int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode)
> -{
> -	guard(xe_pm_runtime)(pc_to_xe(pc));
> -	return pc_action_set_param(pc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
> -}
> -
> -/**
> - * xe_guc_pc_unset_gucrc_mode - unset GUCRC mode override
> - * @pc: Xe_GuC_PC instance
> - *
> - * Return: 0 on success, negative error code on error
> - */
> -int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc)
> -{
> -	guard(xe_pm_runtime)(pc_to_xe(pc));
> -	return pc_action_unset_param(pc, SLPC_PARAM_PWRGATE_RC_MODE);
> -}
> -
>   static void pc_init_pcode_freq(struct xe_guc_pc *pc)
>   {
>   	u32 min = DIV_ROUND_CLOSEST(pc->rpn_freq, GT_FREQUENCY_MULTIPLIER);
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 1b95873b262e..0678a4e787b3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -9,15 +9,14 @@
>   #include <linux/types.h>
>   
>   struct xe_guc_pc;
> -enum slpc_gucrc_mode;
>   struct drm_printer;
>   
>   int xe_guc_pc_init(struct xe_guc_pc *pc);
>   int xe_guc_pc_start(struct xe_guc_pc *pc);
>   int xe_guc_pc_stop(struct xe_guc_pc *pc);
> -int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode);
> -int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
>   void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
> +int xe_guc_pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value);
> +int xe_guc_pc_action_unset_param(struct xe_guc_pc *pc, u8 id);
>   
>   u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
>   int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c b/drivers/gpu/drm/xe/xe_guc_rc.c
> index fc57e5290635..0a900c309ecf 100644
> --- a/drivers/gpu/drm/xe/xe_guc_rc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_rc.c
> @@ -14,6 +14,7 @@
>   #include "xe_gt_printk.h"
>   #include "xe_guc.h"
>   #include "xe_guc_ct.h"
> +#include "xe_guc_pc.h"
>   #include "xe_guc_rc.h"
>   #include "xe_pm.h"
>   
> @@ -112,3 +113,32 @@ int xe_guc_rc_enable(struct xe_guc *guc)
>   
>   	return guc_action_setup_gucrc(guc, GUCRC_FIRMWARE_CONTROL);
>   }
> +
> +/**
> + * xe_guc_rc_set_mode() - set GUCRC mode
> + * @guc: Xe GuC instance
> + * @mode: new value of the mode.
> + *
> + * Function to set GuC RC mode to one of the enum values.
> + *
> + * Returns: 0 on success, negative error code on error
> + */
> +int xe_guc_rc_set_mode(struct xe_guc *guc, enum slpc_gucrc_mode mode)
> +{
> +	guard(xe_pm_runtime)(guc_to_xe(guc));
> +	return xe_guc_pc_action_set_param(&guc->pc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
> +}
> +
> +/**
> + * xe_guc_rc_unset_mode() - revert to default mode
> + * @guc: Xe GuC instance
> + *
> + * Function to revert GuC RC mode to platform defaults.
> + *
> + * Returns: 0 on success, negative error code on error
> + */
> +int xe_guc_rc_unset_mode(struct xe_guc *guc)
> +{
> +	guard(xe_pm_runtime)(guc_to_xe(guc));
> +	return xe_guc_pc_action_unset_param(&guc->pc, SLPC_PARAM_PWRGATE_RC_MODE);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.h b/drivers/gpu/drm/xe/xe_guc_rc.h
> index c980b0fce472..d76dfad8e26c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_rc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_rc.h
> @@ -7,8 +7,11 @@
>   #define _XE_GUC_RC_H_
>   
>   struct xe_guc;
> +enum slpc_gucrc_mode;
>   
>   void xe_guc_rc_disable(struct xe_guc *guc);
>   int xe_guc_rc_enable(struct xe_guc *guc);
> +int xe_guc_rc_set_mode(struct xe_guc *guc, enum slpc_gucrc_mode mode);
> +int xe_guc_rc_unset_mode(struct xe_guc *guc);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index abf87fe0b345..f7752719b74f 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -29,7 +29,7 @@
>   #include "xe_gt.h"
>   #include "xe_gt_mcr.h"
>   #include "xe_gt_printk.h"
> -#include "xe_guc_pc.h"
> +#include "xe_guc_rc.h"
>   #include "xe_macros.h"
>   #include "xe_mmio.h"
>   #include "xe_oa.h"
> @@ -875,7 +875,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>   
>   	/* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable rc6 */
>   	if (stream->override_gucrc)
> -		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
> +		xe_gt_WARN_ON(gt, xe_guc_rc_unset_mode(&gt->uc.guc));
>   
>   	xe_oa_free_configs(stream);
>   	xe_file_put(stream->xef);
> @@ -1765,8 +1765,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>   	 * state. Prevent this by overriding GUCRC mode.
>   	 */
>   	if (XE_GT_WA(stream->gt, 1509372804)) {
> -		ret = xe_guc_pc_override_gucrc_mode(&gt->uc.guc.pc,
> -						    SLPC_GUCRC_MODE_GUCRC_NO_RC6);
> +		ret = xe_guc_rc_set_mode(&gt->uc.guc, SLPC_GUCRC_MODE_GUCRC_NO_RC6);
>   		if (ret)
>   			goto err_free_configs;
>   
> @@ -1824,7 +1823,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>   	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
>   	xe_pm_runtime_put(stream->oa->xe);
>   	if (stream->override_gucrc)
> -		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
> +		xe_gt_WARN_ON(gt, xe_guc_rc_unset_mode(&gt->uc.guc));
>   err_free_configs:
>   	xe_oa_free_configs(stream);
>   exit:

