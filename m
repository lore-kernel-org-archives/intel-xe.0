Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80777C77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 22:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D21C10E070;
	Thu, 25 May 2023 22:28:15 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CCE010E070
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 22:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685053692; x=1716589692;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KeUka04VCSFlupmGsl4t3kfQp6UXeVwyxqQ9TCDACAQ=;
 b=bbcCamRe1vM9/qwAPpTOy+ak0z5BlWAztOeCMKSmrSBDYcuTbqSxa8OK
 1y49BUPGPA//NgaSCmEdMUhTD9a6ep9CfS6/v6q7lQgXkx6GUWNhB+6ez
 uNM9hLHSUfMJkEIX2bSi1s9oJI5GzG2+lhFYU8TTjw7ZZCy/J4FkjoRgt
 TuRG3RsYnTJwhqYmTlG6ciFxfOvTwaix/uW5GBHKsZiZnCGueDCek7Gin
 nQPugvtWia29mTex8rQxnq87lQXiE8Alq83Qiv2c0BH07pooxHdbGJOg0
 8CQQ5aVUwoFb/D5KKFKIfcwaRVNB771KiutU96jHCyREcBA8IOGTTJtOS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="343538257"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="343538257"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 15:28:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="737981013"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="737981013"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP; 25 May 2023 15:28:08 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 15:28:08 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 15:28:07 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 15:28:07 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 15:28:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Enx5+7I3alVf+ugAJz6PO4ydzmEdwfdC+s8IqeAI1C+K+PzdnufAd/DF/9zhfSr47sHk63e+v6QD3bg31LHHY9Z6RBmd89rC94JE25VEty16zusn8crgPqAOCSMW3smDaoa7ag1/6m7vht7R2tNUwP/PKS15P7w7NzdajZUNnRPFuTqbV14zRMQkkK5RGj1QJOyY/AQXZWQi4be7pQDClQ6+6RrSoa0V9UKShr1VEiDQCVsRtoiURIkMZ/y/vp0xXSSj867PQtMWXI73D7kXRbrHaj9Mgnn83ldGtXIrmYNKWRS6AZWoLqT+shdPej4pXYQqqAglm/rPeq7wsl7lCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPODEdVR3h8p/gIFnf36RVSwoI7ZFd6HQyOIDUpb95E=;
 b=TjAiydnOqtgsWxmk7w4XaUUB+oTtNVucBOxN92olQznOY9rr01YhgBZqrkOuy13oDbRinNmn+Gd4zPJ67y5o8rvw2Xwz7qxqQtQv8D5dcmNueorQW+pA51w5Y95+FPgJcBWdO+RCpHp6n3w9yfgfZ6A416cIg/+ZCQx7P8uqEGtcih8t3vmE/mcMcueIu5JJRNsraTymOHyhDMPrnlnpfYzXwQ9Hm5aUO8jH0NS16E32RyIdj+lsCP25V9bk9UPDDZT+Fso4yM9MCzycqKxtuyzCADF+BMHL0U4jIuZSr4whm1hP1s183f/NjJGqSssUPdBSN4O+MpDgB4V3FEadVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DS0PR11MB7829.namprd11.prod.outlook.com (2603:10b6:8:f1::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.16; Thu, 25 May 2023 22:28:05 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 22:28:05 +0000
Date: Thu, 25 May 2023 15:28:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230525222801.GU10045@mdroper-desk1.amr.corp.intel.com>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
 <20230525213407.3907094-7-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230525213407.3907094-7-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0295.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::30) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DS0PR11MB7829:EE_
X-MS-Office365-Filtering-Correlation-Id: 4679c2e2-cae2-4761-53a1-08db5d6f4efa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ONpto0xBKuXkdNBqDuucKaJE2Yeric6EHeXyMhKbvgB5r8eSFEP6EOLuXWTMti7+5M2u2aR+8Ru/8GGDCa5bxzDR6CHfvXYTR9Y8FBrsPh0BqUGECs/pkbsN3O61H5r0eJUoJ3j1jVC3fhTHBb3QPskVlTqeOESyoLrmNKivLIxU13MQONiuuhOCwmJwHonRcVngOtiOqtq/5Szw9PcXiKDzjPBB8PGCXLStkTw/petZkDMk2fyu1chrXlZjBQZDDdUs0/ksKfRa0O/DLMttmUN9D68/l8DPSZ/exfVQI7Ovn55nEVputM8aDy/zAO3cLtfdU1Uv+mxf8XZTi+oa+2mHcrZqUMYIXf2XZDYlIRNfG6PrcL23iot/evQAxXfG3hssiP4u4lUtgYNqqEOAcUuHLY4osODsVN8MjPCYRXvYpXzgC67ITH7PZuUotU367cClbUv5RsctLmWoySV6S1tr/NpgHgALHWG3GKyMylQQOFBJc1hyhll2MX+IF4Y4aAc7KEV64vMXTS+3xJZDAJD2dp07ng8R5haZN7hhJmznwfYP5IGk2YIhM1q0gTW2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(376002)(136003)(39860400002)(366004)(451199021)(33656002)(86362001)(6636002)(4326008)(316002)(66946007)(66556008)(66476007)(478600001)(6666004)(6486002)(6862004)(8936002)(41300700001)(5660300002)(8676002)(2906002)(38100700002)(82960400001)(6512007)(186003)(6506007)(1076003)(83380400001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vT7D6y3AY+NUcUrHVFRwV6IhUe5Kc4LKi4+CEW9HeoxGzL55kcVBJWHLZ8a4?=
 =?us-ascii?Q?s1iTTkgIao2c/fkwqm/yg4eddAFpvOtDxiM+zsO8sSalZyKirSwNFILbohh0?=
 =?us-ascii?Q?pi9ZqZJ0ImFgtDZCzkTe8nanDKYeuSnJJxdj6aXcohh5pUZ5GkdMKFKZtFb4?=
 =?us-ascii?Q?8eMaoQTvDQGuqto0iGKZLCGeRQqmJZ5lAGEGz6TSMTli5YIVtCaEMnhIHbuo?=
 =?us-ascii?Q?TCuFZbUZPsgR8s3FXeWcV87gQKY2wrE7QtvsMLmhjTRxwHRHdxmIdPjBzHPn?=
 =?us-ascii?Q?diXCydB1QhC31Cyz878LlOnW4XSK9lFcuJrUoZ7G7a/CRippEFPGCSuNz0N0?=
 =?us-ascii?Q?tIkK9wy4Jkgk2TXQm2wmGqAvN57hVZAKuAoPF4i12awdJ7rA0HG+0vxnC1Hj?=
 =?us-ascii?Q?tgE8FkNGl9kv3nKLVnmhVp+Mj+cT8FdKoOZm83eMKdho1Ts0C0hvLk+xetaO?=
 =?us-ascii?Q?9gm50khoBamcPUANEYq8uG/U2/5s/YFQ4PVX23DTtcKyeUB1ULtsRaNec/R8?=
 =?us-ascii?Q?O/5ilMbprE6g7zlqwjG93je7sTqc3VcJAxf3SVoso8upbwOW/6JDyxmrQPRT?=
 =?us-ascii?Q?/tvXhnZc6pbooR3RN95uXTaFu+FN5ac/goD2I9nEzVxmVZkvwmuPs8D2dIeY?=
 =?us-ascii?Q?z2ySHfdUk1K3T50FbmrI7uhDmsFYWy7rl/+HotQPMHy3gMoNCwn6WY5MnzIu?=
 =?us-ascii?Q?XhXnwJZ38c9gvIjG7aif/M9Tsn3g4jN+ljGAaCUYlArHJLoPxUXoo8Mu2pZK?=
 =?us-ascii?Q?sraFaYLmTF41jKF89Cp3nlc+r9rZaSfamepQ5IrygjUyLjWvJTT3Tue5EZxZ?=
 =?us-ascii?Q?nmcluyS8iT5gjcbX+QJRwaIK0WVXONgmusFRmxHlU/VNHszdm+br64zeZYNW?=
 =?us-ascii?Q?2kbaY2NkZue+872cceycqzqvxCi0loXPmfg5Sn6/9nA/F3H54wH4hGiBjPLP?=
 =?us-ascii?Q?410bkcYzobIuWkBU96fB6MUkYsBhgUOzl9i9D7uw5syh1XSgs++us4DzdqV2?=
 =?us-ascii?Q?m1x+pliQQLkDdYQTegUE4k5OEapl8Is/4rvl7uMMemAum+q1OBVikERfDII0?=
 =?us-ascii?Q?lG4r50hxutCQywhY1XVnMczYL9zTmQ7+7pkn1pBhPHOy/pMO+rT6aZ5P9xNQ?=
 =?us-ascii?Q?UT9bk/fUi5Rpouope2nmw3I6e27TZUrB7onNmoZRx7fwkf2a9VyAC5GbgC5D?=
 =?us-ascii?Q?4/Nwt+xeiqQQFhEuQS7VIAAzzXNwswChYoGFhdV92eSukHI7FgEWuHb0E3I5?=
 =?us-ascii?Q?8ZTF0w7poG5ahhJ5gNGqhgIVIKu1bkIH3Uqiy6dMKywD+vaQ4/GI1ILo9tw1?=
 =?us-ascii?Q?Ef+d09hV4uE9QeNAsaLQUAWlKMIzBx6Ebv3zFkSm9H4Q8Mlx4kwPZ58IdjIQ?=
 =?us-ascii?Q?QJp6df6FRrTEprBeXX9Ajcml8vN9PupudJ1jyCnmD5NjYzgQ8eNW7Otrn9jb?=
 =?us-ascii?Q?ikNEeTKYDbjldhY765NZfAQeIjWFGtfRpnqy6EPdTeJjOsKIkLyh0vZfuTNs?=
 =?us-ascii?Q?LZqifZXLKZYuzcdzWoRNtnIU3wLDxPnS+PDUCzue6T+Ujjzty86EWj5SWd3X?=
 =?us-ascii?Q?3qZnRSlWUvZq1tn6ZFsh2ITW+5Zs9u8I73qM4G+cEv31ULQ8jjQoyUc3MHD7?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4679c2e2-cae2-4761-53a1-08db5d6f4efa
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 22:28:05.3016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dn8vmTNGcukkWTs0vIzf/Yj+O2j9O5bX/Id1yNVS4bjtllwHD8SzmISiVtALpl+NTIuL9+Z3ttCY1h/1jBcXoPY/vmBM/ZaW2731JgMKh9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7829
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 06/21] drm/xe/wa: Track gt/engine/lrc
 active workarounds
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

On Thu, May 25, 2023 at 02:33:52PM -0700, Lucas De Marchi wrote:
> Allocate the data to track workarounds on each gt of the device,
> and pass that to RTP so the active workarounds are tracked.
> 
> Even if the workarounds available until know are mostly device

s/know/now/

> or platform centric, with the different IP versions for media and
> graphics starting with MTL, it's possible that some workarounds
> need to be applied only on select GTs. Also, given the workaround
> database is per IP block, for tracking purposes there is no need to
> differentiate the workarounds per engine class. Hence the bitmask
> tro track active workarounds can be tracked per GT.

s/tro/to/

> 
> v2: Move the tracking from per-device to per-GT basis (Matt Roper)
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c       |  5 +++++
>  drivers/gpu/drm/xe/xe_gt_types.h | 10 +++++++++
>  drivers/gpu/drm/xe/xe_wa.c       | 37 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_wa.h       |  1 +
>  4 files changed, 53 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 80d42c7c7cfa..d139554316d4 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -315,6 +315,11 @@ int xe_gt_init_early(struct xe_gt *gt)
>  		return err;
>  
>  	xe_reg_sr_init(&gt->reg_sr, "GT", gt_to_xe(gt));
> +
> +	err = xe_wa_init(gt);
> +	if (err)
> +		return err;
> +
>  	xe_wa_process_gt(gt);
>  	xe_tuning_process_gt(gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 7c47d67aa8be..017ab60f2498 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -359,6 +359,16 @@ struct xe_gt {
>  	 *    of a steered operation
>  	 */
>  	spinlock_t mcr_lock;
> +
> +	/** @wa_active: keep track of active workarounds */
> +	struct {
> +		/** @gt: bitmap with active GT workarounds */
> +		unsigned long *gt;
> +		/** @engine: bitmap with active engine workarounds */
> +		unsigned long *engine;
> +		/** @lrc: bitmap with active LRC workarounds */
> +		unsigned long *lrc;
> +	} wa_active;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 557e90d79f0b..3e2a3f678f36 100644
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
> @@ -581,6 +582,8 @@ void xe_wa_process_gt(struct xe_gt *gt)
>  {
>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
>  
> +	xe_rtp_process_ctx_enable_active_tracking(&ctx, gt->wa_active.gt,
> +						  ARRAY_SIZE(gt_was));
>  	xe_rtp_process_to_sr(&ctx, gt_was, &gt->reg_sr);
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_wa_process_gt);
> @@ -597,6 +600,8 @@ void xe_wa_process_engine(struct xe_hw_engine *hwe)
>  {
>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>  
> +	xe_rtp_process_ctx_enable_active_tracking(&ctx, hwe->gt->wa_active.engine,
> +						  ARRAY_SIZE(engine_was));
>  	xe_rtp_process_to_sr(&ctx, engine_was, &hwe->reg_sr);
>  }
>  
> @@ -612,5 +617,37 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
>  {
>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>  
> +	xe_rtp_process_ctx_enable_active_tracking(&ctx, hwe->gt->wa_active.lrc,
> +						  ARRAY_SIZE(lrc_was));
>  	xe_rtp_process_to_sr(&ctx, lrc_was, &hwe->reg_lrc);
>  }
> +
> +/**
> + * xe_wa_init - initialize xe with workaround bookkeeping

s/xe/gt/

Aside from the typos,

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> + * @gt: GT instance to initialize
> + *
> + * Returns 0 for success, negative error code otherwise.
> + */
> +int xe_wa_init(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +	size_t n_lrc, n_engine, n_gt, total;
> +	unsigned long *p;
> +
> +	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
> +	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
> +	n_lrc = BITS_TO_LONGS(ARRAY_SIZE(lrc_was));
> +	total = n_gt + n_engine + n_lrc;
> +
> +	p = drmm_kzalloc(&xe->drm, sizeof(*p) * total, GFP_KERNEL);
> +	if (!p)
> +		return -ENOMEM;
> +
> +	gt->wa_active.gt = p;
> +	p += n_gt;
> +	gt->wa_active.engine = p;
> +	p += n_engine;
> +	gt->wa_active.lrc = p;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> index cd2307d58795..eae05bcecc68 100644
> --- a/drivers/gpu/drm/xe/xe_wa.h
> +++ b/drivers/gpu/drm/xe/xe_wa.h
> @@ -9,6 +9,7 @@
>  struct xe_gt;
>  struct xe_hw_engine;
>  
> +int xe_wa_init(struct xe_gt *gt);
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
