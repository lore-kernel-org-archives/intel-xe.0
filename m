Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E95EDE9B4
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 20:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A1610E917;
	Tue, 10 Sep 2024 20:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NCzpNn1Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB2C10E917
 for <Intel-Xe@lists.freedesktop.org>; Tue, 10 Sep 2024 20:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725999439; x=1757535439;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K+Tlyl4cblsVTGoUUVRklT6wJIj4B1TmbIPeV1IRcWI=;
 b=NCzpNn1Z+I7xSge5HPFCibFKVX7SB18kaqRUY5Cyq1b/G2gIU8u0vznB
 dnTstUBYNHAfgGVznqCX8fy9OPRTHrF53B+5eyz+kOjPVcdEP1oV94xkh
 fMwR25CHSe9Cnunw17cJSZ7seiklLpk3mwJLP3kw+q81zBMPnw9XjT5wr
 gSLTDShep4Sw40osmT5BTjFI4dNI3ky0K8kwLYkpUMYLxEeVanaFFiC7T
 B3pBBfhgLKPDmJd08q1syfSo25VQEQ80j05EXDqPSS+XgqwmjuiIsI01V
 0hpzJQN+es3E7d8aMLJVEOmpc2bX2Z6IcoJ6oPNOpPfHmEcbmRIFP5o6m A==;
X-CSE-ConnectionGUID: 8db5Ijv5RfidvIKuHzreZg==
X-CSE-MsgGUID: Q9TyOhCxRj2cHdp0bESGdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="42250679"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="42250679"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 13:17:18 -0700
X-CSE-ConnectionGUID: 0VRNCPKkT9ertmhSgW0u9g==
X-CSE-MsgGUID: j2YM5XOAQcCsljjfT4RCbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; d="scan'208";a="66992617"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 13:17:17 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 13:17:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 13:17:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 13:17:16 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 13:17:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wvgPQo55KiRHEvkYAVVbWnW0OyFvhHQ6qfHWMLwso7ov4KeSfSSdg6kUzbHoH9p8UblaIhessFEIaETaJNYIb1/pC3pQoYzZuHb/EYGOoJszzyXLAuB7hpPRZ1cIRnFtpuLhJmMkvJruEd4fqhPPxHCItVSOdP3MYeuxwO3lit9ZNtJUHri6PqBxITiy2V51RyiC9sSMC/H7XLE1Wf2YFMrk8D4ZVjyZZGUjOk5XDGfdlXgDmXzavKMvn5qMsovWMgASk0dLWm0N+7DOBZX360zjT+FKET1HzbR+Es0dUVvdOm8Y6qWGRQSuaWzkLsyR91ZiofwAHhmM5RYOCRz5kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRyTkQdB1LwuR8anXmOV0sscEAXMbXXWFxnV58lbXhM=;
 b=BK3YpyDP+XeHs3+1IxNc0L4c/AT34+ZK+vOfobUyunb/AXAwzYNksu+Duy/PoC2Ujf5TTD2XsqLkX3tEpT7iU2ccb4b4yTAIgFZ5lYGCTAwkB5k1UAOMcKEr0qeVxOa9XEia3QhLVvu7ujcp2RUIQxuyNCJf69XX8Vl6BMc66asIPzTDSXbBFfhJbP1CwfCetrBFpegJjUp2eFDxHomzev+uDawZGhdZlWl/AipIdFg3StOpqUj9gOWDeTdJeWZT8e34gg5PQ/UHKNy9BoYpjg/7AdX/cIj1ZTuBSncnBGyw1QV8P/70lYU6IwKBzCdw3uenv/nFYikl5m4bev0P9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8450.namprd11.prod.outlook.com (2603:10b6:a03:578::13)
 by SA1PR11MB8351.namprd11.prod.outlook.com (2603:10b6:806:384::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 10 Sep
 2024 20:17:14 +0000
Received: from SJ2PR11MB8450.namprd11.prod.outlook.com
 ([fe80::5c1b:f14a:ef14:121e]) by SJ2PR11MB8450.namprd11.prod.outlook.com
 ([fe80::5c1b:f14a:ef14:121e%4]) with mapi id 15.20.7939.017; Tue, 10 Sep 2024
 20:17:14 +0000
Message-ID: <61ce4887-9cc6-4e46-9412-958c992305a9@intel.com>
Date: Tue, 10 Sep 2024 13:17:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/10] drm/xe/devcoredump: Add ASCII85 dump helper
 function
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
 <20240905205106.1063091-4-John.C.Harrison@Intel.com>
 <sm6iyfzcaq6vbgytgueqqbjjzjniarulya6xzsuo7gyollceyj@iovrnktwvloq>
 <d80bec85-adfe-4410-ae04-e6bb0f41c764@intel.com>
 <avsxdhqepybtshgp3zfhdtv2beqaub7mg3nvkj7yws7utc5e5p@44uqzzgz6h3m>
 <b2002802-50d5-42bd-abb3-ffdf8ed33e69@Hendrik.org.uk>
 <21bc8c69-3a0f-4c68-99af-63f3f029f37a@intel.com>
 <eu7zw22lmcvkldfyt66abmi7gutl6eshey2ny4ev24d62jjagq@vm7i5j2s3mjx>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <eu7zw22lmcvkldfyt66abmi7gutl6eshey2ny4ev24d62jjagq@vm7i5j2s3mjx>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:254::10) To SJ2PR11MB8450.namprd11.prod.outlook.com
 (2603:10b6:a03:578::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8450:EE_|SA1PR11MB8351:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b9dce72-b49a-4ea7-e986-08dcd1d58f26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDBDczI0dDR3Q2xxWUZlYzFBL1Q1QXhqdElodW4xTkZ3UCsrL1ZuVzlKcEdN?=
 =?utf-8?B?ZEl5dXZXZjErdmlickUwTVhnQ3lOZkxZWkl1RDF6MlRNVGRDTktsNXBsQU1q?=
 =?utf-8?B?Qk9ndzFUOC9yZjJ1bzdYbjBVZE9pcFFFWUZFNnB6VHdZc1haT1pBNzBKZmRk?=
 =?utf-8?B?dEl0bGFsVTdGdXAxSnNjZEJlNkF5VnQ3Qm12ZVZyVVNSRVNscExKaU56UDNj?=
 =?utf-8?B?ZVlEaFh1ekZvOTl0MWNJZGdRYjNrSVpQc3NLZk02T0J6d1JPVWxlMjlSczI5?=
 =?utf-8?B?ejdSbmpmak1uMzBRUC9RaFJ4WE5TbnBuOUZtd0pKSjVmYkU5MDhUVGxkSmpv?=
 =?utf-8?B?MzBWVEVqR09EZ3ZTeXQ2NVBoNm4veFdEVnBBWEg4dnk4VHFkTzNWU3FRYmhI?=
 =?utf-8?B?OWpBVWszSi8zUmZpMXd6cmxnRzBSdGNHL3JDOEVLdlBVSmJrWXk2QThxL3NG?=
 =?utf-8?B?RHRDWG5uVWNXWDZPRlNqZXUrNlR0MHAvVFVuZy9qUGZHQXQvSEF0VnAwWG1h?=
 =?utf-8?B?RjZBcDJqT29FVnFmN0lBek1EbUJGR1JPVDZZOWF4OHl2SytUSFVDMThUTEE1?=
 =?utf-8?B?WXZ6RURIWUlIM0ExUUhuKzdJdDQvTWMwcTM5b0wzeEFBWFB6dVlEUzAzbG5S?=
 =?utf-8?B?NU9pNzE3TXNjcE4ybElEMWZhdkVKSHVzT3ZWMUNHbjc1SUdhNW9yMEdqZG54?=
 =?utf-8?B?UTJ0RUpDcm5LS3NPSWh6U1ZGSk9RVE9pRFo4cmU3M3huS0t5ZHlrbWsyUGZa?=
 =?utf-8?B?WWpldEhPQ20zMzJGSlczbDNLazR3TEVBLzdReVRKQ2U1NnpVaFRnaGRLSW84?=
 =?utf-8?B?cHFsYjcyUjZTdUNsWFY3OWtvd2JURjMxSGZhb2hxZ2QvWnVyN1BvcllSUHdD?=
 =?utf-8?B?aU9tN2pLN1dQUWs5YmlOVlQzYjlRRXc1YmJwNDZ5T0tvb2VmZzhuQUxPNHdV?=
 =?utf-8?B?QmdjMzFvNVU1dHdJemhLNjJITjJkRVdydEdPOFpNV0lCOWNBaENwZ29yczkr?=
 =?utf-8?B?S1A2bjNvVlR6K2dxVTFnM0FuZXJvNVRRZ3NTbUgwSkNNVTNwcFZERTdkeGVn?=
 =?utf-8?B?a3BYVXdVRWJFT0ZrMEVEaU1ReUdNQ3FyTldQYXZWR3d0T3hrUU5SYXBsd1pw?=
 =?utf-8?B?d3MzTjNjZ2gzMGlHVmZPSXhTUEFWUFZiano5UFhGNEtpKytLdDBQRUs3ditG?=
 =?utf-8?B?Q2NaM0FGVitKZ0pEK0cwM29yK0lvcVR0YUxkR2tIdElPT2RpSGFVZ3dCczFP?=
 =?utf-8?B?QTNBWXRHQndJVG9YVDRUZ1RNbW9SWmpBdHI5cW1mYUY0Z1orMEx2WlY0Z0RZ?=
 =?utf-8?B?RW9YalFreXZEVTdFMENCRTdtNmw4Qmo0WVFvRlEydDNTTUhvN2pGMjNybUdW?=
 =?utf-8?B?UnVRSFJINW1WODY3UHhYQTlxMXUzb1U0dndSZkQzNEF2OHF5cGswTXVvOEl1?=
 =?utf-8?B?eUM3WWREY05IQUwreXR4aTBlOE9MRnFRNXdNTExmbXU4RDZxK2ZCbDk5c3pC?=
 =?utf-8?B?MHBhbkY0dWZuT1Y2bExHMFdxWXVRbVFWNjVsbjl3UWFwRExERTYzUVlWVGpj?=
 =?utf-8?B?RksyMmJSaHFOTW1OVmErS0hkNVRRZC9Xbi9LWTF6ck5mOW9pVmpLT1A0WnQw?=
 =?utf-8?B?K3hyUDJEUHhnL0JiSlZ4R0dxWWN2OU9YUUxFeHZsQ2lXcFh3b0FwUkxTcXdp?=
 =?utf-8?B?aDJIbXBRcGlwTUx0OHdqb1ovZWdwQnZ3d29mVmVFWlRvL0FvRzh3Q2hyR1Iw?=
 =?utf-8?B?aFBvTHZqSkhnZCtTK25OWlM0ek9NMUFvSVJOYzFETllTUVVvLzNmRlJ1SVVL?=
 =?utf-8?B?OU4reEpxclg4WHdMK1F1UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB8450.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEZwMjN3T1Z1cXhVNmRmSXdBcjQwYVZlUnNYVk9ZUzBSYzNZS3NmZGRITUY5?=
 =?utf-8?B?UzhmVFRHa05kdVkxMEtYUWNTT0RyRkR5SFF2THBTNXhGY3QzbUZjRDlXRzQ5?=
 =?utf-8?B?S2xzK1VrYWJ2RzJoc3NTRWk3RzB1aUFYSC83REVSa2dwbUduOWdwQW1VeVB3?=
 =?utf-8?B?TExxOFNzSDJTTkNuL2ZpWVIrSyt0R1NVRWVIRWUxOERZcFBoWWdYbmx4NERu?=
 =?utf-8?B?UW9MdU9sQTB1MHM3dmV1V283QW5ReCtUdUdOc0N4d1doTFNXSGVkb2dMb0RS?=
 =?utf-8?B?VHUxSU1LcU5SdmZEYTdzUURjSTRnS3A2RFJqUmpXM1R1TkRZM21mSytsOE1L?=
 =?utf-8?B?MU9yKzdMcS96U2RVYzFEckRNTXRHNURYNGhlZG5uSUVsZkllb3g3c3J3WWRQ?=
 =?utf-8?B?SnFOZTB0bENZV3R2NWw4dGpQOStFSUFQLzZPT0JTR2NBcUlLdTVsTkY4d3dE?=
 =?utf-8?B?cWVsMmhVVlVVSXNEVXExOWE2RG9xSXZJaWREclAwR3FBYXh3THlpSC9yUFAy?=
 =?utf-8?B?UUFJNElpb21pVncrNHJaRlIvUWVqUnNUOWNDZ0NheTRObSsyMllQQVBTcnUx?=
 =?utf-8?B?ZVdZbnJZU2JEbC9XVWlWcU51WUZnbGZTTE1XR3JBcCtyR0haRzUzdnprOSsr?=
 =?utf-8?B?bGQyeDV5bFBrNjFWSm1ycjllRVY3RGl6RGFmS3lqT09DMHJWUVZ6d1JhYlJu?=
 =?utf-8?B?U3ZNcno2bzBxQzlvZk5OME1FMEh4UWhCU2JJdXluRERCeWtFUGFYUlNlbUNY?=
 =?utf-8?B?Kzl6L2ovT0pISjk3OXhIbHNLdWJ0MWFhMEpvMGxGOWV2bmtmRzRubkJMdVo3?=
 =?utf-8?B?ajNuQlluSytrWUttd0VoeEpWU2xVODB4aUYwQmIzak8zdGJabGVyMUFNc29k?=
 =?utf-8?B?Rk9reEJ0MjZockNZM3NldnZ4QzJPWDN1N3BIVFNLZnRaUG1aYXFvYU9oYnQz?=
 =?utf-8?B?TXpPc1lvRFBvd0VDT2YzRk4wL0xqMmliWk40NER0Y0V6WDF3dEdVdTNkTVFa?=
 =?utf-8?B?R2JKc2VoUWdrZjJaKzB1YU4rbW1Pd2ZyanhLWDg4K3JzcDR2dFJGYk4zNlpD?=
 =?utf-8?B?L211Y29TbkxoVGFmYWpaK2wyYlhST1M3TDd3VmVQdXp4dzIrS3FxZWUvdDhj?=
 =?utf-8?B?QWxMZDkzWURza01sMUNCaC9ac2pxamprQUZYWDV5MzFPM3RMQUd3ZDZnQmov?=
 =?utf-8?B?Nlc5UmVDSjFWUmFXdFBRMDdKV3kyWDltSWFuNHNsQW11THJsOG92QUo1bTlv?=
 =?utf-8?B?ZXpoa25lU3pSMnJFc3BaWW5uWWI1bi9Ld3hqb0ZrU2lGN2ZIREJNUkdFU1Jk?=
 =?utf-8?B?aHlTMDFQSjJLWmFDZjl1bGRFcml3RlVocHpaWC9wRnpNQTQxdTJYdHZQVWRN?=
 =?utf-8?B?OFovTnpWbGpWSDJMTDVpUXkwc0dTejhOYm55dldhRy9CUUowOWRSWGNnK2hT?=
 =?utf-8?B?VzcvUTJYVXViWFBaR05jVzZnV21XV3BQaUNON21sQWh5M3ZOMzdLOWc1Kzh0?=
 =?utf-8?B?K1VMYUpaTEU2SE0wcnhhRzdMSm02dm5SMXdzSjlFbC9QeEROVTNCRmQvN0Q2?=
 =?utf-8?B?aCtSTVY2eHNxQWh3N3FlZ2hSK1lSNVduOWc0QmRNZlFZa0JaTm9qV2xuKy9V?=
 =?utf-8?B?QjlPcGREeDdUeWxrUkM1QUFodHQ5QWVzSkFsVFFXSlJFeThrdkxCSloyeWp1?=
 =?utf-8?B?NVhSZU9zSzMxa3B5em83bEZiVlhsTXFCeVA0Wlc0OCtBclE0Kzl6a211elpV?=
 =?utf-8?B?NDlDa09aNlpJaWNBV21FUEI4UXBnTjRybDhiYU1kNlhCYVZmeGhkOXBHeXJZ?=
 =?utf-8?B?Sk9xR05Xck1rZ294Y1ZoczFCc3NxSXZOaHVWK3lmNmhUZ2lyZGxaWnVMUXRU?=
 =?utf-8?B?Z0xITzcrRjRKTlN4RkR2Q25wT0VUVjBkdmUrRm9WckowLy9PZW9LY1ZuK1VK?=
 =?utf-8?B?S0d3OUlPajBMa296TnExdm9kYkV3SzBBVlpSNnVaYzRhdnhtbXpvMUFHemdp?=
 =?utf-8?B?dHZ3NnBEZkwrM1lqdlFDNFNRU250K3RXUHRKQ25LRlI4a3hCb0UrR2RBREZI?=
 =?utf-8?B?TzFUeTZaWUNIVG16SENVYWNqYTBHQ1ZiMEZ4dzlySjNVTjJTVE04SkFjK1RF?=
 =?utf-8?B?dFRLWGgyZ015VUVUYXI5b1JEcWxaUVEvV3FiZENsS3hqcU13RGFSQzhRR0M4?=
 =?utf-8?B?cWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b9dce72-b49a-4ea7-e986-08dcd1d58f26
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8450.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 20:17:14.0707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JSDF3bt6n/7bwI9DOS/sXYppkY/vQNLU/t40Y9XOillz7CC9DJY+z7Mn0sWB9oO38yKElckNC0SjSfexsQDci10fyBJm1q57+JDsgkaKVl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8351
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

On 9/10/2024 12:43, Lucas De Marchi wrote:
> On Mon, Sep 09, 2024 at 06:31:41PM GMT, John Harrison wrote:
>> On 9/6/2024 19:06, John Harrison wrote:
>>> On 9/5/2024 20:04, Lucas De Marchi wrote:
>>>> On Thu, Sep 05, 2024 at 07:01:33PM GMT, John Harrison wrote:
>>>>> On 9/5/2024 18:54, Lucas De Marchi wrote:
>>>>>> On Thu, Sep 05, 2024 at 01:50:58PM GMT, John.C.Harrison@Intel.com 
>>>>>> wrote:
>>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>
>>>>>>> There is a need to include the GuC log and other large binary 
>>>>>>> objects
>>>>>>> in core dumps and via dmesg. So add a helper for dumping to a 
>>>>>>> printer
>>>>>>> function via conversion to ASCII85 encoding.
>>>>>>
>>>>>> why are we not dumping the binary data directly to devcoredump?
>>>>> As per earlier comments, there is a WiFi driver or some such that 
>>>>> does exactly that. But all they are dumping is a binary blob.
>>>>
>>>> In your v5 I see you mentioned
>>>> drivers/net/wireless/ath/ath10k/coredump.c, but that is a 
>>>> precedence for
>>>> including it as is from the device rather converting it to ASCII85 or
>>>> something else. It seems odd to do that type of conversion in kernel
>>>> space when it could be perfectly done in userspace.
>>> It really can't. An end user could maybe be expected to zip or tar a 
>>> coredump file before attaching it to a bug report but they are 
>>> certainly not going to try to ASCII85 encode random bits of it. 
>>> Whereas, putting that in the kernel means it is just there. It is 
>>> done. And it is pretty trivial - just call a helper function and it 
>>> does everything for you. Also, I very much doubt you can spew raw 
>>> binary data via dmesg. Even if the kernel would print it for you 
>>> (which I doubt), the user tools like syslogd and dmesg itself are 
>>> going to filter it to make it ASCII safe.
>>>
>>> The i915 error dumps have been ASCII85 encoded using the kernel's 
>>> ASCII85 encoding helper function since forever. This patch is just a 
>>> wrapper around the kernel's existing implementation in order to make 
>>> it more compatible with printing to dmesg. This is not creating a 
>>> new precedent. It already exists.
>>>
>>>>
>>>> $ git grep ascii85.h
>>>> drivers/gpu/drm/i915/i915_gpu_error.c:#include <linux/ascii85.h>
>>>> drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:#include <linux/ascii85.h>
>>>> drivers/gpu/drm/msm/adreno/adreno_gpu.c:#include <linux/ascii85.h>
>>>> drivers/gpu/drm/xe/xe_lrc.c:#include <linux/ascii85.h>
>>>> drivers/gpu/drm/xe/xe_vm.c:#include <linux/ascii85.h>
>>> And the list of drivers which dump raw binary data in a coredump 
>>> file is... ath10k. ASCII85 wins 3 to 1.
>>>
>>>
>>>>
>>>>>
>>>>> We want the devcoredump file to still be human readable. That 
>>>>> won't be the case if you stuff binary data in the middle of it. 
>>>>> Most obvious problem - the zeros in the data will terminate your 
>>>>> text file at that point. Potentially bigger problem for end users 
>>>>> - random fake ANSI codes will destroy your terminal window if you 
>>>>> try to cat the file to read it.
>>>>
>>>> Users don't get a coredump and cat it to the terminal.
>>>> =(lk%A8`T7AKYH#FD,6++EqOABHUhsG%5H2ARoq#E$/V$Bl7Q+@<5pmBe<q;Bk;0mCj@.3DIal2FD5Q-+E_RBART+X@VfTuGA2/4Dfp.E@3BN0DfB9.+E1b0F(KAV+:8 
>>>>
>>>>
>>>>
>>>> Lucas De Marchi
>>> They might. Either intentionally or accidentally. I've certainly 
>>> done it myself. And people will certainly want to look at it in any 
>>> random choice of text editor, pager, etc. 'cos you know, it is meant 
>>> to be read by humans. If it is full of binary data then that becomes 
>>> even more difficult than simply being full of ASCII gibberish. No 
>>> matter what you are doing, the ASCII version is safer and easier to 
>>> look at the rest of the file around it.
>>>
>>> I don't understand why you are so desperate to have raw binary data 
>>> in the middle of a text file. The disadvantages are multiple but the 
>>> only advantage is a slightly smaller file. And the true route to 
>>> smaller files is to add compression like we have in i915.
>>>
>>> John.
>>>
>> PS: Also meant to add that one of the important uses cases for 
>> dumping logs to dmesg is for the really hard to repro bugs that show 
>> up in CI extremely rarely. We get the driver to dump an error capture 
>> to dmesg and pull that out from the CI logs. Even if you could get 
>> binary data through dmesg, pretty sure the CI tools would also not be 
>> happy with it. Anything non-printable will get munged for sure when 
>> turning it into a web page.
>
> I think that's the main source of confusion on what we are discussing.
> I was not talking about dmesg at all. I'm only complaining about feeding
> ascii85-encoded data into a *devcoredump* when apparently there isn't a
> good reason to do so. I'd rather copy the binary data to the
> devcoredump.
But the intent is to dump a devcoredump to dmesg. It makes much sense to 
have a single implementation that can be used for multiple purposes. 
Otherwise you are duplicating a lot of code unnecessarily.

And I still think it is a *very* bad idea to be including binary data in 
a text file. The devcoredump is supposed to be human readable. It is 
supposed to be obtained by end users and passed around. Having binary 
data in there just makes everything more complex and error prone. We 
want this to be as simple, easy and safe as possible.

>
> For dmesg, there's a reason to encode it as you pointed out... but
> no users shouldn't actually see it - we should be getting all of those
> cases in CI. For the escape scenarios, yeah... better having it
> ascii85-encoded.
>
> What you are adding to devcoredump also doesn't even seem to be an
> ascii85 representation, but a multiple lines that should be concatenated
> to form the ascii85 representation. For dmesg it makes sense. Not for
> devcoredump.  We should also probabaly need a length field (correctly
> accounting for the additional characters for each line) so we don't
> have an implicit dependency on what's the next field to know how much to
> parse.
The decoding is pretty trivial given that line feeds are not part of the 
ASCII85 character set and so can just be dropped. Besides The output is 
already not 'pure' ASCII85 because the ASCII85 data is embedded within a 
devcoredump. There is all sorts of other text about, including on the 
start of the line. There are multiple ASCII85 blobs in there that need 
to be decoded separately. This is nothing new to my patch set. All of 
that is already there. And as per comments on the previous devcoredump 
patches from Matthew B, the object data can many hundreds of MBs in 
size. Yet no-one batted an eyelid when that was added. So why the sudden 
paranoia about adding a couple of MB of GuC log in the same form?

And again, arbitrarily long lines (potentially many thousands of 
characters wide) in a text file can cause problems. Having it line 
wrapped gets rid of those potential problems and so is safer. Anything 
that reduces the risk of an error report being broken is a good thing 
IMHO. Robustness is worthwhile!

John.

>
> Lucas De Marchi
>
>>
>> John.
>>

