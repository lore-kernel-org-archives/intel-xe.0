Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929DEC87FCA
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 00:31:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F5610E077;
	Fri,  8 Aug 2025 00:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XLn2hSRE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DCA810E077
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 00:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754613062; x=1786149062;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=y+eqL7eUfJHRsfGIgzahVlp1EWyZfqE0Q1EWDXGNKiA=;
 b=XLn2hSREqbgON/ivlZ63M+/ri4oR5qCea+AOc/kWmBT1PvJN4q84uXjF
 Rg0S+I7jvDbuGsF7tEkdZB1txtXs7L2nFicY3xtz6PszR3bfb4qa6XDJ4
 TaF3OqHeKicBq70E7Z1Iu/QktGx1AatBaTcPXPFXNCougmPliRlCNBdzY
 Ax823gT+PjSLiQyc8hRVWOlbV9pe5lgllj2x6RB9KXs5uK/uk2ujPIRzy
 SkTlXiLb4LD3crRmmG6a2WOZQlXJwQw26o4shbtbv/ZV4Y6iRBBeQg4Fh
 GMG2zLOnhPJZIL3cwANIUzhqzXk8/jaC9IdzLFiZhRJteQPKgm2rBXAEz g==;
X-CSE-ConnectionGUID: JsO7vKkRRuud3wOyXywlPA==
X-CSE-MsgGUID: 3YUYKPazS9W89r2zOGPJGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60588283"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="60588283"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 17:31:02 -0700
X-CSE-ConnectionGUID: mXq5fwDBQ8a0Li5PVZ0etg==
X-CSE-MsgGUID: CWuGNm4cSUWFElfvK2EsOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="196027455"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 17:31:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 17:31:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 17:31:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.45)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 7 Aug 2025 17:31:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NpoCgQ7W8SiAe1WuEV8Oio4D++BT5FeAUbkWb8Z2gWThIgpuoDXXdLt74aDgt5thE3ZwXeIj5suHfs/9LL/3i70VnmR9JtYBwFMsUcCDY8l79IVp5jrAW1eXDF5KURMsIyP0AZ1HknhmdKJibdmpDgpoNcgkkgsHhtadAIRQliL4w728QCX1MYmaXsVA/HJgBcr62MJxDEngdLJK0Us5F8qzSS22ipBb1kcJgW1wyhV8cnP5corWV0D3EGoGNSicrjnajDqbWScznfznQx0j0LXddKJZ9BB+qPjvj9PxnX79xZvIIwiKeucHda8gzMO9inxw1y6ZVVRXvocV48zHhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q8pnc0ZVLH0a1+j7dn4aD8lmY6QhNhLvUiw3WtuADZs=;
 b=rmN/VBo89vzTvleBQsK/ibLvscpid8IjLDJDj+ZuOd8Y7yxYMGZJd9uOa8LpPOzZHaPQz8Jz0wLrPtwSZAecdbhnB50Ue1Djvj4NfD/CmjXNCx4hIeVBMhn0VVMczMMCXr4S70Ust3tEaPtI+FuGDFn2HgQCZGht8FA4ojyGBVZyvK8E28oy4TTrTvEM8UqVEpLYLwrrjrDf0p/hf4yevZTDVZvK3khMT0vSq46rOotYh9StySiSpHyzoY4Zr9OXCrNX3cYilUUTag/jd9m/dR32ZgheV9QsA7rQV+RmCXX4qTs0lZOXoueh1BfKGm0pk8lc1efxf9LWR3jaGbjzxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Fri, 8 Aug
 2025 00:30:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 00:30:52 +0000
Date: Thu, 7 Aug 2025 17:30:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v6 19/26] drm/xe/svm: Consult madvise preferred location
 in prefetch
Message-ID: <aJVFOfc9lqVORNNo@lstrano-desk.jf.intel.com>
References: <20250807164338.1832254-1-himal.prasad.ghimiray@intel.com>
 <20250807164338.1832254-20-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250807164338.1832254-20-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0158.namprd03.prod.outlook.com
 (2603:10b6:303:8d::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6527:EE_
X-MS-Office365-Filtering-Correlation-Id: 212a5033-3d8e-4773-c9ac-08ddd612d4a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FXdz4txkl7aM9PizWX7BuTqK9H827j4do4zpKXKn1tzC4yapi3qaDmbwsPsv?=
 =?us-ascii?Q?8IEKLg1mCLdT5voIjjkOB80tOueTQEV8fJEHLNgbvgFqI9uf/vOf5clkccnX?=
 =?us-ascii?Q?POg1XpHZ3ppzO+A68ei6w+2+KjoTBHbkYuXvFhAQHJooB1Zlt0nhlls4GXEx?=
 =?us-ascii?Q?yn10Oer+kniVPsdMhWW0zCv0/CTHI7E4dIrE46fEdKudAT3nBIOTOgfOGGOZ?=
 =?us-ascii?Q?fPeM0N/wmlZ2h+mOrnoadF6hE4R3L1AhfuqJ+F6rNRJvNviDO7pvU0/YW0x7?=
 =?us-ascii?Q?+JEHAVKRAa00yIt0KBKVb3K2QEJHWuE31klTqr9sx8rj2xBt+HQkPKnr68f0?=
 =?us-ascii?Q?FjATLUBuiDviQ0uL7dIiltlFewZyWOAx/d5Vm5BZ7ccj5DYj6Bn9WayC3nB0?=
 =?us-ascii?Q?asERBNk/GgXqtph48BP5+YYvak7Adx5iQgmnYhX0TIvcZriISedp0ywDXwG5?=
 =?us-ascii?Q?eExt+fejPPKCanjQPyVDf9q4bR5FD04YQaLgr17XV9LLECkZdfmcGElkIS27?=
 =?us-ascii?Q?KM3aDLnl1gRTv/N/5Bh0j8DNxLpfNAotCM8/n4cB5Km1jZI3zquDhaw5y9Be?=
 =?us-ascii?Q?S3w/rvkEBG6wP0PLk8y80mdTRHmYzdNVHQKVd20hFg/VPcO/RevppCVupI/E?=
 =?us-ascii?Q?F079SNnah4fcR8q0h7eVU+KCyBwD5ncHK2IWHWvrA5J0ZYVaof8tLzzauKDG?=
 =?us-ascii?Q?2XukW+xciDZoCqziNRO3lz8MtNAU6jq5jmqpbWh9bP5F9r3NG1nC7q9oY5zI?=
 =?us-ascii?Q?9lW7MXT8mbvx7qoif6DXWzczwAdPx6SzrJKLuafnKmfPhdUGfZiEc9KsBxdK?=
 =?us-ascii?Q?JaPEWHJntOCV61EvgAkIegwUMqHbLtXmuQqi3xUFBrsyY6G4MUPoAuPWotTO?=
 =?us-ascii?Q?k1rAlkYTIotI/ZmXpj+EwJkX9El6YJsy+PyMDRSTW/DD3HjAu0N/3XIA++KR?=
 =?us-ascii?Q?/wwgKUKJ0Vo+M0KiZENu9EdH+vrNuBQByE4tZn7ERl6fjQ0FmeNaICfOfljs?=
 =?us-ascii?Q?GCf2qje8z/k2F2tmx2wM54DTRt7EOEpaVRcOdAACzUqcnVamrDi9dvjuUP/P?=
 =?us-ascii?Q?PoSHYTOnFESur15PbD65mFGAedzfBKFELG+1OS2d6YoxtzdyZPJxaW890yAE?=
 =?us-ascii?Q?pgzKmb+WdsY53vqyzaOQnzM37eZicSg00noiCSvWVKL4FzPe1X3qRcza5IL0?=
 =?us-ascii?Q?tKycH8+RJefcFx/aK7ooOh8u4wqn8QAa4zjPO+pf15v+J3yMfCdn4HxNev0A?=
 =?us-ascii?Q?rupwabqDLrtyjtbQ8qsf4+8Lujn+RPOK91ixSyuHy7EbqdPDV9sTiyXIUt8l?=
 =?us-ascii?Q?GNA4Sll5GLvraPbSW4deYHlIjtO2ipSPvbvk2ib14ocCviSpcdz5LTkgalQz?=
 =?us-ascii?Q?OroC2drCuZrqd0K+f4954Czrst7Q3/6/Kq8PGyaJ4PxnQ4TXjqOQ49W1f596?=
 =?us-ascii?Q?+r66vE3dGcU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IfvgZhcudXwyxi6sQZ4ySsZfXTtr3TRqsNIC7D+4AkEGfMuKUUTkvWz4Koyu?=
 =?us-ascii?Q?aOsyYcLpkXER4Dke59fnq2fmbkIN35wgyNXlrD2ZgcwX7jgcZuMpTOeC0o6P?=
 =?us-ascii?Q?Br9KXBVG3XzA3bC8AXE+DMhlMXshK4Fu/EWRo9URRQys1VcRtr5yZkfy+Li/?=
 =?us-ascii?Q?tmo3lskCj2yqJH6aJZnmaQ7xscqk6jRCd6pylnXi2qoAX1+Vd7NBvhfli+jH?=
 =?us-ascii?Q?zqV18sQV4ufx761izMp3dQkmhE8ig0yOMt4VCp7zYtx2zv8vHkeWPeWywfoy?=
 =?us-ascii?Q?b9HnMxqdsQ4NcCWV0Mx3Xk8kiXiWrnKZfkYyLaAKUM/uSr8mAd7C5DzmT4sM?=
 =?us-ascii?Q?rlJ/vfwunCTbT7RYe6UssBw2gSNMtZnKMCsY2HDow+yV4QG8H9NMDAeG2vZR?=
 =?us-ascii?Q?0UUJvoAmu6YrHEU5gbhiRNa0yb4OIwmXgqCwrnGfgKJo0091JLoBVlAaIbx2?=
 =?us-ascii?Q?nIUuoVuBXpWVXB8hkrko+8+myz/53d+lbWttOV8pBHXf/1G/mr0KdKsJloTm?=
 =?us-ascii?Q?Xm92o0cRuADuwO4BMMccjh21iuQ2HyF11a2bfklBbfEM1oKbakVU2GfYAwoY?=
 =?us-ascii?Q?304o7guKzPgyEs5sZknhPvrN5wz7klpWYqWXjfmMsu0id7YzFEHswsZuaBTM?=
 =?us-ascii?Q?MZeS1OvESHcn0/JtwXMjmY4Z0odaz5tK4J1Z3y3lddcgw0dGC/fZnNBx6vrj?=
 =?us-ascii?Q?wYl+nbbfZDviIMzQ+wYTFexeAUOvawBS8aC3saMrce0YjcBDVOEE6P8VMqW8?=
 =?us-ascii?Q?t5CEe0nhHtoFf6z6CDGpM08/SERgxzAr85L3tQZOGFl5pp08B5zAJCTUVBSX?=
 =?us-ascii?Q?E2IjuDwSCig/HJa0YvGSrRUcOIY/9s5+LeVncx52b3iUwFmGD12uNG6G5X/4?=
 =?us-ascii?Q?ph22v3X1Wu/DEqzIojpgwWu/9RkIAwZTq6pLlos9v1mfVVCiO7jA+j4c4w5N?=
 =?us-ascii?Q?KySdtTyJuBcQU5D/m4W7lhSZ3gY1WD9DgtlohXctTwT3a0DwTbX6GCiHBYOQ?=
 =?us-ascii?Q?o5l6pjfvwn99Z3w+3ycg6CHDKx+ZvMVkTUUj9epRu6lYwV8epN/y3N45lcXH?=
 =?us-ascii?Q?tQf4gV9Lvmg59N0AGp4ujCeFZni5WwHOBpiPI4Z59aEJbaAHiGL/CTMCNJIG?=
 =?us-ascii?Q?Dg3PsjDj73F4/B42Ig+QsrzeMTpmruBoJv6KJLGjE1dnPj1mo4aNhTkdCna8?=
 =?us-ascii?Q?RVRQwGecvHjyxVciizCFBlyKapWYu5dckyt9VS7BGxBSumysISEkX1jcNk/Q?=
 =?us-ascii?Q?Y5zGRZNIpAv0G+Y6NnyAlRiZc9LoQv2vEirhvyipTdQGYdhMKiezAAjd1Alv?=
 =?us-ascii?Q?JKh4YQGELpBcQKhVnen82XVFzhc50ZU90zDFG0aOgFRi2W+u/8uI0Nf/DEGp?=
 =?us-ascii?Q?Gbyf2Hy1ZauKUSSWH6s6atjy8WTswzQDZMzhYiyLQro7o7BqIsym/Pmco2UU?=
 =?us-ascii?Q?dyPIqioJuvamzGI3S8xz/OLzzDMCb5qkkJTmPu4+/S4vO+Xw+aCTwIfcg12H?=
 =?us-ascii?Q?jJW3PwVssF3AxGwwAdNT1oYT9LSN7ARTAYAp5KWGHXtj/7dTiNYPl4IJ5UqT?=
 =?us-ascii?Q?0IqTq80DZpBj+DpH1kYcJV20/nQZ7WjqnnJ/PekTUIVrnzSYcsWX5n/s2tPU?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 212a5033-3d8e-4773-c9ac-08ddd612d4a2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 00:30:52.3774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k0QrB8CqkXT89PP53ra0MOng1Sm7zjlBqTuJS8snJuet2+zrWdkjkLjuiRNhlL9opQbVvZU5mpE7U4Wrv5kjdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6527
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

On Thu, Aug 07, 2025 at 10:13:31PM +0530, Himal Prasad Ghimiray wrote:
> When prefetch region is DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, prefetch svm
> ranges to preferred location provided by madvise.
> 
> v2 (Matthew Brost)
> - Fix region, devmem_fd usages
> - consult madvise is applicable for other vma's too.
> 
> v3
> - Fix atomic handling
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 30 ++++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index aa8d4c4fe0f0..ae966755255d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -38,6 +38,7 @@
>  #include "xe_res_cursor.h"
>  #include "xe_svm.h"
>  #include "xe_sync.h"
> +#include "xe_tile.h"
>  #include "xe_trace_bo.h"
>  #include "xe_wa.h"
>  #include "xe_hmm.h"
> @@ -2913,15 +2914,28 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>  	int err = 0;
>  
>  	struct xe_svm_range *svm_range;
> +	struct drm_pagemap *dpagemap;
>  	struct drm_gpusvm_ctx ctx = {};
> -	struct xe_tile *tile;
> +	struct xe_tile *tile = NULL;
>  	unsigned long i;
>  	u32 region;
>  
>  	if (!xe_vma_is_cpu_addr_mirror(vma))
>  		return 0;
>  
> -	region = op->prefetch_range.region;
> +	if (op->prefetch_range.region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) {
> +		dpagemap = xe_vma_resolve_pagemap(vma, xe_device_get_root_tile(vm->xe));
> +		/*
> +		 * TODO: Once multigpu support is enabled will need
> +		 * something to dereference tile from dpagemap.
> +		 */
> +		if (dpagemap)
> +			tile = xe_device_get_root_tile(vm->xe);
> +	} else {
> +		region = op->prefetch_range.region;
> +		if (region)
> +			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
> +	}

You need similar logic in vm_bind_ioctl_ops_create ahead of
xe_svm_range_validate.

Maybe pull this out into a helper for do this calculation there and
stick the result in the op which could be used here.

Matt

>  
>  	ctx.read_only = xe_vma_read_only(vma);
>  	ctx.devmem_possible = devmem_possible;
> @@ -2929,11 +2943,10 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>  
>  	/* TODO: Threading the migration */
>  	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> -		if (!region)
> +		if (!tile)
>  			xe_svm_range_migrate_to_smem(vm, svm_range);
>  
> -		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
> -			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
> +		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, !!tile)) {
>  			err = xe_svm_alloc_vram(tile, svm_range, &ctx);
>  			if (err) {
>  				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
> @@ -3001,7 +3014,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  		else
>  			region = op->prefetch.region;
>  
> -		xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
> +		xe_assert(vm->xe, region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC ||
> +			  region <= ARRAY_SIZE(region_to_mem_type));
>  
>  		err = vma_lock_and_validate(exec,
>  					    gpuva_to_vma(op->base.prefetch.va),
> @@ -3419,8 +3433,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>  				 op == DRM_XE_VM_BIND_OP_PREFETCH) ||
>  		    XE_IOCTL_DBG(xe, prefetch_region &&
>  				 op != DRM_XE_VM_BIND_OP_PREFETCH) ||
> -		    XE_IOCTL_DBG(xe, !(BIT(prefetch_region) &
> -				       xe->info.mem_region_mask)) ||
> +		    XE_IOCTL_DBG(xe,  (prefetch_region != DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
> +				       !(BIT(prefetch_region) & xe->info.mem_region_mask))) ||
>  		    XE_IOCTL_DBG(xe, obj &&
>  				 op == DRM_XE_VM_BIND_OP_UNMAP)) {
>  			err = -EINVAL;
> -- 
> 2.34.1
> 
