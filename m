Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA78606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 18:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Piyp7AUn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB7610E378;
	Wed, 21 Oct 2026 18:33:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB2C10E378
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 18:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792607615; x=1824143615;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3091ZFdDZxGxk6zdyozvGVxvWQXuXAMKYZjbbL0t8TI=;
 b=Piyp7AUnI2ibK+Np/N22fBPOhcGTtHYujBElkf2/QF8umjhSwLRVkfcO
 Rm+KYAaBQShktw9LBLGNejAb6y7OG7GTUjfQoisuya26oSNlozFdtd4ve
 70iRZooJU3Pfb5Wx+cmkVUIG0MVRghHmHXCmROhxa5DoGimmGXEiulrxK
 TYqZgsUW35rqHpO2YGY/4d5W63BCiue0g4UDT+Vrq+BvrLXKaSKB11Bfa
 QYwj+6REucZob2yTTX4808KnlvWhfTF8fU0PegKyNZ3xgqexfNUJCJQzR
 eaADYOeEvBcJEo9MVjOkC620EOmNi4e1iOzTZ8enLNxEcd9JukHKs5/UR w==;
X-CSE-ConnectionGUID: f2sKdTbzRQyycGbV9IxV6g==
X-CSE-MsgGUID: XChOahsfQ1+czgyOdHCCJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1353258"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1353258"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 11:33:35 -0700
X-CSE-ConnectionGUID: di2QDJIaSUWIZhL0TvBz7A==
X-CSE-MsgGUID: ohY1OLkQTSSPT0nW8lAy1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3157574"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 11:33:35 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 11:33:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 11:33:34 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 11:33:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HS3H0exxS1eWsMIFEeeJZ7xl/NMfT7n7LuHpaVF5NIUmRiVxpzc/TWdycxZ+owSqMsadp3rzMq5vKVBrfzpq4qLOVaUn0EeZvX9aiYR4haFzDCVd7JnACivzPQMelPbvWXSXcDcdGkrKf8UUWgrtyxA9KQGPg+7ck/VndAvHdKHkqw4WRCEb0BaP9I0PaeQtLaQicPlutD+B7HayrdVKdrADaDd0A7So4OEVuYU5LPkrXdic3RTwDrusCmOIuWH4v+Ou6K3yTFLDCFtizGOFBMxUGqcOl88qL1N2U0H66AJfHNTMldVSZDhHSirTI/Tw/Tb0D4NEN/mOKPQ3ee+XDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+1KsGkY2JLN+UGQIFJu3L4pZuz3zC3gRPZsvVh8LeE=;
 b=WT7/8HIHLg7LIXPUtqcmC1TP4G6bVqaWmMFjhPZ76Mc6/gqS5n2MMPgNFdZQXpnBEH2nthQOuh+xzQk+i8TdlIwxabPRtovUId3M1R7ezI9lFMJmTJShN8O88UU69xb4e1UK6t+ZAEFlSNI1kse1nFTC4LxjDzRz5hQ5EQdstlIjc6ucRfL7sd/Eeb8h+gIi6woaW2lshBL6c59u/oEcpRQf5eRIBSu338rA5oDq0VC/Os6RSBi6ITvvVMUeAZwAIGyXm+mOOwnQ8b6uiXw4g6eBJ98Igokq0mrZKsbf8FCp40lxtAdrwBpT2XHbMGtYDzPP7W5VqoTEKzVdR7KrLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by PH0PR11MB9749.namprd11.prod.outlook.com (2603:10b6:510:397::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 18:33:32 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 18:33:32 +0000
Date: Wed, 21 Oct 2026 11:33:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/bo: Add xe_bo_addr_iter.
Message-ID: <atkFerOgJSp2wafr@gsse-cloud1.jf.intel.com>
References: <20261021150116.516131-3-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261021150116.516131-3-dev@lankhorst.se>
X-ClientProxiedBy: MW4PR03CA0160.namprd03.prod.outlook.com
 (2603:10b6:303:8d::15) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|PH0PR11MB9749:EE_
X-MS-Office365-Filtering-Correlation-Id: 4097b75b-20fc-40ad-fa77-08df2fa1cf53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|261021121427099003|261009223027099003|261021123027099003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: btYPADn35rbRuTvgL9Bo4kojSbIgJce/uqhdNLrGZXVJA21gUIszZ/uqWKHdolDXOxz1VJXcwYki7KfXyn+THFLpXw8Z2JCu2ygUvfaDNKxzrFH+0jOj8rYjNmJMtBI7FO4bXxt+xOR2C3e25vDgWNmjXdqPLNZVxBDJ2nwg6Ne/ykMBo50w0R+J/NOOsBqzn8aE7LfzKl8lRYbYbcTRPTVxCpWHJpSRmm1XlaFfb426VbFIthO6Y56lz7cinvenaFJeskTWQ+2jx9VO7LR7o1kp/uIrHtLcefe531aFZqbx62NhLlg+EoHoJMEFa2cFNI8NibJoBSV+xJDefR7TS6Qpk/eHSkJlB1CXZ+oJ8+hUToniWxBtQQ5MtKnnMvmyyW6M6cXnCd9Iqmo20238WEI8qdASFMqPrW0P+/UwK55UUKytSXTk8BnSzRvYYfWGqUbbyNwUX9iL4RAFczU+8wDMnMo8umRmpmdODALtsek6dGJW8CcTTPPBQt1FX1jSZEGQ5k8oghyGZ7IyyuslA+v/HOmZkSjkrQXFopcIZGeTXZGsNTQEpvpKd414krbZhD4r9CKPsaVspiQWGLm6UUndvr84BER3y7UGZAwkLdwWvbbzVpQy640KJW9FKc7GUsZr9CuZ48gBeXmVdJr8BJg7jdX9PQCiXvJ9sIk246k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(261021121427099003)(261009223027099003)(261021123027099003)(11063799006)(10067099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I7RrRqsqEKTbolriOauf6G+atU9dVPPtKCyIt6LLYwufxEnvIbIkMk5oydit?=
 =?us-ascii?Q?cRgEFwgi/ls2X9EwO/gNOS7yrziRSqXCLpPbcuvQotdcet+2dKiEZ0+QkDyI?=
 =?us-ascii?Q?jcC26fwehptSMzW5/4/cj/o21WUd1F6UItS3vfL9ZUU3daPSLHwsx6RrZW8Y?=
 =?us-ascii?Q?7uIu6xdYTsUXnABKOXr3sK/0bShRtHnFVISF3LydO2+yWQBoatTZuCjol2qx?=
 =?us-ascii?Q?de0POtp8O3j3V2/Abj9GMUpvcnDWcCsMirav7VLZzXe/9jeuDogFqIO79oZY?=
 =?us-ascii?Q?A1yyzx/0Mo6TB+XY2iyTTgk/gLf7US9P4CpapQL4ZG0O5UvjIhE/liMphKcE?=
 =?us-ascii?Q?JnOqbp/LFZn0I5UgY/jeT6XDYx9hdgjTb9i6j0ae42reZUY3Vyutbug27UO8?=
 =?us-ascii?Q?1dUytg1aDd4p+M694ISbGdo4/1YW6pTVhyRD9ymTQwRBqjn3EqR4gD7xTDpk?=
 =?us-ascii?Q?fxPjuo7E7LIpwBPa+WypPggOVyliacjwGKfqKSqcolrcsgfLVyRIDFh4kgB9?=
 =?us-ascii?Q?iIZHnlFZR7n2ZpHcm7VKXhcQkbAvudetTej8WLjIhlx73/34Wr85FVmvBIFi?=
 =?us-ascii?Q?cNzVT4HsKjeUU3Nq/7c47XABvP6MI2LcOwqzT4trUvBOhFJl6rl2E04Q8hfW?=
 =?us-ascii?Q?oGwo7c4Ez38hEjCIIbsT16m7qwlgCoY12fmARavAbxBIkQuW+FfPWZJoEFlG?=
 =?us-ascii?Q?r314yNz/x3H74dCS/CM0sCJ5gcladMfxwiJbayDrvv3A4Mp/RaeH4W5niuq1?=
 =?us-ascii?Q?DUa3w/5iT6qlhSnWLw7IoMPNw/C2xh6k63VBgYIxYvkBhHbRoBeRTgLevxut?=
 =?us-ascii?Q?rqrvCshjeAWTta6PV7KXvbS4Qdo+GDi1LQS2WMkQSNpneG6vpUFPVpCmiOf3?=
 =?us-ascii?Q?lf0rucrQhEc3dzUSJE3up4RhSGec6w4Mu3nDWo7hCm668RSi2whCtJhCiLGI?=
 =?us-ascii?Q?MyMTNPBrmf+7ASJ5QNn7oDt8kNTDPGCanPeUS8WS0h4/v+YFRquczEsIar7S?=
 =?us-ascii?Q?U0qFjJnB/qTBx7G5GcNiinYd/m1F23naecr+0q84npGGHp5idfcH+xT3kMY3?=
 =?us-ascii?Q?390tY31HwtRyy0ifEXdkRQN5A8f+FKFkMeiggIXjhD3Qjscjhu0MAR/Z6eCB?=
 =?us-ascii?Q?KGgQY6J21pqhOA+fsk6utFs3uFYeJ8h/iv3NxUUyhk9/UzVa4O90vduhn7DA?=
 =?us-ascii?Q?VPLFmLDuhHAJPyol49msW4ZPREb1dml3/GXhNtcXbXbO6dyN1ON+TaFnI40C?=
 =?us-ascii?Q?ewr3KFyXfEx/aNoS2yp5R1AolqG5mbGvqRVMFWnh31rcuRAdQPhNgR5TmaYl?=
 =?us-ascii?Q?MpZNIoXiYaXq6p4k8HdhgOK8JOHYf/ZA2lg32je/9iEIB/nJhyiUgnmUzR7H?=
 =?us-ascii?Q?93utdgUtTPBMTigBGv102RZd5heHT/GwG5HgOiAm+xu+0p9W/RmWryF2aQzq?=
 =?us-ascii?Q?Pv1FoLYG2oUvoEQw9o4snF22q+1HQBoA3AS26oQ3I4yI+GOY9rpD10pmJsT0?=
 =?us-ascii?Q?KUGYDriXim1EJiO19sG1zKVLMuSJ0g1I0OT5WKznm0BgsLGscNeTTK4w1HbW?=
 =?us-ascii?Q?uzDib19nr8vDqnOHgpLRfVEVHSxv72U6OHoSsZscS0/UAC5Y0ieNGu1UO88s?=
 =?us-ascii?Q?Ybpl0pCUm7Me6qDIAHsQ8lPb4gqIJWuqE8lX7RY5dKJgysclGpFHICjXQoMG?=
 =?us-ascii?Q?0O+vfCu471w/fS8qIGr7948ciEG4ysln0KaGtoKa0768LvYA8StiGKa0T8mu?=
 =?us-ascii?Q?He8pnz65DA=3D=3D?=
X-Exchange-RoutingPolicyChecked: HylMkWgn9xJ3+GR6M0f8SPkBeG0N6LWycA8h3ZRQM+Fi1c86tO0umH82GNukLMyefYFaT6XnO0PLTWC3f4zMEwZG0rXi0ytvbtmuf8FKI4TAVwThiF54eFYU/Gc9vXcybeyc7y8yQVPGUzfVu3ZuaNrdtqadZNxrWPBhVpyDjqa5z9Qz1mzt7p0qZht8KF+LjgzdYmt3wD03D+pHU7gXTA12vaoG1xNQjbzTMnxIaNUCQxYUG4PmygRsAC83qwamqbO5pQhPvxOsKcmB6MTBkaxzPEzg6TRsJQ7YIYq4zbFX9h3eXy6+nCXwWLu37xKEl6od2wScNeecxuf0I4cehg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4097b75b-20fc-40ad-fa77-08df2fa1cf53
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 18:33:32.6559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7w/4OG7eQmcKh1GelSjIFWV1ir/C7yQ6bguWWiXDaKqkwlIfCzTJzVpV0NI7mWcLPhI6vEtfuTe+ntaJKnuBvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9749
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 05:01:17PM +0200, Maarten Lankhorst wrote:
> For display we iterate often over the pinned VRAM/system memory BO.
> Add some code to speed up DPT/GGTT programming.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 45 ++++++++++++++++++++++----------------
>  drivers/gpu/drm/xe/xe_bo.h |  3 +++
>  2 files changed, 29 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 12e523c61c1f3..5e48669732fdd 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -3434,6 +3434,30 @@ bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo)
>  	return false;
>  }
>  

Kernel doc.

Patch logic looks correct to me.

Matt

> +void xe_bo_addr_iter_first(struct xe_bo *bo, struct xe_res_cursor *cur, u64 offset, u64 size)
> +{
> +	struct xe_device *xe = xe_bo_device(bo);
> +
> +	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo)) {
> +		xe_assert(xe, bo->ttm.ttm);
> +
> +		xe_res_first_sg(xe_bo_sg(bo), offset, size, cur);
> +	} else {
> +		xe_res_first(bo->ttm.resource, offset, size, cur);
> +
> +		xe_assert(xe, !cur->dma_addr);
> +		cur->dma_start = vram_region_gpu_offset(bo->ttm.resource);
> +	}
> +}
> +
> +dma_addr_t xe_bo_addr_iter_addr(struct xe_res_cursor *cur)
> +{
> +	if (cur->mem_type == XE_PL_TT)
> +		return xe_res_dma(cur);
> +
> +	return cur->start + cur->dma_start;
> +}
> +
>  /*
>   * Resolve a BO address. There is no assert to check if the proper lock is held
>   * so it should only be used in cases where it is not fatal to get the wrong
> @@ -3442,27 +3466,10 @@ bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo)
>   */
>  dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size)
>  {
> -	struct xe_device *xe = xe_bo_device(bo);
>  	struct xe_res_cursor cur;
> -	u64 page;
> -
> -	xe_assert(xe, page_size <= PAGE_SIZE);
> -	page = offset >> PAGE_SHIFT;
> -	offset &= (PAGE_SIZE - 1);
>  
> -	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo)) {
> -		xe_assert(xe, bo->ttm.ttm);
> -
> -		xe_res_first_sg(xe_bo_sg(bo), page << PAGE_SHIFT,
> -				page_size, &cur);
> -		return xe_res_dma(&cur) + offset;
> -	} else {
> -		struct xe_res_cursor cur;
> -
> -		xe_res_first(bo->ttm.resource, page << PAGE_SHIFT,
> -			     page_size, &cur);
> -		return cur.start + offset + vram_region_gpu_offset(bo->ttm.resource);
> -	}
> +	xe_bo_addr_iter_first(bo, &cur, offset, page_size);
> +	return xe_bo_addr_iter_addr(&cur);
>  }
>  
>  dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size)
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 77b3a02e9b8eb..286f52225bc79 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -113,6 +113,7 @@ enum xe_madv_purgeable_state {
>  };
>  
>  struct sg_table;
> +struct xe_res_cursor;
>  
>  struct xe_bo *xe_bo_alloc(void);
>  void xe_bo_free(struct xe_bo *bo);
> @@ -375,6 +376,8 @@ static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>  }
>  
>  bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo);
> +void xe_bo_addr_iter_first(struct xe_bo *bo, struct xe_res_cursor *cur, u64 offset, u64 size);
> +dma_addr_t xe_bo_addr_iter_addr(struct xe_res_cursor *cur);
>  dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size);
>  dma_addr_t xe_bo_addr(struct xe_bo *bo, u64 offset, size_t page_size);
>  
> -- 
> 2.55.0
> 
