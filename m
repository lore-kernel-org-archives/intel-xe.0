Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12C3C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 21:39:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989E810ECA7;
	Wed, 29 May 2024 21:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CRMD7WJ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A318310ECA7
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 21:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717018770; x=1748554770;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o9jQxrdJENBRsOnKOliZu4ruc0bu015bDrj5ARMUFvw=;
 b=CRMD7WJ7YJl5LlGQjDPksEdx9iFIhQJJNvDsjC4lcx0/zmHqFBJ9zlIR
 paW/O8+dEipZNAn3gfZHnQuDJjL258nRXmDDeLilCC+cXJYYKDmHSkEse
 76wdLuG7VUF4cneZpjjtwBFYQKgP8GMqG0+uouunDHoRHDR2HKTZaCWva
 C5njLWA3kbtPcVsz0zrwFZlDJBBsjeX3m4JA4hfS0qcECdqONzw3JEOld
 3bKhncYZklWhDFpTAV9OiBfOkjSbxOyj42blDhlLrecMB7jHrB/zTlE1i
 XTLsNM31XbNkkxkdI+4RBHt89mlc87a2HWp3LsbIsuuZN/gpWzDVawbQg Q==;
X-CSE-ConnectionGUID: 4vvRUHYUQB6heB4lYCMBWA==
X-CSE-MsgGUID: qFDdO73sR6m+Y9o9XR/VBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13333753"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="13333753"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 14:39:29 -0700
X-CSE-ConnectionGUID: KkH/YUySRROWL4vR1ZSP+w==
X-CSE-MsgGUID: DBKQCoBBRYGRfWlYQJ/sYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="40104963"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 14:39:29 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com
Subject: [PATCH v3] drm/xe: Remove unwanted mutex locking
Date: Wed, 29 May 2024 14:39:25 -0700
Message-ID: <20240529213925.22239-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

Do not hold xef->exec_queue.lock mutex while parsing the xarray
xef->exec_queue.xa in xe_file_close() as it is not needed and
will cause an unwanted dependency between this lock and the vm->lock.

This lock protects the exec queue lookup and reference taking which
doesn't apply to this code path. When FD is closing, IOCTLs presumably
can't be modifying the xarray.

v2: Update commit text (Matt Brost)
v3: Add more code comment (Rodrigo Vivi)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f04b11e45c2d..bf4c4306f6d3 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -96,12 +96,15 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 	struct xe_exec_queue *q;
 	unsigned long idx;
 
-	mutex_lock(&xef->exec_queue.lock);
+	/*
+	 * No need for exec_queue.lock here as there is no contention at
+	 * this point. Taking exec_queue.lock here causes undue dependency
+	 * on vm->lock taken during xe_exec_queue_kill().
+	 */
 	xa_for_each(&xef->exec_queue.xa, idx, q) {
 		xe_exec_queue_kill(q);
 		xe_exec_queue_put(q);
 	}
-	mutex_unlock(&xef->exec_queue.lock);
 	xa_destroy(&xef->exec_queue.xa);
 	mutex_destroy(&xef->exec_queue.lock);
 	mutex_lock(&xef->vm.lock);
-- 
2.43.0

