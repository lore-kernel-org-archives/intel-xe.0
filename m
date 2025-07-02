Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5495C8303C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 23:14:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC5410E0D0;
	Wed,  2 Jul 2025 23:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eSdyz0Lm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 603DB10E0D0
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 23:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751498091; x=1783034091;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=hxhQ0a5plC/gVOU6eWjrREBU6MC1IxEfZcxzGxSMXfo=;
 b=eSdyz0LmT3YSV9THvMeRq2fv4o3arvA9N4k58ak01caZjx1pDG7oE86D
 6VtUgt7whoYnAkB0u19l7m2XvJqoAsMoWXtdcll2zm64oMTkVYgKc6Bt0
 6H828gYFVCFa7SQwEbrbAssK7hymiRxFB4y07UqdDe6EKkuLk6GNpwc+Y
 QMFcMP82fcTtXo1YoAtDHL0V34ZyOGFPAIAx35ktLW0OQJpcx3I6Y70IL
 DBUTqbe3ZolyYB7+WvsUAzmODzS4Eyr+E9q9+d5E6ckczV54N6nh7Qcq8
 sqE2TC0cvu3dUEEjC81+ug9xRYfh5Z9fqUHW6mr5RiSFdd5wwZ4MsjTGt A==;
X-CSE-ConnectionGUID: C31r+bWDQLql1x7u1WaWBw==
X-CSE-MsgGUID: l6atDBOJSD2lAnL0td3fVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53955820"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="53955820"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 16:14:51 -0700
X-CSE-ConnectionGUID: /FL5erUQR12AzOUeheQ/Sw==
X-CSE-MsgGUID: aFks8xABQpWn0ab28wD9Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="154701535"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 16:14:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 16:14:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 16:14:50 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.69)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 16:14:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/nHsiHr+DDEX2YiwNHsezjSOE2E3KQ8DErA4UqMkrNNWPUWp9S5HiwtghZKaDXlmACTV9gAKr2GhgQDonNpacFiX1Iej+QKuQXQs/BK824UVsdtNgRvQ05y/gHcC/6ivuS+WbCiSQWIbBO5TAk8xLaRi0YrHMlUgh4XmbWzYvuLpyRVbvA5Yk3TeCZpfwdo0tSNh/f23Ng5CgwR/Hk4oH6Bbz6ua9YF5rdyRJXPjZafceSSNHOZo37w0XP8QkSgjF5+k0r0IP/9bI5+8etNHSYIh5uc82TFokVrHSji395C6nfQMqgKOuS13JKiAgHh754MTMa/rK5pgfpHMb41/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbZpgO7kkZECS6DmszhDjmRpkSO7maVY41GPlwbKPQY=;
 b=o00Vw4jfZlILJuzo4xLQRh1jp1V+pDrJsDI38/gGg9NZgkQVMRDF/9h95YrhhStJyhLCogUQiamGUrEdj6BEkNMe3Io0k62q9RbASr1pA9nwjSaCi9DCfQf9/taX8RWEodg/dlzdfsFgj6xZBQufU+A+cfGESt9lzin0t1S+Nl/u7IuqHrgoVbiZgEoeqE7zTyMh+Xge5Pa51NSIOVmToVxHscMp0EnbkPOZPYb4fPNZq+Ni9kUGUiU6Lk4AyYJjw7IK/in8DXzwUTmSXR6RQLG0zptrM7V4YpXnrf2/XzHkEnW3rzsJip1EJ+dytaED8+5iiUzG1sAA3YH6m+xpzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB7696.namprd11.prod.outlook.com (2603:10b6:208:403::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 23:14:28 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8880.030; Wed, 2 Jul 2025
 23:14:28 +0000
Date: Wed, 2 Jul 2025 16:14:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?= =?utf-8?Q?re?= for
 Future-proof for multi-tile + multi-GT cases (rev4)
Message-ID: <20250702231426.GG1204996@mdroper-desk1.amr.corp.intel.com>
References: <20250630173438.2342706-8-matthew.d.roper@intel.com>
 <175149611152.129624.2249927135641139129@1538d3639d33>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <175149611152.129624.2249927135641139129@1538d3639d33>
X-ClientProxiedBy: SJ0PR03CA0377.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: 35f0f9da-8153-47fe-37d3-08ddb9be3195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pXUqQoO2QjvrmMrZiOnz5aNvwvBJ2Jt73E8N6SsSpqqptpK5+Hhcu+rLZPUJ?=
 =?us-ascii?Q?PeaECgweFb/+i1p+2cjpvx0euPFsAULv4oXCxlk1SBWLC048taFO/kqP66Ul?=
 =?us-ascii?Q?GDdfSjDc9oRBQmazKfSe0Usj6B2IzzTcvnJ60KL9wvQYQhIBTof9bzYx4Fgd?=
 =?us-ascii?Q?2zrr4nrjloDObuP/AAEfLd2MmDIwQYlrMdMz1I28qRPJTHRaUyaMq7XIyqQt?=
 =?us-ascii?Q?Eu+7+qqO8GNafwdk2TYoQgTF65UMPnnJcx+FHQZmIzxzE3zLLAk75GDVu0IF?=
 =?us-ascii?Q?o1lxIuxLz0/PEStVt42mx+ElJGvleTIUtKbFy9I3HiLcV+DKMg563KlgE1jj?=
 =?us-ascii?Q?CKHTvo+L/FXJ6eOkvKhaRiww1nR5R34s9EFd360iaQKLdqG+s1gVDxZsYl8h?=
 =?us-ascii?Q?sDLXNTeaguCDNMVJv9KZLMVlLL3MluwkcMUMByL+gSjkWSDwzwjiCSaC68NK?=
 =?us-ascii?Q?DRsw2XSp+BHSf+HijTO/udOHZg/6m4nKrXs/cu68CXHhviJeiJZaKWSNr6qT?=
 =?us-ascii?Q?asDK4ZueZMtLDjQlWkghQvd6Zk8CR8W3MTCqvw4TTccqCDrV9WLSUvPfkCIZ?=
 =?us-ascii?Q?um8Qs3ZQGN+UkqjAN4S9eJ/vt2d76bJGijAh1xZaUp0R6rypDtWGYfLlHhJM?=
 =?us-ascii?Q?Enrz2PSRbi3YFkzLZuDrrsB/7Ym9Nxu6/3loYQVD9TqxsDAIRZy9kdqbUS6F?=
 =?us-ascii?Q?woklqIV/SRAFgkNe6oQiFZWNdJJ7SoZ4CoaXLdJJ4XshPG+ej+i7HYYr6PbJ?=
 =?us-ascii?Q?1LRhOJEqPsvhY2TWtBlVRCuZFHnfrZy6zHFH62TTYZPJmRKPgn5Lqt11J433?=
 =?us-ascii?Q?trCrUjNi/cWA9JlaZcDEIh6uUMU9sG5CHYKMBs7DnkPrs68CH+131CNfRc+l?=
 =?us-ascii?Q?lNGkx5L4IgbwgzmN0PDk6Tplf7BnpSlM+c5cRy2spNC+ntNgbTjUNTMLI42A?=
 =?us-ascii?Q?+XhTQzlRY8nAzIya/fySZlxYfsflEN1FyeHnOzD11eK5uDVIRhAFvqfDaIFF?=
 =?us-ascii?Q?e4dOH6fGx4ayChFxEpeBCfK3Tf9+aH724E4oA0gRCDQ6YibbJeoWCLYJGJ07?=
 =?us-ascii?Q?diHVtJa2Yy3xrEpE6ONaAyoIQlxpOXx2OSxSem51H2vg435d2egwYLx90zYz?=
 =?us-ascii?Q?4a4RczKc4GdY6jpLhFLIpXkYL6sRTHiOdl9llOKZWvDMFaHubPywlJsbQSuT?=
 =?us-ascii?Q?Az8APQ4U0XF4e1kR8KuEqJhHQ8rxdtwn5uwyUBGeuFvfY0KrDCj62jbLC8qs?=
 =?us-ascii?Q?BLmIYTF4oaf3tlGegABNyPZtJpox6NNax152BTxNzQSxqUBWPfP6PFR+ZP0/?=
 =?us-ascii?Q?qyRlhzSO/5XdGpQEPLR8g3ybYYuC83C6idhQqQQQ3hPUMmvoy4oVb7L71lU8?=
 =?us-ascii?Q?L9RJGcI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YJRXo/1veAtmtf8e0PQxX1E7ErA5alQ2FduMyI8ieEON09Da8taEDIJYQcgE?=
 =?us-ascii?Q?9zE/LB6Y0KUY8/kFnNUnTdj1jvauppQAp8+UcDXMNzRO21z9bbO9k2GCk0kP?=
 =?us-ascii?Q?DiAGEeWEfN7BExPmjmltCm14C/yVyYUBaRe7S3C/xsMa4q/WDnG//TUxFroC?=
 =?us-ascii?Q?LvcyM0H4MmPkAZhPsurx8V3sxtyatwttROubrpIbmWF/d54J5XJYMpzPEmc6?=
 =?us-ascii?Q?/BuaK4/7c3EZx5VCnODo1JC2Aq+Eddit1Kz4EXgSkkV0z795tIdl3S5sJGzD?=
 =?us-ascii?Q?zpOABKJctIfL3l4nhu4K8GGAiDZruRuI6djkHSru81VL2KTQF1sIqRRR5Jt+?=
 =?us-ascii?Q?4+wPVF+k470BmlMUa2BtauSI2ba1nV8Aq1yPWd4Os28aqcPjcMGjxuFLzw1X?=
 =?us-ascii?Q?m9ecbNHYnm72zFUZd3yGmQPsh6yrh/FAI36BoCv52rjnN0/LS07/JwC5QDVJ?=
 =?us-ascii?Q?iJBEOr0902+ZXECEd9ibql+X99hhhvmv6F3rK47I/p8mghKD6M6pO6rjb7pr?=
 =?us-ascii?Q?MX8VR1h695Nbx0zg3pd5LmQ0X964OjasIBVH+g6QHJNex3iKxc/FHgvmCWDP?=
 =?us-ascii?Q?NNqq+rCKM4tszbiPy7rbi4pbFyX8dCFanhF7/mhaRQyOAVXYBkoxWWSRLtAU?=
 =?us-ascii?Q?Klj+LkRGAwjnnjkl8Q8NZoMpOUsXgYNOW3zeNwS3r3LcJN0hNdfdAix5a9DC?=
 =?us-ascii?Q?eLnSIhDE2G8BgBu3GPcYFiX8mYBvsP571GN6+SLmy6wwVwhYfOTOLD335sRX?=
 =?us-ascii?Q?ab34fLOmVRnmSLi0XpRLc+YunGSh7Kt4f6NmTLY7bD50Ss/Fw0J1KWCOiUoG?=
 =?us-ascii?Q?e0wm9dL5+LY+Ncjzkwo6HYSt9CdtZC8a8xG2dxGV/PsX8vIvddLBYqOT15EZ?=
 =?us-ascii?Q?J2kZfHfsraDSt5r6/KMAm62SaYkDJAdFATF42Ma9ph/GWoRViEUdlNBctfN3?=
 =?us-ascii?Q?N0ZWWX7fLdNLkRBoT7xiDLy2fkB8F+NWkcmRBTvN4itCdB7toSpvwUfcTPlg?=
 =?us-ascii?Q?UiW1Ulita1jTzDTeRButnh8lDKJ6Jt57XYPSwdTqCLaDi8yo/YQp5BZ+5Yh9?=
 =?us-ascii?Q?rV2CQyp2L6m3UjY0aRJ/krYmgrCx002/sA9+ldWt7yoVKb2QLwKA23pkNtCg?=
 =?us-ascii?Q?GdFU1d33lsvKA/yfGH4A6PuVfXXgbR+UjKZwgEDP9F2hC86wAVa6Q2izKr5K?=
 =?us-ascii?Q?CtF6A7O9dyPdBs5EEBGHaySNL0KnhfjjxPWVFZuunVNHw7FnORQ8M2pHwHhJ?=
 =?us-ascii?Q?HsPkp1ZsrXZid0FZpGGfP3iNAsYkvVDGcsUR/2eC0+yVwVNo+iPijk1ovaN4?=
 =?us-ascii?Q?j4MjYL8w+QabLVb63b1vPaLXM8pboFPCLfoco0VUu1RfBXtk5/H/O5npkfSG?=
 =?us-ascii?Q?1BBFnaqkp9BIpxXyRXm0Eul4Kl7ksf2WNwXUX5yNKWREALIstuqUsG4METX8?=
 =?us-ascii?Q?RJpwgRenT+p0KOEoMmQDX8DNhIAtKx5vQ2YpE+K4M10OxKfZbSDZFC33qWKQ?=
 =?us-ascii?Q?LiXsi4I8Iw62QHo1BBv6HjsOPWjVTiw6jx4uOFd9czKDwemsKzRuoSZR/L1X?=
 =?us-ascii?Q?tkUueWTfi3DVfxrWIKRcVimmDhGEIfm2AwRYrUu1Rr7nLJXT89t6rKteAbM/?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f0f9da-8153-47fe-37d3-08ddb9be3195
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 23:14:28.4821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2DOrdjQC7a64uwIR0qLZ2t4Qs/bWppdoltHGLnHiDij5GHawgH0TkgZwgRhsr9eNHnIJLrLRS2PqQPsi9I6HlwBrtxVGeaS5WyJjuag7Ek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7696
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

On Wed, Jul 02, 2025 at 10:41:51PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Future-proof for multi-tile + multi-GT cases (rev4)
> URL   : https://patchwork.freedesktop.org/series/150192/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8_FULL -> xe-pw-150192v4_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-150192v4_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-150192v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-150192v4_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap:
>     - shard-bmg:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap.html

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5058

> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset:
>     - shard-lnl:          [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset.html

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5165

> 
>   * igt@xe_gt_freq@freq_suspend:
>     - shard-bmg:          [PASS][5] -> [INCOMPLETE][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@xe_gt_freq@freq_suspend.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@xe_gt_freq@freq_suspend.html

System never came back from suspend.

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4620 covered this,
but it was closed as 'cannot_reproduce' a couple weeks ago.


Patches 2-7 applied to drm-xe-next, and
https://patchwork.freedesktop.org/series/150943/ , which is equivalent
to my patch #1, applied after them as discussed on the email threads.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-150192v4_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@invalid-async-flip-atomic:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#3768])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_async_flips@invalid-async-flip-atomic.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
>     - shard-adlp:         [PASS][8] -> [FAIL][9] ([Intel XE#3908]) +1 other test fail
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1124]) +1 other test skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#316])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
>     - shard-lnl:          [PASS][12] -> [ABORT][13] ([Intel XE#4760])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-lnl-4/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-lnl-4/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][14] ([Intel XE#4543]) +1 other test dmesg-fail
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1124]) +2 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#367])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#367])
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2887])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#2907])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#787]) +11 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][22] ([Intel XE#3862]) +1 other test incomplete
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#787]) +76 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [PASS][26] -> [INCOMPLETE][27] ([Intel XE#1727] / [Intel XE#3113])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-2:
>     - shard-dg2-set2:     [PASS][28] -> [INCOMPLETE][29] ([Intel XE#3113])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-2.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-2.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2724])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_frames@dp-crc-fast:
>     - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2252])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_chamelium_frames@dp-crc-fast.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#373]) +2 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
> 
>   * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][33] ([Intel XE#1178]) +1 other test fail
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x10:
>     - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#455])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_cursor_crc@cursor-offscreen-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#308]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#2291]) +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>     - shard-bmg:          [PASS][38] -> [DMESG-WARN][39] ([Intel XE#5354])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#309])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1135])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check:
>     - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#2316])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check.html
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank:
>     - shard-adlp:         [PASS][44] -> [FAIL][45] ([Intel XE#3098]) +1 other test fail
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-adlp-8/igt@kms_flip@basic-flip-vs-wf_vblank.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-3/igt@kms_flip@basic-flip-vs-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>     - shard-lnl:          [PASS][46] -> [FAIL][47] ([Intel XE#301]) +1 other test fail
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> 
>   * igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:
>     - shard-adlp:         [PASS][48] -> [DMESG-WARN][49] ([Intel XE#4543]) +4 other tests dmesg-warn
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-adlp-6/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-dg2-set2:     [PASS][50] -> [INCOMPLETE][51] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@plain-flip-ts-check:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][52] ([Intel XE#4543]) +4 other tests dmesg-warn
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_flip@plain-flip-ts-check.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
>     - shard-adlp:         NOTRUN -> [DMESG-FAIL][53] ([Intel XE#4543] / [Intel XE#4921]) +1 other test dmesg-fail
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling:
>     - shard-adlp:         [PASS][54] -> [DMESG-FAIL][55] ([Intel XE#4543]) +1 other test dmesg-fail
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2311]) +2 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
>     - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#651])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#651]) +5 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#653]) +2 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#656]) +2 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2313]) +2 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#653]) +5 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2486])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_pm_backlight@brightness-with-dpms:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#2938])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>   * igt@kms_pm_rpm@legacy-planes-dpms@plane-73:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][65] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_pm_rpm@legacy-planes-dpms@plane-73.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
>     - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#1489]) +1 other test skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#1489]) +2 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
>     - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1489])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
> 
>   * igt@kms_psr@pr-sprite-plane-onoff:
>     - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_psr@pr-sprite-plane-onoff.html
> 
>   * igt@kms_psr@psr2-sprite-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_psr@psr2-sprite-blt.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#3414])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1127])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_setmode@clone-exclusive-crtc:
>     - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#1435]) +1 other test skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-7/igt@kms_setmode@clone-exclusive-crtc.html
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
> 
>   * igt@xe_eudebug@basic-vm-access-parameters-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#4837]) +1 other test skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@xe_eudebug@basic-vm-access-parameters-userptr.html
> 
>   * igt@xe_eudebug_online@pagefault-read:
>     - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#4837]) +1 other test skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@xe_eudebug_online@pagefault-read.html
> 
>   * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#4837]) +2 other tests skip
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
>     - shard-dg2-set2:     [PASS][78] -> [SKIP][79] ([Intel XE#1392]) +1 other test skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
>     - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1392])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
>     - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2322])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html
> 
>   * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
>     - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#288]) +1 other test skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html
> 
>   * igt@xe_exec_fault_mode@once-userptr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#288]) +4 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@xe_exec_fault_mode@once-userptr.html
> 
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - shard-bmg:          [PASS][84] -> [DMESG-WARN][85] ([Intel XE#3876])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-8/igt@xe_exec_reset@parallel-gt-reset.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-8/igt@xe_exec_reset@parallel-gt-reset.html
> 
>   * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap:
>     - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#4915]) +36 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap.html
> 
>   * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#4915]) +53 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html
> 
>   * igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
>     - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#4943]) +3 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html
> 
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>     - shard-adlp:         NOTRUN -> [ABORT][89] ([Intel XE#4917])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> 
>   * igt@xe_huc_copy@huc_copy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#255])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@xe_huc_copy@huc_copy.html
> 
>   * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
>     - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#2541] / [Intel XE#3573])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
> 
>   * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][92] ([Intel XE#1173])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-463/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html
> 
>   * igt@xe_pm@s4-mocs:
>     - shard-bmg:          [PASS][93] -> [ABORT][94] ([Intel XE#5255])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@xe_pm@s4-mocs.html
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@xe_pm@s4-mocs.html
> 
>   * igt@xe_query@multigpu-query-config:
>     - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#944])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-9/igt@xe_query@multigpu-query-config.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-guc:
>     - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#944])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-7/igt@xe_query@multigpu-query-uc-fw-version-guc.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
>     - shard-lnl:          [FAIL][97] ([Intel XE#911]) -> [PASS][98] +3 other tests pass
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
> 
>   * igt@kms_big_fb@linear-addfb:
>     - shard-dg2-set2:     [SKIP][99] ([Intel XE#4208]) -> [PASS][100] +2 other tests pass
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-434/igt@kms_big_fb@linear-addfb.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-436/igt@kms_big_fb@linear-addfb.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [DMESG-FAIL][101] ([Intel XE#4543]) -> [PASS][102] +1 other test pass
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>     - shard-bmg:          [SKIP][103] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][104]
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     [INCOMPLETE][105] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [PASS][106]
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
>     - shard-dg2-set2:     [INCOMPLETE][107] ([Intel XE#3124]) -> [PASS][108]
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [DMESG-WARN][109] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][110]
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>     - shard-bmg:          [SKIP][111] ([Intel XE#2291]) -> [PASS][112]
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-bmg:          [SKIP][113] ([Intel XE#4302]) -> [PASS][114]
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-bmg:          [SKIP][115] ([Intel XE#2316]) -> [PASS][116] +3 other tests pass
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
>     - shard-lnl:          [FAIL][117] ([Intel XE#301]) -> [PASS][118] +2 other tests pass
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     [SKIP][119] ([Intel XE#455]) -> [PASS][120]
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-436/igt@kms_hdr@invalid-hdr.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-bmg:          [SKIP][121] ([Intel XE#1503]) -> [PASS][122]
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_hdr@static-toggle.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_pm_rpm@basic-pci-d3-state:
>     - shard-dg2-set2:     [FAIL][123] ([Intel XE#4741]) -> [PASS][124]
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-435/igt@kms_pm_rpm@basic-pci-d3-state.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-436/igt@kms_pm_rpm@basic-pci-d3-state.html
> 
>   * igt@kms_setmode@basic@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][125] ([Intel XE#2883]) -> [PASS][126]
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-lnl-1/igt@kms_setmode@basic@pipe-a-edp-1.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-lnl-7/igt@kms_setmode@basic@pipe-a-edp-1.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
>     - shard-dg2-set2:     [SKIP][127] ([Intel XE#1392]) -> [PASS][128] +2 other tests pass
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
> 
>   * igt@xe_pm@s2idle-basic-exec:
>     - shard-adlp:         [DMESG-WARN][129] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][130] +7 other tests pass
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-adlp-6/igt@xe_pm@s2idle-basic-exec.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-adlp-8/igt@xe_pm@s2idle-basic-exec.html
> 
>   * igt@xe_pmu@gt-frequency:
>     - shard-dg2-set2:     [FAIL][131] ([Intel XE#4819]) -> [PASS][132] +1 other test pass
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-435/igt@xe_pmu@gt-frequency.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-463/igt@xe_pmu@gt-frequency.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][133] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][134] ([Intel XE#316])
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-270.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-270.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-bmg:          [FAIL][135] ([Intel XE#1178]) -> [SKIP][136] ([Intel XE#2341])
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-7/igt@kms_content_protection@srm.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@kms_content_protection@srm.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][137] ([Intel XE#2312]) -> [SKIP][138] ([Intel XE#2311]) +4 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
>     - shard-bmg:          [SKIP][139] ([Intel XE#4141]) -> [SKIP][140] ([Intel XE#2312]) +1 other test skip
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
>     - shard-bmg:          [SKIP][141] ([Intel XE#2312]) -> [SKIP][142] ([Intel XE#4141]) +2 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
>     - shard-bmg:          [SKIP][143] ([Intel XE#2311]) -> [SKIP][144] ([Intel XE#2312]) +3 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][145] ([Intel XE#2313]) -> [SKIP][146] ([Intel XE#2312]) +3 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:
>     - shard-bmg:          [SKIP][147] ([Intel XE#2312]) -> [SKIP][148] ([Intel XE#2313]) +4 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][149] ([Intel XE#4208]) -> [SKIP][150] ([Intel XE#653])
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html
> 
>   * igt@xe_exec_system_allocator@once-malloc-race:
>     - shard-dg2-set2:     [SKIP][151] ([Intel XE#4208]) -> [SKIP][152] ([Intel XE#4915]) +3 other tests skip
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-434/igt@xe_exec_system_allocator@once-malloc-race.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-436/igt@xe_exec_system_allocator@once-malloc-race.html
> 
>   * igt@xe_peer2peer@read:
>     - shard-dg2-set2:     [SKIP][153] ([Intel XE#1061]) -> [FAIL][154] ([Intel XE#1173])
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-432/igt@xe_peer2peer@read.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-463/igt@xe_peer2peer@read.html
> 
>   * igt@xe_pm_residency@cpg-basic:
>     - shard-dg2-set2:     [SKIP][155] ([Intel XE#4208]) -> [TIMEOUT][156] ([Intel XE#5328])
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8/shard-dg2-434/igt@xe_pm_residency@cpg-basic.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/shard-dg2-436/igt@xe_pm_residency@cpg-basic.html
> 
>   
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>   [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
>   [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
>   [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
>   [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
>   [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
>   [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
>   [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4741
>   [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
>   [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
>   [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5255
>   [Intel XE#5328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5328
>   [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8 -> xe-pw-150192v4
> 
>   IGT_8432: 4871829d8b7117553eb2dc1bdb9a0d18de428a98 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-3327-e6e27e79a726f8bf333d13521aba32f6466035a8: e6e27e79a726f8bf333d13521aba32f6466035a8
>   xe-pw-150192v4: 150192v4
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150192v4/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
