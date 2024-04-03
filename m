Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E66CD11C2
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 03:18:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49149112360;
	Wed,  3 Apr 2024 03:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hJDRXw/j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FCC112360
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 03:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712114311; x=1743650311;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DsYdZY5WNTR96ULhKHO7m3nyZ/09c5Iy05pFTd/SqJA=;
 b=hJDRXw/jM+I2y4+SBitWCoFjfL9avUj5tJI7LOvfqF25GRVnINWSrAKj
 4ag6dmNSkmGn5MsmeizB+EUsEGthZ80lCthF/JCaP1bk2IjrgfIXYuE9V
 5eb7oUNrLfI/2mdwwKNeZpUnHBEldldYBv3ySZ0f+rTpYYWSmzHbwlSgy
 9dP3XCLE9DRBIH0N2zAUk3Rcu1myEDc/Voq4eJxAf01Pnqp8ZMMJgRlBo
 P8nw+TLvxZaI2LoOmMK9DvzDay5l0S2wGThIj81RJ8ZuX2XB6NBVl1ofW
 hGtQmFftLwkWDFf7JKhM2uPQ9+PEI4HWSfv0QlJY/S2ngKYaqtisuOxOO A==;
X-CSE-ConnectionGUID: HAFsv0JdQ8K2wo0ctpJ9Hg==
X-CSE-MsgGUID: ph0TmVMIRhCsXTnwo+CcEQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7223525"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="7223525"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 20:18:30 -0700
X-CSE-ConnectionGUID: 3SWE4o5/TRO+C7Eu1Zwkjw==
X-CSE-MsgGUID: Q6KXT0xLQ0CX/NdpAJPZrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="18745931"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2024 20:18:30 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 20:18:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Apr 2024 20:18:29 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 20:18:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ICwy4utItke6aG/HC+TEyqRrfdcm2LX0kwi1BN7yaSXzH7ZDfzj//9CajwUbEvTJkSIf+kwUHxvGpId2aYB0aOEYOnBkr7V5/k2HGkGEjymsJTp4zQRWeukoe/+mjfVqefhnp7YE2PfiLIAQSX+VFuEe/KfQJVeVtR5Ir+Rr0RE3Euju4xrZOJu0ngQk+9TpujOQyFJbez4vUGZpvoMrkWMGcFLBqswuCSpDZ5mZcCBY85xd7h/mVDzgLtEN/hbcL7yqJLs0MRlZEyKD/n2aZKBFq/vKdYU8T1eaBnefKBZG8nBnkgrhtFeJYwZhtt1pC2mrCjbRCXecgQwxG7E3aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MABEKVesNqWi0vM4X7FvgJH0vW6RNHk+8+ZdwCnB0o=;
 b=SAAHkRKgJpteIg+u3VS/qEwzYyNydexH0/TvKNG5TmJKreGyND10RL2ZqQgalk44KF6ufjbujhycu+TPAC8PzEgpZa1jP2TzfvYXQCSxMn4S/OiNljjJo+PSqapERxp+IS4CgUo/2KG7dvciIjl4ycVaQZ7WO45T5zs+KJnz92A+zzhQLD2cbUW4eu1MUyDy5QxO5pe2TWeCwcSY2b7nsdNcKfoomLTkW5L3kQnBhAUa156xf8xp83+xGcLqXauxfgsyCpLtcaTUE9A7a592vXJ86jIFXsgzetEziXzIjaBtn70IlQ81joPA3mhynTjgnVy4koIx67hFdvsz6pGAXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6828.namprd11.prod.outlook.com (2603:10b6:806:2a3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 3 Apr
 2024 03:18:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 03:18:22 +0000
Date: Wed, 3 Apr 2024 03:19:12 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <john.c.harrison@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/xe_guc_submit: Fix exec queue stop race
 condition
Message-ID: <ZgzKsBA94vHT4Q/1@DUT025-TGLU.fm.intel.com>
References: <20240329184929.3675256-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240329184929.3675256-1-jonathan.cavitt@intel.com>
X-ClientProxiedBy: SJ0PR03CA0146.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6828:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /Ar920CwJfA8AQuJ+w6QntDTHlV/rT65lMERIssddmPV1t1qlTB0BJl4HHb06ITp73aqJHtdV2DnaeBpQ8utRAJEpTLi1Y5jeNzqY7rZfdidJbx+s1mACIgIJDUY2Npn4CodNFeCjaPzonJLbOM/6AdRGXicCY0JV7lFQ3bahes26NISgRYet+JTFIk1BMafBfUnJgjzmb4EGdb2/9KAPIcHG3XNSG/X5ZTj7SrRf95MYzY5qA8YMpk+EdWc5MT04HkERk40hpBExCDKBEcnDW6L2VsPdat6ti4PkZ1VU8ZEDLMDGQs5154NTOESGcBxSHeALfznquwQg/DqxI+1uhpuKqppmqXSdgeRfj4SlsNYPGgsDBo5IKsLXmHwONF89sbSAeA+QnAbbKP63K7mw8QV33HepDGIPA9+k4XdmJEwDPevPuCHlbTCKt36J2hZgOit3Xc9DFQTZKhmRIrZY/nqd+4wNbSFdzXv+13xwK79Cc48Aleo5CH+3JsTPayQqZpAmp4TV+ETc/YbwYH8NI+WAlS5TMkMTXluoEq5AIdpOvCt/eVgaB99aVkvw5QbVR54tCJ0+99k0tXTejyiuKb5I55KsoJGYbgwLHz2W9mYXm6b1iB+01xxYkvzoJiXv1SabltcwVNxCFdGZFzAFhtZjsrJ41qicPCPDHRkd4E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yrz49VZo1BKChAd8oqV12CvB7iLQnqfTU46exaQUDoZPQNQHR5VvwHSSPkiD?=
 =?us-ascii?Q?psbcfawu/jrrI3aIVZ3ms09unNYx1IPZ5q5aXpzKveYQmtbEhLhECaIgjhbc?=
 =?us-ascii?Q?3RQJZQhkM8kebeyI2NQGEPI0hO4Tz/KPtn8GLw+BbrEIdcYOsJEU/HEVWoxx?=
 =?us-ascii?Q?v+hLil37mN6gqvzI2QCakIyKSxjL8jroR58FGxtTevSBGS+7tPbWjXnUCSTi?=
 =?us-ascii?Q?DRNESUsTSRd9Jqf5YG69xxxGT+WZAZ74EieuNP/Ar6hvo2hIId5cZqx0xag6?=
 =?us-ascii?Q?ukr6Gxte8Fd0/P8G9BQp+Zbru5DOL6a2DHKerCwrWn64/R5FeJpAHclX4oaZ?=
 =?us-ascii?Q?ZXNb5U3BcTp+mbaxfGHQvumAnfZTgLJ1geIMK+c5DkDIARbYqakget5FbPf3?=
 =?us-ascii?Q?SjHUjDF8+9rtAX6CNyTs4o44OGum0H4fl6YNhc+ryCR4HHyOwRdHCoeWfeSl?=
 =?us-ascii?Q?cZ+N/imF7L3qgaj1vCbawMSJkNxFvzXiZLmHLEZH8pYxtdijxOCUZgIKCdwz?=
 =?us-ascii?Q?yWkq92nIMUIPm/O/GARBraKfniTn0o2qLXvTLE1K4IBctZqtwLSHxSzvd9g+?=
 =?us-ascii?Q?n9OKXFlNI4kqb50HhoKRdMoXT+o3nimUK778grCP53f6ZSkiNHyMHJxso5JF?=
 =?us-ascii?Q?RzjI1rWf88BxxuYW2Blx02KCfgapi/zmfhFd4qfKe/5QnN8+6dgOOdAMhqQ8?=
 =?us-ascii?Q?1J0Wf8tAazmSUu6WMqAa6Go9zGWn/XpAx+olqK4KPEq5FKEfXYmZVEvWeizO?=
 =?us-ascii?Q?MUazzg/kNDVJ9+YgCr6aC1Ss4gdhFEMdvomiAcyrrj9UHdg96x90hzRAuLQp?=
 =?us-ascii?Q?UTT0VubEFKDmiX5DxQRbJYuz/u3X3eknB2MLHmfqmnFLNAmzk/w2+4MYJWUe?=
 =?us-ascii?Q?xQOKb/ApW0YmDYvXh67UY+XWHHpw3njHbDcWy2FmsoGkEE+QMzYPUdGSu9h7?=
 =?us-ascii?Q?mYA2eBhKt9tny3bv118CqiJ7pO3I0DI//GPosuQe0A4fMiuYEuvXOgEjONop?=
 =?us-ascii?Q?VgEofclAYwBFP5f2fgDHZx8cJFtTlhdZqVmLZRgWzkbZLafZoiyL5CeTvF3y?=
 =?us-ascii?Q?0Zi53v7WOLIY5KecVLyNEi1lyBoBWeAxWf2xRRi9nyZ2jU1XNDwxuMhobDvp?=
 =?us-ascii?Q?efPuemyKX0za+BzjFtXdu4ZAH8l6g/2sHxGdnwO8kvnj1k9/mnRyBwAH9Wgx?=
 =?us-ascii?Q?eLeQpNsxdHtDustpHifrlJ1Ve+mFKYT9m4DJuPH9zwwa7DhSiPokfU2RvaP6?=
 =?us-ascii?Q?gQYou3e6j3+Sk7BaH2Kpzjo3qfxqlugpxpV5QfJ0GTyj3ddn3sdiC1CN3x8j?=
 =?us-ascii?Q?iBzUZ6dwVvi5hnbKhMc12mdq4TkZ7INUtc1ca8uZ5QPBSEp2RkHwQ73KtTh+?=
 =?us-ascii?Q?2hWTIRvuVeHIXD02j6doWSXehRfIYGjIGWM0hqJP2p3m3v0vAVzxE/6jgJCY?=
 =?us-ascii?Q?eUKqvgzm35ygqfOGf5FAACRdwrT1XlSEd0XQnCtHHTibtraz/ZAU25W18Dx4?=
 =?us-ascii?Q?Tq6ellgmBSCByWL0+oiz4i/9XevD9JVqCCGjZ/MaBz+buzQLzawjGFSH8UBZ?=
 =?us-ascii?Q?ihtrAw1y8ySwn99V6nIkwa8M6/XbtzkFdP+Atk9wxjYVybLORg90q26gJlO2?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0876ad98-c8e2-41e9-8df8-08dc538cb7b8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 03:18:22.3928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UqGZcZf14m6q7nwuVLUlgaQbM64SUnJKiF1iPxd/28USsIFFpGAUorBYXlZV0tPlCTYid/Q0h0S2iupvi03lRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6828
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

On Fri, Mar 29, 2024 at 11:49:27AM -0700, Jonathan Cavitt wrote:
> Reorder the xe_sched_tdr_queue_imm and set_exec_queue_banned calls in
> guc_exec_queue_stop.  This prevents a possible race condition between
> the two events.
> 

Patch LGTM but probably explain the race rather just saying it prevents a race...

With a new commit message:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 13b7e195c7b57..294f40ab6aaf1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1430,8 +1430,8 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>  			    !xe_sched_job_completed(job)) ||
>  			    xe_sched_invalidate_job(job, 2)) {
>  				trace_xe_sched_job_ban(job);
> -				xe_sched_tdr_queue_imm(&q->guc->sched);
>  				set_exec_queue_banned(q);
> +				xe_sched_tdr_queue_imm(&q->guc->sched);
>  			}
>  		}
>  	}
> -- 
> 2.25.1
> 
