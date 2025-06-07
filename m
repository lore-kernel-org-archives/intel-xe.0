Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D50EC61CE8
	for <intel-xe@archiver.kernel.org>; Sat,  7 Jun 2025 05:10:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B8B10E484;
	Sat,  7 Jun 2025 05:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="heRvP1/S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F399910E484
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Jun 2025 05:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749273038; x=1780809038;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PBCu45l6pAZBW6y1MXipyOqANuRCXUR81pgRQh8fbz4=;
 b=heRvP1/ShbvfwVglWmyVRM8b3NG78IXs6aTiAGax3kq4FREK3QWfTzZ+
 BNzzITv5tkgOwQTc6ElZL99P2xoFzNxvKs32onYYvLin/8CxPRMTUj8aa
 FsyfEhuYz/bNY039SGbwCcHQWrhr2JNh2bGjQlaGDDDak1N/Ie1FmwAvQ
 /Iq5JVfjEiiW6519UqRu0L9sPHDr0j7BRTRbXDxc4cvuf4PGm0ejyDD8J
 tUNAs3eb8NVU6jf02gCvClI3RAVsYkH4OseHPM7D2OguaUCeVCUFDk332
 bW7jlXlOvHQ4HAA3UGXfNt2tiAP/D6i+KPDmNNbIcR7Yyx4epBpm8ITlf g==;
X-CSE-ConnectionGUID: 7HXIob2PS1CZB9JcdDlqdg==
X-CSE-MsgGUID: F9OJel6ZQZa1hrSfRqiiiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="73955241"
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; d="scan'208";a="73955241"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 22:10:38 -0700
X-CSE-ConnectionGUID: p58RPqRMTSuTRomgRbFq/g==
X-CSE-MsgGUID: KSm3biqHS9KfwOBgbIsidg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,217,1744095600"; d="scan'208";a="176953179"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 22:10:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 22:10:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 22:10:37 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.50)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 6 Jun 2025 22:10:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G46RoX/9iuyvJA4BN3fVj0y3BRwI3wVz9M5Yw+8ZWcKVvkOQBQHaPVC69qNliwjg0wUHCsaFjYVfzKHjkHVeDhE2JuEPyaf3TA/9F85wYN6puU2Nj8AnH+/3KYDNcEZ6kR6o4UhYXszW5hlMnc6HWqgrfELhBWh6s2n0C/G5L4FXYcnFOYXwwPTqjRRm+ThS8e8At4BidxkABx1qyWLsZNPFLwXE+w6AI4Tl+FiLGKRl5jVl89EhVsXWBYn1oHxW3SK4v+lDYByg3W2vq8RLNJ45DyqFdmT5kdcPlW+wvzd9U2JLCVGzIP+eyVQJBbjpk7e19FzB0n10B5TER6tLOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSYjDGZs9OmGf34dfFgWnUHpixZXHTdTVZMSK7D+f5g=;
 b=lxdxzTWv1k7xIX8Mi/viQ9STGD/GjylUf/DJ14hHrkFLdN+A6V+vLC4Kbhwkrp4nTgWVQ9UVPIo8lmoP/9YZXN9fG2PKS1I3f9KrXwAQKuFIamzTbjUp5vR9jeJpvZSv2D7ghBWvx9GluZJQX1OTHWNMrkbieOgim69fS8gMxk+GddVSkX9qIF4kRv8Vl3orInAQzq/yy8iaMa97+VtW4iD8EkxWYJQHDsu5thfDaIFdV0t9r2f7H2XyqbDevHjq2xnSrfC/9ATY43tnqZjDuN+bEWMqZYO2bnlNMGvpwcyhpA1irKqJh6bTdai/0AhAN8/CgI86gI+S/v9IajUqaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB8786.namprd11.prod.outlook.com (2603:10b6:208:59b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Sat, 7 Jun
 2025 05:10:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8813.020; Sat, 7 Jun 2025
 05:10:33 +0000
Date: Sat, 7 Jun 2025 00:10:29 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>, Zongyao Bai
 <zongyao.bai@intel.com>
Subject: Re: [PATCH] drm/xe/uapi: Correct sync type definition in comments
Message-ID: <vpqc2ekhmobylcprr7xhudmfgrxghsdttwbayw3liln4r5ctgm@lemzetwi4tg3>
References: <20250607023442.1236889-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250607023442.1236889-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: BYAPR08CA0039.namprd08.prod.outlook.com
 (2603:10b6:a03:117::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB8786:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dc06d3f-52dc-468a-ed3f-08dda581a10d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V71gl+usC2dijMqXWYN91SNW11NuTXf5cCWFH5QLonv0jd6ON95p/3sWWOqZ?=
 =?us-ascii?Q?2TWRwsnxtm9UhfckjKi9wXSwKfyunhGrK9+CJ+CV22CQCFgRcKvIcj6AxYBk?=
 =?us-ascii?Q?ufYFobQlO+PyBHxRAcOnt15siICTnBhu9cCvlZPCX4SkUptbKoW5iHmUnVDR?=
 =?us-ascii?Q?ekCq6rF1HxJ1rv9d1aMjKJoS1xfS0ZHBih+QzsEu6y1GanfEK7mZ4Ts0Zkfy?=
 =?us-ascii?Q?G7d+rW73xgLGrApHV3DKCPfJ9sEVUaYgKxvZ66FSZqh4T2T6yv+dzlEK7w3q?=
 =?us-ascii?Q?jr7kkaXjzkxVWZaCYYKByJ9MKHOXAlvz4CVOnX4mS6tmI1oqkP//v8Xn2eJl?=
 =?us-ascii?Q?6aBN9WEDJxJzIGwJ1aiv2QqsKm6vYJpxA6CRida0JO83iyuXtHMRewKJRCLS?=
 =?us-ascii?Q?zVjdIX0hCzLk+NtHWu3pY5SSTIIqJmAYdFFDrv80cf263VXe3niq2oXco8aV?=
 =?us-ascii?Q?f8qtHvmqrdj1swzNeylsnRQif1fmdlKyk6djn87I9mTQksPxa/C56YEIoYij?=
 =?us-ascii?Q?xcQJQC17XN7ylCBGwp1Xr/MePFnvb8kyHY1rF3U2Qq8Wqpp31TRDTOdvs96R?=
 =?us-ascii?Q?0nk67VOzWN5mod7Uec6BfoRR/Ug+0kEedan2N1UGJlpPljyX+QlHcD4sFL1N?=
 =?us-ascii?Q?INBTFvhwSaFTka3S2MY6vAapPxYXSkQOxnJ1+GWyMvVfdJzgfqAhmhXLxj0i?=
 =?us-ascii?Q?4OZ87Db33WHPbQhklqdb8KFOpeq+eo0vwIvoxCxCLzd240/f5uJtA5PbXc4/?=
 =?us-ascii?Q?rCS36Z+ThVXHUC3aab4dZ0zPsnO3+6xYkaWDffEKajgUkpVDuv31aT5Cx9dY?=
 =?us-ascii?Q?bixcJS6FTtgDmP/Aw0c4Oglhfut0D2U62sOhVj0FrmU9zgT0BGMJwjzjof9J?=
 =?us-ascii?Q?I7akO73dq+OcuC8IUHRiCHQjM1cAXTji4gcloX4xGB4BhhYyMIzklMtNUCmN?=
 =?us-ascii?Q?Wq2lBTsqQlosDI1vwZvlFG5QPK+ZpGxxllKIlddB2ScEEg1TRPvVYVR5rd/o?=
 =?us-ascii?Q?N2sOIpSz4+2/ZCY8j2usEJJnAz0Bs6+RewnusQtGbdIs67dD/eGT1I82DLqg?=
 =?us-ascii?Q?zAGqLYLukcVZ+UpsIl/Nbzt1T1dMQ2MY5/EoR5RkSyg2kogqG9j/AJHR4ZgQ?=
 =?us-ascii?Q?NYvD+1tWVYGyk4gJriRTBvRe7mt1acEq2cGi+zvG8qSMtTP02ZrB6U9bvce0?=
 =?us-ascii?Q?SNxgA9c2Hl21Hpzv5Xz1QE8R8pJwTcm/6+Io/+vgi7vQrXj8LfY9X1xS/LvJ?=
 =?us-ascii?Q?cbw2GAAFhfbV9c2FsV/z3ISJHODX+/D5lx2Rnxc5DR8mzswUtghhtmhXaG6Q?=
 =?us-ascii?Q?lso+If1LAZDMRFeIUN84+vLwkYiTz9caVeLAbS10wWFiybco063oyB3Ax/ca?=
 =?us-ascii?Q?tFAsLmEr6z4QZZw9CQGXuRhcUyvg15qkhcWABP2JBm9sse5+DusFwIpfHPSD?=
 =?us-ascii?Q?7eDXOcfaZ+A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1/8drvOVOGM87eFNA+Dv2+tQQVvyW3Ye/SwJ7IbhRsoZVxHy7s+wyABFh4Ap?=
 =?us-ascii?Q?fiqU2ZgGt8SXJpq+fvV2WUNTZIXNfJRaxFpxVmFXgXMgq3Q/8qKzcfLNEM3u?=
 =?us-ascii?Q?ui3wYEd5OZKjjliiN12iSBBCkCpea2JZK4I33i8bWDRcCgIzWvb70vnrT4Zu?=
 =?us-ascii?Q?kgTArR4lZLgWQKF923Q3x7jOjWuNxTmDZdJHVDRWITVOzQslEwS2rgg2AseZ?=
 =?us-ascii?Q?f4PMBqHiy+5fa5P77zj+8O7yw0G/1AB/0c4PIbwsxy0lxCSoqa6Pv07R6z43?=
 =?us-ascii?Q?w74gSxtbZoLTZdQYR3OWEXHbE/lq+dAqso4+W9l/QWwMWwzFcq2i2yP3/Gfp?=
 =?us-ascii?Q?pr7CNfqk7Bs70dPFhgjB+g7ZeOnBrdKcgScYh0Z19Rl+2fqu94Ygfw+IZSz4?=
 =?us-ascii?Q?tz1yAM+PUipyI+PM/l0uPKygXQmZSedXd4amtGAxnqRqfUlwG6sg+q3rv6+X?=
 =?us-ascii?Q?zeP4jRGoMyPLqGT3y91hk+v09ghp9vz4RA5SaiXZ+DOWt3/uLLJikdYwaIPt?=
 =?us-ascii?Q?05owak9KL9t3H7yLhR64Rli+sfCEbpRhdYPNBYWCXxHGXgItT7vR1AYOWhuw?=
 =?us-ascii?Q?FGkT/c8n/LBGCVCGBaETk8mUECh1DqYHgvBvmEVwG0qNORRG7zZuvcU2f085?=
 =?us-ascii?Q?oDesBMW3pPgXHgezyYCYZms5TSj+bAlefuMIu3yxGr0eoOb6CaN0THi6jw2s?=
 =?us-ascii?Q?XdrAlVY2VHZdG7Z290SG6I0XeJS5HZ5FvVfayneRF44Bk0CFMtvoeQv5fZRQ?=
 =?us-ascii?Q?9FPctKgIlF5NV+IMKlWLHBbIPOoBNBHRdKUfKznMzulBDrPWehDDkkxBawBl?=
 =?us-ascii?Q?zQ9aHtpIRQ5XVDzR6qd+J9T+AU7y6UjbIB+VGmINmOpcM7XTk3Pt/0a++Drg?=
 =?us-ascii?Q?0jHSOemWTZR/fmwr53vmPt/wJdzc9uIKZNwH3L3lY6ttj9c6x8oobzs4al3r?=
 =?us-ascii?Q?msGqBi1yhngsc7orMyPyFxplsxDpAOvaIi6s3QC1e/vvMixe93ib2gwhq/Pt?=
 =?us-ascii?Q?iC0d9jfaAzTaCsWJpr3KfyVi0z92uBYKA1Bh0wNdJpng3BaH1fNERTrBEzkn?=
 =?us-ascii?Q?LVxSQtu1S2D6sIgzcXIhwDoCsDDmdkJH+ZesAcmanO89xi4dCFNM2vrMuRVj?=
 =?us-ascii?Q?ZwlceF2aoab5mfexE08qtwabrhQ3VT+1c5Be9/8yhfHpRtqp8wq705qYYOvb?=
 =?us-ascii?Q?Au5K25Hcb0hhE073cYZvKdWM0sChgdXakI/9Qa3Hl1v4EyB9fHLbr64i/sm4?=
 =?us-ascii?Q?a3Tp52p5EKgwfEQQWJG/TIdlDHkfa7obS6eqgja6egxmxa6YHc1PbUz67OHd?=
 =?us-ascii?Q?kRtshI6zHcJ9kPclvL28cYbl5nQxufvJjaSInH4k7YRJZnnXfVCdqdjOaqFw?=
 =?us-ascii?Q?NqVD/eu+qn/lqQUsEPynC6fs660CxoDq181bp0s532zC4mx7/POLDp6oHOFL?=
 =?us-ascii?Q?R+YgHdzDt3jX37ghiWVMK0a7oJbHgZpoqMNnta8hREnm6W2G8X4q9+HKkDj8?=
 =?us-ascii?Q?dWfLgzNvvVk3fBa285VPDAh6YZ1HnwluQKOqkUAhsxxsOn8AfqMK7ZxrEUfm?=
 =?us-ascii?Q?JqZG9MXZ7Fk0uEfVACcGY6w0S+2Zn6x7z8tCCKR5RJrmkZIUvA5OkXr1hed1?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc06d3f-52dc-468a-ed3f-08dda581a10d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 05:10:32.9869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8R7M0Pud0FGpuPVp0Qu9O/eJNh3Ahaxj6LCz0ntw1rr9UyglhqOpiITNp12PFbs1gNBUy8PhI6L2em2YlEdbucZHjFplfLR16tf+6cpaFvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8786
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

On Sat, Jun 07, 2025 at 02:34:42AM +0000, Shuicheng Lin wrote:
>DRM_XE_SYNC_FLAG_SYNCOBJ is renamed to DRM_XE_SYNC_TYPE_SYNCOBJ.
>DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ is renamed to DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ.
>DRM_XE_SYNC_FLAG_DMA_BUF is removed.

This can be seen by the diff. Here it'd be better to explain why, not
what:

>
>Fixes: dc787f8931af ("drm/xe/uapi: Split xe_sync types from flags")

this is not really correct. The rename happened in that commit, but the
commits using the old names came later. So I think the commit message 
should be something like this:

Commit dc787f8931af ("drm/xe/uapi: Split xe_sync types from flags")
renamed some DRM_XE_SYNC_* defines but later commits kept using the
old names.


Fixes: 9329f0667215 ("drm/xe/uapi: Use LR abbrev for long-running vms")
Fixes: 4b437893a826 ("drm/xe/uapi: More uAPI documentation additions and cosmetic updates")

with that,  Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


thanks
Lucas De Marchi

>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Francois Dugast <francois.dugast@intel.com>
>Cc: Zongyao Bai <zongyao.bai@intel.com>
>Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
>---
> include/uapi/drm/xe_drm.h | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 6a702ba7817c..5f1524f466a7 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -925,9 +925,9 @@ struct drm_xe_gem_mmap_offset {
>  *  - %DRM_XE_VM_CREATE_FLAG_LR_MODE - An LR, or Long Running VM accepts
>  *    exec submissions to its exec_queues that don't have an upper time
>  *    limit on the job execution time. But exec submissions to these
>- *    don't allow any of the flags DRM_XE_SYNC_FLAG_SYNCOBJ,
>- *    DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ, DRM_XE_SYNC_FLAG_DMA_BUF,
>- *    used as out-syncobjs, that is, together with DRM_XE_SYNC_FLAG_SIGNAL.
>+ *    don't allow any of the sync types DRM_XE_SYNC_TYPE_SYNCOBJ,
>+ *    DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ, used as out-syncobjs, that is,
>+ *    together with sync flag DRM_XE_SYNC_FLAG_SIGNAL.
>  *    LR VMs can be created in recoverable page-fault mode using
>  *    DRM_XE_VM_CREATE_FLAG_FAULT_MODE, if the device supports it.
>  *    If that flag is omitted, the UMD can not rely on the slightly
>@@ -1394,7 +1394,7 @@ struct drm_xe_sync {
>
> 	/**
> 	 * @timeline_value: Input for the timeline sync object. Needs to be
>-	 * different than 0 when used with %DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ.
>+	 * different than 0 when used with %DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ.
> 	 */
> 	__u64 timeline_value;
>
>-- 
>2.25.1
>
