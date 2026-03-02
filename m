Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8FCEB3632
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 21:01:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9666410E5C6;
	Mon,  2 Mar 2026 21:01:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HHPHSvzZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E75F10E5C5
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 21:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772485295; x=1804021295;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=mcCbg0D4cWzoK2R549BXfe5zgWyxgo+bicdOcYAON9A=;
 b=HHPHSvzZQxD/RYjP1RCg1L9rPMlwTKiAD6vElPhjdSjMlLt0DbQDdxgR
 HIbeBoV+CpCSCjunfdHmccJHACd5D05TBvBpYQ6Q1sENEhMbsA96C17F0
 nE+82jY1lkR+Qui05BhL5r2WkycYqZfMaypKPfeo8QdQ+9+5eYX5O1yJv
 2wruH7D9MarumTlYi560iMfe/057yi4Pbv9mFkjZufdPck0MF8XXs7UiP
 hmrp1qg3P8QEYJhec/+iuW8xbSf6wRXtPeRgK/a96q6KL76boh+uHvHIw
 sM4TPTr4FV28iAS8sr2cQO9d6XWjQ28Wg2jRMuqPmA0RPbnXamO3txyQ8 A==;
X-CSE-ConnectionGUID: wmGvBUXtQc6WKOZaxg26Cg==
X-CSE-MsgGUID: wi6+RCsdRJe0wqc8srscyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="77119575"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="77119575"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 13:01:34 -0800
X-CSE-ConnectionGUID: RtALhujrTeqXYEsGABzsuw==
X-CSE-MsgGUID: VbLLN0O5R8SMZ8cWnjAOlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="222759563"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 13:01:34 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 13:01:29 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 13:01:29 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 13:01:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FbczcePAlmPEeO0cYFrXrLv29Tx5usMoWFQYGSYmBVNkISZsGmJ68N5R2loJ9fzD2eRfGY+LTjZ2BAeCJN+PADKFxxls4sUGFffkGjpt1luYmeUGHtvd1xlTjBKD7vKG59460xer9e/Co+47hSnQHKNN8PwPJxfPG2JvwQ42O32T4E3ohmSGEPXy1KxwWvJ1EiTqsvWh8+E2sBa6uJ6ni9iI7w1zyHg6GwwRqHMi70yNjBFCtM9JFhpZ+0KWyDTJmfz1MstxC71I9ArifPCxETwVN1OAjiXrVX1AjDPnwJomcQd6GwWj5Gn/Qt5A+8GIY6NH9XrZUEcEHUmkcAz3gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FeefRd1QMkzrhyssjscgF4A4PCiqEZiPXtTDQc0raOE=;
 b=D1R4odzSKv3jOC5Rpm1mudcKcWvpOXwI9d7oT0GmzgJigd5Jc3akihPGqthwLurw6biGoMSejW1c6877FQPN9IbOhRSOHcll3yzd7ZO+runb1BXxMjjEGFSfcMN3oeIYs7zkZocwuiyJQpAapWe5JrYc2u5TXdRQfBjFkSe+ieaultaNCRaWqwO/hnZ4Hzms7uIG7nMlopJRTbljDOKMxEIw3Ht99Io2IKFLKmaDNfnAUDdAsKBU8FLrT3IvzY1doIh0XPtIXyizKI8D6dCkKtbIjumqR68JqVLaNLvU0Yr22ljLmdbrnTqae+UI3o83h4EghK7P0lWynTDW1/mDbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CO1PR11MB4849.namprd11.prod.outlook.com (2603:10b6:303:90::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 21:01:25 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 21:01:25 +0000
Date: Mon, 2 Mar 2026 13:01:22 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?= =?utf-8?Q?re?= for
 drm/xe/xe2_hpg: Correct implementation of Wa_16025250150
Message-ID: <20260302210122.GI4694@mdroper-desk1.amr.corp.intel.com>
References: <20260227164341.3600098-2-matthew.d.roper@intel.com>
 <177225926134.298994.2269132439888460251@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177225926134.298994.2269132439888460251@a3b018990fe9>
X-ClientProxiedBy: BY1P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::16) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CO1PR11MB4849:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f744565-7da2-4aab-7111-08de789edd79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 7EGe9Zkz0CGtSX64wMUof8XP4Gs4JVw2FuEmeh59xQaTg8FZ5GSWuW9tY2dkACbKaAVh4IrVcP7S1aNQnga/8hnaxuqjDJ1+dWFDB46h42xeQ0OZ2KVp2ZLJtW7htedZI7dn4E+zqwsIbauK2k6U1qlu9vkR/oyq4JodbZvJEFeseOgVxSmYH7/Dsqs9s0/El1LkfmHMIp9gPx749xgMdLGa3IhKOxkW/tSImF4QrA18DYWg4iYOVBgVym4r378SfjTicKnjpFnHNeRzRXjdYZ5kXbGd5azEkuYoAKWQcmCksVtnIBif2PGp5FAJ+SZGNp6QHTZDeCIBFVFsamPwfzsUbG6vlrhSOizViKikjj6lKgVwYrytNS4lmIklDh9RzlLo2EgvO51upVDT5eG2X1JyMpZeyLJ9+REulb9NtFqHs+y4ensjuBcKYosFNXuBi5LtC22KJGaFr6XJjFSvlPx29nwLF11qAur+PXOFSH1ClF0Wf6FdHf7u3fCi1xQDjxbWygisayUuGOmTWsxzbhjqHJDkxkw0CPZz1t60GUphLzxbadNChUcneDJ0NRmh2SqG73RdHn7krPLQMk1Binl803C8/mp5GRwTzKk/WeeyiLgwwkt6gojElmyVieJyU0NcZkJXbLUA0gTFrued3v8iK6cFnY0+zE8i2MYlI78p5xY2J0PHfdjiEYb5GlDJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IJ9DQqCjya+KkiW3lcuoo6/NKlU4AMYJBrr2kQw8fHLCp5Y0F9JeqZOwlCxC?=
 =?us-ascii?Q?4SHdyrpRJ32fSKbu3U4AI1Jb9BF6b8XbjhFNWXUm2ZtmyEABPhRCM9fkkSww?=
 =?us-ascii?Q?HdGE160khQ8rMGGp/COmC4WUVZwUzykGJw4RDf9L8rYZA1JefngSh8IkAxix?=
 =?us-ascii?Q?3WKmy4EaJqxItieRePE3ngeliHlZveMyrNbKYbevQOkKiGfobSlZwLbQEeyp?=
 =?us-ascii?Q?xs3SfHTwpxkLSvXqhEQ+cOosvWSSDt/XfyBh/DXnkmlPeeF6AwmHwv2nTmn/?=
 =?us-ascii?Q?DOWVzJ0MugiAGsorbpxoV2+AandubhaCqari0Gx1vDEMWkuCHyVE4D7AzcQc?=
 =?us-ascii?Q?GuS9GRKXYGFPV214SFVJOcSKQ1Ap9zqzyLhgZ2wl2VXxKy/dvzrFEX0/bHOn?=
 =?us-ascii?Q?DNJqDdpbpp9jUwO/tZkhGDc/t2qMlTyB6hbhJ3b/ATR69mP9Gt99+Nu+B66l?=
 =?us-ascii?Q?IvoxOXCLxtcAVOF0x2VNA6OKRPy4vMEPlA8ku/GTudXoqKEhadBblVfAlI7e?=
 =?us-ascii?Q?0LdiuWi8mU4Z7bhI3J6s5oEvkvTymLQwNveWUP7N7jJ6GofQGWLyN5EnLtQu?=
 =?us-ascii?Q?ZhxzfVX+FuzdXJkhHoP35hwIg2APIPiZDPmcQUMotSTqfRkTX4LHMlqtwVKb?=
 =?us-ascii?Q?GgvzGvdunw5A5pVKmxza9gAkj2gVCWkHfWl7TYB6UTpYAuDpkaixsjNLj4iF?=
 =?us-ascii?Q?MvNNDeL4VWiQmwT3lllDrJ7/8nKA2spWRTPLIsDlHm5wqpOhl6PeqBM2yWfs?=
 =?us-ascii?Q?abI90lkLw8kxdQpZBygOzByX1WML0QE4mNVtr4CeOuEihfkwdvoYNzi2dMA1?=
 =?us-ascii?Q?oAJqS8oH+mV3h5w+VhzgqfJzyl/aFT0xA0ehLFCERv2j0kPSAB0NUz8UbQef?=
 =?us-ascii?Q?hEPbJ6BEmPvgMo+Zn7y3AkNTEIj5HDSLiRzUwGPf4dDxjAMUh+/fL6VL3WaL?=
 =?us-ascii?Q?Zt+AjCouhTllEsisfosQE3CF6vpLIn/NFnE5dYwBYfkU5BsYJfF8caTxiupk?=
 =?us-ascii?Q?ZpW2oVP6cgmo+ecQO7Voj8O2/lQdvNoKOEhg8wcOTaUiDzLhrfnapKvhv3ik?=
 =?us-ascii?Q?RyPT/UA4fPbUt5LieCphK8JY9nHrcB3sP0Vh8b1peDA6CZAtELHwxal9Hm0C?=
 =?us-ascii?Q?R9R5NX7KUj1PnRf2dYL4Gy3x72QbGwv6Okm0NEkP8iq+WosvzajZZVuSqNzm?=
 =?us-ascii?Q?gX+1r9p10ciO5FieGKdQJw2KXjdNsH2tyXM+jmpfJCAnNOUhkdZjp4n0zDF0?=
 =?us-ascii?Q?HjqNlroe5/C/Yj2bg7ZnfkBGWDLpA+5oaRbY0T+wPJ2EmLgwPJZhSu5Pa+OZ?=
 =?us-ascii?Q?oMgnogieKyygVRNI80PmmiwXUQFDyBQ1JI3YQD/ID3EZGet3TAKaR6inlMU4?=
 =?us-ascii?Q?eSAq9FfrqUgj++QCKTXCTQLumADFBM897KVEUyzFRP55aIXA6IpkLN2vnTV4?=
 =?us-ascii?Q?O9iNX0zZEfeMwoJF6pHC4DRGBpu7jqVBheimiMwuVa7BnFVV7iOavvE/PxOJ?=
 =?us-ascii?Q?Rv3LufRot743vrYhJ9GrEL7bwPOnWdmVNqJ2fyRn0qbow2X/krNtbzzxq+gV?=
 =?us-ascii?Q?WFzwPNurdUupHtmKmiB2M3u3vLI2YoIc5HziR+9ZGK/Xp6PdLIg+sWMr0qiJ?=
 =?us-ascii?Q?t/fIsEMA9eC/skynmbz5ZRNZq5NCMAoJNcDSu6KDGuyvReSxSng+SECsQYzX?=
 =?us-ascii?Q?GcRgqO3ubU9wzdY0st2Pnp3A7QGvn14m1941rBtXIXOactL7xIyFByN+pagv?=
 =?us-ascii?Q?M9Qu7c5kaVNFlGiVFPz39k02g4X6XuA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f744565-7da2-4aab-7111-08de789edd79
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 21:01:25.0956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N+3KduDPP9PzQF+sYfMe7RjtQ9aBLn5o95coLtoRoHG4sA2gSw6jBBKZmMTaL6ej6uzwJMdFPgadfJBsp6YI1xrJaH9klWPX2p9mGNoBuhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4849
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

On Sat, Feb 28, 2026 at 06:14:21AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xe2_hpg: Correct implementation of Wa_16025250150
> URL   : https://patchwork.freedesktop.org/series/162330/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4634-2333a8c0cacaad43aefe7c352f90afa11189941e_FULL -> xe-pw-162330v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-162330v1_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-162330v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-162330v1_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4634-2333a8c0cacaad43aefe7c352f90afa11189941e/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3321

Applied to drm-xe-next.  Thanks Kwan for the review.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-162330v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#1124])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1124]) +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
>     - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#2191])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>     - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#367]) +1 other test skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4634-2333a8c0cacaad43aefe7c352f90afa11189941e/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-9/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2652]) +8 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2887]) +1 other test skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#2887]) +4 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#306])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2252])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm:
>     - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#373]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
> 
>   * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-1:
>     - shard-bmg:          NOTRUN -> [FAIL][15] ([Intel XE#3304])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-5/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-1.html
> 
>   * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][16] ([Intel XE#1178] / [Intel XE#3304]) +1 other test fail
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-6/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2321])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#2321])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x85:
>     - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1424])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-256x85.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>     - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#309])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
> 
>   * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#1508])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>     - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#2244])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#701])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_flip@2x-blocking-absolute-wf_vblank:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1421]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-bmg:          [PASS][25] -> [FAIL][26] ([Intel XE#3321])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4634-2333a8c0cacaad43aefe7c352f90afa11189941e/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>     - shard-lnl:          [PASS][27] -> [FAIL][28] ([Intel XE#301]) +2 other tests fail
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4634-2333a8c0cacaad43aefe7c352f90afa11189941e/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#7178])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1397] / [Intel XE#1745])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1397])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#7178]) +1 other test skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#6312])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#7061]) +1 other test skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#7061])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#4141])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2311]) +4 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#6312] / [Intel XE#651]) +3 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#656]) +8 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2313]) +5 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#7283])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5:
>     - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#7130]) +1 other test skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5.html
> 
>   * igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#7130]) +1 other test skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-2/igt@kms_plane@pixel-format-x-tiled-modifier@pipe-b-plane-5.html
> 
>   * igt@kms_plane_lowres@tiling-4@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#599]) +3 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@kms_plane_lowres@tiling-4@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#3307])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html
> 
>   * igt@kms_pm_dc@dc5-dpms-negative:
>     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1131])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@kms_pm_dc@dc5-dpms-negative.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2392])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#2893])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#1489])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr@fbc-psr2-no-drrs:
>     - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1406])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@kms_psr@fbc-psr2-no-drrs.html
> 
>   * igt@kms_psr@fbc-psr2-no-drrs@edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#1406] / [Intel XE#4609])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@kms_psr@fbc-psr2-no-drrs@edp-1.html
> 
>   * igt@kms_psr@psr-cursor-plane-move:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-2/igt@kms_psr@psr-cursor-plane-move.html
> 
>   * igt@kms_rotation_crc@primary-rotation-90:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#3414] / [Intel XE#3904])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-90.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1127])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_sharpness_filter@filter-strength:
>     - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#6503])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-2/igt@kms_sharpness_filter@filter-strength.html
> 
>   * igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter:
>     - shard-lnl:          [PASS][58] -> [DMESG-WARN][59] ([Intel XE#4537]) +1 other test dmesg-warn
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4634-2333a8c0cacaad43aefe7c352f90afa11189941e/shard-lnl-4/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-2/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html
> 
>   * igt@kms_vrr@seamless-rr-switch-vrr:
>     - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1499])
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-vrr.html
> 
>   * igt@xe_eudebug@basic-read-event:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#4837]) +1 other test skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-2/igt@xe_eudebug@basic-read-event.html
> 
>   * igt@xe_eudebug@basic-vm-bind:
>     - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#4837]) +1 other test skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@xe_eudebug@basic-vm-bind.html
> 
>   * igt@xe_eudebug_online@interrupt-all:
>     - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@xe_eudebug_online@interrupt-all.html
> 
>   * igt@xe_eudebug_online@pagefault-one-of-many:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#6665])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-2/igt@xe_eudebug_online@pagefault-one-of-many.html
> 
>   * igt@xe_evict@evict-beng-small-multi-vm:
>     - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#6540] / [Intel XE#688]) +1 other test skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@xe_evict@evict-beng-small-multi-vm.html
> 
>   * igt@xe_evict@evict-threads-small-multi-queue:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#7140])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-2/igt@xe_evict@evict-threads-small-multi-queue.html
> 
>   * igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race:
>     - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#7482]) +4 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
>     - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1392]) +1 other test skip
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue:
>     - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2322])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
> 
>   * igt@xe_exec_fault_mode@twice-multi-queue-rebind-prefetch:
>     - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#7136]) +3 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@xe_exec_fault_mode@twice-multi-queue-rebind-prefetch.html
> 
>   * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#7136]) +2 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind.html
> 
>   * igt@xe_exec_multi_queue@one-queue-preempt-mode-basic-smem:
>     - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#6874]) +5 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-2/igt@xe_exec_multi_queue@one-queue-preempt-mode-basic-smem.html
> 
>   * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate:
>     - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#6874]) +6 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-fd-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#7138]) +1 other test skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@xe_exec_threads@threads-multi-queue-fd-rebind.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#7138]) +1 other test skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-rebind.html
> 
>   * igt@xe_live_ktest@xe_eudebug:
>     - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2833])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html
> 
>   * igt@xe_media_fill@media-fill:
>     - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#560] / [Intel XE#7321])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@xe_media_fill@media-fill.html
> 
>   * igt@xe_multigpu_svm@mgpu-coherency-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#6964])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@xe_multigpu_svm@mgpu-coherency-basic.html
> 
>   * igt@xe_pm@s3-mocs:
>     - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#584])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@xe_pm@s3-mocs.html
> 
>   * igt@xe_query@multigpu-query-cs-cycles:
>     - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#944])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-2/igt@xe_query@multigpu-query-cs-cycles.html
> 
>   * igt@xe_sriov_admin@sched-priority-write-readback-vfs-disabled:
>     - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#7174])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@xe_sriov_admin@sched-priority-write-readback-vfs-disabled.html
> 
>   * igt@xe_sriov_flr@flr-vf1-clear:
>     - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#3342])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-8/igt@xe_sriov_flr@flr-vf1-clear.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>     - shard-bmg:          [INCOMPLETE][83] ([Intel XE#2705] / [Intel XE#6819] / [Intel XE#6891]) -> [PASS][84]
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4634-2333a8c0cacaad43aefe7c352f90afa11189941e/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp-2:
>     - shard-bmg:          [INCOMPLETE][85] ([Intel XE#2705] / [Intel XE#6819]) -> [PASS][86]
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4634-2333a8c0cacaad43aefe7c352f90afa11189941e/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp-2.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-dp-2.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [FAIL][87] ([Intel XE#301]) -> [PASS][88]
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4634-2333a8c0cacaad43aefe7c352f90afa11189941e/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-lnl:          [FAIL][89] ([Intel XE#7340]) -> [PASS][90]
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4634-2333a8c0cacaad43aefe7c352f90afa11189941e/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][91] ([Intel XE#3544]) -> [SKIP][92] ([Intel XE#3374] / [Intel XE#3544])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4634-2333a8c0cacaad43aefe7c352f90afa11189941e/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][93] ([Intel XE#2426]) -> [SKIP][94] ([Intel XE#2509])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4634-2333a8c0cacaad43aefe7c352f90afa11189941e/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537
>   [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
>   [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#6891]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6891
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
>   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>   [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
>   [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321
>   [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
>   [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4634-2333a8c0cacaad43aefe7c352f90afa11189941e -> xe-pw-162330v1
> 
>   IGT_8775: 8775
>   xe-4634-2333a8c0cacaad43aefe7c352f90afa11189941e: 2333a8c0cacaad43aefe7c352f90afa11189941e
>   xe-pw-162330v1: 162330v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162330v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
