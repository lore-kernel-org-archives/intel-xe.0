Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A88C54E67
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 22:51:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD9611212F;
	Wed, 27 Mar 2024 22:51:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PDhtcJdh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7238411212F
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 22:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711579915; x=1743115915;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fv2YiHcCnuNiGQB6Ck2o9vPSfAZY0R7hFPIUdog2oLk=;
 b=PDhtcJdh7Y7hkVD2DtcO5Lh8qG7e5M0kWHPoNpbv9jt3zzgOSR6SX67H
 W0cKBADSOTFHbC75Yl4b3TNNjRziq69xZsIcLqITJpSQ1EcmmGFCcsotI
 mBxOh+C4SU9ZCdk2+2VOxTEMbjYe6+NI7KHGWJTCwH4LYsDb+rSxObwF7
 55WE3dmvLX5HCVKuw4Lyug5nKkKjUq1gaI7EAM2OVnvA9WigLUFoRH6nM
 F6uBZO1WyzrKc7FJnFZR+9jIHLNf89FyjuCVN5fXF4VD235Tf3c/P08dk
 zxQXt5IfDSNJwxvdTka4eKbPZlht6pm7thAN8tGrzzxcmj9Y58AbvcblL Q==;
X-CSE-ConnectionGUID: lXTwFosOTzyPC9RRiSE3MQ==
X-CSE-MsgGUID: hK4kNpnbREmwZvRZZCrWKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6572073"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="6572073"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 15:51:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; d="scan'208";a="39575043"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2024 15:51:53 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 15:51:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Mar 2024 15:51:52 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 15:51:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKUi9oN41iV18g4gkCfkBl8+WnnFjuNVPPVHTyyWFcpuG88/QxoBPDK7/KzCwDukE6bmyeyyZ3S5gWhV8RF+3GkZBKSdahohmtbVN+GsTsjqyvD+VSD5GjzAJs+YKqUJff7tk3Qab2E9chQ1QCv1wL49W+TNj2i6FSMthPFf3BgQ6BoJjNJBn+jRymout3QLuQNNyV/97E3U/QBUWuoxm0PLZEI25TxiA5vgTTi/36mrG1EfHcSw6ttXAA/pBi6Kn7ZUNhbL3I4mbsTxgHrKp5xYVN/oARHwz6C7smm4NW7x0+/P2C4Mj2uz4PWXtWypWQcKT1zyTGlt/hgm2lkueg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfJwH3Rmf2N/mWLvTkTBKjamz+83DCmARs8e6FGmXKg=;
 b=Bhw7LLHtV+aOAyJA4tjLPRwXqhSwMNtGvQaWXNZX5x3ZzRmWZBJgUn74xH/f7JOmxAG3KcOy+8F1zNhbMCiqd1sBj+fKKXitZZXFOkG1K7Pthvrk9UPbGKtcx+j3O3EnO6VGTTLq1ZUv1mbbITFQF29W9QA9FC9KdyfkThcpwTEE4jE3NjbqYIUUTbn/JNkFbitzBZ952NmVaW8HgxUbwrrItOThZlhUZpJS2yVjez5WRWebYiemduinf5OauiLXJg07dIcaqh94AbTVewFp/alJ0IpHvCko7hbmrpvV8tt03p4r0jjSyepdXY5iq0gzZo7qBGu2V32I53l/1V2MUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB5134.namprd11.prod.outlook.com (2603:10b6:a03:2de::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 22:51:50 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7409.028; Wed, 27 Mar 2024
 22:51:50 +0000
Date: Wed, 27 Mar 2024 15:51:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe: Separate pure MMIO init from VRAM checkout
Message-ID: <20240327225147.GC1332995@mdroper-desk1.amr.corp.intel.com>
References: <20240327182740.407-1-michal.wajdeczko@intel.com>
 <20240327182740.407-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240327182740.407-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0142.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB5134:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cd9f1ba-3edd-4e3b-bba7-08dc4eb07d40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: buqd76ooapowJYc0PmzqmNSVKt03xfOg4lKNICqX6Rs86UOubeUYYZ24tY+OuZlUdG8xQheqaVNpqP+L1qtPlMVy1mWUPXFHPy69E4cDjqvpqJ2fsfFtQ9pB4Bwr3qioxd/V3UZ2Wh+tU5p8n3ERo7dTBzMyDOzaqeO74U07mCWCw0OQfat9qDLWCNCG8CkaMPKkr1o9XkelSwECi/emo46+FCAZ2IqEobopZnIvswuupr/aFeU/pMRr7Memp1myhr6LB+4qM5kDsLMLZ/oaD6lKk15dxaHlKxGdjyFc84CUOSYqNTRvQE8uzfiQiZsLlUtqpDrPgYFMP9+HqJJ3cKVDnAicFwZvlJt/bEkFBxcU6j28hLUVj765fLXcKjwRL9+qPSgTdCFw7oRUlwosCJJ/p2Of1lch3Vy6y4y+P+x7VVbwOFMdOxCzHA0/tzNNfTcmyTUdXxmlNR4qjNOWEqEdFxAVIRi+mlBC25EWbLjmKREofE5qgr315sBrnbHd1Dvt/S9PDVunWRWKFLsSsffWdLYx0h5+vHaSZNqt7KLYsQicy6QI9oetlgv+OBUHEWrQAt0sxwyiO1TznZ6Xx9C+h4M9F/haxFwhlXA/l/zY9EnQowSgpGASPGiraYVOpecF+9B7t7pJgFkd6G+QjznybddO+AugN3zpbQ0fSEo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WZMMJr2FrGzOd7ddH/5AUMocs4nNJ2PfxnYtpUXAg0c0rDSwbJDaq3A2LDDX?=
 =?us-ascii?Q?WPHtAYiVUFxmjO0Ka6bLDOPxQMBGglJb7PL/xNI7D6OjzJzXwOczCN8NV79M?=
 =?us-ascii?Q?+hycjj8lijSd8zMpSlaffHFEaq9ycdwVmHu+8bzNDe7Mj14jfPBYGpIB3OWb?=
 =?us-ascii?Q?F4LLyBADOowiDeeNe/YQKSiUNIEDiIRIR5QJjxQvYrsbIxAM10FKObSKjmSe?=
 =?us-ascii?Q?Wpt12WNU+xa0SF4jLiiXq2bOfTqf8S812NRqhbEKHJMi4rtjPPBDe0x81+5K?=
 =?us-ascii?Q?l0EguFgiQ/0r5aAJObrwg7DOxsDo4roh+AB9/BrwLnvsCIFUNMYF2t2URT1u?=
 =?us-ascii?Q?dolIB1WTc7hHBKBHOf3kqXLi+O/N09q72ljT+1pjM9xCdcDaYHMsgLDe2Waf?=
 =?us-ascii?Q?Ni7FTVtIQa9eVRJxJMTdoZCk5TnV18/jQcYE5wK8B6xb0YExfBDjVJ3VmQWr?=
 =?us-ascii?Q?RvVery5JiKLBJ26uaBEimJbrZGQ1NxhOEsQpxUl5BA9BngCgfh8QhA8z2ylO?=
 =?us-ascii?Q?uB7TPraxUBy6swjDkb9JrV2uPAQSoiXDR7WA1P/f93y3EPwX6ZipEWfGPYz3?=
 =?us-ascii?Q?nuiW7HQ91xpygNOb/3cS+UGmP1Mu+bhibtJkvGHwT1fnCS/5tDMXOkKQJ6jo?=
 =?us-ascii?Q?m11a0sbaQBF/2uFQgszNd3+RN+NEL2tzBuePTB+J6A6kxa7KS+XQ2wJzXXF0?=
 =?us-ascii?Q?gryjEIyT7fmUP14za7uUCtFEluA54Ga5sl5HgHOf+jPb1KYWGGwBEW/nINLJ?=
 =?us-ascii?Q?FBhj+VUVvPmkQCNTqLenpPz+FZie9hhJvZlkUqwq0ESwGxuBswN8zbgeTZxP?=
 =?us-ascii?Q?/utLPAacOA7nFT2W+IcWp8O3QJW1HyIkRBdSPinKMc9SZVIhkz79netUNtbH?=
 =?us-ascii?Q?yovyA+HobJ7vcqneXaSUxVz6NEWiL9p8aklrxbXO1DLCoohiYDZVK7JkKQDv?=
 =?us-ascii?Q?3NT2788H7/Som8phgPfLMSivcY1eP62UdN4xl63RWJxf3Jlqd0Aul5IhrrZ2?=
 =?us-ascii?Q?zwpDqtDpCaKld56a1hXvidKImrK1cjaXgsxOFKSDj186T/NahfeWZlBGXJZC?=
 =?us-ascii?Q?pQ4rI0szOCJ0U/LqwSGqGX8r0UGQkogXHfhrrHDZ1KZ6YHHP2NFQNXYLqgbY?=
 =?us-ascii?Q?UHP+aAuc88YGiKZknb5PtPaK40FwAitTclrdF8xU/cqvVXASWjZ55w17Zi0j?=
 =?us-ascii?Q?HV5gvCyC/uAaPLhGW90opDLsh56A/ZPee9N1F1cxZVpnX1JHP9aq4GYnAHiO?=
 =?us-ascii?Q?8wuHlCQRuYXphSaXcKF4/NVTkG1AEhUSbhkgPFSK0IQ8r4CnsI82UVew5ze9?=
 =?us-ascii?Q?0X90TUNljl9XS9MbwSxlBibxUaqQFRhb8gs9PN/ITBze6mvTooXGFdlA7iRF?=
 =?us-ascii?Q?zMj850eS7TJbSvikN/7BCkdIb/gHZL4GEXczpyvfAhZlaDLCzLPg8A6OtprP?=
 =?us-ascii?Q?l8MALriZhuUfQz3QDlMoCqSAf+niFFkq6THE3PdyPHgr1VDrRCmy38BMQJPs?=
 =?us-ascii?Q?sAO/aW5zAIFiygd8G++KhL+e8eC/qkUd2fudq1HBX1JyhwY7Uyiszx6sHQM0?=
 =?us-ascii?Q?hRK5xGKAh+S9TvpXCbMnJDnliWvvTylQQ34cqoMDWqu/Dj4mmgPc7hGwBkdL?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd9f1ba-3edd-4e3b-bba7-08dc4eb07d40
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 22:51:50.3523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a4gm1IKV4DmI90ISv0XurYkg2VxyDYDsJskhNH1aYanpHdZcZaAr8d47ZvbhSlt7oADSQ7Ghbv7oWAj9hT2Hg1xrvOhVZc6gY5fB48A0TcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5134
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Mar 27, 2024 at 07:27:38PM +0100, Michal Wajdeczko wrote:
> We can setup root tile registers mapping at the same time as we
> do early mapping of the entire MMIO BAR and keep mandatory VRAM
> checkout as a separate step. This will allow us to perform SR-IOV
> VF mode detection between those two steps using regular MMIO regs
> access functions.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c |  2 +-
>  drivers/gpu/drm/xe/xe_mmio.c   | 59 ++++++++++++++--------------------
>  drivers/gpu/drm/xe/xe_mmio.h   |  2 +-
>  3 files changed, 26 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index b0bfe75eb59f..286ebccc3fc8 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -424,7 +424,7 @@ int xe_device_probe_early(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	err = xe_mmio_root_tile_init(xe);
> +	err = xe_mmio_verify_vram(xe);
>  	if (err)
>  		return err;
>  
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 1de9de4f94b6..5d13fc7cb9d2 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -360,32 +360,9 @@ static void mmio_fini(struct drm_device *drm, void *arg)
>  		iounmap(xe->mem.vram.mapping);
>  }
>  
> -static int xe_verify_lmem_ready(struct xe_device *xe)
> -{
> -	struct xe_gt *gt = xe_root_mmio_gt(xe);
> -
> -	if (!IS_DGFX(xe))
> -		return 0;
> -
> -	if (IS_SRIOV_VF(xe))
> -		return 0;
> -
> -	/*
> -	 * The boot firmware initializes local memory and assesses its health.
> -	 * If memory training fails, the punit will have been instructed to
> -	 * keep the GT powered down; we won't be able to communicate with it
> -	 * and we should not continue with driver initialization.
> -	 */
> -	if (!(xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT)) {
> -		drm_err(&xe->drm, "VRAM not initialized by firmware\n");
> -		return -ENODEV;
> -	}
> -
> -	return 0;
> -}
> -
>  int xe_mmio_init(struct xe_device *xe)
>  {
> +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	const int mmio_bar = 0;
>  
> @@ -401,21 +378,33 @@ int xe_mmio_init(struct xe_device *xe)
>  		return -EIO;
>  	}
>  
> -	return drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
> -}
> -
> -int xe_mmio_root_tile_init(struct xe_device *xe)
> -{
> -	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> -	int err;
> -
>  	/* Setup first tile; other tiles (if present) will be setup later. */
>  	root_tile->mmio.size = SZ_16M;
>  	root_tile->mmio.regs = xe->mmio.regs;
>  
> -	err = xe_verify_lmem_ready(xe);
> -	if (err)
> -		return err;
> +	return drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
> +}
> +
> +int xe_mmio_verify_vram(struct xe_device *xe)
> +{
> +	struct xe_gt *gt = xe_root_mmio_gt(xe);
> +
> +	if (!IS_DGFX(xe))
> +		return 0;
> +
> +	if (IS_SRIOV_VF(xe))
> +		return 0;
> +
> +	/*
> +	 * The boot firmware initializes local memory and assesses its health.
> +	 * If memory training fails, the punit will have been instructed to
> +	 * keep the GT powered down; we won't be able to communicate with it
> +	 * and we should not continue with driver initialization.
> +	 */
> +	if (!(xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT)) {
> +		drm_err(&xe->drm, "VRAM not initialized by firmware\n");
> +		return -ENODEV;
> +	}
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index 67ead99f321b..b1680c4a14fb 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -21,7 +21,7 @@ struct xe_device;
>  #define LMEM_BAR		2
>  
>  int xe_mmio_init(struct xe_device *xe);
> -int xe_mmio_root_tile_init(struct xe_device *xe);
> +int xe_mmio_verify_vram(struct xe_device *xe);
>  void xe_mmio_probe_tiles(struct xe_device *xe);
>  
>  u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg);
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
