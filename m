Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C680C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 21:12:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C3310E02A;
	Thu, 11 Jul 2024 21:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ea5Gr3f+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E81C10E02A
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 21:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720732332; x=1752268332;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mJ0Ag/4RGrumfcKRC/KOi2MynWDmwaMRa1s78cE5jBc=;
 b=Ea5Gr3f+N02yIaLeD0n1QK1riJc4ClkSBA2CkvmhFJHUmqwYU/u//4ms
 O8QBfkNwZ9hjvHtFtE0o965ibyMKjDi8ktY2kInIHQ3GmqJz18yqvWZBB
 eHuDLx/6FtH/pjHlm1J8UNj342Fzq7KB7KptWz1WNRtKU/1ZJme/PDMBC
 O5Q+b8+GcEvZXUE6RLYQMMF46telz77uoYJ2UECVaYGemXCqclZeDHzx4
 ELSZSReV9U6OZ58m7zD6iqqkUfoQzBhP8xiCxoISQxqr1WC3QeUUiJfDe
 MO4NJuKf+BKZUaLBpO+2ryAHphIDbDoZDP5mUGL8okWqKnif2wlCxjCiM w==;
X-CSE-ConnectionGUID: tqc5ELF6SHqUy/UleoDwbA==
X-CSE-MsgGUID: ajU8f1KDTNi22D90PS+8Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="28752075"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="28752075"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 14:12:11 -0700
X-CSE-ConnectionGUID: vepHrc24TciwMiCEimqREA==
X-CSE-MsgGUID: Yoihqp7sSni+F+lnaAu5pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; d="scan'208";a="71901265"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 14:12:11 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] drm/xe/exec: Fix minor bug related to xe_sync_entry_cleanup
Date: Thu, 11 Jul 2024 14:12:03 -0700
Message-ID: <20240711211203.3728180-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Increment num_syncs after xe_sync_entry_parse() is successful to ensure
the xe_sync_entry_cleanup() logic under "err_syncs" label works correctly.

v2: Use the same pattern as that in xe_vm.c (Matt Brost)

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 2d72cdec3a0b..f36980aa26e6 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -118,7 +118,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	u64 addresses[XE_HW_ENGINE_MAX_INSTANCE];
 	struct drm_gpuvm_exec vm_exec = {.extra.fn = xe_exec_fn};
 	struct drm_exec *exec = &vm_exec.exec;
-	u32 i, num_syncs = 0, num_ufence = 0;
+	u32 i, num_syncs, num_ufence = 0;
 	struct xe_sched_job *job;
 	struct xe_vm *vm;
 	bool write_locked, skip_retry = false;
@@ -156,15 +156,15 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	vm = q->vm;
 
-	for (i = 0; i < args->num_syncs; i++) {
-		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs++],
-					  &syncs_user[i], SYNC_PARSE_FLAG_EXEC |
+	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
+		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
+					  &syncs_user[num_syncs], SYNC_PARSE_FLAG_EXEC |
 					  (xe_vm_in_lr_mode(vm) ?
 					   SYNC_PARSE_FLAG_LR_MODE : 0));
 		if (err)
 			goto err_syncs;
 
-		if (xe_sync_is_ufence(&syncs[i]))
+		if (xe_sync_is_ufence(&syncs[num_syncs]))
 			num_ufence++;
 	}
 
@@ -325,8 +325,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (err == -EAGAIN && !skip_retry)
 		goto retry;
 err_syncs:
-	for (i = 0; i < num_syncs; i++)
-		xe_sync_entry_cleanup(&syncs[i]);
+	while (num_syncs--)
+		xe_sync_entry_cleanup(&syncs[num_syncs]);
 	kfree(syncs);
 err_exec_queue:
 	xe_exec_queue_put(q);
-- 
2.41.0

