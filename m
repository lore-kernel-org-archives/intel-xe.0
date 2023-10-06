Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B403BE81E1B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 17:14:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8627D10E546;
	Fri,  6 Oct 2023 17:14:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B33710E546
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 17:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696612495; x=1728148495;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qs/oc4lSztFMAWL0MfQUMcGTmBqBAQZsbOTDbznAsCg=;
 b=EgJQfXJ1BZaX9COeTB2Kl3dpuxVfHK1NGCzfm5P4hGm0qCAa2nlvkyn/
 GX+3TVanex9XYVgKZpbky/3W/tnhvGnUp8Xe2WHmSyGHNSsk4ECD16iJy
 vVBYm34WAK7K0XkNqI/TO154Dv8g2InTcpfgRTScM5Uq5VZcLo5XspUpj
 N/rWMeYLMNoGVeWoGGwhIrZEJEXSAR+4nfEBxN8wh3Eb+Pmn09nLcjgwZ
 u6MbyvsWQLeRAbSG1duDQc0jc0r7h+fZ8s4zcZ7DwAQ7+oUpP/qnrcJxW
 qLUDR1AnvKV66hG4RcrHcIZdMQEmCHuVmjpW0gskedWmZG2eSBMT9BnRA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="450281275"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="450281275"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 10:14:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="728903054"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; d="scan'208";a="728903054"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Oct 2023 10:13:20 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 10:13:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 10:13:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 10:13:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 10:13:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=anq2NpiynbNv40j5Sox8DTmD1heymNBhnW20HnqzlHTptNMPVRYwAiTxEFK+RSNvNgpaBWfDH+omejX7FDqFKt0keKCXYgQ/nVxUvz46Wztb/irrI+cu5rjpgOHUYrYsXfeiWEpuoKSfS7l3LaVnLPc6lIMxmwQYckLXnHW9vwpXTxUrt7e1/K/r45x5RrKosafKJRxrgKXjrTyXnNtPtxFI7svadgqpVjBAQEbuT2sc5vbmTFTQwuMAeZ4ieLlPzzVbHqTsiGf24+jjtY7FEUabLqWVpLb8JxcVgZ+0z3gPoHXqhG/BC9tvAxpkQZ3ku1FoyOqHGjZNrtvHhS2S/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZzVKfA3z+TpGaG+Un0U7R52HTPhY+sJNdQ8KMfNoo0=;
 b=XhPa1g9d+O9YcdrIPFE6rkEtE3ob6YGEw8ocS5XbroBnnu4lLoiQo1PjALtDNWiZqwX+7JZy5ABnsowvmWhPicwr77MkaVR07gph/MyoIFc22oG+vafgflJeI1D9TJL8+yqHEzXBVZ/IZkhA4NKJiBn+68tbqvUZDal9NEkjv7fP9c6Ek9fnWfR9X875zzNFlPpRxbHMFzwnp0vtGIMDb0nCxxg3nvMuMDLMRtucplk+ZWPgyBjMnTfnHUIqUO8hDFonrjlP3ExnVSHfcCMxH9zsj8nznyfA+BpUv98nfOLlXO3p6flj6dyChOIgBSJsQxIJyTYD4hE+cZXNFCTtYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CH3PR11MB8095.namprd11.prod.outlook.com (2603:10b6:610:154::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Fri, 6 Oct
 2023 17:13:16 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042%3]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 17:13:16 +0000
Date: Fri, 6 Oct 2023 10:12:56 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: David Kershner <david.kershner@intel.com>
Message-ID: <ZSBAGKvrJz53huK5@nvishwa1-DESK>
References: <20231005220040.552765-1-david.kershner@intel.com>
 <20231005220040.552765-2-david.kershner@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231005220040.552765-2-david.kershner@intel.com>
X-ClientProxiedBy: SJ0PR05CA0208.namprd05.prod.outlook.com
 (2603:10b6:a03:330::33) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CH3PR11MB8095:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fbe3897-2d7c-429f-ea6f-08dbc68f7da1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h3gKa4sAVg5WCJcno5SPlgZ4X9chKXsUHh/WvCbsZxzwvmTMySzNVOy6oJN8ZDdjVf2aSxWkk+V9uswEpRtErTIUIUzbV3yPrypzn7SdDZAXDj8Kd/6Xj9hQKFsbkKyJmtyOrQiPvIMsxS93ueLX2wHoTUJ/rFRWGI84pkq+RkFKcV+2g+JlO+oLVeukYZbR1n2U/RNtZSOIAAoLpWx/JOSiJayttuO/xRfHS3Mt8Lqm7r+InxP+cam+B8Zk2lKpdykBB3C8MoO0cvOuE3XqYNusoq/ZHazNJrm/6SclExyAWXTD1NDu8KTrAlgpUXay11317yCaASiEcQOYPETX5SKHdFMgdJbluJXuExhL8fegbEs4N0Q6nUin5Nmg+D75d1kjSiOY1DgFIdOycpx3SgApuPfZj7pAm+v9pwae5UbRXm2D5gjXZVONOqmU67ts9U+QNJsuXunBO4JNydrsU41UJS4TWF3Y31my3RUgTds26j3AsaX6ucdV9hfQwgQFjuhRlOHFsogYkQxCXGnF9YBFrKgrQUhbRUgMeEQwktfRe9l4laNh5UZl9BmCSdy7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(136003)(346002)(39860400002)(396003)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(83380400001)(6666004)(6506007)(6512007)(6486002)(478600001)(86362001)(38100700002)(82960400001)(316002)(2906002)(41300700001)(33716001)(107886003)(26005)(9686003)(44832011)(66946007)(66556008)(66476007)(5660300002)(6636002)(6862004)(8676002)(8936002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rg/bVLVsHVKdST4RkgeNhbbmmODGqVA1cp5k90feAc5fWnObJv5TWayzWTj7?=
 =?us-ascii?Q?ufrIVkUA4Em02w8Uwsh1se5QOH77HDBa9/JbqNE5iYK6GTXPYPqD39/cFi2q?=
 =?us-ascii?Q?S/NvY2GzlkA225yv59WF+lWBo2bjoVrNK0nP1s+MvZuRjrW5cC21KBVQbZwk?=
 =?us-ascii?Q?fMLVLyechau3AUmj1Y8BYe2+HBvw7NNQVxa+GKAG4+cTJ4QIAz2bkvZve+Xu?=
 =?us-ascii?Q?us/IhBuLVodh9nM/PZf5udJkalNSU9eTlI5d5TvuG44Kwt5SkyEbXjyMfBYp?=
 =?us-ascii?Q?nRTUJnZJtE4vh/emwigQMO6eud+grzh7V9H9Maxp2FlHKgaW/xs4NJkOLP/P?=
 =?us-ascii?Q?ToDjODwOcSngPVTkdOQGH23VmkQRx49L0yYGJycd4icDLfO5JW024MPHYVeY?=
 =?us-ascii?Q?KIclKEsPbAjfn3dh5hJQuUUpGR14FYdU9yUDpmkMmJE5zB4lW2vt9/BcTqhQ?=
 =?us-ascii?Q?gZQxx3J1IUyFVEwKQ2Mq7S4JyAnDgNMRI0Gr1MOzNmB2+mhTzkVm/6ZN8qbD?=
 =?us-ascii?Q?tcC2D2+WjUVV8f59l2Q6U9PD+Y7OJl2a0aap2dXI85r9ec98cnMDuTMThoo5?=
 =?us-ascii?Q?jsnsCqD9OfiLiaDaXcm9Wlz70F3MO3Ib7I+bhbmg0c6HxSJIgd9wKPMLRWmr?=
 =?us-ascii?Q?TmMoFVXqvREz7YM+RUZXa72y+cQK94mwT4RZOIi7eE4w576/vgQ+qpPNfpN6?=
 =?us-ascii?Q?T7wTLzQcOlK//q6F0wbFjghDzeje2gcfgFGvc3oRiY88bkJL7Duxx7FSeA7j?=
 =?us-ascii?Q?kgfsFqRrmJSUnwy+12eXNHfGw2J0guB5zAIyuksMDhFSfA7m5fGuwF3cvfqp?=
 =?us-ascii?Q?ColzBJpzdMtwdRoyU6mofjwUMTduAySTL+2cRezqcsV+9xAc3JGnJ8pAGR1g?=
 =?us-ascii?Q?JvkbRPEpDXL5YqXwOjm8pE3NtKnYl4UqZINsXPvZAlEfSKJzQ1MK4niCFJNP?=
 =?us-ascii?Q?apGnDm2TExsCuSBAsv3sRNV2v9yQ6qOLhOEAE7nppMdiEegaFmXCLHpfFwCx?=
 =?us-ascii?Q?PoS4v8OfdLLE1kMw7LlCkDv4iO+XK3EMMkuLGn4qrLD53hTXNzQ5E72fGuqN?=
 =?us-ascii?Q?lgZek3FWDasYcQC8lOq/tHGVKtJlVcbpaMX5awS/WChXToPzfp9em4+wocRN?=
 =?us-ascii?Q?5vY7XlPWuBgGK0h5X60rXgOtwjpQbLN+rZ/0/Adluch0W9U8CCQ/z3E0/Zuj?=
 =?us-ascii?Q?+4JvbaTk626WcFZ/YXu9slR/WoVVyu9FVpFnUeqSoldyfm79PFPFJV7fgIAu?=
 =?us-ascii?Q?8H6VQ1PLSkDeVVfoHP7Ik4VjPPD1E6RClKc9roT7jgclhZnCX8FLllYysp9Z?=
 =?us-ascii?Q?uZFaUwNicWAcuEjv7D8KUYamRsm59p4uM+e/yxEeSIg0N50cqb9LrjyI5oYj?=
 =?us-ascii?Q?aNxFJznJKtVJZpc710M5YNSPpjWzubHDyWoPk1/9cfXoI0tvJdOiqYXHBgx3?=
 =?us-ascii?Q?6LYHjrfTmgFGXeJfFwnUHrCV2ojSfUvPAgcEQNXXOY77bdaANLnHl+huiKOj?=
 =?us-ascii?Q?0EubcMiDoZAdhD1yd36uUPwdhk9UDgmvPsxa7xagJqRyJ841AHt4vRKu/m8f?=
 =?us-ascii?Q?Tb8kpKMhErEiysVvGqrXmMPtIN70KRwrEhnN2+iUGUtV3tdZvXK9XP8q1fQO?=
 =?us-ascii?Q?LSYpxaJ2G/O2/RgM7BDtAUg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fbe3897-2d7c-429f-ea6f-08dbc68f7da1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 17:13:16.0561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zV0pS6JLntoe2APnvYhqAO6WDxQZG5aoQlR4/cZ/EY1/fjm1rmKlGRgBNqxt7n3gAp+2mkun1X6hyMfFVINnkUGh9QVpc54TzjnFF76Oj7jrTr7W0PUfWw0WcuYLIRnF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8095
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 1/2] drm/xe/xe_migrate.c: Use DPA offset
 for page table entries.
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

On Thu, Oct 05, 2023 at 06:00:39PM -0400, David Kershner wrote:
>Device Physical Address (DPA) is the starting offset device memory.
>
>Update xe_migrate identity map base PTE entries to start at dpa_base
>instead of 0.
>
>The VM offset value should be 0 relative instead of DPA relative.
>
>Signed-off-by: David Kershner <david.kershner@intel.com>

LGTM.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>---
> drivers/gpu/drm/xe/xe_migrate.c | 27 +++++++++++++++++----------
> 1 file changed, 17 insertions(+), 10 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>index 15f091a7bba3..db0e8d87a286 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -114,8 +114,13 @@ static u64 xe_migrate_vm_addr(u64 slot, u32 level)
> 	return (slot + 1ULL) << xe_pt_shift(level + 1);
> }
>
>-static u64 xe_migrate_vram_ofs(u64 addr)
>+static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr)
> {
>+	/*
>+	 * Remove the DPA to get a correct offset into identity table for the
>+	 * migrate offset
>+	 */
>+	addr -= xe->mem.vram.dpa_base;
> 	return addr + (256ULL << xe_pt_shift(2));
> }
>
>@@ -149,7 +154,7 @@ static int xe_migrate_create_cleared_bo(struct xe_migrate *m, struct xe_vm *vm)
>
> 	xe_map_memset(xe, &m->cleared_bo->vmap, 0, 0x00, cleared_size);
> 	vram_addr = xe_bo_addr(m->cleared_bo, 0, XE_PAGE_SIZE);
>-	m->cleared_vram_ofs = xe_migrate_vram_ofs(vram_addr);
>+	m->cleared_vram_ofs = xe_migrate_vram_ofs(xe, vram_addr);
>
> 	return 0;
> }
>@@ -225,12 +230,12 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> 	} else {
> 		u64 batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
>
>-		m->batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
>+		m->batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr);
>
> 		if (xe->info.supports_usm) {
> 			batch = tile->primary_gt->usm.bb_pool->bo;
> 			batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
>-			m->usm_batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
>+			m->usm_batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr);
> 		}
> 	}
>
>@@ -268,7 +273,9 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> 		 * Use 1GB pages, it shouldn't matter the physical amount of
> 		 * vram is less, when we don't access it.
> 		 */
>-		for (pos = 0; pos < xe->mem.vram.actual_physical_size; pos += SZ_1G, ofs += 8)
>+		for (pos = xe->mem.vram.dpa_base;
>+		     pos < xe->mem.vram.actual_physical_size + xe->mem.vram.dpa_base;
>+		     pos += SZ_1G, ofs += 8)
> 			xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> 	}
>
>@@ -443,8 +450,8 @@ static u32 pte_update_size(struct xe_migrate *m,
> 		cmds += cmd_size;
> 	} else {
> 		/* Offset into identity map. */
>-		*L0_ofs = xe_migrate_vram_ofs(cur->start +
>-					      vram_region_gpu_offset(res));
>+		*L0_ofs = xe_migrate_vram_ofs(tile_to_xe(m->tile),
>+					      cur->start + vram_region_gpu_offset(res));
> 		cmds += cmd_size;
> 	}
>
>@@ -1060,10 +1067,10 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
> 	 * pages are used. Hence the assert.
> 	 */
> 	xe_tile_assert(tile, update->qwords <= 0x1ff);
>-	if (!ppgtt_ofs) {
>-		ppgtt_ofs = xe_migrate_vram_ofs(xe_bo_addr(update->pt_bo, 0,
>+	if (!ppgtt_ofs)
>+		ppgtt_ofs = xe_migrate_vram_ofs(tile_to_xe(tile),
>+						xe_bo_addr(update->pt_bo, 0,
> 							   XE_PAGE_SIZE));
>-	}
>
> 	do {
> 		u64 addr = ppgtt_ofs + ofs * 8;
>-- 
>2.35.1
>
