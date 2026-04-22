Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542E6F94CC1
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 03:39:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 159AE10E02C;
	Wed, 22 Apr 2026 03:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ftaRO4fz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D451110E02C
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Apr 2026 03:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776829152; x=1808365152;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/DOTZOsCAedHWc3C9IjaYCSQL9DGIMyu6yNC2/yIxPQ=;
 b=ftaRO4fzuHFd6e2VCBLq8wJ8gzCtCMCKW75hMMGw9MpVxoygQ8+o+Q8t
 RZMl1z8a6ZXqpBLfDTA16GAZ7AsXcYUUE786qqnAj8Jw+zzuRkYPwLcBH
 WlxHDNCS8CeNbwTB8G6mkQ1qiHQMh9gOoWjW3ISwauxqmzvCkrqrKasPQ
 z0lbA8ThFE8czKcqUElbfeiw7AywtY/WjuTjguFPxS27mCdMN54m4MvVt
 cgi5/FZyvqM/mx2DSvWjFk6szyjmcqAPaX+qJJKrYRYeVzUkqjYhHXxgw
 ZxyjDkAYcUkFdX/8sCqEyVHkYpH4vgFzHew9BdL3r2JWaHV2V8LxftWK+ g==;
X-CSE-ConnectionGUID: Gy70Y8cESGOrzTaWlGbjzA==
X-CSE-MsgGUID: NRBVlqtYQfW9HXN1ae3kUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="100431341"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="100431341"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 20:39:03 -0700
X-CSE-ConnectionGUID: ILCGb730SK2U+zV34ipkRg==
X-CSE-MsgGUID: zLe3u2ryQwmuzhgZkqeLxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="232094026"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 20:39:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 20:39:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 21 Apr 2026 20:39:03 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.38) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 20:39:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmLVZFgE00O8oCvKz9VciZKWi40TLw8Z/aPm+iyLOgyXl+5lunE7m/whp2gO4qhNw+j1IOJ7tncQnGSvzdsYZfUfomrCzJKWw/ANNWEpNciGj3a3DM1B1BCgIVL6FM49OVWWH4g0+V2JyLhbWav+FUOO84IrXCVDi9f6Umn1+LgIwjdQcvOyFYowfUuuZ7rB5czTs/J5G4fLT1tTTIju2wExUJr2JVk/gAzB5GGrtKcW3+hc35NHFLgE6/IAs/1PPnBZ+Nn5kcUaUPg3AY070uM5aTZfjm23hn353dULGHCY+cChKrwHBlxUQcky+xDkHZBhsAIm/D36zhs74vp7CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVetsUhMmrlDSYn3q8swhgRVFnl8nPvUMEN7IwArv6o=;
 b=UZav1sH5cK+BIptjV0U2cx8EX66/qkzHaKEW8aS3phhQdI3XWiyC6m0e+vKs56p4qnQnk2VkSc7KFUq/d4PmbpQpRpbIDB9CrEn1WxojOpeBGnssw1JwuPwKoQVO0jPd4wTV0bICwktTqN6NmEcZPw6FCLPs7SNbwKKD+Tfoi6IqeD31Vgl7Kwnnqf6Y8m/iIAdx1CQ50LR2+nGbBY+vFcSkzWKO8wXRFMCA7fmYxD0VAmeDNYo0PR0BbA25YeVv7jl+9bQ4SpEN0gMYQgz6SfMCBl8+OXTIJHnJtA4hNIKummHWh2o4FqaM7vcct/2/kwz0myc0xlvY/kt2ajprGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPFBA72E12AE.namprd11.prod.outlook.com (2603:10b6:f:fc02::48)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.19; Wed, 22 Apr
 2026 03:38:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%7]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 03:38:52 +0000
Date: Tue, 21 Apr 2026 20:38:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Vinod Govindapillai <vinod.govindapillai@intel.com>
Subject: Re: [PATCH v3] drm/xe: Convert stolen memory over to ttm_range_manager
Message-ID: <aehCybEsc1+pAHaV@gsse-cloud1.jf.intel.com>
References: <20260421165047.2421231-2-sanjay.kumar.yadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260421165047.2421231-2-sanjay.kumar.yadav@intel.com>
X-ClientProxiedBy: MW4PR04CA0220.namprd04.prod.outlook.com
 (2603:10b6:303:87::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPFBA72E12AE:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f9db027-be55-478f-ba73-08dea020ac5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|18096099003|56012099003;
X-Microsoft-Antispam-Message-Info: wbP4jpt8+dL79UqhwXWd872gWC5sa9q07oL34p3PYJNtwR4BqEY+rwNazzb/xsozyG4Oh5NPm2JqtITGKhCMsm05iGSGjTUOJnQD/jSAsiSk3PFnwdNvwd8AnXsXD16M7XAw3oXS2QWMCW7eeoWx/Xk0gLUy7GRmgaousLjm21VWB2sFrnv3ZysZxc/VxCD//L6vuv/F9mHhw9IYmTw+DhpceN7Nu53qYWKsEwD6JSAlPYvT0qjuHCH4DW/Q/2163h7p9zuJNTdzBrvpj0x+uCJ2elxrWlAHP3llIRS/x4hFJ3S5vvBEvyajIA9SRi/P9IoiTGxtlfz5ZfJ7wx2VfeU1naJGBF8ELE9LwInlqptXlvy8BP27nfSX1lmOwceaj3NZrklOOv/fvNOfF7pW1RzYcLXm+oRZ02pTDy3wTR56lwnXvwF8jDScJrPxfHPBFdG6cTBLhfqtPkBn8MNEtk61PBbldxio1Lf85MpppXvnPEycqdx6rIuW/9/a6XDFaz39kpHLWKF1d8GEfdnJXXtn9Zs/quk+BEuZNbGlCfyic3UzdB3ytwieqzEYTBP/eQ3rxuoFhdaxp5aICCTw91/+xE0QK3h+Rlx0D0v0DodY3o6T/BZI0K29Zg7spYSmVH8FauOUwHLUF+A0u8VQ/OG0qzAM7f306i/C6n8CUNUOscdJAAmb4XyGi19mlzO7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(18096099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xJ75KfsWs6dPMpPwz9efgplobEonWCPr+f6DRblw03ug+maXVexOCMgthOu3?=
 =?us-ascii?Q?jF4lggdx3ZYhyf2mq4k+5NSBs7dHHjkx9XgF9ttcsL9KA3c33KgEEYEOF5jO?=
 =?us-ascii?Q?UVZNRT2+B0oW6ipBxI+3bfVXGfsW+Ysv95eWCP6jZrrqnDTZp57e1uPsMrG8?=
 =?us-ascii?Q?YWt+UauqgM0IdZKFUkWYJaUFjyG0qJF3GrgWxiZ9kaKG/ALZ+PaOrl81Fd3H?=
 =?us-ascii?Q?wseRw0aO7jtrmni+fMHbyY4K2syoZhfzG5Be1Th4dRqiczs3j8xv4kkWKSSf?=
 =?us-ascii?Q?Ts5Z4vFlSfAleOzFNaucYx4h4KBW9JnKiFQ6Hq2q+rAuxk45Fqi+UWXA34+T?=
 =?us-ascii?Q?XqJgbzADQnS3pkINWpLaya+iz64+MKT7r7YTfDyoJZilOCATlnwALf7pzw4P?=
 =?us-ascii?Q?f5evOouKDe68KbQ7Nxs0AN9Y9U6dqR4dFAVES/zce47iKADy4+e1vYavlka0?=
 =?us-ascii?Q?KxCBzMD5jz4zEZivvJ2gjz2Xyi/bUJumHKBMVTX538efLrsorUsM3iDgR3Er?=
 =?us-ascii?Q?GthTr3UK7PE1B8EMrlqk9zgn2MlJxSDEsuO829bHoiz/ckTDfbDq8s+IwZrd?=
 =?us-ascii?Q?ch6WJ7tnAWeFqdmlrP4b1yD+Y887mr5NSs4CxxCgZQTbujqk8vR0NQ3eJzNd?=
 =?us-ascii?Q?kSdlOxLPOb1ClE6A/f0z4aV549r7kwJV5dc8YPnvJcxGpAwvlLCgoLRZQ3lu?=
 =?us-ascii?Q?6XZVae0SMwnA1MlapRpvAskZmG2UJv9e5IFLJFIjWYCdcZMyNGIFuWQ8foNo?=
 =?us-ascii?Q?prdiIWHumL+L+W4LMIo3UJO4ICfZUkG97vxvWFHntG9vsd6rFzDrCTVaIvQy?=
 =?us-ascii?Q?gkh7EMRx77gx9rk+QWOXzXteoGlK74R+Xt73UR4ei+8Ma4zvo4ql+T/b1cn8?=
 =?us-ascii?Q?HwF2XfcIIqQEkd7kpfHriq2xkBAZOwkoow+kK7XLOCfHJvDcH7NqHyH4TwzX?=
 =?us-ascii?Q?4NsE6hRa+qycQJ8o6CgfTd+owAIZBD/g6L7lQ7OL7UwDKb92dW3e8FfT0AY4?=
 =?us-ascii?Q?P845K0ItnK/t5OgI2Ww4a6gJwC/Of9qi/X1sQTlVP13mK+dcFU0C3/Q8I+G5?=
 =?us-ascii?Q?RfzfGn71mClxRUyle0yysYyBET9SL8tlClnPnzHqqDjesTgYzdH6FQUFv3WX?=
 =?us-ascii?Q?12xjq4iZdS52sasUq1ngEiTy4eZqDiyPRpy64QF49QW5AatFU/mDZcNmYsEi?=
 =?us-ascii?Q?nHFlg2P/VIg0dxDCL56UhnqI1lafEzMdXKlFNPQs4+MpqTk89s6s+XZ6ChKB?=
 =?us-ascii?Q?X+CO9xE5UTKlUnkCpRn7YM+RjqXYZYfFnCz3wD09tYstLA1Xs2iwMcfTjKCj?=
 =?us-ascii?Q?L/GwVAKM8r71s2DaTxx40ZoIs8dyCldXML/v502MFQuKel+t/l0RRN/2eqpf?=
 =?us-ascii?Q?m6zqUIqQI/gfEL1AO1RRV5aWtrG0AHhSC+NbDZdTSEoP/Gyn7Wv2qKbNaV9q?=
 =?us-ascii?Q?fZ5h59ia/UcNfNN7ta1v8RYC4mB6GOG+WUL7m6Y811brMqLtWrHHgBHzBz6a?=
 =?us-ascii?Q?WKYMmymUyRcFTrRoc3AU34MIlw8DSkETeS7xl3Opg62qUZQ60gmWpzqf5KtM?=
 =?us-ascii?Q?Wkah3fLngOjiCtiNlHIZjSJmG6A4EGdLbSK4SDf+k46FyrG9MMGAAZZqm8qc?=
 =?us-ascii?Q?SNtQtj6YfbrNUdjHiZlJ2J6U816OaBlY8vToFlGGZp3h/2F1ygpEKQdFelmK?=
 =?us-ascii?Q?cBLT+QZixi84xTEPoQyEOlzOWoxbUencospDWY6usmWe/cmiE5YupiRh1Jb9?=
 =?us-ascii?Q?7W9Oglh4er2jor+Bk+v4vHmo7bBLGG0=3D?=
X-Exchange-RoutingPolicyChecked: DC46EYAoNtEzuZ0L58+iX9VyV3act47kQM+MW3ZO28/7k+Ut4ejy2Rh+XsnJG2JFucidCsdh6VCW0ffJY9g88C3OZNAd7snBGyo8EpunR4Oc+hWHUvOjFxC9XxqXkJjrbCv8QCntgKGDd87uVK1Qjz732jf88JQxMyWJw5D7upPK5ifeavtbIxOWb4eiyStsJD8vhrLjhttvuWsRKiyX8J+oy2JbYcfU+YOpas2BHId1TBkqd8PQlO7ovvBxP+i9emmbugw1ifROaTF6b4E+dbzhW0J1GqElnmNIMkH8usHbCdDW4nXL4Vqs5ph96rFRN7y3Tj9/aMJb3qb+Q+6Sjw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f9db027-be55-478f-ba73-08dea020ac5b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 03:38:52.6622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Daw0EmPQ05oNrNTJ+QZd0VarcUjjasYQSzIgpIv0SdJ7x77qrPyczF9UBvQpVsTnVM6/XHpVyD9DTPrPsDlaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFBA72E12AE
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

On Tue, Apr 21, 2026 at 10:20:48PM +0530, Sanjay Yadav wrote:
> Stolen memory requires physically contiguous allocations for display
> scanout and compressed framebuffers. The stolen memory manager was
> sharing the gpu_buddy allocator backend with the VRAM manager, but
> buddy manages non-contiguous power-of-two blocks making it a poor fit.
> Stolen memory also has fundamentally different allocation patterns:
> 
> - Allocation sizes are not power-of-two. Since buddy rounds up to the
>   next power-of-two block size, a ~17MB request can fail even with
>   ~22MB free, because the free space is fragmented across non-fitting
>   power-of-two blocks.
> - Hardware restrictions prevent using the first 4K page of stolen for
>   certain allocations (e.g., FBC). The display code sets fpfn=1 to
>   enforce this, but when fpfn != 0, gpu_buddy enables
>   GPU_BUDDY_RANGE_ALLOCATION mode which disables the try_harder
>   coalescing path, further reducing allocation success.
> 
> This combination caused FBC compressed framebuffer (CFB) allocation
> failures on platforms like NVL/PTL. In case of NVL where stolen memory
> is ~56MB and the initial plane framebuffer consumes ~34MB at probe time,
> leaving ~22MB for subsequent allocations.
> 
> Use ttm_range_man_init_nocheck() to set up a drm_mm-backed TTM resource
> manager for stolen memory. This reuses the TTM core's ttm_range_manager
> callbacks, avoiding duplicate implementations.
> 
> Tested on NVL with a 4K DP display: stolen_mm shows a single ~22MB
> contiguous free hole after initial plane framebuffer allocation, and
> FBC successfully allocates its CFB from that region. The corresponding
> IGT was previously skipped and now passes.
> 
> v2:
> - Clarify that stolen memory requires contiguous allocations (Matt B)
> - Properly handle xe_ttm_resource_visible() for stolen instead of
>   unconditionally returning true (Matt A)
> 
> v3:
> - Rebase
> - Fix xe_display_bo_fbdev_prefer_stolen() to compare in pages, since
>   ttm_range_manager stores stolen->size in pages not bytes (Matt A)
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7631
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Assisted-by: GitHub Copilot:claude-sonnet-4.6
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Acked-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_display_bo.c |  2 +-
>  drivers/gpu/drm/xe/xe_bo.c                 | 16 ++++--
>  drivers/gpu/drm/xe/xe_device_types.h       |  3 +
>  drivers/gpu/drm/xe/xe_res_cursor.h         | 14 ++++-
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c     | 64 ++++++++--------------
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h     |  9 +++
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 11 ++--
>  7 files changed, 64 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_display_bo.c b/drivers/gpu/drm/xe/display/xe_display_bo.c
> index dc0d78ff2d79..7fbac223b097 100644
> --- a/drivers/gpu/drm/xe/display/xe_display_bo.c
> +++ b/drivers/gpu/drm/xe/display/xe_display_bo.c
> @@ -138,7 +138,7 @@ bool xe_display_bo_fbdev_prefer_stolen(struct xe_device *xe, unsigned int size)
>  	 * important and we should probably use that space with FBC or other
>  	 * features.
>  	 */
> -	return stolen->size >= size * 2;
> +	return stolen->size >= (size * 2) >> PAGE_SHIFT;
>  }
>  
>  static struct drm_gem_object *xe_display_bo_fbdev_create(struct drm_device *drm, int size)
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index f685c3c2fbb3..295857cdeb4e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -611,11 +611,17 @@ static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_tt *tt)
>  	kfree(tt);
>  }
>  
> -static bool xe_ttm_resource_visible(struct ttm_resource *mem)
> +static bool xe_ttm_resource_visible(struct xe_device *xe, struct ttm_resource *mem)
>  {
> -	struct xe_ttm_vram_mgr_resource *vres =
> -		to_xe_ttm_vram_mgr_resource(mem);
> +	struct xe_ttm_vram_mgr_resource *vres;
>  
> +	if (mem->mem_type == XE_PL_STOLEN) {
> +		struct xe_ttm_stolen_mgr *mgr = xe->mem.stolen_mgr;
> +
> +		return mgr->io_base && !xe_ttm_stolen_cpu_access_needs_ggtt(xe);
> +	}
> +
> +	vres = to_xe_ttm_vram_mgr_resource(mem);
>  	return vres->used_visible_size == mem->size;
>  }
>  
> @@ -633,7 +639,7 @@ bool xe_bo_is_visible_vram(struct xe_bo *bo)
>  	if (drm_WARN_ON(bo->ttm.base.dev, !xe_bo_is_vram(bo)))
>  		return false;
>  
> -	return xe_ttm_resource_visible(bo->ttm.resource);
> +	return xe_ttm_resource_visible(xe_bo_device(bo), bo->ttm.resource);
>  }
>  
>  static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
> @@ -649,7 +655,7 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
>  	case XE_PL_VRAM1: {
>  		struct xe_vram_region *vram = xe_map_resource_to_region(mem);
>  
> -		if (!xe_ttm_resource_visible(mem))
> +		if (!xe_ttm_resource_visible(xe, mem))
>  			return -EINVAL;
>  
>  		mem->bus.offset = mem->start << PAGE_SHIFT;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index e9e11bb1c65f..315d2ed4d3e6 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -42,6 +42,7 @@ struct xe_ggtt;
>  struct xe_i2c;
>  struct xe_pat_ops;
>  struct xe_pxp;
> +struct xe_ttm_stolen_mgr;
>  struct xe_vram_region;
>  
>  /**
> @@ -276,6 +277,8 @@ struct xe_device {
>  		struct ttm_resource_manager sys_mgr;
>  		/** @mem.shrinker: system memory shrinker. */
>  		struct xe_shrinker *shrinker;
> +		/** @mem.stolen_mgr: stolen memory manager. */
> +		struct xe_ttm_stolen_mgr *stolen_mgr;
>  	} mem;
>  
>  	/** @sriov: device level virtualization data */
> diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
> index 5f4ab08c0686..0522caafd89d 100644
> --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> @@ -101,7 +101,15 @@ static inline void xe_res_first(struct ttm_resource *res,
>  	cur->mem_type = res->mem_type;
>  
>  	switch (cur->mem_type) {
> -	case XE_PL_STOLEN:
> +	case XE_PL_STOLEN: {
> +		/* res->start is in pages (ttm_range_manager). */
> +		cur->start = (res->start << PAGE_SHIFT) + start;
> +		cur->size = size;
> +		cur->remaining = size;
> +		cur->node = NULL;
> +		cur->mm = NULL;
> +		break;
> +	}
>  	case XE_PL_VRAM0:
>  	case XE_PL_VRAM1: {
>  		struct gpu_buddy_block *block;
> @@ -289,6 +297,10 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
>  
>  	switch (cur->mem_type) {
>  	case XE_PL_STOLEN:
> +		/* Just advance within the contiguous region. */
> +		cur->start += size;
> +		cur->size = cur->remaining;
> +		break;
>  	case XE_PL_VRAM0:
>  	case XE_PL_VRAM1:
>  		start = size - cur->size;
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 27c9d72222cf..5e9070739e65 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -19,30 +19,11 @@
>  #include "xe_device.h"
>  #include "xe_gt_printk.h"
>  #include "xe_mmio.h"
> -#include "xe_res_cursor.h"
>  #include "xe_sriov.h"
>  #include "xe_ttm_stolen_mgr.h"
> -#include "xe_ttm_vram_mgr.h"
>  #include "xe_vram.h"
>  #include "xe_wa.h"
>  
> -struct xe_ttm_stolen_mgr {
> -	struct xe_ttm_vram_mgr base;
> -
> -	/* PCI base offset */
> -	resource_size_t io_base;
> -	/* GPU base offset */
> -	resource_size_t stolen_base;
> -
> -	void __iomem *mapping;
> -};
> -
> -static inline struct xe_ttm_stolen_mgr *
> -to_stolen_mgr(struct ttm_resource_manager *man)
> -{
> -	return container_of(man, struct xe_ttm_stolen_mgr, base.manager);
> -}
> -
>  /**
>   * xe_ttm_stolen_cpu_access_needs_ggtt() - If we can't directly CPU access
>   * stolen, can we then fallback to mapping through the GGTT.
> @@ -210,12 +191,19 @@ static u64 detect_stolen(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>  #endif
>  }
>  
> +static void xe_ttm_stolen_mgr_fini(struct drm_device *dev, void *arg)
> +{
> +	struct xe_device *xe = to_xe_device(dev);
> +
> +	ttm_range_man_fini_nocheck(&xe->ttm, XE_PL_STOLEN);
> +}
> +
>  int xe_ttm_stolen_mgr_init(struct xe_device *xe)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	struct xe_ttm_stolen_mgr *mgr;
>  	u64 stolen_size, io_size;
> -	int err;
> +	int ret;
>  
>  	mgr = drmm_kzalloc(&xe->drm, sizeof(*mgr), GFP_KERNEL);
>  	if (!mgr)
> @@ -244,12 +232,12 @@ int xe_ttm_stolen_mgr_init(struct xe_device *xe)
>  	if (mgr->io_base && !xe_ttm_stolen_cpu_access_needs_ggtt(xe))
>  		io_size = stolen_size;
>  
> -	err = __xe_ttm_vram_mgr_init(xe, &mgr->base, XE_PL_STOLEN, stolen_size,
> -				     io_size, PAGE_SIZE);
> -	if (err) {
> -		drm_dbg_kms(&xe->drm, "Stolen mgr init failed: %i\n", err);
> -		return err;
> -	}
> +	ret = ttm_range_man_init_nocheck(&xe->ttm, XE_PL_STOLEN, false,
> +					 stolen_size >> PAGE_SHIFT);
> +	if (ret)
> +		return ret;
> +
> +	xe->mem.stolen_mgr = mgr;
>  
>  	drm_dbg_kms(&xe->drm, "Initialized stolen memory support with %llu bytes\n",
>  		    stolen_size);
> @@ -257,36 +245,32 @@ int xe_ttm_stolen_mgr_init(struct xe_device *xe)
>  	if (io_size)
>  		mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, io_size);
>  
> -	return 0;
> +	return drmm_add_action_or_reset(&xe->drm, xe_ttm_stolen_mgr_fini, mgr);
>  }
>  
>  u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset)
>  {
>  	struct xe_device *xe = xe_bo_device(bo);
> -	struct ttm_resource_manager *ttm_mgr = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
> -	struct xe_ttm_stolen_mgr *mgr = to_stolen_mgr(ttm_mgr);
> -	struct xe_res_cursor cur;
> +	struct xe_ttm_stolen_mgr *mgr = xe->mem.stolen_mgr;
>  
>  	XE_WARN_ON(!mgr->io_base);
>  
>  	if (xe_ttm_stolen_cpu_access_needs_ggtt(xe))
>  		return mgr->io_base + xe_bo_ggtt_addr(bo) + offset;
>  
> -	xe_res_first(bo->ttm.resource, offset, 4096, &cur);
> -	return mgr->io_base + cur.start;
> +	/* Range allocator: res->start is in pages. */
> +	return mgr->io_base + (bo->ttm.resource->start << PAGE_SHIFT) + offset;
>  }
>  
>  static int __xe_ttm_stolen_io_mem_reserve_bar2(struct xe_device *xe,
>  					       struct xe_ttm_stolen_mgr *mgr,
>  					       struct ttm_resource *mem)
>  {
> -	struct xe_res_cursor cur;
> -
>  	if (!mgr->io_base)
>  		return -EIO;
>  
> -	xe_res_first(mem, 0, 4096, &cur);
> -	mem->bus.offset = cur.start;
> +	/* Range allocator always produces contiguous allocations. */
> +	mem->bus.offset = mem->start << PAGE_SHIFT;
>  
>  	drm_WARN_ON(&xe->drm, !(mem->placement & TTM_PL_FLAG_CONTIGUOUS));
>  
> @@ -329,8 +313,7 @@ static int __xe_ttm_stolen_io_mem_reserve_stolen(struct xe_device *xe,
>  
>  int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem)
>  {
> -	struct ttm_resource_manager *ttm_mgr = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
> -	struct xe_ttm_stolen_mgr *mgr = ttm_mgr ? to_stolen_mgr(ttm_mgr) : NULL;
> +	struct xe_ttm_stolen_mgr *mgr = xe->mem.stolen_mgr;
>  
>  	if (!mgr || !mgr->io_base)
>  		return -EIO;
> @@ -343,8 +326,5 @@ int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem)
>  
>  u64 xe_ttm_stolen_gpu_offset(struct xe_device *xe)
>  {
> -	struct xe_ttm_stolen_mgr *mgr =
> -		to_stolen_mgr(ttm_manager_type(&xe->ttm, XE_PL_STOLEN));
> -
> -	return mgr->stolen_base;
> +	return xe->mem.stolen_mgr->stolen_base;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
> index 8e877d1e839b..049e91e77326 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
> @@ -12,6 +12,15 @@ struct ttm_resource;
>  struct xe_bo;
>  struct xe_device;
>  
> +struct xe_ttm_stolen_mgr {
> +	/* PCI base offset */
> +	resource_size_t io_base;
> +	/* GPU base offset */
> +	resource_size_t stolen_base;
> +
> +	void __iomem *mapping;
> +};

Kernel doc. Everything else LGTM.

Matt

> +
>  int xe_ttm_stolen_mgr_init(struct xe_device *xe);
>  int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem);
>  bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe);
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 5fd0d5506a7e..79ef8e1b5e5c 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -301,14 +301,13 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
>  			   u64 default_page_size)
>  {
>  	struct ttm_resource_manager *man = &mgr->manager;
> +	const char *name;
>  	int err;
>  
> -	if (mem_type != XE_PL_STOLEN) {
> -		const char *name = mem_type == XE_PL_VRAM0 ? "vram0" : "vram1";
> -		man->cg = drmm_cgroup_register_region(&xe->drm, name, size);
> -		if (IS_ERR(man->cg))
> -			return PTR_ERR(man->cg);
> -	}
> +	name = mem_type == XE_PL_VRAM0 ? "vram0" : "vram1";
> +	man->cg = drmm_cgroup_register_region(&xe->drm, name, size);
> +	if (IS_ERR(man->cg))
> +		return PTR_ERR(man->cg);
>  
>  	man->func = &xe_ttm_vram_mgr_func;
>  	mgr->mem_type = mem_type;
> -- 
> 2.52.0
> 
