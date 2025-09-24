Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BF3CAC5B0
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 10:14:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4541E10E232;
	Wed, 24 Sep 2025 10:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eSg1xmK4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEAA910E232
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 10:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758708876; x=1790244876;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jKt1G0ALf5XYwWvEqCuOO5RWe4WkxRXxJCVkaVYlYaE=;
 b=eSg1xmK4nLX9imVsZV/MWuyZY/l0/SyIUHcqtkd3njeU2EcNUGgoRNur
 i2z6U/koEeaDyLD0PW85CdXnqHaonfcX7NUbJ5my+s5acUjw3vR+m0c1X
 dsQGxdKc2+OdKbTz//7ZurduDyy8rTHdMXsqWOt9LaAKjpVOuPjIp1kXN
 9yAsB/qSKayfd8NOq1DD4edvKY7HkOKuKwpq7iBQfTRRkIGv/WN2q53xe
 VTv2XOKvk6QeHIZcOYtL3B5IAQTOVohbhJT58EQnvlJncKVQ4fhv6Sb/9
 eA4hwiQtoc+wFu6CRKMgGn/1y2F/9nffO9TjeVZ9A0mVZtGjIcjxE0zpr A==;
X-CSE-ConnectionGUID: HqMbWJ04Qg+XS4fmOtR/PA==
X-CSE-MsgGUID: /GM95pp4SuqLkD3Eiau7aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61113996"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="61113996"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 03:14:36 -0700
X-CSE-ConnectionGUID: gzEYX9DISNqLHIXeMILQDQ==
X-CSE-MsgGUID: POxtYN3NRweu7BbqTyD+TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="182167088"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 03:14:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 03:14:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 03:14:35 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.40) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 03:14:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwU6OXiu1uAFo1AWARMeIFXtvxYlbM0pIcMAY3r0xjhlGlqgYovR0cnd0crEqsaGWJwQ629WKLtxsWoIsY0JoREyqoWvubLo4bI3RNyIXKcwnZjssxjOCKi5iomntAW0m+h9M0Pg4YCV+rAMEjgEXPWQ3T65OdUgzkUOjNAlV2VwbJvWbo0WKHohZIz6xQvbFYtRVc0MSL5tHbZau8qldTjitcbjNOfdP4fXjIrhczeW9aVzaqKF2t9KnBRRiHTk7pbwTd+VwqKexxCoazxrLAZz+o0RBrf0vEOqkCuPZ8hepXjrlxWfPvjmiEJybnWXTNRMxun7ELYzgDGMcOnL2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2oVpwZvYnjYBT2MpVNbQ4FmOmXPb+6/gDpmoaElgLAI=;
 b=ghuH6cTK2oZpzIfpdXP93wLDRNOKP125kSeWsqiFK+xLWEvDsoqenJJEcEW19B/IY6ktGszh1c8AMNdT+jgsn8mWTE0QmBhCc1RttCGC2VQOLhe+b6SESo32NyUJXtCdn/5vTlvmH6yExiDtB/hj4s04UyHhfVRePRnbar8NCYEi7k1ImMoKkoZJ0WuYeS/Qo/JYOnb6dzb6F2WN2dgQfHzLov2AUrhZfqngpipQMpyFQbHFAIeLiv5rCa+5bdx6Uy4CFLJ9HRKAWfIzqAgf9lh9l7ns7E7Daz58N1X3hhfLxJtV6PQW6XqrUrC2Zh2qq0N+iEPIikkp1Gtm9ixqnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA0PR11MB4733.namprd11.prod.outlook.com (2603:10b6:806:9a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 10:14:32 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 10:14:32 +0000
Message-ID: <30efe3a4-0598-44e7-90aa-5283ed8247f9@intel.com>
Date: Wed, 24 Sep 2025 12:14:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/34] drm/xe/vf: Add
 xe_gt_sriov_vf_recovery_inprogress helper
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-12-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250924011601.888293-12-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0035.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::11) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA0PR11MB4733:EE_
X-MS-Office365-Filtering-Correlation-Id: 20a91148-47c5-4fe8-5f90-08ddfb5327d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTNGaDdNelVoU0Rjbk1wbnZlYVhjQnhQYWVLL1crMEU4NkovQmJUWlIyeUU0?=
 =?utf-8?B?S0lOTEtWQmo4dzZpVGcxZFZHbXNUNUg0RHpCZ2tzN1N4b3BEYVlNSTdtK1E2?=
 =?utf-8?B?ZXBxNTlMb25hN1FteFBNZlphVFZzTzFHbmtoMEdKcko4a2xzL3VwQkloR1NJ?=
 =?utf-8?B?WEI3K3VvNXlibnRyNFVJT1ZBelg0R2oyQkJaUlJucnFyYnVBdGVvTlVoZnpV?=
 =?utf-8?B?RGF4dDRlMFdqNVFSY3lUZk44Ti9pYWNMUkpzazVRZ1dIdHVjbWd3YTh3L2ZW?=
 =?utf-8?B?ZVJ4VXRhMU11VzZmdS9pbk9sbkhTWHN0Y0hFWVBKeldsQk1vU3J4Y3ZjVHVt?=
 =?utf-8?B?dk9FY05ZblYrOTNKQnVCamtWcUhYZlRmUlI3K0ZJb3VHU0ZRdTQrT2IwVjRt?=
 =?utf-8?B?SnhlUWJnamtYRFZmQnY1QVVsWXVXWFNaSXdEOWJLR2syVG1HRE93bURnR1ZF?=
 =?utf-8?B?azlObHROc0MrTkZNQVNpSkVRWVBDS2o2ak90S2xpQ0hsSW54emlkMExXeVlo?=
 =?utf-8?B?Z3NMQnhmYkNtbUZnM0pMZVBlVjdvd1VXd2FHU0NDeEIyK0RPbHBtREFpMGd2?=
 =?utf-8?B?RG4zeHhyS1dYTlJSc0NCOG5DTWFWVWxlOTNKTWJzTkNQVXlhbThEaUl3UXEw?=
 =?utf-8?B?N04yRGcxYm5RZ2dNQm10MkRxNnpmczNrenRLWVI1MDY4OTZkYlFDTmE3cDBC?=
 =?utf-8?B?U0hRa2h4L3NyRnFPQTk5ME9MWlhpa2VqYmNGQlVqYjk5cWZSVzk2R1NJVmNo?=
 =?utf-8?B?T0s0UnZBQVFPaDR2dkg1L0h6M0wzcEVrM0I0UmJMR2QrbWw4THUyeE5ZMTBj?=
 =?utf-8?B?WmZZdjFZMm9POTRNZFBFZUVFbW1laUFjc2szdjlkbHJwRGVtazNrMktIUVNW?=
 =?utf-8?B?SFdQRVhOT09PS2x5RnVKNlVmNWZQVkR2aEJOdTFneVdQeDZhbEZlSEVhYWE2?=
 =?utf-8?B?WVhNd3FVdXAydVNoNTlQQWZpS0lPQjlWZU1RYXlwMENSMERzR3RiaXp1c3Y5?=
 =?utf-8?B?Q3k4R3ZhbGV6bDdWSHZJN0xJN2c0MHZZYkJjVXhQYVhQQ0VLZktTeFNSdW1o?=
 =?utf-8?B?aUU2UnNFeFhVWGJyTmlzT1cwTDRjcFBKLzRYdnRibXhKSldhNUxFZGtEYWUr?=
 =?utf-8?B?cjVHSTlWUFFOZTAraGtnTHNTQUZsNHRYVXVCLy8vMUJMNit6cGRjRlJvQXds?=
 =?utf-8?B?R2hLb29vVUVKMUNZUEdoT1FUVDBEOHFOTndmajlqbmhncU9kRUl2TlFUdm1G?=
 =?utf-8?B?S1NBaWtxVFpzOU1aUkpoSXdmQVdLUnFoTnh1MStxazlVYnNsUjNRRkxBM1Ir?=
 =?utf-8?B?Z01PRFRsVkh2dGRhY1R1VjNsbkcxM2dLV1RkZ0NuZHdraE9YUlFlNElJV1VQ?=
 =?utf-8?B?VkdhTCtQVlhZZlhXOC9XU1JTTUhzU01UNmhDUSs0RGk0QzBPeDJuZ0NRck5U?=
 =?utf-8?B?KzZiS1RoLzBuTXJ0MjNHOXZPa3RoL1cyVWxLSTZ4UVJqaG1nckhOeXFVSkdE?=
 =?utf-8?B?VGx6cWtHREtsc3lJbXdzKzVzMXIwMlAzRFlRNnpxbE9pU3ZnY0s3N25LbXJS?=
 =?utf-8?B?MzRWV0JOWSs5TEdCRDRGdThvVW5mbnl4bVBUbS9BMUpIY0NLMzNENElFR1Jm?=
 =?utf-8?B?STNSK1p1YVFCc2QwdG9rTXY5Y0hRN0hJQnRvZlFWZmZQNkdrQ1Fzait1R0xT?=
 =?utf-8?B?N0g2ditrWGx6Y214N09qNUc2U1RGMWx5dHA5Mm5ZSW5pOEs0K0pSRUg4ZnRV?=
 =?utf-8?B?R0cyWGYvRmVuSS9XQ3E5K2JwNmpoRkkzazBHbmxOYVZnekR6NFg5TmFnUEoz?=
 =?utf-8?B?SjNMUTVzTEdxSS85aWxESS80RUZ3bHB5dHBXaGo4aXloaitPemdmMnhzSnNn?=
 =?utf-8?B?MmVSNllKbkdPYzlVVnJLZ0RyOC9pSDJXSFV6bkl5cEcvR1NkelB3dk4zMEJF?=
 =?utf-8?Q?IJ05a55wRHI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0N2dDZUNGRoc3JZN1lNN1lBWUM3emFIODkwRklFN0wxM0FmYWtJUW85b3Rx?=
 =?utf-8?B?Z0ZMMVNxa0lyTzN2SlQ4b0dpVEY5MWd0Tlp0UllqVzhlTEZlQnF1c01KeExw?=
 =?utf-8?B?bnNnVGhQZGdoQndwelJmbVd2K0VXQU5XS3ZvK2E5YWtTMlpzL0EySkRhSE5a?=
 =?utf-8?B?NXIrYzZoNXpMMm9XUzJKOHk3YkdUcm5kZXBKN0xwOXhvd2dXQWZZQXBCVnBo?=
 =?utf-8?B?SUhIcDIxSlhxM0YzSFJ5TjBoL3FpUEdIckZjeTl6ZXU0SXB1QXI0NVFiM0Fm?=
 =?utf-8?B?YjBkWHdBcWRlcTZqTVFrZ3ZnN045U0tVam90NFF1Q1NDOUc0cmdDL2d0ZWFN?=
 =?utf-8?B?VTdrUXFKZGdiRnYzY3lwdG1lUUVDTmlGd0x4Zm93d3NvendhUW5wdVZBYURl?=
 =?utf-8?B?c1lKRmJSQVJoeDNsRXFhS3BYWTlvb29KbEl5b2xSODRja1FCYWVvREp5aGJt?=
 =?utf-8?B?b2JhaUVmZ2tYUTJHUGFkdnM3KzlpY2JWNm9RYWtWdWY3bWs5VE9zU2h0WFR0?=
 =?utf-8?B?c0Fzd2trMTByVHRvTUV5bm9LQXBVRVBDcmVWMjRmZ2lhK3Z1Y0htWEpRMi94?=
 =?utf-8?B?ZGMzeDVDbEh2YUovaExNd1J0ZGJ3MW9sOGcyS0QyRG4wZlZpUEpYbWtYNGJy?=
 =?utf-8?B?TUJrU09EekFNVUw5WXZPTC9KalJWVDB6Zk9PNnJ5Y3R5dkRieU12MmR2dmZk?=
 =?utf-8?B?b2t3UVNtNnluUmRXZEZ5VlFsNzZadlVLZ0xEYlBtNWFURzQ5U210VS96VzU3?=
 =?utf-8?B?a2tLaEJyajN3bGl4MGN4d2ZCUHNGVmpKcmJob0N3WFNUWE1zS2xPbU1lQm1v?=
 =?utf-8?B?RnU1OTMwNmV1YkpvcFkvREVLMUc1dmRHckNQVlpHS1dmWEpkVGdFNklTREpS?=
 =?utf-8?B?M1U3RHZtQ0JZVGVtMW9qY1BPUlhGL3Z6WldyWFQwVGprcVV1b0xkOFhTUU4z?=
 =?utf-8?B?Sy9CWnF2K2ZHUU1UTXlxSVcvRTg0YngrWHN6SDZldU1lRUFSRTJsRzNVb1c0?=
 =?utf-8?B?elFPUGxxdU9Ub3VZeUtybFh5MnhLY1E4bElNc3ZpUXp4WWNNNDRTOVlwWGhF?=
 =?utf-8?B?L2FoblFXQnozM1ZkUGovM1BpbEJTUStjTXVDQzk4TEV4WWpPcHFsdjkzNUtY?=
 =?utf-8?B?a0NVSCtQNGExcFZMc1d0RGk1QTNDUmFoN1Y5TjJSN0F2eG1tNDVsaUNUV0hR?=
 =?utf-8?B?bjJ4elFwcWdQazZzRDVIT2Mrc0JmMG52aXhvYXZKRGJSeEJWTm1VN3MzR1dO?=
 =?utf-8?B?dk1DR3RycTdTUUthY1h5ZCs5ZGRkdkg1eFN2RlVnVCt3a1JiZmNnSlpWVDN2?=
 =?utf-8?B?WjlXNFAyM1hPNHVBVUZrME4wOStQVUkvRGUwbUxIbUgvZlR4WWp3WnZYNWZa?=
 =?utf-8?B?ZzJsYW91TUIyb3Fyak4waWpBRlIwc2pjUm5LUThic3VLci9tUHFLSHdGeHdW?=
 =?utf-8?B?QXlxYnZiZU9nTGs4VXJQWDZscnQ0NDFOT3lxL2JGM2RSSFBjdjM5elN3dkl1?=
 =?utf-8?B?azU5Wml3T3o1aUFrSm5Eb2xVaHByb0dhODIvd2J5a0pENVltaWRXT1R6UW9T?=
 =?utf-8?B?Nll2b3JwV2VGNzJiY051WmdJQnFCVEpwenV0NkI5NkM5cTlVejR3aVhleThy?=
 =?utf-8?B?WUFncjZmTnJsMnMvdW13dEo3WHpCZWxERkpKZU1idXQ1eElIUG1IeTlvSk1C?=
 =?utf-8?B?Z2RBVm1mVXhYUnVqVUVHVXVtQ1RkenpwQWw1Zjl0Ymx0SnVocGRxZDZPVUJZ?=
 =?utf-8?B?c3JnNFdZSXpaUU4ySnB4YjJmYWpmbThROWR6a3FRREN5TDdHY3hrM08yMWwz?=
 =?utf-8?B?WlJlVEIzY3hZUFcyaDgxak0zWGFham5iZCtTcHZ5eEpmYlE1MERPYTVKWk1N?=
 =?utf-8?B?dmZ1NkVNcnFiclZtTkpWQU0vSHBFU1RTaHkyTVZlWjY5bWF0K2hmV01hUFdK?=
 =?utf-8?B?MDFQODhsaTVqN0dmUnJSZWR0MVJmdHJxS0ZPWFFGT0NKVkhSeWhZMTFZUEM5?=
 =?utf-8?B?V2Jhci90eUhvdmFJWi9KeXRPeTRKa1A0em5UY0M1SGQ0RmsyZjVFdmFlWjNo?=
 =?utf-8?B?clZrVDVwUlVrTnBDcFFFdjIwYlRRZ0E2dVltdVRLM043dlY5clQ5VTY2cWkv?=
 =?utf-8?B?c1cySmZKZlB0Mk5EOTRObXVjMU5NWXBNSWhEREhzM0FYb0FGZkFxR0ppQVpN?=
 =?utf-8?B?eGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a91148-47c5-4fe8-5f90-08ddfb5327d0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 10:14:32.7071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e6g2slO/xok5PUPx+Gazx8e4RpoLiZ2r+P2WVsKGviVga3CcMW0lQnmkXGxj2KfduTamxm/RrW2zLgHVMI2wLeOMbiXpSPCdJCnTG53RoA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4733
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



On 9/24/2025 3:15 AM, Matthew Brost wrote:
> Add xe_gt_sriov_vf_recovery_inprogress helper.
> 
> This helper serves as the singular point to determine whether a VF

hmm, this "singular" looks like a GT-level only, not global

> post-migration recovery is currently in progress. Expected callers
> include the GuC CT layer and the GuC submission layer. Atomically
> visable as soon as vCPU are unhalted until VF recovery completes.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 17 ++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 10 +++++
>  drivers/gpu/drm/xe/xe_memirq.c            | 48 ++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_memirq.h            |  3 ++
>  5 files changed, 79 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 016c867e5e2b..c9d0e32e7a15 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -26,6 +26,7 @@
>  #include "xe_guc_hxg_helpers.h"
>  #include "xe_guc_relay.h"
>  #include "xe_lrc.h"
> +#include "xe_memirq.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_vf.h"
> @@ -828,6 +829,7 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
>  	struct xe_device *xe = gt_to_xe(gt);
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(xe));
> +	xe_gt_assert(gt, xe_gt_sriov_vf_recovery_inprogress(gt));
>  
>  	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
>  	/*
> @@ -1172,3 +1174,18 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
>  	drm_printf(p, "\thandshake:\t%u.%u\n",
>  		   pf_version->major, pf_version->minor);
>  }
> +
> +/**
> + * xe_gt_sriov_vf_recovery_inprogress() - VF post migration recovery in progress
> + * @gt: the &xe_gt
> + *
> + * Return: True if VF post migration recovery in progress, False otherwise
> + */
> +bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt)
> +{
> +	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
> +
> +	return IS_SRIOV_VF(gt_to_xe(gt)) &&

this is xe_gt_sriov_vf function, so it is expected to be called only by
the VF code, thus we should rather use xe_gt_assert here and the caller
is responsible for the IS_SRIOV_VF check

> +		(xe_memirq_vf_recovery_irq_pending(memirq, &gt->uc.guc) ||
> +		 READ_ONCE(gt->sriov.vf.migration.recovery_inprogress));
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 0af1dc769fe0..bb5f8eace19b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -25,6 +25,8 @@ void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt);
>  int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>  void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>  
> +bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt);
> +
>  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index d95857bd789b..7b10b8e1e10e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -49,6 +49,14 @@ struct xe_gt_sriov_vf_runtime {
>  	} *regs;
>  };
>  
> +/**
> + * xe_gt_sriov_vf_migration - VF migration data.
> + */
> +struct xe_gt_sriov_vf_migration {
> +	/** @recovery_inprogress: VF post migration recovery in progress */
> +	bool recovery_inprogress;
> +};
> +
>  /**
>   * struct xe_gt_sriov_vf - GT level VF virtualization data.
>   */
> @@ -61,6 +69,8 @@ struct xe_gt_sriov_vf {
>  	struct xe_gt_sriov_vf_selfconfig self_config;
>  	/** @runtime: runtime data retrieved from the PF. */
>  	struct xe_gt_sriov_vf_runtime runtime;
> +	/** @migration: migration data for the VF. */
> +	struct xe_gt_sriov_vf_migration migration;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index 49c45ec3e83c..94d5d6859aab 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -398,6 +398,23 @@ void xe_memirq_postinstall(struct xe_memirq *memirq)
>  		memirq_set_enable(memirq, true);
>  }
>  
> +static bool memirq_received_noclear(struct xe_memirq *memirq,
> +				    struct iosys_map *vector,
> +				    u16 offset, const char *name)

maybe instead of duplicating code of memirq_received() in 90% just add there
the "bool clear" flag?

> +{
> +	u8 value;
> +
> +	value = iosys_map_rd(vector, offset, u8);
> +	if (value) {
> +		if (value != 0xff)
> +			memirq_err_ratelimited(memirq,
> +					       "Unexpected memirq value %#x from %s at %u\n",
> +					       value, name, offset);
> +	}
> +
> +	return value;
> +}
> +
>  static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
>  			    u16 offset, const char *name)
>  {
> @@ -434,8 +451,16 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
>  	if (memirq_received(memirq, status, ilog2(GUC_INTR_GUC2HOST), name))
>  		xe_guc_irq_handler(guc, GUC_INTR_GUC2HOST);
>  
> -	if (memirq_received(memirq, status, ilog2(GUC_INTR_SW_INT_0), name))
> +	/*
> +	 * We must wait to perform the clear operation until after
> +	 * xe_gt_sriov_vf_start_migration_recovery() runs, to avoid race
> +	 * conditions where xe_gt_sriov_vf_recovery_inprogress() returns false.

but the VF recovery "inprogress" shall be already set in the top level

	xe_sriov_vf_start_migration_recovery()

even before the GT-level recovery starts, where is this race ?

> +	 */
> +	if (memirq_received_noclear(memirq, status, ilog2(GUC_INTR_SW_INT_0),
> +				    name)) {
>  		xe_guc_irq_handler(guc, GUC_INTR_SW_INT_0);

what if new MEMIRQ will arrive just here

is it ok that we will clear it immediately?

the whole memirq flow is that we clear irq byte first and then process
it, so if anything comes right after we finish processing will be noticed
on next iteration

I assume any races due to double migration shall be handled on the VF2GUC
communication level while sending RESFIX_START/DONE, not here
> +		iosys_map_wr(status, ilog2(GUC_INTR_SW_INT_0), u8, 0x00);
> +	}
>  }
>  
>  /**
> @@ -460,6 +485,27 @@ void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
>  	}
>  }
>  
> +/**
> + * xe_memirq_vf_recovery_irq_pending() - VF recovery IRQ is pending

this function isn't really using anything VF specific except that on the
VF the SW_INT_0 means "migrated"

maybe we can drop the _vf from function name?

	xe_memirq_pending_guc(memirq, guc, bit)
> + * @memirq: the &xe_memirq
> + * @guc: the &xe_guc to check for IRQ
> + *
> + * Return: True if VF recovery IRQ is pending on @guc, False otherwise
> + */
> +bool xe_memirq_vf_recovery_irq_pending(struct xe_memirq *memirq,
> +				       struct xe_guc *guc)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct iosys_map map;
> +
> +	if (xe_gt_is_media_type(gt))
> +		map = IOSYS_MAP_INIT_OFFSET(&memirq->status, ilog2(INTR_MGUC) * SZ_16);
> +	else
> +		map = IOSYS_MAP_INIT_OFFSET(&memirq->status, ilog2(INTR_GUC) * SZ_16);

nit: maybe just calc offset conditionally?

	u32 offset = is_media ? ilog2(INTR_MGUC) : ilog2(INTR_GUC);

> +
> +	return iosys_map_rd(&map, ilog2(GUC_INTR_SW_INT_0), u8);

as we have helpers we should use them

	return memirq_received_noclear(...)

> +}
> +
>  /**
>   * xe_memirq_handler - The `Memory Based Interrupts`_ Handler.
>   * @memirq: the &xe_memirq
> diff --git a/drivers/gpu/drm/xe/xe_memirq.h b/drivers/gpu/drm/xe/xe_memirq.h
> index 06130650e9d6..476b8cba179d 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.h
> +++ b/drivers/gpu/drm/xe/xe_memirq.h
> @@ -25,4 +25,7 @@ void xe_memirq_handler(struct xe_memirq *memirq);
>  
>  int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc);
>  
> +bool xe_memirq_vf_recovery_irq_pending(struct xe_memirq *memirq,
> +				       struct xe_guc *guc);
> +
>  #endif

