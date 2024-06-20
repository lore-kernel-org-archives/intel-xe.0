Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B35C27C79
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 17:31:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B822D10EB91;
	Thu, 20 Jun 2024 17:31:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZmdWKwfN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA3610EB91
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 17:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718904707; x=1750440707;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=M4lqwKeoHfNn4q833rPih5qnYbve7+dbI2RUIer9ShI=;
 b=ZmdWKwfNHmMHFlz3afOb40sLt2jiMdpZ57nrdKKTgZDCxwXt6sfHGawO
 A1VDXZc1JlExpXpyywQssM0l2obJ7KEXkJZIgsGnpjik0lxNXWjkTzOMU
 CWR6QL0Le7PiZSIgW7TASCFHdQrpSXXt4kZ06Y7HoDrtv5xVtTfmC5wRC
 KEXzh+ego9WS1Pok8KJT6InqPpHRuNW4WfJa9P4voJ6kg0YpEGzNrqNxy
 qCOMSKJAayWZKMXKO4nUd0zb+/ta43MJNaiSJzDpHXSfdGbSRMOBhwe3c
 CLH38wzuSIMlRzrgIdWmlLSi3oXoA1UgW0F0ztSomVZg0GAP3RXzMwUni Q==;
X-CSE-ConnectionGUID: ajnRXBTAQj+d9zR+83mDCg==
X-CSE-MsgGUID: SSS+5XHuQQmvfrTychCGGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="15882001"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="15882001"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 10:31:09 -0700
X-CSE-ConnectionGUID: /zQuIdS2RBO0cd9mrWcd/A==
X-CSE-MsgGUID: +RjPoJG/TpuqCwZvOFALvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="47489454"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 10:31:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 10:31:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 10:31:07 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 10:31:07 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 10:31:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2kxDWa7w0E7DmRFs6aXjaPQC9kgc8SWFm47ysEG6uAoH0yc7+mU0kj0Zos2AhUmvm2uwC3Xdg2ZM8iW+4i4rjzUC8EYhkmeP/aT17kHK8cbbrHrENFbABV6aVLicKpSGU5agNoJ/Q58wP7/3zA7KsM1ahb0I7u/e8ucP/QQgdvhIamA1hY1c6K8OIjx1SL0UQ+uYUmjcnvXW+NgS6qatPRn6WQdmSdcCZVb+xXETwsk+3o+ZceMfAIrWL+m8xyv2DAxoV8ZX3D81YvSSHuv5x1EcNJz4QJLR9MaLdD+ewJmYAEZsoIQk/LR5cVaTH1NsnEVuwcAEiixYJTw8Hs6IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1AVqLj8hS8KZ6x0qFmGNhXHj7S9qQhnuvxVuyjNW0U=;
 b=D855VxChNf69clTHR/zCD43dzMTkJVdRmwI8wJ3lxd8srXwk4bOBiFboO7jna6XKVM2tUhdAymdorjNH03oCNTId0c8fO85IXrFJOEJM8Ng9Pfmq37DrvjcWs/uqIujeWDYNiB9M9MuHbSF+5CJXShlqDabme4H6FHS3e/Oc6Tr/alWiOWrFEIiFQ47US1Uekxj9Gb2JAQF3GsIR8/npv2ZSXcvh1ddxRlYs2EKlJr1++VywZh7fccr4tbX5Cq4moNOADtGW/VZydgmQVuLHdvQfz9ZvV131TjNWWYFqYOh9UaQtOtCFYLUgixIDp2SSX6P2P037iSGvB1K+ba3nVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB7062.namprd11.prod.outlook.com (2603:10b6:806:2b3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Thu, 20 Jun
 2024 17:31:05 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7677.030; Thu, 20 Jun 2024
 17:31:05 +0000
Date: Thu, 20 Jun 2024 10:31:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/9] drm/xe/vf: Don't apply tile workarounds if VF
Message-ID: <20240620173102.GU2905419@mdroper-desk1.amr.corp.intel.com>
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
 <20240619214557.905-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240619214557.905-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR11CA0082.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::23) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB7062:EE_
X-MS-Office365-Filtering-Correlation-Id: f3007964-956b-402e-c9ad-08dc914ec39d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nmK7vQZH1TNgLvDJLk74shho285eJL7G5NOlmSMPXS0sSOOo93dMtuApO+95?=
 =?us-ascii?Q?cG4mZwMo5YH6rQoHCiyLXom236iNi+n/Zu3R2OMlT7qbaClv/Uz1UedWK3mf?=
 =?us-ascii?Q?iJq90Lw6PKW4z3QFQEBWLBSAgFDVvrbwUZPw8s7+QAwFu4TWy0bOH+UOH3Th?=
 =?us-ascii?Q?GzGSXZ8qgOWBtQoIpkAqEHhKXPnma9KwsVY8KlzRE8tcOMIhwEojeetNMXzW?=
 =?us-ascii?Q?pnAy+CL0kaakFiSuM4/8q7DepN7C8RWH++zVdTNQDWLQVOyPLp0vaOik36zm?=
 =?us-ascii?Q?4Ok8Uk+IRSPs6BLR3zUmdsxiCQ/YcLwq/Hjrpx+INLJiN+D7aVs7FCHDO+P0?=
 =?us-ascii?Q?g8/a2no+1ph4I3bt8EVQXiZi7FxD+nh4muvglWbxQf3j+8nR1dzyz6OrxNrO?=
 =?us-ascii?Q?4T93O8bK7si+FiFzYeQT4Ov/GNx4kniyjCAsM/sYec286dhiCleZ6y/iC5Z8?=
 =?us-ascii?Q?mIwEjYR0P0rS5jvrB6fqZXtUKUKfv7bSn80sHMcw0LuhMlF2jtlf6ZuRI8Ob?=
 =?us-ascii?Q?P/o4niGmHYktKLXD8bMCO7Jp+IeRx6UonvtAuwTv3BMLRrXw5laL4RVR8lL9?=
 =?us-ascii?Q?TKcK3ENj6wyxjOkYhA51HAHlL/SNdMvxPaWvWNau49uD1l3bmbOO5M9dfhOt?=
 =?us-ascii?Q?OzpGhUnUSnajOjhQBFPumWeKxOIEV7A4e51nFFYYSsyQSLIoZ2RXXNsfBNEc?=
 =?us-ascii?Q?FE0Qg9Kf7xe4Z84jGjBZTFtxOCz8C/TOdCiVtpnd/y/tO4Ogv8jqkjyCeESf?=
 =?us-ascii?Q?E8SdzM7RGRzNIQ19qSARgMRqtm2aGVMXOI2lw0Sf+B4dFL8Ro/61QT3gL3BS?=
 =?us-ascii?Q?uVS8QGhD8dPl/cEjUBErLpvmrGLwI41uCMVp+yFKqda0Q6lFIR5DMkbHAWJM?=
 =?us-ascii?Q?5vgysI9rcJkKWN9cURgqYjQ1pDUrgKeKNX7mYAw8j9KAB1cgUdAM2zgvz00K?=
 =?us-ascii?Q?bH4RTFS0qihu7rovvkPalCqg6Nj6zfvggFLsnQ6n/fi7cY6cfDCYLd5DXwy2?=
 =?us-ascii?Q?vJPe9BfqtH8AGf5XgtCO+5vvFyND8ULvjRlIp0t0jnK0w3hV4Wbox2dolEbT?=
 =?us-ascii?Q?K3OOUI781vvAnzPdCCJukg36NRlpegSx5Gr7+MLocUJYvWCcr2jRU75O1wWH?=
 =?us-ascii?Q?qWAKy/nCTCvQVA7dc+DfoDsTumGHCgECWVOtGKBeU5nMJxN8CGj51qs9Ootm?=
 =?us-ascii?Q?Ea5GtYGbL5IxzUhOnveS77BTrbOSTVGKtopDU3L+acfTICHTQQ+fR4z3Ptzs?=
 =?us-ascii?Q?TqOU9vO5hznwzIi7lTL/Od6HLQd2G9Ty70zr0OHZPnm2xINrgKvp45rz+r6J?=
 =?us-ascii?Q?LKY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Yx1xcK13i1n9m+faTfS0r1PHQ3nxIIqwUQ3Iw6N4v/+cNQIh2MkSF8CWBhax?=
 =?us-ascii?Q?2WZUgiEww0p0YtusDF2lHjiIYGaKrHRW9lOY+6bNyGLQfcjmOMCcsIh3kLPW?=
 =?us-ascii?Q?JRTy4IThWU4mIdcNnBl9yOxC/BeP2cLhFc55iYuRLAxwBXtb+HP3w20YfK4w?=
 =?us-ascii?Q?ToslIM1R/sxvQ9lUW20lyLTEaL/ARQZX/4N1btGzhgX4Z+Oa4xPjjnUi+ej0?=
 =?us-ascii?Q?wuNxhYsLDZc0mrzmsgcFlW2hcCH71nCFVX+zVmRRP9V8KhcjltIMnBCA1k78?=
 =?us-ascii?Q?Sr2ftIijgZmPCMuvZjSHnRoJ5aFzXZe9n74h1rOzFhuAu6yTmPuUbPl4D0w6?=
 =?us-ascii?Q?p5E7bmcmWi26aegGAZ6A9kqxFmJ2qsx3t2GzysOZagTU+s/EXev084yD1SE0?=
 =?us-ascii?Q?FdvPvCZaPRwGk3+iIkAcGJGPNW6Dau07dY9hVt9xYgkjMqLDKJcCmxwiKAq6?=
 =?us-ascii?Q?5LEQLyNGSb1wWgBhGzz6gQENHtBwebqAcPUK0UhIC+jPgAmPJV9N6Asw1XA5?=
 =?us-ascii?Q?yV38KBULZmGC/cwt30zE+nRb1ahSOgB04H0wDQ+od7mk45/krJppymwqwcPb?=
 =?us-ascii?Q?L9sVsefFR/8jxsleQ3g88vhlbTK0l2J6o7MUJOZQ7JSm0cgRmpcyFxl/E0YA?=
 =?us-ascii?Q?mphOmEuvO673UXG1L/o81eHM6pKjaWVfvGtrJSFZW7aY9gHy5DF9PtvEIslU?=
 =?us-ascii?Q?3B19kWzy4eMFcZMwjdMrfEU9d28ip7je76pGXb8XobJD2AbnBFefcTRG1BC7?=
 =?us-ascii?Q?94FcXCP4So2kcB2nGK5lyEiglq33kNS0wGKiMXXx3FHlbdAEEnfPGZ8n66GF?=
 =?us-ascii?Q?f5qoMENJmaSMM2c7aXsXZ17SMccCFzxRH4GMR1v4qUd6yPlAHrsR+pdpq+UP?=
 =?us-ascii?Q?e9d6Hw5T99O7HunFKz1uIBhRIhzGWgWos3KsLzkJ5L6NIw0+WDYQxiVxY04F?=
 =?us-ascii?Q?M9qLOWqd/zVIIJ17u88a39aN145sZghNzdPgXCgHy0E0kV14D0E0r+7sUlpp?=
 =?us-ascii?Q?9wUo4msdbOVKkgiCSzUNxC6CPmUKjQ4+7ENphYVcX6Ns3aHqdhxlgxfu9ZWN?=
 =?us-ascii?Q?K59IXODW7ybpL3BKWTNIHa5Rzuva/KlS90tU2tho762TEa+6hs4pcJZ0Ugr2?=
 =?us-ascii?Q?ypKh93+KkOhhkEVEv6Moa92b5jaN+SgJ34TTzcJbbPlKibRRUK4iODUltmxI?=
 =?us-ascii?Q?Z9iw9ej5ar7ZArgJ9iIzfR9KeeeOGrPIdhIjBup1IsdJFeou/Wyrri1/eWIL?=
 =?us-ascii?Q?kYMdqfwirN/e2Otx2ql3E/PKmOD8S94SJvkZdXeKzaijwTBK74giK7/cZAbc?=
 =?us-ascii?Q?AOL54yAzsPvlrN00ssfC9nTXD78/gFabk87EbC39ZQlDeAY9Ijdy0J86yZMv?=
 =?us-ascii?Q?gM3qwo/Ojc2XFMs0PipK1x6IUk6AqNmgSiuH0+No9pnKpMQl8Lr0P9d3HVpC?=
 =?us-ascii?Q?xGFdMmbZvjFu3ZwOPxzeVwXRAWZGmvGvknUP1B7m5DYpQemweDu0FFfsY9bq?=
 =?us-ascii?Q?58gOqwvHj3FWmU7bsUcnX8p4D+o4K0zxsdSQ7soJyp4U+s05mLxCPwB19dCX?=
 =?us-ascii?Q?ZoPMSmErbvf/30pQ3XrHHFTMmbXYxTQJSU7C6yOefmmwpc//h7J1JaT2vksh?=
 =?us-ascii?Q?OQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3007964-956b-402e-c9ad-08dc914ec39d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 17:31:05.6214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JVP5opRj9rMWDw1OM+oG00EDwkHxUzYJ8U2HI5hDlkrDogVi1uUgAANtmbiJdTRXajk1iXqqnhhr+mJptkdAqL3EDSdPPpnJjhtDmwVshQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7062
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

On Wed, Jun 19, 2024 at 11:45:51PM +0200, Michal Wajdeczko wrote:
> The VF drivers can't apply any workarounds as they don't have
> access to related registers. Since xe_wa_apply_tile_workarounds()
> function is not using RTP yet, we have to add early return.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_wa.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 0b6fbbebc41e..73dd06ad50f8 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -21,6 +21,7 @@
>  #include "xe_mmio.h"
>  #include "xe_platform_types.h"
>  #include "xe_rtp.h"
> +#include "xe_sriov.h"
>  #include "xe_step.h"
>  
>  /**
> @@ -865,6 +866,9 @@ void xe_wa_apply_tile_workarounds(struct xe_tile *tile)
>  {
>  	struct xe_gt *mmio = tile->primary_gt;
>  
> +	if (IS_SRIOV_VF(tile->xe))
> +		return;
> +
>  	if (XE_WA(mmio, 22010954014))
>  		xe_mmio_rmw32(mmio, XEHP_CLOCK_GATE_DIS, 0, SGSI_SIDECLK_DIS);
>  }
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
