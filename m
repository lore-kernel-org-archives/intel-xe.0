Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A35F531CB
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 19:55:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067FF10E031;
	Mon, 13 Apr 2026 19:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O86aWtwL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9510210E031
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 19:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776110128; x=1807646128;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=v/5afl0jl4SSIBpwbT3dbTbzRG5dO7dOXjPknkHK+Kc=;
 b=O86aWtwLUa7M72pV3dZPklSbi0Xl2z5odO0y9cfX/PZFbRONR0ekKXqp
 FXcdv2oygqkIVU0VBcT45BO3/PmehZjktVClnphbHU8/JzZy6xFVvYvAj
 BoUmGg+Mdpwf/3G3z8oFCWEc20ZZqTAjmV15LdHNndPuofzfgn3K7kk7K
 /hiP+bTWKaLd/NndYdRv12cZ2O/FT+ta2asrjXwyRy9jmFDwsKwFymspH
 lraUiCTvghvk/435eeFZhRcHHgwM4T93eYsN5LaOkrzjGy02m0xvCTLqd
 xx/PYq7K/lkJJAXXZWzeJ4mKZtpOdjR8tszXaAu1h1aIs2B2x0zZXKzwV Q==;
X-CSE-ConnectionGUID: PAScMt2XS5uwZiWdltwSjw==
X-CSE-MsgGUID: 2NI8yf0sSh2T/gZS+FMYXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="76938172"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="76938172"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 12:55:27 -0700
X-CSE-ConnectionGUID: bYxFlhbAS/KpC4AGmTL0aA==
X-CSE-MsgGUID: vznwKfOPTWSYGbk2afqwpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="229005684"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 12:55:26 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 12:55:25 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 12:55:25 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.7) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 12:55:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YII/riWwV5wXGZbJQ8EzeF7PIfSx0oA8Qvrc6vK3NFk6IynRHci1bX+xEORnPoqLtRkqWFl6uM3IpzVFpjn+fVZx4uZo8szslAHriwOpE2MrQWTLDI3fKbzm1hLk4YBPoKg40vDpnNlYJwSmrmrG4Z/zz+GnA27rI8ut3u/VGbN+a28r0A77oS84883WZBNXxnFtF+mFBrz6SoPNFCIiU19Kj4dgNcmosC5QK4tL7RgKxVHmW6xKcXBium+wQxc+3xh43RM6vsO4VB0dB3sShtxCevUdDdEqzVA3xXRyDd0MNt288QCtJNIy/cOOCCQkPrJjF5ZrKAnepiDMmQS2nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUIkkuKBIUucKPM33rNjtEeUU63j34KcGNCPZQ5Ht0M=;
 b=H3Gj8R5LHvQr6m1dXa9aPMNvpGOtMrC+S3JGlnMaRRd4jlFBiu4fl7WLQ1GEo3rJi7G0Hbahxv6Y7v0HcxaiVo5U/VarLfg5UVUU6qsmrXdXSlGr+hSmXR0evTg9HaFrthwFHxkJJKiUIsSMdZixQAOm5I1muAK9sEcql311xz8cKNhhlJPeFKrSTcTMOoEQUJKw8C13uh3CTk23Z1EMiI/1dTRIFwH3pDx2+SGJALU5UgBXLhBM5RZL6fY9ucetcPaz/vrOF8lfaNzxOLrqC2ei/9KrypdDBSE2MXKsehpzJq7uNUWjY0nIBc0TkV31d4LI++HV9kn4Ti/SC2v8aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA3PR11MB9275.namprd11.prod.outlook.com (2603:10b6:208:57e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.13; Mon, 13 Apr
 2026 19:55:19 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 19:55:18 +0000
Date: Mon, 13 Apr 2026 12:55:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZVTEw6IHN1Y2Nl?=
 =?utf-8?Q?ss_for_drm=2Fxe=2Fdebugfs?= =?utf-8?Q?=3A?= Correct printing of
 register whitelist ranges (rev2)
Message-ID: <20260413195515.GJ6301@mdroper-desk1.amr.corp.intel.com>
References: <20260408-regsr_wl_range-v1-1-e9a28c8b4264@intel.com>
 <177588750643.453020.5064987670398357299@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177588750643.453020.5064987670398357299@a3b018990fe9>
X-ClientProxiedBy: SJ0PR13CA0028.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA3PR11MB9275:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e6f8ee7-0271-43ff-6e1c-08de99969652
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: ymEprM4eQNADwQX1VZ+6TQLLxwt+asDx7qG4u7sNID5+lBdgH+yVXU3Rp7wTyxkm6JpWceJA6BaviB2Ffm9fT0Cw1U2b3YavKblnw+tBhJWY0f+BKewY4sXy4qnlfT/YFKGDt2ukFdU13s1vgTybTUPoTVCvzSluTfn6XXlI/iH0zxWRAdNGQ2Z6+bbXiHKHgO8FNTNXgnSJu2U7lf3ESz+yRkt5DeQNpQK+igYI/Rumc/VQLmIQahgho4MENXkMPlIuVkaDezIfnWGkGp34g/XxzIZsinR+DG6VPOoVsTKZlsVdIEGk3BmxtMsd2AVB4g+6YSQO9R/1zS6fYHfyHEr+KL7g2iiR8pISX7SV9LN1aQg6W6XMBVrQSZwgZtwCDYXh2bWw53mTM9wkQ/umILRmGKOGUyAU6RoCsqKYohJDWvNa3IEaDUFIY+t5nJr+qHD+E3siyN3GeMFU1IVpL+wIB3YyQeA7A4+IZ/3GwKtxaMstb4v+VAKXsklhtuiOaqLMkp1cGWn2v1qUmW1KG5eIpv4gNmGi/TQCAk5Sfox0YecstjpO+QzyZzSN2/QMU2QGGBxcel8H+VzzZMXZGS7J1m8jHT6Rkl8zq+eehbGrneA8KrBmvenXkyUjWZbjOdoS/nNejLAEFbU6RhEIGhKJ0JItxEd//ygLKHzvQzJ0VMst7xe8MI9ACZzIswmi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ql0wdhYSLRZFc+j+b5O3c6GA/FX58EkS60/nMgrelIWNv0HEPI0us5k6TqbO?=
 =?us-ascii?Q?irUl6cwTHZLItaWTU0UHeCOPFVEivdL5rg8rgbbSmxJnaC8IMVAzabLfUsdq?=
 =?us-ascii?Q?XtNdY7upm9HPpQG9+IfBUhFanaGNaTgFI7lkzQ1iPyQ5Vg3FTfqfzIb56zml?=
 =?us-ascii?Q?up3X8V8Dd/RleMP4imiBfOprilQco3lexuhhXffaoh9vjv+IFyZBT4L64p0a?=
 =?us-ascii?Q?p64UR7nuPnvPbXqGd5CaYxRP9mg2PFHjOTmOxFlulKNqkGtCfKrHDlwLhNVQ?=
 =?us-ascii?Q?3g6oo0a34s0KXcBL5dZIsnvD542UZHjBJjKJxR6mMzl1oFEyX2fvS9MDk09l?=
 =?us-ascii?Q?sU4NipXg4ullBgnbCFGJzuM6n+0BiZXDKmnpAnkAFqLmf72ANYm0zTaZJMB5?=
 =?us-ascii?Q?SER4otrjpvOyLFZNZP4iTzP1SSLBqsbte2TPq2vJKyZzVz2Q6BAgwaID0uIt?=
 =?us-ascii?Q?UZ9ZaGfToC7UR14hmCowfLbRRfV4ZmstHuDb69BmjKGuwiVvnqdw1XstLew0?=
 =?us-ascii?Q?Javy3O+VxMSyeByiNmbwx1hMU6Yu4phTZMZQTICf5HHQ91vRNx9PD1JTdaP2?=
 =?us-ascii?Q?oWJy1gBR+8HFHPzVbHghu69F4CiwKjyF0OTq27hVFY5yTW1TMvKgF9HyNHak?=
 =?us-ascii?Q?jHnZhmTnxzzhvRzlfvELiSlWGZLxCUDza7Z5sPr1WULYbNB6YorpwqjV87zV?=
 =?us-ascii?Q?72KSU5rqBdZwlWGS9TyN0RAnDxrY1oPl9DUMGSW8/R5v2p8S3xnJyrRN20MB?=
 =?us-ascii?Q?xeM7TMfHaVH3vc/NVG1D+j3BSDocKVOycRknKeoGuDJX8AXAncahCm4U9add?=
 =?us-ascii?Q?bs3ewwtrJpJHwq2bAnv9cbO1asSpR0WM5TqAB46GnnyDVAPcvreLNZdNzdno?=
 =?us-ascii?Q?IMdlD4tUnGsDXH+tGRDHa/hC/ZL0JERyNRkEcK/489IkLJOnOcUE2pDRtLiU?=
 =?us-ascii?Q?FeAvF2mWi9ifuQUfjI7OmAssv+UbRIVIndaj1bx2fdXboxQCqDwT8XUdzn4m?=
 =?us-ascii?Q?eFtx9fNAN1pD0w7d9LajzJnZqqlW1b5IzLtXlodmV0yCgwMfQjPiQA5pGvrH?=
 =?us-ascii?Q?KqxB9UQv8zdkYiyTJXxjEIWqMrp/p3MVBT1iZfdEJ+wjeuxwYKg7US9OHW+W?=
 =?us-ascii?Q?yAp4BZ715KhRYN/Pd2d+RB84sQRrfKtl4tdILSAm6tT+TxfbCXzzFvyK6zfr?=
 =?us-ascii?Q?+8gpCntSbJmqozUW4TvmAQ7qSnjjZsvZt1g9s7TNmVcYlQBsaCgat7Ga4C+j?=
 =?us-ascii?Q?WcMsyQYegGOr2/LoYPw8vo9sJGs0cjQ8ljDVAlTps0HeZhL1krlG1xz5B4Gu?=
 =?us-ascii?Q?2v5L8EIxXx/QsXU/y+X8bdsLck1m8gn6jYU9v0rOtFZRh8VhTPQ8RNSUmzBY?=
 =?us-ascii?Q?70CKdd6G4LZLUff3pNE7/97OlfV5sCTrCce45lHDU52qwu2QrVzC7uUtu5dD?=
 =?us-ascii?Q?Lov9L3YNeFauZVKJ3NC1isp05x/Bew6PLAI7cxSGsxcSqFMco6rhcQph0rEE?=
 =?us-ascii?Q?jXkJGXlTleuBmI0HKOF5NZ6JVgW+Yq9c4EtngXDWaJnN8m6nGYaaDN9L2t+g?=
 =?us-ascii?Q?DZq/ZVOdJQ1LWPWoVGnuWBvzVn8BRzGMq6hd0CrXweCbm/YE2sViWO0vWMdZ?=
 =?us-ascii?Q?dYABJNOTyNuMj2Y6xQE4J7PwgxJWxTTKo6hrlP2xbIY36N2ZZB5GB95470H0?=
 =?us-ascii?Q?CjhQaNDmrDAMgtS2clSQhcy8VRFrCRzJAm/8M6Z7Jw90hZMStLUW51uhUGbX?=
 =?us-ascii?Q?xfiKuU8ZSZ0uvgnZK8FMMC86dK0AT54=3D?=
X-Exchange-RoutingPolicyChecked: an8d1uB+s+Kgafo3baaHGjqrL2h+dPhWLTfjABCe/dtGsl4GDc3EaNUoZ1Ngwex2UPkIzkFg3IppsU1LP1/3xF67O8s5NkRXmX2+qXz07tIX7EMxNodGsQ4oZE8Zs8Puv7ZhcWVn9Vq6ShiMBU9x1bA7c+TblMcz/qpHhShJzj/tk27ZTXpEaK0wD4ZkESh/IK0xP3d/xLXwFf0lD7FK2AKIJFnQbwINa0FFTXP5h0QH2NLx8fDZTo+z4ZGQv1S0SFx/6zmsnX4sZnjnCH7bSkNWVZ28EQ3dRyylWDCEDb0FbNV/3m1nLdjlyNH8wOfeIfXp2hxAW9aXY67RqQVt4g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e6f8ee7-0271-43ff-6e1c-08de99969652
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 19:55:18.1295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPAvyC3JZ3zSKuJps9qOcVpIr7TvA7rwaNdAESyRsKXr2DTzLohX76EQ8/8nR1t8NYocx0IFxObWkYohXlfdTp5YqbNA5ydawSVXFyodjfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9275
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

On Sat, Apr 11, 2026 at 06:05:06AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/debugfs: Correct printing of register whitelist ranges (rev2)
> URL   : https://patchwork.freedesktop.org/series/164574/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5_FULL -> xe-pw-164574v2_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks Stuart for the review.


Matt

> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-164574v2_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#2327]) +1 other test skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][2] ([Intel XE#1407])
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-lnl-3/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#1124]) +4 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#1124])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#7679])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-9/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#2887]) +2 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-lnl-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2652]) +8 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-10/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          [PASS][8] -> [INCOMPLETE][9] ([Intel XE#7084]) +1 other test incomplete
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#3432])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2887]) +3 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-green-to-red:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2325] / [Intel XE#7358])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-9/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>   * igt@kms_chamelium_frames@dp-frame-dump:
>     - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#373]) +1 other test skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-lnl-8/igt@kms_chamelium_frames@dp-frame-dump.html
> 
>   * igt@kms_chamelium_hpd@common-hpd-after-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2252]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
> 
>   * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][15] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +3 other tests fail
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-10/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x10:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1424])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-lnl-4/igt@kms_cursor_crc@cursor-random-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x32:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2320]) +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>     - shard-bmg:          [PASS][18] -> [FAIL][19] ([Intel XE#7571])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2286] / [Intel XE#6035])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#1508])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-9/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#4422] / [Intel XE#7442])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-10/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#7178] / [Intel XE#7349])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2311]) +9 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#6312] / [Intel XE#651])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#4141]) +5 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#656]) +5 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2352] / [Intel XE#7399])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#7061] / [Intel XE#7356])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2313]) +9 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-bmg:          [PASS][32] -> [SKIP][33] ([Intel XE#7308])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-6/igt@kms_hdmi_inject@inject-audio.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-7/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#3374] / [Intel XE#3544])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2486])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-8/igt@kms_panel_fitting@atomic-fastset.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#7283]) +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#7283])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-lnl-3/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#5020] / [Intel XE#7348])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-9/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_pm_dc@dc5-dpms:
>     - shard-lnl:          [PASS][39] -> [FAIL][40] ([Intel XE#7340] / [Intel XE#7504])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-lnl-4/igt@kms_pm_dc@dc5-dpms.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
>     - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#4608])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#4608] / [Intel XE#7304])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-b-edp-1.html
> 
>   * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#1489]) +2 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-7/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
> 
>   * igt@kms_psr@fbc-pr-primary-page-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-5/igt@kms_psr@fbc-pr-primary-page-flip.html
> 
>   * igt@kms_psr@fbc-pr-primary-render:
>     - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1406])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-lnl-8/igt@kms_psr@fbc-pr-primary-render.html
> 
>   * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
>     - shard-lnl:          [PASS][47] -> [FAIL][48] ([Intel XE#1874] / [Intel XE#7305])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-lnl-7/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-lnl-3/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
> 
>   * igt@kms_sharpness_filter@filter-formats:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#6503])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-8/igt@kms_sharpness_filter@filter-formats.html
> 
>   * igt@kms_vrr@flip-basic-fastset:
>     - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#1499])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-10/igt@kms_vrr@flip-basic-fastset.html
> 
>   * igt@xe_compute@ccs-mode-compute-kernel:
>     - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#6599])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-3/igt@xe_compute@ccs-mode-compute-kernel.html
> 
>   * igt@xe_eudebug@basic-vm-access-userptr-faultable:
>     - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#7636]) +2 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-lnl-8/igt@xe_eudebug@basic-vm-access-userptr-faultable.html
> 
>   * igt@xe_eudebug_online@debugger-reopen:
>     - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#7636]) +2 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-1/igt@xe_eudebug_online@debugger-reopen.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-small:
>     - shard-bmg:          [PASS][54] -> [INCOMPLETE][55] ([Intel XE#6321])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-cm-threads-small:
>     - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#6540] / [Intel XE#688])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-lnl-7/igt@xe_evict@evict-cm-threads-small.html
> 
>   * igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race:
>     - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#7482]) +2 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-lnl-2/igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
>     - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1392])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-lnl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2322] / [Intel XE#7372]) +4 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@twice-multi-queue-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#7136]) +5 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html
> 
>   * igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm:
>     - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#7136]) +1 other test skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-lnl-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm.html
> 
>   * igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem:
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#6874]) +13 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-10/igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem.html
> 
>   * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#6874]) +4 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-lnl-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-basic.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#7138]) +1 other test skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-lnl-8/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
>     - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#7138]) +2 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html
> 
>   * igt@xe_mmap@pci-membarrier-parallel:
>     - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#5100] / [Intel XE#7322] / [Intel XE#7408])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-lnl-1/igt@xe_mmap@pci-membarrier-parallel.html
> 
>   * igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#6964])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-6/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#4733] / [Intel XE#7417])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
> 
>   * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random:
>     - shard-bmg:          [PASS][69] -> [FAIL][70] ([Intel XE#5937]) +1 other test fail
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-6/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-2/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random.html
> 
>   * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
>     - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#4130] / [Intel XE#7366])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-lnl-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
> 
>   * igt@xe_sriov_flr@flr-twice:
>     - shard-bmg:          NOTRUN -> [FAIL][72] ([Intel XE#6569])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-3/igt@xe_sriov_flr@flr-twice.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - shard-bmg:          [ABORT][73] ([Intel XE#7249] / [Intel XE#7578]) -> [PASS][74]
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-6/igt@core_hotunplug@unbind-rebind.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-6/igt@core_hotunplug@unbind-rebind.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>     - shard-lnl:          [FAIL][75] ([Intel XE#301]) -> [PASS][76] +1 other test pass
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [SKIP][77] ([Intel XE#1503]) -> [PASS][78]
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-3/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-lnl:          [FAIL][79] ([Intel XE#7340]) -> [PASS][80]
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-lnl-6/igt@kms_pm_dc@dc6-dpms.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
>     - shard-lnl:          [FAIL][81] ([Intel XE#5625]) -> [PASS][82]
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
> 
>   * igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create:
>     - shard-bmg:          [ABORT][83] ([Intel XE#7578]) -> [PASS][84]
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-5/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-3/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html
> 
>   * igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random:
>     - shard-bmg:          [FAIL][85] ([Intel XE#5937]) -> [PASS][86] +1 other test pass
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-2/igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-8/igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random.html
> 
>   * igt@xe_sriov_flr@flr-vfs-parallel:
>     - shard-bmg:          [FAIL][87] ([Intel XE#6569]) -> [PASS][88] +1 other test pass
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-5/igt@xe_sriov_flr@flr-vfs-parallel.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-10/igt@xe_sriov_flr@flr-vfs-parallel.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [SKIP][89] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][90] ([Intel XE#1729] / [Intel XE#7424])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@xe_module_load@load:
>     - shard-bmg:          ([PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [SKIP][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][117], [PASS][118], [DMESG-WARN][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [SKIP][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142]) ([Intel XE#2457] / [Intel XE#7405] / [Intel XE#7725])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-2/igt@xe_module_load@load.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-2/igt@xe_module_load@load.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-2/igt@xe_module_load@load.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-7/igt@xe_module_load@load.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-6/igt@xe_module_load@load.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-7/igt@xe_module_load@load.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-9/igt@xe_module_load@load.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-6/igt@xe_module_load@load.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-6/igt@xe_module_load@load.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-5/igt@xe_module_load@load.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-5/igt@xe_module_load@load.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-5/igt@xe_module_load@load.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-10/igt@xe_module_load@load.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-1/igt@xe_module_load@load.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-9/igt@xe_module_load@load.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-8/igt@xe_module_load@load.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-1/igt@xe_module_load@load.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-3/igt@xe_module_load@load.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-2/igt@xe_module_load@load.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-8/igt@xe_module_load@load.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-10/igt@xe_module_load@load.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-7/igt@xe_module_load@load.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-8/igt@xe_module_load@load.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-3/igt@xe_module_load@load.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-3/igt@xe_module_load@load.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5/shard-bmg-8/igt@xe_module_load@load.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-6/igt@xe_module_load@load.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-8/igt@xe_module_load@load.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-6/igt@xe_module_load@load.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-8/igt@xe_module_load@load.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-2/igt@xe_module_load@load.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-2/igt@xe_module_load@load.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-8/igt@xe_module_load@load.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-6/igt@xe_module_load@load.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-3/igt@xe_module_load@load.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-9/igt@xe_module_load@load.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-3/igt@xe_module_load@load.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-10/igt@xe_module_load@load.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-5/igt@xe_module_load@load.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-5/igt@xe_module_load@load.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-9/igt@xe_module_load@load.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-9/igt@xe_module_load@load.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-3/igt@xe_module_load@load.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-5/igt@xe_module_load@load.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-10/igt@xe_module_load@load.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-10/igt@xe_module_load@load.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-1/igt@xe_module_load@load.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-7/igt@xe_module_load@load.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-1/igt@xe_module_load@load.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-5/igt@xe_module_load@load.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-7/igt@xe_module_load@load.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/shard-bmg-7/igt@xe_module_load@load.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
>   [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>   [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
>   [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
>   [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
>   [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
>   [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
>   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7249
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
>   [Intel XE#7305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7305
>   [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
>   [Intel XE#7322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322
>   [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
>   [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
>   [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
>   [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
>   [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
>   [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
>   [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
>   [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
>   [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
>   [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
>   [Intel XE#7504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7504
>   [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
>   [Intel XE#7578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578
>   [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
>   [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
>   [Intel XE#7725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8853 -> IGT_8854
>   * Linux: xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5 -> xe-pw-164574v2
> 
>   IGT_8853: b52b42b0c987404a8cbf80c77a41e37705e32779 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8854: 93abaf0170728f69bc27577e5b405f7a2a01b6fd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-4884-3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5: 3751e2e5a19aba3949a3f12aa5b917eb8bbb1eb5
>   xe-pw-164574v2: 164574v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164574v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
