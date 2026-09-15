Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE8FC88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 18:48:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2249210E76A;
	Tue, 15 Sep 2026 18:48:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mbsQYewm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B8410E76A;
 Tue, 15 Sep 2026 18:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789498097; x=1821034097;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6KCv7Il3ThHDnESTyZR3aSyTbQfy8lG3eQ+wYoaQf6U=;
 b=mbsQYewmRRX1m05ZVukJIwURSY2PxfxP4eG71+++U4LGoFOfHHA8AeUh
 rcN+HqKRyGO/UwqW1djopMIFihxgySM6mqSjSOqCpYVU/gp4jOd+9tccg
 lz8+BMYUWUn/yufEyQrZwUJ5bOCdb0SkOziCxGi+OILXHLYInhUOJA3PB
 w+ULlS5px1xib0hyL/jfPN1tb7QTMYEMQMn7lXSbh4er/zdDwJMi8XfHZ
 1csOgrUKTTBn84SUiuV40ts7Fi5TD105CimsfFWSNZuGGpqUQw4BLdJCQ
 viPBC1G8kAuKrlMaV6MjXGOP9jBOnZNwPWObUx8DZRn/fpAcRibRdHM98 g==;
X-CSE-ConnectionGUID: aFxRChkqTDm594S9ISMzcA==
X-CSE-MsgGUID: Wg804yUQQAeeABDh8M31XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="383457"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="383457"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 11:48:17 -0700
X-CSE-ConnectionGUID: t9KSAqdIQrqItYO1Kabg/Q==
X-CSE-MsgGUID: oAjr0HfmTVObCxWKotQukA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="273631087"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 11:48:16 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 11:48:15 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 11:48:15 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.44) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 11:48:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcbZnHZzR75VNZlg2BDf8mewJ6xefwdfM7XtCKR/D0TqMxtjB6JsDEPZ/Zun7Qw72Gb2wi8SaiKPL5MJotEJ3qx2JEB1iBOkyEmiN085t0K3Nm2CSHogY1nFTn4kZf/ayOpUmodFDP9BAQjhs57tNLxfalft5KhZ4lCmcXGMa9Pjfsxtjsgasenn2l4l/0EBQ1TkgVbpK4wvCjg1cGEnROEWTndK3zVLpnce4ZKW3gjIhtnf1M1MFT1WiSf4LY4mfQxLpuCeiIewH8jGfOd3vffmfRwrdMj1ioQGgTzey5XRycAbUy6Tvie5Wg4QiOMZEtO5aKoUWmGE14ih0Ej8Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWFI6HzCbOb6Stn2cBUWTpSS8JAJp5MB2shhx85aPlY=;
 b=qNDd2bqNC2JnptUPnl72S/yzIvKyeq7b9MTkYo2Tuy43OC/G0MUsYpwJ0tY+0qXFn4mqSG1Rzec/IFkEr7aoJZSJyZxYc6yLCnYME8MC3YFNFrGTH1SHxYPp3pOLvnaYiiG5iZT393jgpDSi3DmxUFOV6g8cAmPRz7ppsuwh944ym4xeIT8ct69jeOfLi3WH4cIP2asYK6I3/0s4h0XhJY9cca3XAKoCW7Hmaa6QwZGaXnAFSbBuDhnbIkhUzN/kvCPMSlPxc9gyJuFp3uCF3aeya94SiI2pRxu2jsKdNid0pl4NO1CKFQKbA0OGDjnbET+Fm3meawkEfPU4TG5FFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by CH3PR11MB081371.namprd11.prod.outlook.com (2603:10b6:610:34d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 18:48:14 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0428.008; Tue, 15 Sep 2026
 18:48:14 +0000
Date: Tue, 15 Sep 2026 21:48:08 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/dp: use EXPORT_SYMBOL_IF_KUNIT() for kunit
 helpers
Message-ID: <aqmS6M-FARktEMow@ideak-desk.lan>
References: <20260915160620.779372-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915160620.779372-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-ClientProxiedBy: GVYP280CA0036.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::13) To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9273:EE_|CH3PR11MB081371:EE_
X-MS-Office365-Filtering-Correlation-Id: 760a6b0f-b827-4025-b35f-08df1359e5f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: w7Oc9X3G338iNZHDgIKdpaDKxWl1zf88RqRzQL58PqK7UqRw4jQybziOWVPDfj/FyKFQ0QXiE3b2itvQloYIJh4oQPrNRdHnol4U9XA/WGDhHS/wTGRRdDWOorcV127w/6zGxRtEQSq1bWJEbLAVgNWwz6SkEAMFMEKC5HSXB97mhqIYV/SzyFLpPLt9D8BoGj9d9RACwpC+X1mCb8/1aX8zGOgapyUjwOoT6cAixDuXjgxibT678CGUbisOE3xgNM687hi+7t9fAx0zq5kdRspcmwUQtHR+0Sz9RvZXV11GZWMC+iEyuXwWHLTf6pPAr8CP/Ft7JxE+RsxuJaVT2QUeuZInfZUPWCyxdu05OP3r5C4bP6JMRgvJMHuwkOHpHlN4RcbLd+MjM1W41hZCAZAOpkT+FWaooM17MEeOJKE7XCMIYfeLCSpilZljMQXudaaPxFK9aYdRe+e0x9XdjBWZ+AGvEK2cJPuLcj37VIOEIoY5V716zngBcNkl5J5BKEvkdotYZvBYagrekki9W9nH/Rf7tvip5nk17+EXqkBiphZuYB3szJk4WcG0+LwGCMq2SQYlvRy53Bgpvl2Zz9sQi33CVUHGDacibZy6HeKtnEJrQeC/5VLQ+0M1TSDGEa0dR1Dg6h9WXyZ5I9AUHy39JaOb7VAI9aP2VUGvXyw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Q7Mmf/4QBsa3rx1Ya5VjXAJzS3h5fOxGB0blId6+2m+GdTHX2+RDmcQNX8?=
 =?iso-8859-1?Q?LNKbIwAP5AdO963kLY+GzWE/F+HkSzPQ6+f/blRR3GeKrLjZtl3BMlLEMX?=
 =?iso-8859-1?Q?EwKg1dAOgIBGaaq8Bk4MiuXKEdP9GHHrbYb8nMDzb8M4IBwOC/IW1b0ZYT?=
 =?iso-8859-1?Q?kOROmePnCaw3hOP6XAZlD9DKswa9/UoU/xZ/CpcRCfqXLmBzlznDLTeBUQ?=
 =?iso-8859-1?Q?/XGEWYYwOACmk5e0iXuKbejcK5HMYcnqLAEkm/DB5+oKZVLjjKVbZAGRku?=
 =?iso-8859-1?Q?gHvpDi9FAkxgSWiH2rQYG/9Unph+p9oBsmibzpSO4bSMHnkcTNqPS7NA+7?=
 =?iso-8859-1?Q?XlNd925x04DEFbADm/V3G+Cl+T2bgcutSceX/p5qrWM4/av2srfPqXoH6g?=
 =?iso-8859-1?Q?z1/zZrNH/Nz75TjhLwu2DomJ/0usbZygmcvH7fW6xQkG8DssPDD7XhEebr?=
 =?iso-8859-1?Q?+c+n0LL0EYPyv3r2tIqDbv+Z6PAay6Et/LocMv7ME1XYn4rjtkvuDScIRC?=
 =?iso-8859-1?Q?9lICRggDVFWb7+ZqnBEH65oruVN3lcxWApcdHrtZpxj6EFbYQnm0lALy57?=
 =?iso-8859-1?Q?f3ul1L0I+CbnIu8bz9wzvNUdU1WgVLi8mb8WZebaF7EbB2SRMHdLOuj64T?=
 =?iso-8859-1?Q?g/weKeqHplLf6g9qmbhCa/pZQc7Hks/ypTp76N3idyEfy2ktul8oIpfSS9?=
 =?iso-8859-1?Q?UC4PgvCmlwMOvoLJ9MelgHg4cQ+k/ciKBDqVGmuGU1neNG138SKjHZ1tHY?=
 =?iso-8859-1?Q?b2VapIyOdaSurwjCvsKYI/cpoRbc8KzIB6G35/4Sjp/Li6ScGkhGrQDaPS?=
 =?iso-8859-1?Q?jZ/l+t+LV6smz9Pk31N/iLkntYJsLwzmDZnrwXzWJhLZJdyppGs3Z3aEGu?=
 =?iso-8859-1?Q?5fvmUtjOxtvGpC1FYrgl3dZZStZPLG5eocbHn3Q8be5dpsLadh+l1sZ1tx?=
 =?iso-8859-1?Q?yezThHwEU60qVC9bNCmEev6RBSEFa0IOdzksCXbj1BX6b0PUT28wrb0IT+?=
 =?iso-8859-1?Q?qdytCHRagQgRn0ZiLwmLenu4h0xp4Q92MjzeyVNpXYlgSVxnFIooP2/cjo?=
 =?iso-8859-1?Q?6fCstugcT9MFNxeYL5yK/aqO7Vbb3+2kLIidd1pDpsiH3LsKr/JKF5U1nV?=
 =?iso-8859-1?Q?7/GiJ+dxfYzQd6aGOsBZVTC5LeyfkVRepDzqmI9cdxr83yGn7i5+KlffI3?=
 =?iso-8859-1?Q?2rSv2ibvce5Ch0RSkAeoMOVcYKt6SAgzn7ZY7O2mRaTb12nSRQT9UKx9rp?=
 =?iso-8859-1?Q?8pLHTRVgLqYumysaSg//vLo0L8R1XW7XO6PqFMM1Lr/0ssjVbiaLvNWxVu?=
 =?iso-8859-1?Q?t8cxmEaB/Ce37rm0YwHX1mQMAYNxhIpOGeo04FEm+AQnPYDs/bCpUu3yAg?=
 =?iso-8859-1?Q?ol+AkOgJj6b28mDMBHqmZLr1W/S9owndKXotvGyX09N3o3dz2xzz3Q5U0U?=
 =?iso-8859-1?Q?pNuXaRPTVt1WmOlYLvvZpkKI5isGTuDBsrjhh/YevWUPL3GkFXfopdLOEk?=
 =?iso-8859-1?Q?485CuK6oJxkH72ZBInH9LHIJxaYe6LqFJ0ftGe3w6tw0G5PDMvTOuI97Fb?=
 =?iso-8859-1?Q?VsG+F4fR1W1MQvAM86Z2GWTpgM7V5lC+92kW063lSYcyjgcxV9Neu9x3XL?=
 =?iso-8859-1?Q?AJE3dUQtoIriW7jK1FP9s2XulgzqTj4IERtzIetC7QpRsZYQOjtyajfpsH?=
 =?iso-8859-1?Q?W40mDqvPt46uyvS/UY0e2RZmP4SC8Y/CU8u+qiPtQQ3x2qkafZ/IzxWueH?=
 =?iso-8859-1?Q?U6f1jDRgwXf2wL1RfMP2tSsrvCfMl6BFoOUnQDge2tdRztT2B4pSX2Gs8H?=
 =?iso-8859-1?Q?SA/LH9GLrw=3D=3D?=
X-Exchange-RoutingPolicyChecked: Dt2q1hreVszT3gWQbI+5SRVXg01/HsLbbjqOroL9IFpzHJi51lYgNvXWsufyNcwPn4vNEN6E5Y99P9uKUp/XNYrI96wnW8MrTqjS2g2PnvvsqNhKm+EHW712skeFCsFGIHlc3/scwyjqSxBXBHoonrBa5sAu79u6DyDgv+LcfxoVBqN0ut6JchAE8voI1hxkH7pCmwE8t1GaomKjvA2N4ePFf2CZjx3Gvh9bFaNcBCK+GaVAv37AXkQ8fplewg8o7o1jx/H0E8wB8g+hDQaJILtJMsxOV1Yxa+7KSWOh+1iR2A7QfSNxYH4dmeGiHsTtZB5MfzIKwOyte+DRqjauWA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 760a6b0f-b827-4025-b35f-08df1359e5f7
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 18:48:14.2975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lwcH+SlK8yHFm2kPo7FPKxoXsEv2zMeNDY+CivLsOYv20Hm7UIs2OvDuGr/MNqD8UcF2uByuvpJZPkv8nBmshQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB081371
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
Reply-To: imre.deak@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 15, 2026 at 07:06:20PM +0300, Jani Nikula wrote:
> Use EXPORT_SYMBOL_IF_KUNIT() instead of the regular EXPORT_SYMBOL() to
> export the symbols to the kunit namespace. Otherwise, the symbols get
> exported for all the kernel to see, and the corresponding
> MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING") in the tests is
> meaningless.

Yes, these symblols are only used by kunit, so no need to export them
otherwise. Should've thought about it while typing the above
MODULE_IMPORT_NS():

Reviewed-by: Imre Deak <imre.deak@intel.com>

> Fixes: 2eb9982ff179 ("drm/i915/kunit: Export link training and caps funcs for testing")
> Cc: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_link_caps.c     | 6 ++++--
>  drivers/gpu/drm/i915/display/intel_dp_link_training.c | 4 ++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> index 98657aa4d3d5..abec3e2519ca 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_caps.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2026 Intel Corporation
>   */
>  
> +#include <kunit/visibility.h>
> +
>  #include <linux/bitops.h>
>  #include <linux/debugfs.h>
>  #include <linux/log2.h>
> @@ -1302,14 +1304,14 @@ void intel_dp_link_caps_cleanup(struct intel_dp_link_caps *link_caps)
>  const struct intel_dp_link_caps_test_ops i915_display_dp_link_caps_test_ops = {
>  	INTEL_DP_LINK_CAPS_TEST_OPS_INIT
>  };
> -EXPORT_SYMBOL(i915_display_dp_link_caps_test_ops);
> +EXPORT_SYMBOL_IF_KUNIT(i915_display_dp_link_caps_test_ops);
>  
>  #else
>  
>  const struct intel_dp_link_caps_test_ops intel_display_dp_link_caps_test_ops = {
>  	INTEL_DP_LINK_CAPS_TEST_OPS_INIT
>  };
> -EXPORT_SYMBOL(intel_display_dp_link_caps_test_ops);
> +EXPORT_SYMBOL_IF_KUNIT(intel_display_dp_link_caps_test_ops);
>  
>  #endif	/* I915 */
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> index cb92cff90614..9a692f4fdfee 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -2825,14 +2825,14 @@ void intel_dp_link_training_cleanup(struct intel_dp_link_training *link_training
>  const struct intel_dp_link_training_test_ops i915_display_dp_link_training_test_ops = {
>  	INTEL_DP_LINK_TRAINING_TEST_OPS_INIT
>  };
> -EXPORT_SYMBOL(i915_display_dp_link_training_test_ops);
> +EXPORT_SYMBOL_IF_KUNIT(i915_display_dp_link_training_test_ops);
>  
>  #else
>  
>  const struct intel_dp_link_training_test_ops intel_display_dp_link_training_test_ops = {
>  	INTEL_DP_LINK_TRAINING_TEST_OPS_INIT
>  };
> -EXPORT_SYMBOL(intel_display_dp_link_training_test_ops);
> +EXPORT_SYMBOL_IF_KUNIT(intel_display_dp_link_training_test_ops);
>  
>  #endif	/* I915 */
>  
> -- 
> 2.47.3
> 
