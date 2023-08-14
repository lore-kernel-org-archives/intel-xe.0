Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABF2EB64DD
	for <intel-xe@archiver.kernel.org>; Mon, 14 Aug 2023 18:30:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA4810E22C;
	Mon, 14 Aug 2023 18:30:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C4A10E22C
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Aug 2023 18:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692037807; x=1723573807;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=a2CH9QvJsZQ0Z7yGJb7pvbCTI38DH6KkUIJfboV5n90=;
 b=UJ6vep6LIEmOQHj5VfR0HuXaMKYIVO52rptIzB3lSoSfIV2iQJ/tJZoM
 yt5xt87kzMxTgI4cDT6otlQVW9l9vWi1Y7LJVPhhA+1+BXP8ceXEb9EA1
 rQycrWIKkQWFLGIfVNaHLGlg9M3b1e+k7fcPOotjbTmYmOG+4wgDw4sCr
 /fernkWcD1azDayp1yeX8SlKz+MAqI4dmVWpqykB+d/oKbepRSBE/APb5
 Wb/OKxEoYt2eckQRWiu2gK8F3cS8JJNYDVTnCcew+VX8BAfpRy4WW6PYq
 UEYP42mzQ1jHXAQuvL0zwYRSnF1UeNEEqEm5pj1PBEpGJTRxylBqkPzJY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="436000255"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="436000255"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 11:29:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="798911495"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; d="scan'208";a="798911495"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 14 Aug 2023 11:29:52 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 14 Aug 2023 11:29:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 14 Aug 2023 11:29:52 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 14 Aug 2023 11:29:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jzx+RwG8F0larPs43jh27dMDKdjTbomgZ16FW0eYDZ5GGkGfwsTrjO8zk0BeQ9a/g72ohfgLT7ObYYZxvlngwo0WxT+mnYOQgdBGcQyYJ6pBFAwjCmz3rXmRlhVbtBJZwxeoSkE52GhUsCTDoBIUymwLz0SVPuARYUZsY7NvuWVcpRgyYQYLJ3qd7DGBYzaLewt6LNP/I8Q+h/zlt6Vpa8wZcIH1u9mZbZhrtQMfiOLXAH1MFZ0RukRYNqNcQoBOND0DBNxDEjfnTGsAOO+M+68AY8X2pz7TFiHg/eTUpWFZpP3XfM+NABnzd1o90zx8pdKJZ9hjo7ZC5A+8S9WqjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdjgfMkPSHWNMou5qFwurr1TI/pfC0Dtx5SBQ4RRI1k=;
 b=OjNE7IHs1+/hW8lnvERpQ+eO7fD+RZz0S5yxVypsd3S8XU/hZ2jQP+OFitSXR5HYxlrIE1ejZAd0EFXEla+JzO/vbv9x3A+JuQN4p1fkutp7HQkU0JCmkIZE423yXm2J7qCZ9ltYUkF5qR6L3PYR1kFn4ct/bLU62wQVxhZAjQ+LNNUFkX9NLobwV5QZqSrp+vJUpwFZsg5jwCdvZlptxaNqx2rRYgSPmlqDqjcH3izg9Of6mPYh2e6s437FeTxeW/3pK7McHeIuYV5VQyKSGG3LH7U8MElThnCFhEpkdHnJWpCGuQmm54iEZweLF8ZQVnvBQl36ESGb0euc93a2Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB6706.namprd11.prod.outlook.com (2603:10b6:510:1c5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 18:29:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 18:29:49 +0000
Date: Mon, 14 Aug 2023 14:29:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Message-ID: <ZNpymXLxJGhisx6j@intel.com>
References: <20230814083744.4408-1-dev@lankhorst.se>
 <20230814083744.4408-2-dev@lankhorst.se>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230814083744.4408-2-dev@lankhorst.se>
X-ClientProxiedBy: BYAPR11CA0042.namprd11.prod.outlook.com
 (2603:10b6:a03:80::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB6706:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eb1434b-3a76-4c0c-e401-08db9cf47151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uj6Zr0YKA38f9LPE1jITd71TWTdlfs+bnQUZ3rRUVsj47dogIJk31uxkAsV8nyXLfel6YhUhzuqObU6QDFvbjJkMsr08qjecKKAmzamWkt3GpkS3Psa/9KMDYIRqgY+oIW19d+E2x6wUgsNHpo36ROS4JFWbpoQzeIR6HmBa8MpiJJ4fmQ+d/V5hkFpB2CdFFhOVPigeQphARKlu5aLxLwh3vCZF0e/bTNl9UQ9oaNJhnw1TKiqrGfDmrq9T/CqN1CHCMa3M4e5qPqTEt2Wsf2V1i3wuSwmBteEt0SX6oNa0l9+p63E6astwwF35tcbs8EzNV4Tt/zmDsy7WR3x0UPlGBomNeauFRJBoMdoJM9ypyhy0E5+yVp3XrSir8CxM7Vu6xlV+R3FO0SQlXJqsCyHqQu0OMnAqhePta9kigy9eTVWOu2JMdfFEdDqkvGuJ0VoDKGcGg00FTMN1fCIOVbLG2TH8ztFil+0FahLTHAGDqIttA/wcULcuD3pC6EA8KfQx2KA6z0tXekP0oYq4I002W+2QzgOqFfJIoB+ynj2qsEqeXgWODQjgaqjgkSu/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(136003)(396003)(366004)(346002)(186006)(451199021)(1800799006)(66946007)(66556008)(6916009)(66476007)(316002)(41300700001)(8936002)(8676002)(5660300002)(478600001)(6486002)(44832011)(2906002)(6666004)(6512007)(6506007)(83380400001)(2616005)(26005)(4326008)(82960400001)(38100700002)(66899021)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FEf9qN2WFQeoUy54jhS5F8XktrQAJmbo/9NhenaMqNIsVr679tUGsK8a3j?=
 =?iso-8859-1?Q?ENj7ka1/L/mR073XQ/Rl94owwgE/eNzgajUkkV22ou1vJzuMuRWY6RZ3uE?=
 =?iso-8859-1?Q?pU4pYl0Gz7+NO5pBRMGVKDL8OMECg+ZyZ83ZkYQyRRadrsu4IWwx8XG5tK?=
 =?iso-8859-1?Q?wE9RH78i+r1Ik2hslrqNGnpGr3K0HOgIErr+KcrV+mkW8XSBK2tI/tuc13?=
 =?iso-8859-1?Q?z5YP/OAJGsMHd6LFjCUoZpVsehp1wv7nXMUSPn7VRVBTD0OYbVPQ0DDg+X?=
 =?iso-8859-1?Q?Qq+nkFAA8ZB6BghhDWYaHpawutA/f1868/mRTWeuc3N4ykcC3gWWsq9ljd?=
 =?iso-8859-1?Q?5OxUDrlC0OLzuZGGrd4gWEZqShKB4PJ/5IsOjU+svV+nzXf1+ugmT1igUW?=
 =?iso-8859-1?Q?gN4DatTQ8mY8Ys4CjJmDtrHJ6h26SJRlDoz3xQx40Q0QJusiBPN6MUy8mo?=
 =?iso-8859-1?Q?r6rEqeSYr/JXM97ZmhYdX9siFMJruT6wEA6jNIx2uRXfIQyq/n0iL14ZDn?=
 =?iso-8859-1?Q?v371Nqxn3hQXkub+nmjveaZrzMTxKYNk3Nk0ox5mAboFrxs6mKWMWBnsnj?=
 =?iso-8859-1?Q?yOTbvUReEMmFFU9a/Odp1P93QkOa2CKapYlLOWg2MschAkvncGKlJEyCGL?=
 =?iso-8859-1?Q?AltjWILLn6CCu0AegnFn/RmQltGtS1ufzxqP/e//qW7QkDx0cK1WmgrcIf?=
 =?iso-8859-1?Q?eAW3feBmh+04g3nBWy+ti8GZUg5kzjf8ySWcarrYzJHxw9Z+IEPXo/LcnY?=
 =?iso-8859-1?Q?OBDnuOGKIyPmlvZBiVJpoAJbeQvi0+9IB6MxFy35yjbcGd+6RsTU/oCfub?=
 =?iso-8859-1?Q?gWvfneK8GQQpD7yLhau6v5E97uacPgKYE1pgyLmgCMT+OyjG8GIRjvvZE1?=
 =?iso-8859-1?Q?j7R0vvqS5u3hhuL2u8uPHfWUNFNfDrm/Q5foZWfoENLR03mAU368eTDSGy?=
 =?iso-8859-1?Q?yuURtTTDfp1JdDe76GqYBfU9CVwOylO9EwQSrBy5WjModLzu4t8USwyJbs?=
 =?iso-8859-1?Q?JN8fJnDQfQOh5+Acz9mlKfipI7Ydvavb8uSravHTAhyg0R+aJYAauatV7J?=
 =?iso-8859-1?Q?vO9hJur8Pt9KSoaLzz1v+JUt9soRhhPOfcNvhuWPScJgN36pgGOFin96jO?=
 =?iso-8859-1?Q?JPCVuJKv++MJ6Y2rt0Gep2Pze8s/ZdniUEMHiG40DeZ96OJ+ZlpH7PTBSQ?=
 =?iso-8859-1?Q?s9vUENfVbZvq2a7ZAxZas+w8PbHUObukUM0tcAgKzu6Wvo4k2FVR74DgG0?=
 =?iso-8859-1?Q?4mmmDGLG/BDy/37JU60u4t2+sduqjM8K36HjV0os/y7nfq/XqyD0OvQk8V?=
 =?iso-8859-1?Q?2pg/YzJNihCuXbTiiXpRReOmpwDz/7HcMQCrx4TZt0mtQl2x8YuUYYklSx?=
 =?iso-8859-1?Q?JS5/8+z2sF7j4uCwywVN7t4SbSn+tk2rrq85RzUP12hQ+0kPocyXTMzFDY?=
 =?iso-8859-1?Q?U2kQ1Olt7TwZwfZJGf0DfwDawFVvlW0D49/kMqgTUN7nCfsQjIVoG97SFn?=
 =?iso-8859-1?Q?Mz1Z1FgVFbjL0gbpQaYm+o+11NLcYBeFE+u6+Nr39+4itRURthyQy48eDo?=
 =?iso-8859-1?Q?Th/qtSdvb+P4rRVwrviWOWbF5zNGRDcOfp3r53pWhaCcvo636/2LD2if+8?=
 =?iso-8859-1?Q?8b6hN1p9cESd4jseirpwksEByCNRxf7RMo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eb1434b-3a76-4c0c-e401-08db9cf47151
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 18:29:49.5223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s8iqGCfWmnleO9oD+t86G49qCqfVenxIExOeYTud3Ez9axzbKDDJCi/36plvQZ0Om9x7h5IftbSJEAUsqqSvLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6706
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Implement xe DPT slightly
 differently.
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

On Mon, Aug 14, 2023 at 10:37:44AM +0200, Maarten Lankhorst wrote:
> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> 
> Just create a dummy to make DPT work.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  .../drm/i915/display/skl_universal_plane.c    |  3 +-
>  drivers/gpu/drm/xe/Makefile                   |  1 +
>  drivers/gpu/drm/xe/display/xe_dpt.c           | 46 +++++++++++++++++++
>  3 files changed, 49 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/display/xe_dpt.c
> 
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index c28f4198aa15..9469ec5a0417 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c

We need to make i915 and xe changes in separated patches.
Ideally we make all i915 changes in a way that it could even
go directly to drm-intel-next already...

Cc: Jani Nikula <jani.nikula@intel.com>

> @@ -1010,7 +1010,8 @@ static u32 skl_surf_address(const struct intel_plane_state *plane_state,
>  		 * The DPT object contains only one vma, so the VMA's offset
>  		 * within the DPT is always 0.
>  		 */
> -		drm_WARN_ON(&i915->drm, plane_state->dpt_vma->node.start);
> +		if (plane_state->dpt_vma)
> +			drm_WARN_ON(&i915->drm, plane_state->dpt_vma->node.start);
>  		drm_WARN_ON(&i915->drm, offset & 0x1fffff);
>  		return offset >> 9;
>  	} else {
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 6d9196ab275c..33bfe33632db 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -141,6 +141,7 @@ $(obj)/i915-display/%.o: $(srctree)/drivers/gpu/drm/i915/display/%.c FORCE
>  # Display code specific to xe
>  xe-$(CONFIG_DRM_XE_DISPLAY) += \
>  	xe_display.o \
> +	display/xe_dpt.o \
>  	display/xe_fb_pin.o \
>  	display/xe_hdcp_gsc.o \
>  	display/xe_plane_initial.o \
> diff --git a/drivers/gpu/drm/xe/display/xe_dpt.c b/drivers/gpu/drm/xe/display/xe_dpt.c
> new file mode 100644
> index 000000000000..0695886045e3
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/display/xe_dpt.c
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include "intel_dpt.h"
> +
> +#include "i915_reg.h"
> +
> +#include "intel_de.h"
> +#include "intel_display.h"
> +#include "intel_display_types.h"
> +
> +void intel_dpt_destroy(struct i915_address_space *vm)
> +{
> +}
> +
> +struct i915_address_space *
> +intel_dpt_create(struct intel_framebuffer *fb)
> +{
> +	return NULL;
> +}
> +
> +void intel_dpt_configure(struct intel_crtc *crtc)
> +{
> +	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
> +
> +	if (DISPLAY_VER(i915) == 14) {
> +		enum pipe pipe = crtc->pipe;
> +		enum plane_id plane_id;
> +
> +		for_each_plane_id_on_crtc(crtc, plane_id) {
> +			if (plane_id == PLANE_CURSOR)
> +				continue;
> +
> +			intel_de_rmw(i915, PLANE_CHICKEN(pipe, plane_id),
> +				     PLANE_CHICKEN_DISABLE_DPT,
> +				     i915->params.enable_dpt ? 0 : PLANE_CHICKEN_DISABLE_DPT);
> +		}
> +	} else if (DISPLAY_VER(i915) == 13) {
> +		intel_de_rmw(i915, CHICKEN_MISC_2,
> +			     CHICKEN_MISC_DISABLE_DPT,
> +			     i915->params.enable_dpt ? 0 : CHICKEN_MISC_DISABLE_DPT);
> +	}
> +}
> +
> -- 
> 2.39.2
> 
