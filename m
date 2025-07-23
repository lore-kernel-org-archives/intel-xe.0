Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39831C83F17
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 12:53:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F068810E0F6;
	Wed, 23 Jul 2025 12:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C+oKzyPl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194FA10E0F6
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 12:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753275212; x=1784811212;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2HdXr8x5VXDgTzW70UlRka+afe8SYNhHHVxVNLI6GOQ=;
 b=C+oKzyPlobzTcw1OUon6AxX+wIg2VrhlluLgF68xkNUruJ3QGDG/PSH7
 7LO38OqFtM1YZemoioCIbSgnwCiWDYfWbzpitPTTOH2ToCstQoqZdP8sJ
 iyfeGaMNFtU97zv1vvov3r/e8xV23FoYDA/9JJ72ePCtxvEDlyoNOI7GC
 AuPOdeX67QdcmFsc3/wfJZjviv+uKWyW4KhungVKtWxDlAW9wsQs5c7GC
 EXPyx0Lm72jd7Es1aGOEuPVm/x+MtNMjZmBWaLEsvJhzB6QM+7xFzcYZW
 UUZG7SCaKAn892zSc/vFLjN6iK3Wqcvdze9y/JPNrJ3CojK/USEi9e+qf w==;
X-CSE-ConnectionGUID: Y4veql45TLqrFDGiS97egg==
X-CSE-MsgGUID: ay3hlsxQSc2jTqO8/IYlsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="54773799"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="54773799"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 05:53:31 -0700
X-CSE-ConnectionGUID: 3QeVFtUdQ0etovmgQ01uYQ==
X-CSE-MsgGUID: sim+C5qeTH66tZzcFmlBgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="196606007"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa001.jf.intel.com with ESMTP; 23 Jul 2025 05:53:30 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Summers Stuart <stuart.summers@intel.com>
Subject: [PATCH v3] drm/xe: Improve VF provision stability with fault injection
Date: Wed, 23 Jul 2025 18:40:08 +0530
Message-ID: <20250723131008.26916-1-satyanarayana.k.v.p@intel.com>
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

In unlikely event, due to PF malfunction or misconfiguration, VF may
receive incomplete or invalid configuration and it must be prepared
to handle such cases without causing a crash.

When simulating errors with the kernel's fault injection framework, crashes
were observed during device unbind. These crashes were primarily due to the
use of the XE_BO_FLAG_GGTT_INVALIDATE flag when creating buffer objects.

The GGTT is invalidated using CTB, which is allocated with the
XE_BO_FLAG_GGTT_INVALIDATE flag. However, the buffer object for CTB is
freed before GGTT invalidation completes, leading to crashes.

Similarly, for buffer objects allocated in memirq_alloc_pages() and
__xe_sa_bo_manager_init(), the CTB is already freed by the time GGTT
invalidation occurs, resulting in system crashes.

To prevent these issues, while invalidating GGTT, an additional check for
validity of GGTT is added which avoids sending CTB to GUC.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Summers Stuart <stuart.summers@intel.com>

---
V2 -> V3:
- Moved GGTT validity check to xe_ggtt_invalidate(). (Michal Wajdeczko)

V1 -> V2:
- An additional check for validity of GGTT is added in
xe_gt_tlb_invalidation_ggtt() instead of removing XE_BO_FLAG_GGTT_INVALIDATE
from memirq_alloc_pages(), __xe_sa_bo_manager_init() and xe_guc_ct_init().
(Summers Stuart)
---
 drivers/gpu/drm/xe/xe_ggtt.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 29d4d3f51da1..b3005a462186 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -447,6 +447,16 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
 {
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
 
+	/*
+	 * To avoid crashes during BO unbind operations, always verify the
+	 * validity of the GGTT before attempting invalidation. This check is
+	 * particularly crucial when handling BOs created with the
+	 * XE_BO_FLAG_GGTT_INVALIDATE flag, as improper invalidation of an
+	 * invalid GGTT can cause crash.
+	 */
+	if (!ggtt->scratch)
+		return;
+
 	/*
 	 * XXX: Barrier for GGTT pages. Unsure exactly why this required but
 	 * without this LNL is having issues with the GuC reading scratch page
-- 
2.43.0

