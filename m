Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAE9C61DA4
	for <intel-xe@archiver.kernel.org>; Tue, 31 Jan 2023 01:37:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F0710E129;
	Tue, 31 Jan 2023 01:37:39 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA23010E129
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Jan 2023 01:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675129057; x=1706665057;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=T1agVRQA5KfmG5P7WH0B9NBH/VDAupvCIt63PwcDQv8=;
 b=VeQlC/xjCkBsl2D78a3bGnIQ02z/mmMowirFU9pGShhU6zM1m6E16xYb
 gMkyupAR52ejoLrA2fX0oqbcanwKe6Rfm7MLWsN5DAUEPrqdP9Ixzi2IF
 kzJGuIXm5VG3Z348wb89TcNvr4DO1bOfsC9TXjfnSV6W2Axmn/XjWwHCb
 JmzVClHM6l9ATHXrsUC8Ad53nvXR3I6bKtLoYVCoJeXkXMTCq2g6lkmGK
 xlFT7ywPN5GvnKsSqP+LyjIqkm0E4+j2tOAKGwPXsdxpDqy5KUkpueb44
 J6BRIpPpno0McKHgHabGlXNSIgjL6jSNLm8giLF0t74xjt8UOCU6NnEt7 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="413941229"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; d="scan'208";a="413941229"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 17:37:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="694780323"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; d="scan'208";a="694780323"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 30 Jan 2023 17:37:36 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 30 Jan 2023 17:37:36 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 30 Jan 2023 17:37:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 30 Jan 2023 17:37:35 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 30 Jan 2023 17:37:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H78yTA2P2HXAtfWJF9hBAk6f84yCjSqXRRLqjwPBK43B63LbTynBLOUvutjYmIpHBgME9quwGkC74MCYSN5NM0QAUZeN7lFNNZ82YWcvMPUrASrOlvSGHJ53lmKEk4TGG9BzKXhD9zXprsfYdKpEJs4+bAsWJZAZBhqeTea50AmHvSJTXGucZ133L2vYGHF1uvBxm6dxyO12z+QRBq6huTkHE/apGlBfxrk3fwOSBVV8gYdw6UGJQaO37jfNVz5KKtRgW1E58VPhty1bJcMlux/6ZtTNu09qKJF8SSuoLpyZlobt00tUxlKOl5lm5nm/nuxlyqPUibuGl9L0NlsfZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=baQYurtkFkAMr6t9DtK8qR3LH/8KBjxZ2swkMVEOfgs=;
 b=nKLcKH+VCGCGRoprXIMk6YH/qZDkSXpJItupwEnShLvLZsrQeRqvzoHW67QxZ2DLpi+sgGvm6lHXXAI3GNDNJw4lqQ9cp2nijkQl4tAQDw9DuH19XtL3bz+WeygXz6/3+NkpcBKD0sldyDyk+fuUTtaLnOJo8+tPjsneD44f1hSIzt1ZkO23UCxBpIaMiM1chRDbgnEDQ2ZFco/7bJ6a9yVBC5EYErzN84ngO7Vory7dUeZmc05iTUvNOdnK7CS2fhlhi4ioHetkB13h+BqUVr6sYOcPaCS3+6hwF5OoeD92ksutYWTmvXi8F2nx5O9gOYlG2I0vRQqK19BwbbOTuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 MW4PR11MB6958.namprd11.prod.outlook.com (2603:10b6:303:229::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 01:37:27 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e%5]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 01:37:26 +0000
Date: Mon, 30 Jan 2023 17:37:22 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <Y9hw0sSC58B32yPg@mdroper-desk1.amr.corp.intel.com>
References: <20230110225449.1837918-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230110225449.1837918-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR08CA0006.namprd08.prod.outlook.com
 (2603:10b6:a03:100::19) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|MW4PR11MB6958:EE_
X-MS-Office365-Filtering-Correlation-Id: dcbbeaf1-da05-46e7-3669-08db032bb4d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: convVKP2QBWaikiy2Q/Lzpd5nJ0+j4+SQHvJR14QT9DAdgof1gqW7YPhS7hoXyX53DuRUuI3WbQiDjSdL9fZ5+qHFqHTAPIPL5+3gXVsrr0p83D65iOUl/BItuGK19CzPi/QusHWvyX3DWJAjKQoaTuFELk/VF3WAUd0qzF27lik1Di/XyF17FAsmXfXlZQd6sOwQT07gmC/hPIQxm7+xFYasIfpfIjwACFOoKhhL+g/A2xnRYnzOwxj89V9fZPivxWl3fwjxAa5qWvILplS73Dkm7PxdrVbmrFQhXqNQvj5CNvAbHhH7Fcd17bgcRnrjDxovM4FaNi9eW8mhfKaNd44IHtCiAT2bSKEmxk+Cc4+0yRVbepfvHnbA9Y3I7FnqJ28I/KMShChwk7h8rVIkgSmpZ0K3dCJcp/l9LxGxXY+VBclqYj6SpI7WBLJpodgl02si4YS8yza+Djp1Er6T9ssuGuTVfrxwW/k8MdF4e9cXi0xQ1vrQaPQjXi9Qiga7/fDGL6yTf5nxlXXRWrFt13L6r9ta0eRVCOGUYlQxWup1rTrpQda605dPFmCW4H5C52/Y/Arwlg5fggx96gUVyEiULzWIgb4WDFW/BF7uqx5PrnOm2rjUMKRTYH+XfpCMKzrONLUt93IYmEedPMAZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(376002)(396003)(39860400002)(346002)(451199018)(6636002)(66476007)(8676002)(4326008)(8936002)(66946007)(5660300002)(6862004)(316002)(38100700002)(86362001)(66556008)(82960400001)(6506007)(26005)(6666004)(186003)(6512007)(30864003)(2906002)(6486002)(478600001)(41300700001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?D0g/LhOKv7z0BBsqf1Y19MjJA8IV6SGAb/Rx4kwBs3De2Apbx9nxEEmDnU?=
 =?iso-8859-1?Q?Wt+bHb4ytnbG0VbnalU/Vqz5zdUhGw7+IfMlTah3dG7ZuCUhKgBiv8Dni5?=
 =?iso-8859-1?Q?SmtATHgSt3ukHShfVxABxO6dZCcVfA/dbe5lNXOY7KA6ogN79whAynj/iO?=
 =?iso-8859-1?Q?LcMsZ9ejBIdFF+YLTR3iNgYZkItfYdst/vyZwM+se7PKJzs0ow9oYCFFIK?=
 =?iso-8859-1?Q?/5ndy09iWfHUHmnhjWns/FMGIocvEXsFGVpN9HucMVsufh61Z8rNA8Eh5C?=
 =?iso-8859-1?Q?7Px8XiXnIfpZDyPWE9/LhqvJyaUjpwt5caEbaVRe3pylxUvcjOSCDCvTC4?=
 =?iso-8859-1?Q?BMHsPGYa4pVbKKlVOVuwaT0a4WQX8xyu0qizQP9JS1EYAglrIB7nBIuRjJ?=
 =?iso-8859-1?Q?k7HMtOFJavWQuK1Tp+PCeIyXYA6YJ6Fzbc0xbdzL3Pa7P6W9vZ8FPDN3Me?=
 =?iso-8859-1?Q?3wVIZShC1TK7mh3XogTMemHvyU4WheRFQXSIGcjB7jLMjuiiXIQEF/nog9?=
 =?iso-8859-1?Q?Ag/yT0VxvsII+/39SnpSVCl7yud/qZJMHSqaD/W+FYx8macJG64X75C1Ai?=
 =?iso-8859-1?Q?CBU6wSlxMklXufJWITwMmASvX9zN2RSFwtPIz/hdWFr2SRNaIfRQYCNlkz?=
 =?iso-8859-1?Q?wXm8d9/imYdq7XKcASncc0CLxQppH8nyDO/ZQG4wlSq1JSP3NFHc29Cfdh?=
 =?iso-8859-1?Q?8xIeI4kpMP1+wDJIecAgrVdv61aU3Vej2khDLRuV4Q7STQp9WdJHlGZK4B?=
 =?iso-8859-1?Q?TV+FY7GmP8irWHPgedu2qFFRSPbCrc/9yQZmCFGm//3q6ugEdVs9iIituj?=
 =?iso-8859-1?Q?4Pw7Jp70Z40GxPmVuU6Rvf+HLQTMvYtwZ2T+5VFY1uaA1AB8vLo1culI3X?=
 =?iso-8859-1?Q?xjRudrBvUTftcWYEprWFLJ7EiNb/N2SW7dI3Id7s+0bSo1LoagCFVp0nlN?=
 =?iso-8859-1?Q?FvIxWHWPsGzkTmoYZDrJYUrSAZmjryERK/dlBwbdf6pO+caYZcNJFBiCAk?=
 =?iso-8859-1?Q?bSv+u/UvdxXCHXaROGCo5LTy6+w0Hmv8I7CE9i6GKYhpPFnx9XcuCDACDj?=
 =?iso-8859-1?Q?HJoVpaGHMlTZLEdAiLcDjUFE2OxSMUGoH/RTHrdVmCGxV3WyjIz6LHOu4A?=
 =?iso-8859-1?Q?QgQ7xKthww+P0AKnCJiur/kL0Jk7MhkGwA1SrID40l256myFtzQaW/dsiU?=
 =?iso-8859-1?Q?Exc7OjRs6zGlR1Y0C6kx5Gm6MT8j9ksHSYzIHyWkXiavjkVEBAllvxj8V7?=
 =?iso-8859-1?Q?Z1fQW+xGWWKFBsBiT+aAAJWXix7iSoM6oNDtYDs2aUa3xkyIY/umb9u2EP?=
 =?iso-8859-1?Q?Z/78Wun683azPugc5I35INnGbEeEK9mgtuMT/c9dAMKXPlMz1g+axv60Ib?=
 =?iso-8859-1?Q?wTc2VbPPf5DvKuqs+1U6VB81hSGUrM6f7Sntvf7MY+G4a+e7qZC0tvPF2A?=
 =?iso-8859-1?Q?L0GgeYmztN5fRUFpUYpjTJe7neooW68EccZncbFpj4+gj6KV351YXtoWPk?=
 =?iso-8859-1?Q?iYU87i809vfcLWdGhH5MVc+c42JWiwArQ04hrCOM5rMOAE8jOLu0CE1hTo?=
 =?iso-8859-1?Q?FzIXZR45UjsupXZ02x7ySDrHoB6UvWGUmA3mKtYsBh+AuEaCE31+Kp6d7d?=
 =?iso-8859-1?Q?bK4dT6ZTrlFUAkJBcn5ES6dpjaekQeI1EZXdSO0at1YCARn/GbqAkEIQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dcbbeaf1-da05-46e7-3669-08db032bb4d1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 01:37:26.2176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cw2BNlfsyIf9RCq5Z4gjZgptt0UCbIImjC/TihoB72zJh99yprmf3F/4CblKbGwaGVbGskd2RqmQooXu4EY5L72wZbTUyozWCz1d6Z5x73E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6958
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 23/23] drm/xe: Introduce a new DRM driver for
 Intel GPUs
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 10, 2023 at 05:54:49PM -0500, Rodrigo Vivi wrote:
> From: Matthew Brost <matthew.brost@intel.com>
> 
> Xe, is a new driver for Intel GPUs that supports both integrated and
> discrete platforms starting with Tiger Lake (first Intel Xe Architecture).
> 
> The code is at a stage where it is already functional and has experimental
> support for multiple platforms starting from Tiger Lake, with initial
> support implemented in Mesa (for Iris and Anv, our OpenGL and Vulkan
> drivers), as well as in NEO (for OpenCL and Level0).
> 
> The new Xe driver leverages a lot from i915.
> 
> As for display, the intent is to share the display code with the i915
> driver so that there is maximum reuse there.
> 
> This initial work is a collaboration of many people and unfortunately
> the big squashed patch won't fully honor the proper credits. But let's

I'm not sure how you want to handle general review for the big mass of
pre-existing code.  I haven't looked through all of the giant squashed
patch, but I've included some comments/questions inline below for things
that popped out to me while browsing through this.  Not saying that you
or anyone specific needs to address this immediately or anything; these
are just things I wanted to jot down and mention before I forget about
them.

...
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
...
> +int xe_gem_create_ioctl(struct drm_device *dev, void *data,
> +			struct drm_file *file)
> +{
...
> +
> +	if (args->flags & XE_GEM_CREATE_FLAG_SCANOUT)
> +		bo_flags |= XE_BO_SCANOUT_BIT;

So if an object is eligible to be flipped to a display plane, it should
be allocated that way up front?  How does that work when the client
allocating the buffer is separate from the display server responsible
for presentation?  If the 3D or media client allocating the buffer
doesn't know what the compositor is going to do with it (i.e., flip to a
plane vs compose with 3D), they should probably just set the scanout bit
on every buffer just to be safe?

With the display code living in i915, I guess there's nothing trying to
enforce that we don't try to flip a buffer that wasn't flagged as
scanout, so if userspace does the wrong thing it's just their own fault.

...
> +
> +int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
> +	       int num_resv, bool intr)

You might want some kerneldoc on this one.  I.e., what exactly does
locking/unlocking a bo do/protect?

...
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> new file mode 100644
> index 000000000000..1a49c0a3c4c6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -0,0 +1,290 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2021 Intel Corporation
> + */
> +
> +#ifndef _XE_BO_H_
> +#define _XE_BO_H_
> +
> +#include "xe_bo_types.h"
> +#include "xe_macros.h"
> +#include "xe_vm_types.h"
> +
> +#define XE_DEFAULT_GTT_SIZE_MB          3072ULL /* 3GB by default */
> +
> +#define XE_BO_CREATE_USER_BIT		BIT(1)
> +#define XE_BO_CREATE_SYSTEM_BIT		BIT(2)
> +#define XE_BO_CREATE_VRAM0_BIT		BIT(3)
> +#define XE_BO_CREATE_VRAM1_BIT		BIT(4)
> +#define XE_BO_CREATE_VRAM_IF_DGFX(gt) \
> +	(IS_DGFX(gt_to_xe(gt)) ? XE_BO_CREATE_VRAM0_BIT << gt->info.vram_id : \
> +	 XE_BO_CREATE_SYSTEM_BIT)
> +#define XE_BO_CREATE_GGTT_BIT		BIT(5)
> +#define XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT BIT(6)
> +#define XE_BO_CREATE_PINNED_BIT		BIT(7)
> +#define XE_BO_DEFER_BACKING		BIT(8)
> +#define XE_BO_SCANOUT_BIT		BIT(9)
> +/* this one is trigger internally only */
> +#define XE_BO_INTERNAL_TEST		BIT(30)
> +#define XE_BO_INTERNAL_64K		BIT(31)
> +
> +#define PPAT_UNCACHED                   GENMASK_ULL(4, 3)
> +#define PPAT_CACHED_PDE                 0
> +#define PPAT_CACHED                     BIT_ULL(7)
> +#define PPAT_DISPLAY_ELLC               BIT_ULL(4)
> +
> +#define GEN8_PTE_SHIFT			12
> +#define GEN8_PAGE_SIZE			(1 << GEN8_PTE_SHIFT)
> +#define GEN8_PTE_MASK			(GEN8_PAGE_SIZE - 1)
> +#define GEN8_PDE_SHIFT			(GEN8_PTE_SHIFT - 3)
> +#define GEN8_PDES			(1 << GEN8_PDE_SHIFT)
> +#define GEN8_PDE_MASK			(GEN8_PDES - 1)
> +
> +#define GEN8_64K_PTE_SHIFT		16
> +#define GEN8_64K_PAGE_SIZE		(1 << GEN8_64K_PTE_SHIFT)
> +#define GEN8_64K_PTE_MASK		(GEN8_64K_PAGE_SIZE - 1)
> +#define GEN8_64K_PDE_MASK		(GEN8_PDE_MASK >> 4)
> +
> +#define GEN8_PDE_PS_2M			BIT_ULL(7)
> +#define GEN8_PDPE_PS_1G			BIT_ULL(7)
> +#define GEN8_PDE_IPS_64K		BIT_ULL(11)
> +
> +#define GEN12_GGTT_PTE_LM		BIT_ULL(1)
> +#define GEN12_USM_PPGTT_PTE_AE		BIT_ULL(10)
> +#define GEN12_PPGTT_PTE_LM		BIT_ULL(11)
> +#define GEN12_PDE_64K			BIT_ULL(6)
> +#define GEN12_PTE_PS64                  BIT_ULL(8)
> +
> +#define GEN8_PAGE_PRESENT		BIT_ULL(0)
> +#define GEN8_PAGE_RW			BIT_ULL(1)

We should try to avoid using deprecated "GEN" terminology in the Xe
driver.  And if we're only supporting Xe-based platforms and beyond,
distinctions like "gen8" and "gen12" are pretty meaningless.

Also, should some of the masks+shifts above be replaced with GENMASK and
such so that it's easier to follow and less error-prone?

...
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
...
> +static int forcewake_open(struct inode *inode, struct file *file)
> +{
> +	struct xe_device *xe = inode->i_private;
> +	struct xe_gt *gt;
> +	u8 id;
> +
> +	for_each_gt(gt, xe, id)
> +		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +
> +	return 0;
> +}
> +
> +static int forcewake_release(struct inode *inode, struct file *file)
> +{
> +	struct xe_device *xe = inode->i_private;
> +	struct xe_gt *gt;
> +	u8 id;
> +
> +	for_each_gt(gt, xe, id)
> +		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +
> +	return 0;
> +}
> +
> +static const struct file_operations forcewake_all_fops = {

For debugging purposes, would it be more useful to have per-GT forcewake
nodes instead of one global node that grabs all the GTs?  Or is this
mainly just intended for a tool like IGT's 'intel_reg' that wants to be
lazy and not worry about where the register really lives?

> +	.owner = THIS_MODULE,
> +	.open = forcewake_open,
> +	.release = forcewake_release,
> +};
> +

...
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
...
> +#define GRAPHICS_VER(xe) ((xe)->info.graphics_verx100 / 100)
> +#define MEDIA_VER(xe) ((xe)->info.media_verx100 / 100)
> +#define GRAPHICS_VERx100(xe) ((xe)->info.graphics_verx100)
> +#define MEDIA_VERx100(xe) ((xe)->info.media_verx100)

As a reminder, although we use version numbers like "12.50" in
shorthand, they're not actually decimal numbers, but rather a
concatenation of an "architecture" version and a "release" version.  So
x.1, x.10, and x.100 are all different, and there's nothing that says
release numbers can't go above 100.  For platforms with GMD_ID, they're
encoded in an 8-bit field, so they can potentially go up to 255 (and
we're already up to 71 with some variants of MTL).  Using an encoding
that breaks down as soon as things go over 100 might be a bit risky?

> +#define IS_DGFX(xe) ((xe)->info.is_dgfx)
> +
> +#define XE_VRAM_FLAGS_NEED64K		BIT(0)
> +
> +#define XE_GT0		0
> +#define XE_GT1		1
> +#define XE_MAX_GT	(XE_GT1 + 1)
> +
> +#define XE_MAX_ASID	(BIT(20))
> +
> +#define IS_PLATFORM_STEP(_xe, _platform, min_step, max_step)	\
> +	((_xe)->info.platform == (_platform) &&			\
> +	 (_xe)->info.step.graphics >= (min_step) &&		\
> +	 (_xe)->info.step.graphics < (max_step))
> +#define IS_SUBPLATFORM_STEP(_xe, _platform, sub, min_step, max_step)	\
> +	((_xe)->info.platform == (_platform) &&				\
> +	 (_xe)->info.subplatform == (sub) &&				\
> +	 (_xe)->info.step.graphics >= (min_step) &&			\
> +	 (_xe)->info.step.graphics < (max_step))
> +
> +/**
> + * struct xe_device - Top level struct of XE device
> + */
> +struct xe_device {
> +	/** @drm: drm device */
> +	struct drm_device drm;
> +
> +	/** @info: device info */
> +	struct intel_device_info {
> +		/** @graphics_verx100: graphics IP version */
> +		u32 graphics_verx100;
> +		/** @media_verx100: media IP version */
> +		u32 media_verx100;
> +		/** @mem_region_mask: mask of valid memory regions */
> +		u32 mem_region_mask;
> +		/** @is_dgfx: is discrete device */
> +		bool is_dgfx;
> +		/** @platform: XE platform enum */
> +		enum xe_platform platform;
> +		/** @subplatform: XE subplatform enum */
> +		enum xe_subplatform subplatform;
> +		/** @devid: device ID */
> +		u16 devid;
> +		/** @revid: device revision */
> +		u8 revid;
> +		/** @step: stepping information for each IP */
> +		struct xe_step_info step;
> +		/** @dma_mask_size: DMA address bits */
> +		u8 dma_mask_size;
> +		/** @vram_flags: Vram flags */
> +		u8 vram_flags;
> +		/** @tile_count: Number of tiles */
> +		u8 tile_count;
> +		/** @vm_max_level: Max VM level */
> +		u8 vm_max_level;
> +		/** @media_ver: Media version */
> +		u8 media_ver;

Do we need this if we have the full IP version up above?

...
> +	/** @gt: graphics tile */
> +	struct xe_gt gt[XE_MAX_GT];

'GT' is an old acronym that technically stands for 'graphics
technology.'  When the hardware people talk about a "tile" they're
generally referring to the combination of "GT + lmem" as we have on PVC.
Platforms like MTL that have multiple GTs are generally not considered
multi-tile from the hardware point of view, although I know software
people use the term inconsistently.

...
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
...
> +void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	fw->gt = gt;
> +	mutex_init(&fw->lock);
> +
> +	/* Assuming gen11+ so assert this assumption is correct */
> +	XE_BUG_ON(GRAPHICS_VER(gt_to_xe(gt)) < 11);
> +
> +	if (xe->info.platform == XE_METEORLAKE) {

This should be a version check rather than a platform check.  We expect
future platforms to also follow on with this new register.

> +		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
> +			    XE_FW_DOMAIN_ID_GT,
> +			    FORCEWAKE_GT_GEN9.reg,
> +			    FORCEWAKE_ACK_GT_MTL.reg,
> +			    BIT(0), BIT(16));

Since every call to domain_init() is using the same bit and mask
parameters, we can just roll that into the implementation of
domain_init().

> +	} else {
> +		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
> +			    XE_FW_DOMAIN_ID_GT,
> +			    FORCEWAKE_GT_GEN9.reg,
> +			    FORCEWAKE_ACK_GT_GEN9.reg,
> +			    BIT(0), BIT(16));
> +	}
> +}
> +
> +void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
> +{
> +	int i, j;
> +
> +	/* Assuming gen11+ so assert this assumption is correct */
> +	XE_BUG_ON(GRAPHICS_VER(gt_to_xe(gt)) < 11);
> +
> +	if (!xe_gt_is_media_type(gt))
> +		domain_init(&fw->domains[XE_FW_DOMAIN_ID_RENDER],
> +			    XE_FW_DOMAIN_ID_RENDER,
> +			    FORCEWAKE_RENDER_GEN9.reg,
> +			    FORCEWAKE_ACK_RENDER_GEN9.reg,
> +			    BIT(0), BIT(16));
> +
> +	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
> +		if (!(gt->info.engine_mask & BIT(i)))
> +			continue;
> +
> +		domain_init(&fw->domains[XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j],
> +			    XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j,
> +			    FORCEWAKE_MEDIA_VDBOX_GEN11(j).reg,
> +			    FORCEWAKE_ACK_MEDIA_VDBOX_GEN11(j).reg,
> +			    BIT(0), BIT(16));
> +	}
> +
> +	for (i = XE_HW_ENGINE_VECS0, j =0; i <= XE_HW_ENGINE_VECS3; ++i, ++j) {
> +		if (!(gt->info.engine_mask & BIT(i)))
> +			continue;
> +
> +		domain_init(&fw->domains[XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j],
> +			    XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j,
> +			    FORCEWAKE_MEDIA_VEBOX_GEN11(j).reg,
> +			    FORCEWAKE_ACK_MEDIA_VEBOX_GEN11(j).reg,
> +			    BIT(0), BIT(16));
> +	}
> +}
> +
> +void xe_force_wake_prune(struct xe_gt *gt, struct xe_force_wake *fw)
> +{
> +	int i, j;
> +
> +	/* Call after fuses have been read, prune domains that are fused off */

It looks like both xe_force_wake_init_engines() and
xe_force_wake_prune() are called from xe_gt_init() after
the fuses are read in gt_fw_domain_init() has happened, we may not need
the 'prune' function at all?

> +
> +	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j)
> +		if (!(gt->info.engine_mask & BIT(i)))
> +			fw->domains[XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j].reg_ctl = 0;
> +
> +	for (i = XE_HW_ENGINE_VECS0, j =0; i <= XE_HW_ENGINE_VECS3; ++i, ++j)
> +		if (!(gt->info.engine_mask & BIT(i)))
> +			fw->domains[XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j].reg_ctl = 0;
> +}
> +
> +static void domain_wake(struct xe_gt *gt, struct xe_force_wake_domain *domain)
> +{
> +	xe_mmio_write32(gt, domain->reg_ctl, domain->mask | domain->val);

I guess we can start with this, but as far as I know they've never fixed
the case where sometimes forcewake requests get missed and require that
we "kick" the punit by setting a second bit.  We may need to bring back
the more careful handling of forcewake if/when we start encountering
sporadic failures.

> +}
> +
> +static int domain_wake_wait(struct xe_gt *gt,
> +			    struct xe_force_wake_domain *domain)
> +{
> +	return xe_mmio_wait32(gt, domain->reg_ack, domain->val, domain->val,
> +			      XE_FORCE_WAKE_ACK_TIMEOUT_MS);
> +}
> +
> +static void domain_sleep(struct xe_gt *gt, struct xe_force_wake_domain *domain)
> +{
> +	xe_mmio_write32(gt, domain->reg_ctl, domain->mask);
> +}
> +
> +static int domain_sleep_wait(struct xe_gt *gt,
> +			     struct xe_force_wake_domain *domain)
> +{
> +	return xe_mmio_wait32(gt, domain->reg_ack, 0, domain->val,
> +			      XE_FORCE_WAKE_ACK_TIMEOUT_MS);
> +}
> +
> +#define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
> +	for (tmp__ = (mask__); tmp__ ;) \
> +		for_each_if((domain__ = ((fw__)->domains + \
> +					 __mask_next_bit(tmp__))) && \
> +					 domain__->reg_ctl)
> +
> +int xe_force_wake_get(struct xe_force_wake *fw,
> +		      enum xe_force_wake_domains domains)
> +{
> +	struct xe_device *xe = fw_to_xe(fw);
> +	struct xe_gt *gt = fw_to_gt(fw);
> +	struct xe_force_wake_domain *domain;
> +	enum xe_force_wake_domains tmp, woken = 0;
> +	int ret, ret2 = 0;
> +
> +	mutex_lock(&fw->lock);
> +	for_each_fw_domain_masked(domain, domains, fw, tmp) {
> +		if (!domain->ref++) {
> +			woken |= BIT(domain->id);
> +			domain_wake(gt, domain);
> +		}
> +	}
> +	for_each_fw_domain_masked(domain, woken, fw, tmp) {
> +		ret = domain_wake_wait(gt, domain);
> +		ret2 |= ret;
> +		if (ret)
> +			drm_notice(&xe->drm, "Force wake domain (%d) failed to ack wake, ret=%d\n",
> +				   domain->id, ret);
> +	}
> +	fw->awake_domains |= woken;
> +	mutex_unlock(&fw->lock);
> +
> +	return ret2;
> +}
> +
> +int xe_force_wake_put(struct xe_force_wake *fw,
> +		      enum xe_force_wake_domains domains)
> +{
> +	struct xe_device *xe = fw_to_xe(fw);
> +	struct xe_gt *gt = fw_to_gt(fw);
> +	struct xe_force_wake_domain *domain;
> +	enum xe_force_wake_domains tmp, sleep = 0;
> +	int ret, ret2 = 0;
> +
> +	mutex_lock(&fw->lock);
> +	for_each_fw_domain_masked(domain, domains, fw, tmp) {
> +		if (!--domain->ref) {
> +			sleep |= BIT(domain->id);
> +			domain_sleep(gt, domain);
> +		}
> +	}
> +	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
> +		ret = domain_sleep_wait(gt, domain);
> +		ret2 |= ret;
> +		if (ret)
> +			drm_notice(&xe->drm, "Force wake domain (%d) failed to ack sleep, ret=%d\n",
> +				   domain->id, ret);
> +	}

I don't think it's a great idea to wait for the power domain to go back
to sleep; as long as we've cleared our wake bit, we should be free to
move on with other work and not wait around for the punit to get around
to taking action.  We only need to make sure that the sleep has taken
effect before the next time we grab the forcewake.

...
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> new file mode 100644
> index 000000000000..3ace37d90f8d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -0,0 +1,284 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2021 Intel Corporation
> + */
> +
> +#include "xe_ggtt.h"
> +
> +#include <linux/sizes.h>
> +#include <drm/i915_drm.h>
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device.h"
> +#include "xe_bo.h"
> +#include "xe_gt.h"
> +#include "xe_mmio.h"
> +#include "xe_wopcm.h"
> +
> +#include "../i915/i915_reg.h"
> +#include "../i915/gt/intel_gt_regs.h"
> +
> +/* FIXME: Common file, preferably auto-gen */
> +#define MTL_GGTT_PTE_PAT0	BIT(52)
> +#define MTL_GGTT_PTE_PAT1	BIT(53)
> +
> +u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset)
> +{
> +	struct xe_device *xe = xe_bo_device(bo);
> +	u64 pte;
> +	bool is_lmem;
> +
> +	pte = xe_bo_addr(bo, bo_offset, GEN8_PAGE_SIZE, &is_lmem);
> +	pte |= GEN8_PAGE_PRESENT;
> +
> +	if (is_lmem)
> +		pte |= GEN12_GGTT_PTE_LM;
> +
> +	/* FIXME: vfunc + pass in caching rules */
> +	if (xe->info.platform == XE_METEORLAKE) {
> +		pte |= MTL_GGTT_PTE_PAT0;
> +		pte |= MTL_GGTT_PTE_PAT1;
> +	}

This hardcodes PAT index 3, which is WB with 1-way coherency.  That's
probably how a lot of UMD buffers will get mapped in the PPGTT, but may
not be suitable in all cases.  There are some workarounds that require
uncached in certain circumstances, and I think display generally wants
uncached for the GGTT mapping.

We need to figure out how cache behavior is going to be managed on the
Xe driver in general.  i915's mutable obj->cache_level is generally
considered a big mistake now; I think the expectation was that we were
going to track PAT index selection on the VMA now since that matches how
the hardware tracks it and you can potentially have multiple mappings
with different PAT settings.

...
> +void xe_ggtt_invalidate(struct xe_gt *gt)
> +{
> +	/* TODO: vfunc for GuC vs. non-GuC */
> +
> +	/* TODO: i915 makes comments about this being uncached and
> +	 * therefore flushing WC buffers.  Is that really true here?
> +	 */
> +	xe_mmio_write32(gt, GFX_FLSH_CNTL_GEN6.reg, GFX_FLSH_CNTL_EN);

This register went away in Xe_HP; we shouldn't be trying to write it on
newer platforms.  I'm not sure if there's an equivalent register located
somewhere else now or not.

> +	if (xe_device_guc_submission_enabled(gt_to_xe(gt))) {
> +		struct xe_device *xe = gt_to_xe(gt);
> +
> +		/* TODO: also use vfunc here */
> +		if (xe->info.platform == XE_PVC) {
> +			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1.reg,
> +					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
> +			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC0.reg,
> +					PVC_GUC_TLB_INV_DESC0_VALID);
> +		} else
> +			xe_mmio_write32(gt, GEN12_GUC_TLB_INV_CR.reg,
> +					GEN12_GUC_TLB_INV_CR_INVALIDATE);
> +	}
> +}
...
> +void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> +{
> +	u64 start = bo->ggtt_node.start;
> +	u64 offset, pte;
> +
> +	for (offset = 0; offset < bo->size; offset += GEN8_PAGE_SIZE) {
> +		pte = xe_ggtt_pte_encode(bo, offset);
> +		xe_ggtt_set_pte(ggtt, start + offset, pte);
> +	}
> +
> +	xe_ggtt_invalidate(ggtt->gt);

The GGTT is shared by two GTs on a platform like MTL; we only seem to be
invalidating the GuC's TLB for the primary GT here and are overlooking
the media GT.

...
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
...
> +/* FIXME: These should be in a common file */
> +#define CHV_PPAT_SNOOP			REG_BIT(6)
> +#define GEN8_PPAT_AGE(x)		((x)<<4)
> +#define GEN8_PPAT_LLCeLLC		(3<<2)
> +#define GEN8_PPAT_LLCELLC		(2<<2)
> +#define GEN8_PPAT_LLC			(1<<2)

The ones above here aren't even used anywhere below.

> +#define GEN8_PPAT_WB			(3<<0)
> +#define GEN8_PPAT_WT			(2<<0)
> +#define GEN8_PPAT_WC			(1<<0)
> +#define GEN8_PPAT_UC			(0<<0)
> +#define GEN8_PPAT_ELLC_OVERRIDE		(0<<2)

Also unused

> +#define GEN8_PPAT(i, x)			((u64)(x) << ((i) * 8))

Ditto

> +#define GEN12_PPAT_CLOS(x)              ((x)<<2)

Only used on PVC, so this should have an XEHPC_ prefix rather than
GEN12_.

> +
> +static void tgl_setup_private_ppat(struct xe_gt *gt)
> +{
> +	/* TGL doesn't support LLC or AGE settings */
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(0).reg, GEN8_PPAT_WB);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(1).reg, GEN8_PPAT_WC);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(2).reg, GEN8_PPAT_WT);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(3).reg, GEN8_PPAT_UC);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(4).reg, GEN8_PPAT_WB);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(5).reg, GEN8_PPAT_WB);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(6).reg, GEN8_PPAT_WB);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(7).reg, GEN8_PPAT_WB);
> +}
> +
> +static void pvc_setup_private_ppat(struct xe_gt *gt)
> +{
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(0).reg, GEN8_PPAT_UC);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(1).reg, GEN8_PPAT_WC);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(2).reg, GEN8_PPAT_WT);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(3).reg, GEN8_PPAT_WB);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(4).reg,
> +			GEN12_PPAT_CLOS(1) | GEN8_PPAT_WT);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(5).reg,
> +			GEN12_PPAT_CLOS(1) | GEN8_PPAT_WB);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(6).reg,
> +			GEN12_PPAT_CLOS(2) | GEN8_PPAT_WT);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(7).reg,
> +			GEN12_PPAT_CLOS(2) | GEN8_PPAT_WB);
> +}
> +
> +#define MTL_PPAT_L4_CACHE_POLICY_MASK   REG_GENMASK(3, 2)
> +#define MTL_PAT_INDEX_COH_MODE_MASK     REG_GENMASK(1, 0)
> +#define MTL_PPAT_3_UC   REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 3)
> +#define MTL_PPAT_1_WT   REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 1)
> +#define MTL_PPAT_0_WB   REG_FIELD_PREP(MTL_PPAT_L4_CACHE_POLICY_MASK, 0)
> +#define MTL_3_COH_2W    REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 3)
> +#define MTL_2_COH_1W    REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 2)
> +#define MTL_0_COH_NON   REG_FIELD_PREP(MTL_PAT_INDEX_COH_MODE_MASK, 0)
> +
> +static void mtl_setup_private_ppat(struct xe_gt *gt)
> +{
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(0).reg, MTL_PPAT_0_WB);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(1).reg,
> +			MTL_PPAT_1_WT | MTL_2_COH_1W);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(2).reg,
> +			MTL_PPAT_3_UC | MTL_2_COH_1W);

Indices 1 and 2 shouldn't have the 1W coherency bit set.

All of the register writes here should be switched to MCR writes in
general to avoid racing with external agents who might be trying to
perform unicast operations.

> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(3).reg,
> +			MTL_PPAT_0_WB | MTL_2_COH_1W);
> +	xe_mmio_write32(gt, GEN12_PAT_INDEX(4).reg,
> +			MTL_PPAT_0_WB | MTL_3_COH_2W);
> +}
...
> +static int gt_fw_domain_init(struct xe_gt *gt)

Personally I find this name a bit confusing.  I keep expecting this to
be initialization of the GT forcewake domain, but it actually winds up
being a subset of GT initialization that you want to do while holding
the GT wake (the domain itself was already initialized earlier).  Same
comment for the all_fw_domain_init() farther down.

...
> +static int gt_reset(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int err;
> +
> +	/* We only support GT resets with GuC submission */
> +	if (!xe_device_guc_submission_enabled(gt_to_xe(gt)))
> +		return -ENODEV;
> +
> +	drm_info(&xe->drm, "GT reset started\n");
> +
> +	xe_device_mem_access_get(gt_to_xe(gt));
> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (err)
> +		goto err_msg;
> +
> +	xe_uc_stop_prepare(&gt->uc);
> +	xe_gt_pagefault_reset(gt);
> +
> +	err = xe_uc_stop(&gt->uc);
> +	if (err)
> +		goto err_out;

Does resetting the GT inherently invalidate the TLBs?  At this point
we're not handling TLB invalidation requests anymore, so I'm not sure if
that's a concern or not.

...
> +int xe_gt_suspend(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int err;
> +
> +	/* For now suspend/resume is only allowed with GuC */
> +	if (!xe_device_guc_submission_enabled(gt_to_xe(gt)))
> +		return -ENODEV;
> +
> +	xe_device_mem_access_get(gt_to_xe(gt));
> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (err)
> +		goto err_msg;
> +
> +	err = xe_uc_suspend(&gt->uc);
> +	if (err)
> +		goto err_force_wake;
> +

Same question as above; if we bail out part way through the higher-level
suspend process, but we've already stopped the GuC on a GT, is there any
concern about not responding to any TLB invalidation requests that came
in?

...
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
...
> +static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
> +					  struct iosys_map *regset_map,
> +					  struct xe_hw_engine *hwe)
> +{
> +	struct xe_hw_engine *hwe_rcs_reset_domain =
> +		xe_gt_any_hw_engine_by_reset_domain(hwe->gt, XE_ENGINE_CLASS_RENDER);
> +	struct xe_reg_sr_entry *entry;
> +	unsigned long idx;
> +	unsigned count = 0;
> +	const struct {
> +		u32 reg;
> +		u32 flags;
> +		bool skip;
> +	} *e, extra_regs[] = {
> +		{ .reg = RING_MODE_GEN7(hwe->mmio_base).reg,		},
> +		{ .reg = RING_HWS_PGA(hwe->mmio_base).reg,		},
> +		{ .reg = RING_IMR(hwe->mmio_base).reg,			},
> +		{ .reg = GEN12_RCU_MODE.reg, .flags = 0x3,

The programming of RCU_MODE (i.e., enabling the CCS engines) should
probably be handled through RTP now?

...
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
...
> +struct engine_info {
> +	const char *name;
> +	unsigned int class : 8;
> +	unsigned int instance : 8;
> +	enum xe_force_wake_domains domain;
> +	/* mmio bases table *must* be sorted in reverse graphics_ver order */
> +	struct engine_mmio_base {
> +		unsigned int graphics_ver : 8;

We might need a full arch+release version here in the future?

> +		unsigned int base : 24;
> +	} mmio_bases[MAX_MMIO_BASES];

At the moment the multiple bases we have can be dropped since they're
for old platforms that the Xe driver doesn't support.

...
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c

There's lots of "gen3," "gen11," etc. in this file that should probably
be cleaned up.

...
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
...
> +static const i915_reg_t mmio_read_whitelist[] = {
> +	RING_TIMESTAMP(RENDER_RING_BASE),
> +};
> +
> +int xe_mmio_ioctl(struct drm_device *dev, void *data,
> +		  struct drm_file *file)

My understanding is that having a register read ioctl was pretty much
ancient history that was grandfathered into the i915 design.  Is there
any reason to keep this on Xe rather than just providing a more
appropriate way to obtain the render timestamp (e.g., via the query
ioctl or something)?  Among other things, userspace needs to interpret
the register value, which seems like something the kernel should really
be doing for it; it's possible new fields could be added to the register
in the future containing something we don't want to just blindly expose
to userspace.

> +{
> +	struct xe_device *xe = to_xe_device(dev);
> +	struct drm_xe_mmio *args = data;
> +	unsigned int bits_flag, bytes;
> +	bool allowed;
> +	int ret = 0;
> +
> +	if (XE_IOCTL_ERR(xe, args->extensions))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_ERR(xe, args->flags & ~VALID_MMIO_FLAGS))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_ERR(xe, !(args->flags & DRM_XE_MMIO_WRITE) && args->value))
> +		return -EINVAL;
> +
> +	allowed = capable(CAP_SYS_ADMIN);
> +	if (!allowed && ((args->flags & ~DRM_XE_MMIO_BITS_MASK) == DRM_XE_MMIO_READ)) {
> +		unsigned int i;
> +
> +		for (i = 0; i < ARRAY_SIZE(mmio_read_whitelist); i++) {
> +			if (mmio_read_whitelist[i].reg == args->addr) {
> +				allowed = true;
> +				break;
> +			}
> +		}
> +	}
> +
> +	if (XE_IOCTL_ERR(xe, !allowed))
> +		return -EPERM;
> +
> +	bits_flag = args->flags & DRM_XE_MMIO_BITS_MASK;
> +	bytes = 1 << bits_flag;
> +	if (XE_IOCTL_ERR(xe, args->addr + bytes > xe->mmio.size))
> +		return -EINVAL;
> +
> +	xe_force_wake_get(gt_to_fw(&xe->gt[0]), XE_FORCEWAKE_ALL);

Everywhere in this function is using xe->gt[0] or to_gt(xe), so it
doesn't seem like this will work with multi-tile platforms.

> +
> +	if (args->flags & DRM_XE_MMIO_WRITE) {
> +		switch (bits_flag) {
> +		case DRM_XE_MMIO_8BIT:
> +			return -EINVAL; /* TODO */
> +		case DRM_XE_MMIO_16BIT:
> +			return -EINVAL; /* TODO */
> +		case DRM_XE_MMIO_32BIT:
> +			if (XE_IOCTL_ERR(xe, args->value > U32_MAX))
> +				return -EINVAL;
> +			xe_mmio_write32(to_gt(xe), args->addr, args->value);
> +			break;
> +		case DRM_XE_MMIO_64BIT:
> +			xe_mmio_write64(to_gt(xe), args->addr, args->value);
> +			break;
> +		default:
> +			drm_WARN(&xe->drm, 1, "Invalid MMIO bit size");
> +			ret = -EINVAL;
> +			goto exit;
> +		}
> +	}
> +
> +	if (args->flags & DRM_XE_MMIO_READ) {

Once we've made it past the 'allowed' check above, we're still trusting
the user to pass the right register size.  At the moment it doesn't
matter too much since the only whitelisted register is 64-bit, but if we
added something else that was 32-bit or smaller, userspace could still
read extra register(s) by requesting 64-bit here.

> +		switch (bits_flag) {
> +		case DRM_XE_MMIO_8BIT:
> +			return -EINVAL; /* TODO */
> +		case DRM_XE_MMIO_16BIT:
> +			return -EINVAL; /* TODO */
> +		case DRM_XE_MMIO_32BIT:
> +			args->value = xe_mmio_read32(to_gt(xe), args->addr);
> +			break;
> +		case DRM_XE_MMIO_64BIT:
> +			args->value = xe_mmio_read64(to_gt(xe), args->addr);

It looks like this becomes a simple readq() operation.  I thought
counter registers were exactly the type of registers where we needed to
avoid doing that because 64-bit reads don't actually work as you'd
expect and may give bogus data?

...
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
...
> +static inline u64 xe_mmio_read64(struct xe_gt *gt, u32 reg)
> +{
> +	if (reg < gt->mmio.adj_limit)
> +		reg += gt->mmio.adj_offset;
> +
> +	return readq(gt->mmio.regs + reg);

As noted earlier, we generally don't want to be doing readq's on 64-bit
registers.  There are a lot of reports of one dword coming back
properly, but the other one being all 0's or all F's.  And even if both
dwords come back in the read, the read itself isn't atomic for 64-bit
registers, so trying to read a counter this way can give incorrect
results.

Also, having all of our register accesses happen on a 'gt' is kind of
ugly since a lot of the platform's register accesses are completely
unrelated to GT (i.e., sgunit, soc, display, etc.).

...
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
...
> +static const struct xe_mocs_entry tgl_mocs_desc[] = {
> +	/*
> +	 * NOTE:
> +	 * Reserved and unspecified MOCS indices have been set to (L3 + LCC).
> +	 * These reserved entries should never be used, they may be changed
> +	 * to low performant variants with better coherency in the future if
> +	 * more entries are needed. We are programming index XE_MOCS_PTE(1)
> +	 * only, __init_mocs_table() take care to program unused index with
> +	 * this entry.
> +	 */
> +	MOCS_ENTRY(XE_MOCS_PTE,
> +		   LE_0_PAGETABLE | LE_TC_0_PAGETABLE,
> +		   L3_1_UC),
> +	GEN11_MOCS_ENTRIES,

I think this entry is something we got stuck with on TGL because we
screwed up the table and couldn't fix it after force_probe was removed
for ABI reasons.  But for the Xe driver we should just use the correct
table (which I believe is already handled by the "gen12" table farther
down); no need to repeat our i915 mistakes.

...
> +	case XE_METEORLAKE:
> +		info->size = ARRAY_SIZE(dg2_mocs_desc);
> +		info->table = dg2_mocs_desc;

We still need to land the proper MTL-specific table here.

...
> +void xe_mocs_init(struct xe_gt *gt)
> +{

In general it seems like we might be able to convert the MOCS
programming over to use the RTP facility of the Xe driver?

...
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
...
> +struct xe_subplatform_desc {
> +	enum xe_subplatform subplatform;
> +	const char *name;
> +	const u16 *pciidlist;
> +};

Just as a note, we're going to need to rework how platforms and
subplatforms work (both in i915 and the xe driver).  Once we have
multiple GMD_ID platforms released the PCI IDs may start becoming
unreliable with various mix-and-match combinations.

...
> +#define GEN13_DISPLAY \

There's no such thing as "GEN13" so this name doesn't make sense.
Probably should have been XE_LPD instead (i.e., display version 13).

In general I want to look into moving the display feature flags and
assignment of a display subtructure into the display code itself (rather
than having the top-level i915/xe drivers set this up).  I.e., the main
driver would just call something like intel_display_init() and that
centralized display code would check the PCI ID or GMD_ID to identify
itself.

...
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
...
> +static u64 __gen8_pte_encode(u64 pte, enum xe_cache_level cache, u32 flags,
> +			     u32 pt_level)
> +{
> +	pte |= GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
> +
> +	if (unlikely(flags & PTE_READ_ONLY))
> +		pte &= ~GEN8_PAGE_RW;
> +
> +	/* FIXME: I don't think the PPAT handling is correct for MTL */

Yeah, the PAT encoding for MTL needs updates.  But also, I think the
enum xe_cache_level is something we probably want to rethink.  That's
similar to what i915 did, which is causing us all kinds of headaches
now.  For PPGTT mappings, userspace should already know exactly what PAT
behavior they want (just like they know what MOCS behavior they want)
and they can pass us the specific index to encode (presumably at vm_bind
time so that it's attached to the specific gtt mapping, not the object).

...
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
...
> +static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)

On i915 we were specifically asked to steer clear of "gts" because it
confuses people as to whether its some new three-letter acronym, or
whether it's the plural form of "gt."  I assume the maintainers will
want us to avoid it in Xe as well.


Matt

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
