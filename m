Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B23C5B56A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 16:37:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2FAB10E0C2;
	Wed, 12 Aug 2026 16:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sdv2FWMs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB7310E0C2
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 16:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786552678; x=1818088678;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CtyVgUWO/bkjSCrTLtJ3LbqWZwCjQPSUNmqc2tpgqdU=;
 b=Sdv2FWMs1U4KW4Jz48TC7dAhNhjYlLoyFoVg9OBPkEybOWH3A20UJ6TF
 z+wS9YzBF+dHj0WRw5+pTdyl0rqNpqH0nvfF7+j1dpS3QblChF1hrphkj
 N3XxfngCbmMT1dBFoojv2H5nfra4V7OZs/YYHeuyXBcBBP7utBXLfb5+C
 oOGCeFrdYK71KoETw6i6WW0M0wquqaWl1k+Hv/8eqKtQJMUs95Ppkrp1Q
 7GtLw3ngdvShB2Rn0K7/7YAyKsZ2k5AaWuNpqIDq96L2G93Hz2xPWngdN
 TybGpX6OFw6XzmPSPBqw0McVj3wsr0QH1Zcf3XCR+A421d17P2Dt6RDBy Q==;
X-CSE-ConnectionGUID: x+nPFgg0QiyaBmqeXQRmYA==
X-CSE-MsgGUID: WSsySBKMQ7u1/O4FLuu45g==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="104500214"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="104500214"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 09:37:54 -0700
X-CSE-ConnectionGUID: Qxfv2qf2TZyf/hLua6Dn3w==
X-CSE-MsgGUID: vanXhwg2TsSt4J4V02oK2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="261069441"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 09:37:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 09:37:48 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 09:37:48 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.24) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 09:37:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NAxh4H7JVj2shsKrpnMuS0HdvdbfnB1Hz7428hcZV1Pf3p9WANWVlm0zxz4LPMzcHNy/N2FM4T3sFWngzdbYQaRDBB58kMmlxtjBfBWMI5yZvQenCH45mrx1Llv4HWMtJLuPK/d7FzggISdbqAHnzHwEQ/Gzs8dOHkhz0PmLbxl5nRFf4SIyL+pfKwhdTrxUg0SMu6MiBllROaYvOC9VwRnHOEdvRMNEgqViOZwxeOy4ra5/aEnB1wpaHVeThZZEvHiS2fkRdqUiY3tF+ensMmpCxQEllJc3H4IFpORaiIvqNntzeb4cLxG3RX2DZFcUTOgZfYsGQ41TYXuLb+OTAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dxX8P30df+Cozvi4cy24nhVWy9vlFFFold7FZY7qOg=;
 b=VNuGWzZ1OPGRYPWkNwGx6h/PVPOGahb2/Hmob/h8y69txWNGFVOwT5wezzE6AKy2GR6+tluoOC+HfRewTvNie5GGVMBkG0feJdu2YIHHL7QKz6lxKkeAUOUoEBiilE1vKkwac4+ZQAXiQXJyJYeQUrrevPRf+qp9lGYGQeyhpy2ksx2a6/jq8qlmKa1yajUzC+B0RZuzZRdLbEh4xJbRMg03PTPIIGO6sSV7vxvpEeZNO5bZZGPoVY7WD58FQHLL1FTmNw+zT/6OZPNu8s4ljnNCeY5QuCsBU/882cFiwpU60QaUif1kb5i7iVjaan7AXZsmjlB4GMm1Kju84L5lrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by BN9PR11MB5260.namprd11.prod.outlook.com (2603:10b6:408:135::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 12 Aug
 2026 16:37:32 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0315.011; Wed, 12 Aug 2026
 16:37:31 +0000
Date: Wed, 12 Aug 2026 09:37:29 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Raag Jadav <raag.jadav@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= success for
 drm/xe: Fix xe_device_probe() failure
Message-ID: <20260812163729.GB681121@mdroper-desk1.amr.corp.intel.com>
References: <20260810123821.105605-1-raag.jadav@intel.com>
 <178638004505.35583.10810612000099741@61270ab9df2a>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <178638004505.35583.10810612000099741@61270ab9df2a>
X-ClientProxiedBy: SJ0P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|BN9PR11MB5260:EE_
X-MS-Office365-Filtering-Correlation-Id: b16277a5-4bef-4d56-c8b5-08def890013d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|10067099003|11063799006|56012099006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: HL78cuwzTTeRVUs6CaI/2by19TXxGmTKtS20uYkejYNCUZtt0kq3TMKFFsKA3HluR5sP+PT3gcf/tb4D8RM8eWoKFD4lGicsO1FYvt1A5kfEDg9bIjuRQKUzv6E+U8VBwUMNNUtgJYQnnN3cz9fyHFX08cj6N6O0LJ1UIqEoS/1gy1ERIp6Dsrm81b/DrAiK02Zk1G9QULhtMYMdzYKDpU70vKR+a1AH7w2J6WL4yXHIznxiYBLkU+HUxgOPiCWL+GFGV01ah771vyzglKapJSRIsBKpIyV2zXU/a8RaWMLRiQ/x0s52DhJsjnDg8wXe8g/1e1PfN0YtV8wCbf7SYRrhd5iWbY9YZXpZ4XDTvkvg6ARmqTkl+RqQ4FM+XbBYAN1yzCHRuIICikDzfIVyyVt2AFaTWx3Org/ohQjklZq/3yNPbn4OYjMgzxC7xILKT1P1gZ3mvnFcGQR1F2stYkRTqX4q+SHQJ9remOsnVj24dcRNiVDpaSLEtR1Jt1YM/hYFdIUlZ+WyPx0F5xiAeMAUIuaTo2XkQF/kA2kb8H2Dpvdyy78KOcWK+d3vpowYX1yLXhKhAvqLOGEzbsF2RKfVNz0+2I75PLCu5I0TVwI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SpFeCCjDYEYKQo/SRhcNZiaNI9EoF6hAIVz+S87PEqU14Lp/sERDrqB6IWaS?=
 =?us-ascii?Q?Klm5OGdoNuZ3xfmkzSjPwvwq11LeNYiC+YsV4l3JeCo1VewEqpaxeoyTaPLd?=
 =?us-ascii?Q?vdV3AVg79fI35U2X7IT4bb+bJ4hJ12RxTiGNnzUVqi0ivyH1vrRuqODs8Hd1?=
 =?us-ascii?Q?yKnaTszobNA+woL0JLc+0YhtqZB900QPmA/C4dHDgixRqX/0o4vDBrmTG+Za?=
 =?us-ascii?Q?FKCE+xyXBTBIjZCdsBAv256aGzGiKL9bcjXZH+n49mDJHuemN6Ox9mMjDO3P?=
 =?us-ascii?Q?/Kwb01GeZlbgg4cr6jwA+g4Zt+Jo4fchHd7laI7MmAUCu1kLZ5qTSlHL+GcU?=
 =?us-ascii?Q?DBnMULxOh91kzXLcqvcZ9aFlZJj0i270Fcf5wsh9u2vV00YQDh6q1y3eDeY4?=
 =?us-ascii?Q?t88n0mdzZ95vpCfhRvQwreLG3EjFQOWER+HV2z5HJRGUdCyu+cRvO9GfVpT9?=
 =?us-ascii?Q?MjtdBWYIUpnwZkSBiBsXGSx2udT8IffT2jw1hbjlUnIfWCFe+hLcKWVxLQ8Q?=
 =?us-ascii?Q?aHmiP6o1NFoLbbRXq12cNwIIDmXAq8xStz+B150BRCvCuTW9RaQVkMQhI3Yi?=
 =?us-ascii?Q?xa9rEs8G/HcJmPCta2+Fgm5jaOwxUDSTThnH9hto5WWPzsUytduDGpR5oTnE?=
 =?us-ascii?Q?mOWw4HebGl0lPbhRsNKWCBJqLKnMvYIi6oKsoM9bWYOs2YmsBeKcPhE0NJJV?=
 =?us-ascii?Q?RcJjGrN8q0o8qqFf/dQ6GXyePwixsH89BsrCJ+RcGnhGVIhyNo4DD+IO+Tvu?=
 =?us-ascii?Q?Gk+s8JRqc85yaH1QrXKJZQosWGZGITXq2OXTFMxrzaGEwRCJOr4XKKSbzUGJ?=
 =?us-ascii?Q?3ZWAIcO87gvyMVMUCzawm4VMk5JequROljmLs8pDYQxCvzGO/h3xY7hsZj+p?=
 =?us-ascii?Q?ww5Cy3oIqLWE6WLOg7sNkd53C/O7kF2yiQc+9/hKKMQEPuYeZhAjIyWS5xTO?=
 =?us-ascii?Q?CLjxcDlu9yCMgO76AFP+Xe+qJt+uujT79leHayzMwvrRagUCf9TsE820KJkX?=
 =?us-ascii?Q?OPRtGP8FloTrQmhWBs1XWXttXvw9ROtoYELItqw35+0CBDBd/ZruCOrgC3CB?=
 =?us-ascii?Q?uhUiUDHrTh1FVLxhN/O4zSRBugBPfjB2Oh4zaCPbWdhkNEiIxnkZR4j7ajS8?=
 =?us-ascii?Q?LP64vS2P6NCYnHK2ja1bDDP304g1fhu4ApXz8SJmlvYTx7+WL1smvxxzdDUA?=
 =?us-ascii?Q?S7oGOAEob4OxxxDUBXHBB4C3ZXDYsAYRseVTdK2zQwaLBxHcG4U03ygCUIvT?=
 =?us-ascii?Q?y7RtdjOdA+v81zThOHfVtOhh3JiPzOKwaq7FKF+oZUEz7MQmcjpKGH2ZmIx4?=
 =?us-ascii?Q?4DQuE/gfF5XHyHTvynuIFwp2xQx7LZjGYlCZfrtE6usY7X9YmoAnSb1XXS6u?=
 =?us-ascii?Q?bCGiVViFYLwPRdVHS4GdsE1WkBSOG9lbQWHkmy9XhSrV57/uCU1VF/VFejpB?=
 =?us-ascii?Q?2i5+X7VvX/S+suJY7NFX5sLUZzdQwSyR6ZxgzGEPFqYMtckfxJ5MykCzEkzA?=
 =?us-ascii?Q?193ul9tVg6hAQkGd8YC29nLR8HvjfBpqDKvct8xvlU2hbICxPGBNZrM9T7cm?=
 =?us-ascii?Q?KYpaf0K3PT33CcY3XA45vnDnnAZzv39XD9VmISNKdHBDqNqRhCjn0ez9/4Rm?=
 =?us-ascii?Q?eJFh69KYTv2UjmRMNhniuYuVkk24z6BE/MAGLDSmzXOhuNNFmOItt+NK9+KE?=
 =?us-ascii?Q?QAqHJYlJPMAFW+95vN4DZHTK4FK11ZNVmT+vCPUyZmb2nkZi9jl90n+3P8Jt?=
 =?us-ascii?Q?gXtB2V5wzDyLSS3NuYzkBsHi4rXhhnQ=3D?=
X-Exchange-RoutingPolicyChecked: QnTf7VAbO63+/pUwE9VnDXJDCqVyE/EkSsPOpYxuxOfVaj9VqI2uIYDUIAqE4m+AFlDy94KQSdHeOA73zZHNOdfyJ+Q0qkB2YLnfAYFjya7e6FLKmXQBpNbjfYuhX6prQg2kiaIBhkvgtzbN03m1PmuHOCfifa3HK4Zec0U05lMXkG5FVJ5aTmNhKEZCxp+A8VAakFlOKnu/lFcNEg8q2S0FJ7C0kjfC3/bdoWUgfPJUH38THtAMhewLfpsGtBK6oZ6W2QLks8zYHj4B2V3I1NFmx2OJIWVvqL3DNaWY6WGtG3S1w1/FBJsUTaPSIRFUJPMOlTHSMijMr9kjzCzAJw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b16277a5-4bef-4d56-c8b5-08def890013d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 16:37:31.5720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sED5TevlEZkvVNKfm3LraDN23HGm30O49hB4j26zAQNDnBG0VzNjTPOs0BUAHFuQ245Yv9ARYPyNu4K8AxHLVm/po/gnrBsOaXlihGiV1LM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5260
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

On Mon, Aug 10, 2026 at 04:40:45PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Fix xe_device_probe() failure
> URL   : https://patchwork.freedesktop.org/series/171936/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92_FULL -> xe-pw-171936v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 

Applied to drm-xe-next.  Thanks for the patch and review!


Matt

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
>   Here are the changes found in xe-pw-171936v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#1124])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#2652]) +7 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2887])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-9/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd:
>     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2252])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-9/igt@kms_chamelium_hpd@dp-hpd.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>     - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#301] / [Intel XE#3149])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
> 
>   * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-indfb-pgflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2311]) +2 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-9/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#4141])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#1503])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-10/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-9/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1499])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-9/igt@kms_vrr@flip-dpms.html
> 
>   * igt@xe_exec_fault_mode@many-multi-queue-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#8374])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-queue-prefetch.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#8378])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate.html
> 
>   * igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc:
>     - shard-bmg:          [PASS][15] -> [ABORT][16] ([Intel XE#8007]) +2 other tests abort
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_vma_ops_alloc.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip:
>     - shard-bmg:          [FAIL][17] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][18]
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:
>     - shard-bmg:          [FAIL][19] ([Intel XE#6078]) -> [PASS][20]
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          [INCOMPLETE][21] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][22] +1 other test pass
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-bmg:          [DMESG-FAIL][23] ([Intel XE#7774]) -> [PASS][24] +1 other test pass
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [FAIL][25] ([Intel XE#301]) -> [PASS][26] +4 other tests pass
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-lnl:          [FAIL][27] ([Intel XE#8399]) -> [PASS][28]
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@xe_exec_basic@many-rebind:
>     - shard-bmg:          [SKIP][29] ([Intel XE#8589]) -> [PASS][30] +48 other tests pass
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@xe_exec_basic@many-rebind.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@xe_exec_basic@many-rebind.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-90:
>     - shard-bmg:          [SKIP][31] ([Intel XE#8589]) -> [SKIP][32] ([Intel XE#2327])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-90.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>     - shard-bmg:          [SKIP][33] ([Intel XE#8589]) -> [SKIP][34] ([Intel XE#1124])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
>     - shard-bmg:          [SKIP][35] ([Intel XE#8589]) -> [SKIP][36] ([Intel XE#7679])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>     - shard-bmg:          [SKIP][37] ([Intel XE#8589]) -> [SKIP][38] ([Intel XE#2652])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
> 
>   * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
>     - shard-bmg:          [SKIP][39] ([Intel XE#8589]) -> [SKIP][40] ([Intel XE#7358])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-bmg:          [SKIP][41] ([Intel XE#8589]) -> [SKIP][42] ([Intel XE#2321] / [Intel XE#7355])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank:
>     - shard-lnl:          [FAIL][43] ([Intel XE#301]) -> [FAIL][44] ([Intel XE#301] / [Intel XE#3149])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
>     - shard-bmg:          [SKIP][45] ([Intel XE#8589]) -> [SKIP][46] ([Intel XE#2311]) +6 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move:
>     - shard-bmg:          [SKIP][47] ([Intel XE#8589]) -> [SKIP][48] ([Intel XE#2313]) +4 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-move.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][49] ([Intel XE#3544]) -> [SKIP][50] ([Intel XE#3374] / [Intel XE#3544])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:
>     - shard-bmg:          [SKIP][51] ([Intel XE#8589]) -> [SKIP][52] ([Intel XE#7283])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-bmg:          [SKIP][53] ([Intel XE#8589]) -> [SKIP][54] ([Intel XE#7794])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_psr@psr-primary-blt:
>     - shard-bmg:          [SKIP][55] ([Intel XE#8589]) -> [SKIP][56] ([Intel XE#2234] / [Intel XE#2850])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@kms_psr@psr-primary-blt.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@kms_psr@psr-primary-blt.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [SKIP][57] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][58] ([Intel XE#1729] / [Intel XE#7424])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][59] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][60] ([Intel XE#2426] / [Intel XE#5848])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
>     - shard-bmg:          [SKIP][61] ([Intel XE#8589]) -> [SKIP][62] ([Intel XE#2322] / [Intel XE#7372])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
> 
>   * igt@xe_exec_multi_queue@two-queues-preempt-mode-basic:
>     - shard-bmg:          [SKIP][63] ([Intel XE#8589]) -> [SKIP][64] ([Intel XE#8364])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-cm-rebind:
>     - shard-bmg:          [SKIP][65] ([Intel XE#8589]) -> [SKIP][66] ([Intel XE#8378]) +1 other test skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html
> 
>   * igt@xe_page_reclaim@pde-vs-pd:
>     - shard-bmg:          [SKIP][67] ([Intel XE#8589]) -> [SKIP][68] ([Intel XE#7793])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@xe_page_reclaim@pde-vs-pd.html
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@xe_page_reclaim@pde-vs-pd.html
> 
>   * igt@xe_query@multigpu-query-engines:
>     - shard-bmg:          [SKIP][69] ([Intel XE#8589]) -> [SKIP][70] ([Intel XE#944])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92/shard-bmg-5/igt@xe_query@multigpu-query-engines.html
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/shard-bmg-8/igt@xe_query@multigpu-query-engines.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
>   [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
>   [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
>   [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
>   [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
>   [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
>   [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
>   [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
>   [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
>   [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
>   [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
>   [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
>   [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
>   [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
>   [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
>   [Intel XE#8589]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92 -> xe-pw-171936v1
> 
>   IGT_9047: 9047
>   xe-5570-64945e34f2f3505d1def53d6752c04ddca144a92: 64945e34f2f3505d1def53d6752c04ddca144a92
>   xe-pw-171936v1: 171936v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171936v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
