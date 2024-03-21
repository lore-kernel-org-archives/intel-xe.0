Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F5EC54E58
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 03:22:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E24BF10E138;
	Thu, 21 Mar 2024 03:22:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aqHlC+Wp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9CE10E138
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 03:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710991326; x=1742527326;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wF9W01zWNnFAtn7JuThu0siZEr7sv3CRKcbpZ2PNUTs=;
 b=aqHlC+WpzsFt2orVXbyYez4p10n2KymAGDLVEDl3p7tJnT1V0DhDdnaD
 TIUjaHsLcj8THdx+jyHBIkZmI/e4VprmO3sNbJM2S5DGyCu+I5XkTZf8X
 SDISj2cv0xIwA24C2oCPRHJg1B4PFgb2Hc/TBiwb5h4/1f2QbsPTsPuLg
 E2ixHDaDulRvAJmuqIbouI+a7srdJ/0azZyh1401RbvTOVqIX/nTYvEOG
 OxnLgO6b8/mjb3Eg/BuYzBLNGLbXB2UUFQltJjDKttWQH1+dCVMhSxZN9
 1ziw2VXZKP/HUNVqY44bWv5JvD4AhIBkaEFs1khuEoT7dGT+USqn1MEzo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="9767771"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="9767771"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 20:22:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="37475876"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 20:22:05 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 20:22:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 20:22:05 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 20:22:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tl2UXNRUy9XmytNERePJHDBMdVm5zvpBuWUW98puDrVdl4IH01xqHBuFVMgk3hDXzxBQjZpnwRa5byTDFp5vQnDXEslDuUW/9EhhxWeCXXbZeUf5R9P2oG7d6eOL0YmFLWyzCil4jre03aNooZ0qHKX5extg4mPxxGwibAD+pGTBhAyk2dUIYyP6DAub7/EtI7lkbt+1IBNCd1GlG2FdIatWHUaKarnTHVBHtppAeL6lKbozqQl66CnhxZ+a7mueiG9VHZ8AqsLaAYv2kUAQZ29JAvUTIYBWgHHWmFqq3gpj0UxmgwuMQVBi43ypK5/5aDlCmvdFS5Ax2MaRNBhI8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwYKwtFfND/ac5qsNDFddlWtjcwFUUjE7ZbLMR/ne34=;
 b=MchewpZTlwRjBAxRpU3DS6NNIB2dzfTErb7/Fb90pAxcyM+1rAbpnfZU74ib1WZdebEyF8xRwNY1s3uLkUADTf/gYttTRhccGZpx53QE2+Cbq+WEh059He1aC8+SYBELbPLIVtVNP4tqPyoF5ZU/HpG++RQ3ngWzDvOul3o38lbSqgyDDghqhl0bJavrMNDrYPhFyy4vp1EAHcOs8RaUPzQ1IOndoIo5mARW0Uei6svSrEsNh9hY5QRqZ2uEQnQt0aNpfQKszHlIL8amBU3BaN4dt3x1G1vAI8I9IcDX6QW5I/1e3HV8vxLH27kZEzIfsvkqCqIBLKy1FRygSYNE+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7474.namprd11.prod.outlook.com (2603:10b6:a03:4ca::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Thu, 21 Mar
 2024 03:22:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.010; Thu, 21 Mar 2024
 03:22:03 +0000
Date: Thu, 21 Mar 2024 03:21:38 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@intel.com>,
 <brian.welty@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 4/4] drm/xe: destroy userptr vma on UNMAP event
Message-ID: <ZfunwkSUxdlFWmcn@DUT025-TGLU.fm.intel.com>
References: <20240321022939.2279979-1-oak.zeng@intel.com>
 <20240321022939.2279979-5-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240321022939.2279979-5-oak.zeng@intel.com>
X-ClientProxiedBy: BYAPR01CA0056.prod.exchangelabs.com (2603:10b6:a03:94::33)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7474:EE_
X-MS-Office365-Filtering-Correlation-Id: 114f20e7-71c3-4dbc-2487-08dc495613ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /5iEjbe06+5058S95hNd46kET4P1+ZYZ290ExUTdUDcjYNfy2FiDTikedMRzQe4M/Qwf128VEBgh0zvDvu6swp6cPU+pQbvdqY9cE3bo+pmpJk71ZzW4HpOhRwsuqwJLalnJEiqJ3TuvDsomE1BbzBIjRgdF3KNhx6JPEPsnyCkm9OjCkjOqKq02/S78rdj+Dcr7KpE3BeAzU4Q5QmKiLXK3sqXppzRPXpsyw4CX8v+jVnZRWZ7gkDk5Ux7Eta6obeRLxY05ogn2WvW9qn89f56i2R5wdjDqEIpyg+adA0QI+jgcnoR1tbDnor9bYs4ACtP9Q6emgwiiTVqTb6jp900nxDH89VOvWitY1gDwWxmoKilMGBHOvqZVe/dS7dH/1iYeko8uWTlywg5As4psXYiGSQJwk/ynHmLepI3A+5AFxb0tMsliHnRHD1U+Nj7klOSZjPrF/dKZ0rpJURxikr6ZJaSEerlzIj88FSwbrioTE1QyP+PBbBSGOu/WWqwn01GZXzcK2xEgnEqxJnx/cu2P7NSO1Xo2GKuC9K7WU7miW4N+jTAIFU061q+C6e2/2P44GIG1R2YZSBWXW03Avc9CqD82URN1Xpd9iWuw2JsMJz6/xNm951NUK70F/iPd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iBNmNxtQUPLI3gYkQhkk1FxA9dPSfCyJ7ZnYz1qGmnOvx57R4ZRPbnMrv0RF?=
 =?us-ascii?Q?kA/oDx9doGUNwgVIQdsev1r/o5V1SOqqH821aef44drWh6FK8YsFex3pPMYP?=
 =?us-ascii?Q?5YG7cybTZX0DTb+WGwPt0olksTz1hHYBeiNaliGoXQLWuPEH007sz7g6m0PU?=
 =?us-ascii?Q?0p7CI52fC+iX4n8VlBgu4F1zT1Tl3KBBe0PY5rqV7SGT7EHwQmsMSl3c5tUy?=
 =?us-ascii?Q?nSc2zm3uQ/rv7PlnvIqCCNzcx0Rs/FsuUU3skLOzc+jHk+G0ieOC1g0HxGdC?=
 =?us-ascii?Q?+WZwfahpMQhH5iRyTWSIDT7YdCeqgfVOibjwC55losdM42lJiKHbOr4jMgX/?=
 =?us-ascii?Q?oqzo855FRr4yNB2p7PaXNk4mdmXAhNmQYfm1STyywpw+bFq876NdSR8rfkLk?=
 =?us-ascii?Q?1jC9pQtKENnKkLqPhm3q47AxRG/y+9YSWatDmHU7BYMXNeC75XRFZVd3G+dG?=
 =?us-ascii?Q?4VGKxjj1uRlLynNu06OLxHatOHrBcbrRoYMfRhSdPr4mKaHabLJDZc8wyrhS?=
 =?us-ascii?Q?gtiNLsjsI1LCO1oTFBYSSLhg+qPXsakVzsrxOOdateiiKBGIgamn7i/c7Gig?=
 =?us-ascii?Q?hLnAHbDJkfU5mc/RoHF5R4HMrg6HshGnnIm/6ZwWmbAphSeMbR/rvtVnMf3p?=
 =?us-ascii?Q?syzxf67ly7n6KMnz3E5kYUXG+58LG8DQZ6Cm1i7PFSUs1ZX0R17gQ9W52bBx?=
 =?us-ascii?Q?yRpp2HsRDWb8GzbscrWVGpg6HSZIgFKYgP03WqBUaJwLR0iaQWqAOrJNY35I?=
 =?us-ascii?Q?qrhscu5AobIU+f6WDxOvqJ50Y9ad+/ItWYkigzWycVd6BCiUZ+FAxsPGJObu?=
 =?us-ascii?Q?qutVbpNk+ElRoao8+Z+K/jcJBEHvcNnasIZsNU6dhHzRYiRvgyOyGf3MuY+W?=
 =?us-ascii?Q?mEJ+ygMF6BHiUekVNb9JDdCe8PUeoroORQszqyXiwvEJsiho/53Zpb3yZMbh?=
 =?us-ascii?Q?aV58i7N1LiWZb4O3ZHbJKGrpm47rUf2ZfkybD2qj0P3b8hVX3QmhxD97DpQd?=
 =?us-ascii?Q?CGx6lI++0aQXTVihVr8+8kkEcVRb/QEW6iZBSs7uK+cXIfwFCdMldZtfN56j?=
 =?us-ascii?Q?nB8MskYDll7+hvkdC+0WMbAKaPBpLoFlu1RXbSxLWKIOjCTQJMMGkkLo4Jj6?=
 =?us-ascii?Q?tvsqqO4K+LIpaGBaNkqR2zsDtP9idIzAMSuoSXWjqLeXFB39zQp3shP0wlZY?=
 =?us-ascii?Q?58TJq5kGSVcHysMKphkGnuEbGs8ktC+ikIVxicch3BRmZaj12bhV+krYSyIc?=
 =?us-ascii?Q?RGLRi9Kr0Ct3FcHeeSAfE1G9wnJjhhoIBN8ZyXB0LtilzIGbLKDGQc+aQ1h3?=
 =?us-ascii?Q?ixnpljP1onV6Kp/v/eWEnJl2OYROuCNbj9snpFoG3tpIlCrM7GRjgLC9iEmd?=
 =?us-ascii?Q?1Zon4XbJilXBXBJy6jQBRkcbIuBJYS3R0RfM9ZPUBdh+hqTFF45anImDpB3v?=
 =?us-ascii?Q?VyfJYZcjQfQ9yS30P29awTc9Rvrl7bDwpWMvS0FG7SfpkRYiF5PbQ8PPyKPt?=
 =?us-ascii?Q?oeqsdnSK2Pp0rKtNz7hkUy2opG0QdK1PGUrNKMC5KTgqEfBNtDYffFqJzfAj?=
 =?us-ascii?Q?y7yX95u1YKXLuRP6sWfpBdKwQJH1+ma/VQZQZis3DFhjX7VLv92UFUgTDyWP?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 114f20e7-71c3-4dbc-2487-08dc495613ed
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 03:22:03.1554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61oQTwm9qNefeXG0Qqa+8NoKRKBco/u3s4QBcDH3pn3cjd8n6mVve8RAcQqz3pyDA4zCyvukBC3hGpvRb9+jAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7474
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

On Wed, Mar 20, 2024 at 10:29:39PM -0400, Oak Zeng wrote:
> When there is MMU_NOTIFY_UNMAP event happens, the userptr
> is munmapped from CPU. There is no need to keep the xe_vma
> for this userptr from GPU side. So we destroy it.
> 
> But we can't destroy vma directly from the mmu notifier
> callback function, because we need to remove mmu
> notifier during vma destroy. If we remove mmu notifier
> directly from mmu notifier callback, it is a deadlock.
> xe_vma_destroy is modified to destroy vma in a worker
> thread.
> 
> Another reason of this change is, for the future
> hmmptr codes, we destroy vma when hmmptr is unmapped
> from CPU. We want to unify the hmmptr and userptr
> code.
> 
> I believe this is also the correct behavior for userptr.

It is not, the user is still responsible for unmapping. Even if this was
the correct behavior we'd have to unmap from the GPU and update internal
PT state before calling xe_vma_destroy.

The correct behavior in this is case just let the userptr page pin fail
and invalidate GPU mappings. This recently got merge in [1].

Have a pending test for this in [2].

Matt

[1] https://patchwork.freedesktop.org/series/130935/
[2] https://patchwork.freedesktop.org/series/131211/

> This patch is experimental for CI and open to discuss
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 11a4bb9d5415..90d1163c1090 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -40,6 +40,8 @@
>  #include "xe_wa.h"
>  #include "xe_hmm.h"
>  
> +static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence);
> +
>  static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>  {
>  	return vm->gpuvm.r_obj;
> @@ -604,6 +606,9 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
>  
>  	trace_xe_vma_userptr_invalidate_complete(vma);
>  
> +	if (range->event == MMU_NOTIFY_UNMAP)
> +		xe_vma_destroy(vma, NULL);
> +
>  	return true;
>  }
>  
> @@ -901,7 +906,8 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>  			xe_vma_destroy_late(vma);
>  		}
>  	} else {
> -		xe_vma_destroy_late(vma);
> +		INIT_WORK(&vma->destroy_work, vma_destroy_work_func);
> +		queue_work(system_unbound_wq, &vma->destroy_work);
>  	}
>  }
>  
> -- 
> 2.26.3
> 
