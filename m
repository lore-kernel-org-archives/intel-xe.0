Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF55E743D5
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 01:50:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A1910E0B9;
	Fri, 29 Sep 2023 01:50:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFF810E0B9
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 01:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695952203; x=1727488203;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3p6TD1FlsoYvIvndn1dkO1OlBlUxyYMxQEhsXKVRCKU=;
 b=la9u8+SagWSLA9tRxaUgSeMmDcNgVHd/5RAgQ6OUotsJFIHlLi3WwMlS
 eTGH8ZFbA3ohqugqjwXrI+B7k792Hoxp+O/PrwwJdBwbBGahvyk73/1q/
 q7S94Zx7SsNKFfLaVBMzYydKnQDjkuCDjbZG6GwcTlBzLSI4DwFT2o0cA
 npjH0y97scqZnhr06rjDydUf5CbE4bDti+ZPm1RKgUt7rX6FxQQ/xV5Qt
 C3FD0I189/x9QNn3GD7vC0iS7v0kVba3o+DYkrceey3hkFiYGGeAyhnYQ
 isluPqDJ6iq/STVjyC6Egyz4JR2tJvik4werSdP4AE4dQiiSh2ysl9UzA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="379487321"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; d="scan'208";a="379487321"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 18:50:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="815450185"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; d="scan'208";a="815450185"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2023 18:50:02 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 18:50:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 18:50:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 18:50:01 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 18:50:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmg39mhG2MuGho4YRBr/mXK4Igg4Jgmh2AdF4lLQy0+hOHcR5YID/yDbxMwy6md71QAYovoOoSYshpSytX6nXJTyHANpo73mkdkhvWYENahhdVCmjEHzOgoUH6m9Eh8o8JZvfHF6y4l+dgZ7VtXUtDJB5IxJLER8/XtjpsXcycmzQ6j3/WGjPWUVinLDaZGaEYQEnvha/xpCUTZaQwsvHnkRhAh0YjFtFfVI1fRXGbYhrGYBTZEwWYaYuacyuWThbljMpkB7dP/easU5P+bDcIdL3WgKhvf31UtaDT4433RDUklVhT4np+DfALgdorkX9vjZWFGFHHITq8C5gJ+4iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSLqqJ27WQrwehLoHAHI1TZfu6iiKmTtZKXeY4exMVw=;
 b=oDVPmcKKFVR2eTb80m20ls2lkRROmr572xgBbz/ircT50EEkAJFj6a6uHDOQbzCjPNjI500TqfgvmQPs3OG3TRRX3t6e7Q6Xpj3T3yxgLkL3RClEPJbM/L6X19rS5y5Nu18SEAvBHEQfvIi9KnNv5S9YwLMUZcAU9F6mXnt2QytdJ5A1JiEnt4eeF8adKnRNq1HV5AUwWm9r4qhPqCDyWfXzZG2XDnMlZIx2ZKyaIMl9CSmIwzqW2UGJfi8oXr+bIKuGSlFfnT+3KZz4eHYe85BXHFEq19uY/dOI4CKjU7unXawKGj98ccRh9O9t2fDQrj8iSF1mK/n5kYOysXLprw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SA3PR11MB7583.namprd11.prod.outlook.com (2603:10b6:806:306::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.24; Fri, 29 Sep
 2023 01:49:54 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042%3]) with mapi id 15.20.6813.017; Fri, 29 Sep 2023
 01:49:34 +0000
Date: Thu, 28 Sep 2023 18:49:27 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: David Kershner <david.kershner@intel.com>
Message-ID: <ZRYtJxlhG/nU36n0@nvishwa1-DESK>
References: <20230928134816.881379-1-david.kershner@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230928134816.881379-1-david.kershner@intel.com>
X-ClientProxiedBy: SJ0PR05CA0072.namprd05.prod.outlook.com
 (2603:10b6:a03:332::17) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SA3PR11MB7583:EE_
X-MS-Office365-Filtering-Correlation-Id: b76d6f4b-84ab-42ef-a284-08dbc08e5464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 24cmmEm7RxTot7bkIr5guWEPZ/dWMuOV564459Ha3QWFMIjHDYRDqUoAkVYBISZ+Ict/2Mhg5sDMeqrb3gXHYgJOhmKOsJBt4s7Uat1eCIJ9VBpNASzFs/pcXgOGeNMOfRjp3Jnp4mMrjVQ4dYJDzKpDpbKHyxsXas4akWffm0MlpczOoHfPfCTvplQ+N+Rik/e7sMZKFvDX6/jU5oRjW7zIOrQXFkO8lDThak5SR1t56A//ChF2tFsJyqoR5Y/p93Hm+QRSOO7I6F/TIoIsV6zTGsyfp/C4SFpDk1TS90wCIJ8pW6DiDWyK8tgmmtrNGSI6YAXqfmayC5vrazRhfo2L29gJ9fED9ouqNO3szSLqt3k26bJGU8gBCOoRnisqXn3qC9O/StcAIv+zzcsUlknwsrOJYxuOG/CfKNzzaOeeb7kZMmrPNAS87VPc0Z7fnVmp+Wq6UTDN/64C64cMYpQNZ37LmrT5gufCGaFr7vNNqMVbfAZAhENJJj+ZNPScwZiejq3NZrNtZkcXeCdzzUdX1G8pjb0J1hL1F9BWDChnkD7YQJ+K6TyOUhH0j/V+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(346002)(376002)(396003)(39860400002)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(9686003)(6512007)(6506007)(6486002)(6666004)(86362001)(83380400001)(82960400001)(38100700002)(33716001)(107886003)(26005)(5660300002)(44832011)(4326008)(66556008)(66476007)(316002)(6636002)(66946007)(2906002)(41300700001)(478600001)(8936002)(6862004)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jcPmZqqODopFk9jV5euWPO2UPUQTSmB/FEQSyDjIsrCu6xcevBiWRAwAhg+f?=
 =?us-ascii?Q?aB98GzDe3EJ1r4Q3ti8oKYciHFKgQrrQeyS7aYv7UPsgC2lg2IXz/oLtBkij?=
 =?us-ascii?Q?ZyJ/vi5R3z3rE06TVPcbaxG8EdwpnHSFyWNvl4qf4EMg31iE/ppppNBw/KP5?=
 =?us-ascii?Q?7bOb8/TTF54Diptsi5ojJk5RaoCxfAXHvqDEgGcOzlzhgPcBPgCMAtyK1Lul?=
 =?us-ascii?Q?bFMbLdWSVY3cNfRGcEHdFLfTaCskYFiUkFt3IrP8Ys5jeyVLrU5JhpFjT6G1?=
 =?us-ascii?Q?d+eZDOMrYzUH84WkDjIZPaIsqbqRehgI0QL3e3wXeHnthvN97d/j9ZF/BtKZ?=
 =?us-ascii?Q?I1bdD8crB8jVRuPdCqjk0DznaxjdwQXIowKwyiiJAWHj+OMTGHoMNg7XK1pQ?=
 =?us-ascii?Q?wh/BJTVVAvZaXu+7CVqs99SYU7raslTUW5Mf9rxQY71ahhumbTBDrRjsbIwp?=
 =?us-ascii?Q?Soz17CCx4F02IeCfFcoriPQxmESGchuEDHtDxUh00r5cKHVgeRZ4jEpKmgq2?=
 =?us-ascii?Q?QcVIc1LUfvqEzhWIjwMTpfMEP0bCX6nlKlwPGMa2h+1owp+Y9KebVEmUay5l?=
 =?us-ascii?Q?3jx3WyhF5iPVskg1kgwF74APy1tbz+9JoM51fPoMfy+NoQwRnxz5O307KOCQ?=
 =?us-ascii?Q?a62xzlhnRE4/NTl3zT+Tdn1W+lZtUlRKWN8dvLmmlm2/hSAPplqs5fdXC5ts?=
 =?us-ascii?Q?CqOkYaUlmc1J9pPny3FQgqIt802DjKu2y1b9fySDiINy4BAsssOyGWY05Q+U?=
 =?us-ascii?Q?CW+bGPdxRFpp608WaOYcQmurujuqDPvQHSgjtk6KUZiwepX4drCTb1VGPPOr?=
 =?us-ascii?Q?XO4bgCIMtKSfpDcqTlkYwAKn5pZOAcwHievnB6bGQfMPCCuQ7hZI6yGnZGLy?=
 =?us-ascii?Q?TjiYEoGyUicULf0QScD3K3ZLmLxXt4s6UVmVa6j9ixj97SyYYTgCiK+/KHyN?=
 =?us-ascii?Q?qliINXZCBtOgdgnTiOpNYFKNImpdmkDRwFzbkrP8LUe5Wf/i+yvtVeizN+KV?=
 =?us-ascii?Q?d9fcuI06LG6rQqtHq38b16K5hCq9WhHGeeJ+MkcSbmv7Y7aErtqujLdqo8My?=
 =?us-ascii?Q?k11qMDanvnWh7LqmhsrYdiT1Pf6lRjvHe+VOfgmw34K9FiYVJQo2+BRLbNCy?=
 =?us-ascii?Q?OLZWGVcN7Bt3P5klVkj/cx8/xU519nv/ZcmLVArx5cMhx7zTjA2Fo/wsmSPx?=
 =?us-ascii?Q?itr+cJchT2UFJbeydy0eBhcfFtgC8++R/a38ZbiN0P/yzjeYvPce4fP14cse?=
 =?us-ascii?Q?3AwQtuARZvjBVYAgQXZeYan3I0EAbVA46VebVOAP5KVglOUMHHNT6P+PP3oo?=
 =?us-ascii?Q?31NF7IWtD5DSbnfXBH3jVF9ZdY59wD/FMTftv+MzPwHvUHD0GxQJowgf4gzj?=
 =?us-ascii?Q?rWjm98Fa8YGhrMHLto9wCYYDkv4KmtdYulTS2H08qXWUuOjWegHMWDfn0Yht?=
 =?us-ascii?Q?LaXkFtrUar8X95LuoUlCq7jB4oFjpDBop70Rp5r1H8f/TBxwSDwwyQ1V4JeV?=
 =?us-ascii?Q?8HCcgEnliighwNKj7I44nLVtHS0Y1ys1/eD4cZH+GXvf3ICAfGEmIXFp+vKW?=
 =?us-ascii?Q?Fl4Dv8d+k3DjaCL2fQ3DA61Y/YKJXQiuIoytDyEA+Bm6mX2bMHDYieXXeYc6?=
 =?us-ascii?Q?0wtpPorDOv1TI9XuJSFqu5s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b76d6f4b-84ab-42ef-a284-08dbc08e5464
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 01:49:34.6868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7OfMIuxtJqXAKvFFASxwV/lL4XDgCnP5svREVRY1OABDMCKOde2ynYtcM5d4O2//m6oi9L0jKeJ/bNymo2s4agUZWOexGjj+naixvDAxzVWlecVR0Nvmd7xANpy7P/Md
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7583
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/xe_migrate.c: Use DPA offset for page
 table entries.
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
Cc: john.fleck@intel.com, stuart.summers@intel.com, matthew.d.roper@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 28, 2023 at 09:48:16AM -0400, David Kershner wrote:
>Device Physical Address (DPA) is the starting offset device memory.
>
>Update xe_migrate identity map base PTE entries to start at dpa_base
>instead of 0.
>
>The VM offset value should be 0 relative instead of DPA relative.
>
>Signed-off-by: David Kershner <david.kershner@intel.com>
>---
> drivers/gpu/drm/xe/xe_migrate.c | 19 +++++++++++--------
> 1 file changed, 11 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>index 9438f609d18b..848cdb6af2e6 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -114,8 +114,10 @@ static u64 xe_migrate_vm_addr(u64 slot, u32 level)
> 	return (slot + 1ULL) << xe_pt_shift(level + 1);
> }
>
>-static u64 xe_migrate_vram_ofs(u64 addr)
>+static u64 xe_migrate_vram_ofs(u64 addr, struct xe_tile *tile)
> {
>+	if (tile)
>+		addr -= tile->mem.vram.dpa_base;

See below...

> 	return addr + (256ULL << xe_pt_shift(2));
> }
>
>@@ -149,7 +151,7 @@ static int xe_migrate_create_cleared_bo(struct xe_migrate *m, struct xe_vm *vm)
>
> 	xe_map_memset(xe, &m->cleared_bo->vmap, 0, 0x00, cleared_size);
> 	vram_addr = xe_bo_addr(m->cleared_bo, 0, XE_PAGE_SIZE);
>-	m->cleared_vram_ofs = xe_migrate_vram_ofs(vram_addr);
>+	m->cleared_vram_ofs = xe_migrate_vram_ofs(vram_addr, tile);
>
> 	return 0;
> }
>@@ -223,12 +225,12 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> 	} else {
> 		u64 batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
>
>-		m->batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
>+		m->batch_base_ofs = xe_migrate_vram_ofs(batch_addr, tile);
>
> 		if (xe->info.supports_usm) {
> 			batch = tile->primary_gt->usm.bb_pool->bo;
> 			batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
>-			m->usm_batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
>+			m->usm_batch_base_ofs = xe_migrate_vram_ofs(batch_addr, tile);
> 		}
> 	}
>
>@@ -266,7 +268,9 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> 		 * Use 1GB pages, it shouldn't matter the physical amount of
> 		 * vram is less, when we don't access it.
> 		 */
>-		for (pos = 0; pos < xe->mem.vram.actual_physical_size; pos += SZ_1G, ofs += 8)
>+		for (pos = tile->mem.vram.dpa_base;
>+		     pos < tile->mem.vram.actual_physical_size + tile->mem.vram.dpa_base;
>+		     pos += SZ_1G, ofs += 8)
> 			xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);

I think this is incorrect.
We need to map the whole device LMEM, no just the tile LMEM for each tile.
This is because we should be able to move the bo from one tile to another.

And the identity map I think should start from device dpa (xe->mem.vram.dpa_base)
instead of 0-based. The xe->mem.vram.dpa_base gets updated based on whats is
programed into PKG_ADDR_BASE.

Niranjana

> 	}
>
>@@ -441,8 +445,7 @@ static u32 pte_update_size(struct xe_migrate *m,
> 		cmds += cmd_size;
> 	} else {
> 		/* Offset into identity map. */
>-		*L0_ofs = xe_migrate_vram_ofs(cur->start +
>-					      vram_region_gpu_offset(res));
>+		*L0_ofs = xe_migrate_vram_ofs(cur->start, NULL);
> 		cmds += cmd_size;
> 	}
>
>@@ -1027,7 +1030,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
> 	xe_tile_assert(tile, update->qwords <= 0x1ff);
> 	if (!ppgtt_ofs) {
> 		ppgtt_ofs = xe_migrate_vram_ofs(xe_bo_addr(update->pt_bo, 0,
>-							   XE_PAGE_SIZE));
>+							   XE_PAGE_SIZE), tile);
> 	}
>
> 	do {
>-- 
>2.35.1
>
