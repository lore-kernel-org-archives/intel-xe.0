Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A3EC47258
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 10:59:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9AA10F8AB;
	Thu, 25 Jan 2024 10:59:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D007710F8AB
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jan 2024 10:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706180388; x=1737716388;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z6AYoEIhVlCrT0Pdchv+61LHI3BKP+7/+rtxC5PwB0M=;
 b=I5EzIchPSzGDCzsLb4ti8wkM29lCzrbjMRoz62q6uMD2ptJE5UKt2lVs
 mNCAxiyx2jjnJqhVAeUE8j/FwqvCoXOVhnPCVygWqexoCyZg0K3tTNj9M
 RyD1OgeCd5PSsxkTdUuVDf7qny+xNfz9zKn7XqA1GyptU7mv/KXZT2wQn
 W0yZob2rXv4XL/R4x/6pZtcBsFB8zStxWYf2VvHJH56XxdsumxEEEB2+P
 u1Ln2/tYYqU5A3SUUU9YmH3MMx3GouPBsvA+TcWfprGBYo/rIWXyd8qC9
 JWregUyIcagbmGzG3JrITenTMq29wM90xt430M2ObMsWqbcTm8LwQA2O8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="400985320"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="400985320"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 02:59:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="909961548"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="909961548"
Received: from clanggaa-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.242])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 02:59:47 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI] drm/xe: Don't make exec_queues persistent by default
Date: Thu, 25 Jan 2024 11:59:33 +0100
Message-ID: <20240125105933.5159-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

A first step in avoiding persistent exec_queue handling.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index c0b7434e78f1..bee07bc29f89 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -707,7 +707,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 			/* The migration vm doesn't hold rpm ref */
 			xe_device_mem_access_get(xe);
 
-			flags = EXEC_QUEUE_FLAG_PERSISTENT | EXEC_QUEUE_FLAG_VM |
+			flags = EXEC_QUEUE_FLAG_VM |
 				(id ? EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD : 0);
 
 			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
@@ -760,8 +760,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 
 		q = xe_exec_queue_create(xe, vm, logical_mask,
 					 args->width, hwe,
-					 xe_vm_in_lr_mode(vm) ? 0 :
-					 EXEC_QUEUE_FLAG_PERSISTENT,
+					 0,
 					 args->extensions);
 		up_read(&vm->lock);
 		xe_vm_put(vm);
-- 
2.43.0

