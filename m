Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FAACA0EED
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 20:18:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C14910EB9C;
	Fri, 22 Aug 2025 20:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AdZVmJFf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83EDC10EB9C
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 20:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755893883; x=1787429883;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jbCo5B3pbsfewGSeaziwNYSuVpS5Le6Mbr/WyL/3bas=;
 b=AdZVmJFfY93Wq8KZMynbPpt+aoOVYoMQq+mNgYoMLUA4NzIy5rVtYLxK
 vVMG1N2KIiXtgxp08PCwvH4Y6xt6+T/2Of3ow8qi83dHHoZ/zHi9kAN8N
 uiGI/lULogNc4LIf7E2JUBf8tGNFvoI6ea3C3UvRHkbqAmBH5ye6/9g8j
 IsYYOWo78ifn98eTOXy30HvjQ2NsGZXM/UCAYFFp9uj14An1/0cRCgMBj
 OJ/30hUNf+rH/x9w0hlEEiinIbKCGtzW8CVDIN9/XIVvbLoDa3Q01wacs
 YukJNhd+LBFyGzSWb5oQOQvtF6LybERBiX1O/lhqB2XxcF7ogojcw+/ZN w==;
X-CSE-ConnectionGUID: wA6UD3UWQlusAY6B0oWUlQ==
X-CSE-MsgGUID: ObRor74uRcKWP+8SX6WwAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69642638"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="69642638"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 13:18:03 -0700
X-CSE-ConnectionGUID: MkpiOPcgRsGjEfl582Xs8w==
X-CSE-MsgGUID: polCIUJaSgmCt5k2rMT3zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="168296621"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 13:18:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 13:18:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 13:18:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.80) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 13:18:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BH0sg3HIuvirqKcF8dW1ymZ1+xAahFfJvlueR2AH0pI01u64YAcGrdCuFzT2x/Uj0R0oVUkxDvrN3Be93doqgREh/Kmk1la/vJf0O0TifXMQKt/6dVlKcdG1Dd2K6DNLBX5a8fg4oe0WfPeUMpUxjO/GMjl8HJlfGJT5bC3cwwY2WyUwygiOko37msY/C2jVzAqLDzOvAW6HPQIQuifBoPL9ealwHD5zbMeeJYbitN4fQpgo2QeLSGnkSKY/q6liGZjBVuV7/hzvuZPvgV1xU8nvWD37L2R8ybubrHMTt27LKtUPDbiPDTnK1AZj05tIwP7Y44CEimKSpivTT+cgyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMnA8UBrrzVJFHrqsUaJPPqqGAg/p69Y15RrdR8mDDw=;
 b=Oxftc3jBQ7MPAe8IGgTm1oVOXASz5PsUapN3eVrV06ULtCvmq4Ey+QOMEztjZA874hIOTA5f/8m66cLBwThc1gbINOB5VR4VchfCOC6ctqZiO5LVAxx6UgkNbW5wuSijWBJd7pCVeogTz6PoFEYoxROOyH1MqEPC2AHmQo2n4L5275V+lqS9S7PLPqYFQZU86FE4uaZ6b/9ZUxvOV8niaL2ZMCaGjSBH8eUsVm+i6YXKFMvq5TNbZVKDWl9zZm6aBpaNh6/JRh+yvhnS1pxwpPFonc/aqL6DpRs871ICLC3ZXBCmmiYe6/Rk848vTWjy9ewGyK56UN3mtlv+GX0PdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW4PR11MB6957.namprd11.prod.outlook.com (2603:10b6:303:22a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Fri, 22 Aug
 2025 20:17:58 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9052.013; Fri, 22 Aug 2025
 20:17:58 +0000
Date: Fri, 22 Aug 2025 16:17:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <karthik.poosa@intel.com>,
 <james.xiong@intel.com>, <stuart.summers@intel.com>,
 <shuicheng.lin@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Ensure GT is in C0 during resumes
Message-ID: <aKjQcpFAIN1ojvSX@intel.com>
References: <20250822195340.1246075-1-x.wang@intel.com>
 <20250822195340.1246075-3-x.wang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250822195340.1246075-3-x.wang@intel.com>
X-ClientProxiedBy: SJ0PR03CA0190.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::15) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW4PR11MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: 521c6445-0912-4c1f-6190-08dde1b8fc3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AAdCAmboC4yPAFqxfLl765ck0cGHUh31FttTAkjGZbjMSKdkV5p+y1ZgUIxO?=
 =?us-ascii?Q?QHHhJP9oXOAEF2UQ/J8SwkVEIg0NDc0/pHbEy1zOVQ3f9FZeSv7jK7efJXZl?=
 =?us-ascii?Q?Evik7nggA/nvfoFHYlStzdKJyqQeVHD6B5IDjwR+4nYdTkPZSmZJ/QGHhqXw?=
 =?us-ascii?Q?B97xqZMJpNCXLrHgT8e/mbqKThqm5e2AFM3LCSBrgN4RjHb2V+7qly3GHXMm?=
 =?us-ascii?Q?CSlZIaUb9pQN0UQ5ezvcCUfXmdd+HUxKmjJzdlTipMeTRfseKTX2vZYG/6TS?=
 =?us-ascii?Q?ya9VTdNf3yEScp+4NXko+dmEegJZGT/wy5F/+hJPVfZQfwtbXtzQPw9g0Q+5?=
 =?us-ascii?Q?lyKa5/R/QVreLtSU2RvpfafjPgIXyKvAvTKxSiVXvGqIF6JHlON66ZIcg2Uh?=
 =?us-ascii?Q?gbB4HLymaAh87BD7z0OHOurb95LD2EzcIBNSc2Oa+dtEsUhbLITLoQxe+BiT?=
 =?us-ascii?Q?6VbC7YfI8aGaBZGnFC9CkECfaPFzH5nlCHGfz7Io9dmDrt6c0wsBR1+gbFT1?=
 =?us-ascii?Q?3aHS/HcDrts4YE0zU2y6MeBng5g3ac54uSW6dsBO+S8wI1OlaNsrAovYLxWT?=
 =?us-ascii?Q?MA6FMmFA5MP1BO+O+bXu23V7aWxuZ+EJ5Xx7HzXdcrZUu5DLJEJpNclpbg5/?=
 =?us-ascii?Q?O3S/X88aLyI532mwtzT7Uh4/TmCll/fIdxtGGVEFOEJrMSqMLgc4M81MbUQw?=
 =?us-ascii?Q?F7VZlVmqxnqsW7xEnQo9WdWkw0H4kw+YV31tylX5zQLvLmWMDMA/VfQ4bzXz?=
 =?us-ascii?Q?KFavZxMrDG/c8H1rY9PC4rjmPiVv5400c6YfezZoULpRFs6nYJOSw9h7OowU?=
 =?us-ascii?Q?B3wzQh9XdeTgCEtmqWxfhTCOJhm4RrhfcKGIWUCkj/PXgRbZ9mSU0Shbjmv+?=
 =?us-ascii?Q?MgsHwXGZriEFmm2DmU5TreF/vjfJ144ycTlP9N1e17g+Ie8VxrCyNi03t9Yu?=
 =?us-ascii?Q?KkTg+o/RCEd7fj7rih6byuxMT1IwSONkQedZ2IKKqcEksZK1PEKfTS9dbXkE?=
 =?us-ascii?Q?k6l0O+0PW/yTD8+npGg1PeAgNAmbHf+EOTqziwFcGPgOrqQFe5hpL07MKFEE?=
 =?us-ascii?Q?5c3ssUW6Pt+b7EQ3J/W8evn4tS0cNkD7wAwl62Ukb5pgzxfkRu3ZNRKOVvc2?=
 =?us-ascii?Q?nPGAKb0NjPA41h+JYnli1q1BkFK7QByktlmtPtX7imdCU4AQW9xnKvQRNM02?=
 =?us-ascii?Q?WKroa8Md8m0NOHFINXshTKJXRtws8bPgYpYe9xOGqvXDnsiJHTNu9cRJp++z?=
 =?us-ascii?Q?udy/pudaKEkyTUNpw/AmjCMtQPv5iXg938tuaZ1ZJ5yf7etEzNAxcWI+gdJV?=
 =?us-ascii?Q?daFpSFO52NeWL5MUOj49ZaBmcsjB1T+ys2o6UBLUQllnqEP1NVQBYSB3R+jM?=
 =?us-ascii?Q?XAD9XsA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BaOtQON50XpKKXwwm2x8eSWHzwhzxgJOWTgMU2/rDdVC0MoJelhTHySmYaBo?=
 =?us-ascii?Q?BAtonVGIl8y4i9MkVyNaPHSGHXWG2XyJqA6NXAgxEXqRtfkhVUuUKn41aV7N?=
 =?us-ascii?Q?TvItHa3BXO13w6qyDpzmxjNHHST5b/ESJ4ZL0tQlEQIAkAEG4hHrvtefCCQ/?=
 =?us-ascii?Q?ogmxeYH4fXCEHclB/uX80Q+S+JN8EGdRRGEiTghh/8Db6uXACuaTH2uwrQ1j?=
 =?us-ascii?Q?QQHY8XEjpPuLogfDAYVXUtPQqFeRt2VtMqkZDYk8AyaWFk1Gew2dP5t1labF?=
 =?us-ascii?Q?430ExN0oGCfVaVZm4qBwsO9pBQtJs2D5rLAN7UUmUCUH55NQI65YW9Kl2MSy?=
 =?us-ascii?Q?qOEgVLp3hVsR7ZbzG7k3jX9RxxXrWB9TiqSVbr400CdKELS+3dEzyhAxlrFk?=
 =?us-ascii?Q?CWjbKWGRxLgY127Ud5Y5sQz1P7dlIM5xS7U8A3TgNU+DLrBNhfLVwizMYgQU?=
 =?us-ascii?Q?3dfWSe/XxASGdMj+ObIxdhy1QQzf2ogak1Mh9Cvtcs34LcqfRtN9fck3/qJd?=
 =?us-ascii?Q?41rmjQUhuZ9GLbAXseey5tWecFi43hXaOgCw4lqPOelFd1nRh/LcG1QjtCKU?=
 =?us-ascii?Q?CLr0N0JwFth9BsLvsy5Gj3LIKmhHeGC11R8FrKmyHVDOu3XA3hvRCmloZA8r?=
 =?us-ascii?Q?ZB/BUpOo/KaTJNAQG6+L7xqzpmp1zBAyYVzWgcJDApY3HMR6Ps62kXji2QA3?=
 =?us-ascii?Q?QM6e4qOmelzwNBPk7e+7gsP6VUVWnkTUwu3Q069GRfb3VcoLsumBJLN3M8fh?=
 =?us-ascii?Q?nKrT/b64gC9op1/QIeGtljeJc1/2uZuD6x0AHdSx/1d2yOipCKwZsCa3d4aD?=
 =?us-ascii?Q?yOEd2g8D/OnyoPbCj5WiXXCrWmN1zKTSQcAXKzR7BlblqbU4Pxfuq2e5/dio?=
 =?us-ascii?Q?J9+AxbS3ckla/edUbArdD0kgnWArU8rXYvGbwn7yq+BUuoiD+lAeIjGuxkGr?=
 =?us-ascii?Q?Iu91egZvJQlTEYAVIFr0S5tqibDPyjMhfUdraj07VqRRzFmXuiPB+wKSatIs?=
 =?us-ascii?Q?VA/gJM/BE6CR7kmzZqOOyfPfKKIba6+GuszjpQCmBcJCoZc9ZdTbp9eygKsK?=
 =?us-ascii?Q?FH8HCTcJGWl17gPhtZBMaRsReqHL1BgQaar0g5zs25H9oPhqHmbhqui6uiyv?=
 =?us-ascii?Q?xMky1Aqsx7eUSD98fSY1E33V2PE2vo6Fa9/waKkbf35/W81hrexKn+5GTlpQ?=
 =?us-ascii?Q?c4H29vYqVv7sKGTe1vnQ8u8WW5atZqbiTeVsq+MA0/4ZKmS82POBJAKWLooO?=
 =?us-ascii?Q?h6+TR+RtKHz0/egpQCgLgj3CRKfNJQ6B1RRc2ccYcsD/mZ+pTykOgwMSjJU6?=
 =?us-ascii?Q?+mIUkWoR9MjTADRBh4WcapN5aNFKvWJsVmFRVffROp/jS8HbQw3rF061e7l8?=
 =?us-ascii?Q?3xqLs09IVNE/FQJkbKRrgNjNXImKWNs5GM4TqF0nCfSdCH7IU7OK6faWnIBg?=
 =?us-ascii?Q?0fXbHuQltSHwSMaOHf5emScugjakKS8Lvy5M7K+d4nCkTfxNIjC3I13O8ecS?=
 =?us-ascii?Q?Q/k+Er5zEeJeRUYM8To7lT7H3DapDoQSbzM+p+C3mLIAh0M9yOqjLsCmijRy?=
 =?us-ascii?Q?BqJYV6LJk6EcwCHrZ2bpmrcZ7RHE8stVH7iU6wYyiILLkWtrFintXAd2mLWD?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 521c6445-0912-4c1f-6190-08dde1b8fc3a
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 20:17:58.0320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mdl7ZudVIuWPB1tGLH57c+L+wFGOcasBMd1UsA5kmtzDWXPEr1hRdSSQD2Jc0wmHDE+MfAmQL6xC/eOWaun+cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6957
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

On Fri, Aug 22, 2025 at 12:53:40PM -0700, Xin Wang wrote:
> This patch ensures the gt will be awake for the entire duration
> of the resume sequences until GuCRC takes over and GT-C6 gets
> re-enabled.

Differently of the previous patch this tells what, but doesn't tell why.
Perhaps we should add:

Before suspending GT-C6 is kept enabled, but upon resume, GuCRC
is not yet alive to properly control the exits and some cases of
instability and corruption related to GT-C6 can be observed.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4037

> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pm.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 51934d5dc44f..a2e85030b7f4 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -18,7 +18,7 @@
>  #include "xe_device.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
> -#include "xe_guc.h"
> +#include "xe_gt_idle.h"
>  #include "xe_i2c.h"
>  #include "xe_irq.h"
>  #include "xe_pcode.h"
> @@ -177,6 +177,9 @@ int xe_pm_resume(struct xe_device *xe)
>  	drm_dbg(&xe->drm, "Resuming device\n");
>  	trace_xe_pm_resume(xe, __builtin_return_address(0));
>  
> +	for_each_gt(gt, xe, id)
> +		xe_gt_idle_disable_c6(gt);
> +
>  	for_each_tile(tile, xe, id)
>  		xe_wa_apply_tile_workarounds(tile);
>  
> @@ -533,6 +536,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  
>  	xe_rpm_lockmap_acquire(xe);
>  
> +	for_each_gt(gt, xe, id)
> +		xe_gt_idle_disable_c6(gt);
> +
>  	if (xe->d3cold.allowed) {
>  		err = xe_pcode_ready(xe, true);
>  		if (err)
> -- 
> 2.43.0
> 
