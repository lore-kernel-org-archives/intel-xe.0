Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8C6CD042D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jan 2026 01:29:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B6310E44B;
	Tue,  6 Jan 2026 01:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aJ2xYZah";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F3910E231
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jan 2026 01:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767662972; x=1799198972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BWEFt2F5W9W+0b6BGgwi7UQM6rp3O3OyCW2fXgfEBb4=;
 b=aJ2xYZahPnHquRZCSuKDZTIy6e7rudWZgkbr9xhGh0C9/I2zzjZeHYrF
 TPL0KURg8TfJNugXRzhyaWYZCYTB+x3WpBWbwSTZcc1gdgPw1/hApnVnn
 5T1n4uUy3wJNo24xcy5vxIu9d4nywG+pxQrWZqGC8V83QJZHPdht04gjI
 Hn/KfttCNY9/oJgVwV/P3lTDwjVRB+Vqyt76CQHkdbIOnjVK9amqDetFb
 0CmwuG675kqTPRO6Z4kYY4Ok0JRP4JUeluLa0L9A0uKvIq8a9SDtUr3no
 1+ku9lwIxV0c32LxDokCqObaHZuBf6cXxH26aE3vF2mY+ak1VcBqhQd2a g==;
X-CSE-ConnectionGUID: 5R+FlbZ9TlSwcgxWi+Q2Gg==
X-CSE-MsgGUID: 4dvEYlORTWa72Fua4S7kbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69072799"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="69072799"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 17:29:32 -0800
X-CSE-ConnectionGUID: ORFnHZOvQh+ffalL6T2aBQ==
X-CSE-MsgGUID: T6dyH/L7Sr6FhVUCM158ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="202148076"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 17:29:32 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH 2/2] drm/xe/doc: Remove KEEP_ACTIVE feature
Date: Mon,  5 Jan 2026 17:29:16 -0800
Message-ID: <20260106012920.2850975-6-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106012920.2850975-4-niranjana.vishwanathapura@intel.com>
References: <20260106012920.2850975-4-niranjana.vishwanathapura@intel.com>
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

The KEEP_ACTIVE feature is being reverted, update documentation.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 529a40ca4002..b5737563ee14 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -84,9 +84,8 @@
  * group is destroyed. The secondary queues hold a reference to the primary
  * queue thus preventing the group from being destroyed when user destroys
  * the primary queue. Once the primary queue is destroyed, secondary queues
- * can't be added to the queue group, but they can continue to submit the
- * jobs if the DRM_XE_MULTI_GROUP_KEEP_ACTIVE flag is set during the multi
- * queue group creation.
+ * can't be added to the queue group and new job submissions on existing
+ * secondary queues are not allowed.
  *
  * The queues of a multi queue group can set their priority within the group
  * through the DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY property.
-- 
2.43.0

