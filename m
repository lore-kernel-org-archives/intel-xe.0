Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4208EB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jun 2023 22:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F2D10E063;
	Wed, 21 Jun 2023 22:24:12 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4B710E063
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jun 2023 22:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687386250; x=1718922250;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WCfQ0A2NIIIExOoPwISzuCnA6zz6cwxdL6LcmANbqlM=;
 b=N6VDUwnk/YxeRAPKg5p0GXIC603GQAlgnar3kfodW7+iqEOk7hUYT7bA
 HfvCMh75LB9eClUoZaNt/JwRuDjV/gt0lbIatxYO3Ht2TL96CI5Id6B+C
 Yy5nY+fxZ7jyLS1masFeLhbki01C0jwFdt2UFVByF8B1/zF7+cDMuPPXC
 /uV9a9BwwT4PrL5dIEVU5kqMidsb6VBHYuHpIWXZk+BO77LzOvlNqU8Xc
 T4zQYZ5N4r/+I9JyIusiEJ6xB5C/o7xm1DC2mikE12lguRuWn0t0AGI7U
 juyVPE4WKZS3IymHTH20mBwKQh5gXLKx9axHryzFEAM6OIkJjglVVlSUM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="363754504"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; d="scan'208";a="363754504"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 15:17:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="714669191"
X-IronPort-AV: E=Sophos;i="6.00,261,1681196400"; d="scan'208";a="714669191"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 21 Jun 2023 15:17:49 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 21 Jun 2023 15:17:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 21 Jun 2023 15:17:49 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 21 Jun 2023 15:17:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MlrCUXvIYhFhLpcc5lpNIF9wJuQ2kskWS1Y4xXP5MpLQHeZxlr94sRUBah3pVYSfOqLdtzePUoBdQf/w0+QOwp7UH4KZT7Wg1XpZ86L09NUhLCeEh2+gRk9VUbzoXxTJR/fDGRo5bp3xJH2QYIzyVripoAWP4SnCwmKQoQRfUjY1APpp9j+w/ReMZ0rbuLFFGNetbo8yZ9mJEj6Q+d9t4zsJM4gL4tY541/kkNjc11EGpOm44uYekl9e5HMkLRIbx8cwo6zvajnHAiR/py7kjULI4qNI9rVXMY2S0bjIoM5xVEQEp5dgPgHNP5aTvnGCxoBl6izXzZlShE0tPuenbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymwI4136I4fw5PkP3chD3OqlIE9Vom8X0P6KeIOBvT4=;
 b=RoRWXb4FqEiZc2BJUu0Uw9VsoompICyGEitZCNZ7qeNtpZPU3wiK/SIdysusfpeKFVgUEIswyMbOV2XTWjSo4vNddJvpcmjymZaGE/OGo718Ku1u3l7gnTP6i2ADu5KWS2SR3r2kadVa6cygwZqUZy8OVqaUOkjTobs0GfCJuelLdx9Brs/BRCsllYmtX9kJAirOWlcMPPHx3LaXT/xIoGxPdtao9uM92vP9MrfwNZ4syx3Q++1pi8q16sOVl5moSLXG9itkKLjQfLMP1yrfT5c0aK+ab1RexsA2djzbmvesPC/gYGWBMfGEzPJs8CFK7pYbS0f070G9bjVSqI1CtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6540.namprd11.prod.outlook.com (2603:10b6:208:3a0::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.40; Wed, 21 Jun
 2023 22:17:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 22:17:47 +0000
Date: Wed, 21 Jun 2023 22:16:52 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZJN21MaVzFrDZ953@DUT025-TGLU.fm.intel.com>
References: <20230619152222.11733-1-thomas.hellstrom@linux.intel.com>
 <20230619152222.11733-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230619152222.11733-4-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6540:EE_
X-MS-Office365-Filtering-Correlation-Id: 78ec94d8-0553-405c-89f4-08db72a5577c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uXJlagbOnEkvRL9//vLRtTN4Jycd7l4Kam5K2q3CJ4g4KQl/HCMAlbyaXUGFfV3JN1IGDWhFsAmcqKbplPXAScom9KxBmUfMfFQTn/YiYmvBz0oZstCgHNOC2nC+zWJry3k2mdT2iCizAOcLmdAKwIeS1qAasSV+3pe2mawJgSLxUmnriSAaeetpJ3Ky4JD101vN+uSYzxUFFoKV+WEDjyCp2HdHSgzSOV7y7tegkgb5pwzNI6+W95AbjIX6VoSKtwF+7t5KIDv5IGXmDaBbAnG9AFqKz6ok7XosSkc4GYOI1M1v1u2Rig5QZTaCUiFUouE1msS/v+1D6f+JFTPhfa1L9SS4A00B9nGJ/woG5HBKtkJ9iLVjuFvmaC1eMA1l0blyiS9g5nmwvrGG5MV8oveMkqcMVDY5K0Sj7m01B+qcWWupHosuu7ehwOXVMXf8Zaxw3cU4eYbt/O/bLkxxCOUq3k+s66VsNlRQOt/HM5uEp2MSDoQ0+GjAWUAcEAfSgccsUtEeViYPyENxTwq/fO6ASaT5gqIt437C9bjEQzF6zr78ulN7PeBKPYyFqcwN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(376002)(346002)(136003)(39860400002)(451199021)(38100700002)(82960400001)(66574015)(26005)(6506007)(83380400001)(6512007)(186003)(44832011)(41300700001)(2906002)(8676002)(8936002)(5660300002)(6666004)(478600001)(6486002)(4326008)(6916009)(66476007)(66556008)(66946007)(316002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7oVq6nDjKjYIi6XvoxEfXoxgTlmVG6yhJRzh4grHGZ8KM254YjwLk2s6zg?=
 =?iso-8859-1?Q?0gP6rKQM1RbPa2eGfxy3MuFT6DkG/boTofFf5DVbJwIi4fANxct6JoCn18?=
 =?iso-8859-1?Q?Nakey+/rzsInYRp8aGBDKjlbxe9kZYti3gezBgbBZnsf87ZvyoijnbzhEr?=
 =?iso-8859-1?Q?Cz5A+ZxlgON7kqmpO+8wjaiCR1SfT9drSwBU0Cg57oHTDSJ21Sd5q7Lm7a?=
 =?iso-8859-1?Q?aWVTl2mS8xuxHPrhloZcwV+91g8f1kcZAZcud7zITAjOmVX1Yp/UWZQ4PL?=
 =?iso-8859-1?Q?CySoP6Jjm27irkzcza0PF26axBKHOlqZhCOPTtxaO+/PBmNGKFsiTFr5yu?=
 =?iso-8859-1?Q?XjEDclsYbKyqJmRurv9zjZ4pyUlucaiig9Gs/9GK08afv1Uuna3dRcczQ3?=
 =?iso-8859-1?Q?wNSwwFv09z6R6qvCR2rK5GsAY5vda/EsOmNy+S9BXtlHb/JMq1keWSp9lt?=
 =?iso-8859-1?Q?QVMiRvB8WzqM09+xh8vLxt4dE3xWTKPEuwNhJwP1qN9F36asVuW9TK5UU0?=
 =?iso-8859-1?Q?xNnlOpNVUMZ/XrvzBIY11TYLzrdm1ZaiC2tkCFeKOMDNqaPN/g2krG8uTB?=
 =?iso-8859-1?Q?pHP4FpQrbOtLs+a+CDORXVRCJbJegWm59olT0tUc1Rn0vSrO1Amp4DW/LY?=
 =?iso-8859-1?Q?7+vJuU6tCi6a5JiZXBrwqx9HypPHJ5uvnX0XqVPpadrh9nthr+nA2fQVcP?=
 =?iso-8859-1?Q?Nd0aY1UAE2iJ7sMo1GV9SmLN5sbGGPnRrn8TjiK5UITTLtkd/veTStZ0SN?=
 =?iso-8859-1?Q?VMAal6l0B5L+3JWHAZq9hdvegkMMMkJ+TwTE/CBRir5g8kjVc6Yk1dXsTf?=
 =?iso-8859-1?Q?/I7kbjgpOhX9uRgysBaY4a507+PVwA/o9LopJ6xAR9/Ej9g2oVpFjmzb3H?=
 =?iso-8859-1?Q?49xJgBj5OZvgIvR7mSyEQ49rxbwNESKS2C67WEQW9M+cNX9hLfVrfamu8s?=
 =?iso-8859-1?Q?/w3WQ9ykEMSGfKJi/I97qlGHOZclYeZ39A+NUMchVGw0rxVIhx/An/+VzJ?=
 =?iso-8859-1?Q?LUVvOdl9/RPjuwZJMcvezFHAk6qi7Bx6ps1+RFfGrMQAsVMhEyWG46jT9K?=
 =?iso-8859-1?Q?o1CsiXIxUCpB2srhbZovxnsMW/bdS1URi6en7LgeNrJIBhOQke1D1nnTHK?=
 =?iso-8859-1?Q?Tcu1LOrviEnHoLwppJYqmPyFptZhHt4MGaNlh00J6WhEskQE/BHV9fJ2Ry?=
 =?iso-8859-1?Q?cikJm2dA/JD1eilep6LQIMMEwonqbiKYNVSOODN9M7HIVfkY2ofFc66wAh?=
 =?iso-8859-1?Q?VwuSqA+EYv9Lx/4hSn5b6eSlqQlLYtfr7+Jzng3koBuahsh52o6abTmwHy?=
 =?iso-8859-1?Q?ELlXKcAPg9yVcdbor9XqspYgm4bTDq4YkLZ5xC0jPu8eXOIKGgHVBq9r4m?=
 =?iso-8859-1?Q?8giaH5ZJDLWeFFtWfd7k0qzutG4E2cWO0yscJp9Hr4QZjTdG+QZ2FoVp+O?=
 =?iso-8859-1?Q?RghsvpGP/1XZrLNd6wPM0/Xzl0oqBEcludvhCQSiTqkV1VmGJSGKwn14Yr?=
 =?iso-8859-1?Q?q/jm2DcaCuXu9JXKlHpuRh3MFRnm2HpKDkyWyC635p5RET2fjFLRA9hrtb?=
 =?iso-8859-1?Q?qXnhI4JwSRul2wVw2UwaRTgUYSjWX+/tefEvuTuKO/RxX0L3PQIuB1pRve?=
 =?iso-8859-1?Q?VxgToyWwKfgL7xxhPAE9tWKsljpLr6w6xy/FvIx7r5iO1WMv/2mw75hQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ec94d8-0553-405c-89f4-08db72a5577c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 22:17:46.8231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ompipm3SOw/N0nbZXqRXaKgj3MVcbmY3xBpOb2WmxsQOYKUe5dCPdL9W+xhY0l8ypvPFg3ZDVeWiumz4I/mk2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6540
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/6] drm/xe/bo: Avoid creating a system
 resource when allocating a fresh VRAM bo
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

On Mon, Jun 19, 2023 at 05:22:19PM +0200, Thomas Hellström wrote:
> When creating a new bo, on the first move the bo->resource is typically
> NULL. Our move callback rejected that instructing TTM to create a system
> resource. In addition a struct ttm_tt with a page-vector was created,
> although not populated with pages. Similarly when the clearing of VRAM
> was complete, the system resource was put on a ghost object and freed
> using the TTM delayed destroy mechanism.
> 
> This is a lot of pointless work. So avoid creating the system resource and
> instead change the code to cope with a NULL bo->resource.
> 
> v2:
> - Add some code comments (Matthew Brost)
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_bo.c | 46 +++++++++++++++++++++-----------------
>  1 file changed, 26 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index fcdeafdba79f..cfbcc071f2ef 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -479,7 +479,6 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
>   * to unconditionally call unmap_attachment() when moving out to system.
>   */
>  static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
> -			     struct ttm_resource *old_res,
>  			     struct ttm_resource *new_res)
>  {
>  	struct dma_buf_attachment *attach = ttm_bo->base.import_attach;
> @@ -564,6 +563,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>  	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
>  	struct ttm_resource *old_mem = ttm_bo->resource;
> +	u32 old_mem_type = old_mem ? old_mem->mem_type : XE_PL_SYSTEM;
>  	struct ttm_tt *ttm = ttm_bo->ttm;
>  	struct xe_tile *tile = NULL;
>  	struct dma_fence *fence;
> @@ -572,35 +572,29 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	bool needs_clear;
>  	int ret = 0;
>  
> -	if (!old_mem) {
> -		if (new_mem->mem_type != TTM_PL_SYSTEM) {
> -			hop->mem_type = TTM_PL_SYSTEM;
> -			hop->flags = TTM_PL_FLAG_TEMPORARY;
> -			ret = -EMULTIHOP;
> -			goto out;
> -		}
> -
> +	/* Bo creation path, moving to system or TT. No clearing required. */
> +	if (!old_mem && ttm) {
>  		ttm_bo_move_null(ttm_bo, new_mem);
> -		goto out;
> +		return 0;
>  	}
>  
>  	if (ttm_bo->type == ttm_bo_type_sg) {
>  		ret = xe_bo_move_notify(bo, ctx);
>  		if (!ret)
> -			ret = xe_bo_move_dmabuf(ttm_bo, old_mem, new_mem);
> +			ret = xe_bo_move_dmabuf(ttm_bo, new_mem);
>  		goto out;
>  	}
>  
>  	tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
>  			      (ttm->page_flags & TTM_TT_FLAG_SWAPPED));
>  
> -	move_lacks_source = !resource_is_vram(old_mem) && !tt_has_data;
> +	move_lacks_source = !mem_type_is_vram(old_mem_type) && !tt_has_data;
>  
>  	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
>  		(!ttm && ttm_bo->type == ttm_bo_type_device);
>  
>  	if ((move_lacks_source && !needs_clear) ||
> -	    (old_mem->mem_type == XE_PL_SYSTEM &&
> +	    (old_mem_type == XE_PL_SYSTEM &&
>  	     new_mem->mem_type == XE_PL_TT)) {
>  		ttm_bo_move_null(ttm_bo, new_mem);
>  		goto out;
> @@ -622,7 +616,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  			goto out;
>  	}
>  
> -	if (old_mem->mem_type == XE_PL_TT &&
> +	if (old_mem_type == XE_PL_TT &&
>  	    new_mem->mem_type == XE_PL_SYSTEM) {
>  		long timeout = dma_resv_wait_timeout(ttm_bo->base.resv,
>  						     DMA_RESV_USAGE_BOOKKEEP,
> @@ -637,8 +631,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	}
>  
>  	if (!move_lacks_source &&
> -	    ((old_mem->mem_type == XE_PL_SYSTEM && resource_is_vram(new_mem)) ||
> -	     (resource_is_vram(old_mem) &&
> +	    ((old_mem_type == XE_PL_SYSTEM && resource_is_vram(new_mem)) ||
> +	     (mem_type_is_vram(old_mem_type) &&
>  	      new_mem->mem_type == XE_PL_SYSTEM))) {
>  		hop->fpfn = 0;
>  		hop->lpfn = 0;
> @@ -652,8 +646,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  		tile = bo->tile;
>  	else if (resource_is_vram(new_mem))
>  		tile = mem_type_to_tile(xe, new_mem->mem_type);
> -	else if (resource_is_vram(old_mem))
> -		tile = mem_type_to_tile(xe, old_mem->mem_type);
> +	else if (mem_type_is_vram(old_mem_type))
> +		tile = mem_type_to_tile(xe, old_mem_type);
>  
>  	XE_BUG_ON(!tile);
>  	XE_BUG_ON(!tile->migrate);
> @@ -703,8 +697,20 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  			xe_device_mem_access_put(xe);
>  			goto out;
>  		}
> -		ret = ttm_bo_move_accel_cleanup(ttm_bo, fence, evict, true,
> -						new_mem);
> +		if (!move_lacks_source) {
> +			ret = ttm_bo_move_accel_cleanup(ttm_bo, fence, evict,
> +							true, new_mem);
> +		} else {
> +			/*
> +			 * ttm_bo_move_accel_cleanup() may blow up if
> +			 * bo->resource == NULL, so just attach the
> +			 * fence and set the new resource.
> +			 */
> +			dma_resv_add_fence(ttm_bo->base.resv, fence,
> +					   DMA_RESV_USAGE_KERNEL);
> +			ttm_bo_move_null(ttm_bo, new_mem);
> +		}
> +
>  		dma_fence_put(fence);
>  	}
>  
> -- 
> 2.40.1
> 
