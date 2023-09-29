Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA79DE71D33
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 20:53:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A9B10E13D;
	Fri, 29 Sep 2023 20:53:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E2D10E148
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 20:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696020810; x=1727556810;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=W0Ovx3Oojw2qM0Cf928K6uckiWJ15/XIOHVTpmOzaxY=;
 b=SJaw6fK4eXWQgEHqTQfvL9Zj3F/QfnWbip1BDsBUR3MKwJNFXFm69fxC
 eWncz863RAsP2WRpJx07/LL/R/ppf3tF0dP698ynWrjnSzAYWqH0DlbuN
 W97M5yOCJoyQfE+mA/ySx2ZJ0qeyI6P0qdiir7bVWnlA7bz2hu3TLhD/Z
 F7yh78mRO1fDv4VV2XaeLwFsNjX8n9e23GVbEfpcwSHDumEAQmCXUGryN
 GRYecQlLziixbixEjtYB8m+qH+XJQLuCJLewpXLBtBhN+1kIsonpvAs6X
 N2S9yjkDarKBrhk5wT4C5WttTh8jClW84dH+DbEZaXChfs0a+3Vp60P9j w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="413278234"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="413278234"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 13:47:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="865825825"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="865825825"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 13:47:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 13:47:04 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 13:47:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 13:47:04 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 13:47:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmElz4V6dTwIqy1hlT0w6Xl2CnksFBjyuchrrD5fe0LFyfmliBtFp0GWcKyTJhxM+fSlZD03cdfqZJl1i9qNjCDNxr97UyiIrr8EE/O3RftjZLu1tlgaJxq0wfxrdMqNBn8F0YPK/EoFEIdwInNs4N35Da84DH4cTzklirnwmrEiC6dX4h77sezzu1TXhfGIpd8FKHF3D922m7RuI6RbC3Yy2BJIB2qrjnJTGgqv+ScFx/DDxp8xMDMqyfBs/kT4N5XmksSsR1cAQ82nGaottUtgejrkco75C0jNk6vsRHe8aftrl8G+IbzXBgStuHNCjIT0rZinFHfHq4e4aPQAsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mizmKIAPFBe+TdrM7jbYMzUowFjWk2eUAP1HJgMpfCU=;
 b=GbfVimtT/4nwYomcaEzE6mhgkII4cm399eodz2quchvL1MwCiVPeS64jG7w6s8s8uqehkMzyiEcRNCtnVNwv7fKp4UokSo6niV4lWjlr0v4VAvWbXOXh9066yQeC6HzVqq2bXNFYli/o3Vv6b4bF4cuUM+QjXHTqs7pLzKekNk4XxDSkg9ZL/HEniWzbHSndBU/RcAAGtTuMybBO3N7l6LsNUphNxveB9BsnVa8i47n9h5U85xPHNCLfFXnJloIT2ScCl0kyHvbH5J79gTUZIdhWj37IXNCPr2lmGCgKm9BBcJDtCYrWYYnpZYM3rvnw2kj1lw2Dw8YxR9GlDMW0aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA0PR11MB4639.namprd11.prod.outlook.com (2603:10b6:806:70::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Fri, 29 Sep
 2023 20:47:02 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6813.017; Fri, 29 Sep 2023
 20:47:02 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 29 Sep 2023 16:44:09 -0400
Message-ID: <20230929204637.1202492-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230929204637.1202492-1-rodrigo.vivi@intel.com>
References: <20230929204637.1202492-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:a03:254::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4639:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f551460-69d6-446a-9858-08dbc12d3bd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SoYiJHpkKHzhn1AMK00/x2+5LNLpVgZzbbQ9fnA919ELMvuiKARObKf11XHL8cNG2FXY09ywNgargLUW9lzi9GzKlguLTCP0GP1kuQY8fHP9JWSTT7zhsmJRaDzinhyeOjqwmL8VY13kL097DersKI1leDck860DTIaPfA/CbrN6dZhbGQlpxumpNAWwGo2o3Y1ykgOVpGtab4UbJpBLkLCzixgJ9tq+uDWFQZEoVmz0W1b3ae8oePsRCc7QKDilOgl9WRsReQKMgk1v8J0j0Fg6Bp70DDVFqipdpziSQRAJQvR5g0tfTnacrQD+pP+4okIWhBghNkcQ7KiJohPzYmVCI2NsM/WzmI949OGZKAS84Qt+cJLD9IZw9V2xLeqJrCki9x1mh3gnQiK3DLqGawaTKM7W9D0v0WdzmCAVUJ7dDhAAlI4RRolKXYHySHK74n3t44//mtP8jzJis3HdDE1uKB/liNWCIsGbf20gCVsa8KQHFquSjPHzlfatlsDQacQ9zxn5/n+nLuia4mAnNfsaz0KSm3ztWXJShR/q9O471JfqSzoiC6X7ysEasvnM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(136003)(366004)(39860400002)(396003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(8676002)(8936002)(478600001)(26005)(44832011)(4326008)(2906002)(66946007)(5660300002)(66556008)(6916009)(41300700001)(316002)(66476007)(6506007)(6486002)(6512007)(107886003)(2616005)(1076003)(83380400001)(36756003)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rcw5dbXXg6CDPR/2CwJhbBGN9uvyfNj28ch0DRAKX3oE8q2x9A0dWB5G1xnv?=
 =?us-ascii?Q?troKW3n+eFZeyvmWrVY0xgMrHg8IEw0BlNvEKHDL6TK6VEWsAw7SLqX1+tLV?=
 =?us-ascii?Q?bD34/qpf89z5wZgoHUGqrWIE1jcw1goEgCbq36ebiP5lShTU4Dql5ZDgXOrh?=
 =?us-ascii?Q?4emMqpnw4bD8PQCrRRVH9Hy7jb0ncRAdj2uaNoi2mJIaf4XKZcqxWhjsdgV7?=
 =?us-ascii?Q?dIlIKz4oEzAmXKc5fKWn6eyIkPqSbrM11yaz/PnIiJWfa0z0t9vrOyLDCG2F?=
 =?us-ascii?Q?WVrCMPTa7ItstpOP9A6/vlF2w3HrxVUi+V3tcWJjMz5pARhK+07IJLQuQwqM?=
 =?us-ascii?Q?ILymAE/Nf3gTjDS0vlTzTNFavXJBsSxwIRNQc4UVM4av/C/iy1PFzsux+lRU?=
 =?us-ascii?Q?GIeBrAlI0meogPkde+bXEWxTL6xat+N6jhLxP+oJCUhQP1HBwA1ftrOKX6Ua?=
 =?us-ascii?Q?pGDNhCrRh6ulx+kwzmwtu8m7VxaThqw4cAkcFfewhi4bimLIDeRQh8pW6+8g?=
 =?us-ascii?Q?x6rlc7xkOj6j/PY8EaHVHxf6H+SdBk2eqQd5zYseDhm8Co/1L1Xe6F433MiT?=
 =?us-ascii?Q?5J4qEK7JCyZL2+IZ2zZdomwEv4uGC2DIHusi4VGsvj0v8BVnxBNvlMXhZXD1?=
 =?us-ascii?Q?zH25KmCez4YTzpKy8ZlLEte3KQ0m3MI3uBziYwB0GDKKVqPPrikrETdwDrra?=
 =?us-ascii?Q?olEfD478lzeX3uq+RDnwda7Qf3eRYEaGaf2xxln3GxFifnEWBrMgLOtByG/D?=
 =?us-ascii?Q?n0lygO6MjdIKHuYQOJQ3M3qOu1FWtHbY6KAfGgMMWGwk2tDOwQiQxTpY+trl?=
 =?us-ascii?Q?T8VnuuKbrvcMjk0IkSewM/aNP5PCXutqiR1SkSTdTe6uvMPvaiyQzleAIfS/?=
 =?us-ascii?Q?OpX4hI3/6GTdXwAY4sciid0AyPwmzUOeBe+Kq2EINxrtZQTLR30BsBAgw7yO?=
 =?us-ascii?Q?NmFjnUK5nbbrPLy3swWbCCGB5XYt7Nza4XWGGdLOG9ewMeZzixzeG6igtcV8?=
 =?us-ascii?Q?f5cmCXUE/bCJpe/mBclJubLuBEMSRuaFMSM11b1tLqjR60PD5+l6MB41T7kV?=
 =?us-ascii?Q?cN5Zswxq8qkpFsIvbLs8qlyf/OnwtxSGYFQgyqCtan8xerq00cgFWO9sM2Tp?=
 =?us-ascii?Q?XgYgXw4oaGnJocGnqlbfbBQh2yrPQB1kD0D0cs6PyqgR49wPPuZLtPYt7Z4D?=
 =?us-ascii?Q?svqwJ6nFh1ntA98vioWsD7nm15eUSCBtDMQ9jp9EYJhsLErRv8gv5VZJnVb4?=
 =?us-ascii?Q?W7Y3BptkpnjZZv8jUStuRpbffqbFxemWXT3aBjAA1dPrpnq1WZrap4q0cd+a?=
 =?us-ascii?Q?G5km7RmifML/B/8GQ4GPWJu3ZM0aN4390nJg90EexSOtcQnNUwbYhhr6ltG9?=
 =?us-ascii?Q?hMbQCFDoGfb07QwviRXkI2WPzMtB4Sts9OGJcHbX9PwvkEYrPVVT4nbUHOvN?=
 =?us-ascii?Q?GoU8bmgbrNc6EqrSj1bygnQ4+q0PkTspsEsedUw8Q7r02g2QoU6HIa6Cc9MJ?=
 =?us-ascii?Q?xGBbV4z/YVwf6ND6inYNHpOBs69S7Z6Xib8DYUsxO2od9wTkeMJpHXUwvOT0?=
 =?us-ascii?Q?u5EkBnRDywtENUSz1lExR3LefQs7la77obbe01fd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f551460-69d6-446a-9858-08dbc12d3bd7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 20:47:02.7551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Na0Hsny//tJ5sddloOGoP5EJ+Cu9OWClcDrLA94RIzyuPo1JraKEECkC8DWPeLoyZ6d2Ew/j0r85ZyCz0Xijg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4639
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 2/4] fixup! drm/xe: Port Xe to GPUVA
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

---
 drivers/gpu/drm/xe/Kconfig         |  1 +
 drivers/gpu/drm/xe/xe_vm.c         | 30 +++++++++++++++---------------
 drivers/gpu/drm/xe/xe_vm.h         |  4 ++--
 drivers/gpu/drm/xe/xe_vm_madvise.c |  2 +-
 drivers/gpu/drm/xe/xe_vm_types.h   |  6 +++---
 5 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index d57181ff47e6..97ed2a00f862 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -34,6 +34,7 @@ config DRM_XE
 	select VMAP_PFN
 	select DRM_TTM
 	select DRM_TTM_HELPER
+	select DRM_GPUVM
 	select DRM_SCHED
 	select MMU_NOTIFIER
 	select WANT_DEV_COREDUMP
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 57ffac324564..3a761608bb68 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -882,7 +882,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	INIT_LIST_HEAD(&vma->extobj.link);
 
 	INIT_LIST_HEAD(&vma->gpuva.gem.entry);
-	vma->gpuva.mgr = &vm->mgr;
+	vma->gpuva.vm = &vm->gpuvm;
 	vma->gpuva.va.addr = start;
 	vma->gpuva.va.range = end - start + 1;
 	if (read_only)
@@ -1147,7 +1147,7 @@ xe_vm_find_overlapping_vma(struct xe_vm *vm, u64 start, u64 range)
 
 	xe_assert(vm->xe, start + range <= vm->size);
 
-	gpuva = drm_gpuva_find_first(&vm->mgr, start, range);
+	gpuva = drm_gpuva_find_first(&vm->gpuvm, start, range);
 
 	return gpuva ? gpuva_to_vma(gpuva) : NULL;
 }
@@ -1159,7 +1159,7 @@ static int xe_vm_insert_vma(struct xe_vm *vm, struct xe_vma *vma)
 	xe_assert(vm->xe, xe_vma_vm(vma) == vm);
 	lockdep_assert_held(&vm->lock);
 
-	err = drm_gpuva_insert(&vm->mgr, &vma->gpuva);
+	err = drm_gpuva_insert(&vm->gpuvm, &vma->gpuva);
 	XE_WARN_ON(err);	/* Shouldn't be possible */
 
 	return err;
@@ -1187,7 +1187,7 @@ static struct drm_gpuva_op *xe_vm_op_alloc(void)
 	return &op->base;
 }
 
-static struct drm_gpuva_fn_ops gpuva_ops = {
+static struct drm_gpuvm_ops gpuvm_ops = {
 	.op_alloc = xe_vm_op_alloc,
 };
 
@@ -1372,8 +1372,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	if (err)
 		goto err_put;
 
-	drm_gpuva_manager_init(&vm->mgr, "Xe VM", 0, vm->size, 0, 0,
-			       &gpuva_ops);
+	drm_gpuvm_init(&vm->gpuvm, "Xe VM", 0, vm->size, 0, 0,
+		       &gpuvm_ops);
 	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
 		vm->flags |= XE_VM_FLAG_64K;
 
@@ -1479,7 +1479,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
 	}
 	dma_resv_unlock(&vm->resv);
-	drm_gpuva_manager_destroy(&vm->mgr);
+	drm_gpuvm_destroy(&vm->gpuvm);
 err_put:
 	dma_resv_fini(&vm->resv);
 	for_each_tile(tile, xe, id)
@@ -1560,7 +1560,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 
 	down_write(&vm->lock);
 	xe_vm_lock(vm, false);
-	drm_gpuva_for_each_va_safe(gpuva, next, &vm->mgr) {
+	drm_gpuvm_for_each_va_safe(gpuva, next, &vm->gpuvm) {
 		vma = gpuva_to_vma(gpuva);
 
 		if (xe_vma_has_no_bo(vma)) {
@@ -1619,7 +1619,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	xe_assert(xe, list_empty(&vm->extobj.list));
 	up_write(&vm->lock);
 
-	drm_gpuva_manager_destroy(&vm->mgr);
+	drm_gpuvm_destroy(&vm->gpuvm);
 
 	mutex_lock(&xe->usm.lock);
 	if (vm->flags & XE_VM_FLAG_FAULT_MODE)
@@ -2409,7 +2409,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 	switch (VM_BIND_OP(operation)) {
 	case XE_VM_BIND_OP_MAP:
 	case XE_VM_BIND_OP_MAP_USERPTR:
-		ops = drm_gpuva_sm_map_ops_create(&vm->mgr, addr, range,
+		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, addr, range,
 						  obj, bo_offset_or_userptr);
 		if (IS_ERR(ops))
 			return ops;
@@ -2426,7 +2426,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 		}
 		break;
 	case XE_VM_BIND_OP_UNMAP:
-		ops = drm_gpuva_sm_unmap_ops_create(&vm->mgr, addr, range);
+		ops = drm_gpuvm_sm_unmap_ops_create(&vm->gpuvm, addr, range);
 		if (IS_ERR(ops))
 			return ops;
 
@@ -2437,7 +2437,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 		}
 		break;
 	case XE_VM_BIND_OP_PREFETCH:
-		ops = drm_gpuva_prefetch_ops_create(&vm->mgr, addr, range);
+		ops = drm_gpuvm_prefetch_ops_create(&vm->gpuvm, addr, range);
 		if (IS_ERR(ops))
 			return ops;
 
@@ -2454,7 +2454,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 		err = xe_bo_lock(bo, true);
 		if (err)
 			return ERR_PTR(err);
-		ops = drm_gpuva_gem_unmap_ops_create(&vm->mgr, obj);
+		ops = drm_gpuvm_gem_unmap_ops_create(&vm->gpuvm, obj);
 		xe_bo_unlock(bo);
 		if (IS_ERR(ops))
 			return ops;
@@ -2971,7 +2971,7 @@ static void xe_vma_op_cleanup(struct xe_vm *vm, struct xe_vma_op *op)
 		spin_unlock_irq(&vm->async_ops.lock);
 	}
 	if (op->ops)
-		drm_gpuva_ops_free(&vm->mgr, op->ops);
+		drm_gpuva_ops_free(&vm->gpuvm, op->ops);
 	if (last)
 		xe_vm_put(vm);
 }
@@ -3664,7 +3664,7 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 			   is_vram ? "VRAM" : "SYS");
 	}
 
-	drm_gpuva_for_each_va(gpuva, &vm->mgr) {
+	drm_gpuvm_for_each_va(gpuva, &vm->gpuvm) {
 		struct xe_vma *vma = gpuva_to_vma(gpuva);
 		bool is_userptr = xe_vma_is_userptr(vma);
 		bool is_null = xe_vma_is_null(vma);
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index f966ed39b711..4b32ce9cf9b1 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -66,7 +66,7 @@ xe_vm_find_overlapping_vma(struct xe_vm *vm, u64 start, u64 range);
 
 static inline struct xe_vm *gpuva_to_vm(struct drm_gpuva *gpuva)
 {
-	return container_of(gpuva->mgr, struct xe_vm, mgr);
+	return container_of(gpuva->vm, struct xe_vm, gpuvm);
 }
 
 static inline struct xe_vma *gpuva_to_vma(struct drm_gpuva *gpuva)
@@ -111,7 +111,7 @@ static inline struct xe_bo *xe_vma_bo(struct xe_vma *vma)
 
 static inline struct xe_vm *xe_vma_vm(struct xe_vma *vma)
 {
-	return container_of(vma->gpuva.mgr, struct xe_vm, mgr);
+	return container_of(vma->gpuva.vm, struct xe_vm, gpuvm);
 }
 
 static inline bool xe_vma_read_only(struct xe_vma *vma)
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index d2fd99462756..0ef7d483d050 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -217,7 +217,7 @@ get_vmas(struct xe_vm *vm, int *num_vmas, u64 addr, u64 range)
 	if (!vmas)
 		return NULL;
 
-	drm_gpuva_for_each_va_range(gpuva, &vm->mgr, addr, addr + range) {
+	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, addr, addr + range) {
 		struct xe_vma *vma = gpuva_to_vma(gpuva);
 
 		if (xe_vma_is_userptr(vma))
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 1c5553b842d7..da5e6cb6f094 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -6,7 +6,7 @@
 #ifndef _XE_VM_TYPES_H_
 #define _XE_VM_TYPES_H_
 
-#include <drm/drm_gpuva_mgr.h>
+#include <drm/drm_gpuvm.h>
 
 #include <linux/dma-resv.h>
 #include <linux/kref.h>
@@ -135,8 +135,8 @@ struct xe_device;
 #define xe_vm_assert_held(vm) dma_resv_assert_held(&(vm)->resv)
 
 struct xe_vm {
-	/** @mgr: base GPUVA used to track VMAs */
-	struct drm_gpuva_manager mgr;
+	/** @gpuvm: base GPUVM used to track VMAs */
+	struct drm_gpuvm gpuvm;
 
 	struct xe_device *xe;
 
-- 
2.41.0

