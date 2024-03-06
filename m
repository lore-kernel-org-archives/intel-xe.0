Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC813C54E41
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 18:40:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9162811344F;
	Wed,  6 Mar 2024 18:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X5mFIDwZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CFF11344F
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Mar 2024 18:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709750400; x=1741286400;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=E3O8zhr1XImH9oMBQyQmgd1mwlQEMIFtwwTJrxkamvY=;
 b=X5mFIDwZPTI5+xMlBrp5rsAW7sXtNCXZXe0hcqkZNlb7a0NZm3Aue4p8
 1+AXCDmjgT9fhuptz37+BH1cfVHaPvIYRbIgGo6IE/t9MCgbYZrrNACzb
 9sYjGXRaNZYSZpiIZfVb/Jx4pJzgtoV+4S1YsM4ewoW74nI3aMB93O1Ue
 O7k7rr1/OpLysDUT3lmRZOt4/RqwjLtrZTo++vd/b3ewgPZOcoKDzxsGO
 TzWJzkvKTNy2y1bkX6E7p61ttcRLeytuLsEw6yi5E73AgcfgolljB11uf
 dAn9oU4H6uL0aiWTr7eySL3uEpIAp5KFdyvciELETJCtccCQIvscf0Rk6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4315896"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="4315896"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:39:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="14412017"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 10:39:59 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 10:39:58 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 10:39:58 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 10:39:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdhsP2AMDlQNpz8Rb6vuCWm45E38Gq13yuXyhA+KR5RW44okueWm6kjkKk64HVdj0dF8+UCjCAZOBo/qKMNVffhoAA2rytDNveJoboNPSSGrim3OJqSpOwDIKq1GNo4942AXa7JzGvXyiEI2cygiGtvRbW2QP2Qx3+JQWmwSJeotMj0vC/TGLrJaZb9dO7IggjLohF4t/0Bap4MKB0F32jpA5lLKLJDmr9mItMSHxbdsAUhVE+Fvv1JkameYPKC4awRyDaKqXz+XATk1XXGa6q4+prEH5yf6Klxs69CHS0r1q1FanX0AR96jdtPQTo98e9ipm4Bu4efapQS1Uz16ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RcAhwc12xM2Qy6QLzGrojoQl8P1trgM+CB5FaaqK+oo=;
 b=JWPzO4G1+lbMP+Cv53IU02fo/hMM5TPaWj69rg2tzpbkorpvfeQSRhQvFFhnfSrGPWgtHqDAb+jy37joOssDY4cq+/ljiJqANRLlwKkAFKnlDk455biuvNkQYH4FBPaHjCc6xamREtwWQH8SMylsPjtrakAtLetPMGOL4b3A6GINOErJR+5XNo/PJGrCMKUvsjOOoFoTfG0H3hnL2VRTay+54Q+h14J4kBFOKzNjp8/LZ+sY8c/JEJK7bNk9QuQkka0coy9PH1Eok+vTLkJbO1ZZ3Db5Kwc4bli200mKEw4FqQlK7eD2G+r5vyQalgBTOHtwlkYhRGg290a0STszmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Wed, 6 Mar
 2024 18:39:56 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 18:39:56 +0000
Date: Wed, 6 Mar 2024 13:39:52 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 4/4] drm/xe: Move xe_ggtt_invalidate out from ggtt->lock
Message-ID: <Zei4eE1Aym_9FdJ0@intel.com>
References: <20240306052002.311196-1-matthew.brost@intel.com>
 <20240306052002.311196-5-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240306052002.311196-5-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR03CA0202.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV3PR11MB8508:EE_
X-MS-Office365-Filtering-Correlation-Id: 05d503d9-ba1a-4766-36d2-08dc3e0cd1d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: chk/V3NvFYHlUK3ybhGvxg3yOi7AP816QJsG+06vllZ9rq/6J/I8zAsaDDWqg8f+ggNqMrLZd/plsGF3H0eMG6Mw3Xa3cKpPW8ocK58VWz219W+cD6YKXM6XvOCaQJ7oy7O5ejdWOui2pAmJhHID3PT2zPcxTDngdNuKN/ZZDFJpankTa/tMy1AP3A06ST1SyzTEPpZN3lX/ixQ2JBg1xisV0Rm+pr1THLmAruU0M70IMLyN13HcdWu8u6E2eNQZUfxhUIwP75yCp+63auI2VqNeYuTvmMF7EBfmrP9q7kcYnjSKbLS4fQPb0SFUuSqoQGCKn0CHSb1uq9NKGE3kB4esZta9oZMghjlf/F3qPLfzTyZlBm+aylKgPYIDQ8vr9NzEXVX1xhUYSvjz2kl1bFRCZakcm3R9yYH+7b2dcfO3RLwSSB1bT0GVSB0pTOoNZSwKYjyjf0SWhOeILiALlpRcgMAp1ruX9pg5hLxRf2Nw3wUSFnq4VV5xaEFGyNPohy1gi+v1CDyUBfNe63nzfflGbxzk5uHj7fgl7zO99NEaXzirlKK9p9AFB2Sh6ouglOlDbDAV8kpTuRu2jcFs1po7pDLOcIoByD+TALZ+XPzZySMVtfBmWveb/Ja+pQy6g/C7dsQguV4kVvE/Z98iMnAw/WoWe7tzBnFLe3rmigI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ay0eCXGrBaR9Eanm90VWiJJMg3/gCRVzOBzuJ9VkdozQPbazkvBsGbfH/y8M?=
 =?us-ascii?Q?Y/X4H//Z5cfZ2RbldyGQg0cmQjSqJom/rSshGoj8kQLJDJszpNAKy/B0H5ZV?=
 =?us-ascii?Q?M7RzIR1b9QcSrIO3LwA5KWNYSdTzs+rfR3Wdv6nDVov0rjev08i6nXeiAGRo?=
 =?us-ascii?Q?fOex/f0YepE33B/cnC4+e7UjNZ2BqE+Y9RwSCOyqsGQH3dq85MlLdFzwlZIM?=
 =?us-ascii?Q?AswSQss2MJ0bB9NnQC+9gVVhI9o3kuI9Q7Z0yp9YGOvR58Ry0xRRdgF6nspj?=
 =?us-ascii?Q?2hKXrupe8zEisrsRoSMxxv9sj+JnUygPB07GE6VqkZ7+MbHlRK+fhO/8KLR2?=
 =?us-ascii?Q?zGs/oDAB50QmwVl2rQX6PK1wLFRWsR6DAXYu3Ka9Ir9B8aht9GIxZRs8shPY?=
 =?us-ascii?Q?Kw+JIESp9L+SyLGR1FZZ+6IHOYNza33J8DWaSQdhQHQ9vO8wyfnGknWLSF/w?=
 =?us-ascii?Q?f7NQvYMCU+2a6+OIeHuxjjbqR0agb6Z+z7iBBg2W44SQeAPGQpedbdrMdk+d?=
 =?us-ascii?Q?PXD4FLyKT0QmwZvyO9JZqtMh5aGHbxpeEDtnd/cAau+qJyOW/2bngm93leGj?=
 =?us-ascii?Q?lpseoaIfOhM8wZ/SYMBiShc24C/1JkeVBn0NbBQzHL0MpXq23L1AyBQQFIkt?=
 =?us-ascii?Q?53bykDS5QkD6AWwfxm6BYxDvJTb2fJNXqFrMwYeYHFSaQLvKLYKwOCgVkWP+?=
 =?us-ascii?Q?uEvw33+lLuOjDtA4jGGl4VL0qD77Cwhit1JELeYmRb7mvYKWeteOCYOQEh20?=
 =?us-ascii?Q?+lx2heUOsAsKx1JjKtP7HRRkwkVh8rl8wdo5zJnLRvsvJi3xlodB/DGWix5u?=
 =?us-ascii?Q?iD7ER7acQsXXjNotUo3dGC6FhNnqY0uws+fJYzv30U9x/lXGvm5/BHl/19An?=
 =?us-ascii?Q?AN/EyNOEHYxJ1RfF/SVc8T82Qs04tSiO0oqW+goGUod1Z8e2ztgWySXnAFa5?=
 =?us-ascii?Q?fMU0/JnJ/C+iNa1CLTI9BYbXgqS+w0H07VGX7IgqKqpwQsc906a4W5X9ug29?=
 =?us-ascii?Q?3h/KXIqIPYxiHzDIxUYlk0cUQK9VMxUYL+Uaoh4aPA0hMy/a0nPXiDHC/2A4?=
 =?us-ascii?Q?Bud4QPbaDHfB1hKX0ZbIhprEypkJaicnGe+/bOABTxE0Nj09W2vPje251R1c?=
 =?us-ascii?Q?1Q+ey6MDDCJPyC6rzZKYOxE3HKme5O1MGZd+1WnjUwVHiLPcKR2VJZaU/qHW?=
 =?us-ascii?Q?bA0NeJMy5DJYxXLK6ix5tW434fPQ6u8dppmCRuA8hbCCin/+M9GmVOD4xdN7?=
 =?us-ascii?Q?Zas3N4Rn3UmiHFkP4H0J7Wl3eoQFIlGtw7O3xM3Z3x7yTWc0Y0xgxKBity9R?=
 =?us-ascii?Q?uz/XRnfyrtfOIMREcIHQmyoQqzSdzcEneBxdG6TgI7jWOjyXV4AGmLDST7wk?=
 =?us-ascii?Q?d5pXozxe8Ti9iD7ZRyk4IlWxYveYGcEIdFSenVcxGjBp6oOYbtKypEPV8NNP?=
 =?us-ascii?Q?E/FPnfnZ1OdK+AFIYbMDUSyVoEaAJfogwdgMoHzGUv7juKnR6eTwOsUsSzDn?=
 =?us-ascii?Q?qC53Qpj9E/n+zMB/8XbvYNLLSsgz7xbhL7969Uj0lX3hRtvd14ijYaRxOZvj?=
 =?us-ascii?Q?DmYpB7d5O08MUwm5OGajt/oxoEh+FnBut1uobGdK621LTb/hEitJFwFea3CZ?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d503d9-ba1a-4766-36d2-08dc3e0cd1d1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 18:39:56.3584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +x0br6f7ghVBenEji0pGLESkoQ7XqEgf92LTinEp0NOYM4hSWwg3keHN3ZPxaQFp9W2HYxjZAS3tHQ0mXz/M+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8508
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

On Tue, Mar 05, 2024 at 09:20:02PM -0800, Matthew Brost wrote:
> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> 
> Considering the caller of the GGTT functions should keep the
> backing storage alive before the function completes, it's not
> necessary to invalidate with the GGTT lock held. This just adds
> latency for every user of the GGTT.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 42e92011dd69..dc5a6994f1be 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -389,9 +389,6 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  		pte = ggtt->pt_ops->pte_encode_bo(bo, offset, pat_index);
>  		xe_ggtt_set_pte(ggtt, start + offset, pte);
>  	}
> -
> -	if (bo->flags & XE_BO_GGTT_INVALIDATE_BIT)
> -		xe_ggtt_invalidate(ggtt);
>  }
>  
>  static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> @@ -420,6 +417,9 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  	if (!err)
>  		xe_ggtt_map_bo(ggtt, bo);
>  	mutex_unlock(&ggtt->lock);
> +
> +	if (!err && bo->flags & XE_BO_GGTT_INVALIDATE_BIT)
> +		xe_ggtt_invalidate(ggtt);
>  	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
>  
>  	return err;
> @@ -440,16 +440,16 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>  			 bool invalidate)
>  {
>  	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
> -	mutex_lock(&ggtt->lock);
>  
> +	mutex_lock(&ggtt->lock);
>  	xe_ggtt_clear(ggtt, node->start, node->size);
>  	drm_mm_remove_node(node);
>  	node->size = 0;
> +	mutex_unlock(&ggtt->lock);
>  
>  	if (invalidate)
>  		xe_ggtt_invalidate(ggtt);
>  
> -	mutex_unlock(&ggtt->lock);
>  	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
>  }
>  
> -- 
> 2.34.1
> 
