Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEAFC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 06:01:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F4611380D;
	Wed, 24 Apr 2024 06:01:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OftHrPq/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7227F11380D
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 06:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713938460; x=1745474460;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bAfSGvef5JFJyArh9OhnEPWEtV8Dx/ghkWdySI+OmQs=;
 b=OftHrPq/nAxoHhcimLHSV2si+wkt5roZ+EB41x0iRBAWwDpZv2nEtO8a
 fxOZ+NIVnPvbpd6ESbYY/FXP+5D8u9wEyK+1c7ReodApTv3+SyLc7GLq1
 mlaeRN2fm/fBFFFb6xy7nKm7S99PLBW/XvLZmE9X2VfcmCIPVdHkgdO2T
 erni3RPUoY8N45U2PaFKm46rPLe69hyh+WJfMWWSa8gAiF6JWpQY22ZPW
 d1zSqtWTU1BJ4+ak4b6Bwn4cK6pcsqj8RD8r/BtxltDrQv/TvZCsc7eld
 Ch2RW+UbwXmw+tJ/PhBoukX/ZmE/6fpFh5y+Xpa6oRuKFj++0HJVdf9ry g==;
X-CSE-ConnectionGUID: LvYvtdTwT+iqqebsbgb/5A==
X-CSE-MsgGUID: CZc7ziNuRnWeRgO7p5oq5A==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9380660"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9380660"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 23:00:59 -0700
X-CSE-ConnectionGUID: RkiRvctnQYqVKirAsFHDdQ==
X-CSE-MsgGUID: 2FO3TdCFTB6T4LF5oeZG4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="29255893"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 23:00:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 23:00:58 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 23:00:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 23:00:58 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 23:00:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nrR52R/oofcm3nAQGOgxzIY2CQUbg5hlGjFWfu1cKWF5Wf/5kPD/DRDJZfoU/nFBl9XvlVfBK7KyoGYgp7LlSE7zoS7oN3g5LbhJRKNjhUnm2yejoY9VKOhjsh7CNMt6NCLw8gcfSt0rTFFfcbIoJbj+CEuogi+VVKF5ejnOaBihyuJCiYLPe8BWf6U/waLcc/zQ072NgGizaQ90PY+iRVu5qUVM0NsTDBRrA2TDqCX7tsrIbF/MWilATtxvj9WYh/sxoVNASl3lpbRM8CzSqtRNY/3Rauixo7dDPMLJw2ULB4cKLn7QK9h6TfVs2yhJMOUztrUw1LCGkp6hhlkm2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JwTLPXXy4S75LJ9HsxqXOGUT896elaSlHTTxWU9Ovg=;
 b=ochJuQ0RF47SgmoSTVuxsIAvDse6hasvSSkTwhdATg9nU1usAY3MCrf3nza0Ws8Myex5/vr+3HZ7tyrUYCxXsRRFqImuXUlmWcE+qEua5i2B/4E3xNIipsqX3QSgq2RE1StqRTapOnA49WuBaMq9W3WxVhMq2KUo8qsvxFwqTUROAjeUHP8RkNCyYWqOjYui4SLcYrOUpVLxLS3XMwOIg5o37GPwnrywO3IJ2u3HjVLR5OkbNvzRd2gFmR21TRQVXHNoONgGxvqVslmyWEVlera2xzq/3gwYnMykhnvEDYDA34sRn8VVIf/+/qzIO9NkYe4nJhw8K3dE6RwzMPqNAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8741.namprd11.prod.outlook.com (2603:10b6:408:21d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Wed, 24 Apr
 2024 06:00:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7519.020; Wed, 24 Apr 2024
 06:00:54 +0000
Date: Wed, 24 Apr 2024 06:00:49 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Change xe_guc_submit_stop return to void
Message-ID: <ZiigER6Rj1uLyZon@DUT025-TGLU.fm.intel.com>
References: <20240424041911.2184868-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240424041911.2184868-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BY5PR20CA0021.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8741:EE_
X-MS-Office365-Filtering-Correlation-Id: f2d3cbfb-2793-4572-bef6-08dc6423e740
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Pel62HmRNsDBET+tNkqrjzq1aQ6ovLHG7XFggQD6Md9zEGyuu55zeOfcFWL7?=
 =?us-ascii?Q?MbTwHFCkJYnr3RGr8wTmbizQskAdApJ10R1H46MP+hLU3P9JcOBeM1BSYs/7?=
 =?us-ascii?Q?uDWh1zhrRQqxAxUDwMxYfuP0ECftf/f/pkA4x8Ybs5S0bjS98bnqPOa9Myil?=
 =?us-ascii?Q?pB1v6vyeOvEjTuB1st6yBOVrwoeAerIssYhrxCN4xj3VMCDSKAO0VCWTE/3I?=
 =?us-ascii?Q?IP1p7DtKvuitdtH3dVge1Ma6/EKEkstcCxuSxPMzzpfKP/tic/mY2gmB9bLL?=
 =?us-ascii?Q?qkIb0IXLk/GUGYRM3ExIaQG9AZrGF8pr7n1AygunWEdSDePq0bnvTNNz/YXi?=
 =?us-ascii?Q?lMuP2/x4QOQ1UZotgUbnfzaejV7Mzyyc8JDFZxUl4R4jdTcmTs53Ktx06TfE?=
 =?us-ascii?Q?nB4Wd5T8OcPur6Bj7ijn6ertPCiYrHRNq4jOB5be16x6mvDk59K9uoLGc1NV?=
 =?us-ascii?Q?5AqIo1HevJt4f944khElKRUmiuMBHJDAPXHEkOpviNx1p88jyjkhEm6pcX5x?=
 =?us-ascii?Q?T/Dbwng07D32JbLffx5t9QQuB5e2biG7bwDZBpjcVsmc/YikRjPNHKsJo06t?=
 =?us-ascii?Q?ND9Sv5BerpSrVTYyJ4Wyq4IVQoe6rXxW/ZL4d6CtyY30YE1E9d2v0V3OJs6R?=
 =?us-ascii?Q?6dZTw9oP3kKJmXGbPqJPvPGWugGmL5DQTSjDEAx+MYOFXZWyxCAmnnHkHYq4?=
 =?us-ascii?Q?li67kxsNQ7d/SroK+/qCngXB7pZdT9drE22vohsNxUWkpuRq6+7srRL0HIau?=
 =?us-ascii?Q?ixSJcR+bBY6PG0CDeFRqGnX0G5SDuSmhUZij10LQtT1KYem5UylUwX1JzlXR?=
 =?us-ascii?Q?xgcTvDWh0qoeHV2hfd/yXufJv2FLZ58o27U9M7VtEO6n9Q4gFk0MWDqDTPGk?=
 =?us-ascii?Q?rK9FUDxuIiPZS1ghibW8KIS/USPA9Y0mVZsPmUCdk1hzg1Ism2tv+7brKgGf?=
 =?us-ascii?Q?d4UiUb6m2OJLLZaglnqLguS0ZRUahCH/NToD3gCJTCKDHm0kvilvWFnbD4wM?=
 =?us-ascii?Q?cl6WjNR4Gja2dI4oD3H3Z4mOvVhyARIXkC5dQE6S4GC45auu9RQk3nA3rkAp?=
 =?us-ascii?Q?hfEkgLbiSJIIazQu0n3xUJE08/WAJ/8U9BrKLZpY0+LYRkOqvwdiFTnOsq24?=
 =?us-ascii?Q?HzY3RJ7D/qdS7WcgSTnOYVxv7VP22+1/Blm22c8UtaTRF74ZL44oCEZphp8h?=
 =?us-ascii?Q?503fIe9UVfBfNRSYEh0gXfKOO/3ZyobyYxI0JF5fuSWgUHnlhLX+jqTSpiEm?=
 =?us-ascii?Q?xq5hjK+6F9vf4P7TJKQcRB7uDfFMZiBj8cvwqfxBaQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EpukviJwbO6K53PDkBoFcnr1ZUxTS0hfdntQsbyBfCiELDauQS4dgDgWM5yd?=
 =?us-ascii?Q?nFM6VRkaZ1VQzh3xSTaa/adH6uGTjUqJtf9lWSk7uKAT8VfJ1p3r4EXVyuPj?=
 =?us-ascii?Q?/apOKbLN8yGMSkTRs/xJHWwnEfWN1HHlL9EUtcMAxbwPN75Sz0BXK07jQ+Sw?=
 =?us-ascii?Q?u5/9vlV7h57gdbvPRI0RiqCbQNy75FsdB+G2rJIq3i7qY3JFjG6/2KrS8hlI?=
 =?us-ascii?Q?/avxF6CyKIQ3yRfDrP7KT5e8hOiI6nrrbUGnB8Vi5y7A+OWQ75KrszMYnn8Q?=
 =?us-ascii?Q?hkTlmzG/pl0glTje8agPVR4vXcysbGCVZBy9EIgqfhkLOE2s4av5mxbrNnix?=
 =?us-ascii?Q?0t+BQXT3rgX1rRQZubzh8N8j02UnOiezyFlDy82OZM+35CnaTxZHwwfPEP1v?=
 =?us-ascii?Q?XqN+oRIjnHHUr+HexY7XypaytvS+Ne9nNI4kqq5hG2Veei+dnZvumyg3cQFx?=
 =?us-ascii?Q?YtQjPsbGm8uONEECar9siruGsRwpaRCEkVItv7Hc67+d0zKsE1Hs1RFfcEc+?=
 =?us-ascii?Q?dE1oEjC+0zK7/kZt2YvenC1fIPmNRbjo7YM2AUV3U325gAvqdVyUJbN9ap9Y?=
 =?us-ascii?Q?gk5HsEAphhIg6buBh3lHOATcruQvFxYOivtdAaHQH+L+ASZcN8dQsHbhwXVz?=
 =?us-ascii?Q?/R6SJLkPTjgSF94p4xP29HowqEhX3vxzCrSx4RClvf1jzmik9gahI3AQy/uU?=
 =?us-ascii?Q?hExLULaoiMNboW9Z+O82d94a/jSARKmtNbEeFiWRFAXHfSY5TtjL6aNkfyYH?=
 =?us-ascii?Q?0WJDEy35xdt5e2NxwKbMUrUG/uxVSvCph4C1dUlu1iRB2WImkeHwOpVDvlQC?=
 =?us-ascii?Q?wDDGh9uccZ6Z96atVb1fo13fAWzNBx5VyzLV9NDm9o0lWOmpwUeIWPmWK6we?=
 =?us-ascii?Q?a4DZBnfqqU9al5c8G+PPBQ6DrsOizzhW6ooewWqSqCvp+mt2CkrUjiqejn2w?=
 =?us-ascii?Q?WtkqLtY5m8qojBZnCZiI759LFzr6bDoZVWgTM7Ow5MUzwaA7jBcZMgxSuTTH?=
 =?us-ascii?Q?O3ZvqG1XTXy6L5BiubCILzscXgGjsg3hQ5HEyz4uWHsCi1i3nWqYGaKwUdBR?=
 =?us-ascii?Q?PaeD2j8iLmhhbCt6KhbSfhTub7nd1QUXkymtEfTMUD+mKRgLeOcPuCAkXtyK?=
 =?us-ascii?Q?unYXuRIX5uAe03mUOPZu00B7qOppgumrUDAHKXnrkfAHnl7a9YFoJkOjDcGO?=
 =?us-ascii?Q?r7rXmNtjPfrdr7V1UsQHUdGqsEk5yH+7yMNAav21iD3BYlK+D79bELGi3QPC?=
 =?us-ascii?Q?MzkCDlUZbfJYsP76sjexX7ziHe4wXipgDXBiBDwXcAYfFy3ZqE9E9jYSkIrC?=
 =?us-ascii?Q?ktBG911DiXpS+Ja0/mdRzzdd1oEFthO/8aT3VE+K7K/MmSK4oMwRb22aokg4?=
 =?us-ascii?Q?lL7G+F6Grm51DNyLWj+O3MoaolhCCCjByg8wH6Ic27FfpHaojTHDxEPxra4j?=
 =?us-ascii?Q?kNw3MKtEEKLfjtkVaHuXRQuYWtbtF86GT7jjodXGRgmom4DiXwuz2pU+gxf6?=
 =?us-ascii?Q?dNb7cNa/+H+5cYsSApOZ5rybvNwbwzdGleoMd72+vDOntb9GWPqcJ7rhtXbo?=
 =?us-ascii?Q?8yNpONG7vUC77biCqzJBZUnkBrgXp2jFXhGmgnM3uuRaBgTSbOnYKQcE8coy?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d3cbfb-2793-4572-bef6-08dc6423e740
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 06:00:54.7647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HTBOu0snWlN/Q+JkuwKfFa6ly6UIqf+PbHEsLdROSPzuTdAE7/h9NYHharcI1GPUGNnCEminU3IvgSNzuat+lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8741
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

On Wed, Apr 24, 2024 at 09:49:11AM +0530, Himal Prasad Ghimiray wrote:
> The function xe_guc_submit_stop consistently returns 0 without an error
> state, prompting the caller to verify it, which is redundant.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Nice cleanup.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c         |  4 +---
>  drivers/gpu/drm/xe/xe_guc.c        | 10 ++--------
>  drivers/gpu/drm/xe/xe_guc.h        |  2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c |  3 +--
>  drivers/gpu/drm/xe/xe_guc_submit.h |  2 +-
>  drivers/gpu/drm/xe/xe_uc.c         | 12 ++++--------
>  drivers/gpu/drm/xe/xe_uc.h         |  2 +-
>  7 files changed, 11 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 491d0413de15..1c661dadd12c 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -655,9 +655,7 @@ static int gt_reset(struct xe_gt *gt)
>  	xe_uc_stop_prepare(&gt->uc);
>  	xe_gt_pagefault_reset(gt);
>  
> -	err = xe_uc_stop(&gt->uc);
> -	if (err)
> -		goto err_out;
> +	xe_uc_stop(&gt->uc);
>  
>  	xe_gt_tlb_invalidation_reset(gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 240e7a4bbff1..4822bf8565b4 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -891,17 +891,11 @@ void xe_guc_stop_prepare(struct xe_guc *guc)
>  	XE_WARN_ON(xe_guc_pc_stop(&guc->pc));
>  }
>  
> -int xe_guc_stop(struct xe_guc *guc)
> +void xe_guc_stop(struct xe_guc *guc)
>  {
> -	int ret;
> -
>  	xe_guc_ct_stop(&guc->ct);
>  
> -	ret = xe_guc_submit_stop(guc);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> +	xe_guc_submit_stop(guc);
>  }
>  
>  int xe_guc_start(struct xe_guc *guc)
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 94f2dc5f6f90..a3c92b74a3d5 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -35,7 +35,7 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p);
>  int xe_guc_reset_prepare(struct xe_guc *guc);
>  void xe_guc_reset_wait(struct xe_guc *guc);
>  void xe_guc_stop_prepare(struct xe_guc *guc);
> -int xe_guc_stop(struct xe_guc *guc);
> +void xe_guc_stop(struct xe_guc *guc);
>  int xe_guc_start(struct xe_guc *guc);
>  bool xe_guc_in_reset(struct xe_guc *guc);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index c7d38469fb46..a0968e3204be 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1458,7 +1458,7 @@ void xe_guc_submit_reset_wait(struct xe_guc *guc)
>  	wait_event(guc->ct.wq, !guc_read_stopped(guc));
>  }
>  
> -int xe_guc_submit_stop(struct xe_guc *guc)
> +void xe_guc_submit_stop(struct xe_guc *guc)
>  {
>  	struct xe_exec_queue *q;
>  	unsigned long index;
> @@ -1478,7 +1478,6 @@ int xe_guc_submit_stop(struct xe_guc *guc)
>  	 * creation which is protected by guc->submission_state.lock.
>  	 */
>  
> -	return 0;
>  }
>  
>  static void guc_exec_queue_start(struct xe_exec_queue *q)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index fad0421ead36..4275b7da9df5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -16,7 +16,7 @@ int xe_guc_submit_init(struct xe_guc *guc);
>  
>  int xe_guc_submit_reset_prepare(struct xe_guc *guc);
>  void xe_guc_submit_reset_wait(struct xe_guc *guc);
> -int xe_guc_submit_stop(struct xe_guc *guc);
> +void xe_guc_submit_stop(struct xe_guc *guc);
>  int xe_guc_submit_start(struct xe_guc *guc);
>  
>  int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 4feb35c95a1c..0f6cfe06e635 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -215,13 +215,13 @@ void xe_uc_stop_prepare(struct xe_uc *uc)
>  	xe_guc_stop_prepare(&uc->guc);
>  }
>  
> -int xe_uc_stop(struct xe_uc *uc)
> +void xe_uc_stop(struct xe_uc *uc)
>  {
>  	/* GuC submission not enabled, nothing to do */
>  	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> -		return 0;
> +		return;
>  
> -	return xe_guc_stop(&uc->guc);
> +	xe_guc_stop(&uc->guc);
>  }
>  
>  int xe_uc_start(struct xe_uc *uc)
> @@ -247,17 +247,13 @@ static void uc_reset_wait(struct xe_uc *uc)
>  
>  int xe_uc_suspend(struct xe_uc *uc)
>  {
> -	int ret;
> -
>  	/* GuC submission not enabled, nothing to do */
>  	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>  		return 0;
>  
>  	uc_reset_wait(uc);
>  
> -	ret = xe_uc_stop(uc);
> -	if (ret)
> -		return ret;
> +	xe_uc_stop(uc);
>  
>  	return xe_guc_suspend(&uc->guc);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index e4d4e3c99f0e..5dfa7725483d 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -16,7 +16,7 @@ int xe_uc_fini_hw(struct xe_uc *uc);
>  void xe_uc_gucrc_disable(struct xe_uc *uc);
>  int xe_uc_reset_prepare(struct xe_uc *uc);
>  void xe_uc_stop_prepare(struct xe_uc *uc);
> -int xe_uc_stop(struct xe_uc *uc);
> +void xe_uc_stop(struct xe_uc *uc);
>  int xe_uc_start(struct xe_uc *uc);
>  int xe_uc_suspend(struct xe_uc *uc);
>  int xe_uc_sanitize_reset(struct xe_uc *uc);
> -- 
> 2.25.1
> 
