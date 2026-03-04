Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8167EF8FEA
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 13:52:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B5AE10EA26;
	Wed,  4 Mar 2026 13:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HVj8hK/V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0CE10EA26
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 13:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772632321; x=1804168321;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MuwxzFErQVLGb96JhaKfW4gAKjnFUhJ9T9MElatxxx8=;
 b=HVj8hK/VvOqaplNxGsaxKgLTeDuzJ02s54JQju4q+0MQQpmr0fYeKSxE
 tGXplXUHWhuf3y/9vBPES2OIXX7iK5uNVxQPqZ5XRBrVPS3e9VMRVPtyG
 xESCoA5KB7sY3P0WTzujGZ+PxarTbfbQ8yLlYiODZB7AyXf33y0e98GY3
 zmUzijtipkm/UmZG9YdC7WRz3wVExnyNN6zmbB3sVTOe4YD44pU0/RQAr
 21yOQtv35zQAHQYL8St4OM6pBBwu5V5NhenKDz0pldO8fO0e7fifElu0s
 D1zKcpTcejPd4DW23qqIiTDhojGcNnsiM5IenonTWqARir6qc2biKkhup g==;
X-CSE-ConnectionGUID: 5XPkdlt0QliVmIKkUCtO9g==
X-CSE-MsgGUID: 608ydW23QDm0kGQ5XE5xZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73817933"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="73817933"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 05:52:01 -0800
X-CSE-ConnectionGUID: yR5MHp5IThuOYayvAD4ZvQ==
X-CSE-MsgGUID: SJq4sVu+RGmsLar/M/EevA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="216655858"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 05:52:00 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 05:52:00 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 05:52:00 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 05:52:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SRtChLlYLe+h7ggtarxuLYi5dEkD5JR2c1+K2yVQruHJBu/Er43T9EzYW+1DSQSZXlpa9BbAgy03ORb5avJ4FeugTE0PZ09ZcGx7x/K0ArgixYzDbh99bHOE/zHqLL476Uyh08xn3LHV4dLVr78/zBfKfwtPmTt/GJ/OwKO14AsvmRZUsqHek/2Xhty+mX5qvluxTR1bb5skV8qVIeautDqV2QepQ0zE9fZI3/NNfjB/M1ThXBXhPiTNUuaQIVC8hsos0EKfCkdUuNWrkxrnkBmXUTa9Sgcygc7ZVZxVBrS/W2v0SL5Gh+Du1ndW3SkzYU0I5V0vdtYc9NirV5qnrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIXUfBCpgnvz/wF227xvQlx8AjpT+VZHd53Grxi89tQ=;
 b=A9olvWe2r/c6qYMi4bQmtxFMROrtyce2RpVVWTd3tydehyyeZA+RJs3OoSnpc30XkRdkojqE64FMB456hMsZz6/UALocX2rM14MTwq+e9m4rYWPP1xznWx8gwIIYen3CihZijPFD5wATZH8+t9JIR6boFYQJlmBpVvWrK57T10RUdhE83W84r1k+1+HJmPRam4ep3Q63fjxc5+xR+0StlYEBO0OQtMnexFmlQMAO4b4mrLlpuDQf04q6unhkuUUSbnq6nqfdhddUleOdBVDJsscU8yZeWIJeSMMLX/lIxvxWjzlPX6vuX7KP3zWWkC1u4o4FyoCPDG4AIRtrOv8QMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH0PR11MB5142.namprd11.prod.outlook.com (2603:10b6:510:39::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 13:51:58 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 13:51:58 +0000
Date: Wed, 4 Mar 2026 08:51:55 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH v18 7/9] drm/xe/xelp: Add AuxCCS invalidation to the
 indirect context workarounds
Message-ID: <aag4-yDfriwix1Sd@intel.com>
References: <20260304130314.6084-1-tvrtko.ursulin@igalia.com>
 <20260304130314.6084-8-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260304130314.6084-8-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: BYAPR02CA0060.namprd02.prod.outlook.com
 (2603:10b6:a03:54::37) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH0PR11MB5142:EE_
X-MS-Office365-Filtering-Correlation-Id: 44c5be64-abb4-452f-7467-08de79f5340f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: FdHkAO3ZT3nJtPQ1slWniYvG3QcUDXbt2Aj3/NAnvCh73PE0qLUYNoS3XjZrmtDMbJhMZjf6k6pnCLqvQZO+qlYqAkJqKm79GT4dJ6rnunxM6+615+FuCGGRgHKzoBNU3Eytg/mwt1E86YXfovhLHu8zX9m95YbkogCZkakMZgpnLKWwAvdz5MHC1pixZRr8cqZSccslAeF4WwNeV4EQNsIntTe8fjK7IK6ixEbvfqI2TRdZMCB9lPadgX1H/pO06AS+zUa6f23d2GDw8Gt4Xh7j24LKwKSrA304BNsMcBvWWDoDxwDBSD6s4OpxZPwHtAIaqpd6yAvDeR6WHVdO3HYL1l8O/5Ld2hUdq9WdrAl9xRfGecnxh645lD+4Tvym98I+XWPTZO3Viq0jWIC4vAR8wgXixYgiE8VTr3AbB/pzFhPhgz8E3ZXaNVkDYbh2wtomyp+/VqZjMpzBFw8qXlK+ZdJYOXPomjTg9j+RemDKPY3MnlIvJqL+HfnXpbyqU22+vEL9XOi9Ln2YI79M7GFo/Mjhnu67FR/Ab4TrwSRKBHMDtXHXy3JL2mulDXNEl/GlnfxY5xYr3GJVfdaUp2j8zi/b9PAPTwR/bdFoJ5Q2DpTgJrVXDIQ7BBsMO8bLXQy4blqQa1v4M4j6HExdx42PRF1ZKz86xE1M/1R954d9B+EOOdR1l5zYDZHYodg2qhhPhKEdgpTaC9g0sLdLEN1i2Bi4khKgu1Dh/DVV25w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f9m+6vmmZiLdDSWOswiyG9NESPwLENXUbLyyD0zD9xQF46xCcTkrWKiTHzWg?=
 =?us-ascii?Q?0GKNFtbsoaDMbAKFE2FOkoFNUz25g+7EWj69PgRXtNxa7B0lOBjTN6KJEne9?=
 =?us-ascii?Q?YSQhatobpsL1rLNXqQ6PoSoT+My+56XscvWKKrygsTwtq2veTvxWEhGfMV67?=
 =?us-ascii?Q?wStTiZEaRgB40cXKo9LPn/2AvwGPXIdHECy6lZdZX0z34OdVnG5uKSbn1A/z?=
 =?us-ascii?Q?8hEh7MU7LAR7PUJUWmlQMHi6yqH1ddoeQ4O6KMBj/Wuq6ZicspQCdaNUKtvp?=
 =?us-ascii?Q?6VS0wTWB6OQhPB4OR6Uopo6tkw8LTwq4oTWN3I2ygJn0nRMfhO940co8eB9G?=
 =?us-ascii?Q?gE1jw1TRPPYJx9FxgxOKgPu0o8sLCNgB8ARjXsjyQArC8bT7q2+HVHAFLMDy?=
 =?us-ascii?Q?ofVXr54VbIeCljTo0pl+w9AUwNE1bzXuKq+j0qt4hgPpvnBfa9knRcbrOyuB?=
 =?us-ascii?Q?9aFRKk0nk170yAQAOUBoJi0As47bH9AWE6spKIjxM3m9eJepzCdqedFn5gZ4?=
 =?us-ascii?Q?vcWaBWp43FIHI9lZC4KL2/hEIyEBfqdjmWUQ5rEm4zRHX3rmrnpW9RkY3F2i?=
 =?us-ascii?Q?NQKpyYqHetPOpzAq8Yk8Xsc+UmZHZL+tmGc5uus9u44KjSNx8VopG1OZ1xY6?=
 =?us-ascii?Q?Ljnq6+wJCUtNp3Y9PVGD8mPpu9lssOHyGESwGWkLcyRCr5zu4LvRqtLIvPIj?=
 =?us-ascii?Q?ctrDC2AHdYQhzan+l5auChb1lDj407j3W/WulhfEj85UtFs9wRDWh9+Dvk0U?=
 =?us-ascii?Q?T2lvUxfLijqOllB6K4hOXEefl64VrYmd8fd1xk0LNbxakO9LzQreRuRpuTX0?=
 =?us-ascii?Q?ImGqnBQoIHcWwq70mk9G458zvFYNCPAb7Egogcc/2EDjdDJrI5vqI4rVgJFc?=
 =?us-ascii?Q?AaKhpsw/MZptRjyjfTzqAYDJuHMipa3yaxakOxCDsokK+X+Fq3ArKuJwcMoT?=
 =?us-ascii?Q?+Om2RXrBayF4VBw7zfpEkAlmXB54htZL1UN2OMBC+sIEs8lGHMd0Rw/U0dXJ?=
 =?us-ascii?Q?ovidoQ//5tudXH7GeSOYTot0SIQoGJSX6o4QjcqFufkNwovvbYDtxDOLPHGk?=
 =?us-ascii?Q?6NZFnzt+8uOdZYg3vZ+9pCN/PUq3QsWBKYmRK/2QauY+VbgM95G+Gjs5a2RM?=
 =?us-ascii?Q?fuw5EU0c1YD12TuuX6bcLiUFNDIruA+lI/AdBvy2WsLjooLYy5jFXqYXmQoi?=
 =?us-ascii?Q?mTP99cDPRcJZJU2ZfpfezEvYyjAnwTgS/4+BO5bo25xXfFQNXNsIn/sJu+I/?=
 =?us-ascii?Q?w3ehVdfEjLda3rYZ7GE52EZmbmeP0RLhzW2smnJ02zweRlg+q0zlgqQf5BVP?=
 =?us-ascii?Q?ef6LkNtE0lMoUIxtiOrAzIwReYglLkXeWHZ5YJYq+8/SQMZDpmioMLeKqGju?=
 =?us-ascii?Q?6ouatDCvCJV4TAXcpC6sk5QB+oIlxqvgRMOf0bTK74eEr80yIs2Y1zxLwhG5?=
 =?us-ascii?Q?wstiBO93t09OS6+r8/uLUv5/Kx7+86PbovShZRY3PCIe7dTjg6nFqeBNaO+z?=
 =?us-ascii?Q?bb4IOn54Ec2yPCjjQpNIYATMc16kHc9j5CdvX7ER6UP4rkYdTkas47FknlpY?=
 =?us-ascii?Q?MoCLDx1Omhaq0PrDzryXnbFcteJcDY4CeUDoNLF/oHu9Yt9fhQBpJ4Rt88zV?=
 =?us-ascii?Q?JRg6AFN7MwIFEUWj9bpOBS3E0ZFaNFcvYGe2OHZ5nq0cVgCUXv9vPYRRqtBz?=
 =?us-ascii?Q?1KxZlWz1w0KgUZ+l47s4XIMx1SPK/eLlqtf2rRGlKndJTirh6ozLhouXMvDM?=
 =?us-ascii?Q?NVKLe9Q5gw=3D=3D?=
X-Exchange-RoutingPolicyChecked: uEp5ivrcno03Kep7FV8Z7Mglh+cb4TO4u2jL5MuAvmKNlmKimlgTGsszlO3IhTnojY3vYMwbKFsU8yP1Jbv2qRpxih68gD+/uySCVMxHFD1hJwlcCC7zDYpP4O+OVvT8xF7OscZpE0ff9tBUzuCtkLEGcV4/SJVNjTNIRzhaurrea7tUluaMyTRy3txKnj3e609i+q65OC9z9ZMRQjyCRJfP7OUuRk0jLyrhNm6P2FI3SaGJurLY4hVgsqtXIDaB4fnMPX2aNZAUY7M7aPX+pEB8AqolPZmXmUJTRdtIOsAADzCQ/Ag+nnQShduE8ymuOm70sjWGS9UkahowWNdY/w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c5be64-abb4-452f-7467-08de79f5340f
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 13:51:58.3081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n4yCMVAPo40M/5AFBRzYIenT0Pf6cEldFVN/8QneNQYxkjvqx73I0k4wVpF6gS1hLqYN4XqJVnM5g6xvgdwd8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5142
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

On Wed, Mar 04, 2026 at 01:03:12PM +0000, Tvrtko Ursulin wrote:
> Following from the i915 reference implementation, we add the AuxCCS
> invalidation to the indirect context workarounds page.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # v1
> ---
> v2:
>  * Reworked to accomodate aux invalidation becoming part of ring_ops.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index fcdbd403fa3c..2a6f3157491f 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -27,6 +27,7 @@
>  #include "xe_map.h"
>  #include "xe_memirq.h"
>  #include "xe_mmio.h"
> +#include "xe_ring_ops.h"
>  #include "xe_sriov.h"
>  #include "xe_trace_lrc.h"
>  #include "xe_vm.h"
> @@ -93,6 +94,9 @@ gt_engine_needs_indirect_ctx(struct xe_gt *gt, enum xe_engine_class class)
>  					       class, NULL))
>  		return true;
>  
> +	if (gt->ring_ops[class]->emit_aux_table_inv)
> +		return true;
> +
>  	return false;
>  }
>  
> @@ -1216,6 +1220,23 @@ static ssize_t setup_invalidate_state_cache_wa(struct xe_lrc *lrc,
>  	return cmd - batch;
>  }
>  
> +static ssize_t setup_invalidate_auxccs_wa(struct xe_lrc *lrc,
> +					  struct xe_hw_engine *hwe,
> +					  u32 *batch, size_t max_len)
> +{
> +	struct xe_gt *gt = lrc->gt;
> +	u32 *(*emit)(struct xe_gt *gt, u32 *cmd) =
> +		gt->ring_ops[hwe->class]->emit_aux_table_inv;
> +
> +	if (!emit)
> +		return 0;
> +
> +	if (xe_gt_WARN_ON(gt, max_len < 8))
> +		return -ENOSPC;
> +
> +	return emit(gt, batch) - batch;
> +}
> +
>  struct bo_setup {
>  	ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  			 u32 *batch, size_t max_size);
> @@ -1348,9 +1369,11 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>  {
>  	static const struct bo_setup rcs_funcs[] = {
>  		{ .setup = setup_timestamp_wa },
> +		{ .setup = setup_invalidate_auxccs_wa },
>  		{ .setup = setup_configfs_mid_ctx_restore_bb },
>  	};
>  	static const struct bo_setup xcs_funcs[] = {
> +		{ .setup = setup_invalidate_auxccs_wa },
>  		{ .setup = setup_configfs_mid_ctx_restore_bb },
>  	};
>  	struct bo_setup_state state = {
> -- 
> 2.52.0
> 
