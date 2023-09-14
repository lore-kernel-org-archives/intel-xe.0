Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E42EEAA6E
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 20:03:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666F110E0D7;
	Thu, 14 Sep 2023 20:03:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA0010E0D7
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 20:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694721805; x=1726257805;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7gpkrP7n4auI50qAMflkPJsxn07iAVE4rCDJq1/VcL0=;
 b=HDud2I8mFeoTyOQWAADFi8oH9HP7aaE8+AV2VlIfw/5iosVXdN9eFN7Q
 yM+kkHzCj7UcK2dTjcbHmoZcPeZdhiqe1yySaIcGC91qWZtEnIlA2bTNO
 yL6recoZQjE5wH48WYkAaEBHcFUYkJ4na7K2sP3I3O79JxpOVLoLlYh8o
 rGlkYGIt7a88BlKyrmVvYmu8126qGCuyRM3nYqvDOo6ZJPpnO5/zDI5CT
 PEmJkhDD4IZUDXdV1JlhD8Z9Es+Kjx6EJ8QOSa6VpPOc7IfNyBbfe4Tl8
 vjXsuaix0pZUqNWh/J1Efe5RLAewzKwnZ9nAKDv0TUau+mppAZPjEuNTf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="376398194"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="376398194"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 13:03:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="774007814"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="774007814"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Sep 2023 13:02:03 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 13:02:02 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 13:02:02 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 14 Sep 2023 13:02:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwJGpvkKWnLooLFLvVdMUQLffHbHDrmoebw5NVcxEIsYfuMNBC/38jAc2CAZ/Wq2K5Qt0ex3Oyf4frgcCHCzgoQ+ahRHz0pUPM53U/ZV4Zz1M0QvBpwweQfx+aCe9yOZgVOngDjz+fyJ0/oAQtjJHK2YT6g6D2U2TUFGNCaKI8OX65e6dq66TijTNO3xZJ+QUoL2J9oQhqqUB9EvK7Qw1L00TsMj8O+wILSXc5ZtQXDtzvCd07Vn3f/Yq+YJlvmJkbP6fV5MpQsp00ENyXEVz5lFFThlW0pypjXfy1ejx2GBFI0HxEqKsBoqamKc09UU4dZ6yGFd2C5uNd33pZmSlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulb428RuhjnJ7/OCfh4TQZLeH20oCsNBy3C3h70bjd8=;
 b=UfiKZPpGDUDiLBryiVJJ8YM/VYn8llyg/EezI6FDSrjaK7Db/zCfv33QJkYEeTY5XDV6k4KqdXRFcOUPG82/RhKxBlJ2/qgyFHQKaF8YH/Yh5OmEyxfPaFv0cyUQJuheLKz+pt97Tl30hWABAq4BiCcO7+aLwH+GNYxlafTEfbOlabE73g24RPosjScQRv1sUVeK1vUs75cf08ts0R2Qj1MhrPxFtUFC/MvVwnsEGtT0ur2z8vtDfAIxaeWGJPfXzIDOBYqRqURnbOkL2MXeaszw3OcnvuG2JKkSdvwk2noj09g7CS4aRSgaY+a+tWbJmdLDDJ/mWSOD5vkkcDJZKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BN9PR11MB5465.namprd11.prod.outlook.com (2603:10b6:408:11e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Thu, 14 Sep
 2023 20:02:00 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.034; Thu, 14 Sep 2023
 20:02:00 +0000
Date: Thu, 14 Sep 2023 16:01:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Message-ID: <ZQNmslE2805HTaSG@intel.com>
References: <20230814223734.375449-1-umesh.nerlige.ramappa@intel.com>
 <20230814223734.375449-5-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230814223734.375449-5-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR13CA0111.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BN9PR11MB5465:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d20a08b-a0d9-4981-f42f-08dbb55d74d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Ll5NtFtPAqHx/SKhP0UW0bD+eA8/Viv8hBN6qRVrkAidIdoRamavJuaJBBxeCzdGPNPfjsyhZG+N0ugyLdi/t05oQlo3D2h3dG6oHDv8pvZYfpyivOYM2Ym7fhE/z7FRkgb5DqTijuqXuEpZaAGF3wiWoz8yPPUF9ue2IIdNR281aZ9iBOEB73HTHaIM9/IL/Vk55NHgGLSXsL8wUyu4h0xLxvj3HOQ90aMp5hGlatJA2MYV6534sILmBeuXDHPJeydyAnQKyA6VloahDq09hIad/ZjSo8zw0CuqfJVzkSNRN1zWmwNcJsifGLMOgGHaoHz2Seg+Fdh5zftBn3pSfm49eU3ki5jh1dW4jT+Qnbtu62JlMt2U7w+TOSIqmAGseZP2fkT4a5HDhGkrHo+N31KqMP8DXLrN7xWH1gTw1P4+I3t92JxOrU62sooFs9gGPSRPkvbbdMfDOPBAWj9zNIceGKvYTe+u2cHojPIf9QTqtjqqe+6NjMTHiMSSSCXFdAFzG2JdXcjbI3bkez1s4vg07xW0cb7VyK/rTMEycw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(396003)(376002)(39860400002)(186009)(451199024)(1800799009)(966005)(5660300002)(37006003)(478600001)(316002)(4326008)(6862004)(8936002)(30864003)(82960400001)(8676002)(6666004)(38100700002)(44832011)(2906002)(6512007)(6506007)(6486002)(36756003)(66946007)(66476007)(66556008)(2616005)(6636002)(41300700001)(86362001)(83380400001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AQ4UKHef9y7fcC4S7les7rxYqU01i85auo31MvOzqgztkK1E1ISQTDS4Oesc?=
 =?us-ascii?Q?MvCfxCJmp6aE3oP1mAy5zWdJ3hR0UpFd6frWICEMUyQSQnX749bkRQw5MPB1?=
 =?us-ascii?Q?t8bDoGRcnzPaWCYcK5H/t+7YaI7W6cJnpDOwfYGMlMMnmXi9hyBaj3zG5o6t?=
 =?us-ascii?Q?EoRpquSgB5aPCLIsGnVNYYincN3OzMr1yP+rHDGyb5rWyfackfjAzQ+tR+4w?=
 =?us-ascii?Q?Nv5clz2VEtEXJhwJyAlLaU2zebNDKfcS18T+2lYsjiI/b7jCQaXGpGkQ7d/3?=
 =?us-ascii?Q?U7DwHh42stfPEC7GUXwes6f0Ajlj38qTnvbMAqmEGrjNwSPdpKs+PxzMVPUe?=
 =?us-ascii?Q?RQgm6PYP8aHwwTUc2k1aMKGBXRApL7q/LrrOAJdkKjp6+uRTJbRa603Xkrek?=
 =?us-ascii?Q?9w5znxF6gP3qocaE0b5pyaL9RxkZ2b1116hRCCIGLMJhFv7aGnhVRQEFXZzO?=
 =?us-ascii?Q?pGAJR4cbD8MqFk2VOMYsJ8Hdip/85BbD4ECYbrWQERsCDfYndNs5twNBV+zd?=
 =?us-ascii?Q?mPrz/fu/+Aeny9NSoNvDmZTxBrO1FI+Iu/RDozWuIxAonQFTxgm3MU3y2Xyj?=
 =?us-ascii?Q?y40vWwsaBpX0mqCSnmXSGICBY08ePP9pSuZYuNdnxfIKhcHdEHUfigoSieid?=
 =?us-ascii?Q?Y57AneI56+pOwBqWKRUPFmb1zn1KEZ+KLidon2xZXIIJb8ts/ierV1GzLnJ2?=
 =?us-ascii?Q?Ugb5q/3iFwE+aINPwsHET26plbRnssaQ+4x/KuPckpeOou/0/AZgbsx7dKUH?=
 =?us-ascii?Q?hxAoRjxTSHWYyChH5SGgVb+fo1vS1aJumfFz4jlTh8yh9PxFHpRG/YIb1cYF?=
 =?us-ascii?Q?aP8aovqs5nVi6lqZNv+nbvti48QIkalT+j9Qf34XyRx3f8SVz/AHLrbgVntn?=
 =?us-ascii?Q?TXv9/AgA+81hF545Lq2D2uvDJq0B4ti73MCEfQR3ABmaWfVFwKt6zrmT4YJN?=
 =?us-ascii?Q?NZaLH6wKPOHVGVUNhljSBlO4ZxHgA2fniLfeP/Ulm7/uGxlCphclBvHR7/Rc?=
 =?us-ascii?Q?aAhFEV4FhvOEdDGRsSMmC4tTebIaS/dCqsm2AQ0kfx2HO+hKaqGlPtqy0sdK?=
 =?us-ascii?Q?RqFAlzo4JgYkeonuLtF8uI2pfhSuZDxSEiXfe5g8lUrVaMafh+SIOfT6sjnz?=
 =?us-ascii?Q?urLVJ4PZ/kNhKnFp3A6PbwuCfaYSrVBkq68dSiiREn3oonvU73neiIu/bgVa?=
 =?us-ascii?Q?oNYugq4QXH72mdc2WoDH2TiQvXpB40ezzzZKfwyjt5u9wcmTK1DTGuyskvmO?=
 =?us-ascii?Q?o/FEU7OHKo85FUUODtOwrpU3oha/nBTwqWWDeEZlnxdRo4dNApQOaoyIEFjb?=
 =?us-ascii?Q?rUsSINBKMZSSYuC+ZQ2rmLySLujOYe9j/ScdzSQVnIG6n/lOHdQOZXl/Aj9G?=
 =?us-ascii?Q?5aLirea/8P2Hvv9dzRDHvwx3rMHG/pk2SQj7SPMEwL5SXWWsqUocX81T1U7H?=
 =?us-ascii?Q?N0L1NrtbY0r6bg023fGEF0Hh+WCfwZJfMQq4ir9bMVxyIrtVwtTUFrqKoOAl?=
 =?us-ascii?Q?4qkVl/z5WEDyXp3zrN/MuIbOb3ZSAfmRHA2r5DnncwfthuBY93eKC4GgxKv6?=
 =?us-ascii?Q?7xJfygjIW+bCuBz/qHONqOhAx731vCUQqb8D0dA0p3pCKP57e82WkN2saRx0?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d20a08b-a0d9-4981-f42f-08dbb55d74d2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 20:02:00.3152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMDjbKDAE4Buxcxvobr0K4zi99pJ7qrkJTGngJbf52iRt5+x1dzQgvx92XpbSYtfZ5bjB6ZoONKeoBxfjGD1Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5465
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 4/4] drm/xe: Correlate engine and cpu
 timestamps with better accuracy
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
Cc: Lionel G Landwerlin <lionel.g.landwerlin@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Aug 14, 2023 at 03:37:34PM -0700, Umesh Nerlige Ramappa wrote:
> Perf measurements rely on CPU and engine timestamps to correlate
> events of interest across these time domains. Current mechanisms get
> these timestamps separately and the calculated delta between these
> timestamps lack enough accuracy.
> 
> To improve the accuracy of these time measurements to within a few us,
> add a query that returns the engine and cpu timestamps captured as
> close to each other as possible.
> 
> Mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/24591
> 
> v2:
> - Fix kernel-doc warnings (CI)
> - Document input params and group them together (Jose)
> - s/cs/engine/ (Jose)
> - Remove padding in the query (Ashutosh)
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_query.c | 138 ++++++++++++++++++++++++++++++++++
>  include/uapi/drm/xe_drm.h     |  93 ++++++++++++++++++-----
>  2 files changed, 212 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index b9d565264ceb..af083f57a618 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -6,10 +6,12 @@
>  #include "xe_query.h"
>  
>  #include <linux/nospec.h>
> +#include <linux/sched/clock.h>
>  
>  #include <drm/ttm/ttm_placement.h>
>  #include <drm/xe_drm.h>
>  
> +#include "regs/xe_engine_regs.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_exec_queue.h"
> @@ -17,6 +19,7 @@
>  #include "xe_gt.h"
>  #include "xe_guc_hwconfig.h"
>  #include "xe_macros.h"
> +#include "xe_mmio.h"
>  #include "xe_ttm_vram_mgr.h"
>  
>  static const u16 xe_to_user_engine_class[] = {
> @@ -27,6 +30,14 @@ static const u16 xe_to_user_engine_class[] = {
>  	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
>  };
>  
> +static const enum xe_engine_class user_to_xe_engine_class[] = {
> +	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
> +	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
> +	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
> +	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
> +	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
> +};
> +
>  static size_t calc_hw_engine_info_size(struct xe_device *xe)
>  {
>  	struct xe_hw_engine *hwe;
> @@ -45,6 +56,132 @@ static size_t calc_hw_engine_info_size(struct xe_device *xe)
>  	return i * sizeof(struct drm_xe_engine_class_instance);
>  }
>  
> +typedef u64 (*__ktime_func_t)(void);
> +static __ktime_func_t __clock_id_to_func(clockid_t clk_id)
> +{
> +	/*
> +	 * Use logic same as the perf subsystem to allow user to select the
> +	 * reference clock id to be used for timestamps.
> +	 */
> +	switch (clk_id) {
> +	case CLOCK_MONOTONIC:
> +		return &ktime_get_ns;
> +	case CLOCK_MONOTONIC_RAW:
> +		return &ktime_get_raw_ns;
> +	case CLOCK_REALTIME:
> +		return &ktime_get_real_ns;
> +	case CLOCK_BOOTTIME:
> +		return &ktime_get_boottime_ns;
> +	case CLOCK_TAI:
> +		return &ktime_get_clocktai_ns;
> +	default:
> +		return NULL;
> +	}
> +}
> +
> +static void
> +__read_timestamps(struct xe_gt *gt,
> +		  struct xe_reg lower_reg,
> +		  struct xe_reg upper_reg,
> +		  u64 *engine_ts,
> +		  u64 *cpu_ts,
> +		  u64 *cpu_delta,
> +		  __ktime_func_t cpu_clock)
> +{
> +	u32 upper, lower, old_upper, loop = 0;
> +
> +	upper = xe_mmio_read32(gt, upper_reg);
> +	do {
> +		*cpu_delta = local_clock();
> +		*cpu_ts = cpu_clock();
> +		lower = xe_mmio_read32(gt, lower_reg);
> +		*cpu_delta = local_clock() - *cpu_delta;
> +		old_upper = upper;
> +		upper = xe_mmio_read32(gt, upper_reg);
> +	} while (upper != old_upper && loop++ < 2);
> +
> +	*engine_ts = (u64)upper << 32 | lower;
> +}
> +
> +static int
> +query_engine_cycles(struct xe_device *xe,
> +		struct drm_xe_device_query *query)
> +{
> +	struct drm_xe_query_engine_cycles __user *query_ptr;
> +	struct drm_xe_engine_class_instance *eci;
> +	struct drm_xe_query_engine_cycles resp;
> +	size_t size = sizeof(resp);
> +	__ktime_func_t cpu_clock;
> +	struct xe_hw_engine *hwe;
> +	struct xe_gt *gt;
> +
> +	if (query->size == 0) {
> +		query->size = size;
> +		return 0;
> +	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
> +		return -EINVAL;
> +	}
> +
> +	query_ptr = u64_to_user_ptr(query->data);
> +	if (copy_from_user(&resp, query_ptr, size))
> +		return -EFAULT;
> +
> +	cpu_clock = __clock_id_to_func(resp.clockid);
> +	if (!cpu_clock)
> +		return -EINVAL;
> +
> +	eci = &resp.eci;
> +	if (eci->gt_id > XE_MAX_GT_PER_TILE)
> +		return -EINVAL;
> +
> +	gt = xe_device_get_gt(xe, eci->gt_id);
> +	if (!gt)
> +		return -EINVAL;
> +
> +	if (eci->engine_class >= ARRAY_SIZE(user_to_xe_engine_class))
> +		return -EINVAL;
> +
> +	hwe = xe_gt_hw_engine(gt, user_to_xe_engine_class[eci->engine_class],
> +			      eci->engine_instance, true);
> +	if (!hwe)
> +		return -EINVAL;
> +
> +	resp.engine_frequency = gt->info.clock_freq;
> +
> +	xe_device_mem_access_get(xe);
> +	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +
> +	__read_timestamps(gt,
> +			  RING_TIMESTAMP(hwe->mmio_base),
> +			  RING_TIMESTAMP_UDW(hwe->mmio_base),
> +			  &resp.engine_cycles,
> +			  &resp.cpu_timestamp,
> +			  &resp.cpu_delta,
> +			  cpu_clock);
> +
> +	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	xe_device_mem_access_put(xe);
> +	resp.width = 36;
> +
> +	/* Only write to the output fields of user query */
> +	if (put_user(resp.engine_frequency, &query_ptr->engine_frequency))
> +		return -EFAULT;
> +
> +	if (put_user(resp.cpu_timestamp, &query_ptr->cpu_timestamp))
> +		return -EFAULT;
> +
> +	if (put_user(resp.cpu_delta, &query_ptr->cpu_delta))
> +		return -EFAULT;
> +
> +	if (put_user(resp.engine_cycles, &query_ptr->engine_cycles))
> +		return -EFAULT;
> +
> +	if (put_user(resp.width, &query_ptr->width))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
>  static int query_engines(struct xe_device *xe,
>  			 struct drm_xe_device_query *query)
>  {
> @@ -376,6 +513,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
>  	query_gts,
>  	query_hwconfig,
>  	query_gt_topology,
> +	query_engine_cycles,
>  };
>  
>  int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 53cd57342620..4c0c58ca63a3 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -128,6 +128,25 @@ struct xe_user_extension {
>  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>  #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
>  
> +/** struct drm_xe_engine_class_instance - instance of an engine class */
> +struct drm_xe_engine_class_instance {
> +#define DRM_XE_ENGINE_CLASS_RENDER		0
> +#define DRM_XE_ENGINE_CLASS_COPY		1
> +#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
> +#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
> +#define DRM_XE_ENGINE_CLASS_COMPUTE		4
> +	/*
> +	 * Kernel only class (not actual hardware engine class). Used for
> +	 * creating ordered queues of VM bind operations.
> +	 */
> +#define DRM_XE_ENGINE_CLASS_VM_BIND		5
> +	__u16 engine_class;
> +
> +	__u16 engine_instance;
> +	__u16 gt_id;
> +	__u16 rsvd;
> +};
> +
>  /**
>   * enum drm_xe_memory_class - Supported memory classes.
>   */
> @@ -223,6 +242,60 @@ struct drm_xe_query_mem_region {
>  	__u64 reserved[6];
>  };
>  
> +/**
> + * struct drm_xe_query_engine_cycles - correlate CPU and GPU timestamps
> + *
> + * If a query is made with a struct drm_xe_device_query where .query is equal to
> + * DRM_XE_QUERY_CS_CYCLES, then the reply uses struct drm_xe_query_engine_cycles
> + * in .data. struct drm_xe_query_engine_cycles is allocated by the user and
> + * .data points to this allocated structure.
> + *
> + * The query returns the command streamer cycles and the frequency that can
> + * be used to calculate the command streamer timestamp. In addition the
> + * query returns a set of cpu timestamps that indicate when the command
> + * streamer cycle count was captured.
> + */
> +struct drm_xe_query_engine_cycles {
> +	/**
> +	 * @eci: This is input by the user and is the engine for which command
> +	 * streamer cycles is queried.
> +	 */
> +	struct drm_xe_engine_class_instance eci;
> +
> +	/**
> +	 * @clockid: This is input by the user and is the reference clock id for
> +	 * CPU timestamp. For definition, see clock_gettime(2) and
> +	 * perf_event_open(2). Supported clock ids are CLOCK_MONOTONIC,
> +	 * CLOCK_MONOTONIC_RAW, CLOCK_REALTIME, CLOCK_BOOTTIME, CLOCK_TAI.
> +	 */
> +	__s32 clockid;
> +
> +	/** @width: Width of the engine cycle counter in bits. */
> +	__u32 width;
> +
> +	/**
> +	 * @engine_cycles: Command streamer cycles as read from the command streamer
> +	 * register at 0x358 offset.
> +	 */
> +	__u64 engine_cycles;
> +
> +	/** @engine_frequency: Frequency of the engine cycles in Hz. */
> +	__u64 engine_frequency;

I'm going to rename this to crystal_reference_clock to avoid any confusion with
Render P-States frequencies in which the GT is really running.

Then I'm going to remove the duplicated information that is now in the gt entry.

> +
> +	/**
> +	 * @cpu_timestamp: CPU timestamp in ns. The timestamp is captured before
> +	 * reading the engine_cycles register using the reference clockid set by the
> +	 * user.
> +	 */
> +	__u64 cpu_timestamp;
> +
> +	/**
> +	 * @cpu_delta: Time delta in ns captured around reading the lower dword
> +	 * of the engine_cycles register.
> +	 */
> +	__u64 cpu_delta;
> +};
> +
>  /**
>   * struct drm_xe_query_mem_usage - describe memory regions and usage
>   *
> @@ -395,6 +468,7 @@ struct drm_xe_device_query {
>  #define DRM_XE_DEVICE_QUERY_GTS		3
>  #define DRM_XE_DEVICE_QUERY_HWCONFIG	4
>  #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY	5
> +#define DRM_XE_QUERY_CS_CYCLES		6
>  	/** @query: The type of data to query */
>  	__u32 query;
>  
> @@ -737,25 +811,6 @@ struct drm_xe_exec_queue_set_property {
>  	__u64 reserved[2];
>  };
>  
> -/** struct drm_xe_engine_class_instance - instance of an engine class */
> -struct drm_xe_engine_class_instance {
> -#define DRM_XE_ENGINE_CLASS_RENDER		0
> -#define DRM_XE_ENGINE_CLASS_COPY		1
> -#define DRM_XE_ENGINE_CLASS_VIDEO_DECODE	2
> -#define DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE	3
> -#define DRM_XE_ENGINE_CLASS_COMPUTE		4
> -	/*
> -	 * Kernel only class (not actual hardware engine class). Used for
> -	 * creating ordered queues of VM bind operations.
> -	 */
> -#define DRM_XE_ENGINE_CLASS_VM_BIND		5
> -	__u16 engine_class;
> -
> -	__u16 engine_instance;
> -	__u16 gt_id;
> -	__u16 rsvd;
> -};
> -
>  struct drm_xe_exec_queue_create {
>  #define XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY               0
>  	/** @extensions: Pointer to the first extension struct, if any */
> -- 
> 2.38.1
> 
