Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C00CCD1BB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 15:23:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB83D10E15F;
	Wed, 22 Oct 2025 15:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D7ndiXC1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D09610E15F
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 15:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761146638; x=1792682638;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qOoQdUfW8ZeWWiKlnKUSq59pTuGDyfXzi/0JlswHrWM=;
 b=D7ndiXC1kkt8JGYlKHmLS6SmdpsouHQHxxZELS12yYlsNfTyn87x3iRO
 Iy+utk0E6dCeJkMbqTlZNTQz4QBMwCNKCnQbtgVN6kWyFKypjvpjLeRUr
 oGkNtpgJyiRowJ+igfc/0huJftBZx12OhZT5EN2B3V33uPeRECDqqA/RT
 iwJqjKDQ+FQfOQKIuCTVacp434AMD3VM0DGH0A1YWwBmv4QnsRQw+6Ubs
 7AmWuUWsK3HwGvJlTsyo3x3kbdNPsb36Cp4sCHdTVDSDhdPNctjjPeLzn
 4dJ9XLkbiQQwDTvoiHv7jYR3esE0FedgTSY+dZDYZ4eLDz8JGDKz8OgyH A==;
X-CSE-ConnectionGUID: gyB1gGVIRf20flPRFA/1tQ==
X-CSE-MsgGUID: n9seN5vfQ8yuYlhut0gSLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66941242"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="66941242"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 08:23:57 -0700
X-CSE-ConnectionGUID: xThyw3WeR0KZFV9DVk+PvA==
X-CSE-MsgGUID: gF6ho2fNQA26yoTYp7Cykw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="183115662"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 08:23:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 08:23:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 08:23:56 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.4) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 08:23:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nuHTCPm5QR7ZRxSDqXxOEbUphisiJfUVEMbQFK7ojJRjdwFWZT/PztiSL9nLvU9GqFzq2F5kqf1h0f9s9OvPB3wAPOrGOOIMbxAF2trWt6t2bYZDCEfF4qshIQe1dOmlAXnlfoLWC5MX4nPi92fzeyH+SxnzJqtUdnqWHeMy1h65IdLhmNtgt1ykN0s/uag5NmjPrwe+TPPjgVc/vTCsakm2IYhN6TieVKvojXnLJLnkq1u141RvNWExckxkskA7Pr/YzyppYrGeRnT9qpnes7+/UmAIEQ1bFKobM8sPf+fI8iUzGbR12x/+8tb9u0lHMQmBdsEOT3t6CIQc+XszHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNaKFAXNRV0uUfkDShMwd+mcjFdHbkBJ/BJti3hsA9c=;
 b=FztnYb0qZgyo8O/hWDqR6uB6JazQUDWccO1JdWLiAzqjrLyw+J6AF9LtLxTl3SM2HX/hk15S5NOCHGCDRLRNW19hwZc4wevpEqkdN7GCd17Ez4846MPly2kr1QdQn65cg882ZLA92CuaRvu/Pe1xk+S/s9y+1r9pT/GX/J+3SHY/oL5ewRfI0hn7M09xWS9hOZ5FUcCdcRx2NGJ4SXhXF2YwUla+4fKs9ijJUSydvoXITSR5eybfj0rgSfmryqoVhJW/7j4+7BpDdOfcsd6ToZIov/uAE2gZ8v9mRkhSAY5J3BqJnKtwj3Cua5OWt41+ursbHbqZZQzvYA3PJt0aNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPFABF58482A.namprd11.prod.outlook.com (2603:10b6:f:fc02::45)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Wed, 22 Oct
 2025 15:23:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 15:23:49 +0000
Date: Wed, 22 Oct 2025 08:23:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <daniele.ceraolospurio@intel.com>, <michal.wajdeczko@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v6 1/4] drm/xe/vf: Update pause/unpause() helpers with VF
 naming
Message-ID: <aPj3AgztiXKC+iRY@lstrano-desk.jf.intel.com>
References: <20251022094246.3584785-1-raag.jadav@intel.com>
 <20251022094246.3584785-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251022094246.3584785-2-raag.jadav@intel.com>
X-ClientProxiedBy: MW4PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:303:8f::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPFABF58482A:EE_
X-MS-Office365-Filtering-Correlation-Id: 490d67c1-c2f0-4960-2a05-08de117f0046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xsRR81EtKlYTu3Ixrixn/7feqveOHqCfriXn+YUVGBnf1YO01KkB0KO6OHj6?=
 =?us-ascii?Q?8cHQoHECqTBU/m0E8ow8v13avo7WYyLnosWJ2DA52fg7IaLA9sEfky402ViC?=
 =?us-ascii?Q?imh2kNphM0ktkZtIGBf00aT4Lp367ADdcit9MpPl1BFhHgJM+YYimNAi5pCT?=
 =?us-ascii?Q?toW9LKeLFZHKDy7zanWvnYo2QucRDOIF8Nt21L5Y2+gclVkANpT4KF72ai1K?=
 =?us-ascii?Q?T4qOIB4wZwskV0cCAcnK6L4fC6NW5lwT5v9rvgqSW2qpRtyp3ax0nJHWjMBi?=
 =?us-ascii?Q?rrL99bhF535tnFcTTknA92EpISRxvGceJT12Ly/rdT/C9M6sZNhZ2wyunWUP?=
 =?us-ascii?Q?NT0qy1gyBaOo677O1TP8+BWXZjY6S71vOFm8FpQR9REUibny1Q5ojV6EIOpu?=
 =?us-ascii?Q?vQkSJ5Nqf7MtQK9STdNJ+mjn8P/LX2KCRqVx5KyxTfCLKRhxDNs1TQ165OpK?=
 =?us-ascii?Q?EEtB7EBcynhnC0hcy7OH7ZoCFd9Da5HBmnVqaQ3sGzHW9hQKmc5KSfAIiga9?=
 =?us-ascii?Q?7omdkR0SbBfuY0OdUdzePlHNipEYnSWVM8zpatf0Kma+53BPl6wJKZDDYBxD?=
 =?us-ascii?Q?p/Wew/cyMB3V+JaeR80UZ3Bb6c7G4uYulKhOWQ5TKhkw8DNjYAzeMEBhAvM3?=
 =?us-ascii?Q?UtQMslGSzMG3GHtJeGxvulG31Q8aXoHc8eOAeMbwdc3ON28hF5LxJx0NxoCI?=
 =?us-ascii?Q?gtBM/Rogb/Tf+JFs2m41ThpvkoOBMBoiT8GzqI15ExbV7QZH1w5XJNbtDjm6?=
 =?us-ascii?Q?A8zSK+or+Uy88E7wj1NYnIlDmQmUUMhJp+rXTNZmru8IpDflfVqOwINSKYio?=
 =?us-ascii?Q?sCcioFk9XUB86pO+rDhMBLDUcxw4dpuqhf4jelt2WGRpIfY0AN9WIn8Gik9b?=
 =?us-ascii?Q?FebxJVLFB54soom5XWhgeNeNKCJyn/rZZr1XUYPx86+GhUvonnDDFWlEp25b?=
 =?us-ascii?Q?572gAb2Fs20OMmEOz6vxbj4UCiYJTXRZyRaa2tRjDVlIdlFbKD2ttSWf7u4I?=
 =?us-ascii?Q?mU8CmZuc52V/A0ExhcRnF9x8Hg+iFDqybVfIfmRDKkTZehhzvexsOWDfP6CO?=
 =?us-ascii?Q?htr/b41o9DzkaQG/MJ5uJqb4qRLx9c3hNQVwW41Qgj2hCesdhgGmDDmetUw4?=
 =?us-ascii?Q?gb69FwFkRYcK5daNE7rsOxZ4gODn5MroMJU4D1agvZJy6p3/SvdTmz6bkr/n?=
 =?us-ascii?Q?KGpsRzfgG/SWOcyZmDiqt4MlnLu/Mh2jNzwnlrjYnCcXC3rhlQQ1DdkaZMsD?=
 =?us-ascii?Q?dn4F0VqDSBw57b5RNH/fiZ/OUozkV5jyz3Ke4lwaVOq9b3QqD5W3+Uyz9i3M?=
 =?us-ascii?Q?ifC1z7ImYpwmnlqu9rWDGlCXhuhyV9qVTrPkHi2pcCgcv6yaPWLGIoVUwjjI?=
 =?us-ascii?Q?YW6YypcKSsdljWixDRivNXKHZvthJk2siZNCsNZLo+DFc09zrYT2C4Wb5HUo?=
 =?us-ascii?Q?CqekAL/g6ElL1kvJ4TVM5mgTpRVu3uRP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eWlxp/FM+X7SJiIQcn76hB/O4P3N4dTe/3cuZrr+mR4g2Ts02fbbQvp5/qim?=
 =?us-ascii?Q?Vdjt22o5w1QfATJv8gzQpZC6aCKlXucMTaKPrG7WQnnh5iKX0r9PgrrBdAJY?=
 =?us-ascii?Q?r9KpefaLbLyQ+6YvV/qzJlcC4TdW1bQIMN7ExcPN0BFHuqw4aJp3qIoU81KQ?=
 =?us-ascii?Q?KbDRQxVyp2kw5FILm+1uGHPkWNcHC8W1RIXJO+MWjmcvwfqGWx8ZIjwnWJga?=
 =?us-ascii?Q?evrxt5j+jlBfdmZitBqYMrGQ46xFhMsVyxwGQz8UbYeLlAHDVzj7RoM8Mh6f?=
 =?us-ascii?Q?SKNa9QQ1Dqcr69Q97Ve01o4MzWUNejorkEw1WjDKFFk49f1lksbqLhNgLrz1?=
 =?us-ascii?Q?g/rpoCfMh7nEV8gIt+6mFCqndQqXyBnaJmJw9xOXmxVuGvh6FFbIpLWnjUMh?=
 =?us-ascii?Q?81x2PrRVkvTUwKerdPOKRuvFwPWRkAcKSlB1kGjW67+bH/sldryn9XsPdyOv?=
 =?us-ascii?Q?QjGdfPc7FD/udqa2nlNJ6H77NmRrIl3eWpllOzoRUF0nFyUSJetQ0JT3ryLh?=
 =?us-ascii?Q?6iFiqHOg6dl43k3nZKCXY+bZfPxhdjArpC0Hu2aOsPvt2GdFLdKPHja38O86?=
 =?us-ascii?Q?heizr1cj3t0VkyM6g6SbgJN27YxbcuwnNXR09ORpgdj17v4Sc1c6GTdn9VOz?=
 =?us-ascii?Q?dci5z8JJrmCnbFgvw1W98Jnv6wojlNsrr8oUmxWhTMqbMB4yVECZZHsDBIJF?=
 =?us-ascii?Q?vUMKmzpmz5fMyJwZDhq42wYYTTv0mwg/JzXI+Ju3QyGsOF0iLDUI7sR7QePJ?=
 =?us-ascii?Q?BqvlGVkSHeLIs2F6I64tLiT8uJ2shfKySM6WrOUrSRd5WRNZgocRDEna1AE5?=
 =?us-ascii?Q?LloNDKzrhnq7wpZi1Pdg+nYnR3qv1y3ggbsbtBlFizGhlAt/Wax2VzLt+2y1?=
 =?us-ascii?Q?9XQjfhD5Gp0zSfnxyVwV9k5rLYTJAS+GvoFyHme91babsoFvEHqmgjcOIqOz?=
 =?us-ascii?Q?gXKxYWvgA768plsQwjFUWGFpVmbdZTvx0hmSGaU0fd5UwjLc+xTg5OexlslY?=
 =?us-ascii?Q?o9qI+VYrr3qgu5OHr0htyyueq9MFRR6BuUHkl74/lp5qCsLl92fXx2lKpVXZ?=
 =?us-ascii?Q?YLhlNV2wPxk26WyK8/p6QmMEGCs3CuAY1GCGJ30SqQQG8m/x6eFVRRladlL9?=
 =?us-ascii?Q?YPFss2zbftS7VHOidgey4WCIii7BIXtJ3CF/2Afv5lM93vWoE1z+giyLwHXP?=
 =?us-ascii?Q?ZTMO7qDn1WbRQcGq1zGNtq8mm94EafnOPE31bCge6z1Mz8J0dq0m821s47wU?=
 =?us-ascii?Q?qNvcIRJd8/CYZOJq9jqdKaZcQNTZdn2r3+LHq6mTv66JEKrgK8QzNxhR/6Jo?=
 =?us-ascii?Q?cudHkMwgm6DNBwDL7vduTxnvuLAPMx/zrl4JBk2gSUvRnXb30yeAfWJHyhGk?=
 =?us-ascii?Q?KTMg+zGNcaX2PGvFT03wZlW7otTCGoM1Fw7pJBe9N71f9XaAg8woaFASHloG?=
 =?us-ascii?Q?inVfk3ExiGVYuCZ6ZrYO31BUwqtnpBVyT5+7VqsCq57UxQ/LZoKLNkJENj/c?=
 =?us-ascii?Q?fuQ5uQGE5UJcgCu8DF37Hg+wFxUq6uJYwtHKPrPmvFS1cxKNlsK9xHIk/e8X?=
 =?us-ascii?Q?3iauSchjXLS7ohGLehCeV84o+2t6qqK2kb/rWPqhhp1UcLJ2ZeNXKGwsJbkf?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 490d67c1-c2f0-4960-2a05-08de117f0046
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 15:23:49.8028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S1GMtlrrFudfOWtfZYw+XiCZ/L4r3o5Wu2AZdUUA01hIRxcxnZ+Iy4vRNKFXWj4/M4/kKu1eD4z3giVd6rvUYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFABF58482A
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

On Wed, Oct 22, 2025 at 03:12:43PM +0530, Raag Jadav wrote:
> Now that pause/unpause() helpers have been updated for VF migration
> usecase, update their naming to match the functionality.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  6 +++---
>  drivers/gpu/drm/xe/xe_guc_submit.c  | 12 ++++++------
>  drivers/gpu/drm/xe/xe_guc_submit.h  |  6 +++---
>  3 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 46518e629ba3..fca96556335a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1129,7 +1129,7 @@ static bool vf_post_migration_shutdown(struct xe_gt *gt)
>  	spin_unlock_irq(&gt->sriov.vf.migration.lock);
>  
>  	xe_guc_ct_flush_and_stop(&gt->uc.guc.ct);
> -	xe_guc_submit_pause(&gt->uc.guc);
> +	xe_guc_submit_vf_pause(&gt->uc.guc);
>  	xe_tlb_inval_reset(&gt->tlb_inval);
>  
>  	return false;
> @@ -1164,12 +1164,12 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
>  static void vf_post_migration_rearm(struct xe_gt *gt)
>  {
>  	xe_guc_ct_restart(&gt->uc.guc.ct);
> -	xe_guc_submit_unpause_prepare(&gt->uc.guc);
> +	xe_guc_submit_vf_unpause_prepare(&gt->uc.guc);
>  }
>  
>  static void vf_post_migration_kickstart(struct xe_gt *gt)
>  {
> -	xe_guc_submit_unpause(&gt->uc.guc);
> +	xe_guc_submit_vf_unpause(&gt->uc.guc);
>  }
>  
>  static void vf_post_migration_abort(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 0ef67d3523a7..8fbb6b27095d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2162,10 +2162,10 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
>  }
>  
>  /**
> - * xe_guc_submit_pause - Stop further runs of submission tasks on given GuC.
> + * xe_guc_submit_vf_pause - Stop further runs of submission tasks for VF.
>   * @guc: the &xe_guc struct instance whose scheduler is to be disabled
>   */
> -void xe_guc_submit_pause(struct xe_guc *guc)
> +void xe_guc_submit_vf_pause(struct xe_guc *guc)
>  {
>  	struct xe_exec_queue *q;
>  	unsigned long index;

Can we now have xe_gt_assert in the renamed functions that IS_SRIOV_VF
is true?

Feel free add those in next rev and retain:

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> @@ -2259,10 +2259,10 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
>  }
>  
>  /**
> - * xe_guc_submit_unpause_prepare - Prepare unpause submission tasks on given GuC.
> + * xe_guc_submit_vf_unpause_prepare - Prepare unpause submission tasks for VF.
>   * @guc: the &xe_guc struct instance whose scheduler is to be prepared for unpause
>   */
> -void xe_guc_submit_unpause_prepare(struct xe_guc *guc)
> +void xe_guc_submit_vf_unpause_prepare(struct xe_guc *guc)
>  {
>  	struct xe_exec_queue *q;
>  	unsigned long index;
> @@ -2334,10 +2334,10 @@ static void guc_exec_queue_unpause(struct xe_guc *guc, struct xe_exec_queue *q)
>  }
>  
>  /**
> - * xe_guc_submit_unpause - Allow further runs of submission tasks on given GuC.
> + * xe_guc_submit_vf_unpause - Allow further runs of submission tasks for VF.
>   * @guc: the &xe_guc struct instance whose scheduler is to be enabled
>   */
> -void xe_guc_submit_unpause(struct xe_guc *guc)
> +void xe_guc_submit_vf_unpause(struct xe_guc *guc)
>  {
>  	struct xe_exec_queue *q;
>  	unsigned long index;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index b49a2748ec46..cb5cc2cc9497 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -20,10 +20,10 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc);
>  void xe_guc_submit_reset_wait(struct xe_guc *guc);
>  void xe_guc_submit_stop(struct xe_guc *guc);
>  int xe_guc_submit_start(struct xe_guc *guc);
> -void xe_guc_submit_pause(struct xe_guc *guc);
> -void xe_guc_submit_unpause(struct xe_guc *guc);
> -void xe_guc_submit_unpause_prepare(struct xe_guc *guc);
>  void xe_guc_submit_pause_abort(struct xe_guc *guc);
> +void xe_guc_submit_vf_pause(struct xe_guc *guc);
> +void xe_guc_submit_vf_unpause(struct xe_guc *guc);
> +void xe_guc_submit_vf_unpause_prepare(struct xe_guc *guc);
>  void xe_guc_submit_wedge(struct xe_guc *guc);
>  
>  int xe_guc_read_stopped(struct xe_guc *guc);
> -- 
> 2.34.1
> 
