Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27886C77B73
	for <intel-xe@archiver.kernel.org>; Mon,  1 May 2023 19:03:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E083E10E450;
	Mon,  1 May 2023 19:03:34 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F6210E2E4
 for <intel-xe@lists.freedesktop.org>; Mon,  1 May 2023 19:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682967811; x=1714503811;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=gqqr4oOkVTr5WnKrkX7MekYG1Zk69yEFBl+q5buGfWM=;
 b=iltQ+F7HFZZ7WjbpAejJG8lBjpOfVCdMa9jYgPIpbcAa34s/KL2X1Qme
 ISOOdPLxQT4Xji6stgyiUG3swiPwDe3SNGgNgiZnDBg0+4isNY/7b7ciZ
 qNKzTUlbiGtTvKKdT29pu3uj8QRTv6fFU8km+PeQjtpO5sU7v97Hk6bZ+
 2Y/b/Ywcuk0ig3eUfSw3eNPnSS0Rl2Dy5PzBhYhHLKhpEGeixtYldOJx1
 ovwTaSWDCKfdqBfHbp6cx4Avsy6uDVBNw7xzzeijnU6jQmMiMdiDsQJGV
 s0PWQcW/r7q8U79lXa9Zp/GUi13mdvaszoeIsIulChWaVcfp8EKYCRLPH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="376265995"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="376265995"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 12:03:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="695882960"
X-IronPort-AV: E=Sophos;i="5.99,242,1677571200"; d="scan'208";a="695882960"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 01 May 2023 12:03:30 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 1 May 2023 12:03:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 1 May 2023 12:03:29 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 1 May 2023 12:03:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4T42JRcqfQjb0NzWVQflStP/X7tj3v5Irb33LqJjVlB2dHBfKWfgYWdkSAp5GKgEBUCZpiHarkV0vP89c2FYYbTljusY746wR8w32HFkqiGNUCmse7U/6IO+vWgo+lall5qz3D7Mcs7CTFrfHkgugWIuK1N5fFncurzBcY3ea9GTM4IOcsYb+jRNdkyOuqfUQGJm5ZlvYr7wMAF4YNnVxOULkj2umexKGniWZWEoMsiqw+QlN+Rmv72N5gJlk70hfKWmLtZiD+hG4e+SmwXnAcEuZeJOPySwuSvsne9mb6ToxSh49O0yh6wouRofcCbpySzAQZrIz+H8qlqbJHErA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9E2AYffqIwIPgv2FGMy7q5Fdh+j5OilNZUaBNm+L/Ho=;
 b=fsRor2Y2XyOR2OCbv5LlOMR6FDi21kmshrS3DqXMhNcyHFzetJaLFbhJJJoY0OEgQjqaOnf9rjeOd86VS8RLYAAjNTwqxmZwFE9KDARWDRqPI/oQZGA/N4wa/vLtpqzMWhOxqkChz4EonpEGBO5wpfcJ/+xGAK8LYxKkTPdj273i75bHdZ/Fyb+3aXXAONMCPr8M9NUim7mTPvbE6Jd/BuSd2se0NysKRktR3xqCTi2nRKAPUBmRjojrniuZ0q4QJ1mUR58P96a9uVi2ATdQl9mjIxMj14jOh4ra2JF6t9DQ7kx2t9TETs5MkcX38XMQiTmUydtlDsSdYIrRKQPFyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB7094.namprd11.prod.outlook.com (2603:10b6:510:216::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 19:03:27 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6340.030; Mon, 1 May 2023
 19:03:27 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 1 May 2023 15:03:14 -0400
Message-ID: <20230501190314.609261-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501190314.609261-1-rodrigo.vivi@intel.com>
References: <20230501190314.609261-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0129.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: bcc09239-1941-48fd-efb2-08db4a76bee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rne/B5M+/qojgNH/nqNv1lEEKO/H7CgJLJg1T/Kc8C3ExK7TTJmLUsh/MnPtxiIJ83jmk4Vb/MgubgoHJQKBZPUvQom7Dvpjju+P6yra0M7CTK0NGqYeNlrPvhC0F9yQVEtsxRJH0sDlSH+5AkGuF5h0vrXcv1tg24VqzjYVNWTFLjDSUMWdq6s6FIbNzUVUzJ6dmFyt9zVxVLi/TMpJxQU8nLecHLj/WcwG+TRz0AL1kyZnpqlSlZtxygKQc05JSunc8w1xlEw7uKq2Y4WStPLmwNTPsN6+1Hwt5lpoOzZ2ApXcuAjwSvtViKm9LPFrk9PFPZXZLwEFmZI1g2QIpPtMHFuWAfv328eudHAprYUIlf7njr9FqgCdvQUBCyJ45CTWC0O/3amaDWWbZ4a69WAr8FIjxPdJKrkb/gA50RgCx3n6MkMUSODhbFiBQrhxykThj6q7EvwiksWT2flCRdokZxElO6RsNKwYelVxG5v2CSBGo4ARgx6YIG1PR/LnH5Wk/Ijv5yDYKM9TtipPRhn8ZNpsJulmcLc+3xj0EkoGCXbG0h2JG24mvAYPjSl+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199021)(83380400001)(38100700002)(41300700001)(8676002)(2616005)(8936002)(82960400001)(316002)(36756003)(186003)(66556008)(66476007)(66946007)(6916009)(5660300002)(4326008)(1076003)(26005)(6512007)(6506007)(478600001)(86362001)(107886003)(44832011)(2906002)(30864003)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pDSagPog3yaR/BvwqRmlOEQ8NW7Acop3xX9irHlZxudQJD/eUbyVZcLWQXr7?=
 =?us-ascii?Q?rywfROj5vhX2hAjYM0wARASWDhYcbVKI0WI0JDVL2saTi888AFqkem9fcmi3?=
 =?us-ascii?Q?LOu6xOYHhgH+QCVitgRrY9iS7psGufMg2OF6pZftPZrzoj5OcvMnSedaGDrN?=
 =?us-ascii?Q?tL7eb9D84Rw5x4sAacA8cHXv7kuG0XNYt0QYTK9O//T6rBJZKsA3zsoz9vKr?=
 =?us-ascii?Q?SwYKFcZJTnJh00YsUer6iWErG8Eu9CXnIZef/+BW9CsaEq8LxApoI1oni25D?=
 =?us-ascii?Q?L/FiMnHbRmNHdmLowRC2lW6i3sOSK3kEH67qcI0rGHytT8qtcdcEfX4NriX/?=
 =?us-ascii?Q?VoyuTU1cBe0gXUtGRezI+Cq5qUh5mf1Gw843/l/kuv4ipAD87bqjK7mV0LD4?=
 =?us-ascii?Q?q9mRuzyrfBDB2sTEMyH6JmZrU7GoNtmHSXMDAbo0SsXlpu3mDPKdUCi8/uyF?=
 =?us-ascii?Q?W1v4nQ+iGvmO1+LoJGPqac1dFLLuUNe7ZZbzzK1psqlMtIZTOwBEfdOAbUSj?=
 =?us-ascii?Q?26FJYd8K7icPMOyJ6ktRvjLagEH0kISf87rgH8pafyMrtH+ujXNDdWfSaMoi?=
 =?us-ascii?Q?lNF/5LtfPloQDNUVC+UKl1iZ8xdPh9PLQV9JWKFgViyHNrhlwGLeLJ8/+0Fr?=
 =?us-ascii?Q?XIqFJsOezQj7adCuCK9c0WrfxdGsBoebWCUdwc+iKu6GIpQTVIJKesp5CMXQ?=
 =?us-ascii?Q?/ywRCMD6dBmg7qLd0m0/H7ZC+jQmXABx+c7cTN6aK2mCLknKkbA3Y6MskSED?=
 =?us-ascii?Q?sodzKD8skjhLadig/e5jANlby6XycRdE2/yZh+35dpC5x/5x7g3VQ7f4WFNn?=
 =?us-ascii?Q?ddITDIgRnjrszdPsS+nYfdd2CiEYpyFbOkoD0Gaj2PQRtvgVVvSrd+oNp22C?=
 =?us-ascii?Q?FT/jA5XGoZtYgRgppha8FCSTjDAlrFwMDTJ4oiOEI7BLM8tIGemjSciKq3a5?=
 =?us-ascii?Q?hFoM/6mt8n8r7aSDqHNIJkbgZY29fuIS5WZwF3ZmTQNbtEtb+p4KNgXLu0sH?=
 =?us-ascii?Q?mceRopkGBC5+YSDXSpVsD5cQJuA1wcvkM73KXbqxQNDW5yAsw5/xoYb0GUXJ?=
 =?us-ascii?Q?OrtFCLNBNL7seDmHFf+5X1cFvLdr//sPw2bYLRJ/+h+CIRnt9xdwZ6xOVthQ?=
 =?us-ascii?Q?JnZhesJxRfraTQ+Ey6J2fJZUtavauQ/uHEaYpFO5G9MzrVbKEO6h4Ogfc/Oz?=
 =?us-ascii?Q?WWB5tyS32eQFpFmPNNFAkxFRxh3ni0AYKkbRYaEBNBfJnZrzpYd2M9uZSAwl?=
 =?us-ascii?Q?wHEyJHBKzrE77VVBAecs9kl4LJL2OEnQbn5xBwyKP/pqzVnSSnJJQwl8G7ox?=
 =?us-ascii?Q?3rjW9k/iEZjCkbMGht+bQ3HEea7BBSukTKoTVvBvTosucOA8orq3lI08uHz8?=
 =?us-ascii?Q?XhDiy3Ne84sa7meA3WKspQ9A42MtK7egkh6nFCoime9hTgR+59q1EluU/Xm6?=
 =?us-ascii?Q?Ptz15J3Jgjb+UT+eKmK+/6v+wh0+cuNiqwZ+nRY2mk3SSMRzYqHKditAy+lL?=
 =?us-ascii?Q?upVZmStwA5GQhL38l6krz+YxvJpz2ieQWSrWKJp9+Xqre4esVbCATFHJVozg?=
 =?us-ascii?Q?lCcCS/sw0mbk+4xD/W5rQk9B11ffgMZo4fTVuJmE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc09239-1941-48fd-efb2-08db4a76bee0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 19:03:27.4297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xKxknR3ErmbYIW6qUCDdN7JdIzOm7lM6AbYkOhOjZMx2JDGnAtZUiVnpa8r7BkvoyqVOOvW/OxkoGWzOzn2slQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7094
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 2/2] fixup! drm/xe: Introduce a new DRM driver
 for Intel GPUs
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

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Makefile      |   1 +
 drivers/gpu/drm/xe/xe_pt.c       | 110 +++++++++++++++----------------
 drivers/gpu/drm/xe/xe_pt_types.h |   4 +-
 3 files changed, 56 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 74a84080f242..b84e191ba14f 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -73,6 +73,7 @@ xe-y += xe_bb.o \
 	xe_pm.o \
 	xe_preempt_fence.o \
 	xe_pt.o \
+	xe_pt_walk.o \
 	xe_query.o \
 	xe_reg_sr.o \
 	xe_reg_whitelist.o \
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 4ee5ea2cabc9..f15282996c3b 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -5,14 +5,13 @@
 
 #include "xe_pt.h"
 
-#include <drm/drm_pt_walk.h>
-
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_gt.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_migrate.h"
 #include "xe_pt_types.h"
+#include "xe_pt_walk.h"
 #include "xe_res_cursor.h"
 #include "xe_trace.h"
 #include "xe_ttm_stolen_mgr.h"
@@ -20,8 +19,8 @@
 
 struct xe_pt_dir {
 	struct xe_pt pt;
-	/** @dir: Directory structure for the drm_pt_walk functionality */
-	struct drm_pt_dir dir;
+	/** @dir: Directory structure for the xe_pt_walk functionality */
+	struct xe_ptw_dir dir;
 };
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
@@ -44,7 +43,7 @@ static struct xe_pt_dir *as_xe_pt_dir(struct xe_pt *pt)
 
 static struct xe_pt *xe_pt_entry(struct xe_pt_dir *pt_dir, unsigned int index)
 {
-	return container_of(pt_dir->dir.entries[index], struct xe_pt, drm);
+	return container_of(pt_dir->dir.entries[index], struct xe_pt, base);
 }
 
 /**
@@ -211,7 +210,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_gt *gt,
 	int err;
 
 	size = !level ?  sizeof(struct xe_pt) : sizeof(struct xe_pt_dir) +
-		XE_PDES * sizeof(struct drm_pt *);
+		XE_PDES * sizeof(struct xe_ptw *);
 	pt = kzalloc(size, GFP_KERNEL);
 	if (!pt)
 		return ERR_PTR(-ENOMEM);
@@ -227,7 +226,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_gt *gt,
 	}
 	pt->bo = bo;
 	pt->level = level;
-	pt->drm.dir = level ? &as_xe_pt_dir(pt)->dir : NULL;
+	pt->base.dir = level ? &as_xe_pt_dir(pt)->dir : NULL;
 
 	XE_BUG_ON(level > XE_VM_MAX_LEVEL);
 
@@ -404,8 +403,8 @@ struct xe_pt_update {
 };
 
 struct xe_pt_stage_bind_walk {
-	/** drm: The base class. */
-	struct drm_pt_walk drm;
+	/** base: The base class. */
+	struct xe_pt_walk base;
 
 	/* Input parameters for the walk */
 	/** @vm: The vm we're building for. */
@@ -532,7 +531,7 @@ xe_pt_insert_entry(struct xe_pt_stage_bind_walk *xe_walk, struct xe_pt *parent,
 		struct iosys_map *map = &parent->bo->vmap;
 
 		if (unlikely(xe_child))
-			parent->drm.dir->entries[offset] = &xe_child->drm;
+			parent->base.dir->entries[offset] = &xe_child->base;
 
 		xe_pt_write(xe_walk->vm->xe, map, offset, pte);
 		parent->num_live++;
@@ -556,7 +555,7 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
 	u64 size, dma;
 
 	/* Does the virtual range requested cover a huge pte? */
-	if (!drm_pt_covers(addr, next, level, &xe_walk->drm))
+	if (!xe_pt_covers(addr, next, level, &xe_walk->base))
 		return false;
 
 	/* Does the DMA segment cover the whole pte? */
@@ -618,15 +617,15 @@ xe_pt_is_pte_ps64K(u64 addr, u64 next, struct xe_pt_stage_bind_walk *xe_walk)
 }
 
 static int
-xe_pt_stage_bind_entry(struct drm_pt *parent, pgoff_t offset,
+xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 		       unsigned int level, u64 addr, u64 next,
-		       struct drm_pt **child,
+		       struct xe_ptw **child,
 		       enum page_walk_action *action,
-		       struct drm_pt_walk *walk)
+		       struct xe_pt_walk *walk)
 {
 	struct xe_pt_stage_bind_walk *xe_walk =
-		container_of(walk, typeof(*xe_walk), drm);
-	struct xe_pt *xe_parent = container_of(parent, typeof(*xe_parent), drm);
+		container_of(walk, typeof(*xe_walk), base);
+	struct xe_pt *xe_parent = container_of(parent, typeof(*xe_parent), base);
 	struct xe_pt *xe_child;
 	bool covers;
 	int ret = 0;
@@ -675,7 +674,7 @@ xe_pt_stage_bind_entry(struct drm_pt *parent, pgoff_t offset,
 		xe_walk->l0_end_addr = next;
 	}
 
-	covers = drm_pt_covers(addr, next, level, &xe_walk->drm);
+	covers = xe_pt_covers(addr, next, level, &xe_walk->base);
 	if (covers || !*child) {
 		u64 flags = 0;
 
@@ -689,7 +688,7 @@ xe_pt_stage_bind_entry(struct drm_pt *parent, pgoff_t offset,
 		if (!covers)
 			xe_pt_populate_empty(xe_walk->gt, xe_walk->vm, xe_child);
 
-		*child = &xe_child->drm;
+		*child = &xe_child->base;
 
 		/*
 		 * Prefer the compact pagetable layout for L0 if possible.
@@ -712,7 +711,7 @@ xe_pt_stage_bind_entry(struct drm_pt *parent, pgoff_t offset,
 	return ret;
 }
 
-static const struct drm_pt_walk_ops xe_pt_stage_bind_ops = {
+static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
 	.pt_entry = xe_pt_stage_bind_entry,
 };
 
@@ -742,7 +741,7 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
 	bool is_vram = !xe_vma_is_userptr(vma) && bo && xe_bo_is_vram(bo);
 	struct xe_res_cursor curs;
 	struct xe_pt_stage_bind_walk xe_walk = {
-		.drm = {
+		.base = {
 			.ops = &xe_pt_stage_bind_ops,
 			.shifts = xe_normal_pt_shifts,
 			.max_level = XE_PT_HIGHEST_LEVEL,
@@ -787,8 +786,8 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
 		xe_res_first_sg(xe_bo_get_sg(bo), vma->bo_offset,
 				vma->end - vma->start + 1, &curs);
 
-	ret = drm_pt_walk_range(&pt->drm, pt->level, vma->start, vma->end + 1,
-				&xe_walk.drm);
+	ret = xe_pt_walk_range(&pt->base, pt->level, vma->start, vma->end + 1,
+				&xe_walk.base);
 
 	*num_entries = xe_walk.wupd.num_used_entries;
 	return ret;
@@ -814,20 +813,17 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
  * be shared page tables also at lower levels, so it adjusts the walk action
  * accordingly.
  *
- * Note that the function is not device-specific so could be made a drm
- * pagewalk helper.
- *
  * Return: true if there were non-shared entries, false otherwise.
  */
 static bool xe_pt_nonshared_offsets(u64 addr, u64 end, unsigned int level,
-				    struct drm_pt_walk *walk,
+				    struct xe_pt_walk *walk,
 				    enum page_walk_action *action,
 				    pgoff_t *offset, pgoff_t *end_offset)
 {
 	u64 size = 1ull << walk->shifts[level];
 
-	*offset = drm_pt_offset(addr, level, walk);
-	*end_offset = drm_pt_num_entries(addr, end, level, walk) + *offset;
+	*offset = xe_pt_offset(addr, level, walk);
+	*end_offset = xe_pt_num_entries(addr, end, level, walk) + *offset;
 
 	if (!level)
 		return true;
@@ -851,8 +847,8 @@ static bool xe_pt_nonshared_offsets(u64 addr, u64 end, unsigned int level,
 }
 
 struct xe_pt_zap_ptes_walk {
-	/** @drm: The walk base-class */
-	struct drm_pt_walk drm;
+	/** @base: The walk base-class */
+	struct xe_pt_walk base;
 
 	/* Input parameters for the walk */
 	/** @gt: The gt we're building for */
@@ -863,15 +859,15 @@ struct xe_pt_zap_ptes_walk {
 	bool needs_invalidate;
 };
 
-static int xe_pt_zap_ptes_entry(struct drm_pt *parent, pgoff_t offset,
+static int xe_pt_zap_ptes_entry(struct xe_ptw *parent, pgoff_t offset,
 				unsigned int level, u64 addr, u64 next,
-				struct drm_pt **child,
+				struct xe_ptw **child,
 				enum page_walk_action *action,
-				struct drm_pt_walk *walk)
+				struct xe_pt_walk *walk)
 {
 	struct xe_pt_zap_ptes_walk *xe_walk =
-		container_of(walk, typeof(*xe_walk), drm);
-	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), drm);
+		container_of(walk, typeof(*xe_walk), base);
+	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), base);
 	pgoff_t end_offset;
 
 	XE_BUG_ON(!*child);
@@ -893,7 +889,7 @@ static int xe_pt_zap_ptes_entry(struct drm_pt *parent, pgoff_t offset,
 	return 0;
 }
 
-static const struct drm_pt_walk_ops xe_pt_zap_ptes_ops = {
+static const struct xe_pt_walk_ops xe_pt_zap_ptes_ops = {
 	.pt_entry = xe_pt_zap_ptes_entry,
 };
 
@@ -916,7 +912,7 @@ static const struct drm_pt_walk_ops xe_pt_zap_ptes_ops = {
 bool xe_pt_zap_ptes(struct xe_gt *gt, struct xe_vma *vma)
 {
 	struct xe_pt_zap_ptes_walk xe_walk = {
-		.drm = {
+		.base = {
 			.ops = &xe_pt_zap_ptes_ops,
 			.shifts = xe_normal_pt_shifts,
 			.max_level = XE_PT_HIGHEST_LEVEL,
@@ -928,8 +924,8 @@ bool xe_pt_zap_ptes(struct xe_gt *gt, struct xe_vma *vma)
 	if (!(vma->gt_present & BIT(gt->info.id)))
 		return false;
 
-	(void)drm_pt_walk_shared(&pt->drm, pt->level, vma->start, vma->end + 1,
-				 &xe_walk.drm);
+	(void)xe_pt_walk_shared(&pt->base, pt->level, vma->start, vma->end + 1,
+				 &xe_walk.base);
 
 	return xe_walk.needs_invalidate;
 }
@@ -1015,7 +1011,7 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
 				xe_pt_destroy(xe_pt_entry(pt_dir, j_),
 					      vma->vm->flags, deferred);
 
-			pt_dir->dir.entries[j_] = &newpte->drm;
+			pt_dir->dir.entries[j_] = &newpte->base;
 		}
 		kfree(entries[i].pt_entries);
 	}
@@ -1375,8 +1371,8 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 }
 
 struct xe_pt_stage_unbind_walk {
-	/** @drm: The pagewalk base-class. */
-	struct drm_pt_walk drm;
+	/** @base: The pagewalk base-class. */
+	struct xe_pt_walk base;
 
 	/* Input parameters for the walk */
 	/** @gt: The gt we're unbinding from. */
@@ -1404,10 +1400,10 @@ struct xe_pt_stage_unbind_walk {
 static bool xe_pt_check_kill(u64 addr, u64 next, unsigned int level,
 			     const struct xe_pt *child,
 			     enum page_walk_action *action,
-			     struct drm_pt_walk *walk)
+			     struct xe_pt_walk *walk)
 {
 	struct xe_pt_stage_unbind_walk *xe_walk =
-		container_of(walk, typeof(*xe_walk), drm);
+		container_of(walk, typeof(*xe_walk), base);
 	unsigned int shift = walk->shifts[level];
 	u64 size = 1ull << shift;
 
@@ -1428,13 +1424,13 @@ static bool xe_pt_check_kill(u64 addr, u64 next, unsigned int level,
 	return false;
 }
 
-static int xe_pt_stage_unbind_entry(struct drm_pt *parent, pgoff_t offset,
+static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
 				    unsigned int level, u64 addr, u64 next,
-				    struct drm_pt **child,
+				    struct xe_ptw **child,
 				    enum page_walk_action *action,
-				    struct drm_pt_walk *walk)
+				    struct xe_pt_walk *walk)
 {
-	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), drm);
+	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), base);
 
 	XE_BUG_ON(!*child);
 	XE_BUG_ON(!level && xe_child->is_compact);
@@ -1445,15 +1441,15 @@ static int xe_pt_stage_unbind_entry(struct drm_pt *parent, pgoff_t offset,
 }
 
 static int
-xe_pt_stage_unbind_post_descend(struct drm_pt *parent, pgoff_t offset,
+xe_pt_stage_unbind_post_descend(struct xe_ptw *parent, pgoff_t offset,
 				unsigned int level, u64 addr, u64 next,
-				struct drm_pt **child,
+				struct xe_ptw **child,
 				enum page_walk_action *action,
-				struct drm_pt_walk *walk)
+				struct xe_pt_walk *walk)
 {
 	struct xe_pt_stage_unbind_walk *xe_walk =
-		container_of(walk, typeof(*xe_walk), drm);
-	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), drm);
+		container_of(walk, typeof(*xe_walk), base);
+	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), base);
 	pgoff_t end_offset;
 	u64 size = 1ull << walk->shifts[--level];
 
@@ -1477,7 +1473,7 @@ xe_pt_stage_unbind_post_descend(struct drm_pt *parent, pgoff_t offset,
 	return 0;
 }
 
-static const struct drm_pt_walk_ops xe_pt_stage_unbind_ops = {
+static const struct xe_pt_walk_ops xe_pt_stage_unbind_ops = {
 	.pt_entry = xe_pt_stage_unbind_entry,
 	.pt_post_descend = xe_pt_stage_unbind_post_descend,
 };
@@ -1500,7 +1496,7 @@ static unsigned int xe_pt_stage_unbind(struct xe_gt *gt, struct xe_vma *vma,
 				       struct xe_vm_pgtable_update *entries)
 {
 	struct xe_pt_stage_unbind_walk xe_walk = {
-		.drm = {
+		.base = {
 			.ops = &xe_pt_stage_unbind_ops,
 			.shifts = xe_normal_pt_shifts,
 			.max_level = XE_PT_HIGHEST_LEVEL,
@@ -1512,8 +1508,8 @@ static unsigned int xe_pt_stage_unbind(struct xe_gt *gt, struct xe_vma *vma,
 	};
 	struct xe_pt *pt = vma->vm->pt_root[gt->info.id];
 
-	(void)drm_pt_walk_shared(&pt->drm, pt->level, vma->start, vma->end + 1,
-				 &xe_walk.drm);
+	(void)xe_pt_walk_shared(&pt->base, pt->level, vma->start, vma->end + 1,
+				 &xe_walk.base);
 
 	return xe_walk.wupd.num_used_entries;
 }
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index 2bb5d0e319b7..2ed64c0a4485 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -6,7 +6,7 @@
 #ifndef _XE_PT_TYPES_H_
 #define _XE_PT_TYPES_H_
 
-#include <drm/drm_pt_walk.h>
+#include "xe_pt_walk.h"
 
 enum xe_cache_level {
 	XE_CACHE_NONE,
@@ -17,7 +17,7 @@ enum xe_cache_level {
 #define XE_VM_MAX_LEVEL 4
 
 struct xe_pt {
-	struct drm_pt drm;
+	struct xe_ptw base;
 	struct xe_bo *bo;
 	unsigned int level;
 	unsigned int num_live;
-- 
2.39.2

