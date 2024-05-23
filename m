Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4F7C25B75
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 21:08:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550B610E992;
	Thu, 23 May 2024 21:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iZS9C5iQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3439E10E258
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 21:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716498503; x=1748034503;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cQ/9fJJisla3T8wMwH/WvSmB1KU3dtFMxeB+UB56TQU=;
 b=iZS9C5iQYfHnMbdHhYdikM2bbEp+d+3ZWl4bB9mANhfP9RmK3l2X+pct
 OBDxUMeKwO7u/wZQRzgZXawq8r+tk7HZfV56h11vHR9O0wnW85CMk4sxI
 joK1ohD3HeizQ3XA7l6geB2UctP1IngEkLq+NPuD0eOAKGJVsELE81Qck
 abhCGbd2V86agD5PJEfkOvu0Dc8IRUm2Q6xbB6AKc9L7p+N9hl2YCMs3S
 /99Fi62cOXjwxYpYv/bnBclTxh88VbtnxYoCxSNxaLHz1YhVmy6VPvNOk
 hntDm0BJeDZ3VN97Y/+1fyIGZHx6+u2agAhzUBpawYHR+Hy/puE2rAmCe A==;
X-CSE-ConnectionGUID: wxQ6tBNnQGu+YQ8WW24p6w==
X-CSE-MsgGUID: huymgUHBRru3zgTEps8zSQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12697291"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="12697291"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 14:08:22 -0700
X-CSE-ConnectionGUID: A0ZLG0QhQWOsuHTZpwbzHg==
X-CSE-MsgGUID: d/gYeULuQsuOjSi/FDp11g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="33912601"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 May 2024 14:08:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 14:08:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 23 May 2024 14:08:21 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 23 May 2024 14:08:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4++HlSNXJNAjVUbBqu6OdN+6EtLGhWnAgz1HmxIqsmrrE3z5n+9oKqyxsf2dc7iNNH4KJ1HAnP+DAyG41U0bUamtrg/ZqYohI2+hJy7HMGf9UK0c5j5WDQ1MijGtvbvhMqMxN3TFQwh+v5O1LT2QhXbyzn1Au3RccEf7TB4/BO/t3MTWnApm45OeV1U4BbQY4sJEyaujVdZtFPvh2zlyR7lt+Hv+tZ2YC3b3+d+KucXugQXJUQDBnxTZYukOwP50rp5G55CsbNxMyCpkvYy+vH/QoeHR2EGcm2qTyRdM5XblatM3Q08U5yLGZ1+uWzcm1jdSTuZc5HoiTXZl1dKhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWiwZ2OKiatGTpvysDyGNwt43IUuwLTB/RF4TxMEjxI=;
 b=oUOhumCAT9I88vIhtuw0dcx9+IMu9Igsmq8Ei1hy+Osj87kkOpXaYxrVSI/i4Ud/res6McEJ1vFzj+XHBcvObSfZN/TDPkP5YeGEl+0Su00dn7BnvFlWYUW8hasKtzozqcOugeH6lPh9P8mylF5FDB0UDfE8ermY1uvXmOvwE90d8z1ciuIXaGzSjw/W8eV00bDKhTXsqly7ZOJFk+C0nFKPZqj7bj3adtaxGLnDGFQiewVjT0Vudk6gltAV50TTlM3NTbAwtNaApimgsDtieuP3C6St3PhsLlrUnlEsBQFcSSVx/tR1Dv6/6mWOK8ccWEua3eUSEIrb8+B8D/FPEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB7871.namprd11.prod.outlook.com (2603:10b6:208:3f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Thu, 23 May
 2024 21:08:19 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7587.028; Thu, 23 May 2024
 21:08:18 +0000
Date: Thu, 23 May 2024 14:08:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/6] drm/xe/vf: Provide early access to GMDID register
Message-ID: <20240523210816.GB5383@mdroper-desk1.amr.corp.intel.com>
References: <20240523192240.844-1-michal.wajdeczko@intel.com>
 <20240523192240.844-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240523192240.844-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0276.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::11) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB7871:EE_
X-MS-Office365-Filtering-Correlation-Id: b4ffe63e-7917-4d31-5384-08dc7b6c7875
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zyPuB9u0PFwokjkxVVPMjmWDGQyaBll2dVUEf3Ymizj/MFgxGptWYZts/34F?=
 =?us-ascii?Q?U6LAqMQua5carNfT9NqxZ5D+8Ctv46LucvvDNZEG0oG+vy3dmza1WstPjXAB?=
 =?us-ascii?Q?a4knuKPlrUcXaElC+aQTHmrLjFOEbWJMpWrp5ZFy65kbYtJOmPxmK+lxYtsh?=
 =?us-ascii?Q?AkTq0GCFpBlHtV4wbC/9HUgGUMmK2WxtUxPJlAsKnoMDsfcaIwq19ly1XzSa?=
 =?us-ascii?Q?wfain+SqFhDDnadbZEKuKdKPQFAzHnB03gE7Abgftq20OXHuE2F27ZP2AKVW?=
 =?us-ascii?Q?wBVd9n6jevPi5DY9+avxmi62ZFv+O0OpcEZmKlcf5adwS8JiqtswRg0Tm4sz?=
 =?us-ascii?Q?/L2Hu61dQPc/3s0Vq7SqwdKxNABEYXOn9zgyyyqI9ZMtMrvHGxZkERBqT5Lg?=
 =?us-ascii?Q?M/QlBqOrUHV8Zo4zlCuJK3rCbSEHprBtJix0d0sJgcjydN5WkKaG0KsMmw4z?=
 =?us-ascii?Q?fxLHpgLSJIvW/ozjOrwjKwEQcPrMDKehtxwYGS+cY11nFCtanj958kHhr8Hr?=
 =?us-ascii?Q?wqR6vikiEB8TdUGLM9ViPzlg9okMRhoS/iZctwk06uB38epq24bXJ92Ml4fY?=
 =?us-ascii?Q?N/x2sfvD57d9WTHQQhjA3cKRD0bKmlboE5ois5zP82K6BOLEYt8w0E6uJuAo?=
 =?us-ascii?Q?1jKIM9yDMxWKk1TqX3xiYPQGf1A3Rjej8h58xiC1sh5r5dGgSq9uTa9+hUIw?=
 =?us-ascii?Q?pEJ8TYuzG29MqT7Z2joRvxmeRSbGWsvXH4jaTGOIR6WvmcQ3SCSzGm8hgqJl?=
 =?us-ascii?Q?/5ziTeEpabkdVAWwof7HkdlPPiOCwoPnaO7lX/SXBDrgl4HucxeZmD6Krpk+?=
 =?us-ascii?Q?5KbPNY6t1cLEC+GltEWuTfc0GhBirDPUp+IuzN4LJUg602lRgR31aMjlJhYd?=
 =?us-ascii?Q?r+Oca16a0Ru6xvu6VoLmpuVsb//mSoC7yvq8Fa5kGrxnxd4KZ0SRF97VI0p2?=
 =?us-ascii?Q?PIYoMMGlpci2D0Sah5BnO1Ij+jbMvvTQ4WnjAi9nWDbXXIonxTVc99MmnmTo?=
 =?us-ascii?Q?duxpMQrqK/Nq/FYpgrVAV+cxi0L3/WXIcvTXyKSKdmVdMhWHuxFkji612Lph?=
 =?us-ascii?Q?DreabplCfol1xFTi23nUvdPv7w/wLiCRN3x6WPVu362yFxXbIKeMp4n3V+bc?=
 =?us-ascii?Q?LU7htGq5FjOa7ufJSUm97bTTOqnraDd9TW+6NrqqKiBtVVUKkwVs5+Bg16Tf?=
 =?us-ascii?Q?RmByKTcA0F3eAonf/rENaXxZF1tROy+67A28lUkjFonu07cMuQEn+uA4XVEu?=
 =?us-ascii?Q?oZmamKbtAePAgX5X/N0jzoc12qBGk6RfHVZfAAIGkg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8J0jYxm7IyxHRPcRzwHQu/R98/H2t3+/ptxHSJSj4TIedhCqBycMuv/36+M8?=
 =?us-ascii?Q?ytIzP3hCqWGsQNElFE0Xz5wDi+uaKE5L/XMXHaXPrkLP9tYD0R2MpPr9kifc?=
 =?us-ascii?Q?388FTMNs2NuDQeVZNxm+DXb28+UZ7BQ+oEuy4oigpcwHr6gDAD1yUxVf0Ly6?=
 =?us-ascii?Q?xGXxxTzWSN+UGsMNTnBaex7NhadxuXlCYvxlHixWFhtb6K2KHb4bRk/WTgEb?=
 =?us-ascii?Q?9Kbq0b88L+OagviXjDRxdjxI1qJT9mTn99qyU8SdsYNSUepmk+mPtjBqaANA?=
 =?us-ascii?Q?hvskecmoSA3kA1lGpmBYCMBvETl2iQLkb80FyXl7wTfN6jFyYYyzwNDTUDKU?=
 =?us-ascii?Q?LNPSTAv0ojS4PvKT0/Fs75556VdMfnZAlJOIf7aM7XHwk65Y+Us9RHFZYA68?=
 =?us-ascii?Q?ofPS8yH7yN1EmGG+IpFDrmmu5cNpaETcVY8Uj/o9jvXkK/Mab4tylS/yr/qL?=
 =?us-ascii?Q?B75ygyLNnD1EMGbmUpgtBkBuQZgGkQ+jaBNnYj1YUCh9TMzRkTpYdSHdZQYs?=
 =?us-ascii?Q?vNzOTM1BF89I5iVTkdSSbSyUAcQwN1l6B6AbhhRXLpO/heOy1Al8be94Bpzb?=
 =?us-ascii?Q?93aZPIe5Ce2YmVUKe8WerT3XGX6sY9KRTjI+FP5T4LLjVCfbdbu+bfnZUuCr?=
 =?us-ascii?Q?sXw+y0sX5XXFsMnPXN9fzKO9BiXgnj5N/J3WvKLoBTcM85vsYCWfQc2l+dRB?=
 =?us-ascii?Q?lkF/8SgODGlKa3VTTPPIHGbs3KTV1xoZ6XnwRLcnfRAbSbvUxpBExwZTUoqf?=
 =?us-ascii?Q?aN0hwXuHUR7DIN1epLk2TyoZFHj1TgqKIIPbiyj8aMSrIFTrN8F+0J4++VhV?=
 =?us-ascii?Q?bvCutLpX+m6DaQCFFcMEwzKlWX2/35cNA0Kc4ACOQUaPYQX0G4u1YRWfeife?=
 =?us-ascii?Q?aLCttBRHWEcuvKt2IPndp9GPHA99wMxXgLjONoma6dVVuQBO7s09SIfT7hU0?=
 =?us-ascii?Q?Hknhjilw1B/NDAEOjluY2glNY1UAFSdNBKlf67b837S2zk2ey2cDTAQBV8IO?=
 =?us-ascii?Q?DL1rsImf4gAkJjaq/AiLo0WHKiolI2UYUr9nyG1szQiM4a85CTZxPg4sylxM?=
 =?us-ascii?Q?mDul5wes7G1ic3vNY9rPiNw83bBwi0W38dj3SmaE7g3Cv4O6/mfL/l7Hi84K?=
 =?us-ascii?Q?Mjym3mxz+3sLJrOwV30/f86ca09tWx7GvY6uXjRJuhwKeZOLOofXqz5dYaT8?=
 =?us-ascii?Q?k+RI4piPOtU9py3lMd0E3vp6zLsv0catOw3Dnyv1ezxrpgE6V/AfcWWIVBM+?=
 =?us-ascii?Q?XbLxq0BVwSEWcqdH5FdCsm4/zXbOSI6y6nqaG2p1fsW9PajrPPgdKHevxzAC?=
 =?us-ascii?Q?EvgnoxG1aVpAFAQmcFNfp9Iv2J9ezr0hv/wyvi25+uQPpMby5JyAjEfMG6Jq?=
 =?us-ascii?Q?o1RAU4evRIn2omcE/EQixTHRG5UBOJRzGTFDk3gOGiczM1LgvJlSYLDmncwG?=
 =?us-ascii?Q?TbfaWh4aemD8jdnZUHDcsc2+NCRYr2M6aqbeM37UQnZ3/+6xAJ47bvCspMRR?=
 =?us-ascii?Q?7SrSCy17rz/SU8SY1+AdYm6hhn8hvc6lw5r+kJP7TaS3kiUj0z06y+tYDto4?=
 =?us-ascii?Q?a97sQY629WdUKwhFqh75fKrPOqJ0qa9DYLRIt0aJzwW1K+1zGibpJdpdDZS5?=
 =?us-ascii?Q?qA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4ffe63e-7917-4d31-5384-08dc7b6c7875
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 21:08:18.8811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sBrPxkh5YJDMOGHeZVzj0MeILVdLSKpL8lY7VX/v7gS06WOhlZpjT5u26CRjJh9HoBnULbkC6mgqKuNwvpLI+0IROZI3kttMPUs5Cyekvig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7871
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

On Thu, May 23, 2024 at 09:22:38PM +0200, Michal Wajdeczko wrote:
> VFs do not have direct access to the GMDID register and must obtain
> its value from the GuC. Since we need GMDID value very early in the
> driver probe flow, before we even start the full setup of GT and GuC
> data structures, we must do some early initializations ourselves.
> 
> Additionally, since we also need GMDID for the media GT, which isn't
> created yet, temporarly tweak the root GT type into MEDIA to allow
> communication with the correct GuC, as only it can provide the value
> of the media GMDID register.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 47 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 44 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index ece410289f6c..eefac633dbc1 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -20,6 +20,8 @@
>  #include "xe_device.h"
>  #include "xe_drv.h"
>  #include "xe_gt.h"
> +#include "xe_gt_sriov_vf.h"
> +#include "xe_guc.h"
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
> @@ -471,10 +473,49 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
>  
>  	KUNIT_STATIC_STUB_REDIRECT(read_gmdid, xe, type, ver, revid);
>  
> -	if (type == GMDID_MEDIA)
> -		gmdid_reg.addr += MEDIA_GT_GSI_OFFSET;
> +	if (IS_SRIOV_VF(xe)) {
> +		/*
> +		 * To get the value of the GMDID register, VFs must obtain it
> +		 * from the GuC using MMIO communication.
> +		 *
> +		 * Note that at this point the xe_gt is not fully uninitialized
> +		 * and only basic access to MMIO registers is possible. To use
> +		 * our existing GuC communication functions we must perform at
> +		 * least basic xe_gt and xe_guc initialization.
> +		 *
> +		 * Since to obtain the value of GMDID_MEDIA we need to use the
> +		 * media GuC, temporarly tweak the gt type.
> +		 */
> +		xe_gt_assert(gt, gt->info.type == XE_GT_TYPE_UNINITIALIZED);
> +
> +		if (type == GMDID_MEDIA) {
> +			gt->info.id = 1;
> +			gt->info.type = XE_GT_TYPE_MEDIA;
> +		} else {
> +			gt->info.id = 0;
> +			gt->info.type = XE_GT_TYPE_MAIN;
> +		}
> +
> +		xe_guc_comm_init_early(&gt->uc.guc);
> +
> +		/* don't bother with GMDID if failed to negotiate the GuC ABI */
> +		val = xe_gt_sriov_vf_bootstrap(gt) ? 0 : xe_gt_sriov_vf_gmdid(gt);
> +
> +		/* undo */
> +		gt->info.id = 0;
> +		gt->info.type = XE_GT_TYPE_UNINITIALIZED;

The xe_guc_comm_init_early() and xe_gt_sriov_vf_bootstrap() above also
make changes to the various GuC0 structures (which might be "wrong" if
we were reading the media's GMD_ID, but I think all of those changes
wind up getting overwritten later with the correct GuC0 values again
later when we initialize the GuC for real.  You might want to add some
kind of comment about that, since otherwise it looks at first glance
like we might be leaving GuC1 state inside the GuC0 structure here.

Otherwise,

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +	} else {
> +		/*
> +		 * We need to apply the GSI offset explicitly here as at this
> +		 * point the xe_gt is not fully uninitialized and only basic
> +		 * access to MMIO registers is possible.
> +		 */
> +		if (type == GMDID_MEDIA)
> +			gmdid_reg.addr += MEDIA_GT_GSI_OFFSET;
> +
> +		val = xe_mmio_read32(gt, gmdid_reg);
> +	}
>  
> -	val = xe_mmio_read32(gt, gmdid_reg);
>  	*ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val) * 100 + REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
>  	*revid = REG_FIELD_GET(GMD_ID_REVID, val);
>  }
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
