Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19153C61DBD
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 15:04:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988EE10E286;
	Fri, 28 Aug 2026 15:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NLXTXZmK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0873C10E286
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 15:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787929481; x=1819465481;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=o/Fm5uBIcrhRpjGFfOXzbWyBmPgHCKEHj4olKEeasHU=;
 b=NLXTXZmKSV6ppHnBEkfHZzNE+Xn63BGceM47Z0qTE01Qg95UNW8JINVd
 Zy4EDUq9iuUFsGwLyPPkU+QRKO76YfT6co8ZnkqSmPbQt8h02ihfcXLm3
 KXr2NCGbwxnjP4sDbA9HefAl+bOhfwaIxl9KyHZIYFuUwVdScKFZTTHKj
 X7/V/eoGO5h9gZScnmyxxnaCze1eSfaROc+NUbdCfdGLIo8U9LRMN5d9z
 4d9y5t+poGgXQ5fR3jlEtFmviNzdeI6bB08hbszhV5rVBcnNWmChcu6rr
 FLG/nM0HZgfrrQcUsxSENzy+GBJSW1CpvcUfqbvlrlGsTvwSmmUwoyP4l w==;
X-CSE-ConnectionGUID: w7w4k581SRK6ddLQfKlsuw==
X-CSE-MsgGUID: gDC3eoXcSJ6OpG3g+EGjOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="113974159"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="113974159"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 08:04:41 -0700
X-CSE-ConnectionGUID: W8CjotZsRBaOJxbvSHjieA==
X-CSE-MsgGUID: 1cjcE8J/RVi9ELKK+pcKGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="265592625"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 08:04:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 08:04:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 08:04:40 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 08:04:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rcRxJE/VC+Q1ieO+f0aAQuk0Gw0yd8NJK/DREmXiSswSrzX7DKzCdHtAn8yk0EX/ifg+KN4J08meiQCgTmC2NuHURNhSbE//8Ws4KMM/c3EupTbfhe8CL9AzJhoAgtzWE4Jgw7na9fpxobLkqa7rZzk2hVNMvgpmvkZuXI/kaWqOA9dAGPKqg7fhG6vtn45jTq3GL1uncBmEZmZBMz8m0dRP22MJPo8y8LCqBQ0m66gZPsCsTsdt+RyKcbood1L96XqWrC2AFEbssu5Negyx5t5lU/IBqroAhe4hHaqErNjynlDZVqVVejeVeA2mLIAXzkPHS3WrsrDe13dWMw8mBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhx6GLcDU0pKl5zNlFrOELZXA4GwMTVexdYiis7O7vg=;
 b=kFEmEPfSxq2evjpH3/IAUya01BlMqHUYrO5CgUZqxdgCO2gi2s7bP+LmBb6O6lH0146Vcoxzwrg7MVdylrL3JMxEkSFESesafsfh51+VmPzS8O3VPpTQADdclQL2L91KHSNxJGunyBiBnugNsOtH6c6ibe0/GuZbqNgpIAbA2MKS78EC7ilfaYttjbWz4GODLxktAKWf6WhKjtnGCc3Y51zVr/waEl1qQEwdeby8x0qLJSdDoaLclRAX9PbcZDy6CE0BUpLn0wACjw7AF80cfEQGlFtoiupzD+xPBC72DziLBDdP8GBqN2zZ7XAG7x1eQ9FnO7UPB4ksgXc8XX0z+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SN7PR11MB6993.namprd11.prod.outlook.com (2603:10b6:806:2ac::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 15:04:34 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 15:04:34 +0000
Date: Fri, 28 Aug 2026 11:04:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH V18 12/14] drm/xe: Expose bad VRAM pages via debugfs
Message-ID: <apGjfM4HZ87_1cA5@intel.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
 <20260826135136.204044-28-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260826135136.204044-28-tejas.upadhyay@intel.com>
X-ClientProxiedBy: SJ0PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::14) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|SN7PR11MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bf474a7-905a-4f85-50e5-08df0515aad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: bliGwOh3xLoT/GbnkM6iKRIqTc+cJ3S1iAQOHjCXe+aOhkCLSEI8xwMxAxVG8cA6fkzu+2u6crb79gWIMrgl2QfCrK1W6/fJ9ParlV1FV5SYrx1AnaYXfix7qLDy7tOAwA6ygLYihgf8kiLi+5Bfzwm8drkXu/ZtMyvNT9v07NI9k5vQaz6T4MHXuNyWMFbApB637avVLXYCNqCE19kzVs59FnC6McTxuNw3VQ9zePryy/KdnTjPZpB0QcT3G2GxkOkvjKebVJ+JOCT0/LTVruXIjY3udA3o6KfrSSsGb+D9+raTEw6Of80/Npj4N9bicEFJhwnKZHi8SsNg+td/E5MK6u3arWh+aalZC7yGpzHxzIaUYj8//mOW1hjTMtnqsB3VR7plInFjv2DUUUOoG04u/zpVBbmon0oozTtpqrj/t2uXn3nOTr9EeKE2DPlP/TVOaLJuTGJOjM7O1m5IBjVprm6YX/D+4ygcnYlB2CP6MAtMPMpIAb9crRZUn4WCeW3Somwv4odA13uePfGVVMLPwWk70MJwvb17va3f9Os9LTZ+07cou89zfTpBrHpFJGHhguyjY1YVOWQS14rO15VaQ/SqbMSWVRqYlgWipalO7vNl88Zc41B4Qxi7aCiQw0f+q/iwoVQDLF1EDzo3BAbGkEC3OvonC722lZBvglE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTI4dnk4Y3dhWkJKVE1KZ3A4RWQ5ZWdiVTdRTFZmdHFXVTdTSExOQ0hXODFD?=
 =?utf-8?B?TUZueUY0ZGY3MEU5L25NTG9sNmxtYWI2SnlFT3RWenBMRlIveUZOOWM1NjdY?=
 =?utf-8?B?V254UDFkc1hSVzRSdXYxUVN3dE5uSklqalFXV2JFUnhsOTc1SWhaV1lCUWUr?=
 =?utf-8?B?blpPTWJiNXZoSk9LTUd1bm84VCtUVUtuRWFuQ1hKaGt6NnIwWGpETzV6b1o4?=
 =?utf-8?B?RjdmSW9HT2xIcWZQdnp2RlJKVUM2ZTdodGQzMEtTYktiN0JFTWtyK2RvTDdz?=
 =?utf-8?B?MFRFVjQyVlQ5TjNhYWVGOHpSYWZCcmR1dDJnOE9qWGpxTHRJaDl2U2hnRzBN?=
 =?utf-8?B?eER0am1aWGNkK0YwVjUzektKSllRdU5odDd0Tkk0SFFZVzRuWDJ5MVRWM1JO?=
 =?utf-8?B?SW4zdU14Sk1RQTE3R2x6MUxTNHFJaFBnVnV2L2RiK08za0NMRHRnWCszWGd3?=
 =?utf-8?B?Y3RacnNBV0JwUFRqb1h5Q1Fqc1M5dVdHbFZReUgwT3lROUliTVVqSjUxMzFs?=
 =?utf-8?B?TER1OFNld1gxZE0rTkJnZ1ovQ3VhbVpZc0pyc0RoYnhNVGc1R0xHUkEyaDVJ?=
 =?utf-8?B?UU13b3JxMUxlM1I4cHdSR0ZDNmNpTVRWQnFsNVFDdER4OXB1bXpSV3FEN3lP?=
 =?utf-8?B?VlZvd0JqZElQRm45aWhIelBMZ1k1WEtpZUxmeHVrUUsyelRlVGFTT3FYbmsw?=
 =?utf-8?B?UTQweUhEQm8zNHE5M0RrQmxpT0gxQUlML0RVS2RtUDhyR0E3TC93anJNQVM3?=
 =?utf-8?B?YUc2dlFxZHRHdFIrRlp0NVVOZG8zSjBqTk9PUmN2NlRHNUNHQnRYSEJLZUxa?=
 =?utf-8?B?ZnNycUhmRGNCQytQNWtDT0d4UjgwSnJ3VTlSUytScG1DcldoalJsODU5eGE1?=
 =?utf-8?B?aThHalJjL3liY0VlV1VkTDBWZXZzLzZEQzcxRTA5ZWlHa1hUVy9JVk1ZM2lI?=
 =?utf-8?B?WnlLTmRab2IwRThQb25ZWmhVMTNGUi9ESzc5UHdGR29PQkdYZUJKaVZzQUFr?=
 =?utf-8?B?bEZaRXo5bVFZTUlqSUM3ZkNVSlVQdGVJSXdZYlRSOHZKK0xLRTBjM1JUb0Ew?=
 =?utf-8?B?Q21aTDZJUXcvZzJLV0kwd25Zdy8xTUtGWGswTzJPVHFndG4xNDBrMTkzWThs?=
 =?utf-8?B?YXFtdExFR1BoMnVYMnNvWElCUkpZTTRacWovLzE1U2J5emQyLytkaHEveWlw?=
 =?utf-8?B?Y3hmTzJuNXdPUkw5QVliTVo5NEtvVHQwcURoRUo2dUlWdUZLU3NUSnFtYVNi?=
 =?utf-8?B?a0ozUGpOSXNPcTE4M1FyQ1F4ME9pS0RWamtodjZrblo3QUFwK1pJUWduako3?=
 =?utf-8?B?c1dpd3AxWEFMM1lqazEvZzlzNm9xZitmSWhlTi9BcVBiVWM3NTJ4VkNLT09P?=
 =?utf-8?B?TDlmWHk5dGRDandRdVBjMFlNd2pJdmh4cUsxakRaMGtwMnNYM3AxencwbGtK?=
 =?utf-8?B?N2k0M2U4dGRJbU85K3dDR2swQnpPMUhXY29ONmtscklKTFdKNjRPVWNNaFNv?=
 =?utf-8?B?VENzM1Q1Y0FnM3RBcHF3SlpwMTJOdURZeHpmOFdEL1VoTVRiSE5lQlVCcW9U?=
 =?utf-8?B?M21wQkF3dmNOOW5GTzVEc2lYK0cySHl3bm5kVFFOUE1iQzVlRjZmTUNTR2xD?=
 =?utf-8?B?c1N5d2xsb0hycFhwUFpSV2dhcHhuY3BBajdrRkR2YzFUMkk3dmRZMTNTeHRa?=
 =?utf-8?B?bThYVDFQK0xNM0sxbWNwd0xwVk9Bc3o1eXpsQW9lOEFaWk5GUnZ4K093UU9p?=
 =?utf-8?B?TDRVVWFSTkEzTWpqNkhUZVI3dC9YYmJ4b0ZEcVFzT3lUbHIrcmExeU1GK2JF?=
 =?utf-8?B?aFJPTDA2THZRSUJVS2UwdmdqUTNndjd3VmNTdXd4alMrZUpaL0ZSWmcyeUMx?=
 =?utf-8?B?QnlnRWVkN2M2Wm9LVld6b21TOUM0d2F1VjlrY2NwOHFlTHBSTmh5bTNNMzdl?=
 =?utf-8?B?UkNKaVM1bEkzcnN4TEtNZkttc3c5Z2ZsbHRMakVVUVZHYUxBMXk5S3krODY2?=
 =?utf-8?B?SWM3a1FGRm5jNGJUcnZVRHl3dXd1bWkvcGRKRzI1Ymg1QnFNZ2RwenJqRGlj?=
 =?utf-8?B?dm1obzVOejI3R29MMUlkTS9rdTRLT3VuRjRKZWRldmtoMXE3dUNoaXRjM01C?=
 =?utf-8?B?bnNaTndjSDhqbitHSHZPU2pTQlp4aWRnaEdHYzNpQ3VKclZycmM2dGx1Z1BX?=
 =?utf-8?B?cG5VaTZHOUtiTnA2a2poakhpaERoeFlnS2xwZjJrbE9PdlBJcUJqTElDNlZI?=
 =?utf-8?B?NVRNZ3phSEhkdXA5TXNZakdta2wzWjExcEc4TnRIVE4vWVZyRWtxR0M2U3h3?=
 =?utf-8?B?dCtJNkJtR3Y3RzJTSFhDZFFkd2Y5TG9zNTl2a1hPd0JodUtRRjd4QT09?=
X-Exchange-RoutingPolicyChecked: ZGsApKS9KyQvvEqDb8Wi3ynk9G5cE5Lrr5AjrR9YH5LeFfsxlQXw63DRlrPzeTEoUdiOHsV/58mmCJHnSHUvf3Z0IEK80ojLp/DO3C4DuqCgkWuo+K6ZsTBfkgkTgT6MbVF4ruRNd99jnF2NiCFY0mkHe23qDgzmQfhfbHi7W1fy102aEYmlpqrkPpffvetT2jvbMxF1ezWv1/ZvvA7JdWVmHXOPLWKkyiAgL4XOEWuPmXfik7b7ENt7veGQD5tm5n4rn/5D2GPY7wmKQW3UCNLpozHZEM5xgqhLGLsuLGQXL5ELO5O8G2dqvdCREhl/fkgZuV3bOVRNd1Pzlj6FoA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf474a7-905a-4f85-50e5-08df0515aad8
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 15:04:33.0795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Bq8+aWvHVRQJIy1a99KUJFwYHJkg+kQTaCctrVg3g1KwKvJiFmqHQghsla9IABFjZ56AiOwfJYZgjoitIH0eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6993
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

On Wed, Aug 26, 2026 at 07:21:47PM +0530, Tejas Upadhyay wrote:
> Add a debugfs file "vram_bad_pages" that shows offlined and queued
> VRAM pages across all tiles. Each entry displays the page frame number,
> GPU page size, and status flag (R=reserved, P=pending, F=failed).
> 
> example,
> cat /sys/kernel/debug/dri/0/vram_bad_pages
> 
> max_pages: 10000
> 0x0000000000000000 : 0x0000000000001000 : R
> 0x0000000000001234 : 0x0000000000001000 : P
> 0x0000000000080000 : 0x0000000000001000 : R   ← tile 1 addr (includes tile offset)
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_debugfs.c            |  4 ++
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 66 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |  2 +
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  2 +
>  4 files changed, 74 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 28135f84e286..e19eafffbb08 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -32,6 +32,7 @@
>  #include "xe_sriov_vf.h"
>  #include "xe_step.h"
>  #include "xe_tile_debugfs.h"
> +#include "xe_ttm_vram_mgr.h"
>  #include "xe_vsec.h"
>  #include "xe_wa.h"
>  
> @@ -773,6 +774,9 @@ void xe_debugfs_register(struct xe_device *xe)
>  	if (man)
>  		ttm_resource_manager_create_debugfs(man, root, "stolen_mm");
>  
> +	if (xe->info.platform == XE_CRESCENTISLAND)
> +		xe_ttm_vram_debugfs_init(xe, root);
> +
>  	for_each_tile(tile, xe, tile_id)
>  		xe_tile_debugfs_register(tile);
>  
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 24d134754265..af9e1fa868d7 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <linux/cgroup_dmem.h>
> +#include <linux/debugfs.h>
>  
>  #include <drm/drm_managed.h>
>  #include <drm/drm_drv.h>
> @@ -874,3 +875,68 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
>  	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_mgr, mm);
>  }
>  EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
> +
> +static int vram_bad_pages_show(struct seq_file *m, void *unused)
> +{
> +	struct xe_device *xe = m->private;
> +	struct xe_ttm_vram_offline_resource *pos;
> +	struct ttm_resource_manager *man;
> +	struct gpu_buddy_block *block;
> +	struct xe_ttm_vram_mgr *mgr;
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	man = ttm_manager_type(&xe->ttm, XE_PL_VRAM0);
> +	if (man)
> +		seq_printf(m, "max_pages: %d\n",
> +			   to_xe_ttm_vram_mgr(man)->max_pages);
> +
> +	for_each_tile(tile, xe, id) {
> +		struct xe_vram_region *vr = tile->mem.vram;
> +
> +		man = ttm_manager_type(&xe->ttm, XE_PL_VRAM0 + id);
> +		if (!man || !vr)
> +			continue;
> +		mgr = to_xe_ttm_vram_mgr(man);
> +
> +		rcu_read_lock();
> +
> +		list_for_each_entry_rcu(pos, &mgr->offlined_pages, offlined_link) {
> +			block = list_first_entry_or_null(&pos->blocks,
> +							 struct gpu_buddy_block, link);
> +			if (!block)
> +				continue;
> +
> +			seq_printf(m, "0x%016llx : 0x%016llx : R\n",
> +				   (gpu_buddy_block_offset(block) + vr->dpa_base) >> PAGE_SHIFT,
> +				   gpu_buddy_block_size(&mgr->mm, block));
> +		}
> +
> +		list_for_each_entry_rcu(pos, &mgr->queued_pages, queued_link) {
> +			u64 pfn, blk_size;
> +
> +			block = list_first_entry_or_null(&pos->blocks,
> +							 struct gpu_buddy_block, link);
> +			if (block) {
> +				pfn = (gpu_buddy_block_offset(block) + vr->dpa_base) >> PAGE_SHIFT;
> +				blk_size = gpu_buddy_block_size(&mgr->mm, block);
> +			} else {
> +				pfn = (pos->addr + vr->dpa_base) >> PAGE_SHIFT;
> +				blk_size = PAGE_SIZE;
> +			}
> +
> +			seq_printf(m, "0x%016llx : 0x%016llx : %c\n",
> +				   pfn, blk_size, pos->status ? 'F' : 'P');
> +		}
> +
> +		rcu_read_unlock();
> +	}
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(vram_bad_pages);
> +
> +void xe_ttm_vram_debugfs_init(struct xe_device *xe, struct dentry *root)
> +{
> +	debugfs_create_file("vram_bad_pages", 0444, root, xe, &vram_bad_pages_fops);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> index d5392beff30c..f354c26c4257 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> @@ -9,6 +9,7 @@
>  #include "xe_ttm_vram_mgr_types.h"
>  
>  enum dma_data_direction;
> +struct dentry;
>  struct xe_device;
>  struct xe_tile;
>  struct xe_vram_region;
> @@ -32,6 +33,7 @@ void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
>  			  u64 *used, u64 *used_visible);
>  
>  int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr);
> +void xe_ttm_vram_debugfs_init(struct xe_device *xe, struct dentry *root);
>  static inline struct xe_ttm_vram_mgr_resource *
>  to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> index dc97b0ad0e51..efcf3e1d4e80 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> @@ -37,6 +37,8 @@ struct xe_ttm_vram_mgr {
>  	struct mutex lock;
>  	/** @mem_type: The TTM memory type */
>  	u32 mem_type;
> +	/** @max_pages: max pages that can be in offline queue retrieved from FW */
> +	u16 max_pages;
>  };
>  
>  /**
> -- 
> 2.52.0
> 
