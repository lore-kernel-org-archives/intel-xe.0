Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FF4C83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 04:11:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E17110E0F7;
	Fri, 18 Jul 2025 04:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YtBreAe7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677AC10E0F7
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 04:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752811869; x=1784347869;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0diAThrYWbwj6AE8FrtQ2fqW4BvcPrbtZ12XELlimrE=;
 b=YtBreAe73b1OLPFuU5jJahCDMJam/x+AVg0kImWHJbG2SjpRNuFucwdm
 OL42ukqMQ1d5ly1APXE6AsBzbL1N/XJKND8EjKhfDzpG8aQsKCeDaQNou
 8MUhGKOrDtAkdztTXWw3hsoTHjZUfkUrDbOK07cgKjBabQD7A47BTry0N
 irbVpAddU4etG+iV50pDjvXTfh6pOujHgDsQedGNCjpKbwBpr2EkHf0SE
 /7R8JNe7jnaibjERg0vQVZSxNY9nGi55uzxjVgULL0XtJjQAQhiDIJHcB
 O7poKBVeJxombAyvse91BpCSR40gly5cNherw2hqvUDDlNZflJcpaLhGD A==;
X-CSE-ConnectionGUID: PCIMnju2Q12xmIFoKZlrhQ==
X-CSE-MsgGUID: 6Wbx0dl5SUWBc7WlSeFMfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="77639057"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; d="scan'208";a="77639057"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 21:11:09 -0700
X-CSE-ConnectionGUID: ho6+WIm7T/W0dTpUVcQzKg==
X-CSE-MsgGUID: K0tQEuC/TVKSpp22eLtd5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; d="scan'208";a="158314437"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 21:11:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 21:11:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 17 Jul 2025 21:11:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.77)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 17 Jul 2025 21:11:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bm41PoaxRjs634u9yiiaWTt9IDDxJtfxajEuX4xxXwukO1FRubCuhY6zFKMAzMclk8k7bZPnd0SHA3MotUqEmBnV1+X2O68BkhLA1kLSttkS28GWe0J40LuGdHt9noRxB1PZ6HXgJUrxlpA+EWgUUejXSxjlGarE42HuPE/FhiN5KUpvvX8KcPLYpTb50TlmfgJSqY44JB0zY2WmxvQCLBWWD6pcWrKX0pJH1tPOvx2yN748zK5pEx1tPujnIa1bPMAsnqvJjEjheOZDEq+60tApDMrw0GDX+hmEW5FWsemnrcBk0g+GeuC2yn458gvvrZgLqVvrtoxUTemWeczFsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/i6esJyViqMIJVCZ63AIymtacFiUEm6BEqFR/3fBrh4=;
 b=W+2rHZcF+wk7fta0OXVlozNtTgPIah4Mem798zF8RoCD+raxj4CETPrsjGCayZAKVasv4WsO+zRuiF/KzaUlsyCn7r3yujrTVQoz9wYV/citibGGHGUNAc2HvKySwc548KFEf5a9n3Vqry7nO32lJw5VC1NQSTq73VopHeoHgtH6402jcFfjubOJGYqq/mhUU0gxGo8ICJZlGAc1yPHnV1pLCgntCpACbPXk8WH3x/X3lSUBI9BZsLdeYT1xvqB0WnGUHa49RAoJs7haOs7HxsOwlUnDooGKb6Kne5VlSrT8UvjHwDKt8IrGS87NUOqkFEPowYNpy/d9yv80rvsrBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS4PPF2B323C540.namprd11.prod.outlook.com (2603:10b6:f:fc02::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 04:11:06 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8880.021; Fri, 18 Jul 2025
 04:11:06 +0000
Date: Thu, 17 Jul 2025 21:12:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1 2/5] drm/xe/svm: Use struct drm_pagemap_device_addr
Message-ID: <aHnJxBNI1zCj9p4w@lstrano-desk.jf.intel.com>
References: <20250717133928.526111-1-francois.dugast@intel.com>
 <20250717133928.526111-3-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250717133928.526111-3-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR05CA0187.namprd05.prod.outlook.com
 (2603:10b6:a03:330::12) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS4PPF2B323C540:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ec42e9c-297b-4739-367e-08ddc5b11e0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Qh2e+NauXQfV8RgQ4pgZCzeoTgPzt7Kx5qi/4v257bcgnqrPkNQ8LLbdIhYB?=
 =?us-ascii?Q?AxXH18loyU4NZm4SGDbMlqJCBoXyubat56mn4oa1nymgn5KkhRy0RiX1Asyn?=
 =?us-ascii?Q?2dZzN4ypzHgoJCErnLF+5TyhbwQOn53jFt2vCkdd+sU0ZBAhfRyTK8oKRyoa?=
 =?us-ascii?Q?Hb4cDOoxfd9/zivT7s9EzJ6GFPcxOrX/Vb71WJLCWEe5CsgaOm5ip2n6UdfU?=
 =?us-ascii?Q?6crORd3LHsPc3x/+LE8WMA3t4413IiEc0mB8RQnrVNWfXpy/c7CdLU1HQqXa?=
 =?us-ascii?Q?TXUYVIUFdhkBiBRIfeE5SFo7FLsKboO0zNmrX/vp3DEX53bO7rEGwY84KTPj?=
 =?us-ascii?Q?1MvPj0Fy/RHvZTEqw2oHaoD1fH7ldJHYqe40FlyUMvovYJPcgFEap7CSp6FX?=
 =?us-ascii?Q?mEZYbYqwUmsdXF1rgc7rcAW4Te0G1DiaRNbpu/2p+NY5FQ49fsfFxweYU6YZ?=
 =?us-ascii?Q?+dKwp9DOU4N6btn/axL30qx+6EmA7+BbIKnOyoMRP1+vMNSkOmTXLThrlA7t?=
 =?us-ascii?Q?cm8HrPf5g3mVktKUQdjS+wD6q+sZvxonzoV38+/lshkU/IfljUvZEGEeckqx?=
 =?us-ascii?Q?kkoxvdH5Ssgkm7gOcRDwrwJm+7ymK9O4a70JbZtdg8/42iILDKmGCnBbC2Yz?=
 =?us-ascii?Q?zlmkJhzwCaru6P6xJ72c9A50zr6aXc7We1BBHdD74Sbg3GK77u8Cqg0huLMU?=
 =?us-ascii?Q?y+8evz1M2d9Jdv7XpISgYeTGHt56AR4ASm2UveZxZX7Xi2T+64bgPtW/aFmk?=
 =?us-ascii?Q?N/37wGJHBTsYP83+Bbu7itLseKMf8PspIemDPn1VNAQHgD18rPWfthNDBDZj?=
 =?us-ascii?Q?q7jMyOioTwY+UcDwV4ao4OLAM3XsNzoJOHMJOJ0hxDG6OXqjT1P48i86+0cu?=
 =?us-ascii?Q?y5tvrdP19CjeXvLRFlmKvt7VD3X87ymkFATLAq/X/xlDmM9MmEdjDn08ZhRC?=
 =?us-ascii?Q?ppd/l3eCUKwPOWjozar9SQszMDb4F/HYpdzo0YYhNgbncFewM5h4IPAt3y9U?=
 =?us-ascii?Q?paDtxYxuAZNaVRPvynWRM2M2h0gvmDJIb/BezVPC3ZyAuYDDLCOzRCMzo2pH?=
 =?us-ascii?Q?+GQhTrMSEfjRPWHd6/LY0FBC3T2nt6ZtqRRJk28OoxzEJrqGiKSgKM/6Yzxj?=
 =?us-ascii?Q?dFGYiDlUULyDCBmkKQTs5o61nemYTdpa4on0hE9c3TTPxxziImITMBJMEeoj?=
 =?us-ascii?Q?76CdiQe7cshPMvuNCeAN+AvOsjKlnTdEcn5seFjxn9sXXr5WWqfsp4SQAEpE?=
 =?us-ascii?Q?97Rr+hGDuSjCAwBV7dY3STsJOoTt+OoOSTz046oGtUaQg2eAtlBmOrItrTpj?=
 =?us-ascii?Q?voPkQWUiFEA+N7qksQ7uj2JheRIv72XmvRz03CvGcZx4S/SVMH5muiS3GpR+?=
 =?us-ascii?Q?C3iEnYiDiDVxRCu5/WcllRH/Oeo71k2BnRM2DPvnLvLjveM3GRmQAkpzb5zw?=
 =?us-ascii?Q?DVcaY5mn5OQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SZfsVtdvmsT05ULSfrVEF/uxJjABMWeFzJUO19FmTp6OU06X0q0ttB2oDWf3?=
 =?us-ascii?Q?24AcJNOsgtSf7ZU55uYB1OHp0YeGtxaCUixGW2xTwHqp2fkb2JMQ9hY/DDZA?=
 =?us-ascii?Q?cTrqYJelgUTjmsp2dYxL9u6Yd2TL5IS8b+D0dA2StunZTkSmxSQenH2SiiTw?=
 =?us-ascii?Q?PtG28pJjoECVBenQCDqfyUkzrWltD3ZwyxZflnT1rZdYhOo/fb1lOoITOfUY?=
 =?us-ascii?Q?ylMQLA0nnf7a7q6CW2cybNfNgbdDJHGkdV7UPhCrZ6WsVCYkSKkQAFv3OA5y?=
 =?us-ascii?Q?RBYGQG682UxOTCTTk67UAib+e2BrBalzHh8wqlXmkUht3tDBgx/SBlZK6XGg?=
 =?us-ascii?Q?lnfJJgIv4/4BYNWGO4+sHqynVBHH76I85JRln7X3xnTyxL8ZKk4D03eBpG6c?=
 =?us-ascii?Q?t2LFMbNAPoOVf9uPqVuawdKcWgobkjdPKpNpw1yDj82vd1YbXHqHxM9mDLrY?=
 =?us-ascii?Q?FlRmXn8Q516T2rlX8zleexN59hW08mCVVTyXDKXq8qXixXYQYy+5W6ts2DrT?=
 =?us-ascii?Q?yeYZS5Y3LsWW6mU9s6zkK4bMvBzODNT8FnSdd2hQ8sAZvyTrib5sljxnNfen?=
 =?us-ascii?Q?hCL5U62DxGIDKSzdTylrfKrqJdVfKo3TcTU+5hNKeoiRNh5ZiJ8NRN61KgPD?=
 =?us-ascii?Q?4a3DV+pW4FFONo2ndNHXgFiWGBSb/vZLzDd+dCUFJ7Z4QgnwQz2CFyhD2ked?=
 =?us-ascii?Q?640T5THTA3dYxvKWGo8XW64k1Q1i/XuuDWAYqXOD9u8YG3qHcKM6wUMsW8bT?=
 =?us-ascii?Q?Y1MtEfHO99w+Dtfc0zOlW3anqHjkhRkAEojehRkZ4LevF2vFj8YrmPy/cB0G?=
 =?us-ascii?Q?wmIfDQkc49lZ26XgKDXuie8MwCn2HLVPdldPWMbF62G1QMRWaKmh/ebA8jmK?=
 =?us-ascii?Q?N6MReBgvsAkJtS8Gxs4R7fBycy5Jut/8N5O/+QmX+1MOvxr+uqaSIigfGA6x?=
 =?us-ascii?Q?DUVY9LpxdsAZVhlfvXQmNhnBjejFEDD+mlHSCJWjruLgZm6kmLQWbCao2n2l?=
 =?us-ascii?Q?fr2Okhmyqz7kEdsTLpbJdEFHBFdfnS1BWEoWMT/2/Mf5Oh8bkEOdPyJsq00M?=
 =?us-ascii?Q?uFHlzdyqq+dvUIk9SYTxvhubYnjPFwzhe8eKjsArCCM34G424Jb+aJPyp79p?=
 =?us-ascii?Q?DOt2KEjGOjdAv96T8xtXte29wC8nTDq3mYvU1Qpd1asuvmy5ePpWJO84sY6h?=
 =?us-ascii?Q?FE6xLgLjjt+/6T6VNnn9PhNA1Hk6kPMB5/zCI7M84TMf0OQetPTykxMmwPIj?=
 =?us-ascii?Q?gv3VoHuzoBgj0IBOgoL3VN0+NWHB4FRe76n74S5CY+DFxmA184mWeWzs6ytz?=
 =?us-ascii?Q?3yCHhgoUqRfG+LQAfrhaPur35j5sIRjVw1X7gfBMXnuNqpPifePLZyykFzLC?=
 =?us-ascii?Q?5Qrv11QpjsNW5XHtB5+iWnewx2f/hPu6KyuasjaQDd2XGL1fOjRVlr/vJYEM?=
 =?us-ascii?Q?gQIsc40EAkGYaadZnmBCjkNsBkdg5F68u18n/uQbOOiVPp40667/et9PEEqw?=
 =?us-ascii?Q?hhdF/uJLZY6S2/JCDpvykjD4m2kzK9tdYgbZZv/xmT5OLc+xf8fFEPvJRjA9?=
 =?us-ascii?Q?VrwdT5CwOfeqjyCUrF0y39oiMj7RG9BYgOlW3uY3sJjYoqDgpZsLJ7+YVOfc?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec42e9c-297b-4739-367e-08ddc5b11e0b
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 04:11:06.2731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sjf/P2ht4pIF6WEyQsy/wd6mfqTSRC8Urbv2gptD7aQLN2s9v8YkaLC2VTrHzSC5DVdw9ORAjBaqhzCuYDDt9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2B323C540
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

On Thu, Jul 17, 2025 at 03:38:24PM +0200, Francois Dugast wrote:
> Adapt to the new drm_gpusvm_devmem_ops type signatures using struct
> drm_pagemap_device_addr, as well as the internal xe SVM functions
> implementing those operations.
> 
> Besides, the use of drm_gpusvm_dma_info is propagated to xe_migrate
> because it makes indexed accesses to the next DMA address but they
> are no longer contiguous.
> 
> There is no functional change.
> 

Again, combine this previous patch.

Same comment about device_addr vs. pagemap_addr as previous patch.

> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 55 ++++++++++++++++++---------------
>  drivers/gpu/drm/xe/xe_migrate.h |  5 +--
>  drivers/gpu/drm/xe/xe_svm.c     | 37 ++++++++++++----------
>  3 files changed, 54 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 6a80ae6104dd..33d67993f1f6 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -9,6 +9,7 @@
>  #include <linux/sizes.h>
>  
>  #include <drm/drm_managed.h>
> +#include <drm/drm_pagemap.h>
>  #include <drm/ttm/ttm_tt.h>
>  #include <uapi/drm/xe_drm.h>
>  
> @@ -1585,7 +1586,8 @@ static u32 pte_update_cmd_size(u64 size)
>  
>  static void build_pt_update_batch_sram(struct xe_migrate *m,
>  				       struct xe_bb *bb, u32 pt_offset,
> -				       dma_addr_t *sram_addr, u32 size)
> +				       struct drm_pagemap_device_addr *sram_addr,
> +				       u32 size)
>  {
>  	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
>  	u32 ptes;
> @@ -1603,7 +1605,7 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
>  		ptes -= chunk;
>
>  		while (chunk--) {
> -			u64 addr = sram_addr[i++] & PAGE_MASK;
> +			u64 addr = sram_addr[i++].addr & PAGE_MASK;
>  

xe_assert(xe, sram_addr[i].proto == DRM_INTERCONNECT_SYSTEM);

Obviously, don't do this after incrementing 'i' but you get the idea -
assert address is using the dma map protocol. 

>  			xe_tile_assert(m->tile, addr);
>  			addr = m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
> @@ -1626,7 +1628,8 @@ enum xe_migrate_copy_dir {
>  static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>  					 unsigned long len,
>  					 unsigned long sram_offset,
> -					 dma_addr_t *sram_addr, u64 vram_addr,
> +					 struct drm_pagemap_device_addr *sram_addr,
> +					 u64 vram_addr,
>  					 const enum xe_migrate_copy_dir dir)
>  {
>  	struct xe_gt *gt = m->tile->primary_gt;
> @@ -1708,7 +1711,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>   * xe_migrate_to_vram() - Migrate to VRAM
>   * @m: The migration context.
>   * @npages: Number of pages to migrate.
> - * @src_addr: Array of dma addresses (source of migrate)
> + * @src_addr: Array of DMA information (source of migrate)
>   * @dst_addr: Device physical address of VRAM (destination of migrate)
>   *
>   * Copy from an array dma addresses to a VRAM device physical address
> @@ -1718,7 +1721,7 @@ static struct dma_fence *xe_migrate_vram(struct xe_migrate *m,
>   */
>  struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
>  				     unsigned long npages,
> -				     dma_addr_t *src_addr,
> +				     struct drm_pagemap_device_addr *src_addr,
>  				     u64 dst_addr)
>  {
>  	return xe_migrate_vram(m, npages * PAGE_SIZE, 0, src_addr, dst_addr,
> @@ -1730,7 +1733,7 @@ struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
>   * @m: The migration context.
>   * @npages: Number of pages to migrate.
>   * @src_addr: Device physical address of VRAM (source of migrate)
> - * @dst_addr: Array of dma addresses (destination of migrate)
> + * @dst_addr: Array of DMA information (destination of migrate)
>   *
>   * Copy from a VRAM device physical address to an array dma addresses
>   *
> @@ -1740,35 +1743,37 @@ struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
>  struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
>  				       unsigned long npages,
>  				       u64 src_addr,
> -				       dma_addr_t *dst_addr)
> +				       struct drm_pagemap_device_addr *dst_addr)
>  {
>  	return xe_migrate_vram(m, npages * PAGE_SIZE, 0, dst_addr, src_addr,
>  			       XE_MIGRATE_COPY_TO_SRAM);
>  }
>  
> -static void xe_migrate_dma_unmap(struct xe_device *xe, dma_addr_t *dma_addr,
> +static void xe_migrate_dma_unmap(struct xe_device *xe,
> +				 struct drm_pagemap_device_addr *device_addr,
>  				 int len, int write)
>  {
>  	unsigned long i, npages = DIV_ROUND_UP(len, PAGE_SIZE);
>  
>  	for (i = 0; i < npages; ++i) {
> -		if (!dma_addr[i])
> +		if (!device_addr[i].addr)
>  			break;
>  
> -		dma_unmap_page(xe->drm.dev, dma_addr[i], PAGE_SIZE,
> +		dma_unmap_page(xe->drm.dev, device_addr[i].addr, PAGE_SIZE,
>  			       write ? DMA_TO_DEVICE : DMA_FROM_DEVICE);
>  	}
> -	kfree(dma_addr);
> +	kfree(device_addr);
>  }
>  
> -static dma_addr_t *xe_migrate_dma_map(struct xe_device *xe,
> -				      void *buf, int len, int write)
> +static struct drm_pagemap_device_addr *xe_migrate_dma_map(struct xe_device *xe,
> +							  void *buf, int len,
> +							  int write)
>  {
> -	dma_addr_t *dma_addr;
> +	struct drm_pagemap_device_addr *device_addr;
>  	unsigned long i, npages = DIV_ROUND_UP(len, PAGE_SIZE);
>  
> -	dma_addr = kcalloc(npages, sizeof(*dma_addr), GFP_KERNEL);
> -	if (!dma_addr)
> +	device_addr = kcalloc(npages, sizeof(*device_addr), GFP_KERNEL);
> +	if (!device_addr)
>  		return ERR_PTR(-ENOMEM);
>  
>  	for (i = 0; i < npages; ++i) {
> @@ -1787,14 +1792,14 @@ static dma_addr_t *xe_migrate_dma_map(struct xe_device *xe,
>  		if (dma_mapping_error(xe->drm.dev, addr))
>  			goto err_fault;
>  
> -		dma_addr[i] = addr;
> +		device_addr[i].addr = addr;

Set proto, dir for clarity and completeness.

Matt

>  		buf += PAGE_SIZE;
>  	}
>  
> -	return dma_addr;
> +	return device_addr;
>  
>  err_fault:
> -	xe_migrate_dma_unmap(xe, dma_addr, len, write);
> +	xe_migrate_dma_unmap(xe, device_addr, len, write);
>  	return ERR_PTR(-EFAULT);
>  }
>  
> @@ -1823,7 +1828,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_res_cursor cursor;
>  	struct dma_fence *fence = NULL;
> -	dma_addr_t *dma_addr;
> +	struct drm_pagemap_device_addr *device_addr;
>  	unsigned long page_offset = (unsigned long)buf & ~PAGE_MASK;
>  	int bytes_left = len, current_page = 0;
>  	void *orig_buf = buf;
> @@ -1878,9 +1883,9 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  		return 0;
>  	}
>  
> -	dma_addr = xe_migrate_dma_map(xe, buf, len + page_offset, write);
> -	if (IS_ERR(dma_addr))
> -		return PTR_ERR(dma_addr);
> +	device_addr = xe_migrate_dma_map(xe, buf, len + page_offset, write);
> +	if (IS_ERR(device_addr))
> +		return PTR_ERR(device_addr);
>  
>  	xe_res_first(bo->ttm.resource, offset, xe_bo_size(bo) - offset, &cursor);
>  
> @@ -1901,7 +1906,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  
>  		__fence = xe_migrate_vram(m, current_bytes,
>  					  (unsigned long)buf & ~PAGE_MASK,
> -					  dma_addr + current_page,
> +					  &device_addr[current_page],
>  					  vram_addr, write ?
>  					  XE_MIGRATE_COPY_TO_VRAM :
>  					  XE_MIGRATE_COPY_TO_SRAM);
> @@ -1925,7 +1930,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  	dma_fence_put(fence);
>  
>  out_err:
> -	xe_migrate_dma_unmap(xe, dma_addr, len + page_offset, write);
> +	xe_migrate_dma_unmap(xe, device_addr, len + page_offset, write);
>  	return IS_ERR(fence) ? PTR_ERR(fence) : 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 74c60f55004a..f8bff3f2904a 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -9,6 +9,7 @@
>  #include <linux/types.h>
>  
>  struct dma_fence;
> +struct drm_pagemap_device_addr;
>  struct iosys_map;
>  struct ttm_resource;
>  
> @@ -98,13 +99,13 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile);
>  
>  struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
>  				     unsigned long npages,
> -				     dma_addr_t *src_addr,
> +				     struct drm_pagemap_device_addr *src_addr,
>  				     u64 dst_addr);
>  
>  struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
>  				       unsigned long npages,
>  				       u64 src_addr,
> -				       dma_addr_t *dst_addr);
> +				       struct drm_pagemap_device_addr *dst_addr);
>  
>  struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  				  struct xe_bo *src_bo,
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 10c8a1bcb86e..80dfb96d5ca4 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -328,7 +328,8 @@ enum xe_svm_copy_dir {
>  	XE_SVM_COPY_TO_SRAM,
>  };
>  
> -static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
> +static int xe_svm_copy(struct page **pages,
> +		       struct drm_pagemap_device_addr *device_addr,
>  		       unsigned long npages, const enum xe_svm_copy_dir dir)
>  {
>  	struct xe_vram_region *vr = NULL;
> @@ -360,7 +361,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
>  		last = (i + 1) == npages;
>  
>  		/* No CPU page and no device pages queue'd to copy */
> -		if (!dma_addr[i] && vram_addr == XE_VRAM_ADDR_INVALID)
> +		if (!device_addr[i].addr && vram_addr == XE_VRAM_ADDR_INVALID)
>  			continue;
>  
>  		if (!vr && spage) {
> @@ -374,7 +375,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
>  		 * first device page, check if physical contiguous on subsequent
>  		 * device pages.
>  		 */
> -		if (dma_addr[i] && spage) {
> +		if (device_addr[i].addr && spage) {
>  			__vram_addr = xe_vram_region_page_to_dpa(vr, spage);
>  			if (vram_addr == XE_VRAM_ADDR_INVALID) {
>  				vram_addr = __vram_addr;
> @@ -399,18 +400,20 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
>  				if (sram) {
>  					vm_dbg(&xe->drm,
>  					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld",
> -					       vram_addr, (u64)dma_addr[pos], i - pos + incr);
> +					       vram_addr,
> +					       (u64)device_addr[pos].addr, i - pos + incr);
>  					__fence = xe_migrate_from_vram(vr->migrate,
>  								       i - pos + incr,
>  								       vram_addr,
> -								       dma_addr + pos);
> +								       &device_addr[pos]);
>  				} else {
>  					vm_dbg(&xe->drm,
>  					       "COPY TO VRAM - 0x%016llx -> 0x%016llx, NPAGES=%ld",
> -					       (u64)dma_addr[pos], vram_addr, i - pos + incr);
> +					       (u64)device_addr[pos].addr, vram_addr,
> +					       i - pos + incr);
>  					__fence = xe_migrate_to_vram(vr->migrate,
>  								     i - pos + incr,
> -								     dma_addr + pos,
> +								     &device_addr[pos],
>  								     vram_addr);
>  				}
>  				if (IS_ERR(__fence)) {
> @@ -423,7 +426,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
>  			}
>  
>  			/* Setup physical address of next device page */
> -			if (dma_addr[i] && spage) {
> +			if (device_addr[i].addr && spage) {
>  				vram_addr = __vram_addr;
>  				pos = i;
>  			} else {
> @@ -435,16 +438,16 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
>  				if (sram) {
>  					vm_dbg(&xe->drm,
>  					       "COPY TO SRAM - 0x%016llx -> 0x%016llx, NPAGES=%d",
> -					       vram_addr, (u64)dma_addr[pos], 1);
> +					       vram_addr, (u64)device_addr[pos].addr, 1);
>  					__fence = xe_migrate_from_vram(vr->migrate, 1,
>  								       vram_addr,
> -								       dma_addr + pos);
> +								       &device_addr[pos]);
>  				} else {
>  					vm_dbg(&xe->drm,
>  					       "COPY TO VRAM - 0x%016llx -> 0x%016llx, NPAGES=%d",
> -					       (u64)dma_addr[pos], vram_addr, 1);
> +					       (u64)device_addr[pos].addr, vram_addr, 1);
>  					__fence = xe_migrate_to_vram(vr->migrate, 1,
> -								     dma_addr + pos,
> +								     &device_addr[pos],
>  								     vram_addr);
>  				}
>  				if (IS_ERR(__fence)) {
> @@ -470,16 +473,18 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
>  #undef XE_VRAM_ADDR_INVALID
>  }
>  
> -static int xe_svm_copy_to_devmem(struct page **pages, dma_addr_t *dma_addr,
> +static int xe_svm_copy_to_devmem(struct page **pages,
> +				 struct drm_pagemap_device_addr *device_addr,
>  				 unsigned long npages)
>  {
> -	return xe_svm_copy(pages, dma_addr, npages, XE_SVM_COPY_TO_VRAM);
> +	return xe_svm_copy(pages, device_addr, npages, XE_SVM_COPY_TO_VRAM);
>  }
>  
> -static int xe_svm_copy_to_ram(struct page **pages, dma_addr_t *dma_addr,
> +static int xe_svm_copy_to_ram(struct page **pages,
> +			      struct drm_pagemap_device_addr *device_addr,
>  			      unsigned long npages)
>  {
> -	return xe_svm_copy(pages, dma_addr, npages, XE_SVM_COPY_TO_SRAM);
> +	return xe_svm_copy(pages, device_addr, npages, XE_SVM_COPY_TO_SRAM);
>  }
>  
>  static struct xe_bo *to_xe_bo(struct drm_pagemap_devmem *devmem_allocation)
> -- 
> 2.43.0
> 
