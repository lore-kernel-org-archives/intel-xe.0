Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D912ECF9C6F
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 17:50:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2CC10E440;
	Mon, 23 Sep 2024 17:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e56cnivB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD6E10E436
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Sep 2024 17:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727113820; x=1758649820;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wHdkXP34z9zYBpK6UEaOJLAysSSQbLGOgq3lwDvS4JE=;
 b=e56cnivBHHsUyOXa2mvbfdvKx1PvI9HFdq/VFdgpjkuvf36zrZcLrfDj
 JvpPHM3WBS1SxJ+aPdr6MVKUS1tc8L7Dhv4F5A9GBj+X6QHjxvdPCTxT3
 oRU4fDn9xPujiVlkHbtPfj/WEbcgV5fVpTGh32u5LiF0dQBofxbzOLsAs
 1FpHV8g8ZYb/453yLwQ7/dyYDXHgv1sju6uqNNNI/rLWgKyJQCEYOam4g
 vYIvF67aGAzM5+hUTF4cLbGKtptN2i/IIySKdfkdUF+ys8E0Let894ww8
 xdlqH7AJM5AxBoE0JGH+nMAatOkFz1ypY+dQDd+4jMbyz19WjzupUAN+0 Q==;
X-CSE-ConnectionGUID: IomBWaJFSuifq7vnBqRZPg==
X-CSE-MsgGUID: U4NRvJOpRzSCCV8+AOlPCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25954343"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="25954343"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 10:50:19 -0700
X-CSE-ConnectionGUID: sIIE9HuyTQSKmxdtSoTj2A==
X-CSE-MsgGUID: IxwyrPl5T1qnxh4oDxomJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="76072960"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Sep 2024 10:50:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 10:50:18 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 23 Sep 2024 10:50:18 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Sep 2024 10:50:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qN51nMU2pV8BlHTPofeA8sX7n9CrB80v6l9IQ5MnqbgC3RpD2PyXlLji+A0GQ8Cmve7rQcFq4FOKeHKPJLc/EEQTjhWSBfKu7f04MeqTSI5u3WMSL125eN19Z7Dp92Y2c3Z7WmwPaRWNzyz3LQN8/c81vpbfMIGMTtTZR0ESecg9YtSnS30S8V2Le9tRhqGSXzCJ6Xo+VOARuCJWoAoDKW2ZozogitxKlWYNNIkChGM1L2+92/LRdgqWlJfH1z90H4kzMAS2sGkXoVqKbpEaKee1CNwwJ2AI45yM/DjCUmXEMAWtLj9iakzfkDl0A8zsiiba5d5GzSGJycrdGCz7hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MZNGJmVTWORLuGggdS8fwgDdPPCYeQ7TB2MxhWbPf4=;
 b=Cc+2EsNbRtTYBE0uEkmWFXitV6be+baaNPUqPiIhgLDnhiVXlmXvuWLTB4Bt7Gnx4/ewwpvNe3mdR77+Xpqea0GisAkKs1v6KXnZPf2cxoRcEKytuVik1kIEHXac3udTIrjZ7rK7V+0+uojFnloh6tIIqOxiZaI7mkFT60mtqBMgqCrzz/PE0PtVNttVKBSqVTkrNIErMxUDbDvd4BtgYbUEMr/6fdiSupvazShewQTdAPx5ItOAJPnTz5VhZY2l53R+kQTNrPnz0zJx5twTjVtL44Dapbod9ycy3vJQIWiSVKkVyCY38rzmhcDbYeA6dp01lYhiwoCEoN8T/iExgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6931.namprd11.prod.outlook.com (2603:10b6:510:206::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.18; Mon, 23 Sep
 2024 17:50:12 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 17:50:12 +0000
Date: Mon, 23 Sep 2024 10:50:08 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw=?= =?utf-8?Q?=3A?= failure for Xe2
 performance tuning updates (rev3)
Message-ID: <20240923175008.GZ5091@mdroper-desk1.amr.corp.intel.com>
References: <20240920211459.255181-1-gustavo.sousa@intel.com>
 <172688333585.1052507.7497201467436355742@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172688333585.1052507.7497201467436355742@2413ebb6fbb6>
X-ClientProxiedBy: BY1P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::13) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6931:EE_
X-MS-Office365-Filtering-Correlation-Id: d3f24fc4-bdf1-41a1-c092-08dcdbf82c0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CvK92O4dLEPwzi5dDp9Lr0Euzrd/UfxXBl2cTm9aiy/QdhM+ABFFd4VcKkzv?=
 =?us-ascii?Q?fjyq8JAQvg+p04Z/NF2R+mlrfrgf6P8pOTiAQX2W60O8BucUxGweKXkNXuPB?=
 =?us-ascii?Q?tydbO1Z1tS+WSO+dWYylIZzmU4BpxN7cR5HZunCwuGP4urFrt7Qc+vQqQa+9?=
 =?us-ascii?Q?UD9uoWzFFN3cl6Euhq+Nf75FV1nyrQ7KVGMS2aI0KkFawAwqpt/CoDORU/CG?=
 =?us-ascii?Q?kM6PfTXY4wO8jQ9oerqL7Lid0epCCdznDRLHlcNyeIYblBZ/EbwdxsxaXX65?=
 =?us-ascii?Q?GusrP44VykyeTzo3QbTy1cl4E5fjTZzRfiRXQft3tjJaqCMYwCAGoLhGMA8b?=
 =?us-ascii?Q?6dGz16Vsv5qcYrY1ic3GzijEx2mlVmG8Qwj5SGzeHPtQNThH4qH5TIu4v46k?=
 =?us-ascii?Q?Ms9DHbM18+t7gVOGRL4O0qx0JHSkxtO+/q2vfBLAuqvZgpGwGIhhELiya2gT?=
 =?us-ascii?Q?fy18mYdGvLy1PMM+sXTYJs9Hwf5BBDV2zGTZgPJ67Krn/w/ibbRS4l8DprRg?=
 =?us-ascii?Q?iAQ8EqLS9C8wNwO8zHbE/1mSc8Gy8k5pH3IWpWwZp8vkShbZgYfLm1VMLlud?=
 =?us-ascii?Q?PgMXauxLZDclfjdruP4ftaNDyNlW0IoSXCK/u+Rf5GE8Eap2ivu41kcfyd1L?=
 =?us-ascii?Q?Ervoem9k5yO6/EADjaipQVA/SvVnvsPzxnMlScqLh0XENIBX/1KQHQbOlHeu?=
 =?us-ascii?Q?zQN/oJuevHhbEHtSNLeYXgkyKIjVHN4zxTe3fjf5poN6aPz0M6VrNQxAyUUP?=
 =?us-ascii?Q?xRlQBNZprEpFgF5qXpbSV51fFOBBAAmsTsg9+mRn8HDiu2zKrhep3Mxydt+0?=
 =?us-ascii?Q?eqZJmdthZYUxRWusX4VlX0/osnOPxxVWDWS34VddUjmmIn5ZQ6uoahHlYS7j?=
 =?us-ascii?Q?bUu3KSgh2Ofpg1UkGRO0noXC0mcOBU+/Vbzv60U+LWNn+yXmBlXBnpwjkrhj?=
 =?us-ascii?Q?e3MCHfs/Yc//GgcsfRV5dI1h0GUwXwSxhUEX0FCL8qp6SbTkXWOu8U5rk5BK?=
 =?us-ascii?Q?TRP4BAcsjH5Fa1fMG1x9Ucy8FE7mKAXBqRSns1BA0nWQn/LO08PxxokMgU0D?=
 =?us-ascii?Q?pKMXuttUoFR071yl4uYyebBJn6uzZ3KPwssb30q/XWWJXLn8ugAADXx3gyd7?=
 =?us-ascii?Q?K2iLWkq3IidFh1JqdtHZlpvsiiru+y87TSTNGSsloVpZNQIqcCiAGhNNUQmE?=
 =?us-ascii?Q?QBGWnycbq4QIsLBxX+s4vuArxS64gnaeOhj5+EMNr5waoNJzR5j+w3KTSRf2?=
 =?us-ascii?Q?ZRIUCbauxziZbzV2V+g8xHUu5BlUYAOKuuRYDnvf0MoC6GR5DWOtsxIz2QGY?=
 =?us-ascii?Q?b/Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?50cX32aB3D5Ysqzb2+gx1tavX4itWaTzjKZGJKR69/ivsLCILfzJczJR1v+Y?=
 =?us-ascii?Q?Z+/kzIyYTDz1jXv0C+OrzhMg9nJrFuC6RLazY+hraLFIjM2VqqvNFM2gkL1V?=
 =?us-ascii?Q?i7D61vRtEZ65EB4kgsMR4rQbOofLYp11ITZdTalg9Qt3KW3j7PKQKcFSMI4F?=
 =?us-ascii?Q?vS917lrzddcZS4VO/S/PxmeHoRdqysanT/Y+MgmdKVG99Vndq38afak48DZs?=
 =?us-ascii?Q?5H3dJbJYXM6So7DUnggNcZeBpfjraftB31eiA/fxj9Wbos0EtrymBDLVs5aI?=
 =?us-ascii?Q?sYHD3w6TMZZc3Ud4Y9BAUL68o+9ofeL+ICPp5LQX2lT/9XdD2jm7+LrpUZl/?=
 =?us-ascii?Q?9mogB+ZEAog5Vx8bgv4QOi9aZHyvVEOBvI/0nRisY93dTjOSBxdI72EpzeWu?=
 =?us-ascii?Q?M7YwOIFY9TAb9EYzHjWey2L73vvSzfVYlKjunbpXGa34chFavnj8DZ8v5RU1?=
 =?us-ascii?Q?vjETHHRYPhJ0dae0EDLBlYAJ59Y8KYVDixrFSzq2bZ8DT+v0uy+/kAAeM/vP?=
 =?us-ascii?Q?E/dKeONJjf1N19wAVFu11IfrW0e2Yh8mMeeEfZZvalFAXxqH1oc27ZdXP0p7?=
 =?us-ascii?Q?cD6c7XsXWFNT0gvgPgUFI3WeU/+fN8pjOwMBhRDIuE4soONVGBkds+2finu6?=
 =?us-ascii?Q?q3v8minLLDMv0JfMXz6WByr4hIkBvI/lMvPokG5cAn4ntn2u8GhxPs0Vq9eP?=
 =?us-ascii?Q?qhL0fFGeMv8QFfoTFL5hMpdfdx2NKuJC8H3Y1lYDF4dXQAK6j4DC5/U7gyzQ?=
 =?us-ascii?Q?iynyeqesrbKiQFYgtoIg0DxvB9HhQPBPhCRMBJY8lJFtAdHMicfMHz8+EobW?=
 =?us-ascii?Q?TNITngbuBX68Q76JryxAI/hGIQoFWpXWy3fSJX6H2Lm76x681cvgut3YhELF?=
 =?us-ascii?Q?gRS9IN8u0GwUlJZ1J/znuhJJjhk8wJyoM60hWOoufzxDEWlIoHryBDnVfuf7?=
 =?us-ascii?Q?5zsJ6vfml55YS0GBwSAwDL5O43tYnBOaoFSGezJhpoNdsYuLmyTBx4n1CkZG?=
 =?us-ascii?Q?ZxRtMEWjOQXwy4cCdh1Uofc1M+NhMg1RtUj2EGvAB+n3vXy2CkueslV8HGRZ?=
 =?us-ascii?Q?N6Wy24PwMGRt2nTtG33JXGOWuAbFFQ6nxoi/dTHQSlAgGnd3nSZrM0umgj90?=
 =?us-ascii?Q?mGho/c0wgXlqjPy3JpB64D5eDeMCa/7DLZnQ1sK0QrJUpVVqJHIwfvgPuGiV?=
 =?us-ascii?Q?BTwDj7XXnfyikdcuOF5EbWWXSg007xdSaeyj78Av3n26jU2ChDnyuAuTuQ12?=
 =?us-ascii?Q?Bi3cty99OwD54/RlFKZVodepeuWQXrvkqG3732dxE7pQNOxMlo3FzVIzLgU6?=
 =?us-ascii?Q?m3oRA8nrJoq1gUCYC7vgm7mHihmi26kXkIRklsxI4AaQPv+tSWhojeYysiU6?=
 =?us-ascii?Q?3qaLae4X+GYIGoTlP4i1QAQQqotkb+PjKr3f+mbQpbn9RYAvP4ucl/DSXZAj?=
 =?us-ascii?Q?ythe7iIjS1PrfdFJX6A3ARpnh8willjbBfTzeq7nQP0JD5dAHtqwGlMkCocH?=
 =?us-ascii?Q?0JesJvepkSWWZ4xM4HoDCLmNZH0HbjQlXkzBjCEE/Eixq199dPHgxHXIvCs4?=
 =?us-ascii?Q?op3WVo2DF0R5jCfDEaJ3TOOwvL5jvwHMSRDpgVspT59QQdlddnUlQJ9b3GNc?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f24fc4-bdf1-41a1-c092-08dcdbf82c0e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 17:50:11.9590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9MWGuLHHbGfn4m/WHupkE7opXRR7INb+4Bc8EyaPqfBLYGgIrmlBdMCeS93bxdefAQFqzluu1yWkru/Ikd1PHpaSklBMlG4oqhlEy63cftU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6931
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

On Sat, Sep 21, 2024 at 01:48:55AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Xe2 performance tuning updates (rev3)
> URL   : https://patchwork.freedesktop.org/series/138844/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990_full -> xe-pw-138844v3_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-138844v3_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-138844v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-138844v3_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

This DG2 failure isn't related to the Xe2 tuning settings in this patch.

Applied to drm-xe-next.  Thanks for the patches and reviews.


Matt

> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3:
>     - {shard-bmg}:        [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-138844v3_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
>     - shard-adlp:         [PASS][5] -> [DMESG-WARN][6] ([Intel XE#1033]) +1 other test dmesg-warn
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-lnl:          [PASS][7] -> [FAIL][8] ([Intel XE#1426]) +1 other test fail
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
>     - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          [PASS][10] -> [FAIL][11] ([Intel XE#1659]) +1 other test fail
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [PASS][14] -> [DMESG-WARN][15] ([Intel XE#324])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [PASS][16] -> [FAIL][17] ([Intel XE#1204]) +1 other test fail
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [PASS][18] -> [FAIL][19] ([Intel XE#1231]) +3 other tests fail
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#607])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#610])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-2/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#610])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1124] / [Intel XE#1201])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#367])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-1/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#787]) +6 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
>     - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +5 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#787]) +8 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#1252])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#306])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-6/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_chamelium_edid@dp-edid-read:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#373])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-463/igt@kms_chamelium_edid@dp-edid-read.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#373])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
>     - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#373])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-1/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html
> 
>   * igt@kms_content_protection@srm@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][35] ([Intel XE#1178]) +1 other test fail
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-436/igt@kms_content_protection@srm@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#308])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-8/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#776])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-9/igt@kms_fbcon_fbt@psr-suspend.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#776])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_flip@2x-blocking-wf_vblank:
>     - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#310]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-4/igt@kms_flip@2x-blocking-wf_vblank.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
>     - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#455]) +12 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#651]) +4 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-adlp:         [PASS][43] -> [FAIL][44] ([Intel XE#1861]) +2 other tests fail
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-4:
>     - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1151] / [Intel XE#1201])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#658])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#653]) +2 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#653]) +3 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#656]) +18 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_plane@plane-position-hole@pipe-a-plane-2:
>     - shard-lnl:          [PASS][50] -> [DMESG-FAIL][51] ([Intel XE#324])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html
> 
>   * igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
>     - shard-adlp:         [PASS][52] -> [FAIL][53] ([Intel XE#1874]) +7 other tests fail
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-adlp-1/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-4/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#2763] / [Intel XE#455]) +1 other test skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#2763]) +2 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
>     - shard-dg2-set2:     [PASS][56] -> [INCOMPLETE][57] ([Intel XE#1195]) +1 other test incomplete
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-lnl:          [PASS][58] -> [FAIL][59] ([Intel XE#718])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
>     - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201]) +1 other test skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-6/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr@fbc-psr-primary-render:
>     - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-8/igt@kms_psr@fbc-psr-primary-render.html
> 
>   * igt@kms_psr@psr-cursor-plane-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-433/igt@kms_psr@psr-cursor-plane-move.html
> 
>   * igt@kms_psr@psr2-primary-blt@edp-1:
>     - shard-lnl:          [PASS][63] -> [FAIL][64] ([Intel XE#1649]) +1 other test fail
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-lnl-4/igt@kms_psr@psr2-primary-blt@edp-1.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-lnl-8/igt@kms_psr@psr2-primary-blt@edp-1.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1127] / [Intel XE#1201])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1127] / [Intel XE#1201])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_sysfs_edid_timing:
>     - shard-adlp:         NOTRUN -> [FAIL][67] ([Intel XE#1174])
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-8/igt@kms_sysfs_edid_timing.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
>     - shard-lnl:          [PASS][68] -> [FAIL][69] ([Intel XE#899])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
> 
>   * igt@kms_vrr@cmrr:
>     - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#2168])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-1/igt@kms_vrr@cmrr.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-435/igt@kms_vrr@flipline.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#261]) +1 other test skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-1/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-6/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [PASS][74] -> [FAIL][75] ([Intel XE#1000])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [PASS][76] -> [TIMEOUT][77] ([Intel XE#1473])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-463/igt@xe_evict@evict-threads-large.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-466/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
>     - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#688])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
>     - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1201] / [Intel XE#1392]) +2 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-4/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
> 
>   * igt@xe_exec_compute_mode@once-userptr-invalidate:
>     - shard-lnl:          [PASS][80] -> [FAIL][81] ([Intel XE#1069])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-lnl-2/igt@xe_exec_compute_mode@once-userptr-invalidate.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-lnl-5/igt@xe_exec_compute_mode@once-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#288]) +1 other test skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault:
>     - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#288]) +8 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html
> 
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
>     - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#2360])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-1/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
> 
>   * igt@xe_noexec_ping_pong:
>     - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#379])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-8/igt@xe_noexec_ping_pong.html
> 
>   * igt@xe_oa@privileged-forked-access-vaddr:
>     - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#2541]) +4 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-2/igt@xe_oa@privileged-forked-access-vaddr.html
> 
>   * igt@xe_oa@whitelisted-registers-userspace-config:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#2541]) +2 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-433/igt@xe_oa@whitelisted-registers-userspace-config.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-adlp:         [PASS][88] -> [ABORT][89] ([Intel XE#1794])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_query@multigpu-query-invalid-query:
>     - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-4/igt@xe_query@multigpu-query-invalid-query.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][91] ([Intel XE#1033]) -> [PASS][92]
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][93] ([Intel XE#1426]) -> [PASS][94] +1 other test pass
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [FAIL][95] ([Intel XE#1231]) -> [PASS][96] +2 other tests pass
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>     - {shard-bmg}:        [INCOMPLETE][97] -> [PASS][98] +2 other tests pass
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-bmg-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-bmg-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>     - {shard-bmg}:        [DMESG-WARN][99] -> [PASS][100]
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1:
>     - shard-lnl:          [FAIL][101] ([Intel XE#886]) -> [PASS][102]
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1.html
> 
>   * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a6:
>     - shard-dg2-set2:     [DMESG-WARN][103] -> [PASS][104] +1 other test pass
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-463/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a6.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-466/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a6.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
>     - shard-adlp:         [FAIL][105] ([Intel XE#1861]) -> [PASS][106] +1 other test pass
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
> 
>   * igt@kms_plane@plane-position-covered@pipe-a-plane-3:
>     - shard-lnl:          [DMESG-FAIL][107] ([Intel XE#324]) -> [PASS][108] +1 other test pass
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-lnl-1/igt@kms_plane@plane-position-covered@pipe-a-plane-3.html
> 
>   * igt@kms_plane@plane-position-covered@pipe-b-plane-3:
>     - shard-lnl:          [DMESG-WARN][109] ([Intel XE#324]) -> [PASS][110] +4 other tests pass
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-lnl-1/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html
> 
>   * igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1:
>     - shard-adlp:         [FAIL][111] ([Intel XE#1874]) -> [PASS][112] +4 other tests pass
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-adlp-6/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-9/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-dg2-set2:     [FAIL][113] ([Intel XE#361]) -> [PASS][114] +1 other test pass
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-lnl:          [FAIL][115] ([Intel XE#2029]) -> [PASS][116]
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_pm_rpm@universal-planes:
>     - shard-adlp:         [SKIP][117] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][118]
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-adlp-6/igt@kms_pm_rpm@universal-planes.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-4/igt@kms_pm_rpm@universal-planes.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
>     - shard-lnl:          [FAIL][119] ([Intel XE#899]) -> [PASS][120]
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
> 
>   * igt@kms_vrr@flip-basic:
>     - shard-lnl:          [FAIL][121] ([Intel XE#2443]) -> [PASS][122] +1 other test pass
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-lnl-2/igt@kms_vrr@flip-basic.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-lnl-8/igt@kms_vrr@flip-basic.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - {shard-bmg}:        [TIMEOUT][123] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][124]
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-bmg-5/igt@xe_evict@evict-mixed-threads-large.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-bmg-7/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
>     - shard-dg2-set2:     [INCOMPLETE][125] ([Intel XE#2820]) -> [PASS][126]
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-432/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-436/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html
> 
>   * igt@xe_exec_balancer@twice-cm-parallel-userptr:
>     - shard-adlp:         [FAIL][127] ([Intel XE#1069]) -> [PASS][128] +3 other tests pass
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-adlp-6/igt@xe_exec_balancer@twice-cm-parallel-userptr.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-1/igt@xe_exec_balancer@twice-cm-parallel-userptr.html
> 
>   * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race:
>     - shard-adlp:         [INCOMPLETE][129] ([Intel XE#1195]) -> [PASS][130]
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-adlp-6/igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-9/igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate-race.html
> 
>   * igt@xe_exec_basic@once-basic-defer-bind:
>     - shard-adlp:         [TIMEOUT][131] -> [PASS][132] +1 other test pass
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-adlp-6/igt@xe_exec_basic@once-basic-defer-bind.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-4/igt@xe_exec_basic@once-basic-defer-bind.html
> 
>   * igt@xe_exec_reset@virtual-cat-error:
>     - {shard-bmg}:        [DMESG-WARN][133] ([Intel XE#877]) -> [PASS][134] +3 other tests pass
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-bmg-3/igt@xe_exec_reset@virtual-cat-error.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-bmg-4/igt@xe_exec_reset@virtual-cat-error.html
> 
>   * igt@xe_module_load@many-reload:
>     - {shard-bmg}:        [TIMEOUT][135] ([Intel XE#2026]) -> [PASS][136]
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-bmg-5/igt@xe_module_load@many-reload.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-bmg-8/igt@xe_module_load@many-reload.html
> 
>   * igt@xe_module_load@reload-no-display:
>     - {shard-bmg}:        [FAIL][137] ([Intel XE#2362]) -> [PASS][138]
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-bmg-2/igt@xe_module_load@reload-no-display.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-bmg-5/igt@xe_module_load@reload-no-display.html
> 
>   * igt@xe_module_load@unload:
>     - {shard-bmg}:        [WARN][139] ([Intel XE#2357]) -> [PASS][140] +1 other test pass
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-bmg-2/igt@xe_module_load@unload.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-bmg-7/igt@xe_module_load@unload.html
> 
>   * igt@xe_oa@mmio-triggered-reports:
>     - {shard-bmg}:        [FAIL][141] ([Intel XE#2249]) -> [PASS][142] +1 other test pass
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-bmg-4/igt@xe_oa@mmio-triggered-reports.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-bmg-1/igt@xe_oa@mmio-triggered-reports.html
>     - shard-lnl:          [FAIL][143] ([Intel XE#2249]) -> [PASS][144] +1 other test pass
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-lnl-1/igt@xe_oa@mmio-triggered-reports.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-lnl-3/igt@xe_oa@mmio-triggered-reports.html
> 
>   * igt@xe_oa@oa-exponents:
>     - shard-lnl:          [FAIL][145] ([Intel XE#2723]) -> [PASS][146]
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-lnl-4/igt@xe_oa@oa-exponents.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-lnl-5/igt@xe_oa@oa-exponents.html
> 
>   * igt@xe_oa@oa-regs-whitelisted@rcs-0:
>     - shard-lnl:          [FAIL][147] ([Intel XE#2514]) -> [PASS][148] +1 other test pass
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-lnl-7/igt@xe_oa@oa-regs-whitelisted@rcs-0.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-lnl-7/igt@xe_oa@oa-regs-whitelisted@rcs-0.html
>     - {shard-bmg}:        [FAIL][149] ([Intel XE#2514]) -> [PASS][150] +1 other test pass
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-bmg-7/igt@xe_oa@oa-regs-whitelisted@rcs-0.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-bmg-8/igt@xe_oa@oa-regs-whitelisted@rcs-0.html
> 
>   * igt@xe_pm@s3-vm-bind-userptr:
>     - shard-dg2-set2:     [DMESG-WARN][151] ([Intel XE#1551] / [Intel XE#569]) -> [PASS][152]
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-434/igt@xe_pm@s3-vm-bind-userptr.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-433/igt@xe_pm@s3-vm-bind-userptr.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-adlp:         [TIMEOUT][153] ([Intel XE#1358]) -> [PASS][154]
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-adlp-6/igt@xe_pm@s4-exec-after.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-8/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-adlp:         [ABORT][155] ([Intel XE#1794]) -> [PASS][156]
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-adlp-9/igt@xe_pm@s4-mocs.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-2/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_spin_batch@spin-fixed-duration-with-preempter:
>     - shard-adlp:         [FAIL][157] ([Intel XE#1081]) -> [PASS][158]
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-adlp-1/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-9/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][159] ([Intel XE#316]) -> [SKIP][160] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-432/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][161] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][162] ([Intel XE#316])
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-270.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [DMESG-WARN][163] ([Intel XE#324]) -> [FAIL][164] ([Intel XE#1231])
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][165] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][166] ([Intel XE#607])
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     [SKIP][167] ([Intel XE#1201] / [Intel XE#610]) -> [SKIP][168] ([Intel XE#610])
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-dg2-set2:     [SKIP][169] ([Intel XE#1124]) -> [SKIP][170] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][171] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][172] ([Intel XE#1124]) +6 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
>     - shard-dg2-set2:     [SKIP][173] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][174] ([Intel XE#2191])
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][175] ([Intel XE#2191]) -> [SKIP][176] ([Intel XE#1201] / [Intel XE#2191])
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][177] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][178] ([Intel XE#367]) +2 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][179] ([Intel XE#367]) -> [SKIP][180] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
>     - shard-dg2-set2:     [SKIP][181] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][182] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     [SKIP][183] ([Intel XE#1252]) -> [SKIP][184] ([Intel XE#1201] / [Intel XE#1252])
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][185] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][186] ([Intel XE#787]) +48 other tests skip
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-6.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>     - shard-dg2-set2:     [SKIP][187] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][188] ([Intel XE#1252]) +1 other test skip
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][189] ([Intel XE#787]) -> [SKIP][190] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
>     - shard-dg2-set2:     [SKIP][191] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][192] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>     - shard-dg2-set2:     [SKIP][193] ([Intel XE#1152] / [Intel XE#1201]) -> [SKIP][194] ([Intel XE#1152]) +3 other tests skip
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-436/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-dg2-set2:     [SKIP][195] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][196] ([Intel XE#306])
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-436/igt@kms_chamelium_color@degamma.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-dg2-set2:     [SKIP][197] ([Intel XE#306]) -> [SKIP][198] ([Intel XE#1201] / [Intel XE#306]) +2 other tests skip
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-432/igt@kms_chamelium_color@gamma.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-433/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-fast:
>     - shard-dg2-set2:     [SKIP][199] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][200] ([Intel XE#373]) +6 other tests skip
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-433/igt@kms_chamelium_hpd@dp-hpd-fast.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-fast.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
>     - shard-dg2-set2:     [SKIP][201] ([Intel XE#373]) -> [SKIP][202] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-dg2-set2:     [SKIP][203] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][204] ([Intel XE#308])
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x170.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-dg2-set2:     [SKIP][205] ([Intel XE#308]) -> [SKIP][206] ([Intel XE#1201] / [Intel XE#308])
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2-set2:     [SKIP][207] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][208] ([Intel XE#323]) +2 other tests skip
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_display_modes@mst-extended-mode-negative:
>     - shard-dg2-set2:     [SKIP][209] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][210] ([Intel XE#307])
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-435/igt@kms_display_modes@mst-extended-mode-negative.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-dg2-set2:     [SKIP][211] ([Intel XE#1138]) -> [SKIP][212] ([Intel XE#1138] / [Intel XE#1201])
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-432/igt@kms_feature_discovery@display-4x.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-463/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-dg2-set2:     [SKIP][213] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][214] ([Intel XE#1135])
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-436/igt@kms_feature_discovery@psr1.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
>     - shard-lnl:          [FAIL][215] -> [FAIL][216] ([Intel XE#886])
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>     - shard-dg2-set2:     [SKIP][217] ([Intel XE#455]) -> [SKIP][218] ([Intel XE#1201] / [Intel XE#455]) +8 other tests skip
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-dg2-set2:     [SKIP][219] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][220] ([Intel XE#455]) +15 other tests skip
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     [SKIP][221] ([Intel XE#658]) -> [SKIP][222] ([Intel XE#1201] / [Intel XE#658])
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
>     - shard-dg2-set2:     [SKIP][223] ([Intel XE#651]) -> [SKIP][224] ([Intel XE#1201] / [Intel XE#651]) +18 other tests skip
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
>     - shard-dg2-set2:     [SKIP][225] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][226] ([Intel XE#651]) +23 other tests skip
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-dg2-set2:     [SKIP][227] ([Intel XE#1158] / [Intel XE#1201]) -> [SKIP][228] ([Intel XE#1158])
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][229] ([Intel XE#653]) -> [SKIP][230] ([Intel XE#1201] / [Intel XE#653]) +18 other tests skip
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][231] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][232] ([Intel XE#653]) +20 other tests skip
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_plane@plane-position-covered:
>     - shard-lnl:          [DMESG-FAIL][233] ([Intel XE#324]) -> [DMESG-WARN][234] ([Intel XE#324])
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-lnl-4/igt@kms_plane@plane-position-covered.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-lnl-1/igt@kms_plane@plane-position-covered.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25:
>     - shard-dg2-set2:     [SKIP][235] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][236] ([Intel XE#1201] / [Intel XE#2763] / [Intel XE#455]) +1 other test skip
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:
>     - shard-dg2-set2:     [SKIP][237] ([Intel XE#2763]) -> [SKIP][238] ([Intel XE#1201] / [Intel XE#2763]) +2 other tests skip
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
>     - shard-dg2-set2:     [SKIP][239] ([Intel XE#1201] / [Intel XE#2763]) -> [SKIP][240] ([Intel XE#2763]) +5 other tests skip
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
>     - shard-dg2-set2:     [SKIP][241] ([Intel XE#1201] / [Intel XE#2763] / [Intel XE#455]) -> [SKIP][242] ([Intel XE#2763] / [Intel XE#455]) +3 other tests skip
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-435/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-dg2-set2:     [SKIP][243] ([Intel XE#870]) -> [SKIP][244] ([Intel XE#1201] / [Intel XE#870])
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>     - shard-dg2-set2:     [SKIP][245] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][246] ([Intel XE#1489]) +2 other tests skip
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-434/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     [SKIP][247] ([Intel XE#1489]) -> [SKIP][248] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-434/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr@fbc-psr-sprite-plane-move:
>     - shard-dg2-set2:     [SKIP][249] ([Intel XE#929]) -> [SKIP][250] ([Intel XE#1201] / [Intel XE#929]) +7 other tests skip
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-move.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-move.html
> 
>   * igt@kms_psr@psr-dpms:
>     - shard-dg2-set2:     [SKIP][251] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][252] ([Intel XE#929]) +10 other tests skip
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-463/igt@kms_psr@psr-dpms.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@kms_psr@psr-dpms.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-dg2-set2:     [SKIP][253] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][254] ([Intel XE#327]) +1 other test skip
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_tv_load_detect@load-detect:
>     - shard-dg2-set2:     [SKIP][255] ([Intel XE#1201] / [Intel XE#330]) -> [SKIP][256] ([Intel XE#330])
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html
> 
>   * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
>     - shard-dg2-set2:     [SKIP][257] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][258] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-466/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfd:
>     - shard-dg2-set2:     [SKIP][259] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][260] ([Intel XE#1123])
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfd.html
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:
>     - shard-dg2-set2:     [SKIP][261] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][262] ([Intel XE#288]) +17 other tests skip
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
>     - shard-dg2-set2:     [SKIP][263] ([Intel XE#288]) -> [SKIP][264] ([Intel XE#1201] / [Intel XE#288]) +13 other tests skip
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
> 
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
>     - shard-dg2-set2:     [SKIP][265] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][266] ([Intel XE#2360]) +1 other test skip
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
> 
>   * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
>     - shard-dg2-set2:     [SKIP][267] ([Intel XE#2360]) -> [SKIP][268] ([Intel XE#1201] / [Intel XE#2360]) +1 other test skip
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
> 
>   * igt@xe_media_fill@media-fill:
>     - shard-dg2-set2:     [SKIP][269] ([Intel XE#560]) -> [SKIP][270] ([Intel XE#1201] / [Intel XE#560])
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-432/igt@xe_media_fill@media-fill.html
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-466/igt@xe_media_fill@media-fill.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-dg2-set2:     [SKIP][271] ([Intel XE#512]) -> [SKIP][272] ([Intel XE#1201] / [Intel XE#512])
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-432/igt@xe_mmap@small-bar.html
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-463/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_oa@disabled-read-error:
>     - shard-dg2-set2:     [SKIP][273] ([Intel XE#2541]) -> [SKIP][274] ([Intel XE#1201] / [Intel XE#2541]) +1 other test skip
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-432/igt@xe_oa@disabled-read-error.html
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-434/igt@xe_oa@disabled-read-error.html
> 
>   * igt@xe_oa@non-privileged-map-oa-buffer:
>     - shard-dg2-set2:     [SKIP][275] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][276] ([Intel XE#2541]) +3 other tests skip
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-435/igt@xe_oa@non-privileged-map-oa-buffer.html
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@xe_oa@non-privileged-map-oa-buffer.html
> 
>   * igt@xe_pat@display-vs-wb-transient:
>     - shard-dg2-set2:     [SKIP][277] ([Intel XE#1201] / [Intel XE#1337]) -> [SKIP][278] ([Intel XE#1337])
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-dg2-set2:     [SKIP][279] ([Intel XE#1201] / [Intel XE#979]) -> [SKIP][280] ([Intel XE#979]) +1 other test skip
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][281] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][282] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-434/igt@xe_pm@d3cold-basic-exec.html
> 
>   * igt@xe_pm@d3cold-mmap-vram:
>     - shard-dg2-set2:     [SKIP][283] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][284] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html
> 
>   * igt@xe_pm@s2idle-d3cold-basic-exec:
>     - shard-adlp:         [TIMEOUT][285] ([Intel XE#1358]) -> [SKIP][286] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-adlp-6/igt@xe_pm@s2idle-d3cold-basic-exec.html
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-adlp-9/igt@xe_pm@s2idle-d3cold-basic-exec.html
> 
>   * igt@xe_query@multigpu-query-invalid-cs-cycles:
>     - shard-dg2-set2:     [SKIP][287] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][288] ([Intel XE#944]) +2 other tests skip
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-463/igt@xe_query@multigpu-query-invalid-cs-cycles.html
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html
> 
>   * igt@xe_query@multigpu-query-topology:
>     - shard-dg2-set2:     [SKIP][289] ([Intel XE#944]) -> [SKIP][290] ([Intel XE#1201] / [Intel XE#944])
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990/shard-dg2-432/igt@xe_query@multigpu-query-topology.html
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/shard-dg2-434/igt@xe_query@multigpu-query-topology.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
>   [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>   [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
>   [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
>   [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
>   [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
>   [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
>   [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
>   [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
>   [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>   [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2362
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
>   [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
>   [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
>   [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
>   [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
>   [Intel XE#2723]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2820]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2820
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8029 -> IGT_8031
>   * Linux: xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990 -> xe-pw-138844v3
> 
>   IGT_8029: d22cd438e6356bd7c2ee55436553cdcadd55193a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8031: 27ba1f4756f12a3694dce6d456aed947f22a8e34 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1973-128ccc5f71d7b9d84ce8f0651aa713ae490f4990: 128ccc5f71d7b9d84ce8f0651aa713ae490f4990
>   xe-pw-138844v3: 138844v3
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138844v3/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
