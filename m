Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D62C52D6F
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 03:49:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A5410E635;
	Thu,  8 Aug 2024 03:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L/Ms3DTM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF68410E635
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 03:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723088982; x=1754624982;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+vrE0iV054Y2UICCYYkhtlvYeNraM43WLmdVMEDTNkM=;
 b=L/Ms3DTMa8qsXckLRR2iS+RXyWgSfSMIAl+dMbg8OlcdLiAWRrE1VxA9
 lmTJDe8SUF8PMhvolCovaKnzL13IWPHVv7nSK/D9SxOyk5mrhQATaM8zr
 CSxrwNjQ9ZLP04ojsyI9x44jZmP2KIQ9iMlSXxwOdyXR/eVxOYeBy+6fC
 tirZCktrMN3zMErER/w+Ic2GmCEl8luVDtKxlXk6NlGbemjO55c/H/PYa
 iN935BuNVYk/TIQoYmXRfU+CS1LVcPFccyXMqZ4GJGczM05ozB5+IMcLa
 osYmdQkiqMDhcr4CMfpeMob/6Ww2bGgZIY2TWWP59VZByjZ6nplSfLAkt Q==;
X-CSE-ConnectionGUID: vvJiI6FsSuGMl5iqXsVWLQ==
X-CSE-MsgGUID: bHp7qGTpREKO5fjm02QykA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21342719"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="21342719"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 20:49:42 -0700
X-CSE-ConnectionGUID: da8KCTH1S+efrIP1EC6ucg==
X-CSE-MsgGUID: UszNbisbSnCivWDP30BuRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="56752936"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 20:49:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 20:49:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 20:49:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 20:49:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 20:49:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d9LZjbJo3o2w28ONHxeCPzukklDmz8BocwuU56+tk+zDc9IrveuA6yYFMz1AUa/1ZWP7/KCcyZBpKPbLsqI3BNIAxV05hB5sr4LWyAAIcHaWTJtKcg5eagZm+A0LewA3ZVTEl4Stf+BCuS2SttfIjsNYlH+QBFyXnTbjg2LD2j2bhs9Xv1HFv8RoRT2b64r15sy4imuqt30N+G5P1W865jn6OFWT4bqAxhZzjF9HGvLeoOPz+gXzuDOEfC3rN1GZ9ziEcNa77A7ERb5kE/mIdqwT5xrMyaYy7FaZtN1z4vJ8eU33gk98SQaB9UDyNyYnB6/VqNj8T9QJ90+wzroo5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpygewlvQNI3Vwzu2wy7WrO8G4uB9mNjHemW0F+iRqc=;
 b=uDSBmunic2prJfGWg+Sy/kiWMZK6BUshu1kyZahYnI5cMT5FJA1mHeaCqP0qItXF05LDWEWLFGexcNZZXPLKhlOTkjlZ+QhbjaD+dazcCQLr5mNaQn7OvatxfnE1h1BKn9zOB3N4LUw77LtcU5o5XtO/nHovcTNw5sztHyyxIZaGovOQUOHEl3q4I3obohJgJFIg5sF+txu0LCwokvCE2da68eO4AOcpgEklIR4NcoZ52ucJw/4EY684wQyBrE6PgrkA+NoJ//cnXOSGL9arQtzoNaEN7S8qhH+SPbXpzKL1KgA7QMuFOm4Ch28KT5i8/Yb6a5WteXqKJqfdyLWJvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4794.namprd11.prod.outlook.com (2603:10b6:806:f9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19; Thu, 8 Aug
 2024 03:49:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 03:49:32 +0000
Date: Thu, 8 Aug 2024 03:48:13 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 11/13] drm/xe/hw_engine_group: Resume exec queues
 suspended by dma fence jobs
Message-ID: <ZrQ//cHkUKTpolmJ@DUT025-TGLU.fm.intel.com>
References: <20240807162416.1307061-1-francois.dugast@intel.com>
 <20240807162416.1307061-12-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240807162416.1307061-12-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR05CA0209.namprd05.prod.outlook.com
 (2603:10b6:a03:330::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4794:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cf2d423-e720-4b6f-2ec5-08dcb75d1cf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WGb7wfXt+1Zx8czj7s4JuCdqHtN86RJ02Ss2iD6sDvt8Q6VBy8fSvwV95kzA?=
 =?us-ascii?Q?ZLXGkoyS2JSyok1P68ymNykgQAHDHACZmyjbOQhZvLPPYW2nXREgJqcld/8L?=
 =?us-ascii?Q?l7z0xp2//FfPH12LKSe1LyX4tr5peAmgfOIvouWwGo7dF+dPqhCBa3RfMwd9?=
 =?us-ascii?Q?T2x9fkO74RC21t90VZ43Gbsj4JRSHj5Y0V3es5zaBVzEnCYNi6ZSMZYUcajB?=
 =?us-ascii?Q?RDGXns/jwmNsaSya2b7xxmGFkphoPkEw9HXGpHE5EU+sP32jxXO+K6u1YikU?=
 =?us-ascii?Q?I+svtSRUtkLucjGVGvnJlLBRG+3qKB+/8ILtATFIZjcRc6buWLyqMLMQOCxS?=
 =?us-ascii?Q?OWRNy7aaZMJkqdKo/JJjEUOUu0qtzAf/kwLnngbcRO6zGgfX3aHjPeJP9o/z?=
 =?us-ascii?Q?uvAMD2A0MtPj4RkELx+U6ZMzL3yDVcgBeckfm0k0l3+MzDFNSa0mSLHVczAX?=
 =?us-ascii?Q?rgWzc0Ai3sTY3rg3y0LcJJntLsEgp6F4xbqASjZMaZtKpr/fN845SAKDU38N?=
 =?us-ascii?Q?STXnT6Okrm2jw+ckwgfAlNHceYRfDzII0ToFz1YEXaViHiBCaOYr545++3bR?=
 =?us-ascii?Q?+dffcDX4CNxnu/jXNSZuEytPixrHFtssjmPskGHuLm/H0wMRvWBbXJ7bV5lF?=
 =?us-ascii?Q?Xry0FnY3VzEvgMdD+BVAJpb5Y3ySHeA9NZOEU04oG4NYbaK6/DF0utBxbu9s?=
 =?us-ascii?Q?V8K+ao8K9klRgmePONmyt6Dn9nuvtIoPLncitInXbRTZQ99/aIrOJc71hLjA?=
 =?us-ascii?Q?YesJzk/I+pRIgT84N2j0y1sWQfJKJVocRzpBtNVJUspQpFq9jJd9T7zA4JDr?=
 =?us-ascii?Q?+ARKdBAirJhJR2kBxBKhLifn+V15t0I/h9yQ4TTpn/159fh9ORfKLJMFjf90?=
 =?us-ascii?Q?7u/fjVr4SbyiXAtTB11AtA4uIIR5JLWxlwMNLbQm+JRf4veHs1yqq2DCluB/?=
 =?us-ascii?Q?tqEazAKR6FHR4JJcil4QMZ/g8UxhhNRGlBbK7mm8UADhGjbFNgPv31D1Aqe6?=
 =?us-ascii?Q?cQmEEhfg2Mx8wUrGVuVNbrdgD2ZGMT2xAIueJxXDPq53TwVV3foB9Rii0QHr?=
 =?us-ascii?Q?GlQwlOIIyugn5z1PtstBPu3nvRBvi0StTpjt5HBr40h8kL8Ixe/zOMG3IG1V?=
 =?us-ascii?Q?ln8NjWKEjX1EHxUd14QIxsZHYJKZgHrz5AVpIDcUYtyoy020erChpPaAOecX?=
 =?us-ascii?Q?NIRs4Crzr3LVsGUm9yhbCl97ZPPXrvzPivusnu8dIoYtGBWpikkoROnkHhph?=
 =?us-ascii?Q?qpPgATxgRkJTAHp7OCFGAtbwyFTojqx9wTtdkz5ciq0g31LVb6HJR3QLFwry?=
 =?us-ascii?Q?yuQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MVbTE1IAP0D3nyU8JfgqxwmPRrh1lsF12Zf2LfFBYUGizfsgzZnB0R87TEvw?=
 =?us-ascii?Q?Ck86U9BQ1Q8bLPsetYB+RT83V3csmPiIVy0YqqSRdvr++eHJDx7F+SiKJhld?=
 =?us-ascii?Q?WUvmgM0l+/rF/qbd5+y18XlVs+Jr7Ar/wC9QEYxB446IXpuUPJvt9ghvIHCf?=
 =?us-ascii?Q?RDLMZ3MfOGVlcSM0xIIs6UB2Rcjjf9Beg3oRqzv2hyK6I4LW+Cyi8R/eFjKK?=
 =?us-ascii?Q?c/KJBI5Q5zXb+tmfPjlReac/IXv6ZVRJVjadlO0oIhZKWJFqqrjPxdAcmWFl?=
 =?us-ascii?Q?MpBGFd1WKnKDYfqpirvZPg+oPQk4NVc/ae7BndRDYn4xcGJ4dGcn5UXEHIyL?=
 =?us-ascii?Q?vzPNtmuHhW3vFSBy3I8lQi3+xZOzITnG2ZOOFYwJcBsXlLWlR69QpnEVDapV?=
 =?us-ascii?Q?IvrWgKamUuEUB5ydkLImB+d/imUrolO0mhi2e12Ij4EuhdaGTeMAK3dH6YNz?=
 =?us-ascii?Q?4dY9i7tu83ttqdaonzx5bvliruTsZ+mAenq2ZYOYd5TEk7QVkx//e2DueIK1?=
 =?us-ascii?Q?hQJFTb/HHeYB6/cD4apZffxvoF7UhpYC3U5lW+tno9PvR9D0u9cBbugEATeO?=
 =?us-ascii?Q?CGxBGBfe0m2tLTqu2nUCSmFWP7iY4PUji0t7cchTqaZ3rg+Gvap/0SeOpO1V?=
 =?us-ascii?Q?uzJSoVeJo5so0s0uBC2sH6h1Og71adpw1Uz8zcRR2ya0I6oMaDsMTVZAZT5N?=
 =?us-ascii?Q?5vVC1J5ygd4axxoeEtbdutwZPZQD27Xv1SDAyPqTgVYeaCkbaiKi3wy1Eobs?=
 =?us-ascii?Q?L7hKc+le7CUc893uEeVDseK4ozDJ7U8AL8Qi50+e3KjhX6KGYiybfh4yETa4?=
 =?us-ascii?Q?bB/KPnos70EnvaAIlJiTxOZY9SvORptd03Y/knFOpoE6HZ2BV2cfVb6L4Td4?=
 =?us-ascii?Q?H3/f+oDHKTFn2V7SC7SUArQK53YZAtQJosu62gByvJ1Zq1A4sLNCMDR4KBqB?=
 =?us-ascii?Q?xhjq94+hZkC0vqmUf6JnuN9SFkOVN3isM9NNS5ybmQLZWIZazCYknnL7uPn6?=
 =?us-ascii?Q?BFD/Prcdp8tmhaRyXVw7k3fi8aFp/Yt+WTWVC8DDNwuRDrpg4mRkiTajAW2C?=
 =?us-ascii?Q?M7O9qP7ayNYHx0JWo4ZHc52T1x/9NgqegVTToGekdNGWchOSKUPfjb+rsVgT?=
 =?us-ascii?Q?Gsae2p58ouH3j13lBy9KrpXQ2xEUaUNp3b42zW8u7sHu62jQJ+7qRYoFwaQb?=
 =?us-ascii?Q?+V88VRJe5cXwJjhtCNhSGP1AV06fquxFdYJvOluxXCcss0Q1KK1vGiR8+MoW?=
 =?us-ascii?Q?vpVJbk9k1tDhsBCBWltt9P5Um/V0R7pmXWOtZF9FWOJRXdMFkVK6LcJZ7QlH?=
 =?us-ascii?Q?4lpq2Qt/RL9O0oeddd5kT6ppClhRqp/l2IliFzXV3zerZlewbnnrzbcZ5dSf?=
 =?us-ascii?Q?5UEeoVyIiDNA81ir0QzUYXtuYKB800ZCgt++eGKlSo4On2coZkv/EebnEF+K?=
 =?us-ascii?Q?VX++6+tzyH3IlOHABoI578EHAEpcmYAMXNmmH+XGbUpmlE+38ReVPiELm/m+?=
 =?us-ascii?Q?Br+ninX3g6yiJu9r1KOivQrNDhoIawRdxd4w1IUyHTmkDeTnl/4CIC+6n9Il?=
 =?us-ascii?Q?67CzqRIw8xyAKg8v9nN/thRGLaMs/uMvtYmZhlUBBjFjiOw69tXKtBP/MLdn?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf2d423-e720-4b6f-2ec5-08dcb75d1cf3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 03:49:32.5946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gW0s0zPL1eN43PumN11prSoJWsX0j/7K6iUlNT/VMwWT1ofPzslTqdR+1Z1eC/oQAl1Rt1qPT/R6e8PymjH9GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4794
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

On Wed, Aug 07, 2024 at 06:23:40PM +0200, Francois Dugast wrote:
> Submission of a dma fence job leads to suspending the faulting long
> running exec queues of the hw engine group. Work is queued in the resume
> worker for this group and execution is resumed on the attached exec queues
> in faulting long running mode.
> 
> This is another entry point for execution on the hw engine group so the
> execution mode is updated.
> 
> v2: Kick the resume worker from exec IOCTL, switch to unordered workqueue,
>     destroy it after use (Matt Brost)
> 
> v3: Do not resume if no exec queue was suspended (Matt Brost)
> 

Same comment here [1] applies, patch itself LGTM though.

Matt

[1] https://patchwork.freedesktop.org/patch/607432/?series=136192&rev=7#comment_1104033

> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec.c            |  3 ++
>  drivers/gpu/drm/xe/xe_hw_engine_group.c | 49 ++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_hw_engine_group.h |  1 +
>  3 files changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 2169fbf766d3..484acfbe0e61 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -324,6 +324,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		spin_unlock(&xe->ttm.lru_lock);
>  	}
>  
> +	if (mode == EXEC_MODE_LR)
> +		xe_hw_engine_group_resume_faulting_lr_jobs(group);
> +
>  err_repin:
>  	if (!xe_vm_in_lr_mode(vm))
>  		up_read(&vm->userptr.notifier_lock);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index 4781d6d606aa..170355e984ea 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -17,9 +17,36 @@ hw_engine_group_free(struct drm_device *drm, void *arg)
>  {
>  	struct xe_hw_engine_group *group = arg;
>  
> +	destroy_workqueue(group->resume_wq);
>  	kfree(group);
>  }
>  
> +static void
> +hw_engine_group_resume_lr_jobs_func(struct work_struct *w)
> +{
> +	struct xe_exec_queue *q;
> +	struct xe_hw_engine_group *group = container_of(w, struct xe_hw_engine_group, resume_work);
> +	int err;
> +	enum xe_hw_engine_group_execution_mode previous_mode;
> +
> +	err = xe_hw_engine_group_get_mode(group, EXEC_MODE_LR, &previous_mode);
> +	if (err)
> +		return;
> +
> +	if (previous_mode == EXEC_MODE_LR)
> +		goto put;
> +
> +	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
> +		if (!xe_vm_in_fault_mode(q->vm))
> +			continue;
> +
> +		q->ops->resume(q);
> +	}
> +
> +put:
> +	xe_hw_engine_group_put(group);
> +}
> +
>  static struct xe_hw_engine_group *
>  hw_engine_group_alloc(struct xe_device *xe)
>  {
> @@ -30,7 +57,12 @@ hw_engine_group_alloc(struct xe_device *xe)
>  	if (!group)
>  		return ERR_PTR(-ENOMEM);
>  
> +	group->resume_wq = alloc_workqueue("xe-resume-lr-jobs-wq", 0, 0);
> +	if (!group->resume_wq)
> +		return ERR_PTR(-ENOMEM);
> +
>  	init_rwsem(&group->mode_sem);
> +	INIT_WORK(&group->resume_work, hw_engine_group_resume_lr_jobs_func);
>  	INIT_LIST_HEAD(&group->exec_queue_list);
>  
>  	err = drmm_add_action_or_reset(&xe->drm, hw_engine_group_free, group);
> @@ -130,7 +162,7 @@ int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct x
>  	if (xe_vm_in_fault_mode(q->vm) && group->cur_mode == EXEC_MODE_DMA_FENCE) {
>  		q->ops->suspend(q);
>  		q->ops->suspend_wait(q);
> -		queue_work(group->resume_wq, &group->resume_work);
> +		xe_hw_engine_group_resume_faulting_lr_jobs(group);
>  	}
>  
>  	list_add(&q->hw_engine_group_link, &group->exec_queue_list);
> @@ -156,6 +188,16 @@ void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct
>  	up_write(&group->mode_sem);
>  }
>  
> +/**
> + * xe_hw_engine_group_resume_faulting_lr_jobs() - Asynchronously resume the hw engine group's
> + * faulting LR jobs
> + * @group: The hw engine group
> + */
> +void xe_hw_engine_group_resume_faulting_lr_jobs(struct xe_hw_engine_group *group)
> +{
> +	queue_work(group->resume_wq, &group->resume_work);
> +}
> +
>  /**
>   * xe_hw_engine_group_suspend_faulting_lr_jobs() - Suspend the faulting LR jobs of this group
>   * @group: The hw engine group
> @@ -163,6 +205,7 @@ void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct
>  static void xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group *group)
>  {
>  	struct xe_exec_queue *q;
> +	bool need_resume = false;
>  
>  	lockdep_assert_held_write(&group->mode_sem);
>  
> @@ -170,6 +213,7 @@ static void xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_grou
>  		if (!xe_vm_in_fault_mode(q->vm))
>  			continue;
>  
> +		need_resume = true;
>  		q->ops->suspend(q);
>  	}
>  
> @@ -179,6 +223,9 @@ static void xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_grou
>  
>  		q->ops->suspend_wait(q);
>  	}
> +
> +	if (need_resume)
> +		xe_hw_engine_group_resume_faulting_lr_jobs(group);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> index 0f196c0ad98d..797ee81acbf2 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> @@ -24,5 +24,6 @@ void xe_hw_engine_group_put(struct xe_hw_engine_group *group);
>  
>  enum xe_hw_engine_group_execution_mode
>  xe_hw_engine_group_find_exec_mode(struct xe_exec_queue *q);
> +void xe_hw_engine_group_resume_faulting_lr_jobs(struct xe_hw_engine_group *group);
>  
>  #endif
> -- 
> 2.43.0
> 
