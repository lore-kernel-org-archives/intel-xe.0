Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57317CA5FA5
	for <intel-xe@archiver.kernel.org>; Thu,  1 Oct 2026 04:06:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF8E10E058;
	Thu,  1 Oct 2026 04:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="foDrRKXD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4A210E058
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Oct 2026 04:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790827589; x=1822363589;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wvNGooDqgIYdE0q1mXaDpOvBrB9VuGTH6duvf27W94I=;
 b=foDrRKXDB3Iji01ZFz2sWMDpOwgVCBpBgAvzUG3zwklS/Y4OKohxGaJV
 XFPvVU6K1QpFn5yBeeU7h6kYccxrftKPbjjXmooERl3FHuzK3+RhfgAgR
 kNPtLhCoSubIWYZhzyRGhKPYBoZvHeSyGg9oXqBlqXG9m+frB/RhOjOJ4
 vcWwUxBHF3o3HBz7kVNx7haLjZJiaHvd4OwYUKWiIRnVoUtHzcNpTuxCz
 vyEJF/FGz1MD1K2O2Ji601UW9cIOC5bWDS1DPbFmn+Q86QRxYrqd36gxE
 iTY+lFoV1wZuMdQ9ayVSE8SD29V670UAQdOawVwBTQ8JwyxxrosKBQyT+ Q==;
X-CSE-ConnectionGUID: Lkvu6OYYTF2WSLjrrC+iiA==
X-CSE-MsgGUID: qB/PEkd0Q2KCqtFscUhHAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90435764"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; d="scan'208";a="90435764"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 21:06:28 -0700
X-CSE-ConnectionGUID: aMMZ4zqPTZCjwIYSM04B2A==
X-CSE-MsgGUID: g2jnAQX/Sa2UcCZ16DgvYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; d="scan'208";a="272320721"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 21:06:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 21:06:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 30 Sep 2026 21:06:27 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 30 Sep 2026 21:06:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TRhumMg+/SZtGkTL35pbO6jD8tYjarf3QW5J56OdW+UVDgwItgES42FYRVDV4lCyRIqkE2a0uIFtJH7vSbjQtdClogC0PPMqY7vqGN6fv9YH1X8Z/niTWpviK0mpnhdvEBcymBYkNsqBOCqD0Te+SM3iIxnpQq/zKxGu4aT0aiwop0OTMICayjdePK//MSc6NII/ui0o8iiUfN0j3aYBWoqQlq8ZFo2uNE1oLKk7SaXm2/EdVCnqlyKhGUU0a+1YSVRy8Px+XSRxdhNQ7OCCTEqzOgfynG5sl5kojZ8qtqd5KqTwg/kiff0e3elU4zdDYXbOYYXyfjUM+5J3QLcbEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+X32zogSQFLU566/F+ilPQo62YV6Nl55xaTPbJ/np8=;
 b=KnU54LF/hvB/lyEr19eSGS4slh09vdTNvz+g+BlN4fN8MabyERyfuvfSkFBCvUum24Zw7DVduCAHUHrbtYcVOMu+DKcObMVCgiY/eM1lH3ZdlVyY66u+1cAvPVVs7CJDk0ECsoB4Qlj8Y8Pv+E65ucAeX46i/pqF7vAnVJuIteVhkvHMuxIZXlgcpElN1lVT5Ssv6Y7bGNdfdBfv7TsPNpbhqbPkBqG9DjlcT0iKc+HeHNOUmBqaqeyeSm+et+vsCKKkTA/F67hZllqz+4cVjVFObPgjXHnKdwUiJxZ/3aOrYBkQ5/zHbg/EglAxTiiEScUTGxSWGT2Sj3PqIbpT/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by CO1PR11MB5121.namprd11.prod.outlook.com (2603:10b6:303:98::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 04:06:19 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 04:06:18 +0000
Date: Wed, 30 Sep 2026 21:06:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 3/4] drm/xe: Bump prefetch BO LRU via GPUSVM devmem
 callback
Message-ID: <ar3cOOtIjX8wWWr6@gsse-cloud1.jf.intel.com>
References: <20261001033602.3166274-6-himal.prasad.ghimiray@intel.com>
 <20261001033602.3166274-9-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261001033602.3166274-9-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BY3PR10CA0003.namprd10.prod.outlook.com
 (2603:10b6:a03:255::8) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|CO1PR11MB5121:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cf89887-6795-4cae-ddb2-08df1f715889
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|22082099003|18002099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: MyhEzoEsy3JnSzM+nwhNA2q2essdzd5Z/ZpeZi4oRewEcYN6D4lyfPNooxdO7bL5nRMi/FEWzxzRug7R3PL3G+lyZxYdzZVQnmnySzGwX3TYGwkzYVe4tZeV4lJ1Gk0kVGIVnmbeOqilOQZ1VruwZl3TvAcbRlBljJRVrtwtOgIe5Y2dHWuVSoxfcPQK1+vo9d6Y5AxSjwI4LY5M2W3plnuJVkATCUVNqhbVJ6auHN6x61QlqVn1CQ/3MVTajgGT+10HNwjWKDArVNbdW9N/aGVYq3J6FEpZUOzjpBAfMZeEZ4mF8MFJpjIqJumhzQWyPVCQHMo4uIE3Jm3ejb2JlAfC4yS1fOO8Nb8Cz5r+ZCW2m9HFsX8svqHvIE9PkELNlYLwzUg+8+u4RBj179/EFqERLaRrAwpRjuyKifABtIHJIKDgwjMgzxJzag9vzAzIoNG2VNfJD4xyMhJIpuPs/KfgU1kqdbrVfJpNgXdC4sRQ39u6V5GLAYkzwQG5dH+Gxy564tDzupdq/9ToNBJHw1qS0wRBWPKtI4kd4N4G4LJCBISz0nsNc3RTxeR3uMgqzam/2VNwQ84+Wqli0Q5CI4n7zHZ5DGiTiKhYstQ/nI+dYd9Aye/6HZhXNEsJvaGuYxNQX+6J22R5ObheKhVPd3obhqdX/q9vRYLTkQ9ZVEM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gq7JUMcZVjuaoQcQWxbA0vt9ZJeLkK06VjKIxq1rrProOTa/2BWlHcTY00Va?=
 =?us-ascii?Q?H7eGA71JlKjikk5GgVhxDna0iWSim+5avDkPDj8yoFd7wolvZFFuajDlb1Oq?=
 =?us-ascii?Q?F/QvWo0lhu7Vym/Oh2h8qltAWv5tT5xOAC+MC8wNOgSRBhqXz8gBGA4CnlG2?=
 =?us-ascii?Q?6pGbfL2trIGM8VZafRsOTp/RPTURrNAdYoM57grSgwIpclSFYWw9ZJuiqEJ0?=
 =?us-ascii?Q?e6HX6MT2WZnTaoUrXvS0k4bKLmupr10HIAXMAZnJrb7aQT8zAPf742neMvWf?=
 =?us-ascii?Q?706U10adXM69rQ3//StMyVI3s/Dtb7v6QSsUZc/rXwefJa3dNBR9I1Wc+voU?=
 =?us-ascii?Q?+ird+tSFvZDYYHt5PNTfXcX2QIWCj0yNlro5z+wso7a0prosW0I+5B27CjtZ?=
 =?us-ascii?Q?42bp6DLt7UkzlKegVkTmEav84vmRKtUjuVEU+3KDKC6jLIC+1DZsIbya17xN?=
 =?us-ascii?Q?kwh8LfXphgTdkno5cf81nfYWNNSr3A3EKX7vUEtTrb8E1QY52UM8H5hXwOCW?=
 =?us-ascii?Q?+ZDAOeatAIlRUVBe3b9hHhUfFHKzaqYzGn9ouBZK+Bn/aV7y+adnKuRi440N?=
 =?us-ascii?Q?/pp7V6JI6GDgrWozaetyYqDatNgg6DNuM5A5oGbr+poik6iuSsOnI5vTinEi?=
 =?us-ascii?Q?uV4p4Ghi7gq6CaN3xqm5Vje0lXlkuEP4PQDbHtsA4+JrL5GedSxW/+cGjwAT?=
 =?us-ascii?Q?KZG8DUbhW5SQVgvcKXsuiEwe5dSbouXG9zxUHZdpXrsjM9YVx8EN/BDbBG6b?=
 =?us-ascii?Q?dCWqzqzP7HgaPy6we7KqyHuDVSuFLKATZNp+QnbH/qBTV5IQxJdOpIp5QoWa?=
 =?us-ascii?Q?UPYEM2DqoMUMDMDbZVc6iLuWHABVtuWd7gbaIaQz7TlKoF43WVVbCV0D3QGv?=
 =?us-ascii?Q?RlLpktYnGI2EvJOCGtx7ezrYkfkDBi9Yu1ZE+xjM114Kll6l5kFX8gwK361V?=
 =?us-ascii?Q?rBpP3RuPc8Z+A17UWUMMIXxo3/J2rztWhedPJNJleloOTg8HUytBAy7PyEKQ?=
 =?us-ascii?Q?2Sqak4L+jejHSv24xml5VxUMAueC/xOseIrv5K7W5ppEJt02jCfUivb/MM74?=
 =?us-ascii?Q?Ppkv+HtL5jJE9pixnLbL/3HCqIx727IceRKF8N++RbBlveGsAxPPy1/FtNKW?=
 =?us-ascii?Q?4KKwJnNMTrHpTuwOnExoyOtiDfvq/muN7c3ywTuiGlRlhEMJXK7ZD/r8YdYt?=
 =?us-ascii?Q?xJwhsRi+iEcwhuQUnbWpB+ZVvWenUyKVwEsmPaT50kUud9HLul+ixyy6iI7o?=
 =?us-ascii?Q?zylPK+xTPEv48QAX6Orr7bMoG3mDQqTUJ+OTRxd3u56jZQjRvjHPh4ZnK8pf?=
 =?us-ascii?Q?G7ZS09DoWWWMZjIvhJmN8OcslWQkcctjj2SuKYxxHitdwSU9EuJyHiqU1cqh?=
 =?us-ascii?Q?wqKpSUgv/c7gf+7GVEsedQ55M4PYgDBIs1HjKszC64tjF5aYlQjsvWDZR6th?=
 =?us-ascii?Q?temuTo4qGBBpHfBX1peGUVQ830fjsHCm1jGMla6SGjLnqTdRHFDLnr3PG6j2?=
 =?us-ascii?Q?eNvui/wKN9RfKl7IzQbfMNpsMFP8GeAMMA18nMke92YVh4H/ZRglJpezPXSh?=
 =?us-ascii?Q?1nmmuG7eOjSTbIWjU45yQRbfQkjXxTLuDptoEs/dcODTj9fSoGdOFuU5kJ+r?=
 =?us-ascii?Q?HdNI4OGzM1bDqI0H5HrA/YSE1/gr+a3sIcMc2EKHFOTBvz5QAHwUHcYicx6P?=
 =?us-ascii?Q?GExxE5CMGWwiz/hGeL6rHmAVBDzA+eKZ9yhEqNR8PF1bxkIrqI1vcubZZtqN?=
 =?us-ascii?Q?JX1IlPaKfNEZaM0EQFFdjk/ukRQEHog=3D?=
X-Exchange-RoutingPolicyChecked: tb/9G8YOQQuBaMgDywSi7+fiCLLjUcSZo+Y8VtCdwGKPJJDZfORoRR6Mq4nhCFjeD5f1rFT3YbTqN7mIA0qVzOEkW9qKi5ownG+a2FzmyjX/bgJMjoqC94L5HQQhMWl36rUilfYYR5yQwvjnibyDP0iBD8eBRfm1XVNQJAE+IAImpdZxU5zfGbkVERErdCKjH5KCRpRhnngIApUTLyqiWBZXLThrXA/aAkB2seOXfqODHE5CDtrOrnXpyFAgW2j00To6d4NyQj7/1p8l4jYH5kF/2ccBsxlE35MCbpB1JqBllRIizkmPc3lQuCatopsR3dGd2gmEaBG49qv0O3g8GA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf89887-6795-4cae-ddb2-08df1f715889
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 04:06:18.8634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QOJUWo8eyuanxyAxPbSTuKDLBID2nORg4L/jE6CacD4LaiFnkJLjuH9s7vwxdBD4gcnQgspxukrSdlJMHBBz9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5121
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

On Thu, Oct 01, 2026 at 09:06:06AM +0530, Himal Prasad Ghimiray wrote:
> Add xe_svm_devmem_lru_bump() and set it as drm_gpusvm_ctx.devmem_fn in
> the prefetch worker so each backing BO is moved to the LRU tail during
> get_pages.
> 
> v2:
> - Guard xe_svm_devmem_lru_bump() against foreign device-memory
>   allocations before casting to xe_bo: return early when
>   devmem_allocation->ops != &dpagemap_devmem_ops. A shared
>   device_private_page_owner can hand us another driver's allocation.
>   (Matthew Brost / Sashiko AI review)
> - Add stub for function (CI)
> 
> v3:
> - Guard xe_svm_devmem_lru_bump() body with CONFIG_DRM_XE_PAGEMAP; it
>   references dpagemap_devmem_ops and to_xe_bo(), which only exist when
>   PAGEMAP is enabled. Fixes the build with GPUSVM=y, PAGEMAP=n.
>   (Sashiko AI review)
> 
> v4:
> - Fix xe_svm_devmem_lru_bump() kernel-doc to explain the locking (Matt)
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Sashiko comment for series are theoretically possible with different
coherent devicesm one of which uses GPUSVM, another of which does not
but I don't think we need to solve theoretical problem today, nor is
this in scope.

Himal - go ahead and merge, ack on doing this through drm-xe-next.

Matt

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 34 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_svm.h |  7 +++++++
>  drivers/gpu/drm/xe/xe_vm.c  |  1 +
>  3 files changed, 42 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index f39e647512ad..d07dd95ab451 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -9,6 +9,7 @@
>  #include <drm/drm_managed.h>
>  #include <drm/drm_pagemap.h>
>  #include <drm/drm_pagemap_util.h>
> +#include <drm/ttm/ttm_bo.h>
>  
>  #include "xe_bo.h"
>  #include "xe_exec_queue_types.h"
> @@ -1625,6 +1626,39 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>  	return err;
>  }
>  
> +/**
> + * xe_svm_devmem_lru_bump() - Move a range's backing BO to the TTM LRU tail
> + * @devmem_allocation: The device-memory allocation backing the range's pages
> + *
> + * Intended as a &drm_gpusvm_ctx.devmem_fn, so drm_gpusvm_get_pages() calls it
> + * under the GPUSVM notifier lock. That lock sits in the reclaim path, so
> + * dma-resv cannot be acquired blocking beneath it; dma-resv is also the outer
> + * lock of the notifier when memory is allocated and migrated, so a blocking
> + * acquire here would invert that order. Hence the trylock. The BO is private
> + * (dedicated dma-resv), so the trylock succeeds unless the BO is being moved
> + * elsewhere (e.g. eviction); a contended BO is simply skipped.
> + *
> + * A shared device_private_page_owner can hand us allocations backed by a
> + * foreign driver; skip anything that is not an Xe BO before casting.
> + */
> +void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation)
> +{
> +#if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
> +	struct xe_bo *bo;
> +
> +	if (devmem_allocation->ops != &dpagemap_devmem_ops)
> +		return;
> +
> +	bo = to_xe_bo(devmem_allocation);
> +
> +	if (!dma_resv_trylock(bo->ttm.base.resv))
> +		return;
> +
> +	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> +	dma_resv_unlock(bo->ttm.base.resv);
> +#endif
> +}
> +
>  /**
>   * xe_svm_ranges_zap_ptes_in_range - clear ptes of svm ranges in input range
>   * @vm: Pointer to the xe_vm structure
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 2ef4ef026ccd..585ad64b672b 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -128,6 +128,8 @@ struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
>  int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>  			   struct drm_gpusvm_ctx *ctx);
>  
> +void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation);
> +
>  bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vma *vma,
>  					const struct drm_pagemap *dpagemap);
>  
> @@ -356,6 +358,11 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>  	return -EINVAL;
>  }
>  
> +static inline
> +void xe_svm_devmem_lru_bump(struct drm_pagemap_devmem *devmem_allocation)
> +{
> +}
> +
>  static inline struct xe_svm_range *to_xe_range(struct drm_gpusvm_range *r)
>  {
>  	return NULL;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index ea5bfb307db1..986e0ebfdacd 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3246,6 +3246,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops,
>  	ctx.devmem_possible = devmem_possible;
>  	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
>  	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !dpagemap);
> +	ctx.devmem_fn = xe_svm_devmem_lru_bump;
>  
>  	skip_threads =  op->prefetch_range.ranges_count == 1 ||
>  		(!dpagemap && !(vops->flags &
> -- 
> 2.43.0
> 
