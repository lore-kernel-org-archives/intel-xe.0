Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A20C3ABDD
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 19:24:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A9810E22B;
	Mon, 19 May 2025 19:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eMEkgNzt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A8E710E530
 for <intel-xe@lists.freedesktop.org>; Mon, 19 May 2025 19:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747682693; x=1779218693;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lESrTUr5TkNJROiCYPgjajZ3pEx8t1868MxCYm0hv9s=;
 b=eMEkgNztXq4joChuGHHCnRsDA4u61EPiEDpvRLZhCd9cHboXHJRfDz/P
 TBhZc90clRIwrZYt6T9Jfb5NVg1xvB3aAPCmzxf1r8JwLm6GyIKSDBeAn
 IDipKCAb9EzJbZTuzcWpMp43+VJqKp1TyVkcJQHtcQak5l+eBbZPP2abE
 dx6Ad/t5o2DUzbEf/+/nuKhinaK3r83hw2TFs5ZeKyLDlDESfs19B5GGm
 dp3tOeENkkx1IfUNFyqKw1hnu8rg4o+xRAeH6MklKPDRF8qRu5Sf/tO07
 jIDZTAfkK4V++rgopaP24syufUwgdlx8s8Sk+crIBt+hCVA6eax4ve2Ot A==;
X-CSE-ConnectionGUID: BDLTHCVNT7WatQxhPY+7Dg==
X-CSE-MsgGUID: vPOTKNOwQQKqZp44e8yA8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60629716"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="60629716"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 12:24:53 -0700
X-CSE-ConnectionGUID: Ji/YDjpBTcm4P2Y3uh4DTg==
X-CSE-MsgGUID: MGj1chNySCS/WonA0R/G4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; d="scan'208";a="144340040"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 12:24:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 19 May 2025 12:24:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 19 May 2025 12:24:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 19 May 2025 12:24:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hkhlpn+jgpzfkfwW5we5G+UvOwhgBZn+ppsilqTM5B2ADhTicasUTIpqNJ3n59BkJ5l6bvrMHD5x4hqX0iLJspq9pNNZUL/0KufhSCJwtQ/RMcLczoCU+DN4uI1JGRGOYlsRsxOE0M7bhv53zzPpDEyrT2Y8fHn9BejFIiMYurss+B8T/8UpRMIAHR4Irt5Ccx2cCeg123r0AI1Qt6UBnRYT95Mq98EdEgpE37Nptueicmaf9OGhm9UAbR9wZ4lHL2AXNFY82xAXV4LULl1xR7r4+gJNQUpjbs9fd2cGrpOUp7D3O9glIzjKikPmyPGghqKOgiSl3wp8oVdkZY1Vng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EnA2o4hD7LFeXdZPtEb0+ca2u06vsNxRdiHm7ZWATeM=;
 b=WDiINkOg6wpYbURZPdbpr6iFpZs/vCAB86U5ROTSEtMKLMjdp5K1n1F3di5FfhquBC1rTJq06wLpqauflPZNLf1MOZ9Az5ftM7HUvkeQsWJLwxewaUmdAmdi/UO3TTzq6r/yNhmPp9hyB+EXIDoUx1TZWA5owOXrSzzNtA+F/+sJDESQyjTp61uFKbysgEh4U4kjaTiSmt5dZju679TFEgDL+v1aqUhpuE7B8in125du6FJ+d2isvcYHyLKMeqfeocnQ8MfBXD2l+U6ZDdZumgSJaTYfuTvN/+tlKOP4yPtC6vp4ay8fRCUhczpTWQrKZz0QlxS2e4qlEgXxnA5aVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB7576.namprd11.prod.outlook.com (2603:10b6:a03:4c9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 19:24:47 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 19:24:47 +0000
Date: Mon, 19 May 2025 12:24:44 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?= =?utf-8?Q?re_fo?=
 =?utf-8?Q?r?= drm/xe: use xe_mmio_read32() to read mtcfg register (rev2)
Message-ID: <20250519192444.GR6239@mdroper-desk1.amr.corp.intel.com>
References: <20250513035515.3458300-1-shuicheng.lin@intel.com>
 <174726238539.80824.11880765065152249932@c664b1dc75d1>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <174726238539.80824.11880765065152249932@c664b1dc75d1>
X-ClientProxiedBy: BY3PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB7576:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d9e3330-779f-4d9f-fad5-08dd970ad14a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/sdfaDOa9GBFvA+5KWbrkgcaEcLmO6EQ7TxQbnnH/Mvrg8M9FxvP+1RJaP5j?=
 =?us-ascii?Q?dXfMnJ86m2El77NFVA6mvZM5ZdK6vyvfrlPKpurG9Vc4ueJb4L/APpNhen6Y?=
 =?us-ascii?Q?fnFpIDN6mwLQr+e1UTCwUQ77xjGqS4EDF/LnhWYbb7tPGPoFSij0liVDQKxh?=
 =?us-ascii?Q?a5nCRmivjOfz4HikmKpyKbupPt5LzYpgoNXaJfjeF8XEI9BvABL+viAv6t73?=
 =?us-ascii?Q?CsglumBnIKr5SPVJKDTRq9hhLhgxJHjGg6LCmybcepeF56SKCz6IpTELShYL?=
 =?us-ascii?Q?ThoFkQRolXN0y4d/3G1M0sMAvkqlJwdPT+/4Z2AZMZ5MIW2h3RuLnQEKJW4+?=
 =?us-ascii?Q?s280/p8LdAF9U0aU/91Tp/fXH8zsD06ijXGXOCZxsDP4bCjfJIt7CVBr+OAQ?=
 =?us-ascii?Q?Uvh+mwixnXP6HkBmNZsLa8iJR0HG1Q5+4MVF1fP/HJhnCq13/l/hpjxHLK/B?=
 =?us-ascii?Q?1B5HhGq/3WTSOF6YgP6l4D+mpHTxnuRogkE/I19ZQFB+baZs/vgfgWIpmUaK?=
 =?us-ascii?Q?MpnIAxLx6NJ58GOgYn2XIRT83yVpKsApR14w9JgnWGy5aEAUEmX3t3AmuMwM?=
 =?us-ascii?Q?GU7kfUBVXe9FVvahPZdNKAsQf32+tWDK9CyL7LnFuFJapk9KesGMmmCVvUAp?=
 =?us-ascii?Q?CuQvacevazt3DwJJRj3QgQGEbC0YjOcAnXidsaTHrwjesm1tFJSiQzvV1NJy?=
 =?us-ascii?Q?7B4D/KVRBcC4wYK7rOZ+Zlj+uJi8/5n07O/oCaiVlq934n0m0rnI1stoWBio?=
 =?us-ascii?Q?vna7an78bh3IJlrC4LV3F2C47ehple16iCEULX5Sfu5LSqF5miN/3w/fbDI5?=
 =?us-ascii?Q?oW3Tlms+9+PJxu2/M5Gn2b7zX7BfuODWMNlnxcUcI8tAmLaotFeiQcHkAeVg?=
 =?us-ascii?Q?q8TL8bRSI5HPthgol8SGeaPncIJvEQvElyTqUDk3m8kYdLCar/Gq9pqg0oss?=
 =?us-ascii?Q?OJWHma2+5i5oqMwnoKp9kGjeTNfYxYzNAZ1iye7qEUBZQbNHlxd5oNgeIPJ9?=
 =?us-ascii?Q?dAbWd0KUzWut0D8OU6+jCeWrbuFKwU4917rEcH9r1TcYxkB9temDtB+6G8cz?=
 =?us-ascii?Q?TydOBFLRLdy79G4nQi9skNOS+CFrbypaSfJmUZZpDMRQkRVrBpakPZiOIY/R?=
 =?us-ascii?Q?kpPmCo9W7gwwWN3JjdN29eMVXeWka3YZqFjcjRW8kKbaqUQuleOjbPO9LUfz?=
 =?us-ascii?Q?b5SjwLG2vId4nhy8DMbxIXmf3DESCFyQyURK43w2h/FEFrtcMscZzaiApRPT?=
 =?us-ascii?Q?gFKMxr9FWTJSLuOrD+C9PEnV3l4qdwuq9Gku5iHx/RZeWCg/ALVmpPpS+K25?=
 =?us-ascii?Q?HrENz8F2bbgEzF7uNodx++kht093/Wcwya8Z6nrL+TKk10dzcjKD9R5vTg4F?=
 =?us-ascii?Q?6voW7bU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YgOFvw/Ziq53coL/mHwupXQfFXmaYTkUlfM1puiXcezfxWKtcZKwzhzIuH9a?=
 =?us-ascii?Q?XXP8CN/gcumaiHbVkmnmnL+BzTRkHmRQUq1WibmNGiuCv0m9e9kUQIDfb0LX?=
 =?us-ascii?Q?R/21rQOyGSc5O7Xq/kYRMvfvt6W2ZSdMjdWdVh7fj1lwsHhcU94l7pvab9aT?=
 =?us-ascii?Q?A49g5oczfmuoe35B7wmPSluOP+z9LGhX7t+/M8H1WECBh3/qrsQGzZoPcJyo?=
 =?us-ascii?Q?UFwtH9PrONY5Kuzvhe+yKhw73ZVsmFe7GAwFYPJSsc4kTSOIpAk4xr9C825k?=
 =?us-ascii?Q?IMRnzE+OXAglH6JwS3iPJld8UA7zWdhMvWluan+JGS6PWXjlt5JpjIAC2Zj2?=
 =?us-ascii?Q?ETLuwxezwtEOFcVdWZLz8yOw59N4nuiROlZRNEdg88AflrZdJeLiA7+0/gxn?=
 =?us-ascii?Q?L7p/afvCuziQXNU+/lKZR2WmmvKyOFWobJ51dBZ6+bLO4CNFDuW+czrCiwag?=
 =?us-ascii?Q?ZybELEOKx+KMRW30TKuVzvonJBDzSEvqftZela7mHnvo6qtu48vyDzkmQcqn?=
 =?us-ascii?Q?LOG+cR0gLwc4qpb1vv2ww0CElwwYZFG+Ms+t+9vQ7UtU7H8DQEntzpKflzyp?=
 =?us-ascii?Q?ivrKo2PZtJfv3VC0fRXP4XQnkHPMgBw683zKHwMEEsfkYpoWPn2TT8pNmB9F?=
 =?us-ascii?Q?oI0o9Wwh/2Q+VxLYIOW3uWIbBRKVyJNb0KlAGbLQwTPTn8E4pGe6PxJLYnqY?=
 =?us-ascii?Q?ytVMemR+mXuYqvx2LhYUQ1G9r0Yrp/uX60hi4I5Iq3jKKvPR6rp8C+tNpYY9?=
 =?us-ascii?Q?IhBUpzTBoitvUHv1oiXPW/7F/x6eY17MDicWvc6OMPDiocP6zSyptWG3dPc2?=
 =?us-ascii?Q?RtK/wtcKGJO0qQEVYwf0zQKznA5Nf+gcK798cNF2SB04DcrTjQacbitzdXqU?=
 =?us-ascii?Q?9laXk3s+/cJGBJ5xpblQvgZe/PlB55d9+KFuRQ8GVymt2ZUyBO0thCuKayiq?=
 =?us-ascii?Q?ONmFbpPrNg86DWU72MPI9Vf55F9fOML71FpsNPpMpxDrTn/3B4XWh0gT0W/6?=
 =?us-ascii?Q?nL9Yvxe3lChctthrxGYXAXic4orrtFMKSEmPTz31sUM5YA3xczObnX6G1rWi?=
 =?us-ascii?Q?0TSG9lFDJlqvL3K34TG9wiObqVe8y27KBLJvucLnXT9RGQDD+a2lpZpBSfMG?=
 =?us-ascii?Q?QYowcDTVf6jYbSCucWmmtjzzz3QQmyjwUDmm4+bySPKn8850QvMmfUubMn8S?=
 =?us-ascii?Q?x7N0RXnXe4FxNk/l4XfShz9dvz5lZUrD3+FbxEOZq/k2/Fcmp7wENEzNm27H?=
 =?us-ascii?Q?n2ncvYYAAlHr8v3Ktr6kOcDT41M+V3cnEapWSnCAl7qsbrWt4t2ofPnq1WAU?=
 =?us-ascii?Q?tU5qJKA441oKnF+dJOVqJ52aR0ZM+wZqvnfQQDNpXduWjYB0htFZ9yGe12UW?=
 =?us-ascii?Q?eRFGVLlKEgbfZ0SeCeapFJXN/eeHHi0oIDeX6MX1bG8M4Z3uYsfwdEJdoERA?=
 =?us-ascii?Q?fsK9SY77ybygn3j6ujrI0RuELVlzck0wsOvJ8dAVKCmbU7+KCbnLHQCmm/dz?=
 =?us-ascii?Q?Bu8yRh4mVL9SCKzwUxP40dWuEI1roFwtpZCs0vqEG6Cd0fxAxtBM+kmvZTq4?=
 =?us-ascii?Q?eWxenaBhsvXbAt2qMFuuy5nSoa/P4tLzt0Gp4IndR4jTGorHQBPJiQysL3QZ?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9e3330-779f-4d9f-fad5-08dd970ad14a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 19:24:47.6598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6eyzesH+v03cI+y4pXbzE6/EfWoXpKAHSDSkAzCjbJ4ASH4wtJmkfgMkuQ9/zdpxlxKMKZF3vUnEm0h/sIZrgA6N5CWqfKqHqYuJofP+Orw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7576
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

On Wed, May 14, 2025 at 10:39:45PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: use xe_mmio_read32() to read mtcfg register (rev2)
> URL   : https://patchwork.freedesktop.org/series/148924/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961_FULL -> xe-pw-148924v2_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-148924v2_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-148924v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in xe-pw-148924v2_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-lnl:          [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-lnl-5/igt@kms_flip@flip-vs-suspend.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-5/igt@kms_flip@flip-vs-suspend.html

Submission failed after a suspend; not related to the MTCFG register
read in this patch.

Applied to drm-xe-next.  Thanks for the patch and review.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-148924v2_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@fbdev@read:
>     - shard-dg2-set2:     [PASS][3] -> [SKIP][4] ([Intel XE#2134])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-433/igt@fbdev@read.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@fbdev@read.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:
>     - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#911])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2385])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#3658])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-0:
>     - shard-dg2-set2:     [PASS][9] -> [SKIP][10] ([Intel XE#2351] / [Intel XE#4208])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-0.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1124]) +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1124]) +1 other test skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#367])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          [PASS][14] -> [INCOMPLETE][15] ([Intel XE#3862]) +1 other test incomplete
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [PASS][16] -> [INCOMPLETE][17] ([Intel XE#3862]) +1 other test incomplete
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#3432])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#3432])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2887]) +4 other tests skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#787]) +132 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#455] / [Intel XE#787]) +18 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][23] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html
> 
>   * igt@kms_chamelium_edid@dp-edid-read:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2252]) +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-read.html
> 
>   * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
>     - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#373]) +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-5/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
> 
>   * igt@kms_content_protection@content-type-change:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2341])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@kms_content_protection@content-type-change.html
> 
>   * igt@kms_content_protection@uevent@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][28] ([Intel XE#1188])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-7/igt@kms_content_protection@uevent@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x32:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2320])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-max-size:
>     - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1424])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-5/igt@kms_cursor_crc@cursor-offscreen-max-size.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>     - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#309])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2291]) +1 other test skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>     - shard-bmg:          [PASS][33] -> [SKIP][34] ([Intel XE#2291]) +3 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#1508])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#1340]) +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-bmg:          [PASS][37] -> [SKIP][38] ([Intel XE#3009])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-8/igt@kms_dp_aux_dev.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-6/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#2244])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-5/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#776])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
>     - shard-bmg:          NOTRUN -> [FAIL][41] ([Intel XE#3321])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][42] ([Intel XE#301]) +2 other tests fail
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2316])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>     - shard-bmg:          [PASS][44] -> [INCOMPLETE][45] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
>     - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#2316]) +9 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check:
>     - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#1421])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-5/igt@kms_flip@2x-wf_vblank-ts-check.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
>     - shard-dg2-set2:     [PASS][49] -> [FAIL][50] ([Intel XE#301] / [Intel XE#3321])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:
>     - shard-dg2-set2:     [PASS][51] -> [FAIL][52] ([Intel XE#301]) +2 other tests fail
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#455])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2293]) +2 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:
>     - shard-adlp:         [PASS][56] -> [DMESG-FAIL][57] ([Intel XE#4543])
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
>     - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#4141]) +3 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
>     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2311]) +2 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
>     - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#651]) +1 other test skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2312]) +9 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#656]) +8 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2313]) +1 other test skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@plane-fbc-rte:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2350])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
> 
>   * igt@kms_joiner@basic-max-non-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#4298])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@kms_joiner@basic-max-non-joiner.html
> 
>   * igt@kms_lease@invalid-create-leases:
>     - shard-dg2-set2:     [PASS][66] -> [SKIP][67] ([Intel XE#4208] / [i915#2575]) +39 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-433/igt@kms_lease@invalid-create-leases.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@kms_lease@invalid-create-leases.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2501])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][69] ([Intel XE#616])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-434/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20:
>     - shard-adlp:         [PASS][70] -> [DMESG-WARN][71] ([Intel XE#4173]) +7 other tests dmesg-warn
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-20x20.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-20x20.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
>     - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#2763]) +3 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
>     - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2763]) +4 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html
> 
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#1489]) +2 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
>     - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#2893])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1128])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@fbc-pr-sprite-plane-move:
>     - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1406])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-5/igt@kms_psr@fbc-pr-sprite-plane-move.html
> 
>   * igt@kms_psr@psr-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@kms_psr@psr-basic.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#4692])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2414])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@bad-pixel-format:
>     - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#3414] / [Intel XE#3904])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-5/igt@kms_rotation_crc@bad-pixel-format.html
> 
>   * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
>     - shard-lnl:          NOTRUN -> [FAIL][82] ([Intel XE#4689])
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-5/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_setmode@basic@pipe-b-edp-1:
>     - shard-lnl:          [PASS][84] -> [FAIL][85] ([Intel XE#2883]) +2 other tests fail
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>     - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#1435])
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> 
>   * igt@kms_vrr@flip-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#1499])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@kms_vrr@flip-basic.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1499])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-5/igt@kms_vrr@negative-basic.html
> 
>   * igt@xe_eudebug@basic-connect:
>     - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#4837]) +2 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-5/igt@xe_eudebug@basic-connect.html
> 
>   * igt@xe_eudebug_online@single-step-one:
>     - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#4837]) +2 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@xe_eudebug_online@single-step-one.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#1392]) +2 other tests skip
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
>     - shard-dg2-set2:     [PASS][92] -> [SKIP][93] ([Intel XE#1392]) +2 other tests skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
>     - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2322])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html
> 
>   * igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge-nomemset:
>     - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#4943]) +4 other tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-5/igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@process-many-large-mmap-huge:
>     - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#4943]) +4 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-mmap-huge.html
> 
>   * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>     - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2229])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
> 
>   * igt@xe_mmap@vram:
>     - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#1416])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-5/igt@xe_mmap@vram.html
> 
>   * igt@xe_module_load@many-reload:
>     - shard-dg2-set2:     [PASS][99] -> [FAIL][100] ([Intel XE#4208])
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-433/igt@xe_module_load@many-reload.html
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@xe_module_load@many-reload.html
> 
>   * igt@xe_pat@pat-index-xehpc:
>     - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#1420])
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html
> 
>   * igt@xe_pm@d3cold-mmap-system:
>     - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#2284] / [Intel XE#366])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-5/igt@xe_pm@d3cold-mmap-system.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-lnl:          [PASS][103] -> [ABORT][104] ([Intel XE#1794]) +1 other test abort
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-lnl-3/igt@xe_pm@s4-d3hot-basic-exec.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s4-exec-after:
>     - shard-adlp:         [PASS][105] -> [ABORT][106] ([Intel XE#1794])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-3/igt@xe_pm@s4-exec-after.html
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-9/igt@xe_pm@s4-exec-after.html
> 
>   * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
>     - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#4733])
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html
> 
>   * igt@xe_query@multigpu-query-hwconfig:
>     - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#944]) +1 other test skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@xe_query@multigpu-query-hwconfig.html
> 
>   * igt@xe_sriov_flr@flr-twice:
>     - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#4273])
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@xe_sriov_flr@flr-twice.html
> 
>   * igt@xe_sriov_scheduling@equal-throughput:
>     - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#4351])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-5/igt@xe_sriov_scheduling@equal-throughput.html
> 
>   * igt@xe_vm@large-split-binds-536870912:
>     - shard-dg2-set2:     [PASS][111] -> [SKIP][112] ([Intel XE#4208]) +95 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-436/igt@xe_vm@large-split-binds-536870912.html
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@xe_vm@large-split-binds-536870912.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off:
>     - shard-dg2-set2:     [SKIP][113] ([Intel XE#4208] / [Intel XE#4618]) -> [PASS][114]
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off.html
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [DMESG-FAIL][115] ([Intel XE#4543]) -> [PASS][116] +4 other tests pass
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
>     - shard-bmg:          [SKIP][117] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][118] +1 other test pass
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [SKIP][119] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][120] +2 other tests pass
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:
>     - shard-lnl:          [ABORT][121] -> [PASS][122] +1 other test pass
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>     - shard-bmg:          [SKIP][123] ([Intel XE#2291]) -> [PASS][124] +8 other tests pass
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_dp_link_training@non-uhbr-sst:
>     - shard-bmg:          [SKIP][125] ([Intel XE#4354]) -> [PASS][126]
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-sst.html
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-3/igt@kms_dp_link_training@non-uhbr-sst.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-bmg:          [SKIP][127] ([Intel XE#4294]) -> [PASS][128]
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-3/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-bmg:          [SKIP][129] ([Intel XE#2373]) -> [PASS][130]
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-8/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_flip@2x-nonexisting-fb:
>     - shard-bmg:          [SKIP][131] ([Intel XE#2316]) -> [PASS][132] +8 other tests pass
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp4:
>     - shard-dg2-set2:     [FAIL][133] ([Intel XE#301]) -> [PASS][134]
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp4.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp4.html
> 
>   * igt@kms_flip@plain-flip-ts-check@a-edp1:
>     - shard-lnl:          [FAIL][135] ([Intel XE#886]) -> [PASS][136] +1 other test pass
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-lnl-2/igt@kms_flip@plain-flip-ts-check@a-edp1.html
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@a-edp1.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
>     - shard-adlp:         [FAIL][137] ([Intel XE#1874]) -> [PASS][138]
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][139] ([Intel XE#4208]) -> [PASS][140] +48 other tests pass
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-bmg:          [SKIP][141] ([Intel XE#1503]) -> [PASS][142] +1 other test pass
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-8/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_plane_multiple@2x-tiling-none:
>     - shard-bmg:          [SKIP][143] ([Intel XE#4596]) -> [PASS][144]
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html
> 
>   * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>     - shard-bmg:          [SKIP][145] ([Intel XE#2571]) -> [PASS][146]
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>     - shard-dg2-set2:     [SKIP][147] ([Intel XE#4208] / [i915#2575]) -> [PASS][148] +25 other tests pass
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
>     - shard-dg2-set2:     [SKIP][149] ([Intel XE#1392]) -> [PASS][150] +4 other tests pass
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
> 
>   * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
>     - shard-adlp:         [DMESG-WARN][151] ([Intel XE#4173]) -> [PASS][152]
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-8/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-2/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
> 
>   * igt@xe_module_load@load:
>     - shard-adlp:         ([PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [SKIP][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178]) ([Intel XE#378]) -> ([PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203])
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-8/igt@xe_module_load@load.html
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-8/igt@xe_module_load@load.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-8/igt@xe_module_load@load.html
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-8/igt@xe_module_load@load.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-2/igt@xe_module_load@load.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-9/igt@xe_module_load@load.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@xe_module_load@load.html
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@xe_module_load@load.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-3/igt@xe_module_load@load.html
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-3/igt@xe_module_load@load.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-4/igt@xe_module_load@load.html
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-4/igt@xe_module_load@load.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-4/igt@xe_module_load@load.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-3/igt@xe_module_load@load.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-6/igt@xe_module_load@load.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-3/igt@xe_module_load@load.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-3/igt@xe_module_load@load.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-2/igt@xe_module_load@load.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-9/igt@xe_module_load@load.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@xe_module_load@load.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-2/igt@xe_module_load@load.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-6/igt@xe_module_load@load.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-6/igt@xe_module_load@load.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-6/igt@xe_module_load@load.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-4/igt@xe_module_load@load.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-2/igt@xe_module_load@load.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-6/igt@xe_module_load@load.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-4/igt@xe_module_load@load.html
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-1/igt@xe_module_load@load.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-3/igt@xe_module_load@load.html
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-9/igt@xe_module_load@load.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-9/igt@xe_module_load@load.html
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-2/igt@xe_module_load@load.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-2/igt@xe_module_load@load.html
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-1/igt@xe_module_load@load.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-1/igt@xe_module_load@load.html
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-6/igt@xe_module_load@load.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-6/igt@xe_module_load@load.html
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-4/igt@xe_module_load@load.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-8/igt@xe_module_load@load.html
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-8/igt@xe_module_load@load.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-8/igt@xe_module_load@load.html
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-4/igt@xe_module_load@load.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-1/igt@xe_module_load@load.html
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-4/igt@xe_module_load@load.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-3/igt@xe_module_load@load.html
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-8/igt@xe_module_load@load.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-3/igt@xe_module_load@load.html
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-2/igt@xe_module_load@load.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-2/igt@xe_module_load@load.html
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-adlp-3/igt@xe_module_load@load.html
> 
>   * igt@xe_oa@buffer-fill@rcs-0:
>     - shard-lnl:          [FAIL][204] ([Intel XE#4565]) -> [PASS][205] +1 other test pass
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-lnl-7/igt@xe_oa@buffer-fill@rcs-0.html
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-lnl-4/igt@xe_oa@buffer-fill@rcs-0.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][206] ([Intel XE#316]) -> [SKIP][207] ([Intel XE#2351] / [Intel XE#4208])
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][208] ([Intel XE#316]) -> [SKIP][209] ([Intel XE#4208]) +1 other test skip
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-433/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][210] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][211] ([Intel XE#316])
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][212] ([Intel XE#4208]) -> [SKIP][213] ([Intel XE#316])
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-dg2-set2:     [SKIP][214] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][215] ([Intel XE#619])
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb.html
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][216] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][217] ([Intel XE#1124])
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-dg2-set2:     [SKIP][218] ([Intel XE#1124]) -> [SKIP][219] ([Intel XE#4208]) +4 other tests skip
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-dg2-set2:     [SKIP][220] ([Intel XE#1124]) -> [SKIP][221] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][222] ([Intel XE#367]) -> [SKIP][223] ([Intel XE#4208] / [i915#2575]) +1 other test skip
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][224] ([Intel XE#4208] / [i915#2575]) -> [SKIP][225] ([Intel XE#367])
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
>     - shard-dg2-set2:     [SKIP][226] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][227] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-433/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
>     - shard-dg2-set2:     [SKIP][228] ([Intel XE#4208]) -> [SKIP][229] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-434/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
>     - shard-dg2-set2:     [SKIP][230] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][231] ([Intel XE#4208]) +3 other tests skip
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [SKIP][232] ([Intel XE#2351] / [Intel XE#4208]) -> [INCOMPLETE][233] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg2-set2:     [SKIP][234] ([Intel XE#4418]) -> [SKIP][235] ([Intel XE#2351] / [Intel XE#4208])
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-dg2-set2:     [SKIP][236] ([Intel XE#306]) -> [SKIP][237] ([Intel XE#4208] / [i915#2575])
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-436/igt@kms_chamelium_color@degamma.html
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
>     - shard-dg2-set2:     [SKIP][238] ([Intel XE#4208] / [i915#2575]) -> [SKIP][239] ([Intel XE#373]) +2 other tests skip
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm:
>     - shard-dg2-set2:     [SKIP][240] ([Intel XE#373]) -> [SKIP][241] ([Intel XE#4208] / [i915#2575]) +4 other tests skip
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-storm.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-dg2-set2:     [SKIP][242] ([Intel XE#4208] / [i915#2575]) -> [SKIP][243] ([Intel XE#307])
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_content_protection@dp-mst-type-1.html
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-bmg:          [FAIL][244] ([Intel XE#1178]) -> [SKIP][245] ([Intel XE#2341]) +1 other test skip
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-8/igt@kms_content_protection@srm.html
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-6/igt@kms_content_protection@srm.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-bmg:          [SKIP][246] ([Intel XE#2341]) -> [FAIL][247] ([Intel XE#1188])
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-6/igt@kms_content_protection@uevent.html
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-7/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-dg2-set2:     [SKIP][248] ([Intel XE#308]) -> [SKIP][249] ([Intel XE#4208] / [i915#2575]) +1 other test skip
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x170.html
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-dg2-set2:     [SKIP][250] ([Intel XE#4208] / [i915#2575]) -> [SKIP][251] ([Intel XE#308]) +1 other test skip
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-dg2-set2:     [SKIP][252] ([Intel XE#4208] / [i915#2575]) -> [SKIP][253] ([Intel XE#323])
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_dsc@dsc-with-bpc:
>     - shard-dg2-set2:     [SKIP][254] ([Intel XE#455]) -> [SKIP][255] ([Intel XE#4208]) +3 other tests skip
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-436/igt@kms_dsc@dsc-with-bpc.html
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@kms_dsc@dsc-with-bpc.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-dg2-set2:     [SKIP][256] ([Intel XE#455]) -> [SKIP][257] ([Intel XE#2351] / [Intel XE#4208])
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-433/igt@kms_dsc@dsc-with-bpc-formats.html
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
>     - shard-dg2-set2:     [SKIP][258] ([Intel XE#4208]) -> [SKIP][259] ([Intel XE#4422])
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-dg2-set2:     [SKIP][260] ([Intel XE#703]) -> [SKIP][261] ([Intel XE#4208] / [i915#2575])
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-436/igt@kms_feature_discovery@display-3x.html
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>     - shard-bmg:          [FAIL][262] ([Intel XE#2882]) -> [SKIP][263] ([Intel XE#2316])
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-bmg:          [FAIL][264] ([Intel XE#3321]) -> [SKIP][265] ([Intel XE#2316])
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>     - shard-bmg:          [SKIP][266] ([Intel XE#2316]) -> [FAIL][267] ([Intel XE#3321])
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
>     - shard-dg2-set2:     [SKIP][268] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][269] ([Intel XE#455])
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][270] ([Intel XE#651]) -> [SKIP][271] ([Intel XE#4208]) +10 other tests skip
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
>     - shard-bmg:          [SKIP][272] ([Intel XE#2311]) -> [SKIP][273] ([Intel XE#2312]) +23 other tests skip
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][274] ([Intel XE#2312]) -> [SKIP][275] ([Intel XE#2311]) +26 other tests skip
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-slowdraw:
>     - shard-dg2-set2:     [SKIP][276] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][277] ([Intel XE#651]) +4 other tests skip
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-slowdraw.html
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-slowdraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][278] ([Intel XE#2312]) -> [SKIP][279] ([Intel XE#4141]) +11 other tests skip
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>     - shard-bmg:          [SKIP][280] ([Intel XE#4141]) -> [SKIP][281] ([Intel XE#2312]) +10 other tests skip
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][282] ([Intel XE#651]) -> [SKIP][283] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][284] ([Intel XE#4208]) -> [SKIP][285] ([Intel XE#651]) +1 other test skip
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
>     - shard-dg2-set2:     [SKIP][286] ([Intel XE#658]) -> [SKIP][287] ([Intel XE#2351] / [Intel XE#4208])
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-bmg:          [SKIP][288] ([Intel XE#2313]) -> [SKIP][289] ([Intel XE#2312]) +23 other tests skip
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][290] ([Intel XE#653]) -> [SKIP][291] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][292] ([Intel XE#2312]) -> [SKIP][293] ([Intel XE#2313]) +23 other tests skip
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][294] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][295] ([Intel XE#653]) +1 other test skip
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-dg2-set2:     [SKIP][296] ([Intel XE#4208]) -> [SKIP][297] ([Intel XE#653]) +5 other tests skip
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@psr-slowdraw:
>     - shard-dg2-set2:     [SKIP][298] ([Intel XE#653]) -> [SKIP][299] ([Intel XE#4208]) +8 other tests skip
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-slowdraw.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-dg2-set2:     [SKIP][300] ([Intel XE#4208] / [i915#2575]) -> [SKIP][301] ([Intel XE#455]) +1 other test skip
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_hdr@brightness-with-hdr.html
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_plane_cursor@primary:
>     - shard-dg2-set2:     [FAIL][302] ([Intel XE#616]) -> [SKIP][303] ([Intel XE#4208] / [i915#2575])
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-433/igt@kms_plane_cursor@primary.html
>    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@kms_plane_cursor@primary.html
> 
>   * igt@kms_plane_multiple@2x-tiling-y:
>     - shard-bmg:          [SKIP][304] ([Intel XE#5021]) -> [SKIP][305] ([Intel XE#4596])
>    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html
>    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-bmg:          [SKIP][306] ([Intel XE#4596]) -> [SKIP][307] ([Intel XE#5021])
>    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html
>    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-dg2-set2:     [SKIP][308] ([Intel XE#870]) -> [SKIP][309] ([Intel XE#4208]) +1 other test skip
>    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-433/igt@kms_pm_backlight@fade-with-suspend.html
>    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
>     - shard-dg2-set2:     [SKIP][310] ([Intel XE#1489]) -> [SKIP][311] ([Intel XE#4208]) +5 other tests skip
>    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
>    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     [SKIP][312] ([Intel XE#4208]) -> [SKIP][313] ([Intel XE#1489])
>    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
>    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr@fbc-psr-no-drrs:
>     - shard-dg2-set2:     [SKIP][314] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][315] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
>    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_psr@fbc-psr-no-drrs.html
>    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@kms_psr@fbc-psr-no-drrs.html
> 
>   * igt@kms_psr@fbc-psr2-basic:
>     - shard-dg2-set2:     [SKIP][316] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][317] ([Intel XE#4208]) +5 other tests skip
>    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-436/igt@kms_psr@fbc-psr2-basic.html
>    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@kms_psr@fbc-psr2-basic.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-render:
>     - shard-dg2-set2:     [SKIP][318] ([Intel XE#4208]) -> [SKIP][319] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
>    [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_psr@fbc-psr2-cursor-render.html
>    [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@kms_psr@fbc-psr2-cursor-render.html
> 
>   * igt@kms_psr@pr-sprite-render:
>     - shard-dg2-set2:     [SKIP][320] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][321] ([Intel XE#2351] / [Intel XE#4208])
>    [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-436/igt@kms_psr@pr-sprite-render.html
>    [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@kms_psr@pr-sprite-render.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][322] ([Intel XE#4208] / [i915#2575]) -> [SKIP][323] ([Intel XE#1500])
>    [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vrr@flip-dpms:
>     - shard-dg2-set2:     [SKIP][324] ([Intel XE#455]) -> [SKIP][325] ([Intel XE#4208] / [i915#2575]) +4 other tests skip
>    [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-436/igt@kms_vrr@flip-dpms.html
>    [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@kms_vrr@flip-dpms.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-dg2-set2:     [SKIP][326] ([Intel XE#4208] / [i915#2575]) -> [SKIP][327] ([Intel XE#1091] / [Intel XE#2849])
>    [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@sriov_basic@enable-vfs-autoprobe-off.html
>    [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>     - shard-dg2-set2:     [SKIP][328] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][329] ([Intel XE#4208] / [i915#2575])
>    [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-433/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>    [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-dg2-set2:     [SKIP][330] ([Intel XE#4208]) -> [SKIP][331] ([Intel XE#1126])
>    [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfffe.html
>    [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_eu_stall@invalid-sampling-rate:
>     - shard-dg2-set2:     [SKIP][332] ([Intel XE#4497]) -> [SKIP][333] ([Intel XE#4208])
>    [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-436/igt@xe_eu_stall@invalid-sampling-rate.html
>    [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@xe_eu_stall@invalid-sampling-rate.html
> 
>   * igt@xe_eudebug@basic-close:
>     - shard-dg2-set2:     [SKIP][334] ([Intel XE#4208]) -> [SKIP][335] ([Intel XE#4837]) +3 other tests skip
>    [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_eudebug@basic-close.html
>    [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@xe_eudebug@basic-close.html
> 
>   * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
>     - shard-dg2-set2:     [SKIP][336] ([Intel XE#4837]) -> [SKIP][337] ([Intel XE#4208]) +5 other tests skip
>    [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-436/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html
>    [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html
> 
>   * igt@xe_exec_fault_mode@once-rebind-imm:
>     - shard-dg2-set2:     [SKIP][338] ([Intel XE#288]) -> [SKIP][339] ([Intel XE#4208]) +12 other tests skip
>    [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-433/igt@xe_exec_fault_mode@once-rebind-imm.html
>    [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@xe_exec_fault_mode@once-rebind-imm.html
> 
>   * igt@xe_exec_fault_mode@once-userptr-invalidate-imm:
>     - shard-dg2-set2:     [SKIP][340] ([Intel XE#4208]) -> [SKIP][341] ([Intel XE#288]) +5 other tests skip
>    [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html
>    [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html
> 
>   * igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:
>     - shard-dg2-set2:     [SKIP][342] ([Intel XE#4915]) -> [SKIP][343] ([Intel XE#4208]) +83 other tests skip
>    [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-436/igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge.html
>    [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge.html
> 
>   * igt@xe_exec_system_allocator@process-many-stride-new:
>     - shard-dg2-set2:     [SKIP][344] ([Intel XE#4208]) -> [SKIP][345] ([Intel XE#4915]) +43 other tests skip
>    [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_exec_system_allocator@process-many-stride-new.html
>    [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@xe_exec_system_allocator@process-many-stride-new.html
> 
>   * igt@xe_mmap@small-bar:
>     - shard-dg2-set2:     [SKIP][346] ([Intel XE#4208]) -> [SKIP][347] ([Intel XE#512])
>    [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_mmap@small-bar.html
>    [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@xe_mmap@small-bar.html
> 
>   * igt@xe_oa@buffer-size:
>     - shard-dg2-set2:     [SKIP][348] ([Intel XE#4208]) -> [SKIP][349] ([Intel XE#4501])
>    [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_oa@buffer-size.html
>    [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@xe_oa@buffer-size.html
> 
>   * igt@xe_oa@invalid-remove-userspace-config:
>     - shard-dg2-set2:     [SKIP][350] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][351] ([Intel XE#4208]) +1 other test skip
>    [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-436/igt@xe_oa@invalid-remove-userspace-config.html
>    [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@xe_oa@invalid-remove-userspace-config.html
> 
>   * igt@xe_oa@syncs-syncobj-none:
>     - shard-dg2-set2:     [SKIP][352] ([Intel XE#4208]) -> [SKIP][353] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
>    [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_oa@syncs-syncobj-none.html
>    [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@xe_oa@syncs-syncobj-none.html
> 
>   * igt@xe_oa@syncs-ufence-wait:
>     - shard-dg2-set2:     [SKIP][354] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) -> [SKIP][355] ([Intel XE#4208])
>    [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-433/igt@xe_oa@syncs-ufence-wait.html
>    [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@xe_oa@syncs-ufence-wait.html
> 
>   * igt@xe_pat@display-vs-wb-transient:
>     - shard-dg2-set2:     [SKIP][356] ([Intel XE#4208]) -> [SKIP][357] ([Intel XE#1337])
>    [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_pat@display-vs-wb-transient.html
>    [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@xe_pat@display-vs-wb-transient.html
> 
>   * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
>     - shard-dg2-set2:     [SKIP][358] ([Intel XE#4733]) -> [SKIP][359] ([Intel XE#4208]) +1 other test skip
>    [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-433/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
>    [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
> 
>   * igt@xe_pxp@pxp-termination-key-update-post-rpm:
>     - shard-dg2-set2:     [SKIP][360] ([Intel XE#4208]) -> [SKIP][361] ([Intel XE#4733])
>    [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_pxp@pxp-termination-key-update-post-rpm.html
>    [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@xe_pxp@pxp-termination-key-update-post-rpm.html
> 
>   * igt@xe_query@multigpu-query-oa-units:
>     - shard-dg2-set2:     [SKIP][362] ([Intel XE#944]) -> [SKIP][363] ([Intel XE#4208]) +1 other test skip
>    [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-436/igt@xe_query@multigpu-query-oa-units.html
>    [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@xe_query@multigpu-query-oa-units.html
> 
>   * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
>     - shard-dg2-set2:     [SKIP][364] ([Intel XE#4208]) -> [SKIP][365] ([Intel XE#4130])
>    [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
>    [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-436/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
> 
>   * igt@xe_sriov_flr@flr-each-isolation:
>     - shard-dg2-set2:     [SKIP][366] ([Intel XE#3342]) -> [SKIP][367] ([Intel XE#4208])
>    [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-436/igt@xe_sriov_flr@flr-each-isolation.html
>    [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/shard-dg2-464/igt@xe_sriov_flr@flr-each-isolation.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
>   [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
>   [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
>   [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
>   [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
>   [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
>   [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
>   [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
>   [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
>   [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
>   [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
>   [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
>   [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
>   [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
>   [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
>   [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
>   [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
>   [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
>   [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
>   [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
>   [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
>   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#4565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4565
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618
>   [Intel XE#4689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689
>   [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961 -> xe-pw-148924v2
> 
>   IGT_8364: 8364
>   xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961: dd6a856541dd90fa4ef755783898fcfbea3b9961
>   xe-pw-148924v2: 148924v2
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148924v2/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
