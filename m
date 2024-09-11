Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3ABEE57CF
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 20:57:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6844D10E0CF;
	Wed, 11 Sep 2024 20:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bmiGb5eu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F01E10E0CF
 for <Intel-Xe@lists.freedesktop.org>; Wed, 11 Sep 2024 20:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726088241; x=1757624241;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=blK6ek22EEnyO9MgrSJh9gX6o2XfEf+EORFrrj97R5k=;
 b=bmiGb5euHn3g73LeKwJ523jeRkMh9llByHYn7gy4s//rmBzfCki7FO+e
 DQ3pZXE2cxbpESSMKRn1X3bJ2qPRo6SE+c0B0P61v5c86tTAbwZKSa8uW
 wHRn7+dvRhqKmPTh8YzT1bOXBj00W1lDF/erx1tXYm1zZU+twmACPm3CM
 nNSwBVQL6cXGra94iweOZD6T7icUA8yXbfWlQEW5sFNIFWDUZk3q5JfSh
 C/A0n+FYIZFw++cxG5czNCZ/VrutNEfPWwxFjyx2wGt1GYDD2VUt3SEdv
 Bh5Z3ithwJNI3zIR0C2pNBift+bgW71M1NAyZnkwtN+FInpjnXtr+QpYL Q==;
X-CSE-ConnectionGUID: UHTYQrj1Sv6DjluPjuk/QQ==
X-CSE-MsgGUID: Hd/xI/GmTZWJYVTOtsJJ4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="36266606"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="36266606"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 13:57:20 -0700
X-CSE-ConnectionGUID: 3ECR9dBBRayy1f0UQqQE7g==
X-CSE-MsgGUID: R3SHRr0LThCb9tZNfb4xog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="98190962"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 13:57:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 13:57:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 13:57:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 13:57:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJtVdXJztDkSeDtPo9PAGDXdbXwk1ngrsviuRB3bWTb7D/pareD/fYmdsFXKgrRzBSy/agAcKlqLAyGXUof8daAkBAQRT4mmIOxQKYP6h0LkTf7RNHVMJxwlAW82UbEz3e0sI7btGhmX+6UCbpBm6nkQu7cPyLu20TFTYfEeR2HDKv9JNsph5BZbqF2uDqJR5o1JiqoRt6CAPbEtHCuU8LTkK2hMmSSDgxcYxA1Uj94Q5sbh4aHj3AHrkFVaHnRqET4yv8csJhJ29Vq3FoD6dPwYPQFrMINyNj3aObnYR8PlruJpalJ/RBFQwdg/Oepx1azfLkWrfaZqAJd5od64Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGC0WetVmzQxr0P/xrb8jX4HoyVB2XSo95T8C9iYy1U=;
 b=X+s+mt+rkTfc037mvt1JPLWK2AGxexbcx6hk2yliHIvdcEV+HOvwzwUggmNzRqwnGekJXMMt9uv6eKNyJUQHL7fj6S0+p+vZk2nBVy0sdZk4Dw+uRVSaULHYqETqX8saZnoNsyyWUGRJ+qt5Tt5KCDOn/Woazqgt3aleu8j2Z6bx3ZxwbnThDU/C1fvgQ8qFQ+oOCSGgRsBtxw1s0iUN2QWE9xGydHMHA4+zK3lxiuJ86fYyBQzZPXe4+z+sWuKamoEgFB2l46N3MJxF8+nH+MT1YOBmay0TZkQqk1Yfh6/FF4xHMStDdI6T7o/TKC96JoJOR+CMk9D16E02wdJCNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by SA1PR11MB5898.namprd11.prod.outlook.com (2603:10b6:806:229::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 20:57:17 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%3]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 20:57:17 +0000
Message-ID: <9d6f5839-4d18-459d-9852-013619cf7083@intel.com>
Date: Wed, 11 Sep 2024 13:57:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/10] drm/xe/guc: Dead CT helper
To: John Harrison <john.c.harrison@intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
 <20240905205106.1063091-8-John.C.Harrison@Intel.com>
 <45901fbc-56bf-4f9e-8044-eb83e24f02f4@intel.com>
 <b56b7826-55e7-4459-a5e5-8472975cbb3e@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <b56b7826-55e7-4459-a5e5-8472975cbb3e@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW3PR06CA0019.namprd06.prod.outlook.com
 (2603:10b6:303:2a::24) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|SA1PR11MB5898:EE_
X-MS-Office365-Filtering-Correlation-Id: 9370509b-5a1f-4b2b-d5a0-08dcd2a451fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTdxcGsxZUd0eU5lUmxmQ1VwV2FZM2t5aVVrMDhuK0FkSmZaYnM5YnBJck91?=
 =?utf-8?B?d1JraTl4aXpPVU1kem5IUGR5dUxYeHN5MWRnMnBUQ0xjeGM5aUszcTdvcTNq?=
 =?utf-8?B?TXlhWEw1VCs0Nk1vQk9LQ3JqRm5sbTV4akczTVUrczFNamJOUVJBWG5KUWE2?=
 =?utf-8?B?c2QvVFJZU2o2dlJWbERkdU1wMnN2K2c2Ly9uK1V6M3pBTzhHcmZpb1lPWWRB?=
 =?utf-8?B?alc4cTJHNHljYmYzbDdSUGJaNXZQa3FMdkQ5Yy90UXA3M3lkUVZBd2pFUzAw?=
 =?utf-8?B?NG1ma3JSQlFQcUtKNGhSTWVuK3d6aUhaYjdrSTBMU3UxRXpmQXoyRFQzT1Ev?=
 =?utf-8?B?Qy82NkhsZ0dxSjB5alZZWWsvMkR1YTcwUkNsNi9GTWhsVXdzZXN6cnc3Wjdl?=
 =?utf-8?B?RkhpRXF1aEhGcVA2VHZoendpZnY4V2FnTVZDQWhkLzZJQzczSW5LYi9GSlJW?=
 =?utf-8?B?ZlBFU1pIczZIL0Mvc2tGWG1ZcTlsUGxDd2JROVNQS0h4R21ZSjJ4SXhLdGNR?=
 =?utf-8?B?NmtHc2FDc3pBUUJ2V1FpUWJrRXVPdWpsOHRkUkRhYlRhWUY0dnROYVRsVnNp?=
 =?utf-8?B?aGl3WitqOGhyNHcrQ2xFd3NLUXQwelBNcHJtaFJwL1FZM1pEczcvRnI1dVlG?=
 =?utf-8?B?VldqZ3U0Q3RVcjFaUnVERW42citPYUtTYjJYY3U0QkJVZ2wyekJYdGI2R1hF?=
 =?utf-8?B?YUxvVUU5QnhhNlU4dy9JMzRCYzYwbGFRYUJHZ3pvS29tNFNTNUN5WklQZFl5?=
 =?utf-8?B?QXZwUmttQ0VHMjBIU1ViVTY3c0FYOGR4L1dRNTh2SjkyTktuT1U1Ri8rNlBV?=
 =?utf-8?B?dVRlMEdwUGJpMzBPRVI3amJnWG5ialgrTkQ0ZWI3Q0FleXNLMWgxcUVvb3Rx?=
 =?utf-8?B?R0YvdWprUHJMTnRCc1E0eEVST0pHWXp0Nnd4TGd6MG1ubjVYdXBiSnBzeW1S?=
 =?utf-8?B?VFFnZ3dEb1JDeThRZDI0K1FPeFNMTnl0Y2YxUTVjazZtSWhUUTA5dmRIZXZW?=
 =?utf-8?B?ckwyN1llMUtad3RibWFmb0RCUmdleERyL3Z4VG5IOWFndGZpdVNKbWVmY05y?=
 =?utf-8?B?SU41RUs2Q25EVEZMYUZYRVd4WEtIeEhoUjhvYkF3WEs4eU4zSDlNQjZrbFZJ?=
 =?utf-8?B?UVJyRCtJMEg4M1JqWmlqZjg0NG1MaTBYMzRaN0l0a2FINEd5U0xvWmFGbklX?=
 =?utf-8?B?bis1ZXpHZHRRSlBtWTBWaGJIbXZmcUxMV2ZER0RrZEhmWHA2TGFDeThQY1Fq?=
 =?utf-8?B?R0xiVU1ZWXlMOXhmNndYeHhRVXEwdTcwZTBFRTNvdC84Sy8vcm03RHVqUkdv?=
 =?utf-8?B?YTZsUVBDOUNwV2pvY2ptaHZaK0NFR1Zjem0vMVZBaE9WNUY0Z2FESVZOeXdB?=
 =?utf-8?B?ajR3WlYvK001NHJNUnFxOE12aGVZOXRTWGNqaXo5SVVLaFRxUTk2T2JmWEJj?=
 =?utf-8?B?Wmw5bHIyZmI4QXNFUHh6dkZ6V3BROWxqQlZpRnBMbGlMQjFRanUrTW5mWXph?=
 =?utf-8?B?QkpkWUc1T1MyeG1TRXNxWUhpN055WEo5c3dmeXprS3pUcVo1ZUhHWEVHLzZq?=
 =?utf-8?B?a2dsUW5BaUlqTEkzOWRjUmZ1UGJzbmxLZUdkZVl0dVY5Y0hZcEs1dTNnK1la?=
 =?utf-8?B?eVpiQWk3U0xzdVk0a3o0Vjg5T04yZldFTUFJUnI1aDJZVlBmMkRxRnBoTjhN?=
 =?utf-8?B?K0grK3FMUm85aEVoWUdsTHNDQi90NTkyQmZ3TnJOOWtSTW9VL1ZrcG14SDdm?=
 =?utf-8?B?QnRmOXNKb25McmNyZS9PbDlBekxwL1JodXNEaWdSVjVrTXhhM0tVRUp0aTh5?=
 =?utf-8?B?NTNXdkViS3ZONkpUUnowUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHRZVzZSM2wwMGsyVkNRNVhmS3doMnpPYVBMZTJMeEhjeFpCY3hCWE15WUdo?=
 =?utf-8?B?VVMreklsOWZHeThlVjV5aUYzNXFhd1l5TVFJVWxEN3h4RzR5bW4wTjlFdExQ?=
 =?utf-8?B?Z3BEUmtLQ2tvdDg2K1RwbmgzWElJMXllWndMQVkweC8vc3paQ2VZeWxwdHF1?=
 =?utf-8?B?d2liWCs0cmU2a281eUVBSUk0c2VVbEJKMklVajlwQ2p3RStsTHJaODh0OFdi?=
 =?utf-8?B?WWZZVVBUK0tPeHJlMmlyVlJDRUN2M0xCNEcrWmhXRGV2TE9yZGNFVzBKOUpM?=
 =?utf-8?B?Nm5PSjdSOVArdFdkVDZrOVNRUWI1RU9CWUViTXBPTDJKNzBWSlB5aFo1MXNY?=
 =?utf-8?B?azI1cndHYTBCTy9kNnBsNVFRRDArZWV4dUJKRVNjMHBNMnFUS204WmVHL3ZZ?=
 =?utf-8?B?cmFSVDIvOEJJRTAranlldk9vbHE2UjlqUm5DOGplaEtDaGYxRGZJa2VqM3Bj?=
 =?utf-8?B?cGtEMUd3SVZWaENZVW9jM2FuWms1U2s4bmJRV1JWblZSN3prTzg0UjJMVThm?=
 =?utf-8?B?eUJzdExzUHpmZzBlNUtIWXhZTnJ2eFNwbDcvN0Vzb0lKSGJaWThlRFF6VDFk?=
 =?utf-8?B?andIRm05ZjEzVURydTF4NVd4OThWUEx5eStXSVZ5a1JFOElsbXFyeDd4dWw2?=
 =?utf-8?B?cEVRbGdpVGFRNk4zb2o2MzVUYzZUNTU3WFM0T20yRWxLSVlsWUdWR2pOdjZr?=
 =?utf-8?B?TitsTkxvcG93ZW1INkY4TVNuVTY3VGhMWkpQdFdMcmhIS0NDVU9XaWN0VjlW?=
 =?utf-8?B?Z081aUJvOUxxM0JUaWk0MkJCd1l6VkxzSGFKTDVaQitjdUh6UVdGMFhReGJx?=
 =?utf-8?B?Y2txeHdlTzh0amd2a3phK3VjZXVoWXFNdTV6dVh4eXdjVFlIdG1QN1JSMzdQ?=
 =?utf-8?B?aTFVR1I0QXlDY3hSZ21hSzgrcXNCMUpDM3F1Q1NkdXF2b2U2TXRGNklESEFs?=
 =?utf-8?B?cDE2NmJuZnFISittQjl4ZCtLeEgyYW1ISk00MnVic1R3enVEV1h0eHk5MG13?=
 =?utf-8?B?L2Vhb3hqMGNMekNHZGV6bDJsQ3lJamNtV1NnRWJkbmlrYW80NUtjOHlSbmR1?=
 =?utf-8?B?aVhEdndGaFl6S2dxRFJuS3UranJqUVZUNjRocmtScFRPR01jQUdoV0k5SU5I?=
 =?utf-8?B?M0k2T2NIOVBaa1lOQTVJcVVRK3ppMXRYYXFEREtXcmtzN0YzSjJ6dWhXREFk?=
 =?utf-8?B?cWRnVEQxU2xxejQxU3Q3cFltbENIekdsNVFmTldYUGJXVUY3YzJQMUU5R3BK?=
 =?utf-8?B?NWllanNHNzhhYlI0WW82WmdDUGxwUmRTcnYrYnJYOGdlWG5oMDF0S1RCOXpE?=
 =?utf-8?B?UW5xZmRPVERmUWErSlE2MFc4QjNxMkswZXgrcnljRHZxWlZmSDJOVFk3YnpD?=
 =?utf-8?B?UDNKeS9ZVE8xekQ5YlVXNGNualJmdzlwaU5OdFNzTHdCYXhqK3crY3h6a0RT?=
 =?utf-8?B?dDJvRmpCbUdZeGZBVlRic1ZLU0NOZ1pTelZZOFYzdm1uUkVlb1pWNitSUkti?=
 =?utf-8?B?eDYrTDJ4M2x3SmFnU210RWtCRGIzNUpaUC8vRVlNQWg5NjVsdDhiTm45bGVv?=
 =?utf-8?B?bWcwUTh3V2g0RFlwYi9UaTc4b0gyUmlXQi9wcDNsRlAyOWFYUTM0Vnp1T20z?=
 =?utf-8?B?UWFJcmVycWpUZDZVMVljOVF0ekxqd1FDdXhXbFdnK1FWVFdFYjc2aXJMb2Rz?=
 =?utf-8?B?QXV0a0pHQ0xtVXB4N0ZlT2pGeVNXT1pUQ29UVWxIZUZGNVhFd1FDRFV2ak9Q?=
 =?utf-8?B?bVQxWkFOV1ZrSmxRS2s0SjhMSkljWVUwc3BvaHpyQUYyZUVJVW9DanlyVmtp?=
 =?utf-8?B?UnlYWG9hWjRhWEJJRVg4dDlUOXJzM1F2ei9CMzQ3M2N0QWdqaVM0WjR0MDhk?=
 =?utf-8?B?TXVJOWprdTVBQkhuanFuUCt5WlFoY2FxZzdVSVp1ZnJSVEQ0ZTlOaDVuNFBO?=
 =?utf-8?B?Q1g1bkV3Y3oxM3JrcW16QnJoZkpkd0dXc0EzSDlweCsrTnBNUVhOKzN6S3pS?=
 =?utf-8?B?WGRaY2docTlTNVErV0VHSDN5dFYzMmxMalhxdkcyZ0dBY0RBeTBudmtRSWNZ?=
 =?utf-8?B?c0VQNWU5S2k1ckdqQTlFU0tqdWdwQ0IvdVIwSHRqK2V1NkFHU0VGRUJuak96?=
 =?utf-8?B?NkpaZis4U2x5aVFnOGhYS3FsV1hPeGV4dWJGQUczRk1VNXhQVjVCNlRpUUM5?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9370509b-5a1f-4b2b-d5a0-08dcd2a451fa
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 20:57:17.2404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xbu8eqlifFbOCNlY5lF5d8zePyTDwWHcXy4nuXHw3eOT3u9VbjEL8EugOqZtx4vrhd5ne9K/tz31ufHkNKh+yf+5AXuURxhswlPJ5bT4WHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5898
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

On 9/11/2024 1:13 PM, John Harrison wrote:
> On 9/11/2024 12:55, Julia Filipchuk wrote:
>> On 9/5/2024 1:51 PM, John.C.Harrison@Intel.com wrote:
>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>
>>> Add a worker function helper for asynchronously dumping state when an
>>> internal/fatal error is detected in CT processing. Being asynchronous
>>> is required to avoid deadlocks and scheduling-while-atomic or
>>> process-stalled-for-too-long issues. Also check for a bunch more error
>>> conditions and improve the handling of some existing checks.
>>>
>>> v2: Use compile time CONFIG check for new (but not directly CT_DEAD
>>> related) checks and use unsigned int for a bitmask, rename
>>> CT_DEAD_RESET to CT_DEAD_REARM and add some explaining comments,
>>> rename 'hxg' macro parameter to 'ctb' - review feedback from Michal W.
>>> Drop CT_DEAD_ALIVE as no need for a bitfield define to just set the
>>> entire mask to zero.
>>> v3: Fix kerneldoc
>>> v4: Nullify some floating pointers after free.
>>> v5: Add section headings and device info to make the state dump look
>>> more like a devcoredump to allow parsing by the same tools (eventual
>>> aim is to just call the devcoredump code itself, but that currently
>>> requires an xe_sched_job, which is not available in the CT code).
>>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>   .../drm/xe/abi/guc_communication_ctb_abi.h    |   1 +
>>>   drivers/gpu/drm/xe/xe_guc.c                   |   2 +-
>>>   drivers/gpu/drm/xe/xe_guc_ct.c                | 280 ++++++++++++++++--
>>>   drivers/gpu/drm/xe/xe_guc_ct.h                |   2 +-
>>>   drivers/gpu/drm/xe/xe_guc_ct_types.h          |  23 ++
>>>   5 files changed, 280 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h b/
>>> drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
>>> index 8f86a16dc577..f58198cf2cf6 100644
>>> --- a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
>>> +++ b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
>>> @@ -52,6 +52,7 @@ struct guc_ct_buffer_desc {
>>>   #define GUC_CTB_STATUS_OVERFLOW                (1 << 0)
>>>   #define GUC_CTB_STATUS_UNDERFLOW            (1 << 1)
>>>   #define GUC_CTB_STATUS_MISMATCH                (1 << 2)
>>> +#define GUC_CTB_STATUS_DISABLED                (1 << 3)
>>>       u32 reserved[13];
>>>   } __packed;
>>>   static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>> index 34cdb08b6e27..3fef24c965c4 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -1176,7 +1176,7 @@ void xe_guc_print_info(struct xe_guc *guc,
>>> struct drm_printer *p)
>>>         xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>>   -    xe_guc_ct_print(&guc->ct, p, false);
>>> +    xe_guc_ct_print(&guc->ct, p);
>>>       xe_guc_submit_print(guc, p);
>>>   }
>>>   diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/
>>> xe_guc_ct.c
>>> index a63fe0a9077a..e31b1f0b855f 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> @@ -25,12 +25,57 @@
>>>   #include "xe_gt_sriov_pf_monitor.h"
>>>   #include "xe_gt_tlb_invalidation.h"
>>>   #include "xe_guc.h"
>>> +#include "xe_guc_log.h"
>>>   #include "xe_guc_relay.h"
>>>   #include "xe_guc_submit.h"
>>>   #include "xe_map.h"
>>>   #include "xe_pm.h"
>>>   #include "xe_trace_guc.h"
>>>   +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>> +enum {
>>> +    CT_DEAD_REARM,                /* 0x0001 - not an error condition */
>>> +    CT_DEAD_SETUP,                /* 0x0002 */
>>> +    CT_DEAD_H2G_WRITE,            /* 0x0004 */
>>> +    CT_DEAD_H2G_HAS_ROOM,            /* 0x0008 */
>>> +    CT_DEAD_G2H_READ,            /* 0x0010 */
>>> +    CT_DEAD_G2H_RECV,            /* 0x0020 */
>>> +    CT_DEAD_G2H_RELEASE,            /* 0x0040 */
>>> +    CT_DEAD_DEADLOCK,            /* 0x0080 */
>>> +    CT_DEAD_PROCESS_FAILED,            /* 0x0100 */
>>> +    CT_DEAD_FAST_G2H,            /* 0x0200 */
>>> +    CT_DEAD_PARSE_G2H_RESPONSE,        /* 0x0400 */
>>> +    CT_DEAD_PARSE_G2H_UNKNOWN,        /* 0x0800 */
>>> +    CT_DEAD_PARSE_G2H_ORIGIN,        /* 0x1000 */
>>> +    CT_DEAD_PARSE_G2H_TYPE,            /* 0x2000 */
>>> +};
>>> +
>>> +static void ct_dead_worker_func(struct work_struct *w);
>>> +
>>> +#define CT_DEAD(ct, ctb, reason_code)                                \
>>> +    do {                                            \
>>> +        struct guc_ctb *_ctb = (ctb);                            \
>>> +        if (_ctb)                                    \
>>> +            _ctb->info.broken = true;                        \
>>> +        if (!(ct)->dead.reported) {                            \
>> Do we need to worry about a second dead ct causing conflict with quick
>> back-to-back CT_DEAD? Suggest to set reported here and to clear it only
>> from worker thread. Snapshot can be used instead of reported to
>> determine if it has been printed (in worker_func).
> No. We are only really interested in the intial cause of a problem.
> Subsequent failures are likely to be caused by the first. So once a
> report has been printed, we just ignore any further failures until a
> reset has happened.
> 
>> Should the snapshot be taken in the "CT_DEAD_REARM" case?
> No. That is the reset that turns the reporting system back on. I.e. it
> re-arms the reporting trigger.
>>> +            struct xe_guc *guc = ct_to_guc(ct);                    \
>>> +            spin_lock_irq(&ct->dead.lock);                        \
>>> +            (ct)->dead.reason |= 1 <<
>>> CT_DEAD_##reason_code;            \
>> Does this field need to be cleared or does this accumulate reasons CT
>> died?
> This is to accumulate in the case of multiple errors in rapid succession
> (i.e. before it has managed to do the dump) to account for the
> possibility that the errors might not be noticed in the order they
> really happened. So it accumulates everything up to the first dump and
> then goes quite.
In this case of multiple errors accumulated before being printed the
first time (and dead.reported set true) the snapshots would leak when
overwritten. This seems like an issue.

> 
>>
>>> +            (ct)->dead.snapshot_log =
>>> xe_guc_log_snapshot_capture(&guc->log, true);    \
>>> +            (ct)->dead.snapshot_ct =
>>> xe_guc_ct_snapshot_capture((ct), true);    \
>>> +            spin_unlock_irq(&ct->dead.lock);                    \
>>> +            queue_work(system_unbound_wq, &(ct)-
>>> >dead.worker);            \
>>> +        }                                        \
>>> +    } while (0)
>>> +#else
>>> +#define CT_DEAD(ct, ctb, reason)            \
>>> +    do {                        \
>>> +        struct guc_ctb *_ctb = (ctb);        \
>>> +        if (_ctb)                \
>>> +            _ctb->info.broken = true;    \
>>> +    } while (0)
>>> +#endif
>>> +
>>>   /* Used when a CT send wants to block and / or receive data */
>>>   struct g2h_fence {
>>>       u32 *response_buffer;
>>> @@ -183,6 +228,10 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>>>       xa_init(&ct->fence_lookup);
>>>       INIT_WORK(&ct->g2h_worker, g2h_worker_func);
>>>       INIT_DELAYED_WORK(&ct->safe_mode_worker, safe_mode_worker_func);
>>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>> +    spin_lock_init(&ct->dead.lock);
>>> +    INIT_WORK(&ct->dead.worker, ct_dead_worker_func);
>>> +#endif
>>>       init_waitqueue_head(&ct->wq);
>>>       init_waitqueue_head(&ct->g2h_fence_wq);
>>>   @@ -419,10 +468,22 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>>>       if (ct_needs_safe_mode(ct))
>>>           ct_enter_safe_mode(ct);
>>>   +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>> +    /*
>>> +     * The CT has now been reset so the dumper can be re-armed
>>> +     * after any existing dead state has been dumped.
>>> +     */
>>> +    spin_lock_irq(&ct->dead.lock);
>>> +    if (ct->dead.reason)
>>> +        ct->dead.reason |= CT_DEAD_REARM;
>>> +    spin_unlock_irq(&ct->dead.lock);
>>> +#endif
>>> +
>>>       return 0;
>>>     err_out:
>>>       xe_gt_err(gt, "Failed to enable GuC CT (%pe)\n", ERR_PTR(err));
>>> +    CT_DEAD(ct, NULL, SETUP);
>>>         return err;
>>>   }
>>> @@ -773,8 +895,13 @@ static int guc_ct_send_locked(struct xe_guc_ct
>>> *ct, const u32 *action, u32 len,
>>>               goto broken;
>>>   #undef g2h_avail
>>>   -        if (dequeue_one_g2h(ct) < 0)
>>> +        ret = dequeue_one_g2h(ct);
>>> +        if (ret < 0) {
>>> +            if (ret != -ECANCELED)
>>> +                xe_gt_err(ct_to_gt(ct), "CTB receive failed (%pe)",
>>> +                      ERR_PTR(ret));
>> Is it correct there is no success condition here? Would canceled case
>> need to route to try_again?
> Not sure what you mean. This whole block is inside an EBUSY error path.
> As part of the retry, it is trying to make space by clearing out G2H
> entries. The ECANCELED error is because a reset or something known
> happened, therefore there is no need to re-report it. If the dequeue was
> successful then it continues with the retry by hitting the "goto
> try_again".
Makes sense.

> 
>>>               goto broken;
>>> +        }
>>>             goto try_again;
>>>       }
>>
>>
>>
>>
>>> +
>>> +static void ct_dead_worker_func(struct work_struct *w)
>>> +{
>>> +    struct xe_guc_ct *ct = container_of(w, struct xe_guc_ct,
>>> dead.worker);
>>> +
>>> +    if (!ct->dead.reported) {
>>> +        ct->dead.reported = true;> +        ct_dead_print(&ct->dead);
>>> +    }
>> Would this guard work against quick back-to-back CT_DEAD calls? This may
>> not happen? Suggest to move 'ct->dead.reported = true;' into the CT_DEAD
>> macro. Relates to CT_DEAD macro above.
> As above, there is no concern about wanting to do back to back dumps.
> Once a dump has happened, there is no point printing anything further
> until a GT reset has happened. At which point everything is re-enabled.
> 
>>
>>
>> Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
>>
> Again, you should not give an r-b when there are many concerns being
> raised. An r-b says you approve of the code as it is and are happy for
> it to be merged.
> 
> John.
> 
> 

