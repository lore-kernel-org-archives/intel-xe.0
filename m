Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B30CD3439
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 20:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7FF410E1F0;
	Wed,  6 May 2026 20:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DbGd7Mtf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7C110E1F0
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 20:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778099129; x=1809635129;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9cQPxvskoExd/LHVFu7ZYKK2Wu2MxYeRShwljh741Tc=;
 b=DbGd7MtfTPvzlcUhfaYG2FkKKQAqIBd4rhRlrvRFFL10DoeOsL9TWmNF
 iReAUaeXN6jp55xIhw0VMOwq2QguLdYfL7pihe7BmPOTuHGwH1P9HgpM7
 wsL5fPeVEGp+M1toT6T7BkN30CvBg8ZPHFXEXtGfh75GQ/hybx2fq/O3Z
 HFpJ1OaHEXTP3nCNGfx7kdF+8TVWZFWkfRCOE7mK/++Zb3eR1j4z4Jt8E
 zRVsmw22lBQ6USK0QZDkDLUZyBJwmNJ232uGCpnK4LGoWEphDdYX+f3Be
 Y/NFSq56Lcq+ZEReciOzjBn8en6I6hdBDocyonWB20goXh97a1ivTckjP w==;
X-CSE-ConnectionGUID: kkYeD9g2TQqG9Twpr2TPEQ==
X-CSE-MsgGUID: MmKXFukORSS2IZApGT9WdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="90142971"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="90142971"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 13:25:29 -0700
X-CSE-ConnectionGUID: /H4CNTxMSkOKz9M+V1Z46A==
X-CSE-MsgGUID: 5HNofVbcS9CYv8y0LkIoTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; d="scan'208";a="274369016"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 13:25:29 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 13:25:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 13:25:28 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.9) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 13:25:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h7ZgXpOU7hWk+QuDMAE5eSXKf5/sjEv5Y0Njhs+xKpg1mIZrrqEbAe0MLFNf05S+oGqmIbDtzT6a+/zlEsuVjEe6hxbhQqLBDL3hDaXNdaumSDOh9dbM44wjxkAsyV24LuSmaycsNVm+c3viuU6zsbsl6HxA5HIpfjrH2/NwW0WTUf6sRWCU/yC+0kZcwckK+/i4F8YmBWDRY+7jc4wgzh8JCtb7xFzwgHYB8EDejdGetJqTri+lWkrhhv5J/uKGGCyOmFrQBVBPMpHmD2EZ09EJBGWod6vr/gsDHoS4wWQ2jCw6fytWv+uazjwIWR0S0Q5VnwoBEQTlYVZIsg/UMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7b/OMI7+3HmtVLrVWuNDx5DFONrsPvk5Hq0ZqTXzJU=;
 b=H42qmaguR1CDDjP2xvYebR0siCRVH3Et7sEeyfvIpgmr/IEVTJVdsq9orlFJ1JazyzEZ9cmcY/KhDMSUSfW/NG8iN+99u/Hh3UVP1ilPe/b7fOmJnhTlSnwmnE4TZMa9fftQeL+XlxsQFXtgkjk6J1dAmBatlYgMITI7cgItG7k7SjgdM52+sZNaUCgzH9Z4VF4Z8J3AqCYQRKDaLsMc7Bbb9WVQejen8Lahjbzl1t4sQZmyxuT9VroxEtAPPACCfWLD0wJSm8dhapcH+/Twk83tQ4O7EUSoWwuPp6ALFKHspVjZRVE8EOoiSztpzjLfACc4EIV7lRJ9EkWvypIqHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH3PPF5A636EDE4.namprd11.prod.outlook.com (2603:10b6:518:1::d21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 20:25:25 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%4]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 20:25:25 +0000
Date: Wed, 6 May 2026 13:25:20 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v3 09/11] drm/xe/multi_queue: Add trace event for the
 multi queue timestamp
Message-ID: <afujsGKgg9jKKLJ7@soc-5CG1426VCC.clients.intel.com>
References: <20260505234408.3552147-13-umesh.nerlige.ramappa@intel.com>
 <20260505234408.3552147-22-umesh.nerlige.ramappa@intel.com>
 <afrLnnwqAkKeNNjn@nvishwa1-desk>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <afrLnnwqAkKeNNjn@nvishwa1-desk>
X-ClientProxiedBy: MW4PR04CA0280.namprd04.prod.outlook.com
 (2603:10b6:303:89::15) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH3PPF5A636EDE4:EE_
X-MS-Office365-Filtering-Correlation-Id: 9067fb6b-3f26-4526-830d-08deabad9ae1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 20AoSzHOVp1pUuqkWYmIBAdN0uvfXCBnMiaadI8YXmuK2ytCCwPNClHv7u1Qm7g1vi2ePOZYfLpYX+yW4toYKXUYJ35H5blFVu6aVA1zT7/SKYKyYZyYHcEMoq02zehS7KLY6nU4Ai6xqKEPX02Vak6y2PqGXA5KR3im4/PalaTCRHZ7uvX6FgRjO/G5z+Wx3VxczPAh+JrPcHNHlS03LANYH53l2v1zo1XiidjS+obm73/NyiuKwKI4I2UR7lmQxK1Ob+gzMxZY8hxgAOjzY1K8nzUHahX5ZJ0qap1nQaSfrfGyo5NzWB2lWsYObFc/45PI6AAkINRRbPuwFe3sNd0haMb78a89vLMWNrBEQyhsbkt2OZlrj5GrhrEeyOYljZebUReHGvrDbgV5qEOh6O9ARA3iFzmY/px35rilvxavuXlcytLmGDNOS4+mXHLiXs+EoqssRMafqSKLCMLRdFbd73WE1GZR2GG/ANv1N1ROOgcgurvmDNvSUC+fzTD7PBkZw/OhTzThFypsPUSwIjDIyKwtCpg5CsCOPVV2LmFOKAY19qL8urMdo66uReBSWYG9PBIZjQlDDohTve8OwxWnyCDnvHE5CIE3fjbT0inWgT0P3b5JxrtU7dIsTo2o5hfo6kOYKYYad1TAcy0d1F5VC6dgPP+X7xPzOTxI9D7qLLRkyO5Xb8h3cBNCSiCZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzUvQU8wNGVYOTRLME1iaE5ab1FLbnBDMEVKWUJDaC8xQUtYc0RmaEgwU1ky?=
 =?utf-8?B?N1p2ZTErZmMwdkQxaEpqckgzMFVUSC9mOGI5WTFwTFRQdnJnV2lFUFVscm5K?=
 =?utf-8?B?NUczOTc1V1M4QkVwQWtGd2Z0S2hpa2oxZzBPRngvNXZ6bGQ3R2tsU1F2OTBt?=
 =?utf-8?B?NlR4aW00K1k0U0R3cW5XN3NFOVpkU1hSSXAzc3Zpd0x0WUo1eEd6WHdLQkxL?=
 =?utf-8?B?TzZuSmJCUUNpOGR1K3FIbHNacm1MMjd2OWgxQi9lcGFXdU9kam0zcXpQbGNj?=
 =?utf-8?B?ZkYrWVBTSXVCdjZZZk54OW9uRlBqaTNkL0lNQUtNNWhQWExsK0R1WDJyMDdl?=
 =?utf-8?B?SzVFbmE4cjQ2YUJvUU5iTklubkYrWHZ0U1JJdUVUOGl4VEc4bEg0ZnJ0M2J6?=
 =?utf-8?B?Zm1lR1RaV0tuNXJ5TWZLMEhwREVJczU0Y3FNZEQ5RjFoMEg1VkR5cDdpNGh0?=
 =?utf-8?B?QzU4RmVCWjZYd201VTBaYVhzaXQ2VzhKb0VwNE1RcjVmNmtUa3FvTGt3NjEx?=
 =?utf-8?B?QWtEUjJtdk1Kd0Rldnd6elNlSHRKeTJWTlVtL0dRVnlqNjk1ZXVWRjAwa01j?=
 =?utf-8?B?UVVCdWxKcTZzYzZHenBDeU9yRXBqZHVmVjdGdlFsRzFNZnpuM2cweW8rUlEz?=
 =?utf-8?B?REE0OFhXQ3V4VjRvbmRZbENVSW1Tdjh3NXJvdE1ueFpFTk9mdkhjcWJ0ZVNt?=
 =?utf-8?B?Zm1hNTRnQUl0WW9OVDdSUTg2OWZXWEx5NU5QNDl1Q041dWdUU3d1dkEvQUJP?=
 =?utf-8?B?aVRIMVVLOGVWUDlsN3lWUExpUjZUTDMwWWpLOXk3Ti9PWUJLNnJqa1hCVmRj?=
 =?utf-8?B?NlBBaGxWWkFjWU1kS2RTbHBLakRHclE1M0hBYVkxQmo2MHNJTnM5NEhKTDR1?=
 =?utf-8?B?NDBBeU8rRUhkbWhKV08yTHJRdEQ2R1ZiWUtab0huS3g2WHppK0xnOG1sbmpU?=
 =?utf-8?B?dU55ZHZqUUdITVVhMk44K2hxeHR6SVFmKzlFN2dScGsyRzQ1ek5hcVYrVnVr?=
 =?utf-8?B?S3BsL0c5cnJiNjRLbTV2LzYrM25tQmFPR2lzMkNuYzRWaUxHRC9hb0NucWI4?=
 =?utf-8?B?V0lHczkweGpjNjFlVkhTYnZ6bnZ0bVU1enJxTjB3eWpxd2VDVTVjbktPRk1q?=
 =?utf-8?B?ZnVXSVNyT0ZJaWdZSm1MME02S2o0R1h6eG9kNkcyNUY2eFkyMUFiNmpUOTNJ?=
 =?utf-8?B?ajdaTUpBQ01HSFdXVzlMSkQxY3VpNVAzNDJwcTdhMmtuOVNNRUF3NVU5RUlD?=
 =?utf-8?B?cmk5QXBvc2VWM2RydWd0b1ZzTVFNdE5XSXBRSzJkSGZqSkpsNnQ1Nk1nekNH?=
 =?utf-8?B?K2FMZ0tvWFJZU096UlNmb1MvMjl3VjVRVHg1S2VURnBjcnFvRkkvbTNVZDRQ?=
 =?utf-8?B?ZnhUQWhORGtCZkorNlNnWUl0YTQzVG5TZ0dmZ1l2bVUxNmRiVWI2NER4d1Av?=
 =?utf-8?B?cWFNbk5NQlZOMVZ0Vmw2SkpadnBHOUlHalhvQXFJbTZkRk5YVnNkNUhVNVk5?=
 =?utf-8?B?RUNZQmJqL3VXZ2FJVGRvS2l3QnV1cVdsb2g2ZGJIM2Q1eDIvRHRYRmF5cWsv?=
 =?utf-8?B?NTNJb0RlcEZHSlJtcDdhN3k4TE04QzBXWGpuSTZ6bkR6UlVYbVJVT2t0WnFn?=
 =?utf-8?B?TXBmRDRzWUJuNTdKSTdsb0VONGhFU2VRcjI3dWhIV2FDOGo5elNLSDF6aDhV?=
 =?utf-8?B?UWpDZUhtNStKa0drQ3hzb1NNa21VSG84aENwTlZsV3d3NEV5VktxbWY2SDVa?=
 =?utf-8?B?SjBGbGtTNnAybEEzcVB3RTQxdTVsWEFoZWFxNU5rS2ZwWTBQS0hCTkhkSFQ1?=
 =?utf-8?B?R3VGSklLdFhQaUtjKzRBODN4b2s1YkxUblVFcTh6L2JqS1lwYmdNamo0RjFP?=
 =?utf-8?B?R2Q3TjFTWFg3OFZPL3Z6eUJNRzdxQlE5YnN4VlNBUW9VOExsRHo5bGU2WjVi?=
 =?utf-8?B?aXFQOWt0R2VuZnVGb0QrZnAvTlBraFI4Mi96VXEyZ0l3TVZCbHNMMm5jNGJV?=
 =?utf-8?B?VCtrbHhvbHZONUlYT3E4TjY2R2RtTUR3RHg0d3FES1V6Q3E4bkRubnFHTmZ1?=
 =?utf-8?B?V1NLd2kwTS9kM2lXdWc1SjVWK09ZaUJWQkxnSGlGcnA0YWhFb0crNkg5a2xi?=
 =?utf-8?B?OWNleVluYndDZDQ2bjg5L1hZNCtRdllZbWlCdHZrWlk5dlhGT1Y2OGROUkV0?=
 =?utf-8?B?UDZkWmhaQjg3L3ZKZThMUmlvV29HRUFCbTVmOFc3UUJSRHZKK05yaWU2NW1w?=
 =?utf-8?B?MjVETTlhOHcvVTJZanZVSnhWQnUzZW5lT2pWMDQ2S1F0R3hBNU02U295dWlP?=
 =?utf-8?B?VkJSaDBHSW80dWc4SCszWU93ZCtxQk5OQVBwR2ltaCsxRENVNnNZb0pESHZQ?=
 =?utf-8?Q?t+9C5rECVMAobEptejUgBnX2FrJozZn4lPqcr?=
X-Exchange-RoutingPolicyChecked: n8gWhZtMjkikN0C+SGzRiO4FL58Q3BRizFDOOH5thI2L5mZs1HOcksIT/OTW791zZADoiWbCW9hBfYouRAfUnA9BxVJRPgF+s7MWq95x7+I8d0ypGRc06eKENlV4P/3UhZ5c2SeER/V9X6miF2AzAnyq0x5rXQOUxneSneVFb2dUBZHwB6zOWn8bb91qOxINNhvZXtBj3SwG1HN3aTZ7eP0ypXvxaKdLZNSQvx3LFcZZQAK3iZmh+4WEEMaD+yiqiFwTVvtee+5qQUJYvwM8XRWzZNkZtnGJbF8xqFOs+E9ZQ45NXuvYpzZrD6vNGOWV7E1ddoTJ0HLQziQC4eEObw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9067fb6b-3f26-4526-830d-08deabad9ae1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 20:25:25.0894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4XcUDMruTtpHthCt3qM2zIfIACjRetGebAYZ5bUyOr6M0tzupfBaPz779qysKTZfCdzPnPti0jARj6MPu82nbQXR+hEZnn1fMMtqAUzUmUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF5A636EDE4
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

On Tue, May 05, 2026 at 10:03:26PM -0700, Niranjana Vishwanathapura wrote:
>On Tue, May 05, 2026 at 04:44:18PM -0700, Umesh Nerlige Ramappa wrote:
>>Add a trace event for multi queue timestamp capture.
>>
>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>---
>>v2:
>>- Split traces from original patch (Stuart)
>>- Print primary lrc in the trace (Niranjana)
>>
>>v3:
>>- Include primary_lrc as well as lrc in the trace (Niranjana)
>>---
>>drivers/gpu/drm/xe/xe_lrc.c       |  2 ++
>>drivers/gpu/drm/xe/xe_trace_lrc.h | 29 +++++++++++++++++++++++++++++
>>2 files changed, 31 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>>index 28060a3d4f11..ea65160a582a 100644
>>--- a/drivers/gpu/drm/xe/xe_lrc.c
>>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>>@@ -2700,6 +2700,8 @@ static u64 xe_lrc_update_multi_queue_timestamp(struct xe_lrc *lrc, u64 *old_ts)
>>	*old_ts = lrc->queue_timestamp;
>>	lrc->queue_timestamp = xe_lrc_multi_queue_timestamp(lrc);
>>
>>+	trace_xe_lrc_update_queue_timestamp(lrc, *old_ts);
>>+
>>	return lrc->queue_timestamp;
>>}
>>
>>diff --git a/drivers/gpu/drm/xe/xe_trace_lrc.h b/drivers/gpu/drm/xe/xe_trace_lrc.h
>>index d525cbee1e34..4f3c1a0de573 100644
>>--- a/drivers/gpu/drm/xe/xe_trace_lrc.h
>>+++ b/drivers/gpu/drm/xe/xe_trace_lrc.h
>>@@ -12,6 +12,7 @@
>>#include <linux/tracepoint.h>
>>#include <linux/types.h>
>>
>>+#include "xe_exec_queue_types.h"
>>#include "xe_gt_types.h"
>>#include "xe_lrc.h"
>>#include "xe_lrc_types.h"
>>@@ -42,6 +43,34 @@ TRACE_EVENT(xe_lrc_update_timestamp,
>>		      __get_str(device_id))
>>);
>>
>>+TRACE_EVENT(xe_lrc_update_queue_timestamp,
>>+	    TP_PROTO(struct xe_lrc *lrc, uint64_t old),
>>+	    TP_ARGS(lrc, old),
>>+	    TP_STRUCT__entry(
>>+		     __field(struct xe_lrc *, lrc)
>>+		     __field(struct xe_lrc *, primary_lrc)
>>+		     __field(u8, pos)
>>+		     __field(u64, old)
>>+		     __field(u64, new)
>>+		     __string(name, lrc->fence_ctx.name)
>>+		     __string(device_id, __dev_name_lrc(lrc))
>>+		     ),
>>+
>>+	    TP_fast_assign(
>>+		   __entry->lrc = lrc;
>>+		   __entry->primary_lrc = lrc->multi_queue.primary_lrc;
>>+		   __entry->pos = lrc->multi_queue.pos;
>>+		   __entry->old = old;
>>+		   __entry->new = lrc->queue_timestamp;
>>+		   __assign_str(name);
>>+		   __assign_str(device_id);
>>+		   ),
>>+	    TP_printk("lrc=:%p primary_lrc:%p pos=%d lrc->name=%s old=%llu new=%llu device_id:%s",
>>+		      __entry->lrc, __entry->primary_lrc, __entry->pos, __get_str(name),
>>+		      __entry->old, __entry->new,
>>+		      __get_str(device_id))
>
>I still think printing 'pos' here does not add much value (we are not printing it in
>exec queue trace event also).

ok, dropped pos

>
>BTW, why do we need ':'s before %p? I see it is there in xe_lrc_update_timestamp(),
>but that seems to be a mistake (I don't see other trace messages having it while
>printing pointer values).

Not sure why. I have removed it from xe_lrc_update_queue_timestamp. I 
don't think I can remove it from xe_lrc_update_timestamp since that may 
already be uabi.

Umesh
>
>Niranjana
>
>>+);
>>+
>>#endif
>>
>>/* This part must be outside protection */
>>-- 
>>2.51.0
>>
