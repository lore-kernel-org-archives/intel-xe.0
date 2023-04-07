Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535E8C76196
	for <intel-xe@archiver.kernel.org>; Fri,  7 Apr 2023 04:18:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1287710E236;
	Fri,  7 Apr 2023 04:18:55 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D262D10E236
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Apr 2023 04:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680841133; x=1712377133;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/ysRT25o84Dw5pNA9XxZQANTP30eabU0rzVZJ71mfg0=;
 b=IctUE8aGX2Jjiay9iDXipfd3x+ilvqFMsBIewbj5TqVjtFhsKVXvMbDj
 KMxg+CZwjUsAOJEmvHr/1uL2A2PiLCDB5kodYTTi2pQkf905Cuz0G3sVZ
 wISNjqOOwxc5LJUAYnwXfpCs46CB27e95ZXnPb3jHvdffpVI4dS+7GuEM
 DXSH/YN6c/pIwpu86I5rwl+iN02RfD1YbtH3FlooM5D770SOqntbdMhr0
 qjpeyirwoDC6wgOtLl4Df9AMAb/2SsGi1G22J1ufXFp302zV9pcymOGR0
 SRyyAiwBSx6qU1IYfE20STFU+FfWqS9kEml/YicYDEOg0pjNKmiZ83XqT A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="326994521"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; d="scan'208";a="326994521"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 21:18:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="776727321"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; d="scan'208";a="776727321"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 06 Apr 2023 21:18:52 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 21:18:50 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 21:18:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 6 Apr 2023 21:18:49 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 6 Apr 2023 21:18:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hP8i5H80kKVB9NrSyuYfr97IrcJ3bxK3TCIta6KZoy2ZBUkcu+tIYfVKSLnMW3PlmXBvsSs2VYqFtPHln5XVqy3fJvzJrRjqXRDIMUbwOSIEQGkgKFDEs6e6G4yMoLvCoZ0P+lbvAuyVAIS+xhcwbi6TIMxvc9cWBoIiwgtacRwyPlMlxuh30sRlCX1rzh5bdJZqyMbO17+yCpDL/RBk5mSUhIDmeh0Xa4kNm6RXCxM7jU7h1YesJ4XndYSpsVUNbnnxzq1DXqCK6OoLE4i0wpFy+oz46Z8wu29qNZnk+EFLAYIUpoKfWKW0zTQEdSz/MaK+cHOEBH90CwDA2qBBPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYTX4zvxDa1EpS7OSe6d3X1z5tN5YCgHTdUsb37B2T4=;
 b=TmOraMc9gB48OB2rubAWIUcnx2cFl8+H+ZVRT71d4cbaFQC8ML8AMgk4qKlvutL65iLouaGrR7W49B77VJL/HeRdY0+04M4FNlmPYHkrwd6r3jJkvBF6Jjv9/6t3FFTlgfYJN15UTGCPjCZ7cV6R2pj0GHznz77/QAP7DrnU0UKIDYHh9TjzpLx2HnUfnzOkCyF9TSDRnZ95fENY55Y035BxyFgny7BRDLMTWIxM+89moCb9HQqE0J5kKRfyBfAb1gyBlOZEh0gKthGSsxaNo51aN/pdWiJsPDjVegmsa37YHynbMMy1N4t1Xo8LlACXEX7CZQxum3outXmqQ+QMiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB7690.namprd11.prod.outlook.com (2603:10b6:8:e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.33; Fri, 7 Apr
 2023 04:18:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6277.030; Fri, 7 Apr 2023
 04:18:40 +0000
Date: Thu, 6 Apr 2023 21:18:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230407041838.jetd7dxkxg2gzzxs@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230406235621.1914492-1-matthew.d.roper@intel.com>
 <20230406235621.1914492-8-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230406235621.1914492-8-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR11CA0077.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB7690:EE_
X-MS-Office365-Filtering-Correlation-Id: 6af07399-6dda-4049-9520-08db371f2a6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AGgx8ODWsHfTMG+C1Nx1oVB9bDNpAiW6vq5GX5E449Ka1QMtsUz19rXGs8PVsjeDjXu1dfgXLj6S3iuJ+CNTOP5yE0LR5qergwuhwRbOlOyAW5PuUBJq2wpCX6EgQ8SfHymb/X/gtLM5oPWzhCMRm/mKOHuGvYqiW7hlAiuWlhU2/wA5FZD6bVNaMRLaUl0YqlWl3emONWHwpwg7lXW3PAcZXN3CAISWgFKrvIn0vJwIe6BuoHQWpQ58kZllN6oO/BjPZRrXje034d7R5R2osXBqT90RZoW30WWYLIluLfuoPRpfG9PWCwVSju5dPWcp1wrKGCT2EzjXIzWoIkJLG5gis3Hvlh1BaubHwbBAAjEVP9L/L7EQm4XOToB+DQ8PlMWYo84JkAlypbcxeDnoQCZkXLPCrRwFAxZKYibLTWNTB0AfLE5W2yHSsGfISXPIB7frjkiSWoIOeiBpAQB4OdRX1FifkAPPOub94k5ITZInYb8308DXXJAvJSkF7OTfe6YxVUop/WQ3XlN+slIDk9mIynEmsLFKYA5DWdqg3mEqFrzqImQhvWzAEEra6MqV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(136003)(366004)(346002)(376002)(451199021)(66476007)(66556008)(316002)(66946007)(4326008)(8676002)(83380400001)(6636002)(478600001)(8936002)(6862004)(38100700002)(82960400001)(41300700001)(86362001)(30864003)(5660300002)(2906002)(6506007)(6512007)(1076003)(26005)(9686003)(6486002)(186003)(107886003)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x6v/sK8thGf/nk9CY7506fiF98rDh44rS6nrwZBsY8bbM4tDFVK/81H2qteP?=
 =?us-ascii?Q?W7Hy1h8W8YtVU3+ztK3XaNjPe+HYnZXb4FOt9jOH+tz9dWTYR+UwbR7jrxLG?=
 =?us-ascii?Q?dh+U3LiSP2xNzMBwb2Evi76J/Iehpq4ywc+iNU6VAfS4DNzl9lZtn3KX/ttT?=
 =?us-ascii?Q?wTEPCOvdIU6FdDZq0y+9Osa/Tnt6XMR29BH+cbCmjQLFNssSWtJM5ozlHu6b?=
 =?us-ascii?Q?SYvpsGwWkXpx0w8ros8OAUx7iyfEACrDduY8j3H/OccL2TVYPxX3xJEZ+5Jm?=
 =?us-ascii?Q?X6qhjOOE1VT+oDun7Twj9SdvnFCimQn/c+FHuGNO5iK4OUUDSCYWC6DCDCP+?=
 =?us-ascii?Q?1SlEqOKf0djaLIRSZ/wAZp1tt6nTktiivwH+JnAAtEZEFevA722gHGaXxcpx?=
 =?us-ascii?Q?e2hEdB1rHdEeA36zPLGHLalbuWevP7AIdy6jgs5SjTLTPUo1bUWGssTVJErw?=
 =?us-ascii?Q?8we+y7YFY2mWgw5N9hszAQaE5j2bdfbdNoNykUtmIrnrQJ1JgW+QqN//5f3U?=
 =?us-ascii?Q?JNHpV+j3ZhSRQ7pP6o2suRMKpgufo5H1cmLgdCu6+sJ3PaV0gnYNNf6oIx2U?=
 =?us-ascii?Q?RA8TWKSZhNKVp+joQrBEL4l+Wd4q2VJUui+nxmpAyWBYFyAummCZHWXpH2mn?=
 =?us-ascii?Q?5gqmv/bFY8m84FLUe+FWLGHw9fq7YVgY/Cl7HS1hhTZ33kA8XlYL8QGCEy2e?=
 =?us-ascii?Q?ISNI0/qY8uiVsctqpzaBt0vfACsMLCa2AZlLck+mNh4Vvl/LTkBsGZY87sR7?=
 =?us-ascii?Q?gexaMu9fpDjs+5/Lt/wVBWsKoFTqHn6vCUIgNx1Ppc4g2FXPKnJLkRIB5E0z?=
 =?us-ascii?Q?zCudSHweANEEwkIVdt2aW6o1l5zNG6hsTIBOLieHag/irWLguww5oFXCQbtj?=
 =?us-ascii?Q?nC7njcIL2IHlgv1hf5IeCtEN9UDDxaWpcHBOi7ThEWyLMnat8kKNOO9axLcS?=
 =?us-ascii?Q?mqD9E66VmipgE1pFXuL4SQRYeBtG10Joeovv0IFzZWd/5QAup6GpSJw5V5/l?=
 =?us-ascii?Q?QSiROFH89wbyV3ciR063nAymKTBjh60IuKerQoXZlryC/YJuercU07T4UNjF?=
 =?us-ascii?Q?c3pwlBRi0kNrcwXn8F1VL40XlZMj95l3/LQfH8zR1VFn09x84iWpfMfZt7cQ?=
 =?us-ascii?Q?s2w1WNHmqM8RtOFEyhGC864RXTpxWZ21LHxMesAO0pl+G7CbWEUVK7aJTk1m?=
 =?us-ascii?Q?KgZ1hCAaM+Sak4eLNXIU7dKS+6yZehDlewt7+LkthCwFwzmbS9uvHP2s8VTE?=
 =?us-ascii?Q?rVUO25x8DCFzuWeBowrUU/KeQ+jKlG4nai2AAF8klQF5zwCj8Tbdggcof2MS?=
 =?us-ascii?Q?YU1tNg0aTmWFoHtJgLe3YQzIPD5NpVo6yq01lfdb74RSJ7InUtZiuWPMoDom?=
 =?us-ascii?Q?Ei8RVbzExV7XlorJJPZXCQ+nSi7DiLg/Wt1UtJ/cCISnp9JqnA1odB/n51U/?=
 =?us-ascii?Q?VA1gGG0YgVpH3skLwByOC8D4b0YeN45H50xAYzVVsNJlXfrVAF9bD1T2ceMW?=
 =?us-ascii?Q?sWmmPFytP5AqItqtlLhuCIDODEU3QpdHPnljknm4EuNvlMMM7j7xJ4GFS+AJ?=
 =?us-ascii?Q?PS497qyhNQP02YMjTgGN+tiLiLWtnf0kQ910RpUCBK2tMVZmTV1PlSG6JHvp?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af07399-6dda-4049-9520-08db371f2a6a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2023 04:18:40.0050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +8zFqCEAmUwliE8kWGgl/gCffo+yZPhFbUVhqubiQyYTfXiEuomz++TZV5rVeo1lAAkIbcl5eCKbjO4yjeohMWVWQ0M87WICZPz0Wy2wO/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7690
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 7/9] drm/xe: Select graphics/media
 descriptors from GMD_ID
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

On Thu, Apr 06, 2023 at 04:56:19PM -0700, Matt Roper wrote:
>If graphics_desc and media_desc are not specified in a platform's
>xe_device_desc, treat this as an indication that the IP version should
>be determined from the hardware's GMD_ID register.
>
>Note that leaving media_desc unset for a platform that simply doesn't
>have the IP (e.g., PVC) is also okay --- a read of the GMD_ID register
>offset will be attempted, but since there's no register at that location
>a value of '0' will be returned, effectively disabling media support.
>
>Mapping of version -> IP description is done via a table lookup; this
>table will be re-used in future patches for some KUnit testing.
>
>v2:
> - Drop dummy structures.  NULL can be safely used for both the GMD_ID
>   cases and the "media not present case."
> - Use a table-based lookup of GMD_ID versions rather than a simple
>   switch statement; the table will allow us to easily perform kunit
>   testing of all the IP descriptors.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_gt_regs.h |   6 +
> drivers/gpu/drm/xe/xe_pci.c          | 184 +++++++++++++++++++++------
> drivers/gpu/drm/xe/xe_pci.h          |   5 +
> 3 files changed, 159 insertions(+), 36 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index a8a37e6a45a3..f174758d8307 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -22,6 +22,12 @@
> #define FORCEWAKE_ACK_MEDIA_VDBOX_GEN11(n)	_MMIO(0xd50 + (n) * 4)
> #define FORCEWAKE_ACK_MEDIA_VEBOX_GEN11(n)	_MMIO(0xd70 + (n) * 4)
> #define FORCEWAKE_ACK_RENDER_GEN9		_MMIO(0xd84)
>+
>+#define GMD_ID					_MMIO(0xd8c)
>+#define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
>+#define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
>+#define   GMD_ID_STEP				REG_GENMASK(5, 0)
>+
> #define FORCEWAKE_ACK_GT_MTL			_MMIO(0xdfc)
>
> #define GEN9_LNCFCMOCS(i)			_MMIO(0xb020 + (i) * 4)	/* L3 Cache Control */
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 4442fb58202e..c10f2d45ae91 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -15,6 +15,7 @@
> #include <drm/xe_pciids.h>
>
> #include "regs/xe_regs.h"
>+#include "regs/xe_gt_regs.h"
> #include "xe_device.h"
> #include "xe_display.h"
> #include "xe_drv.h"
>@@ -144,9 +145,6 @@ static const struct xe_graphics_desc graphics_xehpc = {
>
> static const struct xe_graphics_desc graphics_xelpg = {
> 	.name = "Xe_LPG",
>-	.ver = 12,
>-	.rel = 70,
>-
> 	.hw_engine_mask =
> 		BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
> 		BIT(XE_HW_ENGINE_CCS0),
>@@ -177,9 +175,6 @@ static const struct xe_media_desc media_xehpm = {
>
> static const struct xe_media_desc media_xelpmp = {
> 	.name = "Xe_LPM+",
>-	.ver = 13,
>-	.rel = 0,
>-
> 	.hw_engine_mask =
> 		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
> 		BIT(XE_HW_ENGINE_VECS0),	/* TODO: add GSC0 */
>@@ -281,12 +276,7 @@ static const struct xe_gt_desc xelpmp_gts[] = {
> };
>
> static const struct xe_device_desc mtl_desc = {
>-	/*
>-	 * FIXME:  Real graphics/media IP will be mapped from hardware
>-	 * GMD_ID register.  Hardcoded assignments here will go away soon.
>-	 */
>-	.graphics = &graphics_xelpg,
>-	.media = &media_xelpmp,
>+	/* .graphics and .media determined via GMD_ID */
> 	.require_force_probe = true,
> 	PLATFORM(XE_METEORLAKE),
> 	.extra_gts = xelpmp_gts,
>@@ -295,6 +285,17 @@ static const struct xe_device_desc mtl_desc = {
> #undef PLATFORM
> __diag_pop();
>
>+/* Map of GMD_ID values to graphics IP */
>+static struct gmdid_map graphics_ip_map[] = {
>+	{ 1270, &graphics_xelpg },
>+	{ 1271, &graphics_xelpg },
>+};
>+
>+/* Map of GMD_ID values to media IP */
>+static struct gmdid_map media_ip_map[] = {
>+	{ 1300, &media_xelpmp },
>+};
>+
> #define INTEL_VGA_DEVICE(id, info) {			\
> 	PCI_DEVICE(PCI_VENDOR_ID_INTEL, id),		\
> 	PCI_BASE_CLASS_DISPLAY << 16, 0xff << 16,	\
>@@ -384,31 +385,135 @@ find_subplatform(const struct xe_device *xe, const struct xe_device_desc *desc)
> 	return NULL;
> }
>
>-static void xe_info_init(struct xe_device *xe,
>+static u32 peek_gmdid(struct xe_device *xe, u32 gmdid_offset)
>+{
>+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>+	void __iomem *map = pci_iomap_range(pdev, 0, gmdid_offset, sizeof(u32));
>+	u32 ver;
>+
>+	if (!map) {
>+		drm_err(&xe->drm, "Failed to read GMD_ID (%#x) from PCI BAR.\n",
>+			gmdid_offset);
>+		return 0;
>+	}
>+
>+	ver = ioread32(map);
>+	pci_iounmap(pdev, map);
>+
>+	return REG_FIELD_GET(GMD_ID_ARCH_MASK, ver) * 100 +
>+		REG_FIELD_GET(GMD_ID_RELEASE_MASK, ver);
>+}
>+
>+static void handle_gmdid(struct xe_device *xe,
> 			 const struct xe_device_desc *desc,
>-			 const struct xe_subplatform_desc *subplatform_desc)
>+			 const struct xe_graphics_desc **graphics,
>+			 const struct xe_media_desc **media)
>+{
>+	u32 ver;
>+
>+	if (desc->graphics) {
>+		/*
>+		 * Pre-GMD_ID platform; device descriptor already points to
>+		 * the appropriate graphics descriptor.
>+		 */
>+		*graphics = desc->graphics;
>+		xe->info.graphics_verx100 = (*graphics)->ver * 100 + (*graphics)->rel;
>+	} else {
>+		/*
>+		 * GMD_ID platform; read IP version from hardware and select
>+		 * graphics descriptor based on the result.
>+		 */
>+		ver = peek_gmdid(xe, GMD_ID.reg);
>+		for (int i = 0; i < ARRAY_SIZE(graphics_ip_map); i++) {
>+			if (ver == graphics_ip_map[i].ver) {
>+				xe->info.graphics_verx100 = ver;
>+				*graphics = graphics_ip_map[i].ip;
>+
>+				break;
>+			}
>+		}
>+
>+		if (!xe->info.graphics_verx100) {
>+			drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n",
>+				ver / 100, ver % 100);
>+		}
>+	}
>+
>+	if (desc->media) {
>+		/*
>+		 * Pre-GMD_ID platform; device descriptor already points to
>+		 * the appropriate media descriptor.
>+		 */
>+		*media = desc->media;
>+		xe->info.media_verx100 = (*media)->ver * 100 + (*media)->rel;
>+	} else {
>+		/*
>+		 * GMD_ID platform; read IP version from hardware and select
>+		 * media descriptor based on the result.
>+		 *
>+		 * desc->media can also be NULL for a pre-GMD_ID platform that
>+		 * simply doesn't have media (e.g., PVC); in that case the
>+		 * attempt to read GMD_ID will return 0 (since there's no
>+		 * register at that location).
>+		 */
>+		ver = peek_gmdid(xe, GMD_ID.reg + 0x380000);
>+		if (ver == 0)
>+			return;
>+
>+		for (int i = 0; i < ARRAY_SIZE(media_ip_map); i++) {
>+			if (ver == media_ip_map[i].ver) {
>+				xe->info.media_verx100 = ver;
>+				*media = media_ip_map[i].ip;
>+
>+				break;
>+			}
>+		}
>+
>+		if (!xe->info.media_verx100) {
>+			drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n",
>+				ver / 100, ver % 100);
>+		}
>+	}
>+}
>+
>+
>+static int xe_info_init(struct xe_device *xe,
>+			const struct xe_device_desc *desc,
>+			const struct xe_subplatform_desc *subplatform_desc)
> {
>+	const struct xe_graphics_desc *graphics_desc = NULL;
>+	const struct xe_media_desc *media_desc = NULL;
> 	struct xe_gt *gt;
> 	u8 id;
>
>-	xe->info.graphics_verx100 = desc->graphics->ver * 100 +
>-				    desc->graphics->rel;
>-	if (desc->media)
>-		xe->info.media_verx100 = desc->media->ver * 100 +
>-					 desc->media->rel;
>+	/*
>+	 * If this platform supports GMD_ID, we'll detect the proper IP
>+	 * descriptor to use from hardware registers.
>+	 */
>+	handle_gmdid(xe, desc, &graphics_desc, &media_desc);
>+
>+	/*
>+	 * If we couldn't detect the graphics IP, that's considered a fatal
>+	 * error and we should abort driver load.  Failing to detect media
>+	 * IP is non-fatal; we'll just proceed without enabling media support.
>+	 */
>+	if (!graphics_desc)
>+		return -ENODEV;
>+
> 	xe->info.is_dgfx = desc->is_dgfx;
> 	xe->info.platform = desc->platform;
>-	xe->info.graphics_name = desc->graphics->name;
>-	xe->info.media_name = desc->media ? desc->media->name : "none";
>-	xe->info.dma_mask_size = desc->graphics->dma_mask_size;
>-	xe->info.vram_flags = desc->graphics->vram_flags;
>-	xe->info.vm_max_level = desc->graphics->vm_max_level;
>-	xe->info.supports_usm = desc->graphics->supports_usm;
>-	xe->info.has_asid = desc->graphics->has_asid;
>-	xe->info.has_flat_ccs = desc->graphics->has_flat_ccs;
>+	xe->info.graphics_name = graphics_desc->name;
>+	xe->info.media_name = media_desc ? media_desc->name : "none";
> 	xe->info.has_4tile = desc->has_4tile;
>-	xe->info.has_range_tlb_invalidation = desc->graphics->has_range_tlb_invalidation;
>-	xe->info.has_link_copy_engine = desc->graphics->has_link_copy_engine;
>+
>+	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
>+	xe->info.vram_flags = graphics_desc->vram_flags;
>+	xe->info.vm_max_level = graphics_desc->vm_max_level;
>+	xe->info.supports_usm = graphics_desc->supports_usm;
>+	xe->info.has_asid = graphics_desc->has_asid;
>+	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
>+	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
>+	xe->info.has_link_copy_engine = graphics_desc->has_link_copy_engine;
>
> 	/*
> 	 * All platforms have at least one primary GT.  Any platform with media
>@@ -419,7 +524,7 @@ static void xe_info_init(struct xe_device *xe,
> 	 * FIXME: 'tile_count' here is misnamed since the rest of the driver
> 	 * treats it as the number of GTs rather than just the number of tiles.
> 	 */
>-	xe->info.tile_count = 1 + desc->graphics->max_remote_tiles;
>+	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
> 	if (MEDIA_VER(xe) >= 13)
> 		xe->info.tile_count++;
>
>@@ -436,9 +541,9 @@ static void xe_info_init(struct xe_device *xe,
> 			gt->info.type = XE_GT_TYPE_MAIN;
> 			gt->info.vram_id = id;
>
>-			gt->info.__engine_mask = desc->graphics->hw_engine_mask;
>-			if (MEDIA_VER(xe) < 13 && desc->media)
>-				gt->info.__engine_mask |= desc->media->hw_engine_mask;
>+			gt->info.__engine_mask = graphics_desc->hw_engine_mask;
>+			if (MEDIA_VER(xe) < 13 && media_desc)
>+				gt->info.__engine_mask |= media_desc->hw_engine_mask;
>
> 			gt->mmio.adj_limit = 0;
> 			gt->mmio.adj_offset = 0;
>@@ -446,14 +551,16 @@ static void xe_info_init(struct xe_device *xe,
> 			gt->info.type = desc->extra_gts[id - 1].type;
> 			gt->info.vram_id = desc->extra_gts[id - 1].vram_id;
> 			gt->info.__engine_mask = (gt->info.type == XE_GT_TYPE_MEDIA) ?
>-				desc->media->hw_engine_mask :
>-				desc->graphics->hw_engine_mask;
>+				media_desc->hw_engine_mask :
>+				graphics_desc->hw_engine_mask;
> 			gt->mmio.adj_limit =
> 				desc->extra_gts[id - 1].mmio_adj_limit;
> 			gt->mmio.adj_offset =
> 				desc->extra_gts[id - 1].mmio_adj_offset;
> 		}
> 	}
>+
>+	return 0;
> }
>
> static void xe_pci_remove(struct pci_dev *pdev)
>@@ -500,7 +607,12 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>
> 	subplatform_desc = find_subplatform(xe, desc);
>
>-	xe_info_init(xe, desc, subplatform_desc);
>+	err = xe_info_init(xe, desc, subplatform_desc);
>+	if (err) {
>+		drm_dev_put(&xe->drm);
>+		return err;
>+	}
>+
> 	xe_display_info_init(xe);
>
> 	drm_dbg(&xe->drm, "%s %s %04x:%04x dgfx:%d gfx:%s (%d.%02d) media:%s (%d.%02d) dma_m_s:%d tc:%d",
>diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
>index 611c1209b14c..fb449b9319bf 100644
>--- a/drivers/gpu/drm/xe/xe_pci.h
>+++ b/drivers/gpu/drm/xe/xe_pci.h
>@@ -6,6 +6,11 @@
> #ifndef _XE_PCI_H_
> #define _XE_PCI_H_
>
>+struct gmdid_map {
>+	unsigned int ver;
>+	const void *ip;
>+};

shouldn't this be in xe_pci_types.h?

other than that


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+
> int xe_register_pci_driver(void);
> void xe_unregister_pci_driver(void);
>
>-- 
>2.39.2
>
