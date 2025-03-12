Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F378C28B2E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 20:09:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F8310E0C7;
	Wed, 12 Mar 2025 20:09:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c7rc6Xdk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D133110E0C7
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Mar 2025 20:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741810171; x=1773346171;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RLPWh69BTLRxEu482osbhP4h7q4DniZEmj/jirg0eD8=;
 b=c7rc6XdkCqzsXR/DUcHgHmpXz/tnuACuBLte94d6i1no93054hvUeZRC
 FebWo8SKe1RTevqzYIOzSlppok2so6Nrp55eqBfTpCSP6aPyNSNDqjLcO
 NzYFZR0mEf5BxnUjpokMHOYrBijGJv0t63YHUIvMfxibiWpTBQjVy5XOF
 0Q+QnSXH5CEp70j24ZgaYW6Eahby5bNqEw4Fuh5aJombGRWx3LvEvV+UT
 btVUWlalgWJxg+TmBvGOL578bX/HwTW7W2ndhQDpb6UOwTv2yHQ+nS1Sr
 +3ZmXYNO2duekCLXkzHg8Jlv8Y99jvoNg4GKV06pc9Avj3zOjvtLvWF1a Q==;
X-CSE-ConnectionGUID: HpF8pWExQZWpQHQKgCjdWg==
X-CSE-MsgGUID: q9NGLv6lQWOdxphmb2BZ1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="60306758"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="60306758"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 13:09:30 -0700
X-CSE-ConnectionGUID: MU4pXc1lRsq31zgDiD5S7g==
X-CSE-MsgGUID: +vnz8aFoTom/PlCVyaHUsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="124900917"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2025 13:09:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Mar 2025 13:09:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Mar 2025 13:09:29 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 13:09:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UxrkwCqSyOqh3c7e89XHHe/tPitMGRMssKxFIQ/M/QmAIhQLbM5tz26QTbRCbY2jtUYmQXZSR9x23X+gWh9wLjtpZM4jB2tymv9g8Tt3PqZvIzXB14riYBJAkA+HIi3ZPWN0Te9YoLoMO/BO8+rwZTx+ieCpFon9uL/IV+H5/Eknusl/EeXkG08lt8yNXO/HAZn/EDZbPS49XjV+bUwK33KxSKXVFQWj9VCisiOosRbB6hnRxvf1eYeT/PtTshIWUB0y1FRNPw6EHZzZ15UWlyFmwscWxgDxyBNwEh0FjXtfPCyPCfl2Lp1UvSUGKDSR3b/beawNk/maPfoVB/It9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bl24kuL1kNPomMYacnFYqHfeI1izH0PsK3ly7tfPV7M=;
 b=M7opgzn2kVnGqg6NKc/8Fmt0sLGhziScPCqEQbjog+N4VVMBl87uPewguYvvZ6/tMbNJQPKLPCIox7MYVl09I1cbotN0+HofJg21TnbCDYzyzHbjOuzRKWV97TKOQYAIvcktEPmQX1JpWhDTZ46OPLtM9Am0kHQ5fUF+D4cSxWEIib/T+ii6dcf6GC61xmHzwo/ulDHHSR5YHikGTn4zEcQwn+XoaRfToV+kJYK4xqiQOe5RKUeIn/rwVqeG+VWGPlIAYp1cy6r+0Lmr8cgombgqIYUy7hYUMQqi0GhJovDo2pBBSh+SZ39wxStiqhPuh1FbIJG0JqJkW5qeM2Xg8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA3PR11MB7609.namprd11.prod.outlook.com (2603:10b6:806:319::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 20:09:11 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 20:09:11 +0000
Date: Wed, 12 Mar 2025 16:09:08 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3] drm/xe/svm: Add stats for SVM page faults
Message-ID: <Z9Hp5IXvbdRFhXW6@intel.com>
References: <20250312092749.164232-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250312092749.164232-1-francois.dugast@intel.com>
X-ClientProxiedBy: MW4P223CA0006.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::11) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA3PR11MB7609:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a85d71a-2903-4fcb-9282-08dd61a1c0cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rfR/p9vjYZzpFwZh4o+a3GPUsVWKQsq1T2CJOQBMK9KOAWG3nTTB6/81GPMr?=
 =?us-ascii?Q?xMJs/loXZUW0ncjKjKY+i4ulOHOZwT1Dlc27AcUgu6EwJI234uoIEkGp0Qb+?=
 =?us-ascii?Q?9+VxZR+4jSWwZwJdntfdGNbX48uyJXnkl/F+WFVFtGAQfnMYI5ZAPyTHFSsE?=
 =?us-ascii?Q?qIEsx7vUkAh95q0+93XeidUEzxLGlEz1s+hIBNOl8/nywSEEgd1ExEdcq0VD?=
 =?us-ascii?Q?GTNBfah0BmaPFiauUS8g+NKxOci/0Pp5s+PRTwG6DhVXCm7zwhs+O6zV8x2V?=
 =?us-ascii?Q?XPMyTkn4UTyYWMRRGY31IlFzPPqR1gYEEY0OwqM/CHM+a9X5dDvVTPQkj0Mn?=
 =?us-ascii?Q?su1ToXqLuTa3bmZmVgClFXW7Sx4X9t2zMbVjEGVpqvmrI2JsMSfPk91AuRAL?=
 =?us-ascii?Q?iUydwfPaNflsZvdfvH1mjNy7mNjpiocYNmxXFAK6tJQxfGgG7H2if/h2aj1J?=
 =?us-ascii?Q?4UXrFzm41OsdZZQqGqCWiURsaJBe8aevq7zO14RgiwcOQ/QGazLCy3MMnbBV?=
 =?us-ascii?Q?ckcP7oye1JpWvyiIuSEpJxs/K1l5BPeZlDJ7aHhWDJ351+sf0XSvvcOaie9W?=
 =?us-ascii?Q?AbiBqJyuQo+2AZovTYdMH85XGceW2saWR0lWpqt1f5J5mxKw15NGppPej/fU?=
 =?us-ascii?Q?9iFH+p+0ri6WdAlE7kVTkE7qbcjq4jQy6ooY+MS9uCoycFsc6qOHWgsrgJgS?=
 =?us-ascii?Q?Ei4yi5CFWWxXEtBy047kZu6lmAYcQ97/cirGj2DkDWz6vJRoXQW0qTdHegIr?=
 =?us-ascii?Q?d56D/bHqEbWdTWIEU3zdzKG0apOqUC6AW8HXoZXx8H1MMhg1g09GNucyyUwF?=
 =?us-ascii?Q?ZYkJdFCJinR3VTDlAj82D811k3gDehBLJd5jBxHvuaiD4gWCwv7h6ujMpup1?=
 =?us-ascii?Q?Uby7v5P4BU2JXMqXbJucavo67AMAfSaV3e1PReOESGg4uCCm5AeuvQmP8g63?=
 =?us-ascii?Q?ZIWSI9GVCsHfAykYEqiZPS2UpvVKtn6SXvyfJm6tJyncGyZpENtsQJzCmyP4?=
 =?us-ascii?Q?JLblxZMQXD8XfnNJ2IP1MSdhKgiYecLnkB4o2fE/iyek17+jtxkMYq++oLJu?=
 =?us-ascii?Q?jERtd0hA5fwAdquqKYn5W5ptItADD5RTUy+H9sLSWv8Nw6errEoaBpm9fkEK?=
 =?us-ascii?Q?dvfx52nYJlmyxKwgBS3i4pk4XbgGtkaXZiRTcVKz5zeYnN9gcLcNLRgSAojw?=
 =?us-ascii?Q?YVG0UM0XXIQUK8vExuBh53mTtpWcE0edBWoHPMQgiEMFtUGBcQtO42RyGD+r?=
 =?us-ascii?Q?EeeMAefYPuy0z2NyOqJeP0Q/RUsqbOFTvcudGLb7ykMB+CRlqf9hTMO27BdE?=
 =?us-ascii?Q?VtJ9BxEIBXoGU0emvtPKAeouXXClgrgctc0oD0WhRydRYGGU+ZKyz0aSkcLg?=
 =?us-ascii?Q?I7mWVQxJrbBHMlZ7egfJV8UQOPaO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YgAaaYmBb99PD5Hq1dQRSBqZQufEwaMELPERjWdV9GJ8tcmn0OtHtUWHcdj7?=
 =?us-ascii?Q?RLXzLuhKwG2TblJpFjrbqLXnOcqG+GpSoZPVKTk4n/cv3tRIvuXOQ4psQixM?=
 =?us-ascii?Q?gdvYFWLGLwWDsPAnO4/kCR2khF9RlwCZ9Gets/StMiwrAkJzfJW1CKOqhnz9?=
 =?us-ascii?Q?K5RBQTCpO8yZRFiM9mq4qJtLV/xIERsozVMQezlQnh5eLbBbe3eSl/FW2gIS?=
 =?us-ascii?Q?gMfGVsuMF5us+LpQubdKQfhz/gHlSE3ATd4MDf1zNxQW6ZSH05X4Ke/2DI0+?=
 =?us-ascii?Q?PWN/r4tDEJLX6CDhCNswk7LIrSojEm4vd/eNjKh1g2NTAX2zIu87ftkiiNuh?=
 =?us-ascii?Q?nody19CFfhLhumywYnTHqQ+KNRnQwirg7GQMHCdReo5OIq7f7wLiajUC2E/N?=
 =?us-ascii?Q?ArH1cnJG6DCw8+ZC6K7sFUS0+NzG/g6FGGLLF0sEzMYqeDjiPDZqX51DFeWb?=
 =?us-ascii?Q?Q35L4QqiXybXV9V0a2X6Ui/Fr/y7BwYHzP/QlB8y9ymCjPJpZiZS3FppMJVR?=
 =?us-ascii?Q?lK0HN45tcIhQgGTp9+UI1Y0YPKjnbEWKALrs4IMxWlH4FEHeh5EXoxb375Vs?=
 =?us-ascii?Q?AzvZ52Jfu+74g6/fQX9s+FyrKEetcth3ddFce8uMfEgoLi40BaavYC7DKLm7?=
 =?us-ascii?Q?YsWk8UjI0TOtkAzaYE+jfjt/t3vqD47lBVE5l/atfdPHOm2htKJW9+efd80M?=
 =?us-ascii?Q?4DtXQvM4z9/SinPpNbuTjFS3t04Fo9ei/hoGavmjrKN5UvoOhnfq/hp3IxEu?=
 =?us-ascii?Q?fgE/BEGYUd5wN3XSViQr8oHsFVO7RuggAOJ3VJkJ760aTZtSiWiIHWEpIohD?=
 =?us-ascii?Q?SPYHHyuGMPXH+Rt/RLljF/LDpzHaLSNZsQiRwn5Jslm8K7q0RV8/4i0cHJTh?=
 =?us-ascii?Q?jkki9qCQDqK0LCE/w6MN03uYKxuojYNnWDbeY4zhljkS2m8BFxhJKNO12Y+Q?=
 =?us-ascii?Q?D+cW9eiUMlVctbhxpXcaGK5gJ+rvkwRp8NoFfO1gy6xGX6pnmlbzi1/aeyDn?=
 =?us-ascii?Q?nU0P9eseynMMdwDrcGWOvJZG2q1FZETqrs8oKZfL80ZrglKq3SKmgMxk3Zig?=
 =?us-ascii?Q?ZcsrnGH68VxV0dzypx88TXbIS3atKXoDDcanKkAQ6hLmhD3hvydQve5D7U4B?=
 =?us-ascii?Q?BEZQTiFIu/zoaJswV+WfuxrkxdjlcNqp/y0AFhuzacmw+qqzQ/CMeY81hwVL?=
 =?us-ascii?Q?n8RHqDc1ZLDBERswZSbu0t+yqIw/FfNNXVzd8tBqOoSuM3pJkHbqHOba5J95?=
 =?us-ascii?Q?oUC7n8zT5Q2WpEeyIKCgCUhek5mS416ojyRsb3xq2mbvZ3D4dSY/X+WiGCDf?=
 =?us-ascii?Q?WTmNudV57sT5LzPK1bQc55Ac9N9X7AuO6zadKk93NKUYa66J/oDMOMAWxFFi?=
 =?us-ascii?Q?ZLllDGpJmica6pbjpxR9td9BVtJvGapaxwN9WkKSM6bHI6McdUwrOH9Ca0Gt?=
 =?us-ascii?Q?46Y+sY+DFoN5LLfAOrj0oxjhMVE6WYtkodYqjSB5VFI47grs3hqOWeU1Nl4G?=
 =?us-ascii?Q?Mgb+D4AGMANoMukkjFFxxkf5I79U5rv/FBbXe7cmvJfynRItAYzKVS5x5IcC?=
 =?us-ascii?Q?DkQ63DQ1FO5BMY6ftDi4EqK+tV4Vw6ABX6AtuhfWfvY//Z7KcJ5Opu2SYF7Z?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a85d71a-2903-4fcb-9282-08dd61a1c0cf
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 20:09:11.2915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SLNa86JIvKh6SE7Kyu76IQRR+8pv/1EN0EdkbNH7SGXVhGBc3xhCFk8fyFJb2rCmIVn6tUbDukGmAomeb4oQUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7609
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

On Wed, Mar 12, 2025 at 10:27:49AM +0100, Francois Dugast wrote:
> Add a new entry in stats to for svm page faults. If CONFIG_DEBUG_FS is
> enabled, the count can be viewed with per GT stat debugfs file.
> 
> This is similar to what is already in place for vma page faults.
> 
> Example output:
> 
>     cat /sys/kernel/debug/dri/0/gt0/stats
>     svm_pagefault_count: 6
>     tlb_inval_count: 78
>     vma_pagefault_count: 0
>     vma_pagefault_kb: 0
> 
> v2: Fix build with CONFIG_DRM_GPUSVM disabled
> 
> v3: Update argument in kernel doc
> 

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c   | 2 +-
>  drivers/gpu/drm/xe/xe_gt_stats.c       | 1 +
>  drivers/gpu/drm/xe/xe_gt_stats_types.h | 1 +
>  drivers/gpu/drm/xe/xe_svm.c            | 8 ++++++--
>  drivers/gpu/drm/xe/xe_svm.h            | 7 ++++---
>  5 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index c5ad9a0a89c2..9fa11e837dd1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -240,7 +240,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>  	atomic = access_is_atomic(pf->access_type);
>  
>  	if (xe_vma_is_cpu_addr_mirror(vma))
> -		err = xe_svm_handle_pagefault(vm, vma, gt_to_tile(gt),
> +		err = xe_svm_handle_pagefault(vm, vma, gt,
>  					      pf->page_addr, atomic);
>  	else
>  		err = handle_vma_pagefault(gt, vma, atomic);
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> index 6155ea354432..30f942671c2b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -27,6 +27,7 @@ void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr)
>  }
>  
>  static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
> +	"svm_pagefault_count",
>  	"tlb_inval_count",
>  	"vma_pagefault_count",
>  	"vma_pagefault_kb",
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> index d556771f99d6..be3244d7133c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> @@ -7,6 +7,7 @@
>  #define _XE_GT_STATS_TYPES_H_
>  
>  enum xe_gt_stats_id {
> +	XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT,
>  	XE_GT_STATS_ID_TLB_INVAL,
>  	XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT,
>  	XE_GT_STATS_ID_VMA_PAGEFAULT_KB,
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 516898e99b26..08617a62ab07 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include "xe_bo.h"
> +#include "xe_gt_stats.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_migrate.h"
>  #include "xe_module.h"
> @@ -713,7 +714,7 @@ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>   * xe_svm_handle_pagefault() - SVM handle page fault
>   * @vm: The VM.
>   * @vma: The CPU address mirror VMA.
> - * @tile: The tile upon the fault occurred.
> + * @gt: The gt upon the fault occurred.
>   * @fault_addr: The GPU fault address.
>   * @atomic: The fault atomic access bit.
>   *
> @@ -723,7 +724,7 @@ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>   * Return: 0 on success, negative error code on error.
>   */
>  int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> -			    struct xe_tile *tile, u64 fault_addr,
> +			    struct xe_gt *gt, u64 fault_addr,
>  			    bool atomic)
>  {
>  	struct drm_gpusvm_ctx ctx = {
> @@ -737,12 +738,15 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	struct drm_gpusvm_range *r;
>  	struct drm_exec exec;
>  	struct dma_fence *fence;
> +	struct xe_tile *tile = gt_to_tile(gt);
>  	ktime_t end = 0;
>  	int err;
>  
>  	lockdep_assert_held_write(&vm->lock);
>  	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
>  
> +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
> +
>  retry:
>  	/* Always process UNMAPs first so view SVM ranges is current */
>  	err = xe_svm_garbage_collector(vm);
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index e059590e5076..93442738666e 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -12,10 +12,11 @@
>  #define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
>  
>  struct xe_bo;
> -struct xe_vram_region;
> +struct xe_gt;
>  struct xe_tile;
>  struct xe_vm;
>  struct xe_vma;
> +struct xe_vram_region;
>  
>  /** struct xe_svm_range - SVM range */
>  struct xe_svm_range {
> @@ -64,7 +65,7 @@ void xe_svm_fini(struct xe_vm *vm);
>  void xe_svm_close(struct xe_vm *vm);
>  
>  int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> -			    struct xe_tile *tile, u64 fault_addr,
> +			    struct xe_gt *gt, u64 fault_addr,
>  			    bool atomic);
>  
>  bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
> @@ -102,7 +103,7 @@ void xe_svm_close(struct xe_vm *vm)
>  
>  static inline
>  int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
> -			    struct xe_tile *tile, u64 fault_addr,
> +			    struct xe_gt *gt, u64 fault_addr,
>  			    bool atomic)
>  {
>  	return 0;
> -- 
> 2.43.0
> 
