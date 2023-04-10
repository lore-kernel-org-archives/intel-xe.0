Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906DEC77B61
	for <intel-xe@archiver.kernel.org>; Mon, 10 Apr 2023 15:43:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A73410E0A9;
	Mon, 10 Apr 2023 15:43:56 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E0F10E0A9
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Apr 2023 15:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681141434; x=1712677434;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4bL2e6Rjyj6bsP9QWybz8VeZ2jKyyyl0GJ+j9gbeH6s=;
 b=MLLtGSUMLC6Z9OL+kEbKt5H6k2TK7A4RhdPzQdtByWkVpDW7mKK5N7G8
 ro35PjfRLr9aMoQfRkyzNGcnboN2d5V5u70nsTO0RDdKrLuVMdvyabcbC
 cHydDY+gFooV6jd4shHw5NbK6jjM1uuAsB+/W75p1Lo9I3OApW4xGXcGW
 9qPKtEBqzGtsdByywfYdnf1gqxmeQfZAx4vRpSqy9vbUn8Cibpa2BeMWL
 DwmZhA9KZ+ddH1rmWsIR9Q9qaTwWh9iGpRNDoDO49Uaa/4n1pW8mMXI3Z
 l93YdDYNlX662sYMIyvTELOR9eI/iz8TnyQzYyTG3tHQPPSAJZFLDg0UU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="345166521"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="345166521"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 08:43:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="812203427"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="812203427"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 10 Apr 2023 08:43:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 08:43:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 08:43:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 10 Apr 2023 08:43:52 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 10 Apr 2023 08:43:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hePmBFkGSDaWoER+qoGaQrc+aZCkFkvk4NxN1VOl6w4ElAzHXf+RCn57UXmip6CvMWQErL04KkzD68lmkqiGJwAQdDtHH9Y3CsAIb1X3GkfEbphnXe9VdmIwRRM44qyviiyg9x6pOlRZakiWT15zgh1vggnbyxevHEjLhscdmnBF7LiUCDCV6MAVZl+0iFE9m9JyHYpgHSYOqCJ6zzU9CmPrFWa4Z42ycBwV9X/kodjUv5PPc66C42yjNA2TM+691aepzu0VZ6XnevtXd4rK7K4uD7ROxoi/cnP4iluqmFWAfBZhCYEGsRldoG0AYXDajfqegCZyXQiCrNhUNfZ93g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDcM9KZ33qnQWkVIDDoqp53KknyMtFMfKhhlhE5ue30=;
 b=IcMPm5QXdu37i8OFAP7UCW8lims53inybfj6rhceSCf9xEnICo+wLY/N/7f2AB+X1dEhENAM7tsaHDJYICDYBZ4Amt9NKTNFxKjp2JypK+fuwNUs602T2HKmc0lvQ7h4vTSCzB4fhfPslbrGbCyWeZEaUq+ozA5SV0EmbwNO4/uv2NiciOq7BOmhA9bUrOOl0BmbOfQpHHmdz7bIWPus4+Dn+2OGhMoeZzY2607JUePBy8pC23fxcw7XF8a/8z5yHkKehVfkziCv6sOlHfALPeKDXWD+fUtZGa4N6ZswJBVOutugWA0fBqsG9ulm++j3x2LuCdVlmgZIAlpakuORww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB6923.namprd11.prod.outlook.com (2603:10b6:806:2aa::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.34; Mon, 10 Apr
 2023 15:43:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%6]) with mapi id 15.20.6277.036; Mon, 10 Apr 2023
 15:43:51 +0000
Date: Mon, 10 Apr 2023 11:43:47 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <ZDQus9/DkvJXvh5x@intel.com>
References: <20230406143133.29474-1-jose.souza@intel.com>
 <20230406143133.29474-5-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230406143133.29474-5-jose.souza@intel.com>
X-ClientProxiedBy: BYAPR01CA0008.prod.exchangelabs.com (2603:10b6:a02:80::21)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB6923:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b3df75c-9e14-41b4-57a6-08db39da61b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r1DwVvy4h587dAu5Z+y2z9rAjJhJx/tKUT2UmFa6+jYdSaqKru80tsErqDh/Ilck8Tnks+Ljk+5Pw1qWQo0z7Ee2zefYslLS/KY+QiuSHEogc8PbnNwfDoR4wMxQMGzvNLbS1mPsD7/hw14AOCSTIR11aXgpGWpbmyLh0nTJhPXVte0397RCa6txBmH9JEyz4eRCcG8M7aFkbwUyoWgZqnmqn3X07hIzE6UTUGCQTCinAzpm/NZriLO9aIwBlod5hS16vzoPg89DKjnYIwzfxk5AnemIFwAyGF+Rse3p5n4xJ1m6BtmSpyegudRWXQrVDCFe1vWP5uF2lVXx/FFwoERPzvoQdaicFi28fvrqMezkfhmszAV+p/E40eMcfSdmgjpSzN8pU0XsoIZ/p6ve1KS8OfEyPmSNmxXS8hbStFk6DSleukJlhoJXY5Na7eLdHHfEqQmPa03XQMQBztKAH3kgoqmk4U5z+fkb4ooieEHCpH1kLe8GjwZFvJ0UzkbsiaH2THXl3oFMSN43BVJO16rbV4sxFzsd2RjJrPtkkx3pIaLqLVjrCAClsALLDk7w
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(346002)(396003)(376002)(136003)(451199021)(478600001)(86362001)(83380400001)(36756003)(82960400001)(38100700002)(2616005)(6486002)(6666004)(2906002)(6636002)(37006003)(316002)(186003)(6512007)(6506007)(26005)(44832011)(66476007)(41300700001)(8936002)(8676002)(6862004)(66556008)(5660300002)(66946007)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ojHdwQOur6fYxMzl9iGn9FkCLKs7eprErfWVI1zJiSEOgLGrXCjx6bZTky?=
 =?iso-8859-1?Q?nI19eUWnPNfYXrbuMIvX5G3M2i55WlHx1yiEqYpp3G0xZHvk9hjWTKsZGa?=
 =?iso-8859-1?Q?/+wGRsVfxj3GtTdpV4or7aCNVw3rIJXci7+64XdPC2XZinU/Tw2Eh+rZm2?=
 =?iso-8859-1?Q?lS1yZis/JlNPkhJB5ihaogWeHnHuOP62EDl7WO84sRNWY2JwfFuPEcMrFd?=
 =?iso-8859-1?Q?xtSPiIPLJnC1XOv4Ejlb4DrmyLvKLO2829HUgvDmlc5HjR/GxM6TBCy61F?=
 =?iso-8859-1?Q?3CTARcKPdV/AGtmBhyCxmCxY8s15kEgSpll+qvjVfvpBxH5OT7HxT+9Pf5?=
 =?iso-8859-1?Q?K82K2zEfKbsudjQ2BYyFP/jH2Q5GCnBHp6KqXyF9we72ktfi4hCLXVzV1P?=
 =?iso-8859-1?Q?EonyFczBB0S6Om9foqnOkdA3mXD+AWQKkPuKs3EbYQK2McJ3ceC2M0K9Do?=
 =?iso-8859-1?Q?l7WTixMXTvgl+vBTXKOcBysdEy/qhy0LltAQyhYWo/jZmRQFvOzxtXUtgj?=
 =?iso-8859-1?Q?SBF2gEIOSxXm5HxCygIlGtTC23dLUBUPpkUALiv/yIdchqq5zGI7JjLGfG?=
 =?iso-8859-1?Q?3/80eBEoI2X0Xx8eycVmJpfWi9nOJotEfmhuS0yOo1Q2NFlNdeBQQjIp/v?=
 =?iso-8859-1?Q?LxLQwTR+ayxYbmbXZycrx4C07ieglCOEVoDysV5w1VgvHcylMLH/1DW9iQ?=
 =?iso-8859-1?Q?lxeGf8E2nUXuP6M/0/9VQ3VOXeDpPfyNSAcraiCgcJHAED2WxGAzLyJmtf?=
 =?iso-8859-1?Q?bBbZI8fsoQJ0yqCtrmF6fnTmNaNbvTyP2qjiIs/qSv0aJZhAkPRqRb4ne5?=
 =?iso-8859-1?Q?ykCE7qUr2p4aWRw2pH1dMTcOZcIDG2XlkMDozO+K2G+BsFZHEoZBwYFy7D?=
 =?iso-8859-1?Q?MhBoyvVgNrppNcoIPtnTZgFveQp5goD0wSuT0tfxZ6SPMq9wimIC0bZThM?=
 =?iso-8859-1?Q?eDrO1RiYKijTMX47PGh82b3GFq4xqYmP9jPKZmtCvRbbzC+ng8NSadhhIY?=
 =?iso-8859-1?Q?l9d0eDoNrwJE2ZehfgYrJD88s5nLEps4J8N1ltODXWUd8Unq0Y09H9B1mW?=
 =?iso-8859-1?Q?lcMc16WLVzDCiNdjOnSD3j7w6++t2jY50vDy3vpaerL7svBgCV4o1Vgpxm?=
 =?iso-8859-1?Q?PBZyMQfBlRJMfFFlnJleB0SrVbD13kV+Sz6Xf/DYjtQSDq2I/jDYRyEziQ?=
 =?iso-8859-1?Q?a7Q5fjr0mtDH/Nk7naSVi5fucySOgF2sjPzx6cUCY+qHp1j8Ya8qTk/YZr?=
 =?iso-8859-1?Q?zX8tfQ0OAyo+pu2M0O5NgWGgFmLjioOSFC/WpgT0UzHM1+dDPsQ2EYafox?=
 =?iso-8859-1?Q?MuPPoVAKbH89Ai3oyQO/vH7W6B0S8eVH2ziV6iJkovTMgwkt71+rc4IhBU?=
 =?iso-8859-1?Q?XVcTo2ux/DfRpKeEJ04XrT5+ZzIfLeR7QuyvgNNG51IgqyuK69Hi7ZgXdl?=
 =?iso-8859-1?Q?kybrJPW0wyfjTkb6KQMLq3XvhPVKGlHesNWjNQ05ek/IZcOWb/ZQhqvLQU?=
 =?iso-8859-1?Q?Up/Tp3tkt6AVEoEFSiS9DQssSdfpV0Iy1qnXpmyfeBQRsU2pkXf2J/ongE?=
 =?iso-8859-1?Q?sX4F8w8EQdtbuR9+bxzy3GIrXo9X9I8Iq4HLOYlWmBPj503mZl7885Q7vS?=
 =?iso-8859-1?Q?CGRYNQb/rWzBgQhZmq7/HhM0nqRZ2CAaxz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b3df75c-9e14-41b4-57a6-08db39da61b1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2023 15:43:51.1423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F3N6xTxKNv69d9mpdLVEE64bVrv+k0SW0igwK8AAfDfPFsYXwyUHNkTwwBxKYJJfRLLgYcpd9B0O569b+0cPpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6923
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 rebased 5/6] drm/xe/display: Disable PSR
 HW tracking for DG2 and MTL
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

On Thu, Apr 06, 2023 at 07:31:32AM -0700, José Roberto de Souza wrote:
> Of the platforms supported by Xe, only TGL and DG1 has PSR HW
> tracking.

so, it looks like what we want is something like

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 5fab5b9fbde0..3c05d51630f2 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -446,7 +446,7 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
        .has_hdcp = 1,                                                  \
        .has_ipc = 1,                                                   \
        .has_psr = 1,                                                   \
-       .has_psr_hw_tracking = 1,                                       \
+       .has_psr_hw_tracking = 0,                                       \
        .color = { .degamma_lut_size = 33, .gamma_lut_size = 262145 }
 
 #define XE_LPD                                                         \
@@ -486,13 +486,15 @@ void xe_display_info_init(struct xe_device *xe)
        switch (xe->info.platform) {
        case XE_TIGERLAKE:
        case XE_DG1:
-               xe->info.display = (struct xe_device_display_info) { GEN12_DISPLAY };
+               xe->info.display = (struct xe_device_display_info) {
+                       GEN12_DISPLAY,
+                       .has_psr_hw_tracking = 1,
+               };
                break;
        case XE_ALDERLAKE_S:
                xe->info.display = (struct xe_device_display_info) {
                        GEN12_DISPLAY,
                        .has_hti = 1,
-                       .has_psr_hw_tracking = 0,
                };
                break;
        case XE_ALDERLAKE_P:
@@ -500,7 +502,6 @@ void xe_display_info_init(struct xe_device *xe)
                        XE_LPD,
                        .has_cdclk_crawl = 1,
                        .has_modular_fia = 1,
-                       .has_psr_hw_tracking = 0,
                };
                break;
:


> 
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_display.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> index 0001a9d02495d..edbc88500ed1e 100644
> --- a/drivers/gpu/drm/xe/xe_display.c
> +++ b/drivers/gpu/drm/xe/xe_display.c
> @@ -469,7 +469,8 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>  	.has_fpga_dbg = 1,						\
>  	.has_hdcp = 1,							\
>  	.has_ipc = 1,							\
> -	.has_psr = 1
> +	.has_psr = 1,							\
> +	.has_psr_hw_tracking = 0
>  
>  #define XE_LPDP								\
>  	XE_LPD,								\
> @@ -502,8 +503,7 @@ void xe_display_info_init(struct xe_device *xe)
>  		xe->info.display = (struct xe_device_display_info) {
>  			XE_LPD,
>  			.has_cdclk_crawl = 1,
> -			.has_modular_fia = 1,
> -			.has_psr_hw_tracking = 0,
> +			.has_modular_fia = 1
>  		};
>  		break;
>  	case XE_DG2:
> -- 
> 2.40.0
> 
