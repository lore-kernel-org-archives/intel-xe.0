Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5E9CDE008
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 08:00:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBEB510E322;
	Fri, 26 Jun 2026 08:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EyZzDFNE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3EDD10E322
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 08:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782460854; x=1813996854;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tHSKmDNHF7p3rMsTOzPlQxqqcHWGyxIxqNuLlJABQtk=;
 b=EyZzDFNENciGxH6VYU+/08+Am5z9xxQHJl9E6H/wmCUu+Ty2lgcHXT/d
 YfcawAHg5XDtlgNsi2hSVRxGn8xvHjhTst3n7oscLqiXp4fDc4LIAkFp+
 QicdauOAVJptw5DuX1wZuQ5jUGVXiAeRHi3YLla15fjoT/JezBwS/ytvx
 5Y8cwSE8b3/fKyhU32wsIqfAoYXpciL/GEH/sPHr21jaGFZ+zjkPQbprd
 n+XPIG8UBaDD4TM1w5zofMDy9vyLodciPHt9gYq/KX0F7ka5u+s3pYhk9
 U7GfOAnt/NZkFDkWvnlB+rdcN46/fEm6KH6hn5/62/4FkF97qQJWBgQ5E Q==;
X-CSE-ConnectionGUID: 1TygQPw/QBK2pbVf2ht+bg==
X-CSE-MsgGUID: SLuk6ebiSmq0u8Cu8VaC9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83389240"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="83389240"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 01:00:54 -0700
X-CSE-ConnectionGUID: 9Ja4rHeRSta1OoR4GGCvvg==
X-CSE-MsgGUID: /iy5k43bSnScRYzSLkTtcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="250877983"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 01:00:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 01:00:52 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 26 Jun 2026 01:00:52 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.48) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 01:00:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hF1Qx+mTcwGpJ+mpX6lSwImWDWtIgjzSbysDvpjHp2VNitxuup6crtnLsr64wz7MxLkeulsGktE0wu98Q4mhc/ulHIZzd+aJqqctJkMbVlfBruVjlUURh1PyjAqZAGeRK3qU5ZKRiROddmkaP65ap/qIRvahm3GsWsechu6zk8YTwIZOhkOkcNwLju2fv57kf5xNPjzn01nAu5IMfQrVljqr64SF1TfpJGLWrbMEkS+VR6cy88JzgdO579KN5wH18TopGAPtZbXZLBHqftmtyEceovG3iwMNpJj31odd5Hh/IPH2vVR/78wEh7XKTKh+OvVzC9lwJZWNfdNxCMuOkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQpNNyEVuyo3TZFqODSNCcucISW7JK4680R6K+9mOfY=;
 b=tBJRN/KIokgenG2zr/sK77XnYkteFMc8Cv1Irn8/BcVW3iUgrXN/emqBCvCOhntCZ7SjOp/nwZe0qmt0R0TveDqZtUYzGSEhUqVTfeY7N0PuqIjAnaKXgG6/eU+tn3FJdzP6fN9Q4gF8aW87j17CkPpKJeqqEc/Z0QmJkZJseVCHKg5Tb8HQPJd4OOEdvPZoWej/1Geim9q2RZOHhohMDCYGjm+FYV8+aSMQR+4Oh1CgYbR/LBjrY37IVFjW6nt5SaSkv6R7DbmVa7RUfL5pnjBQNw3cA8vV/Vv9dw9D98RFEvMFs2SPE+NoSRQvbp7cLha3dVfcFDCWC4N62v0Jmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by LVXPR11MB9756.namprd11.prod.outlook.com (2603:10b6:408:389::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Fri, 26 Jun
 2026 08:00:50 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%4]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 08:00:50 +0000
Date: Fri, 26 Jun 2026 10:00:43 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Return error on non-migratable faults requiring
 devmem
Message-ID: <aj4xq7gYWYGLZlGR@fdugast-desk>
References: <20260617135101.1245574-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260617135101.1245574-1-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0177.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::26) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|LVXPR11MB9756:EE_
X-MS-Office365-Filtering-Correlation-Id: 25106289-a88b-4fdf-da48-08ded35909ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: I19zaWdOPB/wO/pu5fKlqE5w3sOTbaXMWZPGtqYONftJ7XHxoF0wm2VvLm5ySMTKQc8aOSwSXDsYnFogylqc2BL0edg3LOj+ZeB3oGI6XhUgtaWi7FfAZ4aTRawvsbdHXdYduw2oHkrMzBFPJ4Dgsqvp9pOYebXTM0p40UTyN7vfb8VNNN1GDxkOxKJrudAOs+it/UyY0F7ckFuNlHTzPV+CCvbjDNLVX22dv9mlZAeipwArJiCdBKJNSY6wt4W2xFv5yXOzYQ1MrYUbLfcQxVnU+r2w4hqLcqvmhsgwKrmvq+Ws7aKYkfEk7uUUS+c1Biz4qFWAMxmen0niAOIpTbPNOEUzZXWIdx3KCa5Q9kKc1/MkI8v9KAwkVFzN87lWrDjv0U2TkG9AeTUVs+Txo4AJvp5ZjsEglYM6UurMPRw2UesT9X5pAMDFF9BKRt9R9uaL1eef2ITVVgwTCdEnFia0LQRqqM00tFege4rzB7Gcljb1G1G8uadGeRbLapQ3yNYb7O5jVMnh530IIxS7POLkmpDb4kNOuqDoKTPO73HHvQ/EcB52NPhFof4nDGjWFakHz4Tpcy76ngctZ515RyF0V+NZi4SI9c5bjlwk3nKcMwLIaD5Del+pEsjX4oxpWQ0u2oA/0X6CHa0TnWvB+V+ZecRPGdH5v9tEGDfHVek=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xn7RJ4sa6XoE5fSIMB4chznMTmt/G5dlzQdgAXmNpu2wx2UQYNGQ1+tnWqo0?=
 =?us-ascii?Q?hexdk2m8Mi/S6vZ00WYIeABeE05FsAdYBrSYDGwQq3cF6f9ABkrc2CgDK2xj?=
 =?us-ascii?Q?wx0kubU0B+iUverZsOF+LsrsIoGUL5w84oQnd6z7hY6uzVB8ykFsCwbebNyB?=
 =?us-ascii?Q?TzuUhtPDUiFVyzP3sE2dO0XiQzfP5pyQoC+CqNVsXPUp2Bd1QzPtqfL//+pW?=
 =?us-ascii?Q?FRA/U9LvIHZd9fQTlpD+Zsxn6wegFuEjH/VgAOVdFSb1HJbn+Rhmd/CpLDEm?=
 =?us-ascii?Q?T39XPAkoBC0m3EWoE6KLjrfvEs06Oujpe2GtI94TlsiDCnY6OJF7X2seKZqF?=
 =?us-ascii?Q?zgJbC45sRjYt9WtWwTAoGnwC9QKdbZw8G4zKMgzOlf/tq4ICwm9lV6EVwW3f?=
 =?us-ascii?Q?cXa6iwkz5XMIpbvLYK7NcU2M1xF+xY/1ugRTNR+wEok2yITeoQnovWYt36qW?=
 =?us-ascii?Q?b0hiYwpPpRyk4WKdkm5fu0OsszUsfVlujtKcRjTq3eXSgUnStLGuc3DNA1Wl?=
 =?us-ascii?Q?c7D3IwSl/vimxln5Xq8frravvqPqgxnAEydkh3ftzh8fZ7XGGyVz6RdqrqwL?=
 =?us-ascii?Q?dMDuTsxYFq8fgv/96gtIJ5KL15J9u6c7eSq/xvyxO6ZqOACZsQUmqsIb/RKV?=
 =?us-ascii?Q?owAdH8VByH2D3D1pfX8DKCQuBAvFdi5ZJQ3MoYqQ/qcIO23j7OBRt+SNNJpF?=
 =?us-ascii?Q?i5HqJ1QFLSlLKppl7M2j59ZNDAFg90xj7OPRghsoQl5Rww6qon/J98QhbWsk?=
 =?us-ascii?Q?lZ8j/RGKR9NOv0Ep6aszNokr63VvSP9+a9poorCBlogHHD9pvEt2hCZ2Ov5D?=
 =?us-ascii?Q?EurBDq2moK+N+e2hNfajhHpmmYft1Ub8iKHjh7kn7lrIhUwFLkmGt3TWhwfV?=
 =?us-ascii?Q?erFBXI0JQ+bPZyu4IOvlLMAB+IT1qOBag9dM9Qr/oefjcyK/QxJI13V1FZxO?=
 =?us-ascii?Q?gxinSCuM5WQLnjZaYNNddhxB7Ld+qeYjdlb7h1KpdeEyDtfYVv7uWChnHoVC?=
 =?us-ascii?Q?T61x9ehfqNcjjDNg5/ZlD9+07wOmdmlBuPdm+AVU0lQ7jBJ9k114RvXdJ5Rl?=
 =?us-ascii?Q?B1L7uiNXZPlyLx4wf97dzvRIjeRcNTeVdju+CT7JRDV/hTABXBEiO3xpLKey?=
 =?us-ascii?Q?b9bHL6vGvMsiDTfTZB9TK2bj63zAN/mLHyLAjKz5Bh3Xtu01glj93uWjwFCV?=
 =?us-ascii?Q?OgVLU7ujG5aBOU0HpE1ibp9Jmod4fJh+E3Vc/3bgtQ6vgRAOOfUJfq2xLdC2?=
 =?us-ascii?Q?Z1VuNwXmMjSoHjZcFM0/FlXmQwFsF68UGg7oN3x/kKp63x2eqJs84FDOU9lC?=
 =?us-ascii?Q?BYawXArwQFTvZexZDbtilCcLZXrcgLYOyWiGB/Hy0+Vp1E2i44qUDzgUmpap?=
 =?us-ascii?Q?Sj9dDQpLFLWXFSmFqwV2Yabx0T6RE14KS8SWlY36nDQkkzJ8ix1Xixch0mWw?=
 =?us-ascii?Q?OrTK58B+0MuVJkv4Oj9dt6plK6Mxrxz0HCPjNz2fFYDzmEXmdk79h6pPhm53?=
 =?us-ascii?Q?Xe6s+aANQ4+1V08IrdR2JHwQLc7tGqzybgWCvtRq+Z9myYByOy7BJ+H2LiWU?=
 =?us-ascii?Q?S1Ek9FREOsib3cqAXy0tX1al69XaJgOz+gr8NrOgkntaNEP2qy3oGz8kDnvH?=
 =?us-ascii?Q?q6U6wze5rcCwqwvrP29oeZfUKd2d9GKzJ8E+U7leAPBuduu0wO5U3+mZLJR/?=
 =?us-ascii?Q?3hd5fV31e2o7zZ0MglPkA9Krh85iQByTFbCZwH/SLUkt6s3TBfEysJOuPdhS?=
 =?us-ascii?Q?QXXzrL934qLCLUXONPEeMRt6P8FVcuA=3D?=
X-Exchange-RoutingPolicyChecked: nCAW5H970W4yGTHxX+cfY+yTdTdqI7rG7mdr/c/k4wPHfqM9f20XAnyv8BUz1PydGI559Q2/Hhbwu6wqPA+bZKA0GELcgjai9nVUEe7pVT87HsUdEFxGLASOaAE42h2KiDx7tB2Vjz6x02EtcgsrKyWXRpyJUaCA18xd5+dXNykGq7XHDDNN7nfvzNSHk3eZ0sm0W4vr6gsNTbiphVHdIN63vCdpHnymCNHiqr+34x3j1YK3JysynoddYzBlIURsaQbzO8Wd0qgvEOYQpK53IJYieSluIQUehj6N0Zsv5RqTysrDUOvW7UIU1ndV2MDGs+xupqEfEdsCttyY44gmLg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 25106289-a88b-4fdf-da48-08ded35909ab
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 08:00:50.2260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OmUvpUmADe9EG2jiEOPXRumdE9+iDQvZ25F8BQrc0QgOikKnygKkVYWSo8oQJ3/9QeP2fjfB0x/Qlx0Sh2bhB61ASgXmQUTelknYvoeEO78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR11MB9756
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

On Wed, Jun 17, 2026 at 06:51:01AM -0700, Matthew Brost wrote:
> Non-migratable faults that require devmem incorrectly jump to the 'out'
> label, which squashes the error code intended to be returned to the
> upper layers. Fix this by returning -EACCES instead.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Fixes: ("4208fac3dce5 drm/xe: Add more SVM GT stats")
> Cc: stable@vger.kernel.org
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_svm.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 03cfbf831257..2d8448e5b2fd 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1280,10 +1280,8 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  
>  	xe_svm_range_fault_count_stats_incr(gt, range);
>  
> -	if (ctx.devmem_only && !range->base.pages.flags.migrate_devmem) {
> -		err = -EACCES;
> -		goto out;
> -	}
> +	if (ctx.devmem_only && !range->base.pages.flags.migrate_devmem)
> +		return -EACCES;
>  
>  	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only, dpagemap)) {
>  		xe_svm_range_valid_fault_count_stats_incr(gt, range);
> -- 
> 2.34.1
> 
