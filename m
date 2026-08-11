Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2F5C5CFCF
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 11:05:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A13D10EB48;
	Tue, 11 Aug 2026 11:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QU1ck2E5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EFBA10EB48
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 11:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786446305; x=1817982305;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YstmQrePTSWS3anxEZNujof9aS0XEUM0KhUadtlIdXg=;
 b=QU1ck2E5dig4dU2WKxWK9CldcwHq/y9Oa8eBCgFFsIKPLZHRJjazOO5A
 tIHtIwdMHIjQPPvkVTDAWJp7zBms1Ty02QxFigZ3UTtYgjyMHsuodLBl2
 yOnNw0Ndu36I7GwOgHfRNzidejrCirR6+2BfswA42SJBA2xHQEjy6xizJ
 Q9oCvRiKMpkB2jv4jWqSq8jzym5dT8W6Sj3OCMUUAOJAU7ju6KmGankXR
 fiqkI8YunIm2C14CPVaQv6vWzmAVGfbvrjLXxvyQDag9szP17yK1+xcH/
 ZLqn8JBum+fHh5cowwt9/m5Dq6yAp+jbahNuWKqu47Uj/uJE+evvkI5U3 w==;
X-CSE-ConnectionGUID: tELmf6FlT96H+ycxlj+0DA==
X-CSE-MsgGUID: clGi+s6VRbSZGUxjROV9Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86852858"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="86852858"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 04:05:05 -0700
X-CSE-ConnectionGUID: 65xf2UZcTk6ry84RitSxPQ==
X-CSE-MsgGUID: ttFLaCx2R5OY9ZI31ulKjQ==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 04:05:04 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 04:05:04 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 04:05:04 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 04:05:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LIIe6DD9jSRASiqkFmdahYmwQAMWBm3NFSno5mMxfz/ojxH6YGkPx+jbTcU6VHlyiysaQ5UFI9PwAHyc629k52xENiolwXy/Sk7tRAmFLwyh+GkHvF9i9lp/hZafx28XBLrwm2NsDN2IM25NAXyOY9WhTk20ymx6mCfbn2M5g914T2JS8jcoPqg8e+BSjjysHQ4quTJW+v+f2PlpUQFfmGNjZgXEmrgdUcnc3RX76mk0QJxiHSmY2o8Q3qOkyi2zxTDABdhCYRtZr4utt9JsupLa+vsVCc+QhaLc90CzPJ+ZQ6HnL9IKL2UNwnPZlWQPHx0cNOJaAObVsnQpd0Qz9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0o7LW3nXNRWTojSkWSGHdBAPg6RET8IB9DSnAeaInPw=;
 b=KwqnJAU9RgppAyeJievv3S1BLVX+KoEvmINsM7MileWMxjIJD3FMIAaQ8DWoDSPfWI2wEmUkvxmd7wZafMtlfNLwegtHkWgMee1w5mD5aG2l4mVVRUBKELeY4SXXJ6omoUoCcbt88qosilqiuRaOFkQqk7xNB0/IPLnTFQ4iH2GQOurOsL0aKmo1Xob9NsjNzbop9NSTJlXDK4ekWHPegkSPlfvTbxtM8kC/3zCIz8JVpcKpmMOPtDXejPwon2SQiZdOgfEYRxI6ZyqIB/Wvnv+Jbc6nX+RVU/Gx8oaCy/tCJZp8aocu+VNC4y/R+hiPnBcpUOD9/jlNDdDB5fKyfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by IA6PR11MB690409.namprd11.prod.outlook.com
 (2603:10b6:208:5e4::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 11:05:01 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0270.017; Tue, 11 Aug 2026
 11:05:00 +0000
Message-ID: <bdff6291-014d-47e7-bb2d-58c2625c1829@intel.com>
Date: Tue, 11 Aug 2026 16:34:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V14 1/9] drm/xe: Link VRAM object with gpu buddy
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20260730101132.2770752-11-tejas.upadhyay@intel.com>
 <20260730101132.2770752-12-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260730101132.2770752-12-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:4:197::21) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|IA6PR11MB690409:EE_
X-MS-Office365-Filtering-Correlation-Id: 933b28ae-55d3-4144-0f4f-08def79862f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: n1M5AvrH7vqFBtTDgxzRmcs9AqFJW1p/3RYzkG8TgwW4R65fc/tr6E4V+v51lOxs2h4f69wU0cWOkx4mqADp8ufGjrBRcXDyHxo02LAlBTeri8OZcHQ/sTnQaax8N3El0LzCiKHv0+U28nSYluBE1JMReOew3tE1sY26tBkQQ+FGGE1LaGZxx0jLgTJeBv/vGr4h7HP+sHPG6r6zhnLP1YGCczLHYYijFeu1WOeDsIV/LSF1vOnYU/EbU4xuIuSv0cLEbgiKAUlyXaaPuemYOQAybKvYnG0/5QfH1FmSUHDwAK7LhO/VsaUaUrbYynvHpwKT2taANnj/RijBd7jpEozYRQ365WKBMr9FJQvVF/aaF/mJRQJ9wK2RQ6Ee6BeV6vHc1SB5cOPmEblEBBqtNKTQ4sqzlvtwTl1oRhQHTKBbfNpeXljeN5Noe2B2OYTS9qZZByVArxnknaN+IAYPlaD8fhcru1Wq3FZXoaVcG2CuoGh9NnIQACswiz5QTMPtnIXfiRr9oTH1svIrsL+J2DOZOq35Cl08UHe29Iz1JJnFDcAQtvbDvFRPl1wXlnPr/aQbQJ2bvmm2BGKZ3gE7PZTqvyYROYq14pMYEOuwn2qj/erPzWwlc8W1c36CuUOE+A3BEF3VuP69OTYjUmQVSkpCPYsb8wBa7yWuYf+gr+k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzErUzJQL3dXV1ZsT3YyK1VUTGdaVWdzK3RUMldJN1ZXWndBamJVQWk4QVlv?=
 =?utf-8?B?c1FUR2pLc3BZVDdPdGsxQmdMSUNwa1lqSkU3dGVyZWJPK0wxdng0WUsvM3NS?=
 =?utf-8?B?bWN3N0NwNGhIME5Jd2UydWRyeXAzbnFpQXBDTWNNdlBWZm9jYmhHVkpSaC8v?=
 =?utf-8?B?b0NSc2owRllGbjFFbHA3ME9hZENSZDdPanJkK2NvT01aSHV2Z1FmLzdyT21C?=
 =?utf-8?B?S0JNU1YwMkMvOG82TTBEcmRObFVNTXFLZDBhOFdOV0R6eGlqaGhOUVZXZGxl?=
 =?utf-8?B?anZmb0VmNDB5czVvdXVjZkNNOTVWeEtPd0dwQkpVaHhCbU5FdXA0RituNkpm?=
 =?utf-8?B?ekkzVER0MTVKZkdralZkbnAwNkpIUTFZZmFtQkFOaHJiUVh1bG1odEVkUUpM?=
 =?utf-8?B?Q0J3OUF5Z2xtYWhmMjVtNXFOaVFzQlBtN0trL3hRWGxmRFUwNitWSnpxZ29R?=
 =?utf-8?B?bHBZU28rRU1SVmtxNFlUdVBQQjFTZENzZ21ZdHQ5MUFNekRuM0RZZFlyMDlT?=
 =?utf-8?B?OFhOQTA5cHo0Z0xxZXlXcGJYaTdyTFRqSEVadUFoSjNTdmJ5WlVkOGcrVElX?=
 =?utf-8?B?QmVpWmFHWFBtSnNrMGUybXlQK3FFeHlkVHM3bWFNNDdWLy9KeXYva2dpSXZY?=
 =?utf-8?B?S2dWK2Y4VTQxczRnbFllaEFLTG4yT0c0V3lNZE9mQis2bUM0YUxHMWp4Q0wx?=
 =?utf-8?B?L3RpOEwvOEs0cUQ4a2tJUUw1SUg3Qm0wVXl4bkVNeWZXSldvQms1aTJxbjNH?=
 =?utf-8?B?aVZYNWdWMHBETFI2bUV4SDNDTUFUZVFOekVob0dxL09VaTFYSnZzZXp1QU05?=
 =?utf-8?B?NnFxNWM4RE5VT2dydW9ZTSt6cjFhWGVjMVphVm5BbkszY2RTN0VaVEVmcmhh?=
 =?utf-8?B?RExSRlh5dFVtTVk1OWhyRHJKemxWNGpQR0pOZnpTZ0FsV25OVDgwVk82ZlRx?=
 =?utf-8?B?UHdYdGwyeEcya2RKUENySjFIbHRKM082NUl4a3k5TWdvaUZ1T1FxZzBsa2hO?=
 =?utf-8?B?QndsRk15UzArTEpUa21tVTR0akxqZW0vWWFpd2FiRDdURWRMUVJjWjluMnFn?=
 =?utf-8?B?QitkSGJwVFVNWVgrREtTWUpjbUxIUjFwa3ZoeUpNRnozWVVrZ21LaitQTytZ?=
 =?utf-8?B?YnU1WmFWaXJZRW9ITXFvbkFLRmVER3RZL3R6V1FlZFZmVHpVcjNWTmdQNHRC?=
 =?utf-8?B?cTk5STlUalgyQzB1YTMxQlhFYVMxS0pTbE82T2lLdVJ1bktXRzhBWGxGeUlN?=
 =?utf-8?B?WUpLSThPS0duMUhkSEhxc3p4a0FGZ2JMK2t5MER3aGdncHhVMDBRTGpzLzha?=
 =?utf-8?B?YnhMRHhCeFI2dWJuQ1ZoRWZvM2FEL0hTNzl6QkRhMVg0d3pMTmExRXJCdWdz?=
 =?utf-8?B?cDBqK2JwZXFGcGR4RzNZUy92TVd0N3lPbm55NEpwMzlhd1FuQXhhdklwaU01?=
 =?utf-8?B?azBaV2hDREJBQVBxSEllYU5kUnNMV1JtR29GSXF1NWtQQXNoU0tTdHJPeTV3?=
 =?utf-8?B?TGh5M2hhYTRXcHprYjJTTGNmeW9xWTdYUG9MVFRRT2N6Z3RHNFhXWVJQUHd1?=
 =?utf-8?B?djM0S0RzVjFvUXJmbThtTnQxOHQ3cCttZEZmMFR1TTdGcERFWUlXQVc2bWlM?=
 =?utf-8?B?S1JSSGpPTXFsbmIrc3N0SVY3R1hmZXJOeGxqaU9KRmpnZ2M3UjJwMTlVN1BS?=
 =?utf-8?B?dnVFSE5RcFNZVnk1UnJnelhUTGxpY3RaQkZ1aG1QY2RUcWVlNkpBVjJBYVcr?=
 =?utf-8?B?N0g5WFFzY1NiUGlmY3FheWVjaUdjcFNhNExrVG9rT1pDQWtoaGdVVGRjQUlW?=
 =?utf-8?B?N0JQN2NCV2VqQmpVd2RFMGdBVU5yVG5nNVVRTmRBUC9nckpkVjM0dXJuSEd3?=
 =?utf-8?B?bE4rR3lqSkZ6Y0tvNlc4NG5jMG5ObTBhNDFsWkVlZm04dDRtK2xZR2t3QXgy?=
 =?utf-8?B?SW5rSjBtZ2VJaUpWTG55MnQwK1l2ODJrTUtlckxLeUZsYldNTXhQTzh3V1ha?=
 =?utf-8?B?UlRwYkhEeElOVlpSZ25mL2hrNkFFcDREZy96SWNDdTB6endnWmlGdll3eDNr?=
 =?utf-8?B?cC91a2lNOW1oa0tsNnZlV0NYYnBPbmdwNDZ6aHJPaDlFZ1AzVFozTWhsTENU?=
 =?utf-8?B?VFp1bFp0N1FkUGEweGl0cXFDa1dreHk0eTNQaHI2UHZ6cjQ4OWhjbmRqb3Rh?=
 =?utf-8?B?d1oxVkNPVzhacm5wK1Y0L1AxMU5MSEhIajRiVlRTVVp1dlJBeFMwc0lXVldF?=
 =?utf-8?B?M1BKa1l6VzJKQ09tS2RuL2hhVkgvMmJTYjM1RUNzb0lzUGZBTGIwazRacUFL?=
 =?utf-8?B?Zjk1ZndWVWkzL2Jlcml5MXRFenVVUm9XRmtGZFVGa3dEdmFURUxHbHZJc3Ez?=
 =?utf-8?Q?l1KWTEPcwFiZHJEU=3D?=
X-Exchange-RoutingPolicyChecked: B3QTfk16AWQbelXFAEQRqgzV0FkssWnzLrPUb7mwa0tVKKn6hfagWPmAMB5pW5BXDZchGRc7PB+cpYlowsKYPGP+Sd8buDgCpTFXRPGcG3gMZw9PTaTSwsjVd9I7kVjYDnJ8VIiLuZKMp+ttINSU6Y+hSKY5lc4vU/xOU9T8q3k5h/cQaOJOoFtLsCbGVUSvi1NahQ0pZg6dv/HJbdJ+m6IT8fuJu0CmiRQXPsJWm1o43JRo4nNo7Q1d7PfP3S3UZr/nwPc73usfi/WUwODgYBZeg3Kn4xXF6VZ70ffj+TEQl7i4P+bhw/iwP4dMnpXFyg7CeC0QkoBPyHrhFvtilw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 933b28ae-55d3-4144-0f4f-08def79862f8
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 11:05:00.5349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cciecMlGhxwMTUnrzLSV89D0QzE2RvFqeM2uqypirTC/4UmJoAPxI6br3Q7lxSK4VmqILbqCgRF2T9ICrk6jbh0uhfC4ILxgsj5oDlp04wA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR11MB690409
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



On 30-07-2026 15:41, Tejas Upadhyay wrote:
> Setup to link TTM buffer object inside gpu buddy. This functionality
> is critical for supporting the memory page offline feature on CRI,
> where identified faulty pages must be traced back to their
> originating buffer for safe removal.
> 
> V2(MattB): Clear block->private in xe_ttm_vram_mgr_del as well
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index b518f7dec680..5ab5dfdb183c 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -54,6 +54,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>   	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
>   	struct xe_ttm_vram_mgr_resource *vres;
>   	struct gpu_buddy *mm = &mgr->mm;
> +	struct gpu_buddy_block *block;
>   	u64 size, min_page_size;
>   	unsigned long lpfn;
>   	int err;
> @@ -138,6 +139,8 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>   	}
>   
>   	mgr->visible_avail -= vres->used_visible_size;
> +	list_for_each_entry(block, &vres->blocks, link)
> +		block->private = tbo;
>   	mutex_unlock(&mgr->lock);
>   
>   	if (!(vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) &&
> @@ -176,8 +179,11 @@ static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
>   		to_xe_ttm_vram_mgr_resource(res);
>   	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
>   	struct gpu_buddy *mm = &mgr->mm;
> +	struct gpu_buddy_block *block;
>   
>   	mutex_lock(&mgr->lock);
> +	list_for_each_entry(block, &vres->blocks, link)
> +		block->private = NULL;

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   	gpu_buddy_free_list(mm, &vres->blocks, 0);
>   	mgr->visible_avail += vres->used_visible_size;
>   	mutex_unlock(&mgr->lock);

