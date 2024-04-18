Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B01C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 18:24:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1E2112CB9;
	Thu, 18 Apr 2024 18:24:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PJlP/rkl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367BD113ED6
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 18:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713464680; x=1745000680;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5QkBwfvWqq/RSMwx+ZlCPftN5OuHR1UrSYMRBnRYxuw=;
 b=PJlP/rklktEO8cFMbJgV2KetIPLrMIkkuw91YjKYx/JrMjEJN7604DjI
 dTlXU/Wuxn4Yt9EJPPrLjvLykjfXBhD3099c0+I2N15scSgbqxQKJngS+
 bpYiQ/5u6WVGlSk18qxWA9dJAHyFatUGmrdDUPLgwe8k6lF0+0Ue1blqR
 4saY3oywI6dMzOYuBoDaBrXaq7L+TmrpGe1xGsaFgHZRqJl60LBF4LB8V
 HzvOROrj0cVOZqeCNa0YAuGXPVDgj397DoCGm3DhFlEMjY1+SiWNxlRcS
 fagAi/GUGs/UyRJcVoXwKj6Ndnd/bqC92DQDHHxyFwNLybKVB4gCx6HjA g==;
X-CSE-ConnectionGUID: IgSkMMAjSSadnKD0xnkalw==
X-CSE-MsgGUID: WTHPopZbRG6nVuxmb74b7A==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9205099"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="9205099"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 11:24:38 -0700
X-CSE-ConnectionGUID: KLLVsOLSTBWPdaHrbg1GUA==
X-CSE-MsgGUID: qQc7oPVxSaKlN7poTersUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="23591247"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 11:24:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 11:24:37 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 11:24:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 11:24:36 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 11:24:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NbdgeiFLT+TWgHmGMP8RJLsGSJ2HujXYGrkqkBP1THvhzgn6CbqaUrPDKW+IRF4AIfesN20WB7qNbWiacLsKDmV+Z3MuVc8WKLC6fiYbsJySzhKp7Bc9qHdHslTNwMVyk14b1A5ls+RxS0Z36KTuGNGSy3hocqk6s/dtoov8oLZB0bRnOKY+5N9A5z0EyKcgs4Cnkd+OS9UutxL0wSyglQnqos/4a/VRRIMUsV/Em2AOrtjiLLA291Obqv+854ByBLg6nWoJa9S2hO9j4b8gnsMPp/uU8TATngq0D38Ya62ggZBYKwNm5pj1pJEAaYUcrkQ/xvAUfO8+vqBcimtNEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JeBF5TzgmBM87YjktlRsJJy906ZM8ql3wRnvU8b2RXU=;
 b=BE71z5NuQc+KrFw99i+vf5XxgfKmGG7GKVJ8MfCpH5CEJlM7IhMwrjbe7F9abc8pS1s0yPxuQlyGJ/bZTc3m2QpFM5Has36IGdBNwb+DHmg0J5T70HqlB2JL+eKONeTMgwJc3k0GUwGJP/cdkh2zABBnK6MAcO0hODbzvsN+C9FUXdME7z5s2v0ygjEGd4T8inuPS+Lc9gVy7wgPAFw1NI6IHETwNB27SCptam5GWFZh9EhDCR7aulews1kGJIWVaybAExPXd1LQh41gAKXj4ir2raFidFg92wIuq87ZjiI5WdT7muWun0EfhdjSGOaldW0C3sZSSHraesSbo1QPcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY5PR11MB6092.namprd11.prod.outlook.com (2603:10b6:930:2c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.12; Thu, 18 Apr
 2024 18:24:34 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551%7]) with mapi id 15.20.7519.010; Thu, 18 Apr 2024
 18:24:34 +0000
Date: Thu, 18 Apr 2024 11:24:24 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH 5/7] drm/xe: Add helper to capture engine timestamp
Message-ID: <ZiFlWK+wr9/UkTz2@orsosgc001>
References: <20240416030454.3739862-1-lucas.demarchi@intel.com>
 <20240416030454.3739862-6-lucas.demarchi@intel.com>
 <Zh8CHQe/yx3+j97L@orsosgc001>
 <z57tq4ejkkjfo2wsn5dqnf65qmaqt42sgdlquwurv47ikrazwy@ex7tjuv3opbn>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <z57tq4ejkkjfo2wsn5dqnf65qmaqt42sgdlquwurv47ikrazwy@ex7tjuv3opbn>
X-ClientProxiedBy: BY3PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::35) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY5PR11MB6092:EE_
X-MS-Office365-Filtering-Correlation-Id: a6ad32ab-51ed-4c7f-6be5-08dc5fd4cbdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: WAF6zc7IWek7ulpJ2pxUtIQ6k24Ry4+Q9UGvcjBk0MmYOOwFcXEKVjwjt0t0qh4WtdkFEcqSXezfOYJuulqyi0MEApffROh+uuw8tHl7a5w5H4v/1Sj10lYLexEhvc85/7rAPn3sR9AOyF2LImzZ0A9PMINjI8kCNofx+1SCu7SB1AMqQzak7DDBTSXlsvIInt2KN/7pXWcuEGJVCbmEN8KPTby1XDqCT5xa0OJ+ucfuOE6/NEbtpcug+7expBvh89aHG5IpC3cyQHujPor7wVmpcWPAGzhkMr0BC1VUrVvcfMYCzz8JG6kk63Da8X3eCNSEE8BS27w/Wo8yzSHEs62MzTy66D5drNbtF8NeZIPQxliUf9CT72VdT5R7HE1bWkivjICoiwevSQ6+wqfkigfE5PJzOoD/WCnDpbGu+XPbwTzH8g3DVkVQlzsxazgaZFQN6g7lgdrwMsbJjk4jEnMh0Lo9C1OyAYaJOzcGBTe0Wvar1pmby6SM61AnpKrPOJXW44HSuLUq981KiVlZzQyw8T6KngyeOyUdXfMlA+wLI20hhmjTERDQpDlCY/q/fvpvP+8E3E5JvFahrxnTqRYc5W0efOg3ovL1339I13ENLosulPK6opzG7f2eIrsRiFG4SGEeIOnHsTYtGAh4xxFgfRpHP5va2PgAKdHRYU0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anE4ekg5dDQ2QnhVdUZjVi9TczZmUVU1R2JUbjgzaHZ2UnhoOVo1dm1nNGVT?=
 =?utf-8?B?U1FndzJPbDA5R0RsVzZxN3pjVm9BMVVpV09JLzlDS0plT3lpckl0c1o4YTZ0?=
 =?utf-8?B?QWNzRERlYkpsN3FnTHFWUzFZdFVSaUwzeW9Tek50UnR5S09XNDRPNGxRYllJ?=
 =?utf-8?B?MUtXUFZsbUxVSExGODl4anZrOXdXdHhTVGZSbmVoNkZnNkdBNkxMMGR4SHhj?=
 =?utf-8?B?M1haalRLd0JPK0xlYTJWYjNRdHhrOW81bTdQMWs3akxDQ0prTG9tZSsrNWF3?=
 =?utf-8?B?VWc4WU5BRm5QT3lxRXREZGVoMWsvMXBtVTFhVjNab0xKaENBa2hpQlZEYmV2?=
 =?utf-8?B?cnVSalhFdmJXNytycHlyTmR1em56bDQ0dS9yVnN4ZWlQTXNMbWt1cExhRXpN?=
 =?utf-8?B?LzJkWVkvdXJrbHB6eWRYTXNWSmtBWHBGWDVkVTdsSHVVRkMrK3NWSlJ3WmFy?=
 =?utf-8?B?RFJObVpFWCtCTXN0Q1BqRzZpN3RUMG9pTU1KYU1FdldLbjluS2dWdXRqZENt?=
 =?utf-8?B?YW5lUVVYRXZZNWx5aytyWlAyRlNocUwxUEJsNWcxU2xhbnhXTzNnVnFoSktl?=
 =?utf-8?B?WUVkOTZNZm1pZS80TWlxN0ZDVkI0MGcveWREbDl6TGJza2hwZnlicjB2UmNC?=
 =?utf-8?B?R3E5NCs2Tmluc1FLL0VHekhGRzYyRWdVcXlaYjNyU0l3RUt4dW5UZ2dFeTZh?=
 =?utf-8?B?TUdiN05tTVhWalllWTdmbkFqcm9vK05ubUpnbEwxOC9KMXNlUGFNYnpLdmRO?=
 =?utf-8?B?RzFPakxpYkowRHkyU2lreVpXSzc2UERsUnVPZ3pZUjhTbXVBVGFsUHc4R1FG?=
 =?utf-8?B?WldMUUhzMk5DNk5ud2NZMUxnQUVETngxQitqRTVVUFlIVWlFTkIyNFRSdU5V?=
 =?utf-8?B?MjlweU9qek9FdDU3YmFuU2VpZXk2UCthWGcyMjdKNmdKcmNDVzNTR0x6dDF2?=
 =?utf-8?B?Q0NFRGtzVisyRzh3MlpEYWlSVk5BRFhML085ZUVBVFU2VE40NjdPeHRBeVE3?=
 =?utf-8?B?c1B5NjQ4SGlQOWdpMjJ0ZU5CVTQrQmFBaFcxVnIrUWtaVzlqNlBZZk5KNytI?=
 =?utf-8?B?eHgyM3l0N2lZaTFOUzRPNzFydlRJcDZSWGlwVXZyWm05dWZJUE5TMFRnOEJm?=
 =?utf-8?B?MlEvRjlBV3orMUpHOHVpV3d4Um1KS3ZZSGpzNXZnU3JyS3pGc0JaRi9XTzU3?=
 =?utf-8?B?dlR6eSs0enZIWG9YRHhVTzBvaUpxN3JTL3Z3b1FzT3ZiNkVnQkoyUFBGQTQ2?=
 =?utf-8?B?THp2MEU2WlB2UnRvRnp0Z0dSWWZDUVdOcWVuWXZsYTkwNFhLN2c1Z3V3Titq?=
 =?utf-8?B?NVU0T1REeU5waEVjZ2FVWTZjQ2tsSm45UmhnWk5TLzZTSTNKQzFoM2g5R2pi?=
 =?utf-8?B?OVk0TldGREMwZThNOElqM2M0YmkrRUNUTnN4ZmhJdDQ2elJYc2QveGFtRkFy?=
 =?utf-8?B?M0RzQVhqdkZTYVpxTmlCcnRwd3Rndmorbm5oQytOV1I0WmtyYWFHQWNQS3Vj?=
 =?utf-8?B?aVM5MFd1cmtKdXI5a2hBVEIySm90Uy9hdzJOWGxvTVZadnZPN0NTMGhsc2U0?=
 =?utf-8?B?NTJyUS83VTliRDIvWW01Z3lPMjRDUTVDYjFSb3dOQjRUR2Yxdy91TWN6MDhY?=
 =?utf-8?B?S2dOanptYUI3RXZ5ZjFqZmxrck1wMnNvRDg4ejBZWDFLMiswUTdib01PaWFj?=
 =?utf-8?B?K29YRDNUL2xLKytvZU93Z0I2aG5haTE0NUl2bDZFYXl4K0pEV3NWM091VHJx?=
 =?utf-8?B?TWw3aWpVUmpTSVo2YXhzQUpyWVUzNUpqcFFXNDFabElDTEpUdXdFTjBKdTlY?=
 =?utf-8?B?ZjFPV00zUThUQzZRVFp4Sy9TcFp1NXc2emJ4endBVmdnZlhmWlZ2YnlsN2k1?=
 =?utf-8?B?N0pTTXNrYWVXd0VtVFNnWDlEQm9VYWVLeDhObW10YjJJLzc4Q29DSi91R0V3?=
 =?utf-8?B?RUw5S3dGU2xRMXRFOS9wYmtxM3dmMDhDRzRhTlpCaVB6VERjbzZjZ0l0cXdz?=
 =?utf-8?B?T1lMS1p2ZktvbG9UeG9ZdWNnbVJiOGdIb01ac3N0MVE0cEdtK01yTmdTL3Ft?=
 =?utf-8?B?cHpuSVBVOWphS1hHUC9YbTcyb1ZjQXpMcWtyUEVQa2ZQODZhdXBnUUlqSVBX?=
 =?utf-8?B?dFB3b2wrWmpvZnhYbmg0N09hSzdlSE44enk4Wi9adjB1d1lFeFhtUkxYaE52?=
 =?utf-8?Q?c4q7fDnSGHivi0gRktNoAdg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ad32ab-51ed-4c7f-6be5-08dc5fd4cbdb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 18:24:33.9319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T1Vyf6LfPCOJm4A5pnePGzAuAmw0eSfKZdi59tC2qNPmEyYn7hhUUp7iN+5zcWQQRuMLPJg2Y87ApmNXU4cXb+NE62rj3/njulA/Qt38geA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6092
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

On Tue, Apr 16, 2024 at 10:14:28PM -0500, Lucas De Marchi wrote:
>On Tue, Apr 16, 2024 at 03:56:29PM GMT, Umesh Nerlige Ramappa wrote:
>>On Mon, Apr 15, 2024 at 08:04:52PM -0700, Lucas De Marchi wrote:
>>>Just like CTX_TIMESTAMP is used to calculate runtime, add a helper to
>>>get the timestamp for the engine so it can be used to calculate the
>>>"engine time" with the same unit as the runtime is recorded.
>>>
>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>
>>>---
>>>drivers/gpu/drm/xe/xe_hw_engine.c | 7 +++++++
>>>drivers/gpu/drm/xe/xe_hw_engine.h | 2 ++
>>>files changed, 9 insertions(+)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>>>index ab227fa8984a..528b271c9f23 100644
>>>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>>>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>>>@@ -981,3 +981,10 @@ const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
>>>
>>>	return NULL;
>>>}
>>>+
>>>+u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
>>>+{
>>>+	struct xe_reg reg = RING_TIMESTAMP(hwe->mmio_base);
>>>+
>>>+	return xe_mmio_read64_2x32(hwe->gt, reg);
>
>given the past issues with reading 64b registers, I'm wondering if we
>shouldn't export a xe_hw_engine_read_timestamp32 and use just the lower
>part. Since the CTX_TIMESTAMP will wrap around first, just using 32b
>for RING_TIMESTAMP should be sufficient.

Yeah that works too.

Regards,
Umesh

>
>Lucas De Marchi
