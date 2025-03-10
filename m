Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C2EC28B2E
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 18:05:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA2410E4A6;
	Mon, 10 Mar 2025 18:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PQjUpSsC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BEFB10E4A4
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 18:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741629928; x=1773165928;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=bDgBqWuUHXlHQak9Y2kKO3zqyYgwNR7rw/Wb9pRbx9Y=;
 b=PQjUpSsCrZ9lO/jqyEarANgBeRnd0vkcSCrdITEQrFLug6jM9txVYY7t
 ajNIYvBhy+ZHwEFEicXRMc+AIejsunoGi4hRPDab08GuckPmvglU81MCv
 2tg6EeEA4zaXfZ7EGAz1YSKbM/JyM8i7qcEuttAI6jEtzifq9wZFzZp2w
 4KZWs6qqKqYrI7TMPjLTgSBLNrr9RgY4rgrik5WRZz4ELewSkqMrN0xf5
 EnIqK60YxQOPexrFGzWyuxOlf7krfBMqHWfdV4RCxrQ5ZQTczcomFJZae
 gJ4g1XqcEEt5ehYzNosINB4MA1YeHHOb+nkrhHiDT5mVjLDf2IFBhgGbr g==;
X-CSE-ConnectionGUID: jhEcZ0eiTpq7bwNQsypjGQ==
X-CSE-MsgGUID: n6I1z/BfSeehZT/Ae+zHsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="54017065"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="54017065"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 11:05:23 -0700
X-CSE-ConnectionGUID: koeT2a7uQ+Sp6F8P2GItFw==
X-CSE-MsgGUID: M229hyoKRUavKpt3KUATpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="120760799"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 11:05:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 10 Mar 2025 11:05:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 10 Mar 2025 11:05:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 11:05:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqbQh07Z/GLvWE/8v9TjnCOqBrRJfQLapP4B1kgoOhmLUMs/Hwfd9KISJjh+qD5vMETl8XOH6Z+S8AX4NTef1Fju3+ClFeid9DQ52uTo48Gb7oNEQOl5kPa781AuXe+geSk8c/rXx3cjc1Z7RsEetkMg3MYiwSHBsNCzWnM6SfcvZ2eYm5A9LK0ejoNh0LV8KM5/y4e7kPCn7QuuguhoWYTG764vrO4juo02xqxWcIoytCFP8SbwrKIVIeVPEe1oMBjdH8pKWzYyzNoCG3r52Bo8rkeJqcP08vH7V8VWTWfOsu/Coqc0plOFQsKRUXEbbD0+wUf/xxyc6lQiVBUqyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CrpS5bEnVTUOGjZ+eK4yBVq+bUStrtSQlVcDIy4oq3k=;
 b=I19ltua21jWJJiLLb6TZHfV4fJZ8Emke/mBckG9eMWykYZtBdiU6zsvN/YiZXuohrjb4wJqFypWHrv++33DNe8QPZw2z1kT/gDNoWUVRFCiVqFDGfd1ASTMUmsK08IAPiuhzMxPHrJfq3+4Rlt+Q589rFSmCDCnJKHTFlSu+c+dwIfUCBedZ3mqd1MXX9+jcyD4TosTg/FebiBavwKkCv+pd4FP7GALbpYwiohwl6WETWWaepxoEt7IYw5zUtbK/t8FdtWI6QMBMNBptYWuJnz8P99byHsKOjQ+Cv3di4TfhRafw2QbjH6yuJJWrH9fwxiATWxvvA43iwHfVo6zbCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB7197.namprd11.prod.outlook.com (2603:10b6:208:41a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 18:05:16 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8511.026; Mon, 10 Mar 2025
 18:05:16 +0000
Date: Mon, 10 Mar 2025 11:05:13 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?= =?utf-8?Q?re?= for
 drm/xe/xe3: Recognize 3DSTATE_COARSE_PIXEL to LRC dumps
Message-ID: <20250310180513.GG3175483@mdroper-desk1.amr.corp.intel.com>
References: <20250307190754.678376-2-matthew.d.roper@intel.com>
 <174151143438.8532.16333342920926986454@18a75f3d1eae>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <174151143438.8532.16333342920926986454@18a75f3d1eae>
X-ClientProxiedBy: BYAPR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB7197:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ab0485b-d1d9-4ede-7f36-08dd5ffe1c94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u5QDEEbvxi1BsGbyVwm9nJBldaQuIqEr080Z6jqp4ryB/K3KTVLjBo+V2LN6?=
 =?us-ascii?Q?vio8C4T6y3eBFAac6+zq6if0sNJxA1Jxopro1S7KN2+AR1m9uo1/shm/Hor5?=
 =?us-ascii?Q?PDYJuZa9iGA1sJ/IagsPHhvsbUmyfm+SOoIZ5o/qZoywJ65VJW3pT4dshMl7?=
 =?us-ascii?Q?BbvfmWSclPDY8odgvcBcBy9WJDzdSNhoDWbmV4fxXBa8VoqguqNUKcFJWtsw?=
 =?us-ascii?Q?pP2jZG3rCtiQlOZkwxX5NubwpiFqkpZm1wm9ZYcKVj31CMbnjDmPI9tQKaft?=
 =?us-ascii?Q?Rj24Nrkj4Tn3xoxIUCpCUNR/QskFCJDS0yxnywMr1zk+mNOgQiKZNnooOblp?=
 =?us-ascii?Q?K2AtG6hW6rkfN8li8xmtusvhOT006WbACK5sfCXgKF7QNjiUagynJ/RGQ4NC?=
 =?us-ascii?Q?nJjhnrJ9bw/Bn+r07FTC/YYk4c8THCVpHUCkBznyTetR0k8ybDL5SgwrHIju?=
 =?us-ascii?Q?BoodU56KBUMiPOGXJ3CCRfqbauIuWkwPWgHJBerx0oS1jfGMo1AFf0IB5195?=
 =?us-ascii?Q?CoxV+jSbvMjmWrjhcF5DAegN6dbTApc/m7pmNwqOqG4wh8PeVTbnOQF6NsuB?=
 =?us-ascii?Q?GusNOPczJwS1B9DsnpDjbbLnA6V2TWJiVWdf5AZtC4x88tPgbh0tqCfXcFyS?=
 =?us-ascii?Q?w9SBUtJBLqfHrIbFYBx5FlZcI5DZcj0tqrb5HC3s1lDvcrtcLUfZJyckxcdj?=
 =?us-ascii?Q?hy8Is0tIKGuV6YgkJb0kz1eFGP8wxud53od91LnNv7P4IbzmT2GvA1cd0uKv?=
 =?us-ascii?Q?RJAAMzWuNDBqS61tKy4YCBTOjKNGOEWZJP30VEUu6UQLRv/PoGLEwrHFFyRy?=
 =?us-ascii?Q?YlNfySmiNxJW0pKWl1wO3OWy7TpSW3zCYJTCFQEhbvHWl5LBnYul+HgaGgeg?=
 =?us-ascii?Q?nWetwyMBQaYSrAH94Vyqi0vI4uQRMqNiKmNAcPuebTenHl7CVKoGNuWxCC1h?=
 =?us-ascii?Q?F5/l+oj0e3L/x8ODu0w8L3h/BXHzs5LfROgSrZptpt7ppihwKInzzZXdDkkG?=
 =?us-ascii?Q?uiP4c5783NBQFZG8tGvoad8lovzip1sMISL9Gu62NlEP/yR97Bif3p4/FRNG?=
 =?us-ascii?Q?COG5haRkCjU21wGM0T93KmE+dFbVrKBiC4ig/8z2vbMS3DsTT0CaZASEeEQp?=
 =?us-ascii?Q?le1jaTQtY68qpuUkPRfqWrl9couWiqTZdMzLN4qcA1tt6zU3nmYMpaZW64XB?=
 =?us-ascii?Q?8ph3sEdCvvCKu4/6eiolbF0opJxXMHyPKBSmwhNvX3N63Ks1gkPoaIcIWPak?=
 =?us-ascii?Q?jTsp17AJHWDQHEHEEpXRYVa/Dsx+WBNQ9f2p/6K6YLCQMKi0fykSftryN7z8?=
 =?us-ascii?Q?SiyJuc5eNy8fye56RQZxYU6+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hHJKHHBUwhp9/WoHEuDtDxki+fcvR4Ta5zkDB9N5o1S/BOXIJin/ndiCSsjH?=
 =?us-ascii?Q?naZPC2DBHo+T7rp2pfpNI4v8KpApxXNf2ttjRnVyTQB4fJ4u5HhSAme0cl84?=
 =?us-ascii?Q?fsTwB+vUKj/s6zKrENGoe6sPSWPQQYEACkESavWVgRoN4Vu7Q2e9xfx2mi24?=
 =?us-ascii?Q?RzjPJdwVng3Bwx+EiEtLoyyMnpW3IjcGdJB8BEktjltl2xOPGuGoO1JwF4xe?=
 =?us-ascii?Q?LHIfQWAk/g93Af6hZZeE43lCWkOl5hH5exQPzN0KIVxsGGeqWEDWguppD0Bg?=
 =?us-ascii?Q?sJOAOIR5sYPz6opJe93asdn79xZQFTxcoCa60lwN02M5gC5ROrv3esxsAuB/?=
 =?us-ascii?Q?kyO6wZkjx9fzT9nOPEZXb4/qpHFsQQKXTFObYA0WjH8syt70gQ75TIWfyMtB?=
 =?us-ascii?Q?Z1t609Q1ZRC5o+qlUKxO76mq4+vTUpFlPf8Ko7CoFlmmsCB5PH2kDXpAfDS8?=
 =?us-ascii?Q?Sd1VFoi4sna9PPP8ubdqOb494DUmp8j8xy6chSAIwO+sDwTArqTvJ+1DosIX?=
 =?us-ascii?Q?fO0wHfpFs87j+wEA9DfTp+1K0zAMPwNNuDj9KlD3OWhoE3pYUijfCIOmtU9F?=
 =?us-ascii?Q?akXvf+JIOuSU95OOT3CpOS81TnvQA+/3pfI39BaORFhUc1HWOrw9jgrSVUnr?=
 =?us-ascii?Q?7t7MHE7LzKnfqOPd/34/CY0nVndCUQ+x9Hj9ZO19cljmXCQkyo29m/HTx61E?=
 =?us-ascii?Q?OIL3A49UVFPiyxjKuRGWkPkn5F0QHHRHfbO0NvpF7q5y7o3thTTBmQnVorzx?=
 =?us-ascii?Q?nXx/y9lCXfB0G/pcCK7VbZuAVm8pkaFvNY+dynuCvRkV7Xa/47udGCNcDfxc?=
 =?us-ascii?Q?P+Y4emtwgHujin8oTDqyjZBRHQUjV+Kr4oaaKv4GQAuRBWKANxnuXSee9zjX?=
 =?us-ascii?Q?XVBkQdLNPzdqSpSplvqOdT/25VvxSguzviQgyOJe6OkF6xHgEtnXOIDobF61?=
 =?us-ascii?Q?5jwAlyTm9uAAiYGEiafTSTvKT4TYzkLm1LnXC8UfHcX5heMaKZ4P0YTRy07p?=
 =?us-ascii?Q?SDXdPgXYttzFV4e3uMQFlrS2KBSWr1gnsuMdDy+hl3KpxqzV5NcfAfcNM+dp?=
 =?us-ascii?Q?lFpXl9RusFtewHXx2D9rpWH0Zk+3QmE7QRGbswVlEIfJHZaBPHcaVHjfb50x?=
 =?us-ascii?Q?oq8iVyZP3mHukj3SYW+Q78OThVMsi3diqVe54lTmUhHvUnPKLAe94augJptY?=
 =?us-ascii?Q?Wla9n2inT6i+ofIvMgShmWjQhqP4lMgrU321k6hJdy70GfweBpppUlj/TuR3?=
 =?us-ascii?Q?ZrcCMSCQ75b4mXxCU+SrRb7zp67s73jvEkmeVJ21TRvtrf62bxb/624DElrr?=
 =?us-ascii?Q?/HIJuB8xFFSRQ495opbQLrM4RkKqcmvmjXOboAaD4hMfLab9fV+q9w9CAD1F?=
 =?us-ascii?Q?aOanfAxS9NXcqUt+r8L85DnAUlrsUxgCM3D5LdK98avPqLo9+J6dj3bMuP0d?=
 =?us-ascii?Q?sKZxYxP5sedC1T49PeFTl4ftxDagieIUn3Hj0/AjJePhxnh+SJBgvgRfea9p?=
 =?us-ascii?Q?15nqEFoQtl1CH8qsUzB8ZuoAA1FCXuMrqh8miJ5OZRjL3Kv1pMnu2WFUlPzN?=
 =?us-ascii?Q?W4BAf8joWUhYemIcaPE06LUu2m252zqcbQ4JO8QDMMxS4yLJwaSSh4x+9f2y?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab0485b-d1d9-4ede-7f36-08dd5ffe1c94
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 18:05:16.5302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DI7jZJ92wacADj9GW5iPz4/OmuZLpTQvN8v8KKAGuUQvm0iRU5r3LKMVGO+DuYGqtaMcBQ/hFKaAWlWD4FEUfKgIr/ZqrbgZ4yIsh5atZYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7197
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

On Sun, Mar 09, 2025 at 09:10:34AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xe3: Recognize 3DSTATE_COARSE_PIXEL to LRC dumps
> URL   : https://patchwork.freedesktop.org/series/146021/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2778-f811577f424491a57b1e8669bde62998227d6907_full -> xe-pw-146021v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-146021v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-146021v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-146021v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pm_rpm@basic-pci-d3-state:
>     - shard-dg2-set2:     [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-464/igt@kms_pm_rpm@basic-pci-d3-state.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@kms_pm_rpm@basic-pci-d3-state.html

Device didn't enter D3 as expected.  Seems like we've had several
previous tickets for this issue closed due to the very low reproduction
rate:

 - https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1753
 - https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3129
 - https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3609
 - https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4201

> 
>   * igt@xe_ccs@suspend-resume:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][3] +1 other test incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-8/igt@xe_ccs@suspend-resume.html

System never came back from suspend.  No logs.

> 
>   * igt@xe_oa@buffer-fill:
>     - shard-lnl:          [PASS][4] -> [FAIL][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-8/igt@xe_oa@buffer-fill.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-4/igt@xe_oa@buffer-fill.html
> 
>   * igt@xe_oa@buffer-fill@rcs-0:
>     - shard-lnl:          NOTRUN -> [FAIL][6]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-4/igt@xe_oa@buffer-fill@rcs-0.html

OA buffer overflowed; does appear to be related to this LRC debugging
change.


Patch applied to drm-xe-next.  Thanks Sai Teja for the review.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-146021v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_3d:
>     - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1465])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-6/igt@kms_3d.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2233])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#3157])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-9/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
>     - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#3157])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events:
>     - shard-adlp:         [PASS][11] -> [DMESG-WARN][12] ([Intel XE#4330]) +3 other tests dmesg-warn
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#2550] / [Intel XE#3767]) +7 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#3279])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
>     - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1124]) +10 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-8/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1407]) +6 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#316]) +3 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-6/igt@kms_big_fb@linear-32bpp-rotate-270.html
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2327]) +5 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#316]) +6 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1124]) +10 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-8/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#610])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1124]) +13 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
>     - shard-adlp:         [PASS][23] -> [DMESG-WARN][24] ([Intel XE#2953] / [Intel XE#4173])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         [PASS][25] -> [DMESG-FAIL][26] ([Intel XE#4330]) +9 other tests dmesg-fail
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][27] ([Intel XE#4330]) +3 other tests dmesg-fail
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#607])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#607])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#607])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
>     - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1477])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#610])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#1124]) +20 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>     - shard-dg2-set2:     [PASS][34] -> [SKIP][35] ([Intel XE#2191]) +1 other test skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#2191]) +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-3/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#2191]) +1 other test skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-3/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#2191]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#367]) +2 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>     - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#367]) +2 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
>     - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#367]) +2 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-1/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#367]) +1 other test skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
>     - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#2887]) +25 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#2669]) +7 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-1/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#2907])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#787]) +80 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
>     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#3432])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2887]) +29 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#787]) +187 other tests skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#455] / [Intel XE#787]) +59 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][52] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) +1 other test incomplete
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#2907]) +2 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#455] / [Intel XE#787]) +53 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#4418])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2325])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_color@ctm-negative:
>     - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#306]) +1 other test skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-1/igt@kms_chamelium_color@ctm-negative.html
>     - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#306]) +1 other test skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-2/igt@kms_chamelium_color@ctm-negative.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#306]) +3 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2252]) +13 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd:
>     - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#373]) +10 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#373]) +10 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd.html
>     - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#373]) +10 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-3/igt@kms_chamelium_hpd@vga-hpd.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-bmg:          NOTRUN -> [FAIL][64] ([Intel XE#1178]) +1 other test fail
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-7/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#307])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_content_protection@dp-mst-lic-type-0.html
>     - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#307])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-5/igt@kms_content_protection@dp-mst-lic-type-0.html
>     - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#307])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-9/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2390]) +1 other test skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-2/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2341])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-4/igt@kms_content_protection@type1.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#3278]) +2 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-7/igt@kms_content_protection@uevent.html
>     - shard-bmg:          NOTRUN -> [FAIL][71] ([Intel XE#1188]) +1 other test fail
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-2/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2321])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x10:
>     - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1424]) +8 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-3/igt@kms_cursor_crc@cursor-random-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x32:
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2320]) +8 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-4/igt@kms_cursor_crc@cursor-random-32x32.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#309]) +2 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
>     - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2291]) +1 other test skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
>     - shard-dg2-set2:     [PASS][77] -> [SKIP][78] ([Intel XE#309]) +3 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-432/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#323]) +1 other test skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>     - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#323])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>     - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#323])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2286]) +2 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
>     - shard-bmg:          [PASS][83] -> [SKIP][84] ([Intel XE#2291]) +2 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#309]) +3 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
>     - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#309]) +2 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#4302])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-6/igt@kms_display_modes@extended-mode-basic.html
>     - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#4302])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-4/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-dg2-set2:     [PASS][89] -> [SKIP][90] ([Intel XE#3009])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-433/igt@kms_dp_aux_dev.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_dp_link_training@uhbr-mst:
>     - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#4354]) +1 other test skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-1/igt@kms_dp_link_training@uhbr-mst.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#4356])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@kms_dp_link_training@uhbr-mst.html
> 
>   * igt@kms_dp_link_training@uhbr-sst:
>     - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#4356]) +1 other test skip
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-6/igt@kms_dp_link_training@uhbr-sst.html
>     - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#4354])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-7/igt@kms_dp_link_training@uhbr-sst.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>     - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2244]) +1 other test skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>   * igt@kms_dsc@dsc-with-bpc:
>     - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#2244])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-6/igt@kms_dsc@dsc-with-bpc.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#4422])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
>     - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#4422])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
>     - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#4422])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
>     - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#4422]) +1 other test skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][101] ([Intel XE#4173]) +1 other test dmesg-warn
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-8/igt@kms_fbcon_fbt@fbc-suspend.html
>     - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#4156])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#701])
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-5/igt@kms_feature_discovery@chamelium.html
>     - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#701])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-9/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-dg2-set2:     [PASS][105] -> [SKIP][106] ([Intel XE#702])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-433/igt@kms_feature_discovery@display-2x.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2373])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-4/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#1135])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-1/igt@kms_feature_discovery@psr2.html
>     - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2374])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-4/igt@kms_feature_discovery@psr2.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#1135])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#310]) +8 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>     - shard-bmg:          NOTRUN -> [FAIL][112] ([Intel XE#3321]) +1 other test fail
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][113] ([Intel XE#301]) +4 other tests fail
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race:
>     - shard-bmg:          [PASS][114] -> [SKIP][115] ([Intel XE#2316]) +2 other tests skip
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-bmg-8/igt@kms_flip@2x-modeset-vs-vblank-race.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race.html
> 
>   * igt@kms_flip@2x-nonexisting-fb-interruptible:
>     - shard-dg2-set2:     [PASS][116] -> [SKIP][117] ([Intel XE#310]) +6 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-433/igt@kms_flip@2x-nonexisting-fb-interruptible.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb-interruptible.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate:
>     - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2316])
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check:
>     - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#1421]) +9 other tests skip
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-1/igt@kms_flip@2x-plain-flip-ts-check.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
>     - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#310]) +9 other tests skip
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][121] ([Intel XE#301] / [Intel XE#3321]) +1 other test fail
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
> 
>   * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
>     - shard-lnl:          [PASS][122] -> [FAIL][123] ([Intel XE#886]) +1 other test fail
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#1397]) +2 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>     - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#455]) +32 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#1401]) +4 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][127] ([Intel XE#1401] / [Intel XE#1745]) +4 other tests skip
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2293] / [Intel XE#2380]) +4 other tests skip
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#1397] / [Intel XE#1745]) +2 other tests skip
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         [PASS][130] -> [DMESG-FAIL][131] ([Intel XE#324] / [Intel XE#4330]) +3 other tests dmesg-fail
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
>     - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#2293]) +4 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_force_connector_basic@force-edid:
>     - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#352])
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-1/igt@kms_force_connector_basic@force-edid.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
>     - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#2312]) +17 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#651]) +28 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
>     - shard-dg2-set2:     [PASS][136] -> [SKIP][137] ([Intel XE#656]) +7 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#656]) +53 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#656]) +53 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#4141]) +24 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#651]) +16 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#2311]) +33 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#651]) +15 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
>     - shard-adlp:         NOTRUN -> [SKIP][144] ([Intel XE#1151])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
>     - shard-adlp:         NOTRUN -> [SKIP][145] ([Intel XE#653]) +18 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
>     - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#2313]) +37 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#4439])
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
>     - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#4439])
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#656]) +27 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-slowdraw:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#653]) +34 other tests skip
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-slowdraw.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#1341])
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-8/igt@kms_getfb@getfb-reject-ccs.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#605])
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html
>     - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#605])
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-1/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#1503])
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-adlp:         NOTRUN -> [SKIP][155] ([Intel XE#346]) +1 other test skip
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-4/igt@kms_joiner@basic-big-joiner.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#346]) +1 other test skip
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_joiner@basic-big-joiner.html
>     - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#346]) +1 other test skip
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-6/igt@kms_joiner@basic-big-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-big-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][158] ([Intel XE#346])
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-4/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-adlp:         NOTRUN -> [SKIP][159] ([Intel XE#3012])
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-9/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>     - shard-dg2-set2:     [PASS][160] -> [SKIP][161] ([Intel XE#4328])
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-433/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#2934])
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>   * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>     - shard-adlp:         NOTRUN -> [SKIP][163] ([Intel XE#2925])
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-8/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#2925])
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
>     - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#4090])
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> 
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-bmg:          NOTRUN -> [SKIP][166] ([Intel XE#2486])
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-2/igt@kms_panel_fitting@atomic-fastset.html
> 
>   * igt@kms_plane@plane-position-covered:
>     - shard-lnl:          NOTRUN -> [DMESG-FAIL][167] ([Intel XE#324]) +5 other tests dmesg-fail
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-6/igt@kms_plane@plane-position-covered.html
> 
>   * igt@kms_plane@plane-position-covered@pipe-b-plane-4:
>     - shard-lnl:          NOTRUN -> [DMESG-WARN][168] ([Intel XE#324]) +7 other tests dmesg-warn
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
> 
>   * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-128:
>     - shard-adlp:         NOTRUN -> [FAIL][169] ([Intel XE#1874]) +3 other tests fail
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-8/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-128.html
> 
>   * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][170] ([Intel XE#616]) +4 other tests fail
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html
> 
>   * igt@kms_plane_multiple@tiling-y:
>     - shard-lnl:          NOTRUN -> [SKIP][171] ([Intel XE#2493])
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-3/igt@kms_plane_multiple@tiling-y.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#2493]) +1 other test skip
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][173] ([Intel XE#2705])
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][174] ([Intel XE#4502])
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
>     - shard-adlp:         NOTRUN -> [SKIP][175] ([Intel XE#2763]) +8 other tests skip
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:
>     - shard-lnl:          NOTRUN -> [SKIP][176] ([Intel XE#2763]) +13 other tests skip
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
>     - shard-adlp:         NOTRUN -> [SKIP][177] ([Intel XE#2763] / [Intel XE#455]) +5 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][178] ([Intel XE#2763]) +8 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][179] ([Intel XE#2763] / [Intel XE#455]) +5 other tests skip
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
>     - shard-bmg:          NOTRUN -> [SKIP][180] ([Intel XE#2763]) +24 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html
> 
>   * igt@kms_pm_backlight@brightness-with-dpms:
>     - shard-bmg:          NOTRUN -> [SKIP][181] ([Intel XE#2938])
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-4/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-bmg:          NOTRUN -> [SKIP][182] ([Intel XE#870]) +1 other test skip
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-7/igt@kms_pm_backlight@fade-with-dpms.html
>     - shard-adlp:         NOTRUN -> [SKIP][183] ([Intel XE#870]) +2 other tests skip
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-4/igt@kms_pm_backlight@fade-with-dpms.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][184] ([Intel XE#870]) +1 other test skip
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_dc@dc5-dpms-negative:
>     - shard-lnl:          NOTRUN -> [SKIP][185] ([Intel XE#1131])
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-4/igt@kms_pm_dc@dc5-dpms-negative.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-bmg:          NOTRUN -> [FAIL][186] ([Intel XE#1430])
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-8/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-lnl:          NOTRUN -> [FAIL][187] ([Intel XE#1430])
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html
>     - shard-adlp:         NOTRUN -> [SKIP][188] ([Intel XE#1129])
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-8/igt@kms_pm_dc@dc6-psr.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][189] ([Intel XE#1129])
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-adlp:         NOTRUN -> [SKIP][190] ([Intel XE#734])
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][191] ([Intel XE#2499])
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_pm_rpm@dpms-non-lpsp:
>     - shard-adlp:         NOTRUN -> [SKIP][192] ([Intel XE#836]) +1 other test skip
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-8/igt@kms_pm_rpm@dpms-non-lpsp.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][193] ([Intel XE#836])
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html
>     - shard-lnl:          NOTRUN -> [SKIP][194] ([Intel XE#1439] / [Intel XE#3141]) +1 other test skip
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-3/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>     - shard-bmg:          NOTRUN -> [SKIP][195] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][196] ([Intel XE#1489]) +10 other tests skip
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
>     - shard-adlp:         NOTRUN -> [SKIP][197] ([Intel XE#1489]) +8 other tests skip
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][198] ([Intel XE#1489]) +10 other tests skip
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][199] ([Intel XE#2893]) +4 other tests skip
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-plane-move:
>     - shard-bmg:          NOTRUN -> [SKIP][200] ([Intel XE#2234] / [Intel XE#2850]) +21 other tests skip
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html
> 
>   * igt@kms_psr@pr-primary-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][201] ([Intel XE#1406]) +4 other tests skip
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-6/igt@kms_psr@pr-primary-blt.html
> 
>   * igt@kms_psr@psr-sprite-plane-move:
>     - shard-adlp:         NOTRUN -> [SKIP][202] ([Intel XE#2850] / [Intel XE#929]) +16 other tests skip
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-3/igt@kms_psr@psr-sprite-plane-move.html
> 
>   * igt@kms_psr@psr2-basic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][203] ([Intel XE#2850] / [Intel XE#929]) +21 other tests skip
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@kms_psr@psr2-basic.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-adlp:         NOTRUN -> [SKIP][204] ([Intel XE#2939])
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-9/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>     - shard-bmg:          NOTRUN -> [SKIP][205] ([Intel XE#2414])
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][206] ([Intel XE#2939])
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-bmg:          NOTRUN -> [SKIP][207] ([Intel XE#3414] / [Intel XE#3904]) +4 other tests skip
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][208] ([Intel XE#3414]) +2 other tests skip
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
>     - shard-lnl:          NOTRUN -> [SKIP][209] ([Intel XE#3414] / [Intel XE#3904]) +2 other tests skip
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-adlp:         NOTRUN -> [SKIP][210] ([Intel XE#1127])
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>     - shard-bmg:          NOTRUN -> [SKIP][211] ([Intel XE#2330]) +1 other test skip
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][212] ([Intel XE#1127]) +1 other test skip
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>     - shard-lnl:          NOTRUN -> [SKIP][213] ([Intel XE#1127])
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-270:
>     - shard-adlp:         NOTRUN -> [SKIP][214] ([Intel XE#3414]) +2 other tests skip
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-1/igt@kms_rotation_crc@sprite-rotation-270.html
> 
>   * igt@kms_scaling_modes@scaling-mode-full-aspect:
>     - shard-bmg:          NOTRUN -> [SKIP][215] ([Intel XE#2413])
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - shard-lnl:          NOTRUN -> [SKIP][216] ([Intel XE#1435])
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-6/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc:
>     - shard-dg2-set2:     [PASS][217] -> [SKIP][218] ([Intel XE#455])
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-432/igt@kms_setmode@invalid-clone-single-crtc.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][219] ([Intel XE#455]) +26 other tests skip
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@kms_vrr@flip-dpms.html
> 
>   * igt@kms_vrr@flip-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][220] ([Intel XE#1499]) +3 other tests skip
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-2/igt@kms_vrr@flip-suspend.html
> 
>   * igt@kms_vrr@lobf:
>     - shard-adlp:         NOTRUN -> [SKIP][221] ([Intel XE#2168]) +1 other test skip
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-3/igt@kms_vrr@lobf.html
>     - shard-bmg:          NOTRUN -> [SKIP][222] ([Intel XE#2168]) +1 other test skip
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-8/igt@kms_vrr@lobf.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][223] ([Intel XE#2168]) +1 other test skip
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_vrr@lobf.html
> 
>   * igt@kms_vrr@seamless-rr-switch-drrs:
>     - shard-lnl:          NOTRUN -> [SKIP][224] ([Intel XE#1499]) +2 other tests skip
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-drrs.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-adlp:         NOTRUN -> [SKIP][225] ([Intel XE#756]) +1 other test skip
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-bmg:          NOTRUN -> [SKIP][226] ([Intel XE#756])
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-4/igt@kms_writeback@writeback-pixel-formats.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][227] ([Intel XE#756])
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@kms_writeback@writeback-pixel-formats.html
>     - shard-lnl:          NOTRUN -> [SKIP][228] ([Intel XE#756]) +1 other test skip
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-3/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>     - shard-bmg:          NOTRUN -> [SKIP][229] ([Intel XE#1091] / [Intel XE#2849])
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> 
>   * igt@xe_ccs@suspend-resume:
>     - shard-adlp:         NOTRUN -> [SKIP][230] ([Intel XE#455] / [Intel XE#488]) +1 other test skip
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-1/igt@xe_ccs@suspend-resume.html
> 
>   * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][231] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfd:
>     - shard-adlp:         NOTRUN -> [SKIP][232] ([Intel XE#1123])
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-9/igt@xe_copy_basic@mem-copy-linear-0xfd.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][233] ([Intel XE#1123])
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfd.html
> 
>   * igt@xe_eu_stall@unprivileged-access:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][234] ([Intel XE#4497])
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@xe_eu_stall@unprivileged-access.html
> 
>   * igt@xe_eudebug@basic-connect:
>     - shard-lnl:          NOTRUN -> [SKIP][235] ([Intel XE#2905]) +12 other tests skip
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-5/igt@xe_eudebug@basic-connect.html
> 
>   * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][236] ([Intel XE#3889]) +1 other test skip
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
> 
>   * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
>     - shard-bmg:          NOTRUN -> [SKIP][237] ([Intel XE#3889]) +1 other test skip
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
> 
>   * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
>     - shard-adlp:         NOTRUN -> [SKIP][238] ([Intel XE#3889])
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-8/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
>     - shard-lnl:          NOTRUN -> [SKIP][239] ([Intel XE#3889])
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-3/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
> 
>   * igt@xe_eudebug@discovery-empty:
>     - shard-adlp:         NOTRUN -> [SKIP][240] ([Intel XE#2905]) +12 other tests skip
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-1/igt@xe_eudebug@discovery-empty.html
> 
>   * igt@xe_eudebug_online@single-step:
>     - shard-bmg:          NOTRUN -> [SKIP][241] ([Intel XE#2905]) +15 other tests skip
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-8/igt@xe_eudebug_online@single-step.html
> 
>   * igt@xe_evict@evict-beng-large-cm:
>     - shard-lnl:          NOTRUN -> [SKIP][242] ([Intel XE#688]) +7 other tests skip
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-3/igt@xe_evict@evict-beng-large-cm.html
> 
>   * igt@xe_evict@evict-large-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][243] ([Intel XE#261] / [Intel XE#688]) +4 other tests skip
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-3/igt@xe_evict@evict-large-multi-vm.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
>     - shard-adlp:         NOTRUN -> [SKIP][244] ([Intel XE#688]) +2 other tests skip
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][245] ([Intel XE#2322]) +11 other tests skip
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
>     - shard-adlp:         NOTRUN -> [SKIP][246] ([Intel XE#1392]) +10 other tests skip
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][247] ([Intel XE#1392]) +10 other tests skip
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
>     - shard-adlp:         NOTRUN -> [SKIP][248] ([Intel XE#288]) +38 other tests skip
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-4/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][249] ([Intel XE#288]) +37 other tests skip
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
> 
>   * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
>     - shard-adlp:         NOTRUN -> [SKIP][250] ([Intel XE#2360])
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-9/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][251] ([Intel XE#2360])
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
> 
>   * igt@xe_exec_reset@cat-error:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][252] ([Intel XE#3868])
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-2/igt@xe_exec_reset@cat-error.html
> 
>   * igt@xe_exec_sip_eudebug@breakpoint-writesip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][253] ([Intel XE#2905]) +15 other tests skip
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][254] ([Intel XE#255])
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@xe_huc_copy@huc_copy.html
> 
>   * igt@xe_live_ktest@xe_eudebug:
>     - shard-lnl:          NOTRUN -> [SKIP][255] ([Intel XE#2833])
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-8/igt@xe_live_ktest@xe_eudebug.html
> 
>   * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>     - shard-adlp:         NOTRUN -> [SKIP][256] ([Intel XE#2229])
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][257] ([Intel XE#2229])
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
>     - shard-lnl:          NOTRUN -> [SKIP][258] ([Intel XE#2229])
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
> 
>   * igt@xe_module_load@load:
>     - shard-lnl:          ([PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283]) -> ([PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288], [PASS][289], [PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294], [PASS][295], [PASS][296], [PASS][297], [PASS][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303], [PASS][304], [PASS][305], [SKIP][306], [PASS][307], [PASS][308], [PASS][309]) ([Intel XE#378])
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-7/igt@xe_module_load@load.html
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-7/igt@xe_module_load@load.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-7/igt@xe_module_load@load.html
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-4/igt@xe_module_load@load.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-3/igt@xe_module_load@load.html
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-3/igt@xe_module_load@load.html
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-6/igt@xe_module_load@load.html
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-6/igt@xe_module_load@load.html
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-5/igt@xe_module_load@load.html
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-5/igt@xe_module_load@load.html
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-6/igt@xe_module_load@load.html
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-1/igt@xe_module_load@load.html
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-6/igt@xe_module_load@load.html
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-5/igt@xe_module_load@load.html
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-5/igt@xe_module_load@load.html
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-1/igt@xe_module_load@load.html
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-4/igt@xe_module_load@load.html
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-4/igt@xe_module_load@load.html
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-8/igt@xe_module_load@load.html
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-1/igt@xe_module_load@load.html
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-1/igt@xe_module_load@load.html
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-4/igt@xe_module_load@load.html
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-8/igt@xe_module_load@load.html
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-3/igt@xe_module_load@load.html
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-8/igt@xe_module_load@load.html
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-4/igt@xe_module_load@load.html
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-1/igt@xe_module_load@load.html
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-7/igt@xe_module_load@load.html
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-6/igt@xe_module_load@load.html
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-6/igt@xe_module_load@load.html
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-6/igt@xe_module_load@load.html
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-6/igt@xe_module_load@load.html
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-1/igt@xe_module_load@load.html
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-5/igt@xe_module_load@load.html
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-5/igt@xe_module_load@load.html
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-5/igt@xe_module_load@load.html
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-4/igt@xe_module_load@load.html
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-4/igt@xe_module_load@load.html
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-4/igt@xe_module_load@load.html
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-5/igt@xe_module_load@load.html
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-8/igt@xe_module_load@load.html
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-8/igt@xe_module_load@load.html
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-8/igt@xe_module_load@load.html
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-5/igt@xe_module_load@load.html
>    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-7/igt@xe_module_load@load.html
>    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-7/igt@xe_module_load@load.html
>    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-1/igt@xe_module_load@load.html
>    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-1/igt@xe_module_load@load.html
>    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-3/igt@xe_module_load@load.html
>    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-3/igt@xe_module_load@load.html
>    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-3/igt@xe_module_load@load.html
>     - shard-adlp:         ([PASS][310], [PASS][311], [PASS][312], [PASS][313], [PASS][314], [PASS][315], [PASS][316], [PASS][317], [PASS][318], [PASS][319], [PASS][320], [PASS][321], [PASS][322], [PASS][323], [PASS][324], [PASS][325], [PASS][326], [PASS][327], [PASS][328], [PASS][329], [PASS][330], [PASS][331], [PASS][332], [PASS][333], [PASS][334]) -> ([PASS][335], [PASS][336], [PASS][337], [PASS][338], [PASS][339], [PASS][340], [PASS][341], [PASS][342], [PASS][343], [PASS][344], [PASS][345], [PASS][346], [PASS][347], [PASS][348], [PASS][349], [SKIP][350], [PASS][351], [PASS][352], [PASS][353], [PASS][354], [PASS][355], [PASS][356], [PASS][357], [PASS][358], [PASS][359], [PASS][360]) ([Intel XE#378])
>    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-9/igt@xe_module_load@load.html
>    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-2/igt@xe_module_load@load.html
>    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-2/igt@xe_module_load@load.html
>    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-3/igt@xe_module_load@load.html
>    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-6/igt@xe_module_load@load.html
>    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-3/igt@xe_module_load@load.html
>    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-8/igt@xe_module_load@load.html
>    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-4/igt@xe_module_load@load.html
>    [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-4/igt@xe_module_load@load.html
>    [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-1/igt@xe_module_load@load.html
>    [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-1/igt@xe_module_load@load.html
>    [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-8/igt@xe_module_load@load.html
>    [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-8/igt@xe_module_load@load.html
>    [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-8/igt@xe_module_load@load.html
>    [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-2/igt@xe_module_load@load.html
>    [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-3/igt@xe_module_load@load.html
>    [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-9/igt@xe_module_load@load.html
>    [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-1/igt@xe_module_load@load.html
>    [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-1/igt@xe_module_load@load.html
>    [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-4/igt@xe_module_load@load.html
>    [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-4/igt@xe_module_load@load.html
>    [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-6/igt@xe_module_load@load.html
>    [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-6/igt@xe_module_load@load.html
>    [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-6/igt@xe_module_load@load.html
>    [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-2/igt@xe_module_load@load.html
>    [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-1/igt@xe_module_load@load.html
>    [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-1/igt@xe_module_load@load.html
>    [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-8/igt@xe_module_load@load.html
>    [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-8/igt@xe_module_load@load.html
>    [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-1/igt@xe_module_load@load.html
>    [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-8/igt@xe_module_load@load.html
>    [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-1/igt@xe_module_load@load.html
>    [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-9/igt@xe_module_load@load.html
>    [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-9/igt@xe_module_load@load.html
>    [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-9/igt@xe_module_load@load.html
>    [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-2/igt@xe_module_load@load.html
>    [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-6/igt@xe_module_load@load.html
>    [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-2/igt@xe_module_load@load.html
>    [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-2/igt@xe_module_load@load.html
>    [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-6/igt@xe_module_load@load.html
>    [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-2/igt@xe_module_load@load.html
>    [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-6/igt@xe_module_load@load.html
>    [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-2/igt@xe_module_load@load.html
>    [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-3/igt@xe_module_load@load.html
>    [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-3/igt@xe_module_load@load.html
>    [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-3/igt@xe_module_load@load.html
>    [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-3/igt@xe_module_load@load.html
>    [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-4/igt@xe_module_load@load.html
>    [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-4/igt@xe_module_load@load.html
>    [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-4/igt@xe_module_load@load.html
>    [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-4/igt@xe_module_load@load.html
>     - shard-dg2-set2:     ([PASS][361], [PASS][362], [PASS][363], [PASS][364], [PASS][365], [PASS][366], [PASS][367], [PASS][368], [PASS][369], [PASS][370], [PASS][371], [PASS][372], [PASS][373], [PASS][374], [PASS][375], [PASS][376], [PASS][377], [PASS][378], [PASS][379], [PASS][380], [PASS][381], [PASS][382], [PASS][383], [PASS][384], [PASS][385]) -> ([PASS][386], [PASS][387], [PASS][388], [PASS][389], [PASS][390], [PASS][391], [PASS][392], [PASS][393], [PASS][394], [PASS][395], [PASS][396], [PASS][397], [PASS][398], [PASS][399], [PASS][400], [PASS][401], [PASS][402], [PASS][403], [PASS][404], [PASS][405], [PASS][406], [PASS][407], [SKIP][408], [PASS][409], [PASS][410], [PASS][411]) ([Intel XE#378])
>    [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-464/igt@xe_module_load@load.html
>    [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-432/igt@xe_module_load@load.html
>    [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-464/igt@xe_module_load@load.html
>    [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-432/igt@xe_module_load@load.html
>    [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-464/igt@xe_module_load@load.html
>    [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-432/igt@xe_module_load@load.html
>    [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-433/igt@xe_module_load@load.html
>    [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-464/igt@xe_module_load@load.html
>    [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-432/igt@xe_module_load@load.html
>    [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-433/igt@xe_module_load@load.html
>    [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-432/igt@xe_module_load@load.html
>    [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-433/igt@xe_module_load@load.html
>    [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-432/igt@xe_module_load@load.html
>    [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-432/igt@xe_module_load@load.html
>    [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-433/igt@xe_module_load@load.html
>    [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-433/igt@xe_module_load@load.html
>    [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-464/igt@xe_module_load@load.html
>    [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-464/igt@xe_module_load@load.html
>    [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-464/igt@xe_module_load@load.html
>    [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-464/igt@xe_module_load@load.html
>    [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-464/igt@xe_module_load@load.html
>    [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-433/igt@xe_module_load@load.html
>    [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-432/igt@xe_module_load@load.html
>    [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-464/igt@xe_module_load@load.html
>    [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-464/igt@xe_module_load@load.html
>    [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@xe_module_load@load.html
>    [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@xe_module_load@load.html
>    [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@xe_module_load@load.html
>    [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@xe_module_load@load.html
>    [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@xe_module_load@load.html
>    [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@xe_module_load@load.html
>    [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@xe_module_load@load.html
>    [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@xe_module_load@load.html
>    [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@xe_module_load@load.html
>    [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@xe_module_load@load.html
>    [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@xe_module_load@load.html
>    [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@xe_module_load@load.html
>    [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@xe_module_load@load.html
>    [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@xe_module_load@load.html
>    [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@xe_module_load@load.html
>    [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@xe_module_load@load.html
>    [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@xe_module_load@load.html
>    [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@xe_module_load@load.html
>    [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@xe_module_load@load.html
>    [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@xe_module_load@load.html
>    [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@xe_module_load@load.html
>    [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@xe_module_load@load.html
>    [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@xe_module_load@load.html
>    [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@xe_module_load@load.html
>    [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@xe_module_load@load.html
>    [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@xe_module_load@load.html
> 
>   * igt@xe_oa@oa-tlb-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][412] ([Intel XE#2248])
>    [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-6/igt@xe_oa@oa-tlb-invalidate.html
>     - shard-bmg:          NOTRUN -> [SKIP][413] ([Intel XE#2248])
>    [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-8/igt@xe_oa@oa-tlb-invalidate.html
> 
>   * igt@xe_oa@polling-small-buf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][414] ([Intel XE#2541] / [Intel XE#3573]) +6 other tests skip
>    [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@xe_oa@polling-small-buf.html
> 
>   * igt@xe_oa@rc6-disable:
>     - shard-adlp:         NOTRUN -> [SKIP][415] ([Intel XE#2541] / [Intel XE#3573]) +6 other tests skip
>    [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-8/igt@xe_oa@rc6-disable.html
> 
>   * igt@xe_oa@syncs-syncobj-wait-cfg:
>     - shard-adlp:         NOTRUN -> [SKIP][416] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +1 other test skip
>    [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-2/igt@xe_oa@syncs-syncobj-wait-cfg.html
> 
>   * igt@xe_oa@syncs-ufence-wait-cfg:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][417] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +1 other test skip
>    [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@xe_oa@syncs-ufence-wait-cfg.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - shard-adlp:         NOTRUN -> [SKIP][418] ([Intel XE#977])
>    [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-3/igt@xe_pat@pat-index-xe2.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][419] ([Intel XE#977])
>    [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_peer2peer@write:
>     - shard-adlp:         NOTRUN -> [SKIP][420] ([Intel XE#1061])
>    [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-2/igt@xe_peer2peer@write.html
>     - shard-lnl:          NOTRUN -> [SKIP][421] ([Intel XE#1061])
>    [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-1/igt@xe_peer2peer@write.html
> 
>   * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][422] ([Intel XE#1173]) +1 other test fail
>    [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html
> 
>   * igt@xe_pm@d3cold-basic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][423] ([Intel XE#2284] / [Intel XE#366])
>    [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@xe_pm@d3cold-basic.html
> 
>   * igt@xe_pm@d3cold-basic-exec:
>     - shard-lnl:          NOTRUN -> [SKIP][424] ([Intel XE#2284] / [Intel XE#366])
>    [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-8/igt@xe_pm@d3cold-basic-exec.html
>     - shard-adlp:         NOTRUN -> [SKIP][425] ([Intel XE#2284] / [Intel XE#366])
>    [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-6/igt@xe_pm@d3cold-basic-exec.html
> 
>   * igt@xe_pm@d3cold-mocs:
>     - shard-adlp:         NOTRUN -> [SKIP][426] ([Intel XE#2284])
>    [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-4/igt@xe_pm@d3cold-mocs.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][427] ([Intel XE#2284])
>    [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@xe_pm@d3cold-mocs.html
>     - shard-lnl:          NOTRUN -> [SKIP][428] ([Intel XE#2284])
>    [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-6/igt@xe_pm@d3cold-mocs.html
> 
>   * igt@xe_pm@s2idle-d3cold-basic-exec:
>     - shard-bmg:          NOTRUN -> [SKIP][429] ([Intel XE#2284]) +3 other tests skip
>    [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-2/igt@xe_pm@s2idle-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s3-vm-bind-unbind-all:
>     - shard-lnl:          NOTRUN -> [SKIP][430] ([Intel XE#584]) +2 other tests skip
>    [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-6/igt@xe_pm@s3-vm-bind-unbind-all.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][431] ([Intel XE#4268])
>    [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@xe_pm@s4-basic-exec.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-bmg:          NOTRUN -> [ABORT][432] ([Intel XE#4268]) +1 other test abort
>    [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-4/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   * igt@xe_pm@vram-d3cold-threshold:
>     - shard-lnl:          NOTRUN -> [SKIP][433] ([Intel XE#579])
>    [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-7/igt@xe_pm@vram-d3cold-threshold.html
>     - shard-adlp:         NOTRUN -> [SKIP][434] ([Intel XE#579])
>    [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-1/igt@xe_pm@vram-d3cold-threshold.html
> 
>   * igt@xe_query@multigpu-query-invalid-extension:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][435] ([Intel XE#944])
>    [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@xe_query@multigpu-query-invalid-extension.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-guc:
>     - shard-lnl:          NOTRUN -> [SKIP][436] ([Intel XE#944])
>    [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-8/igt@xe_query@multigpu-query-uc-fw-version-guc.html
>     - shard-adlp:         NOTRUN -> [SKIP][437] ([Intel XE#944])
>    [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-6/igt@xe_query@multigpu-query-uc-fw-version-guc.html
>     - shard-bmg:          NOTRUN -> [SKIP][438] ([Intel XE#944])
>    [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-7/igt@xe_query@multigpu-query-uc-fw-version-guc.html
> 
>   * igt@xe_sriov_auto_provisioning@exclusive-ranges:
>     - shard-bmg:          NOTRUN -> [SKIP][439] ([Intel XE#4130])
>    [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-7/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
> 
>   * igt@xe_sriov_flr@flr-twice:
>     - shard-bmg:          NOTRUN -> [SKIP][440] ([Intel XE#4273])
>    [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-2/igt@xe_sriov_flr@flr-twice.html
> 
>   * igt@xe_vm@bind-array-enobufs:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][441] ([Intel XE#4412])
>    [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@xe_vm@bind-array-enobufs.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
>     - shard-adlp:         [FAIL][442] ([Intel XE#3884]) -> [PASS][443] +1 other test pass
>    [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-3/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
>    [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-8/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         [DMESG-FAIL][444] ([Intel XE#4330]) -> [PASS][445] +5 other tests pass
>    [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
>     - shard-bmg:          [SKIP][446] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][447]
>    [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
>    [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][448] ([Intel XE#3113]) -> [PASS][449] +1 other test pass
>    [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>    [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-bmg:          [SKIP][450] ([Intel XE#2291]) -> [PASS][451] +2 other tests pass
>    [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
>    [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_flip@2x-dpms-vs-vblank-race:
>     - shard-dg2-set2:     [SKIP][452] ([Intel XE#310]) -> [PASS][453] +1 other test pass
>    [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race.html
>    [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@kms_flip@2x-dpms-vs-vblank-race.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>     - shard-bmg:          [SKIP][454] ([Intel XE#2316]) -> [PASS][455] +1 other test pass
>    [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
>    [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>     - shard-lnl:          [FAIL][456] ([Intel XE#301]) -> [PASS][457] +1 other test pass
>    [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
>    [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
>     - shard-dg2-set2:     [FAIL][458] ([Intel XE#301]) -> [PASS][459]
>    [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html
>    [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>     - shard-lnl:          [FAIL][460] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][461] +1 other test pass
>    [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
>    [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
>     - shard-dg2-set2:     [INCOMPLETE][462] -> [PASS][463] +1 other test pass
>    [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html
>    [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][464] ([Intel XE#656]) -> [PASS][465]
>    [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
>    [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_joiner@basic-force-big-joiner:
>     - shard-dg2-set2:     [SKIP][466] ([Intel XE#4328]) -> [PASS][467]
>    [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html
>    [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@kms_joiner@basic-force-big-joiner.html
> 
>   * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64:
>     - shard-adlp:         [FAIL][468] ([Intel XE#1471]) -> [PASS][469] +1 other test pass
>    [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-6/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64.html
>    [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-4/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64.html
> 
>   * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
>     - shard-dg2-set2:     [FAIL][470] ([Intel XE#616]) -> [PASS][471] +1 other test pass
>    [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
>    [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
> 
>   * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>     - shard-dg2-set2:     [SKIP][472] ([Intel XE#309]) -> [PASS][473] +4 other tests pass
>    [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-464/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
>    [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-lnl:          [FAIL][474] ([Intel XE#718]) -> [PASS][475]
>    [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html
>    [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][476] ([Intel XE#899]) -> [PASS][477]
>    [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
>    [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
> 
>   * igt@kms_universal_plane@universal-plane-functional@pipe-a-edp-1:
>     - shard-lnl:          [DMESG-WARN][478] ([Intel XE#324]) -> [PASS][479]
>    [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-lnl-1/igt@kms_universal_plane@universal-plane-functional@pipe-a-edp-1.html
>    [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-lnl-1/igt@kms_universal_plane@universal-plane-functional@pipe-a-edp-1.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
>     - shard-dg2-set2:     [SKIP][480] ([Intel XE#1392]) -> [PASS][481] +8 other tests pass
>    [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
>    [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
> 
>   * igt@xe_exec_reset@close-execqueues-close-fd:
>     - shard-adlp:         [DMESG-WARN][482] -> [PASS][483]
>    [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-4/igt@xe_exec_reset@close-execqueues-close-fd.html
>    [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-4/igt@xe_exec_reset@close-execqueues-close-fd.html
> 
>   * igt@xe_pm@s2idle-basic-exec:
>     - shard-adlp:         [DMESG-WARN][484] ([Intel XE#4173]) -> [PASS][485] +3 other tests pass
>    [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-1/igt@xe_pm@s2idle-basic-exec.html
>    [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-1/igt@xe_pm@s2idle-basic-exec.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][486] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][487] ([Intel XE#787]) +1 other test skip
>    [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-464/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
>    [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][488] ([Intel XE#787]) -> [SKIP][489] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
>    [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
>    [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-dg2-set2:     [FAIL][490] ([Intel XE#1178]) -> [SKIP][491] ([Intel XE#455])
>    [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-433/igt@kms_content_protection@srm.html
>    [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_content_protection@srm.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-bmg:          [FAIL][492] ([Intel XE#3321]) -> [SKIP][493] ([Intel XE#2316])
>    [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank.html
>    [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-modeset:
>     - shard-bmg:          [INCOMPLETE][494] ([Intel XE#2049]) -> [SKIP][495] ([Intel XE#2316])
>    [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-bmg-7/igt@kms_flip@2x-flip-vs-modeset.html
>    [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-modeset.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
>     - shard-bmg:          [SKIP][496] ([Intel XE#2311]) -> [SKIP][497] ([Intel XE#2312]) +6 other tests skip
>    [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
>    [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][498] ([Intel XE#4141]) -> [SKIP][499] ([Intel XE#2312]) +2 other tests skip
>    [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>    [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
>     - shard-bmg:          [SKIP][500] ([Intel XE#2312]) -> [SKIP][501] ([Intel XE#2311]) +4 other tests skip
>    [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
>    [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][502] ([Intel XE#656]) -> [SKIP][503] ([Intel XE#651]) +11 other tests skip
>    [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
>    [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][504] ([Intel XE#651]) -> [SKIP][505] ([Intel XE#656]) +19 other tests skip
>    [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>    [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][506] ([Intel XE#653]) -> [SKIP][507] ([Intel XE#656]) +12 other tests skip
>    [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
>    [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][508] ([Intel XE#2313]) -> [SKIP][509] ([Intel XE#2312]) +5 other tests skip
>    [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
>    [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
>     - shard-bmg:          [SKIP][510] ([Intel XE#2312]) -> [SKIP][511] ([Intel XE#2313]) +5 other tests skip
>    [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
>    [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
>     - shard-dg2-set2:     [SKIP][512] ([Intel XE#656]) -> [SKIP][513] ([Intel XE#653]) +10 other tests skip
>    [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
>    [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][514] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][515] ([Intel XE#3544])
>    [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
>    [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@testdisplay:
>     - shard-dg2-set2:     [ABORT][516] -> [ABORT][517] ([Intel XE#2705])
>    [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-dg2-432/igt@testdisplay.html
>    [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-dg2-433/igt@testdisplay.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-adlp:         [ABORT][518] ([Intel XE#4054]) -> [ABORT][519] ([Intel XE#4268])
>    [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/shard-adlp-9/igt@xe_pm@s4-mocs.html
>    [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/shard-adlp-3/igt@xe_pm@s4-mocs.html
> 
>   
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
>   [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
>   [Intel XE#1471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
>   [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>   [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
>   [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
>   [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
>   [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
>   [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
>   [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
>   [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
>   [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
>   [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
>   [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
>   [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
>   [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4054
>   [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
>   [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
>   [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
>   [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
>   [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
>   [Intel XE#4330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
>   [Intel XE#4412]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4412
>   [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
>   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>   [Intel XE#4439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4439
>   [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
>   [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
>   [Intel XE#4502]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4502
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8264 -> IGT_8265
>   * Linux: xe-2778-f811577f424491a57b1e8669bde62998227d6907 -> xe-pw-146021v1
> 
>   IGT_8264: 8264
>   IGT_8265: bfefe166535d69ca10d32e6ba0093260df21ee3d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2778-f811577f424491a57b1e8669bde62998227d6907: f811577f424491a57b1e8669bde62998227d6907
>   xe-pw-146021v1: 146021v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146021v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
