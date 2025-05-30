Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754E5C5B543
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 13:19:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAA310E7C5;
	Fri, 30 May 2025 13:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mrfH6j5i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD00810E07D
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 13:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748611193; x=1780147193;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IQP1jpqXnhvv9hzL/VWHe+YQpuPXwlplCUmpQHN1+dQ=;
 b=mrfH6j5iYykmG12Uj8dhAcy53bMWoNCmFopoGCVtf0YYhOlepUxdy3im
 hCMffytWqFwdOWEAYHKtwgtzRyMBdOb+UFeG3rHlvRcQ5aencOaA1UwBM
 DvkT65LQ08CeG0LIV79xAUlnagALiIrYPylOwMEwiSJ/BtowvcKOIbV3P
 8dEcIwtvAN+A3gLu2I/QwBBgHVGDgfmZlDIkfXdvgmgH4kuuYcz/AR3Sv
 pifSCRkODsR0liGFJ+IOA+/BQkurLI1LlXNQ5VvJLc0GnymD2YDzz9y5e
 kh64zwidpoUI3zZtPDpABJRBL1mwww3RDSolf3UOD+ph4mQpQovyLPHDa g==;
X-CSE-ConnectionGUID: GDf8MKs3QleJ6CH5cFqOzg==
X-CSE-MsgGUID: zIRDsNVbSfubKPeV5+ZsVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="50853234"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="50853234"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 06:19:53 -0700
X-CSE-ConnectionGUID: mqFwrboDSI+BcEJZMcC7dw==
X-CSE-MsgGUID: TpT4YKH9SAKoduFjB6H+5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="149142659"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 06:19:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 30 May 2025 06:19:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 30 May 2025 06:19:52 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.52)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 30 May 2025 06:19:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPF8R2fpVuOvk1IZ/wJnylza+06bGPHLUY1J/czECHgtRil8aHK66NZ/9OwuF7969xu6y/YhTXfecHDX92KNVkxSNhzJogYZTH9XhHw30ntM7g8WP8Oy1BtgOmgbu1kuEG+gDh1DWUi1PDKNovwPR/Enyjep6YUx53aXWV8EcNLVemih/0tu/lYdL3HuosBThj+1GtkG9qJgUhwfvnFkX5HbwNC0ez/uzCSLfH4efyH+CewaTTjucPlnpm26WGOigGUDXcsWA+ZrqG+dWuULmneEr0UpMTci+XgffQ9SvVg32lDGCNYCY41qQ2HDiVtw8cpf50KP1d5xecTIiaVViw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mfr6cAhxU/niKBSRrDMxuKcoutn7f3GBGm4ejDsCF2Y=;
 b=RUZGyafxhYH0NLDz3EE+UQG6P8K5/QbYHesJ1S555fSWheFL36JHb9WliBjwspSU4SFTMYCHC2ilzlblJ7eUOMoN51KmHESvayDd+J1ntVXVHZEnL1zy7dqV272WU/1mWHHgEPFRcdvyhZWY7aLzVHLQd/8DNAyfvv1eCLd//jPcDsRT2IqZLYBZtLiQDPlWvDDAcHOGiBsXOXqeZPjwPpo0aOqWTNdWSvnG7yvmLLLpuLqiOqqMsS58WZyfvKU8dwUn8s7qEXbpM04BttAxfIQ0dTrcD81pUgIPrurzCsObJn7zCGurD5HsWe9iGJbeju1JsTIHZc/N5zO3uXOaeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SN7PR11MB6727.namprd11.prod.outlook.com (2603:10b6:806:265::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Fri, 30 May
 2025 13:19:36 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%7]) with mapi id 15.20.8769.031; Fri, 30 May 2025
 13:19:36 +0000
Date: Fri, 30 May 2025 09:19:33 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/bmg: Update Wa_22019338487
Message-ID: <aDmwZTsweYLjQTwl@intel.com>
References: <20250530082047.742183-1-vinay.belgaumkar@intel.com>
 <20250530082047.742183-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250530082047.742183-3-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: BYAPR08CA0061.namprd08.prod.outlook.com
 (2603:10b6:a03:117::38) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SN7PR11MB6727:EE_
X-MS-Office365-Filtering-Correlation-Id: 886cd0b6-b543-434b-4f9e-08dd9f7c9fa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tDt4nn5WoucBCx7lSctIVPzzayG/UxJCBngi977v6MFWyjKD6Y60Nrj/ZwO0?=
 =?us-ascii?Q?jFClNQMcS2yRD9UK10yu8c6GB4FXDvckKpp+K2KUEBf4H77nSheWk8TyXOXs?=
 =?us-ascii?Q?6EqcnhQdHXXA6l+M+RjVDXWZyQfgw0AAAbW7rwO0RR5uTx/dU+KdK16aJmmy?=
 =?us-ascii?Q?5CyvucRvik7CI7RTdqJfFElbyzdJIX1w8JNPwCqt3J7+BdVZMV7gmfgQ6xS6?=
 =?us-ascii?Q?EuH9qZwoKJGwJ2SONCA2lTpHNZdl9fE0YMXCjQ9/XbZBXNgZw6kQ6jTw6O5X?=
 =?us-ascii?Q?yPVGmXBA8U5ClPw3Q6ddTdDPHRUa3BluMNViLSqdY+e+1pzOM0t2FalyUg5H?=
 =?us-ascii?Q?QYLosVS/3tKiA8eYdqeZlP+65cQCdBI1Etp0ky43bGn6yYXtRVIlwccAzG/0?=
 =?us-ascii?Q?WakM37xdne6fNuoX6WAMKqxItDRDEEsRYhyxTfMdh70rvEA4FteJOgIBhfnk?=
 =?us-ascii?Q?stfI2OpUZ12TmsGbATX6ieIQ7BLT5hez4qydi7cIpuLSA3f7F17bDVWqBpdy?=
 =?us-ascii?Q?RoEL2vzUEowW4pCNne6ihHzipuP421KOignx7A9YDYHGUD4V82jxN6sf4Ww8?=
 =?us-ascii?Q?93RMcGwngnPf4CDmUM12l7QLbY1+rqsPL57u7CRfHunja9aKuQ2/DBiwa5l4?=
 =?us-ascii?Q?OjNyEkTdt2J8hCfOAkfuyyhSKa2BqgAFf5IRjmKfYTzf8iUgEZdhSNTSgzp/?=
 =?us-ascii?Q?6KkmnBoBT8qwAo0vRMLeakwRkOUgvt1lfOIfeq3rCWGwpAdopEFzSqeUlH63?=
 =?us-ascii?Q?jiM9H9iO4Lt8bhVmp6WRGaiSZBnB3phnmuV4hmQYeskDIOdQm7DVD9tUUYHS?=
 =?us-ascii?Q?TdVaedXRNrsk0UBDmsF4S+xph2yWGfBRz8bIR0aMf50pcjRcLZME464GbtA5?=
 =?us-ascii?Q?mJCQQe5Ujgy08lrEqo60mcXH5SpZNh/YO/ibGmc+ur1we1dV9nprrjPZDvIL?=
 =?us-ascii?Q?w8z/bN67O+WouPabr9HtoOP9xqld01jBPYYBqnGxfX8EFqEcJYv/IHLSanAV?=
 =?us-ascii?Q?CMkO5IdWyQYejk9pn71y4RFGOFVf4HkUSvhkdyQvVRTVpKAS1kNZwIEAdAYt?=
 =?us-ascii?Q?fh/x++VFc27CzGEaHEDQv6buTN+Buu/sD1o4BkICWHPHflp6dBBwYIkNpDiw?=
 =?us-ascii?Q?RjFQkFIzSQuUB+G3dNRfrnjypFL7QwW8RDFYABI0+HWuBREUygqoK00KcwEa?=
 =?us-ascii?Q?AzoNrw3vFZlEu/hfkI/b9XTti3Z4GAkHhFJXxfCiRUbi+ByRUOXcLraBMWpZ?=
 =?us-ascii?Q?qqDZu87aikVc32bnd71hwLlA+b14vrVU/OLi7GfXJ80P+yQTZ7GK+H5bFXZI?=
 =?us-ascii?Q?Yc/rXPF3c8TanzQ+FoCWnysMy2I4e4IZ3xZJBE8Ykma2t37m1Tpy4fZzoaRd?=
 =?us-ascii?Q?7e7jZEFEg4oW0ApKpWahQv3y3p3f1400vnHV/bnU58uUM1xgxlIH3jPHGcqF?=
 =?us-ascii?Q?nwZBFFqx6r4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4n6QqYm2o2OsFdlmHQVyoQ7EjHlipcujeeqJ4Le9PdlQLhqfOWucmTR8GvwO?=
 =?us-ascii?Q?HPMiJTY/o8O6Flb3BqH0jD/Iim/b+aPBJV4jFziB29nY97CPRYCgUkzU7att?=
 =?us-ascii?Q?LK1f8XucrUM1QxN+qPMWBN1xU45zWt7oa3R4W5SeuxLzmFp2a0PR/zeeM548?=
 =?us-ascii?Q?TqUs1QLp1ZA4N4Vht1TTEhVkj7byWhr1u4vZq3dSDLl7Naw+rfxssy5NRGQ6?=
 =?us-ascii?Q?u5lx0+7eGqH7AZP1NlOaUT4kLd+d/YnWoVR6uYjNa0Ao+XuinqG69pRItDEY?=
 =?us-ascii?Q?4MbtwzRKcWyFrY3uRdJp2DIvoDSfh3CQd0CUqrDrCmyMzM5pH2I2XPBDZ8oA?=
 =?us-ascii?Q?nr9xohGRvsZO4eiYhl5afBRPh6qXKn8lVtEQJLD0CCEEC0CAbfbAYnbiQrKl?=
 =?us-ascii?Q?Hhx1bdnh183HXxGtT7mTLnTMkvW+O07nvtduDqM7RuT6g/JRAauxTx5OMgJD?=
 =?us-ascii?Q?nZjumym0KrnNgWQifjXkbAxCkC/dAB5Fl19nh1LXocbfi6sk4a22pfknDUQe?=
 =?us-ascii?Q?CUwfquRGwqViJz210Jn0yyIqOPpbxIGoPohIxXq7FJnrHExehim1nVR4Y3Cp?=
 =?us-ascii?Q?mnLj/5INmN3b4G+2oGE/ysjET/xKiU5mdX8+P9WvBEzBXHXTtLhdWvn9jGW4?=
 =?us-ascii?Q?dKDBAHgwhnnylhGfDjL7ANDaem91VWq/JVPay4vlLrtK0NLQOv/hA8iVx/aK?=
 =?us-ascii?Q?D9nDHOPKc8GCVrO++xOVTSuOtf85JMuGJH9ubNPiomp7pbGVAcAag3iGusQj?=
 =?us-ascii?Q?2p0blK3dNdtja7lPswgGCBi+TGyt8JOYDI5FFQdZaCVhl97Va6eYDMOR9w82?=
 =?us-ascii?Q?3TSmVefgTp3dgxSF4IV1Z0eYG5leX8olQKH9rRnlWHFMFBTfAG4tWr/yvelQ?=
 =?us-ascii?Q?kDyXkQdbPPHpXHw7e2yGq1+2mZFmw/M7r/wHo/44seL3DIHFqfekiKdq6MC0?=
 =?us-ascii?Q?zZ46gAX1VB/73XcylyueHe+eJ0jAugZrPSo0KXyjjr5MVf6xiPwZQfSs6R0v?=
 =?us-ascii?Q?fNz57hvpuBfU+l2KeIYJuPGVdoaXSshdfCud2vmxY/u5obM2g9d1WgfcE49v?=
 =?us-ascii?Q?CKS25B5WQ7USYNEqhqmYCJ2/UqZ3JSNAi22rrad0ZbS9f8hTd216GFc/mC2F?=
 =?us-ascii?Q?NTiNdF9/fhKNvnuda3DK3t6KnigzfpYysRBE4yfFG3coTOX4DlwlvanIm8vp?=
 =?us-ascii?Q?FanI6JMIdKI5S5U2K55/xykAiBK3EuK7ApAWgm4VfjNWPDbUgrrT04o89BYU?=
 =?us-ascii?Q?lln6z4PnRyZlUzlgmaVWkoAb2r2lDk2IFLhJ5hDcGCbxNO5toVSLawVw/EIi?=
 =?us-ascii?Q?XL6UtW0kdVYVJLoFcqpzL1p+juEFf1UM8KheY+ZaWTultBehOtMUJJjgTBsl?=
 =?us-ascii?Q?4IRVjYS5EXae90iAZ4exaAuxdUByW7Aq7QWl+BnBmamt5x+R4lQsy0XI1+GO?=
 =?us-ascii?Q?TfjnoFLyIO+/wvGHwBsavJ9oYjY5akwCYyuKkIeEEPOi17BAWLR3hH9QA6YP?=
 =?us-ascii?Q?ntIjAx281NAeQ+pjDNRuflxLbyvvN2grVUCJXTMCdzSbePIDRRQHRI77bMmW?=
 =?us-ascii?Q?zl8th8yYclNqEX0YQZQvTC3vKl9XJIZHh0JNRvFJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 886cd0b6-b543-434b-4f9e-08dd9f7c9fa7
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 13:19:36.2944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QIq7RuXmB7/DHlZ4uRDukWrODmCAWIaaIAsM+cC4y/oYP5rueF0ZYrCP7sd484WGGrMdSEZtSX4WbRB/Qhx7qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6727
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

On Fri, May 30, 2025 at 01:20:46AM -0700, Vinay Belgaumkar wrote:
> Limit GT max frequency to 2600Mhz during the L2 flush. Also, ensure
> GT actual frequency is limited to that value before performing the
> cache flush.
> 
> Fixes: aaa08078e725 ("drm/xe/bmg: Apply Wa_22019338487")
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 11 +++++-
>  drivers/gpu/drm/xe/xe_guc_pc.c | 68 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_pc.h |  2 +
>  3 files changed, 79 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 660b0c5126dc..6a115bd77d1c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -40,6 +40,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_guc.h"
> +#include "xe_guc_pc.h"
>  #include "xe_hw_engine_group.h"
>  #include "xe_hwmon.h"
>  #include "xe_irq.h"
> @@ -1000,16 +1001,19 @@ void xe_device_wmb(struct xe_device *xe)
>   */
>  void xe_device_td_flush(struct xe_device *xe)
>  {
> -	struct xe_gt *gt;
> +	struct xe_gt *gt = xe_root_mmio_gt(xe);
>  	unsigned int fw_ref;
> +	u32 gt_max_freq;
>  	u8 id;
>  
>  	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) < 20)
>  		return;
>  
> +	xe_guc_pc_flush_wa_22019338487_start(&gt->uc.guc.pc, &gt_max_freq);

There are 2 things that I don't like here to start with:

1. The wa_1234 in the function name. Please make it as generic as possible.
Then check for its need inside with the WA_ check.

2. gt_max_freq as a cookie to be returned. For multiple reasons.
 a. This is kind of ugly that flush memory operations should care about the
    freq and then return it later.
 b. What happens on a race condition?
    process a - get max 2000 - set to 1200 temporarily
    process b - get max 2600
    process a - returns max to 2000
    process b - returns max to 2600

Make it in a way that the desired max freq is saved with locking mechanisms
inside some freq or pc struct. Then while we have this max stashed we refuse
any write to max_freq with some new return error and debug msg... or perhaps
the set max function waits for that to be unset since flush is fast operation...

> +
>  	if (XE_WA(xe_root_mmio_gt(xe), 16023588340)) {
>  		xe_device_l2_flush(xe);
> -		return;
> +		goto done;
>  	}
>  
>  	for_each_gt(gt, xe, id) {
> @@ -1034,6 +1038,9 @@ void xe_device_td_flush(struct xe_device *xe)
>  
>  		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  	}
> +
> +done:
> +	xe_guc_pc_flush_wa_22019338487_end(&gt->uc.guc.pc, gt_max_freq);
>  }
>  
>  void xe_device_l2_flush(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 513657154dbe..4c4c7498e5e7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -52,9 +52,11 @@
>  #define LNL_MERT_FREQ_CAP	800
>  #define BMG_MERT_FREQ_CAP	2133
>  #define MIN_FREQ_WA_14022085890	1200
> +#define BMG_MERT_FLUSH_FREQ_CAP	2600
>  
>  #define SLPC_RESET_TIMEOUT_MS 5 /* roughly 5ms, but no need for precision */
>  #define SLPC_RESET_EXTENDED_TIMEOUT_MS 1000 /* To be used only at pc_start */
> +#define SLPC_ACT_FREQ_TIMEOUT_MS 100
>  
>  /**
>   * DOC: GuC Power Conservation (PC)
> @@ -869,6 +871,71 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
>  	return ret;
>  }
>  
> +static int wait_for_act_freq_limit(struct xe_guc_pc *pc, u32 freq)
> +{
> +	int timeout_us = 1000 * SLPC_ACT_FREQ_TIMEOUT_MS;
> +	int slept, wait = 10;
> +
> +	for (slept = 0; slept < timeout_us;) {
> +		if (xe_guc_pc_get_act_freq(pc) <= freq)
> +			return 0;
> +
> +		usleep_range(wait, wait << 1);
> +		slept += wait;
> +		wait <<= 1;
> +		if (slept + wait > timeout_us)
> +			wait = timeout_us - slept;
> +	}
> +
> +	return -ETIMEDOUT;
> +}
> +
> +static bool needs_flush_wa_22019338487(struct xe_guc_pc *pc)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +
> +	if (XE_WA(gt, 22019338487)) {
> +		if (pc->rp0_freq > BMG_MERT_FLUSH_FREQ_CAP)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +void xe_guc_pc_flush_wa_22019338487_start(struct xe_guc_pc *pc, u32 *gt_max_freq)

please document every export/public function.

> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	int ret;
> +
> +	if (!needs_flush_wa_22019338487(pc))
> +		return;
> +
> +	ret = xe_guc_pc_get_max_freq(pc, gt_max_freq);
> +	if (!ret) {
> +		ret = xe_guc_pc_set_max_freq(&gt->uc.guc.pc, BMG_MERT_FLUSH_FREQ_CAP);
> +		/* Wait for actual freq to go below the flush cap */
> +		if (!ret) {
> +			ret = wait_for_act_freq_limit(pc, BMG_MERT_FLUSH_FREQ_CAP);
> +			if (ret)
> +				xe_gt_err_once(gt, "Actual freq did not reduce to %u, %pe\n",
> +					       BMG_MERT_FLUSH_FREQ_CAP, ERR_PTR(ret));
> +		}
> +	}
> +}
> +
> +void xe_guc_pc_flush_wa_22019338487_end(struct xe_guc_pc *pc, u32 gt_max_freq)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	int ret;
> +
> +	if (needs_flush_wa_22019338487(pc)) {
> +		ret = xe_guc_pc_set_max_freq(&gt->uc.guc.pc, gt_max_freq);
> +		if (ret)
> +			xe_gt_err_once(gt, "Unable to restore max freq to %u:%pe",
> +				       gt_max_freq, ERR_PTR(ret));
> +	}
> +}
> +
>  static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
>  {
>  	int ret = 0;
> @@ -880,6 +947,7 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
>  		ret = xe_guc_pc_get_min_freq(pc, &pc->stashed_min_freq);
>  		if (!ret)
>  			ret = xe_guc_pc_get_max_freq(pc, &pc->stashed_max_freq);
> +
>  		if (ret)
>  			return ret;
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 0a2664d5c811..8424c68cfb1d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -38,5 +38,7 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
>  void xe_guc_pc_init_early(struct xe_guc_pc *pc);
>  int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc);
>  void xe_guc_pc_raise_unslice(struct xe_guc_pc *pc);
> +void xe_guc_pc_flush_wa_22019338487_start(struct xe_guc_pc *pc, u32 *gt_max_freq);
> +void xe_guc_pc_flush_wa_22019338487_end(struct xe_guc_pc *pc, u32 gt_max_freq);
>  
>  #endif /* _XE_GUC_PC_H_ */
> -- 
> 2.38.1
> 
