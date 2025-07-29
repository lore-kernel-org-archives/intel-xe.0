Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D803EC83F26
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 04:34:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8114B10E5C5;
	Tue, 29 Jul 2025 04:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CBQZ6wgE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF5A10E5C5
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 04:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753763679; x=1785299679;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ciT21SGLoQpN+Uq+X+8rR58uJVWBJgELzlt8ys4v6IA=;
 b=CBQZ6wgEsui6veBQzE8WHObGh+dSBBDBNqRJwjfGLl7ZPUH7XSq4ReMw
 1Xy/1uiI+SaRFfAzDzA+2agPSPzB8a7RD6taeGSoOM9HReyKZTND4HMdD
 hJQO/pyiwPe6TgVvJ5pPrEoMQs2tyyDY1n9g1ux+BZVi8yGdzyag6d1Ud
 WiV80UnG0qUOmCRUx5dfAGFpPDwNgh+mOhBtOATsClB8wcFVEjR+Giklg
 MJydFpkzgbRjz3Xdh0sf89vD2Mshixii9W/sYHfvrRnl2a6yUIeaxGAeQ
 z+kaS6dazf1WswSUn4HG8NJ6BjGrFbE2FGb+mb8NGtB1IcLF2xz2DYSF+ Q==;
X-CSE-ConnectionGUID: WxLNPuAsQ1Khc3cEPH6PoA==
X-CSE-MsgGUID: amisNfQUR/2OwJmdGCRWWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="66728519"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="66728519"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 21:34:27 -0700
X-CSE-ConnectionGUID: AfUYhAiPRh2TFdXe314iBg==
X-CSE-MsgGUID: mx1I5RHYS9SzCeJHPHljuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="161854705"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 21:34:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 21:34:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 21:34:27 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.60)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 21:34:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYn+2iRIWD7nVcvsOV5WQWwFdwCbFZO1Pc19PzOhnCX2DX15YZqAvrBEyG7PbUYOxj7GZNi7zdDp+zHlXm2Kv3tn0oT/2Vf2WG2d/Kz8Gr66fr5b3i/QI14j+veA5aUal2TommUJaiO/A7U4YhhgXGQNpMBhzxbpjG3RSNQr/0XchcYvxrHfcdxtCON8H8ncZHw9tebuLIhQdKfaVoMNgDPW5SdebJ6W50jzZk/7YA4yMNYrznRTddBtAzbUWz4lv0i3u2YNgP7GDFs/kKSRJVRN+ghJVFoyY7zwZDROIbnQloZKGR92jlSjywPf3oTlKyurbfHTOyIoLXkInkTmSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNeppZ4NWdbXW//wY8FBTVYZSdj+Qh91VissMQUuYqQ=;
 b=tgbf2Ksy/KIPi1QMrrzw9aHJCwcCsnuFtiK3DsdMPCvdYCFGzfLxV2tXkcxyKi0aeWptWhyZwuY+JakrkeyYbY5oH45NTpQ+hBQn18pOheo/aCgbNl6Dogv7X/0SPikr3qdqpO+oe0QwW51193V1HgymbFWDxTO2KZlCbKnsTon1U0yX7c0NPBlJCNx9FVQZStvPgKIXmGiObC0PyvkzfIKIaBI+k1sgDThkUDSwAOc4e9PQ6AcKc8q3UWVtWL+q35ilAhGkcJ++Ggzl0Jv6Pn6s/d6XLCuWwdfkDhpOFlmAuMwU5u7kT6s7o+tW3bkGtcGJ4g+mkgHNgnZah/9rbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7431.namprd11.prod.outlook.com (2603:10b6:510:273::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Tue, 29 Jul
 2025 04:34:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 04:34:19 +0000
Date: Mon, 28 Jul 2025 21:34:17 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 22/23] drm/xe: Enable madvise ioctl for xe
Message-ID: <aIhPSSMiEkshMkPR@lstrano-desk.jf.intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <20250722133526.3550547-23-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250722133526.3550547-23-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0177.namprd03.prod.outlook.com
 (2603:10b6:303:8d::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7431:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b518af9-964c-4861-64a7-08ddce592f5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DobiCbeVgCBcuM9mQgDLK/oN2dkKxzBKXwnqcOW/m3vMkApg0ljPxFYgCVLs?=
 =?us-ascii?Q?n5dxLyfTF04mnUIf1YiIaF3P5d+a+5sYMaCQX0LK2FBrWHnAVwYLmdyDfmoI?=
 =?us-ascii?Q?uzR36x60CO9Bsutfocp+VXn7KTlBY6V94Uq1fvkcMPUOjL+Nnw1ffRYPNwEl?=
 =?us-ascii?Q?ZIbw/+UTXk3DxOusR+Fu3SxKXc0JoLOZLSCWAkZ7k+1CbRy9LpFzTpDKlldl?=
 =?us-ascii?Q?/jOny7K1chKemybENM8voBBvtuObkzFyR5e7yIqq7B7Po+FyzufI57beFT5h?=
 =?us-ascii?Q?xns9Dj8ZAvvko6vfzy2jmjSqL8AFMjU0F8mqbREu8zrHfnzvxcVSh4zErNjG?=
 =?us-ascii?Q?KHMRDlgRPxSMV5n9eLNIqvuwAKiojkhyY2APhakPhhfLignkxFBmRHBXSCgD?=
 =?us-ascii?Q?ZT+STRjflbk2jqq8aKvUCzTXjKIR27PeM5Ddf0B4jYz0pyhJJWrnl4J0sFLS?=
 =?us-ascii?Q?phJ7RlgViazVD7Z+Tm265BOKy7eQspU2Q+nVSHGpkcn/jdt8PD3Mo3LXELjm?=
 =?us-ascii?Q?0yaH4tZ+K/BhLT0r9xxxex5h8cB48j2VQ1fY23U/g748FZs5z0gPY7uYsets?=
 =?us-ascii?Q?JBJnrD08nHoXiVcKXj+W0gYnRfg6EwF0lWlPx9/V5jZeKQkRTQE2DJ7wczIV?=
 =?us-ascii?Q?6F249W4uUZFOhbjMgAbNHRhfTT3178OX5iS/jktxiyP3vQ4WhrACriXFRNyV?=
 =?us-ascii?Q?Ief/6YiTprhj5gATQbkUG6rp07fSeSJQxzy2WD4Ly+FfY5r2cs7qoCXQBD89?=
 =?us-ascii?Q?16izwyVOaEj3/UwVGfqHTowtZoPwMgIRydsaJZicYemQ3E2jRhyEImNEqN9W?=
 =?us-ascii?Q?2Lm/G5FTC0V1+syQMq4vEAxP7auDrY/ydONN2IALGWy4cpC3LdPCGdpaew1A?=
 =?us-ascii?Q?I0ECD14T60XXoKyfAcwzpjrROgA3NYRncKG5TF1vjwWD7IsycOhUJOrEy937?=
 =?us-ascii?Q?9cWL0128KobVHTe1JU3zRPDsstfWKP3zZOeit7fAGH/iXFcBFhDLJYyjjgqU?=
 =?us-ascii?Q?ucU7hZT793KFkv74YSDEgOVkJ/22UxkU0s3QhUsim4PLieuLo3r0PEWFUziJ?=
 =?us-ascii?Q?d16VcdcYQBRnl3WXL/5ozcuxw9c4Q9jJlCS85pa675rIpNB52nJOkLMsvmc8?=
 =?us-ascii?Q?Du0WXYFVOHSQswDXyRtqzdmZc6MeAIGaL2joV2ECHEPP69Mooxkjc4b8SO32?=
 =?us-ascii?Q?hnjOZt0HHk0F3rUbD0hza38p72o2//nbPAwAbOokE5cKvirxWYSO6leP3MWb?=
 =?us-ascii?Q?0DF0A5JIGxFxlwtx2dMtRkAHO+3Eq2tG8uGEj7DQZGgu1iiy7yJflrTxYh6r?=
 =?us-ascii?Q?vksaRFAhGO6XtVEtTI5Yx6NGnd9OqiWnlKV7jR/A29ISQhtZim9BbIKWAxiw?=
 =?us-ascii?Q?JFA2yJbB71xF3MrGJQ2OOymKPNquw+x7pbxiRgiXhxVXEyMQHizulLrzPSDK?=
 =?us-ascii?Q?GVwDdMFaUqM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cPAsIR8g9k2NW3qrtcbONXJYIOC/wGL9vG2fN/dhlxNIwfOLFF9DmfS5oBRW?=
 =?us-ascii?Q?Mk7UFx3/emSozzG90Tm6zJkHwY9fCfmM/LTAax2ENbeJKIQbNRUc3B8aIHvy?=
 =?us-ascii?Q?9FKjUY27WXtXpqWqj3VAsIV3BC6b5/IcSKzdMZZZDaaPK47J87Iz4POoOQwb?=
 =?us-ascii?Q?6jEgUUABhsoFT4PX3QiXKugU4lxoa/iNWiY+1xGGh8CGXHAj7b43mOdvvqgE?=
 =?us-ascii?Q?Ldn+yRtlHuU5wcR5ZKjnsgthrmUNaQ0q6QpnFaDKVVnz1usRM+/pkMJ/Np9n?=
 =?us-ascii?Q?QVPJciSSw0rkBFN4aRA4swlwL+QySfh+lH+Ez6fad2wwTzKH50xVnloS2YMd?=
 =?us-ascii?Q?BLaDzPREf9KOy4NzDZpq51SbcFZF4JtVI6qt1aO7KMOTfU0Gn4+F3kMA5mBb?=
 =?us-ascii?Q?Z098yPDEERLWb1bUdno8vq/McJUb9U5409E6Launh/YIwZTxWQ/Cfjt4ZVqV?=
 =?us-ascii?Q?m7n9BuY5BlRKsbdgerRxtqVk/L6BrpTdSfsXJdM5x3QWvOkw36EJJypVW8zG?=
 =?us-ascii?Q?L70lfwpj9AJW+S8DR5+JGD5zDK42DsBMt5qslpu2l81mvwVeAYxiM7vCapqy?=
 =?us-ascii?Q?6BRX/JT58AGfFsfIAeaeyWUMRWwmwN7O6WCUwSV58WucbFgcdtbD6q4jcJV7?=
 =?us-ascii?Q?un1LTyei81zcGOnXJqhbCO4ipoVR0uxbNTiHLyzIDg+knOOVkb7ThZTYT4GV?=
 =?us-ascii?Q?ipkBx6bVxpo/JTPte7FA6svU3ERVIbBJ1IZs+S4awd1bJQhi+2OMPoaqaQIj?=
 =?us-ascii?Q?zqg2IrLAWWQ4ZDAR4HOYeU07YdaB1svIdJWSgx7LgQA5WLRFOEhdxYqfGjCh?=
 =?us-ascii?Q?1WnNUlo/LnI6I0FweDOPVDUUXFR6iMGyc2qYE96JzvyzpFVQM8LkKyI0A75M?=
 =?us-ascii?Q?gSWFgo0DjSCogcngXMDC5V41bjVHxTBHqALLf4X1WbmcN6870IdzTY8pU4jW?=
 =?us-ascii?Q?OeshQnXy+W41loeh8qOHCotmWCF3uG3o4POVDvJ1kq8y/9UCZXei10up7JUT?=
 =?us-ascii?Q?ISf62x/nWGHd8rydYdAJRVKwnejVq9VrAY6mAXzpeMBit+xkjJfjTa5T1CVy?=
 =?us-ascii?Q?NOUQWULUsrZVaxN9TI3jRhlTLJiOLkggsT55xkwsv/5ZVkVXR8D3zk4KYZu4?=
 =?us-ascii?Q?Abcs6gXCgopn3HieN9GRV1Sx3nbbyq8rqjgW/eV9JE+irBeXGVJ4Y1H0/UB+?=
 =?us-ascii?Q?8SoVCw4eGS2DsgEaDgYFYzTdFx5L3Zz8PYDh4oZPjjQfsZAcx1Cbm6oMoYRs?=
 =?us-ascii?Q?+dl+V0uaZdEqDTUNbX0LUdlisjAGmzMZkiMr6GloXbYzRA0htveI4L7IyYo8?=
 =?us-ascii?Q?LzeAUciET83bFv0FAfJ9PhVeqRZ4x2fpI1dMvvvay1IZjYyaV8Mn4bPt0heb?=
 =?us-ascii?Q?T3xo6kMkwWuEVdP2wqoJy32xh/o3TEcCSLtpFDvb8oGi/2DJJEYd/5bZMoY8?=
 =?us-ascii?Q?lezQ196HHedW6DHHX/J8P6BMKTo8gLWra/MjK9L1xPybEASf1PotfhalNyBy?=
 =?us-ascii?Q?ZMs38/3F9D+vmUB9K+qEZ8UAx/vfe86Ic2actnwe3RrZt+OBCNRK6ZI8xpXu?=
 =?us-ascii?Q?6cjqe6SVqKe35XonPgssN67HZ2Gj7Xh8USCwpF6VaWdIX/bSyfuDI5OFU1pF?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b518af9-964c-4861-64a7-08ddce592f5b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 04:34:19.9391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oELdDB5fq0UK16bvFkmq2cjhEWvJd6Z0o9Y/4V7DZxXySDGPwd3WKHXBILti9WgMDqhje0IS6gVZhMu2dehSdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7431
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

On Tue, Jul 22, 2025 at 07:05:25PM +0530, Himal Prasad Ghimiray wrote:
> Ioctl enables setting up of memory attributes in user provided range.
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 6dc84e4ed281..b02c4ae0fdbf 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -63,6 +63,7 @@
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_ttm_sys_mgr.h"
>  #include "xe_vm.h"
> +#include "xe_vm_madvise.h"
>  #include "xe_vram.h"
>  #include "xe_vsec.h"
>  #include "xe_wait_user_fence.h"
> @@ -200,6 +201,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>  	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>  			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
>  };
>  
>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> -- 
> 2.34.1
> 
