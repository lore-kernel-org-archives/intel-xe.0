Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEED2C77B6F
	for <intel-xe@archiver.kernel.org>; Fri, 14 Apr 2023 10:28:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AE510E120;
	Fri, 14 Apr 2023 10:28:21 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A9E889FA7
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Apr 2023 10:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681468099; x=1713004099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=//0USDJDUbUZbZcbyPx0fDIGeZDQhDbWrpfPfJN8IGw=;
 b=FycOT0+q34zpOofa4bIqeAAPjrOlEQOA+a20TcOS2GbkKUQd1zD4M+Qc
 NhNnFyL3Y07+PxoGk0pp/YRKViUhHp38hTnbzxAp8ZF3qprbWP07ktZC4
 GbjKZtDwXOTu3NAWMWIR7wbJZOtj6W21p12ckPvwaxD7vvluV4PSB2cxl
 +Y3a3U3ddelF2aTYa1B7yk3RW8uXbEpMgpIniHAF/aQ79AGcbZCaMi0wj
 AoswMQjkUmRqKIiAvWr4dY/X6BevAtrgQ42UWDoKv5OzWazDczgIG3I7S
 c++f9fIqxqW99rxNH+tK6IbANO3ZA0wJNPaGDRbMCEGNagOqn51rkSq7Q w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="346266424"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; d="scan'208";a="346266424"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 03:28:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="754410874"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; d="scan'208";a="754410874"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 14 Apr 2023 03:28:18 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 03:28:18 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 14 Apr 2023 03:28:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 14 Apr 2023 03:28:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pu321XGFYmpo1+4bJWpQ878rNGjDINO4IQgrcsN9yuiJC6f4Cf8cgpCalYDAVlj3GNXVru0TehFwsCvMxGlCh7rP0XccLWF7BDTERjeNDNtwDpTwqm6Ljf8OlfXMKKSldoymhtfZNAWXBHfZ4euBkaKqiulujgfMRVDb2zKrwYXB93xfB9LcAGulaTvXrRuvzkfS6+YA/ZaZB2b6CIsggKa8yyGNklCgFTD8EDxR20t86B2/eAVaihSTBCRWf79sWEdhYZ2Lrmc21IYZhKLYtva3ILfO18Ti/ZR4AdLNH+epqoUFaeRIkjDI1arpY6Six+ZOKsNRaU8PkPqruRaHDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxvnn56UAoBLu1eO77VC12+ALgQKi+AQefBMAYS1utc=;
 b=ARxmCoilPS0crQ5lOGhHIZbsX5sXfTsj+qJX1MXyxtNlp+WY7fmDyZOZqQF2oDYI2wBZwLfr+eKZYgx1dzA/qAHB+0Z8pRXXm8SB9lWKbGexuT3gCQuebWURZW61AjiGxl0Zr1bjqa0gErcBVA3/h+SzPqAtFWI35h9jSoCZszNKJY7QkpdB94ibb9jyZaBHSML50BINz50mJBtUim9hr1t5d0e/I7jl5J3hytS0s/H1+eA3jSp5GJPmJk/V+rzl5CKVDi/ARD71rUxl0GE/4QmVx5vrK1j0hGKL4S3GRZ52B1v8xTOWrPG4m0lD7tj5stpem+5d5vY4ypqAs6RTHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by CO6PR11MB5601.namprd11.prod.outlook.com (2603:10b6:303:13d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 10:28:14 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::23f4:7c29:30d8:f534]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::23f4:7c29:30d8:f534%4]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 10:28:14 +0000
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 14 Apr 2023 12:27:45 +0200
Message-ID: <20230414102745.2848028-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230414102745.2848028-1-francois.dugast@intel.com>
References: <20230414102745.2848028-1-francois.dugast@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::25) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|CO6PR11MB5601:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b5ec809-e9e1-4df2-4ab6-08db3cd2f47a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h4W8afrinNKm6YodOeIw09vjxh9O/hyujN6EMA9rqipM1HrnfX6wSa+N4Ikq3o8B8jEbzBuckkYfvvY0c3DZS6lh1yhP9g3sryBy5eB+aT29ewnyVvp3hGg9DlOOJXnLvtdtFfwKUSPOT8SbcIaLKW63vvJR5M2AV9RHr0kPMgaQyYjfc6VMP7UoZN5khwhDhMRfdW5PLt91kt0hFHa1XmiN0oAWEF8ZEgfH5R5JjGB3XpqSSwhGEZhRJWKSvk3AKoVAYw7/e8qsHNals1wC3yhw/uhWO2FtXDnDRnUEL/vB9PKRMs1n5H0dn4LcZCWDkD+57RFHhfOC8cnohwl+tr0cSP9nzyOZQe6wfFg3B1abwa+tiax4nGkJ062TjSdtGeXpr/4cvvjFPh0zdpDLPgAqVvRAnElQqekWZRuzamOOACkDW2MpTIJKULgoIL8Leq5ah4rPjjEU1rkaoQsiA8Y4d9Y/8Iend71nVECaqkftGdi9Zsr0Cu9CP/Tm9SjNbp3hiKGES+uUguLOP4826lB/dAnKHflRMaMpODTyGfUV7oR0sFXavNFQ+/DoHw+m
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199021)(83380400001)(36756003)(2616005)(86362001)(6512007)(6506007)(1076003)(26005)(107886003)(6486002)(6666004)(478600001)(66476007)(66946007)(44832011)(66556008)(6916009)(4326008)(316002)(41300700001)(82960400001)(38100700002)(186003)(8936002)(8676002)(5660300002)(30864003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OZ4fUomvyKf3C44eGvPbg9xlNHbxXqcBVbMy5LGMpqZY14bGPNRTjy+EZfgM?=
 =?us-ascii?Q?3Vmzv/OFmLL9oODbJ6NHpLdNnSTmntOSHN12WZdxHo5NnWZdbDxhmeQ6JVHH?=
 =?us-ascii?Q?xrtQUsmecj815golKq25mhJAWaDTq9Lx185grs5UWfVPObihz7dUF+RShroa?=
 =?us-ascii?Q?YH5K+fk5XK+mca1J3KriD+Vn1PLIdrqXoIJTtaqzR1HjKFbmOYSNOnGzNrp+?=
 =?us-ascii?Q?ZIiNkILf4dNURxoB7uFkhnUaXx9SZwda86fQPxEV2KKIR4oTdRh6iazh4qQR?=
 =?us-ascii?Q?kHPMZ8diDwGv0VuCxBbBv22jli/P+jVANOD/jqFkXifhFHWkHZgxQIEDviW4?=
 =?us-ascii?Q?GVShVuavAaoSc6IBC7Ka5fLUzzUcB0oDoeUNQATh3b7LXbIODLf066CgzZTS?=
 =?us-ascii?Q?nTrQLSeqQBe9WGazm8n/AA5YUDQ6NtHtxiN9CQNAfVKGWzFxJvO8nrcUPy5K?=
 =?us-ascii?Q?FiNqOMympYzLqu7JTnEZ3sA8x+QG90NbSVeBlit5iVEI0KrYco3yd+qh6VU3?=
 =?us-ascii?Q?XAOrFO7VbEw0ziv6nl2Qf/IJ9tcL6r3Ng9nvcaXbgZtWwSSfOS1Tt5CVQrIl?=
 =?us-ascii?Q?taW70teexXAZsVqRARU2e5EAu8X6xd5t/GtfY8f2uwCoy5DyMG+BRLae5uXZ?=
 =?us-ascii?Q?7e+Wtk4FR1ZcqBhHRfZtQx00219Nh0yBG2ckqwHf21Ky01zxhFyy3xkw7ThJ?=
 =?us-ascii?Q?Ds8arwO0sKkIiVsdKKZPI2N8JKv1C9F+dzCpZM8iMQJB70o/wPRc0adXlTzd?=
 =?us-ascii?Q?eECwS7fMHctRKtKTazVusF6msnkCQVq3GCtQJXOv2UIECUqIq6TQqDREP6mZ?=
 =?us-ascii?Q?tXWCL959/xWQphrMGfxzep5qDV+9gFQCXpZemVg4CtQ/C//dUMpFhXHH8RSi?=
 =?us-ascii?Q?s4GsDiMRrZMvQBQXhPQ8tqBjdB4DrtJrqFvtEe3m+d0CLcjNhSMf5FTvzzeo?=
 =?us-ascii?Q?zAkIrqcPmv++bMuWaIaShNa0qObew+cFG2yhaLLJ0wsnUdTe6CMkfwu6dedn?=
 =?us-ascii?Q?1kZNQKrojyARyGsFgxQ/WvD8syL6Y2u0eT+GQypl4gnuxogOu2DZdJIrPgpz?=
 =?us-ascii?Q?myrr/m4DE6c8QCZlLnfWDj/6adP6Zjroj6ioMl/8XbmYarcy+ON3RMUiM0sK?=
 =?us-ascii?Q?9zAMp+KCDRF/T9MNtBfsplS3l8Bttv+OTGsvMdj6oUuKh83FlbskqZoJCl4w?=
 =?us-ascii?Q?Q7pdhaMPvBVa5MbgAD12voHX5G0S5TLsGJNO7j0a6Ez0sVEiviCOK8XIHE2f?=
 =?us-ascii?Q?A2BaJfSSitknvWeavXlnPbL/qALm1D4hxAfmkmjJg5JBlPP79pS30eugl4fh?=
 =?us-ascii?Q?pddjqS/wwDjeawklFTgGxjL8d0HiEc/XLkRJRF6Ti2LP/PrzP42C2B/2gRdr?=
 =?us-ascii?Q?CSkxxYOmDJgjap6f7CJS2Vp5H6z26EzDHUGZ+30DP7B30gvLf/GDjLE2EdRk?=
 =?us-ascii?Q?6Ppu8T1uU6NTN4pnxGdA25Y/kwcUlFHh6wVBTdH9h/srwrnvuXhrXtx3TGAF?=
 =?us-ascii?Q?cd73I486RqZShve8G+3XTBwFg7SH7wA8c8P9GjbXGz/IkBX7ep89IRgDGxGP?=
 =?us-ascii?Q?gF5E7u5VQvf/mC7C3mW5LmsD5cI5aXtBcwdG/1PJHP7HyY+ALWkSH/Ebj0yp?=
 =?us-ascii?Q?Yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b5ec809-e9e1-4df2-4ab6-08db3cd2f47a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 10:28:14.8089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IizkEAmd4Aj9cPa/s3oSexjFUrw+UMIGFboB9MNPlYr4iE3aAYnqLKCbvh1bgfmaGfkEaUNs1lKvFnXdD+zOyGfMwrZ5kifE8Rt/XxLqtMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5601
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC PATCH 1/1] drm/xe: switch to using drm_exec
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

Replace the use of ttm_execbuf_util helpers with the new drm_exec
helpers. They are only used when locking multiple objects.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           |  22 ++-
 drivers/gpu/drm/xe/xe_bo_types.h     |   1 -
 drivers/gpu/drm/xe/xe_exec.c         |  32 ++--
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  67 +++++----
 drivers/gpu/drm/xe/xe_vm.c           | 217 +++++++++++----------------
 drivers/gpu/drm/xe/xe_vm.h           |  19 +--
 6 files changed, 159 insertions(+), 199 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 3ab404e33fae..ff707eadb96b 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -8,6 +8,7 @@
 #include <linux/dma-buf.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_exec.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/ttm/ttm_device.h>
 #include <drm/ttm/ttm_placement.h>
@@ -1723,17 +1724,24 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
 	       int num_resv, bool intr)
 {
-	struct ttm_validate_buffer tv_bo;
-	LIST_HEAD(objs);
-	LIST_HEAD(dups);
+	struct dma_resv *obj;
+	int ret;
 
 	XE_BUG_ON(!ww);
 
-	tv_bo.num_shared = num_resv;
-	tv_bo.bo = &bo->ttm;;
-	list_add_tail(&tv_bo.head, &objs);
+	obj = bo->ttm.base.resv;
+	ww_acquire_init(ww, &reservation_ww_class);
+
+	if (intr)
+		ret = dma_resv_lock_interruptible(obj, ww);
+	else
+		ret = dma_resv_lock(obj, ww);
+
+	if (unlikely(ret))
+		return ret;
 
-	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
+	num_resv = max(num_resv, 1);
+	return dma_resv_reserve_fences(obj, num_resv);
 }
 
 void xe_bo_unlock(struct xe_bo *bo, struct ww_acquire_ctx *ww)
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 06de3330211d..2ba34a8c9b66 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -11,7 +11,6 @@
 #include <drm/drm_mm.h>
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_device.h>
-#include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/ttm/ttm_placement.h>
 
 struct xe_device;
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index ea869f2452ef..ff41fa828c1c 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -6,6 +6,7 @@
 #include "xe_exec.h"
 
 #include <drm/drm_device.h>
+#include <drm/drm_exec.h>
 #include <drm/drm_file.h>
 #include <drm/xe_drm.h>
 
@@ -91,21 +92,16 @@
  *	Unlock all
  */
 
-static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
-			 struct ttm_validate_buffer tv_onstack[],
-			 struct ttm_validate_buffer **tv,
-			 struct list_head *objs)
+static int xe_exec_begin(struct xe_engine *e, struct drm_exec *exec)
 {
 	struct xe_vm *vm = e->vm;
 	struct xe_vma *vma;
-	LIST_HEAD(dups);
 	int err;
 
-	*tv = NULL;
 	if (xe_vm_no_dma_fences(e->vm))
 		return 0;
 
-	err = xe_vm_lock_dma_resv(vm, ww, tv_onstack, tv, objs, true, 1);
+	err = xe_vm_lock_dma_resv(vm, exec, 1);
 	if (err)
 		return err;
 
@@ -120,8 +116,7 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
 
 		err = xe_bo_validate(vma->bo, vm, false);
 		if (err) {
-			xe_vm_unlock_dma_resv(vm, tv_onstack, *tv, ww, objs);
-			*tv = NULL;
+			xe_vm_unlock_dma_resv(vm);
 			return err;
 		}
 	}
@@ -129,14 +124,10 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
 	return 0;
 }
 
-static void xe_exec_end(struct xe_engine *e,
-			struct ttm_validate_buffer *tv_onstack,
-			struct ttm_validate_buffer *tv,
-			struct ww_acquire_ctx *ww,
-			struct list_head *objs)
+static void xe_exec_end(struct xe_engine *e)
 {
 	if (!xe_vm_no_dma_fences(e->vm))
-		xe_vm_unlock_dma_resv(e->vm, tv_onstack, tv, ww, objs);
+		xe_vm_unlock_dma_resv(e->vm);
 }
 
 int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
@@ -149,14 +140,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct xe_engine *engine;
 	struct xe_sync_entry *syncs = NULL;
 	u64 addresses[XE_HW_ENGINE_MAX_INSTANCE];
-	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
-	struct ttm_validate_buffer *tv = NULL;
 	u32 i, num_syncs = 0;
 	struct xe_sched_job *job;
 	struct dma_fence *rebind_fence;
 	struct xe_vm *vm;
-	struct ww_acquire_ctx ww;
-	struct list_head objs;
+	struct drm_exec exec;
 	bool write_locked;
 	int err = 0;
 
@@ -267,7 +255,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			goto err_unlock_list;
 	}
 
-	err = xe_exec_begin(engine, &ww, tv_onstack, &tv, &objs);
+	drm_exec_init(&exec, true);
+	err = xe_exec_begin(engine, &exec);
 	if (err)
 		goto err_unlock_list;
 
@@ -373,8 +362,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (err)
 		xe_sched_job_put(job);
 err_engine_end:
-	xe_exec_end(engine, tv_onstack, tv, &ww, &objs);
+	xe_exec_end(engine);
 err_unlock_list:
+	drm_exec_fini(&exec);
 	if (write_locked)
 		up_write(&vm->lock);
 	else
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 1677640e1075..ffa8119f88c5 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -8,8 +8,8 @@
 #include <linux/bitfield.h>
 #include <linux/circ_buf.h>
 
+#include <drm/drm_exec.h>
 #include <drm/drm_managed.h>
-#include <drm/ttm/ttm_execbuf_util.h>
 
 #include "xe_bo.h"
 #include "xe_gt.h"
@@ -110,10 +110,8 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	struct xe_vm *vm;
 	struct xe_vma *vma = NULL;
 	struct xe_bo *bo;
-	LIST_HEAD(objs);
-	LIST_HEAD(dups);
-	struct ttm_validate_buffer tv_bo, tv_vm;
 	struct ww_acquire_ctx ww;
+	struct drm_exec exec;
 	struct dma_fence *fence;
 	bool write_locked;
 	int ret = 0;
@@ -174,19 +172,25 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	if (only_needs_bo_lock(bo)) {
 		/* This path ensures the BO's LRU is updated */
 		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
+		if (ret)
+			goto unlock_vm;
 	} else {
-		tv_vm.num_shared = xe->info.tile_count;
-		tv_vm.bo = xe_vm_ttm_bo(vm);
-		list_add(&tv_vm.head, &objs);
-		if (bo) {
-			tv_bo.bo = &bo->ttm;
-			tv_bo.num_shared = xe->info.tile_count;
-			list_add(&tv_bo.head, &objs);
+		drm_exec_init(&exec, false);
+		drm_exec_while_not_all_locked(&exec) {
+			ret = drm_exec_prepare_obj(&exec, &xe_vm_ttm_bo(vm)->base,
+						   xe->info.tile_count);
+			drm_exec_continue_on_contention(&exec);
+			if (ret)
+				goto unlock_dma_resv;
+			if (bo) {
+				ret = drm_exec_prepare_obj(&exec, &bo->ttm.base,
+							   xe->info.tile_count);
+				drm_exec_continue_on_contention(&exec);
+				if (ret)
+					goto unlock_dma_resv;
+			}
 		}
-		ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
 	}
-	if (ret)
-		goto unlock_vm;
 
 	if (atomic) {
 		if (xe_vma_is_userptr(vma)) {
@@ -230,7 +234,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	if (only_needs_bo_lock(bo))
 		xe_bo_unlock(bo, &ww);
 	else
-		ttm_eu_backoff_reservation(&ww, &objs);
+		drm_exec_fini(&exec);
 unlock_vm:
 	if (!ret)
 		vm->usm.last_fault_vma = vma;
@@ -501,10 +505,8 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 	struct xe_vm *vm;
 	struct xe_vma *vma;
 	struct xe_bo *bo;
-	LIST_HEAD(objs);
-	LIST_HEAD(dups);
-	struct ttm_validate_buffer tv_bo, tv_vm;
 	struct ww_acquire_ctx ww;
+	struct drm_exec exec;
 	int ret = 0;
 
 	/* We only support ACC_TRIGGER at the moment */
@@ -540,25 +542,34 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 	if (only_needs_bo_lock(bo)) {
 		/* This path ensures the BO's LRU is updated */
 		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
+		if (ret)
+			goto unlock_vm;
 	} else {
-		tv_vm.num_shared = xe->info.tile_count;
-		tv_vm.bo = xe_vm_ttm_bo(vm);
-		list_add(&tv_vm.head, &objs);
-		tv_bo.bo = &bo->ttm;
-		tv_bo.num_shared = xe->info.tile_count;
-		list_add(&tv_bo.head, &objs);
-		ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
+		drm_exec_init(&exec, false);
+		drm_exec_while_not_all_locked(&exec) {
+			ret = drm_exec_prepare_obj(&exec, &xe_vm_ttm_bo(vm)->base,
+						   xe->info.tile_count);
+			drm_exec_continue_on_contention(&exec);
+			if (ret)
+				goto unlock_dma_resv;
+			if (bo) {
+				ret = drm_exec_prepare_obj(&exec, &bo->ttm.base,
+							   xe->info.tile_count);
+				drm_exec_continue_on_contention(&exec);
+				if (ret)
+					goto unlock_dma_resv;
+			}
+		}
 	}
-	if (ret)
-		goto unlock_vm;
 
 	/* Migrate to VRAM, move should invalidate the VMA first */
 	ret = xe_bo_migrate(bo, XE_PL_VRAM0 + gt->info.vram_id);
 
+unlock_dma_resv:
 	if (only_needs_bo_lock(bo))
 		xe_bo_unlock(bo, &ww);
 	else
-		ttm_eu_backoff_reservation(&ww, &objs);
+		drm_exec_fini(&exec);
 unlock_vm:
 	up_read(&vm->lock);
 	xe_vm_put(vm);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index bdf82d34eb66..be6fd30ca1ee 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -7,7 +7,7 @@
 
 #include <linux/dma-fence-array.h>
 
-#include <drm/ttm/ttm_execbuf_util.h>
+#include <drm/drm_exec.h>
 #include <drm/ttm/ttm_tt.h>
 #include <drm/xe_drm.h>
 #include <linux/kthread.h>
@@ -317,11 +317,8 @@ static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
 
 int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
 {
-	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
-	struct ttm_validate_buffer *tv;
-	struct ww_acquire_ctx ww;
-	struct list_head objs;
 	struct dma_fence *pfence;
+	struct drm_exec exec;
 	int err;
 	bool wait;
 
@@ -329,7 +326,8 @@ int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
 
 	down_write(&vm->lock);
 
-	err = xe_vm_lock_dma_resv(vm, &ww, tv_onstack, &tv, &objs, true, 1);
+	drm_exec_init(&exec, true);
+	err = xe_vm_lock_dma_resv(vm, &exec, 1);
 	if (err)
 		goto out_unlock_outer;
 
@@ -363,8 +361,9 @@ int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
 	up_read(&vm->userptr.notifier_lock);
 
 out_unlock:
-	xe_vm_unlock_dma_resv(vm, tv_onstack, tv, &ww, &objs);
+	xe_vm_unlock_dma_resv(vm);
 out_unlock_outer:
+	drm_exec_fini(&exec);
 	up_write(&vm->lock);
 
 	return err;
@@ -393,68 +392,41 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
  * xe_vm_lock_dma_resv() - Lock the vm dma_resv object and the dma_resv
  * objects of the vm's external buffer objects.
  * @vm: The vm.
- * @ww: Pointer to a struct ww_acquire_ctx locking context.
- * @tv_onstack: Array size XE_ONSTACK_TV of storage for the struct
- * ttm_validate_buffers used for locking.
- * @tv: Pointer to a pointer that on output contains the actual storage used.
- * @objs: List head for the buffer objects locked.
- * @intr: Whether to lock interruptible.
+ * @exec: Pointer to a struct drm_exec execution context.
  * @num_shared: Number of dma-fence slots to reserve in the locked objects.
  *
  * Locks the vm dma-resv objects and all the dma-resv objects of the
- * buffer objects on the vm external object list. The TTM utilities require
- * a list of struct ttm_validate_buffers pointing to the actual buffer
- * objects to lock. Storage for those struct ttm_validate_buffers should
- * be provided in @tv_onstack, and is typically reserved on the stack
- * of the caller. If the size of @tv_onstack isn't sufficient, then
- * storage will be allocated internally using kvmalloc().
+ * buffer objects on the vm external object list using helpers provided
+ * by drm_exec.
  *
  * The function performs deadlock handling internally, and after a
  * successful return the ww locking transaction should be considered
  * sealed.
  *
- * Return: 0 on success, Negative error code on error. In particular if
- * @intr is set to true, -EINTR or -ERESTARTSYS may be returned. In case
- * of error, any locking performed has been reverted.
+ * Return: 0 on success, Negative error code on error.
  */
-int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
-			struct ttm_validate_buffer *tv_onstack,
-			struct ttm_validate_buffer **tv,
-			struct list_head *objs,
-			bool intr,
+int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec,
 			unsigned int num_shared)
 {
-	struct ttm_validate_buffer *tv_vm, *tv_bo;
 	struct xe_vma *vma, *next;
-	LIST_HEAD(dups);
+	struct drm_gem_object *obj;
 	int err;
 
 	lockdep_assert_held(&vm->lock);
 
-	if (vm->extobj.entries < XE_ONSTACK_TV) {
-		tv_vm = tv_onstack;
-	} else {
-		tv_vm = kvmalloc_array(vm->extobj.entries + 1, sizeof(*tv_vm),
-				       GFP_KERNEL);
-		if (!tv_vm)
-			return -ENOMEM;
+	drm_exec_while_not_all_locked(exec) {
+		err = drm_exec_prepare_obj(exec, &xe_vm_ttm_bo(vm)->base, num_shared);
+		drm_exec_break_on_contention(exec);
+		if (unlikely(err) && err != -EALREADY)
+			goto error;
+		list_for_each_entry(vma, &vm->extobj.list, extobj.link) {
+			obj = &vma->bo->ttm.base;
+			err = drm_exec_prepare_obj(exec, obj, num_shared);
+			drm_exec_break_on_contention(exec);
+			if (unlikely(err) && err != -EALREADY)
+				goto error;
+		}
 	}
-	tv_bo = tv_vm + 1;
-
-	INIT_LIST_HEAD(objs);
-	list_for_each_entry(vma, &vm->extobj.list, extobj.link) {
-		tv_bo->num_shared = num_shared;
-		tv_bo->bo = &vma->bo->ttm;
-
-		list_add_tail(&tv_bo->head, objs);
-		tv_bo++;
-	}
-	tv_vm->num_shared = num_shared;
-	tv_vm->bo = xe_vm_ttm_bo(vm);
-	list_add_tail(&tv_vm->head, objs);
-	err = ttm_eu_reserve_buffers(ww, objs, intr, &dups);
-	if (err)
-		goto out_err;
 
 	spin_lock(&vm->notifier.list_lock);
 	list_for_each_entry_safe(vma, next, &vm->notifier.rebind_list,
@@ -466,14 +438,9 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
 			list_move_tail(&vma->rebind_link, &vm->rebind_list);
 	}
 	spin_unlock(&vm->notifier.list_lock);
-
-	*tv = tv_vm;
 	return 0;
 
-out_err:
-	if (tv_vm != tv_onstack)
-		kvfree(tv_vm);
-
+error:
 	return err;
 }
 
@@ -481,19 +448,11 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
  * xe_vm_unlock_dma_resv() - Unlock reservation objects locked by
  * xe_vm_lock_dma_resv()
  * @vm: The vm.
- * @tv_onstack: The @tv_onstack array given to xe_vm_lock_dma_resv().
- * @tv: The value of *@tv given by xe_vm_lock_dma_resv().
- * @ww: The ww_acquire_context used for locking.
- * @objs: The list returned from xe_vm_lock_dma_resv().
  *
  * Unlocks the reservation objects and frees any memory allocated by
  * xe_vm_lock_dma_resv().
  */
-void xe_vm_unlock_dma_resv(struct xe_vm *vm,
-			   struct ttm_validate_buffer *tv_onstack,
-			   struct ttm_validate_buffer *tv,
-			   struct ww_acquire_ctx *ww,
-			   struct list_head *objs)
+void xe_vm_unlock_dma_resv(struct xe_vm *vm)
 {
 	/*
 	 * Nothing should've been able to enter the list while we were locked,
@@ -502,21 +461,14 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
 	 * addition, and we shouldn't add ourselves.
 	 */
 	XE_WARN_ON(!list_empty(&vm->notifier.rebind_list));
-
-	ttm_eu_backoff_reservation(ww, objs);
-	if (tv && tv != tv_onstack)
-		kvfree(tv);
 }
 
 static void preempt_rebind_work_func(struct work_struct *w)
 {
 	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
 	struct xe_vma *vma;
-	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
-	struct ttm_validate_buffer *tv;
-	struct ww_acquire_ctx ww;
-	struct list_head objs;
 	struct dma_fence *rebind_fence;
+	struct drm_exec exec;
 	unsigned int fence_count = 0;
 	LIST_HEAD(preempt_fences);
 	int err;
@@ -556,8 +508,8 @@ static void preempt_rebind_work_func(struct work_struct *w)
 			goto out_unlock_outer;
 	}
 
-	err = xe_vm_lock_dma_resv(vm, &ww, tv_onstack, &tv, &objs,
-				  false, vm->preempt.num_engines);
+	drm_exec_init(&exec, false);
+	err = xe_vm_lock_dma_resv(vm, &exec, vm->preempt.num_engines);
 	if (err)
 		goto out_unlock_outer;
 
@@ -631,8 +583,9 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	up_read(&vm->userptr.notifier_lock);
 
 out_unlock:
-	xe_vm_unlock_dma_resv(vm, tv_onstack, tv, &ww, &objs);
+	xe_vm_unlock_dma_resv(vm);
 out_unlock_outer:
+	drm_exec_fini(&exec);
 	if (err == -EAGAIN) {
 		trace_xe_vm_rebind_worker_retry(vm);
 		goto retry;
@@ -979,27 +932,28 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 
 static void xe_vma_destroy_unlocked(struct xe_vma *vma)
 {
-	struct ttm_validate_buffer tv[2];
-	struct ww_acquire_ctx ww;
+	struct drm_exec exec;
+	struct drm_gem_object *obj;
 	struct xe_bo *bo = vma->bo;
-	LIST_HEAD(objs);
-	LIST_HEAD(dups);
 	int err;
 
-	memset(tv, 0, sizeof(tv));
-	tv[0].bo = xe_vm_ttm_bo(vma->vm);
-	list_add(&tv[0].head, &objs);
-
-	if (bo) {
-		tv[1].bo = &xe_bo_get(bo)->ttm;
-		list_add(&tv[1].head, &objs);
+	if (bo)
+		obj = &xe_bo_get(bo)->ttm.base;
+	drm_exec_init(&exec, false);
+	drm_exec_while_not_all_locked(&exec) {
+		err = drm_exec_prepare_obj(&exec, &xe_vm_ttm_bo(vma->vm)->base, 1);
+		drm_exec_continue_on_contention(&exec);
+		XE_WARN_ON(err);
+		if (obj) {
+			err = drm_exec_prepare_obj(&exec, obj, 1);
+			drm_exec_continue_on_contention(&exec);
+			XE_WARN_ON(err);
+		}
 	}
-	err = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
-	XE_WARN_ON(err);
 
 	xe_vma_destroy(vma, NULL);
 
-	ttm_eu_backoff_reservation(&ww, &objs);
+	drm_exec_fini(&exec);
 	if (bo)
 		xe_bo_put(bo);
 }
@@ -2008,12 +1962,6 @@ struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm)
 	return &vm->pt_root[idx]->bo->ttm;
 }
 
-static void xe_vm_tv_populate(struct xe_vm *vm, struct ttm_validate_buffer *tv)
-{
-	tv->num_shared = 1;
-	tv->bo = xe_vm_ttm_bo(vm);
-}
-
 static bool is_map_op(u32 op)
 {
 	return VM_BIND_OP(op) == XE_VM_BIND_OP_MAP ||
@@ -2032,11 +1980,9 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
 			 struct xe_sync_entry *syncs, u32 num_syncs,
 			 struct async_op_fence *afence)
 {
-	LIST_HEAD(objs);
-	LIST_HEAD(dups);
-	struct ttm_validate_buffer tv_bo, tv_vm;
-	struct ww_acquire_ctx ww;
 	struct xe_bo *vbo;
+	struct drm_exec exec;
+	struct ttm_buffer_object *obj;
 	int err, i;
 
 	lockdep_assert_held(&vm->lock);
@@ -2053,8 +1999,6 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
 		return 0;
 	}
 
-	xe_vm_tv_populate(vm, &tv_vm);
-	list_add_tail(&tv_vm.head, &objs);
 	vbo = vma->bo;
 	if (vbo) {
 		/*
@@ -2063,29 +2007,41 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
 		 * take a reference here.
 		 */
 		xe_bo_get(vbo);
-
-		tv_bo.bo = &vbo->ttm;
-		tv_bo.num_shared = 1;
-		list_add(&tv_bo.head, &objs);
 	}
+	obj = xe_vm_ttm_bo(vm);
 
 again:
-	err = ttm_eu_reserve_buffers(&ww, &objs, true, &dups);
-	if (!err) {
-		err = __vm_bind_ioctl(vm, vma, e, bo,
-				      bind_op->op, bind_op->region, syncs,
-				      num_syncs, afence);
-		ttm_eu_backoff_reservation(&ww, &objs);
-		if (err == -EAGAIN && xe_vma_is_userptr(vma)) {
-			lockdep_assert_held_write(&vm->lock);
-			err = xe_vma_userptr_pin_pages(vma);
-			if (!err)
-				goto again;
-		}
+	drm_exec_init(&exec, true);
+	drm_exec_while_not_all_locked(&exec) {
+		if (vbo) {
+			err = drm_exec_prepare_obj(&exec, &vbo->ttm.base, 1);
+			drm_exec_continue_on_contention(&exec);
+			if (unlikely(err))
+				goto error;
+		}
+		err = drm_exec_prepare_obj(&exec, &obj->base, 1);
+		drm_exec_break_on_contention(&exec);
+		if (err && err != -EALREADY)
+			goto error;
+	}
+	err = __vm_bind_ioctl(vm, vma, e, bo,
+			      bind_op->op, bind_op->region, syncs,
+			      num_syncs, afence);
+	drm_exec_fini(&exec);
+	if (err == -EAGAIN && xe_vma_is_userptr(vma)) {
+		lockdep_assert_held_write(&vm->lock);
+		err = xe_vma_userptr_pin_pages(vma);
+		if (!err)
+			goto again;
 	}
 	xe_bo_put(vbo);
 
 	return err;
+
+error:
+	drm_exec_fini(&exec);
+	xe_bo_put(vbo);
+	return err;
 }
 
 struct async_op {
@@ -3291,17 +3247,24 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
 	       int num_resv, bool intr)
 {
-	struct ttm_validate_buffer tv_vm;
-	LIST_HEAD(objs);
-	LIST_HEAD(dups);
+	struct dma_resv *obj;
+	int ret;
 
 	XE_BUG_ON(!ww);
 
-	tv_vm.num_shared = num_resv;
-	tv_vm.bo = xe_vm_ttm_bo(vm);;
-	list_add_tail(&tv_vm.head, &objs);
+	obj = xe_vm_ttm_bo(vm)->base.resv;
+	ww_acquire_init(ww, &reservation_ww_class);
+
+	if (intr)
+		ret = dma_resv_lock_interruptible(obj, ww);
+	else
+		ret = dma_resv_lock(obj, ww);
+
+	if (unlikely(ret))
+		return ret;
 
-	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
+	num_resv = max(num_resv, 1);
+	return dma_resv_reserve_fences(obj, num_resv);
 }
 
 void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww)
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 748dc16ebed9..3fdcef3793e5 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -6,6 +6,8 @@
 #ifndef _XE_VM_H_
 #define _XE_VM_H_
 
+#include <drm/drm_exec.h>
+
 #include "xe_macros.h"
 #include "xe_map.h"
 #include "xe_vm_types.h"
@@ -124,23 +126,10 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma);
 
 int xe_vma_userptr_check_repin(struct xe_vma *vma);
 
-/*
- * XE_ONSTACK_TV is used to size the tv_onstack array that is input
- * to xe_vm_lock_dma_resv() and xe_vm_unlock_dma_resv().
- */
-#define XE_ONSTACK_TV 20
-int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
-			struct ttm_validate_buffer *tv_onstack,
-			struct ttm_validate_buffer **tv,
-			struct list_head *objs,
-			bool intr,
+int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec,
 			unsigned int num_shared);
 
-void xe_vm_unlock_dma_resv(struct xe_vm *vm,
-			   struct ttm_validate_buffer *tv_onstack,
-			   struct ttm_validate_buffer *tv,
-			   struct ww_acquire_ctx *ww,
-			   struct list_head *objs);
+void xe_vm_unlock_dma_resv(struct xe_vm *vm);
 
 void xe_vm_fence_all_extobjs(struct xe_vm *vm, struct dma_fence *fence,
 			     enum dma_resv_usage usage);
-- 
2.25.1

