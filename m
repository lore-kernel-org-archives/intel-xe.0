Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB173D68B33
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 16:15:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8463410E81E;
	Thu, 14 Nov 2024 16:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TAlcnMI+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6712910E81E
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 16:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731600900; x=1763136900;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SrCBlMcROeJ4fet2F7KpKtVgzyefWpsrBDTaO0hB/s8=;
 b=TAlcnMI+ZbMT5Q4HbJxqyFoC0ONKoJSHP8QnLCbL4cG5zPPArA+zrhwM
 EExh0TnCpY9dvYV7jKwHLgRcGbNnj9x6EvnHAk+elkgM3bN5u1JjvkqtT
 6LAi5QS5403WFxqxNMj3Fty38C0APj8/dh1s2jSY2dzgPc1Qa29keJrYj
 SWjDslz/5OFWKZ5IEyWCC9lUEraI484kl5Tg3FNYA6eR+8/JV7zvJtYli
 mAtvGveGKFwKAJ9krFEdbgVqC0+5cgyFbADqRYIGbr54smyql4EWPYnpZ
 w21qCn1CqV2sf6g4TlbDXmH+lwPo2d0aSTSPBVhmguGTuPCJWM5lM1uj0 Q==;
X-CSE-ConnectionGUID: XSXp40CUR+eeXu3CSyIz1g==
X-CSE-MsgGUID: Z6lH8k7ETBmPfujUk7Ovug==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="49078897"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="49078897"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 08:15:00 -0800
X-CSE-ConnectionGUID: 6SPAu3f+RhuVp9KTpO1QZQ==
X-CSE-MsgGUID: jmPGwGhIQW6UJTnRG5LVZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="89027314"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 08:15:00 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 08:14:55 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 08:14:55 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 08:14:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INcoMtkV2NaHrQ5abvo6z8b/2xsaMbaOu7uYVEWbUFFSmLJ7N/eQANkvuhO5geb5PREqfbgLR4KzTFjekM64FpY8L3vksO79DrR6rnn5cQHIL1GmzSQiSjpRJe9GIogHLQ+ahT5fpXZ9AUfLg4swHOKCPsQAerYBhXXAnPWtn5DPvLerfkvtziWM0qIV+nVkwpiIYoPsodHaRo32mDOctT+7wss6Ng8JGirQuCBSs5l4si1VtoU4KFeyWqeKZORsYITBQDN0xOqzhl3rJcgXZ65ILOMZwqGt4ilCCO+m+2HLegYaVt4nmkbsP1RreOObQqLaC/0sn0PPiKt+hyolrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFmm+GpmMzBr+x22kymHi6jreHD3t12mFeX+gPgyyc0=;
 b=MCvjRPm21Yk3nzy4jjICkIX8bRv+hpXdpuWbLmTXvf+LJc0FakX63sxj8e23w5aVQ+23ZoI4Btq/U0uCuhCYDFc26wMBcHeNjdS3n6Vlv3pAjWSUZrcM/vGBmULa2gwoRnSjq5AjgIV3RwDpcc3I5c6NwVg36oOJhJK7jaFKWsHItV6h4HeSHxmaDOwmzW7e4ZFRZJ3B+rG0bVpMyPtLW8oXWul+AkpWF5SDAZQOAQZBmJLyCyjwAxfdwAqkSD40e1J8pniuaYSLNaIa5Nk0yVNxSOrZwEPFXW0tjHZnDKp99X98NieJvs0Zb4CiTXHMKyl0MgA0hNJ1eGrJV0wG9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA2PR11MB5065.namprd11.prod.outlook.com (2603:10b6:806:115::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Thu, 14 Nov
 2024 16:14:51 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 16:14:51 +0000
Date: Thu, 14 Nov 2024 08:14:49 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <vinay.belgaumkar@intel.com>,
 <aravind.iddamsetty@intel.com>, <john.c.harrison@intel.com>,
 <ashutosh.dixit@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH 4/7] drm/xe: add function to convert xe hw engine class
 to user class
Message-ID: <ZzYh+SH3WFpQ8yd1@orsosgc001>
References: <20241113045549.2390980-1-riana.tauro@intel.com>
 <20241113045549.2390980-5-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241113045549.2390980-5-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR03CA0288.namprd03.prod.outlook.com
 (2603:10b6:303:b5::23) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA2PR11MB5065:EE_
X-MS-Office365-Filtering-Correlation-Id: 7779317d-5a84-443e-281e-08dd04c777f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHIyZVh1N01YWDJmMWZQTnlaS0dKcG5EdGtnTUNXc3hrRXhVbWlCNG9lZ2dr?=
 =?utf-8?B?UEI1RElac0RoSUNSN3ppOFZ5OWRxTHB1S1hxcG9VQzd1NmxFWVBnYVJjL2FX?=
 =?utf-8?B?aFJwYzRnREZWN0UvOFZqMzRaRTluNmJ4VkVMdVEwUnVVaTlqRlZDL2xKTW5U?=
 =?utf-8?B?ZHNnTkI5cE9DVzVEVWdLR2NvSmZFMzZHcThXeVFtK1NuYkVEN2hPOXdHanpH?=
 =?utf-8?B?dTAzdUxWdVdZWVJKRUpvaDZScHJiYktVMGNCdWdYZVIvcno4NWRySi96U2ts?=
 =?utf-8?B?VDFTRUpCaWRBZ3NRQjZRZFRqT0pjY1hNekJwQVB3aU5qTHBXdGczRk5JeDBm?=
 =?utf-8?B?WmcxR3kzWU1pS083eU9nK0NHd0JQZnVJaUJrNXN4Zmo0MWM2ZkprU3pyNEtK?=
 =?utf-8?B?NzV1SDViMFpnL2J6Z2lRVnRCakpyRGM5bDhuVThQYWl4TkdUTjRpd1FHZWdU?=
 =?utf-8?B?TUpPQ09YdzVtNDJ1QlpxTkRkazZQbGo5dXJ3d1Y4UVZYelF6OSs4cUJJVERt?=
 =?utf-8?B?cFhMTE5UYXZhL3ZucDl6UE4yTWRrdVFLM05HSTlTaW9Nek9Bb3VtWllMT1ps?=
 =?utf-8?B?U295cno0Y0JxamwvWGFNUWJMTU82WFhlZWtuYzdQanBvanVkdk9xYnNzVkFP?=
 =?utf-8?B?YkdGTExrN1kyWm4zbklyTGcyVWhtVGxlZ1Q5VkVqV2x4VnFXQWdHUXNhU1ZD?=
 =?utf-8?B?V3A0bDNUVXRiS2ZCTm9NdmlXeEpGOGk5N0pzRnJWUVdYUVhXZkhUS0dLQWNz?=
 =?utf-8?B?b0pXK1M3TzVXSG84QWkwSkFZTUtZNGpqQ3ZvZXFXWnlYYU9hWElBTkZzZEpY?=
 =?utf-8?B?T0dZTjR1dHJEMXkyWTgydGpyQmE4WDZLK2V0K2NOL1lDdDFRak9zM2JPbWZB?=
 =?utf-8?B?KzF1N2JwWXN0WTBjU3pmalovV21wSDcwTGUzWWJOcjcvMnI1UDhlTm1lTkl0?=
 =?utf-8?B?NU1aRzV5Q3R2UC81MHNFNmRnNmxpS2dGNzBWWG8wM1BDWUUrVnNJeC85TXRI?=
 =?utf-8?B?cVNQSm5XaTdXYXRWaGI2L3g4SGJYdlVPeTZlbjI5QzNPQ0dPdTRTV3V2WU82?=
 =?utf-8?B?TmU3U0RUMUtiQmh4SkdFMjlTM3NxMm5pT01OYllEdERtYWpCM2FVWG1aWTRF?=
 =?utf-8?B?Rm9KMFFnNmFjc2E1ejBkdUZicDNDMU5xdUlCY3BSS1VyMDBiTTZucy9sVlhE?=
 =?utf-8?B?VTA3MWpRcUpXY1l6MDBwVDVKdWlkM0ZJcWNLaGlpbUZJdTZ4Vko0cklEMlpE?=
 =?utf-8?B?ZzgwK0N0OVFES0NHR2hHSzM3cEdwM3k4RldFc1ZLYW96Q2xpdERMODNmN0hG?=
 =?utf-8?B?aVpwTmppS05TTHdyamtQZzF5TXQvUC9DUXZ0UldKOUJBbXF5OTNxUmswSURW?=
 =?utf-8?B?dE1oTzBTK2JhODBLdkpQZyswTmUyNkd3NjVjWFIzRjM0UlpQZlc1eEpUaEdq?=
 =?utf-8?B?d0JhSW9ONHA1R3YvYVJ6djlNQzI1TzRvcDFEdWM3WUZtZGExcEFqaUR2UXJk?=
 =?utf-8?B?c2pwaGRaMXl2YTJkamhhNmN0MFJYRUU3QnpMMzA1VnBtZzdrZ0pteWtUZGJv?=
 =?utf-8?B?TC9LUmtIK0k1cGFwSHRHbU5nbjhmbVRuZ1FWTmhTVXJUblJiamRobjIrbUta?=
 =?utf-8?B?VzUyYXJQdStIN1dFdjgyNjhmRDdEbGZ2Z2JBQVRjbDV1WlByTE1EV0lOVVc3?=
 =?utf-8?B?UkNkY1paWEs5bmZKajNUanJXQW9ud1ArblZUTWJHMFk5MERmQm02WTlyYXUv?=
 =?utf-8?Q?fPh3WcDoiO8/seTC6wEgGo63gmymC8cyKW1OtOl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDhWelVYMmV5TU0rY2V4eC82NVhpZk1KSWJTT1NMUVkrb1llMEhuNnhmQ09R?=
 =?utf-8?B?Wm9iRXFnMTU2V2NqR1dCN1o0Vy8vWTVDa2pyNyt1aEJZNmtIM0pMeGZCMnNK?=
 =?utf-8?B?anNrc25sdjFUS1NxV3ZLT25kMkxoaEN3VHlJdmQvNEhPTUcrd2FCWXhnRzBM?=
 =?utf-8?B?S2pSQlQxRXFrNDE2NElaV3dBQ0t2QTJQeXZlRlVqZDhIYi9iTG4wWjh6eFFC?=
 =?utf-8?B?UEpJNXNWNWFMWXVXdHFkTDlaS1I2aENBN0F1b3FTT2ZtM0dQbm9yR2M4YlJI?=
 =?utf-8?B?MjF6RzRjYldyOCtQdmREeXVlWE4vMkllYllGL0Z3a1lBNHZEZmFOZGt0L3or?=
 =?utf-8?B?NUhEZG9WVE4vZ1dvSVZucXl1SHB1OCtqQlN5MEhaOEwzajBldEtQSURPY3hN?=
 =?utf-8?B?Y1Bnd05mWXFxYkpFbzNXTHg5b2xUVTRnQm5jcXJQRTJMMkZ5MWlsanZpWUY1?=
 =?utf-8?B?a2Rzb3BuU3JyZE9ZanFGNERrWDN0eXVHOGpRb3Mvb1JsZkNhM3hwSmkrckNw?=
 =?utf-8?B?QmxxNlVVTDJrWEhjTlFmNk1Hbld2R0RWdE1ZVTFIY2YyQjBQMVo1eHJzYXdJ?=
 =?utf-8?B?b1N0WnJNV2pjVEpjYXVLMzBRWkpRbUNJU2xFTldSZW9tYm9oTzJ3OFhqZzNF?=
 =?utf-8?B?WXIyNzM0Q0VpVjBXWkswQ0E4Yk9aUGluYXVSL25wTjZvRlB3TXZXRld0dW1B?=
 =?utf-8?B?VngxK0Jaa0JuZlNjUzJKRzdTZ0xhRTIwWjFLT1QzaWtuQXRUQW9TR2ozUkpi?=
 =?utf-8?B?dkl3QWErVDBGbnhicDBaeDhSU2RWYVRzbXQ3ZlUxVzZyMWNTR1Q3c1didVI0?=
 =?utf-8?B?QUtDZFcwN1hnTVhvVk1qemppZ3MvQ284bHpyOHpmZjhmV0pVaUYySnp6bTBz?=
 =?utf-8?B?ckdZeUpXazdUL3pTR1pseldlUll5Q3A3UlpTVHNmWDZVckU1RTJGSmR5dG5l?=
 =?utf-8?B?YVFsZW1iZFc4L1lNc09YbVR6cnpaR1orV1hMRytjS05DMVhPOUR4clRqSXRT?=
 =?utf-8?B?dEUvREE5ZEVyWk1VTHNoR2ZoVkZaVUNJd1pQZUVQRVhlMXRXcHg3ZkNPU1pS?=
 =?utf-8?B?b3I0blVlRkd5MlF1cjhnSStLSTk5TW8vVGE4UlFtUFlMWitpbXQ0bHRHTy92?=
 =?utf-8?B?d0tFY2hYZzhyei9jbWEyenJXVEl3ZXBsT080YjhiQUgva21OVkMvdWkwZVBX?=
 =?utf-8?B?SXBqUjRtTlhuYlc3WGRPRVVkOFBkVkxtYjhUaUNnZmRuMUxtV3BPME5iTlZW?=
 =?utf-8?B?K1NBNU9KeG8xclBVWGcxQUk4YVp2bkQrNm1TRGFMRFJmOU9GTmt1UWlUQkxX?=
 =?utf-8?B?NEFFRzRpZ3FreWdjL3lLU3c2SHZoU0MwQmU0eG9XVzBLeXRPcFJUWklNZlZP?=
 =?utf-8?B?bllZZlE5ZjNTUGpNcXdKSVhhWHNrV1RHa1hSQ1g0Zm1ZRElhTzU1dGdaT0xy?=
 =?utf-8?B?YzQ2a05JS0l0dXZIOE5FU1N3RzMzblczODJVRXdnT0RTcGdia0g4QzNMci95?=
 =?utf-8?B?bG01aVkvZWdwVHhpUVV0UVV4WC9ZalZXM3M2RnVGZWcwT0huYVZnNkpUeDhs?=
 =?utf-8?B?dXVuUlF3cDlqeGcrTU90MWZtU2lGd0V1WURMUUFQenNvTGJHSFVqeU8zSVFv?=
 =?utf-8?B?VDRpNlZIaUxyRTVEQjFKVW1YTDNwVUZVUmFIYXhtVmE3cWFielJmVWptSjVU?=
 =?utf-8?B?YXVIT2owS2RUSVJtb1BZWWtOc2J2NnRxL2UrUmJuRFV0Z0NvMXNOUThQV1lN?=
 =?utf-8?B?L3lYRW5HYVJYWE1iMnlnZFVrNXBIbzNEVnYvU1hpcEtZaEE3N1pJU3A0Y0Qv?=
 =?utf-8?B?ZDBzd1Z1UXJ6Q08rRlZjcFBFYW5CKy9FeXRSWjRDOU1NOGhlbVlmNTRpYVVI?=
 =?utf-8?B?dHMvQTQ2OHBnRGYzdDAxbXRzSjY2V3NiaGRsY0FnMzg0WnNpTks2V3hSR0w5?=
 =?utf-8?B?UjBTdXI0cktzTEhSdkxFeXNIV1hOcEdleklEUGtzV21kTm14Q1h4UVo3SCs1?=
 =?utf-8?B?RWI2bTdaeVUzVTNwQTlyZkdCaXpNN1dXVHJjNjVGVTZaN0djY3ExMGpqcGxo?=
 =?utf-8?B?UmZaYlZCRWNGMmhpQ0R2eFEwZVdXdjRCc2dxQUwxNEZEM3hObzNYdlFBSHVH?=
 =?utf-8?B?SXMyZWdpdmR0a29jOERpWWgrUzhwcDQwRFV3bnBUSFhncjRsbmtrayt1a3JM?=
 =?utf-8?Q?a2nm5GBHa+3+1+3gnkz9+XY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7779317d-5a84-443e-281e-08dd04c777f6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 16:14:51.5819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pkzWLvxPOaoJf4XYiiKb/r+X5BRJHgeOZeUlOLDhiRRXPbZmY2o0+6yDdjCYSNWe+PIft040Zjh11eTtyusE6hF/+k056a1YWPTibzV+qXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5065
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

On Wed, Nov 13, 2024 at 10:25:46AM +0530, Riana Tauro wrote:
>add a function to convert xe hw engine class to
>user engine class
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> drivers/gpu/drm/xe/xe_hw_engine.c | 25 +++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_hw_engine.h |  1 +
> drivers/gpu/drm/xe/xe_query.c     | 12 ++----------
> 3 files changed, 28 insertions(+), 10 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index 1557acee3523..ba40f2692f34 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -981,6 +981,31 @@ const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
> 	return NULL;
> }
>
>+/**
>+ * xe_hw_engine_to_user_class - converts xe hw engine to user engine class
>+ * @engine_class: hw engine class
>+ *
>+ * Returns: user engine class on success, -1 on error
>+ */
>+u16 xe_hw_engine_to_user_class(enum xe_engine_class engine_class)
>+{
>+	switch (engine_class) {
>+	case XE_ENGINE_CLASS_RENDER:
>+		return DRM_XE_ENGINE_CLASS_RENDER;
>+	case XE_ENGINE_CLASS_COPY:
>+		return DRM_XE_ENGINE_CLASS_COPY;
>+	case XE_ENGINE_CLASS_VIDEO_DECODE:
>+		return DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
>+	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
>+		return DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
>+	case XE_ENGINE_CLASS_COMPUTE:
>+		return DRM_XE_ENGINE_CLASS_COMPUTE;
>+	default:
>+		XE_WARN_ON(engine_class);
>+		return -1;

This can be something like:

const u16 xe_to_user_engine_class[] = {
	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
	[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
	[XE_ENGINE_CLASS_VIDEO_ENHANCE] = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,

WARN_ON(engine_class >= ARRAY_SIZE(xe_to_user_engine_class));

return xe_to_user_engine_class[engine_class];
};

Regards,
Umesh

>+	}
>+}
>+
> u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
> {
> 	return xe_mmio_read64_2x32(&hwe->gt->mmio, RING_TIMESTAMP(hwe->mmio_base));
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
>index da0a6922a26f..3aca7751a482 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.h
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
>@@ -74,6 +74,7 @@ static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
>
> const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
> u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
>+u16 xe_hw_engine_to_user_class(enum xe_engine_class engine_class);
> enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe);
>
> void xe_hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg, u32 val);
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index 170ae72d1a7b..98b036678eee 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -26,14 +26,6 @@
> #include "xe_ttm_vram_mgr.h"
> #include "xe_wa.h"
>
>-static const u16 xe_to_user_engine_class[] = {
>-	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
>-	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
>-	[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
>-	[XE_ENGINE_CLASS_VIDEO_ENHANCE] = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
>-	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
>-};
>-
> static const enum xe_engine_class user_to_xe_engine_class[] = {
> 	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
> 	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
>@@ -206,7 +198,7 @@ static int query_engines(struct xe_device *xe,
> 				continue;
>
> 			engines->engines[i].instance.engine_class =
>-				xe_to_user_engine_class[hwe->class];
>+				xe_hw_engine_to_user_class(hwe->class);
> 			engines->engines[i].instance.engine_instance =
> 				hwe->logical_instance;
> 			engines->engines[i].instance.gt_id = gt->info.id;
>@@ -677,7 +669,7 @@ static int query_oa_units(struct xe_device *xe,
> 				if (!xe_hw_engine_is_reserved(hwe) &&
> 				    xe_oa_unit_id(hwe) == u->oa_unit_id) {
> 					du->eci[j].engine_class =
>-						xe_to_user_engine_class[hwe->class];
>+						xe_hw_engine_to_user_class(hwe->class);
> 					du->eci[j].engine_instance = hwe->logical_instance;
> 					du->eci[j].gt_id = gt->info.id;
> 					j++;
>-- 
>2.40.0
>
