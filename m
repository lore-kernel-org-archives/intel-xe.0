Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C0DD3ABFA
	for <intel-xe@archiver.kernel.org>; Mon, 11 Nov 2024 22:15:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE0110E18F;
	Mon, 11 Nov 2024 22:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fdtUwzDn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6EE10E18F
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Nov 2024 22:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731363326; x=1762899326;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pmc9g1T+Slj5gVmpfoLi8Y4jdY5hEdPMJ/l6M2RnYIw=;
 b=fdtUwzDnOykaYy+WlHCCjHo9g9jIzExwgvB52P9jQZJIywai12IzkEIZ
 BImG8Hw3QE8skUv0fq10VQGbhMg3XnVfHpnIoDkjx5j48OHj8IYtuis+u
 8xGh4UZhK7baQZrG3JpOwPc5nscOwN97WFRFaKSI+m/tFhv+JefyfMdUZ
 vu0X6GgRtP4s6qRvJwhGZHZr3Tc+p7l1ambq3dtK/evTdovhTR9r+VQd/
 iNc6rDunMmCQoGpIDYq1SCWuVZSRd8psXRdrZMeZHDHZY+/rXfh+BcIzj
 IzoJpPClTnoWOmCz8bi8oFdbv+0LdnhvfeDofk+0Bc2jPVRDjBhCqAXw9 A==;
X-CSE-ConnectionGUID: MaOXr/rjRf+pH5vXKEcr2w==
X-CSE-MsgGUID: aUJSDemvTy+aNEP9Ej6T8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31145391"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31145391"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 14:15:24 -0800
X-CSE-ConnectionGUID: F7l48AuHSZukNqFLWznm0A==
X-CSE-MsgGUID: Fd6vVqAgSLCYP4pW5B1ORg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,146,1728975600"; d="scan'208";a="87489530"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Nov 2024 14:15:23 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 11 Nov 2024 14:15:22 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 11 Nov 2024 14:15:22 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 11 Nov 2024 14:15:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IO1AD+ZrxgvqiWCuL72It4K+1q95SegXudkQ5KKOXF8nki3vZs282qoHazigeerZhVC80XzBLG19d9L3y9m02SbN7dEIv91tTlhEM0nSLxqJACqiloO2116gMWzo3Zl9aBnZm/0oczOPm+B1U8IaF0uX6r4TBEFo28g+GPeIPhh85p8Q3SqsP4dxTBeMXEVIxFjJHJWRkvNV8GAFRUXF4RDca2FsKyhspptD/98XGwHDMQ77WzgyR1rgGOrkOs6U7R2McpNEayR97vs4aikDgEpr+2VEKJvJb6v/3CW75zu2AQXZMCw5rkNH4EkswbS2jvg00VhNmKw+coQ1uk5siA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHKOdG9a102ekB4spwO/39ev2hJZTUdVczVw75ZVBi4=;
 b=uIVe0Wb2NVR5rwrhtpTulUSkXE99OMofTU9Q9gWDZGpd1WvtKSo6drQhmvj9jAmlyNqygZx3Qw3VPLIJUbNB81Ql7DPWyEEwWkUGerinqihj62NiZf1YvCBy4DKG2GiICDMRBfZVlu9vSmY7/HPLoeBHv7t9VZcdf7iRKh3N4hxOPQPM+8jNh9gN8WuEdjsdKmDIlKK3Lv1+jY5s25f+3Z2D0PdCOjirlOlPj76wwuDgHHQcWUD9ozLUU02e33mRvgMQfIUx+HdJtVbwQ+eg+K/uEzjb0bMQAal/W11fsS3ws0WNGFCfE27+q3nr217cS6h+CNOU8jOLAcBtfvx8NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SN7PR11MB7666.namprd11.prod.outlook.com (2603:10b6:806:34b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Mon, 11 Nov
 2024 22:15:19 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.8137.022; Mon, 11 Nov 2024
 22:15:19 +0000
Message-ID: <fa1c6aa1-af2a-4458-90c1-1c7fc785d544@intel.com>
Date: Mon, 11 Nov 2024 17:15:16 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/xe: Change xe_engine_snapshot_capture_for_job to
 be for_queue
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <alan.previn.teres.alexis@intel.com>, <rodrigo.vivi@intel.com>
References: <20241108174312.272792-1-matthew.brost@intel.com>
 <20241108174312.272792-7-matthew.brost@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20241108174312.272792-7-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0053.namprd08.prod.outlook.com
 (2603:10b6:a03:117::30) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SN7PR11MB7666:EE_
X-MS-Office365-Filtering-Correlation-Id: a16ae57f-c111-4f78-ce94-08dd029e53d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkdjWHhBVEVGbDNOaWVZc0o1YWl6QjNlS3JIOWpjSmgwYU9EdGZZZVZ6Vjh0?=
 =?utf-8?B?eXFMN3E1eVc5a2FiY0NIL2ZyaktLTlhJSnlFOWN5Nm1ETHM4MTRGRG5FS0Zw?=
 =?utf-8?B?MEtXekZ5UGFmUG1qYlI4azJnVmNMQlR5Y0J2TEVSSlBhSjhkejlFM3hUZTJB?=
 =?utf-8?B?QVdCV3pqNVZUdjJvMkJtUVpORVlybGw1YkhuSmVYY3cxL3UrdnJiNUpMTUpa?=
 =?utf-8?B?M041WFZnYmxsRkpyRjNsUVJ4cUtSbEMwM0hsS21GODQvVEZ3VDJjNG9FVy9B?=
 =?utf-8?B?RERkNDN2ZWU1eFVsSUl0YUNxdmU2OUhCYS9BQk1sQ043Q0tETG9QVllqQXNr?=
 =?utf-8?B?TENjME5aTTdyN01qM1ozcS85K0JsKzZQQ3B0Rm9uS3ZENTNYTFFiZEQ3YTFx?=
 =?utf-8?B?SHhNS3hPdWNGTHh1WElVR2QzcHdvT3VTN1lsTUtWWm9mOXFlbUc5bm9RNW16?=
 =?utf-8?B?elR0dnZUZzFFUXJlZExaVFdyMFd6dDVnaGZJVlljZzQ4eTFzZUZUYVlvempp?=
 =?utf-8?B?dXc5bTJhTVVIckI1Tk5KVDdmUlJwUzRSbzkzbGRJanJjT1B4ZUJ0ZFRJOWl5?=
 =?utf-8?B?QVp3YzB3bk1ZcmtwNmhYQXE3Q09CNitSYmFkTmpDRTFxTFJOOUNTT1A3NWha?=
 =?utf-8?B?QWJDOWZnSW5CVDRPRFhvd21mNFpWWkVwQnI3TUg2U2hmbWNUeVlzT3laSXFG?=
 =?utf-8?B?WTIzRDB0TmJWMVVFTG85VEtNYjhoQmE5VGxlekVNOEsxUzRJK0FVVFFTOWhZ?=
 =?utf-8?B?cUxoNW5XalVFaHlWSlJjZW9DQWpxQ0wrNjlScHZQM1NjdU5tNzcwVkJmU0NH?=
 =?utf-8?B?emhaaXNac25ISDZmVVg2NElUcUIwemptaFl0NWdPL280Zi8zQWJaMWJxTUNM?=
 =?utf-8?B?NHFVZXdzTkF2SGlPRjltbmcrdi8vR1N3UVBBNzBta3FMemFIY3hlOU1rcVpl?=
 =?utf-8?B?ZlZEWWJ1c3cwbnlUNndaWUxKQUJMazd4a2tlQVA1ZWpBTFphZ2F3TnlUaks0?=
 =?utf-8?B?NFlMbW03RC85ZUM1NzM0ZnBlL2tqYU5DRHN1VGZKOVNGV05xQTdKNU14elE3?=
 =?utf-8?B?dzlyQncyK05uOGJubUVWMUQzWnpzb0VKRHlOR1dnSDYrTG1FWWZuZ0NpMThB?=
 =?utf-8?B?UXQyQkxsVC96dXpXTWk5MVZkRnh5dHZENWVPdE45UjQ2UndYUG9ZTnRKZlli?=
 =?utf-8?B?aWU5QTNwYmFRMGtwSFQrUDdjTXJJY3dzTnl3Y1FiZFNmeEJEVnBpLzdRdFN6?=
 =?utf-8?B?eEhrMmptaC9HeW5yNUtnZWVzZEFGWE9aNTU1Z1piMXFmN3lOMGlQQTdVWVIw?=
 =?utf-8?B?UEJwR2lpbjJvckM5YnVpMmF4cU1KWGw3LzlEQzhSTHFpODlKL25xc1BaVEpx?=
 =?utf-8?B?bkI5ek1raUcyNWRyZHVwR2d5MVdrL05YWFhUUjFWUWQ1M2dXVnZONzhrZjRM?=
 =?utf-8?B?cmpJN0xOYXVSeHRocjRQczhXSFgrVjZGOTgxVUlpOVZBMGV0cEc1aFZJM1lO?=
 =?utf-8?B?SXdKaFZZNmxKODExSFRrenlUTDU3YXMxdjZOOUNPeWV0YTU4SlZBNXRERUxz?=
 =?utf-8?B?TDR4RWZ0b2lGenp2OWtESHFJeFRMekIwek9ydmpVWUlEb0FNaWc3SFJlNnNF?=
 =?utf-8?B?Z09jYkYycm1Xc1VveVloNlpHRnV4UXo5SGl1TllCODF3d1JaR2VnYkdSVS9x?=
 =?utf-8?B?cks2YmtHa3A0MWdaYjFYSXVSQTZSNnRaRkF5dzNzRTFQOURjNHVwalJUK210?=
 =?utf-8?Q?8hYcxi1A9QQbX0Gro+4Xjt/dAShC8tNM0VQ4rIy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2lGSEZlZ0tvbXdqL3ZQOHVEKy9mMjFiQkhScG0wZHFqaktkU0oxZHMxR1B2?=
 =?utf-8?B?TXZIN1d1TUlmcXQ2MmR5cjMzTTBDQ0U1Tm90cWJ3aWR1dVFVZmZPUEtLaElB?=
 =?utf-8?B?cE1pK0xweFZhekJLT24yNnNHY3JzYlJ2SXRhQmI2YUlMMDN2SGJYaUZvL2hQ?=
 =?utf-8?B?Yzl6U1RtZ0VwaU5MSERXK0JlZG1NNkMvZVhacGtOdVM3S2l0OCtuSS9PQzlq?=
 =?utf-8?B?YVliOE4vQ015L2FxUGFpRzlQekliK0ZTR0hWbVBiK1VTaDNrUFEvamFCNFlU?=
 =?utf-8?B?YXMzSnRvdGhvVDV0N1MwQ3NkcVYreHQzVG9EL3ZKY3dPTVB1elpQZHB1NDhX?=
 =?utf-8?B?VkkxT0h4S2dIci9obndOZXZjZml4MWJST0tGVkVkdDFoc0hRVGhud2Z6bUpp?=
 =?utf-8?B?YThiZExWRjlQTHdiZzMyeUZVS291dWFRU2tlK3FKd1pkbmdrb2lOZGdlVjF2?=
 =?utf-8?B?VHR3VEpIY0ZUclRyZy94d2hCVmRtNzdiTkxlVzROSUxYby85aFRmejhkNExE?=
 =?utf-8?B?ZkdrSzZkdVE0MU9MMkhWdkhFcmgxczBRMmF5bVR0VTdLcTFlVE1zVXJLNVJY?=
 =?utf-8?B?dUhFVEJpaUtOdTNDand1ZGc0a0JaK2MzT2pFOTVFd0I0eFpNZENkRFduVGls?=
 =?utf-8?B?VGcxY3lLUkNpTnJ4Q1FWUFJNUDNJZVZPeVRUbmRJc0laVGJZVEhMdklhUXpl?=
 =?utf-8?B?SFFJNWlIVzZpUmZDR0NaMmlraFpINEJGazgyMk9pOGJpd3ZBS21tOWZ6WnVk?=
 =?utf-8?B?dzI2MmczMndtdi80RktNZGRLR3QremFDZWU0Nll0YXlaazlBbVpwbjFHRVND?=
 =?utf-8?B?UHNhTXZDcDBQdmZ1L1B1V1hra0JOYlBqSFUzNUYyTkhqOElCZXYwRTM0ZG10?=
 =?utf-8?B?OVFqSVg5TTlNZHg1SHVTcld1d1NtVWNPbm9qYTlyOGRYelhpeHhuKytOYnZ0?=
 =?utf-8?B?MS9Id3FrRnpzSEhoSWJ0R0NqWGR2bHJ5dlFFNStkQzRxVFdVRVhSTm82NDl2?=
 =?utf-8?B?QU1XelBTOTk3bjMzeGkvRlJxVStRSExJdFg5MkltSEdOSUJsbGFmM3J3K09r?=
 =?utf-8?B?K25GalJHaTQ4Q2tVa3JvOUxOd29NMG1qaGJRbGNmS0FZbVpGY2UwY0lDZWoy?=
 =?utf-8?B?dW1hZmsyaDhWbHdJbkxGTjBjTXBDcEFnRHJUam45cGl3OHR0bjVUOXFuaTNZ?=
 =?utf-8?B?OThmTERiVE1NclRMQkY0WjlySFFZM2NsZHhHc2JCU1RyWWFZSnNjaVJGTXIr?=
 =?utf-8?B?UG01djdaRm1uVEFyK2liaFBLS1NXaHhoSEF0T2J0UDlhTTJkMTl1U1drck1w?=
 =?utf-8?B?cG5OR243WHFDVDB1VTJLY2MxRGNJa1RWdGRTWXcvYXpaRE5TMW5oK0YzNmJT?=
 =?utf-8?B?QlQ0bHpHTkZqaGc3L2FXT3BpT3hFOFBLQllhVVU2aGFkbGxITnRDeVh5V2Jh?=
 =?utf-8?B?dTlWekZOVDNjOEVjUVlXNWpjaUNRbWVLWjlLMXE3L0ZOWEFJaUJWWjdTNCtY?=
 =?utf-8?B?aXRuZTlYRE9HSlVWVFA4WDdqaFNBSzQvRllvOVdrd082SnIvTm8rNlp1dnlV?=
 =?utf-8?B?MFlIaFVYMTRNYzhzejRTbG9zNTM2WWdXWitaNDJQdnhzT3VvWXVmWGI4SjZa?=
 =?utf-8?B?R0FVNVJZRWJNNktLcEpFSHo0YXZSYTNSaDJlVFFjMzlGa3dvdGhHb1BCU1Ja?=
 =?utf-8?B?SGFQOGZlakNDaTZrcXUxYlJTL1lFeW5jemNjMU9lZmxEbkxmT0tNOTkzbUE1?=
 =?utf-8?B?Y3lRQnJBaW8rNVJ5d1I1bHlZaHVxNEtCWjBCbSszR21Cd2IrVW9WUVpwRE5r?=
 =?utf-8?B?TjJETXk3ZTBtajhVVzJJZGRxV0lmMjgrRTZ3RTg5MndrUkdnWlVTd1QzUE1V?=
 =?utf-8?B?eDhDdE5SUnRaeklKcFFqVmcwZUFYQUlaZFhGYlA0NXNNaXk5M1gxdUx0cEpN?=
 =?utf-8?B?NlFqZVErQUFOeHlGV2NPVytIb2JRZzlMUmRZUXRPY1lERmxRZTVZWnE3RnFw?=
 =?utf-8?B?aS80T1ZDRmVEVVpkR3dqbFpleGIzU1R1TDlmdnpPdW5QUU1oNmFIV0FTVlBE?=
 =?utf-8?B?S0E4Zi9hdWFRZ3VseCs4MmZXUWd0M0Y5YXdnR2J2K1U4SXdKZ3pmZ052ZFVt?=
 =?utf-8?Q?NeJYao7C1TSZTFfKndRZ0ok57?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a16ae57f-c111-4f78-ce94-08dd029e53d6
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 22:15:19.2969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YFEX83XT8eknUKPFpprLfZzbajfXRsDbtH2uaSCun+nO98dZtfiOLUidk1xsTl6IQNb8RvTSUfTON0K+vqEMGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7666
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

On 2024-11-08 12:43 p.m., Matthew Brost wrote:
> Add job may unavailable at capture time (e.g., LR mode) while an exec
> queue is. Change xe_engine_snapshot_capture_for_job to take a queue
> argument and rename to xe_engine_snapshot_capture_for_queue.
> 
> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_devcoredump.c |  3 +--
>   drivers/gpu/drm/xe/xe_guc_capture.c | 28 +++++++++++++---------------
>   drivers/gpu/drm/xe/xe_guc_capture.h |  6 +++---
>   drivers/gpu/drm/xe/xe_guc_submit.c  |  4 ++--
>   drivers/gpu/drm/xe/xe_hw_engine.c   |  8 ++++----
>   drivers/gpu/drm/xe/xe_hw_engine.h   |  4 ++--
>   6 files changed, 25 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index c32cbb46ef8c..dfa946a3793c 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -282,8 +282,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>   		ss->job = xe_sched_job_snapshot_capture(job);
>   	ss->vm = xe_vm_snapshot_capture(q->vm);
>   
> -	if (job)
> -		xe_engine_snapshot_capture_for_job(job);
> +	xe_engine_snapshot_capture_for_queue(q);
>   
>   	queue_work(system_unbound_wq, &ss->work);
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index cc72446a5de1..511a8e40d521 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1793,29 +1793,27 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
>   }
>   
>   /**
> - * xe_guc_capture_get_matching_and_lock - Matching GuC capture for the job.
> - * @job: The job object.
> + * xe_guc_capture_get_matching_and_lock - Matching GuC capture for the queue.
> + * @q: The exec queue object
>    *
> - * Search within the capture outlist for the job, could be used for check if
> - * GuC capture is ready for the job.
> + * Search within the capture outlist for the queue, could be used for check if
> + * GuC capture is ready for the queue.
>    * If found, the locked boolean of the node will be flagged.
>    *
>    * Returns: found guc-capture node ptr else NULL
>    */
>   struct __guc_capture_parsed_output *
> -xe_guc_capture_get_matching_and_lock(struct xe_sched_job *job)
> +xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
>   {
>   	struct xe_hw_engine *hwe;
>   	enum xe_hw_engine_id id;
> -	struct xe_exec_queue *q;
>   	struct xe_device *xe;
>   	u16 guc_class = GUC_LAST_ENGINE_CLASS + 1;
>   	struct xe_devcoredump_snapshot *ss;
>   
> -	if (!job)
> +	if (!q)
unneccessary, there is !q check 2 lines below.

>   		return NULL;
>   
> -	q = job->q;
>   	if (!q || !q->gt)
>   		return NULL;
>   
> @@ -1827,7 +1825,7 @@ xe_guc_capture_get_matching_and_lock(struct xe_sched_job *job)
>   	if (ss->matched_node && ss->matched_node->source == XE_ENGINE_CAPTURE_SOURCE_GUC)
>   		return ss->matched_node;
>   
> -	/* Find hwe for the job */
> +	/* Find hwe for the queue */
>   	for_each_hw_engine(hwe, q->gt, id) {
>   		if (hwe != q->hwe)
>   			continue;
> @@ -1859,17 +1857,16 @@ xe_guc_capture_get_matching_and_lock(struct xe_sched_job *job)
>   }
>   
>   /**
> - * xe_engine_snapshot_capture_for_job - Take snapshot of associated engine
> - * @job: The job object
> + * xe_engine_snapshot_capture_for_queue - Take snapshot of associated engine
> + * @q: The exec queue object
>    *
>    * Take snapshot of associated HW Engine
>    *
>    * Returns: None.
>    */
>   void
> -xe_engine_snapshot_capture_for_job(struct xe_sched_job *job)
> +xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q)
>   {
> -	struct xe_exec_queue *q = job->q;
>   	struct xe_device *xe = gt_to_xe(q->gt);
>   	struct xe_devcoredump *coredump = &xe->devcoredump;
>   	struct xe_hw_engine *hwe;
> @@ -1887,11 +1884,12 @@ xe_engine_snapshot_capture_for_job(struct xe_sched_job *job)
>   		}
>   
>   		if (!coredump->snapshot.hwe[id]) {
> -			coredump->snapshot.hwe[id] = xe_hw_engine_snapshot_capture(hwe, job);
> +			coredump->snapshot.hwe[id] =
> +				xe_hw_engine_snapshot_capture(hwe, q);
>   		} else {
>   			struct __guc_capture_parsed_output *new;
>   
> -			new = xe_guc_capture_get_matching_and_lock(job);
> +			new = xe_guc_capture_get_matching_and_lock(q);
>   			if (new) {
>   				struct xe_guc *guc =  &q->gt->uc.guc;
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
> index 97a795d13dd1..20a078dc4b85 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.h
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.h
> @@ -11,10 +11,10 @@
>   #include "xe_guc.h"
>   #include "xe_guc_fwif.h"
>   
> +struct xe_exec_queue;
>   struct xe_guc;
>   struct xe_hw_engine;
>   struct xe_hw_engine_snapshot;
> -struct xe_sched_job;
>   
>   static inline enum guc_capture_list_class_type xe_guc_class_to_capture_class(u16 class)
>   {
> @@ -50,10 +50,10 @@ size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc);
>   const struct __guc_mmio_reg_descr_group *
>   xe_guc_capture_get_reg_desc_list(struct xe_gt *gt, u32 owner, u32 type,
>   				 enum guc_capture_list_class_type capture_class, bool is_ext);
> -struct __guc_capture_parsed_output *xe_guc_capture_get_matching_and_lock(struct xe_sched_job *job);
> +struct __guc_capture_parsed_output *xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q);
>   void xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot *snapshot);
>   void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p);
> -void xe_engine_snapshot_capture_for_job(struct xe_sched_job *job);
> +void xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q);
>   void xe_guc_capture_steered_list_init(struct xe_guc *guc);
>   void xe_guc_capture_put_matched_nodes(struct xe_guc *guc);
>   int xe_guc_capture_init(struct xe_guc *guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 974c7af7064d..3df8543deec1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1066,13 +1066,13 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	 * do manual capture first and decide later if we need to use it
>   	 */
>   	if (!exec_queue_killed(q) && !xe->devcoredump.captured &&
> -	    !xe_guc_capture_get_matching_and_lock(job)) {
> +	    !xe_guc_capture_get_matching_and_lock(q)) {
>   		/* take force wake before engine register manual capture */
>   		fw_ref = xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
>   		if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>   			xe_gt_info(q->gt, "failed to get forcewake for coredump capture\n");
>   
> -		xe_engine_snapshot_capture_for_job(job);
> +		xe_engine_snapshot_capture_for_queue(q);
>   
>   		xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 1557acee3523..0cfa2b9282be 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -829,7 +829,7 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
>   /**
>    * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
>    * @hwe: Xe HW Engine.
> - * @job: The job object.
> + * @q: The exec queue object.
>    *
>    * This can be printed out in a later stage like during dev_coredump
>    * analysis.
> @@ -838,7 +838,7 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
>    * caller, using `xe_hw_engine_snapshot_free`.
>    */
>   struct xe_hw_engine_snapshot *
> -xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_sched_job *job)
> +xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
>   {
>   	struct xe_hw_engine_snapshot *snapshot;
>   	struct __guc_capture_parsed_output *node;
> @@ -864,9 +864,9 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_sched_job *job
>   	if (IS_SRIOV_VF(gt_to_xe(hwe->gt)))
>   		return snapshot;
>   
> -	if (job) {
> +	if (q) {
>   		/* If got guc capture, set source to GuC */
> -		node = xe_guc_capture_get_matching_and_lock(job);
> +		node = xe_guc_capture_get_matching_and_lock(q);
>   		if (node) {
>   			struct xe_device *xe = gt_to_xe(hwe->gt);
>   			struct xe_devcoredump *coredump = &xe->devcoredump;
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index da0a6922a26f..6b5f9fa2a594 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -11,7 +11,7 @@
>   struct drm_printer;
>   struct drm_xe_engine_class_instance;
>   struct xe_device;
> -struct xe_sched_job;
> +struct xe_exec_queue;
>   
>   #ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
>   #define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> @@ -56,7 +56,7 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe);
>   u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
>   				enum xe_engine_class engine_class);
>   struct xe_hw_engine_snapshot *
> -xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_sched_job *job);
> +xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q);
>   void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot);
>   void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p);
>   void xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe);

