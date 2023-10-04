Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A442E7C4DF
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 16:15:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B0610E11F;
	Wed,  4 Oct 2023 16:15:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DAB10E11F
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 16:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696436111; x=1727972111;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6eir2H6JhspkTGT3I+Aix1Jn9FPv9GdkAOk+Mk+zuC4=;
 b=fWwJfPOq70k93N7gvl65LkZjBMZH5As0ZrvpDihSYfzDGBCEsBMeGeKF
 CMCCNVK6YRp7JvCX3N4eMWzx4Fk8evkBssCxNrAhzmrSsoQIxuXaUT78B
 BxRtIIWPooM7R8eL9pO7qYfvWpTRxTZBG6qqhq7tObP29oj+juDofvReY
 yvDa2WvM74JZr4VaRnZvfQBGmEXjD2k8kLjs3884EmhDqBy/DqzhjZ5/B
 JRs/lw+3vpWA6EiYetWq6SNiHmKbhxTUZE/KBtEVvhN63i6ykONlhuR7F
 ydpSJA7cXziOptvvlWDMQzzSH1k3gA7P0RppbBMbZqtD72Z/99YlVX/YF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="447395153"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="447395153"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 09:15:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="817166850"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="817166850"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 09:15:11 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 09:15:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 09:15:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 09:15:10 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 09:15:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAjujHdmVulkfNvwjV7/Hxr4dhJo9Z9+77n/0Bzj60l6FCFxotgxYHTYCbggj/R/5USFQVRsQAVzISJc7OGOMSTADccIV1cVyjwf/r3rlAjwsvcbFOUdARm6g2tuJhfGZxTFLqigDKeiUKoWzLmfuXkmmrN22Rc9bFJSXoovg7LfWrzzb+egoeCDg5tapCtUHaxILGWpGT7BlIVN2mct3g6hs36f21sg7rQkp1D+NNP1S5kA/YwZW2Jz6r/0rk4FImw86XflYcrGJu50IRVfuebBtfbqQ9nOK5Bi8C5fPuLIKo79PIKGdyJK4NMbkpWN8EWbmW1zde0vPpThdeRkXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CoibZVJ7XQERWjvfe6QIwtuKylacGGMJYNwcCeGuXo=;
 b=mmmobcZSTyMUMo71osmhOwcFfeh3bfhfhDtRsmqZWYQgL7jkeu5AKxl7RQaEQA7RrC7bbbpxOKO7Us9bLVy7Xa8sNgXeW7ybdX1RwWkeoyCHAcJOMTx2bn4Ethlzp1BmQVdXsxGHRsDOp3PeF8uqqjt9hqZp7RQakxBKYJK2PZy2XqFxzEhqcCxdMm0HbS8KdMPpC/2+uXHqXll2+TTM9pvgm0ehGl6Vc9B2E3K9bF4ITgn9wWHGjNKD3YYIl4054o7kDPj4iEfK5lGcd/E3oi5QVXkXJqmbi0Pp+y613H3QR2eCC/nelkh+JfcvXAzU3VCk+B7viS3u1HYP+5IuAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6372.namprd11.prod.outlook.com (2603:10b6:208:3ac::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Wed, 4 Oct
 2023 16:15:03 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 16:15:03 +0000
Date: Wed, 4 Oct 2023 12:14:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZR2Pgy23iMVDwPjk@intel.com>
References: <cover.1696343521.git.jani.nikula@intel.com>
 <e40596b157f7689f2870b074b7a1cdd9696f70a4.1696343521.git.jani.nikula@intel.com>
 <ZR11UUIaG8+ruSqS@intel.com> <87o7hee9nt.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87o7hee9nt.fsf@intel.com>
X-ClientProxiedBy: BY3PR10CA0008.namprd10.prod.outlook.com
 (2603:10b6:a03:255::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6372:EE_
X-MS-Office365-Filtering-Correlation-Id: 78085fc3-1c9a-4779-05e1-08dbc4f510a1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XLai86j4b59dg15yb/fX+aGS1LXHpJj9kA6C1ky3rdElQviAjBaQkhEGsJwhjTgiBB8boZVBJZfgKhX9QRafLL/VG11XIVmNxDXNYiY1WraEUa9m938WfTVM1TguPEcIi07qZbEWTZotAU3K+uJN774YY8mb/GFU4+1wIxzYq/k8CkQkor8pxeeOxb+jo31mxiiJFTCCa8Sq1A+dZeHmLrIL1srGltpPavZCabm+RsZi750LvuhpoDpG3u4/D1XAzdBrZJe49M+Oy1nCgoTPMbVeoDXL9hiJcNRfZRXP6qnZ/OIUlcPrfCsJ+F1Qqyt2xTdYPLLM0+4EjoNzw1/3icMcHwOwwocCRPgadf1x/Z9ezTNAT2WafSiBTDU+HFrABkpZhSDq8ZbPFkoYjybkqpo68c9Ejbzu7i06dytKFGOl/v1ZVsigfNrbEvf5EOWG38KabY2N0TrP83yMstyRlmV9VwgJJuol8gI2oovCC7nsvE5SebL1oyr8BmTqvMthMVvyi6XSm/0ahHXIWhJ45qr3RAmpH8iCGU/FA5dv4O8hsMxaqhj9671hCu2C95u0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(39860400002)(366004)(346002)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(6666004)(83380400001)(6506007)(2616005)(6512007)(6486002)(2906002)(8676002)(6862004)(66556008)(5660300002)(44832011)(4326008)(37006003)(66946007)(66476007)(6636002)(316002)(8936002)(41300700001)(26005)(478600001)(86362001)(82960400001)(36756003)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iEB49qFZ3aof4Fn8NUY1G+NikflcNpwPFYcxWrcepevD81j5H6MPV3mAYWm5?=
 =?us-ascii?Q?oUP1RIdrB5A2c8Kks4f41qNrps01r0+F/TRmhd9vOXpyRGcGka/ChUkyn0y1?=
 =?us-ascii?Q?fmbZuDeizoDR5n0QovfyUywmxgAFPDsEDcOXX50FnZ6R3I0stnb0AbCcQULb?=
 =?us-ascii?Q?v54/YxY5gMcWA3kQ59gpSM4/in6PChEF/l4glGrfyTOidpIueKBprjbfhz+6?=
 =?us-ascii?Q?qsJ6TrldW/U67Ek5Mv29Tc111V5XI05BSESrFeYWvL3LFXFID04l/P7WZUNu?=
 =?us-ascii?Q?+F+RpXBb3vlOn/mz3BBE/H9ABP/q11g7ezymD1CpaFmcKGf5WJpFsj7xH8jf?=
 =?us-ascii?Q?os2KuvDiOtx33MaWJQs2brDLJ1GcHD6AT72XqWWSiLgN8dAXzyPcuoEYigsM?=
 =?us-ascii?Q?M8a7GivmeH67zousWJKmAfC71Bcqv2XPIOeOuowU71rsJpZZmTDjx9Gp2vQ+?=
 =?us-ascii?Q?a2PeXxNg0UuhNtIHRG63hazHryZaJYTcoqI6xKE7bUTToddBMS1cVc6+C/rj?=
 =?us-ascii?Q?Aa5BKpaD47g+wofs182oPZXYmqpngNIdgEviqUzS1YCVGJkUqzNhDBOJLh2N?=
 =?us-ascii?Q?Wn3rjOTLEoefZM3eVMXj8syISXffmVJw2EC2bRom4GD8JH3RhL9bCo1S4D9s?=
 =?us-ascii?Q?Z8y64RrOMOU30C5WX6GPiusj4J3R5NYyo/J2fC9XpYkcOn7oQFKAH8v9G1LZ?=
 =?us-ascii?Q?StrmRPrIcBfsm6mDIKFi2uY1OO2JjUXIm5Ha+Gg7OyTMn3APH1jTZnBg/sx3?=
 =?us-ascii?Q?l+C8eeAalvr5EVaRV2328YWZp15TG8hO+134XEbuORqC9q0pqsRndKlxsYQm?=
 =?us-ascii?Q?Z/WxPM7HKpAwuRCG1jhEI9xwyodYnq1/OimJQu8UmVSKpqLZX7A28Nx7kPWi?=
 =?us-ascii?Q?JsAK4CZT2TJAuBqTys696xbOrCDKTkVSdTFA3TgHa0T12yi6NIlBhcHZ/eg1?=
 =?us-ascii?Q?QSq/BCReYUyxY7KUZs2PZR2+UEv9s57MXPZdFeKgxHimLLL8Llogdus7SnOu?=
 =?us-ascii?Q?XYHO53x+u731gLnHvT4pDcxqUpAiPPxH8r+MSYfPL9Ar1YvE5nJYnRdH62xR?=
 =?us-ascii?Q?Z435Ad8RYmfpVqTcf73wli47yxF+LAMmcyYPpYCR3Y1Tn9BGd9AByz7Iftfb?=
 =?us-ascii?Q?KrQqTMHG+5cIl/t8fheG12Mo2JhIVAwByRfI69MthtBSW+4YITxKK24UF6Zz?=
 =?us-ascii?Q?m6kEjEtOGW2ld50C3L04eBjgw2lSvAulx/93ME4Jh4vVq0J1AK7Drsd432kW?=
 =?us-ascii?Q?s/+TKdii8rKkd+rEZR2IoFs7WDXVK8YGBy+zOIfxbw+6Z1yjPsaY1Tizu6w1?=
 =?us-ascii?Q?2vG6mePJP1sN7EbxCbv+66KUFqM274WA3P81e2EogDzswQEO/bpNI6O39eYb?=
 =?us-ascii?Q?M9msc+wJnba1AzGsy/O1QTeBGrhK4eqQ9IZLqHtW3SAfWd3xtPhhnywYJUUK?=
 =?us-ascii?Q?NdMZ8VPI6ix+bbxan7CXBgod8L+e1eQET5sck7IC1qZcdpd0fgJPRm9ypJ/F?=
 =?us-ascii?Q?C+ob6a+80QMCoogD1J6+22ZHWBArknVHtRWgDhiwrDBIqky0cAPHwPrDwpik?=
 =?us-ascii?Q?Yw+x6NnMj8cF8orPJU6Obuw+UQS8tULYPPeNlmqGnrB3tRrbOxB+6dhbHR1M?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78085fc3-1c9a-4779-05e1-08dbc4f510a1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 16:15:03.0862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ItDcm9cow6Lufpy594+fFfGuqGfBQNQXxZ0IpZWiPcfQJiKAXqDziuSUIsQ3uxJBKHVkkxDo9lXFNeOyoLzivg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6372
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

On Wed, Oct 04, 2023 at 05:37:10PM +0300, Jani Nikula wrote:
> On Wed, 04 Oct 2023, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> > On Tue, Oct 03, 2023 at 05:34:55PM +0300, Jani Nikula wrote:
> >> Turn the enable_display module parameter to the same thing as it is for
> >> i915: assuming you have display hardware, take over it, put it to sleep,
> >> and keep connectors disconnected.
> >> 
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h |  5 ++++-
> >>  drivers/gpu/drm/xe/xe_display.c                   | 11 +++++------
> >>  drivers/gpu/drm/xe/xe_module.c                    |  4 ----
> >>  drivers/gpu/drm/xe/xe_module.h                    |  1 -
> >>  drivers/gpu/drm/xe/xe_pci.c                       |  1 -
> >>  5 files changed, 9 insertions(+), 13 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> >> index e7c9b4ea2153..feaa1e244838 100644
> >> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> >> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
> >> @@ -24,6 +24,9 @@
> >>  #include "intel_runtime_pm.h"
> >>  #include <linux/pm_runtime.h>
> >>  
> >> +/* For INTEL_DISPLAY_ENABLED() */
> >> +extern bool enable_display;
> >> +
> >>  static inline struct drm_i915_private *to_i915(const struct drm_device *dev)
> >>  {
> >>  	return container_of(dev, struct drm_i915_private, drm);
> >> @@ -89,7 +92,7 @@ static inline struct drm_i915_private *kdev_to_i915(struct device *kdev)
> >>  
> >>  #define IP_VER(ver, rel)                ((ver) << 8 | (rel))
> >>  
> >> -#define INTEL_DISPLAY_ENABLED(xe) (HAS_DISPLAY((xe)) && !intel_opregion_headless_sku((xe)))
> >> +#define INTEL_DISPLAY_ENABLED(xe) (enable_display && !intel_opregion_headless_sku((xe)))
> >>  #define DISPLAY_VER(i915)	(DISPLAY_RUNTIME_INFO(i915)->ip.ver)
> >>  #define DISPLAY_VER_FULL(i915)	IP_VER(DISPLAY_RUNTIME_INFO(i915)->ip.ver, \
> >>  				       DISPLAY_RUNTIME_INFO(i915)->ip.rel)
> >> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> >> index 391f08c1caca..75054f78d7ae 100644
> >> --- a/drivers/gpu/drm/xe/xe_display.c
> >> +++ b/drivers/gpu/drm/xe/xe_display.c
> >> @@ -29,6 +29,11 @@
> >>  #include "intel_opregion.h"
> >>  #include "xe_module.h"
> >>  
> >> +/* Only to be used for INTEL_DISPLAY_ENABLED() */
> >> +bool enable_display = true;
> >> +module_param_named(enable_display, enable_display, bool, 0444);
> >> +MODULE_PARM_DESC(enable_display, "Enable display");
> >
> > there's a work in progress to create the unified extern mod_param struct.
> > But this goes on the other way to split the mod_params...
> 
> There's *also* work in progress to split out i915 display related module
> parameters. That would give us unified disable_display on both i915 and
> xe, and we could just nuke xe.enable_display.

Great then!

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> BR,
> Jani.
> 
> >
> >> +
> >>  /* Xe device functions */
> >>  
> >>  static bool has_display(struct xe_device *xe)
> >> @@ -45,9 +50,6 @@ static bool has_display(struct xe_device *xe)
> >>   */
> >>  bool xe_display_driver_probe_defer(struct pci_dev *pdev)
> >>  {
> >> -	if (!enable_display)
> >> -		return 0;
> >> -
> >>  	return intel_display_driver_probe_defer(pdev);
> >>  }
> >>  
> >> @@ -69,9 +71,6 @@ static void xe_display_last_close(struct drm_device *dev)
> >>   */
> >>  void xe_display_driver_set_hooks(struct drm_driver *driver)
> >>  {
> >> -	if (!enable_display)
> >> -		return;
> >> -
> >>  	driver->driver_features |= DRIVER_MODESET | DRIVER_ATOMIC;
> >>  	driver->lastclose = xe_display_last_close;
> >>  }
> >> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> >> index 7194595e7f31..82817a46f887 100644
> >> --- a/drivers/gpu/drm/xe/xe_module.c
> >> +++ b/drivers/gpu/drm/xe/xe_module.c
> >> @@ -19,10 +19,6 @@ bool force_execlist = false;
> >>  module_param_named_unsafe(force_execlist, force_execlist, bool, 0444);
> >>  MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
> >>  
> >> -bool enable_display = true;
> >> -module_param_named(enable_display, enable_display, bool, 0444);
> >> -MODULE_PARM_DESC(enable_display, "Enable display");
> >> -
> >>  u32 xe_force_vram_bar_size;
> >>  module_param_named(vram_bar_size, xe_force_vram_bar_size, uint, 0600);
> >>  MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size(in MiB)");
> >> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> >> index e1da1e9ca5cb..58604ed161cc 100644
> >> --- a/drivers/gpu/drm/xe/xe_module.h
> >> +++ b/drivers/gpu/drm/xe/xe_module.h
> >> @@ -7,7 +7,6 @@
> >>  
> >>  /* Module modprobe variables */
> >>  extern bool force_execlist;
> >> -extern bool enable_display;
> >>  extern u32 xe_force_vram_bar_size;
> >>  extern int xe_guc_log_level;
> >>  extern char *xe_guc_firmware_path;
> >> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> >> index b19506fe3e18..8ee430c6f8b1 100644
> >> --- a/drivers/gpu/drm/xe/xe_pci.c
> >> +++ b/drivers/gpu/drm/xe/xe_pci.c
> >> @@ -575,7 +575,6 @@ static int xe_info_init(struct xe_device *xe,
> >>  	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
> >>  
> >>  	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> >> -				  enable_display &&
> >>  				  desc->has_display;
> >>  	/*
> >>  	 * All platforms have at least one primary GT.  Any platform with media
> >> -- 
> >> 2.39.2
> >> 
> 
> -- 
> Jani Nikula, Intel
