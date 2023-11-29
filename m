Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028C2C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 18:30:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE73210E052;
	Wed, 29 Nov 2023 18:30:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472B610E052
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 18:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701282622; x=1732818622;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=McZQIlAZKTUn+4Xn4kwhRze1ajJmEOFpLs4JbTtgvPY=;
 b=fUHu0phlb76RYphCjaXFeKyyhVrPVhh3tYeemFN7qkJxJhqg+D714KcN
 FlSFKXJdM21I8oBHhxDXcca5Ck4+91xIZqcH+WW4WqpITaq9l835fJWvn
 Ph9kjizLIuwCl8Q3ao3/h5gESHEZNd3sVYtb95irW/MOK/BAIjA4DYvyH
 yKCbvxs86KdpqAYp3meYhAOOygojmQSuxgcHgXXVQ2x33p+pMo6eC7Mkq
 Kmh+U1TULaH7qoqZePK1kos825SimZzKLofplV2QclJsLhUE2g+Zl/nZA
 4tm+Qn7jbskmWMJUdVKI81Tj3vDTM9gPmXaNOdhZB/O0sgLnww+0vWqyB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="378235525"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="378235525"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 10:30:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="718832367"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="718832367"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 10:30:21 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 10:30:20 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 10:30:20 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 10:30:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtL9sYEd5f7Mw+DswgOHrQNXHbkBR5iR0fAfzC7oNpfr++nMPKQeh/1c1McqfLd7V+Gs0G61f8z61idzxkcg/Cf/1HgU7jjEcfEF4xM4eTzVVIbb+w/qeXKYOMqQSCVi0RiDAc9PZ447ilXfJMXnik8uRtb9RTAy6qBWXV5ZNgHqPxaD2bGFcIVe1GMvegypaZA4V1J1StXOnldhVSIlveHP4W0ZCNSpKdO0yt2MlAX3e+3cDr9h2Pv4g7loWs9fOQylAizO9d886lUwpwXE/sX1ZPC3cIYXYy+fXWNDHMKWGV434yNWKo/578ya8Jbs8rNBQ9V4RjwcRzqilofb4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAA1kJqQjThVrxZ1saajv3AT0rKPLRh7AqvBOneKCNo=;
 b=f846SCQO1JVNMWDzP9wTatJxGIMfZ1Zn93ELLxdyw9cBHZe8A7ZPjzHJGg/19SbP6dRUP8bsPSunmt3GxXQt42Sbs7A/YyyN7Pw/Knuyo9A4mCA13+ZDyfMqluEmz5kXkovGKCKDyUSk5+ya0b/q/sFRBnznxtzejzEsRAPiVm9E6NxAyoyWhLmd+DPw+2/Goy/pNWGRPAQAgWd97UhsWolRJWQVDCNktE+bwdWeJ4Ajk+1ZFOyIRiGM+QCwFEdrNC7WLkcIWlHzt97bcGP2y4zM/7zJNVZP+T2Nt4PkVfjrUkOcNDXQk+k3n5gGGb9QP7gM0PBD7HB1D5Az9NGASg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7172.namprd11.prod.outlook.com (2603:10b6:930:93::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 18:30:19 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 18:30:19 +0000
Date: Wed, 29 Nov 2023 10:30:16 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <20231129183016.GU1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231122143833.7-1-francois.dugast@intel.com>
 <20231122143833.7-7-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231122143833.7-7-francois.dugast@intel.com>
X-ClientProxiedBy: BY3PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:a03:255::7) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7172:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d1f6734-e96c-4106-87bd-08dbf1093d5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z3Pgx9Ek4Z5UmaoEw4PovbZ5/rmCI7z+vuV/tM3+Ym3K3R606gPgJR0d7uCKHCK65Ebtb3V7D6N94+5TkXTV2qNRdh6iZuxPZrS4ycK2bF8HhxBE4nPgW8m+BAwP1de2HmCj9zJvilchF0geoq83l7exlKAfkLPPB0YPx002kQOSfwZ3/PbloSwm61/u67aPtCAU4qEPk82DIpLbtYr5WHgVkt3/M0YS3fGdWF0Ne/dOUa39+iMM1p6zyWQFzgHFQn4iujW9340PR+5pSrfwJv0ExHpwQzSP34dTC4wesS/Ze1SDM0Zn7QNwbHYEeCE9WZrx12dg8fk8tlfuuiURzNTyVJi4t3Cvij32aExml2Rn74yzIh3Jrz6XFLwi/fu2PGbtsu1L47lzkF/uFLIu+djQRbsGuUh1pNnlqjeoDNORnIb237P71vNZ0u6bQEWWneJgpvww9l01ugtOGPJSioipEzcYxfsulWbJsMXpVemfJMwoHvh30op86IsNgd2ANMFpfsEym0+KtC/QLzRHclRdC85MtjShIHBdxli3sABd8S/vW/qapNeZXo8RTBloMRcWMDbfgYbTOMCvYeI2CncUNpJwS5LTs03jOe79Si0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(2906002)(6666004)(6862004)(8676002)(4326008)(8936002)(6512007)(6506007)(66556008)(66476007)(316002)(6486002)(478600001)(6636002)(66946007)(38100700002)(41300700001)(1076003)(33656002)(86362001)(26005)(83380400001)(5660300002)(82960400001)(43043002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ld5IyAh0qpAem4Iu75R53t2Hlb/pNemsdeGTqP5Vxf/MdDLmytSyNys/j264?=
 =?us-ascii?Q?fxhgI98ApV1Z+WMyTFr8F5AYVrLld7JdbmhkXNy43M9KU9xs0i1inJK5p3mD?=
 =?us-ascii?Q?/rQDzgEVCqK/UJvbFVI/dmOOhZkjpEkCEUfqA78bpHBWIT5vf496lBM1Toz6?=
 =?us-ascii?Q?gJo1OzDJEVQYFyC4Dt11q8NFSKf7dZGfPWWVZaYFG1zHuLQ3ZZ+gwHr2w2Na?=
 =?us-ascii?Q?gyha1i8AdIIkWciFR6mFJAeFNjH6mgnzHODZUC5+HIThU3ff80uEv5tCCJfV?=
 =?us-ascii?Q?9Oi7n1yEwhnRrOr0QHU+NWGOviMhpSV6O9hdskr2JwXzHMYot3VzNEumrVBD?=
 =?us-ascii?Q?a8MLRZ6YeAWiDYIUlVx2Mzmxnfs1dZe6Ieeppy5o+ZK7FrcWV0KlwJ4p3HAu?=
 =?us-ascii?Q?KviREf3KNfzksdIMmS22yvSYnJJ7zOj5eDLHmnjh3w+egrRBvPSiS45uFqTB?=
 =?us-ascii?Q?x9N6Nvu1mM5MrRaLrNVWHgk8lR19Y5FzFR/9R997/2kSYoqvSjVahscS1e3r?=
 =?us-ascii?Q?206/2IxDT9NF7jMAALGNk+ZL4OnkynUMj+wTD9N85t7xu3Sabz1dZnrthYnw?=
 =?us-ascii?Q?LoqlwiV9/La4kHHHek3FGDKihcWIJiN2UgJ0rblJ1ppmb8xq19p5QojmF+pR?=
 =?us-ascii?Q?0DHJJgdV20JwCUga14eqlMg/YPi+m5lTEojVeTQYo0Ax+snIj3UEcx1s60Kh?=
 =?us-ascii?Q?5vtUjhWzXBBm44n7ZWBxu+LFdBF/tlvrjLUm/KJ7I0byDt1YeXCwsmomZaRB?=
 =?us-ascii?Q?4h6WA1ZNh20WhvEzVc29Mo26NrU8Ln2ip5Ao/TS/QL00/RZj3OtPxFXGX9Lp?=
 =?us-ascii?Q?CJKJQFUpyRcm8I6W7muWQW7YN+lDQkVh4javQXej7XKtVyQTzogbg34HZ5xN?=
 =?us-ascii?Q?dzP8G7oFAipMpSALMYxP4Zqqc7JfuJJqjxEwaHIhNKUoo2u1r80a736g5WIH?=
 =?us-ascii?Q?w08Ugx5f9aokcGgx66RTI0lXLq6L5bj/LZtAPwMbxN9TZoZ3v9g972BN461e?=
 =?us-ascii?Q?WlzV1JeKD0aIwDlUA/7wGB21DLd7HyX0O6SJAGcTidecNsSIoIj2TrUjLG9j?=
 =?us-ascii?Q?6hw3FRitCdGqQ+BGuKNBwLAs7nZrYjZfSWzNeXpia+dd7Pmb7z9RaZng93gM?=
 =?us-ascii?Q?j9MWyRhO9uJE9VvNzQt7wwW0tiOTXU4HZ9fmFv3LzuYAdFMRtp4gWs4dJCRK?=
 =?us-ascii?Q?49OPIRemHYTrmc3vyzh6a6DJNRQyfCLpvPRBgjE0TJNYfjE4EemJfxP9xNg3?=
 =?us-ascii?Q?NUv7tYiU2IRxmPDFWfFb+k1xHG12gQQ6+TWzZsznf15fOTJoArC8PQ9DvI6E?=
 =?us-ascii?Q?Rq2+sv8NVvl05fKm7GJQJPhT4sB4xKuS/995v+Qz+lcYQ+2DKcouDPACQ0Go?=
 =?us-ascii?Q?LpFj10bn4RWquugSclTlTwpYp4T57uo4sr8o5u0MyHXfSqjt1o5OCANUOBFZ?=
 =?us-ascii?Q?8LhdyXV4a0jrncnjJUS2r9o3ovEC1XqM+TY+UKZmJhjlTUE7a6e/1gFI8A9i?=
 =?us-ascii?Q?Jj/yXwOlQ5yE/1DFKdGygj4KBxkgINnWIq19u4CxrfZ9Z59v/6qDM4P56ueg?=
 =?us-ascii?Q?O1yqCgd7SBfXR1NVpD4d264P/x1P7BuIkOF49RND7O8qTs1G+LPnW2sbN3So?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d1f6734-e96c-4106-87bd-08dbf1093d5b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 18:30:19.0523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jvJPT21uqrP3aGvCTCXGqF6swND3HEZdZAYD3ywofWzuCQx5t+y5GI94Wl9XY9vfMlwmy9ZL5Vlm0ZWusOVZ7XASqOAUTYllInMgDhh7cI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7172
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 06/14] drm/xe/uapi: Align on a common way
 to return arrays (gt)
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

On Wed, Nov 22, 2023 at 02:38:25PM +0000, Francois Dugast wrote:
> The uAPI provides queries which return arrays of elements. As of now
> the format used in the struct is different depending on which element
> is queried. However, aligning on the new common pattern:
> 
>     struct drm_xe_query_Xs {
>        __u32 num_Xs;
>        struct drm_xe_X Xs[];
>        ...
>     }
> 
> ... would mean bringing back the name "gts" which is avoided per
> commit ("drm/xe/uapi: Rename gts to gt_list") so make an exception
> for gt and leave gt_list. Also, this change removes "query" in the
> name of struct drm_xe_query_gt as it is not returned from the query
> IOCTL. There is no functional change.
> 
> v2: Leave gt_list (Matt Roper)
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_query.c | 2 +-
>  include/uapi/drm/xe_drm.h     | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index f321ed4d3b0b..28ea6dbf1cf9 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -354,7 +354,7 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
>  {
>  	struct xe_gt *gt;
>  	size_t size = sizeof(struct drm_xe_query_gt_list) +
> -		xe->info.gt_count * sizeof(struct drm_xe_query_gt);
> +		xe->info.gt_count * sizeof(struct drm_xe_gt);
>  	struct drm_xe_query_gt_list __user *query_ptr =
>  		u64_to_user_ptr(query->data);
>  	struct drm_xe_query_gt_list *gt_list;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index a9bbdf141fe2..e38e7b701edf 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -356,14 +356,14 @@ struct drm_xe_query_config {
>  };
>  
>  /**
> - * struct drm_xe_query_gt - describe an individual GT.
> + * struct drm_xe_gt - describe an individual GT.
>   *
>   * To be used with drm_xe_query_gt_list, which will return a list with all the
>   * existing GT individual descriptions.
>   * Graphics Technology (GT) is a subset of a GPU/tile that is responsible for
>   * implementing graphics and/or media operations.
>   */
> -struct drm_xe_query_gt {
> +struct drm_xe_gt {
>  #define DRM_XE_QUERY_GT_TYPE_MAIN		0
>  #define DRM_XE_QUERY_GT_TYPE_MEDIA		1
>  	/** @type: GT type: Main or Media */
> @@ -403,7 +403,7 @@ struct drm_xe_query_gt_list {
>  	/** @pad: MBZ */
>  	__u32 pad;
>  	/** @gt_list: The GT list returned for this device */
> -	struct drm_xe_query_gt gt_list[];
> +	struct drm_xe_gt gt_list[];
>  };
>  
>  /**
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
