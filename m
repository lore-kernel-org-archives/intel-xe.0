Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A488DC47DAF
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 16:58:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658CE10E6C4;
	Mon, 22 Jan 2024 16:58:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2348D10E67B
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 16:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705942733; x=1737478733;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7VoUNXqHW70lwqGNQChabw5G1DioWrKwHSWrjaiPS24=;
 b=eDoKVK+fwKd9RRiggLDnmdzi/6o0fQ8FQwfZLPrK6Jfx6adMbBTPmgjr
 Cnj9fzSfLOr1mMMyxF+2tWkBCWAAe6xYzWOTxt7NwTXcVMWsIWp1b47Rf
 wvuM7W+UtUvVMMvRlkhFd1H8SxllqsgojIqcWUju24ss8GZZuzedON0jq
 H69Pwzxt5QWByXCSJ27DIeu7aMj33MNS+ba3aArP1LhZcR3c9ViNdIT7L
 4BZOFdrd0hN+mHBYHjrDATccx7BnGP25PUCjoMQHUdzTO0hdJZahRGxLS
 RHc8y2Bvbd5dXGYvIciJRSeH9p+Budwco8RBnsf+/qBua/rHVrACt5ua1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="8371431"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="8371431"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 08:58:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="958800825"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="958800825"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 08:58:52 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 08:58:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 08:58:52 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 08:58:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ctRw3k4/OAaR7R3VsVArmKGFhC4MSRPvfky4QDsziQxt2ps6kCUKWJx/v6j4HKhw6aVIDHYS0LZlQWyQS+6LK2bsLnD1lyNadjH4ntxeSJk3wXQz2EFUvMUX8UEK6DIqBTq+S/PEtxbOFr090bw88txjczmEyaPoRkbV7hKYeS1jBtcWkJOUACazM0/ueE1++kR9maXbKXUDgm+UOuOW/tHU28EUl3eTvtgUk8ljYBNTi+a6qegS3NNzvighfWTnBWQ3RXcavYI3c5cIlp7ekXYagHQfNI2usyXMYbQdVC9ZzjcpepHaYfBpqJZonmZJ6Eh+YsiLJujt7UU4Ce3SRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aGDTboX8CHqMieGPO9G6LDvxmlBEiU3ps55g9Svtc3U=;
 b=B5vb5EIHUCLGFrcJf+6hmj7zxrHvXoo4HBiRZaeSwslbs87F4DnNBueUkErg5PWSs2dehK4m9+dfKMH7WGuXoKScRIrqx7R7FBQiUc31uMu8lrWlpR+l8w/SXivgdiNlK3N9g9uzSjFil8FwvE4pQTbRfi1zAf1P2qZrOLvZlOtzPJ2WlFhirT+otG3MHdz7e/bPoNmhqfLElAmsQc5WF+ksQqs8FYJETQVQZprZ7QPAzUinmaWcO7ulqJh7/9zvsTLf4iqw2RgqRahF5/D8pOcLGwFdKA3J5EbnXilzjoCjHVfNW63FD7thbTi47rl3z/EVwfG0XLXSAekIDBhzxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BY1PR11MB7981.namprd11.prod.outlook.com (2603:10b6:a03:52f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 16:58:50 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 16:58:50 +0000
Date: Mon, 22 Jan 2024 11:58:46 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: drop display/ subdir from include directories
Message-ID: <Za6exkgJxg69G7h6@intel.com>
References: <20240122101428.2683468-1-jani.nikula@intel.com>
 <20240122101428.2683468-2-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240122101428.2683468-2-jani.nikula@intel.com>
X-ClientProxiedBy: BYAPR02CA0060.namprd02.prod.outlook.com
 (2603:10b6:a03:54::37) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BY1PR11MB7981:EE_
X-MS-Office365-Filtering-Correlation-Id: b0180053-9612-43da-75b7-08dc1b6b67e8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d7xV9JWykPBY8egLWXrQJqSa78qtgU25AruYD6xBElmsypMF1pZ8Ql0HUUk0t+gShUQmFYDcF2mBtZTOtnQNBVN1hRPp3DNGfoFi8ZuWHVVTnfEWlf6+IPg6hbsQ1Cz0cwBhPx6K4Heiak8S2kzmTGnaGED6Jf93at0ONzkEGa3OxgPRi0VMOA2OXih1GAcyYAqqMpfsPiEdMHuEkiuMkHlzJ4MY6PgjgQSDa8dqc6UXiErRIBSFENQsv2ZUMSuiynTPMs+8ivTn3iwpupkbfygA0V4/DCCQ+VtsC+ljsFbn0BfH96UmkEMjjHw9Po5rRYyzlS67yaHgI/H+rBlPnjOE76wUuq6qSHLzUVICpkdbI+CXPUNXyU8AMShrCSwCIuBG3cPWAttSp7rgh8uUSCPxHDxuk17s+XDhoMv/KETHb/yuogV9+zwU0qRn72Kf/yP1e8uz7gi9RNRfbnAv5RF79t2jjFaoafXQRRY6+7cRGnIrLTTU8/ViL0yLxIgSwh+lRQwnr7Dy2Wffcy8VqTe06VcTHglIlDN88C9xO34omrZ1dqXwv4IgM4R7r/rD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(366004)(346002)(39860400002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(38100700002)(82960400001)(36756003)(86362001)(83380400001)(26005)(2616005)(316002)(66946007)(66556008)(8936002)(8676002)(66476007)(6486002)(37006003)(6512007)(6506007)(6666004)(6636002)(478600001)(6862004)(5660300002)(44832011)(41300700001)(4326008)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HACG4ZH2vqYpHlHOf2CRvJsTLbWj5GjiF8GfzrrYr8i5GVGJt9PVnCjeFC4t?=
 =?us-ascii?Q?7FZuluLOR74kZs70UtHp8srRK9l8wUXl3qAoVVYN1rRaZHtq+sST+jfiAnvK?=
 =?us-ascii?Q?y/06Op4eYgsbHLjU/U0V9ZCZULmCqejM2ZUSs3w/p/OxR6kZ16um9TiTxhEO?=
 =?us-ascii?Q?2Q/jD0My3y24kGv4IWIrFJn9D/IHzFLBgt0VBLXhMldc/IR756v2cX829+HK?=
 =?us-ascii?Q?IbhCB0pGIQHOWGaYblT9LqQv68trUyXnPgzAdyVPMXYQ+84E2AE/q7YFzcYQ?=
 =?us-ascii?Q?Wcz/URGJQgfK0A4UzbYgWrwgMcPRH27rUT3RbR07NZFB5700QyVRaJShkuer?=
 =?us-ascii?Q?TLUhex/xvSU53QeUjoXK+K7H5q6xnz203vNch3fH2dXYDaK3Hhvz09BntNmi?=
 =?us-ascii?Q?JppkdBb7Y+vguyt/lyAkVbk2GgMpTf6HdGJZ1S9pD2QCZ1x1kdFy3WNUicOt?=
 =?us-ascii?Q?v41WhN6BAw9fpjhnYN48RxpTxvyAkQfnI+cqvvrjvo5hlHtNbOVQ8K0lQZP8?=
 =?us-ascii?Q?jBlXCk8/vJpSS931p1Dc+UU15wyUv0XaMhKORF/0/dQ+V0ZVN5Jh9i3C3rqm?=
 =?us-ascii?Q?oze34/0uKlkbTI+ybnn45XVlomkf7DCzmgYEyo/IBUjxFNgoXdL5NDgmY3vu?=
 =?us-ascii?Q?81qJXwvqJ2wU6pJapbQ7asncc7S1t1geXrSDwxEvwqgya9jqw3LmLj7NBTOA?=
 =?us-ascii?Q?2/by6LD7cZhlpzs2b3vv3MNxzHZEInLtX70w8aj74TaZBN5NplFo3dQR4ZIc?=
 =?us-ascii?Q?JgUPimVIwXHK3uPQ2C5n31ofpLU28a5LEgM40roaZ0EokOlznZcj3FbILYI8?=
 =?us-ascii?Q?WXSmnkxVp42tIQULWO+synC6AtVi8h6UH5CHr8BL0rgLNFfC8Q3xWGOudPu8?=
 =?us-ascii?Q?YGhdn35c50MN7JgPkk1r0Oxim0CJZxUpUhEdMtUhvKAstHEjG3pmoRJTkcyu?=
 =?us-ascii?Q?BSdSNNoPFx5uVB2vpmSym1QwnEOfkiNsYzGZmCBUq9/WzCQESkDETPlpOdX/?=
 =?us-ascii?Q?YEUqlfkFoue2czZh7j8g2NPkQvpCehSTX8onhv/dSlzvtZNeJ19n4+zBwHwj?=
 =?us-ascii?Q?ybxAoOvy5T0Q2TLfGizKial3/8DzUITJqKGM7+3VTnf0gkh+r9psGv9OAwBk?=
 =?us-ascii?Q?KMZA4k4uVZCth0o6/+f66+dVB7N3WZru8UfZ9A1c60/OsIXKwpgMuO0UbkuR?=
 =?us-ascii?Q?9vPUDYTUAF0n/c9H0ACOVNfb8GXSK2lhiTmEjAS2RZ7/aGm3PTIaWx/89d49?=
 =?us-ascii?Q?7E+/3eQXdAuOvWASepqs7XOILMffBMGi3rkMWsc6QuLG3m2tt241pieeH9I3?=
 =?us-ascii?Q?gPqOd/sQI6gbgV7/kvY8IIzovniaZb3uw+HAr1Zxl5D+VGQx8R5VOic85fw1?=
 =?us-ascii?Q?qd5yw8oh4W9nBecM8znQ93I9Eh7PQKOkG4leqKP4aH9Xsuw88RUGPFsw9pi3?=
 =?us-ascii?Q?SPShdghiyWPDsPAHBw0hUY1/5hSDx0UHzjAZQEmqyAZzwNd7UZhuPiY4NvOO?=
 =?us-ascii?Q?YKLhcdeWw09mBd/RV0QM954A8Z+QqaoUvkkHOvMbhvZInYBRM2i/vkZ/Jp4g?=
 =?us-ascii?Q?7IjfIutVPiFpKolCeZJvSwIHfTZiKF6BMS8dbnxJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0180053-9612-43da-75b7-08dc1b6b67e8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 16:58:50.1471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lpV1UZPU0Zv6C6sfcpvYiqkpNoik/gPWdzcxzjUDdzF0rho9IQiIohJk/PFP0XfQq1fql2uHlmmaE1dXCqVg6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7981
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 12:14:28PM +0200, Jani Nikula wrote:
> There are very few places that need to include anything from under
> display/. Require the display/ prefix in #include directives, and drop
> the subdirectory from the header search path.
> 
> Sort the include lists while at it.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/Makefile    | 1 -
>  drivers/gpu/drm/xe/xe_device.c | 6 +++---
>  drivers/gpu/drm/xe/xe_irq.c    | 2 +-
>  drivers/gpu/drm/xe/xe_pci.c    | 2 +-
>  drivers/gpu/drm/xe/xe_pm.c     | 2 +-
>  5 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index e06f99def559..789d310cb5bc 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -165,7 +165,6 @@ xe-$(CONFIG_DRM_XE_KUNIT_TEST) += \
>  subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
>  	-I$(srctree)/$(src)/display/ext \
>  	-I$(srctree)/$(src)/compat-i915-headers \
> -	-I$(srctree)/drivers/gpu/drm/xe/display/ \
>  	-I$(srctree)/drivers/gpu/drm/i915/display/ \
>  	-Ddrm_i915_gem_object=xe_bo \
>  	-Ddrm_i915_private=xe_device
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index ab417f4f7d2a..eea0b259ae85 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -15,20 +15,21 @@
>  #include <drm/drm_print.h>
>  #include <drm/xe_drm.h>
>  
> +#include "display/xe_display.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_regs.h"
>  #include "xe_bo.h"
>  #include "xe_debugfs.h"
> -#include "xe_display.h"
>  #include "xe_dma_buf.h"
>  #include "xe_drm_client.h"
>  #include "xe_drv.h"
> -#include "xe_exec_queue.h"
>  #include "xe_exec.h"
> +#include "xe_exec_queue.h"
>  #include "xe_ggtt.h"
>  #include "xe_gsc_proxy.h"
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
> +#include "xe_hwmon.h"
>  #include "xe_irq.h"
>  #include "xe_memirq.h"
>  #include "xe_mmio.h"
> @@ -43,7 +44,6 @@
>  #include "xe_ttm_sys_mgr.h"
>  #include "xe_vm.h"
>  #include "xe_wait_user_fence.h"
> -#include "xe_hwmon.h"
>  
>  #ifdef CONFIG_LOCKDEP
>  struct lockdep_map xe_device_mem_access_lockdep_map = {
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 2fd8cc26fc9f..d31e87de5a1c 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -9,10 +9,10 @@
>  
>  #include <drm/drm_managed.h>
>  
> +#include "display/xe_display.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_regs.h"
>  #include "xe_device.h"
> -#include "xe_display.h"
>  #include "xe_drv.h"
>  #include "xe_gsc_proxy.h"
>  #include "xe_gt.h"
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index df6b3b31f419..09c50471331c 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -15,9 +15,9 @@
>  #include <drm/drm_drv.h>
>  #include <drm/xe_pciids.h>
>  
> +#include "display/xe_display.h"
>  #include "regs/xe_gt_regs.h"
>  #include "xe_device.h"
> -#include "xe_display.h"
>  #include "xe_drv.h"
>  #include "xe_gt.h"
>  #include "xe_macros.h"
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index d5f219796d7e..4d3984ae4ff1 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -10,11 +10,11 @@
>  #include <drm/drm_managed.h>
>  #include <drm/ttm/ttm_placement.h>
>  
> +#include "display/xe_display.h"
>  #include "xe_bo.h"
>  #include "xe_bo_evict.h"
>  #include "xe_device.h"
>  #include "xe_device_sysfs.h"
> -#include "xe_display.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
>  #include "xe_guc.h"
> -- 
> 2.39.2
> 
