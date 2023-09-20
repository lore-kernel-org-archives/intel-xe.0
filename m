Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33B4C2FC09
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 21:55:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5B910E082;
	Wed, 20 Sep 2023 21:55:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46FE510E082
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 21:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695246948; x=1726782948;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qiwmr3+Mi05i2XdZk8Af2YxEZOsT1ljsXHZqjk616dg=;
 b=QR+r5m4Atak36+vQmALLyhMPU/M7NVU+h+W9hclQp3gnDaVj5R4rfkjY
 4TyFmlNxZQMji9MgokafIKgTtxHYzE5H+Y3N1P/Kz7xa0QKI5hqKWOrfM
 I6HvdXhQ+tF/DCwwZdgKZJEwCO64yZJBZRZnKMSgFVXS3s7XKCrcdDFXY
 Uzc0xjU0V3JteblIvrXric6n2/saEc7PxyA9ChB+n9LjqQH78pJhRyHNI
 pEyMQgHtH+z7IVTVnOkOHyE59gQz8KWoSvpP9qDSUo1nUXiFoGJrk7Gr4
 zO88IaYJ4QA3oExyPMztgi7Lj3a+hsz2nEFgHFrW1Q7TV2ZNB/Gk1Phel Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="466659089"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="466659089"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 14:55:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="750107762"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="750107762"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 14:55:47 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 14:55:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 14:55:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 14:55:46 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 14:55:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikan+hu1G31sSMdPcf75kcLsFKbyLG4bDb739+SkV/xO3R9/L5mV0ZpYyAw1DdQa+1cSwWSxudljEW/9OO0NAmqeAHbQW+s5Km8Nk5i21NT/n+PH1nfJsx/Oh72X9Zwr+edhTcNmfNUJJXqcaaJRNeJLbstYowIMBVoRyA1zAI/mC4hFYJspKw23Wp6kQqTwRxo02A1Htj/WssooFKgvVyh/BFVW+HJHcxfUcRUWog3dXS3tynw7JKUNLRSYC/v6Z1Yi3vbu3ZG7dfn9JPFOsYC6DnsGP0BrjzZ2rS6W4GhjNIah9XKXfA2yXewqNoUzbf7PCw6BHGtMbIaebqGDwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rkm5QQuUGpoIoMljchbtB9rwUpl78/ap+UFcVq7rl0=;
 b=cKvw6y7vLfKXTIvKF9+LVHoEA8j4X4MvleOBe5EjUHc2lglMPnKAwR9u1QCd3lTBjLRq13FG/YZ+QfjONep3lsQhiehWmho9M9KIO9Laggzj+ssR0X/7ja41OwujVEvnbCyhVD7SHbEbJQXLf/pEbn7OhWFoWdRAwZqM9x6NvAJ0E+pOdnoYD+TptTkLeo8gaiUos6Or1iAM8s09x6OM9zZkZGJq75vZAZ3bijWUevJnguLJ5hOAruA12vfVFq2oyUQyRJbHheDvB06zOHD4PVnd3CtnvskuB7+/k6tXK8vhDyE+q6d6jVaHxYYIMq+fO2Aa9V1tiT8bzw+2qeRyrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7356.namprd11.prod.outlook.com (2603:10b6:208:432::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 21:55:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 21:55:40 +0000
Date: Wed, 20 Sep 2023 21:54:28 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZQtqFOiWZTlNkTSi@DUT025-TGLU.fm.intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
 <20230920211455.GJ233750@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230920211455.GJ233750@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7356:EE_
X-MS-Office365-Filtering-Correlation-Id: 12c22767-348c-4961-fa69-08dbba245449
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1F0aEw51RnhXplDGPrztYw4OUoJ1srdd/rvfcd050DiNzWloGUfBtgJu2Tov6Oia1pyAwde81+2XnJNKcBxVQWkR9qF5z9Fi1fe2uvLuAGxlqIWRIsicqUoBwpHYx3CEJSd/bcJzhLNhkITStj2HR0fgIGSsy60mZNlKwzRymwPT34GzNi283xe7FNJHloevTYTvh2qiK0RwRW/8Br+Kc/46+iv5YLGnD+eJ6gAcfqd4QnwlymzzJNeNVHea8AfDJOqJXRa3XL0TlZqG6xRTbBdMRhEsO8A+3C47vECt2flZpgChaZZMgyHEXJbIzJr9EdxY0kaFjo/xsmMMSay6C/pn1ZyUCuaFAFA7DwA4p8Jmlp+u/ngVPKAMqndsmp39v6FZ+Q44Qe3YJO6yVoeboBd8XwiXxTWv/G/1IFB2DRFWhg4WOqbNtA3sdCrc3zGYkACVKBrMMs++EjCQB22Is02EJLyQzHq5dXyfAJMIH79NCBZ0HU8Fi+NlVRR2eqYvENoiBoPnKOjc3Lj/3LPjXgrFmt194zz88kh0HVg0Lc7NepeRg/qoNywwWMJTb3NiiX0t4xNIMWd/gXyCmm1aLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(136003)(346002)(366004)(376002)(186009)(1800799009)(451199024)(6486002)(26005)(6506007)(6512007)(38100700002)(86362001)(82960400001)(83380400001)(44832011)(5660300002)(478600001)(966005)(41300700001)(6636002)(8936002)(66476007)(66556008)(316002)(8676002)(4326008)(66946007)(6862004)(2906002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KpvSN6/Dnpz5ZcLbi2bxMVdTV/z2RHpFy/TwLdVDQ6DpJuXPHi7pyILvMFJF?=
 =?us-ascii?Q?IRNSNd6OH1U/oMTkfblaJpgHeLO2wC3WlQdGys+9V8loFVd2/gJFC/xdTrCo?=
 =?us-ascii?Q?AIzIq+LQEDcV8biyOhabqHPy3K+A7Vr6Ck3Dl8ZMAZYZh1YlE+zn61Xgb3Uc?=
 =?us-ascii?Q?jjA2kupgj6mHJyFZqkspsjPJuCIQPtL0p2fgiI/QDWGii1BgOhSVIGPm5tnW?=
 =?us-ascii?Q?WOtA1S6GTwjyMhCltgXWskpDxDxE9kbY76IkwmfLLcH5IXrkHJz/EczVIp3t?=
 =?us-ascii?Q?3nn6PJjItfzp1pPxI5Ekopa7BvDRTnxxizRpC7wt1jjvK9f6DSapQhwhBblX?=
 =?us-ascii?Q?kP80ms+xmWxQZfD74YOv5n55UDTB1zrzJ1j4oliT4bMmgMior+92WRByTEvD?=
 =?us-ascii?Q?Vgvvwc0+p5O1uEob9wS12EnE4+FIwmHj4CAiub8TaKXRb5KFdun/epwTXSCZ?=
 =?us-ascii?Q?aPpjHm02vCsxGJaMl0i+N18H0uVET//CLugXyZX+6UEyGjcn1jKuetZS1/m0?=
 =?us-ascii?Q?oova6+/SVQo46yzYJ6f8yoJRAAL529c0ssR3D/6nyIEdDeGnml+zoSr+oRox?=
 =?us-ascii?Q?K4s7UMTiRjiFMrR3SIkpA7MCfFO9UToQu1h4IvNGxeNCRSMUAaDxQK6FyVIN?=
 =?us-ascii?Q?LbPvYhiCs/RfXMmcObU+b80jy7ER0RWV4IoTG6gKcWvgLWfdDYiCCd5sxTbg?=
 =?us-ascii?Q?y0cG/HrPmhKwBHIOea8107xKawfl6EBGoMkR56p0Axh8JgfUoUVRZw47FqaP?=
 =?us-ascii?Q?NVDbJGxRYHi1Z6hlg9AFdvY7yOxLncEFZaBtbUbYOmlt+SymEstpnoRqbcKx?=
 =?us-ascii?Q?5cCp7Kp4uHNddZmr8HRPPIUxJARIo9IJDPgXYXbaW/EfOalqW1cFuj1vjqqP?=
 =?us-ascii?Q?mhi/n3ThlQfLXx4HkuF+Xe+OVRL3lkEWoPxTnqcde/imPjsUeX01m0S/+sJU?=
 =?us-ascii?Q?VP5NLkMKBr0EY8SAG7mE4zFLsq3YIdBsc7ORYPGjXg668tbREcAH6aDxRKy2?=
 =?us-ascii?Q?Zgo3+kPogzSVDeX0Yo+Jwl9nge0Q6fHdb6BesYjBHQTmzwi2SVxfHSNEzz8Z?=
 =?us-ascii?Q?gq8d79NhAqjxZn6ak52HjcNeHidn/88PNFRRTvKaaiRHw7O8pxb1H5bf3rI4?=
 =?us-ascii?Q?my3vVPcwn8i4/935xOVO59B5q8ROJsCuPyV55axniHA5dLKzhFduwKukBN/R?=
 =?us-ascii?Q?9WgLLBuqThN51N2m+U9iKoKT8din50WUXm+lwpo6qhAhWCM01YPr04XQwJuQ?=
 =?us-ascii?Q?mnBkciRPoeIDhN8Joxs463XVleNSUw20Pk6dlfJ6uJxygabQAKCHmXCGoxMq?=
 =?us-ascii?Q?4nhLzZUIpdV72u2zsHrgz8isCgR/P8GwdsR6+afzPRA48aLBcqVyfywrXEPj?=
 =?us-ascii?Q?pyjQ/eZ4j8iy1wI3cUhV72rgFgDngrtcBpKs3Cy5UOWxPOnUo0m9YbKMOSQY?=
 =?us-ascii?Q?S/uYrwAP1xGjyC7DFthlRVD8YJlSCtygjNo07Y9bGSkeVsARfDmMHmACxc1K?=
 =?us-ascii?Q?jbd3pk+HmgMAdVnb2k0311TzZr8RQ3tNrjoFl8HPiwMGJqwvEORCZCsQMR60?=
 =?us-ascii?Q?vAMpMTZ+CyR83gj+vBvVa8XrUMLwmERhACrsK/LjPEp3y7yY3ZdYWKSwCWC4?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12c22767-348c-4961-fa69-08dbba245449
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 21:55:40.0932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hwjBOV/DZpshbTDkS3VlyGiGauW2I9xFsYbjnu1T5oKqIsD5Tega4bZYX1HxomzWSGMDSFq1Nf7+qfL3SguRbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7356
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 00/20] uAPI Alignment - take 1 v2
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Sep 20, 2023 at 02:14:55PM -0700, Matt Roper wrote:
> As a follow-up to this series I just noticed one other uapi thing that
> doesn't make sense:
> 
>         struct drm_xe_vm_madvise {
>         ...
>                 /*                                                                                                     
>                  * Setting the preferred location will trigger a migrate of the VMA                                    
>                  * backing store to new location if the backing store is already                                       
>                  * allocated.                                                                                          
>                  *                                                                                                     
>                  * For DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS usage, see enum                                           
>                  * drm_xe_memory_class.                                                                                
>                  */                                                                                                    
>         #define DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS   0                                                              
>         #define DRM_XE_VM_MADVISE_PREFERRED_GT          1
>                 /*                                                                                                     
>                  * In this case lower 32 bits are mem class, upper 32 are GT.                                          
>                  * Combination provides a single IOCTL plus migrate VMA to preferred                                   
>                  * location.                                                                                           
>                  */                                                                                                    
>         #define DRM_XE_VM_MADVISE_PREFERRED_MEM_CLASS_GT        2                                                      
> 
> memory-specific stuff like madvise should be operating on tiles, not
> GTs.  From a quick glance at the code, it seems to be comparing the

IMO we expose either GTs or tiless to the uAPI not both. This includes
the query API, bind, madvise, etc...

If I had to pick one, I'd say we stick with GTs. Internal we then map GT
to a tile if needed.

Matt

> value it gets against tile_count (which is good), but we still don't
> want someone passing in a GT ID instead of a tile ID for something like
> this.
> 
> 
> Matt
> 
> On Wed, Sep 20, 2023 at 03:29:20PM -0400, Rodrigo Vivi wrote:
> > v2:
> > This v2 has 3 extra patches that was missing on yesterday's submission.
> > But that aligns with the IGT series sent yesterday.
> > 
> > Also I'm glad that Mesa reacted super fast and we already have the MR
> > ready that aligns with v1 sent yesterday:
> > 
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25300
> > 
> > Thank you Jose!
> > 
> > v1:
> > As a result of the uAPI review efforts started by Thomas[1],
> > we have identified many updates on our uAPI that would lead to
> > breakage in the compatibility. What it is not acceptable after
> > we are merged upstream. So, let's break it before it is too late,
> > and start upstreaming a good, reliable and clean uapi.
> > 
> > Most of this work on putting these patches together for a single
> > shot was led by Francois.
> > 
> > The IGT counter part of this series is available as well[2].
> > 
> > [1] - https://lore.kernel.org/all/863bebd0c624d6fc2b38c0a06b63e468b4185128.camel@l\
> > inux.intel.com/
> > [2] - https://lore.kernel.org/all/20230919142000.91363-1-rodrigo.vivi@intel.com
> > 
> > Ashutosh Dixit (1):
> >   drm/xe/uapi: Use common drm_xe_ext_set_property extension
> > 
> > Francois Dugast (5):
> >   drm/xe/uapi: Separate VM_BIND's operation and flag
> >   drm/xe/vm: Remove VM_BIND_OP macro
> >   drm/xe/uapi: Remove MMIO ioctl
> >   drm/xe/uapi: Fix naming of XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY
> >   drm/xe/uapi: Add documentation for query
> > 
> > Matthew Brost (4):
> >   drm/xe: Fix xe_exec_queue_is_idle for parallel exec queues
> >   drm/xe: Deprecate XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE
> >     implementation
> >   drm/xe: Rename exec_queue_kill_compute to
> >     xe_vm_remove_compute_exec_queue
> >   drm/xe: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI
> > 
> > Mika Kuoppala (1):
> >   drm/xe: Extend drm_xe_vm_bind_op
> > 
> > Rodrigo Vivi (6):
> >   drm/xe: Kill XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS extension
> >   drm/xe/uapi: Document drm_xe_query_gt
> >   drm/xe/uapi: Replace useless 'instance' per unique gt_id
> >   drm/xe/uapi: Remove unused field of drm_xe_query_gt
> >   drm/xe/uapi: Rename gts to gt_list
> >   drm/xe/uapi: Crystal Reference Clock updates
> > 
> > Umesh Nerlige Ramappa (3):
> >   drm/xe: Fix array bounds check for queries
> >   drm/xe: Set the correct type for xe_to_user_engine_class
> >   drm/xe: Correlate engine and cpu timestamps with better accuracy
> > 
> >  drivers/gpu/drm/xe/xe_device.c           |   1 -
> >  drivers/gpu/drm/xe/xe_exec_queue.c       |  99 ++-----
> >  drivers/gpu/drm/xe/xe_exec_queue_types.h |   6 +-
> >  drivers/gpu/drm/xe/xe_gt_types.h         |   2 +-
> >  drivers/gpu/drm/xe/xe_mmio.c             | 102 -------
> >  drivers/gpu/drm/xe/xe_pci.c              |   4 -
> >  drivers/gpu/drm/xe/xe_query.c            | 186 +++++++++++--
> >  drivers/gpu/drm/xe/xe_vm.c               | 221 +++++-----------
> >  drivers/gpu/drm/xe/xe_vm.h               |   1 +
> >  include/uapi/drm/xe_drm.h                | 322 +++++++++++++----------
> >  10 files changed, 440 insertions(+), 504 deletions(-)
> > 
> > -- 
> > 2.41.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
