Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CE0C77B7A
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 19:33:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FEB10E5B1;
	Thu,  1 Jun 2023 19:33:43 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE2510E5B1
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 19:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685648020; x=1717184020;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=J0meQOQggitsWU5Fbf5ij9zjeRke9q2eYJaTbmiAtW0=;
 b=izhD+uW152jxrt/wN9ZyCJ1qwcx/aKhDEMfyRK0R6EZxha0x4wmTgEpt
 hcZovsAxXq+SKzazhkh6yv4nUflGNbTXLmCqo+dMqFXkDWRMUutDc9Amj
 znmWn7H0etpTj8ISgsRDLIfAwfD7JQP1ApOeE7Zjr5dA1sJv0K2xIFaId
 x6P00YNB4JmBIMx6lkmu1DmFh3kieN1NNoKN9a043gBWsxr6N0y89MuLT
 SYhLdQZMQma+EkvZ53rnFo3f9YJyE2hzgA7AHhXncInksqu6FWs54BWrL
 Jt5Y/P++143BqAr/uwpDu0hS0iw816J0dXQVAywqCvY6xX6Y+1r8VOKwi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="442030058"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="442030058"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 12:33:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="772562943"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="772562943"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 01 Jun 2023 12:33:30 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 1 Jun 2023 12:33:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 1 Jun 2023 12:33:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 1 Jun 2023 12:33:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6SpVqapDDXbh+kNDT+KA2LoQmdaNb0GAXfYMOPW/nvRV8xZwcXhrogX+eH2usKZDBIK6TPNYuI7HzsSy90unOHNTGyTnhJf0q9I3zxaNee1amf6ImZuxEzM4EvkAsNSpHX0fRiCq3G0+COCEwqkJGCs17ssX7fchEFLTcZfR2qVtvVqbF6Plr2qVqxrEPis9YsidZKcC17Ohj9W+3JtY1a1Se91m2veXkQBOBDoLI0hwxA8KCgq6DCdqAELWOD7xBb5UdmpwFZ4Bs4N+69IL/GwXkl7U3uhOp+9p+lnO7KbJWvA9oc/dxP7GNVUpcT1LWiEJm1VEMuPkiNtJMQZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hI2SrOjhMrBpAregZtXooa75B927dTnus8QMR9Z1cKY=;
 b=DewZfNzrR07MihdBxH6NovvIX13yBiLESWEqqZ2bL16M99fikX7wKv9vh6WbeJuioEuUU7QAyNNcVEWGrlZAEJXAuKzE61Ux71Yg9t2Su+ruer2cZUP8Ob4PLSg3y5jGCSIpUBGeG3LtHqsWcYhN9qqrcnTvuUWVaS3sGKMVelKgtwXPbtNwZRxirQD75sg1mkdBYhsF5hJKjYzZeZtD+KsPkGP9qSN9QlAgCWodGYgTtziQi1maFHGjj0odoVgiHyvQkfkCuuI/8wregvP6bv5CgsNaw4cSdf4B79+t+td2B04O9/ZpBjfN7hd5uqDjzsTmA1mOWwT8B6obwFShOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SJ2PR11MB8422.namprd11.prod.outlook.com (2603:10b6:a03:542::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Thu, 1 Jun
 2023 19:33:22 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 19:33:22 +0000
Date: Thu, 1 Jun 2023 12:33:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <20230601193319.GM6953@mdroper-desk1.amr.corp.intel.com>
References: <20230601192555.1155097-1-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230601192555.1155097-1-gustavo.sousa@intel.com>
X-ClientProxiedBy: BYAPR11CA0083.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::24) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SJ2PR11MB8422:EE_
X-MS-Office365-Filtering-Correlation-Id: f274b356-6f5f-4df9-7625-08db62d70f72
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rt5yL8W9BM/BDb+gg2mZ6e8+EHGTdzacVicaPGUmcnlbm7A2tKZNEN+OjTHpguzbiITkFVxJCq2xr5BhAg8yQu6O1L2NCXT+uADitmAeUxJRyqRADfC9JA/ZDguVfAU7xb/Asjx551Kae8eIaFEqkt1a+DkSpUKSyi1iRoNRwgd+yefdhMdq5VmsvvP109eTkVeZgeJhhWODbMlhNC/XoiUveTU/YmuoqPTE+aR1TfpwzEzuPKsFu0Fm7CJqTV07dURMDDlbZsHSBAnTwidNRhpEtQRO4nM/sIQ9ecihN9JYBfM4uT5RexlR+/jedNQbN0KnITrFSNJTpbBs/RthSbR9RGKKTG/a3gjynbweVhbDvcKmp6ZNFWpG0a90zC4f8BF2yWq+/ilm4csFiWeS8XstZiqF7k5bU536Ooxj7+JYG4yaIof2Y6ibTJlsD8V4ZhzicaIojjcCGLNDNByYpSboRpiJchmxiMdLCVZ8erWDOjWUUBOYHYnFw2dDvjqvQiq1/ReHr0KyowK738pA0o/NywTxeCAF5k8jV7u0P+C9ovavLVJPiYR+zKcUwsTE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(366004)(346002)(396003)(39860400002)(451199021)(83380400001)(186003)(2906002)(6636002)(4326008)(66946007)(316002)(6486002)(6666004)(478600001)(66476007)(8936002)(54906003)(26005)(5660300002)(6512007)(6506007)(1076003)(107886003)(8676002)(6862004)(41300700001)(66556008)(38100700002)(82960400001)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8LSEKyu60GO6cWy+SrOjNDsCaMTFCNDTHWBYEFG9+mj50XvnfrvJHHc6BQe2?=
 =?us-ascii?Q?jPrXSL0guUAQm9AHTELcFCNb/zfJgjsH/VVpfkZtVH6lXh6wVZb4SZaCOMWb?=
 =?us-ascii?Q?gJIDPCLTOGb0fyWIdineFqmfDgSIYGbKmc3aziWsccpG5qI+km6amQt1l40W?=
 =?us-ascii?Q?t0QkQ3+OMpK5u/bbODTaV4vNzvVRs7oRZU3QjwkwlRFwh70toxVx+xKoRDHI?=
 =?us-ascii?Q?4QVwfk4lzyWAZLMl7YBwSFs54hIeVGGSAxlv5K6xTxWeTk0s+fcDl6FGkwrm?=
 =?us-ascii?Q?ULJOLsE4BG7vb+d8k81JTFlE5OGmqCrYJWUTppYJsORTwJazvN37cA5aKQ1w?=
 =?us-ascii?Q?nGuZgyTMM4qi/IZY2ikiX9bAWLWiF8TQLdwwtVdyWPi6ZCDVvht+2Vc5+YqZ?=
 =?us-ascii?Q?qP5ydpfhzYKSB76PhgIUz8Am98/Qc3tueHzz9+r9sjf7YH1jRU3+V+ltWm2X?=
 =?us-ascii?Q?M4XUxtNatCdNmJWYw1ihwtmZ5GncQWsNi1dxWPqmsdxtpd3g7Te5MnKesoXa?=
 =?us-ascii?Q?lPHeTQ00z9DLxdyAhijEWaDOG1u7dTtqoJnfZgccFtGL5nSWGQAQ6sRGk1gu?=
 =?us-ascii?Q?1/5haUAA/H5TQdaIwt8U3k6JhzNA2MWd9Yuvwae8u68+I57e+ms8HbLIJ3ym?=
 =?us-ascii?Q?WH4mRCywNXmDEgpW8RBobzel8pSEcXdTpe/ENqslSaGLLke5wh15Wl/0reur?=
 =?us-ascii?Q?JuRp7So/6fcmAAErb1PgoNsQBnhGGqrsotNlaDymrYgExDSTtnvMzxqQpmMR?=
 =?us-ascii?Q?dLPMXWOzV6qtXaC9P1oYeGANREX7f45eooiRNmu2S/FjJavZCumywaefclH3?=
 =?us-ascii?Q?NzSPg74zrbJ4YF/egqjCVfxT9Ns1mchmGYZgF67avNj2UUPnZ7H7+vDC7rXt?=
 =?us-ascii?Q?18Tl189uGI9FXOMZ9UNxcfqPPQCENL9jqpjWStI/BuE1d1yPVv6UBtWlgU4/?=
 =?us-ascii?Q?yNibDdB+kf/5LblTZzcG7USKj0uGy92OUMvauj/eg10LDQcPipmYe9DC4NfI?=
 =?us-ascii?Q?dadPZB+mrmGsNz4pRiNe/uhwnSjOYvClhzKRbNSoE3hY+O5WaLgC9E31NMc6?=
 =?us-ascii?Q?wrv7Q7/gqre3RTvGr2v/g7Z049SXVGZeBT+MpaED1FjJMSyPterPhnKN+qdi?=
 =?us-ascii?Q?YF8PcKbyERARO/ue6wQjE+8LgcT4vnKI0966CVeEdYhsuqQsPCbVO6j/eRGJ?=
 =?us-ascii?Q?sIYcd0QlkR+qwErvzPVMbG4BPh6xvb1Nx9Uz/+dAjubKBng5Zk1CC4PVQ4nQ?=
 =?us-ascii?Q?b9n9USOibntUywfwIU54/ywzr1Ky5QIwBPAATKmiqcW8SZoHjzq28pj035B0?=
 =?us-ascii?Q?S6NiRbRtf2Dd/N4IqfwNtG6QafwFw/3Q6DNO9bojrKNI/YzTLqeKfiYfPSIR?=
 =?us-ascii?Q?Y0068mX5OBUXyw8B8bJoI+h0ULmm22ijo8YXQXdV/dtzNFxGmTdG8J79DoLt?=
 =?us-ascii?Q?rduziDd2UZcpPNWKuddjMlmNqKf+LQZvGSbNFGXAnuxh6k/nb1cRJIOFo40r?=
 =?us-ascii?Q?UpAffEuoUqyqlLRR0Fh1IeL6hDeGlBSLCmQxfllpxdZafWgTBLvxiqg60d95?=
 =?us-ascii?Q?a7f7lhEXFx23FlfX53HXaIDrvZNDYdXlUI/krtHrBtRDrlWJOpR+M6mf9FvU?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f274b356-6f5f-4df9-7625-08db62d70f72
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 19:33:22.1621 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43EYWXbXirLjXSfTKtcGzRJHIqmpZWTF3WIRO7IVguBLnG1IdkXkVBAgNkS/bLHeMddI9faB9EAODgkgwNgqA02mteuKNktqFg/nOByuA4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8422
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Replace deprecated DRM_ERROR()
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
Cc: Jani Nikula <jani.nikula@intel.com>, Lucas De
 Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jun 01, 2023 at 04:25:55PM -0300, Gustavo Sousa wrote:
> DRM_ERROR() has been deprecated in favor of pr_err(). However, we should
> prefer to use xe_gt_err() or drm_err() whenever possible so we get gt-
> or device-specific output with the error message.
> 
> v2:
>   - Prefer drm_err() over pr_err(). (Matt, Jani)
> v3:
>   - Prefer xe_gt_err() over drm_err() when possible. (Matt)
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Haridhar Kalvala <haridhar.kalvala@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_reg_sr.c | 7 +++++--
>  drivers/gpu/drm/xe/xe_reg_sr.h | 3 ++-
>  drivers/gpu/drm/xe/xe_rtp.c    | 2 +-
>  drivers/gpu/drm/xe/xe_vm.c     | 3 ++-
>  4 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 434133444d74..8580ff38b82c 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -19,6 +19,7 @@
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
> +#include "xe_gt_printk.h"
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
>  #include "xe_reg_whitelist.h"
> @@ -89,7 +90,8 @@ static void reg_sr_inc_error(struct xe_reg_sr *sr)
>  }
>  
>  int xe_reg_sr_add(struct xe_reg_sr *sr,
> -		  const struct xe_reg_sr_entry *e)
> +		  const struct xe_reg_sr_entry *e,
> +		  struct xe_gt *gt)
>  {
>  	unsigned long idx = e->reg.addr;
>  	struct xe_reg_sr_entry *pentry = xa_load(&sr->xa, idx);
> @@ -122,7 +124,8 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
>  	return 0;
>  
>  fail:
> -	DRM_ERROR("Discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
> +	xe_gt_err(gt,
> +		  "discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s, mcr: %s): ret=%d\n",
>  		  idx, e->clr_bits, e->set_bits,
>  		  str_yes_no(e->reg.masked),
>  		  str_yes_no(e->reg.mcr),
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.h b/drivers/gpu/drm/xe/xe_reg_sr.h
> index 0bfe66ea29bf..c3001798d9e8 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.h
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.h
> @@ -19,7 +19,8 @@ struct drm_printer;
>  int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_device *xe);
>  void xe_reg_sr_dump(struct xe_reg_sr *sr, struct drm_printer *p);
>  
> -int xe_reg_sr_add(struct xe_reg_sr *sr, const struct xe_reg_sr_entry *e);
> +int xe_reg_sr_add(struct xe_reg_sr *sr, const struct xe_reg_sr_entry *e,
> +		  struct xe_gt *gt);
>  void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt);
>  void xe_reg_sr_apply_whitelist(struct xe_reg_sr *sr, u32 mmio_base,
>  			       struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 43a86358efb6..956bd39fe1a0 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -122,7 +122,7 @@ static void rtp_add_sr_entry(const struct xe_rtp_action *action,
>  	};
>  
>  	sr_entry.reg.addr += mmio_base;
> -	xe_reg_sr_add(sr, &sr_entry);
> +	xe_reg_sr_add(sr, &sr_entry, gt);
>  }
>  
>  static bool rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 5aa2aeb14beb..f31bfc738247 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/dma-fence-array.h>
>  
> +#include <drm/drm_print.h>
>  #include <drm/ttm/ttm_execbuf_util.h>
>  #include <drm/ttm/ttm_tt.h>
>  #include <drm/xe_drm.h>
> @@ -3056,7 +3057,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	}
>  
>  	if (XE_IOCTL_ERR(xe, xe_vm_is_closed(vm))) {
> -		DRM_ERROR("VM closed while we began looking up?\n");
> +		drm_err(&xe->drm, "VM closed while we began looking up?\n");

You could also use the 'dev' that was passed as a parameter to the
function rather than re-extracting it from xe.  Up to you though.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  		err = -ENOENT;
>  		goto put_vm;
>  	}
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
