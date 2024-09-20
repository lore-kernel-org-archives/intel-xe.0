Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79747CF9C69
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 21:48:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D92610E00F;
	Fri, 20 Sep 2024 21:48:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4/4+UbK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A7910E00F
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 21:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726868908; x=1758404908;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bJ+EeuVZs1kXHb+ENwkPcVxC5AVm4xvqY3t40G1+zAg=;
 b=G4/4+UbKIsy3XEkMbLXMkhXSuod2uA+fuqGYLMWE2aJ1qPbqFWTjn27V
 Nze2lFrxnDL8FtLLfMoAaywPE7Fba8kk0PFdw9PXWbmLGX/RVA+CmPQaF
 DddBuVy8WBPmSvniLPfyCY/+B+EK+3B8dKBvjN9h3jE07McskoM6gYEzy
 1AXzX5bviLtuFazCUp+ANGNcatE/0IbYjHGYPKjUSJTZfA7dgO2gkJAbe
 iSk/Vz3k8BoqJdYOAwWn4wYoHEZJgY/nm2uPJa+Xv6ECb0cNNgvPpamBa
 olRx1BspoDhp6ECCqvxU6y3ogpdZXkKzOTNs23criO0mMmUyQDClKkccW Q==;
X-CSE-ConnectionGUID: mdm5uGZWT0GHkK1tSMmn8A==
X-CSE-MsgGUID: UJHc/jQzQwqjPJrDFJ689Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="43364323"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="43364323"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 14:48:27 -0700
X-CSE-ConnectionGUID: J4TbyB+oQBal4XhUq5/YcA==
X-CSE-MsgGUID: T8PM4h9bRMyEQW0qLbXvDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="93772693"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 14:48:27 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 14:48:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 14:48:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 14:48:26 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 14:48:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bae5EaWEq6S+nVkY6kfk7z2d+5n2LFeDau1Db1WCqGWNa4Q8ZBNoViKNOKX0SB/kNbSaj0ndAFaALEn9gZFM3j8DDz8qZiixnBQctz0k6n0GBzpPJ/CsgAkiiIBbR5k7L3kewTrjxN10G+lOsWqTYDRp7I4SO90/HQQH+efERgRPLMXTqey49fM0fJLhWSH29Je9Qv20fxB7Wsfb2EWqR72FFR5m6uFdMJkoGiN6ejQmKeopY4n3kXPQGt/FaZIu3jKNPM0WV1ND6KsllhNJJEDb8QeY+llMbG5dPtBAt4Wxls7LB1CkfGDllQY2zJr37bW/sHCXvX8TLxa4cZauRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqjlbvcBXv9vohgp3eYDg2+g2C0J8d1FU7bwmcJG6Ow=;
 b=nKtiw4n4A5zJ81IqMM5ITsQb7CXGZYMnievvvK/evaR/D9QaNk5IahxEJYjei0bYBXAcEVrnQ69tKrM9BcIUlpSWNNxEWKUMJgSy79gJibvW4D6zrb+VuYuKj1cPjJdxMKv6GahzRytEChpUWVCxyQ81+zMPDY5H7bSzkBsaaDGxwy6FmajeaL0TdfM68Smb+X1LRSfiX6h01nE0GyXdLteSBUthUG07Pk6rk82grJtyDGruWm6Lp9gCPhe9pwc7yYNokvcCSf84fyq/MVgbpTNWLZWZjitdFvc+ofRH/vidbB+9vrHlkze3I3afMEybgFyt4kTqJPQXV4jrEzZzyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by DS7PR11MB7808.namprd11.prod.outlook.com (2603:10b6:8:ee::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.23; Fri, 20 Sep 2024 21:48:23 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%5]) with mapi id 15.20.7982.022; Fri, 20 Sep 2024
 21:48:23 +0000
Date: Fri, 20 Sep 2024 14:48:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Sai Teja Pottumuttu
 <sai.teja.pottumuttu@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v3 4/4] drm/xe/xe2: Add performance tuning for L3 cache
 flushing
Message-ID: <20240920214820.GX5774@mdroper-desk1.amr.corp.intel.com>
References: <20240920211459.255181-1-gustavo.sousa@intel.com>
 <20240920211459.255181-5-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240920211459.255181-5-gustavo.sousa@intel.com>
X-ClientProxiedBy: BY3PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::15) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|DS7PR11MB7808:EE_
X-MS-Office365-Filtering-Correlation-Id: 0714cfe7-048f-46b7-44e6-08dcd9bdf377
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BznkOyS+t5xLU6oOv9YaE18/n3OszfFNFojqbnsctrMqe2MFK2ChT9F1LCMW?=
 =?us-ascii?Q?QusEU8ZcQG88IlzDwCrbOjA8mmrOcCIQtbDnbWplfBXLO+vzMLcYRJ5PSIUE?=
 =?us-ascii?Q?RDD+P6WC6/2f7icfP87KoO8iBptXYb/KPPPSfOe+FOw2XnIyq9FZa1ibp8zW?=
 =?us-ascii?Q?BD4T2M5N6MYNjcx/hD6WMIQfGM4p2Xx4g4bExkbpkQBHPVjHxFSkLwoqqVhu?=
 =?us-ascii?Q?u+kr1/g1u+3wyvilaV3+VywgI3NJOQXh6v7ZAx3JZyJqkZx/r/NYBDfRMSjp?=
 =?us-ascii?Q?yFhCPHdBamR+gWhKewN5zLy5GgbKbD4LBs2YWh0xcKdTff+r+Pd3ETWcaVfo?=
 =?us-ascii?Q?5Bd1C4Cz8LP/jM8yKnuSCQufv1tXnqe8/t0ozPJ9RWPTb0J+C1fvzDXGPwJO?=
 =?us-ascii?Q?SZYbiOgDPWqBiuu8Q9iKgw6+M8/cm9hhBDr3v7pwcG+SBRYMFrZZSriTBn+a?=
 =?us-ascii?Q?AWLyj9uUyvI3GnSY8lXNw+bEepMSXDRrL3M3cs4Xd0TiZIUrfCoz+GehYqaE?=
 =?us-ascii?Q?8k21Z0trrSAs/swK/V9h4kF/pCDJCxNQPFtRNC5O7RY5rDpnTFAZKiYZvJ38?=
 =?us-ascii?Q?AnLXHDmQUClFjnny+1rUqk09k2ztLcI7toAsA1mStwY/6GYDDDu/j3WzUINf?=
 =?us-ascii?Q?uxF0AaoSYpBimkyC0FFwdbrqmrmpRsJL3OUtLGJCZL9pHDZvcC5ggLIwiBmm?=
 =?us-ascii?Q?lxj+aZ48GTGELPjqnefU93v/tdua7mjdyTP381W9XzWyShm89rUpuk7uqKxJ?=
 =?us-ascii?Q?v4FCq6mUr6yOC0uVXvar2O9UoS6LDkRfwpn7Lv11LsOiDQj1CGHn+fLx2lzZ?=
 =?us-ascii?Q?9hqETFXSg5MttO7XUZIzdpSbrXrdXKMmzfJNBkB4sG26Z9C/QOHr9tDKi/fN?=
 =?us-ascii?Q?WlGvDduNBkMDL1LAmRFpdeSaU/lqJqV8/k+Q0C4KpBWL2AiKYMN40irV5fuu?=
 =?us-ascii?Q?DPrXsPL3oJoWZRPCkwzSXr5F1b2dSmp+3QYaq4/5agmYtfxCRkzE+ctC0IKY?=
 =?us-ascii?Q?1GjTJuUdAq+2zYHekAXKNk5wiAOFswih68JFg7CHtMwOjEk6RqY3kjbxabPz?=
 =?us-ascii?Q?pO5fGQVzyu+IoJzwSwanN3dp3Ys8dVuBfPS5c+qg25LQqC+WgiqFrX9Alr33?=
 =?us-ascii?Q?OlQyweaD9urd8rYg2oiMRIIt4yeCP59OW5/ZSNstwBxrBu3VB2YUHo4zIC65?=
 =?us-ascii?Q?YagQw0ej6Sb3bxHSx2Ec3tn+6aFqbEpz5orGaeylD37gdIR5EZeoV9KwWc+k?=
 =?us-ascii?Q?R/aMj/F4TOV1Zy5+7EeBhFw0F4qRR8+ayp3lrIDJmZ6PdID6VTZwcWPnCLB3?=
 =?us-ascii?Q?LuFlUms+ysrZ5sDGl4W6b/5ArP6UJYuyVaxDFNAG2yE/1g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TfEu0LObIzVupjAR9JTdADrv73eJ2e0oaOnUurkTOznIhf3ks6+IpcVi0S/1?=
 =?us-ascii?Q?oKByiWy3lJHmooL954VZh2lm/dVsvQyj8LhC9kqfJ5Qj2X082xSaBtO5doSx?=
 =?us-ascii?Q?obaChi7y3J14QIKci/u6M++njBJXuKIFV10E2XxtE8aPJ0N3qwiG4UNxT52+?=
 =?us-ascii?Q?RcqIYVwPAWbExDU3lmTpLPyDqruG3LMafpF46VsC48mgLKXoCCbHYn452FNi?=
 =?us-ascii?Q?qpkDa1V9KMIXiO+K5jEv8fABbH4tZh9r9uwVfGWUm0dRTk8YLRdYvOMqPm3a?=
 =?us-ascii?Q?JQYsw2JkMyRXZeR0Yep7kLitE4tCB6yyf0GFT13lis4wBeMrurER6roCID2c?=
 =?us-ascii?Q?Frdf9HCrxgve8ZJr3Ci096mWro92TNU8EgG8Lu+43HH24hIJ5OEaeW7NO6qz?=
 =?us-ascii?Q?GrJVSEiuiS2DwEjbMkVc03f3T4V7Xe9SUVm5HkinR06mQQyKo25kh8JCERTR?=
 =?us-ascii?Q?acl39ViamKHMQ4PyYW0pCHCjnF8cPfS8BF1RJXJBuPPNKvlZ0SwmeSYc9CL0?=
 =?us-ascii?Q?4ZGQhcRFrBpZ/5yHuUUFXY8Z6SUAIiFYl3/vFA8xrvr+VktZWavX/RuvsB3B?=
 =?us-ascii?Q?SamoWxHGGGbo6s83OGhwtSZq17lmdzjPUNisVYc1cf5bF21YbYkqGv08r9W6?=
 =?us-ascii?Q?zlbw50Pd7QrWv6fX26LtnlYAxtLz3wLp573nktBtu8MFt7vAujzOhMLgG0Ko?=
 =?us-ascii?Q?LIjiFyon4QovGZy0W7sV7jIXDX6T6EoAkFoo+fnjIKDmhxD9DQ10zLWNTH5g?=
 =?us-ascii?Q?45JTJOKCDRnnZVCzI4z0nzzW+N65jiw8z7ZYFjawG68TD+PgEfUUZUXdYnqu?=
 =?us-ascii?Q?YRq2mwqE3yQ3jw3Fn57xETVoO0gn8XMYJCYr/xEx446qBSSCEtIuN98ZFyh9?=
 =?us-ascii?Q?nnf/Lnb0PjoLheKV0+RCLwtTFbtgtKj3x7GPTaDFEmJbnVTdtXWWq82ZOqW1?=
 =?us-ascii?Q?Kpha6Go0WJlPLsKcYmsEEvc40evdQjpgs7uGik931nd4TvSDv/SSc+npmd71?=
 =?us-ascii?Q?4r2YxpIeUp1WUhe+U2QUgiUohp/hsmp1LQtiOoqypax4WHLAJa/uA1xYvJZh?=
 =?us-ascii?Q?aqV2TkObtnSoOkUU/krtlwiKdFK/+6ayf4CXLUBPT4k7ZW5Ea/19MQBHFbut?=
 =?us-ascii?Q?KiPIkDB/lVfVogghkTgsqsFfuDpzmOiAF7RKPClMlWIfMfpAuYdrx4NHyDt9?=
 =?us-ascii?Q?Z0sbLK8Wv35tnCtDqNTAk6KnXWIToSeNd1yUh8/85HhJ8wNRsq8EDoHG+AbC?=
 =?us-ascii?Q?nRlT9eg2DDjpj8pC49WkFIcvm65KS1aKLfrckYUvbw19NuHBQiTQoilkfWpV?=
 =?us-ascii?Q?vR9FKULIM11ghtnm5EM7bPLq3OwV80T/QrIUKve3gm1+Wlf7orpgIUSlhM5s?=
 =?us-ascii?Q?Tf60QSMdpLxPC+QrovZBbe1gRdN5f9c7lOELQpSDirj8P7GKQ9GWv4RtuS9U?=
 =?us-ascii?Q?TGXI/qMAGHcS6O+3Q8S7zYEA5VrKb31yNrOB5yb+gnPjYAw3PkjwrNOl2zNN?=
 =?us-ascii?Q?hkgKWFF6aJXvJktBeLaHFjEvxGkoebTNRuxPGhCbs48Ca21Qn8NjbTCFGDR+?=
 =?us-ascii?Q?Jg6dwD+Poo1CFU2hrXIL9uFViJ61IDtM49JKfNDoCEVCsQIYT+9MRx1A9mpU?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0714cfe7-048f-46b7-44e6-08dcd9bdf377
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 21:48:23.7622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQmiuXCzLFyDPP0Qlyt2OLsyu/iIpbir7fPTZkPQjib6q4uo2fG2s2bVYulKmVKzYXQdfZqhhZQLGFvNa1l/Hoik2Kwnbqv1aLa5+jWpTl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7808
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

On Fri, Sep 20, 2024 at 06:13:18PM -0300, Gustavo Sousa wrote:
> A recommended performance tuning for LNL related to L3 cache flushing
> was recently introduced in Bspec. Implement it.
> 
> Unlike the other existing tuning settings, we limit this one for LNL
> only, since there is no info about whether this would be applicable to
> other platforms yet. In the future we can come back and use IP version
> ranges if applicable.
> 
> v2:
>   - Fix reference to Bspec. (Sai Teja, Tejas)
>   - Use correct register name for "Tuning: L3 RW flush all Cache". (Sai
>     Teja)
>   - Use SCRATCH3_LBCF (with the underscore) for better readability.
> v3:
>   - Limit setting to LNL only. (Matt)
> 
> Bspec: 72161
> Cc: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 5 +++++
>  drivers/gpu/drm/xe/xe_tuning.c       | 8 ++++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 07315eb72eff..8d8f6a113a86 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -388,6 +388,9 @@
>  #define L3SQCREG3				XE_REG_MCR(0xb108)
>  #define   COMPPWOVERFETCHEN			REG_BIT(28)
>  
> +#define SCRATCH3_LBCF				XE_REG_MCR(0xb154)
> +#define   RWFLUSHALLEN				REG_BIT(17)
> +
>  #define XEHP_L3SQCREG5				XE_REG_MCR(0xb158)
>  #define   L3_PWM_TIMER_INIT_VAL_MASK		REG_GENMASK(9, 0)
>  
> @@ -405,6 +408,8 @@
>  
>  #define XE2LPM_L3SQCREG3			XE_REG_MCR(0xb608)
>  
> +#define XE2LPM_SCRATCH3_LBCF			XE_REG_MCR(0xb654)
> +
>  #define XE2LPM_L3SQCREG5			XE_REG_MCR(0xb658)
>  
>  #define XE2_TDF_CTRL				XE_REG(0xb418)
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 230369f108ab..d449de0fb6ec 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -75,6 +75,14 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>  	  XE_RTP_ACTIONS(FIELD_SET(STATELESS_COMPRESSION_CTRL, UNIFIED_COMPRESSION_FORMAT,
>  				   REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
>  	},
> +	{ XE_RTP_NAME("Tuning: L3 RW flush all Cache"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004)),
> +	  XE_RTP_ACTIONS(SET(SCRATCH3_LBCF, RWFLUSHALLEN))
> +	},
> +	{ XE_RTP_NAME("Tuning: L3 RW flush all cache - media"),
> +	  XE_RTP_RULES(MEDIA_VERSION(2000)),
> +	  XE_RTP_ACTIONS(SET(XE2LPM_SCRATCH3_LBCF, RWFLUSHALLEN))
> +	},
>  
>  	{}
>  };
> -- 
> 2.46.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
