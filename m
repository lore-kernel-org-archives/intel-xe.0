Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977F4C5AD49
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 23:45:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5090310E6D1;
	Wed, 28 May 2025 23:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EmQjA5e3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02CF10E6D1
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 23:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748475958; x=1780011958;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9TIIXHHpmjvaasvfC/555GjMs/1qMlU/z6jgpicAG+Q=;
 b=EmQjA5e3eSRw3zaH1KIlajZzpcpLvGCiwaQNfvOl/e2dMRE4Jlb7eKbI
 Lp8CDk+/UVHUD0ZkPmhMHAN1Ti90B/lOOm8TWaPkFXf/guy4OGlx3KWVA
 FXYQ0hnAEutQigDzJeJgUy2MAU7zFObRf1z6ljhsT7Y0o9w1tjyqtZgxR
 rZ9mfp2qPFD7LFy9sD15ITtnWxEl+aLY+6wJYf6JUOK0y6K3flNzJLSpJ
 E8fCqz1qQlf05yRRz1PBC6zF9QTLjsVvSHGdxwMzePPZVEjyd7HmjSfOc
 CXhFvTH1h+KYfH18053E9/JLHWszHlZ0/Q+p5qFV80E7kdvbbsn6IWHyq g==;
X-CSE-ConnectionGUID: Uz0ooyn8QuuPr170JDCeQA==
X-CSE-MsgGUID: rFCBeMmkQFODzPTISsxDkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="60781628"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="60781628"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 16:45:46 -0700
X-CSE-ConnectionGUID: Ey7k3CJVTjSM1+BTYyUCCg==
X-CSE-MsgGUID: aFKfrJziS3iSw0ZGSEXTZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="143413172"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 16:45:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 16:45:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 16:45:43 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.83)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 16:45:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YUSw/fgMtKZUY3mW0l6cbbO7PPye8pRxKsRH9uVoN+HpKfotQGG7pvAaMgS5xdnEz9T0J2M0VkRAusbqbxuBCZFX82X07vsyKSUag3NeGGpqcnmiRkWAGWQXilwV1wf6ZQ/HZ4PiBQFzpJLvKqIyTqVa+EBykh7VqPEEgcRcf6uppg0vexkmN80xSuSjN67s6E3UjmT6E2iYqPs5Xcj6K2+bvgWAZMYXDc+OL7P3xFN3FFhhMmeWOFjxHpAXEWcRaE4UGsCU13qurkdD7dsnZw/sDsb3PishMK5IezEmhVdWlaQbT6M+n53B6IIUPQc1xYEd3+jC1IcSLI2RS+QCHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Evm9DzvEiCc/ckc3Ddj08Qz3t606ckUkR6MPQzE+/m8=;
 b=Myh2M6kRpEW3Naq3d4BOXSU/viZthh8tcNMJ82lrAKxREFKdU7SrSAI4+NH5ef1k6pooxZskK/YyxQtIFq86eUQJMxCpzbiYEHcC8yKdfs1NVxkuActLeQiKGJbZDgx1HFIGxtkIWzwNJ5AvIkjRyleBT91HjqzqLTguGcmcIrKRMbWMqRn0/slzqufLNfmZh7ENyDBuv8joyVDa3jRL+RgnjCT850sRaaNd7kWZfZp/Dt5AafKDJoVfE3G7oiLP7lmR6BBOu6SerJKkrUbqNgn5dgavacKJOLhHM3IcWnpEfHXQ6loYO/a51ZEOp9DrVIjwvh1VWWthG1MPSKdsdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7892.namprd11.prod.outlook.com (2603:10b6:208:3fc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Wed, 28 May
 2025 23:45:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.021; Wed, 28 May 2025
 23:45:26 +0000
Date: Wed, 28 May 2025 16:46:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 19/19] drm/xe/bo: Update atomic_access attribute on
 madvise
Message-ID: <aDegZWGbMc1pNw5V@lstrano-desk.jf.intel.com>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-20-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250527164003.1068118-20-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0326.namprd03.prod.outlook.com
 (2603:10b6:303:dd::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7892:EE_
X-MS-Office365-Filtering-Correlation-Id: 51434c56-7011-428c-1b19-08dd9e41b0ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?upoO+WNfu3kbDN1Tr9+3e12U45JrdXnbAikvAbx9Q9Sap+PZmOvLcdNrQgwu?=
 =?us-ascii?Q?bZo95E4/XSM0qn1NUckcKHKuq5IWg+EY5IZ9aC7juSYHwkMN93Ck4nLjkTuo?=
 =?us-ascii?Q?slc4bSglWNrtGNcYV+aQg1lD8/93ykpbXii5cgaHx4bNMmj1aQd1vhIZ8Cpe?=
 =?us-ascii?Q?YJMmyRUWVddfHxrDokl+e1cOMzbFcyBOKv5Q/cyHfKEXpMIWzJWkhengg1wU?=
 =?us-ascii?Q?GMeHhMzzGCdBiWUZjjr3NUJ0FMG/9g2rMkYllQSeSyOq0NmgAkSBIBj9OqDg?=
 =?us-ascii?Q?I5dwfd9fNlTEC9MWMyfo3WcuCnvlEHYsSue2NzTGC/AQu352DWssnwXdeJCw?=
 =?us-ascii?Q?SIvTOJxmuZZ6qyibtXfe8LB3lO64Pzeu/Hh4sPes5YzdsiC+xn70+EwhjreF?=
 =?us-ascii?Q?j2dVg6shuMfFkw9WyAI7r2ks7bvLAOpEG/DiY2nKbGesc9XOkUSCqcB5dsL5?=
 =?us-ascii?Q?Jcbm+p/zQ86b78QIw8S3//QiU1qPYRDDH5AG5zqYmev6qARL/mzge2Vdc1f8?=
 =?us-ascii?Q?cMDTQ/dnh7iC3QlHA5EhIjbgWXTu3EWDqLf+tbCiBN18Ou7lfIMzGhP1bHpO?=
 =?us-ascii?Q?IV8+AUOqAqGv3xMLJUzidXg3WbdkT5tDggzHCrVr+SP6qMyk4rSJCL+V+Ica?=
 =?us-ascii?Q?rI3Qle12jdg+bwZq1wDBW2zQzpYbR8oMohurp6SwMi3sKdWap0DVCJqwHyjf?=
 =?us-ascii?Q?nctOmJxsfQn1hUCflU9KSyCQAzDhoZ13JYD4AgZPTWhME0qBs1AI6SwQWkn2?=
 =?us-ascii?Q?qB31t6EUeMbqefgd842DicY7TOvUfGk/b279fqTxqubGo/yb2ydtqInkjeMQ?=
 =?us-ascii?Q?io8xX5lE3FpfEMoAmfP2nENE2iiiCGwLizIV1sA+5LfF3w8CleTpR85+2wFQ?=
 =?us-ascii?Q?E4qSyhmYLsuRT2o/dDf4nCj9iW5QDeSIB2nGGkHAVYOgf1xrttav7aJEEuxW?=
 =?us-ascii?Q?FSHBH66yhdfotpZFhhBsdGJgXednPLKXCp02NdcygO3oLyKwd0ebpkAfeCZO?=
 =?us-ascii?Q?W5BfPCLh54t88CAm6JxLW+SGuu6cXdkibJ+pC4w1B+Kz0+/eaqj0L+h2xfiy?=
 =?us-ascii?Q?YYgNC169BkS2rtYKvmsWxkpxW9GJvb0TIgGP3ZCZCTvoI7G8mexw1ejuGDbv?=
 =?us-ascii?Q?y1wJpXmzTwCEFVw4HMYsAagS41CixENIo+Et6fAIl2ycwwDKdraXJ+enLnIi?=
 =?us-ascii?Q?0AfuMJ65wvAXoKtmGUL+Z5wRMfJgLMc5XWkZGcMdQv+BvdaPrIiom3+yrNRH?=
 =?us-ascii?Q?7hA7t11KT7i2mR75ee9SFIOe5fFze0QDK/1fXJcWQRSUTV47KsrKiAWopWt/?=
 =?us-ascii?Q?kjegMOtj+I/LUv9jZBN52137U8bq8LzBadtus0GzEmQoqyoqRSS+dTIEw7mQ?=
 =?us-ascii?Q?FITXIItGG+goAu3IocehCqgB9aVDVnlcATGLWTQP5OvoWila7kqpnT10jVUK?=
 =?us-ascii?Q?BtjhY9L++9I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xqkEY3+8d9QDNlhz/vro5da5ZmkiVU8NskH5GoLNLvMQeb8mrAgFp/Gi3mCL?=
 =?us-ascii?Q?D7gPE+/YZhclhCsHq64DuJ7dICYamVli2GCC2YAHYOgSRFdbdQ+G8BxLDvnn?=
 =?us-ascii?Q?Lzxeq9pnclOwCjbfRjx0U+SdpgZC+l5Ih0P+nACpOX+LVl7YK7dMuMYZX5yA?=
 =?us-ascii?Q?JuHUwv2BEXzvvcOGzu/U0S2X8ltJGAR0Dw4Xs/skTL7FWTVPvqmTr2FDE+zY?=
 =?us-ascii?Q?7PlBSJxC0AGipYXtnrOCpaaPBEqbNEblAV0kKHmAUkb3RxPCwMeh0qfVA/NF?=
 =?us-ascii?Q?PT0MQdwKkJCxMPscFHtJWEoLsQ8PF2nv4/o2eF1U9w4I9X9IFjvV1ArAc8NY?=
 =?us-ascii?Q?vmWKJB33+2uHYImF4nsB/+v1tcgCMlU+HjxQ2iZEgnwWx3KFAnOLAStj6R8+?=
 =?us-ascii?Q?vYd8Es1xALS+hjcqgRdlQRkVKDPUjoriD/6T04Y9zlmZzFnFG0HRseJRC2gM?=
 =?us-ascii?Q?s1jlqr/CTd81xZwszlCz57t5ltSKpb6CNbeA8nft0xWb9wL3RDsn31XKRrjo?=
 =?us-ascii?Q?PO/5kENPX6d/ran52netRZtc/OQdOQ3p6Cg8OHDG4dsogV/Uy1bBLRqzE/2n?=
 =?us-ascii?Q?IV7PeFOcOyiFkkr2O4vkootfdPBrODYSjrJj3CHEbkzGCFkbiKdveYxoT5VN?=
 =?us-ascii?Q?WUEAv6noxH5ACs32NS2Vx16UWMXw7fIsAfEkls9yWYPTiaZ7PRgMwUob1MkN?=
 =?us-ascii?Q?KJF2qo0rvZ6itISJ3KslN9sBXwG6mJYqcy6/H2DmHnzyqBC+IvFaBMnaF3od?=
 =?us-ascii?Q?/+abd2WZ6bLPpn+r75bjBgU3DatDeFL1aPb93WzoyZhWFd2uNesMoFeioC1L?=
 =?us-ascii?Q?L6vSO0T6Ijy5ezhwkDNh16DD1bGM4vkVqYBz3w5SraZ/Yq3jqbzY5a/lmweu?=
 =?us-ascii?Q?gehC/AeZLSqO9HP5eCEFtBzcQtGfegFZtBEtidakGPTT98eK0Kowcp+SXkOp?=
 =?us-ascii?Q?0nIy7wUiBwdsVp2dwSQxetzmLjIeT5NahfhgRyc6yrKlDoow8xCXBV5Uz40M?=
 =?us-ascii?Q?JLLthrFfdvDuuhox9BKX4K/p9k2kTGgnlXRLRDOu/vou/tgGzcClV8Ygoi9a?=
 =?us-ascii?Q?+iZngIn+9AHKpGy7bQdEwuFLuXWf4Gd8KrhFxZN7zBL2R6WjGFEk37NdR8ba?=
 =?us-ascii?Q?xvHBH4LQMc4JxZzflFDejx1Bf6TXDpPIuOnjA59uB19gk7o9knYRUjvS/Bp2?=
 =?us-ascii?Q?vHRN0CGVZ1G4xcZZRKPwn/L3zp6yrUJpgBbS5vIjVGPIhQnsGS1j6ZMcJe+l?=
 =?us-ascii?Q?eYGAJziUdgW9Jmo9MSectqtTZ0qykmh+HPVf+oH2vQXfF0ztlpK5wWj0FTob?=
 =?us-ascii?Q?64nEpKXB5os5a5Yschya2ENuWySgwOaXrOwgQLgj0D6clt5ZIeIZMu5Pextj?=
 =?us-ascii?Q?3aDHsJpKw88Ykf9fCuuFOJHzI/AIZOnIjpFqQ9gcr+4noawGiFv+xGrVTQJf?=
 =?us-ascii?Q?v1AmzCdRQGdkr9wkQzQQjqoAboJyfoYL+fxIAZDIJ0TtM9CfYLcyQ/odkWng?=
 =?us-ascii?Q?B+Vh6I90jZLAN5xRUl2MOIR5HtH1fCyOdgbVyxMLSVlgiY2Npep6WvrP2miB?=
 =?us-ascii?Q?qB07PoLCr6sBwAF/e9JpVZwZc1Ws5KBYFyEETdjxatW3ZKkjbviq3rJPRTv+?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51434c56-7011-428c-1b19-08dd9e41b0ed
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 23:45:26.8472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gmKtClhSmIVgyvMj2PtPPBQOB4ZC1uKypMsxWX+6yfiV8L6rXnF2TpPSOEBJhWxZFrcP9OEV742GrQrBMs4j3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7892
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

On Tue, May 27, 2025 at 10:10:03PM +0530, Himal Prasad Ghimiray wrote:
> Update the bo_atomic_access based on user-provided input and determine
> the migration to smem during a CPU fault
> 
> v2 (Matthew Brost)
> - Avoid cpu unmapping if bo is already in smem
> - check atomics on smem too for ioctl
> - Add comments
> 
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c         | 21 ++++++++++++--
>  drivers/gpu/drm/xe/xe_vm.c         | 11 ++++++--
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 45 ++++++++++++++++++++++++++++--
>  3 files changed, 69 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index d99d91fe8aa9..9072e8ae3f3e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1662,6 +1662,12 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
>  	}
>  }
>  
> +static bool should_migrate_to_smem(struct xe_bo *bo)
> +{

xe_bo_assert_held, more on that in reply to previous patch.

> +	return bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_GLOBAL ||
> +	       bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_CPU;
> +}
> +

Hmm, this is tricky. I guess this means sharded atomics on BOs do not
just work whereas for SVM they do (i.e., DRM_XE_VMA_ATOMIC_UNDEFINED
means atomics do not work for BOs but for SVM they do). I suppose this
is the current behavior. I think this will need to be document in the
uAPI kernel doc.

>  static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  {
>  	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
> @@ -1670,7 +1676,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  	struct xe_bo *bo = ttm_to_xe_bo(tbo);
>  	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
>  	vm_fault_t ret;
> -	int idx;
> +	int idx, r = 0;
>  
>  	if (needs_rpm)
>  		xe_pm_runtime_get(xe);
> @@ -1682,8 +1688,17 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>  	if (drm_dev_enter(ddev, &idx)) {
>  		trace_xe_bo_cpu_fault(bo);
>  
> -		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> -					       TTM_BO_VM_NUM_PREFAULT);
> +		if (should_migrate_to_smem(bo)) {
> +			r = xe_bo_migrate(bo, XE_PL_TT);
> +			if (r == -EBUSY || r == -ERESTARTSYS || r == -EINTR)
> +				ret = VM_FAULT_NOPAGE;
> +			else if (r)
> +				ret = VM_FAULT_SIGBUS;
> +		}
> +		if (!ret)
> +			ret = ttm_bo_vm_fault_reserved(vmf,
> +						       vmf->vma->vm_page_prot,
> +						       TTM_BO_VM_NUM_PREFAULT);
>  		drm_dev_exit(idx);
>  	} else {
>  		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 9611d7ca2bed..1bdf85c12374 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3116,9 +3116,16 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  		err = vma_lock_and_validate(exec,
>  					    gpuva_to_vma(op->base.prefetch.va),
>  					    false);
> -		if (!err && !xe_vma_has_no_bo(vma))
> -			err = xe_bo_migrate(xe_vma_bo(vma),
> +		if (!err && !xe_vma_has_no_bo(vma)) {
> +			struct xe_bo *bo = xe_vma_bo(vma);
> +
> +			if (region == 0 && !vm->xe->info.has_device_atomics_on_smem &&
> +			    bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_DEVICE)
> +				region = 1;

I wonder if it better to just leave region as is and let the next atomic
fault trigger the migration.

> +
> +			err = xe_bo_migrate(bo,
>  					    region_to_mem_type[region]);
> +		}
>  		break;
>  	}
>  	default:
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 0f0b94cb43f2..e048eb48826c 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -82,15 +82,54 @@ static int madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>  			  struct xe_vma **vmas, int num_vmas,
>  			  struct drm_xe_madvise_ops ops)
>  {
> -	int i;
> +	struct xe_bo *bo;
> +	int err, i;
>  
>  	xe_assert(vm->xe, ops.type == DRM_XE_VMA_ATTR_ATOMIC);
>  	xe_assert(vm->xe, ops.atomic.val > DRM_XE_VMA_ATOMIC_UNDEFINED &&
>  		  ops.atomic.val <= DRM_XE_VMA_ATOMIC_CPU);
>  

Do you sanitize ops.atomic.val prior to this? Also do we disallow a user
setting DRM_XE_VMA_ATOMIC_UNDEFINED? If not, then this needs to be >=
DRM_XE_VMA_ATOMIC_UNDEFINED.

> -	for (i = 0; i < num_vmas; i++)
> +	for (i = 0; i < num_vmas; i++) {
>  		vmas[i]->attr.atomic_access = ops.atomic.val;
> -	/*TODO: handle bo backed vmas */
> +
> +		bo = xe_vma_bo(vmas[i]);
> +		if (!bo)
> +			continue;
> +
> +		if (XE_IOCTL_DBG(xe, ops.atomic.val == DRM_XE_VMA_ATOMIC_CPU &&
> +				 !(bo->flags & XE_BO_FLAG_SYSTEM)))
> +			return -EINVAL;
> +

Note when we fail here (or anywhere else in madvise), we could be in a
state where madvise has partially completed. I think that is actually ok
as nothing in madvise is fatal as we are just changing attributes. But I
think we need to document this in the uAPI kernel doc that if madvise
fails, the state of madvise attributes are undefined.

In practice this really should never fail unless a user is giving bad
input or extreme memory pressure and kmalloc fails.

Matt

> +		/* NOTE: The following atomic checks are platform-specific. For example,
> +		 * if a device supports CXL atomics, these may not be necessary or
> +		 * may behave differently.
> +		 */
> +		if (XE_IOCTL_DBG(xe, ops.atomic.val == DRM_XE_VMA_ATOMIC_DEVICE &&
> +				 !(bo->flags & XE_BO_FLAG_VRAM0) &&
> +				 !(bo->flags & XE_BO_FLAG_VRAM1) &&
> +				 !(bo->flags & XE_BO_FLAG_SYSTEM &&
> +				   xe->info.has_device_atomics_on_smem)))
> +			return -EINVAL;
> +
> +		if (XE_IOCTL_DBG(xe, ops.atomic.val == DRM_XE_VMA_ATOMIC_GLOBAL &&
> +				 (!(bo->flags & XE_BO_FLAG_SYSTEM) ||
> +				  (!(bo->flags & XE_BO_FLAG_VRAM0) &&
> +				   !(bo->flags & XE_BO_FLAG_VRAM1)))))
> +			return -EINVAL;
> +
> +		err = xe_bo_lock(bo, true);
> +		if (err)
> +			return err;
> +		bo->attr.atomic_access = ops.atomic.val;
> +
> +		/* Invalidate cpu page table, so bo can migrate to smem in next access */
> +		if (xe_bo_is_vram(bo) &&
> +		    (bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_CPU ||
> +		     bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_GLOBAL))
> +			ttm_bo_unmap_virtual(&bo->ttm);
> +
> +		xe_bo_unlock(bo);
> +	}
>  	return 0;
>  }
>  
> -- 
> 2.34.1
> 
