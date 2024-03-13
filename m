Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A4EC54E60
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 19:21:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16AB10F443;
	Wed, 13 Mar 2024 19:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DIWseOQ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F9410F54F
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 19:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710357701; x=1741893701;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=B6phgXhBODjKmm4Fbf/x0dR3/idcRC49WSw1GGZASbE=;
 b=DIWseOQ3ZQFK+1ehrqx7PZ0axRnlswsuETzp+v4lWf79wJ91LQ/LfO/c
 y26NrxdbneF54OwfHZ+vluQJbONzdFFqnd5EiGCOs/5sD3geBpKjXjVke
 5rZnIpMS4omJNzjTOBVmzpcSD4XqoRNF09ZvvbgfuNA1oFeSXwv8bfM2F
 WhAWATx0UUUBiY19MKhucD0L6yUv5nSsaNRoOfZGUIU7qlXXFWjgSsBFv
 uiGjOqxsN5J7XRvvm47nc0l7v5c318YiUJqdFoZN+PDAhVsqNpuHmkI08
 L+ggvEopU1QNfkHjOQaRi3E1uOuCO2gXzGEktcfuRfpteUJFz0UqZGe3v w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="15703609"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="15703609"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 12:21:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="11921525"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 12:21:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 12:21:40 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 12:21:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 12:21:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 12:21:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qo1kOheAKPxwuLXJIrXz5wyTre2X+5FIVHgomC8eRy+e7fi5S+dzrxhs/WaZtOS/vD3W/4sdQF4mV83mgz9JlVdwCJgobbAENsH5ZKpZX4DNTAjyk5ALKIIVAXcyF60zBrTZ28MR2cNh+eQqk1n44H0OFrmiFVAYX5vGl+gq86O44cYXqe5JjHZcdJHec6DFzGRboRy/qBk3xN9me99AHEvqWqmhCzuFQRNMOJxLDGUsFBqxVnIEVpyAMgcLecYstY7no8h/oIORr7vfFcNsoOJsmg4Var3Aq+6IDbHiWXqpACVycA2rxKlZOO65OotbsUmwa6OJiQEeSU1ppP9fIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZCmFEIXTx/agS1X16nR+mCoPKEb7DQJj7nVRWUJzeI=;
 b=VAYczPLhYX/ul5GIyCppcNZfbyc/clYpIeMfbK3yp8IonjEgTWft8F8NIgZ+AR5XH6xhpEiGbW/n0LvrqZxrE6p9DNps7GumXkdr98RAHwJmKWMwioMjoF3G/h95gBqRSNtmdxSXxzOTZ/QTrtqKsvJldMN+FrOAcnhyn2pYzqcCaKpg1boM8ZtC55ITsMnq9xPIXYecNknocN1yNtS9UFyY8SfaxgmbVqeNEj0hyic7U/KZbvvJLnyx7a8rbeYGqmDkXa/M2TY1KLC87k7M7/RFHUCdxOm4D4oCke5lv9d14QR0jcmDRQUNL+/LSIPg2qhceRXq+3neGVZQdH/xDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB5987.namprd11.prod.outlook.com (2603:10b6:208:372::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Wed, 13 Mar
 2024 19:21:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 19:21:32 +0000
Date: Wed, 13 Mar 2024 14:21:30 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe_tracer: Align fence output format in ftrace log
Message-ID: <jwqyioe6wepe7x4ggjjk52id3jggu42uqavcmkqvabvzte5z2y@u7wb7i3hmktq>
References: <20240313025052.1410833-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240313025052.1410833-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: BY3PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB5987:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a9ff1ef-bb43-4fd0-74fd-08dc4392cad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9CzyO03GS/urZjZUo4UsSgv7c0LObBZPlSjYPA1wehgIyHV7HPRKvhZBirfHT0yfJmKGd3YkyFA5KDzUzU70nRwCS3yZTnUgvRSsFLZsGznnWocaJeO86ypAvE64rxkJwejVVjBa9y5FffwFEN7L38XeBE/cc3tu80nlLkFd211BE0aD0A8WqCs7EoYDCU0FeJm00axADX6zaNH2gcKe6aNYqvck30Ogzq9pVgftvBn4jTlW+BRpTpK4DJXaHu1IRI8IdRxtWzX8NEcBP5TjpZvV891ZUWlZGuyIivQsd60U6s6mWVHODGLYEbakthSzBfy6rgrEasf7Q47sWEsbHLRab/ZEWBHavL4EQMSUA+v3JSB5LBSwtajU1LjwSdGSxdLdEuckxNdBWXR3OuBstYhwCLUDrDFZdmY+MrmO0B1I1tom2bYg9y5yQ+fsiCcQ1kmi+nv8wpdRM1d7+GNH5hagcoUMwNjIjmdmKO9gjJOen4bQnz1SqPqLSEwaop2uZzzh9kXn9klav7wGhzxQtiPPTeaTIhzpuginLUYeXYc2qSHmBqAsr1Q7GW1NE0HV3dvx5OZJdGAnO7tO7fmU6DcSpPqPkTmq4fQiF5Fmh3RHbjBzc9DjV2EPTRJKGrbRzMPh4N3y1DIWzELzSG1zZC875qeV7xu+Z1ADLx5Lm3I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RBW3ztoI+wWGQB7HRndYfuWOwz6+WxDCFZdVS0HdyYnfAvrXpDLR4wXNsg6t?=
 =?us-ascii?Q?eiQrnxVCkv0+RpG78wofTwcN5f3GbylLftGlTqMnkZ5VpJnuJoi4SxHUpR1S?=
 =?us-ascii?Q?na/SYUv75p9e3TRVGY0BWIGpc9Xx21P4zcz1K5fKN4/PMvhhkvIotn6mbarI?=
 =?us-ascii?Q?iT3JIhDwVkIqWnNmSdzAqb5Snt5J3RSBuILdMP19R8ZD3sMIkxFmKs2eyqab?=
 =?us-ascii?Q?phnTQeeudnuptuKokwNkRjl+wZQZpyAdZ59B1Mh2/gmSJOIr4KYHR/3RAtYP?=
 =?us-ascii?Q?QmD9+xBL4Ch21phymKn9L8y4XCFSCia++b+pPjtKZJIXDKxr54pG4eDL2SEb?=
 =?us-ascii?Q?T97AJb6okXyCA7pt43pPytwcRnCOOzpLzfLFVxHTd5IwQNMBakCglF9ZboHt?=
 =?us-ascii?Q?bSaCLO24bmr9UEQFhjkK6gmGgeLbgT+2vh49KNP1j0kyELvnIRMaRFQa48K+?=
 =?us-ascii?Q?YGMzlNyudfe0fx37YfF9993hNcrMm7AW/LwEcwMZVgnnhEI7eK2hlFbPSdiR?=
 =?us-ascii?Q?ZWzXhk33mRjWCR6/XbpgFua1iAH9pGkeY30k0a2eq3Ip2XlptABHhMtJ3tkh?=
 =?us-ascii?Q?uiDIwF6I1fKeyciKTxW5u7qMfnC+1rLlGq/GhV1DjAAy0F31ja2zuT3uiNUT?=
 =?us-ascii?Q?oV9oyC3gZDlxhlA65Eg0+cFdv15QxxbJxZBQPvrekoIPlwjoLu+IhIxZVa9R?=
 =?us-ascii?Q?iKp3Y7cKsNurddB7xf1EQr66swTlS/h4FI2iN66hgeQAZjmJjvLZa22I5b+o?=
 =?us-ascii?Q?QQnK34+GV4ucPoD8rrkHLG23zqiZPGWaD/b1qJ2KDoClw85G9waR/ukR10YH?=
 =?us-ascii?Q?kCI+p3mfRfMlpG8IH1MLHWUjPIBJUGIc2pBg/09ZV1PkM7Zw28dDnlkVjDc6?=
 =?us-ascii?Q?WLOw5uFfgb+xcwCzApVyjPMRo9BbKOyJlw4f626OuYkgZoBbJi99+AkG9VsA?=
 =?us-ascii?Q?nyG6hWmPQaP62g3cxF7tqkVh7RHNdsJdAMsHD9yjQX+ZtFzwiMS2WzO5jeCv?=
 =?us-ascii?Q?pfbWQ+JKGhlMBxS8m7jzcMTQGIHpuzjG+ONEOXAA/F6FMk2U/1/TYgN+cw0M?=
 =?us-ascii?Q?L1AhoQEZiQ97XpqYCF64YFcRuAaT8K2fX8XUoopJZjmZp90ePSvUsFV7cUeS?=
 =?us-ascii?Q?YNPexwTpQSLWUCemyvbO+dup42hDWsLu4b+I271yCAtNPsJv4fJvXzqHfblQ?=
 =?us-ascii?Q?NhqBu/LpCq2Yr82OI8jQFLpfz5VPDlQZOOL8abOtomz0SRkn8pi4tpBKAK0t?=
 =?us-ascii?Q?pq2H451cTtLrfiqOoYx9YfmSDkuNwJ8o85t4+RnsxsyseQh7H4eXiZQo0DdT?=
 =?us-ascii?Q?AlT5b1uF0e1Bn7XwdtlktNYMHqktLtQfQCTWZhnAf9jFVx3txndMfDBP2Ufk?=
 =?us-ascii?Q?DvGMjK4ZVK56Wn2ha7DKrx+pP7rdG4dmKxDhFoRoAZoxI8+MAkoeqOXNj/A7?=
 =?us-ascii?Q?QO2fEgE8P6Hw+rvkpBhR3hmsIFdC6c49d0TBKvWq20xxmfFlkcr2OvsB4Sfr?=
 =?us-ascii?Q?ck5+7GGujzXxsqJW8puOaLhXZvgm7VuQkxnLvKux/VVbZXPMjlYSK6dldKOf?=
 =?us-ascii?Q?0C5xMQ8LoY8OnGyrGqrzvf20W/CN5QbfXGDSvsIkYisG832XB0HWx+DGK8TJ?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a9ff1ef-bb43-4fd0-74fd-08dc4392cad1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 19:21:32.8769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iXl1UFCz9mHa8a/mkn5B/jVjqXkNiLSeZrLbNh65aTl5E0pI7zf1AYJcERDP17TbZwxV4pCzfoiX4zAgZWOArrNLO1/FJkr2VWqy6c13LZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5987
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

On Wed, Mar 13, 2024 at 02:50:52AM +0000, Shuicheng Lin wrote:
>The fence print in xe_gt_tlb_invalidation_fence and xe_hw_fence
>is with "%p", change fence print in xe_sched_job to "%p" also.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_trace.h | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
>index 4ddc55527f9a..2d3beaffc308 100644
>--- a/drivers/gpu/drm/xe/xe_trace.h
>+++ b/drivers/gpu/drm/xe/xe_trace.h
>@@ -258,7 +258,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
> 			     __field(u32, guc_state)
> 			     __field(u32, flags)
> 			     __field(int, error)
>-			     __field(u64, fence)
>+			     __field(struct dma_fence *, fence)
> 			     __field(u64, batch_addr)
> 			     ),
>
>@@ -269,11 +269,11 @@ DECLARE_EVENT_CLASS(xe_sched_job,
> 			   atomic_read(&job->q->guc->state);
> 			   __entry->flags = job->q->flags;
> 			   __entry->error = job->fence->error;
>-			   __entry->fence = (unsigned long)job->fence;
>+			   __entry->fence = job->fence;
> 			   __entry->batch_addr = (u64)job->batch_addr[0];
> 			   ),
>
>-		    TP_printk("fence=0x%016llx, seqno=%u, guc_id=%d, batch_addr=0x%012llx, guc_state=0x%x, flags=0x%x, error=%d",
>+		    TP_printk("fence=%p, seqno=%u, guc_id=%d, batch_addr=0x%012llx, guc_state=0x%x, flags=0x%x, error=%d",
> 			      __entry->fence, __entry->seqno, __entry->guc_id,
> 			      __entry->batch_addr, __entry->guc_state,
> 			      __entry->flags, __entry->error)
>-- 
>2.25.1
>
