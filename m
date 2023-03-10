Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9166C6FA99
	for <intel-xe@archiver.kernel.org>; Fri, 10 Mar 2023 23:43:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DEBC10EA2D;
	Fri, 10 Mar 2023 23:43:16 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB2D10EA2D
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Mar 2023 23:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678491795; x=1710027795;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2fylB0F7S82uIWI/9OKQKasY+oCPwwvDPmn7ZTRVCyE=;
 b=Yb7rN7g/a/VcuQdKKaHDzzVvl4lQk5xWsdn7GgwcJfS+kw5dQjWFBFwA
 tdMGlJvM/dGZkpVS8ETIr5jrCMvpb13/whCWig9uS//Kcg5oETVyrhDDa
 INWTOeP7lI2TSn5k935XAXkRJwvj1iFptVIs574RqOqmo8Rb/gZxZsjQ1
 KSAEdrTHlG5S8d8LLtn6t7eILQ2KPkXpmh7W3+hG5m3ZddlkROsRTlEea
 1q/SVCbpdUDwEuMyq3b1xq2HM0PaA6E9bmFiqIh28cBfPTxuv3uOR8PNF
 Phl8ClFCJcH4nYtDz7eupYZKwYHF3I+4HYDdVXSINIRC9Havg6yViI7rO A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="401714437"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="401714437"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 15:43:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="742172758"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; d="scan'208";a="742172758"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 10 Mar 2023 15:43:14 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 15:43:13 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 15:43:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 10 Mar 2023 15:43:13 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 10 Mar 2023 15:43:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWPZ4d9+wppXGRY9nwP9ziGDMVdfcBGgYFh7YtS7fhlIeVUAmulHm5On3k4BQnGPCL3+jQP1jcSGnOABTSFcqs4BZ1m2aXjXnyKuwCOxk98mCLEgt8eFESsXO/9I5F72WG27pojL4GTR3EYPqFa7oAhpKCgHkhABkqWiEont/R+MpJt3S8m7wS7shQuBW0l0VKZE5YsM1NT4IqpE5QSojrTTpN75E3LU7a5QhtT11n+70777HbtvIdYSgsR4WsiIr3qLjUKQWBQiJxcTX3qMtVHdRNptHgKlsQuHPtwmLcKtRZNr/7juQ9R6xoT9b747tmXZc9s5rAbth/WoT6sbVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6Q/ojqKpCZ8P6B2vstfMnZWBzUXTLdRX761dnAdNeg=;
 b=lqrXVretNns1FdKeiTaQsgfGqTHSrGDZOpMcXfpjbSwh/LEs+vpuW+7N8v9CsvIjPnA67bLtMhwFOIyqQO6CQyUJEdUMFc/TJkigLY2uH12p2AZni9RT7cf6uxWWdig+s1oMEsMb9ytq0CpD6DAMUjNreT1tqk53ILB90VFSukyru96/FhhHNRS/3VwYW/dmmSbvQA3qzB1Zo4BBOmqdtw6gLjXG99o7xdJjPbk0gw3Go5EUw65GZsZysteeQDbQebXCJWLqClqCuG96wCwIFpIxg/dAGkg1PFjvxJ7pHOlQNh7u6lFS1v86EdARtoVk4BqKxaX7k/BwbvpmUlOs2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA0PR11MB7283.namprd11.prod.outlook.com (2603:10b6:208:439::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 23:43:06 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%6]) with mapi id 15.20.6178.022; Fri, 10 Mar 2023
 23:43:06 +0000
Date: Fri, 10 Mar 2023 15:43:03 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230310234303.GT1175070@mdroper-desk1.amr.corp.intel.com>
References: <20230310221549.2337402-1-lucas.demarchi@intel.com>
 <20230310221549.2337402-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230310221549.2337402-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0074.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::19) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA0PR11MB7283:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b9ab4a2-692a-42ba-13b3-08db21c1322f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G6DForlGn/BJZ9I2UTup2iuJJOldWbnpQ/5eoNEbK6HlMgQqKzy4ARd6lJ7q1JitHvLtVWXLUZO5W1FbwuHiLay8qaNCBXeBRy9Cf0sAZp/r2iRsR6adZpqVmp+vp+Cz46AqXibFc95V/XnKzspXx8rLdC2JivYFzHhdY9l3N0b1qCZQjnvoeayh4T8K2aNZN0HYxxNqPnuKpzcNCUUgETGP0FNeGwPq0P6FxBASQUYjI1NOqFgyh7oX1G5pSRLp/q1fmLC5xURyIDYs066TWvHrenxe+na4ALJXqg5hdjw4evVqHqYL9pK7w1xNYiA4JQuBBB/iep8Y8ZQCGm4kMkhouiVFhbVLGIIJhTSwKShpjOCma8hsP4W69ihYHT/dRkvyzB6HxU7GkFQLLJpd8Vf6D8ZWPWJjgu5ZM+hM9C/99Demk9SqRzx3HYTl3nSXpOIoNZ1TE0hFIl+cyfoBrTzYj1gYdMLIo5eDAetDgnqmTF/eIoueKRPkYQxqecgdO0/chTJOPL3COr/a3WxE9sOUWY4/IewhRHKTVhQj9FzyFwehdF1KA4fKJXxmUw3lsThOIncQ7dvLPb4OiUqKRFbm94aiL4YyWe+MHn4MC+VKgExmw/iSog/pdTcm57rT57mebMzUuqasbwjaapZKIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(366004)(396003)(136003)(346002)(376002)(451199018)(83380400001)(2906002)(6512007)(8676002)(66556008)(66946007)(66476007)(5660300002)(26005)(186003)(6666004)(41300700001)(1076003)(82960400001)(38100700002)(6506007)(478600001)(6486002)(33656002)(6636002)(4326008)(316002)(8936002)(6862004)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FDQx37sheQYSOKDtwcd8NVhnDIbBxIoBezZk36cM3pxsLnk/6v5KHiTddNk6?=
 =?us-ascii?Q?C0dxZQAn+OdyU4FZLjEqdk0GkQ25yRi92hAwiA+e7fGqS+pIZfQNqzwZYnu/?=
 =?us-ascii?Q?61Cdf04h0hrW5YLBVNpnHoGIO43qIRz5HeWWXTLFslMX56jMFtht5gan2nQc?=
 =?us-ascii?Q?X/hrOzCZlL3S0vTK2KHdjkCPZK8UL3JjymvYMsIIs+UyxxxXFnQ2JIAMPs1J?=
 =?us-ascii?Q?2N3cFaVbuSAZ2BoELPLyCxZh56MM5XLH47Hs0/FTeeWAB8vD9RS+WrXCzFTw?=
 =?us-ascii?Q?uH79vIjlxv04pTUqlc7WZX+Yj/i3zxABfgdUV8h3mbJwjlTlT3BCRvAfU/x+?=
 =?us-ascii?Q?awhTiWuctOxzL+64F48cOKbVp+f/w7NyDZOX1y+rEp6QLAnd+9YaHNN96xLM?=
 =?us-ascii?Q?BhAI69A8rZKtFusYgMpTHWmpIG5yNW0ZjkqsBQW6qMjatHtEjZo1hTUvV0A1?=
 =?us-ascii?Q?Lc8Llttvc7iKBezDizEmu2QjrRMPb+uI2OKhC/HkN0dJuu3jQsH0tyK4gBuv?=
 =?us-ascii?Q?tlmDbDsLG3rZ77MOdF7x/BNAP0mHMk6I2tlo1t0FKgIpjzwU5QMeJpNyuCW0?=
 =?us-ascii?Q?YK7iKeiS8RE/8o2UgsSrMVuBmz1aHuNhftiDKE0ueiz5A6VRbTjnIZNup3ka?=
 =?us-ascii?Q?2pVnRyFcnUAudsa1t6GvbFP9QTeV/Sof9V6HvTAI+5hVZv/1V4hWfsFB9wIw?=
 =?us-ascii?Q?/LaXeULD5y0C+S1fCO06AxP63CQzxyaAH2uBazfFEia5Cpw1dFLegjTqpwZA?=
 =?us-ascii?Q?cVsNtlM1YazkY5NNf4PoSPYqywSLQIkiRwG5SRRIjacdZkvNDytS3sjOLy4w?=
 =?us-ascii?Q?YHy7VfzsEuVNdVlSd9yw4LbZ6oR0uVAWp2sJoeHjgPyBGfuvqrN27e0EwPoV?=
 =?us-ascii?Q?GsXvaZUze6CNEDE+XqfASbZJV5wQ91BJbzyH7i4cDqp7h/+J91/7gmf+8mju?=
 =?us-ascii?Q?LjAXconb/tLIPydFpPsQR+/99NOpCeCW2MOoSBMtc+4FZwHTcgI8Dk9Vuvs2?=
 =?us-ascii?Q?kyNgH53jOMWTkvS+raquVKbKhCvRs+VUK897ATsx5bGnFHYrJ1UexTRLIJlC?=
 =?us-ascii?Q?xgWfyszX33NPbW7L5cLHElgSHuKlyd8M9Pzk1Xo5kSA0vGaf9dzuoOBajjJA?=
 =?us-ascii?Q?rCY1eE6dPwi066k6RgCxW4NLiRWYhnSVVSODGLY8dx610A3G8mSA5YGrG5JM?=
 =?us-ascii?Q?MDPpMWFc6Pw9goS7IVtgMXjAFh8S8jIojD7KQQk+zViMq5JfMq40o/WYyeAt?=
 =?us-ascii?Q?HK3sXP6Zf0wL+dMAfTJl9JUFFkvE7+zOF52yAckbgtPK5I1k1+Mm/Xca8ssl?=
 =?us-ascii?Q?3z/Dv2tiCmX5AMd7z5TmYrjorY1NHwhrZfHVubUfF2lGqz7nDQ/Y7JKyHaRu?=
 =?us-ascii?Q?5+eOK5KI6iUbAIL3d6q7fBdf5DrEM0KoVH4r1nxgjV3IcZUsI9cq9zhXnsD0?=
 =?us-ascii?Q?o03LAXG5XAQ+0x5X4wENkm4gJkV/LD63IMBauMwoyGZOQ+6fRFRjazZXXlve?=
 =?us-ascii?Q?zJAbI7OGh7Aapm3hgwzVwwY8WtHqbqVV+eer9SI12j3I2rwzNXrUaMiDdBP8?=
 =?us-ascii?Q?gKVK6tfhtf60oifTmTCgvwPdt9/aPDmFE80ZlDDyVrulOV8RmECwZJxz0vOY?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b9ab4a2-692a-42ba-13b3-08db21c1322f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 23:43:05.9095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BlVAJhAYUyiRRb7zHg14F8kdCS7Ey+hgyZuuBrazUp/VYmc+12XY4wC2qOLoFQRGfERolIimxDUtRcuuQ+ieq2KLQpRUAmAofCNlyUXnAms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7283
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 01/12] drm/xe/rtp: Add match helper for
 gslice fused off
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

On Fri, Mar 10, 2023 at 02:15:38PM -0800, Lucas De Marchi wrote:
> Add match helper to detect when the first gslice is fused off, as needed
> by future workarounds.
> 
> v2:
>   - Add warning if called on a platform without geometry pipeline
>     (Matt Roper)
>   - Hardcode 4 as the number of gslices, which matches all the currently
>     supported platforms. PVC doesn't have geometry pipeline and
>     shouldn't use this function (Matt Roper)
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_rtp.c | 16 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_rtp.h | 11 +++++++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 0d2f51bb06e8..cb9dd894547d 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -8,6 +8,7 @@
>  #include <drm/xe_drm.h>
>  
>  #include "xe_gt.h"
> +#include "xe_gt_topology.h"
>  #include "xe_macros.h"
>  #include "xe_reg_sr.h"
>  
> @@ -170,3 +171,18 @@ bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
>  	return render_compute_mask &&
>  		hwe->engine_id == __ffs(render_compute_mask);
>  }
> +
> +bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
> +					 const struct xe_hw_engine *hwe)
> +{
> +	unsigned int dss_per_gslice = 4;
> +	unsigned int dss;
> +
> +	if (drm_WARN(&gt_to_xe(gt)->drm, !gt->fuse_topo.g_dss_mask,
> +		     "Checking gslice for platform without geometry pipeline\n"))
> +		return false;
> +
> +	dss = xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0);
> +
> +	return dss >= dss_per_gslice;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index 433f0cbff57f..4140ef507fa0 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -427,4 +427,15 @@ bool xe_rtp_match_even_instance(const struct xe_gt *gt,
>  bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
>  					  const struct xe_hw_engine *hwe);
>  
> +/*
> + * xe_rtp_match_first_gslice_fused_off - Match when first gslice is fused off
> + *
> + * @gt: GT structure
> + * @hwe: Engine instance
> + *
> + * Returns: true if first gslice is fused off, false otherwise.
> + */
> +bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
> +					 const struct xe_hw_engine *hwe);
> +
>  #endif
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
