Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D335DC46CD2
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 17:54:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E3921131FE;
	Tue, 30 Jan 2024 17:54:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36967113204
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 17:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706637275; x=1738173275;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rcaN5Xm+EVgISUHLPtpQnXJZL6o7RQvwrwdU5D0yOsk=;
 b=RyKRHGkCIS76mLlTnoMzKMGAINv+GpxEHgvW9pJ76tTL8AJ9gykUXMe9
 yFtoJPQO0FC5adjFvw2jqBTGgVKpgNx+s4K73JvNswuvHLED9ViJDlCt6
 ctsuvm50Iv73X2WYFkob/wTvsDO3WaQm1coRZNvxLY6FuZ5g87zM4Wk3q
 sJQbvGNdNkWnzpvVpx906ePTxayDDTW5t2CZMIDEb/rIFOG8dEcVWLTCz
 8qBopAsV/UOl88Ry18KB3my2rSdUPNWrBz7N+E0+LIrfsF0G4LWLUC2ZH
 9qmIejL7HH8vdJyvIIZKYhHlbDM3nCY53VD6PeJR3UmUfasHJmnEaSRJs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="400502956"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="400502956"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 09:54:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="36575339"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 09:54:32 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 09:54:32 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 09:54:32 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 09:54:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHjWkB7pmYgLO08V54iCbgQ7h4UROADHWedyQ1kbX6aVEw6Ocf1wL39iO/01U5+bcAYGCBiI3KWQVgY3YzrzCbREKDYuvgeW99TkHxwBOtgMe0Z6lArmqWDeerPYtR+BQjtM8P+e7voDorlR281T07erEVpRNGtJ8Zz/x/valWWb4xnPkUWc6SGd0kFtxfckJxqfzfqYyX2POBALcFWfaB5JH40xWdblKkAhKuyelED8Z/zdYapyh7/9dj2Xveaxuo4Ilx0dl4kT7NyFe4il/C3sp4STtZlXoJ+Uyn7DWSX2skJkyX9aMn7HiqW39Ew9we9nTbJa7cj6K3Nyqz/ERw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAzIf4hVG5QCaGOXapt9t70x6JSDiGy51EAxqfOHjEA=;
 b=caI7YHBAdbleZ44386OsNOacAWZt/ayrbVElWt30ZUaUt3m/h1al2ZwavKJrrEyuOR+D47l/QBtyIsSZ1WGPJ6//UYqp8MKYwQThTLl4cML2QejgmJQpo3h31MG96AGaIw7sSXkCUF5YAuxCzgDBteVaEF4VTzDLezWwssiSHUUfVyqD2uYA2K0W+obaq+16NQObpZrPWHtmKLAO6Q0DpgPFkV7fFP1bdG2bcEJEEbOWJsnE6chSmMlB6CdfC9pkoSmHs7TI7PomhG9FRcgSfvyailNJcG5M+4qZbYuDN4/MxUYxPfPOJDuihiMkUxtCkRbeAzFpQnkE4Kd2yiz5nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5039.namprd11.prod.outlook.com (2603:10b6:a03:2da::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 17:54:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7228.028; Tue, 30 Jan 2024
 17:54:24 +0000
Date: Tue, 30 Jan 2024 17:54:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 4/5] drm/xe: Don't use __user error pointers
Message-ID: <Zbk3uhTO54zS6fUz@DUT025-TGLU.fm.intel.com>
References: <20240117134048.165425-1-thomas.hellstrom@linux.intel.com>
 <20240117134048.165425-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240117134048.165425-5-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0080.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5039:EE_
X-MS-Office365-Filtering-Correlation-Id: 443a21c1-eab0-43dc-2652-08dc21bc7ea6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mCpySWFOYiWltkfvxtaCsZwpN63mNsBHW90W6+KvaspdWC1U/j3C0zsDIi2Uisy60eG8t3i9Q9WkGeI69ky6IGREqtn/CwRAGoncEN8kXgZKsWOsFXBGM4UN6AsB0Cu7XG2GvrirQxhcelqx1sAlbVyj8We86Ce9u0BHqzX26VMOxljzIrF+kPQ4eRNpUNAEWsVMeAciQ4hJf9aQvwY7ksSR7wHz8k/Sf5b8tsLLrxcj24FL31oaTjQMMFk+AEypgJrVLDlERIUDBqwf8mPsWU9eWRpv9l8kMwjmI6BK2lYe2VQ1CXOmPOf65AstLv8sM3fr6LDoSWM2YBLNFhOejhbxDRWUCWhs89LuTYCKrUEL1TQR8HzaYZ7lFpzOnSZGYYNg14SKl/haTt2gPaWT5UdRqClrbzo7Y24S00D4zV4Z0P7Fw5njfwtLCmoha6GVfiJe2sowKhbadbRAfBeLBa3jkLjtZvSEp8hXHItEshInYZRHnndeVziM2ODMW1WEiuWlHB4SZQ5KiB5j4EDlt6w+Adeh2fDf67brCTb5vyROPhuhV7r0LwzI2uEmMVor
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(136003)(396003)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(83380400001)(4326008)(8676002)(8936002)(2906002)(86362001)(5660300002)(44832011)(6916009)(66556008)(66476007)(316002)(6486002)(66946007)(38100700002)(82960400001)(6506007)(6512007)(478600001)(6666004)(26005)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?V9scr7oVRW4NjUP9lSPt+tbcF8s1myYmcrVL7AALTbwNPSL75wU5LkXVVV?=
 =?iso-8859-1?Q?wcUpUUOtTLhtOI9obrp1DesKl8yTlgnLuVllwt/mRoiBfEg2lEGDrc1K0c?=
 =?iso-8859-1?Q?E/yHXfIF6mIm1RmbVNG2Aff3GGdg1qVqpIJjMikpMfaryUdFfhLVaKmNMD?=
 =?iso-8859-1?Q?c+VMYbZbNSx8ZVW5pN5Dbtj2JF7fdOh9V2hjrM0ac7q7ljr9Or1F2dj6HU?=
 =?iso-8859-1?Q?I4hajVf4+b3S9GDOP6CrXtC2RsyfUCZbn0WU/lyOp9cHfMwE3at3UEaYyV?=
 =?iso-8859-1?Q?R9ih/FHwFbEJekcB6M/hN40XCs3pR3OEtgSgWsH+cuXkl17jNUSwkJP+vw?=
 =?iso-8859-1?Q?Uv23wp6XWnteN+KtgeogWiIwr/gj9YpcwEEcmh8/cxK80pK3tA0E+uMHz4?=
 =?iso-8859-1?Q?0qSBxlvGfNgMTY5WgipavLo/FCiH/Ck7FR28oSIVOm1NkFE96fW8B5Xh46?=
 =?iso-8859-1?Q?SUtzHHeZ6eIIixl0qLi/HHb2KuI0wmIlC4saH2M8EJyPnrnnSppkdo1zLA?=
 =?iso-8859-1?Q?tInCjkJcOD3F5F79uyAvPhLCTX2NSK+nqjEwdwEZnv4oIR7PDy+UMiSYCa?=
 =?iso-8859-1?Q?UvN3/da+RGFGUg6xF5kolEUL0JG050yV8yLUHpRNB1xgzZGgOhV51HOrRc?=
 =?iso-8859-1?Q?Hp+2iukssPNros+BeZHbie4nb2Im+Qkk8EWf0VZ7lnn6J9V85lkz85e5Pj?=
 =?iso-8859-1?Q?MN1IjmyV3rezPyEMF2nSZyYK/B8Zs2ImoYaSsdsMFPKsIJiP42R0X42jUv?=
 =?iso-8859-1?Q?ZIRgyT7G0TmsSescWnnxXGw6IosC54dPWah/eGieOhkJcaBeDQ3tQhkCv3?=
 =?iso-8859-1?Q?Pdoshd3c9wzF3gTYXsf30XzJJDtjkVz1xVhM5npVowvgEeDJIBkYjHJgBA?=
 =?iso-8859-1?Q?8FsFhUjBuUL2iTinTt8H6VVImq9ZcbVE5H1JX7nB6xciaORx1WrBhj2uFl?=
 =?iso-8859-1?Q?Yi+g3i1U5cTL6kY7Ystrtt3EqEyjlb+gyg+X21IYLkZlZ7YJPXOnqcLUeU?=
 =?iso-8859-1?Q?MDpvGcTA7OxuOAA6O2nTB5bniDNy9fTFyZmN9x1wNgElG15VaCXU+ppbrC?=
 =?iso-8859-1?Q?B91n1Z5XSdM0rSYa8CTAtAZvwhHvzoj0O/jMnexvh+98n8718rgzdKY1Z5?=
 =?iso-8859-1?Q?MkjArQF/L5ggOXpPQ1c9h8lIzmbJLtfCNFv3ro9QQL6dC+snByI1qEzctL?=
 =?iso-8859-1?Q?zNxCyLV58VtWcqJ3g5ACHXuEdsGjhXppFHyLYJQBszy4V+0LqnEXKMEw89?=
 =?iso-8859-1?Q?iVO9OgFPcTduHoMXgpt2iif6rjc5tKkNgLPLh0C69sQ6T8ZTS12yGMVI56?=
 =?iso-8859-1?Q?1ymuLFoiITdJ9btt/98xOm6q4F8I2z/u8opanfJenOfjydGFCfGyensM0m?=
 =?iso-8859-1?Q?4vwijnK2fk8CdhyAWLFRIMkF8fF0qhoPtthWEeAzFefwCttG+uiO5gCs5E?=
 =?iso-8859-1?Q?OhMHUJCjxdkxDfQXKzKILAlr+kCFViugpDE6jzk5F3kbugSwo1uMAq+e97?=
 =?iso-8859-1?Q?qFsWw8lwMxUD2T/6bdSJH9t3vlwJiPu3deKSXN6eif2o7qSCzEtPgeue7M?=
 =?iso-8859-1?Q?SbsaEpF/yb16XrqfHEkuuYC7cMC+t5Q0teOTdBvgaKfureQBwX1tUvPqOz?=
 =?iso-8859-1?Q?4ayizsigXllhaPKgSdgq3uwf/LBhK7ordbkYVelSVTMamrbXKCUFjrXA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 443a21c1-eab0-43dc-2652-08dc21bc7ea6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 17:54:24.3298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ilqUBZ3BqGKfHs801pHl+pd2Uo/2KhLPSQRGbdu7I2WCPQNJmHnu3Uh06nFgBmZgAj/Xo6dSqZM+YsoCyv09g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5039
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

On Wed, Jan 17, 2024 at 02:40:47PM +0100, Thomas Hellström wrote:
> The error pointer macros are not aware of __user pointers and as a
> consequence sparse warns.
> 
> Have the copy_mask() function return an integer instead of a __user
> pointer.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_query.c | 50 +++++++++++++++++------------------
>  1 file changed, 25 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 9b35673b286c..7e924faeeea0 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -459,21 +459,21 @@ static size_t calc_topo_query_size(struct xe_device *xe)
>  		 sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss));
>  }
>  
> -static void __user *copy_mask(void __user *ptr,
> -			      struct drm_xe_query_topology_mask *topo,
> -			      void *mask, size_t mask_size)
> +static int copy_mask(void __user **ptr,
> +		     struct drm_xe_query_topology_mask *topo,
> +		     void *mask, size_t mask_size)
>  {
>  	topo->num_bytes = mask_size;
>  
> -	if (copy_to_user(ptr, topo, sizeof(*topo)))
> -		return ERR_PTR(-EFAULT);
> -	ptr += sizeof(topo);
> +	if (copy_to_user(*ptr, topo, sizeof(*topo)))
> +		return -EFAULT;
> +	*ptr += sizeof(topo);
>  
> -	if (copy_to_user(ptr, mask, mask_size))
> -		return ERR_PTR(-EFAULT);
> -	ptr += mask_size;
> +	if (copy_to_user(*ptr, mask, mask_size))
> +		return -EFAULT;
> +	*ptr += mask_size;
>  
> -	return ptr;
> +	return 0;
>  }
>  
>  static int query_gt_topology(struct xe_device *xe,
> @@ -493,28 +493,28 @@ static int query_gt_topology(struct xe_device *xe,
>  	}
>  
>  	for_each_gt(gt, xe, id) {
> +		int err;
> +
>  		topo.gt_id = id;
>  
>  		topo.type = DRM_XE_TOPO_DSS_GEOMETRY;
> -		query_ptr = copy_mask(query_ptr, &topo,
> -				      gt->fuse_topo.g_dss_mask,
> -				      sizeof(gt->fuse_topo.g_dss_mask));
> -		if (IS_ERR(query_ptr))
> -			return PTR_ERR(query_ptr);
> +		err = copy_mask(&query_ptr, &topo, gt->fuse_topo.g_dss_mask,
> +				sizeof(gt->fuse_topo.g_dss_mask));
> +		if (err)
> +			return err;
>  
>  		topo.type = DRM_XE_TOPO_DSS_COMPUTE;
> -		query_ptr = copy_mask(query_ptr, &topo,
> -				      gt->fuse_topo.c_dss_mask,
> -				      sizeof(gt->fuse_topo.c_dss_mask));
> -		if (IS_ERR(query_ptr))
> -			return PTR_ERR(query_ptr);
> +		err = copy_mask(&query_ptr, &topo, gt->fuse_topo.c_dss_mask,
> +				sizeof(gt->fuse_topo.c_dss_mask));
> +		if (err)
> +			return err;
>  
>  		topo.type = DRM_XE_TOPO_EU_PER_DSS;
> -		query_ptr = copy_mask(query_ptr, &topo,
> -				      gt->fuse_topo.eu_mask_per_dss,
> -				      sizeof(gt->fuse_topo.eu_mask_per_dss));
> -		if (IS_ERR(query_ptr))
> -			return PTR_ERR(query_ptr);
> +		err = copy_mask(&query_ptr, &topo,
> +				gt->fuse_topo.eu_mask_per_dss,
> +				sizeof(gt->fuse_topo.eu_mask_per_dss));
> +		if (err)
> +			return err;
>  	}
>  
>  	return 0;
> -- 
> 2.43.0
> 
