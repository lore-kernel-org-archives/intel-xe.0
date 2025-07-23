Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8404CC83F17
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 15:37:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C540892EA;
	Wed, 23 Jul 2025 15:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fro5renM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816CC892EA
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 15:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753285072; x=1784821072;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=C4EXrBT6Nno7lNtYmipmJDQTW1yr1jVmEN+eiVq8gRQ=;
 b=Fro5renMAPxPUUOnLsjns85RtNukCDwi6MkiWq+NH3fPQ9RaBp5MG3vV
 wRHa10n8khI/q0DweG8CnYAA0+3Fd30kXAsQMRDQUF7M4BKx5d2h7QfVj
 /0dw3tT10QStfOd+1FGU9+6P69U6bz+XEo22qI++e4bTRo5/yoAHqFkli
 hungmAS4ki7UMf3waVwfYdkViUW7bhHeE+OY1EL/TxnaziFjQ0wckkUbY
 Mm2aoLhQU4raUxIkH+1esNCLinYgc3NrxkJVzzqhppuMsFxvnSIGeCh7V
 ijcx7jeR4enjyJ8BtZuKsCt77+GuCkHZHySyLDamtGcOH+7xExnrSeA7K g==;
X-CSE-ConnectionGUID: 5ch+Pov0RYi/jOAYvD3+/w==
X-CSE-MsgGUID: Ae8xy/I6T7+bAJkGXouwWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55420757"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="55420757"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 08:37:51 -0700
X-CSE-ConnectionGUID: m70p+NuMR0aDic6KVkkBlQ==
X-CSE-MsgGUID: YT2RVoZdRBm/5AtO3GH/CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="159321698"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 08:37:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 08:37:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 08:37:49 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.66)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 08:37:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yGzD7M6VIGng+QcGEGbMnJ1uBR2Rz06pGq8YtFMkLbDFcicvGoVbaTaML8jfDV98qCB6DUFuQGjEyDBUC7XmtC4WGpmWbX9RjQubGYHiKuYxwAPm8uZ/qJt5pFTIUB2XOx89bMlKS09NB+EPeTcsn90qFl/ov4RkqEVVq132EiNyEmhI/KRvXPFmI1uL+UWlBF25flGNbSZN+98zzxkHb1r8xcsoGAewQhZ23JntuZ85lr6joZspldlrNfmIyhtdbvLfEzkwTasTY5u+aDBRNx+epZgB1ZaM14c7Z0wxP/toEmii99DR1rvGtrj2LRzyZWEBnYRqNoFIMatCUsiSKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sybkQ3xbIyPxL1Om6fxmehTySU2Yu+ungCUZ+RcdxEI=;
 b=ASMYL7csJ2F3ur8+bhNscU25+IlYtIxcF9jFQ2+e8+haiQudKUGn7JWu4bo8dsAz0jiCC8x6EGqlrjU57jCA+eD8wtwcHyptQv5dvhx45IIZuddGF+e4Xz3BkH4WESg7GH26dKAsaDRZU4negqx3c5zs3ErOX2T+x2+lcAA/pLmu9AzmOxraJeZToKVoTajYzEBm8eCX9rwLQcW3bdSLy0XKeUarCN+tgodszda8V0AdvFYN9HdiMk+fAzmqlhLb95F1LIJyduDaa42b4V14mIH36QahU6SYpTh9F8ilQE0gfn6gengAPhHIFEwsKYpoEnwpSKpqlL6DugV+pvHyhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB9372.namprd11.prod.outlook.com (2603:10b6:208:568::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Wed, 23 Jul
 2025 15:37:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 15:37:02 +0000
Date: Wed, 23 Jul 2025 08:38:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Make GGTT TLB invalidation failure message GT
 oriented
Message-ID: <aIECCTZ3xDewN1kF@lstrano-desk.jf.intel.com>
References: <20250723133015.206601-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250723133015.206601-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0337.namprd04.prod.outlook.com
 (2603:10b6:303:8a::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB9372:EE_
X-MS-Office365-Filtering-Correlation-Id: 154991b9-d90c-4d0a-6d65-08ddc9fec4b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5ljeN3QycVfiQ+BrGV4JSJz0yyPQTPZ/IVaV6Z0+HpXLZXsXxAa+0wO2Rki9?=
 =?us-ascii?Q?pBUBeLqYOURhwYJPXhfgFLgfqt/hrQFuHMZYzo/4AogdRKaR7TLhn6or4H6R?=
 =?us-ascii?Q?p0XMDDx/kzmICvsxY67XUzs0Lz0cDAJ00SiDsXpvnzBTvIZGyJzTPmo0ThBm?=
 =?us-ascii?Q?f2KONjpvV1oRk+pFzbnmYvB2VN/TxAF2N+ru6tXgZygPlyvRzkoHV9XLdLTS?=
 =?us-ascii?Q?atA0OFk6UXlPONH1pBat9diyYEMpHGoCSmcTg9faUPR8qVYZqqSBNwHo7AGd?=
 =?us-ascii?Q?b2SL7oTZ/jc6rPvKvOVpElNteaEkEHJaL/uKadI5h/PbEsqh1B6sBE2acE2u?=
 =?us-ascii?Q?8BMU0E0eUOON/LFiMcKRLBGrlhDwhwNkmuWnbenvNX7Lv6KBqzGnD1um5t/F?=
 =?us-ascii?Q?BGEMkrEHYd4f8Irxzl4il09s95QNGShZThaKKZfkqEyi6CqfOQVngfaHjFgg?=
 =?us-ascii?Q?od+Ljp3i/2fgNwzK7eC5WpBnnh0tb/fBljqS3ZpKtYvvAoJphnvkSGWZFhhu?=
 =?us-ascii?Q?FQXvY/aVR6sG6KXqozA9pZOXAOmR4uq+K/hlk0gQ0ho3br8CVFBFRaGGTZ7Y?=
 =?us-ascii?Q?2qgj3OmQUtgz9TYH8UCh7KhGJrf/SFDUBzpMbqOlgnn2zDxwT8jiGoM48+QZ?=
 =?us-ascii?Q?WJcNuYU1auH5VJJuB5Je5Xd3+B8U87/ejizq8GKSLQkgNZ7hjXCB3+CX26tP?=
 =?us-ascii?Q?gOaQ50jyEa+eTfbM5BXPljHzR6Qgjw6aEj/mvohZCRYiFbIRZHS9dDkikqP2?=
 =?us-ascii?Q?uC+2XGU2JMMtX42oEbNqU4dtC6kAafInmCpi4izeYVrFE9VpgeKOzAPDkVQA?=
 =?us-ascii?Q?jIEOV22oCNzXJVtR0fDqJ8bl8KiIuolTUtxdgE0wrTMQHSelfKpH6oeqhPof?=
 =?us-ascii?Q?oPYrGsyinvMGE/VnAy3liTgqtbNfCvImkAQ2pMMLH5Nv0Da5hfphoqu1wo8F?=
 =?us-ascii?Q?yi0DDwt8A5bx/tvqiRrWJ6i+YBWViF9xejAcit54E9fley3JuYyqe9dyYImb?=
 =?us-ascii?Q?4JemsxpEzyMjutWQ2B3asGu9ejfG/SY/ZCIKnMh5r8dOOMekWXVHiR488tJD?=
 =?us-ascii?Q?wIyZX01BICDM72/l7NrLYJkYkr9cc6tTi+P/auzaFS+UIvEIaDQeJGsqYgEE?=
 =?us-ascii?Q?fJdmHLPZuvjIQKA2lYiGfKaKAvthlT8huYwA+EfTpc62QCm7KL5ukwBbNg8y?=
 =?us-ascii?Q?jrnKc/DgZL7wGAigqX8jBqxgtJyaymNR83F3vHtblDkQ+huTJ/Tmzw/dFb74?=
 =?us-ascii?Q?Gn3uCwod0Yo8UYC0h4Fam1otcurm/SkZeMdJ1acXFgGxIwU3l6duLF2lwXTn?=
 =?us-ascii?Q?gNVuST8jcNxmMOI1K8OuTImj+TZxmR9x9awogqASRx6HbHFuCEElifO1Cej3?=
 =?us-ascii?Q?nfzLLzBj6Nz2sbd/K0reUF2Qu+RNzFVn/miOeykhb17pYzX4EGrQB+CvxYDu?=
 =?us-ascii?Q?Iqd87RZfDZM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rrFGKK3wf8tGzevinhrq132Fr1OZFSJG183h9qnxIGVgYPRMF2eZfYYoMDFT?=
 =?us-ascii?Q?RT0kqtejTlKnOstoGdinLxa6qQ8NwgiwrcrZE1C+kexCtegRSjcdhvb3kA7q?=
 =?us-ascii?Q?6BJGF32Bc1Fwksf2kFa+2s3Z7GzdpeBsLiRYdPKyDPY8cLwwZy7DGJcP+TiM?=
 =?us-ascii?Q?mD3eU9cu1hTXEbk3VTlDtYGxA+6PuuJ+2izhrrxle9U4saRD/KLYkBGg6W2E?=
 =?us-ascii?Q?0suT7N7uI47RACNZoMbgQZauF5IMoHp2opkE+VvDdBR1PLBxhGivoXPF7AfI?=
 =?us-ascii?Q?7VDfskUL9K9+TAGY68PzBTsuz4MqYi9d+cXmN7msDi+iLb119jBwgFIG95TW?=
 =?us-ascii?Q?10XHdU2u3EEFI65bfNpOdS/B6hTjsg01bXVQ0lAp1ukMTBFlh+mVUgLQF7OW?=
 =?us-ascii?Q?nx6GYC4/KFGDyLfx2iMLMMuFsDQzNM5NH4LSQWI0EjZdEnswRj1THTulsT5B?=
 =?us-ascii?Q?v4GMILxkWM2g7glI6ZDYwR7KxWdNOjJzjTClZcxtPq6DwWbOqJd3cnSZbrKp?=
 =?us-ascii?Q?zko6pu8YCEuSi4Rog49keKMshtvgIqaZC+QUo82YCV/mPs/ZSKmZn+IccnkF?=
 =?us-ascii?Q?7JHrmVQOOhKqBHaZ7nWctdswxStSC22YA/MBsU7wPTGrkcULK25NEpSB5Z4y?=
 =?us-ascii?Q?sWJEw83UVvVsOgo7PphGvQ04bq9KsSrAMMWn0oGPnl04bEvJdr8zHVnDImNw?=
 =?us-ascii?Q?sYyx6ixt8wigSOVEhvXKgkWFJninxe6pOK3kKMV+8MyfVEo/1kHfZlQjLnmh?=
 =?us-ascii?Q?NZJKmF1kB9vNROVRsEGfr7Cg4NEerwKTnUVCgRJITynOpHCeJv61Cog1I/tJ?=
 =?us-ascii?Q?HU9N7HnIYdGnTwJwUw69gWWY4dIHOJTyrDZVKqgmXoSk0ABZs7ODg3eY4/qh?=
 =?us-ascii?Q?sdSyZFnKBaiTF1icJx6jMw4LHsoY5iAZ6T+1FsbubbXahS29+YsrzZESpQhq?=
 =?us-ascii?Q?i2bJdNywlyBPYSQW4QUdbJOuMq4e0PJluexJsOFAgRfOjQivktJ35V0Wz/h0?=
 =?us-ascii?Q?xklFjlWh9oVfvbMal+FvuRpZ2TCTK7ieD1Uye+WsoLrp7szDaNrU5gm0iEPK?=
 =?us-ascii?Q?lItEMy0GK47EqTu05qpFNT3Kw4TdQnWUAbUcUrPjP0BSPhdUNcDaNBBu8a0i?=
 =?us-ascii?Q?3RjpBiHDraIVW67fN6NJzR+woha7O/WKRoHOmWKxYFugZhFKy4qU71Y+HXd1?=
 =?us-ascii?Q?gbfdvVP9R0Y1CRhsTWoHaNHVK5a5g2lVC2aicQh9V1rVncc1yuOWobE26zSi?=
 =?us-ascii?Q?e0azi3sZV27iibk8YV8djua4upekfApb4CI9ixyyhbyePvdY70kS9aiuF7/p?=
 =?us-ascii?Q?pj/69CArSYVSWK3K+5uADQE0BUBUideTEK3W4GWl4MO09fH/CEYD1SN4I13h?=
 =?us-ascii?Q?svGKSSgDbZjsfNboer9WbNtJUdvpbWER8MyIQhKcmKphYpzFFEx/BFC9jC1b?=
 =?us-ascii?Q?T7hzFQZI5ITAo1gupnVSDVuH28Mc/HDJ+ILdGLCBsJS3y/ntFs4MHCYb/30m?=
 =?us-ascii?Q?O0iDb/nw3yYweGYJCn2VSNTEN7rloCnoycrXz73fYAwFGKs/9fMQVCjQRIpo?=
 =?us-ascii?Q?QMkK1nIT/OOmb1BUyAvO2GYSfNpvGCdoqkr5M4DwYDNyTSLPpmxhwygVd+j6?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 154991b9-d90c-4d0a-6d65-08ddc9fec4b8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 15:37:02.0545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MoQsLXz6BdQ/a0Y7qxvTnA4OkYANvJPgvy+vwCE0vM5iFtaumN7mxEe2bM9Ns+DI2egKzOYD1G6wzq1r/Y9g3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9372
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

On Wed, Jul 23, 2025 at 03:30:15PM +0200, Michal Wajdeczko wrote:
> GGTT TLB invalidation is performed on the specific GT, thus any
> failure message shall be also GT specific. And to help investigate
> any unexpected failures, promote message from warn level to WARN
> to get full call stack of this unlikely case.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 29d4d3f51da1..249713139f69 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -439,8 +439,7 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
>  		return;
>  
>  	err = xe_gt_tlb_invalidation_ggtt(gt);
> -	if (err)
> -		drm_warn(&gt_to_xe(gt)->drm, "xe_gt_tlb_invalidation_ggtt error=%d", err);
> +	xe_gt_WARN(gt, err, "Failed to invalidate GGTT (%pe)", ERR_PTR(err));
>  }
>  
>  static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
> -- 
> 2.47.1
> 
