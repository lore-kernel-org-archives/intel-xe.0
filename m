Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EFCC02192
	for <intel-xe@archiver.kernel.org>; Mon,  3 Feb 2025 14:22:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD4710E4F8;
	Mon,  3 Feb 2025 14:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eUHIBtkM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8907210E25E
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Feb 2025 14:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738592520; x=1770128520;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=d2UM0sFQBiXWWu8htJTdXuShriHdc/H09AtyS3OXRhQ=;
 b=eUHIBtkMTIMf4Q5zM9hlMHoMBUad4Q3/Agw749uboCS+P//ybGa60EX0
 Wa6kVr0bgeRzXUCdJKMQD/IUDUgyf6ML1BF93Bo9uOuLgzLCokq1up/5R
 QCDC4rWCUSI69C11mP93LB5lt37yh1unxM5ZgJPrhINO4bs5YlZp1IZ+w
 35dLi2XcNuatORxibLa8EiA+8yGke1fa5hTvdbGjEl+wDCzRhKBWH0XaB
 EDZzUt8LapNqgYsqxGqaiVsCMOU8jmawU9Mrm2XVfpyXY9xYyuHaAT/wT
 K0at0GBA3cnUAX3dqJHyuvwZ7BLWIuIqSO7AiSNI8yuF18YFVr6ney0tJ A==;
X-CSE-ConnectionGUID: JduNlNULSwaqeCmz6YH/gQ==
X-CSE-MsgGUID: 2Sfz/0oJQL+RbPN1XtPr3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="50076893"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; d="scan'208";a="50076893"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 06:21:59 -0800
X-CSE-ConnectionGUID: Wt7lSDHZSlus4kvZTRR17Q==
X-CSE-MsgGUID: 4QzFfJZbTwGjrfK6l59M2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; d="scan'208";a="110867705"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Feb 2025 06:21:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Feb 2025 06:21:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Feb 2025 06:21:55 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Feb 2025 06:21:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPytF4XtIjXEIlaJ2FoYQBN1mvb0yffrbmQFQlCoPtDCx95AdZbHkUgCEIiZhpHTtEgJRfP8WgNZmF9LLr84qn3fWI1AZQLXq7mvuqyVBAl1Epk+BWh5Rd8VgVEJjsAGkep8ZNgbPcWlcznCVDfEgM52SYiEkeZy/DuxVVUvO/4/gyJq7Xu4IqTU3Int4rrv+GUg/eFtf2VaHgEfakXPUoPUdYoOFRDZW56N/rTw9YHPh/eZf3CTP7H1Kn41Nmg+pff0DU3wxzePatBE0aLu/U986rBomEnV2T48Rjlg0zR7XxOAvumCyNT/cBDxg+yBZUuFoLmc2MqyNby+jqRgEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BD6JzUEdM6XgdpcuK6FmjgyEBenswcytmBLwjVsEwFA=;
 b=bJGLCBdh/9BQRODiNrXDx3yjbrvuNYBZ2aEsydHqjW4jkTYIETUwUqEdR9+NYP+cptxzGlk3ZnSU6wIDS//WjV0Vm716Ql7WE8rGpk05/M6fvKZwFG3whCYAVSeNT4LJUK9QR3q6pLMKuCxrQZ3nT3IktY9rH1IfXRTEvbjPdbhpL0FBxnGR/XVuBq97BUf88q45Bd/O4WnWac/f2yJVXVXFTvVBOZbMHEhtFtP0JR6PLHoECdESY7VcyJBdZqmxwmBFCeQqIaUWL70bv1kZPWBAaUM9HxBKCPRQhQ09iDuJko8rgiV4Ero7lBcYE+RCGzzl6bkKWkxxilKkcFSNQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CH3PR11MB7866.namprd11.prod.outlook.com (2603:10b6:610:124::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Mon, 3 Feb
 2025 14:21:38 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 14:21:38 +0000
Date: Mon, 3 Feb 2025 15:21:29 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH 3/7] drm/xe: Fix xe_tile_init_noalloc() error propagation
Message-ID: <Z6DQ6aG3iiW3msZh@fdugast-desk>
References: <20250131223140.4144292-1-lucas.demarchi@intel.com>
 <20250131223140.4144292-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250131223140.4144292-4-lucas.demarchi@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: ZR2P278CA0044.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::6) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CH3PR11MB7866:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e9031c7-950a-48b3-e377-08dd445e124d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wxCjhMf1wTxnNtVE2gxj76/c4pmJ6o5SuY0+/Jgq6WmGhrCSIBH9RUGPXt3P?=
 =?us-ascii?Q?FLADt0TRcUU8QnTaJPJr8C1JvNqvY9QSlMejaop89GNcYNuwh2hnai0biJ3j?=
 =?us-ascii?Q?3dipO589CL4+N3BK++jbaKc5AumfLAXQArHgbcPHeUhc23aRtf5d6ySYO8Nk?=
 =?us-ascii?Q?DJDNtRnQCqftXI6CN9xDoUxVYNoC4IwL5QyqIpXRgH1Il14roxWCeOh4/qaI?=
 =?us-ascii?Q?FaMKyzd7EcRtYpPRKViT81fFQeybZ7tLtGEx9L67vtmQ3x7nJbTqDj1kEgTL?=
 =?us-ascii?Q?d+Y9T+mlFm7yfNGZQFJQpIeEdLXrC2MK5qLVE2kpphgih5HB/IZMJi3P56ga?=
 =?us-ascii?Q?LJOXrQ8aUuIfBOqfrJdBvr3mS86431Hm4fqqYG6ZFB6vsCU2858q9QoUqPdC?=
 =?us-ascii?Q?AxjdwWyza2MeAlygFsVZ4uvBYVSFTRpi5q7erG1/2buK1J7EKhEArcjfMCsR?=
 =?us-ascii?Q?HoTkFiCBQrtgZdhGonvPxZZeXrX9MuMy+2SNiV6pY4DvpGehoeN29TqefeEh?=
 =?us-ascii?Q?VPdjCSbQAy1/CCa7Cpl0/hx103lN0VrxFF8k2B8dvnTAZ7mid52LTyYV1mCJ?=
 =?us-ascii?Q?0uuJBusTaaFYfSqVkWSrLKHbC4dg/VY4+L9mNME9bRhcRv7HnJylpC+x0IiI?=
 =?us-ascii?Q?7eRVMHYX/oE095ctutFo9wo+K3y7ULgSQPrwpAm2kp/Zo86nAUmQHh4Rsr4p?=
 =?us-ascii?Q?OaX2CjqPLidLdalvSZDVwqGAW0fcBy8jaFkvzyv2Iz4GCiI/nAdANh+PlPYu?=
 =?us-ascii?Q?4IbMNmXHhirryJ3idNRdrtI9+Oopop+DF7B07YsuViDTTbwd1YxJRnJ8wvyJ?=
 =?us-ascii?Q?icgXASsGQmel0lxuqDlbBMVZWb3co1ZxSq09YktKsl4Z/Iq52YKX/La1V2UK?=
 =?us-ascii?Q?8FtO/v4d+QrcgdC4rr11N50znWosOTUQ4IVP3qEriBnWl5TecjGQhkuHaBco?=
 =?us-ascii?Q?NiicOpnT/7FxcIZGsGvmKKZsumMRM4HXtbkVvUeDl+F+Pio8DKQc0EtZjCO9?=
 =?us-ascii?Q?hAKBhTdN2KtqpWpxd2P51ONbYw8lGMYDT/LT7YYjha6sBiltrdRhImZ2V595?=
 =?us-ascii?Q?AwTfwLYYvA2VWDP+HXlc5VwIVLHPt58OeHY5FQ0F2cCvMF8JFz+oAmv5D27P?=
 =?us-ascii?Q?FpcJ8IToiwHEtKvElFNP4OXfw/nTdDjmo2PiSrtalSkt5rWGiJOsFElTKZ+S?=
 =?us-ascii?Q?AnvNzWzeYT23pEQGjHogRAAaanTRY8jAs8hdFmLxgUsGa4JwgxZdIPY2Lg5p?=
 =?us-ascii?Q?NmAeXMA6nNIPNkcaGTfPzPTP9MhV/gyiKur9pgEAkKitEH/MU8Wm6938X3Pz?=
 =?us-ascii?Q?0FDjvVmCdv8HLYFCIV17Ytb8OTQJJyNX5g1yFztT26vnHg++ZdX0R3+1QgsN?=
 =?us-ascii?Q?ORrtWTZVCr+VWfj3QD+tmlzq2vU0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8Z/ChrASnzHnPZ1p7RPaaxhLlRWX4XEqIEBJwQhfP2z/wTHjPOWljV8Gpyrz?=
 =?us-ascii?Q?CZ1czOeOIKJW/z+ABk8S6n0Nah4kGSrvOjJdbDZSg10IxmwkRIF5XOPzuHLb?=
 =?us-ascii?Q?MFPKMYYIcotqBHWMAI+VfTCAbVyr5oNgpqAL1NN0g6Khcd6k8vZ4X/3tkISa?=
 =?us-ascii?Q?UP7MJs43Wecb1k2PRKAdJLNNZPq1NOlrygL+9WAuUDfbXMKtc4h/ejPLoqfE?=
 =?us-ascii?Q?I5Vky8gzPWhq4rqKCb0fM/siOJA/LaatZZvNAvD8eRtKVnrynyreUm6sLaFd?=
 =?us-ascii?Q?3K8hw0YhW5KIFXWEAr2uF6WKUG9g3iUvNG+6KgvR7k9MUnWO7i9nerwDZg0t?=
 =?us-ascii?Q?dxMY9i5IC+o9/UuGf4N15/MHAw95UR1bArOub8WGNuTImws8QG7wFtw0vy+Z?=
 =?us-ascii?Q?zCGtbNFIjtqU77hW+aHP4VvR6Uq8N0DzgQBKwSrCtUnTji/gygE76pGpyIiH?=
 =?us-ascii?Q?8vMbCg9dDytEvDeYyKB9zicKZ+JXmnL6Bz0ll1ejPhh1b2c9rqyFzIRJQaaO?=
 =?us-ascii?Q?4ovsHKMQYhkuOkeCO8tlOUboLBObDzNU0GnMvqE7J5OmztWiBeXQkCcjUASt?=
 =?us-ascii?Q?GasfIbdyNYTXPACWlHuX1bH5juT4C9yjgcaXZ8ni3BINum2Yc9P0RIE7+Hrn?=
 =?us-ascii?Q?ciSTrjeBgAxWznuUu2Fz2JL0rzAseQ5M8vwPdXLFVO9vtTTG5xLbFSt+Vmcw?=
 =?us-ascii?Q?bIPRmRLCzIOb75hUFmdMqmC5hzWMMlp9yty1/5rk0PFtgspuZUOEl0Z5m7RR?=
 =?us-ascii?Q?alBaIDSFgLLeKF35hYk5MZgYvXgpjZ+ihkVrDr8efv9auHeYhtPzVYWoRTM+?=
 =?us-ascii?Q?VRYmpqSewKhNwpDYy40TYXRoV6hHAd1xnIKS4Pix2W+Qn4Uck69XkAi8qSs/?=
 =?us-ascii?Q?RZIUOaoRNS9kpura7N3ouD+nYKOjG317GeGr+jSVIEnczbEiCQxMug6KwC4h?=
 =?us-ascii?Q?Hm1U1JA4ZGQi2tzUJu09vG5pTSkKn3gA9C1TIZixRiH+1FtQX0Tk92QwTwXK?=
 =?us-ascii?Q?+J/2wU/LhW2biTYsVRY20ERhg5qx1LxnJbZwBdPw1+GHFgi3m3WgClBRov2b?=
 =?us-ascii?Q?gQI3FvbhJp/rmvjoWjt4MokcXct6jgjAlj3RtA7LMlH2vX6pYtsB0Afveu5r?=
 =?us-ascii?Q?hefsrz/SkDeIXJU995PlEtwLYXLttlbOCLOpETGHuu0AaD7w0rvMtbhaYSvb?=
 =?us-ascii?Q?ho0SOFzyPmDlWzmipjq4rlSi3pKTgXR++dXluNt4Q5esThm2xXOfuV8vcDaf?=
 =?us-ascii?Q?Zst/nXaG5t5AQeGFaBAraMYzRTa+h5XYKHwL+ejmdAFMaPNnq1GHUqCUTAf4?=
 =?us-ascii?Q?Ba60gdHCCdDTGkQPHcPihPWZWFSbC9NGIvWHkkljGgb5icBp5NC6NPYmDeol?=
 =?us-ascii?Q?K4TN498AidO3IMUqF/kNiGK6SzaaIrC1dY8Arxxd2x8XJbfdh68ISr5fEa60?=
 =?us-ascii?Q?X3IPh+/DB4S0hls334frlMms/W/vk8AFj4EmANYVlb+JZsVvvvy8e7rfWEtE?=
 =?us-ascii?Q?vJ56NzRl7JjxvaW1L9Hp52plos0CEEhSNR3TfRQkAQZFH2xUD9QYv91l/VW1?=
 =?us-ascii?Q?GhrzwWDpCvhX5fmHgRT7kDNfKh9K2SAXtXEsafbtXQ8fEv984HIZS5N5qAfn?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e9031c7-950a-48b3-e377-08dd445e124d
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 14:21:38.2012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kfzjbxvrAjONbufkcg5KfTqkXJEDG7qw2JP881zli7Se27+TMlQLm/F9DXQ9fljjuE+VHJhuJrB9FAv7eif/YS538ixHeZIB2BlHRKgA+T4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7866
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

On Fri, Jan 31, 2025 at 02:31:36PM -0800, Lucas De Marchi wrote:
> Propagate the error to the caller so initialization properly stops if
> sysfs creation fails.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Maybe with Fixes: e3d0839aa5017?

In any case:
Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_tile.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 2825553b568f7..377438ea6b838 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -172,9 +172,7 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
>  
>  	xe_wa_apply_tile_workarounds(tile);
>  
> -	err = xe_tile_sysfs_init(tile);
> -
> -	return 0;
> +	return xe_tile_sysfs_init(tile);
>  }
>  
>  int xe_tile_init(struct xe_tile *tile)
> -- 
> 2.48.0
> 
