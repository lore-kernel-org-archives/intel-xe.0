Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF86C3ABC3
	for <intel-xe@archiver.kernel.org>; Fri,  9 May 2025 10:12:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67A310E9FB;
	Fri,  9 May 2025 10:12:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SZ7kpDvH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454C210E9FB
 for <intel-xe@lists.freedesktop.org>; Fri,  9 May 2025 10:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746785543; x=1778321543;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ow9X+n9HxLT2S3aQq/OWw97IXailaLWGF+9y17aAMfw=;
 b=SZ7kpDvHe0hp6yZWFAHTootlBpFCaiV9SZkhES632lRkkbYDhZ8EHByd
 op4Oh0SjCFhc75Ie0OT9u75dRF+hIveL+KKFtG12DLPQlQP76pBt7xfc0
 4ibp9QLmnpqUwCnNzUyLD0yRqxzsLsCZrVLBoI1Njus53jCZOmZ5HTgbE
 EcmpZOs6zSXBOXeHd67WOnLPDwXb0Jk9gDAph29X1UCLP/+u704J9tvN3
 izIGVvVmPIUsSDmmcY8sQNQQ1tZX6dzRyKuPI8BFS22+0rBHgUSKu1RXe
 GwgNaCoDEHzdi7TiM0z2eQFn73R/H7yK1Tunseyv5BXdGTp4TeVp3TPNS Q==;
X-CSE-ConnectionGUID: WWSWv0/YSjiHGQvTKB3LYA==
X-CSE-MsgGUID: PoK5FTfCR4SxBER1jnk/bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="73990226"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="73990226"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 03:12:10 -0700
X-CSE-ConnectionGUID: Rz37vbblTRy0oFLbj38wjA==
X-CSE-MsgGUID: ag0zvT30QBePM7lYgf54sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="167509519"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 03:12:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 9 May 2025 03:12:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 9 May 2025 03:12:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 9 May 2025 03:12:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6YenEFyfpMf2rhlDGe0Wm5rxJu4LPwgDBqs9/GP+jYwIpuYDENvSdjy5U4hqHGQIY1w680hxKvZCJHP/UPZYa8oCE/Gh0KA29jUjwLgJUklxOAdkpRMrojS2P+tUbTH4CVhFVqwZRBEOoFfxR6ImnIvt8zW95w5MZkM6WF/XSnqPUcSL2TAaliUcHHUj6poRcRxLgSrcpe24XgpO3+ZaDtF3gfQvefmiVy1D/r0fnQiWIN1RUt+2MCbaSbpRPnTLmPNREWQCs+qH997hma3C60jvE9xvYHderD3hbLGewiqgnepDK8FK+1aU7fAdx9VLzgwYDN6r5lwK1scjWsCjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PK4H2o7TsnQlu7eImvf6F8dyJJDlNxRDwAXS2JUjej4=;
 b=AStZlx5tOkkg6OLiMuDdovXebVCiRgrMYax8aLTUwmQyrD3MW6o/qat2LNgOzoWG+8oHtS/fYOc0Yg+VupccBI7CzmcSYjNXnUIvabk6KvqeqcqJGmP4rbN3uO5hjsYl4NqG23n4m+RfkX/zP2muTnk+vZ/Ji3YIYK/4d+dYqQIBceX7Of9D5pKeY1ZBwdc/PE7vxVqkxrtBSglE9mqrRsCo9k3kjYl3Jim1SaOtt/obzkWhWvfC1/C/FQSuZre1c2BKKujQO5Ekxk695mSTKQXy+3hmShYqmS5IcueJZMsZP84AtW5AE+mp0U8ejg2ETxSAxjwFjE9JhHi6QpeyKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA3PR11MB8988.namprd11.prod.outlook.com (2603:10b6:208:57d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 10:11:21 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 10:11:21 +0000
Message-ID: <71920d66-1946-4d74-b516-339646d32a68@intel.com>
Date: Fri, 9 May 2025 15:41:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] drm/xe/hwmon: Move card reactive critical power
 under channel card
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20250509095157.340680-1-karthik.poosa@intel.com>
 <20250509095157.340680-3-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20250509095157.340680-3-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::28) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA3PR11MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: fb25d2c6-7e46-4353-d109-08dd8ee1d8f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rk00L3BGYXNxRTFmajVSUkNzNXhjTVRocUNVWjk0Z3NyS2hrK3oyWFA0Vm4y?=
 =?utf-8?B?ekM4M0hSaEdxaTdXTloyb04wb3hzTHhWeDFzZ3VlcDBWaDZBMy9mNDdRRWNB?=
 =?utf-8?B?TXV2b3FHZVdxY1ZKeXhNWUljZ1lFNGRwUStadEpOT2VUY0ErT09lWXRIcXBa?=
 =?utf-8?B?UmxiNk5PZ3BjZEtJakhLQmFQTVY0c09hK2ZLVzNtUDRNTjJTd29CaUFYcDBZ?=
 =?utf-8?B?SFdKMEpFVkZKWEtUVVZBcUdSem54MlV6d3Q4WUczQjVFQThZMUcyR2dLMnFa?=
 =?utf-8?B?N3pXTWdFSWxSTjRDZkJFc0RhQ2UvdVk5dG16SDkyYkZKdS9sNVFqUUtsUy9R?=
 =?utf-8?B?aWROdjlqZFEwQUxMUVcrbWp5aW1JMURUUE50cmFxQmRwdnhwMjg3UnZzdjN2?=
 =?utf-8?B?T21OWkVkbkF0cTNmZGlCaXhHeXVDbEdnQTU5cEFYQk54UTFNTStoMW4rTmdJ?=
 =?utf-8?B?bXBoazVteTZTdUQxbEhmbVIxYTNGQVNoMTdPc0dlY3JnZGo3TDdiZUtWOHJJ?=
 =?utf-8?B?Z3Zrb00rSk9QRG1wVS9JK0QweHo2WENkTnQ4cUszMEFabm1NbHhoY2Qrcytw?=
 =?utf-8?B?aHJIaGRlT05SNkcrWjdUZmozRU9tbGRHYVJ1UzdhcmxmR0ZTQnRyOVlmWHdo?=
 =?utf-8?B?MjI5eXloVmdnRGZEbUpoc0xQUjJ4aVFuc0NjUDBFVi9Lb0I4d3VOOG5KalVQ?=
 =?utf-8?B?WHZBZ3U0QVdGeXdZOVlUa013azdZYTlmaFBRSnlubHpnOXNJWHVSdG05Q0Yy?=
 =?utf-8?B?bXJhMzc1T3lGSkV4ZTlxbGJCYTBBLzFKUWMzeEh1bEtqMFFwMjFybEJxdE1J?=
 =?utf-8?B?YlVxSmVYODlCMElQYnRaaE85RllUWjgzUEdPYXFhUXA3QnRxK3ZoVml3TXNK?=
 =?utf-8?B?bExWUXhybzV4VUNISzBjRUdYWGRxb0ErSW4xaGdYNnVsM09YTDN5QURUWDV6?=
 =?utf-8?B?bWtPeERRbnFva0NpSXd0cHN5OG40aUp2VVRZRmxvTnh2em9uUy85UWJpSUNI?=
 =?utf-8?B?clQ3MnY5bUoyMW41MUdwZ2xYVkExYmhqNkpvQ2gyK2J1aEMwOUdDUk1DeWho?=
 =?utf-8?B?aFA2Y1BQTEplYStKeE4vbUdRZHZWZDVYTVpmNWE5c3g3Ym04Y2M3UzVJWUtV?=
 =?utf-8?B?aktib1JOdVFEOStJWHBSSU81anhOSDBHSk9Yak9nakdzQUs3UEMvd2lYK1RO?=
 =?utf-8?B?WXhQT2RKOTRFZGQxV2xyOUVWSU53aVhWVWpQQnR5R09wTXhMSk50VDRqUExl?=
 =?utf-8?B?RDJlT3hOT3lWQkZpRkFQMStLZGwyWlkrVEpURGdQcExnUHNISjgzRCtzWkQ0?=
 =?utf-8?B?RkVWTHc0N3JBMkd0L1E1QTBQY2h6bWVqOVBNSnNteUdJdjlMdXlOQ1pqdHps?=
 =?utf-8?B?NFROYWsyYmV0SUxXRmMrUm5CanQzd3RkNThTckM0RENyZlNDUWR3TEg1enFV?=
 =?utf-8?B?Y2xpdWx1eTZJRWtqWW9aSlBuU0k3NWxWSWFUUUc1VG9lclg2eUkwamVSL1ln?=
 =?utf-8?B?WHFYblA1RUltSi9sUnhUSTRvRkl5OXZ0eWV1T0hGVDkxRCtmZGZqRTdqQ1JK?=
 =?utf-8?B?b25nSUVsN05hcjVmMTM2MmcvMEM1Yjd2MTRRVW04SVlwSXdTKzdseFgvSmcy?=
 =?utf-8?B?dkNQL21uWVBkK0pnTjhXY2NONDErYUc3S2Y2YlFpY0VrMDRPdWlnbjFETXgz?=
 =?utf-8?B?Y3U0bXFBRzJLRE5kOFBYQUFOQXM2UWRibmRwMkoxemkrVVVvMVUwWHh6SXMw?=
 =?utf-8?B?Unhrdi9jOWk1M2MrbDJtRGMxbzIyYXVjNkcvZ3lQZmpldVRDZGVQNU9YRTVj?=
 =?utf-8?B?bXF4ajRESytyYkZDUmNaWGM2MUlueXpDTVYwNHdOUVFYci95QXdkR1RJakNp?=
 =?utf-8?B?eSs4L2hpZG50UVVYUjZCNnI0RUp3R0IxY3NlN0RHdThOSWhhK2tZL0F6N3V3?=
 =?utf-8?Q?sBWx57EF4g4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UE5oQktQT3gweGNUNkYyVytYMkQ5Zkt1eGJyUm1sd1d4eTZVYllwdmpvcEtH?=
 =?utf-8?B?d1U4MEt1ZXhHajU3d2kwVm1SY2tJcVdqN2p1eGRkdWhnRVBQNy95aDh1amVk?=
 =?utf-8?B?TEMxQXl5NC9UY3FjaVRJTndSMXdQekNjM1R0SWEwYVZubmdUREJQRHp2Uytt?=
 =?utf-8?B?TjRnbmkrS01LWnNLMHlBaVoxM3VRV1V2T1h1a3hlcUN0TTdvdG1zeUt3amZa?=
 =?utf-8?B?U2YvRDdFU1plMzdyMGtEaGp5OVIwVGlWbkwrb2tZdFNxcDZKdHFPV2k4SkVS?=
 =?utf-8?B?UUczZDFLN0x5endQZ0RtOU14SHo3UWtqWVU0WnN0NjBwNUtadkhjK01hMSsy?=
 =?utf-8?B?UFNrYy9INm16bmZrcXZvcTJseXVLQndudW0wOHNTNVFnYkt0VWFEaTdCeStR?=
 =?utf-8?B?WGphWE9ZcDE1d1ZMNFlydjNTRWlRaWhzcTVlVUpESjFpdTQ4aHNlZ2NETVVt?=
 =?utf-8?B?SDJCVWpaRnpZVGdXQlErbEkvSjhUN2cwTDBiMzI1YVpOM29jSW5KdkZqQkVJ?=
 =?utf-8?B?YWNUYVRMb0VFaGtjMGJzK0tlWTVCRzB5ZWVJY0RLSkJhZEpMZnRBdXVOYVlr?=
 =?utf-8?B?N2NxWEpJczlWV3YrOW1QMG82TXk2YXB0LzVOekYvSy9LNXdFN0NVZWgyeU9w?=
 =?utf-8?B?SldjOEFoRXNpNEgxK0tEa3QxK0RBaDZHZGtTWnBDb3FROHlzeGxJUjRaOGdS?=
 =?utf-8?B?eWszREpYK2w2MllweEU1aWFlRkZRMVhEVE40K25naXR1QmRKeTBuUlhYWGdi?=
 =?utf-8?B?MG5uVTVhajdEeWU3RjZ3bmtEMUxMUnE3RTFvMFJsOEo1ME9TMlB6dTNaU1pr?=
 =?utf-8?B?amI1ZTJ2V1BUSjU2VXI3NmV5bzVQb05hakc3NHFOb3JUbXlnWng5MmRuQlV5?=
 =?utf-8?B?Ry8xY2JEckJUYU41S2dic1VDb1hKekZWQ25rN3lPRHZjbW53aFNlZkRyQ1Q3?=
 =?utf-8?B?bCtEYXVpVTFXMW96bTBpbWNsMURLQytJNFpvQk1aTlVDazl4SytuYnBkSkdm?=
 =?utf-8?B?QVFKOVJMS2d1QTRHdnh3VVpDTFRCMFdsaExEVzdTZXdkSTl3UnZ2enFqWHdv?=
 =?utf-8?B?WEJwMU4xS0Y2cHJnSlFmK0ZES1IvRUErTU43RUMrakg0QUJXOWNGYVZvblFN?=
 =?utf-8?B?TG5GV1RZZHBhL3Q0cXFnbnAvUXJ0eTkxVDB5M2w5ZFJQbDV3azBVSlhwWnMy?=
 =?utf-8?B?Yy85VzhOcHhuWFEwSER3MnBJMlRYWUtIWEdLMnBkWDhjam83NEpQZzFyM2VH?=
 =?utf-8?B?bGFpK1dkL1JrWXdIWHZYVVZrVTM3NnNvUFYxam5xVDdMaTVWSFNMVit2Slk0?=
 =?utf-8?B?dndPeXh2Qk4rY0Y0SkZKOHVKeEdrMTRDSWNSb1o4WEwzcE1naC9XZlpsTnJL?=
 =?utf-8?B?a3J0ZmZRRHZZSGxUYU4vSmJqbXVEb3o2T29oUkhrS1hFcUJoeHA4QnlvRnVJ?=
 =?utf-8?B?OGR0RkcvSFlXOUlIaDFpbU15VmRYcERDU1diMXV2dXVrYTdENGpxSjFoWFpR?=
 =?utf-8?B?MmsyWXVwL25vTDcyTmNDMnJKeE5hcGxScmUvRDU1Yi9ucVQ4ei82RkVtQ0FR?=
 =?utf-8?B?Q3J2eWg1bjBydDFwbGdJbXhETWRPcFNLSTQ2U3RJaGlnSFNod1I3K3QycG5u?=
 =?utf-8?B?bzhxeG5NZnVYcXpZTmxUMWI4R0EwaElvS1F2aTNpc0NOazFSR3luSTI5c3BD?=
 =?utf-8?B?bERiVnIxS3pxcHU3MlBEUmpLa3ZBcldxSlUyUFZFeUx1VzlVUzgrR2taSm5M?=
 =?utf-8?B?MGVCL2YvdXMxbmdxYXd0MENXRzJ3dVZDc2hYcmV1ZVpJUmVLQjMzTkxXL0Fy?=
 =?utf-8?B?RUhzanFydzZBWThTQ3VmR1o1Q1B3YVVkbE9xYytVK1ViVUlyOWg5YTlDZWN5?=
 =?utf-8?B?S3BmRXBDQWhBUzZPZEszKzVzczI4K1hLaWt3ckFxWGZFenpqY0lQeWN5VTRv?=
 =?utf-8?B?TWdNWEZDT0pMMm9NSHRGUCtxNE1HM3RmZVJCaG9ObnprMzlRZG9QY0xtY1dE?=
 =?utf-8?B?Yy83RSt6RUVISkVFVTVWWDFTdDdQUysvVExQUUFpYzlPMkJGV3RlUmhiWEhm?=
 =?utf-8?B?aVE5RzVGdFNuZG9HazluYkFOTmYxVHhMZmE3OU8wT3AydUFMV1F1c3VsVW5F?=
 =?utf-8?B?SUJ6V0lwRm9JZTRkYlcvNVZCN05tdVVDNythRmpFcVc5cFQ1dlJlRW9zVW5F?=
 =?utf-8?B?QXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb25d2c6-7e46-4353-d109-08dd8ee1d8f2
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 10:11:21.5887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zDCiLINwCGLBl2igiGR+nRwtbLQnroOp0tlb3iAmr1pFcH/0A22eBNnScD1IEZsveBA2c2CdMkHrWMIoijUfJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8988
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


On 09-05-2025 15:21, Karthik Poosa wrote:
> Move power2/curr2_crit to channel 1 i.e power1/curr1_crit as this
> represents the entire card critical power/current.
>
> v2: Update the date of curr1_crit also in hwmon documentation.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Fixes: 345dadc4f68b ("drm/xe/hwmon: Add infra to support card power and energy attributes")
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 20 +++++++++----------
>   drivers/gpu/drm/xe/xe_hwmon.c                 |  6 +++---
>   2 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index 4ca917ac6382..5a91dcccd3ac 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -60,26 +60,26 @@ Description:	RO. Package default power limit (default TDP setting).
>   
>   		Only supported for particular Intel Xe graphics platforms.
>   
> -What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power2_crit
> -Date:		February 2024
> -KernelVersion:	6.8
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_crit
> +Date:		May 2025
> +KernelVersion:	6.15
>   Contact:	intel-xe@lists.freedesktop.org
> -Description:	RW. Package reactive critical (I1) power limit in microwatts.
> +Description:	RW. Card reactive critical (I1) power limit in microwatts.
>   
> -		Package reactive critical (I1) power limit in microwatts is exposed
> +		Card reactive critical (I1) power limit in microwatts is exposed
>   		for client products. The power controller will throttle the
>   		operating frequency if the power averaged over a window exceeds
>   		this limit.
>   
>   		Only supported for particular Intel Xe graphics platforms.
>   
> -What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/curr2_crit
> -Date:		February 2024
> -KernelVersion:	6.8
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/curr1_crit
> +Date:		May 2025
> +KernelVersion:	6.15
>   Contact:	intel-xe@lists.freedesktop.org
> -Description:	RW. Package reactive critical (I1) power limit in milliamperes.
> +Description:	RW. Card reactive critical (I1) power limit in milliamperes.
>   
> -		Package reactive critical (I1) power limit in milliamperes is
> +		Card reactive critical (I1) power limit in milliamperes is
>   		exposed for server products. The power controller will throttle
>   		the operating frequency if the power averaged over a window
>   		exceeds this limit.
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index b4f99b761a2e..5ba800b35969 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -637,8 +637,8 @@ static const struct attribute_group *hwmon_groups[] = {
>   static const struct hwmon_channel_info * const hwmon_info[] = {
>   	HWMON_CHANNEL_INFO(temp, HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
>   			   HWMON_T_INPUT | HWMON_T_LABEL),
> -	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL,
> -			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT | HWMON_P_LABEL),
> +	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT,
> +			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL),
>   	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
>   	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
>   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
> @@ -778,7 +778,7 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   					       channel)) ? 0444 : 0;
>   	case hwmon_power_crit:
>   	case hwmon_power_label:
> -		if (channel == CHANNEL_PKG) {
> +		if (channel == CHANNEL_CARD) {
>   			xe_hwmon_pcode_read_i1(hwmon, &uval);
>   			return (uval & POWER_SETUP_I1_WATTS) ? (attr == hwmon_power_label) ?
>   				0444 : 0644 : 0;
