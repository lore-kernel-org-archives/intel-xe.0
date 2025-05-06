Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC557C3ABBE
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 02:01:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9037110E0C0;
	Tue,  6 May 2025 02:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xr0ACuLi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2916D10E0C0
 for <intel-xe@lists.freedesktop.org>; Tue,  6 May 2025 02:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746496904; x=1778032904;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Q+skzfZgRyBTUF/4SOcRkKoL/oHN1TU7frabd1GdP7A=;
 b=Xr0ACuLi/VPkuB4v1/HwFDCfH5fYxtbQ/qcHG7DesUyRloGZSrHX2KkB
 ISqmTVdXWBqgx+I7jshjOZGp13nUJJlhLQooHY2AsPwnn2atXfVzwh4gr
 KA5lP0WtElpN5vhqJoaKalCwfBSHxoXm2Xy07kvHxN+no+a1aM0MdkTYQ
 4gyMc4EEsttTHIimX2ByYXzi8pVnJjbnERhK4nUV3XJgfhd4RbaBXVyhn
 +8egvqCjQT08yJYHgw71hT+1zEnRo3s0xAwLhtc+QMksfKzzC36nmPfjj
 GeddsthxPZXVPuZA8gsfWMp8Sx981XfFeNbWjvrFSS/nhf1fVxqDw86XX Q==;
X-CSE-ConnectionGUID: doe51IpHRwuhahVoOkvHMw==
X-CSE-MsgGUID: HkHowa9ASH2Bu127ymV52w==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48039210"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; d="scan'208";a="48039210"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 19:01:41 -0700
X-CSE-ConnectionGUID: uFdpTfDJSsWhRMpE41DVOA==
X-CSE-MsgGUID: GW7OnabaTcKZG90pjyuYzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; d="scan'208";a="135359915"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 19:01:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 5 May 2025 19:01:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 5 May 2025 19:01:40 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 5 May 2025 19:01:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmP1eUn/NqGI80xt4ddpD1kMrzKddzLaRpHEUieGBsia+zzImYRrGTJxqWjsJzogLJrSJY4p7coXIDyR9UlwcEL6ZfLdhdJdpxbI+ntx4KPfg573JLhIhcJ/XZ8SAfwWVmhpmPEtOKdv5xQ3+1GcWhI03vzc+7ARwLsIj/JjT7/V/GC6jcwuLlYBk2J2uvotgpl3tOcvsSk+5Q5Lg042e8QNCfbVNkpsz9JToz3y1QkhpvmsbtixDdca6MfyGe5RKAk38coh/kTKhvI0nVDNGtxS8ahs+TW9NFb1gr8LYuGaS3JO8ROqM8cKiXE4k9hJnA2ihVrmMagofsVJc4+GPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SZRLjQmPm8gz2opFHjm/gKotrqhVz/RPXPMuivAW4k=;
 b=KTEV1Kfb08Wgpw4pNC5hU9Wxblc6GGCHmABIB1ZJuEsF8Zanl2tACurP82p0RG/NAFkwKab9OVqHn+q9qnFTc1lS4i9fvXQkYte0VCsWTC2w8ZoK9ikFMKRP4t+eWMSFiRIEnMNlLL9GReJIiHxWfTb7XJSA1Ia451u7BOplIJbMm+d2ecEj8KwQqq1tlS5nhA2R/JD4j+YhJ8rorZE38Z8WYB9A6EYXWxIYqciTM11UVJlaCK7pr1v7miyAYr/Si2lroFcG9peuea+R5iPoliFh8Nnx41Ht69sHT1yNlRb7qEnkBmOMIldyL8qRzNg+KAEPp+h0H0DVaJAEvL4GnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6420.namprd11.prod.outlook.com (2603:10b6:208:3a8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 02:00:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 02:00:58 +0000
Date: Mon, 5 May 2025 19:02:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 3/4] drm/xe: Check 64-bit CTX timestamp for TDR when
 available
Message-ID: <aBltrzwMvirIJSn0@lstrano-desk.jf.intel.com>
References: <20250505225852.1994431-6-umesh.nerlige.ramappa@intel.com>
 <20250505225852.1994431-9-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250505225852.1994431-9-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0073.namprd05.prod.outlook.com
 (2603:10b6:a03:332::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6420:EE_
X-MS-Office365-Filtering-Correlation-Id: 047293cb-22b9-412c-06f1-08dd8c41d7f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TP93HXeH5qP57cdao3JSUIfsgbWJ4GejyHMo9zxkqStK8aWgU8aoywn7k/VF?=
 =?us-ascii?Q?ledoDU6UMovGJyuitbaZ0D4Q8J/D3lHggeGzRg7/+BVkHX33afqq3504RaHb?=
 =?us-ascii?Q?wC4oDxwgCXnuwT8ba4c9nMhGgyG9yDsOALCvj5dK7FctX6blVuDCN11j6m24?=
 =?us-ascii?Q?XC8hTMfbV5ECfIlHeGs+eE0cQ9+/jk9UwkMzKYwl/4+1asZoahTa6EKoFJ3H?=
 =?us-ascii?Q?YZqVsB77QDT92ZNyIwFuV4or0ANDXyUFCqBX4VzwTo2ZmvTo+RFvXOiDwOzu?=
 =?us-ascii?Q?uLiHunezVj0+/t0AIe+692sbCUXt5/d1HiLtnfpJiy5Ysu+GUAUdDh5fjqI3?=
 =?us-ascii?Q?RmvJYekDr6fCi9ojCCd16pllaZByFTaHDhRavguvvayzuH/+Zzg9h+fWoA3r?=
 =?us-ascii?Q?vyYhLTYzefKLwuh7euWYAv96NL2n1LnFXMj6grK1NXH+UTjLAgprFL8yV1kB?=
 =?us-ascii?Q?KnYtUc6AflcCJICdZV2FP3uU2QdYLvb40i+t5E7xNtOQcpV8wWl01/SDFLOg?=
 =?us-ascii?Q?u51pkAdcKel1l2Wk61FBSqI7jWs8o74swkmOncqjtYdmUDq+Zsyr7Q8FkLQA?=
 =?us-ascii?Q?pT1saq/iqYvKpLE6c8MC971N8uC5gHZqktyNQqIGBn+r1reV6QPtIE3Y25S5?=
 =?us-ascii?Q?44b0o4/AdyJ8aVumlkH/Yh/D+vB/T0E3ceoXvYVt2yc9FzV3bvcitPr5Lfnq?=
 =?us-ascii?Q?fBXcwzFdl1df6UaLhBvCnrGauFAfY/a5YF3X0K5PJqiY7naLmlBbD8XxMMbA?=
 =?us-ascii?Q?tnx/kKziNXk21tUYYGXrgUWc9BCAvOGb4QCUi7r5+gitXs92sIWFcxoT0/GB?=
 =?us-ascii?Q?FScstsG34dLoWH6PRVXU01pDJz29c3dUCFfEs5ttMkL+yZPcrmMpvIxBDmX5?=
 =?us-ascii?Q?vUfSEvSJly7X7g5PBYBJQVZtm0S6/U5f4AMzRNbYzaYauAxo3zMBoT4OIVhm?=
 =?us-ascii?Q?VHfyBuUQVxy6yrT61OWI7bOdX8D+rwBBXoum/3h9UWNC49dUz3/QQJxGeG+n?=
 =?us-ascii?Q?JpqGYxO1MQsgrB1mJBubg2j4rkVe9acJlRy1pIYZP0iS0bPQ75EjraC9sZQD?=
 =?us-ascii?Q?Z9W0qRtkZh5nZjEEoNmSaZhCVlZFzbZlEIuoKY2RqujiBvwgjDvAUuMcCZoI?=
 =?us-ascii?Q?ToRbrOv9hLtH0OuunOlFsTkkUAPvkMuFMK/0VbADGB2mEiLDHEWcVpQXmWxw?=
 =?us-ascii?Q?UMuU2pRxyHtUTYKp8FiLUoPHq3baJT0y7IkdJsQzsoVhMCAAXesck4qdLVsP?=
 =?us-ascii?Q?NVNZ5zUnw12H0Ons5Mr7GGS8hGgFvYchqfwsorKe2zftKsPAplupFPxp9zWH?=
 =?us-ascii?Q?5Y7qGhM5VJ8GAM4BIkQb/niGBZW/lVzIsIwWB1rLB4a/jUZrnXDUL4bUNdti?=
 =?us-ascii?Q?K86uUKSmoc6E3nBVI+iPnK8cwoBHO/Bd+3zl9cPY7xV7zZoCBrbbc6bddmMw?=
 =?us-ascii?Q?Y1QSjlefhpc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4mxYUh2xbJVcB2slsyD+NbuJJFBejpCq2+UmfxhjRcqWnspRF8CyBAFpRbBa?=
 =?us-ascii?Q?haIfX08Uh65ooe8NfWIJ1rKEg9bWDzFdQXGuXyBF1hZTApx8o6/6ofcx88Zt?=
 =?us-ascii?Q?0+u+vzb6E6Z26HCnPVd2/VZaZ26X6EYV9XjE0ZwfPuXYi+Z1sK2U+tqj/BAZ?=
 =?us-ascii?Q?0L3/9ukWwp2AAQSy8lene+PpmVa/cNJQn3+pDnDjblovnST5tsFyizdtJrQF?=
 =?us-ascii?Q?T0Qyy54epJRW3JcynfZzKgdfoP2GUxLkpwQcogLe0t61VjD1/hsgl8C3FTmT?=
 =?us-ascii?Q?JTGXgFpwcnmZ/SlIAAeEuVRMN30btKeyBtXU4PWNxCy8+mydbuWkvgHn5w2M?=
 =?us-ascii?Q?kvs2RiIrGPoXvM+nH44GufdhWpuqc5WwJ2t8CIoftp1YmgFFVCX66+ifhR+V?=
 =?us-ascii?Q?/0Edqd+gd41X1Tj09vfdXbhGapa6G5r7jMSs30kMzdRREbCXGJth+XY34Acj?=
 =?us-ascii?Q?rBoxASgCJhNX8pLLqHO/ETZ+054qxC4KGYWNJ5/tWr+UDXIjp16GqPmNJl/Y?=
 =?us-ascii?Q?vjXYxHZDN4jJblzYAmfe7HkrZBrb8tbg767RMGXB2O/Yo4KilrnyqrNq+IEE?=
 =?us-ascii?Q?MUB8kdNqm/xLwwaYJAommHZTfSHz3QBIXjyEDMy5DKi2csVSg9rXIxkQMPyn?=
 =?us-ascii?Q?fHfYCcmHHWLHW0yV6AYrShdqVzNvhJxvwlk0Mv+lXMBELh0KBuWMWstVlkD/?=
 =?us-ascii?Q?xii9CylgdvuVcpHtO6x0jzJHMPzKwtLdFEf8vwpxxlDKDkaJJR73CfUUo9r2?=
 =?us-ascii?Q?fXBti7mrpTb3+x9UUwys3Iq2y3bcUBDpgez3IQyKFBe2YHD6d6t7IPaV/b6N?=
 =?us-ascii?Q?8Q+pCOHYzEaaSErCV9zKcgGhAXCQDgGNrm7/j00vwyVwlbSNGwOmz0bTM3El?=
 =?us-ascii?Q?sOWFoH8flywsJRpCxoPhH50/lkpYqIbGBS5Vw+M85Pl/povWk15GolYsZDfP?=
 =?us-ascii?Q?IPSt13o2+xwcjkGCF5eU6jfTW+1snelY02i1FEmjHGs+Obgk9Zz7bK+MJh5A?=
 =?us-ascii?Q?zTFV8Sg5kGqKfDHa8WDSf6EaoC3uRop0reepKKkUtl2e6J1FZ8TLPKOtiSpS?=
 =?us-ascii?Q?L/2FrnVwHO3Wx4Lonuj792dDnu1LdM28yuzuMp9hAZSDZs1tKYvxpwH9AM6R?=
 =?us-ascii?Q?M/aDccYdD3cAyPbCjzXUH5Mm4lEoiHA7DyGeOgdJIGWV/axj4KEGhUp7hfAb?=
 =?us-ascii?Q?jDNNit7kWuFg4h8nJmljlLnE/r0iSYhsg2uTn0Iy7sRavCZuexopi+7uxo1P?=
 =?us-ascii?Q?Ym9IVwoqikq6DXKsNkn8iiGtRW7hwlajiTVLDSfbbSEmolq4HSUCLSuMoN9S?=
 =?us-ascii?Q?SvInwWqvamwBLxtrs+iuW3NVg/x1KCRISGnScxBC7+tC1uRshkTXDbfDdQ0f?=
 =?us-ascii?Q?Ox5ZbBc5b7FF+ilhBZ9ZGldf+2Bqbh57EpGQehYjMBtaIi6OgDANUasD2tGu?=
 =?us-ascii?Q?Npe1nKG/hD8w8uqNDCtz2bCL8MpPJBF9tkQEGLk6jqrdbVW5s67uSje0chYo?=
 =?us-ascii?Q?VZACbCktxzyJAIob9WI4P+tNlAhN1Pbit3q5LB2CVE21Yz5Xfiukr741MnUC?=
 =?us-ascii?Q?GruL6fb2XKj3Nn9Ky+pl6CkkaDG6qQZqzdcb4hpmEkqGRtUGFcaaBpsz8yAs?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 047293cb-22b9-412c-06f1-08dd8c41d7f3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 02:00:58.2292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RTLaap0OOtZz8koLUmVUpcdqWTXWe/ASfWTvAdFGDNEVsmLsoEbCMZoz+1qpB1nrsogXv0yNZSmu16cY+PpXOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6420
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

On Mon, May 05, 2025 at 03:58:55PM -0700, Umesh Nerlige Ramappa wrote:
> Where available, add support for 64-bit CTX timestamp when calculating
> job run time.
> 

Suggested-by: Lucas...

> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

A couple nits below, but patch does LGTM.

> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
>  drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |  1 +
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 16 +++---
>  drivers/gpu/drm/xe/xe_lrc.c              | 64 +++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_lrc.h              | 10 ++--
>  drivers/gpu/drm/xe/xe_ring_ops.c         |  8 +++
>  6 files changed, 84 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index da713634d6a0..52f4c96c01dc 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -154,6 +154,7 @@
>  #define   STOP_RING				REG_BIT(8)
>  
>  #define RING_CTX_TIMESTAMP(base)		XE_REG((base) + 0x3a8)
> +#define RING_CTX_TIMESTAMP_UDW(base)		XE_REG((base) + 0x3ac)
>  #define CSBE_DEBUG_STATUS(base)			XE_REG((base) + 0x3fc)
>  
>  #define RING_FORCE_TO_NONPRIV(base, i)		XE_REG(((base) + 0x4d0) + (i) * 4)
> diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> index 57944f90bbf6..8619244b7c7b 100644
> --- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> +++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> @@ -12,6 +12,7 @@
>  #define CTX_RING_START			(0x08 + 1)
>  #define CTX_RING_CTL			(0x0a + 1)
>  #define CTX_TIMESTAMP			(0x22 + 1)
> +#define CTX_TIMESTAMP_UDW		(0x24 + 1)
>  #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
>  #define CTX_PDP0_UDW			(0x30 + 1)
>  #define CTX_PDP0_LDW			(0x32 + 1)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 813c3c0bb250..fb07bbe00e94 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -936,10 +936,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  
>  static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>  {
> -	struct xe_gt *gt = guc_to_gt(exec_queue_to_guc(q));
> -	u32 ctx_timestamp, ctx_job_timestamp;
> -	u32 timeout_ms = q->sched_props.job_timeout_ms;
> -	u32 diff;
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	u64 ctx_timestamp, ctx_job_timestamp;
> +	u64 timeout_ms = q->sched_props.job_timeout_ms;
> +	u64 diff, max = U32_MAX;
>  	u64 running_time_ms;
>  
>  	if (!xe_sched_job_started(job)) {
> @@ -952,6 +954,8 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>  
>  	ctx_timestamp = xe_lrc_ctx_timestamp(q->lrc[0]);
>  	ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
> +	if (GRAPHICS_VER(xe) >= 20)

Should we perhaps move this xe->info.has_64bit_ctx_timestamp instead of
checking the graphics version in several places?  

> +		max = U64_MAX;
>  
>  	/*
>  	 * Counter wraps at ~223s at the usual 19.2MHz, be paranoid catch
> @@ -960,7 +964,7 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>  	xe_gt_assert(gt, timeout_ms < 100 * MSEC_PER_SEC);

Nit:
xe_gt_assert(gt, GRAPHICS_VER(xe) >= 20 || timeout_ms < 100 * MSEC_PER_SEC);

Or if we follow my suggestion above...

xe_gt_assert(gt, xe->info.has_64bit_ctx_timestamp || timeout_ms < 100 * MSEC_PER_SEC);

Matt

>  
>  	if (ctx_timestamp < ctx_job_timestamp)
> -		diff = ctx_timestamp + U32_MAX - ctx_job_timestamp;
> +		diff = ctx_timestamp + max - ctx_job_timestamp;
>  	else
>  		diff = ctx_timestamp - ctx_job_timestamp;
>  
> @@ -971,7 +975,7 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>  		ADJUST_FIVE_PERCENT(xe_gt_clock_interval_to_ms(gt, diff));
>  
>  	xe_gt_dbg(gt,
> -		  "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, running_time_ms=%llu, timeout_ms=%u, diff=0x%08x",
> +		  "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, running_time_ms=%llu, timeout_ms=%llu, diff=0x%llx",
>  		  xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>  		  q->guc->id, running_time_ms, timeout_ms, diff);
>  
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 9d9be9383207..ae6926dc900e 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -653,6 +653,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
>  #define LRC_SEQNO_PPHWSP_OFFSET 512
>  #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
>  #define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
> +#define LRC_CTX_JOB_TIMESTAMP_UDW_OFFSET (LRC_CTX_JOB_TIMESTAMP_OFFSET + 4)
>  #define LRC_PARALLEL_PPHWSP_OFFSET 2048
>  
>  u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
> @@ -691,6 +692,12 @@ static u32 __xe_lrc_ctx_job_timestamp_offset(struct xe_lrc *lrc)
>  	return xe_lrc_pphwsp_offset(lrc) + LRC_CTX_JOB_TIMESTAMP_OFFSET;
>  }
>  
> +static u32 __xe_lrc_ctx_job_timestamp_udw_offset(struct xe_lrc *lrc)
> +{
> +	/* This is stored in the driver-defined portion of PPHWSP */
> +	return xe_lrc_pphwsp_offset(lrc) + LRC_CTX_JOB_TIMESTAMP_UDW_OFFSET;
> +}
> +
>  static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
>  {
>  	/* The parallel is stored in the driver-defined portion of PPHWSP */
> @@ -702,6 +709,11 @@ static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
>  	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
>  }
>  
> +static u32 __xe_lrc_ctx_timestamp_udw_offset(struct xe_lrc *lrc)
> +{
> +	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP_UDW * sizeof(u32);
> +}
> +
>  static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
>  {
>  	/* Indirect ring state page is at the very end of LRC */
> @@ -728,7 +740,9 @@ DECL_MAP_ADDR_HELPERS(seqno)
>  DECL_MAP_ADDR_HELPERS(regs)
>  DECL_MAP_ADDR_HELPERS(start_seqno)
>  DECL_MAP_ADDR_HELPERS(ctx_job_timestamp)
> +DECL_MAP_ADDR_HELPERS(ctx_job_timestamp_udw)
>  DECL_MAP_ADDR_HELPERS(ctx_timestamp)
> +DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw)
>  DECL_MAP_ADDR_HELPERS(parallel)
>  DECL_MAP_ADDR_HELPERS(indirect_ring)
>  
> @@ -745,19 +759,38 @@ u32 xe_lrc_ctx_timestamp_ggtt_addr(struct xe_lrc *lrc)
>  	return __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
>  }
>  
> +/**
> + * xe_lrc_ctx_timestamp_udw_ggtt_addr() - Get ctx timestamp udw GGTT address
> + * @lrc: Pointer to the lrc.
> + *
> + * Returns: ctx timestamp udw GGTT address
> + */
> +u32 xe_lrc_ctx_timestamp_udw_ggtt_addr(struct xe_lrc *lrc)
> +{
> +	return __xe_lrc_ctx_timestamp_udw_ggtt_addr(lrc);
> +}
> +
>  /**
>   * xe_lrc_ctx_timestamp() - Read ctx timestamp value
>   * @lrc: Pointer to the lrc.
>   *
>   * Returns: ctx timestamp value
>   */
> -u32 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
> +u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
>  {
>  	struct xe_device *xe = lrc_to_xe(lrc);
>  	struct iosys_map map;
> +	u32 ldw, udw = 0;
>  
>  	map = __xe_lrc_ctx_timestamp_map(lrc);
> -	return xe_map_read32(xe, &map);
> +	ldw = xe_map_read32(xe, &map);
> +
> +	if (GRAPHICS_VER(xe) >= 20) {
> +		map = __xe_lrc_ctx_timestamp_udw_map(lrc);
> +		udw = xe_map_read32(xe, &map);
> +	}
> +
> +	return (u64)udw << 32 | ldw;
>  }
>  
>  /**
> @@ -771,19 +804,38 @@ u32 xe_lrc_ctx_job_timestamp_ggtt_addr(struct xe_lrc *lrc)
>  	return __xe_lrc_ctx_job_timestamp_ggtt_addr(lrc);
>  }
>  
> +/**
> + * xe_lrc_ctx_job_timestamp_udw_ggtt_addr() - Get ctx job timestamp udw GGTT address
> + * @lrc: Pointer to the lrc.
> + *
> + * Returns: ctx timestamp job udw GGTT address
> + */
> +u32 xe_lrc_ctx_job_timestamp_udw_ggtt_addr(struct xe_lrc *lrc)
> +{
> +	return __xe_lrc_ctx_job_timestamp_udw_ggtt_addr(lrc);
> +}
> +
>  /**
>   * xe_lrc_ctx_job_timestamp() - Read ctx job timestamp value
>   * @lrc: Pointer to the lrc.
>   *
>   * Returns: ctx timestamp job value
>   */
> -u32 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc)
> +u64 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc)
>  {
>  	struct xe_device *xe = lrc_to_xe(lrc);
>  	struct iosys_map map;
> +	u32 ldw, udw = 0;
>  
>  	map = __xe_lrc_ctx_job_timestamp_map(lrc);
> -	return xe_map_read32(xe, &map);
> +	ldw = xe_map_read32(xe, &map);
> +
> +	if (GRAPHICS_VER(xe) >= 20) {
> +		map = __xe_lrc_ctx_job_timestamp_udw_map(lrc);
> +		udw = xe_map_read32(xe, &map);
> +	}
> +
> +	return (u64)udw << 32 | ldw;
>  }
>  
>  u32 xe_lrc_ggtt_addr(struct xe_lrc *lrc)
> @@ -1749,8 +1801,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
>  	drm_printf(p, "\tRing start: (memory) 0x%08x\n", snapshot->start);
>  	drm_printf(p, "\tStart seqno: (memory) %d\n", snapshot->start_seqno);
>  	drm_printf(p, "\tSeqno: (memory) %d\n", snapshot->seqno);
> -	drm_printf(p, "\tTimestamp: 0x%08x\n", snapshot->ctx_timestamp);
> -	drm_printf(p, "\tJob Timestamp: 0x%08x\n", snapshot->ctx_job_timestamp);
> +	drm_printf(p, "\tTimestamp: 0x%llx\n", snapshot->ctx_timestamp);
> +	drm_printf(p, "\tJob Timestamp: 0x%llx\n", snapshot->ctx_job_timestamp);
>  
>  	if (!snapshot->lrc_snapshot)
>  		return;
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 0b40f349ab95..513093c2b5d6 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -35,8 +35,8 @@ struct xe_lrc_snapshot {
>  	} tail;
>  	u32 start_seqno;
>  	u32 seqno;
> -	u32 ctx_timestamp;
> -	u32 ctx_job_timestamp;
> +	u64 ctx_timestamp;
> +	u64 ctx_job_timestamp;
>  };
>  
>  #define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR (0x34 * 4)
> @@ -120,9 +120,11 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
>  void xe_lrc_snapshot_free(struct xe_lrc_snapshot *snapshot);
>  
>  u32 xe_lrc_ctx_timestamp_ggtt_addr(struct xe_lrc *lrc);
> -u32 xe_lrc_ctx_timestamp(struct xe_lrc *lrc);
> +u32 xe_lrc_ctx_timestamp_udw_ggtt_addr(struct xe_lrc *lrc);
> +u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc);
>  u32 xe_lrc_ctx_job_timestamp_ggtt_addr(struct xe_lrc *lrc);
> -u32 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc);
> +u32 xe_lrc_ctx_job_timestamp_udw_ggtt_addr(struct xe_lrc *lrc);
> +u64 xe_lrc_ctx_job_timestamp(struct xe_lrc *lrc);
>  
>  /**
>   * xe_lrc_update_timestamp - readout LRC timestamp and update cached value
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index bc1689db4cd7..f2381cdee30e 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -239,6 +239,14 @@ static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
>  	dw[i++] = xe_lrc_ctx_job_timestamp_ggtt_addr(lrc);
>  	dw[i++] = 0;
>  
> +	if (GRAPHICS_VER(gt_to_xe(lrc->gt)) >= 20) {
> +		dw[i++] = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT |
> +			  MI_SRM_ADD_CS_OFFSET;
> +		dw[i++] = RING_CTX_TIMESTAMP_UDW(0).addr;
> +		dw[i++] = xe_lrc_ctx_job_timestamp_udw_ggtt_addr(lrc);
> +		dw[i++] = 0;
> +	}
> +
>  	return i;
>  }
>  
> -- 
> 2.43.0
> 
