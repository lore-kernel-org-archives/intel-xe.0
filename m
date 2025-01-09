Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957E9E77197
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 08:33:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8BE10ED2A;
	Thu,  9 Jan 2025 08:33:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kAuZoLPA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA7F10ED2A
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jan 2025 08:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736411581; x=1767947581;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eyAuRAHoiPXSZ5b/nfZKCYP7YWI3Ix3v9wo6vVxP/c4=;
 b=kAuZoLPA/fIMWEqQhoszPpRpPNyPzcmKGAgg6GG3PKynHm9CKoi5R4rF
 vZk7C0D7RY1TVnEAKOT3BaSG7Xmt2RkrUVWtFXHfr6dEITV9EIDzR2eW8
 S7HP72r7cREOaqqwBE4Lu8NUPWZXMpjDu96FQrOncO4qBrjzwboefYJ9T
 wRjVCkHkTi33qZP7Ijg9WSKMhzsqnk7s/kFun/dP1w1iHsIWMersljQMr
 BWtwsZ/OzqGLpnah08kigb7rSBc9P0PVrXb5HsKIKKlmwgXbW4+IDPIuy
 M27hcXeabtOkgk8gW26n415i38Nqyy78+wXuOczl7Q8X6+nvAHWSwDdmo g==;
X-CSE-ConnectionGUID: Sr4EBG8qTQSZStZ2EdIU0g==
X-CSE-MsgGUID: 2yjFGUcMS3mSeJPqZjdOKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="48072025"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="48072025"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 00:33:01 -0800
X-CSE-ConnectionGUID: 0g1cjy5vSYeN7lkPxqbZUA==
X-CSE-MsgGUID: RNvKhetjQTKtM5PYuXBMcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126633396"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2025 00:33:00 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 00:32:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 00:32:59 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 00:32:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVTPYme7RnwHgMJK/6aoR+mLjzYxcRmADe/xoUXffogBlZblKff0nJW1AFmzt00a1u/xkGeURMK39GuLGn2eM1qoaO2ZCbsLv3RpyoMQIIrVfUhtgRZUJy/+deipDy9+twJni3bB3eB3AM485WlAgnKz3AFrEVDCF9r/ZG2OtZjDD6SQPYYspzBYugCKnsq3bYFvbBOnq46IKWk9o1FQTJfseAi6UscjtVA+pv2n4d3K8iaf1FnSrRzrHgCNmWaur+TM9AZIITS2qkxHJArIDk3uoJDoaKAXAQDlGCK33PAF+PoA8IAfiFpo3PtK4EFbkRxvoFfY7TeOKhxU2ZS52Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6mxFUhHEsZ/I/AMrahJEstjFMPPb4G2KzkzqZc9weM=;
 b=gqQ0sU4iv+DiadEEYmWry+U7rn8L2JZ0i8Yo4IBaXRZQbw/tBT1bztVJQXUC9nMFieTGmU6p2Z0YN5ViRZ8+E1gAyZdeAk+nbmeiDilg3OaBKqSIJEz3NdqCq/fEVbWDVv1hLl1fjGTl38vzAs689LdWc/KvzEk1RXjY/RdjUKaECeuyJcXC35vDUdIV5JeSmiOolHfO5JSOxwE2YEHm6YLAd3iQxevGn2xvpUXqjOJBdv4Rdvh0nX5sqYQN3bSDcBeyMoaWU58Ad0TYCNCpYZmDzFAiYv7shH01KWpyFwBhvQOAu8+iR6B+ZOpa4xNIb1mN3AYUz7MJp+xhj/+o5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6864.namprd11.prod.outlook.com (2603:10b6:303:21b::16)
 by SJ0PR11MB6791.namprd11.prod.outlook.com (2603:10b6:a03:484::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Thu, 9 Jan
 2025 08:32:56 +0000
Received: from MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6]) by MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6%4]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 08:32:56 +0000
Message-ID: <56a714bb-fe4e-44f4-a0b3-774fed63ecd9@intel.com>
Date: Thu, 9 Jan 2025 09:32:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Remove unused "mmio_ext" code
To: Lucas De Marchi <lucas.demarchi@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Koby Elbaz <kelbaz@habana.ai>
References: <20250106234312.2986065-2-matthew.d.roper@intel.com>
 <5tnfpuj3qv3vqy6ydpbqttz5rf4cfssldw7bgpmmgbduojdztp@lpacc4xzoemi>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <5tnfpuj3qv3vqy6ydpbqttz5rf4cfssldw7bgpmmgbduojdztp@lpacc4xzoemi>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0019.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::10) To MW4PR11MB6864.namprd11.prod.outlook.com
 (2603:10b6:303:21b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6864:EE_|SJ0PR11MB6791:EE_
X-MS-Office365-Filtering-Correlation-Id: 84078c07-4255-40d1-1408-08dd308837aa
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVVCTzRZN3poNzQ5RlJPczFUWXdqUlpDdi9uOFN0ditPQ3N0MEtFVFR5SkFh?=
 =?utf-8?B?eEgxK0c1dWllc2pQUkt0R1NsS09pdkhMS0JRVnV4TGd4ZGJhYXNFaVkxUTJN?=
 =?utf-8?B?VnNIUEJTbDNSdmdYekw3aXhMeXJCUGpyS2xhSGhLaElpRkdLdnhYc1kvbWh3?=
 =?utf-8?B?TWxjbVFFY3ZmR2NraTNpdGRTbG5VUUk4ZVZ1aG9vRk50eGEvamFmdE01Rkdx?=
 =?utf-8?B?Vk8yUzZaUGw3d1YwcGMwa3paQWZCYTVUNVhiWEd4eVBkeVhPeWJIbmZ0dGkz?=
 =?utf-8?B?MUREeG45MEt3djlhb214NkVJSDZYNXJPTVk2bjhvNDNSYlJaN3RqOHFjY0ln?=
 =?utf-8?B?enJseGdqdGNEU3JKbm1mOGM2NTJoVEtoMm02NlFDbzN5bUp5Y1p1NzN3T3R4?=
 =?utf-8?B?NnUxRXlSWk4vaWdxbndrQkoyL0E0a0YzZ2piZGdFU2ZyZ2xQemo4Z2lpZXVO?=
 =?utf-8?B?bWZkWWhjdlgxQU9NeENNdlV2VERvcDdrMUxXMDNLK09ReWZzQllrbDBJYmM0?=
 =?utf-8?B?cXhSRVZWblhzSDZPTjdlRTRLY0pJWmoyVGlidTAzZkMrQ25BTll3aEdJYlFt?=
 =?utf-8?B?MnB0WDVnTW9raWFNNXByWmFDbFFYaFF4czFPUFVCSFZUTFhpWnNmblJ4STdl?=
 =?utf-8?B?NmpKR29HTzBqcDZ1QXAwZHJCdTg4enE2M0dEZW1LWDE4bjVlZkhJcWZ5OTRU?=
 =?utf-8?B?M1BlZUJJL3pmdmtJbnFCQXVXU2kwTWd5N0tGUWxiMlNvc3pvUVdldGlJNHh2?=
 =?utf-8?B?YmdQRWtSMzdLZ29SUVhsWWkzR0xLbU9VaURNa3VVVlVZWDE0UmozQmpiV1li?=
 =?utf-8?B?WS9OWEIxSWZTRFc2cUlPQkI0NDdpb0Z4ZVNJemFaRC9DY0s1R1pXVlZ4U1Nn?=
 =?utf-8?B?VjQ0ZS8wYjRKOFZPQm5UbnBSdkF2ZFRvUmdMUXQvbm1qblliRW8vOWFaVjhB?=
 =?utf-8?B?NlhETjBkdUJpRkxZUHE5WXRuRFhsWXVLcVBaeVRjZlE4bGhIdk1mYTB3VG42?=
 =?utf-8?B?NGFkd3RHbDVJQUwxdDlXa1NrenQvdDV1dEVsQWJuQ1l3dEFHcE44RWZIWGds?=
 =?utf-8?B?T3JoMzJ1dmdST3Fqbnd3d1BMOHBxSGxaK0s0VjZiMWMrd1BNaG9oV1VpQVFB?=
 =?utf-8?B?ZDdoWTI1SnJtVnlvWEErREhTSjJMNzlJdlB1T0hXaUdUMmpUWlFLQ3gyUnR6?=
 =?utf-8?B?NCtMVzVSaGV6Z2hONjJoOWd3ci9Jc05qVUV5WXNLdW5iZmZXdEt2a1FBTGg4?=
 =?utf-8?B?MGtWS1FlWXhGSmZnczRIc1VVcFNBaFRuRyszbjAxMncxYkRUVkV2U3FUNExQ?=
 =?utf-8?B?cnhnVlF5M3RrRC9LMWQ3Si9samYvR2Q3aTBkeGpIUHhsSGYyNStjOHM1My9a?=
 =?utf-8?B?TmFzTHlYQkZ2QmkxdVp1ZXQrZzNSMVR2b1hHZ1JEa25MLzhuZUoyV0ZSdWpj?=
 =?utf-8?B?T2xidzNhcko4KzBrMWJLQmxyK2pXMDNEK3I1WDhiYTVUU2xFaFB1cjlOUndK?=
 =?utf-8?B?cUwzaEFjWnEvRVRrcWxXZkNBdUEyUXZzVVYzL2NBaXk1MlBGeFZweFgxdDJp?=
 =?utf-8?B?bkpJV2xqQnJQNVZIQnhFdmU5bFI1QmxiLzNubENGNXp2RWpQcGYwM1ZQZ2JL?=
 =?utf-8?B?bXcyVFF2VndQSSt3U000ZFJMbklXOVlxbkJKUHlBMDJlMTV0THkrcTc0UDUv?=
 =?utf-8?B?a3VFeDVLbktybkpzR3JyYmhpbHdQQnJqaVJXNVQyRnFmM0VwUmtPb1RpVkE0?=
 =?utf-8?B?c2YwWmY1Rng3WWVHNmJlUExGN2I1TUprTDRFN1Z3Z2lnazFzODJuOURiM3Zl?=
 =?utf-8?B?SkNrTUpPalk4UjUyeGhCZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2t6aFBSZS9jeWMvR0t4Zi9jMDExcndsdWhETWZ2UmVad3hrZTNjWWVWa3A2?=
 =?utf-8?B?K3g2OFhGT21CZkVmcERheFhxV25CL3NKbHJORjVuQmhyVlFMTkVFM1BsR3JV?=
 =?utf-8?B?Y1JzM0NNYm5CcWVCUUIyN0poVlQ3eFdXTUhGOVNaTHRzU3NDOThyTW82SThW?=
 =?utf-8?B?c3JjV2h3cDY3TlRFQ3V0NisyN3hJNXh4TE1xOUZ4cjNxaGphK2hDRnpqMy9K?=
 =?utf-8?B?REoxQ0RZTjZ6dmdsTjBtZDBqUk1seFNNaTZpVnoyLzhjc3NIblpwbHE3QW9H?=
 =?utf-8?B?VHpQTjhPTDFJcWM2NlJrUjBiZkxWbjNxTmtZc0MzODd5WjF4aWZoUG9rVmhp?=
 =?utf-8?B?V29tajdRamY4UUpRbkdZQllZWm92SFBKb2lyVG9RWUpEWWRHQWlMbFlVc3Mz?=
 =?utf-8?B?UWthaytlditjM29Uanc5NXphMUNRYU4zYXdYL1NUZFJkblF6UmNNYlZpWW5u?=
 =?utf-8?B?bEhjRzRmeTZGTkszWFZXSVRuQy9XOUp2YXkzZExocldOdjM4L2gwaDl4ek5Q?=
 =?utf-8?B?QitkWkh5bTFRbGlWUmY4VzJnczN3ZXJBNnI2VVJ1YTdnUG1KZDQxdEg5U0NW?=
 =?utf-8?B?REljRmt6ZWkrNmpkbjZSSjd2OFVKK1R6bDl2Nzh1c2o4Q1hpRk9hTnBRT2Rz?=
 =?utf-8?B?WmFTQlU1b3dUQXhnbERwLzNvNnJ4S092UXBJUDFYdm9wZXF3eHF1ano2UFE3?=
 =?utf-8?B?TDAycjJZM050SE5Bcis0eWUxVEQxMkpDUWwzanFrRDYxWlR4TWdHdWt6WFVD?=
 =?utf-8?B?bFB4bEZaSWVIbXFVRzlONFhrNCtyQXIwZ0R1ZW42bHdFZ2tqOHBuVTFTTE5I?=
 =?utf-8?B?eWhYNDVPejloREtUYzZjbFcvbnh4OHcvOFV5ZE9UWHJmdVEwYm1qdGQ5Y2F6?=
 =?utf-8?B?WlNvbEpFOVpIOGhtblJEdmEwMWR6ejZ2ZFdDRDJhckFubk5PSkU4Z1h1a2hx?=
 =?utf-8?B?Tnc0ZjI2eW16NEg2dGQwSVRxazd6Q3J6Q0ZGUVR5Y1phcUJiUjJQaWFLSCtF?=
 =?utf-8?B?eS81TmlTc0FOQm44dWJrbTRibjRXWnowdVlBSWg2bDBMYTF6WVRDSHZFZ1pI?=
 =?utf-8?B?RjB3UWtXNExHa2poUi9CRzVCZGlVOVBUNjhIWGpyNDN0RVpJWFU4YUFQS1Ey?=
 =?utf-8?B?QldieDFNK1NsVDkrUkttS2UvRE1WTHlJZWF4NTU5U2VxQ0NjdEpDR3NuWFV1?=
 =?utf-8?B?YWxDTktEWUdqQnFLZ0UxbHNUN3VqUXpNZm5ablVva2dqZFlXYVpKV1lVRTh5?=
 =?utf-8?B?TERoWTVUWTZzSnNJaU1pejB1MWdBa3dwbGR4M0NUWUw3bDJSc3VUQTNYSzZP?=
 =?utf-8?B?WTBYaCtDVkYxZzFOVVRMT29jTWg0L2NGVjV0OVFZOXhHbUJ5NDN6Qms0U3pY?=
 =?utf-8?B?bDZxbXI5NVZOZmpFMzhlZCs5NVJrYlNhTmd2aUEwdmd0d29YamdBYlhtVmNX?=
 =?utf-8?B?amRsUk4wMzNvTEFZZnV0MUFZcmg0TlFNNlRpdlJJMktrOTdzU0JyWjZ3Q09G?=
 =?utf-8?B?Z3huNmNIRnoyRlU2UWJ6ek5TaGN1UEo0UTNyMERoK3VOVmdRWFZtV2VxbmRz?=
 =?utf-8?B?YU9sdjJBcDllWUF6RkQwNlV6d2tzZXlpR3RWTjdzVWVZTTBvQTFXODZCWTd1?=
 =?utf-8?B?N2w1N01vSVZ4L3BoWHdZRWwwd0VKTWxuNTFBOTJMa0pCNWE5d205dUh3WDg2?=
 =?utf-8?B?UU15YjEzNDJ4QjVvUWUvZjdSRGhoZENycmZLWVRiSXZzVzVQd3hESng3U2xm?=
 =?utf-8?B?WU1KWWJsTURXUmdtS3JLcDFjSHUzeElucnVodk4xQ2NsQzQzbnNhcjNqYmpi?=
 =?utf-8?B?dk0raEN5ckZnckh4NGJKcUVjbThhRnFlakIyaVVwTU03NFRENW5DN0tnTFJY?=
 =?utf-8?B?UWt4dkJ2Q1hvaEZhWFpWdWpXV0c2TTQ5ODU4VUxEeU83VHdEMFhnUmpwMWta?=
 =?utf-8?B?SXBwcFp3QnFqUTEvRnV2V21qMHAwa0hkSXViVUQvNjRDaFlPVEZwdUZINmpo?=
 =?utf-8?B?S0tGWVBjTkJWR2ViTVViRUZVRzFycXEvbkh6S0RsMmkwT0JnbEYxaHk0UlY3?=
 =?utf-8?B?OStacWUyTXcySHl6dWJjcjE5VURkQ21WWVRkeGRQTkdWdjU4dEtYamRSRERr?=
 =?utf-8?B?MXlWWHpQSkxtWkUzZU9oU1ZSTFFMb0FBcGs2V3hvL1p3UjV1dFZnRXBVbHhh?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84078c07-4255-40d1-1408-08dd308837aa
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 08:32:56.6410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMz/vTS14e2KtEI0xx5mRRrmVZHFKN3rjMTGl/znsFb/1QyXJJTmRkv2aW5PqAYvDNQEpvLNOxkaUhIxZJnHxC+npvsHWmB4X2m4P9TIKMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6791
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

On 8.01.2025 04:39, Lucas De Marchi wrote:

> On Mon, Jan 06, 2025 at 03:43:13PM -0800, Matt Roper wrote:
>> The "mmio_ext" and 'REG_EXT" code is currently unused on any existing
>> platform.  Going forward, this also isn't the design we want to use for
>> any future platforms/features either, so we should just go ahead and
>> remove the dead code to avoid confusion.
>>
>> mmio_ext was originally added in an attempt to hack around the early
>> (mis)design of the Xe driver, which used xe_gt as the target for all
>> register MMIO access, even those completely unrelated to the GT subunit
>> of the hardware.  With the introduction of commit 34953ee349dd ("drm/xe:
>> Create dedicated xe_mmio structure") and its follow-up patches, that
>> misdesign has been corrected and access to register MMIO regions
>> specific to hardware units is now done through xe_mmio structures which
>> encapsulate an iomap, region size, and some other metadata.
>>
>> Although all of the registers used by the driver today happen to fall
>> within one specific PCI BAR region, and thus re-use a single device-wide
>> iomap, there's no requirement that this stay true for future platforms
>> or features.  I.e., if a future platform adds a new 'foo' hardware unit
>> that exists at a different area in the BAR, or even in a completely
>> different BAR, then that would be handled by doing a separate iomap of
>> that unit's register region and wrapping it in its own 'struct xe_mmio
>> foo_regs' structure.  The pointer to the new 'foo_regs' could be placed
>> within the xe_device, xe_tile, xe_gt, etc., according to where the new
>> hardware unit falls within the current hardware hierarchy.
>>
>> This effectively reverts the following commits, although parts of these
>> commits had already vanished or changed with the earlier xe_mmio
>> refactor work:
>>
>> - commit 399a13323f0d ("drm/xe: add 28-bit address support in struct
>>   xe_reg")
>> - commit fdef72e02e20 ("drm/xe: add a flag to bypass multi-tile config
>>   from MTCFG reg")
>> - commit 866b2b176434 ("drm/xe: add MMIO extension support flags")
>> - commit ef29b390c734 ("drm/xe: map MMIO BAR according to the num of
>>   tiles in device desc")
>> - commit a4e2f3a299ea ("drm/xe: refactor xe_mmio_probe_tiles to support
>>   MMIO extension")
>>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Koby Elbaz <kelbaz@habana.ai>
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>, but let's wait
> a day or 2 to give a chance for others to take another look.
>
> Koby, can you ack this?
>
> thanks
> Lucas De Marchi


Also looked from EU Debugger perspective 
(https://patchwork.freedesktop.org/series/142295/).

Just wanted to double check we don't rely on mmio_ext there. We don't. Good.

Acked-by: Maciej Patelczyk <maciej.patelczyk@intel.com>


Regards,

Maciej

