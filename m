Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEDBC001B0
	for <intel-xe@archiver.kernel.org>; Mon,  7 Aug 2023 22:09:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E034810E390;
	Mon,  7 Aug 2023 22:09:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BED10E38F
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Aug 2023 22:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691446164; x=1722982164;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vyqd4sGlo63p6jjYrK+M+L0DxlNsgD4lM6XxhFgXS6s=;
 b=L0XuDqDymMBzIPQx+Xm/+gVqiPl4ldBbLOBNrww9bmoU4qspw5I6W1rK
 P+d2gUAYtMDJOhR70CMdzvS35ECeTDpeNsbDVtSW6rs+iUbHS+ebx2dmN
 SYnwlcAO9NgtaBEmgxA8BrcKr1CdG05jBDl+kivRjoudWJlb6uGD6ADR5
 9e5BB+sl8f20YWQOOHL8jm1l77dYR4oeM/jCvBii3vmd2kpZrI0Zv2DeH
 SelcNj3I5RUXbun3tl4m58apV+/aqkxykAzPPsFUwN1w6bnmgLW+1yIqI
 NKuClxWOdPwt7/9eUva9l5lnWFn28ivQ9p/kQkRr60BxcCDvKvXQpH35L A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="374335520"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="374335520"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 15:09:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="760665154"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="760665154"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 07 Aug 2023 15:09:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 7 Aug 2023 15:09:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 7 Aug 2023 15:09:22 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 7 Aug 2023 15:09:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WnIgA2WYjOkVMFG6R+plRiTH6WMKrVQaFCisBl/wTZgxsT5kYOwkdXM0AKFUD66eASAfYGZu+nU3pXJMDnjDQYsau0w+OuohdBVjSBAtYLfJKfYeFZtNGT1tpbQ2Vf+Tck30DfWJEYhQrRsxC3P202smKPtVMEij/tSFf7237dwIqpkv3oyBvERn7QcCnEcRYeNzKVsy8Ne/23Y9KfCAj/UjrNCE/gJcYwvLOtDSBAOCrpXdFTYfX6lbROuxgfVmjQnA/ntgL5UpImO7w1NTh7UheKgYHjuZ1Jez1qvOHOR8jMD7bq3cTBwOSBEISUBgb9NpeCMoJsD14rb5mvoTYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8unLcqFn0TXmblNIC7Q0vz0gqK1yeGQJfIObi9PDSY=;
 b=k4o2ZvGR/v/5ylBkkTxm86B0juTpovgYDR7t7QsDo0xvd8SLRPXnsNfs0VYCKMi/BTvfxcAeunLgZQHNYjm68UsUO/PkLMxuBnoJYzNxUkURas7c3/a4IFEOwDxAskbgZyTs5LJE7RGCxoZhSyu2wFpAgbzCfgsnAneSWm6XQlqoopPJCvjsex4z96Pt+8AoZemnPhT+OVMIXskzi2SV9zKNiQBlc04x51dMVI0MwEOEAtkSxbkHbBDYdmtz6N6iSJxor/VIqqogYlhUABh0MuPpD5cEEKZlcvYHMLXOObbpFGYCE+8qxzo+DL4ScTci11b23bzqZWWb1YexcSDLQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ2PR11MB8565.namprd11.prod.outlook.com (2603:10b6:a03:56b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Mon, 7 Aug
 2023 22:09:19 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 22:09:18 +0000
Date: Mon, 7 Aug 2023 18:09:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZNFrijjUJNUJOWzw@intel.com>
References: <20230803105352.789000-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230803105352.789000-1-jani.nikula@intel.com>
X-ClientProxiedBy: SJ0PR13CA0048.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ2PR11MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ae62682-2115-4427-b187-08db9792f201
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EQkWUMLyfclo2D20V6cMbpNA9z6K3zXPxM+wiNevIX2bkCRDVYl07PYXBndRWMigdHGwY1xbqCNKt8zXXhcjtE5FvCS1GrUg6o+FCn2U9FbchGhswVAniyD56CjLUTuOYKp6ZtgtyvAxAsnrnv/TJra+F6oLF+Z21A85qUG2CKW8yeYVxtJ+YgGeQTgcejEXdjwn+FmP5Ms+Ofjwc2Cov8ztzKM3usT9TcUXM1LACe5uaDV1wOzreO5FO9R1Slr5zOoz/ZI28ldIas1xfLHO2xaQy7X+mPMKAkSQpoq2n21CaBcu59p/inRjbJ5Jx9SHJb+thyw62SNhKu4EG2+78BqcTtUMmexU8qHDExlBWX0qM5IrMN7vITNf9dUgy2mJJL9d1HR0RJlv5e/9auj1QmkP0uSriNlfvpzNAQSxkupyApFVOhL+E+P5cFGX9d6NH9DHrQgOHe1nE3eNcarAeBKJxZQ4uR0EMFls61a51DhVLIp9/Dy9bXrCp+B6rLn1TBbdnSUqgg0uImKR/61TaxuhjpZdx4P3roJbm4ZcyxFdtK23srl8a3emBQoLDt5P
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(346002)(39860400002)(376002)(136003)(186006)(1800799003)(451199021)(83380400001)(2616005)(2906002)(37006003)(6636002)(4326008)(316002)(5660300002)(8936002)(6862004)(44832011)(8676002)(66946007)(38100700002)(66476007)(66556008)(6512007)(478600001)(82960400001)(6486002)(6666004)(86362001)(41300700001)(36756003)(6506007)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YX1xI8fwRdIYvzpoKGxd2E5YBYqSX5un+JT2gKNU8IVD8Fsnp/wCIa1Yxp2g?=
 =?us-ascii?Q?ITUYkRZOdSjTwH7RXLsdPeO/TBaLZSB3bn5ryBX/FCtZK7ynrCKF36t+WKDL?=
 =?us-ascii?Q?SouKwor/Z4776JW3489HGcRnsIFWyj3yXtzbZwTEmiMUsNOHK27fmQdD0eXn?=
 =?us-ascii?Q?f58gmLRrcxcpiS5ynO3AQHY1eAQ+gTgQjhibgonTBTinpPUGLq0eiWV+3Buk?=
 =?us-ascii?Q?+Gx1ySWBN//+ncC/lycDs986KEafS4HkLfxf9PLcHqrnH0c8tpxo5r3JCboo?=
 =?us-ascii?Q?UD+hxhv79vhlAG3y2N1f7AsrPTB2NRZn9FjZthrhkTvQA7uTQ4Ca32uI4O4t?=
 =?us-ascii?Q?yawcI/IQjeqdPWzm55JPW9ftBErkgUApKDoAouYH/+x/0iGGwdWRLB4OAj+h?=
 =?us-ascii?Q?gH2oH2AxG8KsKtxn/UWaAXlJ9+uBu4X2HQmkFoiDiSGyUp9tojKUyfW3moN+?=
 =?us-ascii?Q?0hmageg1KwJkbP4+U6PWbTie/0m92YTW6yTbeSC/gCNMjLOI265Fpd9EiB72?=
 =?us-ascii?Q?7rJv4zjuAxPi+Rmt1n63NYvkVlPqXityABCIyxAKB8m6wwEXL34Za4rMk9Oe?=
 =?us-ascii?Q?Nn6QZRAMs0OxX6Ser/tyjCybhAUSCjvEafhoolVHXEZ3ROwTEk9JKgrp+jup?=
 =?us-ascii?Q?JUWhwXlbObcCSStbM879LGRQB4LjjeyUIdmMeL8eX/fVwN2twheZc+hokZHu?=
 =?us-ascii?Q?VeMNffdZB38N1d+sjgZKAY9CcQKQVHJoToNe7wDiJ5MXc3IElMP7EP8xW2kZ?=
 =?us-ascii?Q?OO/y4AeRzE5lkzivOV1/9Z9RsvUvatc3FP0m7f3QWVEbwVT2MH7QecbqR4Ed?=
 =?us-ascii?Q?fuJ59l6GAhxl7yD5Mi8gwajIZYWVOTcp4T47Cd2TeoGGxb2FBjiWHYg9mJ9k?=
 =?us-ascii?Q?0FJphziza/s3fS6s9QLXf7c42p1PwOsgfQcAd7Ir8WEsPD2aOABNttqclYo1?=
 =?us-ascii?Q?FvvbseADfFZ/l+fSPqwuWY3ZuE1xlvoZ0gAQCzWKEVVw35Pf07EjboWgPspS?=
 =?us-ascii?Q?WOvryQSJF6kxGD8mVt8nURECSzVkdxhQ0xVDrj8P59TXLBra5/n/7ZyMWdqf?=
 =?us-ascii?Q?pI8OUPOAOBuq1pNuQkLcCc+I2ou5GKHWwSsmyp4wLhp0/HySd4G31vGWXHji?=
 =?us-ascii?Q?r4A02d58Bkx2PsVjQlmPcXUHwTa+YlkgSipQ9STUw+cCv0YyNF1kUX7u9vPv?=
 =?us-ascii?Q?vmBUZRetlOwXVN424jJUBBYZ70FbXAH3XiUjS+lqh+qIBIW1+ApdzAcAFqjl?=
 =?us-ascii?Q?fhzdkfPNwj6sE+14IVCjds8FxO18ae0b9w4aVVjwUlBqkeU5IOkbFW+1Ytfg?=
 =?us-ascii?Q?jeKVuxfDEh1hvxOYK2h3SU8OltdZfQiMmLNjhvL02HtAZLg3/31HeahhwpY7?=
 =?us-ascii?Q?lBiwU1Io4Lc3mGEdXehsbV5hWBtTM4uiGCkP6h0ci1NZn48atU0shPKU+VQn?=
 =?us-ascii?Q?b9xJUpASwg+tTTUo9cQ848/hcXQQDsC/TaqHMwspyDaP30lx3BllKehzFb7T?=
 =?us-ascii?Q?q0U4knnCReYtRptsKHxCnC2Pr1TZODb8y9RTse0DYhVptOE3ipphZCL9jgyB?=
 =?us-ascii?Q?R+oakM7MasSBJJGk6DM4inEWSf3oSMGw/3+9DuX9OlQKyX2cV0A9IHhjgk1m?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae62682-2115-4427-b187-08db9792f201
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 22:09:18.7386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oOSTXp1sqbg+HSwz7FBGOrSbv902PcA4fX3J8BphXCSj5ziJf1ZS6g0pU1KrixX1MQuvI+B6gIC6Tm+KlkAC6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8565
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/i915/display: Remaining changes
 to make xe compile
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

On Thu, Aug 03, 2023 at 01:53:52PM +0300, Jani Nikula wrote:
> Remove some changes completely unrelated to building for xe.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_color.c             | 1 -
>  drivers/gpu/drm/i915/display/intel_display.c           | 6 +++---
>  drivers/gpu/drm/i915/display/intel_display.h           | 1 -
>  drivers/gpu/drm/i915/display/intel_display_power_map.c | 1 +
>  drivers/gpu/drm/i915/display/intel_display_rps.c       | 1 -
>  drivers/gpu/drm/i915/display/intel_dp.c                | 2 +-
>  drivers/gpu/drm/i915/display/intel_dpio_phy.h          | 1 -
>  drivers/gpu/drm/i915/display/intel_dpll.c              | 1 +
>  drivers/gpu/drm/i915/display/intel_dsb.c               | 1 -
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c           | 6 ++++--
>  drivers/gpu/drm/i915/display/intel_pipe_crc.c          | 1 -
>  drivers/gpu/drm/i915/display/intel_pps.c               | 1 -
>  drivers/gpu/drm/i915/display/intel_sprite.c            | 2 --
>  drivers/gpu/drm/i915/display/skl_universal_plane.c     | 2 +-
>  14 files changed, 11 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
> index ccc4b636c2b8..8966e6560516 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -26,7 +26,6 @@
>  #include "intel_color.h"
>  #include "intel_de.h"
>  #include "intel_display_types.h"
> -#include "intel_dpll.h"
>  #include "intel_dsb.h"
>  
>  struct intel_color_funcs {
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 45a932c9b1b3..f9eda7ad892e 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -7423,7 +7423,7 @@ static u32 intel_encoder_possible_crtcs(struct intel_encoder *encoder)
>  	return possible_crtcs;
>  }
>  
> -static inline bool ilk_has_edp_a(struct drm_i915_private *dev_priv)
> +static bool ilk_has_edp_a(struct drm_i915_private *dev_priv)
>  {
>  	if (!IS_MOBILE(dev_priv))
>  		return false;
> @@ -7437,7 +7437,7 @@ static inline bool ilk_has_edp_a(struct drm_i915_private *dev_priv)
>  	return true;
>  }
>  
> -static inline bool intel_ddi_crt_present(struct drm_i915_private *dev_priv)
> +static bool intel_ddi_crt_present(struct drm_i915_private *dev_priv)
>  {
>  	if (DISPLAY_VER(dev_priv) >= 9)
>  		return false;
> @@ -7468,6 +7468,7 @@ bool assert_port_valid(struct drm_i915_private *i915, enum port port)
>  void intel_setup_outputs(struct drm_i915_private *dev_priv)
>  {
>  	struct intel_encoder *encoder;
> +	bool dpd_is_edp = false;
>  
>  	intel_pps_unlock_regs_wa(dev_priv);
>  
> @@ -7491,7 +7492,6 @@ void intel_setup_outputs(struct drm_i915_private *dev_priv)
>  		if (IS_GEMINILAKE(dev_priv) || IS_BROXTON(dev_priv))
>  			vlv_dsi_init(dev_priv);
>  	} else if (HAS_PCH_SPLIT(dev_priv)) {
> -		bool dpd_is_edp = false;
>  		int found;
>  
>  		/*
> diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
> index 8b8ea8a4a7b0..991461d9c221 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.h
> +++ b/drivers/gpu/drm/i915/display/intel_display.h
> @@ -429,7 +429,6 @@ int vlv_get_cck_clock(struct drm_i915_private *dev_priv,
>  		      const char *name, u32 reg, int ref_freq);
>  int vlv_get_cck_clock_hpll(struct drm_i915_private *dev_priv,
>  			   const char *name, u32 reg);
> -void intel_hpd_poll_fini(struct drm_i915_private *i915);
>  void intel_init_display_hooks(struct drm_i915_private *dev_priv);
>  unsigned int intel_fb_xy_to_linear(int x, int y,
>  				   const struct intel_plane_state *state,
> diff --git a/drivers/gpu/drm/i915/display/intel_display_power_map.c b/drivers/gpu/drm/i915/display/intel_display_power_map.c
> index be0c5a945669..5ad04cd42c15 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_power_map.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_power_map.c
> @@ -5,6 +5,7 @@
>  
>  #include "i915_drv.h"
>  #include "i915_reg.h"
> +
>  #include "vlv_sideband_reg.h"
>  
>  #include "intel_display_power_map.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_display_rps.c b/drivers/gpu/drm/i915/display/intel_display_rps.c
> index 8c81f542e5e8..918d0327169a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_rps.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_rps.c
> @@ -7,7 +7,6 @@
>  #include <drm/drm_vblank.h>
>  
>  #include "gt/intel_rps.h"
> -
>  #include "i915_drv.h"
>  #include "intel_display_rps.h"
>  #include "intel_display_types.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 5427ce10c06f..9f40da20e88d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -5416,8 +5416,8 @@ intel_edp_add_properties(struct intel_dp *intel_dp)
>  static void intel_edp_backlight_setup(struct intel_dp *intel_dp,
>  				      struct intel_connector *connector)
>  {
> -	enum pipe pipe = INVALID_PIPE;
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> +	enum pipe pipe = INVALID_PIPE;
>  
>  	if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915)) {
>  		/*
> diff --git a/drivers/gpu/drm/i915/display/intel_dpio_phy.h b/drivers/gpu/drm/i915/display/intel_dpio_phy.h
> index 882bf1bc6b6e..4d43dbbdf81c 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpio_phy.h
> +++ b/drivers/gpu/drm/i915/display/intel_dpio_phy.h
> @@ -7,7 +7,6 @@
>  #define __INTEL_DPIO_PHY_H__
>  
>  #include <linux/types.h>
> -#include "intel_display.h"
>  
>  enum pipe;
>  enum port;
> diff --git a/drivers/gpu/drm/i915/display/intel_dpll.c b/drivers/gpu/drm/i915/display/intel_dpll.c
> index dab8dd915282..999badfe2906 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpll.c
> +++ b/drivers/gpu/drm/i915/display/intel_dpll.c
> @@ -2054,6 +2054,7 @@ void i9xx_disable_pll(const struct intel_crtc_state *crtc_state)
>  	intel_de_posting_read(dev_priv, DPLL(pipe));
>  }
>  
> +
>  /**
>   * vlv_force_pll_off - forcibly disable just the PLL
>   * @dev_priv: i915 private structure
> diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
> index 3830309aacf4..70d3a41e8b35 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsb.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsb.c
> @@ -15,7 +15,6 @@
>  #include "i915_drv.h"
>  #include "i915_reg.h"
>  #include "intel_de.h"
> -#include "intel_dsb.h"
>  #include "intel_display_types.h"
>  #include "intel_dsb.h"
>  #include "intel_dsb_regs.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> index 173607ab8560..e56ec3f2d84a 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> @@ -831,7 +831,9 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id)
>  	intel_dsi->eotp_pkt = mipi_config->eot_pkt_disabled ? 0 : 1;
>  	intel_dsi->clock_stop = mipi_config->enable_clk_stop ? 1 : 0;
>  	intel_dsi->lane_count = mipi_config->lane_cnt + 1;
> -	intel_dsi->pixel_format = mipi_config->videomode_color_format << 7;
> +	intel_dsi->pixel_format =
> +			pixel_format_from_register_bits(
> +				mipi_config->videomode_color_format << 7);
>  
>  	intel_dsi->dual_link = mipi_config->dual_link;
>  	intel_dsi->pixel_overlap = mipi_config->pixel_overlap;
> @@ -845,7 +847,7 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id)
>  	intel_dsi->init_count = mipi_config->master_init_timer;
>  	intel_dsi->bw_timer = mipi_config->dbi_bw_timer;
>  	intel_dsi->video_frmt_cfg_bits =
> -		mipi_config->bta_enabled ? BIT(3) : 0;
> +		mipi_config->bta_enabled ? DISABLE_VIDEO_BTA : 0;
>  	intel_dsi->bgr_enabled = mipi_config->rgb_flip;
>  
>  	/* Starting point, adjusted depending on dual link and burst mode */
> diff --git a/drivers/gpu/drm/i915/display/intel_pipe_crc.c b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
> index 57a576097b47..5a468ed6e26c 100644
> --- a/drivers/gpu/drm/i915/display/intel_pipe_crc.c
> +++ b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
> @@ -34,7 +34,6 @@
>  #include "intel_de.h"
>  #include "intel_display_types.h"
>  #include "intel_pipe_crc.h"
> -#include "i915_irq.h"
>  
>  static const char * const pipe_crc_sources[] = {
>  	[INTEL_PIPE_CRC_SOURCE_NONE] = "none",
> diff --git a/drivers/gpu/drm/i915/display/intel_pps.c b/drivers/gpu/drm/i915/display/intel_pps.c
> index 19558895c360..73f0f1714b37 100644
> --- a/drivers/gpu/drm/i915/display/intel_pps.c
> +++ b/drivers/gpu/drm/i915/display/intel_pps.c
> @@ -11,7 +11,6 @@
>  #include "intel_display_types.h"
>  #include "intel_dp.h"
>  #include "intel_dpio_phy.h"
> -#include "intel_dpio_phy.h"
>  #include "intel_dpll.h"
>  #include "intel_lvds.h"
>  #include "intel_lvds_regs.h"
> diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
> index d9713094735b..25034bbf1445 100644
> --- a/drivers/gpu/drm/i915/display/intel_sprite.c
> +++ b/drivers/gpu/drm/i915/display/intel_sprite.c
> @@ -40,7 +40,6 @@
>  
>  #include "i915_drv.h"
>  #include "i915_reg.h"
> -#include "i915_vgpu.h"
>  #include "i9xx_plane.h"
>  #include "intel_atomic_plane.h"
>  #include "intel_de.h"
> @@ -1666,4 +1665,3 @@ intel_sprite_plane_create(struct drm_i915_private *dev_priv,
>  
>  	return ERR_PTR(ret);
>  }
> -
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index 1064af3c80d8..3c212d8401c8 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -1336,7 +1336,7 @@ skl_plane_async_flip(struct intel_plane *plane,
>  			  skl_plane_surf(plane_state, 0));
>  }
>  
> -static inline bool intel_format_is_p01x(u32 format)
> +static bool intel_format_is_p01x(u32 format)
>  {
>  	switch (format) {
>  	case DRM_FORMAT_P010:
> -- 
> 2.39.2
> 
