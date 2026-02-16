Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536FBE81A31
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 15:02:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2BC10E13F;
	Mon, 16 Feb 2026 15:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MxzLAn3P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B721B10E13F
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 15:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771254149; x=1802790149;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=c9Lx1WqAGod9JEoRoYovmdLSnLEutBkTRf/E5m7C23c=;
 b=MxzLAn3PHbwFGzUwMgGjNLNQ3AEhm0aXroCBC1f+If+coqPMyOpoui12
 mmU378zldfksvmTwww1F3wRFcQeqv3zs9WuBmGWPFWuHzmV7lPdICLg5J
 izw6RaeNnqaqtI7wMwPHOABsa0crajhgdyYQ3hqx4AAJokeB7iGzqhvbn
 c4tP6lXkzBGB2AP4+sT+lhcsGi9AW5aw8IKOA0s7F7kFE/PpRp9IMBDjA
 hNk5dauqQeEfPx9BbxIjZrNNh6Qi8Db5U1Gnudf1pwz7Eu5mrDWGkHphy
 OySK/UMrsa2L5c+IUb0efTdkbxNUhZq8O9A0vfNOVnfS0AQIqD5JucwDK Q==;
X-CSE-ConnectionGUID: u2MszZgsSN+ipiZI3te1Kg==
X-CSE-MsgGUID: K/FaIOzzTXWZdsIhpTdgKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72378278"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="72378278"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 07:02:29 -0800
X-CSE-ConnectionGUID: 89dPV6TtSKyfd8L5SaWs7A==
X-CSE-MsgGUID: dGHemh0cTfmZWOuFVsQDww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="213636875"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 07:02:28 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 07:02:28 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 16 Feb 2026 07:02:28 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.47)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 07:02:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FoiX6JTONyPp7kMfvuwQ62Wta05wDIi5boG7DU9SpNIWYr+VXp3YSV6IzmCGN+AuBTxbBZ8ltzOOmLvT9zR30qXRXlrXU9Wbac92XVWoJgZ7+ipEzeVaCnWaQGnOSHlw92UMCm9NtUrFojoqhtcigPrA+WcnaYdElb5ejp6VuSbW+UMsr0aVOo6y7nYL8qNTzdxAZK1/IDZ8jINMXkrqhbguX4rHnN/zTd5cBVdd9WoYoaAQLwAyBVI901+rxvLyTAXiKeFOSjo09VIWM0SCSu1mKawLf78KMOuYBoY/AbGM9+CSHWx8AmR7pdaaqfPuwemTaX5VsJf1LjdR4EmBpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5lkIYn98uJAzaXuFLLOtdEYdEUZjqF68uTd+1wZ8u8=;
 b=euaqIY12MpUszs7tN40lk8U2r9KZ7gnTTAA6k3o4teRfNPgXR852nrVZ1roF89/AKhmq1uiKRomjW/8oyPG+vurHeIKEVn4knHi+trFPkNqaEYqxTMKjOJeXsJyx9ohY6rSzMMKuwzPgJWOVbRftdpW9jPHOhyqpVqwd8KKgePVjz2BF9akrp8V17vzL/jWs5c3Z9eh9QkY9RmwVshQ8ia5h/JegMmus8rxBtmMb8j7TE+Y+WH+eaTDMSlfJmpNRRFfoQ3u9fVxav/uha0JqadE8XRBnJS9BVSQgFKisol1DJMmzgMWOM6NXZXKC5L39PRXRlPQwMtxytYu4eFeHzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM4PR11MB7303.namprd11.prod.outlook.com (2603:10b6:8:108::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 15:02:25 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0%5]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 15:02:24 +0000
Date: Mon, 16 Feb 2026 16:02:20 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/9] drm/xe/pf: Add functions for VRAM provisioning
Message-ID: <20260216150220.zhlria7kynqsjwlu@intel.com>
References: <20260215203323.595-1-michal.wajdeczko@intel.com>
 <20260215203323.595-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260215203323.595-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR02CA0059.eurprd02.prod.outlook.com
 (2603:10a6:802:14::30) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM4PR11MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ad48ef3-d8c7-4663-0244-08de6d6c647e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXFMc25kVk9KZmFYK0RIOUg0MHhEbzdkK2tvSG9WRTBnRnplUStyVWYxb1Rs?=
 =?utf-8?B?cURnS243dUJhQ3pKZmR4a2Jubkc2dzZkOG5TRHJOL0hvTFVvWXh0b2dhd0Ju?=
 =?utf-8?B?a0xwNU5hYnVTekdVSVJaTk1XU1JVUlo3a2NWazMrMlhkQVpMUktYWDRXM3RH?=
 =?utf-8?B?ZjB3MklkNWNNQlJFWHBldTl0bnZtMWNVMmJSN29NUGNhZGJKQVIvRnp5b3h4?=
 =?utf-8?B?WE5GajIxZDk0M0VrWi85RU9WcXlzM1oyZFRIOWJGUTFNMzlSOG9tY2JuNHhm?=
 =?utf-8?B?UXh6ZEFHM0ZNVjNYdy9IRHk2NXYwaEhSOTJVbk1ycVl6VE9YdHRQVXVZYjAy?=
 =?utf-8?B?OXZubXhYa2pGWk1vRkM0b0dRdENMM0dadzM2alBtd3FTYjk3YllHOFEvU1FD?=
 =?utf-8?B?TWRzTkk0bG1FTXdYZmxQbm81YWoxNHpFS0dDVnpQM3F2ZkVUSjJGUTQ4RE8z?=
 =?utf-8?B?NDhRcTJXMXVMUGJtY1hrMEd4eGxwUW5MUmtyUHJyUDVXUzJUUGMzWHhKdCtS?=
 =?utf-8?B?dHNuWGJ3dHgyaEt5Z2llcDlRdTdkc0NUNXArTlo2cGRDRWozSUszbU84Lzcy?=
 =?utf-8?B?MGRuZWhHQ1hEVzE0dlN3SlVmZERJK1BZZkFFQ1VMajdrV09Ga3BUZlRRSkVN?=
 =?utf-8?B?L3o5R3JjeEtxNmMzcUx0MHBheFhXZXlnVGRPci9TYkpZMUdZUjdjcFFLSSt5?=
 =?utf-8?B?YWI1THFodnZuRVZBdUE5TDFzUWp1L2VTT1QyNXRYQWVkaXc5UHZkaU54QUc0?=
 =?utf-8?B?MUVpMWk3aS9KcWNxaXVKT2o0bDBZTTR4R1pza2xncSswT3FuZkxaTnJmL0p1?=
 =?utf-8?B?SHU0TElTQURSWXpuN0xMa2lrMVRDakV5aWZGN2dJdVp6UlduQXVUWFYzcysv?=
 =?utf-8?B?bzE2Q0dBZ2tFYVJjeFpUckVadS9vVDVSWWtnUzk2Y1pmcWdXTFdRdkJ6TVdG?=
 =?utf-8?B?cnY1K0ZqbStHZGMvdnlaZTVCQUdPb1JpcjZPZjNjWmRSdE0vZ3hxT29TbUFF?=
 =?utf-8?B?cnpFUFJSWjR5TWp1eDI4K0lRUWZTTFN3Z0pTZ1VteDdOS0NZL2M5c2draEly?=
 =?utf-8?B?WW11VXN0Qy91TlAwS1JzeWZjdHlJZkVYMnRkaFRuMHJ2VWlDWnh4K2JnZVVK?=
 =?utf-8?B?Q1FKRFFWWGsxUGpiK0UzazZVdkZCN3RmRUl2eXdTOTVWMldjY3d4elU5UG9s?=
 =?utf-8?B?RjI1bHFLQnBiQW80UWJxUkowTnd3V0pSWG51V0pReFVQbWF2K1gvUHpWOXFQ?=
 =?utf-8?B?REsvZWV2MTVUUzAySENpM09HT084dmpGSmhSMVJhZ0pMZUFjVWl3TERDbENi?=
 =?utf-8?B?Lyt3T0V2OXd1aFVUbmdSMVFNdjNUMmRLRk05dDd2Um9ZVGNIdjJBdjAxUUU3?=
 =?utf-8?B?WHpPZzFkTEZJeXpSbTdMM3dHa3hKZ3ZhQTZiM25Ka3VMYzBuYU1ETzVqd090?=
 =?utf-8?B?d3lQUnZIeThQUEM5bjBJV2VJbi9JK3JtNytBT25UajN5Zmk2UmxnL2YzbUJ6?=
 =?utf-8?B?amlyU3VtRksvZEJMRk04QXFoallGbWF3UzZqbUc1bXk3V0Q1cGJkbUZtNkhl?=
 =?utf-8?B?YlA0K1pQcmxJa09IQkxIb0JXc1gwNmM4MmhZcWRIeGxtVGpsQVJvS1FJdE9O?=
 =?utf-8?B?dUJJVVNESDlZMGpoT0ZMeUVScW1GOFlWMnpnZjNtWjNEamVWSDRDYnZ1NVFD?=
 =?utf-8?B?b3hmMGdwYVlEa01RQm5VUkVoVXhRRityYjNwR3BxUUFFTWw4Y2tralp0Q00r?=
 =?utf-8?B?L2pnL1lrWWt4czAvQ3g1NnhtMWRZdkJxTXdZUm9Kdm1PWE5tQ0hhTEc4T0da?=
 =?utf-8?B?N3k3b0dYZjZkRFBBUnNBVzhYcTYwYjlsNTdOdGxmS21wbmVjaGxhaS9sN3RW?=
 =?utf-8?B?WjZKVDBkb1ZVc2oraC9QY0R2QUxVR2poVk9KaUhSZklXdTZ5ZXhRTGZ2Z1Z0?=
 =?utf-8?B?WUl2blF6eDVDbmpQT21uL1p1OWdLMDMxdlhjQW5kWVBHbE9SdlBTd3JQalhM?=
 =?utf-8?B?c0ljdTB0VlZKVU5EbDNKVVpEbTV4ZDFVMi9mSG1vVUQ1TVgydU1Za0NUQlR2?=
 =?utf-8?B?YjlYei9VYmtBQVZTNkpla3pYS0xCTlJLS2RmTk5pR2MwK2JxWnBVRG0yczc2?=
 =?utf-8?Q?IJfM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnZDdWpla1Vib3EwRXU1TDB3WDZuTWhZUERuZHRVTFlXc3BROHRmSUgxZjVp?=
 =?utf-8?B?RGRHTXhoL3pmY0YrVkVPV2xlTS9WV1JPaCtKTGpITjlWZG1rR3lTYm1qRkxK?=
 =?utf-8?B?V0RXazQxa0k1M1NYNURLMkx5Ym85bE9MTUQ3OUpFRk1sUGQ1dmdLNW5YZ1BK?=
 =?utf-8?B?OE9SdUdpd1ZkNWdvU0o5RE5sdXdzalBMS0FDaDk5R1FxbkZESU14WVN1T3B3?=
 =?utf-8?B?YXZCazJGNnFzWGxsaTJIM01taHlsUWwwNVlyVk1UcVJiR3JCaG1ESVEwYXNn?=
 =?utf-8?B?b2VPZG4yVXMramRHTW5tRThPM0Q5Unc5NEFlSFJiK2RoQWxYVjdQblQ2N3U5?=
 =?utf-8?B?bURvRWswVTUwKy81WGpxUzJGam0vQ3F0OTJMTjlobnRiOUs5SWM5bWl5RW1y?=
 =?utf-8?B?dEN3ZVpCQlFHbnVTejJkY0EyN25pUEpQZDI0cGlNMkJncW1ubllWTEFTTXh0?=
 =?utf-8?B?anI3NlNZYmhId3pFSlpDNElSK1Q1ZTNsaGI5RUlySVhmV1RhdEQxRko2cU9j?=
 =?utf-8?B?bWFnQjloMjY4cDR4YTAyNFBMNjlVdUlkd2xkKzZYTmhzZ1ZsMlNyVzlRVmhl?=
 =?utf-8?B?emt2bUNGQ3UzSjM2UVZFOHc4RVV0cnpNamdFNHBrckxyL2xpQ3hOR2JPUDFa?=
 =?utf-8?B?Q01JOWV5azBmd1lna2JYZHNabnNXTXNjcGxFTEpxRmxVYzhuVmJoSnJoczdQ?=
 =?utf-8?B?NDQwbHNwc2QxZXM4OGJUZGdJYW9wTkxjYXBDczlOakh0WmJ4eCtyQlBURlMw?=
 =?utf-8?B?SC9jdTB1RzEzVnFMeWNFWSt1ekJveXVtbjdLY0xkOTQyMTJCWnFHQ2lQZW1m?=
 =?utf-8?B?eVk2di9PMWJDK245OTlOaGFoRmxINjZObGJRMGdNenFyVzZoSHBuczJ6RDBh?=
 =?utf-8?B?elUxVHhCQ1pZdnZNazlRMDR2TFVJOVV6Zko1K3l6M1ZnTkN0TktYU1U5aGhp?=
 =?utf-8?B?NDdGVm5mVDVOOHB1NWpFSkdNVXFQaVNhWVRBR3NvRUtjUmdRbzNISkptMXdt?=
 =?utf-8?B?a2ZGM2hzQ2ZzYjZKMndwWTIwZVhZRzRySVl5Wm56Q0pZNDhXOUFINWJBcVFU?=
 =?utf-8?B?N3EwUW5XVm91VHk2MXdQdzFleFlwTWRGdHlaVXFVd1hpOVRRMVZvT1RNbk1x?=
 =?utf-8?B?OVpsRXZ1Q2hrK09vUWhnL1BXOHE4Zys2WnVwaWhrdlA3SE5iNVVmd3lHVWhi?=
 =?utf-8?B?VUpNNGN0UURUL0F3aHE4VGI3azFPaWJZV1dwQ2hTZnk3MERSQ1ZONWwvYWtq?=
 =?utf-8?B?blYzMjROZW9xTTBFSGpDelNBRWVxWnRFOWVxY3JXMThCNEhjZEFqSXFSQWU4?=
 =?utf-8?B?ZTcrWWttRzB6d21kZ3d2L1Vvbmg4T09qNXJod2tMVCticU5maVAzR2srU01Y?=
 =?utf-8?B?bForSWpCekVXeC83cnpiTUlQclFUKzRNL0MwcktMWlBtdS96NkQ1YmZ2b0FY?=
 =?utf-8?B?L0ZmSmdKWEQ0eHFuUzRRT213SUducmpVd2U1bWpyMXVkT3VsQlFGeXB0UFVa?=
 =?utf-8?B?MUZCTXlJWFBvOFR3Y1Joczh6VzNCWnJ6cWNqNkZEUlJtUkdob3VMUzRhNWJq?=
 =?utf-8?B?RzIvK2lrbWJwVU52c2pLMmlKYmltSTRzazFlM24xTkZZRlE1MVBtOHEwcWdE?=
 =?utf-8?B?bVlCRWk3Y09MQWhZNEJyTzZTaDZYR1V4alZKbzN0YmN4RnZ6T2NodkVGTzFY?=
 =?utf-8?B?MmUzS3VBN09MZHVsTWhhdkxIS3RoODRsTkNpLytiSDVYZTZMeklmVDNGVkVH?=
 =?utf-8?B?RGFyNFhQQjJEZjcvaGxPU0tKSHVhYUs2WndHaW1uVnQydmNMQWlZckV4ajM2?=
 =?utf-8?B?OXd0elo4RWIwREI0WFhPbDNZMktRZzBZbmR6Q2FyU3Y0cS9Wczc3eEkrNnFB?=
 =?utf-8?B?YW1UUTJreHhFMFJsT0g1NThqb2FvQ0RVOEt0TTdYTll3R2FKOVFJbEFyVndT?=
 =?utf-8?B?UUtsR2l5eit3NWtPNU9rU0NpenVTdHZLaExSM25qT1BrTGxqYmF6emx1ZGdw?=
 =?utf-8?B?eDNnNTdrbGVOaVpuWXNHbmo1ajhFZFUvVTB5RXZhMHptNnRYOEplZTRLZkdD?=
 =?utf-8?B?NitwMFpkRlNjU1RmRE5xSEsvMUcwYTFTamdDV21iQlNENnM5Y3RFbTNMb2sx?=
 =?utf-8?B?aThORFpGQS92TmZEOVp3aVg5QmpqYWhyKzI5MXRneHhzL01jbnV3WXZnSzUz?=
 =?utf-8?B?QTcwWjlyRmZlU2RlTGg2VDhCSngwWU5qamhmNmVkSTg3MnJaRnZMbE12WTJa?=
 =?utf-8?B?WGdCMjdKNWVvUHpwbi8zK0x6VEFaVDNLTDZpUGc1SUZqb3VJTTJFL1pMN1Vo?=
 =?utf-8?B?SXZKWWozY2dJVmFCaUdaeGFIUWV2dnFyNVgwdW40aSswWWlBbnA3WFdvdzFy?=
 =?utf-8?Q?vwWKVr6lXMIm1/SE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad48ef3-d8c7-4663-0244-08de6d6c647e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 15:02:24.4807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t502hOoWlGSQkugFLy0+DnGs67amH6VuWbIziFy59P0m4ANZrmy4DKLw7G8GKAdmQysBkcDS8X4qHIq62MVvZcPAzm7xbgajpHNMD0fRCUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7303
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on nie [2026-lut-15 21:33:16 +0100]:
> We already have functions to configure VF LMEM (aka VRAM) on the
> tile/GT level, used by the auto-provisioning and debugfs, but we
> also need functions that will work on the device level that will
> configure VRAM on all tiles at once.
> 
> We will use these new functions in upcoming patch.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 108 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_provision.h |   4 +
>  2 files changed, 112 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> index 01470c42e8a7..e7187d03fe1b 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> @@ -436,3 +436,111 @@ int xe_sriov_pf_provision_query_vf_priority(struct xe_device *xe, unsigned int v
>  
>  	return !count ? -ENODATA : 0;
>  }
> +
> +static u64 vram_alignment(struct xe_device *xe)
> +{
> +	/* this might be platform dependent */
> +	return SZ_2M;
> +}
> +

In xe_gt_sriov_pf_config.c we already have an almost identical function:
static u64 pf_get_lmem_alignment(struct xe_gt *gt)
{
	/* this might be platform dependent */
	return SZ_2M;
}

In my opinion, it is not worth duplicating it, but rather creating one common function.


> +static u64 vram_per_tile(struct xe_tile *tile, u64 total)
> +{
> +	struct xe_device *xe = tile->xe;
> +	unsigned int tcount = xe->info.tile_count;
> +	u64 alignment = vram_alignment(xe);
> +
> +	total = round_up(total, tcount * alignment);
> +	return div_u64(total, tcount);
> +}
> +
> +/**
> + * xe_sriov_pf_provision_bulk_apply_vram() - Change VRAM provisioning for all VFs.
> + * @xe: the PF &xe_device
> + * @size: the VRAM size in [bytes] to set
> + *
> + * Change all VFs VRAM (LMEM) provisioning on all tiles.
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_provision_bulk_apply_vram(struct xe_device *xe, u64 size)
> +{
> +	unsigned int num_vfs = xe_sriov_pf_get_totalvfs(xe);
> +	struct xe_tile *tile;
> +	unsigned int id;
> +	int result = 0;
> +	int err;
> +
> +	guard(mutex)(xe_sriov_pf_master_mutex(xe));
> +
> +	for_each_tile(tile, xe, id) {
> +		err = xe_gt_sriov_pf_config_bulk_set_lmem_locked(tile->primary_gt,
> +								 VFID(1), num_vfs,
> +								 vram_per_tile(tile, size));
> +		result = result ?: err;
> +	}
> +
> +	return result;
> +}
> +
> +/**
> + * xe_sriov_pf_provision_apply_vf_vram() - Change single VF VRAM allocatio.
typo

> + * @xe: the PF &xe_device
> + * @vfid: the VF identifier (can't be 0 == PFID)
> + * @size: VRAM size to set
> + *
> + * Change VF's VRAM provisioning on all tiles/GTs.
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_provision_apply_vf_vram(struct xe_device *xe, unsigned int vfid, u64 size)
> +{
> +	struct xe_tile *tile;
> +	unsigned int id;
> +	int result = 0;
> +	int err;
> +
> +	xe_assert(xe, vfid);
> +
> +	guard(mutex)(xe_sriov_pf_master_mutex(xe));
> +
> +	for_each_tile(tile, xe, id) {
> +		err = xe_gt_sriov_pf_config_set_lmem_locked(tile->primary_gt, vfid,
> +							    vram_per_tile(tile, size));
> +		result = result ?: err;
> +	}
> +
> +	return result;
> +}
> +
> +/**
> + * xe_sriov_pf_provision_query_vf_vram() - Query VF's VRAM allocation.
> + * @xe: the PF &xe_device
> + * @vfid: the VF identifier (can't be 0 == PFID)
> + * @prio: placeholder for the returned VRAM size
> + *
> + * Query VF's VRAM provisioning from all tiles/GTs.
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_provision_query_vf_vram(struct xe_device *xe, unsigned int vfid, u64 *size)
> +{
> +	struct xe_tile *tile;
> +	unsigned int id;
> +	u64 total = 0;
NIT: The variable total is unnecessary

> +
> +	xe_assert(xe, vfid);
> +
> +	guard(mutex)(xe_sriov_pf_master_mutex(xe));
> +
> +	for_each_tile(tile, xe, id)
> +		total += xe_gt_sriov_pf_config_get_lmem_locked(tile->primary_gt, vfid);
> +
> +	*size = total;
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.h b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
> index bccf23d51396..f26f49539697 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
> @@ -24,6 +24,10 @@ int xe_sriov_pf_provision_bulk_apply_priority(struct xe_device *xe, u32 prio);
>  int xe_sriov_pf_provision_apply_vf_priority(struct xe_device *xe, unsigned int vfid, u32 prio);
>  int xe_sriov_pf_provision_query_vf_priority(struct xe_device *xe, unsigned int vfid, u32 *prio);
>  
> +int xe_sriov_pf_provision_bulk_apply_vram(struct xe_device *xe, u64 size);
> +int xe_sriov_pf_provision_apply_vf_vram(struct xe_device *xe, unsigned int vfid, u64 size);
> +int xe_sriov_pf_provision_query_vf_vram(struct xe_device *xe, unsigned int vfid, u64 *size);
> +
>  int xe_sriov_pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs);
>  int xe_sriov_pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs);
>  
Code is functionally OK
Minor comments, with clarification of vram_alignment:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> -- 
> 2.47.1
> 

-- 
