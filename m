Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7C0C77B7C
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 21:29:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE9A10E2A9;
	Mon, 23 Jun 2025 21:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j+BXVV7P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A827810E2A9
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 21:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750714174; x=1782250174;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JZRCk3FqatkoWtQTJ8uvB1S4fKO4OaNx4ZvkbJR97QY=;
 b=j+BXVV7PT2o+BFQrV7JfjNz2mM0cm7LyetgMe+KGBgWdeRP8RB8CO/e3
 tEyDEug8RN7HJY7KfKd1byq3M82WajzIgQjf1T7GeDWZFcwtdSIE7/puz
 68agr3q3pk0pjKqPNGsv9T02b47W4q/vz+ra4beZSiWyERkLqnS9HRd8N
 URjLecL8vIJtybfDsWqEMD8F3zUjQyOicbLD3ej7c3evf4xYB7eyWBTR+
 cEU6yOxNqbh7X+jTmGmEfboJUCftvfoEPEbKcxG0aUhUA+odBsRLZTnZd
 fXu9BsXaT2gYDzAaEuCTvgZiYQfUQcQOI6l99imD0iJw4Gtbn3uzBmqNB Q==;
X-CSE-ConnectionGUID: pX7cUMEETtKdyhKZWgAwcw==
X-CSE-MsgGUID: f/ZarRt6S5GbPQoWwGIRkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52654021"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="52654021"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 14:29:31 -0700
X-CSE-ConnectionGUID: ITAOIXlBQ1GcAeHGcRoMiw==
X-CSE-MsgGUID: ROa995LzR+q+kMfSrJRSxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="156282705"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 14:29:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 14:29:29 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 14:29:29 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.87) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 14:29:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fb+xtgGgRWb7rm11y4e1EyEuBWGD0NEb5Ak8AKLrJkFSwu5MJoKImGajbo2RhfJa4HETrXa2X9adSHmmX6Muu1QnVn9yqw9JHTWm2wooWLJGKNoY41scioZc+0sse6IkirXmHjaG9yhJW7OnhwBEZ1bmesembKBAi6CDNU9mi31qyx4WH2l5lhs4qH8lwO9rXfckrG8unQ1C/21BXRxM1RO9/bxeinOUUtAgZbnlTaKUJJF6iZE9ds7QQNYG8aCLQUD9oIZtaFHeVFAXKKaLWAueiOTGBBCwOtc6lpo61m/OVdS1iXIYIkKjjV37z40CuOdVJItFUPgV/D4mXV2Nkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+M/z8rfnZiSBVLTgEQMRj1GVBm9sOPUgzKpEtn41yk=;
 b=vs18DEemQzbBGxRG3wkZOKiQj7P1SJwhq0rJA3UeoEufAcR4FWsLJG5czGhoVTrRpbmgpfRoAzBGAxui6ULWNk92tcvMQteUkHfmATx/J1BZ6p33ojCOvm5ZvBsTOAhP9BLmNhAnWoYTVpKDEo2lqIGGBqmwHwxMmf1nEq6CztBg6S8VySnBdpP8Ga2jTffZmLRKbgK2D/s/pIRgrTRKus7b3q/t0ISJvhw0dwquf6lqgdXDBeHYiXOxjepJ/yYy8TwvD/p8+pDA0Lcmec6pnKGoHmHfSQqEkBTFoaDbUMZcFO0eDdap2QMKzUM25zUO2riKst4qRtu/DSCtqu6L6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB7721.namprd11.prod.outlook.com (2603:10b6:610:12b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 21:29:25 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 21:29:25 +0000
Date: Mon, 23 Jun 2025 17:29:21 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/guc: Explicitly exit CT safe mode on unwind
Message-ID: <aFnHMVSx8FRrT110@intel.com>
References: <20250612220937.857-1-michal.wajdeczko@intel.com>
 <20250612220937.857-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250612220937.857-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::49) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH3PR11MB7721:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f4d56bf-13e2-43af-e26c-08ddb29d070c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yLMEvfNzZpf/EAE9fYb80QSYSJHmZpMdjv+qKNZR2YZumSPOMooKMUbjiEf6?=
 =?us-ascii?Q?pIPHCNAU35e1NX/YDJv7HkcehwjLRcyl33IBV1j7x7qo8rYDseGdaS7nSx1k?=
 =?us-ascii?Q?x/XBiD3pTiY/E2eoGcZdzvJ3PWpunqtKRYjYr6TY8FIHyLwuLe6WnrHNgftA?=
 =?us-ascii?Q?tMUWVqe40hc/GLOx/1fHLpGO33x7W2WGuikEdIUtEButq8ErEqqnzgWkJFSu?=
 =?us-ascii?Q?E2seca055JTfD5bNprwAFgCSnMgx/lm67sZHqTyRQsq+6zfeLO4s4RU88cl5?=
 =?us-ascii?Q?AUFHPXWvUz2krsXA2DI7mmdeLug8ytQFYoPEtR6uKAIuT24Pdvb/3BTL38km?=
 =?us-ascii?Q?fNopt3oWG1arY3t+m3XEuxnLwpuRh12vV4XMJ4IkecsUs/Psk/gnma9GrYWX?=
 =?us-ascii?Q?xvuxo85ACxRVSmOF4C5gl9zzcec+D+QT+DCQzCus92s8E6dDv4hTrGjziPdp?=
 =?us-ascii?Q?WaatsdoGHZJqs3jjO9fzVnhlChG8ybxuOE9a9c+baMDzvRfsLaMMbhlaGbwx?=
 =?us-ascii?Q?QzJv7Wwn1SAuMYyRRzV3UARjomQySePvRHXP9e8R47zFAHc2sqSo3n9gtYr2?=
 =?us-ascii?Q?2lkARw2i3rwO7Kh+d/qpL1y8AeRuw43Xt418CRKtcMzL07GQeGnn4YUNaC6/?=
 =?us-ascii?Q?xrm6RAAfPtYtAtrhYtB9DTPHC9PozfelMTCv8bWxLskJYHf9Da62pN8pk6Jr?=
 =?us-ascii?Q?A0eMl/tsWwIkskZZG00/N7b0DlJSuXvYvcD54aG/X2nF+KW4OCa+DR4oncpG?=
 =?us-ascii?Q?j+PX/Y9JH64jDFQK6HF6+zhJB2EwRy5kLz5j1an2wUstQn1C9s7OSgRmIRHi?=
 =?us-ascii?Q?qNnPnRqquxE5cdRwzXkbUGC1zZdd7eMcpiSzXrk7p46jiWp54uaaz2Ct4khP?=
 =?us-ascii?Q?qGi/9Y6oR1T+W9dFzFdUkhb+FPEiyVW7/4QyQUQKr3bf7wQWjl2LmGmonpGv?=
 =?us-ascii?Q?h7OYSQziM89/IGOwDDOEyDaWl4s6ZvfJztVD/Gxg1SQh1SDV9Prb5F46f8Xk?=
 =?us-ascii?Q?HPIP6CR4qg1bkwtc3SUaJ5JBB3ZgyrNfF/mXQhTARr6lh0PMGURaxil1Z80k?=
 =?us-ascii?Q?1yZNCapsK8WrEnMUQJLoIfxVx5UmRgQQmIt1htSECktNFBm/ubwKbPYVx9Gw?=
 =?us-ascii?Q?BzLcvULRMGj8sNxWc2+75mLYJEq5YxOKVWOaZgRrFcVKaQHOopVCJTsOR6bv?=
 =?us-ascii?Q?wYmucRKFl5eNtsecsDm8BglNdf1+K8/Dl23iIGwGn/yKNvgEiuyWq1ViEVOo?=
 =?us-ascii?Q?PWlVOI1a70ISI4B1PdjBUp6d1QfBruAl2xwDN5md0f8DE+ZQf3MgFcVL11m6?=
 =?us-ascii?Q?F+6uMIQfgnk8YMKupxKzXgJnPq/52DNnzazfll3qEdtp+RFbocSXskGzM4kt?=
 =?us-ascii?Q?BHVVl+R6WO2gbimNQNDMNioSfITHdpttydkhR7F0F6HPPGsKuTcmQB2rJL/S?=
 =?us-ascii?Q?tgmjUkCcvuw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kKFf1F8SONpRYPAmHQHpBIqxdsIlom6kLWGoiihf8XmiMSxeTyFm2dki3rUW?=
 =?us-ascii?Q?CGoXtjmWZn9sO4RKAjJcGNbkUGmH/6zoyyWrB9lR7kFcxYuHnT8EZ57KEnIq?=
 =?us-ascii?Q?nGdKGw81jMCwsBZo3G00iXDw7XUdv00Yu0ircxa46Ap3Z5HUZnjfGgqPuTIZ?=
 =?us-ascii?Q?dionjTjMFgeUKD8DvgSrd8u+zvblshYXgKWLldfGfqflVKo60ZrkLoYhT4Ji?=
 =?us-ascii?Q?xO+HJQJ3SsxGkpG0zfYassdMvyfTRkEBO+zPMC+764/Gnh8glHCse0uYi3nt?=
 =?us-ascii?Q?IY5t+gm1UL8VlEVymeODRPSecZxBZ2zBRwMEpOzoxZuzxAKWqSiG+U9Cj9U/?=
 =?us-ascii?Q?OTBjYFtAOwFQayG2XoF9YsGaijUCmYA/3bT6rlTRLXRSdXPeIn8aUHQST5gK?=
 =?us-ascii?Q?5g1xWuoFl7b+gT0QBFISM2Arav+aW2cNhVF4r2B6Ou67epziCIOYDirY+s72?=
 =?us-ascii?Q?pPgPcCNFEVCMvck1BmNNFrQ+PNcOzYPUmhXzXQoAOWHnygqmp3X6s6I8ini7?=
 =?us-ascii?Q?H8zSAao/ktsDuwUX+5RxKNFFXw2vMo4aLQ1if+jpNEr7MaiSGxjwtdidW+mm?=
 =?us-ascii?Q?IZ4lo81FmoHRrUQcWyt7eVmETUxaI9TPUZikVcGvCiS8DbRjAPwolSmrsVfQ?=
 =?us-ascii?Q?ZsEydNGadvi7rqE0pvAeM84IIiYW5kG1m2Lyqy1aKf+nlzns9iCNc1BR8XT0?=
 =?us-ascii?Q?V1XQQsOouWUazPZYU/go3kw3iYWv/dB8doBBE87y8gUlEV4Hqcl0wZ23qmgZ?=
 =?us-ascii?Q?5Px/9Ptvj69Ay/KikJjrWt7rAq6W+g6Q8/R7RCQJRGMNobaA79oNVjjOarF8?=
 =?us-ascii?Q?Yrc20xKp19lKV3JtxISMrusOvsbJWan8T9kAV6X4zo49uh3A7ZuyhQBg9iIg?=
 =?us-ascii?Q?RyyGF3tysoBoDHfstkWSGYADbxaKfPRgCFxLs5x156C4e/hNvOpTfKsFS4rH?=
 =?us-ascii?Q?mH3fwGEMnKp5BicMbjerdwqPNpMhlLY5hd+KbOQ8Qo9d60ynV8GKze/k5C3K?=
 =?us-ascii?Q?/t5SzS2Qq3QhY93JNhg+/fwb6/6maOXFa5jQvrl+RWSsHOj8v+/3lKvv4ORB?=
 =?us-ascii?Q?Mr/acCyq78jgrGtU/Ns/xUE1qKZ+e/e4X8Ybu9xuC06CyPFqJjgl4EU89+Kx?=
 =?us-ascii?Q?Ef5zPuHBusoFuGaNOxdMZlz7jiNWdM+WDp4MR06idE+O3isRMNI8c6xxg+0I?=
 =?us-ascii?Q?9eRECNcJsamEv7i5Crd707RV1KCyIycvlL+fI5MCLb7/InWM5veEwfRSwUSg?=
 =?us-ascii?Q?k1aE3/UERXRnkye068V+edKXmwEiHBY34WxHVP2S+Fd5voUEO4vOMaYdJ+2J?=
 =?us-ascii?Q?2IpLOmeS93U5LEJbLHlBO21DoTsBkAyRtpMDke5S1pwyhgyjhKsXmXqV7tzp?=
 =?us-ascii?Q?zFPIN3FkYT9JTmEQC5AmqmJ+ZZSL4rfGSL4LyfRujH1UR/OYvreJEGZB531U?=
 =?us-ascii?Q?I+m0l1u4q762OSxSfa/mbfz4Shzvtyi+VAFS7BPt5nwWh/SolqXGmvtmsXts?=
 =?us-ascii?Q?/qfpFKqPfcx/IXxDfj0IcPcMNoVmeepKxNJTkhWI3lMpXX6Pc6jq0LSWA6f3?=
 =?us-ascii?Q?0kZ5SJ7Cnrztpe2vRRytL6gtwKSMDsDzomXMQ8jN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f4d56bf-13e2-43af-e26c-08ddb29d070c
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 21:29:25.7269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5dpl9HKD6Zap/tmflzWY7S3inl6MqQGV6KwWhg1aqaZCYhU24wLdLEI/EuzwTBd7RlQBFXjgO0fv6jDfSfi18w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7721
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

On Fri, Jun 13, 2025 at 12:09:37AM +0200, Michal Wajdeczko wrote:
> During driver probe we might be briefly using CT safe mode, which
> is based on a delayed work, but usually we are able to stop this
> once we have IRQ fully operational.  However, if we abort the probe
> quite early then during unwind we might try to destroy the workqueue
> while there is still a pending delayed work that attempts to restart
> itself which triggers a WARN.
> 
> This was recently observed during unsuccessful VF initialization:
> 
>  [ ] xe 0000:00:02.1: probe with driver xe failed with error -62
>  [ ] ------------[ cut here ]------------
>  [ ] workqueue: cannot queue safe_mode_worker_func [xe] on wq xe-g2h-wq
>  [ ] WARNING: CPU: 9 PID: 0 at kernel/workqueue.c:2257 __queue_work+0x287/0x710
>  [ ] RIP: 0010:__queue_work+0x287/0x710
>  [ ] Call Trace:
>  [ ]  delayed_work_timer_fn+0x19/0x30
>  [ ]  call_timer_fn+0xa1/0x2a0
> 
> Exit the CT safe mode on unwind to avoid that warning.
> 
> Fixes: 09b286950f29 ("drm/xe/guc: Allow CTB G2H processing without G2H IRQ")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 822f4c33f730..6e353757e204 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -35,6 +35,11 @@
>  #include "xe_pm.h"
>  #include "xe_trace_guc.h"
>  
> +static void receive_g2h(struct xe_guc_ct *ct);
> +static void g2h_worker_func(struct work_struct *w);
> +static void safe_mode_worker_func(struct work_struct *w);
> +static void ct_exit_safe_mode(struct xe_guc_ct *ct);
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>  enum {
>  	/* Internal states, not error conditions */
> @@ -189,14 +194,11 @@ static void guc_ct_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_guc_ct *ct = arg;
>  
> +	ct_exit_safe_mode(ct);

I was going to ask if we also don't need to disable more of the ct
at this point, but I believe it is indeed not relevant at this point
of the code.

But it is any possibility of double call of this function in some of
the regular removal paths?

>  	destroy_workqueue(ct->g2h_wq);
>  	xa_destroy(&ct->fence_lookup);
>  }
>  
> -static void receive_g2h(struct xe_guc_ct *ct);
> -static void g2h_worker_func(struct work_struct *w);
> -static void safe_mode_worker_func(struct work_struct *w);
> -
>  static void primelockdep(struct xe_guc_ct *ct)
>  {
>  	if (!IS_ENABLED(CONFIG_LOCKDEP))
> -- 
> 2.47.1
> 
