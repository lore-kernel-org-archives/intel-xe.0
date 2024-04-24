Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAE2C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 03:20:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E52D10FE6A;
	Wed, 24 Apr 2024 03:20:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E8B0GBhE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8068C10FE6A
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 03:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713928858; x=1745464858;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=jgQhE8xNJX/ZuNeajVavc31h1rOof9Ktz42gpK1rxk0=;
 b=E8B0GBhEytPtuByRkAAJ8OysJZ2XrxHp3lXxyZWEhQD946niXKMCIGyT
 154CQJX1tt28oasChq1vyMnYhpwqwAaFw+Ecln+f0s+0cs96j6/qcKAcJ
 rmVMsK2rag3g3i02yp44Sy9HKv2y86bbpVemhKFriZ+NYMrE1+8SPDyn8
 ZbnD47dFwR5jQ6yyOBYyzJtINMlZJtaaNfx7qKPPa81uGCRXFVQVTB1Fj
 lRpBnf2z4GME/GCbYO1TNDtNfxJzmS/t8XPItxEr+gS3YM5aGDVh869sk
 bfFVkpY29ygX5IJaBOxvIepXPwXkXioEjKl0miXmR7yESPLgvQbAbvvnI A==;
X-CSE-ConnectionGUID: VcvZ8hN5Qr6sd4P/VcRR+A==
X-CSE-MsgGUID: EahoPdDYQSCLX/dNNEcFew==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9707056"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208,217";a="9707056"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 20:20:58 -0700
X-CSE-ConnectionGUID: Xd1vjXJKScWnwr0lyJb1dA==
X-CSE-MsgGUID: mWN3hyMHT2qn8EhsNWV4fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208,217";a="25182973"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 20:20:57 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 20:20:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 20:20:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 20:20:56 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 20:20:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5n+l/NRyMFI2D6xFjibNo4xW/LjmapYDDvUVKZfWa20zuLO7U5+eYDIrhfzHzN+HiKeRlkfR5ojajDPFf5QxwG9Z/IECUNI4UH4AtzB6i68affMo2oZVjEH1KPGxjCQx3okij5UpMwAEeKU97FdzwcF4SiEVlgSc5eSS2kohkUU1rAmTNZdkdmf2wJrhIL1VLZp0muUVzPvay/0nFV1e8FY46TEpI7WZPetQG1l6096F+yJJBK7Sj8eg9vBvzQPryKvn44leSj1yeAfdPbj9SfkPLUX4EEDPjOW+pDdWikaA6ixDUzvY4CcJHRN9cShfQaTNea4XQBjfu0U76paQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tICYUp6cHAzxmelehEJzm0/Xd05gPXIvHc4bdomiHZ0=;
 b=LlIZ/NeK7tatNs/ycp5vpcSEnyYf+fqu8JKnepa1F4OFqDA+XBkBk8KWBnH0UCuE3vD+/3q+/Z/jjQrbRaz+HlrPfsowIVDyAegksiP1MB8Wb4stdjmgXTc7OX4Xp1jyBz0klCmnjkih/CP0Q9vBdn5xW/Bw7GZvcZkk+XT9D48bMZHiPBREpbb33TxI0nS5ftOQ45Aq2WcNSgxf2GY721iTL+/qYyROvfyVfd2cSzGvOw61zgqM9SucZv1Tt47IZl4EKBe2i8b44jhmgbc/JFx3DYgsnYs9REznDXfJViyjvbAgNvLRWZ+fzEtgRapoDUdWhpaKzmlpQip09ALNJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ1PR11MB6082.namprd11.prod.outlook.com (2603:10b6:a03:48b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Wed, 24 Apr
 2024 03:20:53 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 03:20:52 +0000
Content-Type: multipart/alternative;
 boundary="------------pjQk6LWMpXPECvKk6QpFWoFw"
Message-ID: <05145d94-73f4-4448-9ec7-db9f06f68a07@intel.com>
Date: Wed, 24 Apr 2024 08:50:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/xe: Force wedged state and block GT reset upon
 any GPU hang
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Dafna Hirschfeld
 <dhirschfeld@habana.ai>, Lucas De Marchi <lucas.demarchi@intel.com>, "Alan
 Previn" <alan.previn.teres.alexis@intel.com>, Himanshu Somaiya
 <himanshu.somaiya@intel.com>
References: <20240423221817.1285081-1-rodrigo.vivi@intel.com>
 <20240423221817.1285081-3-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240423221817.1285081-3-rodrigo.vivi@intel.com>
X-ClientProxiedBy: PN2PR01CA0148.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::33) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ1PR11MB6082:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c6c17de-5fb8-43bf-0474-08dc640d8bdd
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmJwNUNlN0REakltcDBvcFFPTk1CdUtuNTh3WDIvRkZNY2VxVTVXTTlJK1hT?=
 =?utf-8?B?TWhIRXFZVlBCWFlzUTcvTGlLSnVhYXc3Sm5CT2JzVVU0YUduT2Z2UDNEWXJr?=
 =?utf-8?B?RE1OdTJ5ZnA1SUhzanpGZU9sOWd6OUtHUklxVmhsZnhzajVFbldzOTJ0S1Ni?=
 =?utf-8?B?Q3FMQjRTVG5Za01TNFJWd0VNNVhvWlllNGsvbFhpN0FBd01aS0F2bVQ4NXpz?=
 =?utf-8?B?WWthTVJ5VXVISm5jNUYwRWlUM1h4SlFMQVptUXIvMG9JcERvdTdWejRVRjVh?=
 =?utf-8?B?NzhlLzY0YlMxK1hQY2F5UDc0S0RlckNIRHVhOFVnOUVRU0JxM1FVRWpRQWww?=
 =?utf-8?B?WlZpaXlsb0NETGJtbVFrM3JOM2dxZXFXZit5Z3F2N2tIQnB1ZU8yYXhMTU9h?=
 =?utf-8?B?bHM2dTBXV2Q4R1ZBbEpXMU1xREpNeFY4REhubHh2L2pVSkUvRjd5MWRDSDhh?=
 =?utf-8?B?SU9jaUorVzJFWFlPdm5qQm9UTjVPQnFiM2NNMEhhSEVJczhncDlhZSt6RW1r?=
 =?utf-8?B?bWdXWmhOenhKOVorTVZmZWlZSzF2UDhwSmxSTGdiNCtEdytYN1NJcFlFZXBU?=
 =?utf-8?B?eFI4VWRzS2NPOUc1b2FPcXUwbVIzeHo0YnhNVFl1YnRFWmw4MkhHRVVYV05X?=
 =?utf-8?B?SUVBQk5vS1o1a01MejJZNDAvSnRTSEhMN3JzUnAyaDJtR1pjSElBWExmLzhM?=
 =?utf-8?B?TDYrdmJuZ0JwNHVKdmFHeVozM2ltendUZTdPNW8vRFNrU3VFb1BnampvUkcz?=
 =?utf-8?B?OTB6R0srcWNla3prejNOcURRNm53THFqb3NwMWcvNHhTUGxJRVA4S1BRWkl3?=
 =?utf-8?B?WFBNcmR1a2Z3UTZLdk1mMit5a0M2VndLSGtEUkFtbzRlT05RTUhZWkNQUFA0?=
 =?utf-8?B?eEFNRjJuNGFMU2ovWE5Xdk1Ya21Da2MyaVlEcko0T2RpWElSbWd5Sncxa3Ew?=
 =?utf-8?B?SzV2bkpYcU5WcUFxSVhKNjNrMHpJTzRRN0hhQmpHZkN5SjJRSEpmZktwYTVM?=
 =?utf-8?B?UFhJRk8wZFJ5VjBZNHRUcUh6aHk1SnNuY1BrOWNjY09uME5hNS9XS3JuRzBp?=
 =?utf-8?B?REhpcy9hdVRCVVJjMGt6ODRpcW1kWHB1VWtjTk9wN09nK01KaWFZQkdQWnJV?=
 =?utf-8?B?R08vd2dDM2ZYSHY4NTMzdjZETlo3QTZKQzhSYnBsK2J3YmlnbkQvS0FaYWNM?=
 =?utf-8?B?bHptWk9lVFh1SDllSWNkU1FTZU8wb1UxRjZvaWZicElvSEJzZk1RZW4xUG9t?=
 =?utf-8?B?Sk9NaDJvYjF1U3dHclhiTnFnOWlJeExjcmM2VFdXb29jL1c0NlREUzN5ZUNN?=
 =?utf-8?B?cWx1bmZWeENUdHI4Q0N1NWNlNUt4VWJDeWRBTit1L1hSSCtIV2hZcXZJb0Vj?=
 =?utf-8?B?RDRFeDRWOXM3aW1KSi9FQmFyRFhjSEVCcWZ6a1F2WmtFRUh0VWdPeGd2amVs?=
 =?utf-8?B?N2ZEYnN2aGhvVjN2WDF4d0pYUmpDMDJ3dlhxcHl5QlUzMkZvNWdsclJrK05X?=
 =?utf-8?B?MWh2cHE5eCtZTTIyT2pEZ0ppSHFLWTJwNElrbUg2czhhdG5uQVFkTzJwU1Vu?=
 =?utf-8?B?ay9RRUpqRG11Nlo5Y3dMTXBRUjdadlZYbFVXOUtHblJhd2dRcWdXcVNXTlBE?=
 =?utf-8?B?NGl1K3VqdkRocnkzZEVZS3lNc1dZeEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NklTNC9PREtFUE5hUjZ3aUozTXYwTUk5RHhKUmJCUndvMTdoVEUrdktvRC93?=
 =?utf-8?B?ZmlCL0l1STNTYTBNUDM3MzhPMnhZekZnV3pKYWdSVFB0NzZ4U3FTNmJxRjZa?=
 =?utf-8?B?RmpHcFpPVXpsWTY4QjREOER4c2FBUWNid2FUZ2kzT0pnYm1yRkVJeFdOdGw3?=
 =?utf-8?B?aEswNVpsUVdGcmNsZW5mQlEzV3lHQkNVQy9kMC9RMlo5d21JYUFxNm5ocG1R?=
 =?utf-8?B?dUdpektQN0lFeXJFeUdBUGdKZHc2VVNpNm85a2s4WWpkWlVsVXI2MDB4empr?=
 =?utf-8?B?aXFycVpXcVRVRmFpVSs2bnRqUVdYY25DNkdjU2FCR0g3V3IvMXY4dnJqYlFz?=
 =?utf-8?B?TEt1UlVsV1BBV3c4MnZRTGhTNlNhWFVWOWhHRno0NGNSc0hGR0FaMm4ySWFY?=
 =?utf-8?B?bTJ0TUpSeWtpdEgvK2Q0RUJkTmVGR3QxdXdvakNXVG53YmdsbnNadVpwTm9Y?=
 =?utf-8?B?VGp3bUMrWjV5Rmp0aDZCb3dWVzl6S2x4TnBnZ2U4ajlSQzkzSDNjNGxhTU8x?=
 =?utf-8?B?dHJ3ZnZ6Y0dPZWRRa0VRTWlCT1B1cFcxZHpJRjZpVkRzSldOYmtJV215Tldq?=
 =?utf-8?B?TVJJRFAwRWpmMEZ1bkFoaHdVYmxBcDBpemxMejJsZktMYWxLMjdIRHg4UHlV?=
 =?utf-8?B?cklXR2JEODYwenZxWklxcUVtTVcxb05EWlBCNWJYb1djaVNOUjJ4NUQvcGtN?=
 =?utf-8?B?OW13VEhSMS8zS1pIRERSZUhZM2I3eHVEanJTQ1RSeEtDV1hkYVErWUJKQjAr?=
 =?utf-8?B?aFZlNEZvbDM5NnhYTWlRd1pWZEZ4TzFCbGZxTjVKTzlCMkNsaFJ5SUtwK2pv?=
 =?utf-8?B?cGJtQnBzZXdDUmNkY2hIeGFpTFJDOWVvR00wd1ZKaXd3WEVaUnA3dEMyMUk1?=
 =?utf-8?B?aHlHblBlV21qSEh4NmFBS054NTNhSkxUUjA5TmExR1ZkUWozNkxyTlVMeEU2?=
 =?utf-8?B?bllacDYvMXhnYkdVdHB3ODZyQlVtNSt5blFpOE1KYUtnc3ZVTW9RNFh4ZFlM?=
 =?utf-8?B?RFgxNnEyK2hYeU5BbWYwR1krUDJkQ2h6OHdnTzBXRGNXQVBrbEJUS1JtWjcz?=
 =?utf-8?B?UWZtMUJRUVRIbzcxckt5MkFXV2o0ZlFOZDdmQ0hSK1BqQmJBZkgvM0MxZVNU?=
 =?utf-8?B?ZDA0UWt5cFRvbmlpS05mVVpSdTVjZGM5Nm02SHZzcmdXR0swQnh2VjdxU3Nu?=
 =?utf-8?B?eDN4NGMxTmkwWW42MWJvSkpkUlVRMXRSVWhGdUhEa0pUd1A3cUV2YkhnZ2xs?=
 =?utf-8?B?M3pzMVlFWGM3a3VhN21RTUd5cHZmcFYyN0YyVkxxV2wyVkxiTnJsdXJOd0Zx?=
 =?utf-8?B?UllhamtlaW05RDFzOERFRXpwMy9KVWdBWDdkcDhVbng1UGl2VEdaQjRqWDZL?=
 =?utf-8?B?RGtsUjBEdlBWSFc0WmlqQzlDUmwyNTd3WU50WVhHb0N0c3IyaER6aFY5ZENG?=
 =?utf-8?B?cXNYTUM3VjN3S01Lb3dLak9UOGtEQjB2TFNYOS9aL3ZoMC9GcWtDN0NGWWF5?=
 =?utf-8?B?RlR4Ukg4aVAxS01JSnIzZUVyTzhLdFk1WmJlSnVoNC9yZlNGUVROc1RaYWZG?=
 =?utf-8?B?cTB6b21nY1VBbXg1dHc2ZjJyT3pIZDlYT2cvYlF0R1J3akhxcE9HTnpwVW4r?=
 =?utf-8?B?cmJaL0dZQmVVQWVBOVR5anc2KzFHcmdRRkdYc1BrWHR4Y1hTU090bUQ4RjJF?=
 =?utf-8?B?K2ZwWnMybnFYdW1zN3FCTmRzVjFhOCtxajJOZ1U0R2pleFZqS25tK1ErYlRG?=
 =?utf-8?B?eU9DbnE2T1hwaUxzUzhRTHVNY3dLc2VJM0VKUUcxQXFtb3BpQnFKMU5sRUxn?=
 =?utf-8?B?NGVvT1ZHTm1aMjQ1VGtyUE9hK3BGNXRoakhzL3BjMWhRdnp4TW5reTB4Yncr?=
 =?utf-8?B?ZG5vbWUyeHpzL29xWXNaZVFxcVZBZGN6Ync0aXBHNzkrcGlTelA3UFJhTFpy?=
 =?utf-8?B?NlFkYmV0Z1cyRGlYV1FvbkZhamxha2pEekFFaU1BbDhUNkplU3c2bzd3L3hU?=
 =?utf-8?B?RGFEdHlJaWxIT2xpcFdkazZwYUMyWjdXNUtTTnF5aTB5U0k1QXA4YXVSSVFR?=
 =?utf-8?B?a3NWZVVYc292Q3FWU0hNa3BWaHpsYXl6SEpjUjQrQldlZ2NzODd0MGJKT3Zz?=
 =?utf-8?B?d1hKUnZBZ3JJMUpWUit0SVhDczVZU1YrRkVWSGRvRTBhQWNiV05WcG5xbkR1?=
 =?utf-8?B?NGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6c17de-5fb8-43bf-0474-08dc640d8bdd
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 03:20:52.6671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S7tLdJ4tKD/DxoWbitdZpelFpbwQN75iNTa38Yw55Ll1P2gDWMUNVnzBifU3D3ICspR6+sDsLIxsmvrwZPk91AQbrK3wMg/OqT/DCZvOPMs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6082
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

--------------pjQk6LWMpXPECvKk6QpFWoFw
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 24-04-2024 03:48, Rodrigo Vivi wrote:
> In many validation situations when debugging GPU Hangs,
> it is useful to preserve the GT situation from the moment
> that the timeout occurred.
>
> This patch introduces a module parameter that could be used
> on situations like this.
>
> If xe.wedged module parameter is set to 2, Xe will be declared
> wedged on every single execution timeout (a.k.a. GPU hang) right
> after devcoredump snapshot capture and without attempting any
> kind of GT reset and blocking entirely any kind of execution.
>
> v2: Really block gt_reset from guc side. (Lucas)
>      s/wedged/busted (Lucas)
>
> v3: - s/busted/wedged
>      - Really use global_flags (Dafna)
>      - More robust timeout handling when wedging it.
>
> v4: A really robust clean exit done by Matt Brost.
>      No more kernel warns on unbind.
>
> v5: Simplify error message (Lucas)
>
> Cc: Matthew Brost<matthew.brost@intel.com>
> Cc: Dafna Hirschfeld<dhirschfeld@habana.ai>
> Cc: Lucas De Marchi<lucas.demarchi@intel.com>
> Cc: Alan Previn<alan.previn.teres.alexis@intel.com>
> Cc: Himanshu Somaiya<himanshu.somaiya@intel.com>
> Reviewed-by: Lucas De Marchi<lucas.demarchi@intel.com>
> Signed-off-by: Rodrigo Vivi<rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c              | 29 +++++++
>   drivers/gpu/drm/xe/xe_device.h              | 15 +---
>   drivers/gpu/drm/xe/xe_exec_queue.h          |  9 +++
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  2 +-
>   drivers/gpu/drm/xe/xe_guc_ads.c             |  9 ++-
>   drivers/gpu/drm/xe/xe_guc_submit.c          | 90 +++++++++++++++++----
>   drivers/gpu/drm/xe/xe_module.c              |  5 ++
>   drivers/gpu/drm/xe/xe_module.h              |  1 +
>   8 files changed, 129 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 76a7b37a4a53..d45db6ff1fa3 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -764,3 +764,32 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
>   {
>   	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
>   }
> +
> +/**
> + * xe_device_declare_wedged - Declare device wedged
> + * @xe: xe device instance
> + *
> + * This is a final state that can only be cleared with a module
> + * re-probe (unbind + bind).
> + * In this state every IOCTL will be blocked so the GT cannot be used.
> + * In general it will be called upon any critical error such as gt reset
> + * failure or guc loading failure.
> + * If xe.wedged module parameter is set to 2, this function will be called
> + * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
> + * snapshot capture. In this mode, GT reset won't be attempted so the state of
> + * the issue is preserved for further debugging.
> + */
> +void xe_device_declare_wedged(struct xe_device *xe)
> +{
> +	if (xe_modparam.wedged_mode == 0)
> +		return;
> +
> +	if (!atomic_xchg(&xe->wedged, 1)) {
> +		xe->needs_flr_on_fini = true;
> +		drm_err(&xe->drm,
> +			"CRITICAL: Xe has declared device %s as wedged.\n"
> +			"IOCTLs and executions are blocked. Only a rebind may clear the failure\n"
> +			"Please file a _new_ bug report athttps://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> +			dev_name(xe->drm.dev));
> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index d2e4249d37ce..9ede45fc062a 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -172,19 +172,6 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>   	return atomic_read(&xe->wedged);
>   }
>   
> -static inline void xe_device_declare_wedged(struct xe_device *xe)
> -{
> -	if (!atomic_xchg(&xe->wedged, 1)) {
> -		xe->needs_flr_on_fini = true;
> -		drm_err(&xe->drm,
> -			"CRITICAL: Xe has declared device %s as wedged.\n"
> -			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
> -			"echo '%s' > /sys/bus/pci/drivers/xe/unbind\n"
> -			"echo '%s' > /sys/bus/pci/drivers/xe/bind\n"
> -			"Please file a _new_ bug report athttps://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
> -			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
> -			dev_name(xe->drm.dev));
> -	}
> -}
> +void xe_device_declare_wedged(struct xe_device *xe);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index 02ce8d204622..48f6da53a292 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -26,6 +26,15 @@ void xe_exec_queue_fini(struct xe_exec_queue *q);
>   void xe_exec_queue_destroy(struct kref *ref);
>   void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance);
>   
> +static inline struct xe_exec_queue *
> +xe_exec_queue_get_unless_zero(struct xe_exec_queue *q)
> +{
> +	if (kref_get_unless_zero(&q->refcount))
> +		return q;
> +
> +	return NULL;
> +}
> +
>   struct xe_exec_queue *xe_exec_queue_lookup(struct xe_file *xef, u32 id);
>   
>   static inline struct xe_exec_queue *xe_exec_queue_get(struct xe_exec_queue *q)
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 93df2d7969b3..8e9c4b990fbb 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -245,7 +245,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>   			return seqno;
>   
>   		xe_gt_tlb_invalidation_wait(gt, seqno);
> -	} else if (xe_device_uc_enabled(xe)) {
> +	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
>   		xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>   		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
>   			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 1aafa486edec..db817a46f157 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -20,6 +20,7 @@
>   #include "xe_lrc.h"
>   #include "xe_map.h"
>   #include "xe_mmio.h"
> +#include "xe_module.h"
>   #include "xe_platform_types.h"
>   #include "xe_wa.h"
>   
> @@ -440,11 +441,17 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
>   
>   static void guc_policies_init(struct xe_guc_ads *ads)
>   {
> +	u32 global_flags = 0;
> +
>   	ads_blob_write(ads, policies.dpc_promote_time,
>   		       GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US);
>   	ads_blob_write(ads, policies.max_num_work_items,
>   		       GLOBAL_POLICY_MAX_NUM_WI);
> -	ads_blob_write(ads, policies.global_flags, 0);
> +
> +	if (xe_modparam.wedged_mode == 2)
> +		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> +
> +	ads_blob_write(ads, policies.global_flags, global_flags);
>   	ads_blob_write(ads, policies.is_valid, 1);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index c7d38469fb46..0bea17536659 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -35,6 +35,7 @@
>   #include "xe_macros.h"
>   #include "xe_map.h"
>   #include "xe_mocs.h"
> +#include "xe_module.h"
>   #include "xe_ring_ops_types.h"
>   #include "xe_sched_job.h"
>   #include "xe_trace.h"
> @@ -59,6 +60,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
>   #define ENGINE_STATE_SUSPENDED		(1 << 5)
>   #define EXEC_QUEUE_STATE_RESET		(1 << 6)
>   #define ENGINE_STATE_KILLED		(1 << 7)
> +#define EXEC_QUEUE_STATE_WEDGED		(1 << 8)
>   
>   static bool exec_queue_registered(struct xe_exec_queue *q)
>   {
> @@ -175,9 +177,20 @@ static void set_exec_queue_killed(struct xe_exec_queue *q)
>   	atomic_or(ENGINE_STATE_KILLED, &q->guc->state);
>   }
>   
> -static bool exec_queue_killed_or_banned(struct xe_exec_queue *q)
> +static bool exec_queue_wedged(struct xe_exec_queue *q)
>   {
> -	return exec_queue_killed(q) || exec_queue_banned(q);
> +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_WEDGED;
> +}
> +
> +static void set_exec_queue_wedged(struct xe_exec_queue *q)
> +{
> +	atomic_or(EXEC_QUEUE_STATE_WEDGED, &q->guc->state);
> +}
> +
> +static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
> +{
> +	return exec_queue_banned(q) || (atomic_read(&q->guc->state) &
> +		(EXEC_QUEUE_STATE_WEDGED | ENGINE_STATE_KILLED));
>   }
>   
>   #ifdef CONFIG_PROVE_LOCKING
> @@ -240,6 +253,17 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
>   	free_submit_wq(guc);
>   }
>   
> +static void guc_submit_wedged_fini(struct drm_device *drm, void *arg)
> +{
> +	struct xe_guc *guc = arg;
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> +		if (exec_queue_wedged(q))
> +			xe_exec_queue_put(q);
> +}
> +
>   static const struct xe_exec_queue_ops guc_exec_queue_ops;
>   
>   static void primelockdep(struct xe_guc *guc)
> @@ -708,7 +732,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>   
>   	trace_xe_sched_job_run(job);
>   
> -	if (!exec_queue_killed_or_banned(q) && !xe_sched_job_is_error(job)) {
> +	if (!exec_queue_killed_or_banned_or_wedged(q) && !xe_sched_job_is_error(job)) {
>   		if (!exec_queue_registered(q))
>   			register_engine(q);
>   		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
> @@ -844,6 +868,28 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
>   		xe_sched_tdr_queue_imm(&q->guc->sched);
>   }
>   
> +static void guc_submit_wedged(struct xe_guc *guc)
> +{
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +	int err;
> +
> +	xe_device_declare_wedged(guc_to_xe(guc));
> +	xe_guc_submit_reset_prepare(guc);
> +	xe_guc_ct_stop(&guc->ct);
> +
> +	err = drmm_add_action_or_reset(&guc_to_xe(guc)->drm,
> +				       guc_submit_wedged_fini, guc);
> +	if (err)
> +		return;
> +
> +	mutex_lock(&guc->submission_state.lock);
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> +		if (xe_exec_queue_get_unless_zero(q))
> +			set_exec_queue_wedged(q);
> +	mutex_unlock(&guc->submission_state.lock);
> +}
> +
>   static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>   {
>   	struct xe_guc_exec_queue *ge =
> @@ -852,10 +898,16 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>   	struct xe_guc *guc = exec_queue_to_guc(q);
>   	struct xe_device *xe = guc_to_xe(guc);
>   	struct xe_gpu_scheduler *sched = &ge->sched;
> +	bool wedged = xe_device_wedged(xe);
>   
>   	xe_assert(xe, xe_exec_queue_is_lr(q));
>   	trace_xe_exec_queue_lr_cleanup(q);
>   
> +	if (!wedged && xe_modparam.wedged_mode == 2) {
> +		guc_submit_wedged(exec_queue_to_guc(q));
> +		wedged = true;
> +	}
> +
>   	/* Kill the run_job / process_msg entry points */
>   	xe_sched_submission_stop(sched);
>   
> @@ -870,7 +922,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>   	 * xe_guc_deregister_done_handler() which treats it as an unexpected
>   	 * state.
>   	 */
> -	if (exec_queue_registered(q) && !exec_queue_destroyed(q)) {
> +	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
>   		struct xe_guc *guc = exec_queue_to_guc(q);
>   		int ret;
>   
> @@ -905,6 +957,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
>   	int err = -ETIME;
>   	int i = 0;
> +	bool wedged = xe_device_wedged(xe);
>   
>   	/*
>   	 * TDR has fired before free job worker. Common if exec queue
> @@ -928,6 +981,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   
>   	trace_xe_sched_job_timedout(job);
>   
> +	if (!wedged && xe_modparam.wedged_mode == 2) {
> +		guc_submit_wedged(exec_queue_to_guc(q));
> +		wedged = true;
> +	}
> +
>   	/* Kill the run_job entry point */
>   	xe_sched_submission_stop(sched);
>   
> @@ -935,8 +993,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	 * Kernel jobs should never fail, nor should VM jobs if they do
>   	 * somethings has gone wrong and the GT needs a reset
>   	 */
> -	if (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> -	    (q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q))) {
> +	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> +			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
>   		if (!xe_sched_invalidate_job(job, 2)) {
>   			xe_sched_add_pending_job(sched, job);
>   			xe_sched_submission_start(sched);
> @@ -946,7 +1004,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	}
>   
>   	/* Engine state now stable, disable scheduling if needed */
> -	if (exec_queue_registered(q)) {
> +	if (!wedged && exec_queue_registered(q)) {
>   		struct xe_guc *guc = exec_queue_to_guc(q);
>   		int ret;
>   
> @@ -989,6 +1047,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	 */
>   	xe_sched_add_pending_job(sched, job);
>   	xe_sched_submission_start(sched);
> +
>   	xe_guc_exec_queue_trigger_cleanup(q);
>   
>   	/* Mark all outstanding jobs as bad, thus completing them */
> @@ -1028,7 +1087,7 @@ static void guc_exec_queue_fini_async(struct xe_exec_queue *q)
>   	INIT_WORK(&q->guc->fini_async, __guc_exec_queue_fini_async);
>   
>   	/* We must block on kernel engines so slabs are empty on driver unload */
> -	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT)
> +	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
>   		__guc_exec_queue_fini_async(&q->guc->fini_async);
>   	else
>   		queue_work(system_wq, &q->guc->fini_async);
> @@ -1063,7 +1122,7 @@ static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
>   
>   static bool guc_exec_queue_allowed_to_change_state(struct xe_exec_queue *q)
>   {
> -	return !exec_queue_killed_or_banned(q) && exec_queue_registered(q);
> +	return !exec_queue_killed_or_banned_or_wedged(q) && exec_queue_registered(q);
>   }
>   
>   static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *msg)
> @@ -1274,7 +1333,7 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
>   {
>   	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
>   
> -	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT))
> +	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !exec_queue_wedged(q))
>   		guc_exec_queue_add_msg(q, msg, CLEANUP);
>   	else
>   		__guc_exec_queue_fini(exec_queue_to_guc(q), q);
> @@ -1285,7 +1344,8 @@ static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
>   {
>   	struct xe_sched_msg *msg;
>   
> -	if (q->sched_props.priority == priority || exec_queue_killed_or_banned(q))
> +	if (q->sched_props.priority == priority ||
> +	    exec_queue_killed_or_banned_or_wedged(q))
>   		return 0;
>   
>   	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
> @@ -1303,7 +1363,7 @@ static int guc_exec_queue_set_timeslice(struct xe_exec_queue *q, u32 timeslice_u
>   	struct xe_sched_msg *msg;
>   
>   	if (q->sched_props.timeslice_us == timeslice_us ||
> -	    exec_queue_killed_or_banned(q))
> +	    exec_queue_killed_or_banned_or_wedged(q))
>   		return 0;
>   
>   	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
> @@ -1322,7 +1382,7 @@ static int guc_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
>   	struct xe_sched_msg *msg;
>   
>   	if (q->sched_props.preempt_timeout_us == preempt_timeout_us ||
> -	    exec_queue_killed_or_banned(q))
> +	    exec_queue_killed_or_banned_or_wedged(q))
>   		return 0;
>   
>   	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
> @@ -1339,7 +1399,7 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
>   {
>   	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_SUSPEND;
>   
> -	if (exec_queue_killed_or_banned(q) || q->guc->suspend_pending)
> +	if (exec_queue_killed_or_banned_or_wedged(q) || q->guc->suspend_pending)
>   		return -EINVAL;
>   
>   	q->guc->suspend_pending = true;
> @@ -1485,7 +1545,7 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
>   {
>   	struct xe_gpu_scheduler *sched = &q->guc->sched;
>   
> -	if (!exec_queue_killed_or_banned(q)) {
> +	if (!exec_queue_killed_or_banned_or_wedged(q)) {
>   		int i;
>   
>   		trace_xe_exec_queue_resubmit(q);
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index ceb8345cbca6..3edeb30d5ccb 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -17,6 +17,7 @@ struct xe_modparam xe_modparam = {
>   	.enable_display = true,
>   	.guc_log_level = 5,
>   	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
> +	.wedged_mode = 1,
>   	/* the rest are 0 by default */
>   };
>   
> @@ -55,6 +56,10 @@ MODULE_PARM_DESC(max_vfs,
>   		 "(0 = no VFs [default]; N = allow up to N VFs)");
>   #endif
>   
> +module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600);
> +MODULE_PARM_DESC(wedged_mode,
> +		 "Module's default policy for the wedged mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
> +

Hi Rodrigo,

The debugfs entry introduced in [PATCH 4/4] of the series offers the 
same functionality as the modparams provided. Do you perceive any 
additional value in using this modparam?

The behavior of loading the module without using modparams and setting 
debugfs mode to 2 before executing the workload is identical to loading 
the driver module with the modparam xe_modparam.wedged_mode = 2.

BR

Himal

>   struct init_funcs {
>   	int (*init)(void);
>   	void (*exit)(void);
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index b369984f08ec..61a0d28a28c8 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -21,6 +21,7 @@ struct xe_modparam {
>   #ifdef CONFIG_PCI_IOV
>   	unsigned int max_vfs;
>   #endif
> +	int wedged_mode;
>   };
>   
>   extern struct xe_modparam xe_modparam;
--------------pjQk6LWMpXPECvKk6QpFWoFw
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 24-04-2024 03:48, Rodrigo Vivi
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20240423221817.1285081-3-rodrigo.=
vivi@intel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">In many validation situations =
when debugging GPU Hangs,
it is useful to preserve the GT situation from the moment
that the timeout occurred.

This patch introduces a module parameter that could be used
on situations like this.

If xe.wedged module parameter is set to 2, Xe will be declared
wedged on every single execution timeout (a.k.a. GPU hang) right
after devcoredump snapshot capture and without attempting any
kind of GT reset and blocking entirely any kind of execution.

v2: Really block gt_reset from guc side. (Lucas)
    s/wedged/busted (Lucas)

v3: - s/busted/wedged
    - Really use global_flags (Dafna)
    - More robust timeout handling when wedging it.

v4: A really robust clean exit done by Matt Brost.
    No more kernel warns on unbind.

v5: Simplify error message (Lucas)

Cc: Matthew Brost <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:matthew=
.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Cc: Dafna Hirschfeld <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:dhir=
schfeld@habana.ai">&lt;dhirschfeld@habana.ai&gt;</a>
Cc: Lucas De Marchi <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:lucas=
.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>
Cc: Alan Previn <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:alan.prev=
in.teres.alexis@intel.com">&lt;alan.previn.teres.alexis@intel.com&gt;</a>
Cc: Himanshu Somaiya <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:hima=
nshu.somaiya@intel.com">&lt;himanshu.somaiya@intel.com&gt;</a>
Reviewed-by: Lucas De Marchi <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>
Signed-off-by: Rodrigo Vivi <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_device.c              | 29 +++++++
 drivers/gpu/drm/xe/xe_device.h              | 15 +---
 drivers/gpu/drm/xe/xe_exec_queue.h          |  9 +++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  2 +-
 drivers/gpu/drm/xe/xe_guc_ads.c             |  9 ++-
 drivers/gpu/drm/xe/xe_guc_submit.c          | 90 +++++++++++++++++----
 drivers/gpu/drm/xe/xe_module.c              |  5 ++
 drivers/gpu/drm/xe/xe_module.h              |  1 +
 8 files changed, 129 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.=
c
index 76a7b37a4a53..d45db6ff1fa3 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -764,3 +764,32 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe=
, u64 address)
 {
 	return address &amp; GENMASK_ULL(xe-&gt;info.va_bits - 1, 0);
 }
+
+/**
+ * xe_device_declare_wedged - Declare device wedged
+ * @xe: xe device instance
+ *
+ * This is a final state that can only be cleared with a module
+ * re-probe (unbind + bind).
+ * In this state every IOCTL will be blocked so the GT cannot be used.
+ * In general it will be called upon any critical error such as gt reset
+ * failure or guc loading failure.
+ * If xe.wedged module parameter is set to 2, this function will be called
+ * on every single execution timeout (a.k.a. GPU hang) right after devcore=
dump
+ * snapshot capture. In this mode, GT reset won't be attempted so the stat=
e of
+ * the issue is preserved for further debugging.
+ */
+void xe_device_declare_wedged(struct xe_device *xe)
+{
+	if (xe_modparam.wedged_mode =3D=3D 0)
+		return;
+
+	if (!atomic_xchg(&amp;xe-&gt;wedged, 1)) {
+		xe-&gt;needs_flr_on_fini =3D true;
+		drm_err(&amp;xe-&gt;drm,
+			&quot;CRITICAL: Xe has declared device %s as wedged.\n&quot;
+			&quot;IOCTLs and executions are blocked. Only a rebind may clear the fa=
ilure\n&quot;
+			&quot;Please file a _new_ bug report at <a class=3D"moz-txt-link-freete=
xt" href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n">http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n</a>&quot;,
+			dev_name(xe-&gt;drm.dev));
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.=
h
index d2e4249d37ce..9ede45fc062a 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -172,19 +172,6 @@ static inline bool xe_device_wedged(struct xe_device *=
xe)
 	return atomic_read(&amp;xe-&gt;wedged);
 }
=20
-static inline void xe_device_declare_wedged(struct xe_device *xe)
-{
-	if (!atomic_xchg(&amp;xe-&gt;wedged, 1)) {
-		xe-&gt;needs_flr_on_fini =3D true;
-		drm_err(&amp;xe-&gt;drm,
-			&quot;CRITICAL: Xe has declared device %s as wedged.\n&quot;
-			&quot;IOCTLs and executions are blocked until device is probed again wi=
th unbind and bind operations:\n&quot;
-			&quot;echo '%s' &gt; /sys/bus/pci/drivers/xe/unbind\n&quot;
-			&quot;echo '%s' &gt; /sys/bus/pci/drivers/xe/bind\n&quot;
-			&quot;Please file a _new_ bug report at <a class=3D"moz-txt-link-freete=
xt" href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n">http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n</a>&quot;,
-			dev_name(xe-&gt;drm.dev), dev_name(xe-&gt;drm.dev),
-			dev_name(xe-&gt;drm.dev));
-	}
-}
+void xe_device_declare_wedged(struct xe_device *xe);
=20
 #endif
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exe=
c_queue.h
index 02ce8d204622..48f6da53a292 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -26,6 +26,15 @@ void xe_exec_queue_fini(struct xe_exec_queue *q);
 void xe_exec_queue_destroy(struct kref *ref);
 void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance);
=20
+static inline struct xe_exec_queue *
+xe_exec_queue_get_unless_zero(struct xe_exec_queue *q)
+{
+	if (kref_get_unless_zero(&amp;q-&gt;refcount))
+		return q;
+
+	return NULL;
+}
+
 struct xe_exec_queue *xe_exec_queue_lookup(struct xe_file *xef, u32 id);
=20
 static inline struct xe_exec_queue *xe_exec_queue_get(struct xe_exec_queue=
 *q)
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/=
xe/xe_gt_tlb_invalidation.c
index 93df2d7969b3..8e9c4b990fbb 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -245,7 +245,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 			return seqno;
=20
 		xe_gt_tlb_invalidation_wait(gt, seqno);
-	} else if (xe_device_uc_enabled(xe)) {
+	} else if (xe_device_uc_enabled(xe) &amp;&amp; !xe_device_wedged(xe)) {
 		xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
 		if (xe-&gt;info.platform =3D=3D XE_PVC || GRAPHICS_VER(xe) &gt;=3D 20) {
 			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ad=
s.c
index 1aafa486edec..db817a46f157 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -20,6 +20,7 @@
 #include &quot;xe_lrc.h&quot;
 #include &quot;xe_map.h&quot;
 #include &quot;xe_mmio.h&quot;
+#include &quot;xe_module.h&quot;
 #include &quot;xe_platform_types.h&quot;
 #include &quot;xe_wa.h&quot;
=20
@@ -440,11 +441,17 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *=
ads)
=20
 static void guc_policies_init(struct xe_guc_ads *ads)
 {
+	u32 global_flags =3D 0;
+
 	ads_blob_write(ads, policies.dpc_promote_time,
 		       GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US);
 	ads_blob_write(ads, policies.max_num_work_items,
 		       GLOBAL_POLICY_MAX_NUM_WI);
-	ads_blob_write(ads, policies.global_flags, 0);
+
+	if (xe_modparam.wedged_mode =3D=3D 2)
+		global_flags |=3D GLOBAL_POLICY_DISABLE_ENGINE_RESET;
+
+	ads_blob_write(ads, policies.global_flags, global_flags);
 	ads_blob_write(ads, policies.is_valid, 1);
 }
=20
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc=
_submit.c
index c7d38469fb46..0bea17536659 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -35,6 +35,7 @@
 #include &quot;xe_macros.h&quot;
 #include &quot;xe_map.h&quot;
 #include &quot;xe_mocs.h&quot;
+#include &quot;xe_module.h&quot;
 #include &quot;xe_ring_ops_types.h&quot;
 #include &quot;xe_sched_job.h&quot;
 #include &quot;xe_trace.h&quot;
@@ -59,6 +60,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
 #define ENGINE_STATE_SUSPENDED		(1 &lt;&lt; 5)
 #define EXEC_QUEUE_STATE_RESET		(1 &lt;&lt; 6)
 #define ENGINE_STATE_KILLED		(1 &lt;&lt; 7)
+#define EXEC_QUEUE_STATE_WEDGED		(1 &lt;&lt; 8)
=20
 static bool exec_queue_registered(struct xe_exec_queue *q)
 {
@@ -175,9 +177,20 @@ static void set_exec_queue_killed(struct xe_exec_queue=
 *q)
 	atomic_or(ENGINE_STATE_KILLED, &amp;q-&gt;guc-&gt;state);
 }
=20
-static bool exec_queue_killed_or_banned(struct xe_exec_queue *q)
+static bool exec_queue_wedged(struct xe_exec_queue *q)
 {
-	return exec_queue_killed(q) || exec_queue_banned(q);
+	return atomic_read(&amp;q-&gt;guc-&gt;state) &amp; EXEC_QUEUE_STATE_WEDGE=
D;
+}
+
+static void set_exec_queue_wedged(struct xe_exec_queue *q)
+{
+	atomic_or(EXEC_QUEUE_STATE_WEDGED, &amp;q-&gt;guc-&gt;state);
+}
+
+static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
+{
+	return exec_queue_banned(q) || (atomic_read(&amp;q-&gt;guc-&gt;state) &am=
p;
+		(EXEC_QUEUE_STATE_WEDGED | ENGINE_STATE_KILLED));
 }
=20
 #ifdef CONFIG_PROVE_LOCKING
@@ -240,6 +253,17 @@ static void guc_submit_fini(struct drm_device *drm, vo=
id *arg)
 	free_submit_wq(guc);
 }
=20
+static void guc_submit_wedged_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_guc *guc =3D arg;
+	struct xe_exec_queue *q;
+	unsigned long index;
+
+	xa_for_each(&amp;guc-&gt;submission_state.exec_queue_lookup, index, q)
+		if (exec_queue_wedged(q))
+			xe_exec_queue_put(q);
+}
+
 static const struct xe_exec_queue_ops guc_exec_queue_ops;
=20
 static void primelockdep(struct xe_guc *guc)
@@ -708,7 +732,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
=20
 	trace_xe_sched_job_run(job);
=20
-	if (!exec_queue_killed_or_banned(q) &amp;&amp; !xe_sched_job_is_error(job=
)) {
+	if (!exec_queue_killed_or_banned_or_wedged(q) &amp;&amp; !xe_sched_job_is=
_error(job)) {
 		if (!exec_queue_registered(q))
 			register_engine(q);
 		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
@@ -844,6 +868,28 @@ static void xe_guc_exec_queue_trigger_cleanup(struct x=
e_exec_queue *q)
 		xe_sched_tdr_queue_imm(&amp;q-&gt;guc-&gt;sched);
 }
=20
+static void guc_submit_wedged(struct xe_guc *guc)
+{
+	struct xe_exec_queue *q;
+	unsigned long index;
+	int err;
+
+	xe_device_declare_wedged(guc_to_xe(guc));
+	xe_guc_submit_reset_prepare(guc);
+	xe_guc_ct_stop(&amp;guc-&gt;ct);
+
+	err =3D drmm_add_action_or_reset(&amp;guc_to_xe(guc)-&gt;drm,
+				       guc_submit_wedged_fini, guc);
+	if (err)
+		return;
+
+	mutex_lock(&amp;guc-&gt;submission_state.lock);
+	xa_for_each(&amp;guc-&gt;submission_state.exec_queue_lookup, index, q)
+		if (xe_exec_queue_get_unless_zero(q))
+			set_exec_queue_wedged(q);
+	mutex_unlock(&amp;guc-&gt;submission_state.lock);
+}
+
 static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 {
 	struct xe_guc_exec_queue *ge =3D
@@ -852,10 +898,16 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_=
struct *w)
 	struct xe_guc *guc =3D exec_queue_to_guc(q);
 	struct xe_device *xe =3D guc_to_xe(guc);
 	struct xe_gpu_scheduler *sched =3D &amp;ge-&gt;sched;
+	bool wedged =3D xe_device_wedged(xe);
=20
 	xe_assert(xe, xe_exec_queue_is_lr(q));
 	trace_xe_exec_queue_lr_cleanup(q);
=20
+	if (!wedged &amp;&amp; xe_modparam.wedged_mode =3D=3D 2) {
+		guc_submit_wedged(exec_queue_to_guc(q));
+		wedged =3D true;
+	}
+
 	/* Kill the run_job / process_msg entry points */
 	xe_sched_submission_stop(sched);
=20
@@ -870,7 +922,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_st=
ruct *w)
 	 * xe_guc_deregister_done_handler() which treats it as an unexpected
 	 * state.
 	 */
-	if (exec_queue_registered(q) &amp;&amp; !exec_queue_destroyed(q)) {
+	if (!wedged &amp;&amp; exec_queue_registered(q) &amp;&amp; !exec_queue_de=
stroyed(q)) {
 		struct xe_guc *guc =3D exec_queue_to_guc(q);
 		int ret;
=20
@@ -905,6 +957,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_j=
ob)
 	struct xe_device *xe =3D guc_to_xe(exec_queue_to_guc(q));
 	int err =3D -ETIME;
 	int i =3D 0;
+	bool wedged =3D xe_device_wedged(xe);
=20
 	/*
 	 * TDR has fired before free job worker. Common if exec queue
@@ -928,6 +981,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_=
job)
=20
 	trace_xe_sched_job_timedout(job);
=20
+	if (!wedged &amp;&amp; xe_modparam.wedged_mode =3D=3D 2) {
+		guc_submit_wedged(exec_queue_to_guc(q));
+		wedged =3D true;
+	}
+
 	/* Kill the run_job entry point */
 	xe_sched_submission_stop(sched);
=20
@@ -935,8 +993,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_j=
ob)
 	 * Kernel jobs should never fail, nor should VM jobs if they do
 	 * somethings has gone wrong and the GT needs a reset
 	 */
-	if (q-&gt;flags &amp; EXEC_QUEUE_FLAG_KERNEL ||
-	    (q-&gt;flags &amp; EXEC_QUEUE_FLAG_VM &amp;&amp; !exec_queue_killed(q=
))) {
+	if (!wedged &amp;&amp; (q-&gt;flags &amp; EXEC_QUEUE_FLAG_KERNEL ||
+			(q-&gt;flags &amp; EXEC_QUEUE_FLAG_VM &amp;&amp; !exec_queue_killed(q))=
)) {
 		if (!xe_sched_invalidate_job(job, 2)) {
 			xe_sched_add_pending_job(sched, job);
 			xe_sched_submission_start(sched);
@@ -946,7 +1004,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_=
job)
 	}
=20
 	/* Engine state now stable, disable scheduling if needed */
-	if (exec_queue_registered(q)) {
+	if (!wedged &amp;&amp; exec_queue_registered(q)) {
 		struct xe_guc *guc =3D exec_queue_to_guc(q);
 		int ret;
=20
@@ -989,6 +1047,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_=
job)
 	 */
 	xe_sched_add_pending_job(sched, job);
 	xe_sched_submission_start(sched);
+
 	xe_guc_exec_queue_trigger_cleanup(q);
=20
 	/* Mark all outstanding jobs as bad, thus completing them */
@@ -1028,7 +1087,7 @@ static void guc_exec_queue_fini_async(struct xe_exec_=
queue *q)
 	INIT_WORK(&amp;q-&gt;guc-&gt;fini_async, __guc_exec_queue_fini_async);
=20
 	/* We must block on kernel engines so slabs are empty on driver unload */
-	if (q-&gt;flags &amp; EXEC_QUEUE_FLAG_PERMANENT)
+	if (q-&gt;flags &amp; EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
 		__guc_exec_queue_fini_async(&amp;q-&gt;guc-&gt;fini_async);
 	else
 		queue_work(system_wq, &amp;q-&gt;guc-&gt;fini_async);
@@ -1063,7 +1122,7 @@ static void __guc_exec_queue_process_msg_cleanup(stru=
ct xe_sched_msg *msg)
=20
 static bool guc_exec_queue_allowed_to_change_state(struct xe_exec_queue *q=
)
 {
-	return !exec_queue_killed_or_banned(q) &amp;&amp; exec_queue_registered(q=
);
+	return !exec_queue_killed_or_banned_or_wedged(q) &amp;&amp; exec_queue_re=
gistered(q);
 }
=20
 static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_m=
sg *msg)
@@ -1274,7 +1333,7 @@ static void guc_exec_queue_fini(struct xe_exec_queue =
*q)
 {
 	struct xe_sched_msg *msg =3D q-&gt;guc-&gt;static_msgs + STATIC_MSG_CLEAN=
UP;
=20
-	if (!(q-&gt;flags &amp; EXEC_QUEUE_FLAG_PERMANENT))
+	if (!(q-&gt;flags &amp; EXEC_QUEUE_FLAG_PERMANENT) &amp;&amp; !exec_queue=
_wedged(q))
 		guc_exec_queue_add_msg(q, msg, CLEANUP);
 	else
 		__guc_exec_queue_fini(exec_queue_to_guc(q), q);
@@ -1285,7 +1344,8 @@ static int guc_exec_queue_set_priority(struct xe_exec=
_queue *q,
 {
 	struct xe_sched_msg *msg;
=20
-	if (q-&gt;sched_props.priority =3D=3D priority || exec_queue_killed_or_ba=
nned(q))
+	if (q-&gt;sched_props.priority =3D=3D priority ||
+	    exec_queue_killed_or_banned_or_wedged(q))
 		return 0;
=20
 	msg =3D kmalloc(sizeof(*msg), GFP_KERNEL);
@@ -1303,7 +1363,7 @@ static int guc_exec_queue_set_timeslice(struct xe_exe=
c_queue *q, u32 timeslice_u
 	struct xe_sched_msg *msg;
=20
 	if (q-&gt;sched_props.timeslice_us =3D=3D timeslice_us ||
-	    exec_queue_killed_or_banned(q))
+	    exec_queue_killed_or_banned_or_wedged(q))
 		return 0;
=20
 	msg =3D kmalloc(sizeof(*msg), GFP_KERNEL);
@@ -1322,7 +1382,7 @@ static int guc_exec_queue_set_preempt_timeout(struct =
xe_exec_queue *q,
 	struct xe_sched_msg *msg;
=20
 	if (q-&gt;sched_props.preempt_timeout_us =3D=3D preempt_timeout_us ||
-	    exec_queue_killed_or_banned(q))
+	    exec_queue_killed_or_banned_or_wedged(q))
 		return 0;
=20
 	msg =3D kmalloc(sizeof(*msg), GFP_KERNEL);
@@ -1339,7 +1399,7 @@ static int guc_exec_queue_suspend(struct xe_exec_queu=
e *q)
 {
 	struct xe_sched_msg *msg =3D q-&gt;guc-&gt;static_msgs + STATIC_MSG_SUSPE=
ND;
=20
-	if (exec_queue_killed_or_banned(q) || q-&gt;guc-&gt;suspend_pending)
+	if (exec_queue_killed_or_banned_or_wedged(q) || q-&gt;guc-&gt;suspend_pen=
ding)
 		return -EINVAL;
=20
 	q-&gt;guc-&gt;suspend_pending =3D true;
@@ -1485,7 +1545,7 @@ static void guc_exec_queue_start(struct xe_exec_queue=
 *q)
 {
 	struct xe_gpu_scheduler *sched =3D &amp;q-&gt;guc-&gt;sched;
=20
-	if (!exec_queue_killed_or_banned(q)) {
+	if (!exec_queue_killed_or_banned_or_wedged(q)) {
 		int i;
=20
 		trace_xe_exec_queue_resubmit(q);
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.=
c
index ceb8345cbca6..3edeb30d5ccb 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -17,6 +17,7 @@ struct xe_modparam xe_modparam =3D {
 	.enable_display =3D true,
 	.guc_log_level =3D 5,
 	.force_probe =3D CONFIG_DRM_XE_FORCE_PROBE,
+	.wedged_mode =3D 1,
 	/* the rest are 0 by default */
 };
=20
@@ -55,6 +56,10 @@ MODULE_PARM_DESC(max_vfs,
 		 &quot;(0 =3D no VFs [default]; N =3D allow up to N VFs)&quot;);
 #endif
=20
+module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600)=
;
+MODULE_PARM_DESC(wedged_mode,
+		 &quot;Module's default policy for the wedged mode - 0=3Dnever, 1=3Dupon=
-critical-errors[default], 2=3Dupon-any-hang&quot;);
+</pre>
    </blockquote>
    <p><font face=3D"monospace">Hi Rodrigo,<br>
      </font></p>
    <p style=3D"border: 0px solid rgb(227, 227, 227); box-sizing: border-bo=
x; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0;=
 --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-=
scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ;=
 --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --t=
w-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --t=
w-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numer=
ic-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-of=
fset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-sha=
dow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 t=
ransparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightn=
ess: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ;=
 --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; -=
-tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscal=
e: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opac=
ity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: =
; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; margin=
: 0px 0px 1.25em; color: rgb(13, 13, 13); font-size: 16px; font-style: norm=
al; font-variant-ligatures: normal; font-variant-caps: normal; letter-spaci=
ng: normal; text-align: start; text-indent: 0px; text-transform: none; word=
-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; backg=
round-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-d=
ecoration-style: initial; text-decoration-color: initial;">The debugfs entr=
y introduced in [PATCH 4/4] of the series offers the same functionality as =
the modparams provided. Do you perceive any additional value in using this =
modparam?</p>
    <p style=3D"border: 0px solid rgb(227, 227, 227); box-sizing: border-bo=
x; --tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0;=
 --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-=
scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ;=
 --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --t=
w-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --t=
w-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numer=
ic-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-of=
fset-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-sha=
dow: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 t=
ransparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightn=
ess: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ;=
 --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; -=
-tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscal=
e: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opac=
ity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; --tw-contain-size: =
; --tw-contain-layout: ; --tw-contain-paint: ; --tw-contain-style: ; margin=
: 1.25em 0px 0px; color: rgb(13, 13, 13); font-size: 16px; font-style: norm=
al; font-variant-ligatures: normal; font-variant-caps: normal; letter-spaci=
ng: normal; text-align: start; text-indent: 0px; text-transform: none; word=
-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; backg=
round-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-d=
ecoration-style: initial; text-decoration-color: initial;">The behavior of =
loading the module without using modparams and setting debugfs mode to 2 be=
fore executing the workload is identical to loading the driver module with =
the modparam xe_modparam.wedged_mode <span style=3D"white-space: normal">=
=3D 2.</span></p>
    <p><font face=3D"monospace">BR</font></p>
    <p><font face=3D"monospace">Himal</font><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20240423221817.1285081-3-rodrigo.=
vivi@intel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
 struct init_funcs {
 	int (*init)(void);
 	void (*exit)(void);
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.=
h
index b369984f08ec..61a0d28a28c8 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -21,6 +21,7 @@ struct xe_modparam {
 #ifdef CONFIG_PCI_IOV
 	unsigned int max_vfs;
 #endif
+	int wedged_mode;
 };
=20
 extern struct xe_modparam xe_modparam;
</pre>
    </blockquote>
  </body>
</html>

--------------pjQk6LWMpXPECvKk6QpFWoFw--
