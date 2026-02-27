Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A52FEFB7F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 18:31:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE5610E126;
	Fri, 27 Feb 2026 18:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PeIMbljQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2390B10E126
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 18:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772217112; x=1803753112;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZHfsXn5sBSOETXK7vxy2pL6h7JurQWcMcbAB0TgX8CU=;
 b=PeIMbljQwFXw27ELRGbquWLKd/sUWEEx3AuZQnc+n+J1dXhcI0GJ4z8q
 ONaFyS0IrWBFRIfAyK2OMdCubX0w43GaVx1w6E4MpNXdGNCv+4hlvHg2v
 FTB1X2ITfa1e4VkDZ3bwWDraDqOyu1tPYXs0h0lakDM84JO8U8n+rEsBM
 q0gt9klmUYvV7hquwYMk16d7i14mLo9Bvk5RbkA5ykNYvqxs2MR4w/rGT
 oow6wKsaqV5g/j3Vm5AA6JeVUpJETUGGiKan5bNN2KoAQrQz0c7AM6kuB
 HjB1AdLhjFgCgbkb0Sk09RYl1zIdn15Z0HZHd/YAPByL4LOysLELIxUwj Q==;
X-CSE-ConnectionGUID: erHpAm3dTkGd3m5d2HX09w==
X-CSE-MsgGUID: Mr18BNViS5C9/U+QQ/ZIaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="98774455"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="98774455"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 10:31:47 -0800
X-CSE-ConnectionGUID: 0e1RnzFkTOCNZnuI1mskrw==
X-CSE-MsgGUID: +ip29vl6SvW163Fc3QOkHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="217001123"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 10:31:47 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 10:31:46 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 10:31:46 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.0) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 10:31:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pT0uYJmmi1tKwpJ36CKl3wokpspn21CiIPgkMEV/SVztOjsKAKtngo1A83dwr2IrcVBRy5yVium49QD8K/zbxwyIt/j11opn9HwAqWa/0M8+d4mJdJk6FVwR4y4QkGZyx4t8yKP9PPlZNKGVCejfHLH4rNPuQ2KsYUYonPB7QIIGn0Ag7yRroXJL8mfLi4H4okLzTZG9Vo4QG49jE0LllwF1ARnDcV+VToi3nn/nE8zTnuK4H+jrBYQ3LZ/Uw3v4gZfZEI3w0IuO3RRIZKvtOUHWcb+cbnhK9G+EdeY1jPcEMnppx1UmpMFOs5nikBeNXD1SBGrlzolEtptRDrUmhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qC8BHsOTBqxt6cbsJ2CCq6FXASC6BKX3dkrwxU+sng=;
 b=thdkwG/XtH/wOc/WAsdgnifk36RKgi8n0oluQm7OrWx7KoRvvb0DeG/Fcp+n6td5y0q6J2Rq96Wf5UMsTSGZZyvUhdVlqnP3eYWcrWInBN9d+OIf7+f2IbeUgAwdvoCAYWDPu1A1GSqZwYjXg76NiWPkcWnFA1cmYyU322xdGqHvRn8D6AJhnJ8i27vutouzpuahHSTuUnphi+5SDWGSfxvr41XFdzPJlNo9CioxLFJfGwWIBpc9adaWYHheLXIR+nuRAlOI0L1BodQDoYAVvYrNYgpZJPg4FqWkSpBS1ZSVTCjUld20j3o+ilFQ2sFT+OKWj0m4iqEhC8rTnVR72w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6430.namprd11.prod.outlook.com (2603:10b6:8:b6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 18:31:43 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 18:31:42 +0000
Date: Fri, 27 Feb 2026 10:31:40 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Varun Gupta <varun.gupta@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>,
 <daniele.ceraolospurio@intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v2] drm/xe/guc: Skip access counter queue init for
 unsupported platforms
Message-ID: <20260227183140.GF4694@mdroper-desk1.amr.corp.intel.com>
References: <20260225164748.2302380-1-varun.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260225164748.2302380-1-varun.gupta@intel.com>
X-ClientProxiedBy: SJ0PR03CA0294.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6430:EE_
X-MS-Office365-Filtering-Correlation-Id: 776e8453-26fd-4f80-8cf6-08de762e746f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: tiOKVF1i2oqguFhwX/vvvBz57YqTqyTlBmQspaYPvdljTmJDopHfJTTtwH/Bci97wwTg6zjSOaNjf1YNmmeCecWP4NiFUhsWtEI/1PeS6ipYPIAf1L3z5to3lF/XqOE32HSdrF457YuRTFr7635vb45+Lop5iBrxvCoy/xqAIyM57OKpMN3BnZwLl0BO7H7LdwI9t03n7UOqleC7usJMwpxFAmvHGWef2ovxvfEMRMadLRP/s0MSdrwotC+YnwJBY9sEKJNpErss9rjuyKcAOOwQKZFwqyue8uWpQcj7ZYfZ/B4tOCcAjuxdEvyYhshJ1ciFIdcL+euibTzFqNRNIaP26YNymO+hlMcygtomWIh1ePjmyaJ85vCkEuujX2Zji4m9civCthR+bMuvSsoeVx05aBCOMQUlk5cAdPnWtHHvli9ehm1whqL1385OGCgmIEqvoww5bQiQSeQg17vVH/5WT5n8Y2LUdBbgW16bbXFYc0tjOLhXGUEIFokrzaNUSpi5ZkpcLLY/ugeUi0OsGWhGPnLOCLn548kAcgFLhe50TAamR22MK3TxoDG+cd5rMriEL6W1L7XYnxnS4rNF7VFR6skDouqnySNx52mta8qxVWmGol6dDwVkCyiUK66veuEBaIZn/O36yDAJz7mDEirQEDow+HtUbgX1UkfSfvP92EclrVPDTvK2QI9lQEkF70vefeTM6nMpXCViKbhqcxQikXmk83Efs4DgRL2FK0Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NUF+i0vwwFfcokZTOMNXHHY6TAPz4I7Mi7p/XnmUxNzh86tWhGG6BuLCgkRO?=
 =?us-ascii?Q?w9RSPPmBlztbnFUy4AWbIt2lNOzeIJRpitiQ7GmCEaJ3WmdZL5r9ob3CtKgr?=
 =?us-ascii?Q?3/xpZgvQ+VLr0HujWdmE0PHtvj8dtkUS5ET6BYUlUeYq6RvVlexpWtNaz/He?=
 =?us-ascii?Q?myiPl4j3lV4I3ZJVXwjflIDNkpZyBQt2Ob2wtSVk2tviJmge//NFd5rvGzjI?=
 =?us-ascii?Q?U8JRvInqq2IfbP8oAvsLQdRGPnVNUg2VA0TTIxkWkB1wJbqcF4RyFCL2IzX4?=
 =?us-ascii?Q?ZjD4SW6B2aNtRyN6il9V5fg1bZEd+z1vrolV1ospiT/oSrMrcE7K5TliNOQQ?=
 =?us-ascii?Q?dHyrMut4aIfOqOdWPtkgxPOdrkf1cjpz7xKTRu3D5dv2Hczn1FF5gft0HNfL?=
 =?us-ascii?Q?JURNCs5Nnlqu2f4HQMFzwlja2MQ1bhU6iO5h1Mrx5CLASBjryVdHheBjK1ie?=
 =?us-ascii?Q?XR017ZKluZ7dlWIMl9qn/tLqgL44KB7fWjehfQP6LOhZ9w/DzBz3bc+Apsjg?=
 =?us-ascii?Q?rAMsruU5T2cUJ8d3Hx2E971A8cOT9YgBpwsCNbl5oMX2d7o3LYDrIHxfKpaZ?=
 =?us-ascii?Q?1EJHUZ9CTpnsQAhSxvs9lJa29xQTOS8plQ4LKuTjj6tLyLpy66pTdHQ9iLBw?=
 =?us-ascii?Q?7auE0kQEpOe44bgQuRqCEwG5XeKTAYwmCZgVlxpz/DIk0KVEiZ3ElOmkEaP+?=
 =?us-ascii?Q?vwS63Fqe0BsO0adoliBfesu32RW60GQju+UeGJzk5GUKWcO+6mSqdA05QM2Z?=
 =?us-ascii?Q?//pbjHz4asmkiWgAxyYHzT42Sou1JEBdbLb/8Fw8WAePyutZ/QxV4yPcIdMK?=
 =?us-ascii?Q?Y75brz1rzJTT9iovyPBb5RxPEXGdn2CwgG3wANbH9DCAKrwxkeIAJP3MvcsN?=
 =?us-ascii?Q?FBoPzK0zncgL7uF51YmWTicdf4FgF4DB/zmSJ1NbDqv0w9M/7+BCLBAShBul?=
 =?us-ascii?Q?dH3h7LBbRcRgZuvGKt6Nk30pUlNK3XEXqbhFouLPfnUtZx9ePdTGkbiCX5qY?=
 =?us-ascii?Q?0fEF+b3K6/Fx0eatFPJAIdbdWMjfkMVu1uZ6JpYTQSrhrgcOp4y1AtdlfzkM?=
 =?us-ascii?Q?JBTcav8ctaR47dz1CF4qXibYFpAMzZdw4awL7DapsqVyaj0wTdngIKA1g5Qy?=
 =?us-ascii?Q?BEItCJ5Bcxi51WJZyajyzAhNSBAbRtIoXFpwqPjm4aRdkOmiXLCMztQdCS7S?=
 =?us-ascii?Q?4ir2x+8x1Mra0RkrJ4Pqpz0IPb0mqfcWeyt0tLLJKBSdS/3Mdk0VKg8VB5mF?=
 =?us-ascii?Q?2O/mq8IkHxpKLxEOhYVuKJaAAXJWFSV6usV6esXtaMaeK8h2EI+FOgnrSjN/?=
 =?us-ascii?Q?/KYvaBPgcYHOF1vuYdNeH1L/a/DoMGOK8F23N+eqdU2TeZrltmR8RgjvQWL4?=
 =?us-ascii?Q?vdkYSz+HhESFXpu7eQWcxmMbwpVTQknSABK+0VH6x+uCohPfAmmsxFUEOat5?=
 =?us-ascii?Q?F47WP2T3+g37Q+JUXJnU3gr5BOwepdtsWIMoM0JXW/AU0fuSSuOAZtzy5XKk?=
 =?us-ascii?Q?PwDeTNhLd9lzhm3UtILAAIHhSumg1UK0or3OQwbYP4/YjTwuePnAqnVTI6Cp?=
 =?us-ascii?Q?jSWy6bzUClFxr7xjNCAM9/0GOetS07hPCv2a4tYq81xu7VZ/cPivdd2D3FrS?=
 =?us-ascii?Q?WnGaGTzgudK1OvB5xSfQ44ZFQV1Zf7pNc0RZ0tAr9A2ClYth4z5LRlYehIlk?=
 =?us-ascii?Q?UXNU61kfMoe+yTExQjeDqeih63dk763IFRCDRzj09vhWe8tgo9sZgJn3Vkym?=
 =?us-ascii?Q?9V+C5ef4It0YB9Xz6dJ/cT2E0R36ef8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 776e8453-26fd-4f80-8cf6-08de762e746f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 18:31:42.8927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: buq1wrc71jIJT1/2O4qKZadMzGlz6ZfnosU80KDeqd1YabWu8fJnzXLupv7tihnn51Rqnx7BKpAaf4iAv5ISvnM/gDBJoM+eTfj542IDhaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6430
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

On Wed, Feb 25, 2026 at 10:17:48PM +0530, Varun Gupta wrote:
> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> 
> Add a has_access_counter feature flag to the graphics IP descriptor
> and skip writing parameters for the access counter queue in
> guc_um_init_params(), leaving queue_params[2] zero-initialized
> to signal unavailability to the GuC.
> 
> The queue_params[] array layout is fixed by firmware ABI, so we
> maintain the structure with queues 0 and 1 (page fault request/response)
> always configured, and queue 2 conditionally skipped based on the
> has_access_counter flag.
> 
> Bspec: 59323
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Varun Gupta <varun.gupta1@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
> v2:
>  - Replace platform check with has_access_counter feature flag in
>    graphics IP descriptor (Matt Roper)
>  - Add Bspec trailer (Matt Roper)
>  - Make commit message generic instead of CRI-specific
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_guc_ads.c      | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_pci.c          |  4 ++++
>  drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
>  4 files changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 8f3ef836541e..78ecfd7414e8 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -151,6 +151,8 @@ struct xe_device {
>  
>  		/** @info.force_execlist: Forced execlist submission */
>  		u8 force_execlist:1;
> +		/** @info.has_access_counter: Device supports access counter */
> +		u8 has_access_counter:1;
>  		/** @info.has_asid: Has address space ID */
>  		u8 has_asid:1;
>  		/** @info.has_atomic_enable_pte_bit: Device has atomic enable PTE bit */
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index f4cbc030f4c8..81b5f01b1f65 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -819,6 +819,7 @@ static void guc_um_init_params(struct xe_guc_ads *ads)
>  {
>  	u32 um_queue_offset = guc_ads_um_queues_offset(ads);
>  	struct xe_guc *guc = ads_to_guc(ads);
> +	struct xe_device *xe = ads_to_xe(ads);
>  	u64 base_dpa;
>  	u32 base_ggtt;
>  	bool with_dpa;
> @@ -830,6 +831,16 @@ static void guc_um_init_params(struct xe_guc_ads *ads)
>  	base_dpa = xe_bo_main_addr(ads->bo, PAGE_SIZE) + um_queue_offset;
>  
>  	for (i = 0; i < GUC_UM_HW_QUEUE_MAX; ++i) {
> +		/*
> +		 * Some platforms support USM but not access counters.
> +		 * Skip ACCESS_COUNTER queue initialization for such
> +		 * platforms, leaving queue_params[2] zero-initialized
> +		 * to signal unavailability to the GuC.
> +		 */
> +		if (i == GUC_UM_HW_QUEUE_ACCESS_COUNTER &&
> +		    !xe->info.has_access_counter)
> +			continue;
> +
>  		ads_blob_write(ads, um_init_params.queue_params[i].base_dpa,
>  			       with_dpa ? (base_dpa + (i * GUC_UM_QUEUE_SIZE)) : 0);
>  		ads_blob_write(ads, um_init_params.queue_params[i].base_ggtt_address,
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 56a768f2cfca..3a16d89fc044 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -81,6 +81,7 @@ static const struct xe_graphics_desc graphics_xehpc = {
>  
>  	XE_HP_FEATURES,
>  
> +	.has_access_counter = 1,
>  	.has_asid = 1,
>  	.has_atomic_enable_pte_bit = 1,
>  	.has_usm = 1,
> @@ -98,6 +99,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
>  };
>  
>  #define XE2_GFX_FEATURES \
> +	.has_access_counter = 1, \
>  	.has_asid = 1, \
>  	.has_atomic_enable_pte_bit = 1, \
>  	.has_range_tlb_inval = 1, \
> @@ -123,6 +125,7 @@ static const struct xe_graphics_desc graphics_xe3p_lpg = {
>  
>  static const struct xe_graphics_desc graphics_xe3p_xpc = {
>  	XE2_GFX_FEATURES,
> +	.has_access_counter = 0,
>  	.has_indirect_ring_state = 1,
>  	.hw_engine_mask =
>  		GENMASK(XE_HW_ENGINE_BCS8, XE_HW_ENGINE_BCS1) |
> @@ -923,6 +926,7 @@ static int xe_info_init(struct xe_device *xe,
>  		media_desc = NULL;
>  	}
>  
> +	xe->info.has_access_counter = graphics_desc->has_access_counter;
>  	xe->info.has_asid = graphics_desc->has_asid;
>  	xe->info.has_atomic_enable_pte_bit = graphics_desc->has_atomic_enable_pte_bit;
>  	if (xe->info.platform != XE_PVC)
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 470d31a1f0d6..658cb30de50d 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -69,6 +69,7 @@ struct xe_graphics_desc {
>  	u8 num_geometry_xecore_fuse_regs;
>  	u8 num_compute_xecore_fuse_regs;
>  
> +	u8 has_access_counter:1;
>  	u8 has_asid:1;
>  	u8 has_atomic_enable_pte_bit:1;
>  	u8 has_indirect_ring_state:1;
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
