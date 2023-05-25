Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28A1C77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 23:18:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C5FD10E008;
	Thu, 25 May 2023 23:18:43 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F5EF10E008
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 23:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685056721; x=1716592721;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EHVK0E6OfddycdT5VICZIGCZjlWNvtb7RQRhlHBa4BM=;
 b=HfAMSb0K9/21bfI3BUO6cc4PnzryjSp9/m0YG/x7uYRwvv6evFRjFgtt
 cSY4iBWYMqFLcAgSExKldZcxOFQu5GWTtxIhRJnF4xTcU4MlNC6PXDKwn
 9h1DPZfd9mJ4K+7afVFRiaZjez+bJsPvxKQHdEDcea/a3feb1BBv9N0Ng
 6iDv+kMREm0gI3pYMACbKjP9tvXo0B/OzKBOtii0PxX1qJ4dGVopFV6W3
 qHhVwrA+vr6T+E1QeKgZQ/Bu2ShGZ6AImeNBMIsBxF3WLW6lTPIUKAZMe
 qBYk7mAY4tWoZK5ufBm4keM5CPlyOJAomoCcNcJKjsAtSF3QvOA0V5INW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="356438689"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="356438689"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 16:18:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="704972043"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="704972043"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 25 May 2023 16:18:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 16:18:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 16:18:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 16:18:39 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 16:18:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QCW6QtTs/nlN2Wro6M+Ha3W9CDsmpRdgu9TEQfHn1AHY5CUaGUZeuOaT0bXGtU/6k/9Cg4030l0zNPV1LrcgEvtUT/j99eaaYeo51GkEJ6ZoMdkyGp+pWolcw/DnzzZxk2WMIyXk980kLey4Y6XZMqLjEJB0XxycRmwWOlCViBdntcrHu9tTTCPKsuh/uH6n0t02Eo8GjJ/qMu5ZdYZkxVzzm8W5P7MTL5K9xhJfXXuiv3Yv8mJKleH7ydZtVJx8poO7tYUpFXfR2+j60LBIIvdjWAuSxp8jv5L+LEf5AhKRnWYBG2Jz6XJhj4y2fbza68IwHE2KqyOuX9cL8Ud87Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50wj2KMFtHRnCE+zRvsiArNuL9Ww76DQtepC1M3V/gw=;
 b=IY7C6m/sbi2pG5yi4tC6P4tLgU70ICtks8yNMYchSc2sUA+8Osed19SNYWieyjf/wP1Zt6ud3tPcD0chyV2WxaV5tNnfmXeQb6GkHIToRBbCeiN9HJMLL+yB34/IQs+Vevs0YWK8X18/L+G22Q96N7V0BrsKCFgc7c2yukn0h4v0yLL2pcjyMvmpohMn9+qqqea019ZnDt6QB/BmuzTLG9B6O1ekRnYtbRDWzNpaJO3BvJ/46wI+7dMGmIrsLx4kbWFOcRfylSblTXxJz9JCv5tknPc8sLkY7NMfKsWDZoaSnYCSDDua5ciVGCyKCsfver5Pw0xLjcARh8y5llHP/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 23:18:37 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%3]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 23:18:37 +0000
Date: Thu, 25 May 2023 16:18:33 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230525231833.GC10045@mdroper-desk1.amr.corp.intel.com>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
 <20230525213407.3907094-16-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230525213407.3907094-16-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::26) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA1PR11MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: 1118478a-7d8e-45a8-ff26-08db5d765de2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Wk7Md1rKkNWmFCr9R+2B5xIWtHZgWUkmMQXPrINO1JfJVARiYSFnb8CMkkLsNx5EPWIgducEOwm3Jw6Mh4bA4wKMraCuv52Kk3ZMIShxe63Z5+9wbY5HeW7udndQEYERI18/jFQsXMY227KKvGbCEkSUBktD2qAI1Gi+yNmxXMbjRjmiquNcPsHYA/Q/0IoMjR+kJBbXhAVjn2KJXDeDkOipUZtRws4AqsAKvql3+WdzgUzJV/7uXg8zGmUZIylujP1fV+pMMi7m/9bR0OwdVmIaJ8JeduDHEPiZ/pU4vwnf0pGC9VTHzaf7lTn/Bo6Y9hxEVMKvWAELo+h0ZZwkcq0xgw0RoQqsvLYn1N1h0Cu3aH8XfIlr3Les1NOoI1L+bT7HxgJV2MHBJjvOWIbhgNd4Y3o4Xkm/JjRc8FaoTZBTu21Ukd0Y8ky6NGVWDeubx3gry3OsBTfJIVKquYroSfrSIYGxaCSC6WlJqfWkH4Jv52ES1VuK/l7ZURE1t/G9tt3mjsOOMsiH+RvUQrbyqNyT8WCJTPLdRowhaJk0YAgxT5JHi/qd2vM+Te6qhDE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(366004)(376002)(396003)(136003)(451199021)(82960400001)(33656002)(186003)(6512007)(26005)(1076003)(38100700002)(6506007)(2906002)(316002)(6666004)(41300700001)(6486002)(478600001)(86362001)(66946007)(6636002)(66556008)(4326008)(66476007)(6862004)(8676002)(5660300002)(83380400001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PC8L1EVuENqXjMmxB+ami6cgEt3aRcrVtCzmpWcrWGeHMQ7n+mBVxfomsz9I?=
 =?us-ascii?Q?o2MfI5LHrhv5ahjiZZjwto4ThVlLndPmhQeP8p5ep+Pt3pVVIKJXq7moG6tl?=
 =?us-ascii?Q?9QmNSh2eeT7kkOgeuVuYcsEDyoGl7o2Q7wLB8I20Z+WQBVdsQUyMRqrw3JA1?=
 =?us-ascii?Q?YCKQTFZDNhXrRB8kUm9RpX8MOXyG14tXNWeVmvDPvhR+IwXEmvrpYpiH3ylb?=
 =?us-ascii?Q?2eyn5xEtLcn4+tjghfOMc2g6LZ+1ssuBZJtByYtjWdJ4bZKlkau4TCY4cLLq?=
 =?us-ascii?Q?aYfQdh/0jXK0lUpWAwKvrPKnvS//BdXRgDTMHxARx8v86uiAG3+dHbskrqtr?=
 =?us-ascii?Q?46QwlLUNDblAN4SeDLVjUYePHfSvFhEXogsA0sldm8p+b0qQOJO8bNUPjbuF?=
 =?us-ascii?Q?xUXVCw4rEoPVyL8PD1iIp4fmObKcvYCfJyzufWdr287sAGusWpVRtBdnGHMe?=
 =?us-ascii?Q?JTp04qfcZrlGwRd+foB6i4l/xtOP2vWAf5827Y2T4FHi7dptaB+6dG5wdGxP?=
 =?us-ascii?Q?6Qe7cq0Xiwu1dWdJY57RAm50IsxAs+GNVRQaGUSO8PvUfKvot9l7qAs3O2wo?=
 =?us-ascii?Q?va3Dc0OZJ66fHnSy5GI7VGskjHof/tBAzz+eRV0zMNonSjYq1V5xi1iOX6mr?=
 =?us-ascii?Q?geWyfud7LByruhDua+GntrwvBKjKDdo4Uqa/qP0wYvIVNAa18XPr+vgLuoxo?=
 =?us-ascii?Q?Dr7+dTN9Rr/xX/BwG8i2wpRAqRcecjyOrETsZjg0CWotLOq7DcdhlQbnwhbB?=
 =?us-ascii?Q?pM+XcsZhL5fQz5DiKb/+4kKoGGY7V2QSBtE5w4hf2qF336NyHyYSh2takTsC?=
 =?us-ascii?Q?9kbG0daQ5dvze5Yj7rxqB6M3q65/vBI3Vukxl4Xm+KQDzv/3i4quEvugYlN3?=
 =?us-ascii?Q?ARunR81ZfFHMgjPYgEQjYhYstJeNvl4ttGsZRAGiVHe0VhQdESRz/94iHaS0?=
 =?us-ascii?Q?UmCAogu+PkGV7rJqF4bAIoILrywaC8fM4mqdYU7CvPDUpJfQQyX45EVXxThW?=
 =?us-ascii?Q?FfUy+kJacS8MLrrXu/rawx9MbW6Jmc6aXuUottfVo3b6M4YZpepLudjs1Ms+?=
 =?us-ascii?Q?oHr05i/kylJX4PQRFPsN7nTovoRDczmTTlltf4V9MLYIWpUgE/npsd4Z5Edm?=
 =?us-ascii?Q?S7ZGYRFdmGWVHKTHeZOJsZWrkJu6ArStYqy8EnlLTKQjzjz2Jvb30Q+Vu5yN?=
 =?us-ascii?Q?MKoT9q3/pCmfyue60eTYVG/LMe58axpLguHZ0hORcbnM90905U+fZtHoYdgz?=
 =?us-ascii?Q?CC/fD4xOTQIkdlZ4zHc9PQCOzWbW1nBxg2boxSrOg/WfDrLdwsILgDq+dTXN?=
 =?us-ascii?Q?wBhvA26zH/7Ti7/L06oRq+M2UVKxiZJD/y3s4cCFh8AMSzFdM2+yEgEwokSA?=
 =?us-ascii?Q?geFwZQcmzAN/1uU5tTenRc7HiwY03JLQWa9AjOVqmcyZXDXHVMz2e1z1Q/M+?=
 =?us-ascii?Q?CxGAYLaeybE4GkyiigDDVm0l1ILyJugyCiRUY7NYfWiNpeXUTKq4mhC+rFEX?=
 =?us-ascii?Q?FJb+erKQ2q9pkalyRfF8pdjSwwamrHfOu62OFy0CYbGTyACanm5rfHMBoq+z?=
 =?us-ascii?Q?PWeUz9g43Lp+0SBsYPrHURKe1N4yuUgRjkrVUkrZ9VDBt8/3mAMxcwPPPsr6?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1118478a-7d8e-45a8-ff26-08db5d765de2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 23:18:36.8313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9DNR/sbzIvipsc9/sgaBMtJGw/XIrz41InsuPq7vNnIscyojyv28Kf8dmqpJJAcPV8wWsm9kO2KCp6Y0P2rvxAnbzhbE76Reysos9QRmeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6396
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 15/21] drm/xe/guc: Port
 Wa_14012197797/Wa_22011391025 to xe_wa
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

On Thu, May 25, 2023 at 02:34:01PM -0700, Lucas De Marchi wrote:
> Wa_14012197797 and Wa_22011391025 apply to DG2 using the same action.
> They apply to slightly different conditions. Add both to the oob rules
> so they are both reported as active.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc.c        | 9 +--------
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 2 ++
>  2 files changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 1b3fbbd74923..54aaf6e6b577 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -147,14 +147,7 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>  	    xe->info.platform == XE_DG2)
>  		flags |= GUC_WA_HOLD_CCS_SWITCHOUT;
>  
> -	/*
> -	 * Wa_14012197797
> -	 * Wa_22011391025
> -	 *
> -	 * The same WA bit is used for both and 22011391025 is applicable to
> -	 * all DG2.
> -	 */
> -	if (xe->info.platform == XE_DG2)
> +	if (XE_WA(gt, 22011391025) || XE_WA(gt, 14012197797))
>  		flags |= GUC_WA_DUAL_QUEUE;
>  
>  	/*
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 9b29a0dd0934..77ac4a4a3296 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -1,2 +1,4 @@
>  22012773006	GRAPHICS_VERSION_RANGE(1200, 1250)
>  16011759253	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)
> +22011391025	PLATFORM(DG2)
> +14012197797	PLATFORM(DG2), GRAPHICS_STEP(A0, B0)
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
