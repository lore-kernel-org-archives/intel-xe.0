Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20214C0015E
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jul 2023 21:12:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B0A10E025;
	Tue, 18 Jul 2023 21:12:32 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE1E10E0A7
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jul 2023 21:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689714749; x=1721250749;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XVwrnxv/KGrFbAz4dw2xddqeXDPadkiRacnlO2RnpQ4=;
 b=D17yeHV6RvM+V3nl38cNG09rRm/QZAkj+gmmWzJqgdIkPd8gLBhmVYeF
 cvZabArzTqFX83yX2s4jlyMCiiD/OCQB/V0yGqzFFqJ3ve+eWjoXQyTmk
 ADyLJvUzBIVmJKKqaXS/D35alKJADmSTeDQy34DW0BJU9WnbeXqLEm0YM
 QVb/oMkxYKYGQMj3+qLLIpw4N+Q9iENqtHn1i/A9bkjodQ/SBBiEB1f/N
 4rtqGI9UHseBE+buk0n9cJHgFMOCc21UjcwS4ptIOfO/AlI5OJgKvZQzG
 2/YZZT4i943VWwdDRM1eTpjZ9bwV+y5nwLX8jWZVjzEG6MBuaL9Y3kgWk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="345904699"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; d="scan'208";a="345904699"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 14:12:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="717754717"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; d="scan'208";a="717754717"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 18 Jul 2023 14:12:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 14:12:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 14:12:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 18 Jul 2023 14:12:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 18 Jul 2023 14:12:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=InTJTNlNyti2F3jMA479X4yySsKWueAWIN+fKhb4FIkI+cM1V7BmKwVuuD8kciviMIUyqf8Fg4jF68+e4/C+nLFDDwtVEYRiAGQsohzFSqHhDdlZQib/4tjLmGyE93fukAuPgVITmkdFRTq/LH5VvvDlyuN4iYedXjFZiaWjbfge0J+ytyIZFbuSTxT0mJlJQBZ7IDF8VRHi9BGpHTWsVtlL9FGzksGH0pr7t2AyUot0iOC9JapmGnfd9BnlT7IKxIhQEZW4RCafb0VxGILd6AyJrFGXm+TI2sCLfQHdpCoGfkzpvoUeIYEgUJmvkA8uUXwwDd3Bxw+ERs8RQc55Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KaPmPWYmm4VltXTIRBlJzTbg/Puv19aJvmhvEOH4sZc=;
 b=BCM6PIXSsylDNQFOHLaUzKDf4EgBC4ypKNI1QegR56ChspvSNlfOUvOxcxRRYKakNbq/r3iaHhBOJV0cqoQ7omMbovkPH8SRggL/EssDGRhugoZF/byA3db6Cklh1ZQzwVXoBKrGPG7CV6Ir7rrq2IRuZWCZVoGygn8xjfZpHF1BosepFGtZnyzKqfrCIosXMstmYvGSNfBR4idYlUo3LV2FOm20KbiWLKT5f6M9pWESdB2KytFjRvUP0WdDK5KnryP3NEesmkE1tqZZwcnBC2DVD3Txo4yQ+UkbCvtcpgppHyWFTZRhkvK1E3+JxxwhKJUWlGbegdGKyVh7DQ17Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY5PR11MB6163.namprd11.prod.outlook.com (2603:10b6:930:28::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Tue, 18 Jul
 2023 21:12:20 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 21:12:20 +0000
Date: Tue, 18 Jul 2023 17:12:16 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZLcAMEJgclS3gFVR@intel.com>
References: <20230718193924.3084759-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230718193924.3084759-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR08CA0070.namprd08.prod.outlook.com
 (2603:10b6:a03:117::47) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY5PR11MB6163:EE_
X-MS-Office365-Filtering-Correlation-Id: d5a21652-3948-42e3-816c-08db87d3ac16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uzRa1aFLEfBTB5DchLjXNRd0sszNsvVhH7HQqx5uuWNsR/yLAGB7azKNL8l4r80LGHV74RBjR+M7QjqQeikFkqdJfSPdndFMtKxu1XnghqJFN9Rq7WN5BhkAAm+hsVF3nkmu8Ha5Su8cJg+mnqofZ7ososCyQRF4X9VRb9sVnxMqsbwJPJmM4qqDtL6wDRktUSfy/0KmzbeHp/0ugFpl73RNs6H+DaQX8QL0o03Zyehe7WAxkVrJN+EDvA3k199fk1QG2S1uEs6TgZeYGq3RPEJZoAloksbRnr0r9NtBO+EgBMFanNfqNtAhhe5VvGxzm4g+uus3lmVfRV47EYNHNt8ssiU9xpFzG0lwyFQjDSlWdLiCAc9hEMRsqydkQdiLIB+RD1CWrIR5Eqwzhi7Sgfr+kQjt2k22eF0GZpVd7aG1aaMu0dPeBvlnzvR08nCfmd7nneNXchhSQSDikleD4nd7Pgfi3DnnSmiC0xiyhnEFJLAWousxf2GXirBjak/LktzoaeD0ZKdd3QGJgg+h1plwSPXYy2cC3QhFc/3ACY4QO5foxH5vw8zWEkGkGezJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(376002)(39860400002)(136003)(346002)(451199021)(83380400001)(478600001)(186003)(86362001)(2616005)(6486002)(26005)(6512007)(6506007)(2906002)(66946007)(66476007)(6666004)(38100700002)(36756003)(66556008)(44832011)(37006003)(41300700001)(82960400001)(6636002)(8676002)(316002)(4326008)(6862004)(5660300002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tPzLfaNlhIrkPQjm3CD+C7pypO+9i6K51VreXTTDCHObbmP35dA4APsejz30?=
 =?us-ascii?Q?O8KLqPvlivtyh/VMXbyiVPRBVFNQTaQP5BBvjh2P6U8O+cTySWkbrheQs42c?=
 =?us-ascii?Q?BhHaTUqa8K5puosm4/7ER9PynxSLtKWoqWsXK17YhwSMrvUYhX+g1LbN1kTE?=
 =?us-ascii?Q?XLs3Ulb23LDeVqZbT0/ZtPzfcXHiuDJ2GQR4yNI6qSj9JOIwxYjRqmRrAHE8?=
 =?us-ascii?Q?XLWQylc8KsBmMODbzSn85/Fh5IOn0fBwPYZjU55yBkF+2DECEbpYEEGmEjmh?=
 =?us-ascii?Q?Ckedn17nITg5ka8bZ9HKe/sEhicPPE1xz73srAoq6eMYJgY7t5wVoj8RcRGT?=
 =?us-ascii?Q?V1qXfehBx8nEQ3pyf/raOTbDrMInmtUwl0ZhP+aEtl4NzAY7XyxxJAZU8Quv?=
 =?us-ascii?Q?9+p6Woi22hfO/gVwqshgLD1nJ1TZUBjq1wNFyxaFs05ab4qOdvZNkoitsSzR?=
 =?us-ascii?Q?3gYCdl/Hxlu3x+RYliOeL7x2pQcrGAcVCBHydQwKOJ2ZePQkqiqfGY5r5UeY?=
 =?us-ascii?Q?80tLlQRgVBhJIRgkzi3WFS5zBUS8UIQfHFOsbtMqOtX02Ywa0HVqLovy93Mu?=
 =?us-ascii?Q?n8Rjfqsc8+f9acfv52LAQ0Gc7L3LSFoGw0uJ+LIQe6ld2Wzgry6vGHw+hnZp?=
 =?us-ascii?Q?rj8zMhYHiPihmrIkG6+FKoesAS4PM0tBH9aAYmnBkQoie3YEyR2FglzT/i5L?=
 =?us-ascii?Q?DP+pcX0AkrK2+poYR07GcKNnQjFqTmXgTuzjVlsKuhDZFXE0aXsGiHgD33pH?=
 =?us-ascii?Q?qiZ59WhrEU44tACn3hawZsqpuJMJ2EnkoHfs2mX3lcXvEMxztoRY1wXH3nrx?=
 =?us-ascii?Q?FEQo9AkY/HaW911pOQFfD3hXW1eojeP0M1oE6EMp792R9kGdCZ9ebGP3Ie9d?=
 =?us-ascii?Q?dbb36JBTCgBEj8TJTq8pMC5YDfwhEFaLyPwyOvXx69jmfU33oKZ53FkgjsXn?=
 =?us-ascii?Q?DSson4p5LbsDbpom141bjAEi0wHltQR0Dlf0EB4GxbRTvaBCrv+5eCyB29t7?=
 =?us-ascii?Q?i34zrA+96DoScef34bnEmI9EPqasSejXbYdWe5Wzug4rgr7G6iiNeuFWQOMq?=
 =?us-ascii?Q?buG+gVTvjtV2onolgwTsH9oBezROAs06NeRbzp+pQ+3bxpQQIR8JfviQqp5c?=
 =?us-ascii?Q?62rDhxwnXCXpKysHmhbZwBR88f+5/eYnebBLaCVXDTK+sofCVLbU0SAu9KaC?=
 =?us-ascii?Q?mBy/ZHpROyPKelFFIQ9HdqYTAIqcs8V2B+0t5om5wLFaExJByChvulJ/LlaX?=
 =?us-ascii?Q?XdHwGOK+ZVPEtsGAUaMG0jDpzAFIK1RywkajXeGlUDE9fFUVe/2kkbdsA5hK?=
 =?us-ascii?Q?5kLmJuqAgZOlD8t7fO5cFShrfRyk/jh9gjAQKP4Cv4w0blz71X82ntDZiekQ?=
 =?us-ascii?Q?5klhDKneAnnawl6CQekBVFCMSQkhwAhygiXGpQQJy0ZwakX2oGhCVchdwevF?=
 =?us-ascii?Q?vKyrX4L+U1+pKEOZruSpOHZhqKigQ6PJEn5VPRqMve6uTuYdgrGpmWBF8o1A?=
 =?us-ascii?Q?gpIoY+dvn3lHNsp2tl6ZVyboh19eJG53dQJuEqwu3XGxRYLr0sfPsNVUA1uJ?=
 =?us-ascii?Q?r/UM1Qar8LLqVYhvcfdFY5EHfFoGKgUcN+ov5FZaj57LU64dXxiR8Av/qZ0i?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5a21652-3948-42e3-816c-08db87d3ac16
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 21:12:20.1756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xi2a3VEHEquI4vDhvbdMRlmmyXsecmRdAnOoInClG+iWdxsYYPSb/cQE3BQ8PRN+l1U6P3zKNk3NJcy3+S7xBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6163
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Normalize XE_VM_FLAG* names
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jul 18, 2023 at 12:39:23PM -0700, Lucas De Marchi wrote:
> Rename XE_VM_FLAGS_64K to XE_VM_FLAG_64K to follow the other names and
> s/GT/TILE/ that got missed in commit 4e6715bd2a5e ("drm/xe: Move
> migration from GT to tile").
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_migrate.c | 2 +-
>  drivers/gpu/drm/xe/xe_migrate.c       | 8 ++++----
>  drivers/gpu/drm/xe/xe_pt.c            | 4 ++--
>  drivers/gpu/drm/xe/xe_vm.c            | 6 +++---
>  drivers/gpu/drm/xe/xe_vm_types.h      | 4 ++--
>  5 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index aedfb3dd559e..30e5fdf6ca63 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -301,7 +301,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>  	xe_map_wr(xe, &bo->vmap, XE_PAGE_SIZE * (NUM_KERNEL_PDE - 1), u64,
>  		  0xdeaddeadbeefbeef);
>  	expected = xe_pte_encode(NULL, pt, 0, XE_CACHE_WB, 0);
> -	if (m->eng->vm->flags & XE_VM_FLAGS_64K)
> +	if (m->eng->vm->flags & XE_VM_FLAG_64K)
>  		expected |= XE_PTE_PS64;
>  	if (xe_bo_is_vram(pt))
>  		xe_res_first(pt->ttm.resource, 0, pt->size, &src_it);
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index f17de52b51f9..2bb7d524af24 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -201,7 +201,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  
>  		xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64, entry);
>  
> -		if (vm->flags & XE_VM_FLAGS_64K)
> +		if (vm->flags & XE_VM_FLAG_64K)
>  			i += 16;
>  		else
>  			i += 1;
> @@ -213,7 +213,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  		/* Write out batch too */
>  		m->batch_base_ofs = NUM_PT_SLOTS * XE_PAGE_SIZE;
>  		for (i = 0; i < batch->size;
> -		     i += vm->flags & XE_VM_FLAGS_64K ? XE_64K_PAGE_SIZE :
> +		     i += vm->flags & XE_VM_FLAG_64K ? XE_64K_PAGE_SIZE :
>  		     XE_PAGE_SIZE) {
>  			entry = xe_pte_encode(NULL, batch, i,
>  					      XE_CACHE_WB, 0);
> @@ -239,7 +239,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>  	for (level = 1; level < num_level; level++) {
>  		u32 flags = 0;
>  
> -		if (vm->flags & XE_VM_FLAGS_64K && level == 1)
> +		if (vm->flags & XE_VM_FLAG_64K && level == 1)
>  			flags = XE_PDE_64K;
>  
>  		entry = xe_pde_encode(bo, map_ofs + (level - 1) *
> @@ -462,7 +462,7 @@ static void emit_pte(struct xe_migrate *m,
>  			addr = xe_res_dma(cur) & PAGE_MASK;
>  			if (is_vram) {
>  				/* Is this a 64K PTE entry? */
> -				if ((m->eng->vm->flags & XE_VM_FLAGS_64K) &&
> +				if ((m->eng->vm->flags & XE_VM_FLAG_64K) &&
>  				    !(cur_ofs & (16 * 8 - 1))) {
>  					XE_WARN_ON(!IS_ALIGNED(addr, SZ_64K));
>  					addr |= XE_PTE_PS64;
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 00855681c0d5..851ea7c01b91 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -341,7 +341,7 @@ int xe_pt_create_scratch(struct xe_device *xe, struct xe_tile *tile,
>  	 * platforms where 64K pages are needed for VRAM.
>  	 */
>  	flags = XE_BO_CREATE_PINNED_BIT;
> -	if (vm->flags & XE_VM_FLAGS_64K)
> +	if (vm->flags & XE_VM_FLAG_64K)
>  		flags |= XE_BO_CREATE_SYSTEM_BIT;
>  	else
>  		flags |= XE_BO_CREATE_VRAM_IF_DGFX(tile);
> @@ -761,7 +761,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  		.va_curs_start = xe_vma_start(vma),
>  		.vma = vma,
>  		.wupd.entries = entries,
> -		.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAGS_64K) && is_vram,
> +		.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAG_64K) && is_vram,
>  	};
>  	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
>  	int ret;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 91f11dfe9460..97f2c882050b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1244,11 +1244,11 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  	drm_gpuva_manager_init(&vm->mgr, "Xe VM", 0, vm->size, 0, 0,
>  			       &gpuva_ops, 0);
>  	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
> -		vm->flags |= XE_VM_FLAGS_64K;
> +		vm->flags |= XE_VM_FLAG_64K;
>  
>  	for_each_tile(tile, xe, id) {
>  		if (flags & XE_VM_FLAG_MIGRATION &&
> -		    tile->id != XE_VM_FLAG_GT_ID(flags))
> +		    tile->id != XE_VM_FLAG_TILE_ID(flags))
>  			continue;
>  
>  		vm->pt_root[id] = xe_pt_create(vm, tile, xe->info.vm_max_level);
> @@ -2128,7 +2128,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
>  struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm)
>  {
>  	int idx = vm->flags & XE_VM_FLAG_MIGRATION ?
> -		XE_VM_FLAG_GT_ID(vm->flags) : 0;
> +		XE_VM_FLAG_TILE_ID(vm->flags) : 0;
>  
>  	/* Safe to use index 0 as all BO in the VM share a single dma-resv lock */
>  	return &vm->pt_root[idx]->bo->ttm;
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index edb3c99a9c81..223b8f84c546 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -143,14 +143,14 @@ struct xe_vm {
>  	 * @flags: flags for this VM, statically setup a creation time aside
>  	 * from XE_VM_FLAG_BANNED which requires vm->lock to set / read safely
>  	 */
> -#define XE_VM_FLAGS_64K			BIT(0)
> +#define XE_VM_FLAG_64K			BIT(0)
>  #define XE_VM_FLAG_COMPUTE_MODE		BIT(1)
>  #define XE_VM_FLAG_ASYNC_BIND_OPS	BIT(2)
>  #define XE_VM_FLAG_MIGRATION		BIT(3)
>  #define XE_VM_FLAG_SCRATCH_PAGE		BIT(4)
>  #define XE_VM_FLAG_FAULT_MODE		BIT(5)
>  #define XE_VM_FLAG_BANNED		BIT(6)
> -#define XE_VM_FLAG_GT_ID(flags)		(((flags) >> 7) & 0x3)
> +#define XE_VM_FLAG_TILE_ID(flags)	(((flags) >> 7) & 0x3)
>  #define XE_VM_FLAG_SET_TILE_ID(tile)	((tile)->id << 7)
>  	unsigned long flags;
>  
> -- 
> 2.40.1
> 
