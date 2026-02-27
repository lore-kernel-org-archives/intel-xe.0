Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D468CFD9E3A
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 20:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A89D10EC27;
	Fri, 27 Feb 2026 20:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CA31Ci0c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72AEC10EC26
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 20:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772222899; x=1803758899;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Du9cicknHW97+S+euazYbhyXZT+HwBZewu2Ua6TMEtI=;
 b=CA31Ci0ccjegxbUuCg9aNLGOcOfapuCQhYCBcufNGXr2KX8rpNBudR4z
 RMNBBV4+4R3gOSiYGlP5/ZY3DGADdisL7C7k1CthfdDenzhFWzTStxuTG
 1q4+M/09rv0Zkw0kJzeEFRdqDqcsLlm4kd73TTeluFJcduDTJHfU2zloJ
 kqWUlzW5aErmpuR386N4CfqGvuybcqvaWjYh0ATp5njOfgtwi8hRN18aT
 KQOtUD6qYu2FwE5oz4Xw8OBUU28Q1O+eX7Dd9i9vYVhr1X8vUHZ9HgViG
 REEqeCupvtG+6d/+7SmV6g4vpXkAHFjB4iKZRH9b4wcvgslMZnN4aAVno g==;
X-CSE-ConnectionGUID: iYQkgb6USeiAtR/tIsM/ng==
X-CSE-MsgGUID: 30qYPZUeQdyKaeIzIucMDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73223924"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="73223924"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 12:08:16 -0800
X-CSE-ConnectionGUID: fNit0NOTSr6o9c3guW/SZQ==
X-CSE-MsgGUID: /ZyrR/JFSeSE30HsGXsiiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="221622719"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 12:08:15 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 12:08:15 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 12:08:15 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 12:08:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6oJk+0ErkUgL0Rb48Mr7a7xLOfQju/RoVAEJTdvNDJRHIvNo2kFnTtizk34Un/FWtoyjf2QjxFAHb0W54H/fC4YVGIKSoGy18IWYZrfGv1ltTIpL6MFRDdMuKFGWA5l12VDU74+j8UL2iyaBHAMVoGuMJqC6RJnJHdr9RiurvpJsnZzsEzUvR+GvhlqbSwcOMMWrh7I+JQv0dhaZPT6zCcZ5GPTciPXniRwlDgxAvIAlGww619UAnBK7CkRJ4/fL7Bf+UJ3XpVBbYhqvMgxQ2CYYa+kKTM9AwOkgC/NZhoV12vyBIJ0Yif9N9qyvH3EoMJ63kpqepe/4fYv4PN1Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNEOVuGAJwxHLApFPuOtWmZwIZ+M/zsOveFiVOhBRl8=;
 b=skGouS9JUMpuI9R3Bui/6/FY4x2aJ7GO3MLZeRuISm+BH1+QqGlUcDyaDI7z9j053JovIKK1Bst1C+0/ezIABm1I5nns8J3gRDoFk50Wr28qxErMcVCmqe4+t4NrwVSHZGV4K2+ce3wboloOxpUR2/8wLWDZ0eQhUi46sF7PraVXryC/xfAfG3U/JwbaH/bx+CYTmygtbmwKTtetQOzlT9w/MC3FLURPlppIrnBvLDfVPxqGCrcxvqaz57c7cEOxpA/d8cJccqF/3oeYYea3HfWu3PFlu3Vq/5/ncviDmMg4ZholdQPUPhwOaCPXxn/HgHeomljyxeOzXCsH59ne8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ5PPF57F27BA08.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 27 Feb
 2026 20:08:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 20:08:12 +0000
Date: Fri, 27 Feb 2026 12:08:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Nguyen <brian3.nguyen@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers <stuart.summers@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: Skip over non leaf pte for PRL generation
Message-ID: <aaH5qkyzaD8CCl0i@lstrano-desk.jf.intel.com>
References: <20260227014212.992363-4-brian3.nguyen@intel.com>
 <20260227014212.992363-5-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260227014212.992363-5-brian3.nguyen@intel.com>
X-ClientProxiedBy: SJ0PR05CA0086.namprd05.prod.outlook.com
 (2603:10b6:a03:332::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ5PPF57F27BA08:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b979d8f-d2c0-4199-f628-08de763bef3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 6JwD3RMLocCDzbMIYAE8wRLJTSISsD8UixRt9qyphrF0YByYg00ccKAH705xSj8fKMwLT19J/Zp5KHr/zcxQ2sl2y+kXe6F2+aHjlQMsWjfXV8c17ivt+lCYg/F0H9CBmcQFdMtxzVjtjh1azq9J859t6tixQyGrbSsc5zPRmvfSFE/XPYeOP+ZdPyVmOvZ+iZqN++bjKTB74JuYGBih2FlNpWDKD/Fy8Ju6tB5QzZxJvuujYNF9YhavaHySPxfLjXK8yAnsH/0oy8REVDVSCx/j3cINldMm81hJswFDzf0RyBdK15DhPUJg+z8xQ8ptSpii9kKVFCgqwiOxADC+dBYSm/j8shAnMZZm4A8e4hMnwX6ggK811Z1aaKwIafZTR+ei302XWsjnEDir7tVyJ5CyF+Dvi2qO4TtIr9zYlQ2MKc+o9rvpPvYUI+tXm54k5h7wblUK1G3XtMR5LHg5huzTQvjujVXr2a8okWMCratrcv1z0AuMzpE8AlGV+tUWhKmOVrAS+3ux7a4kVdMDR6IR0iuvsDBMhpj8/uiQtTLtd0xYBbii5fZr/yNsFoLL0rAojZTp4rMrFVw4/xc6ZfJ7q8cUpf6HFH34+b+NsKHqV2gvgmE+lEjtIzUMI8rMKEkmH06XnJtSZ6twPR1i/9bbih0BJnf7PizUHGXpGrzAltHEf/Xv5/nh9FCjz/vZwyGixCHSU09XNgsUHlJaAvPanVOQqKdOrQWbKbuleyk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W4OvfDVY6bipE7xf/DEpM/G96fP5hHycYLJRAwOTujbGRJmhTWcGs2qRL4d+?=
 =?us-ascii?Q?Er7O7W9FK7b0WQg+pgv0eUdTjGRxgHmFAm3Jt3FuJOZTk6VVtHs+E11vGsWq?=
 =?us-ascii?Q?nwt7wdcnMPjaqa9mMRUlCtjbFJmbWNqclh162tyjPsg0IRgMyY4VMt8WmdMA?=
 =?us-ascii?Q?B0+gtOOg1W8Dsl9tHnw/+46f1zHIjGLENCZh5DnKCsFUAX9JshQiM+9Twx2C?=
 =?us-ascii?Q?XB3QReBI0DqNewO+2zMBPd2cp0oUNJoBP+4wH8sj8cwu/D9T/EwgZG+MPSOn?=
 =?us-ascii?Q?1+slPXInol/pm/UIOoWlpdro7dq76oYs6SUKHBVbU4VMwmwj4IYpOVLVycUX?=
 =?us-ascii?Q?mySU3C89/2PM2nKch4zUXKcb2wPKaEzpEpsdClc38WyQ+h9sAAUx2kzDb0Ct?=
 =?us-ascii?Q?G+6uqJzl/Ig9fdHFkO0zc4OBEM61G5rBV7qEWAZ/OlCnt38GlRLMy5+qZwmr?=
 =?us-ascii?Q?gzHKGw0S9HOWiQccqKm9WiRFoviXBbxCzladnhIpS7FrZTGHF4n2hRC2DD22?=
 =?us-ascii?Q?lSp4iJ45JYA3zY8eChLWe5tblzxZzBm1sPu+UlC3WBLvGgoh5r9j+JdRtOUb?=
 =?us-ascii?Q?pkmvHkXqyMiq1UlmlRw2A1IbMhcuzgLTD4CTZ6KfDCF4Ldxnf7sBqxeHKAj3?=
 =?us-ascii?Q?1hE73b24CeMqL8UK/se5bQ8BufKFH43SK6Vx/UVwDmXratIEN45/l1cHwSwN?=
 =?us-ascii?Q?r48Lac174RbYCFxp5BtAGPu/6bdGEl+1Q/6cz7ZGIsmUDk5e5YKVuSw57G3z?=
 =?us-ascii?Q?56Wiv1oQcEF2v6MHlhcW3s6T7E+8f7XPG4PtBGdV32jwHMOVicmXWc7QtM46?=
 =?us-ascii?Q?OgiCT7VmsImttpNpU/a6qGJfWBiPbtqD/+itRkKzguC8hRVD3OUftNiSvvyS?=
 =?us-ascii?Q?zCMEAy16aUbWQL6y0WsEez+d/uJrHtwDlsiB9R7FL/Shm1fn98Bx3fbOBxDL?=
 =?us-ascii?Q?HJgl0Gq31/7G8f1EWYDEcKM9rjc2OTum1ji/E3NGrpmCwrFDue13fYlObmlf?=
 =?us-ascii?Q?AgW4QDhm67rrKwKqoJc9iwPDlwpzmMRQAyxYxStjylrsRdIdY7S1Cq8PA8oz?=
 =?us-ascii?Q?2SsmBroWLK9t6aaRErKHZ2qhJspcN0/gx+MOUL8sbx+azLqTaPO3pAiy79yi?=
 =?us-ascii?Q?I6nBExSTJauYZ95KkWj9wxqNE0nLrWAUSH6axdIUXditDNfe74Fmi3nlDeYc?=
 =?us-ascii?Q?AA1kX6zgxeiwjJVPIQiu/JQFqtlFyrtu/rZqwmuI87E2v/wduz8cVrjdASCK?=
 =?us-ascii?Q?iXGX+MiggphkXnI9vVwx2HH+v5vlIrigDZY9g+sffj0d438Dz/VoElm5Ig6g?=
 =?us-ascii?Q?E4UZ+JfHb1qJc6gAW8v0vbi6yvXtvZmQwXXfA2rxLNazdTmhHV8gxPW8Q+e+?=
 =?us-ascii?Q?cuVozX+9WeX68mlYXTvh0/58/XpVs15hZPNQTQ3LwkmDxu6GrOJgcrH9TCQ2?=
 =?us-ascii?Q?eQv1roROVLeqXLInvy1ooc+/WFe775X2WDtiZdhgAW9qLdDv7FCWQIawaDHF?=
 =?us-ascii?Q?UWYdVHcFV8myM+rNKJ3dWyTeHTnqsszPVOlYmJk+gkCNjWJUE0YjK9dTb0zm?=
 =?us-ascii?Q?BcGWFfJavzQhZDk3JHHPw5EzhrwtaLLu90UNP/gHFf7v7zhdmf7T6LT1AYZm?=
 =?us-ascii?Q?k3E6iRSOvj8Swt8QaYpWsnufvUgYuscMpiuRW+/96yooX1xA1O+Kbf3OInft?=
 =?us-ascii?Q?RcPpulkhUsF4MA3HT6upNaWvjLnJagkTH0XSqc+7EYrPJeuSzhf6CyOcKNGc?=
 =?us-ascii?Q?rC9BUOkOgrmmWhPSSNR+bDU4BpCKz/4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b979d8f-d2c0-4199-f628-08de763bef3e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 20:08:12.4601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: npRKSDkETRPokuOU0tc6XkUoQFtY9QbOb+uUIVcPe1YseoFcgf9umWWbXFVww0sWtzmELVTvP0S7jZdC+Weoyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF57F27BA08
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

On Fri, Feb 27, 2026 at 01:42:14AM +0000, Brian Nguyen wrote:
> The check using xe_child->base.children was insufficient in determining
> if a pte was a leaf node. So explicitly skip over every non-leaf pt and
> conditionally abort if there is a scenario where a non-leaf pt is
> interleaved between leaf pt, which results in the page walker skipping
> over some leaf pt.
> 
> Note that the behavior being targeted for abort is
> PD[0] = 2M PTE
> PD[1] = PT -> 512 4K PTEs
> PD[2] = 2M PTE
> 
> results in abort, page walker won't descend PD[1].
> 
> With new abort, ensuring valid PRL before handling a second abort.
> 
> v2:
>  - Revert to previous assert.
>  - Revised non-leaf handling for interleaf child pt and leaf pte.
>  - Update comments to specifications. (Stuart)
>  - Remove unnecessary XE_PTE_PS64. (Matthew B)
> 
> Fixes: b912138df299 ("drm/xe: Create page reclaim list on unbind")
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 34 +++++++++++++++++++++++++++-------
>  1 file changed, 27 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 13b355fadd58..6fd5f0c29d44 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1655,14 +1655,35 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
>  	XE_WARN_ON(!level);
>  	/* Check for leaf node */
>  	if (xe_walk->prl && xe_page_reclaim_list_valid(xe_walk->prl) &&
> -	    (!xe_child->base.children || !xe_child->base.children[first])) {
> +	    xe_child->level <= MAX_HUGEPTE_LEVEL) {
>  		struct iosys_map *leaf_map = &xe_child->bo->vmap;
>  		pgoff_t count = xe_pt_num_entries(addr, next, xe_child->level, walk);
>  
>  		for (pgoff_t i = 0; i < count; i++) {
> -			u64 pte = xe_map_rd(xe, leaf_map, (first + i) * sizeof(u64), u64);
> +			u64 pte;
>  			int ret;
>  
> +			/*
> +			 * If not a leaf pt, skip unless non-leaf pt is interleaved between
> +			 * leaf ptes which causes the page walk to skip over the child leaves
> +			 */
> +			if (xe_child->base.children && xe_child->base.children[first + i]) {
> +				u64 pt_size = 1ULL << walk->shifts[xe_child->level];
> +				bool edge_pt = (i == 0 && !IS_ALIGNED(addr, pt_size)) ||
> +					       (i == count - 1 && !IS_ALIGNED(next, pt_size));
> +
> +				if (!edge_pt) {
> +					xe_page_reclaim_list_abort(xe_walk->tile->primary_gt,
> +								   xe_walk->prl,
> +								   "PT is skipped by walk at level=%u offset=%lu",
> +								   xe_child->level, first + i);
> +					break;
> +				}
> +				continue;
> +			}
> +
> +			pte = xe_map_rd(xe, leaf_map, (first + i) * sizeof(u64), u64);
> +
>  			/*
>  			 * In rare scenarios, pte may not be written yet due to racy conditions.
>  			 * In such cases, invalidate the PRL and fallback to full PPC invalidation.
> @@ -1674,9 +1695,8 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
>  			}
>  
>  			/* Ensure it is a defined page */
> -			xe_tile_assert(xe_walk->tile,
> -				       xe_child->level == 0 ||
> -				       (pte & (XE_PTE_PS64 | XE_PDE_PS_2M | XE_PDPE_PS_1G)));
> +			xe_tile_assert(xe_walk->tile, xe_child->level == 0 ||
> +				       (pte & (XE_PDE_PS_2M | XE_PDPE_PS_1G)));
>  
>  			/* An entry should be added for 64KB but contigious 4K have XE_PTE_PS64 */
>  			if (pte & XE_PTE_PS64)
> @@ -1704,8 +1724,8 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
>  	 * Verify PRL is active and if entry is not a leaf pte (base.children conditions),
>  	 * there is a potential need to invalidate the PRL if any PTE (num_live) are dropped.
>  	 */

Everything above here looks correct.

> -	if (xe_walk->prl && level > 1 && xe_child->num_live &&
> -	    xe_child->base.children && xe_child->base.children[first]) {
> +	if (xe_walk->prl && xe_page_reclaim_list_valid(xe_walk->prl) && level > 1 &&
> +	    xe_child->num_live && xe_child->base.children && xe_child->base.children[first]) {

Is this part correct? In particular the 'xe_child->base.children &&
xe_child->base.children[first]' part? Wouldn't the above loop catch this
now and invalidate the PRL?

Matt

>  		bool covered = xe_pt_covers(addr, next, xe_child->level, &xe_walk->base);
>  
>  		/*
> -- 
> 2.43.0
> 
