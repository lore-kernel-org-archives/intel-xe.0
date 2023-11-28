Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E859C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 21:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E979110E06E;
	Tue, 28 Nov 2023 21:31:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDD710E06E
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 21:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701207109; x=1732743109;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=V4EPtlW21accwCj16Z44EIqhYjGe77Xgs2cZ4c7mymM=;
 b=DFCcpMlgvmlkM34VPn20r9cWUat+uQGxCI+iccEngFihmo3MQA7y0xmN
 Nx4d1lni8fonapt0xETn25W2t/FS6CbA9zFwK4EZ5y7WETF1zpaCyUF86
 aRAcjNeH1dP3vzFkoSxnxIwstQ4kPwS2FDCLifP98lRVXOHvl60ima/wV
 L5QePtveBseW+PYgqbPe6NQgdZQust3KWC/johPVlHKcujTeZ8PVR1V4K
 oTzfBJouFh8i87XHWgg6guic9Mv0mnsPHxUeR0mDOhrd5ytVpRCAvwTrq
 B7czf8k1YZl2umbTQFSiah9w1/qq4RADyMd8QkgolbZdvUcGVYIh3j9a8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392782576"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="392782576"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 13:31:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="10132524"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 13:31:49 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 13:31:48 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 13:31:48 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 13:31:48 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 13:31:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0nIyD7TKzjeIrva8tPy29hegCpB5vItpXgFdS9Kzz1SHIQEFMM8E8Y2kHYugBFn8Q7AmJJZidnnUpuIyeqsh47ylURCJ33Z1Z95hxjWp0pIm9TvUp+u3ZEhF0EcA01pfvfY0Mu/fddkwxAnUQABFT77ZXQ3fWR+3G8VDhKcBlkC34q2fc4RzMhYyznv292ZIJZ2Eo26pRJlQ8cjhV8eCmSCYdJyv+824zEJVRZbjqvXwRMT4VqyEHcpUKfYsyU5/dI7S0I3uHL7Q5LVFTiLHBAIGX6zRF2fQzUTS+D+7ACJXNQF1e9yB1DfvbaUx4ajLQYozZyr2TlIQXHbjt6enQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uBpaPd6oHMybynBjIDDFr5OzuLGKkUZsk88qDlUFQYo=;
 b=XSsa1W0M9GA9+gg/59P9XUwXQ7j2LxX/8fl1l/ovaHQvC9GTsrlJH4D7dR/hUQeyvPxxoOWXyGMjLLfIfi9sHhDUR9AmpnsWSj5lxPyixaV1QiFFDLMWlvU19EGvYRsK8k3F4jstxa9fJ/zUJ482vmYWA6mhAnhC96ZQR0zJi3uO0N69BsDK3ipRmztP58pdjoLc3ZvoWdVhqDmxYBDZhvVPA5z548nZ0imdmJBVDqTA5eFbxOpVOxLheJDFPKgugOHCbxZ3XT7YsGhqHWEJ4bdO4h14QeVt7/zrPqjwLzFprUMhKiZyBAvSYHU+ANKE/q1+vuE4+5H48G0Jn3Tzag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ2PR11MB7548.namprd11.prod.outlook.com (2603:10b6:a03:4cb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 28 Nov
 2023 21:31:45 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 21:31:45 +0000
Date: Tue, 28 Nov 2023 16:31:42 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Message-ID: <ZWZcPpkeGYOgbc9g@intel.com>
References: <20231127222236.68999-1-vinay.belgaumkar@intel.com>
 <20231127222236.68999-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127222236.68999-2-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SJ0PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::29) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ2PR11MB7548:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b4bcd7d-e92e-4efa-0af4-08dbf0596bb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b8B0X1Ugo7Rvauoi1zUikTqSxzXP4gYGkWeHppV3FtKQfzLVdxzCZHMY8unQOEqpcXNNu4OHrS/jxtbFBhendfhqlYLrWSSnjNJVr8bhzIyvtMXyit1MP3l2mY/EDUnLx3YQ/6+WgA7HdUvLT6VA2Aj/FTb+HdDES4BLYdjBb6rj/vUgdgqQqTo8xOwgE3Hfzh4gJXIZIK9g/W+LiV4qeDdL7fEiOU5XfHTYccyPxBVy2bbBGcQCddn0aEgnJl6VuV/ZMUohDJnCID4Zyb1HOq2xGm3wAHFexSORruXamjF06JVZFndtAf8/QZl2zaJ45fh8drBEmU91HDFcr6bSCtGXerE+DVEiB42v9WU/9Ri/RuFEXNxb9OKNgB2RbhAzLpeI62ohhrQJg0i0GPHZ2vLo+1muk0EeRpnK2lf9KVUr3A+njYre1MRLiNhcopazfF6gL2JNZY2kdC+KsjUhD31YryHInY9Hd7kbCII4TPq+AhBK6F64l8ibwltahx7gkoxVdWZbWEfbuiRCYrOnHD8hDaTew2ai80WejAxrEhMhEfS3bDBcVk3heWb3St0O
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(36756003)(26005)(2616005)(83380400001)(6862004)(86362001)(4326008)(8676002)(8936002)(44832011)(66476007)(66556008)(66946007)(6636002)(37006003)(316002)(6506007)(6666004)(6512007)(2906002)(478600001)(5660300002)(6486002)(82960400001)(41300700001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?cF1zM1ULvg84sgfMonMj7wS5YC4Izh/F4d2VkIMW1v7BYgk0N0Xyd5yaTd?=
 =?iso-8859-1?Q?cKtMrxf2PvTPVCQHQ8pNCeqXu/cux2z9oLej2PU1rh8UVJC0rQqaQlVGBW?=
 =?iso-8859-1?Q?y9ikROt4WJ6+i9hHCNPxdsFSKWNch3aYgZXYgPn+BztOh533lSaUMqfT2k?=
 =?iso-8859-1?Q?aKymWSDjPuw27I+ucsbQztNIUt1vDWkgyyFF5uWjBBK/qIOF23ch6YwU0t?=
 =?iso-8859-1?Q?ZzSynV5K1PahlAfxhX5IPeCmE0eVma4MhEu9qciD40sjb5/ZaVbYAHZJpw?=
 =?iso-8859-1?Q?E+0lLmRDGUVascJlelOj7aQUlG9IdJ3Uh+Rot4IO1ckfnBkZTauXeDa7e8?=
 =?iso-8859-1?Q?EjfMSqr4YgTWU8ZbzrHWImCCSQleXpAf/78ZbVv1bUXGspv1Dab5Q4iv0A?=
 =?iso-8859-1?Q?QWB2warFbgAtzN9D23TmsFbt8xbVSZYB7YK4wnovQUUYjeGxIKxyY3Ac/F?=
 =?iso-8859-1?Q?DRQFKHFbNiLC1KePMge2KOv8y9VeKjMw3czS+94ZQhWF1kAvo5/ECNZbta?=
 =?iso-8859-1?Q?+nEdXtXGjNzShVZ3+AIfEZFqBbnv6zqjueEVDij1DrP4z3blLhiK9jN4OM?=
 =?iso-8859-1?Q?q4CvdP4DRDBtykfTkdjWnhtDL6nLwyunev5orXbUo1qqpbflkCgZ7FzXwE?=
 =?iso-8859-1?Q?4WMvs8LT1dCufWPy8WOJg9NuT4MDFiDpQaZ8Jfgrekf+m1SD934yGD57Tc?=
 =?iso-8859-1?Q?718DfbR/aEzhU8hPIy7qFExLJJdpIkW3hIjyvzz3XbBc1MvZrEEfPZ4yt0?=
 =?iso-8859-1?Q?xjaVtfAOOZqyfXVFvXaa9hTpIJktgvLOmo5QrOTIaF9rqJ/FbI5QqcZMDP?=
 =?iso-8859-1?Q?Kva/nmk9+ufU6XkKlzq0sS/L0qifY7J+zeb/Op4aYCP45//yWN1B+x3ZOc?=
 =?iso-8859-1?Q?iRXMpzc7ZBBostdEPtxKzJAiD56GinYHkGY3Qi4lbgZr4OVZzoKtTekTmx?=
 =?iso-8859-1?Q?XzNq7arHZfL5HWX1CUPBkJfvnEWe/CS/KASlPa++L1hZLJUUB0FT5PvLmU?=
 =?iso-8859-1?Q?eUih0GrRh9pDR/Xa/uJBsmUkhW+B5Vjg7yLJB8EclVWc1/ZBauZ3rnsuuV?=
 =?iso-8859-1?Q?DlrTcsujKvBtk/7lRP0+sPwCKbScKoh6jRThF4QCAvfp2RRrSaMd31yP/s?=
 =?iso-8859-1?Q?2NhIrsK0OugBU7cTTVIBlHWEe0+TH7qnvVUW2ckLJc+e1LnTiGoMoqCHiL?=
 =?iso-8859-1?Q?T34DXHfDYyWHJ4N94HjNiTbpOTayz/FofIXUBdfeG1agjaUTggxgMjihmT?=
 =?iso-8859-1?Q?4UzKkY0jVRL2b5lQcOsNiPoMwcCuU7udgY9KUeYJn/5dNan8cDVklRzwsg?=
 =?iso-8859-1?Q?FWLDUDIQ+DS5b/k/u1VkYLcsc8fXLoajJPf19GDwntT9VrPhXGUgDiACoY?=
 =?iso-8859-1?Q?S8kHUHrPxaNY5McbW+HYShIUlFVIic8RSBG51aHPnsykQtITuEjgNIRYYL?=
 =?iso-8859-1?Q?R+L0hCdk/u0TEHP/So0yKnQkcBLw4cWZXyX0hYV5mYJECMYHW6xAPjLNu9?=
 =?iso-8859-1?Q?FdUE9r8VxRKJnpUebCoD1xe6M/RuWS22zi2N9ZmS67WwYSGItkYkbigIFY?=
 =?iso-8859-1?Q?PywKblqhrjDUJ/q8nbzDb2zRV3ob21P7YzVp21sBApruOARA+VWcMhZ6FV?=
 =?iso-8859-1?Q?cky6FucC4q9K1LFkCtU+qJJlhQJsHsLx+Ut4zQtkq4t4BQ/HVSsD35JQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b4bcd7d-e92e-4efa-0af4-08dbf0596bb2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 21:31:45.4903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xdx5/PY8IUKZaHfbC3/FNr9XYNt2whh5AzoBCPUwK5UUPcozj9C1rwVllw3JdVjOnM/AAPjfC9ZfEfpMcQ2KBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7548
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Rename xe_gt_idle_sysfs to
 xe_gt_idle
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

On Mon, Nov 27, 2023 at 02:22:34PM -0800, Vinay Belgaumkar wrote:
> Prep this file to contain C6 toggling as well instead
> of just sysfs related stuff.
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/Makefile                               | 2 +-
>  drivers/gpu/drm/xe/xe_gt.c                                | 2 +-
>  drivers/gpu/drm/xe/{xe_gt_idle_sysfs.c => xe_gt_idle.c}   | 4 ++--
>  drivers/gpu/drm/xe/{xe_gt_idle_sysfs.h => xe_gt_idle.h}   | 8 ++++----
>  .../xe/{xe_gt_idle_sysfs_types.h => xe_gt_idle_types.h}   | 0
>  drivers/gpu/drm/xe/xe_gt_types.h                          | 2 +-
>  6 files changed, 9 insertions(+), 9 deletions(-)
>  rename drivers/gpu/drm/xe/{xe_gt_idle_sysfs.c => xe_gt_idle.c} (98%)
>  rename drivers/gpu/drm/xe/{xe_gt_idle_sysfs.h => xe_gt_idle.h} (52%)
>  rename drivers/gpu/drm/xe/{xe_gt_idle_sysfs_types.h => xe_gt_idle_types.h} (100%)
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 551adbc22b5a..18410dd9cb10 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -61,7 +61,7 @@ xe-y += xe_bb.o \
>  	xe_gt.o \
>  	xe_gt_clock.o \
>  	xe_gt_debugfs.o \
> -	xe_gt_idle_sysfs.o \
> +	xe_gt_idle.o \
>  	xe_gt_mcr.o \
>  	xe_gt_pagefault.o \
>  	xe_gt_sysfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 0dddb751c6a4..b3686c34477b 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -22,7 +22,7 @@
>  #include "xe_force_wake.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt_clock.h"
> -#include "xe_gt_idle_sysfs.h"
> +#include "xe_gt_idle.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_pagefault.h"
>  #include "xe_gt_printk.h"
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> similarity index 98%
> rename from drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
> rename to drivers/gpu/drm/xe/xe_gt_idle.c
> index 8df9840811cd..e5b7e5d38e76 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -7,14 +7,14 @@
>  
>  #include "xe_device.h"
>  #include "xe_gt.h"
> -#include "xe_gt_idle_sysfs.h"
> +#include "xe_gt_idle.h"
>  #include "xe_gt_sysfs.h"
>  #include "xe_guc_pc.h"
>  
>  /**
>   * DOC: Xe GT Idle
>   *
> - * Provides sysfs entries for idle properties of GT
> + * Contains functions that init GT idle features like C6
>   *
>   * device/gt#/gtidle/name - name of the state
>   * device/gt#/gtidle/idle_residency_ms - Provides residency of the idle state in ms
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_idle.h
> similarity index 52%
> rename from drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
> rename to drivers/gpu/drm/xe/xe_gt_idle.h
> index b0973f96c7ab..9b36bf7db3a7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle_sysfs.h
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
> @@ -3,11 +3,11 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> -#ifndef _XE_GT_IDLE_SYSFS_H_
> -#define _XE_GT_IDLE_SYSFS_H_
> +#ifndef _XE_GT_IDLE_H_
> +#define _XE_GT_IDLE_H_
>  
> -#include "xe_gt_idle_sysfs_types.h"
> +#include "xe_gt_idle_types.h"
>  
>  void xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle);
>  
> -#endif /* _XE_GT_IDLE_SYSFS_H_ */
> +#endif /* _XE_GT_IDLE_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h b/drivers/gpu/drm/xe/xe_gt_idle_types.h
> similarity index 100%
> rename from drivers/gpu/drm/xe/xe_gt_idle_sysfs_types.h
> rename to drivers/gpu/drm/xe/xe_gt_idle_types.h
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index d3f2793684e2..a96ee7d028aa 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -7,7 +7,7 @@
>  #define _XE_GT_TYPES_H_
>  
>  #include "xe_force_wake_types.h"
> -#include "xe_gt_idle_sysfs_types.h"
> +#include "xe_gt_idle_types.h"
>  #include "xe_hw_engine_types.h"
>  #include "xe_hw_fence_types.h"
>  #include "xe_reg_sr_types.h"
> -- 
> 2.38.1
> 
