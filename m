Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323D9C369B2
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 04:54:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AAB10E16B;
	Thu, 17 Apr 2025 04:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O/XGejHH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E33110E16B
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 04:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744865663; x=1776401663;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TyOlcuZCklPGvzsIrAIYZENXlDVlQkGi5ZWYrSEYwi8=;
 b=O/XGejHHfPWvWweSfbJcL70CLF/XNIaY9rE9JfK5323nPqMfjh0s6auM
 VeM18qTTlWLCiO2cq3Dxrc1VJR0rlFwVF08sGqW8GiZHm1y6iry94TEc1
 jjqAgcTkKyJfHWjBgzSjlS0tVHnQH9Z5+XzzhoCjbBnc9R+aQiIqDFt0O
 8+n+GaezIbVKFjQexRDBDCcAltxHfWP2RDzUrrTGLE6i7AFyLN7zlD6wf
 5EYQ6/NnCZDEEYAopJwDoBpaks+4eZsdxPH9+Nvxmq3h1JGxnVdsLPh6p
 vPvy2K7CQxzhLX1VHhm8yBcg0CesfXzJsZnHn1lTMVqDlNejbGTAetQmV w==;
X-CSE-ConnectionGUID: jR68nm+YR5aYBMsgjkHV4w==
X-CSE-MsgGUID: NfPiOx1dQvyUlt7AMqcy5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="34051997"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="34051997"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 21:54:22 -0700
X-CSE-ConnectionGUID: Zt5lXxfPS9a97A9Z9woy3w==
X-CSE-MsgGUID: eTGbT6J8RVCPydJ21vHfGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="131671330"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 21:54:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 21:54:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 21:54:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 21:54:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nKIDa4BL0I410rGwebrAfKBxnXg4IdjFUzKaJjQb7y74NdMKA0whzR90mfs2WCXNufuuHQu3GsjAoGg4cQcKZ+GgNhlT0rQv5NWJRZ61lg/TK4/LALa5uHCktCKfNS6KBLGqS1mH7kpY/q2oi7RlWDlp/3SE8FfbuU9NyT9GjbWg8wJrBRI/JCTGOEIPO21w2fYvtEk1Zll7THc41FB7+j2E/3FU5T/oSWh3/kg0mKtcZWNqkL0+7KAWpzHCDOlqygxXwpd/vn0wpt3UDy1ssXplzvy+MEDkHd8qWCNNhxt7ZPyzCk1M0IIc7ulcUFHLENafOQLPNHTyrm9fsOChhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3sQnqa6ZyYY15yrj6aMw18gX4llOpJ0t1mSNbeZJpzg=;
 b=gJsqDD6lTRdDX/xpCTyaWHuyiOsDn97gfKYZJ2Ll2I+V2CGuc0FD6r+DSI26MPcYwoDfDddiv206edYRFBXJHZ3SMHY6tNm5nWowJXbrirl0WRm/XZMbigiBUHsBmKu/gYXHF4Kdy2DM52HjaSQ3zK9izV7sY4Pfg2URxb95kARKVSK721nFTXF0kX+Lvp3GDQ4B87hCjlTjoDfMWGKcGh7P264MCnH81g9TD+XEtLCRh+SodhVaT2qwb73OoH/vs7GWGGXNa++XexwPlNgEMx6whPfWjVCGugaSZeaCqR2xmP3UoEL73Rsd/HafJv1iSId9Q3DcvqYytvQcj6q0rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB9086.namprd11.prod.outlook.com (2603:10b6:208:57b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.38; Thu, 17 Apr
 2025 04:53:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8632.036; Thu, 17 Apr 2025
 04:53:38 +0000
Date: Wed, 16 Apr 2025 21:54:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 14/32] drm/xe/svm: Implement prefetch support for SVM
 ranges
Message-ID: <aACJoZMXsfA+hu4F@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-15-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250407101719.3350996-15-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0085.namprd03.prod.outlook.com
 (2603:10b6:303:b6::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB9086:EE_
X-MS-Office365-Filtering-Correlation-Id: 8da756d1-bd98-4a50-06fb-08dd7d6bd175
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Oq9WGyX/nQA+GkCbg1us/q9NAfCBlDVAgtDQEMvSmvrPd1H4HmmMj1iHBetz?=
 =?us-ascii?Q?EmzvORP/bd54RSR51vnPqZ8D52YgRJ8ShLwS+ZNxOXbaddN3G3onbnyKH+M/?=
 =?us-ascii?Q?AEtFLBs9RlqL4euIsnNQNuaBVhbrPfY7BjRbz7fzG9XUaw28PT60xv+cz4s6?=
 =?us-ascii?Q?Z0Dg1qAYmk3uCQujD/2IuplIQ8HleLqur1S85cQDg57Rv342S6Ly47MvGc0l?=
 =?us-ascii?Q?GtMUDW+wxrA6XWaqn/6rWcBr2uVfoboH1rAfNemC20VAI0rLM1jvSCK6NH7m?=
 =?us-ascii?Q?SMMMUGwEQMvdLNKjg4d2yJZLfKEAzx0S2djP9Y7EpCaHlCvJYeghekTzBvxi?=
 =?us-ascii?Q?aoxsPg9IstbYgfQA3L6/ModQ0njYDNI1MktHRXf1HtWi9GcNF6aBiDIlxktP?=
 =?us-ascii?Q?7Xwj+OPpyaTEb6V6pW/V82hMXwvuufYIiKr6u6vN9ViQPZq+zDlq5zLARktf?=
 =?us-ascii?Q?mJfu3e1+XNaVBDPrrj4q4XO2opkq1FHU8LNoUBsSTtFoGpLwzYgDq8XSymdi?=
 =?us-ascii?Q?ilPEjG429gZeKGgymrY3624T9qaNCo653BlLFKuWo2LNDRAdl7KNVDJ3xr1g?=
 =?us-ascii?Q?ePIVBnwxvnk1QPWzH81cjPtenaep2vOrIDy40yVQUZQKPAGThWB8gsF5Jo0F?=
 =?us-ascii?Q?fB17zTrGcm+dG6DjUPdktacmJuke7PNEm64sU5jNBkbRAhn4xTmDRWDoCLbO?=
 =?us-ascii?Q?pY7jmogr2lNyp468HQarhPyMxatcGgF/hi6WLIwC0CKNF7di4IdM4eaIyTSs?=
 =?us-ascii?Q?/pgsVVc1NgofZlKnBppyZrq1Er3ZQuu0OzpuBC/Dm8PWgK9diuVMQvjyOQDR?=
 =?us-ascii?Q?HP5LBm5eBrRLRVlkZeKMQyMy3TPE9LsOoOduceMn/baWfckJJOCWbwBmF4Gv?=
 =?us-ascii?Q?SAo2KFlRsvWg7mOKPWoBI2rLJsLXhHwU9oM4o+aWAWuxRXBouq/+FtWg2nnu?=
 =?us-ascii?Q?mI1XUvefn6dDBm7QHThzOL1tHLpAKphUOfU2hEiZZq0+DeKsh+0nI5oqr9SJ?=
 =?us-ascii?Q?yZn1ZZm18bSsSGH5MB9DqF3qDA2SNYTd+crv4GSv6w6Nt5fiOoqRkHasHnIS?=
 =?us-ascii?Q?/ItaxrRznkB7zBysHtOqtDBgcwJsrrtHQ9SQiiWD5ShMx09xlOLSpNGHMHRq?=
 =?us-ascii?Q?bGSBdJYL+suvPJbBFCUXzPF2kft9uF8j+T5xQ4kaq/4pkuzNkNZRxytSQ6fE?=
 =?us-ascii?Q?UMhf7WZJAwyH56X+6vVx2lG010wOgm8R4PopIGLUNhluf75/YnSx/crRkvJl?=
 =?us-ascii?Q?M7f9+uY+M60wJFTVysNvbMlX7UGoHcG6ESx06wm3t0/WJVhKTLcQnyf4spgw?=
 =?us-ascii?Q?aXxax4tSseUWJUXLtGEueQLtAzKBU4zmTMnDKJaVIxG1jE7+4Gxckqp2FTs8?=
 =?us-ascii?Q?rWfh+O+Hzk0jkQjXqQJRdX7T54dFq6MDTigD3rbaw4EhXF7bv+gXlu0hqvS5?=
 =?us-ascii?Q?VS7HGY4ws9Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cqv3vh9SidgVydL3I9+hmXKSkLl1WmJN/GC1j+FFJJkfUhbuAmBgABNlaRjV?=
 =?us-ascii?Q?zC1fXzIM697iw21u+vbFo5VN3RQckz3vjqbRWm4d0dqnjK42X0tgTauwN6FH?=
 =?us-ascii?Q?kOFDlJDysQ7FE5AMBD+PvAFqRqRqgF5JCaJ5zXvwWdC8tgkxSDjnCqXyU1c1?=
 =?us-ascii?Q?1aBZyQSe0uQDDxTg6HpAd3KC2NE99nx47LnsWc9MpyHQHmAZFCbMX7rGBsEW?=
 =?us-ascii?Q?6SkRHKEWYl3rA4lssmOPqSUJ/tRj70qy6Gpc6WvHDcRZiMk7tc10vyrqw1cJ?=
 =?us-ascii?Q?nt2jqkiAMQXTlPnfBGpP+ZuYsB7T1cQzTT5T2SfbjFGAOZQauJn6URroS2XX?=
 =?us-ascii?Q?It2yTeaNwauxUUcyinw99baeRGZgwriOvpspzgQ4e5eOyCvJZDAdSvGy1r+s?=
 =?us-ascii?Q?9TaNwU2FuAtbruPjjTIPBECDGQN2vPSn+h/jbBKXOD/0fx5OIvAEgA7HZLyp?=
 =?us-ascii?Q?pdnyELcNt8KnEMK3mZpta0kt6HY11/onlB264EYzKcfriGzNFNSDB8zisIHf?=
 =?us-ascii?Q?29vTvtLBeTC9pZBvYSY5mntDq0pqoAfWcMI3JxConRtcVXM1aQLId2/cRCr8?=
 =?us-ascii?Q?7mijUexQZ2Y8OyGNuDp7DlO3hy1XmlAhLJaYiQCwxJiZ8IMkcJtqTAUMlwuX?=
 =?us-ascii?Q?wX3QLjS85SM2npRBQwpyjYVY/tLlMr3LSje9+9hpbXCgTm6z5B93dORPaIlP?=
 =?us-ascii?Q?HMv14sM43AUDXppL/jvkJ7xtXdcnvtFaWtPjnxfd4b6cbW4tqFIbdG6tOaqd?=
 =?us-ascii?Q?pvHoK8yGjjxVBlFradPIEv8W6/c4sve7K7etckfgQy8hMVP8RAVAIvmvuN1N?=
 =?us-ascii?Q?RNJnOyugp25yWUr2vwWyEdFdk7E77WcBjOM3LrA23IDsvAukhdiz5EdqhKqZ?=
 =?us-ascii?Q?ImDwdU8yOmwuVUjSFCgsDNTRxYBTNSa4WYkEL0w4rb5fxO6Z7yqvYo6YLsw3?=
 =?us-ascii?Q?3QnTC9oDO5rR395a+ZV3lk/k05cxQ21vgSsVLi3jrJdHes0dlU/r/6FdHLsa?=
 =?us-ascii?Q?aPSU6ZJ2HCOVvBdYHN72Yq6sNmOd8T30uY4e2299QHyizWLbxI49KL+cxBuu?=
 =?us-ascii?Q?3msEhdsdh1/5PoqLgtS/Gom9l4IuhbSX4+rlbQh8goWVahWJFxP04wSVCfRP?=
 =?us-ascii?Q?YDpxMys+3wvZkWeHgW9JDyQyTFw14wUyfYB2xe8mftttjyA4heouDHIO0W/K?=
 =?us-ascii?Q?dAaYtx2WqoJYuHTKXHrw8yXKVXrcS3u/zflG3Zo6Bj3gfY0X/tnJrc+QJxCC?=
 =?us-ascii?Q?/zRxCa81HrWpq1GRq2cFsLZrx/GTfsVrHBzabAsw/O2nP1q++Jfxo7zEt/cF?=
 =?us-ascii?Q?++C6iLOr7MchnSiB1kad/FCI/nP6OjYfJGdIZ3z7ZSS+URl9DhTP4D5fu5Vv?=
 =?us-ascii?Q?vBerxL1mOJaPOwJk513zUumQGqtzGtI3hevkYe4ZsD4bRMNEBo+DNqhfQ91T?=
 =?us-ascii?Q?DdjyCLymqlQjUxf9IQhaJ7w150gPn7WoJwv/Mrsi7FFR0Kcjan0tNVJp8TV8?=
 =?us-ascii?Q?HZGkyDW3D3aoVeomE22JasqzlB0Bt3GVNpAP224D0yy2bYUgdeTTVB5faR7D?=
 =?us-ascii?Q?KyxErYDGqej8ycK0QTR+OqFAIysvqxqg9D6zxhfmI6DAmjsfSXhLgkzJAUAP?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da756d1-bd98-4a50-06fb-08dd7d6bd175
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 04:53:38.7730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /pTkVgoVJoMEGaR+1ixULLKvRNKk6KoJmmkNYR7AZy6m6wg/a9WYtScq5VKYHx6/wQOz1SVO4oAO0UTOWL9Neg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9086
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

On Mon, Apr 07, 2025 at 03:47:01PM +0530, Himal Prasad Ghimiray wrote:
> This commit adds prefetch support for SVM ranges, utilizing the
> existing ioctl vm_bind functionality to achieve this.
> 
> v2: rebase
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c |  61 +++++++++---
>  drivers/gpu/drm/xe/xe_vm.c | 185 +++++++++++++++++++++++++++++++++++--
>  2 files changed, 222 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index de4e3edda758..59dc065fae93 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1458,7 +1458,8 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
>  	struct xe_vm *vm = pt_update->vops->vm;
>  	struct xe_vma_ops *vops = pt_update->vops;
>  	struct xe_vma_op *op;
> -	int err;
> +	int ranges_count;
> +	int err, i;
>  
>  	err = xe_pt_pre_commit(pt_update);
>  	if (err)
> @@ -1467,20 +1468,33 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
>  	xe_svm_notifier_lock(vm);
>  
>  	list_for_each_entry(op, &vops->list, link) {
> -		struct xe_svm_range *range = op->map_range.range;
> +		struct xe_svm_range *range = NULL;
>  
>  		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
>  			continue;
>  
> -		xe_svm_range_debug(range, "PRE-COMMIT");
> -
> -		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
> -		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
> +		if (op->base.op == DRM_GPUVA_OP_PREFETCH) {
> +			xe_assert(vm->xe,
> +				  xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.prefetch.va)));
> +			ranges_count = op->prefetch_range.ranges_count;
> +		} else {
> +			xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
> +			xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
> +			ranges_count  = 1;
> +		}
>  
> -		if (!xe_svm_range_pages_valid(range)) {
> -			xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
> -			xe_svm_notifier_unlock(vm);
> -			return -EAGAIN;
> +		for (i = 0; i < ranges_count; i++) {

xa_for_each as it doesn't make any assumptions above the key (e.g. the value of i).

> +			if (op->base.op == DRM_GPUVA_OP_PREFETCH)
> +				range = xa_load(&op->prefetch_range.range, i);

I'd move this logic above... So I'd write it like this...

if (op->base.op == DRM_GPUVA_OP_PREFETCH) {
	assert
	xe_for_each
		do_pages_check()
} else {
	assert
	do_pages_check();
}

> +			else
> +				range = op->map_range.range;
> +			xe_svm_range_debug(range, "PRE-COMMIT");
> +
> +			if (!xe_svm_range_pages_valid(range)) {
> +				xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
> +				xe_svm_notifier_unlock(vm);
> +				return -EAGAIN;

So in the case of prefetch, this is bit inconsistent as below when
things race, you return -ENODATA which is converted to 0 in the IOCTL.
-EAGAIN here could result in a livelock in the right conditions as
-EAGAIN means must retry. I think maybe just -ENODATA if a prefetch
fails... If there are any other binds in the array of IOCTL they will
just fault I guess. Maybe not a concern as only VK uses array of binds
at the moment.

> +			}
>  		}
>  	}
>  
> @@ -2065,11 +2079,21 @@ static int op_prepare(struct xe_vm *vm,
>  	{
>  		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>  
> -		if (xe_vma_is_cpu_addr_mirror(vma))
> -			break;
> +		if (xe_vma_is_cpu_addr_mirror(vma)) {
> +			struct xe_svm_range *range;
> +			int i;
>  
> -		err = bind_op_prepare(vm, tile, pt_update_ops, vma, false);
> -		pt_update_ops->wait_vm_kernel = true;
> +			for (i = 0; i < op->prefetch_range.ranges_count; i++) {
> +				range = xa_load(&op->prefetch_range.range, i);

Again xe_for_each...

> +				err = bind_range_prepare(vm, tile, pt_update_ops,
> +							 vma, range);
> +				if (err)
> +					return err;
> +			}
> +		} else {
> +			err = bind_op_prepare(vm, tile, pt_update_ops, vma, false);
> +			pt_update_ops->wait_vm_kernel = true;
> +		}
>  		break;
>  	}
>  	case DRM_GPUVA_OP_DRIVER:
> @@ -2273,9 +2297,16 @@ static void op_commit(struct xe_vm *vm,
>  	{
>  		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>  
> -		if (!xe_vma_is_cpu_addr_mirror(vma))
> +		if (xe_vma_is_cpu_addr_mirror(vma)) {
> +			for (int i = 0 ; i < op->prefetch_range.ranges_count; i++) {

Again xe_for_each...

> +				struct xe_svm_range *range = xa_load(&op->prefetch_range.range, i);
> +
> +				range_present_and_invalidated_tile(vm, range, tile->id);
> +			}
> +		} else {
>  			bind_op_commit(vm, tile, pt_update_ops, vma, fence,
>  				       fence2, false);
> +		}
>  		break;
>  	}
>  	case DRM_GPUVA_OP_DRIVER:
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 57af2c37f927..ffd7ad664921 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -798,10 +798,36 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
>  }
>  ALLOW_ERROR_INJECTION(xe_vma_ops_alloc, ERRNO);
>  
> +static void clean_svm_prefetch_op(struct xe_vma_op *op)
> +{

Can we rename this with fini convention to match xe_vma_ops_fini?

> +	struct xe_vma *vma;
> +
> +	vma = gpuva_to_vma(op->base.prefetch.va);
> +
> +	if (op->base.op == DRM_GPUVA_OP_PREFETCH && xe_vma_is_cpu_addr_mirror(vma)) {
> +		xa_destroy(&op->prefetch_range.range);
> +		op->prefetch_range.ranges_count = 0;

Do you need to set 'op->prefetch_range.ranges_count' to zero here.

> +	}
> +}
> +
> +static void clean_svm_prefetch_in_vma_ops(struct xe_vma_ops *vops)
> +{

Same here, fini convention?

> +	struct xe_vma_op *op;
> +
> +	if (!(vops->flags & XE_VMA_OPS_HAS_SVM_PREFETCH))
> +		return;
> +
> +	list_for_each_entry(op, &vops->list, link) {
> +		clean_svm_prefetch_op(op);
> +	}

Brackets not needed.

> +}
> +
>  static void xe_vma_ops_fini(struct xe_vma_ops *vops)
>  {
>  	int i;
>  
> +	clean_svm_prefetch_in_vma_ops(vops);
> +
>  	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
>  		kfree(vops->pt_update_ops[i].ops);
>  }
> @@ -2248,13 +2274,25 @@ static bool __xe_vm_needs_clear_scratch_pages(struct xe_vm *vm, u32 bind_flags)
>  	return true;
>  }
>  
> +static void clean_svm_prefetch_in_gpuva_ops(struct drm_gpuva_ops *ops)
> +{

Same here, fini convention?

> +	struct drm_gpuva_op *__op;
> +
> +	drm_gpuva_for_each_op(__op, ops) {
> +		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> +
> +		clean_svm_prefetch_op(op);
> +	}
> +}
> +
>  /*
>   * Create operations list from IOCTL arguments, setup operations fields so parse
>   * and commit steps are decoupled from IOCTL arguments. This step can fail.
>   */
>  static struct drm_gpuva_ops *
> -vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> -			 u64 bo_offset_or_userptr, u64 addr, u64 range,
> +vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> +			 struct xe_bo *bo, u64 bo_offset_or_userptr,
> +			 u64 addr, u64 range,
>  			 u32 operation, u32 flags,
>  			 u32 prefetch_region, u16 pat_index)
>  {
> @@ -2262,6 +2300,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  	struct drm_gpuva_ops *ops;
>  	struct drm_gpuva_op *__op;
>  	struct drm_gpuvm_bo *vm_bo;
> +	u64 range_end = addr + range;
>  	int err;
>  
>  	lockdep_assert_held_write(&vm->lock);
> @@ -2323,14 +2362,61 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  			op->map.invalidate_on_bind =
>  				__xe_vm_needs_clear_scratch_pages(vm, flags);
>  		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
> -			op->prefetch.region = prefetch_region;
> -		}
> +			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> +
> +			if (!xe_vma_is_cpu_addr_mirror(vma)) {
> +				op->prefetch.region = prefetch_region;
> +				break;
> +			}
>  
> +			struct drm_gpusvm_ctx ctx = {
> +			.read_only = xe_vma_read_only(vma),
> +			.devmem_possible = IS_DGFX(vm->xe) &&
> +					   IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> +			.check_pages_threshold = IS_DGFX(vm->xe) &&
> +						 IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
> +						 SZ_64K : 0,

The alignment looks weird here.

Also you don't techincally need to set check_pages_threshold here give
this is used by get_pages which is not called here.

> +			};
> +
> +			op->prefetch_range.region = prefetch_region;
> +			struct xe_svm_range *svm_range;
> +			int i = 0;

I don't think you need 'i' here, you probably just can use xa_alloc
rather than xa_store if use xe_for_each everywhere else.


> +
> +			xa_init(&op->prefetch_range.range);
> +			op->prefetch_range.ranges_count = 0;
> +alloc_next_range:
> +			svm_range = xe_svm_range_find_or_insert(vm, addr, vma, &ctx);
> +

I think you want to check if range has a mapping and is in preferred
location, if it is then don't add to the xarray as no reason to try to
migrate it or rebind the GPU pages.

> +			if (PTR_ERR(svm_range) == -ENOENT)
> +				break;
> +
> +			if (IS_ERR(svm_range)) {
> +				err = PTR_ERR(svm_range);
> +				goto unwind_prefetch_ops;
> +			}
> +
> +			xa_store(&op->prefetch_range.range, i, svm_range, GFP_KERNEL);
> +			op->prefetch_range.ranges_count++;
> +			vops->flags |= XE_VMA_OPS_HAS_SVM_PREFETCH;
> +
> +			if (range_end > xe_svm_range_end(svm_range) &&
> +			    xe_svm_range_end(svm_range) < xe_vma_end(vma)) {
> +				i++;
> +				addr = xe_svm_range_end(svm_range);
> +				goto alloc_next_range;
> +			}
> +		}
>  		print_op(vm->xe, __op);
>  	}
>  
>  	return ops;
> +
> +unwind_prefetch_ops:
> +	clean_svm_prefetch_in_gpuva_ops(ops);
> +	drm_gpuva_ops_free(&vm->gpuvm, ops);
> +	return ERR_PTR(err);
>  }
> +
>  ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
>  
>  static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> @@ -2645,8 +2731,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  					return err;
>  			}
>  
> -			if (!xe_vma_is_cpu_addr_mirror(vma))
> +			if (xe_vma_is_cpu_addr_mirror(vma))
> +				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask,
> +							      op->prefetch_range.ranges_count);
> +			else
>  				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
> +
>  			break;
>  		default:
>  			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> @@ -2772,6 +2862,58 @@ static int check_ufence(struct xe_vma *vma)
>  	return 0;
>  }
>  
> +static int prefetch_ranges_lock_and_prep(struct xe_vm *vm,
> +					 struct xe_vma_op *op)
> +{
> +	int err = 0;
> +
> +	if (op->base.op  == DRM_GPUVA_OP_PREFETCH) {


if (op->base.op != DRM_GPUVA_OP_PREFETCH || xe_vma_is_cpu_addr_mirror(vma))
	return 0;

Will help with spacing. Or do this check at the caller.

> +		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> +		struct drm_gpusvm_ctx ctx = {
> +			.read_only = xe_vma_read_only(vma),
> +			.devmem_possible = IS_DGFX(vm->xe) &&
> +					   IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
> +			.check_pages_threshold = IS_DGFX(vm->xe) &&
> +						 IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
> +						 SZ_64K : 0,
> +		};
> +		struct xe_svm_range *svm_range;
> +		struct xe_tile *tile;
> +		u32 region;
> +		int i;
> +
> +		if (!xe_vma_is_cpu_addr_mirror(vma))
> +			return 0;
> +
> +		region = op->prefetch_range.region;
> +
> +		/* TODO: Threading the migration */
> +		for (i = 0; i < op->prefetch_range.ranges_count; i++) {

Again xa_for_each...

> +			svm_range = xa_load(&op->prefetch_range.range, i);
> +			if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
> +				tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
> +				err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
> +				if (err) {
> +					drm_err(&vm->xe->drm, "VRAM allocation failed, can be retried from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
> +						vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));

Not drm_err here, drm_dbg as user space can easily retrigger this.

> +					return -ENODATA;

So this gets squashed into return 0, which I think is correct for now.
Same explaination as above wrt to error codes.

> +				}
> +			}
> +
> +			err = xe_svm_range_get_pages(vm, svm_range, &ctx);
> +			if (err) {
> +				if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
> +					err = -ENODATA;
> +
> +				drm_err(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
> +					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));

Same as above.

We are going to want IGTs to test these error paths btw, issue prefetch
then have another thread immediately touch some of the memory to abort
the prefetch.

> +				return err;
> +			}
> +		}
> +	}
> +	return err;
> +}
> +
>  static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  			    struct xe_vma_op *op)
>  {
> @@ -2809,7 +2951,12 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  	case DRM_GPUVA_OP_PREFETCH:
>  	{
>  		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> -		u32 region = op->prefetch.region;
> +		u32 region;
> +
> +		if (xe_vma_is_cpu_addr_mirror(vma))
> +			region = op->prefetch_range.region;
> +		else
> +			region = op->prefetch.region;
>  
>  		xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
>  
> @@ -2828,6 +2975,23 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  	return err;
>  }
>  
> +static int xe_vma_ops_execute_ready(struct xe_vm *vm, struct xe_vma_ops *vops)
> +{

Let's make these names consistent.

How about...

s/xe_vma_ops_execute_ready/vm_bind_ioctl_ops_prefetch_ranges

s/prefetch_ranges_lock_and_prep/prefetch_ranges

> +	struct xe_vma_op *op;
> +	int err;
> +
> +	if (!(vops->flags & XE_VMA_OPS_HAS_SVM_PREFETCH))
> +		return 0;
> +
> +	list_for_each_entry(op, &vops->list, link) {
> +		err = prefetch_ranges_lock_and_prep(vm, op);
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
>  static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
>  					   struct xe_vm *vm,
>  					   struct xe_vma_ops *vops)
> @@ -2850,7 +3014,6 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
>  	    vm->xe->vm_inject_error_position == FORCE_OP_ERROR_LOCK)
>  		return -ENOSPC;
>  #endif
> -

Look unrelated.

Matt

>  	return 0;
>  }
>  
> @@ -3492,7 +3655,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
>  		u16 pat_index = bind_ops[i].pat_index;
>  
> -		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
> +		ops[i] = vm_bind_ioctl_ops_create(vm, &vops, bos[i], obj_offset,
>  						  addr, range, op, flags,
>  						  prefetch_region, pat_index);
>  		if (IS_ERR(ops[i])) {
> @@ -3525,6 +3688,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	if (err)
>  		goto unwind_ops;
>  
> +	err = xe_vma_ops_execute_ready(vm, &vops);
> +	if (err)
> +		goto unwind_ops;
> +
>  	fence = vm_bind_ioctl_ops_execute(vm, &vops);
>  	if (IS_ERR(fence))
>  		err = PTR_ERR(fence);
> @@ -3594,7 +3761,7 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
>  
>  	xe_vma_ops_init(&vops, vm, q, NULL, 0);
>  
> -	ops = vm_bind_ioctl_ops_create(vm, bo, 0, addr, bo->size,
> +	ops = vm_bind_ioctl_ops_create(vm, &vops, bo, 0, addr, bo->size,
>  				       DRM_XE_VM_BIND_OP_MAP, 0, 0,
>  				       vm->xe->pat.idx[cache_lvl]);
>  	if (IS_ERR(ops)) {
> -- 
> 2.34.1
> 
