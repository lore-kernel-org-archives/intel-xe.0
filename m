Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9C0C77B73
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 22:35:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E405B10E568;
	Thu, 18 May 2023 22:35:27 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F15B10E568
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 22:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684449326; x=1715985326;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KGI3XN2eWMcsyRx0JiJex3N0IBR/JUAD2Zzr7+6IiSc=;
 b=BgomGpdegupJK9U93Y1cjDTeNDD8njuvBmn7bCafiH+lZKvHhwDbytLP
 puUsyZyQ+vnj4WtvtRDk5LZNigrWF2bnl0t9+98NPiVwrfQ4J8BT6u8Kf
 nKgjg8ukLIu1n0QK4eKGsdFPN9NWDudT4V1wLt2MRwd+PxQISEXcrLWQ/
 ucVOIFxMkCqW8/W0vRbVZz+4HVe0ucbSIXKLGN4ylh8FSvFeN1X7i9p65
 u1d9K8YWPLPZOAVKxzbB1U7YijYhZ2XAwjCXDyaTdBGuaMeDSMzF8k8e6
 c9YO9Ly/Zp7gfu/gNOZzdw+xQ2+MfTZ5rLgeY/uv9e2/CKtxQ9tdpc1wd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="354559428"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="354559428"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 15:35:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="814496358"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="814496358"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 18 May 2023 15:35:25 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 15:35:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 15:35:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 18 May 2023 15:35:24 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 18 May 2023 15:35:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TEMidkFcV3dynPKpHccA1q5pxBnESLi1uNAU/Bd2sbpWoB0uy7eNwkrDxAw0DYptIGsbd+Tc/B1QwC7p2D3+1lQnLEok26A7gQJ1FNcPxfjd9/vc+e0TxyFrlZi8lUomDJInes2UfQf4DZa40m/HTN2WyJrIUPpMg0tjDE4P4Sj6xj7BJbaxiXSK3fnTrVmtq7gzyzlkzIvg9VmQ8vmVzTyNbwA7DWvRa3oU/acdl6gjGMESZGpEJVJbKC4hPDXY9v4XcWZmPj/HS/3sjWPU0ZgUa806uvIs5jwI1RDi0znFtWJ/KEIomIp/7NR03LYjHhqbBE8faEpyWD4g2jt16w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfMpmYaWbg4UBKPqEPqByZ6jfltnb9a8km7KE0gwldk=;
 b=BCnubsNRGZwpKm+JR3FkbZ62Qsq6vDPz45hDEcu72WFmyrhfpQNu+AZpfaTdDKb9lfLPF0jT/mVecwAR9neljdBA+pHD6uoYamCwn4K/QuSQWGqtAJPmbMOFlPH3Pp563IfNSRmJYViP1xuta3laC+O3AhVt5gk/TyjpFfoODkHanfNaQ2NuWXy2yvz7PpcGGeAs0L1Hfb7vOfoEM3+Pv9l0sqVrl3z8/RSppVqoydj3Y1cDMm2zKSruzc22SZN77GeN1HcXku505SGUR687+oIqyh9tQBk2YnzGiOa9GaOMgOINLor0/+XTxTAIZTKRK1ej60LocUL6rM2QQ4hSRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA1PR11MB8375.namprd11.prod.outlook.com (2603:10b6:806:38b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Thu, 18 May
 2023 22:35:22 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%7]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 22:35:22 +0000
Date: Thu, 18 May 2023 15:35:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20230518223519.GV6250@mdroper-desk1.amr.corp.intel.com>
References: <20230516145416.1851984-1-rodrigo.vivi@intel.com>
 <20230516145416.1851984-9-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230516145416.1851984-9-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0346.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::21) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA1PR11MB8375:EE_
X-MS-Office365-Filtering-Correlation-Id: f274aab3-7d66-42ea-b044-08db57f02a93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2CBW5BoMdW0gmd2S5HpkrPKx9NVitDhSNX5iUCZQY3Mr1C4UQkpeSof7YiJ4k8yErsOThXkSTpMRCFTmEFKZUwoSzGynXsMQXu2q52+op25UAUFgzoemFmZH0pjFaW1JZG2idWLOBVR472F1w8b7HZyrwpOwJYgdmv/0ZVDTOPlEF/YxyEdgD4QZDQeLYF9U5D7aU4zTyxvLSwYoCyJHSrSg9rWtK6VImUCM8pGOxpZuC4EOn2jee/yCkNJSQan8LSzP20Q/5IS5NHoihxrWAoYqS2luQV1HFPOunSCuAWh2l9PIdto4RhMG7iDB1U2ibmcS7a3rO7rOZIHQH2QPoVRO56o/DeS2zhV6My5u9oseiFp7OCr7pRpRDNnafjVavmsY4lapsrc8dx4ofqAoAtFPf5AM71Daj29tYGjakcJFyZL5JRtIeRbgDCv+IXL7UMGPXbq/5zI+QItzv7ckRgq58+ydmhvWxslwRsPZc7sgD8A5Bqu/h9ZGc4ojeS3INgq/wigeTDKQOo5n1BXzrvcUaHg/LJXySbgdqX16Y15JihbULlSAFtZ71RdOmNLQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(136003)(376002)(39860400002)(346002)(451199021)(316002)(66476007)(6636002)(66556008)(478600001)(4326008)(66946007)(33656002)(83380400001)(1076003)(6512007)(186003)(26005)(6506007)(86362001)(5660300002)(6486002)(2906002)(8676002)(8936002)(6862004)(30864003)(6666004)(38100700002)(82960400001)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N1fXRhu6whoIn9DuKzJhRMqWdsM2qKMp2Rkxa3wEOo+EQ2/Xh/EeKChe1BdV?=
 =?us-ascii?Q?xjegO2BKsemdOmcaFJhrQGMTNVhVMFEvSBDapIe46gg8J/RVrYvlYb8LvZ1g?=
 =?us-ascii?Q?lFzmBk1P9CCTyzpvHL6RO4m2xpkrnFmwMYYffxFBTrqXWBM91E7HIhTHvn30?=
 =?us-ascii?Q?vVpA2vAZxKZpeHmm9ZPdatyK66vJcevLLnyyv2oIYV9z8Eg2pWx2Tfalu1R+?=
 =?us-ascii?Q?bzajyzIGQD8dHAGA+fJSZdrZ5IVM4O2YHLwY1Nm0+bSxd/7/IKjhJcYkfio8?=
 =?us-ascii?Q?2qZ5H8t6uMWb7/+ukbuJCYIEA/i1Ve57pJIC5I4JDjDrB+9XghAfz7OG9wil?=
 =?us-ascii?Q?puB7wl92gyRWwbBGo7E4MQT30g/oUQyg3851iHBgJrsxD2nu7if/QoUOAgwV?=
 =?us-ascii?Q?tX189+P++ZXUudXYaGpE2FvxS1rKdQpRPha9IvGyBzD7B8/oaCpfvznzd9i3?=
 =?us-ascii?Q?e04bQnjz7l/rdVY6zDp1uVaYHngXqaGVbmlBL35RXbqdKKcgcv673r7/Pchc?=
 =?us-ascii?Q?LckgArHr1HNkdA+y5wPa0wUYkLvsoCZlXR29HpxSZklduJhTEBzkqbJAEC/H?=
 =?us-ascii?Q?O19ZW/JjQSIDW+0GTaTnGx00NzHvA909hmPDLcghChqSSlr+FmYsC2/7DeIx?=
 =?us-ascii?Q?r1ykAdfajeuKesNYB6ep+pGDmgGtTsQJ9ZZNcMYHU6MT0a2pCvmZURV1J1A2?=
 =?us-ascii?Q?Yg/riDn0T+gFOB+LMKx8qR2KUeTHj1mxzYT8y3wdnV7+4BRZ0nvw1UzsZoih?=
 =?us-ascii?Q?pPPeiAJile/uGQByg90SwamkjEfMVspvZ5HuuyPz9z9j28OTxmW4J4no7D4B?=
 =?us-ascii?Q?Q89tUagPAXXd8C5UABpj9M4Vmpo0EfRTjQyS9vLaoqgnEsJvawYfw37B9ODx?=
 =?us-ascii?Q?9tzVsViL+IerZ1kZM+u3QQ/ANFtGPMqoLpB4TTc7dyN34QRAofxRNw3Fa3fU?=
 =?us-ascii?Q?3xcSyMXcUqJghm0/LhJuphrP3gfz24LthTV7550ng5TPhQBMzwqht3V4/h0y?=
 =?us-ascii?Q?wkWtV6iWaDnyNwpMEMmc01uzx0Zby4N/byu4mucBYMat0uRSbSzTsnW/KDyy?=
 =?us-ascii?Q?iNt/VlF7btYoL2T4FPMf4scBCwp8TkKvRcLK+huzIexE/Yo2Hw0uwyIB88LL?=
 =?us-ascii?Q?fj9QGxm99wwKKSldv2bTkuAVZ7EGm88Bva7Xuxswn6czGhQY6vlp/ILHwNx0?=
 =?us-ascii?Q?dtufJlyUnMR0WEUnJL++7tFrDHDOYYlbR4rkQA6KiNnqEed1hIRBDVSmJ7j5?=
 =?us-ascii?Q?7CJIa09o3UJKi0mVugPheQa+Ms4jpuyJStbzx6YC0m6ZFg0+LCFQ4+ojgPEL?=
 =?us-ascii?Q?2FtGW1viCV8aKB/mDT29f7/xKJTOGgAmiu2Yxwfz5Z/PYi5ZYHjED+QXVizw?=
 =?us-ascii?Q?eQsNsPKKBAS7lGUeGYuludlJr0hNzRmfvr9/luf6OpKwclYPJ6BhzIIGdzD1?=
 =?us-ascii?Q?8hhH6il8iycavih8w54fHtZ9+whHRXtr+ekHjNiFZqAIUBLa9mGSHYbFHj9A?=
 =?us-ascii?Q?/XAnOW3FQoDShsYJCpdJ0aTAF6cYaRi8zBBgqltq5Ab5wuZRm9eiuCko4143?=
 =?us-ascii?Q?zBMNFAPWhH3VN6b+GKlJUylANr5BYBkh3uin3lkP2q9YLu8sO2z8H5n7vwXh?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f274aab3-7d66-42ea-b044-08db57f02a93
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 22:35:22.3925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Ax+fRrBrMeZrD4JWRKNq+a8HtXIkFhpDi6n560mztobGXLKE+TXu94XwGADlo7NrdQxK154OC2ssFdzAak9ciCpX6yXhtgxsW/jTAM27sA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8375
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 09/11] drm/xe: Convert Xe HW Engine print
 to snapshot capture and print.
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

On Tue, May 16, 2023 at 10:54:14AM -0400, Rodrigo Vivi wrote:
> The goal is to allow for a snapshot capture to be taken at the time
> of the crash, while the print out can happen at a later time through
> the exposed devcoredump virtual device.

Since the first patch of the series specifically called out stuff like
INSTDONE should there be another patch somewhere that adds additional
useful registers for each engine type?  It looks like we're only dumping
the general engineclass-agnostic registers at the moment.


Matt

> 
> v2: Addressing these Matthew comments:
>     - Handle memory allocation failures.
>     - Do not use GFP_ATOMIC on cases like debugfs prints.
>     - placement of @reg doc.
>     - identation issues.
> v3: checkpatch
> v4: Rebase and get back to GFP_ATOMIC only.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c      |   2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c      |   2 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c       | 209 +++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_hw_engine.h       |   8 +-
>  drivers/gpu/drm/xe/xe_hw_engine_types.h |  78 +++++++++
>  5 files changed, 240 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index c45486c2015a..8bf441e850a0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -42,7 +42,7 @@ static int hw_engines(struct seq_file *m, void *data)
>  	}
>  
>  	for_each_hw_engine(hwe, gt, id)
> -		xe_hw_engine_print_state(hwe, &p);
> +		xe_hw_engine_print(hwe, &p);
>  
>  	xe_device_mem_access_put(xe);
>  	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index cc8191dfdf89..b209e4c2a3a9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -751,7 +751,7 @@ static void simple_error_capture(struct xe_engine *e)
>  			if (hwe->class != e->hwe->class ||
>  			    !(BIT(hwe->logical_instance) & adj_logical_mask))
>  				continue;
> -			xe_hw_engine_print_state(hwe, &p);
> +			xe_hw_engine_print(hwe, &p);
>  		}
>  		xe_analyze_vm(&p, e->vm, e->gt->info.id);
>  		xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 751f6c3bba17..71ac4defb947 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -574,77 +574,174 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
>  		xe_hw_fence_irq_run(hwe->fence_irq);
>  }
>  
> -void xe_hw_engine_print_state(struct xe_hw_engine *hwe, struct drm_printer *p)
> +/**
> + * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
> + * @hwe: Xe HW Engine.
> + *
> + * This can be printed out in a later stage like during dev_coredump
> + * analysis.
> + *
> + * Returns: a Xe HW Engine snapshot object that must be freed by the
> + * caller, using `xe_hw_engine_snapshot_free`.
> + */
> +struct xe_hw_engine_snapshot *
> +xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  {
> +	struct xe_hw_engine_snapshot *snapshot;
> +	int len;
> +
>  	if (!xe_hw_engine_is_valid(hwe))
> +		return NULL;
> +
> +	snapshot = kzalloc(sizeof(*snapshot), GFP_ATOMIC);
> +
> +	if (!snapshot)
> +		return NULL;
> +
> +	len = strlen(hwe->name) + 1;
> +	snapshot->name = kzalloc(len, GFP_ATOMIC);
> +	if (snapshot->name)
> +		strscpy(snapshot->name, hwe->name, len);
> +
> +	snapshot->class = hwe->class;
> +	snapshot->logical_instance = hwe->logical_instance;
> +	snapshot->forcewake.domain = hwe->domain;
> +	snapshot->forcewake.ref = xe_force_wake_ref(gt_to_fw(hwe->gt),
> +						    hwe->domain);
> +	snapshot->mmio_base = hwe->mmio_base;
> +
> +	snapshot->reg.ring_hwstam = hw_engine_mmio_read32(hwe, RING_HWSTAM(0));
> +	snapshot->reg.ring_hws_pga = hw_engine_mmio_read32(hwe,
> +							   RING_HWS_PGA(0));
> +	snapshot->reg.ring_execlist_status_lo =
> +		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0));
> +	snapshot->reg.ring_execlist_status_hi =
> +		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0));
> +	snapshot->reg.ring_execlist_sq_contents_lo =
> +		hw_engine_mmio_read32(hwe,
> +				      RING_EXECLIST_SQ_CONTENTS_LO(0));
> +	snapshot->reg.ring_execlist_sq_contents_hi =
> +		hw_engine_mmio_read32(hwe,
> +				      RING_EXECLIST_SQ_CONTENTS_HI(0));
> +	snapshot->reg.ring_execlist_control =
> +		hw_engine_mmio_read32(hwe, RING_EXECLIST_CONTROL(0));
> +	snapshot->reg.ring_start = hw_engine_mmio_read32(hwe, RING_START(0));
> +	snapshot->reg.ring_head =
> +		hw_engine_mmio_read32(hwe, RING_HEAD(0)) & HEAD_ADDR;
> +	snapshot->reg.ring_tail =
> +		hw_engine_mmio_read32(hwe, RING_TAIL(0)) & TAIL_ADDR;
> +	snapshot->reg.ring_ctl = hw_engine_mmio_read32(hwe, RING_CTL(0));
> +	snapshot->reg.ring_mi_mode =
> +		hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
> +	snapshot->reg.ring_mode = hw_engine_mmio_read32(hwe, RING_MODE(0));
> +	snapshot->reg.ring_imr = hw_engine_mmio_read32(hwe, RING_IMR(0));
> +	snapshot->reg.ring_esr = hw_engine_mmio_read32(hwe, RING_ESR(0));
> +	snapshot->reg.ring_emr = hw_engine_mmio_read32(hwe, RING_EMR(0));
> +	snapshot->reg.ring_eir = hw_engine_mmio_read32(hwe, RING_EIR(0));
> +	snapshot->reg.ring_acthd_udw =
> +		hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0));
> +	snapshot->reg.ring_acthd = hw_engine_mmio_read32(hwe, RING_ACTHD(0));
> +	snapshot->reg.ring_bbaddr_udw =
> +		hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0));
> +	snapshot->reg.ring_bbaddr = hw_engine_mmio_read32(hwe, RING_BBADDR(0));
> +	snapshot->reg.ring_dma_fadd_udw =
> +		hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0));
> +	snapshot->reg.ring_dma_fadd =
> +		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
> +	snapshot->reg.ipeir = hw_engine_mmio_read32(hwe, IPEIR(0));
> +	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, IPEHR(0));
> +
> +	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
> +		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
> +
> +	return snapshot;
> +}
> +
> +/**
> + * xe_hw_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
> + * @snapshot: Xe HW Engine snapshot object.
> + * @p: drm_printer where it will be printed out.
> + *
> + * This function prints out a given Xe HW Engine snapshot object.
> + */
> +void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
> +				 struct drm_printer *p)
> +{
> +	if (!snapshot)
>  		return;
>  
> -	drm_printf(p, "%s (physical), logical instance=%d\n", hwe->name,
> -		   hwe->logical_instance);
> +	drm_printf(p, "%s (physical), logical instance=%d\n",
> +		   snapshot->name ? snapshot->name : "",
> +		   snapshot->logical_instance);
>  	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
> -		   hwe->domain,
> -		   xe_force_wake_ref(gt_to_fw(hwe->gt), hwe->domain));
> -	drm_printf(p, "\tMMIO base: 0x%08x\n", hwe->mmio_base);
> -
> -	drm_printf(p, "\tHWSTAM: 0x%08x\n",
> -		   hw_engine_mmio_read32(hwe, RING_HWSTAM(0)));
> -	drm_printf(p, "\tRING_HWS_PGA: 0x%08x\n",
> -		   hw_engine_mmio_read32(hwe, RING_HWS_PGA(0)));
> -
> +		   snapshot->forcewake.domain, snapshot->forcewake.ref);
> +	drm_printf(p, "\tHWSTAM: 0x%08x\n", snapshot->reg.ring_hwstam);
> +	drm_printf(p, "\tRING_HWS_PGA: 0x%08x\n", snapshot->reg.ring_hws_pga);
>  	drm_printf(p, "\tRING_EXECLIST_STATUS_LO: 0x%08x\n",
> -		   hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0)));
> +		   snapshot->reg.ring_execlist_status_lo);
>  	drm_printf(p, "\tRING_EXECLIST_STATUS_HI: 0x%08x\n",
> -		   hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0)));
> +		   snapshot->reg.ring_execlist_status_hi);
>  	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_LO: 0x%08x\n",
> -		   hw_engine_mmio_read32(hwe,
> -					 RING_EXECLIST_SQ_CONTENTS_LO(0)));
> +		   snapshot->reg.ring_execlist_sq_contents_lo);
>  	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_HI: 0x%08x\n",
> -		   hw_engine_mmio_read32(hwe,
> -					 RING_EXECLIST_SQ_CONTENTS_HI(0)));
> +		   snapshot->reg.ring_execlist_sq_contents_hi);
>  	drm_printf(p, "\tRING_EXECLIST_CONTROL: 0x%08x\n",
> -		   hw_engine_mmio_read32(hwe, RING_EXECLIST_CONTROL(0)));
> -
> -	drm_printf(p, "\tRING_START: 0x%08x\n",
> -		   hw_engine_mmio_read32(hwe, RING_START(0)));
> -	drm_printf(p, "\tRING_HEAD:  0x%08x\n",
> -		   hw_engine_mmio_read32(hwe, RING_HEAD(0)) & HEAD_ADDR);
> -	drm_printf(p, "\tRING_TAIL:  0x%08x\n",
> -		   hw_engine_mmio_read32(hwe, RING_TAIL(0)) & TAIL_ADDR);
> -	drm_printf(p, "\tRING_CTL: 0x%08x\n",
> -		   hw_engine_mmio_read32(hwe, RING_CTL(0)));
> +		   snapshot->reg.ring_execlist_control);
> +	drm_printf(p, "\tRING_START: 0x%08x\n", snapshot->reg.ring_start);
> +	drm_printf(p, "\tRING_HEAD:  0x%08x\n", snapshot->reg.ring_head);
> +	drm_printf(p, "\tRING_TAIL:  0x%08x\n", snapshot->reg.ring_tail);
> +	drm_printf(p, "\tRING_CTL: 0x%08x\n", snapshot->reg.ring_ctl);
> +	drm_printf(p, "\tRING_MODE: 0x%08x\n", snapshot->reg.ring_mi_mode);
>  	drm_printf(p, "\tRING_MODE: 0x%08x\n",
> -		   hw_engine_mmio_read32(hwe, RING_MI_MODE(0)));
> -	drm_printf(p, "\tRING_MODE_GEN7: 0x%08x\n",
> -		   hw_engine_mmio_read32(hwe, RING_MODE(0)));
> -
> -	drm_printf(p, "\tRING_IMR:   0x%08x\n",
> -		   hw_engine_mmio_read32(hwe, RING_IMR(0)));
> -	drm_printf(p, "\tRING_ESR:   0x%08x\n",
> -		   hw_engine_mmio_read32(hwe, RING_ESR(0)));
> -	drm_printf(p, "\tRING_EMR:   0x%08x\n",
> -		   hw_engine_mmio_read32(hwe, RING_EMR(0)));
> -	drm_printf(p, "\tRING_EIR:   0x%08x\n",
> -		   hw_engine_mmio_read32(hwe, RING_EIR(0)));
> -
> -	drm_printf(p, "\tACTHD:  0x%08x_%08x\n",
> -		   hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0)),
> -		   hw_engine_mmio_read32(hwe, RING_ACTHD(0)));
> -	drm_printf(p, "\tBBADDR: 0x%08x_%08x\n",
> -		   hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0)),
> -		   hw_engine_mmio_read32(hwe, RING_BBADDR(0)));
> +		   snapshot->reg.ring_mode);
> +	drm_printf(p, "\tRING_IMR:   0x%08x\n", snapshot->reg.ring_imr);
> +	drm_printf(p, "\tRING_ESR:   0x%08x\n", snapshot->reg.ring_esr);
> +	drm_printf(p, "\tRING_EMR:   0x%08x\n", snapshot->reg.ring_emr);
> +	drm_printf(p, "\tRING_EIR:   0x%08x\n", snapshot->reg.ring_eir);
> +	drm_printf(p, "\tACTHD:  0x%08x_%08x\n", snapshot->reg.ring_acthd_udw,
> +		   snapshot->reg.ring_acthd);
> +	drm_printf(p, "\tBBADDR: 0x%08x_%08x\n", snapshot->reg.ring_bbaddr_udw,
> +		   snapshot->reg.ring_bbaddr);
>  	drm_printf(p, "\tDMA_FADDR: 0x%08x_%08x\n",
> -		   hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0)),
> -		   hw_engine_mmio_read32(hwe, RING_DMA_FADD(0)));
> +		   snapshot->reg.ring_dma_fadd_udw,
> +		   snapshot->reg.ring_dma_fadd);
> +	drm_printf(p, "\tIPEIR: 0x%08x\n", snapshot->reg.ipeir);
> +	drm_printf(p, "\tIPEHR: 0x%08x\n\n", snapshot->reg.ipehr);
> +	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
> +		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
> +			   snapshot->reg.rcu_mode);
> +}
>  
> -	drm_printf(p, "\tIPEIR: 0x%08x\n",
> -		   hw_engine_mmio_read32(hwe, IPEIR(0)));
> -	drm_printf(p, "\tIPEHR: 0x%08x\n\n",
> -		   hw_engine_mmio_read32(hwe, IPEHR(0)));
> +/**
> + * xe_hw_engine_snapshot_free - Free all allocated objects for a given snapshot.
> + * @snapshot: Xe HW Engine snapshot object.
> + *
> + * This function free all the memory that needed to be allocated at capture
> + * time.
> + */
> +void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot)
> +{
> +	if (!snapshot)
> +		return;
>  
> -	if (hwe->class == XE_ENGINE_CLASS_COMPUTE)
> -		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
> -			   xe_mmio_read32(hwe->gt, RCU_MODE));
> +	kfree(snapshot->name);
> +	kfree(snapshot);
> +}
> +
> +/**
> + * xe_hw_engine_print - Xe HW Engine Print.
> + * @hwe: Hardware Engine.
> + * @p: drm_printer.
> + *
> + * This function quickly capture a snapshot and immediately print it out.
> + */
> +void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p)
> +{
> +	struct xe_hw_engine_snapshot *snapshot;
>  
> +	snapshot = xe_hw_engine_snapshot_capture(hwe);
> +	xe_hw_engine_snapshot_print(snapshot, p);
> +	xe_hw_engine_snapshot_free(snapshot);
>  }
>  
>  u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 013efcd6d8c5..7eca9d53c7b1 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -14,9 +14,15 @@ int xe_hw_engines_init_early(struct xe_gt *gt);
>  int xe_hw_engines_init(struct xe_gt *gt);
>  void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
>  void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe);
> -void xe_hw_engine_print_state(struct xe_hw_engine *hwe, struct drm_printer *p);
>  u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
>  				enum xe_engine_class engine_class);
> +
> +struct xe_hw_engine_snapshot *
> +xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe);
> +void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot);
> +void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
> +				 struct drm_printer *p);
> +void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p);
>  void xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe);
>  
>  bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index 2c40384957da..d788e67312b9 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -109,4 +109,82 @@ struct xe_hw_engine {
>  	enum xe_hw_engine_id engine_id;
>  };
>  
> +/**
> + * struct xe_hw_engine_snapshot - Hardware engine snapshot
> + *
> + * Contains the snapshot of useful hardware engine info and registers.
> + */
> +struct xe_hw_engine_snapshot {
> +	/** @name: name of the hw engine */
> +	char *name;
> +	/** @class: class of this hw engine */
> +	enum xe_engine_class class;
> +	/** @logical_instance: logical instance of this hw engine */
> +	u16 logical_instance;
> +	/** @forcewake: Force Wake information snapshot */
> +	struct {
> +		/** @domain: force wake domain of this hw engine */
> +		enum xe_force_wake_domains domain;
> +		/** @ref: Forcewake ref for the above domain */
> +		int ref;
> +	} forcewake;
> +	/** @mmio_base: MMIO base address of this hw engine*/
> +	u32 mmio_base;
> +	/** @reg: Useful MMIO register snapshot */
> +	struct {
> +		/** @ring_hwstam: RING_HWSTAM */
> +		u32 ring_hwstam;
> +		/** @ring_hws_pga: RING_HWS_PGA */
> +		u32 ring_hws_pga;
> +		/** @ring_execlist_status_lo: RING_EXECLIST_STATUS_LO */
> +		u32 ring_execlist_status_lo;
> +		/** @ring_execlist_status_hi: RING_EXECLIST_STATUS_HI */
> +		u32 ring_execlist_status_hi;
> +		/** @ring_execlist_sq_contents_lo: RING_EXECLIST_SQ_CONTENTS */
> +		u32 ring_execlist_sq_contents_lo;
> +		/** @ring_execlist_sq_contents_hi: RING_EXECLIST_SQ_CONTENTS + 4 */
> +		u32 ring_execlist_sq_contents_hi;
> +		/** @ring_execlist_control: RING_EXECLIST_CONTROL */
> +		u32 ring_execlist_control;
> +		/** @ring_start: RING_START */
> +		u32 ring_start;
> +		/** @ring_head: RING_HEAD */
> +		u32 ring_head;
> +		/** @ring_tail: RING_TAIL */
> +		u32 ring_tail;
> +		/** @ring_ctl: RING_CTL */
> +		u32 ring_ctl;
> +		/** @ring_mi_mode: RING_MI_MODE */
> +		u32 ring_mi_mode;
> +		/** @ring_mode: RING_MODE */
> +		u32 ring_mode;
> +		/** @ring_imr: RING_IMR */
> +		u32 ring_imr;
> +		/** @ring_esr: RING_ESR */
> +		u32 ring_esr;
> +		/** @ring_emr: RING_EMR */
> +		u32 ring_emr;
> +		/** @ring_eir: RING_EIR */
> +		u32 ring_eir;
> +		/** @ring_acthd_udw: RING_ACTHD_UDW */
> +		u32 ring_acthd_udw;
> +		/** @ring_acthd: RING_ACTHD */
> +		u32 ring_acthd;
> +		/** @ring_bbaddr_udw: RING_BBADDR_UDW */
> +		u32 ring_bbaddr_udw;
> +		/** @ring_bbaddr: RING_BBADDR */
> +		u32 ring_bbaddr;
> +		/** @ring_dma_fadd_udw: RING_DMA_FADD_UDW */
> +		u32 ring_dma_fadd_udw;
> +		/** @ring_dma_fadd: RING_DMA_FADD */
> +		u32 ring_dma_fadd;
> +		/** @ipeir: IPEIR */
> +		u32 ipeir;
> +		/** @ipehr: IPEHR */
> +		u32 ipehr;
> +		/** @rcu_mode: RCU_MODE */
> +		u32 rcu_mode;
> +	} reg;
> +};
> +
>  #endif
> -- 
> 2.39.2
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
