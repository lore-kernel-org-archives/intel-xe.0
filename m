Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A91C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 05:51:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9137E10FD5C;
	Mon, 29 Apr 2024 05:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OrbGMO9N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3896710FD5C
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 05:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714369880; x=1745905880;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+bkQw63/NXeDk7+5drlOxkAyuqu6+gtiWZwBNoq4wIo=;
 b=OrbGMO9NOUwFM3tjlLVx28fhbikjt+eC1ityWPjxZEdfqp2noNj+NlKE
 3wjOzIR3pM6lolZ9WENDME2W0vB3KhnFUsaGZVPoYmWPyZKRcDYx3RpRL
 gW10MM6r9xoVsUdJ8n6U0eXVKe+yts94eNlFXCTPdoaEqt68AnkRiKJyG
 r60HxoG4hFEfWaQ3ipSAsHBGKdwYcoE2QYLsIrfI8oBiop1Cv3AiEns4Q
 1Kj6HUFZWZeBXyZdmOorNluPO2ECdJLdMzAyhCZ1eNmhh48DA3E3+ods1
 nOz3540MyOvBXYJmwsQbWaelm+BrzvOpw0VfZn7REVJCd05eSFiksTz/d w==;
X-CSE-ConnectionGUID: /osJn7anTw69d5NpVqd+FA==
X-CSE-MsgGUID: 8EVX5bRvRHCe1wz/zZv9uQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10128973"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; d="scan'208";a="10128973"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2024 22:51:17 -0700
X-CSE-ConnectionGUID: Wqjn+jXhQMSAiRx1wa4V3g==
X-CSE-MsgGUID: tjTCVLxcQvObyPyf+ERPvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; d="scan'208";a="30657213"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Apr 2024 22:51:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 28 Apr 2024 22:51:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 28 Apr 2024 22:51:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 28 Apr 2024 22:51:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHfk88vMeaOo4buBVe2xaEMXvrNyajnoyh0A7oAFMD6pVA0f3cu9r9eHr59z+BJrpmMUp5FjEiwCfApoUQ2K9Xk9ObVIaDcBQOAL+SW+TszXalTO4QrTh07ariinU81kRlPLdebVyfXXA5KVnr82zdPoG9IBgH1KgBeon8mSssvQlurdnw49Og3xVmA+UTrTtawlgGqN/RxKDY9nOaUDMsNA9Zc9KUz+/SicFT9LavHd8vMIJfadHjhbVkjkHCxKD4kgRP2hlSADDm5/ZGdlzwLdl6O6GmLGJCaWWr9DnSSaDU4Xigk6sva14fdAk5p7+FWgLXr2Y5VlYFfMYo8BnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7xLi3CCbpPx7tEQOD2yRcCaspKK0kv1DxugZu+hLAI=;
 b=PmVxNhHRGeLTVhQThOuohcl/ErF/98pwegXNCmcE6sta8IYEVzreuQr0w+KmV7+kgwXVR76hcXXLIb2GW7smgm/hvb3WWkbOs58/W0JNAV8sKIjFNl/he6tT+TJjIWGLZUKC7auwPg2WdSqL+cEXjpE08q8RHYkCjxRXtSIA3Yi1NNg6hwjkZOVmq+IKpIM9VYOa7ZmmCOqmcwXtN8RlMevvrkK4fZTTd284BoQmObdX3OWWaamlXOgeLqqGNJpjxRnX7xarGi7VLXPdvYwuZlv/4Q0eouWN1Z4RZRgmyxeXcRmB3ZusB72Sv+RcU4Ll2rZG2gX10hzxsPh+xiK6QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ2PR11MB7714.namprd11.prod.outlook.com (2603:10b6:a03:4fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 05:51:04 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 05:51:04 +0000
Message-ID: <1d9a2202-664b-4cc9-b60e-1356e10d4b10@intel.com>
Date: Mon, 29 Apr 2024 11:20:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe2hpg: Add wa_14021821874
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
References: <20240429054406.2165095-1-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240429054406.2165095-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0122.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::8) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ2PR11MB7714:EE_
X-MS-Office365-Filtering-Correlation-Id: 9116281e-94f2-4dbf-578f-08dc68105b67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkVMcUc1R0UweHV5dHN0aEM5cUxTdE5rRnVKQlZTRFhxNk1iY2hGL3FhTDA1?=
 =?utf-8?B?aVc2UzZQWUpHRS83WUpUbkxoUTFwYTJ6bVhqTGF1Z2t1RGkvbjNjSGNRNm5m?=
 =?utf-8?B?MkEranJpQkR4emJXcVVpbUlFT3BPUmtRWGxFY3lpR2JMMEZoZWQ2aHNHRzFG?=
 =?utf-8?B?MlhIK3Q0dngzYUJ5d0hPdi92Zk1uYVJrUmR3Qm54eUFiamE0aWtvUVFiOHN3?=
 =?utf-8?B?YVRKRTlCdG50YStWYnFUWWV5Q0RsOHFLRWpQdC9kWTFMd3FZbWFQV1ZUTUxa?=
 =?utf-8?B?VkJKeDVYOEE1VkxHSGJiSDc1QmV1ZEU3UFA4R0NkWFZKUzhWb2Rha0tmT0JK?=
 =?utf-8?B?bENuOG1mNFJuaUQ2aW0xNWIvY291QWpPM0s5MUhLM1RvdWlycEJ4TUttNUJ4?=
 =?utf-8?B?cEtWUHZERWJZS3VIZi9KWm9TeUprM052c29kNndSTzliNC9yRThoNlNkaXZN?=
 =?utf-8?B?WnpoVEh3aWpxUHlOaHgxNGdHMGdpbG14RlM2RTBGSkVwYmJDdFdCL2pXYU5z?=
 =?utf-8?B?alpBR0h0ZllNaWQzM2FlSkZxUTYraDhWcWRzZFBjTGdYSk54dUh6WnV0K2xJ?=
 =?utf-8?B?WVh3T2c4Y3U3WCtyYkk3ckpWc1o3b0w0NE5HeXFxczNNcDdJZzVWZlZKa2lB?=
 =?utf-8?B?RW9UYWlRaklSZmd1aXY0NHAzb1B0QlVLcUVyMVVoY0hhYndrOGRQaDhBVTA4?=
 =?utf-8?B?eGd3Y0VZY1o4ZGErd0M0bkdHSG82WWVxRGx3TG1SYmF4cFRMUkRaZ0hlQnJq?=
 =?utf-8?B?ZWZDSDgweTNoRE1ZQUVVM2ZybDJCWDVpK2ZQZk1icG9Oa0dIc1lvZUNkdzJm?=
 =?utf-8?B?MXlGeVlzSUthM3U4VXFVTmwvZ2NXWTc2UE8yeHFNMWI2Q0tUeDBKK0VINzBB?=
 =?utf-8?B?ZHExMWN0aVpSTWlhZnFLNVpEZVN0a1NRZ3dBQXVMZFhvY1dGdUFGMjFUZitN?=
 =?utf-8?B?U2NXV05NdzRlTGNHa0hWVkdJdmhRNXU3V05QRzh1M0lBdENjYlNvTWF5Ukhk?=
 =?utf-8?B?eWxXdnBNNGgrRnV1K0hOT3lpdVU5T0ZNRGdFRFdGNExDYlNBQmVpM0p5VERu?=
 =?utf-8?B?NVdxWExJcXcxMlJNTVFxR3YvSkRRQWlVNzBGYWJtc1hjZm03ZTFkajZhcTA5?=
 =?utf-8?B?eTc5VXZWQ0pmYjJEeTZoa2c3REgyZ1NWZTh2UW5vZFBFTUVXR0tmWWJ6d0NP?=
 =?utf-8?B?TklvN2w2eXpFc1BQeGMyT2VpU2NGQ0V5MlNYTGR2OWpyU2E2UW9hVnVudUgw?=
 =?utf-8?B?TnZSS3pKVzdWanNWSm14T2hmM0E1OFBHVTdyTU5ackFBWWdhcG1QeVpiemY4?=
 =?utf-8?B?Zy9xeUxNQUlwa1dta3pSSDhWOFNWL25RelZTQWNpRVFuVzdTb2JUMnd2L1V6?=
 =?utf-8?B?OERSK3RLUFlwWnBxRkVGQWxBYnRoN1NVb3FJTndmK1ZOZ1NidXBwaktXYWdU?=
 =?utf-8?B?Zi9HTkdJRHJScHA2NGJUbzNmU0tBaWdwU0pjRW9EUWtSUk1ZWHN6Z2lNS0Jy?=
 =?utf-8?B?TnpGNVdacGVzQzhxVWIwaUVTYXYxTG9KdVRUSlY4SzNVbmZuQ0xISFkyY0pV?=
 =?utf-8?B?SVh6WUVkZ3RVSGdaSzI5SHczWWlXejdEeGU5TjZpOUdualJDQXVXNWJaYy8z?=
 =?utf-8?B?aER0RWphZ3c1clY5ek0xeC9Kam42alpsT3hHakZIM0NOUlhaWUsxby9jWEU0?=
 =?utf-8?B?UUFJTGZ3ZGp6N09RdURLWE84TFJaUi9hK0I1UCsxRHYvSXJMN2hTd2dnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UndDMW5vMWlEc2thOFJQS1ljYVR0SklQZk9ZN1VLZ1plQmZKSG1zeFZiOFE4?=
 =?utf-8?B?UElUdUhyd3hVbmJRZElKOHE0cTRPZjNYeGZMdFZOUEk2aENOMVdXQTk4NFpD?=
 =?utf-8?B?MzRqeURmd0oxZEYrbGE3OUVvZlJNV0tpRC9YSEdIckEyM0I3V0ZVZ0NGaHJx?=
 =?utf-8?B?MVNFQS8vNW5zM0lCTDQ2R25HSTdlRWF1bTk5SEtOYkJoMDZxTmxaWllQRk1T?=
 =?utf-8?B?QTAzaGNqc2V3RUdzY2JZODdUaVk2b1JReGpPMnBLTUdTcGpYVmV6NGlaUndw?=
 =?utf-8?B?dHBHRVhicUdLU0dEV3JXUGk5a1h3OTRjbkQzd3krd004YklhUW1EczY2Unh6?=
 =?utf-8?B?Q25lWG84eHh4bVRMYVQxZkZFNGg4K0xkRWhwb3BQODJxZllGMGtTeUQ4L0Y5?=
 =?utf-8?B?VXhGa0xVSnMwcyttTGVmd1R2R3p3UHJKamlvdStSc3Z6cjVyNmF6ZkxiYzhX?=
 =?utf-8?B?Q2xzQzhIZEhKMnA1M0l5Z1NaMTN6eUJUQ0tOSmZ5c1cyUy9GY0pEUUY1Q01N?=
 =?utf-8?B?N25YaENHelA1UWVWQkdoRGwyc25PRkVmSHhMaHB6V1I3RGJpclFyTUhwa0pn?=
 =?utf-8?B?dWpaVUFKS3BrVWFrZUEveWg1WjlYOERidXdvSTlScjU0R1FVZFhsWk1zL3Mv?=
 =?utf-8?B?anIxeXVtU0hGbXpyekc1bW1RMWpNdjU0VDArYnlSMUtEZEw2Z3JKUzE2NnZX?=
 =?utf-8?B?b0gvbU1wcXdSNTZBa1BOWFBxRnhHanFHb1JXWnNaY2VKVXROYmFNNVk2eDV5?=
 =?utf-8?B?RVc5WGpYcTBqQ00zSENoQTYyM05Cb3F1dHRmRmg2UDN0UDFCQlZkQk9KYTM1?=
 =?utf-8?B?VjFaeEhtWHNJUnB2YTg2dHdaSk5uUEVLMHdxbThjTkxPUGZyaXNKV0RHVENR?=
 =?utf-8?B?amlETU5QWVZTZ0FVQXZYRzJYc2tpaGUyOFRJbWZmU3R2d2wzcWZvM0hqWE9w?=
 =?utf-8?B?eUN6UnpncFZwU1d3cExVamlHOEtBZUhicW1aSkRWWHRvNmJpTkl0K29oOFhw?=
 =?utf-8?B?eGNBeXBtK0lSUUs4VExYNWdKd3BnSitzZEoxdFNrV1BITG4ybVNMVkVRVENT?=
 =?utf-8?B?S2xzRFBjdmRDc1ZwSFhpYjl5UDF3aVFIZ2svVElxUHdjd05sSHV6bHZBem5W?=
 =?utf-8?B?b2JSUHROZjlhK2lBQ2ExT2FPdmcycVNwWVpITWdUdWJyWGVKZUN0MjBDUHh5?=
 =?utf-8?B?K2dsYnpLU1hoVjdvZW94ZkhUbXNHN28rc2lUZ2ZDcXV5Wkt6eWdNRGgxTDBG?=
 =?utf-8?B?RDJyMGxGN1c2MWhDcDJDWnVGV2tvYS9FUWlidzZTWHJFNXpjQTlaWDBadTI0?=
 =?utf-8?B?TWl3U1FXWDY3V1BaZ0dSUGV0SjhoeXRIeTBEZ0o5Slp3RnZNWk9iUEFEMytE?=
 =?utf-8?B?RHZTRnVrVEFpQmNyUVN5QU9TUkhPenVHMjRBNWlUYlRqWEZnTDRpK2JZMVFM?=
 =?utf-8?B?cGw4ckorcGhqNHJySkZDQmdPM2s0eUhKdVQzR1QrVHErMVZaRVl4T1NQd3VU?=
 =?utf-8?B?dS8wUGhPTjhjeWpSdXljWVZ6aDZWQ2ZkV092SnkwZFRIdEtKdTdaRzhNU214?=
 =?utf-8?B?bWE4TmQyb0Jmeml0U0lXbmp2cWYvbFIvb29GZzNEZ3ZhV3F2cTZ3YWMwSnVH?=
 =?utf-8?B?eWRIZjJ0VWkrTWo4OWtEZ01tV1RYZUdvREVzdzJwSkx0S3IrSnZPaTV3RnJC?=
 =?utf-8?B?WUZjc21scGJ0SVRJSmJyN0hmQmdPblRNYk5lekhCQmFDK3VOMEFqMTR6U1dO?=
 =?utf-8?B?eVk5RG5KV2dTSC9yQ1BqYkFEN0owaURDR0NKeGZ6bFdsK2UzY3UxZTVDbkRo?=
 =?utf-8?B?TWE1VkRYNWZTa05Ja3VzZEE5U3hSNll1TXExRWZmZXVSbGJ4dlFEN0dDdmNT?=
 =?utf-8?B?U3RkUFFma2dTOWlTUUE4STUyMFhHRnNqRlJtMG0zSkQvajk2anVNOFYzUUl2?=
 =?utf-8?B?VFIyS1BjV0dsL0Z4MjZWSW9wU1ZMSG9rR1NQVHQ4NHlCUUY0L3pvWGNWNXZY?=
 =?utf-8?B?WW1scldLTWh3TnA2L1RxUXVuY2RlbzBWYWMvbW1ZVWtYVzJWbkxndytWclha?=
 =?utf-8?B?TGZyOGVSb1JoR1F0SVVubEFEU05QTXlwTXNZQVQ1UUY5ZkdRakYzU3VsbE0v?=
 =?utf-8?B?T0JrUjVxT0RLSEdkYlRjSERkMEhNMXEvUGQ2RlVHSXpZdlJjclM4UHhFTGd6?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9116281e-94f2-4dbf-578f-08dc68105b67
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 05:51:04.5123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bh1LD02ZW32l3s5W5nzgcE0zUVwZg4PFRX1UMbF3K5xmXASUrDjHWLig3SAV8fHFt1mFMvQt5cohYKPb1Yfz236ym2a7V23TCqY1ilKdUog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7714
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


On 29-04-2024 11:14, Tejas Upadhyay wrote:
> wa_14021821874 applies to xe2_hpg
>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>   drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
>   2 files changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 83847f2da72a..7c9d4e55a9cf 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -386,6 +386,7 @@
>   
>   #define TDL_TSL_CHICKEN				XE_REG_MCR(0xe4c4, XE_REG_OPTION_MASKED)
>   #define   SLM_WMTP_RESTORE			REG_BIT(11)
> +#define   STK_ID_RESTRICT			REG_BIT(12)

define Bit in descending order


>   
>   #define ROW_CHICKEN				XE_REG_MCR(0xe4f0, XE_REG_OPTION_MASKED)
>   #define   UGM_BACKUP_MODE			REG_BIT(13)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 9d9b7fa7a8f0..f030dbb1b89e 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -538,6 +538,10 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>   		       FUNC(xe_rtp_match_first_render_or_compute)),
>   	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, WR_REQ_CHAINING_DIS))
>   	},
> +	{ XE_RTP_NAME("14021821874"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, STK_ID_RESTRICT))
> +	},
>   
>   	/* Xe2_HPM */
>   
