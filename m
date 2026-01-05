Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8570FC2A07C
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jan 2026 04:02:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBD610E380;
	Mon,  5 Jan 2026 04:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PTL02eTw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170A410E232
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jan 2026 04:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767585764; x=1799121764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3FYcM3+PhZzuzLCr7uA8DAnIeq8p0TGv27Ov5yjU/J4=;
 b=PTL02eTwCcUGrz0vW7bEUnJzHdcq0ArMYuWndIQk4dnaYf4AU8ubtkC2
 jx4eXhaLSQZ9WNKCjqBHyzIcXBuZSooPLEHnEyUrk9LBR5Hf60VMWIWcJ
 7APmWwMhGC06diLAZ3t/hNm2IeyZWBpSGhxQlUCTbmdO0mv4nvHhlStef
 zqjXAEI7ZsXGBVgLqCvczx0bXLJsudIs2g4J4o1+N4ZVh4kbT2esbcN4Z
 b3GHRzIcGNshECpneY5JubobYAwTF0W2k6tlbX3yB6mla5j/RYA8qhEfS
 TsrZhZqATsaT0hqcvNfOvCacaI0bETrfF8g9h5/S5nrnxeokyjg7smv3c g==;
X-CSE-ConnectionGUID: hIsUTbXPSEeSyB5B3OwnpQ==
X-CSE-MsgGUID: aJC2Jx95TI6tw4Nu+7N9sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="68856256"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="68856256"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:44 -0800
X-CSE-ConnectionGUID: kFm1vakET5eUgw/biV0NkQ==
X-CSE-MsgGUID: GvBVTEjSSYC+SlZsNKWE+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; d="scan'208";a="202060656"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2026 20:02:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com,
	carlos.santa@intel.com
Subject: [PATCH v2 04/22] drm/xe: Add deadline exec queue vfuncs
Date: Sun,  4 Jan 2026 20:02:19 -0800
Message-Id: <20260105040237.1307873-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105040237.1307873-1-matthew.brost@intel.com>
References: <20260105040237.1307873-1-matthew.brost@intel.com>
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

Add set_deadline and set_deadline_state exec queue vfuncs for deadline
control.

v2:
 - Fix kernel doc
 - Remove exit_deadline, rather use an enum for control

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index cd7a6571f5c6..ac860f3f042e 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -15,6 +15,7 @@
 #include "xe_hw_fence_types.h"
 #include "xe_lrc_types.h"
 
+enum xe_deadline_mgr_state;
 struct drm_syncobj;
 struct xe_execlist_exec_queue;
 struct xe_gt;
@@ -301,6 +302,14 @@ struct xe_exec_queue_ops {
 	void (*resume)(struct xe_exec_queue *q);
 	/** @reset_status: check exec queue reset status */
 	bool (*reset_status)(struct xe_exec_queue *q);
+	/**
+	 * @set_deadline: Set deadline for on a queue for a fence.
+	 */
+	void (*set_deadline)(struct xe_exec_queue *q, struct dma_fence *fence,
+			     ktime_t deadline);
+	/** @set_deadline_state: Set deadline state for a queue */
+	void (*set_deadline_state)(struct xe_exec_queue *q,
+				   enum xe_deadline_mgr_state state);
 };
 
 #endif
-- 
2.34.1

