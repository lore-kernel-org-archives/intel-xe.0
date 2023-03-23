Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C66C6FD1C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 22:43:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F21710E4BE;
	Thu, 23 Mar 2023 22:43:35 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0089A10E4A2
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 22:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679611412; x=1711147412;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wZ+im0AcXGeK7hVS4Hba86V7CWdbTdomMvA86+odHuY=;
 b=Np524528XrKuLWfxPJCqbjymmWChqJvH+2y64LPGG7/T2xOE5RLzqZ1w
 B08O4VE9CoG7Juh4qKm1V1TRIkZ+ZlHj+1itJzRCEI50xLMRRPevaHJ0W
 4wF40qp11+ZAOwmBAkfZNlfC5VUs2wl/hrVVNqKDHsMpdxnIxZtgcN/wT
 QUkt8sSj6KnVTBVh80Ej7omNk3BkmbY3JSBs0RwoL0qhmaScwblJLYDt/
 tp5FDFsKl1mk57vLBosd7/60HuKdQzjU09Ua3Me0MK+pBs7DmLNoviAFj
 jXIiVCMSbrFwrC1YBVyzmTC/tM9TYzMZb2UCrgAzBW1sjlDBJIwSC4KB7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="319302824"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="319302824"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 15:43:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="675905736"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="675905736"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 23 Mar 2023 15:43:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 15:43:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 23 Mar 2023 15:43:03 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 23 Mar 2023 15:43:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VhNjEchdFuWa66BHcRvBYqcUmrElnar7W6yJ2NqInpJ2+ICCuKa7ApObiWMmf5102G+g9cZFgsWRZ5v/zo6rcsUYSIZ0LgWa3UVuvZGetE7DJwBQTrD0mobYINUh0mzho8aoELODgxTs2ZgsHkVAS42hC6+MMtWOBDLhIPTxMXxUsjiUhE02/jNXZN96iL4mCDeCxFyFd/S55KBkvXA7rlm00khTjLpIiYumf+d+w7o3+hRyaLLE/eNTCCNB59thifXK5jKgg2Uf2XtpuSZteF46LkQR/07pbj9q927QFpo51Ley4NsI/ZN2MWN/KTCaBL2cD1v4rww2Ay9OfI8XIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PqATZiFlAiL03dh8fWEikk2lo6SBSSeilaSTJcsG4p8=;
 b=GsJ2IYIL/yuWjAHehajIep+GGJpRL8/aTyPSWzBt4zHbnuvGgyQE6lK+I1nvjdCoT2cZ2EXsh4RQQpUBv5aNWfNPKoiXzqcnYON3xuBmMHypj8wHDbwW/gailrLCJr1EQWsqoBQM6Yh1WQHNsQYDvWeYrQdDbilZ9LdBprYg7QmaRpeDswmPKS/AUoOrqjUndYstA4DT1MWYjDiuIjLWB1SAQEP7m7dnim9jcnXgpB5F5v/AanRO7GUjznM18+4acgzidEdfEVBNw6jgiBb+xPZNchTxJG5tfwaUSWy156tCd3iD9QFEhR+wJ/cmLesyXSC+fkXnvl5HMq+4sLfY3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7961.namprd11.prod.outlook.com (2603:10b6:510:244::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 22:43:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da%5]) with mapi id 15.20.6178.037; Thu, 23 Mar 2023
 22:43:01 +0000
Date: Thu, 23 Mar 2023 22:42:16 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <ZBzVyHPA0dyEt0tN@DUT025-TGLU.fm.intel.com>
References: <20230323211322.114402-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230323211322.114402-1-jose.souza@intel.com>
X-ClientProxiedBy: BYAPR08CA0061.namprd08.prod.outlook.com
 (2603:10b6:a03:117::38) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7961:EE_
X-MS-Office365-Filtering-Correlation-Id: c1827dbe-4f19-42f9-7241-08db2beff537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d9R7WmMFPdRmxY7sF1SsVLNvCnujkIEWx5SA+y+geBhiXqr/+9RqlsQ+WCKFe3WTjs/+1PbRrytR883nty2dnyaK+N8ad8G9WaAplxxs2bS315uZVXCQHZHtlW8TwnJz4MEmMyb6PxB+5AzDDe5aDI8gn6WWBTTMAGDFYBPVi2DDnbGgaY40TxeNPI798z6Rb1bIJA/mrAZ23Y+ktD16otzmyT3RvlnJrE5qVE+QnY/uyR6mWNadASW+yjgZg+wi6ITKk/Td1RlAcGB28ufIh01+exjCbvV8dJp/2NstHOb1eHfmKHnE/2IjfObxjtHxuo/CdwK4kHMHljqfnKWi7J0MZQ7jJS6vBacq21Wgybq0CuavmLAvVK6VzpIfqa971bwpafmzTE5iXVVBwGpUM/frvyXQZfuJGR+nSzvN1XZoS71vTV2119HgbBBMmVlRba1YPUwURAsC9fRnuCz8yP4D+37boqpLxDxiiLEQTJx1sSYbXOyWAA8NlFaOOuUUfXiAnRIv9E2itiudYnUTJZpPFK84HD9KbR120Ci8ngILaqTyndU+LH64t2vuMfbe1WOc/D9KcEJ14Gzfh8j9YGbgtTp55t001UoP0i0sE4uXeKO3q0njDGcTrRw5kaYYcrsz/JPGnCXAorzSK0sz2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199018)(478600001)(66476007)(66556008)(8676002)(4326008)(66946007)(6636002)(41300700001)(5660300002)(44832011)(82960400001)(8936002)(26005)(6666004)(6512007)(6506007)(6862004)(316002)(186003)(83380400001)(6486002)(86362001)(38100700002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?asf7q2sIgEXyCvkQl1q75ntQ4dvhw6h5TDaGBPv0+T34AuiWhM5A0VOM5k?=
 =?iso-8859-1?Q?Zd40Z4OcK7yrjvbvvZ5daGCbe2xFZJcNZ5yCZSMn1MdNzdcmecSLCPAQA9?=
 =?iso-8859-1?Q?Ir2u2V34f7I2r9OnAXGXH9f0mw6aT1JjLQ3ZejBrjlvZeQPNPOuP+7uoTq?=
 =?iso-8859-1?Q?tFnrGpGg76bDMpnVjp45qJztxwuqfdx6U/Y76p2129zWUd+i9Aqu9mOi6X?=
 =?iso-8859-1?Q?iTAhooXyMK+KWpEMLMq+IyGkbhyS/rVnRSglZLU+pTvCKzL0en0XG6RrSZ?=
 =?iso-8859-1?Q?UnvPanV66+8OdystrAglCKBCuX7WxVp3eZEM5RP4Jo3QcgoMLTyuinz8HO?=
 =?iso-8859-1?Q?IPJsuceFuvQR5SYEj0ZZT8SDTSSm1etsU9ulXlBfT2QzI85TuTHzl9TB2R?=
 =?iso-8859-1?Q?s7CSr0HbnOTe9gfDkVmJvnXAmG+MbUMZU5flvAZXVEJhzSmws4xVoeNzIs?=
 =?iso-8859-1?Q?oyWm9CUB/cQmgvZjHnvvmvTs+ma4gp2IR58Kk5Djvfir8hcHn4RZxRVzSu?=
 =?iso-8859-1?Q?ASwg0fI3KWfOJXwbA4HBSJtPDoaRjlvWK3ZfGrOl0LohcXSrltKFz9JskF?=
 =?iso-8859-1?Q?63lM5NXT83Hdh77ECWdIZshfMwgYOlZZV+0xLHZlqvcr4sW3cDkgPbVwXV?=
 =?iso-8859-1?Q?v7YjqmYXCkFSXI1ZyUctEBrJFI1Z0n7BzHZfscbGLyAsnh+KtSsAGjMhwV?=
 =?iso-8859-1?Q?Xe6i9IzReBZjYGin2qGkDZc+4lNkRPn14H2EMGu6AV0OARzs6eWG7yOcLA?=
 =?iso-8859-1?Q?83TkkoGJ2HuX8TQuQg1VnQGZtWjpJcju/D09zhmUSg14RoMzRlcvVP9BN7?=
 =?iso-8859-1?Q?uS+FhzR6r/wGW8b9VnZSCbENRzDp1EEhme5eoeg0WiKLwJ+GLbewkGTjEO?=
 =?iso-8859-1?Q?wZxBLpYh5KZZFZua6B8dhbxMxHOsgSMpWSfPQ96LfsKG7H1EfW97wekctA?=
 =?iso-8859-1?Q?fQ2Df+NNEdVKYrkHFftkhIWzVzupuVdkQkr3CnWhjdPkU1R211wnVWu8vi?=
 =?iso-8859-1?Q?dw2P1r7W1OlB9TqihNN5E9xEYT25nxEhm4lo1+meviuReK0UE1AZihgmzg?=
 =?iso-8859-1?Q?WR4bXI7Qn9uMVstAKVoO+Fzm3h4xdjD5iKWkFX1UsiFXapw/LeDHDjMwnq?=
 =?iso-8859-1?Q?8QkZgl4jUjykSnGKbykEgI1kTNoKjat1TgJxLUOQsSWTvDrKOwtov+6scb?=
 =?iso-8859-1?Q?KzqWM1v3xBwEJdxSetJb0MlM/UVIOFjMtZlmUtlU8PewdY0CBKdow50oRu?=
 =?iso-8859-1?Q?sY9MBFoivnCFp/f9TJ6hfPaJ+xgzW43LrlN3xqoT9GZc1J2Ro/Xma+WAIs?=
 =?iso-8859-1?Q?JuvVn+2gA0/eb9maHOelhjkSE3bppoalP28gY/liug/CJcuL7XD55lY8OC?=
 =?iso-8859-1?Q?8tAuofvkmoViw8RaNqwqzGWekrZOWG8lTDn1LOn8v5BALEDv1f0HMaDsgM?=
 =?iso-8859-1?Q?UV9aoG9o6SaBqhkk2DZtJrrHRpHHV5mIs0JWzb3l8ldTtU5wef2iTdJ+nH?=
 =?iso-8859-1?Q?QoQ6c3Gz4YdVoSztKn2rTCPP9/v3db9b6ENVvDC0pMrn4HIJz5WYngrtxA?=
 =?iso-8859-1?Q?okJfiY0+bT5L/fN8oGQsCsFylSDP6lon7Ua6/UYbpe/KjUQkVPblksjyKi?=
 =?iso-8859-1?Q?fFGXK3GGH40D/ItHPb9G+87NjLt2jYCl9OltVtEk8rJoTpIxjAd/EGLg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1827dbe-4f19-42f9-7241-08db2beff537
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 22:43:01.6174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A/9LONVGkAwV/exqrN4eiin6xdVPQ7Mu1DQfGpU6vc7Iyr3GF70Yqw7Ade3CMJBhYKb6mWMUIHFpHYYXs2ki1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7961
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add max engine priority to xe query
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

On Thu, Mar 23, 2023 at 02:13:22PM -0700, José Roberto de Souza wrote:
> Intel Vulkan driver needs to know what is the maximum priority to fill
> a device info struct for applications.
> 
> Right now we getting this information by creating a engine and setting
> priorities from min to high to know what is the maximum priority for
> running process but this leads to info messages to be printed to
> dmesg:
> 
> xe 0000:03:00.0: [drm] Ioctl argument check failed at drivers/gpu/drm/xe/xe_engine.c:178: value == DRM_SCHED_PRIORITY_HIGH && !capable(CAP_SYS_NICE)
> 
> It does not cause any harm but when executing a test suite like
> crucible it causes thousands of those messages to be printed.
> 
> So here adding one more property to drm_xe_query_config to fetch the
> max engine priority.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_engine.c | 10 ++++++++--
>  drivers/gpu/drm/xe/xe_engine.h |  1 +
>  drivers/gpu/drm/xe/xe_query.c  |  3 +++
>  include/uapi/drm/xe_drm.h      |  3 ++-
>  4 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> index a4fc5afdf6883..37209b13bcd6b 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -169,14 +169,20 @@ struct xe_engine *xe_engine_lookup(struct xe_file *xef, u32 id)
>  	return e;
>  }
>  
> +enum drm_sched_priority
> +xe_engine_device_get_max_priority(struct xe_device *xe)
> +{
> +	return capable(CAP_SYS_NICE) ? DRM_SCHED_PRIORITY_HIGH :
> +			               DRM_SCHED_PRIORITY_NORMAL;
> +}
> +
>  static int engine_set_priority(struct xe_device *xe, struct xe_engine *e,
>  			       u64 value, bool create)
>  {
>  	if (XE_IOCTL_ERR(xe, value > DRM_SCHED_PRIORITY_HIGH))
>  		return -EINVAL;
>  
> -	if (XE_IOCTL_ERR(xe, value == DRM_SCHED_PRIORITY_HIGH &&
> -			 !capable(CAP_SYS_NICE)))
> +	if (XE_IOCTL_ERR(xe, value > xe_engine_device_get_max_priority(xe)))
>  		return -EPERM;
>  
>  	return e->ops->set_priority(e, value);
> diff --git a/drivers/gpu/drm/xe/xe_engine.h b/drivers/gpu/drm/xe/xe_engine.h
> index 1cf7f23c4afd6..a49cf2ab405eb 100644
> --- a/drivers/gpu/drm/xe/xe_engine.h
> +++ b/drivers/gpu/drm/xe/xe_engine.h
> @@ -54,5 +54,6 @@ int xe_engine_set_property_ioctl(struct drm_device *dev, void *data,
>  				 struct drm_file *file);
>  int xe_engine_get_property_ioctl(struct drm_device *dev, void *data,
>  				 struct drm_file *file);
> +enum drm_sched_priority xe_engine_device_get_max_priority(struct xe_device *xe);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 0f70945176f60..dd64ff0d2a575 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -12,6 +12,7 @@
>  
>  #include "xe_bo.h"
>  #include "xe_device.h"
> +#include "xe_engine.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
>  #include "xe_guc_hwconfig.h"
> @@ -194,6 +195,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  	config->info[XE_QUERY_CONFIG_GT_COUNT] = xe->info.tile_count;
>  	config->info[XE_QUERY_CONFIG_MEM_REGION_COUNT] =
>  		hweight_long(xe->info.mem_region_mask);
> +	config->info[XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY] =
> +		xe_engine_device_get_max_priority(xe);
>  
>  	if (copy_to_user(query_ptr, config, size)) {
>  		kfree(config);
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 661d7929210c5..b0b80aae3ee88 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -184,7 +184,8 @@ struct drm_xe_query_config {
>  #define XE_QUERY_CONFIG_VA_BITS			3
>  #define XE_QUERY_CONFIG_GT_COUNT		4
>  #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
> -#define XE_QUERY_CONFIG_NUM_PARAM		XE_QUERY_CONFIG_MEM_REGION_COUNT + 1
> +#define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
> +#define XE_QUERY_CONFIG_NUM_PARAM		XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1
>  	__u64 info[];
>  };
>  
> -- 
> 2.40.0
> 
