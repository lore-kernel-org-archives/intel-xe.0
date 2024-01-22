Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B89C46CD2
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 22:14:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8904610F065;
	Mon, 22 Jan 2024 22:14:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2FA10F065
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 22:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705961657; x=1737497657;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=skg2obMNKHhMja6wysJSYhA4Lg1ecsJyEUARbjQZgSI=;
 b=gf7enCuh5mXSaAXn13023Ttu3fSagGUwFItkOhEpKgCfzrOjJ+yVXN4H
 gXzDwC6L4x4n8S+LfwVvv9iuFywc5b1lkf21jdbr5hU9x7hFYrw6AbHek
 LCqvQAQP2VMNDmzt9TawjJaGkg/wzSt9COyGTkXIe9WRFa6xfIY+PE30P
 1dH1Nqr9HbJoVdGSFzHLNEAZvoGhwSi54OzObv8ePSQfkbvcR9Ngy7qsL
 1gn7BNUUqx427Kf3rDdtpDhDAfWzhHUdgjjIfCMq/pOaCabR8EwjBnVHd
 6VFQZvYI2ejmibeJgDzMAXGbfQ92ThDJT0t/7OCFIUKWRoMWHe7SGXovp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="465600856"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="465600856"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 14:14:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="1449217"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 14:14:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 14:14:15 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 14:14:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 14:14:14 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 14:14:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FqYHzTmpA6fA4RwszZrmUfy+2tnsUfnOLgkxBqkCRsIG40Fxi+tXnqXp1PUTTai2rt3gUcGk+Vh65tSbIW5GTTrwiz/CTkCxvd/El+9p7bOmtxpjyRuhYGe7xWkyqV9IpSapsdG1WooJpZjPOvNGl+TRIRTzv910Z4xvGtCNnA6Wt8Pz7wYSBklbtG7dPg/8jbCaXCGLx8B02H4WXse+vdNCc/3Y3j51WPzJnBeq9GOO+w2M+sXA/l8lTE/nVoWNk7SPBqygDUOv6ovNg7hPHB6VvKX+VbbY9OJInuJiPK5QIveQM26imyH9RxHn8qYhkZo+c8qPDK8t6HVTbEUjRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MycAcbY1l2QCuRv8VA4McjTsHIAn454hFzZvruRrpmU=;
 b=JW9xZzObb/2FfWOt9EUULYs2Au8n+obwlN/Ev1E/1F783LeCQTVVxCJTXCobmcjw90ySvuqjaL/NiQ6ae05PqwJmRmAtgC5/nmKVTVhQcrAYNzT8hPeeq0C+EhN4VTJ29zwmN+ViAn1XiAStRH7uAXniYBGhxTEjJc3MRis/lcAzSiuGNSPjMtaY+itDzQNity8HXyY2dxhPhtpKK+5QCdrHkr4kcLoycoeMQFKjR/0C4LJ5GqT5jQvgw0e3BbffBfPKu7MpKheBi8LxCORCaMrsWfFOOA0u8yDo6gjBLyWQE29VoC0NDNE+gQYWgxPbQJlq6nyOLAFm4soYzGpyKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB8375.namprd11.prod.outlook.com (2603:10b6:806:38b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 22:14:12 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 22:14:12 +0000
Date: Mon, 22 Jan 2024 14:14:09 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: Re: [PATCH v3 3/9] drm/xe/guc: Update GuC ADS size for error capture
Message-ID: <20240122221409.GD7083@mdroper-desk1.amr.corp.intel.com>
References: <20240119004203.393262-1-zhanjun.dong@intel.com>
 <20240119004203.393262-4-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240119004203.393262-4-zhanjun.dong@intel.com>
X-ClientProxiedBy: SJ0PR13CA0191.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::16) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB8375:EE_
X-MS-Office365-Filtering-Correlation-Id: 8df1d2f6-11a0-4946-b2de-08dc1b977645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fMmj+GIuZ/noy1jVdA6aaUI7vOYi29FKmoILZU+pSLrtwIyardU46nVTEh/pvpF3E+5fQXPiMJD+DmONj6OcJOy+VsegXwsMa0I7ogwmqBc/AFTznjmDrG2p6AUcm/wmBlhH3cNEi4zkBQDicnTXqpjS5srJoaObp1R0HZ4UqMyahOJ2OMXd50GUAI0VlpJeG4mDwgE4h8ABPw3moV4GHSFWJqOg5tWUVfWhPx8ynnqWmao0grErIq+gDF336ORKx+Y1vdUFrdYINa3ntp4Mh+vPy1HIobP+D9Y971OsUuOxap5aPF8E8os/8ze/xv+zT9bxCJ+nEq20LDOSjLjBnnFfuiHEgdiOUYcIWSNj+UJOj1dxB6noIAd03Ux7b9KBk1XduAz/U1kM+sDoG7DAwUWcf1VAZXocI8rypczqavj1wqWVX4WQ279kJTQaI4V4IvU8QjFWo8zA3o/WOfAxJA7JpVz0tka5vFNntgpY2gEy1O5U2xv946PzEwAInUG5lolRoiYlavDdGSY/DT8vNMwGuJnVNgxMLGW8pJbmHwr5EUCZUpQbePivE8q/GL+1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(376002)(136003)(396003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(38100700002)(6862004)(4326008)(1076003)(8676002)(2906002)(33656002)(15650500001)(26005)(30864003)(8936002)(6636002)(82960400001)(66946007)(316002)(5660300002)(478600001)(6486002)(66556008)(66476007)(83380400001)(6666004)(86362001)(6512007)(41300700001)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?R9GOikmcUW+Rgpv/jqZr19UlS4sPaFxEyAK5O9a+ceJ+LaHIuve43WiwwO?=
 =?iso-8859-1?Q?/ESJxVJiE3HJbNnYLxPLrCnRKuhms4WlFPf3GLfxvyzt9IMtWN0+pFeneo?=
 =?iso-8859-1?Q?4LGquRT6z801fyESEN8pPYIJJGSuuhv4cEyV7KWYdhk4f3h5afFk4t+6Mb?=
 =?iso-8859-1?Q?Y3IbiETOu73pEyCC6Avy4qB/Fiiyl1Zc22zplpap9DJ1V1mqBNSyNwtzUS?=
 =?iso-8859-1?Q?3F6VIXutzyVGjRoUEiFcTQEYLGfz5G/P9lbzw2RLnQAKfTa5pe1zqUwtQF?=
 =?iso-8859-1?Q?01WTzNmDIE7bZQebhJAhe1u2M/Bkwd77+c8GER2qmFBGse8f7mr9EcmWQ0?=
 =?iso-8859-1?Q?PR6VNrCWu+p1/pEDa40fqyZN7S4nO7JAJFYSVGiyRAIL/n56M638l8ZWfy?=
 =?iso-8859-1?Q?j7T+Zc9lmIRBSSnHFaWLv/qjkAvehrrBV7FtbouzGym2rTCiiDNJ7GrY43?=
 =?iso-8859-1?Q?+EBe/WuiuVSecnEsQxYxjN5HofIfKecK7r8tJue2yfvLXXGka3oqV/Qqtg?=
 =?iso-8859-1?Q?VtqimBKvI+XFDcpbXDf7zIPFbZTLTNWKulHXtKcq/h6xPiCxpJ5L+K0KUZ?=
 =?iso-8859-1?Q?7aT6AY18boU//ZF5AR7sDM15VH5WNyAQ5XFyIMfCx8LclBD0oHJfkFB0cJ?=
 =?iso-8859-1?Q?GJrWYWDzLOsmlI5ePbJgpWkz9kIxVyt8d51tQ/aUlSHiaCS6eHsBm9MtPz?=
 =?iso-8859-1?Q?+Pvorrz83+sX+pJZTZsXfgDBIYW5u+RKcEKi29Zfo62+NfHkuTUV6HBm5r?=
 =?iso-8859-1?Q?Xo8NiXZk1AMU/mpOzmQ/fpdzBDtI5l43PiPliDqAOmcp9bu0aDhzTxdbCY?=
 =?iso-8859-1?Q?EHgX0ZWU5cbhn5ejCoaZxADP0/cMy1ivZrSZFTLtU97zpRmN7hM0Wb+g/d?=
 =?iso-8859-1?Q?ACptMCsuJlpMox7DzT1YZWHmm8NuyHYHT98ZZGE2NqnJj1x0SKqpuPXkbd?=
 =?iso-8859-1?Q?9j4gWBZF3+HZSQIh0865pqls7zw0M3f6bYrCqxHQZfZVCNs1m55FT7yqhj?=
 =?iso-8859-1?Q?jx49IkVbbFTb07fzgt/MmLyIZQXcDYce/8E30cy+VWi4PbgGlnwoUTVD0F?=
 =?iso-8859-1?Q?7YMesoA/ALD6isWQYmT2rHy02vOgFpejAMB+7Bq0eps19/hIc4uiZ9BX5a?=
 =?iso-8859-1?Q?ZAH7tBT2qNBTeALixVXR/mi9yQ6Hc0g2gSyjPtkWbjVoB/GZQtgkrPA202?=
 =?iso-8859-1?Q?dBr8xVIcq6tAboBBJLlDwcKbdx0AvzKWixF9f/jvzzY5qrswZvOFkWZDGa?=
 =?iso-8859-1?Q?tvr06wseanrYY2m/xA5nZh/hIGkhnNsPjaqhbjm8cEO7Ii/0SvzgP6ebu6?=
 =?iso-8859-1?Q?6EL8s4mezx4fJmJZckXPn0e+79VkqhPJK2Qzut2JCdwCF7rzHst05oJ4H/?=
 =?iso-8859-1?Q?tW9oV7x+FDr2Yx7haxo4l/SBOT2ErgLXf7TVw1xs0nT+C0A9wsVrjmjAy6?=
 =?iso-8859-1?Q?uM9eeZcxSCU2YpF/C0ZBtT0V8w1cBk7f5ApRMGZZb5rbQJJU45ZR3AAgTJ?=
 =?iso-8859-1?Q?R57cnSEqyR2HH3L+pmNj+MlwQe+8sP+LuC7yeksd/Ufh0EItv8vbYtaZGO?=
 =?iso-8859-1?Q?AXWK+IAkJJYH/8o/pFBFSJHdKe6LyQz5ADwtvtq1ZxxRFG1E5rWdY3AgfI?=
 =?iso-8859-1?Q?SWK+K6aT2OG13biMiIlPovAanhs5Ts5MtyGv5t3XNr7g3GxTMAoAmRzA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df1d2f6-11a0-4946-b2de-08dc1b977645
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 22:14:11.9933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RkrNXqx98b5/uh3MvLip/cM9P8GoXMRJMMDCzhWTVRgCiaLsAW2zRDNEo19MBjvdMo54TlBJhDvuNRJ6gRi+iEh8ji794x3n/CvUgagOMDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8375
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

On Thu, Jan 18, 2024 at 04:41:57PM -0800, Zhanjun Dong wrote:
> Update GuC ADS size allocation to include space for
> the lists of error state capture register descriptors.
> 
> Then, populate GuC ADS with the lists of registers we want
> GuC to report back to host on engine reset events. This list
> should include global, engine-class and engine-instance
> registers for every engine-class type on the current hardware.
> 
> Ensure we allocate a persistent store for the register lists
> that are populated into ADS so that we don't need to allocate
> memory during GT resets when GuC is reloaded and ADS population
> happens again.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ads.c          | 222 ++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_guc_ads_types.h    |   2 +
>  drivers/gpu/drm/xe/xe_guc_capture.c      | 265 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_capture.h      |   5 +
>  drivers/gpu/drm/xe/xe_guc_capture_fwif.h | 177 +++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_fwif.h         |  20 ++
>  drivers/gpu/drm/xe/xe_guc_types.h        |   2 +
>  7 files changed, 683 insertions(+), 10 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_fwif.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 390e6f1bf4e1..fd25052ae71a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -14,6 +14,8 @@
>  #include "xe_gt.h"
>  #include "xe_gt_ccs_mode.h"
>  #include "xe_guc.h"
> +#include "xe_guc_capture.h"
> +#include "xe_guc_capture_fwif.h"
>  #include "xe_hw_engine.h"
>  #include "xe_lrc.h"
>  #include "xe_map.h"
> @@ -117,6 +119,8 @@ struct __guc_ads_blob {
>  #define info_map_read(xe_, map_, field_) \
>  	xe_map_rd_field(xe_, map_, 0, struct guc_gt_system_info, field_)
>  
> +static int guc_capture_prep_lists(struct xe_guc_ads *ads);
> +
>  static size_t guc_ads_regset_size(struct xe_guc_ads *ads)
>  {
>  	struct xe_device *xe = ads_to_xe(ads);
> @@ -133,8 +137,7 @@ static size_t guc_ads_golden_lrc_size(struct xe_guc_ads *ads)
>  
>  static size_t guc_ads_capture_size(struct xe_guc_ads *ads)
>  {
> -	/* FIXME: Allocate a proper capture list */
> -	return PAGE_ALIGN(PAGE_SIZE);
> +	return PAGE_ALIGN(ads->capture_size);
>  }
>  
>  static size_t guc_ads_um_queues_size(struct xe_guc_ads *ads)
> @@ -260,6 +263,41 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
>  	return total_size;
>  }
>  
> +static size_t calculate_capture_worst_size(struct xe_guc_ads *ads)
> +{
> +#if IS_ENABLED(CONFIG_DRM_XE_CAPTURE_ERROR)
> +	struct xe_guc *guc = ads_to_guc(ads);
> +	size_t total_size, class_size, instance_size, global_size;
> +	int i, j;
> +
> +	/* Early calcuate the capture size, to reserve capture size before guc init finished,
> +	 * as engine mask is not ready, the calculate here is the worst case size
> +	 */
> +	total_size = PAGE_SIZE;	/* Pad a page in front for empty lists */
> +	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; i++) {
> +		for (j = 0; j < GUC_MAX_ENGINE_CLASSES; j++) {
> +			class_size = 0;
> +			instance_size = 0;
> +			xe_guc_capture_getlistsize(guc, i, GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
> +						   j, &class_size);
> +			xe_guc_capture_getlistsize(guc, i, GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
> +						   j, &instance_size);
> +			total_size += class_size + instance_size;
> +		}
> +		global_size = 0;
> +		xe_guc_capture_getlistsize(guc, i, GUC_CAPTURE_LIST_TYPE_GLOBAL, 0, &global_size);
> +		total_size += PAGE_ALIGN(global_size);
> +	}
> +
> +	return total_size;
> +
> +#else	/* IS_ENABLED(CONFIG_DRM_XE_CAPTURE_ERROR) */
> +
> +	return 0;
> +
> +#endif	/* IS_ENABLED(CONFIG_DRM_XE_CAPTURE_ERROR) */
> +}
> +
>  #define MAX_GOLDEN_LRC_SIZE	(SZ_4K * 64)
>  
>  int xe_guc_ads_init(struct xe_guc_ads *ads)
> @@ -270,6 +308,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>  	struct xe_bo *bo;
>  
>  	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
> +	ads->capture_size = calculate_capture_worst_size(ads);
>  	ads->regset_size = calculate_regset_size(gt);
>  
>  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
> @@ -301,9 +340,11 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
>  	xe_gt_assert(gt, ads->bo);
>  
>  	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
> +	ads->capture_size = 0; /* Clear capture_size before run guc_capture_prep_lists */
> +	ads->capture_size = guc_capture_prep_lists(ads);
>  	ads->regset_size = calculate_regset_size(gt);
>  
> -	xe_gt_assert(gt, ads->golden_lrc_size +
> +	xe_gt_assert(gt, ads->golden_lrc_size + ads->capture_size +
>  		     (ads->regset_size - prev_regset_size) <=
>  		     MAX_GOLDEN_LRC_SIZE);
>  
> @@ -393,22 +434,183 @@ static void guc_mapping_table_init(struct xe_gt *gt,
>  	}
>  }
>  
> -static void guc_capture_list_init(struct xe_guc_ads *ads)
> +#if IS_ENABLED(CONFIG_DRM_XE_CAPTURE_ERROR)
> +static u32 guc_get_capture_engine_mask(struct xe_gt *gt, struct iosys_map *info_map,
> +				       u32 capture_class)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 mask;
> +
> +	switch (capture_class) {
> +	case GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE:
> +		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_RENDER_CLASS]);
> +		mask |= info_map_read(xe, info_map, engine_enabled_masks[GUC_COMPUTE_CLASS]);
> +		break;
> +
> +	case GUC_CAPTURE_LIST_CLASS_VIDEO:
> +		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_VIDEO_CLASS]);
> +		break;
> +
> +	case GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE:
> +		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_VIDEOENHANCE_CLASS]);
> +		break;
> +
> +	case GUC_CAPTURE_LIST_CLASS_BLITTER:
> +		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_BLITTER_CLASS]);
> +		break;
> +
> +	case GUC_CAPTURE_LIST_CLASS_GSC_OTHER:
> +		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_GSC_OTHER_CLASS]);
> +		break;
> +
> +	default:
> +		mask = 0;
> +	}
> +
> +	return mask;
> +}
> +
> +static int guc_capture_prep_lists(struct xe_guc_ads *ads)
> +{
> +	struct xe_guc *guc = ads_to_guc(ads);
> +	struct xe_gt *gt = ads_to_gt(ads);
> +	u32 ads_ggtt, capture_offset, null_ggtt, total_size = 0;
> +	struct iosys_map info_map;
> +	bool ads_is_mapped;
> +	size_t size = 0;
> +	void *ptr;
>  	int i, j;
> -	u32 addr = xe_bo_ggtt_addr(ads->bo) + guc_ads_capture_offset(ads);
>  
> -	/* FIXME: Populate a proper capture list */
> +	ads_is_mapped = ads->capture_size != 0;
> +	if (ads_is_mapped) {
> +		capture_offset = guc_ads_capture_offset(ads);
> +		ads_ggtt =  xe_bo_ggtt_addr(ads->bo);
> +		info_map =  IOSYS_MAP_INIT_OFFSET(ads_to_map(ads),
> +						  offsetof(struct __guc_ads_blob, system_info));
> +	} else {
> +		/* Bail with worst case size calculations */
> +		total_size = calculate_capture_worst_size(ads);
> +		return total_size;
> +	}
> +
> +	/* first, set aside the first page for a capture_list with zero descriptors */
> +	total_size = PAGE_SIZE;
> +	if (!xe_guc_capture_getnullheader(guc, &ptr, &size))
> +		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset, ptr, size);
> +
> +	null_ggtt = ads_ggtt + capture_offset;
> +	capture_offset += PAGE_SIZE;
> +
> +	/* Populate capture list : at this point adps is already allocated and mapped to worst case
> +	 * size
> +	 */
>  	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; i++) {
> +		bool write_empty_list;
>  		for (j = 0; j < GUC_MAX_ENGINE_CLASSES; j++) {
> -			ads_blob_write(ads, ads.capture_instance[i][j], addr);
> -			ads_blob_write(ads, ads.capture_class[i][j], addr);
> +			u32 engine_mask = guc_get_capture_engine_mask(gt, &info_map, j);
> +			/* null list if we dont have said engine or list */
> +			if (!engine_mask) {
> +				ads_blob_write(ads, ads.capture_class[i][j], null_ggtt);
> +				ads_blob_write(ads, ads.capture_instance[i][j], null_ggtt);
> +				continue;
> +			}
> +			/********************************************************/
> +			/*** engine exists: start with engine-class registers ***/
> +			/********************************************************/
> +			write_empty_list = true; /* starting assumption is an empty list */
> +			size = 0;
> +			if (!xe_guc_capture_getlistsize(guc, i,
> +							GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
> +							j, &size)) {
> +				if (total_size + size > ads->capture_size)
> +					xe_gt_dbg(gt, "Capture size overflow :%lu vs %d\n",
> +						  total_size + size, ads->capture_size);
> +				else if (!xe_guc_capture_getlist(guc, i,
> +								 GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
> +								 j, &ptr))
> +					/* everything checked out, populate! */
> +					write_empty_list = false;
> +			}
> +			if (!write_empty_list) {
> +				ads_blob_write(ads, ads.capture_class[i][j],
> +					       ads_ggtt + capture_offset);
> +				xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset,
> +						 ptr, size);
> +				total_size += size;
> +				capture_offset += size;
> +			} else {
> +				ads_blob_write(ads, ads.capture_class[i][j], null_ggtt);
> +			}
> +
> +			/********************************************************/
> +			/*** engine exists: next, engine-instance registers   ***/
> +			/********************************************************/
> +			write_empty_list = true; /* starting assumption is an empty list */
> +			size = 0;
> +			if (!xe_guc_capture_getlistsize(guc, i,
> +							GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
> +							j, &size)) {
> +				if (total_size + size > ads->capture_size)
> +					xe_gt_dbg(gt, "Capture size overflow :%lu vs %d\n",
> +						  total_size + size, ads->capture_size);
> +				else if (!xe_guc_capture_getlist(guc, i,
> +								 GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
> +								 j, &ptr))
> +					/* everything checked out, populate! */
> +					write_empty_list = false;
> +			}
> +
> +			if (!write_empty_list) {
> +				ads_blob_write(ads, ads.capture_instance[i][j],
> +					       ads_ggtt + capture_offset);
> +				xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset,
> +						 ptr, size);
> +				total_size += size;
> +				capture_offset += size;
> +			} else {
> +				ads_blob_write(ads, ads.capture_instance[i][j], null_ggtt);
> +			}
>  		}
>  
> -		ads_blob_write(ads, ads.capture_global[i], addr);
> +		/********************************************************/
> +		/*** global registers is last in our PF/VF loops      ***/
> +		/********************************************************/
> +		write_empty_list = true; /* starting assumption is an empty list */
> +		size = 0;
> +		if (!xe_guc_capture_getlistsize(guc, i, GUC_CAPTURE_LIST_TYPE_GLOBAL, 0, &size)) {
> +			if (total_size + size > ads->capture_size)
> +				xe_gt_dbg(gt, "Capture size overflow :%lu vs %d\n",
> +					  total_size + size, ads->capture_size);
> +			else if (!xe_guc_capture_getlist(guc, i, GUC_CAPTURE_LIST_TYPE_GLOBAL, 0,
> +							 &ptr))
> +				write_empty_list = false; /* everything checked out, populate! */
> +		}
> +		if (!write_empty_list) {
> +			ads_blob_write(ads, ads.capture_global[i], ads_ggtt + capture_offset);
> +			xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset, ptr,
> +					 size);
> +			total_size += size;
> +			capture_offset += size;
> +		} else {
> +			ads_blob_write(ads, ads.capture_global[i], null_ggtt);
> +		}
>  	}
> +
> +	if (ads->capture_size != PAGE_ALIGN(total_size))
> +		xe_gt_info(gt, "ADS capture alloc size changed from %d to %d\n",
> +			   ads->capture_size, PAGE_ALIGN(total_size));
> +	return PAGE_ALIGN(total_size);
> +}
> +
> +#else	/* IS_ENABLED(CONFIG_DRM_XE_CAPTURE_ERROR) */
> +
> +static int guc_capture_prep_lists(struct xe_guc_ads *ads)
> +{
> +	return 0;
>  }
>  
> +#endif	/* IS_ENABLED(CONFIG_DRM_XE_CAPTURE_ERROR) */
> +
>  static void guc_mmio_regset_write_one(struct xe_guc_ads *ads,
>  				      struct iosys_map *regset_map,
>  				      struct xe_reg reg,
> @@ -595,7 +797,7 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
>  	guc_mmio_reg_state_init(ads);
>  	guc_prep_golden_lrc_null(ads);
>  	guc_mapping_table_init(gt, &info_map);
> -	guc_capture_list_init(ads);
> +	guc_capture_prep_lists(ads);
>  	guc_doorbell_init(ads);
>  
>  	if (xe->info.has_usm) {
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads_types.h b/drivers/gpu/drm/xe/xe_guc_ads_types.h
> index 4afe44bece4b..82cf569b0710 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ads_types.h
> @@ -20,6 +20,8 @@ struct xe_guc_ads {
>  	size_t golden_lrc_size;
>  	/** @regset_size: size of register set passed to GuC for save/restore */
>  	u32 regset_size;
> +	/** @capture_size: size of register set passed to GuC for capture */
> +	u32 capture_size;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 2e1ed5bbdd56..088dad7e53d8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -21,6 +21,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_guc.h"
>  #include "xe_guc_capture.h"
> +#include "xe_guc_capture_fwif.h"
>  #include "xe_guc_ct.h"
>  
>  #include "xe_guc_log.h"
> @@ -93,6 +94,28 @@
>  	{ SFC_DONE(2),		    0,      0, "SFC_DONE[2]" }, \
>  	{ SFC_DONE(3),		    0,      0, "SFC_DONE[3]" }
>  
> +static const char * const capture_list_type_names[] = {
> +	"Global",
> +	"Class",
> +	"Instance",
> +	"unknown",	/* Default name, if out of bound */
> +};
> +
> +static const char * const capture_engine_class_names[] = {
> +	"Render/Compute",
> +	"Video",
> +	"VideoEnhance",
> +	"Blitter",
> +	"GSC-Other",
> +	"unknown",	/* Default name, if out of bound */
> +};
> +
> +/* Get item from array by index.
> + * The last item is the default value, referenced for index out of bound condition.
> + */
> +#define get_item_with_default(ar, index) (ar[(index) >= ARRAY_SIZE(ar) ? ARRAY_SIZE(ar) -  1 : \
> +									 (index)])
> +
>  static void xe_gt_mcr_get_ss_steering(struct xe_gt *gt, unsigned int dss,
>  				      unsigned int *group, unsigned int *instance)
>  {
> @@ -122,8 +145,250 @@ static bool xe_sseu_has_subslice(struct xe_gt *gt, int slice, int subslice)
>  	     ss_++, xe_gt_mcr_get_ss_steering(gt_, ss_, &group_, &instance_)) \
>  		for_each_if(_HAS_SS(ss_, gt_, group_, instance_))
>  
> +static const struct __guc_mmio_reg_descr_group *
> +guc_capture_get_one_list(const struct __guc_mmio_reg_descr_group *reglists,
> +			 u32 owner, u32 type, u32 id)
> +{
> +	int i;
> +
> +	if (!reglists)
> +		return NULL;
> +
> +	for (i = 0; reglists[i].list; ++i) {
> +		if (reglists[i].owner == owner && reglists[i].type == type &&
> +		    (reglists[i].engine == id || reglists[i].type == GUC_CAPTURE_LIST_TYPE_GLOBAL))
> +			return &reglists[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +static struct __guc_mmio_reg_descr_group *
> +guc_capture_get_one_ext_list(struct __guc_mmio_reg_descr_group *reglists,
> +			     u32 owner, u32 type, u32 id)
> +{
> +	int i;
> +
> +	if (!reglists)
> +		return NULL;
> +
> +	for (i = 0; reglists[i].extlist; ++i) {
> +		if (reglists[i].owner == owner && reglists[i].type == type &&
> +		    (reglists[i].engine == id || reglists[i].type == GUC_CAPTURE_LIST_TYPE_GLOBAL))
> +			return &reglists[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +static const struct __guc_mmio_reg_descr_group *
> +guc_capture_get_device_reglist(struct xe_guc *guc)
> +{
> +	//FIXME: add register list
> +	return NULL;
> +}
> +
> +static int
> +guc_capture_list_init(struct xe_guc *guc, u32 owner, u32 type, u32 classid,
> +		      struct guc_mmio_reg *ptr, u16 num_entries)
> +{
> +	u32 i = 0, j = 0;
> +	const struct __guc_mmio_reg_descr_group *reglists = guc->capture->reglists;
> +	struct __guc_mmio_reg_descr_group *extlists = guc->capture->extlists;
> +	const struct __guc_mmio_reg_descr_group *match;
> +	struct __guc_mmio_reg_descr_group *matchext;
> +
> +	if (!reglists)
> +		return -ENODEV;
> +
> +	match = guc_capture_get_one_list(reglists, owner, type, classid);
> +	if (!match)
> +		return -ENODATA;
> +
> +	for (i = 0; i < num_entries && i < match->num_regs; ++i) {
> +		ptr[i].offset = match->list[i].reg.addr;
> +		ptr[i].value = 0xDEADF00D;
> +		ptr[i].flags = match->list[i].flags;
> +		ptr[i].mask = match->list[i].mask;
> +	}
> +
> +	matchext = guc_capture_get_one_ext_list(extlists, owner, type, classid);
> +	if (matchext) {
> +		for (i = match->num_regs, j = 0; i < num_entries &&
> +		     i < (match->num_regs + matchext->num_regs) &&
> +			j < matchext->num_regs; ++i, ++j) {
> +			ptr[i].offset = matchext->extlist[j].reg.addr;
> +			ptr[i].value = 0xDEADF00D;
> +			ptr[i].flags = matchext->extlist[j].flags;
> +			ptr[i].mask = matchext->extlist[j].mask;
> +		}
> +	}
> +	if (i < num_entries)
> +		xe_gt_dbg(guc_to_gt(guc), "Got short capture reglist init: %d out %d.\n", i,
> +			  num_entries);
> +
> +	return 0;
> +}
> +
> +static int
> +guc_cap_list_num_regs(struct xe_guc_state_capture *gc, u32 owner, u32 type, u32 classid)
> +{
> +	const struct __guc_mmio_reg_descr_group *match;
> +	struct __guc_mmio_reg_descr_group *matchext;
> +	int num_regs;
> +
> +	match = guc_capture_get_one_list(gc->reglists, owner, type, classid);
> +	if (!match)
> +		return 0;
> +
> +	num_regs = match->num_regs;
> +
> +	matchext = guc_capture_get_one_ext_list(gc->extlists, owner, type, classid);
> +	if (matchext)
> +		num_regs += matchext->num_regs;
> +
> +	return num_regs;
> +}
> +
> +static int
> +guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type, u32 classid,
> +			size_t *size, bool is_purpose_est)
> +{
> +	struct xe_guc_state_capture *gc = guc->capture;
> +	struct __guc_capture_ads_cache *cache = &gc->ads_cache[owner][type][classid];
> +	int num_regs;
> +
> +	if (!gc->reglists) {
> +		xe_gt_warn(guc_to_gt(guc), "No capture reglist for this device\n");
> +		return -ENODEV;
> +	}
> +
> +	if (cache->is_valid) {
> +		*size = cache->size;
> +		return cache->status;
> +	}
> +
> +	if (!is_purpose_est && owner == GUC_CAPTURE_LIST_INDEX_PF &&
> +	    !guc_capture_get_one_list(gc->reglists, owner, type, classid)) {
> +		if (type == GUC_CAPTURE_LIST_TYPE_GLOBAL)
> +			xe_gt_warn(guc_to_gt(guc), "Missing capture reglist: global!\n");
> +		else
> +			xe_gt_warn(guc_to_gt(guc), "Missing capture reglist: %s(%u):%s(%u)!\n",
> +				   get_item_with_default(capture_list_type_names, type), type,
> +				   get_item_with_default(capture_engine_class_names, classid),
> +				   classid);
> +		return -ENODEV;
> +	}
> +
> +	num_regs = guc_cap_list_num_regs(gc, owner, type, classid);
> +	/* intentional empty lists can exist depending on hw config */
> +	if (!num_regs)
> +		return -ENODATA;
> +
> +	if (size)
> +		*size = PAGE_ALIGN((sizeof(struct guc_debug_capture_list)) +
> +				   (num_regs * sizeof(struct guc_mmio_reg)));

For MCR regs, don't you need several independent entries in the list to
do unicast reads of each group/instance?


Matt

> +
> +	return 0;
> +}
> +
> +int
> +xe_guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type, u32 classid, size_t *size)
> +{
> +	return guc_capture_getlistsize(guc, owner, type, classid, size, false);
> +}
> +
> +int
> +xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid, void **outptr)
> +{
> +	struct xe_guc_state_capture *gc = guc->capture;
> +	struct __guc_capture_ads_cache *cache = &gc->ads_cache[owner][type][classid];
> +	struct guc_debug_capture_list *listnode;
> +	int ret, num_regs;
> +	u8 *caplist, *tmp;
> +	size_t size = 0;
> +
> +	if (!gc->reglists)
> +		return -ENODEV;
> +
> +	if (cache->is_valid) {
> +		*outptr = cache->ptr;
> +		return cache->status;
> +	}
> +
> +	ret = xe_guc_capture_getlistsize(guc, owner, type, classid, &size);
> +	if (ret) {
> +		cache->is_valid = true;
> +		cache->ptr = NULL;
> +		cache->size = 0;
> +		cache->status = ret;
> +		return ret;
> +	}
> +
> +	caplist = kzalloc(size, GFP_KERNEL);
> +	if (!caplist) {
> +		xe_gt_dbg(guc_to_gt(guc), "Failed to alloc cached register capture list");
> +		return -ENOMEM;
> +	}
> +
> +	/* populate capture list header */
> +	tmp = caplist;
> +	num_regs = guc_cap_list_num_regs(guc->capture, owner, type, classid);
> +	listnode = (struct guc_debug_capture_list *)tmp;
> +	listnode->header.info = FIELD_PREP(GUC_CAPTURELISTHDR_NUMDESCR, (u32)num_regs);
> +
> +	/* populate list of register descriptor */
> +	tmp += sizeof(struct guc_debug_capture_list);
> +	guc_capture_list_init(guc, owner, type, classid, (struct guc_mmio_reg *)tmp, num_regs);
> +
> +	/* cache this list */
> +	cache->is_valid = true;
> +	cache->ptr = caplist;
> +	cache->size = size;
> +	cache->status = 0;
> +
> +	*outptr = caplist;
> +
> +	return 0;
> +}
> +
> +int
> +xe_guc_capture_getnullheader(struct xe_guc *guc, void **outptr, size_t *size)
> +{
> +	struct xe_guc_state_capture *gc = guc->capture;
> +	int tmp = sizeof(u32) * 4;
> +	void *null_header;
> +
> +	if (gc->ads_null_cache) {
> +		*outptr = gc->ads_null_cache;
> +		*size = tmp;
> +		return 0;
> +	}
> +
> +	null_header = kzalloc(tmp, GFP_KERNEL);
> +	if (!null_header) {
> +		xe_gt_dbg(guc_to_gt(guc), "Failed to alloc cached register capture null list");
> +		return -ENOMEM;
> +	}
> +
> +	gc->ads_null_cache = null_header;
> +	*outptr = null_header;
> +	*size = tmp;
> +
> +	return 0;
> +}
> +
>  int xe_guc_capture_init(struct xe_guc *guc)
>  {
> +	guc->capture = kzalloc(sizeof(*guc->capture), GFP_KERNEL);
> +	if (!guc->capture)
> +		return -ENOMEM;
> +
> +	guc->capture->reglists = guc_capture_get_device_reglist(guc);
> +
> +	INIT_LIST_HEAD(&guc->capture->outlist);
> +	INIT_LIST_HEAD(&guc->capture->cachelist);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
> index 3caea2c6fffe..a16dcbe87af0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.h
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.h
> @@ -7,9 +7,14 @@
>  #define _XE_GUC_CAPTURE_H
>  
>  #include <linux/types.h>
> +#include "xe_exec_queue_types.h"
>  
>  struct xe_guc;
>  
> +void xe_guc_capture_process(struct xe_guc *guc);
> +int xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid, void **outptr);
> +int xe_guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type, u32 classid, size_t *size);
> +int xe_guc_capture_getnullheader(struct xe_guc *guc, void **outptr, size_t *size);
>  int xe_guc_capture_init(struct xe_guc *guc);
>  
>  #endif /* _XE_GUC_CAPTURE_H */
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture_fwif.h b/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
> new file mode 100644
> index 000000000000..4bb94ac1ff48
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
> @@ -0,0 +1,177 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2021-2022 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_CAPTURE_FWIF_H
> +#define _XE_GUC_CAPTURE_FWIF_H
> +
> +#include <linux/types.h>
> +#include "regs/xe_reg_defs.h"
> +#include "xe_guc_fwif.h"
> +
> +/*
> + * struct guc_debug_capture_list_header / struct guc_debug_capture_list
> + *
> + * As part of ADS registration, these header structures (followed by
> + * an array of 'struct guc_mmio_reg' entries) are used to register with
> + * GuC microkernel the list of registers we want it to dump out prior
> + * to a engine reset.
> + */
> +struct guc_debug_capture_list_header {
> +	u32 info;
> +#define GUC_CAPTURELISTHDR_NUMDESCR GENMASK(15, 0)
> +} __packed;
> +
> +struct guc_debug_capture_list {
> +	struct guc_debug_capture_list_header header;
> +	struct guc_mmio_reg regs[];
> +} __packed;
> +
> +/*
> + * struct __guc_mmio_reg_descr / struct __guc_mmio_reg_descr_group
> + *
> + * xe_guc_capture module uses these structures to maintain static
> + * tables (per unique platform) that consists of lists of registers
> + * (offsets, names, flags,...) that are used at the ADS regisration
> + * time as well as during runtime processing and reporting of error-
> + * capture states generated by GuC just prior to engine reset events.
> + */
> +struct __guc_mmio_reg_descr {
> +	struct xe_reg reg;
> +	u32 flags;
> +	u32 mask;
> +	const char *regname;
> +};
> +
> +struct __guc_mmio_reg_descr_group {
> +	const struct __guc_mmio_reg_descr *list;
> +	u32 num_regs;
> +	u32 owner; /* see enum guc_capture_owner */
> +	u32 type; /* see enum guc_capture_type */
> +	u32 engine; /* as per MAX_ENGINE_CLASS */
> +	struct __guc_mmio_reg_descr *extlist; /* only used for steered registers */
> +};
> +
> +/*
> + * struct guc_state_capture_header_t / struct guc_state_capture_t /
> + * guc_state_capture_group_header_t / guc_state_capture_group_t
> + *
> + * Prior to resetting engines that have hung or faulted, GuC microkernel
> + * reports the engine error-state (register values that was read) by
> + * logging them into the shared GuC log buffer using these hierarchy
> + * of structures.
> + */
> +struct guc_state_capture_header_t {
> +	u32 owner;
> +#define CAP_HDR_CAPTURE_VFID GENMASK(7, 0)
> +	u32 info;
> +#define CAP_HDR_CAPTURE_TYPE GENMASK(3, 0) /* see enum guc_capture_type */
> +#define CAP_HDR_ENGINE_CLASS GENMASK(7, 4) /* see GUC_MAX_ENGINE_CLASSES */
> +#define CAP_HDR_ENGINE_INSTANCE GENMASK(11, 8)
> +	u32 lrca; /* if type-instance, LRCA (address) that hung, else set to ~0 */
> +	u32 guc_id; /* if type-instance, context index of hung context, else set to ~0 */
> +	u32 num_mmios;
> +#define CAP_HDR_NUM_MMIOS GENMASK(9, 0)
> +} __packed;
> +
> +struct guc_state_capture_t {
> +	struct guc_state_capture_header_t header;
> +	struct guc_mmio_reg mmio_entries[];
> +} __packed;
> +
> +enum guc_capture_group_types {
> +	GUC_STATE_CAPTURE_GROUP_TYPE_FULL,
> +	GUC_STATE_CAPTURE_GROUP_TYPE_PARTIAL,
> +	GUC_STATE_CAPTURE_GROUP_TYPE_MAX,
> +};
> +
> +struct guc_state_capture_group_header_t {
> +	u32 owner;
> +	u32 info;
> +#define CAP_GRP_HDR_NUM_CAPTURES GENMASK(7, 0)
> +#define CAP_GRP_HDR_CAPTURE_TYPE GENMASK(15, 8) /* guc_capture_group_types */
> +} __packed;
> +
> +/* this is the top level structure where an error-capture dump starts */
> +struct guc_state_capture_group_t {
> +	struct guc_state_capture_group_header_t grp_header;
> +	struct guc_state_capture_t capture_entries[];
> +} __packed;
> +
> +/*
> + * struct __guc_capture_ads_cache
> + *
> + * A structure to cache register lists that were populated and registered
> + * with GuC at startup during ADS registration. This allows much quicker
> + * GuC resets without re-parsing all the tables for the given gt.
> + */
> +struct __guc_capture_ads_cache {
> +	bool is_valid;
> +	void *ptr;
> +	size_t size;
> +	int status;
> +};
> +
> +/**
> + * struct xe_guc_state_capture
> + *
> + * Internal context of the xe_guc_capture module.
> + */
> +struct xe_guc_state_capture {
> +	/**
> +	 * @reglists: static table of register lists used for error-capture state.
> +	 */
> +	const struct __guc_mmio_reg_descr_group *reglists;
> +
> +	/**
> +	 * @extlists: allocated table of steered register lists used for error-capture state.
> +	 *
> +	 * NOTE: steered registers have multiple instances depending on the HW configuration
> +	 * (slices or dual-sub-slices) and thus depends on HW fuses discovered at startup
> +	 */
> +	struct __guc_mmio_reg_descr_group *extlists;
> +
> +	/**
> +	 * @ads_cache: cached register lists that is ADS format ready
> +	 */
> +	struct __guc_capture_ads_cache ads_cache[GUC_CAPTURE_LIST_INDEX_MAX]
> +						[GUC_CAPTURE_LIST_TYPE_MAX]
> +						[GUC_MAX_ENGINE_CLASSES];
> +
> +	/**
> +	 * @ads_null_cache: ADS null cache.
> +	 */
> +	void *ads_null_cache;
> +
> +	/**
> +	 * @cachelist: Pool of pre-allocated nodes for error capture output
> +	 *
> +	 * We need this pool of pre-allocated nodes because we cannot
> +	 * dynamically allocate new nodes when receiving the G2H notification
> +	 * because the event handlers for all G2H event-processing is called
> +	 * by the ct processing worker queue and when that queue is being
> +	 * processed, there is no absoluate guarantee that we are not in the
> +	 * midst of a GT reset operation (which doesn't allow allocations).
> +	 */
> +	struct list_head cachelist;
> +#define PREALLOC_NODES_MAX_COUNT (3 * GUC_MAX_ENGINE_CLASSES * GUC_MAX_INSTANCES_PER_CLASS)
> +#define PREALLOC_NODES_DEFAULT_NUMREGS 64
> +
> +	/**
> +	 * @max_mmio_per_node: Max MMIO per node.
> +	 */
> +	int max_mmio_per_node;
> +
> +	/**
> +	 * @outlist: Pool of pre-allocated nodes for error capture output
> +	 *
> +	 * A linked list of parsed GuC error-capture output data before
> +	 * reporting with formatting via i915_gpu_coredump. Each node in this linked list shall
> +	 * contain a single engine-capture including global, engine-class and
> +	 * engine-instance register dumps as per guc_capture_parsed_output_node
> +	 */
> +	struct list_head outlist;
> +};
> +
> +#endif /* _XE_GUC_CAPTURE_FWIF_H */
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index c281fdbfd2d6..fc667abead8d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -9,6 +9,7 @@
>  #include <linux/bits.h>
>  
>  #include "abi/guc_klvs_abi.h"
> +#include "xe_hw_engine_types.h"
>  
>  #define G2H_LEN_DW_SCHED_CONTEXT_MODE_SET	4
>  #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
> @@ -164,6 +165,8 @@ struct guc_mmio_reg {
>  #define GUC_REGSET_MASKED		BIT(0)
>  #define GUC_REGSET_MASKED_WITH_VALUE	BIT(2)
>  #define GUC_REGSET_RESTORE_ONLY		BIT(3)
> +#define GUC_REGSET_STEERING_GROUP       GENMASK(15, 12)
> +#define GUC_REGSET_STEERING_INSTANCE    GENMASK(23, 20)
>  } __packed;
>  
>  /* GuC register sets */
> @@ -192,6 +195,23 @@ enum {
>  	GUC_CAPTURE_LIST_INDEX_MAX = 2,
>  };
>  
> +/*Register-types of GuC capture register lists */
> +enum guc_capture_type {
> +	GUC_CAPTURE_LIST_TYPE_GLOBAL = 0,
> +	GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
> +	GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
> +	GUC_CAPTURE_LIST_TYPE_MAX,
> +};
> +
> +/* Class indecies for capture_class and capture_instance arrays */
> +enum {
> +	GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE = 0,
> +	GUC_CAPTURE_LIST_CLASS_VIDEO = 1,
> +	GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE = 2,
> +	GUC_CAPTURE_LIST_CLASS_BLITTER = 3,
> +	GUC_CAPTURE_LIST_CLASS_GSC_OTHER = 4,
> +};
> +
>  /* GuC Additional Data Struct */
>  struct guc_ads {
>  	struct guc_mmio_reg_set reg_state_list[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index dc6059de669c..165bc585fe0e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -43,6 +43,8 @@ struct xe_guc {
>  	struct xe_guc_ads ads;
>  	/** @ct: GuC ct */
>  	struct xe_guc_ct ct;
> +	/** @capture: the error-state-capture module's data and objects */
> +	struct xe_guc_state_capture *capture;
>  	/** @pc: GuC Power Conservation */
>  	struct xe_guc_pc pc;
>  	/** @dbm: GuC Doorbell Manager */
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
