Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB82C3DA7F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 02:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D669510E041;
	Thu,  8 Aug 2024 02:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RgaOfbmx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983BF10E041
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 02:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723085859; x=1754621859;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Od8KyPd3GOwlpxV2Yd32kHKjm7iPNtWpOLy1+uoQbhE=;
 b=RgaOfbmxTPYDu5yEN5WUJ8k9C6jGBmPKwQKVH/I6t+AgNPER7Ucw6I7U
 mSBgnsZwGJPWgifYhm+ssVSJoYW0Pptw4NfHI+bDLsnHRkUYxWke4DoJT
 nyirYPPg3pyWujjYMoklI7akvOfWzhs7vMVWZU3mIgaTxPAN4ID5qI2nO
 6OSjbVDPSdppbc+JtfZp4ZGtqFXeZ/rmjzqLyfxGX6uH3X2YepDcSLpu4
 hN4NKKzC90iz9ZWrrj7KdQwGtUiVA8LShjyHPPtTdVJgaAG8j95k22xQu
 hJpVCXtXluvY0YRTU0qx4fiFLPrKqUQQf1gn8QguoxyL05mmKgm+I4kyo w==;
X-CSE-ConnectionGUID: HXUPSt4yTH+Vc0uT0XI2Lw==
X-CSE-MsgGUID: VqjlAOcURGeOUPOhtmXV5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21046147"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="21046147"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 19:57:36 -0700
X-CSE-ConnectionGUID: uW3y534DRxS4AwsQzW1UoQ==
X-CSE-MsgGUID: Pd3aQP+JQK+ZdCnXVgNOGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="56760157"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 19:57:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 19:57:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 19:57:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 19:57:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oFRulsrH0M/T165M3EzXigVLiyVCrfoxh0AUedFTN/nyES+gAKf0opBWxJarUe2sCTwXX/gfHL/MEaQl/Eh/eicB7YlhUx2kaXXO6NODPvL0uuyG3kYsukGwuVlqcrXq4cJEzsY5R6L6MIHMjUIPEJFnQI/GGJsaVjra5cB5zP8gFRaO3iHvrSXbywza1ZpvddvdCTZJesmkBJQFLvVxCgBK2C0LwiSPzU8HeWidteWr0+JS8e3kA9jAVe+vkAYe+gcuvyeihZYykTdF27UnICt5wnM7BbW9iQQDr9x8DBjiWl2wpoUNWIfvVtFWUHNzQwBIqTPB9E7qm9KkTM0E3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKTxiLul22WRRHUohN8Xnvh6urGEB6oHKwpzdcPeWxI=;
 b=juf5cmr0QnqBYWtZQt+PlPwnpY+PqWa/0kRFIAIL3eFEU1FrI6Zi1Hh+8CXOyBxcBtdBHbCs77Vx4t/L/Tl7EEZrQJX4BjGN1pW00AOOASOR0ckaM83S7LQIyJWDP4sez7JhGWOKLBS6ZU4JuqHHd+GV6UHf+Pn05sWEcQmYuYKAKKmNhgcrOZxAophCeb+CkUDpH63B0BNcE5+oY+x29Ai9jnhIV7TFpuBmhLqiOJuy+BiTBfNG6KqcT4e7Z1+uBz4SWwKRsu2Og67tDOTXhfkT3K0rUgN4+wTxAfkWPvLRqW1l9BEP8S75XIQjPTwe58LbwTKiQphaf9N3ItW+bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6708.namprd11.prod.outlook.com (2603:10b6:510:1c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.33; Thu, 8 Aug
 2024 02:57:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 02:57:31 +0000
Date: Thu, 8 Aug 2024 02:56:12 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 01/13] drm/xe/hw_engine_group: Introduce
 xe_hw_engine_group
Message-ID: <ZrQzzO3UQelE0VQW@DUT025-TGLU.fm.intel.com>
References: <20240807162416.1307061-1-francois.dugast@intel.com>
 <20240807162416.1307061-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240807162416.1307061-2-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR01CA0012.prod.exchangelabs.com (2603:10b6:a02:80::25)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: 44455000-c0bd-4da3-ac2e-08dcb755d858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?WvoSpsHlvFFXbtRz6Y2YT4zFyokyuDXdabWMkGEVh83ZFI/XmrRyFjfPu2?=
 =?iso-8859-1?Q?lCTGkxGq69/axM3704ePABlhHR0U9SVKrJBpD7g3VauBrPR+bVViu2vVOr?=
 =?iso-8859-1?Q?B1lyPR/VKZn7MFtZzPPNFUy5ApeQeYACY7G51/a84BNFgG1TbMU1YG0xt7?=
 =?iso-8859-1?Q?CXqs7T09ZTph1B1ulP9T0aSlSluqvJAhgj4RFvswQD/GO8wSqUC3we7OVx?=
 =?iso-8859-1?Q?p3IFfRcdbU8zyu3+dDkZI1SkIinubBaTbNtXDcQDDm2j8O4xx8R2xskVfs?=
 =?iso-8859-1?Q?NqoXPHVIR9J4ArFQxtgUUrg5t53OGo2TYJtHW2U5j848NRdamublQPlxyk?=
 =?iso-8859-1?Q?apMDhiMqi+xZyxKdWn6hubYPEtU7MhpAciszOZaORmG6Xcjg7cB5j40QMD?=
 =?iso-8859-1?Q?O0ssHfKnXMlH0Gi8a9XMVoJHnq7bDXAI3WgrISjBLFFezuID/CG2dy4SS3?=
 =?iso-8859-1?Q?QMLHG/SKvHgCKgt2i2cokNDG65AENds8wfjNRzMCUr747Jc/NPAE0TAkIg?=
 =?iso-8859-1?Q?ArHEwhwYtbA/GpDsdPJCMKUL4WA04MgkPVLSBGi2Kdbuf3JGIwngOawNP/?=
 =?iso-8859-1?Q?FV2JMvVjGo9YsD6amBBBbsquxdOOLUo8x6YxZTjBqyEYEPaoOB+4Z/WmWq?=
 =?iso-8859-1?Q?Bcb6uva/BlTwxmnQ5/qw9FHUM8WXV+QbPPuI9XajV+7KDFiT996IYTuFJo?=
 =?iso-8859-1?Q?6QUMVWHpJpalgbuA8uXDferuMKl7EyDrsFCL82qqA/tGsOtrnTaFQZEtE8?=
 =?iso-8859-1?Q?/IHTZWFPVUMWCaCCqA5zZpMSjxIh3EU9FM2C5ZvbSHFvHknninbhDxf5J3?=
 =?iso-8859-1?Q?fa34TOjfuDy9IPHWIdQx0BoYo5wspaCkYw9ihxXiaOceKK3fPvisXkzJbM?=
 =?iso-8859-1?Q?4xzjGxPAWM2SWOwaKwWZHdabqjEZFg14I8A/NiLdvJARpFmnN1/r0531NN?=
 =?iso-8859-1?Q?X2/MWOcE8MONYokd6KXD36LnmONZ4ayrTtXEKgWBGqpdgUAgUte5M5qf6f?=
 =?iso-8859-1?Q?NSJGaWqYNtow/ZopyYMSf7M9vFgzYKyeGm57EVs5UcjFqg+dk5jQwJcpUg?=
 =?iso-8859-1?Q?+XWnkjDRECvjmIaVgBCORFMtrF8pdPsUij3JsBMsTgN/njSWxFoRNHw26H?=
 =?iso-8859-1?Q?vTyR3fXuLdBvhPCP1fSwP3j7e+9T+l1TcjqvSsomFPcnW3mgpe688fhYRH?=
 =?iso-8859-1?Q?P+yUvo532TctUW85rWXKpl4QgW67nyad8q9RByVYDHA4FREWAnDf5ALx2r?=
 =?iso-8859-1?Q?Epzq43lXdf8S4tvtEBeiWSYmFSvpITByBIXWGwYOvQotA8+Xa67HLbOk1G?=
 =?iso-8859-1?Q?hLz8xfE8dNDR0IfrZ+jy4zTR947kF+PEBnaocBPDZ912ySTxOihxMe04eX?=
 =?iso-8859-1?Q?+t9xyc+SlHHvZxhZ+bFvq6UtgW3lGzfg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?A8MTmYMh0HYDzzFGS8nevR4SU/o7uRuWh4cYVS/QJ+hFQQ2wXfRkh71H4q?=
 =?iso-8859-1?Q?ZQwxBfHvPjy6WKXwUhI5XH8CNGr068ReNFyF2adiA9mHeX8g72DvUNHrVR?=
 =?iso-8859-1?Q?MBwYH0pm4ORhAPXADdDjrErKxdoZuwZQbfEHLxzRIlAFh4dZ8Rty7vjdec?=
 =?iso-8859-1?Q?Ia479StTjpZsR1bG9k9hxTqtUXOZF0NNc77f5GxW6D0OSslRd3wnutvscj?=
 =?iso-8859-1?Q?pykj5GWZfyvGq0H6McYavvru8ZrY1D3g3uHL9IgCJ/rsmG0Ct571XsTV2z?=
 =?iso-8859-1?Q?9jblF+IM2goLRUu42b7fICsaL2AWTLI8O4oomFx6krq1opWUGryh6LJAA2?=
 =?iso-8859-1?Q?i2Qrdiu4puz/BLP0Li2Fv6jS28fQyrqwV+FhPKXJ7x8M3iJ7jeZl/w9llr?=
 =?iso-8859-1?Q?aAuGKfC+3PKY1tNWxyS0eqmMCGCjRbrMHKCnsdOcUeBcWUghPTPgqqnsX/?=
 =?iso-8859-1?Q?5n37CpG7efP409sBVMkiG66OEmCB8cRN739cm/mar6Ap/S9AwUj0c9/x29?=
 =?iso-8859-1?Q?rRHsKdonZLw1DJcYiRmFWMDdQzqn9Wvq01KFu8TmMri7VAGAvOuyZaIchu?=
 =?iso-8859-1?Q?twsPY/vG83TKipajnnywnRKJfezmvX+6UEc/cW7DJYgq4xEERPlT00b+EU?=
 =?iso-8859-1?Q?Oybqe58r7K3k0EUwpBhEC9RaLKm6VIHjluoFcs0Gs0tYjWlmDNRRir4Nmj?=
 =?iso-8859-1?Q?ogfE/cNIPPKFO61Y2Ri3NqO3OB0P90uaJnkelGLIp50A9aSl7pbThw+4+B?=
 =?iso-8859-1?Q?3LDM7S6p+7viUfXLzce/B9vAASjVvqdEvLjKoGz+i2DSslKKKWGiIFQ7GZ?=
 =?iso-8859-1?Q?REYvHO5pvfkn6BSYYR/qWShjaJkPNWyqlgArG3t14XCScZpLPZRTTQqvgt?=
 =?iso-8859-1?Q?obQfHoNpYU6s706V44JZGxBGnnZu3UchbGvZeHEKyM4nfAjf/+fFA7cUBr?=
 =?iso-8859-1?Q?5LRsIsdIDTn6sUjmMyFNM9J6wZiUBwapihQgHCb295QBx4Tj5EuqVEETnX?=
 =?iso-8859-1?Q?tHGcMM1YQjUCNW2TYbVh3pa3Xa62ku8cmA8K5Qgz1+Zkc7UlLerODLqxTV?=
 =?iso-8859-1?Q?ToTjnwbtYvFjx7r0S6qwrmEV9MsXTs5pi2bwrDec/P4S6Cf0DOTSIjjo6v?=
 =?iso-8859-1?Q?Cw4NYmPg4aQKTcWC/6sArjRLZqUu/JQHEnX0Nl1JC3xBw0bdrxwSwoiuHE?=
 =?iso-8859-1?Q?913V30DIF7uKwJx650FaPpPay5KU6x3fO/SIEZrrHK/cIF6ECeh81lCLpX?=
 =?iso-8859-1?Q?7rXE1gLeaTRUnhTisF2P4nwV3Qx0FWQzWqBHXnpr6aNasbrFmTjkpK4p74?=
 =?iso-8859-1?Q?nvLjrmS86XICadNc52JBl+1BS5Ojq5d1vYCer/yMZHafGd6SMQNB7899I+?=
 =?iso-8859-1?Q?P8fJ384ftK5h/vPBiongtzwhuDg0ojMZWexgm3aHdqtFyO0+mqSmfKT7iZ?=
 =?iso-8859-1?Q?7NU53XhxeS8VGOs8avFo7Of+EmYPfd+3HBZy+mehFJFpKDGaUR2eYYSUA5?=
 =?iso-8859-1?Q?F+PPXS0FpqrLNJP6ja3IhWtI+JPrJFky2cAONCU77dPOrmMvwnOZsZZopa?=
 =?iso-8859-1?Q?glTFwooFx6u0hTPiqWjbyjDKTke+LIoR2CbKHdVvfvsZx//nBOTNnDvwiA?=
 =?iso-8859-1?Q?JgdTNBedK3snwBjS5FaFKyMbHL1zOx+xuaVWrccjPN+e9VOx+CO1aivQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44455000-c0bd-4da3-ac2e-08dcb755d858
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 02:57:31.0589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DVGO2/QDaesuM0NdrEB6UtZ+pZ51McD/splFQCPiffxBhxwVrt1ebeL//ZgJL36kXve8B3emyYFvzDGo3SWI5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6708
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

On Wed, Aug 07, 2024 at 06:23:30PM +0200, Francois Dugast wrote:
> A xe_hw_engine_group is a group of hw engines. Two hw engines belong to
> the same xe_hw_engine_group if one hw engine cannot make progress while
> the other is stuck on a page fault.
> 
> Typically, hw engines of the same group share some resources such as EUs,
> but this really depends on the hardware configuration of the platforms.
> The simple engines partitioning proposed here might be too conservative
> but is intended to work for existing platforms. It can be optimized later
> if more sets of independent engines are identified.
> 
> The hw engine groups are intended to be used in the context of faulting
> long-running jobs submissions.
> 
> v2: Move to own files, improve error handling (Matt Brost)
> 
> v3: Fix build issue reported by CI, improve commit message (Matt Roper)
> 
> v4: Fix kernel doc
> 
> v5: Add switch case for XE_ENGINE_CLASS_OTHER
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  drivers/gpu/drm/xe/xe_hw_engine.c             |   4 +
>  drivers/gpu/drm/xe/xe_hw_engine_group.c       | 102 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine_group.h       |  16 +++
>  drivers/gpu/drm/xe/xe_hw_engine_group_types.h |  51 +++++++++
>  drivers/gpu/drm/xe/xe_hw_engine_types.h       |   2 +
>  6 files changed, 176 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group.c
>  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group.h
>  create mode 100644 drivers/gpu/drm/xe/xe_hw_engine_group_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 1ff9602a52f6..b67ace7ed204 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -69,6 +69,7 @@ xe-y += xe_bb.o \
>  	xe_heci_gsc.o \
>  	xe_hw_engine.o \
>  	xe_hw_engine_class_sysfs.o \
> +	xe_hw_engine_group.o \
>  	xe_hw_fence.o \
>  	xe_huc.o \
>  	xe_huc_debugfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 402dfa748e16..2503a93ad457 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -23,6 +23,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_topology.h"
> +#include "xe_hw_engine_group.h"
>  #include "xe_hw_fence.h"
>  #include "xe_irq.h"
>  #include "xe_lrc.h"
> @@ -790,6 +791,9 @@ int xe_hw_engines_init(struct xe_gt *gt)
>  	}
>  
>  	hw_engine_setup_logical_mapping(gt);
> +	err = xe_hw_engine_setup_groups(gt);
> +	if (err)
> +		return err;
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> new file mode 100644
> index 000000000000..1d109c08c7a6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_hw_engine_group.h"
> +
> +static void
> +hw_engine_group_free(struct drm_device *drm, void *arg)
> +{
> +	struct xe_hw_engine_group *group = arg;
> +
> +	kfree(group);
> +}
> +
> +static struct xe_hw_engine_group *
> +hw_engine_group_alloc(struct xe_device *xe)
> +{
> +	struct xe_hw_engine_group *group;
> +	int err;
> +
> +	group = kzalloc(sizeof(*group), GFP_KERNEL);
> +	if (!group)
> +		return ERR_PTR(-ENOMEM);
> +
> +	init_rwsem(&group->mode_sem);
> +	INIT_LIST_HEAD(&group->exec_queue_list);
> +
> +	err = drmm_add_action_or_reset(&xe->drm, hw_engine_group_free, group);
> +	if (err)
> +		return ERR_PTR(err);
> +
> +	return group;
> +}
> +
> +/**
> + * xe_hw_engine_setup_groups() - Setup the hw engine groups for the gt
> + * @gt: The gt for which groups are setup
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_hw_engine_setup_groups(struct xe_gt *gt)
> +{
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +	struct xe_hw_engine_group *group_rcs_ccs, *group_bcs, *group_vcs_vecs;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	int err;
> +
> +	group_rcs_ccs = hw_engine_group_alloc(xe);
> +	if (IS_ERR(group_rcs_ccs)) {
> +		err = PTR_ERR(group_rcs_ccs);
> +		goto err_group_rcs_ccs;
> +	}
> +
> +	group_bcs = hw_engine_group_alloc(xe);
> +	if (IS_ERR(group_bcs)) {
> +		err = PTR_ERR(group_bcs);
> +		goto err_group_bcs;
> +	}
> +
> +	group_vcs_vecs = hw_engine_group_alloc(xe);
> +	if (IS_ERR(group_vcs_vecs)) {
> +		err = PTR_ERR(group_vcs_vecs);
> +		goto err_group_vcs_vecs;
> +	}
> +
> +	for_each_hw_engine(hwe, gt, id) {
> +		switch (hwe->class) {
> +		case XE_ENGINE_CLASS_COPY:
> +			hwe->hw_engine_group = group_bcs;
> +			break;
> +		case XE_ENGINE_CLASS_RENDER:
> +		case XE_ENGINE_CLASS_COMPUTE:
> +			hwe->hw_engine_group = group_rcs_ccs;
> +			break;
> +		case XE_ENGINE_CLASS_VIDEO_DECODE:
> +		case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +			hwe->hw_engine_group = group_vcs_vecs;
> +			break;
> +		case XE_ENGINE_CLASS_OTHER:
> +			break;
> +		default:
> +			drm_warn(&xe->drm, "NOT POSSIBLE");
> +		}
> +	}
> +
> +	return 0;
> +
> +err_group_vcs_vecs:
> +	kfree(group_vcs_vecs);
> +err_group_bcs:
> +	kfree(group_bcs);
> +err_group_rcs_ccs:
> +	kfree(group_rcs_ccs);
> +
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> new file mode 100644
> index 000000000000..c2648f87f7ef
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_HW_ENGINE_GROUP_H_
> +#define _XE_HW_ENGINE_GROUP_H_
> +
> +#include "xe_hw_engine_group_types.h"
> +
> +struct drm_device;
> +struct xe_gt;
> +
> +int xe_hw_engine_setup_groups(struct xe_gt *gt);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group_types.h b/drivers/gpu/drm/xe/xe_hw_engine_group_types.h
> new file mode 100644
> index 000000000000..92b6e0712c03
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group_types.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_HW_ENGINE_GROUP_TYPES_H_
> +#define _XE_HW_ENGINE_GROUP_TYPES_H_
> +
> +#include "xe_force_wake_types.h"
> +#include "xe_lrc_types.h"
> +#include "xe_reg_sr_types.h"
> +
> +/**
> + * enum xe_hw_engine_group_execution_mode - possible execution modes of a hw
> + * engine group
> + *
> + * @EXEC_MODE_LR: execution in long-running mode
> + * @EXEC_MODE_DMA_FENCE: execution in dma fence mode
> + */
> +enum xe_hw_engine_group_execution_mode {
> +	EXEC_MODE_LR,
> +	EXEC_MODE_DMA_FENCE,
> +};
> +
> +/**
> + * struct xe_hw_engine_group - Hardware engine group
> + *
> + * hw engines belong to the same group if they share hardware resources in a way
> + * that prevents them from making progress when one is stuck on a page fault.
> + */
> +struct xe_hw_engine_group {
> +	/**
> +	 * @exec_queue_list: list of exec queues attached to this
> +	 * xe_hw_engine_group
> +	 */
> +	struct list_head exec_queue_list;
> +	/** @resume_work: worker to resume faulting LR exec queues */
> +	struct work_struct resume_work;
> +	/** @resume_wq: workqueue to resume faulting LR exec queues */
> +	struct workqueue_struct *resume_wq;
> +	/**
> +	 * @mode_sem: used to protect this group's hardware resources and ensure
> +	 * mutual exclusion between execution only in faulting LR mode and
> +	 * execution only in DMA_FENCE mode
> +	 */
> +	struct rw_semaphore mode_sem;
> +	/** @cur_mode: current execution mode of this hw engine group */
> +	enum xe_hw_engine_group_execution_mode cur_mode;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index 70e6434f150d..39f24012d0f4 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -150,6 +150,8 @@ struct xe_hw_engine {
>  	struct xe_hw_engine_class_intf *eclass;
>  	/** @oa_unit: oa unit for this hw engine */
>  	struct xe_oa_unit *oa_unit;
> +	/** @hw_engine_group: the group of hw engines this one belongs to */
> +	struct xe_hw_engine_group *hw_engine_group;
>  };
>  
>  /**
> -- 
> 2.43.0
> 
