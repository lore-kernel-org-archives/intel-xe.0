Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BAEC2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 19:00:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D09010E63A;
	Tue,  9 Jul 2024 19:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mRs0bV7w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D3410E63A
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 18:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720551598; x=1752087598;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=caX5zrVkqZW4iN0MJtpaLmNtnkV//NKa5dj/hFYzlZo=;
 b=mRs0bV7wTWPqITOdM+rHziRdeD/+nEquTTji8ThUV+Ibd0gtk6lq7dvu
 Pr1fupaszdPIcU/GBR5jqufw9wDf6DdKMATdQb8HRW0b9IR9AbA40h8Sx
 b5ilTKeJvhiSHB2++TM1yIgrQuex7oTn23SDrojv85gpi6m4dopto8R7R
 LLs78+PhxXSQxS/Dc0zo/ru8dWPTenyghSEBhcz7revbub1ssvIXiCSBV
 OJre74d9PsVLCY8tajbCiTxK8Y5jKv5mM8NiTjYhCiNeb7e9w0jvHXMN4
 oreu7jvxER5SSymqSABQSWToqitfQagtYa1w4YqM1klv4Hcl7ehIoAN3k A==;
X-CSE-ConnectionGUID: 0d6TxD3LRaqv5Ii9nHFqyg==
X-CSE-MsgGUID: mrzU5PeDQ9OhXe52I1cyoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="17970811"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="17970811"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 11:59:58 -0700
X-CSE-ConnectionGUID: LPcX4eehTXSvoRJLFi2nBA==
X-CSE-MsgGUID: ItmM2vgYRpq3FzVGXRXEww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="48692670"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 11:59:58 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 11:59:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 11:59:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 11:59:57 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 11:59:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2AvQhb0fpSnEoVNs+8R6z4Q51AGQaM3t9XSpSrhPIM8Rzsjz2kfu87UhYPaJgXV/nuSwBLeWRcQZSi0WuQR7r+hhCR5Ca18sRlkWd+8z05DfOm3Q2SNmnyjgv2B48z7kB58DkMpao+OaUHImfERLS3TDusTR3vUrw+r35Y1an/uawnBUJj+z1koJVWzsPlBPKuMqxIUS7lrB3DAUHRxV7Ckyz/6UZ5hlz83KWJ5qMXONs5J48JaTACkjdE3J+X4KoFgN1rnUeFo5EVOD9NlUS5A9wlFLFnAZBvZL98e+7ShlZgE4QPl+oDpklEnADyWQWrxs9UUhLfGi6TOA8t8tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMH3AmyCfjutQrjnyVH2wyKnLIAHI2r7AWBTTR2Ik8I=;
 b=O9w7mrdNbhMvhOoZNs8RbeTsqGQfMhB7SlQ8bUEpmb4KIWcrXL4oGt8ty0wQIz5y1wiqBW+C3JnnYet/gi4lTvsHJPyV6/bbYARAYBI02OqZjC9XF/4ACGspU35g8wzConL7B+z70K0Pd5K0NuEblabMUmdAZZq6yiomSadHEqGkNkR7wbcQQL4zFNGDcetCYGJGLfZHd+7T8HsqUAlPpHSnW5wbTaV8ni+71xFzgzws5bsqBcpbFcoCzJcGUqj1WeLlqKqENUb5PVcx63PG7cV9T0dPzQAR2Qw2CXC1vYFvut+N81mca3ukD7L/9eM0tVAaPvxSK7nfatDTB6RRRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 PH7PR11MB5914.namprd11.prod.outlook.com (2603:10b6:510:138::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.36; Tue, 9 Jul 2024 18:59:46 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 18:59:46 +0000
Date: Tue, 9 Jul 2024 14:59:41 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <matthew.brost@intel.com>, <John.C.Harrison@intel.com>,
 <brian.welty@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Fix missing workqueue destroy in
 xe_gt_pagefault
Message-ID: <Zo2IneFVE2yZ8B6Q@intel.com>
References: <cover.1720550129.git.stuart.summers@intel.com>
 <7c8bf0c59c0bd167c238dc5a65d0074a4ea4109d.1720550129.git.stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7c8bf0c59c0bd167c238dc5a65d0074a4ea4109d.1720550129.git.stuart.summers@intel.com>
X-ClientProxiedBy: BYAPR11CA0068.namprd11.prod.outlook.com
 (2603:10b6:a03:80::45) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|PH7PR11MB5914:EE_
X-MS-Office365-Filtering-Correlation-Id: 311a4643-c2f6-4ead-1168-08dca0494c4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ApIAiMh9phTAUd8BqPJDURvbEh/svmKpAKTwFGtUmyVwjT/+Rp+x7np8vgdt?=
 =?us-ascii?Q?0CTTa4Nl7m1F0pwARrhK//SlXSDy4gHjiDjBwJxpxDO1Mq8sXA+E4v/c8Uua?=
 =?us-ascii?Q?x4MJ+KfGQh5fUU6qgSrcc2ojm9j5O7cPpWsOnmPQpwq8FdzA89Kj4tZN1mit?=
 =?us-ascii?Q?BMKi97nwRRGEzROrzgVp6dL72oCxHDLXlsxMnIMLOswSM9tuDGP2Y/gpUK5f?=
 =?us-ascii?Q?1IPEqF0HQTAV76oo/7G7RAZIlQ3CJpKA0kxS++WVW0qVtOhACD6gpA2Xxue1?=
 =?us-ascii?Q?BCmFHOD6DcfppouHnFwi0EvVzcFLjHjmKORk4OKK5CZ7OPbqMwuyWsLpxkWG?=
 =?us-ascii?Q?Rk7FHuJAulxuUiIxnbmNnuD8Z80rWLChJKzY8OfnQk8NwUDT1i9GwMNqupaF?=
 =?us-ascii?Q?zyvZB4gRI/YoBhS3cNWc/nmlyJtbWgcimfSy6Ohm/zjUQHpphcdTnickEARU?=
 =?us-ascii?Q?DxJbWXa45v4AKoQkIGC82qR7XiXBjleCUQ4HsG2rai5f82huHLydsbye6lNZ?=
 =?us-ascii?Q?TBPk5GvCYRBPAJIFvtwVZDzr+lmKwlkFvZISfXerzUdmu74Ul9Ux1LeB9hne?=
 =?us-ascii?Q?Bk9PhG2N1ml0n56nLlLH86jyus0iBajDpslYdo1K0WBXoGGaltuUqRotueXF?=
 =?us-ascii?Q?bh3PtJra0O+7Px+lbZvEPE4538LkYqoi06gGSg/eDJ/Gbf9pZDhEJlLgqW13?=
 =?us-ascii?Q?qRvHihn5+UG6v/ZxUOZWbYYJ2krUx4cI8h6VYiLqQnCg/jKw3xwN86QE2nBp?=
 =?us-ascii?Q?RVT4dV+lDUxw1n124zD0cS8+MyMXK6uCW8MZrXHXQowOK2h+fbW5rMxV2Vsh?=
 =?us-ascii?Q?MhMabwjyKpkKzxDuktbBPyijawcKvkQrI1lpYjZ+1ltDMmsBSHdC80XagFxY?=
 =?us-ascii?Q?l9TV9RgGv4a0m5A5PmA7I64cXFfuMk6P3I6zRRHSQenX29SNyCcpugnRf3Pd?=
 =?us-ascii?Q?AV2pS0yukUbECHNnpj2wmwMAXzHrSChlVtJBijxreXZFpt/TIzM5fDUKBjo8?=
 =?us-ascii?Q?tXLCwr+za+2TBjCY5BmWxwd77KW9hgU4IideQzjPgnetObVO6pR+/9sNzc1h?=
 =?us-ascii?Q?XeYyy7yJKSCGIeG191HsFwY2pOERhQx4+7z2Gvvg6+tiDFN5ARnQHExegtS1?=
 =?us-ascii?Q?q1reGMCkYz1iecvKbDQ8yr+nK/JI5WaneWkWzBhtWBf7cfTnZVJ7DB5MqR7u?=
 =?us-ascii?Q?CYeSIhXnnnr7HApx6RW57hTetAgtBfK0eWpuTrMyDKWkoD+p7xaE6ngoFkvq?=
 =?us-ascii?Q?z04XMnAuLos96EHPeuoLPyeNzAfbN7otUepf5TshkhnGLbIN5FgjdQnn3f9C?=
 =?us-ascii?Q?QUs0q2TLUvyHOFpzUxWULnvPIJURLBt416lE63xUh+i11g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OHSLVHVMsVOhhj8y8DgJSptd38ibjv0loyv81g8sR21VBQ5jXOBrPfTCsDgd?=
 =?us-ascii?Q?dUESFEzud6dcfnJ6J3I8sdiObrWOlaxd2bnH2W/yFpZYRa+ipl858i4ur+lS?=
 =?us-ascii?Q?cK1tr/Yx4wo4/Lm2ZJ94eOf8RSDfrF89W97YF3pBYXPl0pJl19P7aDaXLmFX?=
 =?us-ascii?Q?mA0Ih2Od0XTnbEDrMvpcFCdd7Ux0bPamzWnKSTp89K532wEGwc+mxPDVjqEB?=
 =?us-ascii?Q?zdgWbGvdyz1Qmos5QxTFnkXujnx7Wy0zUNrdF6srlgyqTtPQ+EzceCvPFvzd?=
 =?us-ascii?Q?Q+4yD2d+u7HxMX1W5th9ZYxnSdgRGlAb5yXg7vpCrCGGZhMmrZGumRNdlpos?=
 =?us-ascii?Q?Iil69wPzjzqMrvrKkV/ZPrkdlFlwXBclcHLsnp3SrMDGGYF9ZAGBgok6dV1S?=
 =?us-ascii?Q?JS+SW0lIy76JpPfmrRVebDA+gUo1waRcwxpi6T6xyWM8A1y4M+amVhR251Fe?=
 =?us-ascii?Q?dnXBdTT7XqbA4QAeEosiBFKArIhz4QYwYECvEdsLV+KlVPFFjCThMumGsLwW?=
 =?us-ascii?Q?OZsMXuOT6cFEgMOWAOlFtlZHeAUm+Elod8xU57XlCbbZWkDlkAeprYtyTbJk?=
 =?us-ascii?Q?gYCj/sttcdzsyU2aVULVshNAtQYn8JpkBfA1Vs6S8Nb+mVzsfbCJNbrUh8cO?=
 =?us-ascii?Q?GwXuEAGFreXWU8F2QNes4USexh/xZJFjLg/M8ZYBBizqSIb8WkSysXEE4SG9?=
 =?us-ascii?Q?4VejUpqChGSITfi4rRmSZspOBgll+C+h619NpbBXfl5CsK5pXfXPgDo3NAWw?=
 =?us-ascii?Q?oY3BDPDTq2WxuYxpmYX4rWeTmIRQp3T5JHNPg52Bf5pPgx3MaaOdOM1y37DX?=
 =?us-ascii?Q?SyIZhbPMcoelQDDM5EfMG7JpE5IyXTly9Y0H+Q3vA9LOju/bsAivGbg4Xm5J?=
 =?us-ascii?Q?BUWLX3tgywkfgAE8MMCKvX7x2KJe2a1LBnLOhMdTTf/iCxC/u7odNKVKfyVd?=
 =?us-ascii?Q?fEevJiQpNaf88K71/FWHq+rWB15hxvoVM/SIAv8N6haohm4a6KzSAIJKBnoX?=
 =?us-ascii?Q?Y4bOg0kKBcl9klyBDi5gtlKdOHcKe7Dh0uhhZ6s4tEm9YITbohXr3kW8XMQW?=
 =?us-ascii?Q?qdmIpRa6hpyZD0xjUQTnRzawT1EQW/4NVd7RkEGBS7B3UHzpWPRQFFcAElNA?=
 =?us-ascii?Q?qb+zNN+hxgRbraOq06Nsgn1BrAcWLyqWl8u891HzTdo7acnNHffYBY5MbXNN?=
 =?us-ascii?Q?9t5lyGgae6HVpSEygQaz1F3H+TcQLqCp8+DZBeWGLw/TYHgElGnpid1tD3H8?=
 =?us-ascii?Q?Q4dAm7GAtEYVfPsW41iqHhWuo3Vv49+tUkjqvYGh1G8kDQqpw8Xi6FYthXgW?=
 =?us-ascii?Q?5KythUTg5L06fot4Q93yoZaaLcpA4HVo03QB0exyBGyxzTVSg/E0TML/vFO6?=
 =?us-ascii?Q?+hZT/K2EkDneu6ESM5PYyMC4+26DpOsOujy7TP3lXbAhY1bwswrN94FcLrIy?=
 =?us-ascii?Q?2jtHNmwW0566G6WvxnMD4AbvQb9pUo6642olt4ayUW/eIH5sQuNbPePKgsfL?=
 =?us-ascii?Q?SumU3hf33/xh9gnNJWgqkcHN9ugahHniTWdqSUQLDfIFkmriXt1LXCyi7CEq?=
 =?us-ascii?Q?8pa0vlUZGLdDyuAcYGbRd+ARlc7fiOpZwtIq5WLrEVoqK/EyveE8t7+6N59q?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 311a4643-c2f6-4ead-1168-08dca0494c4f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 18:59:45.9771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ehTuJrFbtk8j219EO9XlueVKCIvBg1fxo8NH+nXjPLAhsf51KfLUjUh2yjfLDSUuAn52OQQpVb+F8EaUDvZQPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5914
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

On Tue, Jul 09, 2024 at 06:40:59PM +0000, Stuart Summers wrote:
> On driver reload we never free up the memory for the pagefault and
> access counter workqueues. Add those destroy calls here.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index e18659201208..ded8e3c33a82 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -398,6 +398,18 @@ static void pf_queue_work_func(struct work_struct *w)
>  
>  static void acc_queue_work_func(struct work_struct *w);
>  
> +static void pagefault_fini(void *arg)
> +{
> +	struct xe_gt *gt = arg;
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (!xe->info.has_usm)
> +		return;
> +
> +	destroy_workqueue(gt->usm.acc_wq);
> +	destroy_workqueue(gt->usm.pf_wq);
> +}
> +
>  int xe_gt_pagefault_init(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -428,7 +440,7 @@ int xe_gt_pagefault_init(struct xe_gt *gt)
>  	if (!gt->usm.acc_wq)
>  		return -ENOMEM;

I believe we should destroy the  pf_wq in this return, no?!

with that fixed or clarified,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  
> -	return 0;
> +	return devm_add_action_or_reset(xe->drm.dev, pagefault_fini, gt);
>  }
>  
>  void xe_gt_pagefault_reset(struct xe_gt *gt)
> -- 
> 2.34.1
> 
