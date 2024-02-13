Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59C4C4829A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 15:22:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732DE10E751;
	Tue, 13 Feb 2024 15:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Czi3/jEJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B18E10E751
 for <Intel-Xe@lists.freedesktop.org>; Tue, 13 Feb 2024 15:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707837763; x=1739373763;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5IkbN1+7Apa9d/+VVjVcr4my1nVqPHZ7oFaltPSYK2U=;
 b=Czi3/jEJzR8KFiCqsLHeEtrr8yGP5J5A8DzGKGRjH54yv92W9kE4hUJy
 HSHAmsbdAU4kZ7exqYl0blM7q4N47hys3LfiaNFu45ukm6X59QHl2c8fX
 KYN/5a5gOQptKTa/tNjFVE23YFSqjZ63fzDXvD7I/xiJwkdT7JtKlnVS4
 xqbr33gzojzRlkj/dm4u/vyzCY9z8mqzZtrFRNobURlD2v6yk0bjWtx7S
 zej5fnKSTrGFuWxKtFkT2Ts/RnmXx8Kiyae4FI1ZJDucigjbKPOpJxeXo
 IHfGpPJWVbFsMzpUxz/BuKKprxbrZh7qZteAasM5ClYirS2Zam+IJu6Fv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1728322"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="1728322"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 07:22:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; d="scan'208";a="40386728"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2024 07:22:42 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 07:22:41 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 07:22:41 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 13 Feb 2024 07:22:41 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 13 Feb 2024 07:22:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kzjdW7ZyF/7LOFjHOFvZvVE4AyGSWVOX805kyll6olMga6WK390Ky/NlYYZBvvKExtTdTqOfctYV5H3xFsec1MAbuo4FkQCtf3BZjYCnZWXvZ8V67aklXdoOafQWVoGsO4GfgP8bBBHQXtVZ2BUcfL4u+Yfxf5T2p2qA0jDxlBDeZmADBI9U8rcFjSsRqTMgRkjIzRk5BqLIKejm59vlxC3VBuZ9fboTwZ1QQ30hMqXddDAE8LFHDohREBve/sjP14103Xlny1fFl9VftjzaIAljlkGe+CKvMKzKGjFGJtKXooa1wxM6lQ7vMnct2M8uXRzsI0kNGV2yyD+aWcKW9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89CyLWdufFgqvMp/TmxtdcGyWCsN8+ksUDHbw3VxNA4=;
 b=L/Iqf7kfhDCxF15LpT2Ha8gbM1l8fFTweMcRmorZEIVBnPsVDUXZEBA7iUh7CzYrYhUPnOGhbXorTttapQt/rNV1/ZqoFlyZTilNxWr70d9xg+HAxMgi9TQBYqh+tQrW7UUXHv9IzO4kVx3qCHgvZkg29AAz9q1q4sjAufhE1VQDZAhB2rEs0IpdKL2bjlEiw2b/YpkaW3OahuyPW1wCX74d0yPJ87RZyl9j+xbFX8DQTn/kUn0ZdJdjt8iKlh01hzjuYwGxmX/+RJiqd7hFd0t3ow8jFZlTz+UKllsY0bYiux80h3tftCyNWujE/llvjR0eektCIU7H2pQi8YE99A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.35; Tue, 13 Feb
 2024 15:22:39 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 15:22:38 +0000
Date: Tue, 13 Feb 2024 10:22:34 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/2] drm/xe: Make read_perf_limit_reasons globally
 accessible
Message-ID: <ZcuJOkUkZnss9ttl@intel.com>
References: <20240213003426.3943662-1-John.C.Harrison@Intel.com>
 <20240213003426.3943662-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240213003426.3943662-2-John.C.Harrison@Intel.com>
X-ClientProxiedBy: BYAPR08CA0039.namprd08.prod.outlook.com
 (2603:10b6:a03:117::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6097:EE_
X-MS-Office365-Filtering-Correlation-Id: 75671df1-c73e-4474-5b15-08dc2ca79cae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cxKm+F/O5a15JClnGQOSxU+0/xDe0/LQQeYviA8VwNzaOE54mzcgp5KWXiVB+SR+Z0h4IV1Pj6k0AMCX/Z2h2wTqmQ6tjn4ABg1Il1cLkSmGPLZdd/HP3tmpKaMXKbC5XHIDeO8YcL8plMl3hn+YWOY+tgwZGL7gubHx8itESU6ZTbKqROechT+owPhUQgmWIeFi1eUKICVbDtjA3ST0b0lSzGOHOFXBpffOH2Pf8SE1azsGe4RxttGHT7kCM/39FztiGBQ+i7WSv2AK9vttQ7B0NpzxkMoPRHQbBnAiJTayf0eBJna6Sol/hufW+tPuEGj9ovj8VFiKAmgMYNS65XSlgdHTAkuXeAM7QbKxAjGwyCu/JWlAN1TOmC86w3wNm81X0V6xytf4QHJC/F2PHqUffRyAfSUg8gL/5zV9ur3Bg0OqU0RKSznlq1AZON3tEy0QFu1atB8imkas76Iaj8mX8WhqnZn3p+JH+4wSXshdA9xzvnegrzU2vuMfsPMcTwspzNFDQQaiX6BM4h4fYoJH6zsQuXGRVra74fz3RyZxoP5SDAxbkDGpDoaNL2Xk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(136003)(346002)(39860400002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(36756003)(6512007)(6506007)(6486002)(44832011)(2906002)(5660300002)(66946007)(86362001)(38100700002)(6636002)(37006003)(478600001)(6666004)(82960400001)(316002)(4326008)(2616005)(83380400001)(66556008)(66476007)(26005)(8936002)(8676002)(41300700001)(34206002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bf8UQD1+zNGU1syWn9CHGdFsn+Z55AC9dCGMdTSNrXT7W8U96WTak4gcnLLS?=
 =?us-ascii?Q?D6H40ifG4chclf3sgl1hwvxdG/aJ7e0HBx9Uizi+UpGz1K4ACCrJhOTRIQpQ?=
 =?us-ascii?Q?vGFYbtzpFOkvWgDnPmjd2rpkHTulL1BL2LsElUGNidUyKqMmbHDwg54cC5in?=
 =?us-ascii?Q?hL2xSBIUjjhfGWIFbJCp9P4DhXreo4LLCkcIyCx6OBb1vFILaHKGVTmVXDL7?=
 =?us-ascii?Q?VBu/C2mfZebKQcnmdOfE/m7gFCs+um/KX6+v9mCINZA+Vnx7LouUe0X51AaT?=
 =?us-ascii?Q?SCoI2qE0wmHqjHHm98y0FE4LL7xoU2nqUXcxQma7GZrPmQnBGyKXIKWKIXdS?=
 =?us-ascii?Q?Y0f260/1ys7MSeGZFOe3NvQlD0KTNXsM4QBpaJl0eQeKGzo35G1TPJ19G9Sm?=
 =?us-ascii?Q?SkCeKIgzMn6jVxvYhWx2smAdkGPJe7MJ6P0M72DuQcqfgNP+M6tQofzsEAmN?=
 =?us-ascii?Q?hP31g6TCMZTEczd/MasMB0sa0IHP+v1sCdcMWVhqRgxTlFMBfGCRKm1hFIGN?=
 =?us-ascii?Q?EpzC4D6h2IYSxHJx8SjJGT7z5YCE5aiOXs7nbmHWEJYYCbODYka+eE0iPJgi?=
 =?us-ascii?Q?HFQCE1LB8G1c1CLAOY+C+D5Z+qRbRuK8rIeKiWWYeQoWTD2GFJ5Th/kHy6g/?=
 =?us-ascii?Q?BGWi5ukUQM4z5bUbENSbOQq2n3+lG73T99iPGJq/1Ih6lREyDOtIbOcF3nWD?=
 =?us-ascii?Q?8jDN1hA2CuOs9A2wD6BpWFCIbvg9YFH8GA4qkfAVimEIDF/seqimYPGyulTs?=
 =?us-ascii?Q?5LJE+MM+G9hwuyc6S2zdpitjMMWwlR9YAJn8IriOcLjw8uIXyUBivoK5pPdO?=
 =?us-ascii?Q?LwKsRDauvovGrlBrdNm/+pT8m6NHMnMiuaJ54sdjVrCwFGBwT9NSJsmtUNw/?=
 =?us-ascii?Q?tB9wgpU2I4mJg2vMdbI0nZB0oOYOT2I2x+9Hp6AJ6+byBs9r5w98tyq68RNd?=
 =?us-ascii?Q?N61bLt5m8WYhimVl+0Vd4uLtkMmYJrdIGkzHQAby229DrdEQUcEVtJAIFFVh?=
 =?us-ascii?Q?RdAbVadOZEqxBuuOUyt+O/MQDPB1j7hcBvqA0eOPi3ybER7k0seGrilRbYmf?=
 =?us-ascii?Q?JeSiq8rpIU3JndSmqONbxsZb6J/s60FR7jGtOIMU1P2LdHiGNfi26slC63L1?=
 =?us-ascii?Q?TNjl52VwgJ42wtadMKX2VDdut+hqWI1ye1xJCccrJFKV5hD+H3p1xMACBsXu?=
 =?us-ascii?Q?v+u2pik6Y3MxBM3Xbn/3fyT6QpvOhWtr/0u+4CJZxVS0Z3vOWyAK9zJw17HC?=
 =?us-ascii?Q?dOAGh3ozDg7Qaq6EvCAnXkzaHI/8ag6WViumrE03nlsCjp8lyDloCN5Tpd+O?=
 =?us-ascii?Q?6NYUWBQ3kzJTew3jKaeZ2VkZuoWWqrkZT8pwrCTBFkxZrGB/r4WdeyXaPVTY?=
 =?us-ascii?Q?gDflpb04s9NAM96sU2+y6zwLCmu0O2GE1Go1IBU9+aOQ9gOAkpF6BsDqLCT8?=
 =?us-ascii?Q?IWlnF4STbsh8hgXLwkahwQV+AV6GMAuWNr10+h+DZd4aACZ0mFojaAczacZF?=
 =?us-ascii?Q?sekGmTXVcmyuWzy724jC+kxdAwgMh/FQPbe90O5zLz4kG+ocw2Kql1D+lSO9?=
 =?us-ascii?Q?yXBaVD7CzbBz6PEHmImM3ICzSGxpS8aq5MoJzcvH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75671df1-c73e-4474-5b15-08dc2ca79cae
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 15:22:38.3787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /rkA6OV2VHjfGmUEVdh4FPwEL8mu/cUD53gHeWK3r4sTUbnlQ1NaS5RSuSCeRfGgxL1WvPiAJfW23qxqpYIo9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6097
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

On Mon, Feb 12, 2024 at 04:34:25PM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Other driver code beyond the sysfs interface wants to know about
> throttling. So move the query function out of sysfs.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_freq.c           | 15 +++++++++++
>  drivers/gpu/drm/xe/xe_gt_freq.h           |  4 +++
>  drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c | 31 ++++++++---------------
>  3 files changed, 29 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> index e5b0f4ecdbe8..51645a24009e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -11,7 +11,10 @@
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
>  
> +#include "regs/xe_gt_regs.h"
>  #include "xe_device_types.h"
> +#include "xe_mmio.h"
> +#include "xe_gt.h"
>  #include "xe_gt_sysfs.h"
>  #include "xe_gt_throttle_sysfs.h"
>  #include "xe_guc_pc.h"
> @@ -220,3 +223,15 @@ void xe_gt_freq_init(struct xe_gt *gt)
>  
>  	xe_gt_throttle_sysfs_init(gt);
>  }
> +
> +u32 xe_read_perf_limit_reasons(struct xe_gt *gt)
> +{
> +	u32 reg;
> +
> +	if (xe_gt_is_media_type(gt))
> +		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
> +	else
> +		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
> +
> +	return reg;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.h b/drivers/gpu/drm/xe/xe_gt_freq.h
> index f3fe3c90491a..89be518b4967 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.h
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.h
> @@ -6,8 +6,12 @@
>  #ifndef _XE_GT_FREQ_H_
>  #define _XE_GT_FREQ_H_
>  
> +#include <linux/types.h>
> +
>  struct xe_gt;
>  
>  void xe_gt_freq_init(struct xe_gt *gt);
>  
> +u32 xe_read_perf_limit_reasons(struct xe_gt *gt);

this component is xe_gt_freq, not xe_ nor xe_read or xe_read_perf.
Please use the right namespace prefixes.

But besides the namespace, I don't believe that these limits
belong to xe_gt_freq anyway... why are you taking that from the
throttle reasons and moving here?

What about removing the 'sysfs' name from the xe_gt_throttle
component and making that to export a function
xe_gt_throttle_get_limit_reasons(struct xe_gt *gt)
?

Thanks,
Rodrigo.

> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> index 63d640591a52..89d9f89962ad 100644
> --- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> @@ -8,6 +8,7 @@
>  #include <regs/xe_gt_regs.h>
>  #include "xe_device.h"
>  #include "xe_gt.h"
> +#include "xe_gt_freq.h"
>  #include "xe_gt_sysfs.h"
>  #include "xe_gt_throttle_sysfs.h"
>  #include "xe_mmio.h"
> @@ -34,77 +35,65 @@ dev_to_gt(struct device *dev)
>  	return kobj_to_gt(dev->kobj.parent);
>  }
>  
> -static u32 read_perf_limit_reasons(struct xe_gt *gt)
> -{
> -	u32 reg;
> -
> -	if (xe_gt_is_media_type(gt))
> -		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
> -	else
> -		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
> -
> -	return reg;
> -}
> -
>  static u32 read_status(struct xe_gt *gt)
>  {
> -	u32 status = read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
> +	u32 status = xe_read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
>  
>  	return status;
>  }
>  
>  static u32 read_reason_pl1(struct xe_gt *gt)
>  {
> -	u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
> +	u32 pl1 = xe_read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
>  
>  	return pl1;
>  }
>  
>  static u32 read_reason_pl2(struct xe_gt *gt)
>  {
> -	u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
> +	u32 pl2 = xe_read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
>  
>  	return pl2;
>  }
>  
>  static u32 read_reason_pl4(struct xe_gt *gt)
>  {
> -	u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
> +	u32 pl4 = xe_read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
>  
>  	return pl4;
>  }
>  
>  static u32 read_reason_thermal(struct xe_gt *gt)
>  {
> -	u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
> +	u32 thermal = xe_read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
>  
>  	return thermal;
>  }
>  
>  static u32 read_reason_prochot(struct xe_gt *gt)
>  {
> -	u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
> +	u32 prochot = xe_read_perf_limit_reasons(gt) & PROCHOT_MASK;
>  
>  	return prochot;
>  }
>  
>  static u32 read_reason_ratl(struct xe_gt *gt)
>  {
> -	u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
> +	u32 ratl = xe_read_perf_limit_reasons(gt) & RATL_MASK;
>  
>  	return ratl;
>  }
>  
>  static u32 read_reason_vr_thermalert(struct xe_gt *gt)
>  {
> -	u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
> +	u32 thermalert = xe_read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
>  
>  	return thermalert;
>  }
>  
>  static u32 read_reason_vr_tdc(struct xe_gt *gt)
>  {
> -	u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
> +	u32 tdc = xe_read_perf_limit_reasons(gt) & VR_TDC_MASK;
>  
>  	return tdc;
>  }
> -- 
> 2.43.0
> 
