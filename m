Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38B2C7EE25
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 22:50:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C198510E564;
	Wed,  7 Jun 2023 22:50:10 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8852A10E564
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 22:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686178208; x=1717714208;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kVI/O8+cxtSEsSLlLQtRxvIf1VAtwXoTVdLnlaO2oRU=;
 b=AROU960y5+FwZgbKPUrF5zPuaNz4Dps+2OlwyRclZX+3RNFcTiNBrqRx
 XjNQ//AfY0PpMlsmEnbprXRAxcuUnMwf8l3+ihkkE/35KNbd2v7Vs1JiR
 wKq9TLrvlH6E9jYk8eKYmsHquSgnNgYWsDVdNExrmnjW/yQf7gpt6IkHy
 pH/7Ax1OpEN2UfW2sK25Lwzin5LO8preZ8fIL5qK6M3tL4h9MIbMTO8Ze
 fee1vsaxV/4bdgbs4rcgNUbqJYVOdedvD5Vo8qAB8cVlZxfZcuyC1l81T
 KL6bbfAc1oJeZEB/33SClWZnplsEmMJroELN+86iKnspiuWRqBcc1QRdJ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="420691770"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="420691770"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 15:50:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="822355618"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="822355618"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 07 Jun 2023 15:50:06 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 15:50:06 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 15:50:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 15:50:05 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 15:50:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTsZcFu0XZ6anozh2DhrBkFsCMeD5bmUrGu63IRQ3briEdeYBh/uWmtRWRv/B6lNClTmmC3+gs9F/EY6iWh3/l9EWzdJpWnVcvL4sA/CgwyI+GIXmg8l/a4YYxfscKsI1kDgsThh/UB+RSdxdPoHxjDWyJx4r9FhCG9tgN1gWdD3Utj1ltMxHUMexlBlmCmbYdlxp+9ls/DZ9YVU42aq7VQ4x5LJa/yH2XXP8e1YzreOSrc77KopZDhJj3C3nWAoKc5rpe+U83INIAfqRruN0fYO0b2EmgF5QpMRL5Sg0jraPkn9CPq+j/3qvIgo+UdCeF589L2Ojhk6mTGsSel/8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CTPMVA7949FMZMvTzrXYRJi5D+qaMbF18P4XL2aJlE=;
 b=fSBjLEBVp8au97SkfdWSR7r1y3vJs9XH3pf3BULQoKXiULRXBrGtDXYSk7UrKEl2HlrgkTMsitQfuLeYDPb377ELLZcHjKDT737FMYyo/e15lErZKrlCAHgyt1eW3QEtli+PukM7GzosIHmCqkrHjsiuUWpW0Ymwjmv5+qDOSsr5HC9D5mevvgGyuNAFZXyIXc90Log1wE/UjoGDHi8dcx+Nk8I+i7VQb5KHFOFj73aZlTs92mmy5r0VqJJW2yTt83tGr/+9s9/XVCv/rh6uDM+348gXyrQUiNXbPN+n+IiiVPPjgcCGHC0yTcmhrP1Dxhrk8RJkO67czJXquEBmHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH0PR11MB7522.namprd11.prod.outlook.com (2603:10b6:510:289::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.33; Wed, 7 Jun 2023 22:49:58 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 22:49:58 +0000
Date: Wed, 7 Jun 2023 15:49:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <20230607224955.GQ5433@mdroper-desk1.amr.corp.intel.com>
References: <20230607223840.2835605-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230607223840.2835605-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::12) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH0PR11MB7522:EE_
X-MS-Office365-Filtering-Correlation-Id: d55477b8-1cbb-4e95-070e-08db67a984d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qdhDB45i9aPExGcUGGIiMZ+0kZnTQZ0s/dllM1vpq/0YOUqDwDiRkzyZBRI1GU+l9JSaV2E5k5AIEC7dxpU4MKva9ji/gH3+oDodChTja4pDahJ3itX1fAL8jqr0DCjdskOmyeVlx8kbbT+K/cOjQhT58fMI3FmNvALiragKA1wxPVY1QhrrAtWeaeHJUgd7ck66vxD1UYXRmSXTqJ9QL/FJ0KI5lXALoutuNV2mIhzebfUFITiH+qjbxk6Z/TN26afd48nK+Oxp2FQAC/aWwps4teV4XX9LO3wJmFb9RIafU0Z4VEQi6nKOPSdXlCON3ilFSW7EOJtZ++pSR4MRM4pN+EPwKRnt7W6QeWaj4VAAxT4Qa6OQ9ahfGMRM7IhOwps0iXb1MIPEErS/J/sUEYg/Tizaud8dderW0bQVkDbWAmJZiKWLS3HbLuxkq6i1AH3wRiw0o8YfvZjgLLTLqKRXnw97tw1J3YudpnmGgAwsadOKGX+2dcFfdGelCzweh8FAPeGuUk9Q5qq1Knl/YALc+FWKTiYZcsb3yybEKWB2E7zhQOmIFZqX25TaFq+T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199021)(6512007)(38100700002)(6506007)(1076003)(41300700001)(6486002)(6666004)(26005)(186003)(83380400001)(478600001)(66476007)(4326008)(82960400001)(316002)(66946007)(8676002)(66556008)(6636002)(6862004)(8936002)(5660300002)(33656002)(86362001)(4744005)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aEJ+J13awcPqiCDNV85hfKforO/73bR+leysEBdFzMA8rr2ghmIrYEXGEKU8?=
 =?us-ascii?Q?ppke8PYqZ1YVme7wJiep+ZJSova7zgrIcFc3qC3F6XVGaIPn1uja52sdQ/c2?=
 =?us-ascii?Q?712wn8YDvs0Q/sEsSnohkVywlYOJoy9UIa4gEiqGkgGE6+vvVdQqS7F//aCZ?=
 =?us-ascii?Q?zX6XRie2Uu5MMp2828E6brO3w9BfyeW4F25kmDNuUBRQIX1w59PYwYnd1DQ7?=
 =?us-ascii?Q?Q5P8/aGmLzyydsEyynPY2EREp/9/PUHM5/TLfaB+pt15Q73gay79U/wUR+qw?=
 =?us-ascii?Q?on+aNBQ5PoORDZm4CNabGOqOn/6PWNozjFJKXoltquSxmE//ctHnK0N8tP51?=
 =?us-ascii?Q?yS1pJiRBry2xM1DZmy1CAdG817jZS7+meoj9cLBvYkia93IqtolmC7hUaMI2?=
 =?us-ascii?Q?lUMPEe3MvFP9d/+3tT1ttjeWLvE4m0MWQ2sP+vMEMSU4p+/5GHApcjbraEss?=
 =?us-ascii?Q?aYRj0CdwJ0vCE5m3JqDWnja8VedZW/e0bHFVcFK6VOhZqF7jFTLib5L80j0P?=
 =?us-ascii?Q?Et7Ng2r1/JHoJUxO0DxkY5Lv0DxEYRJfsDyq6jmS/tkPAiaW4KnjsTcCqweR?=
 =?us-ascii?Q?ZyADFd3t9ayrA+KEGU95rbTv4kDzVbthEP3Wi2iUxctIKUmqLDLwlWwUhKi6?=
 =?us-ascii?Q?h+dqH4Oc95ma7wGuImzlWowTiCK1bcEJNSnLtzpWdqk8j9AcHUH/7ZhuDZte?=
 =?us-ascii?Q?gtH505ZvhLhh7OULcd+ZLRnahHglv+dmzQ9SQ8DkSedKpdaJ+k8qRzvkRRGq?=
 =?us-ascii?Q?JW9qiWoeneTK2wZeL4x90LjO/DLZjGp8lK4FT36zG39WEeEm3n4IqeKMuThj?=
 =?us-ascii?Q?Z8IsYZi2m3vxiU3RXIkS4lGbwD4OEJWywNWqtRwHjd4oemI03uR2k/AoN/K7?=
 =?us-ascii?Q?No6sQNKSw8H7tYeJr+s6CzuWS/Pj8uWacQ15RVrUJ6iUdUZ2xDtFVn5im4ST?=
 =?us-ascii?Q?iktCQF1z+iq35TUr925RCMlSWKnmlU4/rFGzJNtHL6yCGzQAsz+Xo0aUob+W?=
 =?us-ascii?Q?+F9DA8c5kfcRj8v3/V6jbxEWpQL+rtMV0wzE0yJ663Q7HmkDPRbnQiEjvTKn?=
 =?us-ascii?Q?CyJoOhbp4C5evw57A8W6GEUvgsZJgj3wMmLsQQnfbVOLWUyBfH5GU12AcUm2?=
 =?us-ascii?Q?lTExIkGNhZB8gq50cXY0n28wT+7X+7xc7LRNcTKImFIA7lVhCR6N4M81suas?=
 =?us-ascii?Q?+9LZwApiWG+4q0cIPdyeKo0OXZ8ozrnlOvKKIPx5PD0B+3ZvWvPuiwWhKfQM?=
 =?us-ascii?Q?dLbl+ZjJHLtStvvmTYkEvzfO3GOusvnoX9T39CaeY8wECCf0mJNoi8sPVMX/?=
 =?us-ascii?Q?jEC4rvdIq6eYiurN0MWmC93nYwTIJUDBkhbiWKCdfYU0eUEvEualhNBwrqiz?=
 =?us-ascii?Q?4MU4426YCHAnhjnXqC+ahWQtmZ3Fnq3QpCrG1put/YnmbnP1wyUdHytfgo52?=
 =?us-ascii?Q?XymkiJ70o6wB1A2RlAEHS4cFN6Tm2AjZZNcgymL1YIvJwo8eoRdofPs7pHei?=
 =?us-ascii?Q?t7I7H1Ni6t5ugyF5EaoWvmOseSRuJfbjTbrtjlpBO5R4eLP2hS+fSlWzD6PX?=
 =?us-ascii?Q?rsAvEG6CAoJ4si9ltrUp/Jn4fY9M/EWU9qjmkmYoguLkRQmauUcLS+OBWZvu?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d55477b8-1cbb-4e95-070e-08db67a984d5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 22:49:58.0806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aV5rng5BySkr9WokBRq3P7tLpRaGJZReqed75i9QcKSzg4rPaHX9D3dlUQlYE+eYLQPpTEJsSk3kksftPzKvIZwc2qHWU75Tdwy1Z9l02ko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7522
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe: Introduce a new DRM driver
 for Intel GPUs
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

On Wed, Jun 07, 2023 at 03:38:40PM -0700, Ashutosh Dixit wrote:
> Trivial kernel-doc fix, s/vm_id/engine_id/
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  include/uapi/drm/xe_drm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 0ebc50beb5e59..edd29e7f39eb3 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -656,7 +656,7 @@ struct drm_xe_exec {
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> -	/** @vm_id: VM ID to run batch buffer in */
> +	/** @engine_id: Engine ID for the batch buffer */
>  	__u32 engine_id;
>  
>  	/** @num_syncs: Amount of struct drm_xe_sync in array. */
> -- 
> 2.38.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
