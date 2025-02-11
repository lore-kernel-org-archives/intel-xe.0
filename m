Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B78C0219E
	for <intel-xe@archiver.kernel.org>; Tue, 11 Feb 2025 03:40:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D05810E2DF;
	Tue, 11 Feb 2025 03:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MYDV9RjF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535FB10E2DF
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Feb 2025 03:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739245201; x=1770781201;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gFuQTtcDdAp2RPeeBhY92DHAwq6yPl8FVZ91QScsH3M=;
 b=MYDV9RjFBtO/3YzblXAsr9pvARzix826LrPwY2PZmlDL3eIacQvfF+IX
 G7Zy1RSknEgAAJngPKa5TY2S92oCVoQ/w5hsNcLfSWAs2ceJmO29BC49a
 6Vp1Zc1a6Vh+60Diu49nyXPChkBfxy8f9L4lQlq/J4B7osXCUoaTCXxdM
 sd3xZOaDkXyO7Vs0V3/FPH4wH+r92KtDoWsc2RL+F3CO0M8hUxkDsB6oX
 k5arwg4QoIVGqKJnoy8sYZrG1GGLRkUNASNbxJh0oR0W7dg330HqLuYAE
 DWLHegs4q5BAnzV4WjumvF3v3ZR6d0ZnzBNza+7iPKPQ70XQZUrJ3wi25 w==;
X-CSE-ConnectionGUID: /6Xa24MZSGKeGPyOI5801A==
X-CSE-MsgGUID: gMTLyAJMTaKeB0avmLhuKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="42689389"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; d="scan'208";a="42689389"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 19:40:00 -0800
X-CSE-ConnectionGUID: YQocrkIaRc+fqHWx7S2GFQ==
X-CSE-MsgGUID: r85V6Id0QMSWeXX9e/7c7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117301534"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 19:40:00 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 19:39:59 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 19:39:59 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 19:39:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5EWqXYgd38YQP/ATe7SSENZSgBXPPqVUQnozmaBRMxwCo7ndNFl9HgMiWiMfKViv0OarssBk4Xr5aRVqwkVDZE+OFDmkAFyLBWs7t02YyElkcsDZdyJym/yy51shroNj3HW17fOUoeYwUJkYjqDuM12/PpYP2aLTcO7OCsY/Ehfij7SIqm2mM8YlQssQyz6pcBwJjOegLOF8ZYwpjThfdSQqjFMtFJcNQ4Bz+PqXVSbRnEkebcWMXhBfVac96AdARoNBH6jbvlNsJ55/rZRVwCTEQZhCtmjOWeSiuF1khbHruS1/HNUHbOPed0MQbrp9noO42bDZK4klFIfl1cfrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NX8Y6KrgYOrsg7mqZcXWEv5/iPtgnTzv6iRMp5ed24c=;
 b=KNZ08h9EK2rwSGeGjDbZ5PiWV3nQZjJWo7PthLY+G6WFxKR1KIjh41+ePP04X6Q29H0lG4v7PkFkjhUbqYazIM6Jny0RRqNfpfSd117IoggGr5ISFluesy3CTK7OtkxwLIHZujGVyaf2Y/8IDZN9J6FXc8m7uUj6hI/S6vpYNKYocRHFJMsZhEnnkfPuhA/9oETUFdTe7ixYoPtPfNPycCzDtI7N3bcC3SN5J67ZoDF6IZLXD5MDIy/G8tFVJrSnSBACSXFiv9JHT+IXqbR3z3jzcwYZsnAHWyG4SgCqIw8RXIK1qf+q+/kkHxYHj8FYXiNIJIb2p9SR9nHHF2Vmvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BY1PR11MB8128.namprd11.prod.outlook.com (2603:10b6:a03:52c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 03:39:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 03:39:56 +0000
Date: Mon, 10 Feb 2025 19:40:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Escalate GuC load failure immediately
Message-ID: <Z6rGyFgdi/BrYtWL@lstrano-desk.jf.intel.com>
References: <20250211004702.1872837-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250211004702.1872837-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BYAPR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BY1PR11MB8128:EE_
X-MS-Office365-Filtering-Correlation-Id: 43e11c23-c852-4025-0217-08dd4a4dc0b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2q3oFJVUe+z/ECbiDw0YPgLFVkdyaOSYcdt/Z+MDtVw5O43IoBlUqCYRaORq?=
 =?us-ascii?Q?m92LCpRIz80OXbxBChiaHyUGzb65+2Uy9IiVQ92GgQfNzjWQ8+w5tep4vyEb?=
 =?us-ascii?Q?4Ao6uh5ROhuNqWM/8hrXtAU0HWeOpuPIA+wjPuPeNQQSuJfh71CLs5HPIz2V?=
 =?us-ascii?Q?AeOgkFrxX0rJHDyB3cMlnLg7ztGE7OHWQTLfOzmhoqPvwsFo58qK8flSAUmb?=
 =?us-ascii?Q?0iR1MmrJzVEZwrtdJuXYVnq4RzidTiMSSo/NmKcFVln5wyXSz3U98zMfl0XT?=
 =?us-ascii?Q?9DUqwXzK4AZEaubzG2orTirARwZI/2wvpjulo3Hh+5g/haqgpfyrfzed28rG?=
 =?us-ascii?Q?+RrV/y0XmAkS8H6mxBGsAjKcLh4B7EvaEYV9gm4DgQpcjr30IuSEl2qQhJ98?=
 =?us-ascii?Q?iapqb/Ryj85iIt25nfI3cNpwZNgyfRl8GGjpuIZP7T/xvmnv8rHYZxxo3tsi?=
 =?us-ascii?Q?Nuxmtrof20QxsR6cn9/3kaVbNs1XhBCGzpTgcmUQQkBeLNN+uJUJ8Sw9yvQj?=
 =?us-ascii?Q?OJUQ9m4ebi9+NTfZguupk7GKTGnyWEfn0JB2stuR0nuvYwwL0WwmCHH0BITX?=
 =?us-ascii?Q?67Ej6yH2mD161ZviPGRl77gUALvQ1War2P/6EnPB36ZOaXGyvLevx4A6WB+W?=
 =?us-ascii?Q?NRupMVdW3nbzhoMjL56Yw05CAJQKvkULbWgxzGkx1ogJBBL2/weikKIEO0Xc?=
 =?us-ascii?Q?I9ZvfKymkinWu4+MJa/GT+WuZy+NFCf2h/ZxN5reXuXM9qAI0wRZ672DPJ8E?=
 =?us-ascii?Q?jhsw00NsBUKkFBfWRNxOnqd+o267KekjNN5aLX6XZ21wiU2pjZjoDLeSDG51?=
 =?us-ascii?Q?rog3k07fR29pOVThmb0fOxE5YiT3M5FIZqe2FO+q8NVWqrT1fd824UTzdyIg?=
 =?us-ascii?Q?B3PlG3oY3drV5RVgmZ5dJc9IkDLuM1lSVJQO/Mnsp4XXthie9zD+OSLnbZVl?=
 =?us-ascii?Q?lOmoiCZQY7Lk00JBOAADjjIq05piEkUXzGQSQ5SqozFcXwzD6ThmiJn7PmWS?=
 =?us-ascii?Q?qxtjGGhOAFa8aQOuGsfmsnbF4yV+xo8rdYEs8NxGjS7eZuOh31Z3hlqGYrs+?=
 =?us-ascii?Q?bKnoK5V225CNJKFIovgiDNW+WMhdh2jJCMurVrAu/UuywDN8LABbWlRVAJmk?=
 =?us-ascii?Q?7kOmnVJByg9pVenaIWLLk4bhm8L+bdXbqIOi6HeQW2WnzlSDbbwjdmuBSPQu?=
 =?us-ascii?Q?U6vs6PUFPAI0wyUSm5VzPYxCEDTjjstI9X9e5WDXN7t4oopwab/DdqHcwTDM?=
 =?us-ascii?Q?fq0C55/gC32AHU9sASSn9EUNClUgaf7sJycyCVG9NPzEowpg/PX9lInzW2XW?=
 =?us-ascii?Q?qS8Wizy8FrriJzWjEsQA0zpmVn3zHNAeOFc2njvvO3ZLjMDxHU0maKBoJ/dH?=
 =?us-ascii?Q?3ftDiWi071d2/hAmeuFCFEJIKotD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ui7n23pzp/OB2FQH8VgYhY9rWnlXxVDVEvV47z5NRj/M8THm6+Lo9DALUBhQ?=
 =?us-ascii?Q?tiOxgVkaWsqKVRKulEdlbWivcuFsGaZurLd1AJGxlC3P4993AvWW1LV+e58p?=
 =?us-ascii?Q?Be6I4pWHVzM1OM+mYylqiaz5bprGQ7sOX+yNOUF0e1NAIl7pvOQ/anyPByB0?=
 =?us-ascii?Q?RPqSsxZtgItdQNnAVFv3G6fR30rS355eMT0IuMb7TEbTNS1w3JUTAlYNPG+x?=
 =?us-ascii?Q?9nVpP+22jL+TtkSofJLMrJXUDcTyRARiyt5agd6Xq97sTgC6QUKZtK0pmzJ6?=
 =?us-ascii?Q?48LVaxVITfH159z5z2dVZc+zPPjjx5h2nGsPQ9tksMPbbgp95iEjdEJMSHti?=
 =?us-ascii?Q?I9+ZHIm91zLVZeheSc8k1+EN3twfzcq3GEi4nV1NOMFWY93ibAA9tzUwwUiY?=
 =?us-ascii?Q?MfOli4MWcEjkdvzg0LJAxclwT4NA2P/jJK9sjdA+lD8lbszWgBy7SvG7LEfe?=
 =?us-ascii?Q?I2MI02Rh+XvAei28kXzec+GG4/3Yyc0RawEOsQKdNq7NSiO1UukFaPTyy+zh?=
 =?us-ascii?Q?8RBbFlkS6FExSM8z1K3vHUdfB3A3ym308YGZYIeC17N8KnWPZBx3zbapnaiG?=
 =?us-ascii?Q?DSVoo46S1h4eBYscjJd8qdSIiCkUzBHIZQYWs1NF63O7qBgdLc1rO23F0NCq?=
 =?us-ascii?Q?KW3pMNBZ5UsEomLgYhPEy3gJIOys5IYyQh9zqgI8W5FlerFhiWklGpL3BQjZ?=
 =?us-ascii?Q?CYmDIYYW20tFYq9Ly1gm0MNP8AK3rFXXZz+T3CqC0Uo+el2pWA0VOUGb/Fbs?=
 =?us-ascii?Q?nFZNPF+ntWwMrpniTDQBWgK+M+jTj/a0hHpCk4IJx3t3Y4lO4lcXXDzwCXDW?=
 =?us-ascii?Q?YaN8fZiBQd4vGVImkEHA8UdldZr8irHAwLLGuYEQgBwdk3vcLtPtK/Sy8x2o?=
 =?us-ascii?Q?vZvWf0I2SBlbMPOiSILwR/wRK1+iq0BYhu4cjbcoGFqsd+uy4+7ZhNxYskIg?=
 =?us-ascii?Q?lZXZLOCURB75qvG9uMeKnWhbxgYrkyGo/qEdEQn6hva1hS+Q7A8sjG1IGZXw?=
 =?us-ascii?Q?3kK/Q8UPRuW9xjEltGsQwW6rcNp0/GM41+Wibo1hVfQ504UX9QQoyUQ+ch3a?=
 =?us-ascii?Q?P3Y+DN/JJEammoa9sSvT/hWgShfUqIEaNBpnoXTm1gMW3uWp0J4kIcIXuFhZ?=
 =?us-ascii?Q?LATjqk/oqC/i2Y1qSV+FT7ZFqvVu9POT5D7aCvF4PN4LhctfF+lQrDRYJTya?=
 =?us-ascii?Q?wU1ngMscZyBhcprEkDqv1RaQVRh2cTRbdMK8/cPuGZ2nnFMIAhmkjbvxGWc/?=
 =?us-ascii?Q?xxTbPYozeBCZ6ZllQHQTVlvTgJvhQDA/yOSPQ2j5AWkQRhd00HOKI43M/nwT?=
 =?us-ascii?Q?xIkbrGB8CVwOFnExtVC8E4vivUmLP2WHHOH957GVvBU7CJQbgnEfnKCFjb53?=
 =?us-ascii?Q?tqbRabt8+q57nJzG+tRti5EOjkLgYA0R66F0RtEmk3zaR1/0trS7cu0GJQew?=
 =?us-ascii?Q?Avax8Hhx4qeQ7kjgLmvzfaCCAzZhO8bOmMJ3VUaSKcMpypwSMSoGCxglKt+V?=
 =?us-ascii?Q?Gox22nVo0kVgMiv/ACJdHjB/S/ls+l6DX2Cfe4WKZIKv5n3mKiHObAO7zUJw?=
 =?us-ascii?Q?jN3AaCpjUTJyhbI8XtQ/ApxL6RU+eTl+BBxVxg0bU/ZoWWF0UoOvUO5vSVTO?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43e11c23-c852-4025-0217-08dd4a4dc0b4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 03:39:56.3811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9dOE/lg8QKbU0ldNeUP1dDVp9bZmG0hC7RlT/OVGcvy+HXcyyMbY1o1tFkUVu83cFKKapEGOaFZw6b27cITncg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8128
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

On Mon, Feb 10, 2025 at 04:47:02PM -0800, Daniele Ceraolo Spurio wrote:
> When the Xe was first introduced, we intentionally avoided escalating
> GuC load failures, to not abort mid-probe. Xe is now mature enough and
> we gracefully handle probe failures, so we can start escalating
> immediately.
> 
> Note that even without this patch the probe is still aborted because
> the attempt to enable CTs after GuC load will fail and that failure is
> already escalated.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 1619c0a52db9..13c3084c42c2 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -938,7 +938,7 @@ static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
>  #endif
>  #define GUC_LOAD_TIME_WARN_MS      200
>  
> -static void guc_wait_ucode(struct xe_guc *guc)
> +static int guc_wait_ucode(struct xe_guc *guc)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
>  	struct xe_mmio *mmio = &gt->mmio;
> @@ -1045,6 +1045,8 @@ static void guc_wait_ucode(struct xe_guc *guc)
>  			  delta_ms, xe_guc_pc_get_act_freq(guc_pc), guc_pc_get_cur_freq(guc_pc),
>  			  before_freq, status, count);
>  	}
> +
> +	return load_done ? 0 : -EIO;
>  }
>  
>  static int __xe_guc_upload(struct xe_guc *guc)
> @@ -1077,14 +1079,16 @@ static int __xe_guc_upload(struct xe_guc *guc)
>  		goto out;
>  
>  	/* Wait for authentication */
> -	guc_wait_ucode(guc);
> +	ret = guc_wait_ucode(guc);
> +	if (ret)
> +		goto out;
>  
>  	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_RUNNING);
>  	return 0;
>  
>  out:
>  	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
> -	return 0	/* FIXME: ret, don't want to stop load currently */;
> +	return ret;
>  }
>  
>  static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
> -- 
> 2.43.0
> 
