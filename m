Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D949C47DB3
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 21:24:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DE5112B4E;
	Mon, 29 Jan 2024 21:24:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7A5112B4F
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 21:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706563455; x=1738099455;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5qvKE5SykgDQcAy9kRdd4rHGfP26UZeBsrXt/8yOJ3k=;
 b=CNpreF522MRIoDRAZXd2JgBK3hofZIKDeEl9Nrqpj2sCJN2IuNIYWMHq
 5pq1GIfSgxN0/jmU6JbXPz02kU+HK3SBB1det1nsj/v34cyrr0RUXHAvy
 NpWkPz/4oJW64vzfxrAjM7IB31XT6NjI8EqaShy0oi+qpdtGv7yqJ8cbJ
 OSwVQdzC2lW9kiHw2FmE87B6kT5Ojub7G/56hnmwZLbaQKNWhKDMhwZuO
 8I3T+xdNvdx0YigCfRLG/xhZXtfabKtcV4B0F5T0Dn0sqKcz/O6ytMk5e
 LZkw699ygGYzIyhG6VHQxY5gfWwl2LWIj8ZEJ92cEorfXEwJ5bfQyBAMQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="16623427"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="16623427"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 13:24:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="931222257"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="931222257"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2024 13:24:14 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 13:24:13 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 13:24:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 13:24:13 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 13:24:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ObGdPyqYLuszWo4CQQ+onRedxF+uN1fVXvVzCORV/obQhWQYzvdshly/oJXD/tlSgBQ12ngDMFat5ge2gYcIlW7cfXYkzp2eSoU9zXRwwcMbr7ReLbLRdf33V9Lu15VZIbQFFXa/CTswSxLCmnf9Sv3jfDxmrFAnels7vwVcUZEYfJB8JczgTahOShFUROpoGS8AETZYwkkpq7titJQKP6CTr2WYQnlfOnnBW9OdIpna4wBvLBvfgoopHJpNg2rFcCQ3iclWTbu+kTN6/jxXqA2nsCzMtM/460LlR4aap9zGViUjv4cV2b4PojuUwaUf/gzHJzM/pkt1ZUPJr69Dqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qGr8NEH4mThtWDJ2scN8iOFMtRJ993IFyOwSIqaTSY=;
 b=m0yv7t3YiHUftLJ5BIj+8ReUrpQ3cJAS3tDv3aoUpZU9dNxMgPwNBOQ5wpwxNS/yTdH9t+XSd3LTTGcFVWv3PNNFZbRKJjQjCfUIc0Jw2vioh3/ElzLnnetHxCsC1582J77LFiSgosWS/yTy9esH2qm0JdaopBaMoFHRvUimc7DLjMeUUIlNLhS4vbQOtdZiZfL5wSl31RKoYFsLDAIfwPMpKpkN8nw8MHoeIuuHryOZl3zCP9fEJDGooO/urnQ2NJZIAPLxrg93llrWKbBBGTH3yLfAgvobetImTEJv11dumlSrmtVDNJ4zzTkDl1CfhCTWNxibELrOf4HQX0Ofyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB6513.namprd11.prod.outlook.com (2603:10b6:208:3a3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Mon, 29 Jan
 2024 21:24:11 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 21:24:11 +0000
Date: Mon, 29 Jan 2024 13:24:08 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH v3 4/6] drm/xe: Add misc functions to support read of
 specific DSS registers
Message-ID: <20240129212408.GM5506@mdroper-desk1.amr.corp.intel.com>
References: <20240129181742.183694-1-jose.souza@intel.com>
 <20240129181742.183694-4-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240129181742.183694-4-jose.souza@intel.com>
X-ClientProxiedBy: BYAPR11CA0093.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB6513:EE_
X-MS-Office365-Filtering-Correlation-Id: 60af0216-1963-478a-170c-08dc2110a26e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KGHlF+sB6JjIj9e038XfjG34QQRcmSTg8LgI1DlCOFpsxa4UmCS3e2LZoavmL1au/eeTmJvOyblAN/Jl0DOm+zxGxDvALNi7204mpK9HAtNfkPYx7hyRduTKhVj0VqwaqT8DDq/lumaT0d7os6yKVMRkik6WElaWoo4QBz8xOiRBYailb7mQBlb0mPZ8KNWzZIM05OezDGaMPcDFbb3Xe1tKm3X9nMmPf2dD8ADZaGoqidjuyS+fETsvcsY2anNRoYwmDzt6GGwwVDj9dPWE/1ElNyIhH9t83/3nv9W7qvWS/B9ZPnFaLFbmd0ecxQQXl13pVacpHlpWd+p3lYTNG9/3n3y4Jsy8xmuH7o+n3Jek9kwwEPJy8epIh0w/eU/zfpwPwflJx+Bxrnr4KCsuc+xIFw6EeD3/K4T03fCeqyvXxutdRw0mX80RGRBfxk5ww+5mec75eEeduQ05bgKiLzKqLAzOUJ+X8WjalZC1wPd4KxjtNmT8oU45FudXpc2/xZXTbVY64nYHKWJsn+wCtWPlbnuV8yl3WSNZSrgyMYbCV9MtceIi5P7JUlwrpDQT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(33656002)(38100700002)(2906002)(83380400001)(41300700001)(107886003)(1076003)(82960400001)(6666004)(26005)(6512007)(6506007)(478600001)(66899024)(6486002)(66556008)(66946007)(4326008)(8936002)(8676002)(66476007)(6862004)(86362001)(5660300002)(316002)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GVhQv5bhuaCvWVW+XbXap208ikJXNNdNhMz9cnjUJ2etZO/yv/ew7sY1fZ?=
 =?iso-8859-1?Q?vxoNr8ZSbB8mMneq8sjGPnqYpiZkMeDHoUu31uvJoZgBel7WAnY4aRyJCI?=
 =?iso-8859-1?Q?mKzAMkOY0Gc2VRtWUiajLdT41Ym1igicKOxRp5YNW6/f+Obm/g9hNiAGU+?=
 =?iso-8859-1?Q?uP6wHv1VodeOIwA8/SofEaLWbKIBzbcIwGRy1hnz5cHiT0no4dXAj0lxI3?=
 =?iso-8859-1?Q?BZb18sFp+mcOs3zJNEGiNN0id8rejxANcVfoCORCQ26J3ZU776xtZpxImG?=
 =?iso-8859-1?Q?8GTZMvN2xvPMMBKctCGvsLcvg68hRn8BercoxG2kXOBw4GmxCg8QzFUlza?=
 =?iso-8859-1?Q?atXjmu+bTK4m3Tv8rgyNEwIRLNiVl3miOg+6yqMNUzpoiETjLfnZN8DpjO?=
 =?iso-8859-1?Q?OoPY3mqo9Nbxxs5De/utkeH7UwKC3Kv0XwcXRekT/DjIXM7YWulQ5HWlnz?=
 =?iso-8859-1?Q?XPVJQPjC4NHe898ECzO1p2iEJfZGnTOhL+MUR70HyBdEKUdxQqhXRmaiu0?=
 =?iso-8859-1?Q?Dyr2gr0/MUzqVTUWj9C8QiE4P192j5XYWjfP1C8EukXfLYy9aDyYAS6c9a?=
 =?iso-8859-1?Q?M+AGSFU7OMtbrxiEq87fm4QdXpZnQWK72iQYBYq1wLy4nX6Bj9C6BE9d/3?=
 =?iso-8859-1?Q?zyiuqGdUlxBOabEpZCPz1/Oel4PDyiSvHXOjfGN/dVoFT/tjaDfnF5nbAn?=
 =?iso-8859-1?Q?+LEJHvubXdWAx7+0xsAZefQHldvplaXHf334uVqJPVMre69wz5fCJNVScb?=
 =?iso-8859-1?Q?IoaL++XzDxBtguwCOwiqv3NzE2g3QcLtqS9kSvRGuWpW7zH4DKw+3iuznd?=
 =?iso-8859-1?Q?yX22jKw/hy/mKCV1BSXfO1nbj/UFigO1KYn9vtZ+QRZdy/X+A8OTH7QzkB?=
 =?iso-8859-1?Q?sI7VlBwWyhzXA+uICGjfXRt8FbBjCkE0Wkm6lIRgQChvDY7In7PGRfqVk0?=
 =?iso-8859-1?Q?tagTJ7u1qcDbgBDdMXaR8E+al2XuO8SiMvdLxWubsa8E4pnJ7GLFTnCft0?=
 =?iso-8859-1?Q?lyrLRDRQ01kUOy6ds5vYOKkHaxNFoVOYSrBH52bGMhgY7VFErSFUFEOX+4?=
 =?iso-8859-1?Q?pV3drPhayxoG7xkvScOfEGFEkR+BliGnuSCmuEz4WjNlZNB3dtJKrmrLT8?=
 =?iso-8859-1?Q?X63zO4otXL9cSnLbMHvT0BxBpIMvs+FTi5DBIg0eL3SjteIRXDZnNomvac?=
 =?iso-8859-1?Q?OlAZkzJNHBMWUtrg9uGmhblGF7coTRS2ObnA2Kj5ZSCJr3oe7wQ8EEr/Z0?=
 =?iso-8859-1?Q?uasIG+QTkFFS+xgGCYlY7jolGz3QZLUIhgfLoMi52W2L5v00NzAMunl4ih?=
 =?iso-8859-1?Q?KVWUQm/9ItkhnUzYQXTss8rRsQn0GIciArotmV2ssVV3dpQQNzO4IobppZ?=
 =?iso-8859-1?Q?vhy41xBbASyDcUOw3PlP1KMBND0x0EWtFotRF+YZSX3ZuVACMRpTmsun8K?=
 =?iso-8859-1?Q?y60VW/nrRAzQJ+9sKdmNxOP2gcBBPwxDtjvjheZ8Ai8tKVo9NRk3G5SXvT?=
 =?iso-8859-1?Q?rkDGVEW8iJbA0FVlbq/QN9HQxwXOWQC+O4kj7+PP0IfMrRCHCjy5Pwuged?=
 =?iso-8859-1?Q?1475IcOTcj8udMTcN9TK6Z7WpB37yhKfg3CAvVZVsgL5xOQr2kaTxuBe8v?=
 =?iso-8859-1?Q?fTfzn95X5+vjCYpquJrpRPHefFKw/vQgPcb5J8s3Fev0Z5R5GLnxD8Fw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60af0216-1963-478a-170c-08dc2110a26e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 21:24:10.9047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 90TAsqxNb59L5RBsWS4pO/vnCqwUEVBsKjvZkbvuMjb50PxzQx9UKZb46UVSHEOGY9yY7LGBctj+mGoc6SIyZ2tTXen/PNQCy5IXkpV0x+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6513
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jan 29, 2024 at 10:17:40AM -0800, José Roberto de Souza wrote:
> Next patch will read register in specific DSS registers and this
> are the functions missing to do so.
> 
> xe_gt_mcr_get_dss_steering() calculate and return the group and
> instance that will be used by xe_gt_mcr_unicast_read().
> 
> xe_gt_has_geometry_dss() and xe_gt_has_compute_dss() returns true
> if DSS is available for geometry of compute.
> 
> for_each_geometry/compute_dss() to simply the iteration over each
> available DSS
> 
> v3:
> - add for_each_geometry/compute_dss()
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c          | 17 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt.h          |  3 +++
>  drivers/gpu/drm/xe/xe_gt_mcr.c      | 17 +++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_mcr.h      | 31 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_topology.c |  1 -
>  drivers/gpu/drm/xe/xe_gt_types.h    |  3 ++-
>  6 files changed, 69 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 675a2927a19ef..9a3dce45b92ba 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -795,3 +795,20 @@ struct xe_hw_engine *xe_gt_any_hw_engine_by_reset_domain(struct xe_gt *gt,
>  
>  	return NULL;
>  }
> +
> +static bool has_dss(xe_dss_mask_t dss_mask, unsigned int dss)
> +{
> +	unsigned long value = bitmap_get_value8(dss_mask, (dss / 8) * 8);
> +
> +	return value & BIT(dss % 8);
> +}
> +
> +bool xe_gt_has_geometry_dss(struct xe_gt *gt, unsigned int dss)
> +{
> +	return has_dss(gt->fuse_topo.g_dss_mask, dss);
> +}
> +
> +bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss)
> +{
> +	return has_dss(gt->fuse_topo.c_dss_mask, dss);
> +}

It feels like these belong better in xe_gt_topology.[ch].  Ideally we'd
keep all the low-level representation of the masks abstracted away
inside of those files and just provide a sane interface for the rest of
the driver to query whatever it needs.

> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index c1675bd44cf6d..36815d8cbc107 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -70,4 +70,7 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
>  		hwe->instance == gt->usm.reserved_bcs_instance;
>  }
>  
> +bool xe_gt_has_geometry_dss(struct xe_gt *gt, unsigned int dss);
> +bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss);
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 77925b35cf8dc..e76cb0ae457aa 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -291,11 +291,17 @@ static void init_steering_mslice(struct xe_gt *gt)
>  	gt->steering[LNCF].instance_target = 0;		/* unused */
>  }
>  
> +static unsigned int
> +get_dss_per_group(struct xe_gt *gt)
> +{
> +	return gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
> +}
> +
>  static void init_steering_dss(struct xe_gt *gt)
>  {
>  	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
>  			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
> -	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
> +	unsigned int dss_per_grp = get_dss_per_group(gt);
>  
>  	gt->steering[DSS].group_target = dss / dss_per_grp;
>  	gt->steering[DSS].instance_target = dss % dss_per_grp;
> @@ -683,3 +689,12 @@ void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p)
>  		}
>  	}
>  }
> +
> +void
> +xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, int *group,
> +			   int *instance)

I think you're primarily adding this for eventual use in the
devcoredump, right?  But I think there's also been some other series
trying to add some MCR registers of types other than DSS (e.g.,
per-mslice registers and such).  Given that, maybe we should make this
function more general where you pass the MCR class as a parameter too?
E.g.,

  void
  xe_gt_mcr_get_steering(struct xe_gt *gt,
                         enum xe_steering_type type,
                         unsigned int id,
                         unsigned int *group,
                         unsigned int *instance)


BTW, I think Zhanjun is working along similar lines to what you have
here, so you guys might want to sync up?


Matt

> +{
> +	unsigned int dss_per_group = get_dss_per_group(gt);
> +	*group = dss / dss_per_group;
> +	*instance = dss % dss_per_group;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
> index 27ca1bc880a00..9f5f7dbb6fca8 100644
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
> @@ -24,6 +25,36 @@ void xe_gt_mcr_unicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
>  void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
>  			       u32 value);
>  
> +void
> +xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, int *group,
> +			   int *instance);
> +
>  void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
>  
> +/**
> + * for_each_geometry_dss - Iterate over each DSS available for geometry
> + * @gt: GT structure
> + * @dss: DSS id
> + * @grp: group id to be in xe_gt_mcr_unicast_read()
> + * @inst: instance id to be in xe_gt_mcr_unicast_read()
> + */
> +#define for_each_geometry_dss(gt, dss, grp, inst) \
> +	for (dss = 0, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst); \
> +	     dss < XE_MAX_DSS_FUSE_BITS; \
> +	     dss++, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst)) \
> +		if (xe_gt_has_geometry_dss(gt, dss))
> +
> +/**
> + * for_each_compute_dss - Iterate over each DSS available for compute
> + * @gt: GT structure
> + * @dss: DSS id
> + * @grp: group id to be in xe_gt_mcr_unicast_read()
> + * @inst: instance id to be in xe_gt_mcr_unicast_read()
> + */
> +#define for_each_compute_dss(gt, dss, grp, inst) \
> +	for (dss = 0, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst); \
> +	     dss < XE_MAX_DSS_FUSE_BITS; \
> +	     dss++, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst)) \
> +		if (xe_gt_has_compute_dss(gt, dss))
> +
>  #endif /* _XE_GT_MCR_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index a8d7f272c30a0..c4942f2b37751 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -11,7 +11,6 @@
>  #include "xe_gt.h"
>  #include "xe_mmio.h"
>  
> -#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
>  #define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
>  
>  static void
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 70c615dd14986..bb6dc1fcaa7dd 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -25,9 +25,10 @@ enum xe_gt_type {
>  };
>  
>  #define XE_MAX_DSS_FUSE_REGS	3
> +#define XE_MAX_DSS_FUSE_BITS   (32 * XE_MAX_DSS_FUSE_REGS)
>  #define XE_MAX_EU_FUSE_REGS	1
>  
> -typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
> +typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(XE_MAX_DSS_FUSE_BITS)];
>  typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
>  
>  struct xe_mmio_range {
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
