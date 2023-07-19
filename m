Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE95C0015E
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jul 2023 15:32:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A010810E4D1;
	Wed, 19 Jul 2023 15:32:49 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C046010E4CE
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jul 2023 15:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689780767; x=1721316767;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=j0uBbRFRn+zz+hOA9xrxXN+Wn2J5vVjoD2pOQCisIZU=;
 b=iEsj6tCL/JFlmhscPJo1tlVOgo5OYDr6aG0W1YplX7tjdhvc+SATXSLq
 4QXBQcieBE68QiZYCb8jqUK/9lRyHg4J5lP9oCoYRXBuDUq8zJiPqK3no
 KazJfiftEJGqW4dS73V8pAdweRs0yIAvzJ7KC4f/2rEO9fvMRjx8DBBF+
 6HK3E9fkJNL73X7dgmTpe5v2ld8QY2FvY3Uvbp91AvjFAXtieZ6lw0Q/E
 GSmUY3FI1peF6DRZQbYN9bC7RXI/rEz5uIp7GqsDJGgu0+bubegu0vdG1
 7GYZCEzcpExvZhHPLzlZLkRSzuO+6eNzBhAcPTYHtya4WHvBl50rBk4Tn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="346088365"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="346088365"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 08:32:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="1054767197"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="1054767197"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 19 Jul 2023 08:32:34 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 08:32:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 08:32:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 19 Jul 2023 08:32:33 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 19 Jul 2023 08:32:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFVRWQVjhqMjmOXCtmMTlwyJOAnJbgh0QCI4/CQNgTFx7x2C5bECfBRmX9lKL1rBgR9ORjY6BRVBr8fhlb1/HswYXhvxAJBGmXiHci94yLO5q92MyDSnGncAk1XOFjOQO5GoBe5PMsVFzhbt7RGn+3gJY646MkfOvc47R1HjmrX46k7ZnrYqd+qJWpLs5xLn7uVjKXqwifYiRudkOhF/HcmrTP2xdD3ojsAv2ND4hYuhonrGdqCxoO+dUaN1tzd53Ok8s/hiTndOUhBywBRVGvw/l39fdqir8eOlA+Neg2hF0PGJIbGjzAXCPRS9TMkiVl1/9gtw+G4vaCBMxmFLPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OKTgex0OfTBR/X49Vse1lB2ckxQV5b+4NGXlZPqmHs=;
 b=J07/7M51nIwtArGPkCJD4APrR+GZQQDzxT3Xx+rC1N/62a/ydMOslWyKh+QmGZl0DUutlRIt50EFMjsx5D9+3JRjFfJxdyR1FxAZxwudrU2JjxaOvIy48mkKfwf0//u/5AvBRDnWobDpIh7WwVUCOVTdxPTWw+IwN/0QJUnt3N0shx4JdRqV/BcfOSa32J2JJqkm2bDwNVGdOdOpG+VmupvK4ue8y7TL0LUisOSt4q2dMMX6vgF/MJGSAxLvhzUQEWJ15Q7d7YoeWMVIOV8pVbGOfyfBbjJi7GxcEnMAZ5g61UusH0wxIyrp0CXKlMtTCg0I9HEotuu7l56UnUgMzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by BL3PR11MB6362.namprd11.prod.outlook.com (2603:10b6:208:3b5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 15:32:31 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9fed:e45:5a2a:6932]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9fed:e45:5a2a:6932%4]) with mapi id 15.20.6609.024; Wed, 19 Jul 2023
 15:32:31 +0000
Date: Wed, 19 Jul 2023 11:32:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZLgCCzIvSAaLo+GH@intel.com>
References: <20230719132059.7-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230719132059.7-1-francois.dugast@intel.com>
X-ClientProxiedBy: BY3PR05CA0059.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::34) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|BL3PR11MB6362:EE_
X-MS-Office365-Filtering-Correlation-Id: 211aabb4-bdc0-4ce8-568a-08db886d5db1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A3mRbyfZITT6KG7ha0aYIKde375ilPvGXm/zpQGe+P3pcGSvkK4BKIZWXdfvHBVUfNMMJlekBStBXoGcSJynCHYn++JBkEKT+4EvMbntx+WwRmnPnza0PNUS3facXxXDMYObmMVwPMuspw96km0qdnhcmb5dj2gEhVbb8VBDACzNDYsJ9LGJoxLF81vXpaUB9kHmRBSEhz8ImdbIqvwP+JTw9cJjUNhk7eVPbAVMk4ihqE6NY8t4KKr7G4Cc5lMzmJRr5YVsWXp/La8fbun7WVz0aY+ITFXu8nFjT/lQvOBi069A2zTDhem8r9Lgg3QSvdcRuu1Nvzdka3fnrY+W6YfWHkJt0hDN4w/4yc6cbi385AWgrvPRjTiZGEW1Pr67wl0o6crxY6Pxocmo4YxbLhD2y4+fOYYBkZSdzD3DmWkybME58KNXEKjRMi1W4e5afUL8Iqvil8JF0sPlXs7DphFbvj3/AL8Y18NxEqxG+zkNAaxwiZIOQY57zd7HRRMGyjrE/eY0en5tYeYdLzkRg8uSGDN4sMl4oJ4t9PiaPDdtzYhH4nUvKaABsYF3mxSGqx5LdLhb0/WFdRqSlo0fKy+Hm8qghkgh2OJDVIZ+ugc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(39860400002)(396003)(136003)(366004)(451199021)(6506007)(26005)(186003)(82960400001)(2616005)(37006003)(478600001)(6666004)(4326008)(6636002)(66946007)(66476007)(66556008)(83380400001)(38100700002)(6486002)(6512007)(5660300002)(44832011)(316002)(8936002)(6862004)(8676002)(2906002)(41300700001)(15650500001)(86362001)(36756003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KeQWZfQoiSX7fa5ijUKYWP4DpLRo3lcZ0DTveBRq7mswIwUxCHwM/8qNSplx?=
 =?us-ascii?Q?ZCh3eFozQpdNUw62c28zXoDHLvl5P7TVU1fG6V9XkhLp4bz1R1jg+nvhSfGD?=
 =?us-ascii?Q?jKNRtVHhMNmqskGVxArhl6xseTWNZOhDIqeqZ5T+B7A0fiWHMUQRXv00LqCr?=
 =?us-ascii?Q?Z+vibZQWhzgXpeoYPCi8fWASmOmFO/1FlP2NKlGuslwToGMC77kus4Es0NQG?=
 =?us-ascii?Q?dxhToVtSNFTUe4E5puZCe6ba21g+8CkV7cNkpM9kNa2hIeXWudC6LvWOSLRq?=
 =?us-ascii?Q?rbguuhBk2/Sr9OLzkOLdB1fNupBiE5dQMVrxZ4VCDBt2JNn4ETtF+t+bKL8K?=
 =?us-ascii?Q?rTLk3c5EhYD4YsVZzqkhIlJf/RzubCMGS6b25ibQIgTrbkFECwusAJU4A92J?=
 =?us-ascii?Q?VGCbaT+xwIlHcgIBbfoqxs3mDkWjbpzd+BK5vt00oT4v9orGjkj2KxmcxRUc?=
 =?us-ascii?Q?nt1y2c/VeDXCjwp2x1nRkfM6SvF00v/9BIg1FlKl1whZSl+zyKPLt6il6bTI?=
 =?us-ascii?Q?xUQZbcEWdsBUxLqO0VCmZ5jUmJWi/rC6kYdciPOJYhm/nlnOofPCL+4hIKFu?=
 =?us-ascii?Q?E4/9qHK3Iv1L3GQGrig3LWds5sEWjqjKLk63sd6oDvFogsC1whVb9qJRVERV?=
 =?us-ascii?Q?YdfaghB7uFBaemvWRSa+jzygD/g8KCAnAVVoWEn+LDNM39LwapKMU3IBEJb3?=
 =?us-ascii?Q?sC/LykrkjynKKrzNHbgpK0T6Ia/c3TB1Wg5x4Q/pW0Rvl6kcOz20d+EJYQIM?=
 =?us-ascii?Q?X1fe2ny8A2EHH6/M+xKHnKeZ9bp5zWfYxni8lViDGuc5fCkasAFS50ugo86x?=
 =?us-ascii?Q?WrN4OzjsTOvjWpHwTJaHQVs5VmSMLI6vpYIOvYSwMd5+OxhsWBQA2VQVHNJT?=
 =?us-ascii?Q?gyQ8j+6dSQIS81NeqyNomf9mlTNALh+sxTO0os6BQo2bnrTGunNEfgI7OyX6?=
 =?us-ascii?Q?v2o5g8ggOGcYr/c1V4gH2PkTJYRhrofTp0BQ9Wm3Pil1v2cKBZL7DjcSypcN?=
 =?us-ascii?Q?96428VTfbXNwONYGquZRgIXs9NXC2vUS94WnJJDzLBrxBXdod39kqcy16lrb?=
 =?us-ascii?Q?TBgOwsMx0jd4kqxovQYU3DqHc3gf5LYBYWRtTX+73MfBKMat8C+Hdg1tDCLt?=
 =?us-ascii?Q?RlVemlKCBAccsAVwWAcEophCEfHQnj8IetufCyt+14AgA789Iioxc0EoDe6h?=
 =?us-ascii?Q?KbnLzksXxtzCG52GTT8P8tmRdvkjK0MTG/OeHuSlB0K9Oap8audXLxN3LaHe?=
 =?us-ascii?Q?lYbbJ2J/ybl49fOncPlSKbjBgpRkITbhdILDU9lALHdCvZ+b03cN9JoO76Cn?=
 =?us-ascii?Q?EO+92EcFDdyuER+L6UDzsHbR6IsPbVxqR3TrUFGYqV8ZNW/lHEOzKvShWphE?=
 =?us-ascii?Q?ny7CEMQgIXEem6IOaYKIGhdu+DotjnZ02Gsczf0+yJH7w089DD0TKg3V2kax?=
 =?us-ascii?Q?VE4OoqhUIWNV5QjjEqvZ+jmYY97pQKHH0bq676em+5ALOAZDdDyGyL91Wq5i?=
 =?us-ascii?Q?RNDYri5/Te+w5/jZggDBdypjoc+p6R+8859LJG6LDJFROr6gBtBpIUDxOCR3?=
 =?us-ascii?Q?QgSrnAc0eGmNgTVttz3sMAoY2mJhoi6ozevohBpfuvtNXy55H0a9eWjgssGG?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 211aabb4-bdc0-4ce8-568a-08db886d5db1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 15:32:31.2397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HvmE0ySXKrWtCeFlrb9vbc9igCYncEBbAgg7VMU4dtrcqHbgKhBoJd0m9H5Nkd83xeNL1J4k3Gz8Rc4C/QVxuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6362
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Rely on kmalloc/kzalloc log message
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

On Wed, Jul 19, 2023 at 01:20:59PM +0000, Francois Dugast wrote:
> Those messages are unnecessary because a generic message is already
> produced in case of allocation failure. Besides, this also removes a
> misuse of the XE_IOCTL_DBG macro.

this could be 2 separated patches, but anyway:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c  | 1 -
>  drivers/gpu/drm/xe/xe_guc_debugfs.c | 1 -
>  drivers/gpu/drm/xe/xe_huc_debugfs.c | 1 -
>  drivers/gpu/drm/xe/xe_query.c       | 8 ++++----
>  4 files changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index f9f653243f20..30a031356b4e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -174,7 +174,6 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  #define DEBUGFS_SIZE	(ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list))
>  	local = drmm_kmalloc(&gt_to_xe(gt)->drm, DEBUGFS_SIZE, GFP_KERNEL);
>  	if (!local) {
> -		XE_WARN_ON("Couldn't allocate memory");
>  		return;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_debugfs.c b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> index 0178b1a2d367..069afb52343c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_guc_debugfs.c
> @@ -90,7 +90,6 @@ void xe_guc_debugfs_register(struct xe_guc *guc, struct dentry *parent)
>  #define DEBUGFS_SIZE	(ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list))
>  	local = drmm_kmalloc(&guc_to_xe(guc)->drm, DEBUGFS_SIZE, GFP_KERNEL);
>  	if (!local) {
> -		XE_WARN_ON("Couldn't allocate memory");
>  		return;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_huc_debugfs.c b/drivers/gpu/drm/xe/xe_huc_debugfs.c
> index ae3c21315d59..9478edc4c39a 100644
> --- a/drivers/gpu/drm/xe/xe_huc_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_huc_debugfs.c
> @@ -56,7 +56,6 @@ void xe_huc_debugfs_register(struct xe_huc *huc, struct dentry *parent)
>  #define DEBUGFS_SIZE	(ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list))
>  	local = drmm_kmalloc(&huc_to_xe(huc)->drm, DEBUGFS_SIZE, GFP_KERNEL);
>  	if (!local) {
> -		XE_WARN_ON("Couldn't allocate memory");
>  		return;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 4b7869596ba8..f880c9af1651 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -65,7 +65,7 @@ static int query_engines(struct xe_device *xe,
>  	}
>  
>  	hw_engine_info = kmalloc(size, GFP_KERNEL);
> -	if (XE_IOCTL_DBG(xe, !hw_engine_info))
> +	if (!hw_engine_info)
>  		return -ENOMEM;
>  
>  	for_each_gt(gt, xe, gt_id)
> @@ -182,7 +182,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  	}
>  
>  	config = kzalloc(size, GFP_KERNEL);
> -	if (XE_IOCTL_DBG(xe, !config))
> +	if (!config)
>  		return -ENOMEM;
>  
>  	config->num_params = num_params;
> @@ -231,7 +231,7 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
>  	}
>  
>  	gts = kzalloc(size, GFP_KERNEL);
> -	if (XE_IOCTL_DBG(xe, !gts))
> +	if (!gts)
>  		return -ENOMEM;
>  
>  	gts->num_gt = xe->info.gt_count;
> @@ -278,7 +278,7 @@ static int query_hwconfig(struct xe_device *xe,
>  	}
>  
>  	hwconfig = kzalloc(size, GFP_KERNEL);
> -	if (XE_IOCTL_DBG(xe, !hwconfig))
> +	if (!hwconfig)
>  		return -ENOMEM;
>  
>  	xe_device_mem_access_get(xe);
> -- 
> 2.34.1
> 
