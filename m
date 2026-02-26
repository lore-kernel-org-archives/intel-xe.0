Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817FCFD4605
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 01:42:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D51A10E062;
	Thu, 26 Feb 2026 01:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U4oriJik";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0818710E062
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 01:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772070146; x=1803606146;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BcF063qud+ii1aqL28cFMXRjpJHqbexLM4m+dVd9wvQ=;
 b=U4oriJik8sCm0eOTwr/3ov/XuxUDQ8NJCrC0OTalii8jU0PISJ2YX8Z7
 5VIK0OY+Y0Al/CE958e2kuE1aXkIihFmtMMn5h3sNIDdZAzbUZ+k/D8TH
 DYSAr5eWVzBMSkIRxcook6epidQw3rRv1R8WU5kPQOZvBkoXTB7eHRudo
 YcZyqn00dezJIvjHpReH22TIYAbfJorEPXTWb1JSequ+yAntFN3LzuDuk
 UmwVXDmmSSoFjGWFavd4JtGMyeHk1lxVeFHjngXhBG6T1VdaZcul2Zv5B
 aJjKShkkj+0ISCe5f3djhVubCM0kuP74jogvnBSetgqPrHdKrWM/rCNFn g==;
X-CSE-ConnectionGUID: Ly9UG+CoT4i9CbF9748MNg==
X-CSE-MsgGUID: tq3zF+uES0CT77V123YZdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="76992630"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="76992630"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 17:42:26 -0800
X-CSE-ConnectionGUID: 0N6f/f2CRUSZpQgZLXBPMQ==
X-CSE-MsgGUID: zJFcfQuXSwaM4MhDHrV18w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="221036007"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 17:42:26 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 17:42:25 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 25 Feb 2026 17:42:25 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.28) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 17:42:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=azWgCP/4ASAuV5hl+U2dkTomOzt6FjmxYJHuL9FKN9+E4+ftAFCj+QAUgE+3rqh+sGpt3X56oIKJDYA+gwKlzN8AeACyESjA3cOs2VjfQiUZTzd0Eta6YcTnVM8z16BRjRBkYTt5p+CNarCeclmka0vG9WoyYF90sQ46SjfNxDCIk2ZAtri5IJlWTzP63sVnl2HDQonlyINNgBHK7qeKkQP1QV7HOOKHhE3JBCCYqwJir7ixE+JtQ+8AvzOfDB3Rx/vXcu62GGFzozJvfCJR/otPHK5aZqXxB4xly+QTtiK7E3G0jet5NLXl7is0PYnaDR2UtBKE20WPRSJESgaBFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWr+kcS2ApUSh7Gicou1Kpze+B5sgjxfbGwKDPnPCXM=;
 b=P2o4Yw16fNd3k/DGGO893lEsd8cpLDR4qVVONiqDXhpAsUcVOmQT3roFRwPsiGWyQKQBxk5WLost6PpqQzefiHyiRsyp1iR/pa7DEJ5yaZIGXpiBbNLjW9kXZqhZKqmqUL8s+WffGtr9oRW6auAhxb5GqN5ss/3ai6A/fOgGXT4+Ua/+aO+JIJsTUw9J8M0505+TmSDlu4LCxoi1wATeDmu9mm+6YkBzDdG6RhzTcIqZXN31V1ETxhjDv0a8K3qsm41dH5fkJ3ZlXBWI+phRyP7ddm/P70Zl3UXPJiHKkZGMp1mYFzoXTjVdL2pQw7dSAUdus9C+dLV5LZJ9X4NeCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5925.namprd11.prod.outlook.com (2603:10b6:510:143::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 01:42:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 01:42:22 +0000
Date: Wed, 25 Feb 2026 17:42:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH v3 2/4] drm/xe/queue: Wrappers for setting and getting
 LRC references
Message-ID: <aZ+k/Fd6wZ48czIy@lstrano-desk.jf.intel.com>
References: <20260225235447.2772383-1-tomasz.lis@intel.com>
 <20260225235447.2772383-3-tomasz.lis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260225235447.2772383-3-tomasz.lis@intel.com>
X-ClientProxiedBy: MW3PR06CA0028.namprd06.prod.outlook.com
 (2603:10b6:303:2a::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5925:EE_
X-MS-Office365-Filtering-Correlation-Id: 30cccf97-fa36-4f21-6df7-08de74d84954
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: PNvTYUa/LOsTiGJ+fdZQGCdlZNv+P5ohRzyBorpjExOZrpoGudrAiGhINE86wlK+7BhruZHTu5LVRnmGegw7jYw/q4m0czNgii1BGzuuUV0eUS5fB6XpDbZNPHv5R5S9KPbhiBQh5byhB4Jw/ovIsoqgZlJrYdykXzNUbXiVrmVZbp9LtWvhXEHjCS5X3hLbA3WpDajpDNL2m+HAFyfdQNycE/zxsHlrl+06kBzPN+uiQuDH++sbebqj2QlkdJfii70hdkNa8v+zXYA/3Mtp+twS3g/G/YpwPT6rdMyjUZ7w3Nz42Ujjbv91IKsCll9eDLfCwUgrJbw9B0/xvHpPEjtMUdnDGyGuhvFvvkjUNkaUl58Sm96Y3b1QHDm7S3SAH9TlkjqfvjJtL1woAa5Ln7xuU9i5h45Gcl7+51yXzH/BDfnXoq76d1uzkwGWUQDZBgcfIKTIagPfcEDKt88wui8WvF/D63g9qcsEAz/G6mkUAwRH6puPoOtxL3XI1AWOiAl5GdQFa1Qr+NpSkj4dcDBqbWXHn6rVtjgESR3NFpzJQJCEm1P2Yvd5jCosRQePt85a1leKZ9/JuFLV/RGZs3wWgT+dzAVGvbSWBJ0pe7bfHsN0qL1PUcBQZbeUrCnCGklMlepgdoPn56zbt/0wNnfo3hD7ASIWpadzeyj8tt5ViJnd7ezA2bmF/0iWHfK/SrQPttxWYQJLJrMBhM3OAjMoiboBkNX3vkWouDktIcI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sCW6f5Q1VrAp51ZZgj9DraYpZrY849kgpQKxFY46iHFVC+uXlR7OCHP6mKtO?=
 =?us-ascii?Q?sCIdlUD3n44MFSb4UDIMksLtLrv6fwxrlBiTozZdCRYuhXsJDReNt0UNTJFf?=
 =?us-ascii?Q?qb0OQyT+2PnhhycC/+GSRGYd8aFf+qrJi7x8Vf3T3NAf8elLjUXqcIfTzKPJ?=
 =?us-ascii?Q?tpJrI78DXsjCPPH6KWiJhtKgejbjhLyDaHBKMp0hN6H/Vk2Ee3m0WoorpUlL?=
 =?us-ascii?Q?csMLy5AvQ5LOvdSelOfeeTQOA8yVAUa8H/tKA7KzbDwlQ5yNS8c2VPr/LRa2?=
 =?us-ascii?Q?J1aF0jB2lnpJnju0lu2+mNFl+ekvDZSeAHfjuip5SySxP8JWTYenD4zOMbOj?=
 =?us-ascii?Q?eJbhIoakp1CYXreCjrW6EcpK8Kj9gXlKn2/Hr8LA2PvykylgLsaYArBEdgGp?=
 =?us-ascii?Q?t6Arhc8hoh7yTAp2o4oQ0rj7jWizQufdisEvjzY2TqM0m1UBCL7ziejYI9OO?=
 =?us-ascii?Q?8j/8ywOtaRERD0IOX8uS71GGJ28OnQv5Thwx0VAUlG8A0O4L0zGzd4UymsyD?=
 =?us-ascii?Q?1e5Ev5OxP/LnWLbTwxBaNwAtgkH6WFhbjx7k960BoFLPa8j1XhNEpkRyNEFI?=
 =?us-ascii?Q?LO0AkISMRIIqPAPmJG1sNEpp6zqDtwkg5655I39BbD8F1pD+VOBvwalCFY2w?=
 =?us-ascii?Q?tp4aslajblZi30sKZs1zEI+Epoh38en+wy1SPVAE9wSFV/7RzsK/fjrS89A7?=
 =?us-ascii?Q?ztQu2OncAS0sacW/Dr9tPIGILmDjCilORs6lylGq1Ifh0d/Udps5eOlEeIVq?=
 =?us-ascii?Q?UfbskKPJk12hpx4MMmLkuFkE51NEXTEVcnoImVmPciL7zzvQ0WXdATKneZre?=
 =?us-ascii?Q?vYJP/ZxBTfybi3VIL+IFz44aPvrR0+xbUljsRwvpYXu15YBgvKCCKE9r9q2O?=
 =?us-ascii?Q?YSK3WoRhABSWWCtnJCLPwQy3Uv/VrwoXFi8e4SgU8fp5takHBidYS/5FvXYD?=
 =?us-ascii?Q?8pf099ey8I3CnFXQTwZkqAO+8TPas59HAPOcZU4E2weL+WsDNulSkQiFv9ex?=
 =?us-ascii?Q?hq83cwjzIXuWr7C5JyAGLjhxXyEZz9Ej4Ajq+LNvx/YrnYpRk97QtkkIZKVc?=
 =?us-ascii?Q?BMomVQyr/BK1jreTkzdqEL3B95SNQ3Mf0ETBDft7AKJdm7ymJuMIlGctpkXz?=
 =?us-ascii?Q?HuXBfH5vsVaYapSzF2MncCXwftSxRHdhYM4df12KDbVMyNNcrssO25HWJr8+?=
 =?us-ascii?Q?yvjMoEMfqm43AOqX648Vsn+Ze1FrbRZ8Xps6Q99/etmE+0yqkj5YtdcZ6S5j?=
 =?us-ascii?Q?OMvsh5MRn/YvVgBKaLO5cez4W9s6LgRj/7vpeiXdAklEXjbXBAje2RVwrac7?=
 =?us-ascii?Q?T6NncKeYybeEQJB3IbZYsVYa4lDThjSm8Sb0pUAulTKYFf0DaJ7n+lGUHp65?=
 =?us-ascii?Q?12vTRhiMYdqkrMxRp/7wskHuPz1gDxmH5Boa1IzAxRfH2MATBKyfpC5A+ivA?=
 =?us-ascii?Q?JFwmeJFuxsJiPSDqBPYngEXNPO6oUFsgLk3sMGcyPiohzxQbjglbDN7GFtnB?=
 =?us-ascii?Q?klu/tKeK7WkW/JD3oNldrxZUC7nmEJmrhYqzlnsm6zJkMAmrQdXr4EdZIAy/?=
 =?us-ascii?Q?q6qPEDaSRT1RyTLz5kI2cOU6yOIrsRYtoITAF0TtMn8PB/smoqYsi+JVfGIy?=
 =?us-ascii?Q?DyShYWJMhOIoV+q/bdf8ISWDNAC6ZpbgB4icRl6Fn5wOJfdLfSljt6kr5wNJ?=
 =?us-ascii?Q?wnz7v86mhA/0iNefMzdU/qcu0rF6A1H6JzsnhyJmfC9QTVOuw9S0+5UlUXXW?=
 =?us-ascii?Q?nZYz+Vjea6i+tTHVEfbpKeTQoJYbBwU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30cccf97-fa36-4f21-6df7-08de74d84954
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 01:42:22.8355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E2T7uiqRdSqAFXamDEPr5CCgdaBqlf20YXhqMzRSnxNmIADxnDrfm1peeQInEXSXlMBooy6Z5WNeWf83z1pPqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5925
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

On Thu, Feb 26, 2026 at 12:54:45AM +0100, Tomasz Lis wrote:

s/'drm/xe/queue'/'drm/xe' in the patch prefix I think.

> There is a small but non-zero chance that VF post migration fixups
> are running on an exec queue during teardown. The chances are
> decreased by starting the teardown by releasing guc_id, but remain
> non-zero. On the other hand the sync between fixups and EQ creation
> (wait_valid_ggtt) drastically increases the chance for such parallel
> teardown if queue creation error path is entered (err_lrc label).
> 
> The exec queue itself is not going to cause an issue, but LRCs have
> a small chance of getting freed during the fixups.
> 
> Creating a setter and a getter makes it easier to protect the fixup
> operations with a lock. For other driver activities, the original
> access method (without any protection) can still be used.
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 71 +++++++++++++++++++++---------
>  drivers/gpu/drm/xe/xe_exec_queue.h |  1 +
>  2 files changed, 52 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index b4ef725a682d..2cb37af42021 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -270,6 +270,54 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  	return q;
>  }
>  
> +static void xe_exec_queue_set_lrc(struct xe_exec_queue *q, struct xe_lrc *lrc, u16 idx)
> +{
> +	xe_assert(gt_to_xe(q->gt), idx < q->width);
> +
> +	scoped_guard(spinlock, &q->multi_queue.lock)
> +		q->lrc[idx] = lrc;
> +}
> +
> +/**
> + * xe_exec_queue_get_lrc() - Get the LRC from exec queue.
> + * @q: The exec_queue.
> + * @idx: Index within multi-LRC array.
> + *
> + * Retrieves LRC of given index for the exec queue

under lock and takes reference.


> + *
> + * Return: Pointer to LRC on success, error on failure

NULL on lookup failure.

> + */
> +struct xe_lrc *xe_exec_queue_get_lrc(struct xe_exec_queue *q, u16 idx)
> +{
> +	struct xe_lrc *lrc;

struct xe_lrc *lrc = NULL;

> +
> +	xe_assert(gt_to_xe(q->gt), idx < q->width);
> +
> +	scoped_guard(spinlock, &q->multi_queue.lock) {

Hmm, this isn't what 'q->multi_queue.lock' was designed for.

Can we get a dedicated spinlock? Maybe 'q->lrc_lookup_lock'?

Open to better naming.

> +		lrc = q->lrc[idx];
> +		if (lrc)
> +			xe_lrc_get(lrc);
> +	}
> +
> +	return lrc;
> +}
> +
> +/**
> + * xe_exec_queue_lrc() - Get the LRC from exec queue.
> + * @q: The exec_queue.
> + *
> + * Retrieves the primary LRC for the exec queue. Note that this function
> + * returns only the first LRC instance, even when multiple parallel LRCs
> + * are configured. This function does not increment reference count,
> + * so the reference can be just forgotten after use.
> + *
> + * Return: Pointer to LRC on success, error on failure
> + */
> +struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q)
> +{
> +	return q->lrc[0];
> +}

Why move this code?

> +
>  static void __xe_exec_queue_fini(struct xe_exec_queue *q)
>  {
>  	int i;
> @@ -327,8 +375,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>  			goto err_lrc;
>  		}
>  
> -		/* Pairs with READ_ONCE to xe_exec_queue_contexts_hwsp_rebase */
> -		WRITE_ONCE(q->lrc[i], lrc);
> +		xe_exec_queue_set_lrc(q, lrc, i);
>  	}
>  
>  	return 0;
> @@ -1288,21 +1335,6 @@ int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
>  	return ret;
>  }
>  
> -/**
> - * xe_exec_queue_lrc() - Get the LRC from exec queue.
> - * @q: The exec_queue.
> - *
> - * Retrieves the primary LRC for the exec queue. Note that this function
> - * returns only the first LRC instance, even when multiple parallel LRCs
> - * are configured.
> - *
> - * Return: Pointer to LRC on success, error on failure
> - */
> -struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q)
> -{
> -	return q->lrc[0];
> -}
> -
>  /**
>   * xe_exec_queue_is_lr() - Whether an exec_queue is long-running
>   * @q: The exec_queue
> @@ -1662,14 +1694,13 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
>  	for (i = 0; i < q->width; ++i) {
>  		struct xe_lrc *lrc;
>  
> -		/* Pairs with WRITE_ONCE in __xe_exec_queue_init  */
> -		lrc = READ_ONCE(q->lrc[i]);
> +		lrc = xe_exec_queue_get_lrc(q, i);
>  		if (!lrc)
>  			continue;
> -

Unrelated.

Matt

>  		xe_lrc_update_memirq_regs_with_address(lrc, q->hwe, scratch);
>  		xe_lrc_update_hwctx_regs_with_address(lrc);
>  		err = xe_lrc_setup_wa_bb_with_scratch(lrc, q->hwe, scratch);
> +		xe_lrc_put(lrc);
>  		if (err)
>  			break;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index c9e3a7c2d249..a82d99bd77bc 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -160,6 +160,7 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
>  int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
>  
>  struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q);
> +struct xe_lrc *xe_exec_queue_get_lrc(struct xe_exec_queue *q, u16 idx);
>  
>  /**
>   * xe_exec_queue_idle_skip_suspend() - Can exec queue skip suspend
> -- 
> 2.25.1
> 
