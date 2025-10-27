Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E05CCF9E0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 18:04:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 569D610E543;
	Mon, 27 Oct 2025 18:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DjusiWDb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E644010E541
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 18:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761588255; x=1793124255;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wkOE+d4Ts22ChJ0Z1FHP/jF0j7PMcNNxk97KVu+QkAk=;
 b=DjusiWDbHO+wTV44yrq3Af27S3Aeqy4EOYfH37I0fJ7wvUDP2vT5wfXS
 gzjNZQyZ/dXS/2Ag4zZPpWsXeFFWTMHMRKvyfybvFmHzy5SHy53jjym97
 DyuzKWmBYFbyp9HiFJOlJgpHUqUWJyXcYKQzoCFIP3RENIkXER67+/GAX
 9V+XLGzAYLJWkNbdT2Fj5g0bjlXoUNNbI36ZMw6Jg2IzpMyXvuvkiIvpb
 NpdCwaAxv3wscMg4+cDAlBTNqvVtDMqMiQvIB0XMTaEq0VWfsJoXt239s
 vmHsvN+vok7Gy360MGOW7fbolej/+x7qcY/KO5IdPI+TzfJxQ/hugMSLJ Q==;
X-CSE-ConnectionGUID: pRJuBrVUROSRDvtdUsaVVQ==
X-CSE-MsgGUID: 4kukX7DNSFCC0LP9kNakeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63575707"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63575707"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 11:04:15 -0700
X-CSE-ConnectionGUID: 4L7YhwtyR9S9L8FI7QGXGg==
X-CSE-MsgGUID: ztrX/EnbQXqWErfti5bt4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="184291146"
Received: from dut4396arlh.fm.intel.com ([10.105.10.137])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 11:04:14 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 niranjana.vishwanathapura@intel.com, zhanjun.dong@intel.com,
 shuicheng.lin@intel.com, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 5/6] drm/xe: Correct migration VM teardown order
Date: Mon, 27 Oct 2025 18:04:11 +0000
Message-Id: <20251027180412.63743-6-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027180412.63743-1-stuart.summers@intel.com>
References: <20251027180412.63743-1-stuart.summers@intel.com>
MIME-Version: 1.0
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

Adjust the sequence of the migration teardown to match what
is happening in the init() function.

v2: Take a reference to the migrate queue before put (Matt)

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 56a5804726e9..9d60bc2b57e4 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -98,17 +98,18 @@ struct xe_migrate {
 static void xe_migrate_fini(void *arg)
 {
 	struct xe_migrate *m = arg;
+	struct xe_vm *vm = m->q->vm;
 
-	xe_vm_lock(m->q->vm, false);
+	xe_vm_lock(vm, false);
 	xe_bo_unpin(m->pt_bo);
-	xe_vm_unlock(m->q->vm);
+	xe_vm_unlock(vm);
 
 	dma_fence_put(m->fence);
 	xe_bo_put(m->pt_bo);
 	drm_suballoc_manager_fini(&m->vm_update_sa);
 	mutex_destroy(&m->job_mutex);
-	xe_vm_close_and_put(m->q->vm);
 	xe_exec_queue_put(m->q);
+	xe_vm_close_and_put(vm);
 }
 
 static u64 xe_migrate_vm_addr(u64 slot, u32 level)
-- 
2.34.1

