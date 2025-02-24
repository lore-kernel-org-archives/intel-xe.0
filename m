Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81876C021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 22:46:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5112D10E069;
	Mon, 24 Feb 2025 22:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dUJ6cpZG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9226010E069
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 22:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740437172; x=1771973172;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JlU+nAXOoURkDfIs4OeznMegIjgAo1glmaLb+5xsajY=;
 b=dUJ6cpZGIBarnZFWrt5XnJWQJXuC21ZaxIxcOc+QOPjswxnIP7uYUlOg
 1ia7aF5uZWw3FNmCgDG07n2BWQ2PjjqRrXQ2L0iClf3cNgb/Z0XFZHnlG
 5gEsX+/4QEfbttsTYPq+RT3CjxaTQt07Ju1Y7R2cQYGMbOwzsSKkKfGx3
 fjapjkCAPPGKlNxejAuG+73pYKUhRbjr+qSD+kqhJbVeOo8YRT86dtcYS
 wsjh3GBVSZt9G6WH5FXvVniYfxPSwDVjWRo172GFSJNloW0b62hA66X1n
 CGLQSuiyAliM8j/4mXkZB8snmnwQxdSatHUXqqmI0FFLAk4ih6ibSp8ds Q==;
X-CSE-ConnectionGUID: TuzkNwUnS3KsIRnHiC5zVA==
X-CSE-MsgGUID: Jf2DwLbKSsuknD9TT1Uy+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="28805581"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="28805581"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 14:46:12 -0800
X-CSE-ConnectionGUID: RebvDdh0Sb+kNY9mEaf5wA==
X-CSE-MsgGUID: D3JeIbIiQ4KBrhtOGoHK+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="121129711"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 14:46:12 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 24 Feb 2025 14:46:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 24 Feb 2025 14:46:11 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 14:46:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ihxGUu5/a9hCBZDfhipP5RfTHGjVVybaEUl0ikJ6c8+/ggV6xQXDKXgQBqZa5bDiUzX3dBEgvc8Hcr6o8rl9634Zd6igzEvfoIRoz1D9qs+P/i8CJRo75HG2nUVA0KimAsMVphlhrI/x0cartJPRCbCALKgj++H7MQqSz+JW+dIyyKnDBLweH5DcnYj1XfyKv9pWRJbiCgchQu8TC4/Agd84GXuDItVlmXb7OVnyJWh35XfNCkkNzerUsPDrQlDN6/pRopbYs7joQZq4qKx+0/m/COMxirOxSNZT1H72KPSJqihGOuX9AaJxMBLjRx09BKQ45ZW/7pfQyZPUcUIO/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qdVssRq7twWgdIhasI7uACJtvhrhsKFM8Mglbd8nZ/M=;
 b=q6bhtftMdWzwqpHi+Gcbbxrc7n7vmZkbhlVnYtIS9QQpt0X5PS6vsraZMgOP0e4hGEdzFL+hkdjhJJ4g6JEgw+dMrR0+mx0KcYjJXWwKe8uaOSp11V5U+zCVK0ovprjkWun8CNbQxJOAH2UU2UXqOAu1clLZTZQXhk2IoZTmw+xy3uEUHuCm7D/h2ETkA/yogxZZUIyWIipf08n3FQWhKvqRayKB9NlyAPoAyP7UTXPftBbS3Ii6SH6Xkmn7r3Dvg5fgKTcEjGaFKrHF2I3EK4jRQIyFXOwD9boX7rYCmeLJZl8Zl/YftzneUyjPW/UsKUA11YjmVvNx4U9gJTRCcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB5774.namprd11.prod.outlook.com (2603:10b6:303:182::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 22:45:50 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 22:45:50 +0000
Date: Mon, 24 Feb 2025 14:45:47 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 3/5] drm/xe/kunit: Export xe_step_name for KUNIT
Message-ID: <20250224224547.GC4460@mdroper-desk1.amr.corp.intel.com>
References: <20250224150700.1778-1-michal.wajdeczko@intel.com>
 <20250224150700.1778-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250224150700.1778-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0206.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB5774:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a89c7ee-e983-419b-8542-08dd5524fc8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YMNstL8Tm+sXPnQdYiQ9j1p83CkLFDMVfyArm2YQg5gURIgESFzeF1YZ/IqL?=
 =?us-ascii?Q?SI+7ub92fj+vbC+jBwpTZtfrwm6LhytAT0A0pQKkHncXMBUcnf3TLL+k2cfE?=
 =?us-ascii?Q?6Lql7eXnAqvUoQOzRC7NM6e4sUEJUlBHdxUpOLdlXawMcOn1cgYIhqpbMVoU?=
 =?us-ascii?Q?Kkc51F9kTQGm8n5fXpXgcGtaAMuqHqVIGIDG49CcAs2bCgs/UeVf6rPskd2B?=
 =?us-ascii?Q?WZODJIkrVvM3BVjGe1j43EE3uofcgNSXoWmwS7eerjXsFXqnPi+xvk3MA7m8?=
 =?us-ascii?Q?EXE/dg/+7q7eIdAJd4VB2vBDmlp3mp3LJlRe84Q1MkSu2bjG7JR1nTqlm4+u?=
 =?us-ascii?Q?jibynEBrXueEN5AGioH/Kid5tINIlAyL5TbJwRuwpOck1WSdpBzwGtW7PXGA?=
 =?us-ascii?Q?KnCzIgLgdHaS82Q5Dzf4dTFIb6VsfM7RssWGr3brBumvWeTnnZxJzx3RhSBG?=
 =?us-ascii?Q?SmiET/9Ce3MertQuz3MjhWBwmX75My2Mv1s2CDkUOo3UExbeNKdIdUBrcfH8?=
 =?us-ascii?Q?fAlInzZczP6PQi7bUmmD8ic8adMKGTOYLrUuS1T+FKyh70uzhUwnPNpFgola?=
 =?us-ascii?Q?TqoCCCHixcxj5o4CpGp52wkYtx5Wv7T+vP5d3kCdDQRX5yPJSx00w+L86eP6?=
 =?us-ascii?Q?rFDiRCoqa0qlVoInea+HZbpu9l0SlDh93y1/sfBAh2WTVpzIYRACgG1R186h?=
 =?us-ascii?Q?PsA+RC+fk0QyfY+dhhK/PLzR0nJeTdwzHiDPPZKLWf9fSxu/9e0mjtd1jl7S?=
 =?us-ascii?Q?SbZaMNd9j3LAXYZwqkDZeoYNYl20AhLixdTjTkOpgl+9JsG3+fxcxZIfc9+N?=
 =?us-ascii?Q?PDfW0byEOUAlTW0tK2COr/tetX2Xw8CuaA1LPTOn1w8XFFsMqgIokPJuoEEb?=
 =?us-ascii?Q?p2qr8M85g4AJDo8lEWqUgivSMHAMCFl8Q1lZ2d8u/DX1FG12BHLPOqApwUh7?=
 =?us-ascii?Q?loavYm0ni5nAObj2/CP3z5F3PumeyBUR/1iMIgJN1aOvEdCimO5DWFtdxbMD?=
 =?us-ascii?Q?U3Il5zNi+KQwpDbF8jtL+uTqZFIXFDcklpX79YnTx4XCyh263fVaoeKycz62?=
 =?us-ascii?Q?HZ8lDMDrh2FmjoGDCtYqRzKUZc3oo6LyC+HWFgYqbV4DGowlLANqx9Nr/am9?=
 =?us-ascii?Q?wxHEGI/Uqwg8qsO+pJ+DYMHbH21PYJBQnfYcH4nIlzVwRbk0lNBYk+Ri5Puz?=
 =?us-ascii?Q?Yx00uJetb+cFrIhw3CEjEyyfUGskiMHXkAjDxQWE55kpb8Pcc2tNzYmv7n1f?=
 =?us-ascii?Q?/YImvak3PnvkgBbJMpbhLvjm/0GmPizcJrL88FeXnWXJG+D2N1lXwhJQ7VCE?=
 =?us-ascii?Q?9QwkoX+MThHU6a71lNm4yoJ3LsD4/ik4JpUklj7nOzXkblvxwUlYaECZ7KSs?=
 =?us-ascii?Q?V8D4F0CNQRiYh5h0Z+0/3LwLp7ZN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mj41LENdLvsgCrzmKSvo4i2oGRv4sns4WypaCVO++CW6T3QzMBCqtx4f8RcS?=
 =?us-ascii?Q?mty3bKlEo/T+9bZUXvwJmgia86PmO1fVsR0zzrilQtURemfoH0WxHUXs6+/z?=
 =?us-ascii?Q?bLKrNLF8DR2KaTcYf+3NL16SkFGY+ZpLPLOhmpldrCuvvDzTCMDsLHm7CYC1?=
 =?us-ascii?Q?tgTdg8flhthJmAr50n6EKPMX6yIi+T+urFEkL0+cFPynxYaSs2cyXd02INAS?=
 =?us-ascii?Q?UFsgpQOU2NN1/HhbcBBueSjzXdhXVMt9aBjcUaEptGqdEGSPCMD4Z/RPxwhZ?=
 =?us-ascii?Q?CmRHNLE66zNbDf+/vh0BY4uOl1Wtzt5/AmPdGD7bj6v9wCvGTPaDmCcMoOXG?=
 =?us-ascii?Q?/EDnWX/xuwLdstzpXdJZuaes2QTgMvHvrwNW676DbQvpmujfDrhOMvYC4DqA?=
 =?us-ascii?Q?60qa3ffKcgQ8rvswGi2RLcDXuHixLmnVZX/HHONj9DSknGfKde3wC+ev7VWN?=
 =?us-ascii?Q?ntby+kcA84OHVUsRhd96VINt9aDHin6/v9vEiHHhkbk2GHOPPr+7NjwaUsgx?=
 =?us-ascii?Q?cB1eVuGQ4ycEWjbj8Vo++dyvlEViJ8iUGuJdQfH1Gk2QGdSv0Ew69FMmc/g/?=
 =?us-ascii?Q?dGhjOhkYOulDFHQCS100LFUXbehxKLgILs1iFXVRcnly8nXYXtxhWe8FOfE8?=
 =?us-ascii?Q?/WhSZznrAz44mXvq/Qpgo0gEoQDNFwa5jtR5AnOCTZh+9AnPZsF976GDys8l?=
 =?us-ascii?Q?j3ESsurwmZRcjXGppLUjfep4NixD7Bc2uIvO47hP2jtC1ZUwiOgifszlg7wC?=
 =?us-ascii?Q?I38tUn0/DqxAsVoqyQThsQEA9CNCW/acPMTG19kSsdRYXKFPxoNf//dqJE3s?=
 =?us-ascii?Q?p3M1X2DzjUgSn3j4lKDwY0TTQ/vH+zF3iXcZG8Z1Za7KXJ79osGZpbv3ojZV?=
 =?us-ascii?Q?Y1n1YqwPR3o9/4flVRY3dIaYA2HpWqRB9iWpHz5PRIqO3k0MHOfAdiLBa52h?=
 =?us-ascii?Q?DWrZEOuBQk4WOpLCsAlsfGNg/3a4Lonarq++NPF1vJ6Y2APSD62rSVJydgBp?=
 =?us-ascii?Q?ygtYc1ZZQfhzVAKcinhtFcYbSsLVBXLE8ptzo0o22Hz18i0HPGyLDsa34aFL?=
 =?us-ascii?Q?g9TJpsPyXCgUrKt2V4nzRP15exhr2wVm5r6BKM7+E6NyCLJAVSpPfabYiEO5?=
 =?us-ascii?Q?zL3gXPyANhHJguyvUAEZOuFtV6+k32s7gQXLiUbWTwBQ83BMM56wkI5ov95m?=
 =?us-ascii?Q?uWxffCr8RZDDUgGjT+voN0w4lc1LudvhuCTfwOSM1ZjcRE1JpLvq3l2W5FcZ?=
 =?us-ascii?Q?d5Q5R4CzfhRQNHZFRrtS3GQRLxwJXGjOYjetiSI/A7b9q5qW2A6L7cMP0SJt?=
 =?us-ascii?Q?gZ3Cfa+cL1tD2JQ2UaVwUjluyNs+5lwFFahM0kdhxaptsGgxxsJer3x9uTWJ?=
 =?us-ascii?Q?k1SITTYhTA6oaHMkbkXkNMUBUmbxgahojNuvTZyziDlAw2EF19WEUkkl5o7e?=
 =?us-ascii?Q?dzu3RhXnXEoddX+G/DmL3f1YPemgneCelF06Y+If2de32WPzQ7yIViZdLaWu?=
 =?us-ascii?Q?Aw6QmKQit/NuEeplCe2nv3pvAA8l7bdrWyLGS0FZFmP0qLd3i8M6hIiXvp/j?=
 =?us-ascii?Q?tNLRXDYZYivQIDs1Rt+/H4W0tU/K6DRXt4JJMbrEa0DQpWrdH1R4FX+urH0B?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a89c7ee-e983-419b-8542-08dd5524fc8f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 22:45:50.2794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MDNXsxJ9O1FP6KXlOfEqJWHNqPZMwL26+PNvjOJMJBZbjUtEP6uQ4ooSBAIxFxRhPRIb4FSh536g7JLfXC+bPLuBa/mAe1p5Vt/UZdOh8dU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5774
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

On Mon, Feb 24, 2025 at 04:06:58PM +0100, Michal Wajdeczko wrote:
> We use xe_step_name() inside the xe_assert() that in turn could
> be used in our kunit test modules so it must be exported.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_step.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_step.c b/drivers/gpu/drm/xe/xe_step.c
> index c77b5c317fa0..db600cc9c5f2 100644
> --- a/drivers/gpu/drm/xe/xe_step.c
> +++ b/drivers/gpu/drm/xe/xe_step.c
> @@ -6,6 +6,7 @@
>  #include "xe_step.h"
>  
>  #include <linux/bitfield.h>
> +#include <kunit/visibility.h>
>  
>  #include "xe_device.h"
>  #include "xe_platform_types.h"
> @@ -255,3 +256,4 @@ const char *xe_step_name(enum xe_step step)
>  		return "**";
>  	}
>  }
> +EXPORT_SYMBOL_IF_KUNIT(xe_step_name);
> -- 
> 2.47.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
