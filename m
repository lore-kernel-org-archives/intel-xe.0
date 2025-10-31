Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D6ACCFA00
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 16:02:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D0910EBDC;
	Fri, 31 Oct 2025 16:02:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hqlm6GS5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E65810EBDC
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 16:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761926575; x=1793462575;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=to0RqpUCdSxQcFa1iBQX4GJya+q7NMlVMQ9SOlFskZ4=;
 b=hqlm6GS5G5DEN4oZ2mTN1jg9ZXm+Dny7+LnCgI2dJq8MGhyXSlDWj/hU
 8114CcU8uzPgQDeH3BBI802NjzFPxWL0OtzqiSUhUHyp6bIzxYjBg0uiv
 6htXY87xMuVHuvgtQikfPUg6VQKsYkx/8jxaAw2iTJ+uTs3l99fvtafnp
 2ktxklyklZ7FSqZDQ2Qb4ceQWRBHhRMQG/Njx+bQbGeQJHDRr0s1XKtvo
 9mL9+ZQYrvspw1cUCP7IMbghGiykL/kmfrSqJEZC7KaTHur9CDrIUW8dW
 zQMDfTZIk8El2e215QYoWPTFqeZpBP9dPgDoNdKJHlRYNob8vMu8rhXNd A==;
X-CSE-ConnectionGUID: K+PydqFuRgmHzsG5zZ3mtg==
X-CSE-MsgGUID: UfIvKxzOTkGIan/PWQz+7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64121160"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="64121160"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:02:54 -0700
X-CSE-ConnectionGUID: HAFeJXeiQGSNggFTqXZHNA==
X-CSE-MsgGUID: UPL+AVmRQWi4xzkCmeXmTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="185483239"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:02:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 09:02:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 09:02:53 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 09:02:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lUI9LLD9ZsKP0KBfpBtHkuwUyOHv/8x1YykTJfJufSlyS8L6zjWQFh9YlUtZ5fmMxG6+5cQWXGpQCit7LFKZEOLMOwMRoFzbwH0eEuFx6t7LugxNDN1I+cn3T7ErlNaheXEh5iOm9Wlc71hvJBcqsWCVrCacMG9dfXfcXqUbRWtV/B+TE7D214rAFzAmHoXxpb8acKLTm+AT9oLofxCLL0S4K9kZGYDVfedWgKVLDc8Zo8Ix5XrkygnoAHDTShYrRQQf8z8BUW5IL+bX3dG40KPEnJdaP4EpNYOk4Mj+XBARCrsTvn4FrJ5Wz++CXpaqOJy/uAQJ4DwliXQNRrmh/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7xfKeNOTShqCeDsZaUabYi3v6Ok4W1zak/J4XyoGyt0=;
 b=tYfvbvvPj6MlTqwgEBxIT6Ed6CCT7lX7qjI+UTIK2TEjMQ7na/XsKJe7LgawaNdomeok1d86RjLFh6vBUYUYpz+aLUCbWkqUZGv46X072E6aPnPaPR6pPznNzgruQOSA430xqUptJeMQ07F0JWjZsRxNR87bJBf3DCNlAZwekqzaEzXcNASqKgx6MhPLKSwMoKBatYLLA9/o5uMnCvhvavbQZ/tDwJql+CZPagONozuWSjhNEArcxhcaZZTSAFwV/t6c61ZmuTgGBKx8aWOYl6igND0gcjmCh9nZ3FTxfnEfKOb+RPote+pJZUTf/QhYrY24He8O/44aes3hy7fmjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB6863.namprd11.prod.outlook.com (2603:10b6:303:222::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 16:02:43 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 16:02:43 +0000
Date: Fri, 31 Oct 2025 09:02:40 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <tilak.tirumalesh.tangudu@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 drm/xe/xe3: Extend wa_14023061436
Message-ID: <20251031160240.GA2980942@mdroper-desk1.amr.corp.intel.com>
References: <20251030154626.3124565-1-tilak.tirumalesh.tangudu@intel.com>
 <176186266815.2568.11125949570623645318@10055242dc62>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176186266815.2568.11125949570623645318@10055242dc62>
X-ClientProxiedBy: BY3PR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::6) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB6863:EE_
X-MS-Office365-Filtering-Correlation-Id: 61f51292-c79b-4733-25a1-08de1896ed0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lf2Jv014OjIBoZ8Rw90h5wHBZHmm7zg999Eui7YtfLLAGM0y5gU3tyyDoddO?=
 =?us-ascii?Q?hOQlRMczBmSEz74wFBJikutsAd1cCMqBePBtWJTMnsxWNTvGRivEn76eymG4?=
 =?us-ascii?Q?nDL8s+JLozXAxuT+Z6M+SCt0wM0HetYv0/TOfHpT/EZxNcI/vxweKCem2LbM?=
 =?us-ascii?Q?HyNgxtSLiycY2vI2RzAsBr1h30onK0/YuSbn7Fyw4VjMi/OGby+rsOO88BRO?=
 =?us-ascii?Q?9uEoG0rKmNHSFbnI7H4gMGRajJMPiSWvi/2xiVa9y9sDgh7SrVKbPq0Qyash?=
 =?us-ascii?Q?2QPt9+Re1CPTXAk/KYRzHTr5GavgbOzIg3TLyRnu2FUTw2xEE5rwUt5c0O0Q?=
 =?us-ascii?Q?hcAScaC7Rcbz922nmIN86SPIfwanIKIPo+qpUTRbUBH5X3FVqC7DbIkbKePV?=
 =?us-ascii?Q?ts3dt/WuT1ILfMebZk4ZQveIMmUbguP1TTSklZIp/d5cw6mHBXFqXsickWGt?=
 =?us-ascii?Q?0itZ32x8cOiDEdUb2eV5ESNULsMGOOQlo3I9OahYZfR9JUgFp/F5J6U3yezF?=
 =?us-ascii?Q?gdG2nCrPT7wAN5XLsVsfdp20p+FCrHOieUDrKKFZeCfCZPQ9ua0W1xiJeHR0?=
 =?us-ascii?Q?P4tCfo5fm0r1kj0IyXu4ADTOFYmDqP+1YMyA3w46q6f+u75U1dF9GvoqjRKu?=
 =?us-ascii?Q?+KsuKvejXvJ0ssGpPc9pMwGLyZq5yl98Uvnp8uHMrN393YHE7gkBfzzqIofM?=
 =?us-ascii?Q?0h3Q1Qegf4MfbUJPpER0YOHPCginTi3Ng6i8wtJZGePP0IZ9lV3Pb0YYJidf?=
 =?us-ascii?Q?9ASVcHZkdVbLx9xlZ8VoQYjXqdXd0z/CXEX7uFyegZZ2Y3FG5p5aVFAl7NdN?=
 =?us-ascii?Q?LJAvt+W5MQe3nkoFIWFyx5HsPD1W8to9hIdL1ThP2CsGhRiPUMkpvkRZMP/B?=
 =?us-ascii?Q?CSEu0+6EbvKX4+TT16Ei9r6n5t8Gqnzn6s4zh0tXrEQ2lvsj/bCY1HrwkP18?=
 =?us-ascii?Q?hAm5ikobYs8PlueIlaU/6zstg4iTxfAr3SwGQkNft04rUNCr7i7Xbgbw9Txr?=
 =?us-ascii?Q?TZqnbD0WN84FmIPkHq1FP1JuGZFBgjbfnojnsAJRRMEOpWmNa0gcrpq4r9AK?=
 =?us-ascii?Q?Uv3twIemc8pCLEpcEK+kmcui7UiG2ciD+aFYF13oRcnv7Ms3YI4GmtGSOHol?=
 =?us-ascii?Q?jff5EFI8YpEcmFfx1wC9t5FMHKpIBAYPBMmUyJkGTYLc7UVcvuIOCcFtco9C?=
 =?us-ascii?Q?AOY7rYP2nRBCZxK9NC98VXZYhUPdwrzjFShDbCnrfUkbKf81LgO0mzi8P3WT?=
 =?us-ascii?Q?8WDRZYdpQHVxgDlzGBXaq+3KN72KAFN1nUoxANj4hc+0jGwHDV4NcMiJCWcg?=
 =?us-ascii?Q?aJQA9fzm7WUU9PxZ1TX1AgWuHyTsaJBv5OTflC4nnmQmHk/bKBV5USxed8Uq?=
 =?us-ascii?Q?Dq7RA6cPR7W2cZ3T+gwffs70oA/AOuYCzSB4gBRyiDi5vmDejQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tXlkzFEZGEAXVeAxXBOoFAfzloi5VSlPGzqfWAqUftZdq5fewnS/F9ab9uUd?=
 =?us-ascii?Q?bvpD6gQnALvmXy9V4vLamcfG+I9kz/6+1S+tQixCPK3IghsRe0/cwLiuEmRo?=
 =?us-ascii?Q?E/JSww1LUyWYPagQxyrTRsKXGoX7QfOou9R/CXf4xISmc3g0pKn5thqVGr3l?=
 =?us-ascii?Q?mo5mzyO4AHcTQvh/xcm+oFnlTpBjL4tv3GV0P+o3s8meqzIG6gBuu6grqIMj?=
 =?us-ascii?Q?DfU6YLThg9phGJOJ5FU9LYBahHc+8pygLYCNfoNIc0gh87med7HsJ1WmMCEA?=
 =?us-ascii?Q?WG3YY9VRsFGGFT+7n0hfxRps760zyAtHQygbj0eYZkd78tgTSRfKBDv3X8iv?=
 =?us-ascii?Q?MRPI6CvwWp53I0xvJ29ZlVQfLfcO+fxFmWavuhYtlKq3jCAxG2b375IVip8i?=
 =?us-ascii?Q?jQWwKqtuferKwWN5gbPr8r08O9CUtUguS2oLhTeMrEXV9Z07FP3N8zxTNSVy?=
 =?us-ascii?Q?AvUI4RrivkBYuf5u2Ah+AnTDAVN+1Q9Todu/+2CCr7f0ur5PYm9Yd58CenfF?=
 =?us-ascii?Q?hcJxlPGhqx/ppP9UQohhGKqR8I+mkWuratgwNz6BA8ZIkju7jVcxjxKt8c0j?=
 =?us-ascii?Q?0VfC7wlxZDDrd+QRDVpNXtkVHoqpxok6XejCU8VD2Woh4eDRqaggFwattCWP?=
 =?us-ascii?Q?8Z7DsW8wByfAqphwhhmntA3TaiHm03vNCQzzDsw1/Il/jFPgkHw+S02R6NiM?=
 =?us-ascii?Q?6EWCK5Tu5BDaeRK2iHPrxqVZAzL76457Jy9HgQdh6fzEUsnJRlXh1SVD/7jd?=
 =?us-ascii?Q?Rs6L5W4Wd2IBxSwEFO4uiAtdCK3AxUMfZvz6fv47N5f1+BQYjMdoy9A9gFiI?=
 =?us-ascii?Q?DMwwZ4wsV4PbSyxO67aXtmUJkrDUOpu25KCryovumNckgbLKR6iyvgIf2jPE?=
 =?us-ascii?Q?+JxX37LA3wRGe9IbdzbJ+M61kqVrYqmTIHznM67YbamfHp190+tL8FqhfXLi?=
 =?us-ascii?Q?Wf/4cNypdmfmq21VRxFxExkGaUvJ9Qb4iPVEk1H2motOyxL6aGggPIkBWKKq?=
 =?us-ascii?Q?CY8sBmsZt5+LxDBLElsW7m54w7feexUB6D6eButRuNeSbzTAxmFXDNZ2vyBc?=
 =?us-ascii?Q?H2C0P7YraBQqptnyKjGhMEWRO2S+A+ex4R07MnXdDtw0sQnhGgfV9WfnyhpI?=
 =?us-ascii?Q?6cuZEv1+FbgEnicAXHJYrpL9/qD4bJkjzhraRVtY1QsLxL54m7EIHJGNAAv9?=
 =?us-ascii?Q?kMyflGwKBGgtPzfDlAB7EzY14uLYDlGV5ZjB2tizz+dINdu50rB+5OEGGu4j?=
 =?us-ascii?Q?lBXJ2F9eCda1IaDVGYsE6YkPH0+VwRV9PYBcDEjrUAhk/+J1bdrIcU38Si3R?=
 =?us-ascii?Q?l3SN6sjvIOpzwhsBo3chYaJWFmkanMnrHQJ3xFk8k50SY1Z+3RxLW67+yaEU?=
 =?us-ascii?Q?nok2hLpUznXCInAeAWNVYmrMo152OPd3LnkItuQ0eNnYjieljBOyfkPmJwzd?=
 =?us-ascii?Q?BvAU9nF9yIdYnaa4FtqU9xiadw0Jm4v2ze3zPNmTriFI8kbsTNhGKEnteK1u?=
 =?us-ascii?Q?fmPPoR4xryZ1k1tGOh9J/QB98K+Uoi7ww2Ish9M6s4uXvuoL/AtMxMNSlcJE?=
 =?us-ascii?Q?1mGlVESdQhWoqKH9xKttU/k2OE2KtgjIpKmq9OG3Em0/wZSI7j6rOYrwk2kg?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f51292-c79b-4733-25a1-08de1896ed0a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 16:02:43.6911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Krr9i5CZXbn0Yf8qS5cZ7aqzZ3JuWaJQuweNnw0Jl0Qp68+xumAlQncWuxOlHHim45N2t+meAlHyGpuXVsd5D3Z82fpAnKHaR7kJWhto7bs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6863
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

On Thu, Oct 30, 2025 at 10:17:48PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xe3: Extend wa_14023061436
> URL   : https://patchwork.freedesktop.org/series/156768/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63_FULL -> xe-pw-156768v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-156768v1_FULL absolutely need to be
>   verified manually.

All of the failures are coming from display tests on old Xe1 platforms.
This patch only updates Xe3 GT workaround handling so it would have no
impact on any of those.

Applied to drm-xe-next.  Thanks for the patch.


Matt

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-156768v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-156768v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@2x-blocking-absolute-wf_vblank:
>     - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-dg2-433/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-466/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
> 
>   * igt@kms_plane_multiple@2x-tiling-none@pipe-c-hdmi-a-6-pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][3] +1 other test incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-434/igt@kms_plane_multiple@2x-tiling-none@pipe-c-hdmi-a-6-pipe-b-dp-4.html
> 
>   * igt@xe_pmu@engine-activity-suspend:
>     - shard-bmg:          [PASS][4] -> [DMESG-WARN][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-bmg-6/igt@xe_pmu@engine-activity-suspend.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-1/igt@xe_pmu@engine-activity-suspend.html
> 
>   * igt@xe_pmu@fn-engine-activity-sched-if-idle:
>     - shard-adlp:         [PASS][6] -> [SKIP][7]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-adlp-8/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-6/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
> 
>   
> #### Warnings ####
> 
>   * igt@xe_query@multigpu-query-gt-list:
>     - shard-adlp:         [SKIP][8] ([Intel XE#944]) -> [FAIL][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-adlp-2/igt@xe_query@multigpu-query-gt-list.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-6/igt@xe_query@multigpu-query-gt-list.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-156768v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2327]) +2 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-6/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>     - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1407]) +2 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-7/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
>     - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#316])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-4/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#316]) +1 other test skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         [PASS][14] -> [DMESG-FAIL][15] ([Intel XE#4543]) +6 other tests dmesg-fail
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
>     - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1124])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1124]) +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +5 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1124]) +7 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#367])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>     - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#367])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-4/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
>     - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#2887]) +2 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#787]) +2 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2887]) +5 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#787]) +48 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html
> 
>   * igt@kms_chamelium_audio@dp-audio-edid:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2252]) +4 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-5/igt@kms_chamelium_audio@dp-audio-edid.html
> 
>   * igt@kms_chamelium_color@ctm-0-25:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#306])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-435/igt@kms_chamelium_color@ctm-0-25.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#373]) +7 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#373]) +2 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-5/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
>     - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#373])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-4/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][34] ([Intel XE#1178])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-432/igt@kms_content_protection@lic-type-0.html
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#3278])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-7/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][36] ([Intel XE#1178])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-5/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][37] ([Intel XE#3304])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-432/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2320])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#308]) +2 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>     - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#2291]) +1 other test skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_dp_link_training@uhbr-mst:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#4354])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-7/igt@kms_dp_link_training@uhbr-mst.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#2244])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-3/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#4422])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#776])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-432/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-interruptible:
>     - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#2316]) +4 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning-interruptible.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb:
>     - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#310])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-4/igt@kms_flip@2x-flip-vs-rmfb.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1421]) +3 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [PASS][50] -> [FAIL][51] ([Intel XE#301])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
>     - shard-lnl:          [PASS][52] -> [FAIL][53] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-bmg:          [PASS][54] -> [INCOMPLETE][55] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
>     - shard-adlp:         [PASS][56] -> [DMESG-WARN][57] ([Intel XE#4543]) +8 other tests dmesg-warn
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-adlp-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1397] / [Intel XE#1745])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1397])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2293]) +1 other test skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#455]) +7 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#651]) +2 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#6313])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
>     - shard-adlp:         [PASS][65] -> [DMESG-WARN][66] ([Intel XE#2953] / [Intel XE#4173]) +5 other tests dmesg-warn
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
>     - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#5390]) +3 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
>     - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#656])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2312]) +1 other test skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#6312]) +1 other test skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#651]) +15 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#656]) +7 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#651])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2311]) +8 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#6312]) +3 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
>     - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#653])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
>     - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2313]) +8 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#653]) +14 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#3374] / [Intel XE#3544])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1450]) +1 other test skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html
> 
>   * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1450] / [Intel XE#2568]) +1 other test skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-4/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html
> 
>   * igt@kms_joiner@invalid-modeset-big-joiner:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#346])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-432/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#4596])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#5021])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#5020])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-8/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:
>     - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#2763]) +5 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1129]) +1 other test skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-464/igt@kms_pm_dc@dc5-psr.html
>     - shard-lnl:          [PASS][88] -> [FAIL][89] ([Intel XE#718])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2392])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-8/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-adlp:         [PASS][91] -> [SKIP][92] ([Intel XE#6070])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-adlp-4/igt@kms_pm_rpm@dpms-lpsp.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-6/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#1406] / [Intel XE#1489]) +4 other tests skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
>     - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#1406] / [Intel XE#1489]) +3 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1128] / [Intel XE#1406]) +1 other test skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#1122] / [Intel XE#1406])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@fbc-psr2-primary-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +9 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-render.html
> 
>   * igt@kms_psr@fbc-psr2-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +2 other tests skip
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-1/igt@kms_psr@fbc-psr2-suspend.html
>     - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1406])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-7/igt@kms_psr@fbc-psr2-suspend.html
> 
>   * igt@kms_psr@fbc-psr2-suspend@edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#1406] / [Intel XE#4609])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-7/igt@kms_psr@fbc-psr2-suspend@edp-1.html
> 
>   * igt@kms_psr@pr-sprite-render:
>     - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-6/igt@kms_psr@pr-sprite-render.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#1406] / [Intel XE#2939])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-463/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#455])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-6/igt@kms_setmode@basic-clone-single-crtc.html
>     - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#1435])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html
>     - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#1435])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-8/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_vrr@cmrr:
>     - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2168])
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-4/igt@kms_vrr@cmrr.html
> 
>   * igt@kms_vrr@cmrr@pipe-a-edp-1:
>     - shard-lnl:          [PASS][107] -> [FAIL][108] ([Intel XE#4459]) +1 other test fail
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@seamless-rr-switch-drrs:
>     - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#1499])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-drrs.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x3fff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#1123])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
> 
>   * igt@xe_copy_basic@mem-page-copy-1:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#5300])
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-466/igt@xe_copy_basic@mem-page-copy-1.html
> 
>   * igt@xe_eudebug@basic-close:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#4837]) +8 other tests skip
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-432/igt@xe_eudebug@basic-close.html
> 
>   * igt@xe_eudebug@connect-user:
>     - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#4837] / [Intel XE#5565])
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-4/igt@xe_eudebug@connect-user.html
>     - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#4837])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-5/igt@xe_eudebug@connect-user.html
> 
>   * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
>     - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#4837]) +3 other tests skip
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-5/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html
> 
>   * igt@xe_eudebug_sriov@deny-sriov:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#4518])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-463/igt@xe_eudebug_sriov@deny-sriov.html
>     - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#4518])
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-8/igt@xe_eudebug_sriov@deny-sriov.html
> 
>   * igt@xe_evict@evict-large-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#261] / [Intel XE#5564])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-8/igt@xe_evict@evict-large-multi-vm.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [PASS][119] -> [INCOMPLETE][120] ([Intel XE#6321]) +1 other test incomplete
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
>     - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#688]) +2 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#1392] / [Intel XE#5575]) +1 other test skip
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2322]) +3 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
>     - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#1392]) +1 other test skip
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
> 
>   * igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:
>     - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#288] / [Intel XE#5561]) +2 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-2/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#288]) +19 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html
> 
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - shard-adlp:         [PASS][127] -> [DMESG-WARN][128] ([Intel XE#3876])
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-adlp-4/igt@xe_exec_reset@parallel-gt-reset.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-4/igt@xe_exec_reset@parallel-gt-reset.html
> 
>   * igt@xe_exec_system_allocator@many-64k-mmap-huge:
>     - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#5007])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-8/igt@xe_exec_system_allocator@many-64k-mmap-huge.html
> 
>   * igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset:
>     - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#5007])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-2/igt@xe_exec_system_allocator@many-64k-mmap-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@many-large-execqueues-mmap-race:
>     - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#4915]) +30 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-3/igt@xe_exec_system_allocator@many-large-execqueues-mmap-race.html
> 
>   * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#4915]) +218 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-466/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge-nomemset:
>     - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#4943]) +2 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-4/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-huge-nomemset:
>     - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#4943]) +4 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-huge-nomemset.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#255])
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-434/igt@xe_huc_copy@huc_copy.html
> 
>   * igt@xe_live_ktest@xe_migrate:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][136] ([Intel XE#3099]) +5 other tests fail
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-433/igt@xe_live_ktest@xe_migrate.html
> 
>   * igt@xe_oa@disabled-read-error:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#3573]) +5 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-463/igt@xe_oa@disabled-read-error.html
> 
>   * igt@xe_oa@mmio-triggered-reports-read:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#6032])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-434/igt@xe_oa@mmio-triggered-reports-read.html
> 
>   * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][139] ([Intel XE#1173]) +1 other test fail
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-435/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html
> 
>   * igt@xe_pm@s2idle-d3cold-basic-exec:
>     - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#2284])
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-1/igt@xe_pm@s2idle-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s2idle-multiple-execs:
>     - shard-adlp:         [PASS][141] -> [INCOMPLETE][142] ([Intel XE#4504])
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-adlp-6/igt@xe_pm@s2idle-multiple-execs.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-8/igt@xe_pm@s2idle-multiple-execs.html
> 
>   * igt@xe_pm@s3-vm-bind-prefetch:
>     - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#584])
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-8/igt@xe_pm@s3-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-dg2-set2:     [PASS][144] -> [FAIL][145] ([Intel XE#6339])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-dg2-463/igt@xe_pm@s4-basic.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-464/igt@xe_pm@s4-basic.html
>     - shard-bmg:          [PASS][146] -> [FAIL][147] ([Intel XE#6339])
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-bmg-8/igt@xe_pm@s4-basic.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-1/igt@xe_pm@s4-basic.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-lnl:          [PASS][148] -> [FAIL][149] ([Intel XE#6339])
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-lnl-3/igt@xe_pm@s4-d3hot-basic-exec.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-5/igt@xe_pm@s4-d3hot-basic-exec.html
>     - shard-adlp:         [PASS][150] -> [FAIL][151] ([Intel XE#6339])
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   * igt@xe_pm_residency@idle-residency:
>     - shard-dg2-set2:     [PASS][152] -> [FAIL][153] ([Intel XE#6362]) +1 other test fail
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-dg2-464/igt@xe_pm_residency@idle-residency.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-435/igt@xe_pm_residency@idle-residency.html
> 
>   * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#4733]) +2 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-463/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
> 
>   * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#4733])
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-6/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
>     - shard-adlp:         NOTRUN -> [SKIP][156] ([Intel XE#4733] / [Intel XE#5594])
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-6/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
> 
>   * igt@xe_query@multigpu-query-invalid-cs-cycles:
>     - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#944]) +1 other test skip
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#944])
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-436/igt@xe_query@multigpu-query-invalid-cs-cycles.html
> 
>   * igt@xe_render_copy@render-stress-0-copies:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#4814])
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-435/igt@xe_render_copy@render-stress-0-copies.html
> 
>   * igt@xe_sriov_auto_provisioning@exclusive-ranges:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][160] ([Intel XE#4130])
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-436/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
> 
>   * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
>     - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#4130])
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-7/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
> 
>   * igt@xe_sriov_flr@flr-twice:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][162] ([Intel XE#4273])
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-463/igt@xe_sriov_flr@flr-twice.html
> 
>   * igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:
>     - shard-adlp:         [PASS][163] -> [DMESG-FAIL][164] ([Intel XE#3868] / [Intel XE#5213] / [Intel XE#5545]) +1 other test dmesg-fail
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-adlp-6/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-6/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
>     - shard-adlp:         [DMESG-FAIL][165] ([Intel XE#4543]) -> [PASS][166] +9 other tests pass
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-adlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-3/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>     - shard-bmg:          [SKIP][167] ([Intel XE#2291]) -> [PASS][168] +5 other tests pass
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-bmg:          [FAIL][169] ([Intel XE#1475]) -> [PASS][170]
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_dp_link_training@non-uhbr-sst:
>     - shard-bmg:          [SKIP][171] ([Intel XE#4354]) -> [PASS][172]
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-sst.html
> 
>   * igt@kms_flip@2x-flip-vs-wf_vblank:
>     - shard-bmg:          [SKIP][173] ([Intel XE#2316]) -> [PASS][174] +4 other tests pass
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>     - shard-lnl:          [FAIL][175] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][176] +1 other test pass
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> 
>   * igt@kms_flip@flip-vs-panning-interruptible:
>     - shard-adlp:         [DMESG-WARN][177] ([Intel XE#4543] / [Intel XE#5208]) -> [PASS][178]
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-adlp-4/igt@kms_flip@flip-vs-panning-interruptible.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-3/igt@kms_flip@flip-vs-panning-interruptible.html
> 
>   * igt@kms_flip@plain-flip-interruptible@b-hdmi-a1:
>     - shard-adlp:         [DMESG-WARN][179] ([Intel XE#4543]) -> [PASS][180] +8 other tests pass
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-adlp-6/igt@kms_flip@plain-flip-interruptible@b-hdmi-a1.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-3/igt@kms_flip@plain-flip-interruptible@b-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         [DMESG-FAIL][181] ([Intel XE#4543] / [Intel XE#4921]) -> [PASS][182] +3 other tests pass
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@psr-suspend:
>     - shard-lnl:          [ABORT][183] -> [PASS][184]
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-suspend.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-suspend.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend:
>     - shard-adlp:         [DMESG-WARN][185] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][186] +5 other tests pass
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-lnl:          [FAIL][187] ([Intel XE#718]) -> [PASS][188]
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_rpm@i2c:
>     - shard-dg2-set2:     [FAIL][189] ([Intel XE#5099]) -> [PASS][190]
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-dg2-432/igt@kms_pm_rpm@i2c.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-436/igt@kms_pm_rpm@i2c.html
> 
>   * igt@xe_exec_threads@threads-bal-mixed-fd-userptr-rebind:
>     - shard-dg2-set2:     [INCOMPLETE][191] -> [PASS][192]
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-rebind.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-rebind.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-adlp:         [FAIL][193] ([Intel XE#6339]) -> [PASS][194] +2 other tests pass
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-adlp-8/igt@xe_pm@s4-basic-exec.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
>     - shard-lnl:          [FAIL][195] ([Intel XE#6339]) -> [PASS][196] +1 other test pass
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-lnl-4/igt@xe_pm@s4-basic-exec.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-dg2-set2:     [ABORT][197] ([Intel XE#1727] / [Intel XE#4760]) -> [PASS][198]
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-dg2-464/igt@xe_pm@s4-exec-after.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-464/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_enhance1:
>     - shard-bmg:          [DMESG-WARN][199] ([Intel XE#3876] / [Intel XE#3970]) -> [PASS][200] +1 other test pass
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-bmg-5/igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_enhance1.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-7/igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_enhance1.html
> 
>   * igt@xe_pmu@gt-frequency:
>     - shard-dg2-set2:     [FAIL][201] ([Intel XE#4819]) -> [PASS][202] +1 other test pass
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-dg2-434/igt@xe_pmu@gt-frequency.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-436/igt@xe_pmu@gt-frequency.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][203] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][204] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345])
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     [INCOMPLETE][205] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522] / [Intel XE#6014]) -> [INCOMPLETE][206] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#6014])
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-bmg:          [SKIP][207] ([Intel XE#2341]) -> [FAIL][208] ([Intel XE#1178])
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-bmg-6/igt@kms_content_protection@lic-type-0.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-5/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
>     - shard-bmg:          [SKIP][209] ([Intel XE#2312]) -> [SKIP][210] ([Intel XE#2311]) +9 other tests skip
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][211] ([Intel XE#5390]) -> [SKIP][212] ([Intel XE#2312]) +3 other tests skip
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-bmg:          [SKIP][213] ([Intel XE#2312]) -> [SKIP][214] ([Intel XE#5390]) +7 other tests skip
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][215] ([Intel XE#2311]) -> [SKIP][216] ([Intel XE#2312]) +10 other tests skip
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
>     - shard-bmg:          [SKIP][217] ([Intel XE#2313]) -> [SKIP][218] ([Intel XE#2312]) +5 other tests skip
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
>     - shard-bmg:          [SKIP][219] ([Intel XE#2312]) -> [SKIP][220] ([Intel XE#2313]) +10 other tests skip
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [SKIP][221] ([Intel XE#2426]) -> [FAIL][222] ([Intel XE#1729])
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][223] ([Intel XE#2426]) -> [SKIP][224] ([Intel XE#2509])
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic:
>     - shard-adlp:         [SKIP][225] ([Intel XE#1392] / [Intel XE#5575]) -> [DMESG-FAIL][226] ([Intel XE#5213])
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-adlp-4/igt@xe_exec_basic@multigpu-once-basic.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-6/igt@xe_exec_basic@multigpu-once-basic.html
> 
>   * igt@xe_query@multigpu-query-invalid-cs-cycles:
>     - shard-adlp:         [FAIL][227] -> [SKIP][228] ([Intel XE#944])
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63/shard-adlp-3/igt@xe_query@multigpu-query-invalid-cs-cycles.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/shard-adlp-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html
> 
>   
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
>   [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#3099]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
>   [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
>   [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
>   [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
>   [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>   [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
>   [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
>   [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
>   [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
>   [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
>   [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
>   [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5099]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5099
>   [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
>   [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
>   [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
>   [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
>   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>   [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
>   [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
>   [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
>   [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
>   [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#6014]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6014
>   [Intel XE#6032]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6032
>   [Intel XE#6070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6070
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6313
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6339
>   [Intel XE#6362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6362
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8602 -> IGT_8603
>   * Linux: xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63 -> xe-pw-156768v1
> 
>   IGT_8602: dd1fe429664020db97237b4e77d594dd763a7eae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8603: e6eb3c0fe0f28f3d6e530ae202fbb9f29bde9147 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4012-7fc84082559afd3f2019c4af5b1490548d58db63: 7fc84082559afd3f2019c4af5b1490548d58db63
>   xe-pw-156768v1: 156768v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156768v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
