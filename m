Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10F5C77B75
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 17:51:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F9610E458;
	Wed, 17 May 2023 17:51:05 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091C210E455
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 17:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684345861; x=1715881861;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3B3GGSCMi1uNo8g6A8mrKPbZ2XJoGSQgWIk9rQ53flo=;
 b=G3WBo4EnkQ8ZX5GLT+xN3x3VirYO7dqXXDkEheZBAa7t/spF+CMJ6CLF
 /3dC7UzTFl5nGSuZbIg+4TCAs6GaIqGLA1uHc3AtoHl3eRPoRpky8qda8
 FWAWC8oJV9zyZIYeT6bNXYAwvj8tSseU4QzFs8+5IMAEREe0LjQJuJ3e4
 hvl02UmO7v5hupQm37x344gXlw69zQ75riN37tA50Vv1XZNlAA59OHN9g
 qdnBgs6iFe5AAuUur70+zhJEUQ+WKZGxSWoI4F2g5ht0z2bO6yBpoa0e/
 U/MQ6M6lWCxegu10QvqyfMF8edmpS7oe53k1njQP3sHFmnnrKLPsaO/M2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="350666388"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="350666388"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 10:51:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="732534388"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="732534388"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 17 May 2023 10:51:02 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 10:51:01 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 10:51:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 17 May 2023 10:51:01 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 17 May 2023 10:51:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vrrsnlyr0DV/av6ug9u9SewvEcPJSo/eiLbmwMdD9gZO3/ZIkl+IJgZE0cDZeedbEDv0LjW0p0xu6snog1CBYZ4+9+NjgNWBVxuWJInc3dVz5kKmT2jJWX215JaRyRHfxLEsvjETXjQpkY8gyNWcl38h++yRbukgkZlRr7w75/jsxi9FWQ6qPvD62lU5i6yj1Ugcz6UrUE65K1RGaw441i9zlUKCnBk6Xn3H17K/ita9GdBZf2s8y66CnWLPPrVGionq3I8J1GgvVMKnwLtjDjnv94PPRSvI4x2o1Q2LqsKgNNs8sn4vecvLMGNVf0QqcvttDvICdlf35QofO68Zxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/i9U7fU/t1k1+8rj/fZn6EE7kl38u9MhwBumqc+fYE=;
 b=LbYelyxjXFHo9bfgQQSDsYPgb6uZJHUetG2EcY2MWLdbss+De1xM6nUloJHQhy3Isbq9N/6A2vrztGYlaODz5p7g5nYQrlNj74gg/XiGaX7YAq61bcFAx7/OI3r5RHjtbnHF43H0wj5WatxCGfLBqfb+zdHfZ2vGgXAoFime8AO2/OMLNrnGf2vYrZtuCR+11RcRumTOIICW2V0Rtc2XTTGQpYCbpWr/9VwCGIAE4Lwvtx9w+voVo1UFvOxuSuw9HB8dqcn6Ods1rraumZ8y1BSm06X+qR7AV5Uce6rHfUrSmkLY6tKfZb+XUc+VWVr5pPRhDrCMjAU9K/cdpGOgXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 17:50:59 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6387.030; Wed, 17 May 2023
 17:50:59 +0000
Date: Wed, 17 May 2023 10:50:56 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230517175056.GR10045@mdroper-desk1.amr.corp.intel.com>
References: <20230516221950.3512818-1-lucas.demarchi@intel.com>
 <20230516221950.3512818-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230516221950.3512818-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0211.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::6) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|LV3PR11MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: 5af337e6-e36c-45ae-21f0-08db56ff45f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FIMeJqIjoK0vuzk3V3Kz4s6SHdx5QFqPqaR5CpgzBY7WVrEfN4vi7y1y7YrDKFQK47Icvy6iWuSyhMCdESLQzD5KuWAVHE95aUhv7uHPkJvo+tKnEA7Rzy9ZM2aqBt8hx0BDPvha2+JT4PV/r67LTdq9rR+dJhwqyoZ4H2KhdJdWz8df5t0ospFw4YfRwQOH9X7ZLyRNVUNMMcR8ShTP0rZL1C3uDX9/DNy0CeU8YO7uq3UsYtNxr1PSjZCjfXT4RLPzK5q9bhmP0IMSOWH7jAUaHfKDB8jMwzwBvxwlAg1pDZzw9vLptXz7nJvqJXVMW7LU/j64M0fdGigcqLpg2YXFsifX7WeiU3eY/WMSGHM2GfPR8OW03IE3/z03w0VX6L9cbkL/QBdZ3EB1G2BDqOUmkOX+QTZXKhaB3bGrpgt1LmFB+lVRNGj8zcFZB4xjbStDC3Jic0Pg6SC84LADdKhbIToPlRREwldS9qbikRoZbpYt/kdmOTHMBrFGsBPRLcBZYHg7ecFo2e0GlK/ynei9LOfSXCK+dvpgTj9cm1y7IO0QwK8YeZImfhSzRuy6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(346002)(376002)(366004)(451199021)(5660300002)(6862004)(86362001)(8936002)(66556008)(8676002)(83380400001)(107886003)(6506007)(6512007)(82960400001)(1076003)(26005)(38100700002)(186003)(41300700001)(478600001)(6666004)(33656002)(6486002)(316002)(66946007)(66476007)(6636002)(4326008)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o54yi4Hhj3DHGvaLR719AlaTp5YYVycqotvsRJQ4k88xXKU6UU4u55BHV0xy?=
 =?us-ascii?Q?CxJnzj4vHUf2VnQltc2CEdDsqI1Fi7X+uEGlGxybNXA2BN6svQA5y9XMPKga?=
 =?us-ascii?Q?lnskUq86DwnSLyMuieNRBzp5g9j9HSjxgIurkg/PwYgKzPWy/as27Y8RslH/?=
 =?us-ascii?Q?sPwhkM5gE2XTFNbrWb++Olmx74TGEk4v2wFRcxZByvm69w/oMyVizHCaIMV7?=
 =?us-ascii?Q?Y6t3HJ/rZB70r1XWQx4OUzWcxCo7ZEVS8vNH3wAi9UJNwJpcV6xZ2cSdHpxQ?=
 =?us-ascii?Q?mfizYjI2rGZGcOCUi+O3D38t8RzFGAr2oQKk4KlGUhkO87r0VjC7XDGDpagQ?=
 =?us-ascii?Q?Z7xx07/KM1m19sG/WblpgP9dRdSa5quJ8YbbuvJJntYy8LTg/+ly1VpwZ1o3?=
 =?us-ascii?Q?8/O54W6XJfQ+EFCT6Lr/vdlWtFPNqGg6RdDFNo6xz9nb9Ao5IOOEUh60qSxe?=
 =?us-ascii?Q?6hQToP5PmBno5CKiotfkYEM+BdZ3eRXs1N2SUi0d3ap2AC1XZers3nUKbqDL?=
 =?us-ascii?Q?NHf3jIU5SAlp2C2WNdRfAanLmhNq1VDGutyotEAKbLGUKvA1qDwAe5N/IGSA?=
 =?us-ascii?Q?9QA+G6DP0Q0LMULZ/jwtBNBSSieBQHqJEHWfjdwwYnMbDUp1MzGXwzt+yPdA?=
 =?us-ascii?Q?kTvoBUpYqp0XP6gZtqroPM2CQZ5nwCVj6BvkwBIi3LKfoGkxszbV6t8WiDmy?=
 =?us-ascii?Q?VYkUDR6U2zsKaCAQJhNcwxDQL8yLFmXYPUbYxhgZ4KbvhwiLfkq4k+DgRdxj?=
 =?us-ascii?Q?cGlWeNOksjHrcSsJRnrCRSIddm/oeTzuIz0tTDxaunwplJMczu0W8onOAnBW?=
 =?us-ascii?Q?OE6DkEkdejLJ23k6f7BwBHXM/xj7jCA4uwfWYz9/6J3xcPu/vjQZ6uaDug99?=
 =?us-ascii?Q?t+DDqWAS6m6SYxAC0vnxJKUxdzgOvW4zOOdvze8cvjpMkcGiiL138DjmCKCH?=
 =?us-ascii?Q?NQDEFwGXSp0bvG+fr5O7P5xrPhR6EcdIuLg6ZjuwfncFhVfF8Z1vRT7/eIPo?=
 =?us-ascii?Q?CJbgNoJ/q12R37uOzl5kQRc007Iw/uSFXDur+VNTja8919MdE/28+qDMjYei?=
 =?us-ascii?Q?XK7LvMTI1TSuOhwPSzOi87ZnHNmpUXreLi3L9rvy4C40Eg8jfrOXXewIa5wM?=
 =?us-ascii?Q?kZed4Fzjei+cRiN6+rXsVp1Zah/FMvUwpkWerOAQewLaIeIc8VDX/D6vv76e?=
 =?us-ascii?Q?HYjFkFpODa4BjhlXun1x/pVJ9XgOYA40s1uhvyPOvxGH/MSsdw+T4VmjxYw2?=
 =?us-ascii?Q?APx4BoNUOVo3C05vbOq6pGfWgLPPC2Mk0SJSNQ9CkV7yU0VuXB5SFfTlO+il?=
 =?us-ascii?Q?o2tJ4G3tQX17wmkKA0EaaBRYx0pt8VHGogRhx8nOhciA5kZrbZWjNVlfjpOW?=
 =?us-ascii?Q?oftxVz9FDe3VNeQfE3SC4hHOWt28X9z3KSVmkuh7ZeOrM3dQPz1uaLr8q+0v?=
 =?us-ascii?Q?JRxF+D/2POPvKo9xXJusen/Xcmj+RjaWa9/HGa/Dp8CbuwvQXXOSULPRp+93?=
 =?us-ascii?Q?qZ90P7FR1pGWoQN94UoAI4LtmRIdkDqn3BqWrixBbAaX45LUNCGXfCH+yLjD?=
 =?us-ascii?Q?n28kZFKYoXQcbA+xKQS7qkB11mQvphrVEyLllzYWB8oY1w1Z8X0M0MTBwd9z?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af337e6-e36c-45ae-21f0-08db56ff45f2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 17:50:59.5588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vo0TL6ayeBYqleTdQbywwOQhqezm150JuU+RgXztdKuI/chPwQ2b9SrzjOfiHrUBe8Tll3G42jQeSccrtUSJQzIy7MBvSk/K2FN4a9J0+c0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8602
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 5/9] drm/xe/wa: Track gt/engine/lrc active
 workarounds
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 16, 2023 at 03:19:46PM -0700, Lucas De Marchi wrote:
> Allocate the data to track workarounds on the device, and pass that to
> RTP so the active workarounds are enabled. For later reporting purposes,
> there's no need to differentiate the engine or gt in which the
> workaround got enabled, so just use a per-device bitmap.

Going forward are we going to want to track these on a per-device or a
per-GT basis?  The workaround database has switched to associating
workarounds with the IP block rather than the platform since sometimes
they're needed by both the graphics and media IP, other times they're
only needed on one.

For example, consider a couple different MTL workarounds:
 * Wa_14018575942 -- applies to both graphics and media GT
 * Wa_14015795083 -- applies to graphics GT but not media
 * Wa_14016790560 -- applies to media GT but not graphics

As we get more post-MTL platforms where these chips may get mixed and
matched into other platforms, I think it will be important to recognize
not only whether the workaround is active somewhere on the platform, but
exactly which GT(s) it's active on.


Matt

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       |  5 ++++
>  drivers/gpu/drm/xe/xe_device_types.h | 10 ++++++++
>  drivers/gpu/drm/xe/xe_rtp_types.h    |  2 ++
>  drivers/gpu/drm/xe/xe_wa.c           | 36 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_wa.h           |  2 ++
>  5 files changed, 55 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index f7f6a6a97757..ac6898a28411 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -31,6 +31,7 @@
>  #include "xe_ttm_sys_mgr.h"
>  #include "xe_vm.h"
>  #include "xe_vm_madvise.h"
> +#include "xe_wa.h"
>  #include "xe_wait_user_fence.h"
>  
>  static int xe_file_open(struct drm_device *dev, struct drm_file *file)
> @@ -251,6 +252,10 @@ int xe_device_probe(struct xe_device *xe)
>  			return err;
>  	}
>  
> +	err = xe_wa_init(xe);
> +	if (err)
> +		return err;
> +
>  	err = xe_mmio_init(xe);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 6490a04614ce..b8d7864950c4 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -265,6 +265,16 @@ struct xe_device {
>  	/** @d3cold_allowed: Indicates if d3cold is a valid device state */
>  	bool d3cold_allowed;
>  
> +	/** @wa_active: keep track of active workarounds */
> +	struct {
> +		/** @gt: bitmap with active GT workarounds */
> +		unsigned long *gt;
> +		/** @engine: bitmap with active engine workarounds */
> +		unsigned long *engine;
> +		/** @lrc: bitmap with active LRC workarounds */
> +		unsigned long *lrc;
> +	} wa_active;
> +
>  	/* private: */
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
> index a9e0153ff87d..b1e77055f9cd 100644
> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
> @@ -108,6 +108,8 @@ struct xe_rtp_process_ctx {
>  		struct xe_hw_engine *hwe;
>  	};
>  	enum xe_rtp_process_type type;
> +	unsigned long *active_entries;
> +	size_t n_entries;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 557e90d79f0b..fa37b1c0425a 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_wa.h"
>  
> +#include <drm/drm_managed.h>
>  #include <kunit/visibility.h>
>  #include <linux/compiler_types.h>
>  
> @@ -580,7 +581,10 @@ __diag_pop();
>  void xe_wa_process_gt(struct xe_gt *gt)
>  {
>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
> +	struct xe_device *xe = gt_to_xe(gt);
>  
> +	xe_rtp_process_ctx_enable_active_tracking(&ctx, xe->wa_active.gt,
> +						  ARRAY_SIZE(gt_was));
>  	xe_rtp_process_to_sr(&ctx, gt_was, &gt->reg_sr);
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_wa_process_gt);
> @@ -596,7 +600,10 @@ EXPORT_SYMBOL_IF_KUNIT(xe_wa_process_gt);
>  void xe_wa_process_engine(struct xe_hw_engine *hwe)
>  {
>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
> +	struct xe_device *xe = gt_to_xe(hwe->gt);
>  
> +	xe_rtp_process_ctx_enable_active_tracking(&ctx, xe->wa_active.engine,
> +						  ARRAY_SIZE(engine_was));
>  	xe_rtp_process_to_sr(&ctx, engine_was, &hwe->reg_sr);
>  }
>  
> @@ -611,6 +618,35 @@ void xe_wa_process_engine(struct xe_hw_engine *hwe)
>  void xe_wa_process_lrc(struct xe_hw_engine *hwe)
>  {
>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
> +	struct xe_device *xe = gt_to_xe(hwe->gt);
>  
> +	xe_rtp_process_ctx_enable_active_tracking(&ctx, xe->wa_active.lrc,
> +						  ARRAY_SIZE(lrc_was));
>  	xe_rtp_process_to_sr(&ctx, lrc_was, &hwe->reg_lrc);
>  }
> +
> +/**
> + * xe_wa_init - initialize xe with workaround bookkeeping
> + * @xe: xe device instance
> + *
> + * Returns 0 for success, negative error code otherwise.
> + */
> +int xe_wa_init(struct xe_device *xe)
> +{
> +	size_t n_lrc, n_engine, n_gt, total;
> +
> +	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
> +	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
> +	n_lrc = BITS_TO_LONGS(ARRAY_SIZE(lrc_was));
> +	total = n_gt + n_engine + n_lrc;
> +
> +	xe->wa_active.gt = drmm_kzalloc(&xe->drm, sizeof(long) * total,
> +					GFP_KERNEL);
> +	if (!xe->wa_active.gt)
> +		return -ENOMEM;
> +
> +	xe->wa_active.engine = xe->wa_active.gt + n_gt;
> +	xe->wa_active.lrc = xe->wa_active.engine + n_engine;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> index cd2307d58795..8edad4f92800 100644
> --- a/drivers/gpu/drm/xe/xe_wa.h
> +++ b/drivers/gpu/drm/xe/xe_wa.h
> @@ -6,9 +6,11 @@
>  #ifndef _XE_WA_
>  #define _XE_WA_
>  
> +struct xe_device;
>  struct xe_gt;
>  struct xe_hw_engine;
>  
> +int xe_wa_init(struct xe_device *xe);
>  void xe_wa_process_gt(struct xe_gt *gt);
>  void xe_wa_process_engine(struct xe_hw_engine *hwe);
>  void xe_wa_process_lrc(struct xe_hw_engine *hwe);
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
