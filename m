Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13ED0C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 22:19:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA17710E04E;
	Tue,  5 Dec 2023 22:19:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BFC010E04E
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 22:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701814738; x=1733350738;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=S8w2aFGg/KbQjuLijFiC87kIO9XkXV3TrWsYEzABJps=;
 b=AteHa8heP2K+LWhMymlFPHWrjoY3KBjKlr8ovMXXTD+WFo49dXF6pCtQ
 6+T+XmUyMw65dEAeUhKGYAb7VD0T2SbI48C8vP2bi2sjJeO8vJv9NilMC
 bbHNABh/oWMDT1+KcVeE5znC1erdc8klGouQgyb8eRI+bAaqvZHiZoc0l
 iZIDHNPw9F3/hzI5l+AgL+rErV7TzkDaQQn4dWdy/d+39pV4iRdNOhE8F
 LfozhN8PQ14xQi1BQmWKxLEHH8oqTbxm1Wmswc9nLd6RdWxw+ltBHL9Z5
 x7oPvE9i7PyXQvTMfb/r/1mn8oWUzIuJgmq0Ls8rDWXCRYT1CAWDccXpo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="384375187"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="384375187"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 14:18:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="914954559"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="914954559"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 14:18:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 14:18:57 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 14:18:57 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 5 Dec 2023 14:18:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmzAFav0tAdqvIL4CNjgPStjOki3YmIvt7OtcSRtB52rdTTDNDC8AVNGMpjtj+WsmS5kcZYUoEis3BKx8/pxF6I/oa9+eE76dqLc+zNzKGXJcw/+cszuxIzGu5o3U+kH0a2ax/o93bSoapPNqhzBJhtdhl6IQ2pXmlLzqKw5o2Oj3+IBCCfKYR9XsTzJWhSUy3LpVvoP1IGz8zQ109HaZARUlP09UfPJAv9B67K0HL7lYmRbeofpGkDqd3X+qHwwdOERMnmJHQVUu9Za2fYdgDdA0uwW42AnndMawk4y2npIyGpqXRXoBTZUzMzMncZ9QRnZzdjOErWCMuvZ3p6QRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9X32pd4+3T+VLDMV6Pi9mFHNW9uuSpQizgh8orjcp1E=;
 b=f/pcq9q6d9yd8rKGR/AZFi05ClkkFlGL4WXIZ+0mqWte27qlv1Kj+bjjpKITqcpZgDVVdzbkfWGb8HrA/pIV79Swkz53sjie7+EZ3kYS1YuY32c5RK9vrYF+7nlN+fyZdx0F5L67yVzGLhHbIXz6tDfc+atR0Xvc+2jiT16Z2Q6gT2QPnz+yURpiuCgrrww1Z1CX8Mp4IrGDsS+CMHbtvhiajewLOkPV+Uf6t2GaKsix00uEIVZRVLh8Juu7a1iWTKhkPbsqIFEe57svBPnxUoThWNpbLYO3NMoKUF626KeK9mhOPzCHfXS87eN3cVqrQLiNWvdllmg6ZS4UjV1f2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8012.namprd11.prod.outlook.com (2603:10b6:510:24b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 22:18:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 22:18:55 +0000
Date: Tue, 5 Dec 2023 15:18:03 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Message-ID: <ZW8/K+KeeD6szIq4@DUT025-TGLU.fm.intel.com>
References: <20231205143755.4834-1-krishnaiah.bommu@intel.com>
 <20231205143755.4834-2-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231205143755.4834-2-krishnaiah.bommu@intel.com>
X-ClientProxiedBy: SJ0PR13CA0188.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8012:EE_
X-MS-Office365-Filtering-Correlation-Id: 19c6032b-2b8c-49dd-2788-08dbf5e02b81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W7NfOXlF3YVkd8udSTElbTdAPMj2bNZh1Nth/MyxQUzcD3Xk4LjHEDl2Urzfcs0z85t588bxIs/5174AxWgZ3ialX7FD/orMfALW895Ks4IO7hmANjv7AwA58W2H3+wcAy9hjmTDz/iSt+O9dD/YZ7c0fmVY16fCKTsBdPkYP9Enpzdstku7arNpUCooaX42NUijW1Q2K0koMQ60QHj2fiLXFIV0sleRq9BgCnz7mkNjm7F7YpKqgaBBJnqCjW0hIUf0NjUIH8tdCvDUUIeLIi5pC1mrsvoi4YHH6Oc7kvYS00NOW95OdDJeZO4ldgmaHzgC7RLexTvhJ10jan3vaH69/Es064lDs6+G/+R936HOdYX75xb+nDvKGumtLepFSGoKbbgQUp4Sq9jwFVo/ZL38yuIecurwHCiTYZrm6P/eOKOWsRQW6fQ73/gjVTDocPPhSGy+RsCmj/QE4jYZd2mzcUrfGWQq2Lzik3r5ikiGwXMgi50NF8Qzg3TH1u6iUk3G3cO2ZT0Lnee8jSrLf+fG+h03vg/FmGcPeaFYMclaRSbWFOQi++rArbs3NhSV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(376002)(396003)(366004)(346002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(44832011)(2906002)(316002)(66556008)(6636002)(54906003)(66476007)(6862004)(8676002)(86362001)(66946007)(8936002)(41300700001)(4326008)(5660300002)(38100700002)(82960400001)(6486002)(83380400001)(478600001)(26005)(107886003)(6666004)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bJgQL5BNnLFcfFMIhSNNmS+aMMxIPVYbazcbZBTdqCynD4bdyPcLvFMkja+K?=
 =?us-ascii?Q?a/V8HYLQIm6yX3IYdHwuM7oh1AfimdIG6qo4ysvfItyko9r8eHYxE/vLoeDa?=
 =?us-ascii?Q?fSuTBh+ZlanxILt5Xj0oILYNgyhR1cU6USZaGPeekWLS35XKlSX6QuSFDmSq?=
 =?us-ascii?Q?+QnfBsgaVbZF6egpMk5z2hBcb2O6XGJDM58QWgsKRlYT6+/MAjtfPRtPJmJ1?=
 =?us-ascii?Q?12fsD9k/TZy7XDdK0v4An2z95n+6DjxaZ7utgQ1pbKt/YFLoMFe9i01YQNcB?=
 =?us-ascii?Q?S/wdFCopoNopnVvG6io9tB4FPwi31ynRV7e8NK6KPuH/MnJoAtWQkcYrh2ve?=
 =?us-ascii?Q?vkdxhExDZmEGWpDJBQYAgG5X8GhjgvbAWtk2oOXeTx27EDgNNIBRC/UayAVX?=
 =?us-ascii?Q?jYdSo+TYiuZ30mmsYaEWPEeLhtaB4BudBZeyxO+iH9TvosYUO2pz7IGN/QQ9?=
 =?us-ascii?Q?Y2RuQCcpiO+rxC3o18RItJzxeKUpaTg4wQf+mLJyh0SUiPIjMklAe6Z3gphk?=
 =?us-ascii?Q?fJzSccWCXT4AZH8VDimFAkBqjLUkYsWZm6AmhyFaSdILxJgt1CRShwC6UaFb?=
 =?us-ascii?Q?Krrcmokk+wI251bBt9LplgY+tjSkkK9nzv5Rqv0Qzc29KHOJoaN6Un62c3dW?=
 =?us-ascii?Q?C2VR4QpgwYr23uuZpQtaJ2GrqIr2W0bGVhJlZ85WPx6l8gzO2QeNy5n5yd7p?=
 =?us-ascii?Q?wpX7r742zBTAsF1YQRGzGeOSFHaFsN+6qHfr/aBfXGNtph2RfgoK258mBOfZ?=
 =?us-ascii?Q?7+4ydbnIdfFtOWjYOLaRnx5yT2StItJnDIOeszzvFWU0lI6Kt/yd/5znC93o?=
 =?us-ascii?Q?Hv5fLOUYCxjfQkhd5PTKme0yeTKa5+COHcyX83zDanFHHAtECXQ6a/eJWCiF?=
 =?us-ascii?Q?CkJTtr9P6vl0uPF0NlQXpAQ5bT4Mp6ftJtMqA29jHmI/wdkmNx2mw/AlIsmp?=
 =?us-ascii?Q?XMVbnhqqWL13gDuxznnxjm0JZraO0A+B7AkJV59CIZWoYMUZr8d2snoUbzCw?=
 =?us-ascii?Q?YdsliFksGFDukEX12kfs1dgGGfQ6mVHIelarYsS9BeQBgt0m3/WuRRZrB62g?=
 =?us-ascii?Q?jJFZOYKj7wXOWQkzAHXgtwm98JjrW9G/rIkndNuDbYb5OGDbLuUWJXX7aJYC?=
 =?us-ascii?Q?Bd8XyZFhqIz/XiZvkkK4kS2aJZF5eJN2Fqs+VUdwwRjI8DW5iScLZjqzdpcc?=
 =?us-ascii?Q?aDt4NeGIzwm6Vppp9noic68rp8zYtDZE4TRStGWQhrouF2CbE877ACW+yMjD?=
 =?us-ascii?Q?+DyLsuWcCRSfYnpPtAJfXfGYS4AVDXRw7EMoOQsKDRSITUN7olhWp0Ah//ze?=
 =?us-ascii?Q?/jtRlsHqiyBaPy8ZZ96Luzqv9FsuEquNYI2mehZOY8TxbjObTBq/pmzrnmYW?=
 =?us-ascii?Q?8TJyTaDMlC4w3d2lE/MRGMzLJJHx3En4867tH/u7lJpwng6ZziPxDocN2Z02?=
 =?us-ascii?Q?waC54UhctHxqBMgHdqPyp74oNJZBI3Ue2FAb4JKUVln+dlE+wvV4IiwS/KEC?=
 =?us-ascii?Q?43omkR7ULXgGUtj/+DotyZ3/nUY3fZeBpGOhONGP7vHuH9l8iD2XzKzha4xG?=
 =?us-ascii?Q?vcqb3u65yd69aOtAJZd/+3/ZFw8pYeWNXWuztrFVfSki14sQcHX03D1cFPid?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c6032b-2b8c-49dd-2788-08dbf5e02b81
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 22:18:55.5738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z1UF1dIKDh/+I/wogoyV7NTpbrshIdoHT4cvQgYkLFIVkjHj+sR4wN9YdcZW/WGqYVrHyFJczkm90ZbtNSI5ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8012
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/uapi: add exec_queue_id member to
 drm_xe_wait_user_fence structure
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Dec 05, 2023 at 08:07:54PM +0530, Bommu Krishnaiah wrote:
> remove the num_engines/instances members from drm_xe_wait_user_fence
> structure and add a exec_queue_id member
> 
> Right now this is only checking if the engine list is sane and nothing
> else. In the end every operation with this IOCTL is a soft check.
> So, let's formalize that and only use this IOCTL to wait on the fence.
> 
> exec_queue_id member will help to user space to get proper error code
> from kernel while in exec_queue reset
> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Leaving the RB to either Rodrigo or Francois as they are leading the
uAPI effort but this LGTM.

With that:
Acked-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_wait_user_fence.c | 56 +------------------------
>  include/uapi/drm/xe_drm.h               | 16 ++-----
>  2 files changed, 4 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index 4d5c2555ce41..447e4cfd204c 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -58,29 +58,7 @@ static const enum xe_engine_class user_to_xe_engine_class[] = {
>  	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
>  };
>  
> -static int check_hw_engines(struct xe_device *xe,
> -			    struct drm_xe_engine_class_instance *eci,
> -			    int num_engines)
> -{
> -	int i;
> -
> -	for (i = 0; i < num_engines; ++i) {
> -		enum xe_engine_class user_class =
> -			user_to_xe_engine_class[eci[i].engine_class];
> -
> -		if (eci[i].gt_id >= xe->info.tile_count)
> -			return -EINVAL;
> -
> -		if (!xe_gt_hw_engine(xe_device_get_gt(xe, eci[i].gt_id),
> -				     user_class, eci[i].engine_instance, true))
> -			return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
> -#define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP | \
> -			 DRM_XE_UFENCE_WAIT_FLAG_ABSTIME)
> +#define VALID_FLAGS	DRM_XE_UFENCE_WAIT_FLAG_ABSTIME
>  #define MAX_OP		DRM_XE_UFENCE_WAIT_OP_LTE
>  
>  static long to_jiffies_timeout(struct xe_device *xe,
> @@ -132,12 +110,8 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  	struct xe_device *xe = to_xe_device(dev);
>  	DEFINE_WAIT_FUNC(w_wait, woken_wake_function);
>  	struct drm_xe_wait_user_fence *args = data;
> -	struct drm_xe_engine_class_instance eci[XE_HW_ENGINE_MAX_INSTANCE];
> -	struct drm_xe_engine_class_instance __user *user_eci =
> -		u64_to_user_ptr(args->instances);
>  	u64 addr = args->addr;
>  	int err;
> -	bool no_engines = args->flags & DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP;
>  	long timeout;
>  	ktime_t start;
>  
> @@ -151,41 +125,13 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
>  	if (XE_IOCTL_DBG(xe, args->op > MAX_OP))
>  		return -EINVAL;
>  
> -	if (XE_IOCTL_DBG(xe, no_engines &&
> -			 (args->num_engines || args->instances)))
> -		return -EINVAL;
> -
> -	if (XE_IOCTL_DBG(xe, !no_engines && !args->num_engines))
> -		return -EINVAL;
> -
>  	if (XE_IOCTL_DBG(xe, addr & 0x7))
>  		return -EINVAL;
>  
> -	if (XE_IOCTL_DBG(xe, args->num_engines > XE_HW_ENGINE_MAX_INSTANCE))
> -		return -EINVAL;
> -
> -	if (!no_engines) {
> -		err = copy_from_user(eci, user_eci,
> -				     sizeof(struct drm_xe_engine_class_instance) *
> -			     args->num_engines);
> -		if (XE_IOCTL_DBG(xe, err))
> -			return -EFAULT;
> -
> -		if (XE_IOCTL_DBG(xe, check_hw_engines(xe, eci,
> -						      args->num_engines)))
> -			return -EINVAL;
> -	}
> -
>  	timeout = to_jiffies_timeout(xe, args);
>  
>  	start = ktime_get();
>  
> -	/*
> -	 * FIXME: Very simple implementation at the moment, single wait queue
> -	 * for everything. Could be optimized to have a wait queue for every
> -	 * hardware engine. Open coding as 'do_compare' can sleep which doesn't
> -	 * work with the wait_event_* macros.
> -	 */
>  	add_wait_queue(&xe->ufence_wq, &w_wait);
>  	for (;;) {
>  		err = do_compare(addr, args->value, args->mask, args->op);
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index eb03a49c17a1..d922641e11e8 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1030,8 +1030,7 @@ struct drm_xe_wait_user_fence {
>  	/** @op: wait operation (type of comparison) */
>  	__u16 op;
>  
> -#define DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
> -#define DRM_XE_UFENCE_WAIT_FLAG_ABSTIME	(1 << 1)
> +#define DRM_XE_UFENCE_WAIT_FLAG_ABSTIME	(1 << 0)
>  	/** @flags: wait flags */
>  	__u16 flags;
>  
> @@ -1064,17 +1063,8 @@ struct drm_xe_wait_user_fence {
>  	 */
>  	__s64 timeout;
>  
> -	/**
> -	 * @num_engines: number of engine instances to wait on, must be zero
> -	 * when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
> -	 */
> -	__u64 num_engines;
> -
> -	/**
> -	 * @instances: user pointer to array of drm_xe_engine_class_instance to
> -	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
> -	 */
> -	__u64 instances;
> +	/** @exec_queue_id: exec_queue_id returned from xe_exec_queue_create_ioctl */
> +	__u32 exec_queue_id;
>  
>  	/** @reserved: Reserved */
>  	__u64 reserved[2];
> -- 
> 2.25.1
> 
