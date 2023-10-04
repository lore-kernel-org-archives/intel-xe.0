Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF40EE7C4C0
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 14:23:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 783EA10E136;
	Wed,  4 Oct 2023 14:23:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4AA110E136
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 14:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696429406; x=1727965406;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7LdeiUkKl5+jwvw1x7s+RBlwJdcIukTbhsP2nzim0YM=;
 b=htp8y9hmHW22ptxHvTrOaZdRQHNQWsBXaAuqicMz550mABPd6kCs8wjB
 zlEvjnGtrnRN1yzMMNkbdHjrsdE88j/7RbWSBats7IvuKso2uDwBJPgna
 30QjHU4kaBOw21qqn9nwezjcKOnvFIgHm5HjJPQYoWGVvZVLpaY6/0g2z
 +x8rno3yg9UZp6+8saljEKeadHIeVgdH4sVWIBwKXhh222956t3cS49pG
 jUn+U3FKkzNRAWer+ThFViMzwLE7iqAEMWkT7vJR6RrQrp7k9WaYJYjYz
 0z9M8OWMoINETQetH+Uex9Fk5j49oGQLfL06z6VdjZIwd/zTPqNpP6JVW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="4743243"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="4743243"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 07:23:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="744992584"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="744992584"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 07:23:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 07:23:24 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 07:23:24 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 07:23:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUd8pfuwuKWFWiYqNo58v6m3G23zxPWkLelbJRcLppi3/qk3Hg9epy1MRwsLBAslcVhsJJAV+am0QlfpDh/h6wIcnR4tDAj38L0Zz+/l2Tn0Vb/QxXflU4xSYyqmRjDnw62Lo1a8i7OEuyWj6lHyjiU7UPlbe8jVabMASQT7haY6WTglgYHYg9ql0BC1dlWKLrxJNN8WoIGLLysOoIfesMK9P0VXH/SxXCEM4toN5YI6MZYCIzmvs9xtWB/C0eV8KWaGymy2HPXqtyKKRCziHiYaiJTL1YtUpuw853ZSTO6aA+hVsVQJEOtUaDnAQgw13r7338F0e/OBJ2FYNSchrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIGaJroxwWPe3UyYOJ0mhX7xjdbL3EsdgFqXG//mNgc=;
 b=nkLGRHQjpgDwlyjpZQV9ptNQFVwjDUbQC+XU9SYI3OpiI4ztvJ4+23RnoWTxbBO4lDhl0Z6ejJt3n+XVNBB1R+d6rC6pu/mjWSu8QBfn1oJpvMjeSgisnTXcpWynU6StIT9PlH7yrqz5reB0XaLVKTrjRbwK9wMzx5Yb25B4ccUVo9br11WqMuQY309rTveGxAdVwe5FgYPrFOwv0JfCMXP+gwZO6GRFDlM/ZJjXKUasQcWFbC0kaZmzqgNgd/Y8FYOsbviI9dd6yCkef2wWTVcZjrOlsUynwAcZyhHVMKqPCq1Hpvy56GGJ0QYNsDcDYeQv5c4H4s4oAtoBYXnE6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA0PR11MB7211.namprd11.prod.outlook.com (2603:10b6:208:43f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Wed, 4 Oct
 2023 14:23:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 14:23:21 +0000
Date: Wed, 4 Oct 2023 10:23:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZR11UUIaG8+ruSqS@intel.com>
References: <cover.1696343521.git.jani.nikula@intel.com>
 <e40596b157f7689f2870b074b7a1cdd9696f70a4.1696343521.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e40596b157f7689f2870b074b7a1cdd9696f70a4.1696343521.git.jani.nikula@intel.com>
X-ClientProxiedBy: BYAPR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA0PR11MB7211:EE_
X-MS-Office365-Filtering-Correlation-Id: d0843303-6221-4ce1-e45a-08dbc4e57463
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TU9bGVf+l4WI6WNhu2x4tUA156VibeFktB8AxtUaJU69Yd2IH0ClEbnDYMvWILchuMGr/vmGmjTzP9MAMx3Bkp48hq5cLjqJfdIoZgaN9PGQgSzkVB6L8OnTzaZ+Kz+PVzWyIe0QsotCSqjJdNzq33WL4YT2Iq63RDjiLxnXZO7Vs/0O68xyyFng9dBPbc0C/HEfPb0/4nP45Qmb/bhpc9YCsiJnsmk4NjSUkA0dH+5mfnWFx6BrzoLQkHpYyontqtAYJoioYpEDlYe9bgKafy4dD+nx4Enfnbq/voYZktVPgw1MJDbCCzxhHh2lll2wqPrA2QW7PuapyVoqRWRXxv21yaERVOstwtSPdrOT9Je9S7v3w0qKk4EpD2bObwIeTAXKAeS2IAnZXL2IutbieOOeTkfuVW5dt94Kf6rw8kb6VpCVjtPble72VBUBcoPDt8oa/b6Pe0Xo+AYBwaehBsPECoP7wUXL8MWpT4AEK1xGZ8hvz43B7No+3qwM60mV1ZDf5Jhbjlx7LbaqxfJe+IBcBeAIIiw/gw9tbpdSDBfim3CswatmWejf09Aviv+y7e6t18TaPqDZHgkbXj+e9lU0HtY6IUXuIrESaYfpPnI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(396003)(39860400002)(346002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(44832011)(5660300002)(8676002)(2906002)(4326008)(6862004)(8936002)(41300700001)(37006003)(2616005)(316002)(6636002)(66556008)(66476007)(66946007)(26005)(6666004)(36756003)(6506007)(6512007)(82960400001)(38100700002)(83380400001)(86362001)(478600001)(6486002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ne1HqEdNacb0+wbyppr0SZAGAuQlht+4RA8vfeH8AjSO2GA9UyI/JTLExZzD?=
 =?us-ascii?Q?cFoKwKb1xiCtpZlGzqRod2k6J7+QU8a8k3VZIuyVujTwG8RTbWEh1qeks9Zc?=
 =?us-ascii?Q?mSdaxE+j9phD7ZSCFRwYIb8DlFr+WRSfsPVJ0cnOycS4JI6rmj2BAOjXeJsB?=
 =?us-ascii?Q?nx2nYaqzbF9hiEcV3gYRzNTE4lJNOL/GLFhNV+CRpG58PSZwNvPWMcL1KpWo?=
 =?us-ascii?Q?45+XrbZCKJC53OJu0ZvEtg8MB2fw2FJK+IXD5dG5Bk7t2Ofpjk0eMBFn2rQ8?=
 =?us-ascii?Q?lP0pDYgKW+a0HsdyxtHWN7JszhCZ/vvCgzBMyul0G9s9QuQkZk4NtPkTK0Qi?=
 =?us-ascii?Q?jvfONPg/XcbyJymuMRsllslGBD2Pg3tMq1TiZTjd30cwOg5nM8YJWPV+8Qh2?=
 =?us-ascii?Q?OCSNbnTvdZiXjKynngwfLhDhP1B5ve93Euok/l/VzGOOGu30mPpJV4PAeZRj?=
 =?us-ascii?Q?QKlWrpAsJcd1Zem8+VXYKguinDbSNDJ3LHse/YJYI5sz8wPAkJERNOdnc8SR?=
 =?us-ascii?Q?G/L/jfjfqFCB7+NEsQtIW7DSA3DKn9w9+WX2zTm0cuHuXN0Qc9ySxffzZxld?=
 =?us-ascii?Q?exkjyVoRSM/ZTKJxlxxDEbZG7g8QdvjReCaQIP8Yj3YVNMeGt0UbVn6qMHrE?=
 =?us-ascii?Q?L6YOtV+Cs/j2wGibTAIKJ5TG/aSSxziyiNiIY08nAF9J3kzS1/l6jvbj3tTO?=
 =?us-ascii?Q?9DJoxUQrfB5/+qTrK7jwW7y90m59iYp63oqKf/9EI9smPrSKfdc5zQM2BA5W?=
 =?us-ascii?Q?YU3/kqOUos8WGPOVto/kG5KNJrJL/+RVFGEy3kORtJR8n9OpeXZBMWhN5dFm?=
 =?us-ascii?Q?dYtDkrNM/+VSMd+PmQpM6AihknvVs4IBxMvvYXSzFOnetvw6VvJsPLK/dy6A?=
 =?us-ascii?Q?bh9sF1CIpm0RGgeToNMW097xNQMby+EnODAkQLlBsbTV5CBv59cFDgKSUrbM?=
 =?us-ascii?Q?pOs7Ic/hyqgt7qep9chmaxWSt7i8IVgcupYQmeAWZWXw4p2GU6ZKu3iOdCIO?=
 =?us-ascii?Q?NMslPZH6vXEw44cCa+Qq2OMKGq+pnftFk9Dt7/tbL5PtNistt6baPBjzZosP?=
 =?us-ascii?Q?/ga8nbt1aVM4KhSfFDCwxWMrVY0NxsKJy2OTp/5xxTVBjG3PQLKsPVth+AjC?=
 =?us-ascii?Q?mpkOoggu/3nqRLkjB10U/uG6Aqy8qFJPUebRa0Ndn7wXecL5vgBw1VZLe+uT?=
 =?us-ascii?Q?n1+6n4Eyio5sJj3F+RWAGvb0HiHvtvdt1Hv2uE5yl/X8Uesic7YU5mM56+aT?=
 =?us-ascii?Q?ZT17lCUGhJoOeb0gPxfzDWjRinSRNU+2FwOqwOUOTz8G732szaTLzKBcROlx?=
 =?us-ascii?Q?NInMOhhnu50jvTzzPKCO5WA8JDuDtRgZgqH0v1puEqQLd+fJ9PY7VV5Z5Ddh?=
 =?us-ascii?Q?HPV5AGHChQew7oX+bZNE82nde8lylIXaJMY47kppVtCCJ7qML0JQo6lUcdg5?=
 =?us-ascii?Q?LjKWPw/iSZ61yj4ouYsJmHIIcWHmU5F7Q8fEBTibVHO5ZwzTCnX5eN2zI4H9?=
 =?us-ascii?Q?t2DCct0aXbS7DDZG6axFXvIYs2wq3OEWe8l9Hrg3SMerIQibM0/9wsj5VerU?=
 =?us-ascii?Q?/3uoXTgWVLm21QBkb6IW+9EuZPgkmpnf9gK+KBnLgEtZnA1V24TG6NjvjAmS?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0843303-6221-4ce1-e45a-08dbc4e57463
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 14:23:21.8831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6i5CZcKkDGNEE1BJCKcL9z6I6Anb/7vuJoqWof/9FPcsdFAxx93JXYe5WmVJjRnCNM6pHvmWWYR6AcW6kBIwYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7211
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 08/10] fixup! drm/xe/display: Implement
 display support
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 03, 2023 at 05:34:55PM +0300, Jani Nikula wrote:
> Turn the enable_display module parameter to the same thing as it is for
> i915: assuming you have display hardware, take over it, put it to sleep,
> and keep connectors disconnected.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h |  5 ++++-
>  drivers/gpu/drm/xe/xe_display.c                   | 11 +++++------
>  drivers/gpu/drm/xe/xe_module.c                    |  4 ----
>  drivers/gpu/drm/xe/xe_module.h                    |  1 -
>  drivers/gpu/drm/xe/xe_pci.c                       |  1 -
>  5 files changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> index e7c9b4ea2153..feaa1e244838 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> @@ -24,6 +24,9 @@
>  #include "intel_runtime_pm.h"
>  #include <linux/pm_runtime.h>
>  
> +/* For INTEL_DISPLAY_ENABLED() */
> +extern bool enable_display;
> +
>  static inline struct drm_i915_private *to_i915(const struct drm_device *dev)
>  {
>  	return container_of(dev, struct drm_i915_private, drm);
> @@ -89,7 +92,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
>  
>  #define IP_VER(ver, rel)                ((ver) << 8 | (rel))
>  
> -#define INTEL_DISPLAY_ENABLED(xe) (HAS_DISPLAY((xe)) && !intel_opregion_headless_sku((xe)))
> +#define INTEL_DISPLAY_ENABLED(xe) (enable_display && !intel_opregion_headless_sku((xe)))
>  #define DISPLAY_VER(i915)	(DISPLAY_RUNTIME_INFO(i915)->ip.ver)
>  #define DISPLAY_VER_FULL(i915)	IP_VER(DISPLAY_RUNTIME_INFO(i915)->ip.ver, \
>  				       DISPLAY_RUNTIME_INFO(i915)->ip.rel)
> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> index 391f08c1caca..75054f78d7ae 100644
> --- a/drivers/gpu/drm/xe/xe_display.c
> +++ b/drivers/gpu/drm/xe/xe_display.c
> @@ -29,6 +29,11 @@
>  #include "intel_opregion.h"
>  #include "xe_module.h"
>  
> +/* Only to be used for INTEL_DISPLAY_ENABLED() */
> +bool enable_display = true;
> +module_param_named(enable_display, enable_display, bool, 0444);
> +MODULE_PARM_DESC(enable_display, "Enable display");

there's a work in progress to create the unified extern mod_param struct.
But this goes on the other way to split the mod_params...

> +
>  /* Xe device functions */
>  
>  static bool has_display(struct xe_device *xe)
> @@ -45,9 +50,6 @@ static bool has_display(struct xe_device *xe)
>   */
>  bool xe_display_driver_probe_defer(struct pci_dev *pdev)
>  {
> -	if (!enable_display)
> -		return 0;
> -
>  	return intel_display_driver_probe_defer(pdev);
>  }
>  
> @@ -69,9 +71,6 @@ static void xe_display_last_close(struct drm_device *dev)
>   */
>  void xe_display_driver_set_hooks(struct drm_driver *driver)
>  {
> -	if (!enable_display)
> -		return;
> -
>  	driver->driver_features |= DRIVER_MODESET | DRIVER_ATOMIC;
>  	driver->lastclose = xe_display_last_close;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 7194595e7f31..82817a46f887 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -19,10 +19,6 @@ bool force_execlist = false;
>  module_param_named_unsafe(force_execlist, force_execlist, bool, 0444);
>  MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
>  
> -bool enable_display = true;
> -module_param_named(enable_display, enable_display, bool, 0444);
> -MODULE_PARM_DESC(enable_display, "Enable display");
> -
>  u32 xe_force_vram_bar_size;
>  module_param_named(vram_bar_size, xe_force_vram_bar_size, uint, 0600);
>  MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size(in MiB)");
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index e1da1e9ca5cb..58604ed161cc 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -7,7 +7,6 @@
>  
>  /* Module modprobe variables */
>  extern bool force_execlist;
> -extern bool enable_display;
>  extern u32 xe_force_vram_bar_size;
>  extern int xe_guc_log_level;
>  extern char *xe_guc_firmware_path;
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index b19506fe3e18..8ee430c6f8b1 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -575,7 +575,6 @@ static int xe_info_init(struct xe_device *xe,
>  	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
>  
>  	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> -				  enable_display &&
>  				  desc->has_display;
>  	/*
>  	 * All platforms have at least one primary GT.  Any platform with media
> -- 
> 2.39.2
> 
