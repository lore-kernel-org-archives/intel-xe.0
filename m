Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5534ED3DEA2
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 17:14:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143DF10E235;
	Fri, 18 Oct 2024 17:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kIMghuFG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E3410E235
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 17:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729271675; x=1760807675;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8vs7igLqu96enYvP/oDtog5hhodvYzpDsBmUJrDScJA=;
 b=kIMghuFGYG5SPkP60PVfD/qze+afkegbSY0HBiAyHyl7PAVUzD+8YIQZ
 ftKd5e9jS+17YlD3ALIGKCABZsGyQ5cfqoAJeWzs1AgpiXzjxr61suS8k
 bfIjuACTutOvQxJU2pEd3hyYDbHmOAJohJjUoDWmIkBbsG9dZ5qSwqUmR
 UX6teOfnMcqowXaYANNPfnby55N9NwYL7cMnljECiDZPq+dvCFA/visjp
 7fptwAB4dQswiK2yoJqEBBNbmgttRSfmtAdrYtcPlPZruCV8xqqDIhoS6
 x3yzcCEWDACsOINNZQMLmRUDrh0qzSEnTfBVe5Z/8rEDH1aiqVxBuvxsV Q==;
X-CSE-ConnectionGUID: eVvZiXLgQY2mCnGlxI6IvA==
X-CSE-MsgGUID: efMnBSynTHKYc2UXuePpkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="28689047"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="28689047"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 10:14:35 -0700
X-CSE-ConnectionGUID: MeVf3rz2RNKddMvutYOndg==
X-CSE-MsgGUID: elt27BA1QB+eteSiK6RwWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="79072118"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2024 10:14:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 10:14:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 10:14:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 18 Oct 2024 10:14:33 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Oct 2024 10:14:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bOmnAk2GzXxUdQ16X7pQf58sRU+Z4mQzz+Dw0HUAn12d6W/fHvlSZ9eQtdCgD/CjaGshcqTDSrFT3/JhLMIoeTxJ8sO/7LC/snotbE7yz40VUdcO0JQXPXBnlx/rv/W2iYBa2+mpBEQ4/gOl2mtvPoEwD/SeFL68sLNWLVS91IsNkEqnCp98FgtfPuj71HF857zdDjma7Xde8HX2L4RQ0u/ZPOqOo3SWHNuFNdOPDRJvllPlBgBsVKJL+Kf/rOylUk6/PMn0E8oCJFcjuZz2X7Mo6DcEYGskg5A+x1TKbQsFK3IpHBgsyPFNSEwGi00Ol05GoiiIbflIAWNkuKDsyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rkbR913SGpTTMDY08sxdA2+fUIc/KVFNN4yivMKcTQ=;
 b=qlPk1G4r/xscfheS/2knYVUbki6gu9ETeZonzbw5buvqmmaNHBpgDZah4A/fZWjD1Wllmv+Z0r3GUUyLzft7fVQno8Mo+4W8acYhwGLTnCS86KppPTW6ZtuEl/SF2gWz7vnWp+CGm2F0+x+W3lLfpmCpEpsfL/DYEwwOTGU4hCpqYD/XHHfBrvaOxLzivGKzK6860ewlseZx5VtZrzOljqUGvIl5tVsGTgALlbrwgGCcOQ7Gr+2Z7NvGcap6di2K/f10sZF0Qda3j1PmfFehJKZXCA1bFlPxl/O8Xm7dx3F/FZ48p8NcjqxZ5ripazvmHxqiFoCvcHYN9Myk7XS49g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6233.namprd11.prod.outlook.com (2603:10b6:930:26::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21; Fri, 18 Oct
 2024 17:14:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 17:14:30 +0000
Date: Fri, 18 Oct 2024 12:14:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [CI v2 2/4] drm/i915/display: Use async flip when available for
 initial plane config
Message-ID: <kt4was4kbquia77elqpiccyaryq75mij4amkswuvnhjqqecix6@f2eylypsmomy>
References: <20241018170631.6598-1-maarten.lankhorst@linux.intel.com>
 <20241018170631.6598-3-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241018170631.6598-3-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0228.namprd03.prod.outlook.com
 (2603:10b6:303:b9::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6233:EE_
X-MS-Office365-Filtering-Correlation-Id: c583a154-6201-4bcd-f149-08dcef98541e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H6X5tt1zPw8LLAHRG9XEALj+/Ni2DDY6u8KixGNuRQlyQhOpn8n9nXdK8aEC?=
 =?us-ascii?Q?4KLkOJVh5mVqtZDM4ggb/tiq3CogEaqpc7m8Exh8XjHyck/IeBaT1bwJO+t6?=
 =?us-ascii?Q?vVgSwRV4LznTNr6abGCJy7WR/NFqyECgtAXWNCVFC51H4JWHpvPVuTnDn3Ge?=
 =?us-ascii?Q?Hc9IVIVvG1Ft51mPBmjfEl3VRVgVopMz8NBJ1iVbhyRmCqCyEfkp0CRfCEex?=
 =?us-ascii?Q?JoV3tmjVF4FngaR8KuM6QKMklcG5q5/lmSuRVGWZ/p8yRBoS/qBEYfxqU6BZ?=
 =?us-ascii?Q?uRBO+veCTjKSaUhJFBl0bboxqgSw8go+LOBQBJER3LjSs2aD/qiZ8ydoLfC5?=
 =?us-ascii?Q?FE8dBqb4JdfOEGZ1zM0BdWEPVsJJcTQlDqufDn3ycU3BvIgvR4AOTcJZ5OFs?=
 =?us-ascii?Q?yCf6nBpouStMxPVU0dPlHVkqkuK/7cfUgUByR3lk/BzgqBhDaaK1yfmkxiQn?=
 =?us-ascii?Q?0zc2y+PdqvDd0E7faE+/Zx3pTNnC5xVg5RjzYr5oh/n+30Nppi/2rakRNvaF?=
 =?us-ascii?Q?/ybhhj/2dTWW5/lFHaij+19W9/yt/k+4Ef15jsbG6+UrPKiJglm7Q70/3ie7?=
 =?us-ascii?Q?FFmRUg1XhO+/kLJkzfoyYLsDo2T87eDC+i2FfitL32jZr3L8zZ3drzD0RHuG?=
 =?us-ascii?Q?SFnRe8DP4TFwvg6uHrWwIZrICPPMoDV90WphoEhiKl8rX5CkuBNo0yG15xec?=
 =?us-ascii?Q?Ef49XeD09M/8SCg1D06T1fyQjU7P1X6SwUpuPYEakAZetlb2H+Thh7tgVJ+i?=
 =?us-ascii?Q?1o+ponkyMaMB9wwtIK0dxgAMdWcpj6q6wdkc9xCvxXDPz2XKz7jI8/hcy85k?=
 =?us-ascii?Q?nW10VfMsLXJD2IrBePDG3Wyk01/pjzctiXxwc3KtbaUngAJmhf9YfH85EZvA?=
 =?us-ascii?Q?+pw4xC+S8xnPFv24b9Bb56I97Dj6ZZdoZGRwOF1GHXAnhDZvee+xk9yTHzbt?=
 =?us-ascii?Q?KxgvuDgPGefi3IcnCDx8w4Jp585QX1pJ2QS9E4gWTP4AvE85P1Quys2lgq+r?=
 =?us-ascii?Q?BwN+FFQqSyhf+yRj+BnRMLO7xK6t3Ivj0aCLjtUoQ/yn/ihYFudv1EynMG7c?=
 =?us-ascii?Q?muMhyoxBgYdaWK0tImR34OYdBt6+Hg0IesD/BCCTtV9PcK7Sf8Nd2VBBEnCG?=
 =?us-ascii?Q?IQZZ/wmjhrRpIVnS4+F79a1kULNbSQVd6vj09nm8qG84Xd33iGUzCoSS7SMw?=
 =?us-ascii?Q?xLOAQrBMRvGQSRwPHbgZM2YNmUYpw/7DtCRGdT1nQ+cru1Pcn50zwoAOjJAH?=
 =?us-ascii?Q?zXHrGWXlVlg3EjzdiyqWdYiYInZD20sNz69VqbpgCYayZg2pc4hqyZjqKJfb?=
 =?us-ascii?Q?46LpTZeYuIoTjcrvsxraU/0O?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ysGQ2foMAW0dFOx7p+a3jsXf+Sx0Sh9iA4ePfVp2gYXjga8LjN5bt2oj1lXk?=
 =?us-ascii?Q?5+qXwDjTTuTghhMmRQBlGnuYK9VherELhCCDIcMrvhoYBmGdb0yZxdRkOnZr?=
 =?us-ascii?Q?a7ZAPP13sYcI8NaXSpgel5ag323N58O5tJGi5SUCG2C5l/gtJ3SIUOqGAUes?=
 =?us-ascii?Q?kT4BpyB8a5OkRIWKro1FqfPnfZIB0/mr8HzS1Exevy7gtXO/Meg3R0NLSGqz?=
 =?us-ascii?Q?3bQI1bSPjf4N1nzU0Ibgp1olsqkvcpcrEBYehZY7VhjIYsjMCGInJUDo2SOm?=
 =?us-ascii?Q?HwxB547BeaXlgMydl6HRg3fh5XNUAl1AkbM6UwITDXAJTwoZGnpAc/yPlhoo?=
 =?us-ascii?Q?6fCx/BOpjhljjYKJMle1dO/fiZyKyTMYOVp3RHXSiXZ7n4vb8+2Nv0AvTjFi?=
 =?us-ascii?Q?222PKUxlfYMLgX33XqGmuXM0Z3IVKz/UsN26POE1eY7d6fnyzJwqfHuWSLEz?=
 =?us-ascii?Q?tb82mmiLxGUWyyLsFHzcHHtzqzuOVjVS4tZgSEFFBsgyX55sbGBHRP4nvzYu?=
 =?us-ascii?Q?xYlSzd5N0O3yg4mRJ1Q4IOlzwQ5MnJXC3uBM/R8oKnUX2YSABI5rI1YBICRB?=
 =?us-ascii?Q?uHHINc5WMZ1agHp42jSLb2zPqLh+UI1pQYs2ZfqDn7hV4KwdkmFqcc6Dh8pT?=
 =?us-ascii?Q?LKdKXyCGwCRXZyqzC065Q6GcgQdI6fHH2jQRKUtWhqBQTTCKvumymkWnMaKa?=
 =?us-ascii?Q?gfRXivp0D6e73mrKX3c47OiMXuYAGliKHYm7mUwQ2XRftuCuNMZETUm8twG3?=
 =?us-ascii?Q?mmQO/edYOS77PpiP9J64A7LZ1cdPJRvSokYVN2MKMQ8Mc+n4oXt8nhDJFKYh?=
 =?us-ascii?Q?N4EpN+gefBFmsHj18qRZVTr2s8D9aeBsFl0rrmFAC05n/xharyXpdB8DfjxV?=
 =?us-ascii?Q?7HAz4XWVjoj0KAu2TdeyZyTM8g0gxPaD3TM0tFZO2BEa5horkAfwIgzVvr1o?=
 =?us-ascii?Q?J9mWid0SVHBiHlW6e2nP2+DnaTKKpg2UojwBXq6Yl4ne8gb12pDUnGrmEad6?=
 =?us-ascii?Q?0U2iCqOPU/I39abp9X9gc24doq29IdA7RQqYa974LVA1kcn14VvMxcOYMJxq?=
 =?us-ascii?Q?XDVSZWJ/Unu6IfgL3eCyAuDItLsGz4JmYWQBM65QxUmtS4BMEZmlx3bkvUqf?=
 =?us-ascii?Q?nlytNjaCx2DcIZFnKTGJ9X66NtEpRnK7ATd0ldbdfmuqZaGSAfqUVbiEKZvj?=
 =?us-ascii?Q?6id9OzwBOM5Zvh/PAqzpPx/P+gwqaNQ8HwCahHV9quEO30+hIr3kPCcFdr+o?=
 =?us-ascii?Q?ea8qJfRmRmhEjOadWD5NBF4qGNbRWS9ZWJeOCrC99VsnSmq/0tcbuPpJAdWa?=
 =?us-ascii?Q?bSzlz7WBJPEGNYjnqJmSOrQ8Pq2utDdiw3lew+nNVCBbxdsG/qpNVoSvURJA?=
 =?us-ascii?Q?0uGh8TFDBxvmDL0LWLmtuA1KPXSTahnKLs3tP2fRChSP6kEx151NI4+erlxY?=
 =?us-ascii?Q?EM0cq0z0lO1dN5vSrw7alr71rzb6p6bssmPQk7PiTR3G+ZgP7WuRUvLB+LKt?=
 =?us-ascii?Q?rsPBo7QEVyNbwyJKgHlXL9vwVrZAu/YTQXQ0QszojYiA38a60wLNfJRJmspg?=
 =?us-ascii?Q?ZHOI3WypzW0p3/1FH0IN2MFXHgeDKdj5jn1GobpCBUxDzMaL/vFdm6mJuR8u?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c583a154-6201-4bcd-f149-08dcef98541e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 17:14:30.6860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c0QOGkfmbKX3sGGG4ZxXQoydiodILZFKtXtsPF8SDGCt9R6NbsJpcAInMHNTXB7WBQb2oVeAMuj8M/aCthYswvFXSFrn8FWIPiKBi9b+ft0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6233
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

On Fri, Oct 18, 2024 at 07:06:29PM +0200, Maarten Lankhorst wrote:
>I'm planning to reorder readout in the Xe sequence in such a way that
>interrupts will not be available, so just use an async flip.
>
>Since the new FB points to the same pages, it will not tear. It also
>has the benefit of perhaps being slightly faster.
>
>Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Ville was against using async flip here. Anything changed?

Lucas De Marchi

>---
> drivers/gpu/drm/i915/display/skl_universal_plane.c | 13 +++++++++++--
> 1 file changed, 11 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>index a0a7ed01415a5..6740c193920ff 100644
>--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
>+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
>@@ -2902,7 +2902,7 @@ bool skl_fixup_initial_plane_config(struct intel_crtc *crtc,
> 		to_intel_plane_state(plane->base.state);
> 	enum plane_id plane_id = plane->id;
> 	enum pipe pipe = crtc->pipe;
>-	u32 base;
>+	u32 base, plane_ctl;
>
> 	if (!plane_state->uapi.visible)
> 		return false;
>@@ -2916,7 +2916,16 @@ bool skl_fixup_initial_plane_config(struct intel_crtc *crtc,
> 	if (plane_config->base == base)
> 		return false;
>
>+	/* Perform an async flip to the new surface. */
>+	plane_ctl = intel_de_read(i915, PLANE_CTL(pipe, plane_id));
>+	plane_ctl |= PLANE_CTL_ASYNC_FLIP;
>+
>+	intel_de_write(i915, PLANE_CTL(pipe, plane_id), plane_ctl);
> 	intel_de_write(i915, PLANE_SURF(pipe, plane_id), base);
>
>-	return true;
>+	if (intel_de_wait(i915, PLANE_SURFLIVE(pipe, plane_id), ~0U, base, 40) < 0)
>+		drm_warn(&i915->drm, "async flip timed out\n");
>+
>+	/* No need to vblank wait either */
>+	return false;
> }
>-- 
>2.45.2
>
