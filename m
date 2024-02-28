Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284CBC54E4A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Feb 2024 06:10:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD7C10E3CB;
	Wed, 28 Feb 2024 06:10:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ionw99ju";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B8810E3F5
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Feb 2024 06:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709100626; x=1740636626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eB5bnRPG65haZiRD0kP5jX3i/z0h35LgS56zxzVMwS0=;
 b=Ionw99jupw8ZumrMjFLOoOOO28ykve0yJIwjPpDCaYrZLpjX01q4Ye2x
 /9uCh6SztJxnTgt/SnwHghu88ezhwyYuPaxLpywps74YD+MRCvt/bElq5
 LA0NDE8URBL51siPPOlnv+EV6F108BCWj9iYUv92jgUwanYR8xoYzZXOy
 ryLbZcymwpMFj3VnRvPkTDB0RsFYelYMg+nlOWCMdiSs9eh+D3QVF5yCa
 /de/cqKsVJc8boaIpUd7ajBfZJk2HfXfVuCknH5RDHNt1METHe42O2bRM
 uMCP8JdAdxlMGKvdQ5iAlBHN6k5lRCFQbc8W04hmu8ynaRcWZgVAay8lL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="25950318"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="25950318"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 22:10:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7290286"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 22:10:24 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 3/5] drm/xe/mocs: Move warn/assertion up
Date: Tue, 27 Feb 2024 22:10:46 -0800
Message-ID: <20240228061048.3661978-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240228061048.3661978-1-lucas.demarchi@intel.com>
References: <20240228061048.3661978-1-lucas.demarchi@intel.com>
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

The warn-once in __init_mocs_table() to make sure there's an index set
for unused entries is more a sanity check that should be done as the
first thing in that function. The kunit test replicates the same check,
so also move it up and turn it into a failure condition for the test.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_mocs.c | 5 +++--
 drivers/gpu/drm/xe/xe_mocs.c       | 4 +++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index 7c91e01c47a3a..9787546e42249 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -79,11 +79,12 @@ static void read_mocs_table(struct xe_gt *gt,
 
 	struct kunit *test = xe_cur_kunit();
 
+	KUNIT_EXPECT_TRUE_MSG(test, info->unused_entries_index,
+			      "Unused entries index should have been defined\n");
+
 	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
 	mocs_dbg(&gt_to_xe(gt)->drm, "Global MOCS entries:%d\n", info->n_entries);
-	drm_WARN_ONCE(&xe->drm, !info->unused_entries_index,
-		      "Unused entries index should have been defined\n");
 
 	for (i = 0; i < info->n_entries; i++) {
 		mocs = get_entry_control(info, i);
diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index bdb755b963238..60ab34fd213fb 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -470,9 +470,11 @@ static void __init_mocs_table(struct xe_gt *gt,
 	unsigned int i;
 	u32 mocs;
 
-	mocs_dbg(&gt_to_xe(gt)->drm, "mocs entries: %d\n", info->n_entries);
 	drm_WARN_ONCE(&xe->drm, !info->unused_entries_index,
 		      "Unused entries index should have been defined\n");
+
+	mocs_dbg(&gt_to_xe(gt)->drm, "mocs entries: %d\n", info->n_entries);
+
 	for (i = 0; i < info->n_entries; i++) {
 		mocs = get_entry_control(info, i);
 
-- 
2.43.0

