Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC5AC46CA3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 09:37:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7EA10E6D5;
	Wed,  6 Dec 2023 09:37:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5121810E6BE
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 09:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701855453; x=1733391453;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=puO4xFWLqRrpgtTG0gukETRcMkUpxvGkKVzlAQvzHA4=;
 b=fbp8LqXHX5u0RDQVpVADFS2Zer2Zn28Mtw1WPsCKgT+uR8dHlrfYX9cy
 r4tJUHheWODHTSIbxslGPd0hMfNj3uIwwcnhnjqrbLhj4qxEnbcsbCr/L
 HxOQCbsTLq4DdGWAF6/7Zw0KP67gnedlNc7OHrTAWSZB4cforvD8xaufd
 8NfybE85U4M0jy4ce3XYKTKtq6Y19y9PXt+OFGac1luuvKxzOYkHivARp
 9LhMKcRPVMx893LV8aFawGBUJO2LvmzCXJVejumpBlwB0b6c1aABV/XQ/
 46x6w8Xvh3U/pnQPryPVAU9jPeCRenQlkvxb/HS9t70su61bpK6vper/u A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="7384741"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="7384741"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 01:37:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; d="scan'208";a="19271130"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 01:37:33 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 01:37:32 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 01:37:32 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 01:37:32 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 01:37:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PFYczKrFsPdueCdVzneclB19yvwMjTIVhbBvqnZ51tcNUzjEMnZRBM3Am9gIO7i6ybN2SFMDNf4OblAKRSkyS8kWfLB1UqbFSs+QqfK9CTzD3rkuh0SoaMIa7KDfkTKD34n3d8kfEKiFXN3PCFNX8INO2QlYt8TIWU1cLuuI8LSKhAxgmEXE6ut4WSyq0QdkDzKq4zey+7e72VHjSD/a7SryvDWim4b0NXX2euW12x5wXc31zpBidCO9XRRF6qpeWYtH0lE41OgyUm7diTd33CjjleVGSeIVNhm9ZMiOZYjWlfhlELfCWeFHSyexddaOnz/KRYg/DNeo0P7HUCrCzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Uhva789iYHHDnOwt2e4gaEyU4OzDYujz7Jcf/b49JU=;
 b=R/7qdwfKkY1I3op0u6L8Bj9WDyZuZkVRsDpUzp/eArEsS26ZK+QZ3v50M8dSTehBiGeYAD/JC1d2Z7TQ8D2dqm/K4SGLnXfHgjhv40vDWPezTkmb3Ks7lNNsFohw8oVHowu0+GyWL8t/Ke1VITBKoUAzxs7HqSEIJtENThTJhfijn68ciGkCgUjjvuNq/2Zu72yEocqHtffs20r3f7R0M6L1uLSWG+cWDBtL5W3ly6iKvxG/UwBoW6owO7o5dXiwUzDDFUtLqs1jho/zPcWSwoLnufpzd9RGNczjj9eQB/PNseR/s/lKTf4g2QDqRBcQATOjVPLD0+s+TFa7p4brYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by IA0PR11MB7742.namprd11.prod.outlook.com (2603:10b6:208:403::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 09:37:30 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37%7]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 09:37:30 +0000
Date: Wed, 6 Dec 2023 10:37:24 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Message-ID: <ZXBA1CJ85aUwaPvB@fdugast-desk.home>
References: <20231206034130.7897-1-krishnaiah.bommu@intel.com>
 <20231206034130.7897-2-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231206034130.7897-2-krishnaiah.bommu@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR4P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::11) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|IA0PR11MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: ac1c06b2-4135-4f26-d2ab-08dbf63ef718
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jcUovjZJVKcVLXvtOiwnf8XiD/T6h4zmT9bKpFNtyLsPs8y+aUUtdx+gLjUkUfCcvmGqgvhRBsELPpG5VsZNSZdzz4/Lj5k3vjfuYl+B2CI6QmBamQPao7iekUDnL9QsGtbbRbJUDoSFbAYaiPzL/h9NwOjmwStVi8Wh3gwqxyC1dknCYwzmj4VCH7gpUL2MH/eorVWe5i4MQ8kIInNr+KLxuFUFR1MxV2n4jyPAxcfRJ42DhT0LcqbONbTb/kmDenGDfgToFTUpW9vE8f3xDtVDNAXIpbkExPFxEgqYSFarj3AVLPXooObocBAzsU0RmJUOrOWj2MW/pnoFqDWZByUggrEeVNfT2rc2VvLOKqqeCD8zJdATjfFw6BWeZIdrr3p8lOplsxJI1LaqWdWwOi/Q34YYJ7rR7IexO4uxLad1AY9kjGZA87N7GmvH8BDwgJW2+Jee8VVBn/zWstsq5AN855HM8q7hVmznuPk+BLfrv+T0dJgfgqwCR/ddiCE05056GUHlAs/F9thMP9SJYySOfgmJJWxgsL8Qzseq3YR0q2hO2TYaLe6Ntk7zgSFI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(366004)(39860400002)(376002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(6486002)(478600001)(5660300002)(6666004)(36916002)(54906003)(66476007)(66556008)(316002)(6636002)(66946007)(8936002)(4326008)(6862004)(8676002)(6506007)(86362001)(44832011)(82960400001)(83380400001)(36756003)(38100700002)(41300700001)(107886003)(2906002)(26005)(9686003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3t/IyDQBYI3h6oApZEq7xZE8tuYJHazplB+1HmFInoOsw6cxV8I2L2ZRQ+3i?=
 =?us-ascii?Q?KVdv9ivkghmsyAUyEgpTBB0sZ3XkAz9zJV46yti1gxaaDMSqNutq+uZ+jGR+?=
 =?us-ascii?Q?2ZP5WEMw0LoyMUHgPCvS+ztO1JJCA4EfIYCtWdaFLGJEQDq2UxkoRA3j1dRB?=
 =?us-ascii?Q?KvWjpqEb4eigZNoBdN4czigQz/iL6bJ/CpyIlQSdWeZQ2/gnyIuPlWmt2rof?=
 =?us-ascii?Q?/f6rfVy5b+oQ6AyP7Viau2ImQgLK9LVjiSKsrRc/1LJH372rDixMRrXWWQj4?=
 =?us-ascii?Q?M/oGXQF5VEPCOhaxpa3DzM6jFxVoiim+biwg1ZS0L1q3V0wtgBzFEn1wObT5?=
 =?us-ascii?Q?Uj+Zi7xAkI9siYLVFRKkL282DFKFCm0xKMNDXUVnU3BmNp5FLjSvehEZtJdE?=
 =?us-ascii?Q?iI3rh+oMPUCIKGkfTcnVIdekJlOKd0EWo8G265kmtLTYT63Re1CniAPso57C?=
 =?us-ascii?Q?OfANTKR7F7Qkirqfe7pVwTc2excOER387/KWiCKqVjXxatZhZmLGP+F62MGL?=
 =?us-ascii?Q?KsA4A9OPpK6weK7Bl2UFnmV+zxVVtlJtKXnhdaFzv26Ja/rZm7nrzJy2q/7C?=
 =?us-ascii?Q?eq4IFH3YOYnxUAY9oUnmg/ic7Z8cx9K/Kdr4JxvhBqEgvFRIIv1Hwm4efuLN?=
 =?us-ascii?Q?QyShahsYqES8r9ASIoD9mpm+PZgGL++YNuSYrtdOCUjj8UMQM/VE2hYeJyOk?=
 =?us-ascii?Q?ehjSZc1/bhejBbPIR3dBFJm13qVYgQPE9xwMITvNZInmFljybO2l0KJexUoV?=
 =?us-ascii?Q?RyeRDHPFjP0d1JrPy+fASehwpTvBHATGuIFhPO4zISRldB0FjA5CSIlvodtO?=
 =?us-ascii?Q?L4CfTF+9dwFmwVNC7+4AniCU9fRvdB76Sy1+w44b0GxEScHSht4+e9RZNsaU?=
 =?us-ascii?Q?ShptL7c6aikyozrS8Y6XAegwWw38tBLO/HV7gUEaH8k2NX8uzdF3pp5RMUl1?=
 =?us-ascii?Q?Go3iFl+ZFfEjsK/PJKqsAvQ6BNzT9PMJUHKDQNTLwM9/3NwuRisBTTScup1j?=
 =?us-ascii?Q?KsF9AEVi0QgjwPp/KPC3eOE6rClDeDNvr+wVu7DoJ9WOD0zky1zFo0Kq3ngl?=
 =?us-ascii?Q?B2Uonqzj9wVP65P2Vql8drppM/jTrFT618KYCGRf7fnd1XyxaifIIMeumwYy?=
 =?us-ascii?Q?HYo8CiYGCzfsVbCNHev59RRjTVx3VDgZEr9yPvkxGHt2/zAFasDNEaFhmRMg?=
 =?us-ascii?Q?NPUTOmxQ0HL/1lmdlp2sMd36oDEllrbNK2maP4zHOU6L4NG9y+BM+HwR5RFC?=
 =?us-ascii?Q?SsUmAQwHbF/7u1rNjnnVp0ONd0MDiiMoQoUPN9Y9CIXwKWBrp+6PBpTtg59L?=
 =?us-ascii?Q?DqBoAYRP0Av+y/tjWCMQHUEYjSgOulMGRkk6iMLZEVSrQf2/4KEf6i7vMlTj?=
 =?us-ascii?Q?gi39qLHEL+q8IDzVG/HsVeX4f5+9C1k7Bw/b8K3urWLyf/lZ/+x4n4MWkr0c?=
 =?us-ascii?Q?tbGFXLi3hKgoT3/IV40VR91Y1xsKB2rHHG6dujt7VKRogZDzZN4Vy9883Nel?=
 =?us-ascii?Q?W8+fqMp7CLwyuhWKQnNb2GwbIECVuxt2X/yOP75rvvB9N8jOHmD7go0vJnBg?=
 =?us-ascii?Q?M9Naz76JCS/NApnbSiQiTi9FlnEZY4wYDQQDa2Xpg9YcGqAxuDaQcDmerg0t?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac1c06b2-4135-4f26-d2ab-08dbf63ef718
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 09:37:30.0242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zc/O8x9G6SLtfsgRxK3DAhxY2RHuLTtcJ3PFdDmw9ypXqy1Nl4jAz4BRwhLXqcC4yiBD8EbRojTq7s906yH6aHhgzuR4wY7T56HroOBEAHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7742
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 1/2] drm/xe/uapi: add exec_queue_id member
 to drm_xe_wait_user_fence structure
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

Hi Bommu,

On Wed, Dec 06, 2023 at 09:11:29AM +0530, Bommu Krishnaiah wrote:
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
> Acked-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wait_user_fence.c | 64 +------------------------
>  include/uapi/drm/xe_drm.h               | 16 ++-----
>  2 files changed, 4 insertions(+), 76 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> index 4d5c2555ce41..9f272bbaad95 100644
> --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> @@ -50,37 +50,7 @@ static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
>  	return passed ? 0 : 1;
>  }
>  
> -static const enum xe_engine_class user_to_xe_engine_class[] = {
> -	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
> -	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
> -	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
> -	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
> -	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
> -};
> -
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
> @@ -132,12 +102,8 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
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
> @@ -151,41 +117,13 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
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

This creates a misalignment. Please add a __u32 pad2. With this:

    Reviewed-by: Francois Dugast <francois.dugast@intel.com>

>  
>  	/** @reserved: Reserved */
>  	__u64 reserved[2];
> -- 
> 2.25.1
> 
