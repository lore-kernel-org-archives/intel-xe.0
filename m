Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAF7C36005
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 23:03:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911C210E61B;
	Tue, 25 Mar 2025 23:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PU9lBEQN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4E710E61B
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 23:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742943779; x=1774479779;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VHCaChjQ7wQJGG1n7j7lqrkMhTzkW0rkRDtxvFdbohQ=;
 b=PU9lBEQNH/nb8oPkFdLyR/8dV8wHAiTIR/yQPhJAMwT/Ek/KsLViRpeY
 HXSp70rhS2MxRzn1qTEjTKTsywrozMHbpGoLnODLg/shqgHYtUBkaRNKd
 ivC79dw6sbDi5Cl+qJMHJu3LWshcloHoOtuDRpPhQ62ruwrzxODbDsGEk
 J8euurGcfhbVKfuXygaUve6Et5kN9Xj3QoVOwxP/oV7gE+HgH8Fm/M/OQ
 qcrw6HgOped8V9Lf8D3uTckQdKpS865jdFki6vyb6/AIbkfBrTH/lgY0l
 s3jRUjdGsz/QzLmc7ldVqn2f4u05r7O2kwKXFJMluhnJYp2cCNfATsRj0 w==;
X-CSE-ConnectionGUID: OCqekpjsT3qO9Sg16GUaxA==
X-CSE-MsgGUID: OxQ5cYLsRFWPQCS+X7WtVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="47866718"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="47866718"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 16:02:58 -0700
X-CSE-ConnectionGUID: e3stCXrISDWlBv+yATd9rQ==
X-CSE-MsgGUID: UJMLCrnlTHai1JtvYWXp5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="128669776"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 16:02:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Mar 2025 16:02:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 16:02:56 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 16:02:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OxbOpl2oQyOGVcKSKCZIOELQuWftLUgZLF9oT4amS8UjwkN8VSvswL21GfB5cI4fuaIsYzePJlO8xF9u7NiMGM3bfJO4qBoBT8OeDBztC3/B5khebg8aPXArMXyiHSwCiXga8PJfWL2D5Pi4ehkAAzZIV6zo6qdJFIPi+WvrC1eDhS7QjJdBpiu4azEZ33GNnuIwPg+6RwWfS/DSFYGtBjj5dW4jHUpg75w6uYPl3OjodvpqwZfxAd18XBY8aNG5ztc+OuprTe5TDFM9ei7zp6zXVR79CxQ29uOQTvUnINTVPBt731MLHAFEEa4WyPR8mKQQYTSTaY9aeVhL5U3piw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CzSq/FFoaKNklSDuYiucXcb4oAoIqH7N1NFUJTkoJec=;
 b=e0JKyp8SgDAdPR1QACWcgYUPlS/CI1yqDrwNRxqRUBGW4lacdr54uZ5ZSyXzBEHvYCpu8iVV/9G7drzfDKXvIeasjD9+/4QR95htP50LFddMaNdOOVxpRYVBCp3OptLM75bgI0EnbIKORzNtdNbfQQOKI5NsvSuU+1T6OiSny8ItNeI1FsSTbDbc7f5sZO0b4z4IZnPjcxrPFD0endaq+y6A+HIKWhkV2rCbWMDoCr9v85y6VKAmG8u9kSlfij+vMTDkvyR28rBxUd6exjbpEIAoxd54FwS0aM3ky6POjtX4FNWc9x3G1V5niKoxxS68L8Zvj6eeBwf+iFrLnK+9mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by DM4PR11MB6144.namprd11.prod.outlook.com (2603:10b6:8:af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.43; Tue, 25 Mar
 2025 23:02:25 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%3]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 23:02:24 +0000
Message-ID: <c9a6cec1-0d55-46c1-92a1-055e4d3a02d2@intel.com>
Date: Tue, 25 Mar 2025 16:02:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe/pmu: Add GT frequency events
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20250324232402.46481-1-vinay.belgaumkar@intel.com>
 <87jz8e9d3h.wl-ashutosh.dixit@intel.com>
 <b46fbbd0-ee96-4f00-9f6f-a00115feb32d@intel.com>
 <87jz8dhw0r.wl-ashutosh.dixit@intel.com>
 <33ebfe1d-5ac5-4985-8c8d-c1996e5a6d14@intel.com>
 <87h63gixq0.wl-ashutosh.dixit@intel.com>
 <269b993d-2a22-4080-8609-66650a60ad62@intel.com>
 <87frj0ivbh.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <87frj0ivbh.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0009.namprd10.prod.outlook.com
 (2603:10b6:a03:255::14) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|DM4PR11MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: e928f073-c727-453b-c5bd-08dd6bf11b5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3RyaGI3bDQ5dGVLYkd1SFhvd2xOdFlFOGtCQ2ZHNTdzd1dpcDhMellKaGo3?=
 =?utf-8?B?MFJQaStJbTFiQ0xMM0NRZEtGSnkxR1RBaXQ5c2NITm9TMEVyODlkWU1PVzNP?=
 =?utf-8?B?bnJvMlRLUStBQ21kM2J1andLSzUzSlNlUjI3ZUdoTXoxcnhEWkJVdDVpMDV2?=
 =?utf-8?B?N3djQ0xkUjlRT1dhMlJPa3ZtZGtKZjZQVnpUOXhPSTZJR3o5YXRqZ0YwaEtk?=
 =?utf-8?B?SjJ4M2o2M3p3ckNXVTJVTGtBSm8zaURqMkphT1pDZmIvTTdZSTYyd1JydVJV?=
 =?utf-8?B?WTZTeUlWcktER21BMWlTQ3hUbk5wYmw5aWdxb0dMajNJNkYwcU1wbENvMGdL?=
 =?utf-8?B?c05HSWR2OVpldFFuL1dudU4vZFJkUTNxVVdLMkpKa3RXcndPbC8ycVZINU9B?=
 =?utf-8?B?LzFqM09PN1V1ayt0bVM3UUhaZGE5TmQzYTdRVFFlQUZxWlUzdmRFL2hGbHF0?=
 =?utf-8?B?WW94UEcvQjQwUHBIdVBEQUNFNFJ5Z2N3MjRXc0R0NDJ4ajJ2QjdrY1Z4ZXRi?=
 =?utf-8?B?VFlqZkNOb3RtM2xSNC9hQk9mTUpTR2tmUmdkZWZvQ2xwSHhkb1Y1YUovdkJM?=
 =?utf-8?B?QUlxNW4zOFl2ZUFwQzhKYWcvZWdYWEdvc3FPTWwyakZCREhjOVJCWDFISUJH?=
 =?utf-8?B?dkxkbmxrTWpobE9uNUhkTCtKNVZvSlVoWTdVTThncHV1RTNMdVFuNVhJZVFX?=
 =?utf-8?B?ODg0bkxHU3ZYVmdyR0RzT29OVFdTR1g1VkhwcVhGdUIzeXlRSVdFemEraUt1?=
 =?utf-8?B?WllyMUtXUERtcXpVM1NaeXp4MjFKWmhPSEo3aGFYejJrRWc4bHozaEhYdkdk?=
 =?utf-8?B?cCt4MWRKcUhpamxPekt4WHRQbUR2TnZXWEpWaVNvK3lDazhkSXZNTldDc0t6?=
 =?utf-8?B?dDl1VjA1RzFCdnlaZmx2L3dDWWdTTTRKUmdBZk5MTklsV25NbCtLN1NodEVw?=
 =?utf-8?B?SkVpQWI4TUdwZTRFNXdqL09sL3pmbVJuQ01qaEcvaktYMXZkUmtTTXhOZ1pG?=
 =?utf-8?B?VkFDMzhLRnZqOUIzS2pkczFtMThEYk5xZVlzSThtUEJQMFJ4SVhWL1dXczk2?=
 =?utf-8?B?R0c0NlJHZ00rd2M1dXNmWWFvanJ0d2RYalBINGRvekFyeVB4azV0TC9KaS80?=
 =?utf-8?B?bENiTC9iMXlBZ2pkK2ZFRzc0ZGJxaWlVUDdSWVQ1REpNbXQ5cGQwUVN6YVU1?=
 =?utf-8?B?MnR1NjFmRVlGQlZvN3ltdEpidWl0R3hVb3NvREpXa1VTT1V5Y1UzRDVPQjVU?=
 =?utf-8?B?VVprUCtGdlBnQnk3ZkRkZGJJSHN4Sm1XWVY1K1AwQWhuQmN5c2JENWJ4b3Vh?=
 =?utf-8?B?KzFsUDVtZ1BkYTRNTnRVeDV1U1BoMUk5UHNub2FMbkNNcTBLRmFmSWFXUXJL?=
 =?utf-8?B?dmVvY1VzNVhUY0VybUhibjl4WXF2YVR1SWZIbGVlUVpWYXBEdFdvcEpyOWN5?=
 =?utf-8?B?cW52SVczZmNvcGFlTnUyWjR2VE4rUTdBc2R3SkNxR2llZUt4Y3RxdEpLT01G?=
 =?utf-8?B?VDE3Kzlka1REZ3Q2RFhDN3QweTF1KzBhcDRCNC9OZ1BpSzdDTzhkbm9iL3NJ?=
 =?utf-8?B?RnNRdk5MY0hFMjNiUWVvaVhJWVp1QUdVNnh3TXBmWS9yMWhpdmx4c0xIQ2x2?=
 =?utf-8?B?NlpPbmtFUm1HQU1MU012bi9EMGxaSzg3R3FMYmZsUytveUxoMDJ2L2Yrdktu?=
 =?utf-8?B?cmlGWFJFeW03R3RmclFQTC80aklrZG8yaTNwZGdMYndhYW95blRvS1hSK0xh?=
 =?utf-8?B?U2VpRFdjcS9mWUlYbldoMythZmJhc0ZIY2lUOGNCZXVWUTBhMVpYZE83Y1RB?=
 =?utf-8?B?dGRYbjJyRG1wY2NrREhZWTFuZnZYaVI0eDk2NDdWcVB5bTl1QVRwdWlUQzlC?=
 =?utf-8?Q?TW0PJvx9i3lPC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3ZYNkdxRU1ST3RHdEdTUlJROCtGT2FoUHRlWkZkcXVoMnJnUWpUQUxOZVhQ?=
 =?utf-8?B?bUppSStDTzhtK1RGQmRtN3JGV1hYaDFyZTFSR2JyYmlHb2l2R2dDWFRrY1FN?=
 =?utf-8?B?OU9oUXBIVEJGSW04dFdpays4d1haUWR6WFlzZVl1aEhGK2JvaXdYZFRYRU9J?=
 =?utf-8?B?Wm11djB1a3BOa210dG56TnZBTklkTEhQK1JESnFRNUgwWnl1NEpMVGYvelVx?=
 =?utf-8?B?WUJOU0hHSDVKWGkrOTNmdGE4SWFBd05rTUw4V3VsbmxXL0lHRS9LcmNzSDR0?=
 =?utf-8?B?K0tvanpvY0QwVFR3dEU0Umo0TXErSi9LS0FHTGVSUWNBUTBFSnY1OTQwQnNV?=
 =?utf-8?B?OUdKMEkwZjJ4K0wyL2V4c0pMd0psb2lRcFVlNURoZlVMMzNuRGdRTEViUjVw?=
 =?utf-8?B?ejFYZFEyWWFqVVFKcW1QVERRZlpqb28zdXJPbndiTncxNmdNOUdyYm4zeU5v?=
 =?utf-8?B?eHR4MTJ2QVdDT2VYM00vU09hVzg5SUZ4VGwwa2JjZ0xrZkwyb3ZFeFVhK2hV?=
 =?utf-8?B?QVJwenBLNzVZM2JKSFRab1Fhb1pmTHFYTXcyVWNaaGx1SXI4U21idnN0OHRN?=
 =?utf-8?B?Z2RDemZjV2p2L3BNTlRWNlIvOG1zaFBva09qeGxWT2hQbnZsUTZaTS9UWnRK?=
 =?utf-8?B?SmtPSWE2OUR4cmIvdzJONTRrblgrd0VoRi9HVjBWTW1UdDJlb3p4andheVJr?=
 =?utf-8?B?ak9CZHhaVGFyMFBwWVN6S1ErZ0lvdnVkdmlreUUwVExWNGtoczQ3UjRtekRF?=
 =?utf-8?B?SHU5SWtqVTBBY2hXVGRMU0tnWldhUUQ1QjcyWWZrWWltZTVzaGRORzBuUTZm?=
 =?utf-8?B?ekg5c3lraU05U29yd3YrWU91MGhHZjdCbzlDYXpZMi9NZG9wQm1JSkZWTE12?=
 =?utf-8?B?TTBGU01aSUhBRk94OEY4MlFnY2h4ZDJBY1BjaU12WDJVU0g1TkYvQ2NXQWg5?=
 =?utf-8?B?TDA1TFRrS0RWWXB5L1NNcDByZUptTEkzYnowZkFSdDNYZ0VES1ZXT0p0bG1U?=
 =?utf-8?B?ZXkxbE44cHRhOWx6SlF6aXltY1RVTEEyNmQ2QzZ6TkpweGlOdTZpaXhkeHRE?=
 =?utf-8?B?UmFkMlFsVzFXb0gwN1JjaHlxTmhkZ3ZVbjZoeUNkbjZsaEE1VmVXbzR4Wk5V?=
 =?utf-8?B?em1QQlY4Qmk4MnNyZW5oaTBEcTlzWmFPMTZzTStDcXJPTFEwMGdRcFlSUStE?=
 =?utf-8?B?TkxMT0FQekg0NTQ2MVc5eVNGYkNiWHpVUkw1THRxRkd2ZkJRVTk2c01yK2ho?=
 =?utf-8?B?WWlwQVJTbEVVUy9CdzdocTJlYWE2eW5mRkc5eWp5ZUFBbWl4a2hwYWhCNlpT?=
 =?utf-8?B?VGd4Q0QwUWZpUTFlL2NNL0pKZDNCTE5zb3drY0czNEtxWnNDeVEzVVBjRHox?=
 =?utf-8?B?bms2OG9TSnl6R2lqbW5lbTU4VmVvZWRHc1IyRUZLT3NyT0R2NHY1akE1Y1Z0?=
 =?utf-8?B?WG5kMy93UmtHZXN0K3FpenpDTzdOQUNOek5nemNOWTdDVW9qbXI4TEl3cFRS?=
 =?utf-8?B?ZjZkVHVrNTBDV09WRkx6dWhSSmVBV29wYmNYUzVPNjNvUUgzTXk3V25MZCt6?=
 =?utf-8?B?L210ZlN5V3VsRGFITlhsenlCZ3R1aFpKNUhyVlBwVTg3NTh6bHU4bXg0R3Ez?=
 =?utf-8?B?Z0lRSUdjamFMV0pHZ2ZuQ2M3bkdaUjlSZlN5YVpaaFZYTm01Q1BPbVArVDFj?=
 =?utf-8?B?Y25nS2liZlRxUDJFKzNSOVJlelFmNjA4UXdiZVd1VWFlWE1YQWpTS2hZaWo2?=
 =?utf-8?B?L05jS0d3WVVVeW5qWjJOWlhidHJwdE52aEZ1S3FMRXd0U04vRFZxamlhdExj?=
 =?utf-8?B?bXloTHREOHNQM1VhalpETkNZZVBuQnN0NzYvMGx6Nk1Pd3kvWkZFSTVEc2Zw?=
 =?utf-8?B?TW5Ra3ZZQVo0SnJhWHl5UEN4UkorTHNpYXpOMi9veUk2NjBMS0JzRFNpaExP?=
 =?utf-8?B?TTVDUE43VkVMMWZyYlNlMDRFTzVVSHFka0I0NmFXWUJqbDM1RGRyT1BkTmlw?=
 =?utf-8?B?UVlwTVpsVlVPVk5pYTFpaUVxSUhZVzJ6TEI4SEY0WHdlZkhlcnJDbkk4RnJK?=
 =?utf-8?B?Ykc2RzdBQlVPUldza0dodmNYMDM4YWp3VzNmdllRUXE4a1VQNXpaWjRCQll4?=
 =?utf-8?B?SFFZSUJud01Ub1k3VW1nQXdmOGh3QUlxOWpCVmYwN1pucHpTbE9HbkxuWk80?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e928f073-c727-453b-c5bd-08dd6bf11b5d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 23:02:24.8659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +23XDni4btxlOZ1//hRJfA9BcwfDLiqzzbgJjTksOjKujr+giPnyasOBoVBxRP7nILYw6Kp16pIZfQ9oIsP74res2S4Thqj9ANZRgZsRtYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6144
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


On 3/25/2025 3:45 PM, Dixit, Ashutosh wrote:
> On Tue, 25 Mar 2025 15:01:47 -0700, Belgaumkar, Vinay wrote:
>>
>> On 3/25/2025 2:53 PM, Dixit, Ashutosh wrote:
>>> On Tue, 25 Mar 2025 13:33:43 -0700, Belgaumkar, Vinay wrote:
>>>> On 3/25/2025 10:15 AM, Dixit, Ashutosh wrote:
>>>>> On Mon, 24 Mar 2025 19:37:32 -0700, Belgaumkar, Vinay wrote:
>>>>> Hi Vinay,
>>>>>
>>>>>> On 3/24/2025 5:18 PM, Dixit, Ashutosh wrote:
>>>>>>> On Mon, 24 Mar 2025 16:24:02 -0700, Vinay Belgaumkar wrote:
>>>>>>>> @@ -266,11 +274,24 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>>>>>>>> 	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>>>>>>>> 	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>>>>>>>> 		return read_engine_events(gt, event);
>>>>>>>> +	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
>>>>>>>> +		return xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
>>>>>>>> +	case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
>>>>>>>> +		if (!xe_guc_pc_get_cur_freq(&gt->uc.guc.pc, &cur_gt_freq))
>>>>>>> This is unconditionally taking the forcewake and waking the card up just to
>>>>>>> get the sample. Do we really want to do that?
>>>>>>>
>>>>>>> So if we don't do that, both the actual and requested freq will be 0 if gt
>>>>>>> is in C6.
>>>>>> For actual frequency, the register(0xc60) does not belong to any fw domain -
>>>>>>
>>>>>> GEN_FW_RANGE(0xc00, 0xfff, 0),
>>>>>>
>>>>>> HW will report 0 when GT is in C6.
>>>>> Yes, no issue about act_freq, see commit 22009b6dad66. I was referring only
>>>>> to requested freq.
>>>>>
>>>>>> The requested freq register is a
>>>>>> shadowed register (0xa008), so that will not accrue fwake either.
>>>>>>
>>>>>> static const struct i915_range mtl_shadowed_regs[] = {
>>>>>>            { .start =   0x2030, .end =   0x2030 },
>>>>>>            { .start =   0x2510, .end =   0x2550 },
>>>>>>            { .start =   0xA008, .end =   0xA00C },
>>>>> So this still doesn't make sense because:
>>>>>
>>>>>      1. The fact is that xe_guc_pc_get_cur_freq() *is* taking forcewake
>>>>>      2. And that is in accord with the following comment in i915/intel_uncore.c
>>>>>
>>>>>         * Shadowing only applies to writes; forcewake
>>>>>         * must still be acquired when reading from registers in these ranges.
>>>>>
>>>>> Also see intel_rps_read_punit_req() which is called from i915 PMU
>>>>> (frequency_sample()) and uses with_intel_runtime_pm_if_in_use(), so we'd
>>>>> need to do use the equivalent in xe.
>>>> Hi Ashutosh,
>>>>
>>>>     As part of a previous decision, in the Xe PMU implementation, we are
>>>> doing a runtime_get() during pmu_init for all PMU sessions. So, device is
>>>> going to be awake anyways. In this case, it does not make sense to just
>>>> read the register without a fwake.
>>> Even if that is ok... Let us take a completely idle device. What should the
>>> actual and requested freq's be for this case? Both should be zero, correct?
>>> Now, what are we going to show if we are taking fwake? At least the
>>> requested freq will be non-zero? Is that ok? Or the requested freq will
>>> show zero even if we take fwake? Thanks.
>> If we take fwake before reading, requested frequency will not be zero even
>> if GT is idle. HW always retains the last requested frequency in that
>> register, never zeroes it like it does for actual_freq. So, showing the
>> non-zero value is the correct thing to do instead of artifically zeroing
>> it.
> So now, this I disagree with. For an idle device, hopefully in C6, there
> should be no reason to request a non-zero freq. So the requested freq
> should show 0. As i915 does (using gt parked and unparked states and using
> with_intel_runtime_pm_if_in_use()).
We are not requesting a frequency when GT is in C6. This register holds 
the last requested frequency by GuC (before GT got into C6). Also, just 
because the register is non-zero doesn't mean GT is not in C6.
>
> If we are already "doing a runtime_get() during pmu_init" (as mentioned
> above) we need to devise some other way of making this happen (maybe by
> looking at xe_force_wake_domain ref field?).
I still don't understand why we should show zero requested freq when GT 
is in C6. We should show the real value of that register. The use case 
for PMU is typically when a workload is running, not when GT is idle. 
There are other ways (sysfs, residency registers) to find out if GT is 
in C6 without needing to show an artificial zero value.
>
> Let us wait for a second opinion on this. Thanks.

Sure.

Thanks,

Vinay.

