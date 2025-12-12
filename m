Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15040D59D8C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 19:47:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9C810E796;
	Fri, 12 Dec 2025 19:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eZ96HHWf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B294810E796
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 19:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765568830; x=1797104830;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2LnqdkJottlLw2QZBFr3My4hKbvNB6pDmDeYAfXyAAo=;
 b=eZ96HHWfOe3r46Zz+K2yoEe5UgiONhGza9EDOr30w2fppMiLaP5spmEf
 loYrb/IT0eyJJv1J09pQhsAmzfNNVtx5Dj91IVu4tt3lqHOEEoXNIDB/b
 5gfhrcZqfCWJKPH/FD3TwthF2TW3wtCxTJfFjKBEGphCbR8AHzIgoDNi3
 UII0CZLA6UcpTRljlfNlD38+2Jsd85PpUsNZ7DuU80XH/q1dbohLx0HWc
 lgMmWzIATgABubI3JN2OrVQKmU5RzxYfjFe50q3cdBzsuZ0FLX/3OLO8u
 yrznwwRiWm9ewh86a1QQY5QDtuz4kLRUcwjOnEGX4udmjpNEt2wd1zhSa g==;
X-CSE-ConnectionGUID: U+vedVbVTuazGMOSxL887w==
X-CSE-MsgGUID: 67XeKwn4QGuqrfEQu8NgyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71437812"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="71437812"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 11:47:06 -0800
X-CSE-ConnectionGUID: OhbOT4phQ8Cp7/tarfW+gA==
X-CSE-MsgGUID: ELROoF/iQ9uaG9v/W4LSAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="197662701"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 11:47:06 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 11:47:05 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 11:47:05 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.20) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 11:47:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EKg1kD2rMkxqXwU4Ir0vGa8/ft1HaVL8OxY7YIfk1X61sd3D0Nz7soaI9sqVRQ8Xb4vTBZFJj+TYdDQDBIyVx3lRlYjzweBmEC8Vxgum4WNFSZwzQQqHmBtCGJMD6u0T4o1VFg3WVJmBzB82xkVzetdaKFCoh+IncfLOh8Nydr5joURE6hMmy/675BUqpKGDaxEXWSnGXTnwnOrg9hwR/D/4D5NwvAPH0XYwWjKQxglGi9mzRbjJRIgx0Ka/iIPluwvBHww9janDjH1C970koozjjrjl8W9MArG929dRnbN5nPwpkussdh7z9Hlrv3LsW8uyGCgInHngZeHRwc5Sjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qj+0O9B/5RMubMcZ4NHIPajEsIft1dN8RpHTbdnefdU=;
 b=FbJRl8PuaVMss1nlWJon8XXY7C00wCy8D8I6kdn+W/mhBVRYwFodYr4OWDnb4qD5Y/LV16OStjUeypq+f1wyDfSh33H8V+MXypuILjTR6U80zU7RuBz9+1ALq9kdkMo82SbO/ZlLLBnJVdaIHH2oAlNCnwBPHcKLMYS2nylOQmjjmAH0YbHFxt2q4hDNduWpgzsccn+QFEsGBsBJmxiUh3A2rtXW5lK4wcjlPcblxeUigN164jKWp2+MhY8PRQ9cHwMoG9gNfVoQUxpgl8bZuj5FHys8HvvuyVGhHY8LGAhF05+4JAlA6UbmM5WnjadQBkjTT1v43V8kfOajWgjj0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA2PR11MB4905.namprd11.prod.outlook.com (2603:10b6:806:117::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 19:47:03 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 19:47:03 +0000
Message-ID: <b46aa249-d5d1-410f-ab15-59fababf964f@intel.com>
Date: Fri, 12 Dec 2025 11:47:03 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: Introduce IF_ARGS macro utility
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251212173449.192639-1-michal.wajdeczko@intel.com>
 <20251212173449.192639-2-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20251212173449.192639-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0055.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::30) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA2PR11MB4905:EE_
X-MS-Office365-Filtering-Correlation-Id: 22e9fc89-feb9-4743-1276-08de39b738f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1ZGSkVDQUNSbVJSazdPUVFaWmQvN1cxYmhrWWtaT2cyY0VzUlpCVTMyeTY1?=
 =?utf-8?B?bXBxVUhHM0lBdlR5RWZzWVF0MXg3UWZVODhMdGd4S1JzYVU4TStqaTZQVFlU?=
 =?utf-8?B?SVJJSng2d29kcVRqamRDQldjTDhTTXRFOVNhZmNjK3E0dk1wNlUzY28vTXRX?=
 =?utf-8?B?WTluWmFYeDJmblBUTHYvY0ZWQzJqYjMvbjM0c3RUeWJZTDk3RTQvYTRCZWtY?=
 =?utf-8?B?TVo5ZGJqRFZKa2VjTEFqVFFXb0FHN2NwUTkvR3BMYmhtNWprbko3NStuMnlO?=
 =?utf-8?B?Sk9tRzhSa2pINUpnS3duYTFuZnFqc2VablMrQVBsbmdwcGJ6UUhMSENIdVNV?=
 =?utf-8?B?bFhBZGR2OGVsbzJYeU1BajZ0UWNlbDVJMExFMThLSXg2Z1ZBbzg4allzUlVO?=
 =?utf-8?B?cWJFR0VYWUJZRE15SldHbWZuUHkydXBTWXVFajhyTGJkZ0ZsVUFIcFplcXNa?=
 =?utf-8?B?Z3JvKzZDZE9NbTBxRHR6cU1VemhSVWpDTkFpVTQ0RjA5eDFqN3BGZmNsWDht?=
 =?utf-8?B?S1J6c1ZMZ2UyYjViUGs3NkFXbHRMNWZudmt4a3g0N2oxRUpqNm96NWhqTkgr?=
 =?utf-8?B?U09heXV6S3owZjVEVU9hbjRCTWxhZmhYQWJRQTRCb1llMjlmU0pUdEVpZmw1?=
 =?utf-8?B?bmIwLzF5Sk5MZHVpV1dqMWo5S1ZDZVBDRk5nNzdpKzREL1BQbXdoWFcvNUtZ?=
 =?utf-8?B?RmpWRndoOTU2UTdDTHdQWEdwall2SkM1UDZBU2tVMWlFMDFJZHAwMXpPNzRQ?=
 =?utf-8?B?Z2h6UHNhOFRMV3JLQVUwRm4vcXNLbXh4UHpmNXk4OWZjcVc2Wk1MaDlPb09Q?=
 =?utf-8?B?eDhQNHlOdVJqY3diMVJQZ0F5amVGVHZHUUlRTGk1ODNkYnU0dkNHYy9GdVpE?=
 =?utf-8?B?T3oxOXBERUluOHpiZXBzeStsS0JNa2V5TURWK3hUU0x3cjZTR0c5Y3pHM0dE?=
 =?utf-8?B?Ty8vYTYyYzVaSVlWUGRWUGFGaFRpYU1hQlEvOVE5d21sVGhBR0pFSjh5T3Zh?=
 =?utf-8?B?RktxVUN4M25wZGpSb05nSEVoMzhjbjlEMVl1QUY3UUlzeTdzSzdJRHlkZXdX?=
 =?utf-8?B?ZUJ5YnUzRkNVd0NpVGszazM0R0N1a1hpcm45YTR0QSs2T3VIS1hzQnBneGdy?=
 =?utf-8?B?ek8vUWt2SSt2MnNzNlBJRTFKMGVZNlYyQ01ieFdabUprL1ZwTmFNZUNuRkZk?=
 =?utf-8?B?bHJ0aTlUdmVIa0pFbDJsRlZZZXJvdkRjbWRzWVNtUlNLclhYalJQbCtIQ0Ry?=
 =?utf-8?B?WlVmbkl4UFBwUUI4ZG5VR1RlN1N2bGFIVEVCUGpVZlZrZ1hCeWQvdkJaL1Nq?=
 =?utf-8?B?Z1RESlk0UFhXcTdMOWFJRld4MWRDRjNqVVNmQWVEZkY0TDFtWXBhZm13UlFC?=
 =?utf-8?B?NEZCRytBYVBtdmdJK08vc0tJcDc3MXRYaUVneWNyb2tmU1cxbEpsKy9OWk45?=
 =?utf-8?B?bnZtUElDcE5ZNnZyaFZ5YXEvYXRmM3F1ZFJ5c21NK0pSN0pHK0JMQjZyZm5K?=
 =?utf-8?B?di9RZmZLWTlsQ3VqeURPZk03QldGNkxLYThWWFFCZVNIZDNsWXNVTnMyMWtW?=
 =?utf-8?B?RmtuRkhMZDFLREMzYzdqMzVMWklWMWNSNGRXVjQyRTZMQzl1Sm5hYWtTS01T?=
 =?utf-8?B?dTM3MnZpNklXQkUzdVBGaHFPTGVYMUhVbnNEbllYTXpjclBmck15VExXZnBz?=
 =?utf-8?B?enJDb0V2MXpwWjA3S2hUQmpYOXZpcWJHSmo5Y1dwWURWb1FhcGVxVDRtYWlD?=
 =?utf-8?B?VzIxRlNWTGpQYzVrRGUySjNieE1pNlhybnUwTG5TbUJyRDhqYU1pVVJVa3dy?=
 =?utf-8?B?ZlNENWsxQ0dNYXd5akFCSjMrT0dwbE9oaHNINmxsVzZtYlVHS0lHOHdUTXRo?=
 =?utf-8?B?V0Q1SzE1UDNqMXg3RDBRb0ZRTFdVRjAyeExHWC94Q1E5dEJvUndIYlV1QmxQ?=
 =?utf-8?Q?thsdQMpiNKiHAVCgNitbDbugEcyyfvha?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0EyM3VzSEtYNE0vMkszZGtCenhraGpzV1pYbDFUZ2ZYa1V4V0ROTm9jRk55?=
 =?utf-8?B?aDhxcFcvb1RlWGRQeFo0TDcyV1o4L3NiZ003Nm5UK0F6YVYxdzAzUlZBTDI2?=
 =?utf-8?B?c09OeEw1MG80UGNFQkppbXBSNGNXVWV4enVsU2J0cThhM2NLemREN0RQVEdi?=
 =?utf-8?B?cWJybVdHTzJyTVp4TXI0M01kVDlpTjdJdzdzL1hRSVgvQTAyKzZlTkxEVGpY?=
 =?utf-8?B?eVd5ZDBRUzFnUVBodU1CMWlJcFRWSUQ5SndsRkwxWkNpQTVqSkxTYktSbU5T?=
 =?utf-8?B?NEdDSmJXdEVSSHRtOVR6UDY3MUFLY3FaQlBLTkVTbXU4MzczTU9zTDBBTmJX?=
 =?utf-8?B?YjVrdEh0OHhxRXRJWGI0VHlDbGVYNnRWQm9BcGdjYUVKQllqSlJ4UGVYTE82?=
 =?utf-8?B?MFpRczhsTk14bHZFNW16QzVncXUydlJlazhNL2FEeFNHLzc4MkRjNDBJbDJJ?=
 =?utf-8?B?Ri82aXF1SnQxVy9xUkFIOXhURnIxYXo1bFBobjRQdWhGa3c4T1ZodXBqNlJC?=
 =?utf-8?B?TEtPYjNIM2dCd05mUkRNak1HWlE5Vm9QR0pvLzFXM2Z6NUZUU2lLTUhDWS9v?=
 =?utf-8?B?YmpvYkZ5T1ZkSi9JMVRHRXlzTzB1TTVQbzVvNlRMV1N0RVJqRC9NaGY0dlcz?=
 =?utf-8?B?VDVyczM5Z2xiUlRUQ2I5KyszL05PKysxRDVDcGlUa2ZXU3lWa0M4SlBmVkl0?=
 =?utf-8?B?OWNCbXpZY25EYVVqOXNFU2FrRmN1dWUxam9qeTZkZVFZanM3UGl1S29oUkhy?=
 =?utf-8?B?VU1KY2lyWjYvMFFZcVRKbFVTUjFqNXczOU5OV0JxKzlydW1QTU5TZVBxMWFt?=
 =?utf-8?B?bUEwcDhBcjZxdHRNdDBJOVdJY29jQmtNT1JYdzRXNlVPbFhZV3VvcGtja1FL?=
 =?utf-8?B?TWJKZWVUNnV6MDk0YktBcFdqSGNsY1VvcE5PTHc5bU9wRkFJN3BUQU9aOFJB?=
 =?utf-8?B?TjJzb05Kd3NWTUtBWG1leHZkcGF3WFZSL01Kc2MwZ0NYZ0luVlB0VVRTWXRC?=
 =?utf-8?B?ZHV0KzZ0YzEzNy9adFc2QnNkSC9pWTlhWkl0YWlwYU1oMHhKck1XbjNiVnlY?=
 =?utf-8?B?WThsNi9IYzlRR01Cak42bC9DL3Z5Y3FnR3BMR1JBa3Urd2dZbzRxb0Vpak5n?=
 =?utf-8?B?K0toSjBXakRRRXRXbVhVWHh6YkovYk9kOCtTRkErOWlvQ3J1TEJWN2QrZkhP?=
 =?utf-8?B?bktiMHBKUWVPK3krSmtOdDluWGFtSk1UcEMvQm92T2djU3NzZnNWOThINnB4?=
 =?utf-8?B?clZybzVYeVdaVFBnS1E0bGJGWHdtTnhLeEhJelBjR2VtRVJRRFJMaGtONWp1?=
 =?utf-8?B?L2pibzRQRXJuWStqQ0djTE9mYTdFSmFmZUZlT21BS2dEWHVxMUJFbTZPRXRZ?=
 =?utf-8?B?WjZubjVpYXhKOGdwN2Jyam5jYzdZYlFqNnNNOTJtcHpSMGRjM1hKc2xZQ2Zv?=
 =?utf-8?B?Tm11WWN0WllwTjJ5V1dDY1Nwc0JQQnFXV0c5WEtaYitldkthQmJYR2NseE1L?=
 =?utf-8?B?Z0F0aXRSbmYwTERQVzJoNDRwWkkxNnFuZHJQTFNTbTBxR01zOVVCRmRCUDZQ?=
 =?utf-8?B?UjlyOWRBQnNISmJ5TEdoNERtdjRGSTJ6SnpoU2hvaTNjNnNGRjIvV1gxZ3hX?=
 =?utf-8?B?QXVGN2JVcnFRL2toZFJKNGJsK2dWaDQ2ME53c3BPZ28xemRKdVNjYjhnbnZ5?=
 =?utf-8?B?dkhMRjZOc1R1UlZIakhXVDdDRkFrRHRHcGNiaFNWMlRTSVVQTVp2UlAyL3JJ?=
 =?utf-8?B?dDVpejJqZTZ3c1F2bkxDL3ZRTHlvbU1xZDRNZmxQZTJlTjRwMDczVlpjMVRx?=
 =?utf-8?B?RzRXRExHVGQxRklDWktMcDRsSjJ2RXdHczhOcFdqaDc5QU1mMXNJNVMyUnZl?=
 =?utf-8?B?c3NFWlFZT0pNZ2VmaWg3NU5GeDQ1c1ZSc1NRczhXeWNZaHpsb3RBMC9EM2hJ?=
 =?utf-8?B?cXdldmRKY3JQRGgvZmdpSEFKVFVvMzhIb0UrU1ZaNkxkdUdSQTZDZldXcURZ?=
 =?utf-8?B?c1JhbUZ5NmIrb3BPclNVZm5zNEtKM3d1M1lZSk5CcHJQODhDc2FpYmZzRjBM?=
 =?utf-8?B?dnNLMlg1bnJnN213ZnRHNjB4c1RwTU0xdXVtMmlvKzlmSE03VEI3TGU0RE1Z?=
 =?utf-8?B?NUNTNWc3K3psdW1uSlErUllWMWd2SE83NEZlaXBIY2VWTDNVSkJiei9NdlUw?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22e9fc89-feb9-4743-1276-08de39b738f3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 19:47:03.2089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nml0rbMMFOQpiv+UfnvA4AhdKtFcdkVyvY1NkVG4XqvElOaWs0IW8SoJNKwtNnVea7EIhDutqRHcZN9dfAm5V/HbjJiSCFEM/6Vf+d006bE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4905
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



On 12/12/2025 9:34 AM, Michal Wajdeczko wrote:
> We want to extend our macro-based KLV list definitions with new
> information about the version from which given KLV is supported.
> Add utility IF_ARGS macro that can be used in code generators to
> emit different code based on the presence of additional arguments.
>
> Introduce macro itself and extend our kunit tests to cover it.
> We will use this macro in next patch.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_args_test.c | 53 +++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_args.h            | 18 +++++++++
>   2 files changed, 71 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_args_test.c b/drivers/gpu/drm/xe/tests/xe_args_test.c
> index f3fb23aa5d2e..d11ea610f67a 100644
> --- a/drivers/gpu/drm/xe/tests/xe_args_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_args_test.c
> @@ -78,6 +78,24 @@ static void pick_arg_example(struct kunit *test)
>   #undef buz
>   }
>   
> +static void if_args_example(struct kunit *test)
> +{
> +	enum { Z = 1, Q };
> +
> +#define foo	X, Y
> +#define bar	IF_ARGS(Z, Q, foo)
> +#define buz	IF_ARGS(Z, Q, DROP_FIRST_ARG(FIRST_ARG(foo)))
> +
> +	KUNIT_EXPECT_EQ(test, bar, Z);
> +	KUNIT_EXPECT_EQ(test, buz, Q);
> +	KUNIT_EXPECT_STREQ(test, __stringify(bar), "Z");
> +	KUNIT_EXPECT_STREQ(test, __stringify(buz), "Q");
> +
> +#undef foo
> +#undef bar
> +#undef buz
> +}
> +
>   static void sep_comma_example(struct kunit *test)
>   {
>   #define foo(f)	f(X) f(Y) f(Z) f(Q)
> @@ -198,6 +216,39 @@ static void last_arg_test(struct kunit *test)
>   	KUNIT_EXPECT_STREQ(test, __stringify(LAST_ARG(MAX_ARGS)), "-12");
>   }
>   
> +static void if_args_test(struct kunit *test)
> +{
> +	bool with_args = true;
> +	bool no_args = false;
> +	enum { X = 100 };
> +
> +	KUNIT_EXPECT_TRUE(test, IF_ARGS(true, false, FOO_ARGS));
> +	KUNIT_EXPECT_FALSE(test, IF_ARGS(true, false, NO_ARGS));
> +
> +	KUNIT_EXPECT_TRUE(test, CONCATENATE(IF_ARGS(with, no, FOO_ARGS), _args));
> +	KUNIT_EXPECT_FALSE(test, CONCATENATE(IF_ARGS(with, no, NO_ARGS), _args));
> +
> +	KUNIT_EXPECT_STREQ(test, __stringify(IF_ARGS(yes, no, FOO_ARGS)), "yes");
> +	KUNIT_EXPECT_STREQ(test, __stringify(IF_ARGS(no, no, NO_ARGS)), "no");
> +
> +	KUNIT_EXPECT_EQ(test, IF_ARGS(CALL_ARGS(COUNT_ARGS, FOO_ARGS), -1, FOO_ARGS), 4);
> +	KUNIT_EXPECT_EQ(test, IF_ARGS(CALL_ARGS(COUNT_ARGS, FOO_ARGS), -1, NO_ARGS), -1);
> +	KUNIT_EXPECT_EQ(test, IF_ARGS(CALL_ARGS(COUNT_ARGS, NO_ARGS), -1, FOO_ARGS), 0);
> +	KUNIT_EXPECT_EQ(test, IF_ARGS(CALL_ARGS(COUNT_ARGS, NO_ARGS), -1, NO_ARGS), -1);
> +
> +	KUNIT_EXPECT_EQ(test,
> +			FIRST_ARG(CONCATENATE(CALL_ARGS(IF_ARGS, FOO, MAX, FOO_ARGS), _ARGS)), X);
> +	KUNIT_EXPECT_EQ(test,
> +			FIRST_ARG(CONCATENATE(CALL_ARGS(IF_ARGS, FOO, MAX, NO_ARGS), _ARGS)), -1);
> +
> +	KUNIT_EXPECT_EQ(test,
> +			CALL_ARGS(COUNT_ARGS,
> +				  CONCATENATE(CALL_ARGS(IF_ARGS, FOO, MAX, FOO_ARGS), _ARGS)), 4);
> +	KUNIT_EXPECT_EQ(test,
> +			CALL_ARGS(COUNT_ARGS,
> +				  CONCATENATE(CALL_ARGS(IF_ARGS, FOO, MAX, NO_ARGS), _ARGS)), 12);
> +}
> +
>   static struct kunit_case args_tests[] = {
>   	KUNIT_CASE(count_args_test),
>   	KUNIT_CASE(call_args_example),
> @@ -209,6 +260,8 @@ static struct kunit_case args_tests[] = {
>   	KUNIT_CASE(last_arg_example),
>   	KUNIT_CASE(last_arg_test),
>   	KUNIT_CASE(pick_arg_example),
> +	KUNIT_CASE(if_args_example),
> +	KUNIT_CASE(if_args_test),
>   	KUNIT_CASE(sep_comma_example),
>   	{}
>   };
> diff --git a/drivers/gpu/drm/xe/xe_args.h b/drivers/gpu/drm/xe/xe_args.h
> index 4dbc7e53c624..b24e6d3349bb 100644
> --- a/drivers/gpu/drm/xe/xe_args.h
> +++ b/drivers/gpu/drm/xe/xe_args.h
> @@ -121,6 +121,24 @@
>   #define PICK_ARG11(args...)		PICK_ARG10(DROP_FIRST_ARG(args))
>   #define PICK_ARG12(args...)		PICK_ARG11(DROP_FIRST_ARG(args))
>   
> +/**
> + * IF_ARGS() - Make selection based on optional argument list.
> + * @then: token to return if arguments are present
> + * @else: token to return if arguments are empty
> + * @...: arguments to check (optional)
> + *
> + * This macro allows to select a token based on the presence of the argumen list.
> + *
> + * Example:
> + *
> + *	#define foo	X, Y
> + *	#define bar	IF_ARGS(Z, Q, foo)
> + *	#define buz	IF_ARGS(Z, Q, DROP_FIRST_ARG(FIRST_ARG(foo)))
> + *
> + *	With above definitions bar expands to Z while buz expands to Q.
> + */
> +#define IF_ARGS(then, else, ...)	FIRST_ARG(__VA_OPT__(then,) else)

A bit confused about the __VA_OPT__ support since it is officially a C23 
extension and the kernel build uses gnu11, but it looks like it is 
supported as part of GNU C since GCC 8 (the minimum GCC version for 
kernel builds is currently 8.1), so we're probably ok.
It is already used in a couple of places in the kernel (with only one of 
them having a GCC version check AFAICS), so I won't block on this, but 
please get a second pair of eyes to confirm this is ok.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +
>   /**
>    * ARGS_SEP_COMMA - Definition of a comma character.
>    *

