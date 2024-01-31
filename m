Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2125DC46CD2
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 00:09:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD95F113779;
	Wed, 31 Jan 2024 00:09:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3308B113779
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jan 2024 00:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706659788; x=1738195788;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=x1Pot2iMvrBdS59YCm3+wQNN0LFCq0KoxH20y9iBAI4=;
 b=A32t9pX/B14yhfKz4qRsm1x47sZzRu7R96sWYuDfh10C6A4BlzatjUcd
 nuPLA6z4MlBavFFvffvBhZ5OQHwrUyhQpICrjxeZnyXqJ6klyMsZIHTid
 LlvPoV2YOOm/4EQ/zopo52KfPoS54SmauLp1R1yUhUM/NVXpaSh8EJRrv
 oUAfL29XTl79CZKKCTDFLnBAO66W64XEzdHB/VECMu6RhUg3mzPoHwzQ3
 iK29abbBgCGtGdrQsxbbiT2wRM8psUU0dZxgOmWd/13MyZEI4bLp5ZVbS
 ZFcdCflNtVrYB86xOBZzJpDvMRSzBVloq+ci0//rMZf0p8bTYfKB7c/dt A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="434613394"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="434613394"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 16:09:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3921557"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 16:09:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 16:09:46 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 16:09:46 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 16:09:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q4Slk86/q3N5M4WRECXNZ9bzWHoxxLaF91rBBECGwMoX0mGLPfy5NMuqFF6gvVs6rtW+SBvf+E2JqW89klcwzwTxFyanNq4+ZUS1H8O3Pnf+y3Kkfz0cGLPDA7PX+kcESGiTja1JyLAE+5L/z7ESrmGq5bxhIcavhPccUR+Pw7IVB/2J2xHwAdPuw7BxFeaEizY6mnjqZMdfHvtJehN72I6ACMjmAjILvYQ3zGHgdLh8n/k4nW6eEHix4iHX9MDtiAgN7C0yqT4X5rTV4gk3/Uly8xc6Pc/IAKvl+S6G+XaxkLuXyO/NhV9CPnhBti2GwY/sC8nale8ZsxbtANzDlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSLUxwSucGGM9HJc3SnYGbJsZqNGkfhlPiichLn//Hk=;
 b=BBYJjull1zILX8S9FiblXtlngeAafDN9U925zbGg+sBvDT4KeiRfSc6+/9UGY6S1HyRI6NX8ggcvfn0C4nrIzz9uGihQ9YsKA/KSsttCHWPzVPPtZh1ucQLrEz+AQmgPH4IcubKVa8GlSy0FRWZzHQss2Q2El0kCyFD9Nrh4BAt/pxsCgAvWil03Q5iHnmzT3rWsJxMKNSl14kszG2wf5CyKphJc6pc2JU4Zutlj6sJ9DLji9iBTopDQX9qW4mqMeJK3Ht0ZfaO96JB/UoLCwTfU6R9l0IOQWjYmpZlakh5ysO+hiRzVQbK3LkjquGlvITt8jAp8hcWsyCbqAMmbVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB7972.namprd11.prod.outlook.com (2603:10b6:8:124::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 00:09:44 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 00:09:44 +0000
Date: Tue, 30 Jan 2024 16:09:41 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>, "=?iso-8859-1?Q?Jos=E9?= Roberto de
 Souza" <jose.souza@intel.com>
Subject: Re: [PATCH v5 1/1] drm/xe: Expose number of dss per group and helpers
Message-ID: <20240131000941.GA8089@mdroper-desk1.amr.corp.intel.com>
References: <20240130212208.235448-1-zhanjun.dong@intel.com>
 <20240130212208.235448-2-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240130212208.235448-2-zhanjun.dong@intel.com>
X-ClientProxiedBy: SJ0PR05CA0184.namprd05.prod.outlook.com
 (2603:10b6:a03:330::9) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB7972:EE_
X-MS-Office365-Filtering-Correlation-Id: deba4788-fa87-4f0f-810c-08dc21f0ed67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jl94NPlLSLbz6XdwsgaT8cVUx/nVlyuAWwHjry6niGMF0hR9Gb7XWtFiv2TWN6vqp8RMIuz5O3ge2hbD0h8Xw1EXdbIe1IbayO1dFCPNItKvtxcyZzJwgvhbvoKgz9+cO2qJQ0sBszORIBilG5lpxPWbAxbAk7ltgizbkU16/3DkTNvl065V1DMyI0uy6ImXHUP5tIKMxvqlP0zQiF11p1X+Gd1F+kFm2Ao1w7NoPEu3UK00Eulasl0Dv0tQHYpjr5uXJ8RuaNBNx1AnbdFmB3K34cmyM9VJh4G1a5AmhrPf1CzT3x6SmUs/jTFvsGNpiLrvsWAjBhLepzH32CiyEtuwPrHYaGEaaBkE1rwHfE9ZPDQuMm/hzqDpqvQCns/VWeHfSABlvRX3FcTVnPSlTJ+dijwGRGXwsnKrycohLLf9k6HuijDRDncI7219EOmJ9ucGVVhrCyRhFR0Vw9FKye8bQpJ+eNqeJuvXZQolbXrj8cW85nG6c5Ab+vI2V4onSWnIj/zQxIlLFD1QofCxf2L9UYd3u/9Lpn+50TVJ33gQg5XnitxWftyydY1v30yP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(66899024)(83380400001)(6636002)(86362001)(82960400001)(33656002)(8676002)(38100700002)(66556008)(6512007)(26005)(8936002)(1076003)(6486002)(41300700001)(4326008)(478600001)(66476007)(110136005)(316002)(5660300002)(2906002)(66946007)(6666004)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z7yIidgdxZ8ygABRgIZFgFGZSikJq9E4USdj3zSf/JUu28dPck1pVguB8G1N?=
 =?us-ascii?Q?dLCQMgZcPUS2MZn0uSLS/uWOh8Zc/4o1yY/mVc6W8wL3rRB8WS77fJyrWq6u?=
 =?us-ascii?Q?tUb0t4e0pWHEiiF3pcZLrr1bf7ZpQO4Xoacf24X2wtfen5kSLG0S60QMK69w?=
 =?us-ascii?Q?dy95c5MjCpdJPAx5zMBKhWhJDw7LqvjXFkKuzDq4Aypw5GA9LC1/TiHCJBZa?=
 =?us-ascii?Q?MNkDp+V1ZZ3n9lRsxRTqFskVS1Ce4yeIWA39DJfqwIKSyLBDXHbH/XJK7bfP?=
 =?us-ascii?Q?IWD1CxcT3NH2ZcBRPOlMCeeNeviJh55gkGQl9ib4wq+tNQzuk7xdV9ElsXuX?=
 =?us-ascii?Q?we/ECzPdtX21BCy2BoSLlTtS82vpith4l694Mi2cczLYG5mGUZAncbfR4Beb?=
 =?us-ascii?Q?o4tJioaiQuWPqV23w3TgSboAjkwr0nO2IM2jPKvMExYipQo1lG6WwmG8O/jd?=
 =?us-ascii?Q?RZUfq631XPbYBfNzrd2NQ0uGRTdq/LryiVpVsfU/kviso7I8Hf544Bi6y3Xc?=
 =?us-ascii?Q?Xit+VEVDSkaZMGPcJRYL06lk8lphrT0ByGs/XJf3beJwnrDhiIqJPygYYbSJ?=
 =?us-ascii?Q?iTUBwn5mypwIsF5qdMs0e5Sty4EJ78qmKhIFrPR1UQB8ZkY4/AtaJd540c8l?=
 =?us-ascii?Q?dDEMHKV1R1/lMPMRT5ZSmSZql1/Vrr8uHnKodyqgTpOGdzA1H5Nl43OGFzNu?=
 =?us-ascii?Q?hOM7+wAAs9lOaYlNhO2sR4oJEALb/ptZnDS0NRpheixEZJzQ7qGgieNfa895?=
 =?us-ascii?Q?iKDec2fqQhBKRP0woJOdH2+3OFX1O0gIvCfejxaQ1+jMb2w+K8CwLpPZs5Ln?=
 =?us-ascii?Q?OznHox7OlJ/e5BTs8LDqwg0wPfzBT/WiVafCU/kitJeLCPd6Hjwe2HhP77nd?=
 =?us-ascii?Q?VbEiQgS1sPv6Pb3qIB15HLMFWT8WtfedAI6QRkNm6ZvSdEFN12P1iDVPGKwI?=
 =?us-ascii?Q?FPmdYHueB81JDEa57H3DZtfyC9FgDlmkAgIHfT8W0fZJt8uwfqUB3+SX7FW4?=
 =?us-ascii?Q?RKG1EzZOX9boTGUhevy6d2X0T7CQLsXxDYw+c8Eg5d++k17RfPpVQO8UGn5l?=
 =?us-ascii?Q?TEGLdgXtJxU06jFluhrbtGmeAOyyn0LWUGhGOdgf1xho095wnbjgcmWKmw7x?=
 =?us-ascii?Q?i3AkUxSLAm2tkSkMo4w19XqqoEF2DAK4kifT47PyTnd35Bru1RE/jX1hmUTn?=
 =?us-ascii?Q?D9aDrjeg2cHxla9HOBGIX/Q2AbEIALum9LMuZseYMfpeNi3h6xNxXfs4+YYn?=
 =?us-ascii?Q?8gMaJR21Kpnu0KItKF/Ru4tAoa/aoOIWrjRkwmDugFMYPUdUySN5Mnhr7PdU?=
 =?us-ascii?Q?fT2reMVTX/UviZjqe1PWFmdknsO+zmwuFJ3Svwdkv05UsSGMRDGp/kQ+CQOr?=
 =?us-ascii?Q?XpQ0+JQ0P5YUbwPWRlDAaTYIEPBy7AL02f47/3e1bmAks6+1CbdNbTo9zLBJ?=
 =?us-ascii?Q?yRLpAes3cmASEUCX4yGFRoBB8zncQA6sxs9UGVm0bGD8XdseByaOStTzFwVq?=
 =?us-ascii?Q?tl05R2Hcc5I6mwJjbxbSPOTEeVdRXgcw0xXaCR7qm7iPZmj/vnVqPrnhacnr?=
 =?us-ascii?Q?Galv/mn1cuSceXLYdEssQACl63Sx+3qAoVkn1nuWfxPyLJTvTY4ctUO4Hsqj?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: deba4788-fa87-4f0f-810c-08dc21f0ed67
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 00:09:44.0137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4u0fh2CehCJngsyxaV0JGbvny7POAny4yMIJ9tvPId/7r1LBJij1Xn9UoUL7swiH4TNP+aXDdv0q9Zj9HbGMtfLRtZOzHBLRvT6hbXfvc1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7972
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 30, 2024 at 01:22:08PM -0800, Zhanjun Dong wrote:
> Expose helper for dss per group. This is a precursor patch to allow
> for easier iteration through MCR registers and other per-DSS uses.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c      | 40 ++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_mcr.h      | 17 ++++++++++++
>  drivers/gpu/drm/xe/xe_gt_topology.c |  3 ---
>  drivers/gpu/drm/xe/xe_gt_types.h    |  2 ++
>  4 files changed, 58 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 77925b35cf8d..ad2e42dc2218 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -291,11 +291,16 @@ static void init_steering_mslice(struct xe_gt *gt)
>  	gt->steering[LNCF].instance_target = 0;		/* unused */
>  }
>  
> +int xe_gt_mcr_get_dss_per_group(struct xe_gt *gt)
> +{
> +	return gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
> +}
> +
>  static void init_steering_dss(struct xe_gt *gt)
>  {
>  	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
>  			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
> -	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
> +	unsigned int dss_per_grp = xe_gt_mcr_get_dss_per_group(gt);
>  
>  	gt->steering[DSS].group_target = dss / dss_per_grp;
>  	gt->steering[DSS].instance_target = dss % dss_per_grp;

To avoid duplicating the logic, we could just replace these lines with a
call to your new xe_gt_mcr_get_dss_steering() function as well.  Then we
don't even need the dss_per_grp local variable.

> @@ -683,3 +688,36 @@ void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p)
>  		}
>  	}
>  }
> +
> +/**
> + * xe_gt_mcr_get_dss_steering - returns the group/instance steering for a DSS
> + * @gt: GT structure
> + * @dss: DSS ID to obtain steering for
> + * @group: pointer to storage for steering group ID
> + * @instance: pointer to storage for steering instance ID
> + *
> + * Returns the steering IDs (via the @group and @instance parameters) that
> + * correspond to a specific DSS ID.
> + */
> +void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, unsigned int *group,
> +				unsigned int *instance)
> +{
> +	int dss_per_grp = xe_gt_mcr_get_dss_per_group(gt);
> +
> +	*group = dss / dss_per_grp;
> +	*instance = dss % dss_per_grp;
> +}
> +
> +bool xe_gt_mcr_dss_has_subslice(struct xe_gt *gt, int slice, int subslice)

"dss" and "subslice" are basically two terms for the same thing so this
name is a bit redundant.  Something like "xe_gt_mcr_has_dss" would
probably be fine?

Although this should probably be in xe_gt_topology rather than xe_gt_mcr
since it deals more with the hardware topology than with steering.  So
moving it over to that file, the name would become
"xe_gt_topology_has_dss."

> +{
> +	int dss_per_grp = xe_gt_mcr_get_dss_per_group(gt);
> +	int index = slice * dss_per_grp + subslice;
> +
> +	if (index >= XE_MAX_DSS_FUSE_BITS) {
> +		xe_gt_dbg(gt, "DSS id out of range: slice:%d subslice:%d\n", slice, subslice);
> +		return false;
> +	}
> +
> +	return test_bit(index, gt->fuse_topo.g_dss_mask) ||
> +	       test_bit(index, gt->fuse_topo.c_dss_mask);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
> index 27ca1bc880a0..356f21978eb8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
> @@ -7,6 +7,7 @@
>  #define _XE_GT_MCR_H_
>  
>  #include "regs/xe_reg_defs.h"
> +#include "xe_gt_types.h"
>  
>  struct drm_printer;
>  struct xe_gt;
> @@ -25,5 +26,21 @@ void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
>  			       u32 value);
>  
>  void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
> +int xe_gt_mcr_get_dss_per_group(struct xe_gt *gt);

It doesn't look like you actually use this outside of xe_gt_mcr.c
anymore so we probably don't need to export it.  It can remain a static
function for now.

> +void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, unsigned int *group,
> +				unsigned int *instance);
> +bool xe_gt_mcr_dss_has_subslice(struct xe_gt *gt, int slice, int subslice);
> +
> +#define _HAS_DSS(gt__, group__, instance__) xe_gt_mcr_dss_has_subslice(gt__, group__, instance__)

I don't think we need this macro which is just a pure alias for the real
function.

> +
> +/*
> + * Loop over each subslice/DSS and determine the group and instance IDs that
> + * should be used to steer MCR accesses toward this DSS.
> + */
> +#define for_each_dss_steering(dss_, gt_, group_, instance_) \
> +	for (dss_ = 0, xe_gt_mcr_get_dss_steering(gt_, 0, &(group_), &(instance_)); \
> +	     dss_ < XE_MAX_DSS_FUSE_BITS; \
> +	     dss_++, xe_gt_mcr_get_dss_steering(gt_, dss_, &(group_), &(instance_))) \
> +		for_each_if(_HAS_DSS(gt_, (group_), (instance_)))

We could also probably implement this more efficiently if we had a
topology helper like this (untested):

    int xe_gt_topology_get_next_dss(struct xe_gt *gt, int from) {
            xe_dss_mask_t all_dss;
            unsigned long next;
    
            bitmap_or(all_dss,
                      gt->fuse_topo.g_dss_mask,
                      gt->fuse_topo.c_dss_mask,
                      XE_MAX_DSS_FUSE_BITS);

            next = find_next_bit(all_dss, XE_MAX_DSS_FUSE_BITS, from);
            if (next == XE_MAX_DSS_FUSE_BITS)
                    return -1;
    
            return next;
    }

Then you could write these loops as something like:

   #define for_each_dss_steering(dss_, gt_, group_, instance_) \
           for (dss_ = xe_gt_topology_get_next_dss(gt, 0); \
                dss_ >= 0; \
                dss_ = xe_gt_topology_get_next_dss(gt, dss_ + 1)) \

That also avoids leaking the XE_MAX_DSS_FUSE_BITS internal detail
outside the topology files.

>  
>  #endif /* _XE_GT_MCR_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index a8d7f272c30a..e973eeaac7f1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -11,9 +11,6 @@
>  #include "xe_gt.h"
>  #include "xe_mmio.h"
>  
> -#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
> -#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
> -
>  static void
>  load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 70c615dd1498..b926606edb38 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -25,7 +25,9 @@ enum xe_gt_type {
>  };
>  
>  #define XE_MAX_DSS_FUSE_REGS	3
> +#define XE_MAX_DSS_FUSE_BITS	(32 * XE_MAX_DSS_FUSE_REGS)

Based on the suggestions above, I don't think moving these will actually
be necessary.


Matt

>  #define XE_MAX_EU_FUSE_REGS	1
> +#define XE_MAX_EU_FUSE_BITS	(32 * XE_MAX_EU_FUSE_REGS)
>  
>  typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
>  typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
