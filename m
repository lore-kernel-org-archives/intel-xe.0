Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F30EC982D8
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 14:56:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34EF10E100;
	Fri, 18 Sep 2026 14:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dJQmQqQd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF2F10E100
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 14:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789743394; x=1821279394;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=OhcvLlRo6bjTviiI8P9G5yDoeqKqNyfhAgDEHDKiLOw=;
 b=dJQmQqQdRf+NJqOcDqpO5bO6u4qok6RqqdRTlWOwqFsbW64RZM8Ab5In
 tlHFFrHzyLysbfMy01M84joU2BnWoGArcIpyPKzU4xVtj2/FBoOIMuJw6
 5KNWKehJL4UlfIY1k20ZwLHaRgYj8MGghpG/Rhis0AiADDzmUyT0qsjNL
 duEg85rcYUQk+CEEdlK9U0TYVoGuA3T3+VdQP8CeXzB05vu1iRlNtZVrV
 KTNOGAtYYOYH3zmfUWOogROcnb5Zk1LP3VVraD2NGvcKVH6paKIVkZaSw
 jhIfKK+9zgucnjyAVs+Uz5TpgTlMQ8nPhp9AcEwy+Hq+aprt71fIAn5D3 Q==;
X-CSE-ConnectionGUID: wRNWaUIITUyVVaCF8PWNXw==
X-CSE-MsgGUID: CX/RyAMZTx+hgffUPWnE3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="101605172"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="101605172"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 07:56:32 -0700
X-CSE-ConnectionGUID: 2yvpjT3OSSqq0br58P1Pfw==
X-CSE-MsgGUID: nnIykmgDSnGt7cVKciOgzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="268177189"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 07:56:32 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 07:56:30 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 07:56:30 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.57) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 07:56:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Grbqf5WvleERNDpPkqS/tYJtt8/j7a3gkd1PzDEnkBczWXHbcTlRl5n+OhzzuQZ7Zi6Wtln5gZB3cK6muqHnG43nGX2ntan4Y+NiioGF3H3OXZdJvdnYsKHEISPjzgLh49QUEh4fIgIICiqtQbc6Nx4hSqgLiZ3ao5Am1JQcCgQ0TxudOvtIZsYFkXMUiHnTSvLQpun5PBdjd2Ufp2XamVyi7JNe7R6wNYYC3Z6YGtcAo7raZgfRt/qJQf+hmkxGRiBHkffYKTWjY/U9YfbGDnGbFJHHqyHqd0Z1ICM0ZnBd/sFeZXmmJw3Mgt9ZXIo3zQO/PgDO8Q9QYiulUnTMTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/OzTqDyCQm9048iAxFOc8WSa9sC1ZdeEO9lU0k11YU=;
 b=fweig4KgqGkHidiMjGlSuCa+zSxK04vkIpzX/H1D6/KJRKJwYBCYHypwLjm5LIY/KcFxcrZujWXhd9I8DvEmgPq8CHQFT6PQcUXEjUPnOI0aNABVPOJfT5ML3bMc4AHdm+xhEPeTiPBOO5fC3OTfJ86S9j36ScrunR5o9xt6PVAnlFrRVOYh5PllQDXsRgv3rw6Hxqygnj1zajuD/IAI2EQoMnp6n2DQxqc4c9UaB0sa3Tp6jIITWKOpQRJ9n+MUWETsJyE7+PdeJW8wMKimFxUbgvuk76/I3a6wp8Qj0WDtETMoWB+9HsrAC/LZxwK6OYDsbC2DAJ1MU1K+aoaoJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB8293.namprd11.prod.outlook.com (2603:10b6:a03:44f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Fri, 18 Sep
 2026 14:56:23 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 14:56:23 +0000
Date: Fri, 18 Sep 2026 07:56:21 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZVTEw6IHN1Y2Nl?= =?utf-8?Q?ss?= for
 drm/xe: Consolidate semaphore instruction definitions
Message-ID: <20260918145621.GD730887@mdroper-desk1.amr.corp.intel.com>
References: <20260917-semaphore_inst-v1-1-61e49405f71d@intel.com>
 <178972248919.181278.1786947660199619668@61270ab9df2a>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <178972248919.181278.1786947660199619668@61270ab9df2a>
X-ClientProxiedBy: BYAPR21CA0004.namprd21.prod.outlook.com
 (2603:10b6:a03:114::14) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB8293:EE_
X-MS-Office365-Filtering-Correlation-Id: 22b95c3d-0823-4706-dad4-08df1595018c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|6133799003|22082099003|18002099003|13003099007|3023799007|4143699003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: ql7QErK2bXWqKsHMGZei8E76sdHn3vgN5/e1LOczRp3vN571YDVFQz4cP2qndHz4j1QZFBDUskG22RiJN/jHZW4oH+WLb28CXKJnrle0rZL5Hw2Frdiz721xWj23GkKQ63FOslq4ueyueocoTBHyn6SKMP6BDsTCZdbTp+eVIpMma8LVX9jjCruSTeLtOBBDOolh4STjk6W/M+afRQ2+02OZui7msbF+KdlqvrTMpQsBswqh52uwb0jCGSoeJoT9MebQ2UTpXYzZFRid4Y5kpGF8ZT5s1V9N6M8M5A9nSxB4UW1ftz4LGdYng6agJcZ3vceTy37swpY//s7h2CD+VMgUUl0z9fKFQoE1/EhbDy34+shgkl0e78Gt253bGTvvels1yhr+H/vM++LFD/5UZm/xIvAM9lpGjw3IzXrzjC8pPKeFsDobI9sARr5JHlmoz/m51f98PqdLVmpGFh2CuJh4FHMVaS8ryRcK8wXAaMT3jpjxo1pIdxdVyOhELabxQOavOp2ANDNEQP3L4TI2xpKwnDQ2Ot07Z3fKd6VIZuEAdRUm2awlgItx9MJ1byufEKS9pM5PPmRujCLy2ITudYUeEpr73Mqkc5+Yzwe+6zw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(22082099003)(18002099003)(13003099007)(3023799007)(4143699003)(10067099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+wAhLgFvvhsfKDDOggCSy+jaR5/59Fi9msU+ZA+FT1pc+huU58uOUpPxaAuJ?=
 =?us-ascii?Q?cvGec2tLahodvlXZXUOzFHjB93KgEyYjJSiTxsD6mn4TZ6RcLuZ7x5EhfkeT?=
 =?us-ascii?Q?iGh5Sqd/16vlhAX2gNKgUr3SEHmFlRk26Z1azT1Lc2oadV+6AiJeeDR4w6dO?=
 =?us-ascii?Q?snYH36AoZBDqfNc8Z7siMkMUcheOw6qVYpjD7C/m7FKSRH5TjgV6QqCX2G7/?=
 =?us-ascii?Q?6/e/4Uwm7lPU8P/3J1wVNJIdphYJ1i+iykHcQkrDWR56YzRNSnL/vAHPkNaO?=
 =?us-ascii?Q?lphJXVy7bgXqhdGDUKfV+ynqzPfZuV2LxURwaUFjUaux6iMP1Xk9++VJtUq8?=
 =?us-ascii?Q?MnxInT2XJx6rnrA2jeqZIcgutMi3hqOvEC/ItJaBAjq2CAWGmhvJTxmniSy6?=
 =?us-ascii?Q?eRn1MEVfn/4ncNGgMfhyzgKjb1CL8Ed8AUO/ZV7Pe9V7ZDS+ZmHkFf4bk7Ho?=
 =?us-ascii?Q?xhgTNTErbG0KwZ+Lr8KZkpPjF6U0fB3YQKegQCBdRX3M5GyYDXrtoZJEGY4W?=
 =?us-ascii?Q?CxA+KLBFYpLXdZ9UXRH6zKQA80cQ8DN7e/dxOduoj7ryoUe08CtUpw1QNHtW?=
 =?us-ascii?Q?Do/hn7R4EacLfU8Rs6Nd8AIb3gYBiQ2ItIrclxhXIlB9JzpbuCL7hZEnXPP6?=
 =?us-ascii?Q?WwekvEo6kayIJbl/BJrtCMre2kxCd7SEtXHpA6pSeDsDyA+0Vp0q1Vg7vVSn?=
 =?us-ascii?Q?CDRGdbUeHpGhluERDiNJR98J6MedVQUCN3OX+9I5iKT6eTyfzvOAtcmRI8Og?=
 =?us-ascii?Q?bVKOjg6kNslTLwT7WflUhQiwzVV1HYB0CgVfqm6SZUTqUVmjd6RXtM/Htzlb?=
 =?us-ascii?Q?x55qF3wigP+7m9o6M1tpsp+GODYH6lwBJ1xiDi8lAiJtSAltoXvNyVXXdX+1?=
 =?us-ascii?Q?ZiktsBMxYtmtGwFt9UonlByIg84OlkD35Oqa4irrDil0eRJfaOfWu6a2JhE7?=
 =?us-ascii?Q?35w36XQcNeUISWXrkneHiFuz+LqQB+xhUW/Qt9TrKuvH+8Z3Gyixo0HfKADI?=
 =?us-ascii?Q?5KEQyAH4Z8m++3N7Tt8UJ8qOMf/vq5zvCz1PyN2zEEI1lyO8agsHOZdQsZuM?=
 =?us-ascii?Q?Iz0wKT2Sm/Qep+ALBHOEnWeB2mqgk74ohww14mn6zQS8Rx8V1FHWc3Xk72lS?=
 =?us-ascii?Q?5o3eUvKFpM/bi+WSAENZBSK+kAMl/CHiA9X0zzpcjP+NgEL0JtY5MgLK1V9z?=
 =?us-ascii?Q?CGUML7JXbZut50bp3MDetkIQVhagEx3XDBF+NVB6yn1hoUMkxLC2Q5vpBKqr?=
 =?us-ascii?Q?pHPabfaanwjRlkR8lH7t3E3AHG3vRoedkDPcLIkPtVe3py05w8v453vpllom?=
 =?us-ascii?Q?D/3vWb8UnagGjbXdaRGn1BWkEJ7OE+E4H/X1SztrrAiPYs3w5Z8Hn5aTZy8C?=
 =?us-ascii?Q?vOD9eoeko1BXhpPS9NuNIAhikpr/P4kAfrKZPHkxzQe+5de+F4ULRNe7AZ4h?=
 =?us-ascii?Q?yIfnVKkJQIU/KYFDSwBvdgeVid05XqKCmzMGOSpnjTEp5LKMu+Nsqn6WwREv?=
 =?us-ascii?Q?zpVw5KuRVzsBy8awdJRoRUgakQayV7N+mS5EycF0aJHZP9QA2EUBp7aPjdmc?=
 =?us-ascii?Q?LKUC5A4TFItTzk2F6stWrlhjJDSzmo16tA80axb/E8+Vght0zaEEHB5df+vp?=
 =?us-ascii?Q?h75INcXpy7KzWFpECDg29LaNgNwTcx8h9kS0mWlEPN2XFR1OGRuD2fDEveTe?=
 =?us-ascii?Q?iBdewzZu9OP0rmk1DG6uf7kH2tG66aQAhqEVPpii71fm+GV5yqPEPimnxAY/?=
 =?us-ascii?Q?VEHXFYaazXIxQeuzPqeAdIgt13qPQGM=3D?=
X-Exchange-RoutingPolicyChecked: piFmkIwM38Edt1jsetyuNJV+DbFKt5OlKsIcCCUPIkt8QY1aoWrvBN0aoCdPvakDsntQVuR6xpu+VaXl9BJucFTaLnhf0Autacx6Jmf4NlNQHdNPCUCizh8imzdgsT5zmIY0rKOLFJvanQhyDo0YeV+6EV6KkWDzGSN60lY6is2nK44WH1KedWlzdIh5weRZhyq0oOOIcbzOzFM6cKzZ/OW0I1L1rc3vAbJGcryzBbVHBid063Gx+1LtJyqxeWJP+8MiVLjtF1WekM9UOj6tAp2+cbacI3YS17hWaorO41N/FqkjhKXkd0jbNrpDhbkLNa3EZSo1deYTKbG+IirqeA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b95c3d-0823-4706-dad4-08df1595018c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 14:56:23.2657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPbi289FdzDSPfkO/+XctpJeJpYUumQDX3P4hsrpgKgx4t0VeFM4RgHH7ZrjKfZU6hnEGiw/gVdTl2/P1iSkT2jP4jP8KckrDxJXwRXteUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8293
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

On Fri, Sep 18, 2026 at 09:08:09AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Consolidate semaphore instruction definitions
> URL   : https://patchwork.freedesktop.org/series/174461/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb_FULL -> xe-pw-174461v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks Rodrigo for the review.


Matt

> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-174461v1_FULL:
> 
> ### IGT changes ###
> 
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_chamelium_hpd@dp-hpd-fast:
>     - {shard-ptl}:        NOTRUN -> [SKIP][1] +2 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-ptl-3/igt@kms_chamelium_hpd@dp-hpd-fast.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - {shard-ptl}:        [PASS][2] -> [SKIP][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-ptl-8/igt@kms_hdmi_inject@inject-audio.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-ptl-4/igt@kms_hdmi_inject@inject-audio.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-174461v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-bmg:          NOTRUN -> [FAIL][4] ([Intel XE#8583])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-8/igt@intel_hwmon@hwmon-write.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327]) +4 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +7 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2328] / [Intel XE#7367])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#7679])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-10/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#367]) +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2887]) +8 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2325] / [Intel XE#7358]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-1/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#7358])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-4/igt@kms_chamelium_color_pipeline@plane-lut1d-post-ctm3x4.html
> 
>   * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2252]) +6 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
> 
>   * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#6969]) +15 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-3/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2390] / [Intel XE#6974])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-bmg:          NOTRUN -> [FAIL][16] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-7/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-128x42:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2320]) +5 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html
> 
>   * igt@kms_dp_link_training@uhbr-sst:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#4354] / [Intel XE#5870])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-1/igt@kms_dp_link_training@uhbr-sst.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#8265]) +3 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#1138] / [Intel XE#7344])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-8/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_feature_discovery@vrr:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#8586])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-9/igt@kms_feature_discovery@vrr.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [PASS][22] -> [FAIL][23] ([Intel XE#301]) +1 other test fail
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
>     - shard-lnl:          [PASS][24] -> [FAIL][25] ([Intel XE#301] / [Intel XE#3149])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#7178] / [Intel XE#7351]) +3 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7061] / [Intel XE#7356])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2311]) +40 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#4141]) +11 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#7399])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2313]) +42 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#7061]) +4 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-bmg:          [PASS][33] -> [SKIP][34] ([Intel XE#7308])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-7/igt@kms_hdmi_inject@inject-audio.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-8/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [PASS][35] -> [SKIP][36] ([Intel XE#1503])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-3/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_joiner@basic-max-non-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#4298] / [Intel XE#5873])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-5/igt@kms_joiner@basic-max-non-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#6911] / [Intel XE#7378])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>   * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#8303]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-9/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html
> 
>   * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#7283]) +2 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-9/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html
> 
>   * igt@kms_plane_multiple@2x-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#5021] / [Intel XE#7377])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-y.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-3/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation@psr2-xrgb8888:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#8396]) +1 other test skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation@psr2-xrgb8888.html
> 
>   * igt@kms_pm_dc@dc5-dpms:
>     - shard-lnl:          [PASS][45] -> [FAIL][46] ([Intel XE#8399]) +1 other test fail
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-lnl-7/igt@kms_pm_dc@dc5-dpms.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2499])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-8/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-9/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#1489]) +8 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-9/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2387] / [Intel XE#7429])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@fbc-pr-primary-page-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-5/igt@kms_psr@fbc-pr-primary-page-flip.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2330] / [Intel XE#5813])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#3904] / [Intel XE#7342])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-10/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_sharpness_filter@filter-scaler-downscale:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#6503]) +1 other test skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-9/igt@kms_sharpness_filter@filter-scaler-downscale.html
> 
>   * igt@kms_vblank@ts-continuation-suspend:
>     - shard-bmg:          [PASS][55] -> [INCOMPLETE][56] ([Intel XE#9272]) +1 other test incomplete
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-5/igt@kms_vblank@ts-continuation-suspend.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-6/igt@kms_vblank@ts-continuation-suspend.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#1499] / [Intel XE#9271])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-4/igt@kms_vrr@flipline.html
> 
>   * igt@xe_cw_post_sync@walker-post-sync:
>     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#8608])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-10/igt@xe_cw_post_sync@walker-post-sync.html
> 
>   * igt@xe_evict@evict-small-multi-queue-cm:
>     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#8370]) +1 other test skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-1/igt@xe_evict@evict-small-multi-queue-cm.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2322] / [Intel XE#7372]) +5 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-10/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#8374]) +14 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html
> 
>   * igt@xe_exec_multi_queue@many-queues-priority-smem:
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#8364]) +23 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-8/igt@xe_exec_multi_queue@many-queues-priority-smem.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
>     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#8378]) +7 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html
> 
>   * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
>     - shard-bmg:          [PASS][64] -> [ABORT][65] ([Intel XE#8007])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
> 
>   * igt@xe_mempage_offline@inject-single-page:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#9203])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-5/igt@xe_mempage_offline@inject-single-page.html
> 
>   * igt@xe_module_load@load:
>     - shard-bmg:          ([PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91]) -> ([PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [SKIP][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117]) ([Intel XE#2457] / [Intel XE#7405])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-7/igt@xe_module_load@load.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-10/igt@xe_module_load@load.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-7/igt@xe_module_load@load.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-9/igt@xe_module_load@load.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-9/igt@xe_module_load@load.html
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-9/igt@xe_module_load@load.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-1/igt@xe_module_load@load.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-7/igt@xe_module_load@load.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-5/igt@xe_module_load@load.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-5/igt@xe_module_load@load.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-5/igt@xe_module_load@load.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-3/igt@xe_module_load@load.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-8/igt@xe_module_load@load.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-2/igt@xe_module_load@load.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-6/igt@xe_module_load@load.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-6/igt@xe_module_load@load.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-8/igt@xe_module_load@load.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-3/igt@xe_module_load@load.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-3/igt@xe_module_load@load.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-2/igt@xe_module_load@load.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-10/igt@xe_module_load@load.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-2/igt@xe_module_load@load.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-10/igt@xe_module_load@load.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-1/igt@xe_module_load@load.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-1/igt@xe_module_load@load.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-1/igt@xe_module_load@load.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-10/igt@xe_module_load@load.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-10/igt@xe_module_load@load.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-5/igt@xe_module_load@load.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-5/igt@xe_module_load@load.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-5/igt@xe_module_load@load.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-6/igt@xe_module_load@load.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-3/igt@xe_module_load@load.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-8/igt@xe_module_load@load.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-8/igt@xe_module_load@load.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-8/igt@xe_module_load@load.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-7/igt@xe_module_load@load.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-3/igt@xe_module_load@load.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-2/igt@xe_module_load@load.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-2/igt@xe_module_load@load.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-1/igt@xe_module_load@load.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-9/igt@xe_module_load@load.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-1/igt@xe_module_load@load.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-9/igt@xe_module_load@load.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-7/igt@xe_module_load@load.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-4/igt@xe_module_load@load.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-7/igt@xe_module_load@load.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-3/igt@xe_module_load@load.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-4/igt@xe_module_load@load.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-10/igt@xe_module_load@load.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-9/igt@xe_module_load@load.html
> 
>   * igt@xe_multigpu_svm@mgpu-coherency-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#6964]) +2 other tests skip
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-3/igt@xe_multigpu_svm@mgpu-coherency-basic.html
> 
>   * igt@xe_page_reclaim@pde-vs-pd:
>     - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#7793])
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-9/igt@xe_page_reclaim@pde-vs-pd.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#1420] / [Intel XE#7590])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_peer2peer@write:
>     - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-2/igt@xe_peer2peer@write.html
> 
>   * igt@xe_pm@s2idle-d3cold-basic-exec:
>     - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2284] / [Intel XE#7370])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-1/igt@xe_pm@s2idle-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-bmg:          [PASS][123] -> [ABORT][124] ([Intel XE#9093])
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-6/igt@xe_pm@s4-mocs.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-7/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_pxp@display-pxp-fb:
>     - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#4733] / [Intel XE#7417]) +2 other tests skip
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-5/igt@xe_pxp@display-pxp-fb.html
> 
>   * igt@xe_query@multigpu-query-mem-usage:
>     - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#944]) +2 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-8/igt@xe_query@multigpu-query-mem-usage.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
>     - shard-bmg:          [FAIL][127] ([Intel XE#3321]) -> [PASS][128] +1 other test pass
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
>     - shard-lnl:          [FAIL][129] ([Intel XE#301]) -> [PASS][130]
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>     - shard-lnl:          [FAIL][131] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][132]
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-lnl:          [FAIL][133] ([Intel XE#8399]) -> [PASS][134]
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-lnl-2/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_vrr@flip-basic:
>     - {shard-ptl}:        [FAIL][135] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][136] +1 other test pass
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-ptl-5/igt@kms_vrr@flip-basic.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-ptl-8/igt@kms_vrr@flip-basic.html
> 
>   * igt@xe_configfs@ctx-restore-post-bb-invalid:
>     - shard-bmg:          [ABORT][137] ([Intel XE#8007]) -> [PASS][138] +2 other tests pass
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-10/igt@xe_configfs@ctx-restore-post-bb-invalid.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-9/igt@xe_configfs@ctx-restore-post-bb-invalid.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [INCOMPLETE][139] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][140]
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_pm@s3-exec-after:
>     - shard-bmg:          [INCOMPLETE][141] ([Intel XE#8175]) -> [PASS][142]
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-6/igt@xe_pm@s3-exec-after.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-2/igt@xe_pm@s3-exec-after.html
> 
>   * igt@xe_pmu@all-fn-engine-activity-load:
>     - shard-bmg:          [FAIL][143] ([Intel XE#7992]) -> [PASS][144]
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-1/igt@xe_pmu@all-fn-engine-activity-load.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-9/igt@xe_pmu@all-fn-engine-activity-load.html
> 
>   * igt@xe_sriov_flr@flr-vf1-clear:
>     - shard-bmg:          [FAIL][145] ([Intel XE#6569]) -> [PASS][146]
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-10/igt@xe_sriov_flr@flr-vf1-clear.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-8/igt@xe_sriov_flr@flr-vf1-clear.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_flip@flip-vs-expired-vblank:
>     - shard-lnl:          [FAIL][147] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][148] ([Intel XE#301])
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          [FAIL][149] ([Intel XE#301]) -> [FAIL][150] ([Intel XE#301] / [Intel XE#3149])
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][151] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][152] ([Intel XE#3544])
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [SKIP][153] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][154] ([Intel XE#1729] / [Intel XE#7424])
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][155] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][156] ([Intel XE#2509] / [Intel XE#7437])
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
>   [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
>   [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
>   [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
>   [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>   [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
>   [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
>   [Intel XE#5741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741
>   [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
>   [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
>   [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
>   [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
>   [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
>   [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
>   [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
>   [Intel XE#5823]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823
>   [Intel XE#5832]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5832
>   [Intel XE#5835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
>   [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
>   [Intel XE#5870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870
>   [Intel XE#5873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
>   [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
>   [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
>   [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
>   [Intel XE#5946]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5946
>   [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
>   [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
>   [Intel XE#6588]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6588
>   [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
>   [Intel XE#6918]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918
>   [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
>   [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7225
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
>   [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
>   [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
>   [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
>   [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
>   [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
>   [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
>   [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
>   [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
>   [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
>   [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
>   [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
>   [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
>   [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
>   [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
>   [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
>   [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
>   [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
>   [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
>   [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
>   [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
>   [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
>   [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
>   [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
>   [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
>   [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
>   [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
>   [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
>   [Intel XE#8175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8175
>   [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
>   [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
>   [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
>   [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
>   [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
>   [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
>   [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
>   [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
>   [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
>   [Intel XE#8583]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8583
>   [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
>   [Intel XE#8608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#9093]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9093
>   [Intel XE#9203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203
>   [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
>   [Intel XE#9272]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9272
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_9099 -> IGT_9100
>   * Linux: xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb -> xe-pw-174461v1
> 
>   IGT_9099: 9099
>   IGT_9100: 80e998fdbe300b1ca29901099f35316bd83781e4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-5772-1687195a722fb2a8bfa0af9b739a0485034fefcb: 1687195a722fb2a8bfa0af9b739a0485034fefcb
>   xe-pw-174461v1: 174461v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174461v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
