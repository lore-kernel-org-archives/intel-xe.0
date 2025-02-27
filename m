Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AF8C19F32
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 23:40:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6326B10EBB0;
	Thu, 27 Feb 2025 23:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P9LlI3/i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D23CC10EBB0
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Feb 2025 23:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740699656; x=1772235656;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7XXIyheSK854E0k/dFnxY6X1INkyqxNdFsZ6BncROuY=;
 b=P9LlI3/it6SEzZzAOU/TatAN/dbt4LHx20byJJxkBMHAfJkU1ztJB579
 OTSIx0PwrpuCGbZJhlCduJXTZcaWMZWV/6O0FoONGacf789LM18HU1vW5
 TzsoP6oLZaN+aAYp4dsOyLt2LaSyqfI7S/EivPIWubnzz7YgMlmtl5TSK
 Pd3MoZPrryM18A67QaHqlu16risKKG/HqXjTsqodw5lKOQ7QEgVvR3HBh
 fzAPguOQusntdC5lap27Kauv6l+zEahSu+nQvKOUNwtF+IlHmJjuRJ1+L
 WRTpad6NqA6aJ81WfD4wIXK6QOf5mL197dAD3LenMw3aE3pdccVu/iRDi w==;
X-CSE-ConnectionGUID: bHFNeBkpTmWAMpnE+WEKnQ==
X-CSE-MsgGUID: Lm0tKDpESbiokkXH0am2Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41814425"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41814425"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 15:40:55 -0800
X-CSE-ConnectionGUID: VSJIF4FjT/aBdgRPYq8H0Q==
X-CSE-MsgGUID: 9m6QDIexQOiQSavdZWlFhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117697773"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 15:40:55 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 27 Feb 2025 15:40:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 27 Feb 2025 15:40:53 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 15:40:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YITC9kZjz6gQgC3sFxqgFFv4Uzf/V82IScqLurtDzj5iXTgUc8+etDzD/dc9ZBINsRpqCz/hTAdwlYP+ZDhPGSVNNG2eOERm/Vqg9/ymGA0IBp8aRqoVdp7h8ptlMP/Of9UPxrC5P8YeZ4H2hUmijR0sshaKVKg1QBu5wfLhUfmmxaiETqMb/FhJdWDMdxD5vQOoXZUZ8iyOMN6LvRRdC1FeCeVtiX0F3N0I/Kv75jlgFeT+XDLRj5cIiV+c5ZV+ukxyIR1ZE1+CYeSQsfUfz4JtuUdLEMa8jTjk26BAULb2wPcu0q1f7XsYSdIc+M3MADl0oqChUe72WzzWB5mn8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MqiEYuA1c0Kp9kCJmtdDvEHmNjhWNPuUbyJG0tmKpLY=;
 b=k48R9fpMFgbyzhsZl80cLPi+MLuTKSsT6PEIHnDto8xhGGm2JhvHH5ns4wvCK7v+gQClf+JS68tM94/9HHz5sW4jZLvol7qXvnuZEEhkqv8+9rLIbZEHBWU9u/Ji5Ob9kkXXJUoPU8pj1FLd/CXX7xVv4ZeqYdIWi7JzIsZhXIMfnTg+UoQnSegx2yWx4/swMXxuZqPtlP+WyhIHwoIrYuDek0dYkwXw3jI/xAlkyY5YgTdXNVBIwMERXshPg44t5U1ZP81qva+ez0KG+Xfa1JBD+iPeHoQHhyfmUXUgEJUFiuVA/CkE/fyKl60/p+eE5xSsihdcYZQeyqiFhxDSBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MW4PR11MB7126.namprd11.prod.outlook.com (2603:10b6:303:222::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Thu, 27 Feb
 2025 23:40:45 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.8489.021; Thu, 27 Feb 2025
 23:40:45 +0000
Date: Thu, 27 Feb 2025 15:41:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <Thomas.Hellstrom@linux.intel.com>,
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v6 2/3] drm/xe: Clear scratch page on vm_bind
Message-ID: <Z8D4PWodYOH47WpY@lstrano-desk.jf.intel.com>
References: <20250227160952.807885-1-oak.zeng@intel.com>
 <20250227160952.807885-3-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250227160952.807885-3-oak.zeng@intel.com>
X-ClientProxiedBy: MW4PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:303:8e::27) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MW4PR11MB7126:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c9b0d7d-04ea-412e-61de-08dd578827aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?itGB3oE0l/kGfEV+bZQ67h30apqfKUd0CmeiTjsP4/uAZ6NsVlAI/m0NzktA?=
 =?us-ascii?Q?NF3yY9SBu3kv14IQR+pGv/W8ERtObX9gHsp0lhl2V90unI9jSi0aJuk359Ga?=
 =?us-ascii?Q?ziTmAQNq8kLEAa1FjPfTPfclkS2plRqn8KUMGswc7+iO6uXDviHjE9a5Vx4l?=
 =?us-ascii?Q?zwgRDmOoNo/wlkovFQMUOgSOdBaKFIEqaJbrTD9HqnIhXe04jt6i6zq0tTlg?=
 =?us-ascii?Q?iOZ39EREV5TChnLMRfCVMeXR0hO6kVvJl9iSvixpQcBeDtEPiM4ULC/IplRL?=
 =?us-ascii?Q?3Ojdf3M9vGZ6bbafnh/r4pQzN7zFFFmQ2vxKDyJFqF4+YWoaXtR1nyWmGyic?=
 =?us-ascii?Q?w73Oa4HrUQJoIdTdQj7T2XoCzfoMMtJ9Ewr+3TWU9fD9kW/eZHfZ/G+SiCsZ?=
 =?us-ascii?Q?9e5nJ3Kkd8PACmZZ5RKKfZHcTl+WAsvf9p1bIezwiWUHNMgYd3+gdev0sgOS?=
 =?us-ascii?Q?Iyw4jG9MXZhJ0YJIdhUX2tIdDoA0NGI+rG/wQzIseFjJgjOKSJaot7dQKKg/?=
 =?us-ascii?Q?TuZAlEQ8XYS1wAjH7Sb/eudfm24WGc98yEvc6kM7rQ1wPhJq/jyEt+sO64ft?=
 =?us-ascii?Q?qjBOfWGax6aRH6AxvsCnEYUe6gxpgkroTSCpnhXxLCZ3Ugt1ESyCt4AP0X+u?=
 =?us-ascii?Q?EhGHHkTYBQSz0Tle4FGWzF1p9oHB5YC8NLwJhpRTtPUrqg2PROnY8VP8fWaI?=
 =?us-ascii?Q?WyB4rQMgWzDV5irIUIZ1KPTCU181G+b7WE7tKpW2qboH/2kMahc1Z7NppClW?=
 =?us-ascii?Q?sDqu2okbAnzPl+o8NMVszGPQA3xTbNbgo+zT8j7Yb89dz0NVKBgnq8fxSy8B?=
 =?us-ascii?Q?ucJHI/biHp26UgpF1RwLzuJA7oJU+sEObAXgidNhmkkVPJKeWDD0/hZIf6h5?=
 =?us-ascii?Q?jhCIr+40+lw5qEIR0/t7A6Z8ljpzjugmQLBwDI1V6U9B0fZ/1rdqJUkBGug5?=
 =?us-ascii?Q?t6OBvDOZ1bsars/owcwMgoswRL124X3XjcIgk79MxoblwLMnv8cPFjl9BvuF?=
 =?us-ascii?Q?onvSkNhZBaLX8IUbXyZ5H/fr+1o3O7C4d0pTo/YPAU3HgTFWy2DbpGSVXtT4?=
 =?us-ascii?Q?rjuDaDl3fUhozBiCZxhVHByahUIvufLRO5xUUn8p2CquNJ2JbRvhoXjja+SQ?=
 =?us-ascii?Q?HDlxjrcH1g2ssrigrQTrWYcya7ePFX4M0tmBBwWRtVd/h6vclQnX5ITpNoDM?=
 =?us-ascii?Q?Qp+k61tgfvmtiBrEqGeNdsKaBga/EICQP03kS2JctqIhw+TOe5rOBUxxB3m6?=
 =?us-ascii?Q?ejjlW+M64feUhY8p6dbyaT4CdzSP4xjzSBnUT9l1aGK9dKMx/HSVBWIQaIky?=
 =?us-ascii?Q?k/5XmngfVquRTLfYwAGqYgHqdxk8rbSE107XgdqdRmO0fO2LW55qm8fAY1eA?=
 =?us-ascii?Q?Xkyz7L2/zYfa5uUOYRCEapFpH9De?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p3N2XYlfUwZwzKI5omwRrvuwE4eFNzLMlNWycvyXmytHoR0JFMWmiy0WgoaJ?=
 =?us-ascii?Q?KfhEz5rCwWu0IPHTluS6owrRpGbZTFZGUVFL5wXPeDIc7xK+vzeb7FXurri7?=
 =?us-ascii?Q?icTqkrTxYmc/8oFLRYGujVSulmr7Gd6xWJmJrZTOwG06UwtXbTrQ5lbXbNbk?=
 =?us-ascii?Q?i39uKYi2hYmJ19MeFqAn7Ub5WpMtEjWe88LBHi0f6jRSbaoY9lm8GoOpAzb6?=
 =?us-ascii?Q?2H8tmRAtLuQfTFSicmUoHWb9+42zG65vFPn3KT9WMnaXcNzFe1zqObRKUzpP?=
 =?us-ascii?Q?qwHAgHSOSapyl7EsTqQTsfMxLgz0RaPLUMP1RSnlwxaaqhIrMbQ81lYrt6nS?=
 =?us-ascii?Q?Xbup4o/kfNaKAuZDf3VaSI68JLhMebcykNa10zC8sokStpH6VKor3Ms7H1JP?=
 =?us-ascii?Q?6v7ckMioyhe3dPAM0BQ86dnn4qUoHuYMaXH/kK6jWGtIU643A77ICgTiNlH8?=
 =?us-ascii?Q?3V7jU7faSN3ufLdDU6AGZIX3GpcleUX7jqWBrTSzBjaR58JttLZQICnSezP/?=
 =?us-ascii?Q?NnAZe+t5DBzPkegDAQl34MGje96Ymi+SiHKDLKP7sKzRfCrnaoBqD4AsodyJ?=
 =?us-ascii?Q?Z7Texj3lMbGg7KnUxJxHVT6IZzte1SpVq9pY2E2J3yV2Ip3ONYRL4ITuvRql?=
 =?us-ascii?Q?ySNUtycBjK2a6z0SMqjz1YqmgY4EBgGMDmFlyeugsjIXRzWMMxYpuv7xPR7F?=
 =?us-ascii?Q?NYEsVBOl0Bc6/JcSd2xlz0ULiUFrU707L5yT/7EsYctKk1l4oai50g0k3ySw?=
 =?us-ascii?Q?vztjaeJ4onk1wz7gO+PfeuLVQiB8p1dcpb68EDArKDGwis19/kwG2t60+e6o?=
 =?us-ascii?Q?TXInNIPKJ7YFhmxGAc9CserSdME4BnlkUTM7nhRhVXTEmMFeruM+QUvYhBoa?=
 =?us-ascii?Q?1IRYOR9RA7YOQBiNMECuPgeOUWH85cc7ZxRe/Be5BSK/4EnOABQlxPOYd4tv?=
 =?us-ascii?Q?Sw/oijk/JoyvTvJLGDMIYhmrILXLiOstgYoaJ29rmWhXE98In7gj0gqKzJD/?=
 =?us-ascii?Q?vHHcrBPBZGGejbr+j0lE1Crkmxn5wBRe4bG4SDbunTnqSXRHpeDEk8P+xheT?=
 =?us-ascii?Q?YDGPAzOR+eHnS5n4MIGlcqdv/YzHT1NjgGMApy+LIhuar2Y/WUuFyHZ+J1uc?=
 =?us-ascii?Q?dwoRAF1o0TQ4mlNigDNV9Ucs4J+SEWD/7N5x+1O195HDf6kRcBWCUQ4y5tIQ?=
 =?us-ascii?Q?tlC4MEfulpIcMlpUqtyqDS7g60eUfToZrpTM4JtfuDrD7LSFjQYK2j6u78y7?=
 =?us-ascii?Q?Hb7W39R2mGtluphMVZWIq46mVIeUyhhO2eVtBDbIX9KPgREMiVuNTYfkLmyl?=
 =?us-ascii?Q?mqvKiQ2g4443C88CLqkfaUg23OmKgri2x0yZE0++j2j7fE23o+fuskSD5e3o?=
 =?us-ascii?Q?2Bdq9sKI3Jca3Tav6wowDEYnKYL7W3yLqy/hI7Sbr8fsJSbRwfFTwZclszhe?=
 =?us-ascii?Q?0X+ly7EDO8OAUuYY4KMDkVUU/P2FeQ/1jF/mniiSj1akloP1fcJZ6JB+GePC?=
 =?us-ascii?Q?z0+CmQ6+nB3vE0HyX2t9mowxRa29pcbXLZdgnFkeJovAz6zF/SOGRqL11Dyc?=
 =?us-ascii?Q?QKfJDI86JTv4Y/cE8LKv1nsRlUy0bfLnTrBYf7EwVwh73F5yGesCodppRjfn?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c9b0d7d-04ea-412e-61de-08dd578827aa
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 23:40:45.1090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: audbMEDaag+nbjKHtZe3XhyG8WHIYJ9CTVm435+m489fv+p7S+9ybdCaOidNwwkHSD7BUvTuxiSG2Lw62hmUwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7126
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

On Thu, Feb 27, 2025 at 11:09:51AM -0500, Oak Zeng wrote:
> When a vm runs under fault mode, if scratch page is enabled, we need
> to clear the scratch page mapping on vm_bind for the vm_bind address
> range. Under fault mode, we depend on recoverable page fault to
> establish mapping in page table. If scratch page is not cleared, GPU
> access of address won't cause page fault because it always hits the
> existing scratch page mapping.
> 
> When vm_bind with IMMEDIATE flag, there is no need of clearing as
> immediate bind can overwrite the scratch page mapping.
> 
> So far only is xe2 and xe3 products are allowed to enable scratch page
> under fault mode. On other platform we don't allow scratch page under
> fault mode, so no need of such clearing.
> 
> v2: Rework vm_bind pipeline to clear scratch page mapping. This is similar
> to a map operation, with the exception that PTEs are cleared instead of
> pointing to valid physical pages. (Matt, Thomas)
> 
> TLB invalidation is needed after clear scratch page mapping as larger
> scratch page mapping could be backed by physical page and cached in
> TLB. (Matt, Thomas)
> 
> v3: Fix the case of clearing huge pte (Thomas)
> 
> Improve commit message (Thomas)
> 
> v4: TLB invalidation on all LR cases, not only the clear on bind
> cases (Thomas)
> 
> v5: Misc cosmetic changes (Matt)
>     Drop pt_update_ops.invalidate_on_bind. Directly wire
>     xe_vma_op.map.invalidata_on_bind to bind_op_prepare/commit (Matt)
> 
> v6: checkpatch fix (Matt)
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c       | 93 ++++++++++++++++++++------------
>  drivers/gpu/drm/xe/xe_vm.c       | 29 ++++++++--
>  drivers/gpu/drm/xe/xe_vm_types.h |  2 +
>  3 files changed, 87 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 1ddcc7e79a93..4e16df96f3e4 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -268,6 +268,8 @@ struct xe_pt_stage_bind_walk {
>  	 * granularity.
>  	 */
>  	bool needs_64K;
> +	/* @clear_pt: clear page table entries during the bind walk */
> +	bool clear_pt;
>  	/**
>  	 * @vma: VMA being mapped
>  	 */
> @@ -415,6 +417,10 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
>  	if (xe_vma_is_null(xe_walk->vma))
>  		return true;
>  
> +	/* if we are clearing page table, no dma addresses*/
> +	if (xe_walk->clear_pt)
> +		return true;
> +
>  	/* Is the DMA address huge PTE size aligned? */
>  	size = next - addr;
>  	dma = addr - xe_walk->va_curs_start + xe_res_dma(xe_walk->curs);
> @@ -497,21 +503,27 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  
>  		XE_WARN_ON(xe_walk->va_curs_start != addr);
>  
> -		pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
> -						 xe_res_dma(curs) + xe_walk->dma_offset,
> -						 xe_walk->vma, pat_index, level);
> -		pte |= xe_walk->default_pte;
> +		if (xe_walk->clear_pt) {
> +			pte = 0;
> +		} else {
> +			pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
> +							 xe_res_dma(curs) +
> +							 xe_walk->dma_offset,
> +							 xe_walk->vma,
> +							 pat_index, level);
> +			pte |= xe_walk->default_pte;
>  
> -		/*
> -		 * Set the XE_PTE_PS64 hint if possible, otherwise if
> -		 * this device *requires* 64K PTE size for VRAM, fail.
> -		 */
> -		if (level == 0 && !xe_parent->is_compact) {
> -			if (xe_pt_is_pte_ps64K(addr, next, xe_walk)) {
> -				xe_walk->vma->gpuva.flags |= XE_VMA_PTE_64K;
> -				pte |= XE_PTE_PS64;
> -			} else if (XE_WARN_ON(xe_walk->needs_64K)) {
> -				return -EINVAL;
> +			/*
> +			 * Set the XE_PTE_PS64 hint if possible, otherwise if
> +			 * this device *requires* 64K PTE size for VRAM, fail.
> +			 */
> +			if (level == 0 && !xe_parent->is_compact) {
> +				if (xe_pt_is_pte_ps64K(addr, next, xe_walk)) {
> +					xe_walk->vma->gpuva.flags |= XE_VMA_PTE_64K;
> +					pte |= XE_PTE_PS64;
> +				} else if (XE_WARN_ON(xe_walk->needs_64K)) {
> +					return -EINVAL;
> +				}
>  			}
>  		}
>  
> @@ -519,7 +531,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  		if (unlikely(ret))
>  			return ret;
>  
> -		if (!is_null)
> +		if (!is_null && !xe_walk->clear_pt)
>  			xe_res_next(curs, next - addr);
>  		xe_walk->va_curs_start = next;
>  		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K << level);
> @@ -590,6 +602,7 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
>   * @entries: Storage for the update entries used for connecting the tree to
>   * the main tree at commit time.
>   * @num_entries: On output contains the number of @entries used.
> + * @clear_pt: Clear the page table entries.
>   *
>   * This function builds a disconnected page-table tree for a given address
>   * range. The tree is connected to the main vm tree for the gpu using
> @@ -602,7 +615,8 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
>   */
>  static int
>  xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> -		 struct xe_vm_pgtable_update *entries, u32 *num_entries)
> +		 struct xe_vm_pgtable_update *entries,
> +		 u32 *num_entries, bool clear_pt)
>  {
>  	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_bo *bo = xe_vma_bo(vma);
> @@ -622,10 +636,14 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  		.vma = vma,
>  		.wupd.entries = entries,
>  		.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAG_64K) && is_devmem,
> +		.clear_pt = clear_pt,
>  	};
>  	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
>  	int ret;
>  
> +	if (clear_pt)
> +		goto walk_pt;
> +
>  	/**
>  	 * Default atomic expectations for different allocation scenarios are as follows:
>  	 *
> @@ -685,6 +703,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  		curs.size = xe_vma_size(vma);
>  	}
>  
> +walk_pt:
>  	ret = xe_pt_walk_range(&pt->base, pt->level, xe_vma_start(vma),
>  			       xe_vma_end(vma), &xe_walk.base);
>  
> @@ -981,12 +1000,14 @@ static void xe_pt_free_bind(struct xe_vm_pgtable_update *entries,
>  
>  static int
>  xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
> -		   struct xe_vm_pgtable_update *entries, u32 *num_entries)
> +		   struct xe_vm_pgtable_update *entries,
> +		   u32 *num_entries, bool invalidate_on_bind)
>  {
>  	int err;
>  
>  	*num_entries = 0;
> -	err = xe_pt_stage_bind(tile, vma, entries, num_entries);
> +	err = xe_pt_stage_bind(tile, vma, entries, num_entries,
> +			       invalidate_on_bind);
>  	if (!err)
>  		xe_tile_assert(tile, *num_entries);
>  
> @@ -1640,7 +1661,7 @@ static int vma_reserve_fences(struct xe_device *xe, struct xe_vma *vma)
>  
>  static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
>  			   struct xe_vm_pgtable_update_ops *pt_update_ops,
> -			   struct xe_vma *vma)
> +			   struct xe_vma *vma, bool invalidate_on_bind)
>  {
>  	u32 current_op = pt_update_ops->current_op;
>  	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
> @@ -1661,7 +1682,7 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
>  		return err;
>  
>  	err = xe_pt_prepare_bind(tile, vma, pt_op->entries,
> -				 &pt_op->num_entries);
> +				 &pt_op->num_entries, invalidate_on_bind);
>  	if (!err) {
>  		xe_tile_assert(tile, pt_op->num_entries <=
>  			       ARRAY_SIZE(pt_op->entries));
> @@ -1681,11 +1702,11 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
>  		 * If !rebind, and scratch enabled VMs, there is a chance the scratch
>  		 * PTE is already cached in the TLB so it needs to be invalidated.
>  		 * On !LR VMs this is done in the ring ops preceding a batch, but on
> -		 * non-faulting LR, in particular on user-space batch buffer chaining,
> -		 * it needs to be done here.
> +		 * LR, in particular on user-space batch buffer chaining, it needs to
> +		 * be done here.
>  		 */
>  		if ((!pt_op->rebind && xe_vm_has_scratch(vm) &&
> -		     xe_vm_in_preempt_fence_mode(vm)))
> +		     xe_vm_in_lr_mode(vm)))
>  			pt_update_ops->needs_invalidation = true;
>  		else if (pt_op->rebind && !xe_vm_in_lr_mode(vm))
>  			/* We bump also if batch_invalidate_tlb is true */
> @@ -1759,10 +1780,12 @@ static int op_prepare(struct xe_vm *vm,
>  
>  	switch (op->base.op) {
>  	case DRM_GPUVA_OP_MAP:
> -		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> +		if (!op->map.immediate && xe_vm_in_fault_mode(vm) &&
> +		    !op->map.invalidate_on_bind)
>  			break;
>  
> -		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma);
> +		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma,
> +				      op->map.invalidate_on_bind);
>  		pt_update_ops->wait_vm_kernel = true;
>  		break;
>  	case DRM_GPUVA_OP_REMAP:
> @@ -1771,12 +1794,12 @@ static int op_prepare(struct xe_vm *vm,
>  
>  		if (!err && op->remap.prev) {
>  			err = bind_op_prepare(vm, tile, pt_update_ops,
> -					      op->remap.prev);
> +					      op->remap.prev, false);
>  			pt_update_ops->wait_vm_bookkeep = true;
>  		}
>  		if (!err && op->remap.next) {
>  			err = bind_op_prepare(vm, tile, pt_update_ops,
> -					      op->remap.next);
> +					      op->remap.next, false);
>  			pt_update_ops->wait_vm_bookkeep = true;
>  		}
>  		break;
> @@ -1786,7 +1809,8 @@ static int op_prepare(struct xe_vm *vm,
>  		break;
>  	case DRM_GPUVA_OP_PREFETCH:
>  		err = bind_op_prepare(vm, tile, pt_update_ops,
> -				      gpuva_to_vma(op->base.prefetch.va));
> +				      gpuva_to_vma(op->base.prefetch.va),
> +				      false);
>  		pt_update_ops->wait_vm_kernel = true;
>  		break;
>  	default:
> @@ -1856,7 +1880,7 @@ ALLOW_ERROR_INJECTION(xe_pt_update_ops_prepare, ERRNO);
>  static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>  			   struct xe_vm_pgtable_update_ops *pt_update_ops,
>  			   struct xe_vma *vma, struct dma_fence *fence,
> -			   struct dma_fence *fence2)
> +			   struct dma_fence *fence2, bool invalidate_on_bind)
>  {
>  	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
>  		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
> @@ -1871,6 +1895,8 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
>  	}
>  	vma->tile_present |= BIT(tile->id);
>  	vma->tile_staged &= ~BIT(tile->id);
> +	if (invalidate_on_bind)
> +		vma->tile_invalidated |= BIT(tile->id);
>  	if (xe_vma_is_userptr(vma)) {
>  		lockdep_assert_held_read(&vm->userptr.notifier_lock);
>  		to_userptr_vma(vma)->userptr.initial_bind = true;
> @@ -1929,7 +1955,7 @@ static void op_commit(struct xe_vm *vm,
>  			break;
>  
>  		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence,
> -			       fence2);
> +			       fence2, op->map.invalidate_on_bind);
>  		break;
>  	case DRM_GPUVA_OP_REMAP:
>  		unbind_op_commit(vm, tile, pt_update_ops,
> @@ -1938,10 +1964,10 @@ static void op_commit(struct xe_vm *vm,
>  
>  		if (op->remap.prev)
>  			bind_op_commit(vm, tile, pt_update_ops, op->remap.prev,
> -				       fence, fence2);
> +				       fence, fence2, false);
>  		if (op->remap.next)
>  			bind_op_commit(vm, tile, pt_update_ops, op->remap.next,
> -				       fence, fence2);
> +				       fence, fence2, false);
>  		break;
>  	case DRM_GPUVA_OP_UNMAP:
>  		unbind_op_commit(vm, tile, pt_update_ops,
> @@ -1949,7 +1975,8 @@ static void op_commit(struct xe_vm *vm,
>  		break;
>  	case DRM_GPUVA_OP_PREFETCH:
>  		bind_op_commit(vm, tile, pt_update_ops,
> -			       gpuva_to_vma(op->base.prefetch.va), fence, fence2);
> +			       gpuva_to_vma(op->base.prefetch.va), fence,
> +			       fence2, false);
>  		break;
>  	default:
>  		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 996000f2424e..6f50394dd877 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1946,6 +1946,23 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
>  }
>  #endif
>  
> +static bool __xe_vm_needs_clear_scratch_pages(struct xe_vm *vm, u32 bind_flags)
> +{
> +	if (!xe_vm_in_fault_mode(vm))
> +		return false;
> +
> +	if (!vm->xe->info.needs_scratch)
> +		return false;

Missed this in the previous rev, I don't think the above if statement is
needed. We only care about if a VM is in fault mode and scrach is
enabled, not whether the platform should or should not have this enabled.

Matt

> +
> +	if (!xe_vm_has_scratch(vm))
> +		return false;
> +
> +	if (bind_flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE)
> +		return false;
> +
> +	return true;
> +}
> +
>  /*
>   * Create operations list from IOCTL arguments, setup operations fields so parse
>   * and commit steps are decoupled from IOCTL arguments. This step can fail.
> @@ -2016,6 +2033,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
>  			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
>  			op->map.pat_index = pat_index;
> +			op->map.invalidate_on_bind =
> +				__xe_vm_needs_clear_scratch_pages(vm, flags);
>  		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
>  			op->prefetch.region = prefetch_region;
>  		}
> @@ -2213,7 +2232,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  				return PTR_ERR(vma);
>  
>  			op->map.vma = vma;
> -			if (op->map.immediate || !xe_vm_in_fault_mode(vm))
> +			if (op->map.immediate || !xe_vm_in_fault_mode(vm) ||
> +			    op->map.invalidate_on_bind)
>  				xe_vma_ops_incr_pt_update_ops(vops,
>  							      op->tile_mask);
>  			break;
> @@ -2441,9 +2461,10 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  
>  	switch (op->base.op) {
>  	case DRM_GPUVA_OP_MAP:
> -		err = vma_lock_and_validate(exec, op->map.vma,
> -					    !xe_vm_in_fault_mode(vm) ||
> -					    op->map.immediate);
> +		if (!op->map.invalidate_on_bind)
> +			err = vma_lock_and_validate(exec, op->map.vma,
> +						    !xe_vm_in_fault_mode(vm) ||
> +						    op->map.immediate);
>  		break;
>  	case DRM_GPUVA_OP_REMAP:
>  		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 52467b9b5348..dace04f4ea5e 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -297,6 +297,8 @@ struct xe_vma_op_map {
>  	bool is_null;
>  	/** @dumpable: whether BO is dumped on GPU hang */
>  	bool dumpable;
> +	/** @invalidate: invalidate the VMA before bind */
> +	bool invalidate_on_bind;
>  	/** @pat_index: The pat index to use for this operation. */
>  	u16 pat_index;
>  };
> -- 
> 2.26.3
> 
