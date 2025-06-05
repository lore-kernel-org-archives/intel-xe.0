Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F61C5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 11:18:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CEC810E86F;
	Thu,  5 Jun 2025 11:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YRyj2w8K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 561D110E96D
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 11:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749122310; x=1780658310;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j8IOc5sf79Ak4P/HHygzfiYiR3iAvGjXvHtmaqbdvzQ=;
 b=YRyj2w8Kg52cORLMxSW37X9ztO3yj3GSrnvRJkTeFUBqHw8yS5bvRhmS
 5wFLqxj870iskWUVV0NQGPxcn32QvtLsgf5J2zlDhKIa8XVp+fJHzayy+
 fkdmBZY6G+xtnZgxUDmFgQ81G5wa2l1w4/HFUwUsFKVYwjuT+mHqaazu0
 Oz2RMk6mYUTNQ4fx5sIZdR8EadKitZZ7UZZa7GZ4xG9Jjm/dICUmcRQgv
 VrWnEIbjnx5KWUwZ75/F691vq5oVMe7XfRVHVo4c0Cyzz/8zngkk8kobM
 3nEO8mqQzoctu4j1wQi439yxC+pUrg+FgD0uqCh3RNJaJfpZhLJ6LgWoD A==;
X-CSE-ConnectionGUID: yruVC4SiT36yBNcemDEzcg==
X-CSE-MsgGUID: UzMzJc9YQReOBHdmgrAR8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="50935363"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="50935363"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 04:18:30 -0700
X-CSE-ConnectionGUID: X4rOZNlUSrSwWZc2Sc//7A==
X-CSE-MsgGUID: SKvgCNBEQiyrUi3okj6BUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="176425829"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 04:18:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 04:18:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 04:18:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.48)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 04:18:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PAASe8wnmrQcL1a6ZJaTy6B8/zJW7evnZ3tArbZGND8OllF9S2Db2OA0P4pL23NGZqXjyv1UxcQl4uiB0LUREDAPEsbO9x9WYb1hiwbvgaIo4lqjSBHvbpUmLyaGW+dgxcSt0TCm5Yj9PLCp1UBW4AGIIPI19zac6uGQR7jGg4gLcwZyy04f2lEJowqyZqe0ZXdVlp2llCuUvCqfdFXvPJDuNJrZ+znanwD3AsxhlglICLHNP+mDc2ME//o+BiwrlQPbc31H9FhaZRVlrmuDfdQiohOQX5X4kDbn4y6N/JlNXL0/0bo+1+eDroAVq6CjbI3/mK3YUwjnXWl4jhYIpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9b26yce3itXcJShW2anP78jmVSbzUyJ3fKv7yWeZ2s8=;
 b=CiL8w0p3k1AJU77S9VJ3ih5Tldaf5Bh2cb0KQfsD1lsb6zjMtznyh953zmXD7bKByZI+P4hbuykO8c3XrQOculi5V70Sl0TLBxaf0zFXToAX95r7UmvdFapJK1wsl9wNSDyWgVWIps8whreBZu8AFYCIqclCPdLjwKeUFlnNDq11VM2R8DW67VjAi1vmO4UJ3h6T3bpEPgicCESl7t+DeY+l1ijshm2sH4Ke5UQf/zNDDiIrU2UPET1iQ/qQRzHSc8BkeEgSUIN5niImZOfZ9M3QpUm/GamRIva2HGjzi/yIZDzL6gybSMlYGb0gDf74iWlBn1E4RGrrfbx7cYumrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ2PR11MB8567.namprd11.prod.outlook.com (2603:10b6:a03:568::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Thu, 5 Jun
 2025 11:18:26 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 11:18:25 +0000
Message-ID: <23fff9b4-a22b-4b8a-9d9c-45512ae96889@intel.com>
Date: Thu, 5 Jun 2025 16:48:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/xe/xe_debugfs: Exposure of G-State and pcie
 link state residency counters through debugfs
To: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>
CC: <lucas.demarchi@intel.com>, <ashutosh.dixit@intel.com>,
 <jani.nikula@intel.com>
References: <20250603181205.1680363-1-soham.purkait@intel.com>
 <20250603181205.1680363-2-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250603181205.1680363-2-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::18) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ2PR11MB8567:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d173f8a-57e9-43ea-9568-08dda422b095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmlVeFE2OCsybkwvUy9uWTJOWFhVTDJQaDJzVEZhbUtLTGtVd0g3SWoybWdV?=
 =?utf-8?B?L3A5TWhkQlFiK3VndWhxbXJKc2lpNVZxbnAzdVhMUU5qOGVRc1lQdXdCSC9X?=
 =?utf-8?B?bHhDTzVmU3VXSlFjS3U5ZkNQeXdHZVZsa0ZiT2NNdGRZVWhRTnM2a1VlWXZx?=
 =?utf-8?B?NEJsUWFabzRGMWFORlpieGUxbmVFdEkrS1RSVzViQ2tDVWtMOFptK0YzRmFQ?=
 =?utf-8?B?ZnBoY1Q4VFdqWEl2NGRMQitJYS9vcmFPWnhEWktmdDViUElsazd4eUQ2S2NR?=
 =?utf-8?B?bnh0VlpJYnFtOWRLc3RuTEZYUDZwbW1PWVREb29UYjhwQlZ5SmN0aVlabVNF?=
 =?utf-8?B?bktNS3hCczVGdG1iZ2tvVlQ2ZGE2ZDV6NmY4aGpmTU5hZWJDYXlFcDhuWEhu?=
 =?utf-8?B?ajRpVXhsMjZweG1kb1BWd2IxVk8vcmVONmQzZUFLdXdic3owU0JMYW03eFNI?=
 =?utf-8?B?Q3BGSmp1SGNReTBrL0tPT0ROT2xFUGxnZEMxbXVyQzVORVFGODAvUzZjUkgw?=
 =?utf-8?B?MUs1UmJaTkVmWnNSRDczQng3Slo0M29KZlJaZ0JyU0RETG9JRThVRjlWVXdv?=
 =?utf-8?B?cS9CWXVLRW9LT3Vrb2dZd2ZKUmp6UWhqNGdCRURNWlZuamlJeGF6ZHVEdllF?=
 =?utf-8?B?amdNMXBwZkZxQ1JMQ1I2VW1nb0xGMUdnS05TZE5OL1JGd1VtRXg0UlpJOHI5?=
 =?utf-8?B?NkVMeWUrLzNQSkVYdUtVMDR5NnJLZmJtTnVmUnlGY0lZcS9TaTUrRGpMUnh0?=
 =?utf-8?B?bURkWTdrYVVGRUt1YmtjYXQydEVKb3VJbjR6ZFNHWFRJMzdNb2ZnTzJjMnVX?=
 =?utf-8?B?UDd0aUVncCtESXk3cFE3UFVQMVl3WGRBcXB2dVV2TWRzZ0paNXZJdnZ6a3Jx?=
 =?utf-8?B?SmgzNy9oOG8xUkY1Z3VzK2lyZnBpR05XK094cHdHSCtPL3hFWmowZS9DeW5O?=
 =?utf-8?B?OWttTHN0c3g0MlIzcDhkMU16VkZicHlCcSswMWZRajhZOFlHc2VBd25jQzZm?=
 =?utf-8?B?MW52bkpFbkt4NGVGdkl2MWNvTnFteHFKY1lEZ29UNkhYeUI0Z2txNEpqc0xC?=
 =?utf-8?B?MXlibU5ta0RjY3ZmdkNyZStzMUE4eWxDZEo2Rml0SFhrVnFKS0N6SG5sRnNF?=
 =?utf-8?B?MjQzeEZqRzk1VVBNdEhsbWV5cHpEZ1d2c3I2ZzFPR3lYNWRZSkJOQ2tpN0Fr?=
 =?utf-8?B?Z0RpdW1CemFZa2gxRHJtZ1NvYWRYT2lBZndsejVpdU1sVXNqRFMyb0k3OTlY?=
 =?utf-8?B?c2hmbUFldnVBVlA2UGs4SnpKc3U2c01Fc0JzelBLSGVXbHE3ZEV3SGx2d0Iw?=
 =?utf-8?B?REVLbDUzazhCSmpKQzd3QVIwZjhIeExjWVNJNkRpNForOWg1ek9DWFVuWFha?=
 =?utf-8?B?eUNUMnMranVXMGJURTRFdEdKalNKT3JTMkp5Z2dTM0pDeGphZ0Y0M3dvTWdH?=
 =?utf-8?B?dktZRHh3SmtrUmJIWVIvYWIvdklhTHlzY3hCeTY4K2dIMWlyZkhCbTNPd2xs?=
 =?utf-8?B?dGVFMDhGaVl6TGVPbUJpamFTVU50elNKS0tmRHpEWENYZTZFV3BqTXlyMGFr?=
 =?utf-8?B?WklxelNsY2ZhelY0RHpkVE9oYUhUMmRER1FJSzkrZE8vWnRRYVRwUnVuRkNh?=
 =?utf-8?B?MEJsaWI5c3lMcXhkQkoyUkl4YThqTDg5OWVsV0RGT3ZHTytOT3pOdTh3OXhN?=
 =?utf-8?B?SnBmbmZaWVZaeGVjVm5NSmc3TkgvSThWclFNMXVBVGNBclpuejJIOWRzaExP?=
 =?utf-8?B?WFc3QW9qV0NRdCtrdkZjVDJqck5xdlVsU0w0RFNhSWRGcEJWVlRKdFdhYkg2?=
 =?utf-8?B?ckxKQk5SSG4zUlAvWFUyOW00OC9jdTVqenQ4b1Z1VFpubktSQmdwU2RtUlI4?=
 =?utf-8?B?TldCR2lSWmZZTUdwWkY0MzNoL29aVUZUQnNMTFUrbUtub1Z1c0Z6SGpScHZv?=
 =?utf-8?Q?aZCfrtgqw/Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzFQTnc2N3NwL1hWQmdOMUJJcE5nNmQ3bCtrU1R0cERqNjQ0Q09RUmNibzlw?=
 =?utf-8?B?a3EyOFVpL3ppRkhCOER3UVZJMHR4RUpxSkF5VE5WZUpQYWxwTWFIT05Tc0Jm?=
 =?utf-8?B?N050S1lVa25UZUNMT1N3bFlQMGV5Z3dEMWg5Z1N5M24vc3N4Ly9WajhpdE1w?=
 =?utf-8?B?UHhsSThsekl3L041Z2UxLzU4TDMxOWlieHpYbDVQOVNNN21JZFZlM2g4TzVx?=
 =?utf-8?B?S21kMExZMng5YjNpRXZIajlTRHpVYmFiRkdlMHppUkZodk9sdFhnWlI0M25s?=
 =?utf-8?B?ZVV2V0FkU2tNamhEeG5ENkR5S1RGU2NGZXZqOHRhYkRraC84dmNhOHZ0b09S?=
 =?utf-8?B?NHd2K2tqTzVJS0dkYU80ZVBrZzhPREVERmduQk84V3VLT1c1bktpMG9FYWJ1?=
 =?utf-8?B?cTNUQ1NSSGEvSFlTbW1VK3Z3OXV5V1NLL0ZqRFRlUkRrcDF1NHZ1SlY2L3lL?=
 =?utf-8?B?TWxqbTdZaC85U2VES1lGUDVFL09yRWYvYUNab2NNTFJaSmNIdHlLZFZiQ080?=
 =?utf-8?B?ZDRRK001VmR4OWpFemkxWS9IR2ZTRUNyOW5jNlExTFRPUFdDUWtDekRqb0FI?=
 =?utf-8?B?YmNFU2FVZFZMOXB6Z1I0WWk2SXRxOUlIbFdZb3U3eDA1c2ZvNUFkQnhCRnZF?=
 =?utf-8?B?b1BENVA2WVJCcE9NR0RTclJ6Q3hiVHZBWjNtZE5kblVOWUgvdGhjc1FHRThP?=
 =?utf-8?B?WVZyUmk2UDVicWxDMkpkWHBBQmp1cEZoWTZOYUdPamI5ZjVlOC9reUR4RmVN?=
 =?utf-8?B?TjcycFgrMW52VDV4QWgxdC9FZFp3TTN2TmZUMTA0ZFYxd0RNS1EzSkIrSmg5?=
 =?utf-8?B?Z1lsZGV1bEVHQjgxNzEwSDZnU0x2ZFhwWERYZm9OMmJKVS84bDRsTUdnRFY0?=
 =?utf-8?B?dnBvbXVGbnFncmFGNHJjUEppMEY1OEFDaHRDanpVbG9rUVJQWEt5cE51enJY?=
 =?utf-8?B?VDdMTFZvQ2lEc2NzRm9HWHl4ZFpsRGphVTFlYXdYYmtSRkQ4bmdWUTExMWxB?=
 =?utf-8?B?WTBRMXgybWVQNWd0a2lUZFZBc3pZQ3d5dE0ySU42a0pjTXVWanVuSWludU9y?=
 =?utf-8?B?UVZDaExkbkZVMCszUlBwVzdjM201ZzhUNnhkSGZ0SGdlUGFKSXByTUFOWEtw?=
 =?utf-8?B?aUgzYlVrWlVBTHBzMkhzYmFVam1jcGJENmRJemFId2hCRnlSUE14UHdVc0pq?=
 =?utf-8?B?STc4dHcyeHd3SXoreHZWVFBYNnExbGRZMXFSd1YyUGd2QXpOTzhRUXF5VWdG?=
 =?utf-8?B?anhrY1JiZ2RuSUJKdFNGZHMyS21mNERHbHpiZitKTVZOaHNGVTNLQjFGajlO?=
 =?utf-8?B?UlNiQ054T0xqSmNPeFlBTncyUnkzUVg5VEVYeWNuTUtleWZ0UU9WbjVzbi9V?=
 =?utf-8?B?ZXZROWlqMDJSY0puUTJKNDJMaExWUUtadEZyOEExUDZwQ1hwdDVhbXpHbjBu?=
 =?utf-8?B?Y3VTTngrUHp4K0JObkxxNTA4UHdRaDdmdWxXZ0oxQkxycGJBU1d1TE1oSDd2?=
 =?utf-8?B?ZElpZnpXcHo1YWhYMkpVbUJYNWx2R0FkYmtqMDVjL2lQaldTVDNRUnN2a0dF?=
 =?utf-8?B?OGpadzEvVVFZck1GVmdZV2RnTWtBMStObGdQYmVqUFZmS2EvdGtYYmhneXJx?=
 =?utf-8?B?YjBqYXlzbytEZmwySDRVWXZCbUdjT3ZFMWVpU3VoY1RQcTNmVDhiS0xoeGVs?=
 =?utf-8?B?RU5KWDFBQTlrTHRTbEI5cWZJOFZzVHE1VVBBMXFrZlRoVU9jVWNuMWdldllY?=
 =?utf-8?B?K0FDQWM1dE5mcGJhdmhUS09uNXUzcGdrNGdRajJLQTIwZ3ArRVpESlZGcmZk?=
 =?utf-8?B?U1VnU2o2ZkR2MGhJQjAvTkdFMnFEWGROZzV5ZzZQdGpZY21sL2RGRE5LcHdX?=
 =?utf-8?B?TnBSU3ZFeTlsWGl3Z3I3MC9YWkdzeFlxVWY1Yng3T016QVBrSnFDM2diODkr?=
 =?utf-8?B?RlpySEVlek1kRzJnQ25Ga1ZjdVkxczNkR2pPTlAzOXl6OEVoYkkrZE5PUlN5?=
 =?utf-8?B?Ly9GUVJSVWU1Vjc4Q3p4UHlKcXJvYkJ6Rll5bTdDc2F1ZGo0cDg1VFdTZlhr?=
 =?utf-8?B?RmgvWjJqaS9nUGxqMVNzVC9Ra0JacjVTR0dBdzBhNTFnYURPWitZZTBDZlNv?=
 =?utf-8?Q?OVTzpXFZ6GQLNHgQRCU5XLijx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d173f8a-57e9-43ea-9568-08dda422b095
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 11:18:25.8952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqZOihWurK95iVniM/VGh2gkpX8RUjFN/MCf+2Ms92nomLrFnzDFS7OIWJzHJpfnEN43HVQtlUbdFcr2s6G0nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8567
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

Hi Soham

On 6/3/2025 11:42 PM, Soham Purkait wrote:
>      Add two debugfs node named dgfx_pkg_residencies and dgfx_link_state_residencys
> in order to obtain the G-State residency counter values for G2, G6, G8, G10 &
> ModS and the pcie link state residency counter values for L0, L1 & L1.2
> respectively.
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c | 99 +++++++++++++++++++++++++++++++++
>   1 file changed, 99 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index d83cd6ed3fa8..c339f05ce42e 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -11,16 +11,19 @@
>   
>   #include <drm/drm_debugfs.h>
>   
> +#include "regs/xe_pmt.h"
>   #include "xe_bo.h"
>   #include "xe_device.h"
>   #include "xe_force_wake.h"
>   #include "xe_gt_debugfs.h"
>   #include "xe_gt_printk.h"
>   #include "xe_guc_ads.h"
> +#include "xe_mmio.h"
>   #include "xe_pm.h"
>   #include "xe_pxp_debugfs.h"
>   #include "xe_sriov.h"
>   #include "xe_step.h"
> +#include "xe_vsec.h"
>   
>   #ifdef CONFIG_DRM_XE_DEBUG
>   #include "xe_bo_evict.h"
> @@ -185,6 +188,86 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>   	return size;
>   }
>   
> +static int read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
> +				  u64 *dst, u32 offset, char *name)
> +{
> +	int ret = xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
> +				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
> +				dst, offset, sizeof(u64));

What happens if this call fails? dst will be 0?

> +	if (ret != sizeof(u64))
> +		drm_warn(&xe->drm, "%s residency counter failed to read, ret %d\n", name, ret);
> +
> +	return 0;
> +}
> +
> +static ssize_t dgfx_pkg_residencies_show(struct file *f, char __user *ubuf,
> +					 size_t size, loff_t *pos)
> +{
> +	u64 g_states;

%s/g_states/residency

> +	char buf[256];
> +	int len = 0;
> +	struct xe_device *xe;
> +	struct xe_mmio *mmio;
> +
> +	xe = file_inode(f)->i_private;
> +	xe_pm_runtime_get(xe);
> +	mmio = xe_root_tile_mmio(xe);
> +
> +	g_states = 0;
> +	read_residency_counter(xe, mmio, &g_states, BMG_G2_RESIDENCY_OFFSET, "G2");
> +	len = scnprintf(buf, sizeof(buf), "Package G2: %llu\n", g_states);
> +

There is no check for BMG. Is it applicable only for BMG?

> +	g_states = 0;
> +	read_residency_counter(xe, mmio, &g_states, BMG_G6_RESIDENCY_OFFSET, "G6");
> +	len += scnprintf(buf + len, sizeof(buf) - len, "Package G6: %llu\n", g_states);
> +
> +	g_states = 0;
> +	read_residency_counter(xe, mmio, &g_states, BMG_G8_RESIDENCY_OFFSET, "G8");
> +	len += scnprintf(buf + len, sizeof(buf) - len, "Package G8: %llu\n", g_states);
> +
> +	g_states = 0;
> +	read_residency_counter(xe, mmio, &g_states, BMG_G10_RESIDENCY_OFFSET, "G10");
> +	len += scnprintf(buf + len, sizeof(buf) - len, "Package G10: %llu\n", g_states);
> +
> +	g_states = 0;
> +	read_residency_counter(xe, mmio, &g_states, BMG_MODS_RESIDENCY_OFFSET, "ModS");
> +	len += scnprintf(buf + len, sizeof(buf) - len, "Package ModS: %llu\n", g_states);

Repeated code here. Use a helper

> +
> +	xe_pm_runtime_put(xe);
> +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
> +}
> +
> +static ssize_t dgfx_link_state_residencys_show(struct file *f, char __user *ubuf,
> +					       size_t size, loff_t *pos)
> +{
> +	u64 link_res;
> +	char buf[256];
> +	int len = 0;
> +	struct xe_device *xe;
> +	struct xe_mmio *mmio;
> +
> +	xe = file_inode(f)->i_private;
> +	xe_pm_runtime_get(xe);
> +	mmio = xe_root_tile_mmio(xe);
> +
> +	link_res = 0;
> +	read_residency_counter(xe, mmio, &link_res, PCIE_LINK_L0_RESIDENCY_COUNTER, "PCIE LINK L0");
> +	len = scnprintf(buf, sizeof(buf), "PCIE LINK L0 RESIDENCY :  %llu\n", link_res);
> +
> +	link_res = 0;
> +	read_residency_counter(xe, mmio, &link_res, PCIE_LINK_L1_RESIDENCY_COUNTER, "PCIE LINK L1");
> +	len += scnprintf(buf + len, sizeof(buf) - len, "PCIE LINK L1 RESIDENCY : %llu\n", link_res);
> +
> +	link_res = 0;
> +	read_residency_counter(xe, mmio, &link_res,
> +			       PCIE_LINK_L1_2_RESIDENCY_COUNTER, "PCIE LINK L1.2");
> +	len += scnprintf(buf + len, sizeof(buf) - len,
> +			 "PCIE LINK L1.2 RESIDENCY : %llu\n", link_res);

Use a helper

> +
> +	xe_pm_runtime_put(xe);
> +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
> +}
> +
>   static const struct file_operations wedged_mode_fops = {
>   	.owner = THIS_MODULE,
>   	.read = wedged_mode_show,
> @@ -226,6 +309,16 @@ static const struct file_operations atomic_svm_timeslice_ms_fops = {
>   	.write = atomic_svm_timeslice_ms_set,
>   };
>   
> +static const struct file_operations dgfx_pkg_residencies_fops = {
> +	.owner = THIS_MODULE,
> +	.read = dgfx_pkg_residencies_show,
> +};
> +
> +static const struct file_operations dgfx_link_state_residencys_fops = {
> +	.owner = THIS_MODULE,
> +	.read = dgfx_link_state_residencys_show,
> +};
> +
>   void xe_debugfs_register(struct xe_device *xe)
>   {
>   	struct ttm_device *bdev = &xe->ttm;
> @@ -249,6 +342,12 @@ void xe_debugfs_register(struct xe_device *xe)
>   	debugfs_create_file("atomic_svm_timeslice_ms", 0600, root, xe,
>   			    &atomic_svm_timeslice_ms_fops);
>   
> +	debugfs_create_file("dgfx_pkg_residencies", 0444, root, xe,
> +			    &dgfx_pkg_residencies_fops);
> +
> +	debugfs_create_file("dgfx_link_state_residencys", 0444, root, xe,
> +			    &dgfx_link_state_residencys_fops);
If these are for dgfx there needs to be dgfx check

Thanks
Riana


> +
>   	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
>   		man = ttm_manager_type(bdev, mem_type);
>   

