Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1082D66B85
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 18:59:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A87010E07C;
	Wed, 17 Dec 2025 18:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aJJNMydS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC0410E07C
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 18:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765997970; x=1797533970;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zHph2kl7VEmEOFEjbYNuU/QM0yHZrN5MZwTez9PoQks=;
 b=aJJNMydSteHvNvtSB560xoFsVI8PS3XKvqS4YvKe1XAPr554UAGojfxM
 tZwe6/AUcNIronrR5iWPOQ0iTtozU1KP8WpLLTJ7wBMaJJLsDlR68X1LU
 D872HpaKcl1Xvz4S/IxLAF3DWmhRYJr4VQcsSGKKgHnKZCV3nNGEcvTmV
 cOUgjsOg6Ua2YNICddpQso2FoMTg9K8OSLb4wd+fBcxZc3c6h5dsqBA8D
 tGMEd9eUFW1S1k4mq6OMiG3Pk8FBR/m/ltNkxrb/GqlH6oNiWTEcvOx2z
 88jV/rRN07LZNJnXUn4yAxK0fQIyN8Whkr/uXgFCPXrZe+6oOl/3JPCcG g==;
X-CSE-ConnectionGUID: ALn0opyFQ669G9lje97fcw==
X-CSE-MsgGUID: kZiKMR9MTwum+HhlPAdzXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67912866"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="67912866"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 10:59:30 -0800
X-CSE-ConnectionGUID: K1eFM7OQT/OJUoWmNIDvCA==
X-CSE-MsgGUID: xe/J/9paQiCt+kEUvu1Jxg==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 10:59:29 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 10:59:29 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 10:59:29 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 10:59:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQlgC3/SF5TTuyvN7Z8jm6C1iV+qhDIdOKY/STwjIyDB2DHJXs/cCZdWcnpH7cusAd3MENqse6ObLBdx3FbXW+dZLxZCohB5m9wEOMzEDovKGnzF6ewSOwv+x3O9utNMRyQCH4Nh0gbr3pCqk9SqjAZ7SyFALrdrH5CV+aeSVFXICzKXo6wnESCd4BFRSkzJFEU8YfghdnhOBFyLeW/2T17c+524WXFTbfpBZgmyevnlTDNAVe8Bswb2TeNgWOz7pkMSt5LgojwnppuujHCFzk5RSxWQzvJXDhfo5ze6nnVitvC42BcQfCNfAsyBwCTe2GTvSJQLGdmerjMlM9/IfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IocajN4O63cwo3GhzFwbE5C0CI8KPdIwM9qWsKU20Yo=;
 b=zIjla6fd4wsUluGTCPdK61oif6Wcg0Hy1xMNkpOCSX8VPJOeo2a73/jix+S6YU6YzbnHQGT9tgW8c6HJwbUrFxSnZYScaPEODH91jxcEhjxJYs9LmY276L+gAR02qXF8LOf/6BgVmBY1R+ZRNLsD3700c9iuubARc8XjgAZQsXDQOajGrNRj0abNMdDKcxnUnxqaR2mbX03Cx61O+zjbZINFIGIq5HoiNcPKDWmG6X5rk84VqH2JDJOYQ0xWMWJC2RlmlCWGP0mSeQEJfhrlKTIdiIaTekQag1rpKJ4y4bl9UGKv6crUg1uxSE9dK/5Gwe/S9eG3D+rx7J08Nl5FgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SA1PR11MB6870.namprd11.prod.outlook.com (2603:10b6:806:2b4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 18:59:26 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 18:59:26 +0000
Message-ID: <8ee215ca-5a93-493c-a6c5-830e19999332@intel.com>
Date: Wed, 17 Dec 2025 10:59:24 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe: Add a wrapper for set/unset params
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251217013702.3597539-1-vinay.belgaumkar@intel.com>
 <20251217013702.3597539-3-vinay.belgaumkar@intel.com>
 <fc3365ee-6956-4ddb-853f-9766b702fab7@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <fc3365ee-6956-4ddb-853f-9766b702fab7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0015.namprd21.prod.outlook.com
 (2603:10b6:a03:114::25) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SA1PR11MB6870:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b8b97bf-c7a5-4d77-ed7b-08de3d9e6627
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEhkLzFlNHd6c0JYSndWRGZYYnZwd1F3b2hBbHFNQjhudXBzZDloRmFlcDFh?=
 =?utf-8?B?dmc4Q2NHd2J3aW1wcUlLVDJhZ2tndW14L3FXeDc3Z21DUzF3NFplcEVVSWdU?=
 =?utf-8?B?WjRHL09DeWlIR0tIZ2lhYmpITHYrWWdnUnJEZ3J5TVBxK2FQc0Yzazg0TW5u?=
 =?utf-8?B?MEJPVGZJZ25GbXNyV2l2SllITjdvbEFxUjl1S01Pck05Y0RaZmhLWEhCU1E5?=
 =?utf-8?B?eEJBOFJJemsvTGNRNGl2c1NmOHFPZllDTXg5WEFYZXB2bUU3U1VlSVd2MCtw?=
 =?utf-8?B?dFVkaTUzYkZnd2Z0NVNsbTRSYU1za3E2cExScTFNMEhLZ0h5NUYzV3E1RG5t?=
 =?utf-8?B?M1g4R1A5RG9NL2RnMXRsVlNFWXlGOExFTXE1bXpVNGFzRjJyMFVxazRKR2I2?=
 =?utf-8?B?MzFIZUpONHIycTg3dkJnc2s0bktGWE55QmVrWWpqK2pLWFZ5Um9GN0lkTkFh?=
 =?utf-8?B?V2kwK3NUYjdGMFlkQmp1V1hOcTk0Nm0yaGtyZWoxWC9uSkNLb1JQM0RoVXBG?=
 =?utf-8?B?VndsQWRxMFY3Y3ZoTlZWOU1vN1g0VktWTDF6VnhzcFV6bGJpb3pvNnFBeDh5?=
 =?utf-8?B?T2NMcWJtUU9TeEFzdGxoUjVydEVFYUpZdzBrMEdpaGlrMGowU0MvdUJqNGNp?=
 =?utf-8?B?YStYcFV2N0RFVFZaRXBpZXRyZ3ZNTytQU2YvY2Q3NzhIZW1PZHpPVWtBYkxu?=
 =?utf-8?B?UERhL1N3ajVmN0phbEpVQno0c0xjM2c0aHJPSlFoVWpIamc1SkxSYlI5clgv?=
 =?utf-8?B?RVA0U0ZmQlZNeHRYV2lud0pVQ01nNVFxWnkrOEVFYzBaeTNoeTRHNElvTWw2?=
 =?utf-8?B?bjA0UklPbWJNMzJ5Vy9WanVIcEdEbExQUThzQ1ZtdkhjVU83QkdZL3VzTlNl?=
 =?utf-8?B?SmRqdjloRWFNQ01VSGtHakhRSzlpMUxrc3BFMHN3ZGVVQnpvclRWU0tybGJY?=
 =?utf-8?B?aUhONVJPaTI2Vmx2dFJHVXYzY0luWUplWlBuNkQ5SjFFR2g4MDFtSWQ0YW8y?=
 =?utf-8?B?MVhXdlU0bTZEazIrZmZCS1pEUEk5Nm85NG9LbDdyUUdaYUJMdmk4T0h3S0hT?=
 =?utf-8?B?VnJxYlFKdTk3djUrdTB5WDY4L2NnRnI3YmRvRE96ZHNEcitJMVllOVplL1do?=
 =?utf-8?B?aEpmQm5BdkNheHdzSlFEd3VUdk5RYVpITGN6a3NpUFRyU2pRdEtUdXdDcDNR?=
 =?utf-8?B?WkR1UG4wS1VXVDZPb0NlN1VZcHNoM2dwRnE5TVB1cUFYdE5OV2JoSUZMQnFW?=
 =?utf-8?B?Slg1Um9DWnZOeWkxNU91a256LzNoS3Q1R01nM0toWjJuT3F1dnZRdklXWlls?=
 =?utf-8?B?eXo2MmdzdHR2b3hYNkwwcW5YN0FyWXlBY3JsVm5hUTA0QXVJUVBkZDMwSDEy?=
 =?utf-8?B?RC9YSFV0ckdQZklrQk0yV2JyWUhwN202Y0tlWEdWYlFTOTA0T2E1dkF3VjBD?=
 =?utf-8?B?QlJ0N01SeEdhNCtaeUgweVVuN0dwajVTTEQralE2aU1RTCs1ZGFpenV5R2RW?=
 =?utf-8?B?M1Y5SFNuaG4zUXRPaGR6TkJNS2tBRXEzU1JMT2llalljUzFoRkxMbklselRI?=
 =?utf-8?B?Z2NLNmRUdHdRR0hmbGR4NkQxSTVtWTRJclNlWk1yQnVsN2xoQUYyMjhiZU8y?=
 =?utf-8?B?MVRaZUVuejVYK2c5RmtYKzFEVDN6WkNjaW9hbkk3ZlBZSVFhM1NxcEhwWnZG?=
 =?utf-8?B?N3UvdnhtMVZ6TUZHYkxmUGlWWEFMVk9BUEVDSHhDZFMvMFdoeGRQNXVVczJl?=
 =?utf-8?B?TU5ZY2Nrdk9leFU2RCthdXI2YUVwMnFhMlRkSUtzaVdYQ1d0N0lCd2FlYk1l?=
 =?utf-8?B?ckRTU1liSUlXd0hrVWdoWnRPVkcrN0dEaTIwaVByRStJc1UwcTNqWmpEcE5W?=
 =?utf-8?B?YlZYc01NcmxxeEg0YW9HdjMwcm9oa1BHbmwvd2ZXbndXR0tKSVBrbjk4RjRx?=
 =?utf-8?Q?U+iaPpL1Dnn743lxvdOw0n/80uwo0utB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUVLU093SFA0M3VRS3pZRHNobmE2bHJpZWNuUmMwL212bTJ2cFhtd3NSN3Zq?=
 =?utf-8?B?cS8rOFpmdHVleVJaa3JwQnBZTStiWWFPNVVwNXhiVGducUZlcElIOWNrUEpX?=
 =?utf-8?B?QnpEbkJXOWRWLzAvZzNVYmJ2Rzk1UTc0ZzA1TXo2ZXJZYURTWlQ1b003NFBG?=
 =?utf-8?B?L2xIb1FUQWRhVXphQUZhRE1kVmlHaE5aTXErWWV5MEFsNkg0V01tYVF1Y1dp?=
 =?utf-8?B?VGNKdVVZQmcxTFZiMXNyVHpuRHZLNVc3NFVRTkswUkRyUTFoY1pBV1lRN3Bt?=
 =?utf-8?B?MzhTSUhZU1RTd2V5NDRzZkRrSWZKdTYvZ1ZrbVlpdHJFWUZhWHBaZ2Y3TVJq?=
 =?utf-8?B?dzhKNi9jb1BMS3BlR3phWVBma09yMm9yOGU4OE4wbTA3OU9zWkM3a1JCU0Vz?=
 =?utf-8?B?aW9XMzhRN3BjSmIyQXZnVFZhZFBYYWxOdjl1S2xDb2t3VHk1TFg1UTgxSnpu?=
 =?utf-8?B?V09JSkMyakplN0NRVUlXZWpaakx3SWlkZUNCMlZFVXRpTU9LZGtuMVhEME5t?=
 =?utf-8?B?YlVFaHVBaG1pazREVTE2SHhzV3h6VXpYa2RLVFlkZ0owY29PNU9NTHhaTFIx?=
 =?utf-8?B?S1VDcUFZb0RNTmNwRVBsRXZpNzlCNDlsZTJUV1Y5Yngrb0t1WmFsVUlGT3Iv?=
 =?utf-8?B?UWtIZmt5cjRGcmZBY1JPM05FRDdxN2xaTkZrRytmN3ZUcU9HZnp5WElpMVdV?=
 =?utf-8?B?N3FFK01YZ2owZmlVM21oclp4eklUQXJDWEFuNWh6UFA4ODl6bTc1MDNwdzky?=
 =?utf-8?B?U2cxMHRMUTEwNGxaZS84U3ZEK0h0NVQ4MUQ3Um13dEFoa3NrTHBLUHhXZk1u?=
 =?utf-8?B?ck1Bd3UzWUc5K1IzeVlmWnlPMjVwajBjSXRJNmR3Y2tkVkNTVnpYa08zZlYz?=
 =?utf-8?B?OEpNc1dMYm9DTmtaZlJMOU5SS2RudGZvTFhUdVY4MVNzeTIvQVVwYVQyUXV6?=
 =?utf-8?B?NEp1aXl5c1hUY2xLMUhGakEyUXdRQlZ6WHdVOFljNTY5TjRxbXhvUFZ0ZnEr?=
 =?utf-8?B?NHUvUDFYQU00b0FRWCswYTV0R1QydHNGWU9JK3h6VTlVY0FHbXJQdFJyalpZ?=
 =?utf-8?B?aVJnYXE4ZDdXMlRNOWNZbFRPWEMwMjN3YTJ0aWZyQUI0U2c4VkM3bitaT0R4?=
 =?utf-8?B?TktldThLSTVGM2VrWjRuMzZzOTRCRlRoMHlreldRdW9rcFl3a3pReUwwWkFE?=
 =?utf-8?B?WmFuSzZyQkdsWHNwelFHYmZUMUFYcVFOYjQwQzd3N053OEVKTmJwODJIcnFS?=
 =?utf-8?B?NEpBakdhb3QxMHZXVFBrWTM2Vk9ZRGgwRE4wc0FURGxKWGhRL0FNaks3R2Iw?=
 =?utf-8?B?V015VjEyVE5HekdaT2t6WkxReS8wM0FnaTNPMlVBY3VWY2p5cTZtVGsxU05s?=
 =?utf-8?B?dmdSSE84enJJVjNVbTB6eUdWTUtBTVgzUVFOYWMrc0ZyM2FrTzd5cWNWanlK?=
 =?utf-8?B?MjZCN28yWG5iQy9DU014dHJiY3U5Wk1FN0lDNCtkbElEZjVrZGxYcmdocGhh?=
 =?utf-8?B?NXBXREdHRllKSWFLL25CRkxsWEdkakdGaUptQWdWWDVDRVlHU1lwTDJoTzdR?=
 =?utf-8?B?UzI5MXg3Mkg4T0N5K3EzY2FZTngxek1RR09PT3FPejl1Y1NwWG9sYU0yL0R3?=
 =?utf-8?B?OStMd0xyNEN5alFFbWIwQ0IxdGd4R0l0Y1JPak03WlVYK0JYcHRuZlN4ZDZz?=
 =?utf-8?B?aUNHUDMwL3hzVmVPRWR2NWdtbzMybTNlWGpPOFRpRzkwTXV6ZFMwUkxqOGtL?=
 =?utf-8?B?VW81TUd3K2Q4Vnp6UU0yeFhSRFZCd1hzWWs5eVMzUE9nWG02ams5ZnI2V1JW?=
 =?utf-8?B?V29JdlFYdnJ3VUxra3RYWUl4R1FCZ2V2OVF2U0wxTndpc1hEdktqUzhlWitq?=
 =?utf-8?B?OCtJQ3ZabzhEUnZleWp4MkhzV2NhbFRsTllYMittdmJGRVFiS0YrQmlWWnlD?=
 =?utf-8?B?ZEpDZnZzWVF4ejllV0dGVGhDamI0KzEwemdUWmJTSmQyUER4SlJNbElrT1ZG?=
 =?utf-8?B?OWdISWg1VDZ6N1lrVFlsSlk1aG1wR2hzYUV1aFVoampvNSt2bkw2V1FLK1pr?=
 =?utf-8?B?cTcyVTF5bXV5eVo3UWp1RjFZNnBicTBld1lzZUtSL1VnSWJTUjFUU2o3VDd3?=
 =?utf-8?B?aytlRU1rdlR2SngzWnJ0NUp5Q2lHdlZ6alRxVitETXpId0dheS9OU0VlenI0?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8b97bf-c7a5-4d77-ed7b-08de3d9e6627
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 18:59:26.3071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zUPDwxISmOlooXZlwmsq/ECr7yV62PGiMYga4e0vDLjgng/QWXb4z0aKzaKsXAdRtTOandLsSkeE6pqqiy/HZPPHhfoirIyDtsBzWinA9Tc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6870
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


On 12/17/2025 3:06 AM, Michal Wajdeczko wrote:
>
> On 12/17/2025 2:37 AM, Vinay Belgaumkar wrote:
>> Also, extract out the GuC RC related set/unset param functions
>> into xe_guc_rc file. GuC still allows us to override GuC RC mode
>> using an SLPC H2G interface. Continue to use that interface, but
>> move the related code to the newly created xe_guc_rc file.
>>
>> v2: xe_guc_rc functions to use guc pointer instead of gt (Michal W)
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pc.c | 46 ++++++++++++++++------------------
>>   drivers/gpu/drm/xe/xe_guc_pc.h |  2 ++
>>   drivers/gpu/drm/xe/xe_guc_rc.c | 26 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_rc.h |  3 +++
>>   drivers/gpu/drm/xe/xe_oa.c     |  9 +++----
>>   5 files changed, 56 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index f8b683189f6c..03d7d3d2346e 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -253,6 +253,27 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
>>   	return ret;
>>   }
>>   
>> +/**
>> + * xe_guc_pc_action_set_param - Set value of SLPC param
> nit:
>
>      * xe_guc_pc_action_set_param() - Set ...
ok.
>
>> + * @pc: Xe_GuC_PC instance
>> + * @id: Param id
>> + * @value: Value to set
>> + */
>> +int xe_guc_pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
>> +{
> maybe to make these helpers more useful,
> take a rpm ref here instead of forcing callers to do that:
>
> 	guard(xe_pm_runtime)(guc_to_xe(guc));
> or
> 	guard(xe_pm_runtime_noresume)(guc_to_xe(guc));
>
> or at least assert that rpm is already taken?

ok.

Thanks,

Vinay.

>
>> +	return pc_action_set_param(pc, id, value);
>> +}
>> +
>> +/**
>> + * xe_guc_pc_action_unset_param - Revert to default value
>> + * @pc: Xe_GuC_PC instance
>> + * @id: Param id
>> + */
>> +int xe_guc_pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
>> +{
>> +	return pc_action_unset_param(pc, id);
>> +}
>> +
>>   static u32 decode_freq(u32 raw)
>>   {
>>   	return DIV_ROUND_CLOSEST(raw * GT_FREQUENCY_MULTIPLIER,
>> @@ -1034,31 +1055,6 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
>>   	return ret;
>>   }
>>   
>> -/**
>> - * xe_guc_pc_override_gucrc_mode - override GUCRC mode
>> - * @pc: Xe_GuC_PC instance
>> - * @mode: new value of the mode.
>> - *
>> - * Return: 0 on success, negative error code on error
>> - */
>> -int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode)
>> -{
>> -	guard(xe_pm_runtime)(pc_to_xe(pc));
>> -	return pc_action_set_param(pc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
>> -}
>> -
>> -/**
>> - * xe_guc_pc_unset_gucrc_mode - unset GUCRC mode override
>> - * @pc: Xe_GuC_PC instance
>> - *
>> - * Return: 0 on success, negative error code on error
>> - */
>> -int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc)
>> -{
>> -	guard(xe_pm_runtime)(pc_to_xe(pc));
>> -	return pc_action_unset_param(pc, SLPC_PARAM_PWRGATE_RC_MODE);
>> -}
>> -
>>   static void pc_init_pcode_freq(struct xe_guc_pc *pc)
>>   {
>>   	u32 min = DIV_ROUND_CLOSEST(pc->rpn_freq, GT_FREQUENCY_MULTIPLIER);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
>> index 1b95873b262e..00182a02a49e 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -18,6 +18,8 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc);
>>   int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode);
>>   int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
>>   void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
>> +int xe_guc_pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value);
>> +int xe_guc_pc_action_unset_param(struct xe_guc_pc *pc, u8 id);
>>   
>>   u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
>>   int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c b/drivers/gpu/drm/xe/xe_guc_rc.c
>> index a526405b686b..ba98e5db996f 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_rc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_rc.c
>> @@ -16,6 +16,7 @@
>>   #include "xe_gt_idle.h"
>>   #include "xe_gt_printk.h"
>>   #include "xe_guc_ct.h"
>> +#include "xe_guc_pc.h"
>>   #include "xe_pm.h"
>>   
>>   /**
>> @@ -131,3 +132,28 @@ int xe_guc_rc_start(struct xe_guc *guc)
>>   
>>   	return xe_guc_rc_enable(guc);
>>   }
>> +
>> +/**
>> + * xe_guc_rc_override_mode() - override GUCRC mode
>> + * @guc: Xe GuC instance
>> + * @mode: new value of the mode.
>> + *
>> + * Return: 0 on success, negative error code on error
>> + */
>> +int xe_guc_rc_override_mode(struct xe_guc *guc, enum slpc_gucrc_mode mode)
>> +{
>> +	guard(xe_pm_runtime)(guc_to_xe(guc));
>> +	return xe_guc_pc_action_set_param(&guc->pc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
>> +}
>> +
>> +/**
>> + * xe_guc_rc_unset_mode() - revert to default mode
>> + * @guc: Xe GuC instance
>> + *
>> + * Return: 0 on success, negative error code on error
>> + */
>> +int xe_guc_rc_unset_mode(struct xe_guc *guc)
>> +{
>> +	guard(xe_pm_runtime)(guc_to_xe(guc));
>> +	return xe_guc_pc_action_unset_param(&guc->pc, SLPC_PARAM_PWRGATE_RC_MODE);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_guc_rc.h b/drivers/gpu/drm/xe/xe_guc_rc.h
>> index 2500b0d1c151..c77fad9278f0 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_rc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_rc.h
>> @@ -12,9 +12,12 @@
>>   
>>   struct xe_gt;
>>   struct xe_guc;
>> +enum slpc_gucrc_mode;
>>   
>>   int xe_guc_rc_disable(struct xe_guc *guc);
>>   int xe_guc_rc_start(struct xe_guc *guc);
>>   int xe_guc_rc_init(struct xe_guc *guc);
>> +int xe_guc_rc_override_mode(struct xe_guc *guc, enum slpc_gucrc_mode mode);
>> +int xe_guc_rc_unset_mode(struct xe_guc *guc);
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>> index cc48663c2b48..a474f086162e 100644
>> --- a/drivers/gpu/drm/xe/xe_oa.c
>> +++ b/drivers/gpu/drm/xe/xe_oa.c
>> @@ -29,7 +29,7 @@
>>   #include "xe_gt.h"
>>   #include "xe_gt_mcr.h"
>>   #include "xe_gt_printk.h"
>> -#include "xe_guc_pc.h"
>> +#include "xe_guc_rc.h"
>>   #include "xe_macros.h"
>>   #include "xe_mmio.h"
>>   #include "xe_oa.h"
>> @@ -875,7 +875,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>>   
>>   	/* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable rc6 */
>>   	if (stream->override_gucrc)
>> -		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
>> +		xe_gt_WARN_ON(gt, xe_guc_rc_unset_mode(&gt->uc.guc));
>>   
>>   	xe_oa_free_configs(stream);
>>   	xe_file_put(stream->xef);
>> @@ -1761,8 +1761,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>>   	 * state. Prevent this by overriding GUCRC mode.
>>   	 */
>>   	if (XE_GT_WA(stream->gt, 1509372804)) {
>> -		ret = xe_guc_pc_override_gucrc_mode(&gt->uc.guc.pc,
>> -						    SLPC_GUCRC_MODE_GUCRC_NO_RC6);
>> +		ret = xe_guc_rc_override_mode(&gt->uc.guc, SLPC_GUCRC_MODE_GUCRC_NO_RC6);
>>   		if (ret)
>>   			goto err_free_configs;
>>   
>> @@ -1820,7 +1819,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>>   	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
>>   	xe_pm_runtime_put(stream->oa->xe);
>>   	if (stream->override_gucrc)
>> -		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));
>> +		xe_gt_WARN_ON(gt, xe_guc_rc_unset_mode(&gt->uc.guc));
>>   err_free_configs:
>>   	xe_oa_free_configs(stream);
>>   exit:
