Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9DCCC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 14:27:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701C010E72D;
	Wed, 14 Oct 2026 14:27:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF9310E72D
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 14:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791988049; x=1823524049;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sEvPdaPUBNjiTYlYew4/Ua92Tkl5giJX2L+S15/2sDI=;
 b=Mpz7/22CspQVsOj24/aqk5Kf42moBB1ksqTyM+lVWVAZIF7T7y37dViP
 BpCxDDPusfztKPz9NclbppWfUy1BOUYucKJm0Aj24Iqh300Fl/CAAYCGO
 VMywDi9mMuRqnmQU/5DAm5oAcS26TfgJkCkbiI+nezbZ4XETpEQmwOIvC
 h4E3T0LrZXcYxQQm+K+6gFCGrftU7M3WQj8gS+LBnWZZySUEbWRxnsGtP
 kPl2h4ICWKI2mWIsUjfTDZ6KvCxOnhPyhnOo9HIi7fBY6HENJi9P4ZMDl
 QDH0XoifnKsSHHtcI56D8PLy9CslrsCI3nlRTV92QNIBp9gGsYXjlVgNs A==;
X-CSE-ConnectionGUID: JhMMQORWQ7ei0zZQb00ExQ==
X-CSE-MsgGUID: SASJUqSdScSJ6PTW0EkdTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="738990"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="738990"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 07:27:29 -0700
X-CSE-ConnectionGUID: 0/gSuev+S8W64bGubWLRcg==
X-CSE-MsgGUID: MN1t/G1IRnym5/LxC/IOWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="3203457"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 07:27:27 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 Jan Maslak <jan.maslak@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH v5 4/4] drm/xe/tests: Add xe_migrate_access_memory subtest
Date: Wed, 14 Oct 2026 16:27:06 +0200
Message-ID: <20261014142706.598490-5-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014142706.598490-1-jan.maslak@intel.com>
References: <20261014142706.598490-1-jan.maslak@intel.com>
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

Add a new xe_migrate subtest for vram to sram migration works:
 - when the dst address is not 4-byte aligned
 - when the dst address in not 4-byte aligned but the migration size is
 - when src BO offset is not 4-byte aligned

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Jan Maslak <jan.maslak@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 302 ++++++++++++++++++++++++++
 1 file changed, 302 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index f10d9513747b..d4454dc70441 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -6,9 +6,12 @@
 #include <kunit/test.h>
 #include <kunit/visibility.h>
 
+#include <linux/prandom.h>
+
 #include "tests/xe_kunit_helpers.h"
 #include "tests/xe_pci_test.h"
 
+#include "xe_migrate.h"
 #include "xe_pat.h"
 #include "xe_pci.h"
 #include "xe_pm.h"
@@ -770,9 +773,308 @@ static void xe_validate_ccs_kunit(struct kunit *test)
 	validate_ccs_test_run_device(xe);
 }
 
+#define ACCESS_MEM_BO_SIZE		SZ_512K
+#define ACCESS_MEM_NUM_CELLS		(ACCESS_MEM_BO_SIZE / sizeof(u32))
+#define ACCESS_MEM_UNALIGNED_OFFSET	0x215ee
+
+/*
+ * Verify byte-by-byte that data read from the BO matches expected cell pattern.
+ * The BO is primed with u32 cells where cell[i] = i, so BO byte at offset B
+ * has value: (B / 4 >> (B%4 * 8)) & 0xFF.
+ *
+ * @buf:       the target buffer
+ * @buf_start: index into buf where read data begins
+ * @bo_start:  the BO byte offset corresponding to buf[buf_start]
+ * @size:      number of bytes to verify
+ * @scenario:  label for error messages
+ *
+ * Returns true if all bytes match, false on first mismatch.
+ */
+static bool verify_access_memory_read(struct kunit *test, u8 *buf,
+				      u32 buf_start, u32 bo_start,
+				      u32 size, const char *scenario)
+{
+	u32 j;
+
+	for (j = 0; j < size; j++) {
+		u32 bo_byte_offset = bo_start + j;
+		u32 byte_in_cell = bo_byte_offset % sizeof(u32);
+		u32 cell_idx = bo_byte_offset / sizeof(u32);
+		u32 cell_value = cell_idx;
+		u8 expected_byte = (cell_value >> (byte_in_cell * 8)) & 0xFF;
+		u8 got_byte = buf[buf_start + j];
+
+		if (got_byte != expected_byte) {
+			u32 context_end = min(j + 8, size - 1);
+			u32 context_start = (j >= 8) ? j - 8 : 0;
+			u32 k;
+
+			KUNIT_FAIL(test,
+				   "%s MISMATCH\n"
+				   "  Buffer index:    %u (0x%x)\n"
+				   "  BO offset:       0x%x\n"
+				   "  Cell index:      %u (BO offset 0x%x..0x%x)\n"
+				   "  Byte in cell:    %u\n"
+				   "  Expected value:  0x%02x (from cell_value 0x%08x)\n"
+				   "  Got value:       0x%02x\n",
+				   scenario,
+				   buf_start + j, buf_start + j,
+				   bo_byte_offset,
+				   cell_idx, cell_idx * 4, cell_idx * 4 + 3,
+				   byte_in_cell,
+				   expected_byte, cell_value,
+				   got_byte);
+
+			kunit_info(test, "Buffer context around mismatch (buf[%u..%u]):\n",
+				   buf_start + context_start,
+				   buf_start + context_end);
+
+			for (k = context_start; k <= context_end; k++) {
+				u32 k_bo_offset = bo_start + k;
+				u32 k_cell = k_bo_offset / sizeof(u32);
+				u32 k_byte = k_bo_offset % sizeof(u32);
+				u32 k_cell_val = k_cell;
+				u8 k_expected = (k_cell_val >> (k_byte * 8)) & 0xFF;
+
+				kunit_info(test,
+					   "  buf[%4u] @ BO 0x%05x: got 0x%02x, expected 0x%02x %s\n",
+					   buf_start + k, k_bo_offset,
+					   buf[buf_start + k], k_expected,
+					   (k == j) ? "<-- MISMATCH" : "");
+			}
+			return false;
+		}
+	}
+	return true;
+}
+
+static void access_memory_test_unaligned_bo_offset(struct kunit *test,
+						    struct xe_migrate *m,
+						    struct xe_bo *bo, u8 *buf,
+						    u32 unaligned_offset)
+{
+	u32 partial_size = ACCESS_MEM_BO_SIZE - unaligned_offset;
+	int ret;
+
+	memset(buf, 0, ACCESS_MEM_BO_SIZE);
+
+	kunit_info(test, "Partial read: bo_offset=0x%x bytes=0x%x\n",
+		   unaligned_offset, partial_size);
+
+	ret = xe_migrate_access_memory(m, bo, unaligned_offset, buf,
+				       partial_size, false);
+	if (ret) {
+		KUNIT_FAIL(test, "Partial read failed: %d\n", ret);
+		return;
+	}
+
+	if (verify_access_memory_read(test, buf, 0, unaligned_offset,
+				      partial_size,
+				      "Partial read from unaligned BO offset"))
+		kunit_info(test, "Partial read from unaligned BO offset 0x%x verified\n",
+			   unaligned_offset);
+}
+
+static void access_memory_test_unaligned_dst(struct kunit *test,
+					     struct xe_migrate *m,
+					     struct xe_bo *bo, u8 *buf,
+					     u32 unaligned_offset)
+{
+	u32 partial_size = ACCESS_MEM_BO_SIZE - unaligned_offset;
+	int ret;
+
+	memset(buf, 0, ACCESS_MEM_BO_SIZE);
+
+	kunit_info(test, "Read to unaligned dst: bo_offset=0x0 dst_offset=0x%x bytes=0x%x\n",
+		   unaligned_offset, partial_size);
+
+	ret = xe_migrate_access_memory(m, bo, 0, buf + unaligned_offset,
+				       partial_size, false);
+	if (ret) {
+		KUNIT_FAIL(test, "Read to unaligned dst failed: %d\n", ret);
+		return;
+	}
+
+	if (verify_access_memory_read(test, buf, unaligned_offset, 0,
+				      partial_size,
+				      "Read to unaligned dst"))
+		kunit_info(test, "Read to unaligned dst offset 0x%x verified\n",
+			   unaligned_offset);
+}
+
+static void access_memory_test_unaligned_dst_aligned_size(struct kunit *test,
+							  struct xe_migrate *m,
+							  struct xe_bo *bo,
+							  u8 *buf,
+							  u32 unaligned_offset)
+{
+	u32 partial_size = round_down(ACCESS_MEM_BO_SIZE - unaligned_offset, 4);
+	int ret;
+
+	memset(buf, 0, ACCESS_MEM_BO_SIZE);
+
+	kunit_info(test, "Read to unaligned dst (aligned size): bo_offset=0x0 dst_offset=0x%x bytes=0x%x\n",
+		   unaligned_offset, partial_size);
+
+	ret = xe_migrate_access_memory(m, bo, 0, buf + unaligned_offset,
+				       partial_size, false);
+	if (ret) {
+		KUNIT_FAIL(test, "Read to unaligned dst (aligned size) failed: %d\n", ret);
+		return;
+	}
+
+	if (verify_access_memory_read(test, buf, unaligned_offset, 0,
+				      partial_size,
+				      "Read to unaligned dst (aligned size)"))
+		kunit_info(test, "Read to unaligned dst (aligned size) offset 0x%x verified\n",
+			   unaligned_offset);
+}
+
+static void access_memory_test_run_tile(struct xe_device *xe,
+					struct xe_tile *tile,
+					struct kunit *test,
+					bool use_random_offset)
+{
+	struct drm_exec *exec = XE_VALIDATION_OPT_OUT;
+	unsigned int bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile);
+	struct xe_migrate *m = tile->migrate;
+	u32 j, unaligned_offset;
+	struct xe_bo *bo;
+	long timeout;
+	u8 *buf;
+	int ret;
+
+	if (use_random_offset) {
+		unaligned_offset = get_random_u32() % (ACCESS_MEM_BO_SIZE / 2);
+		/* Ensure the offset is not 4-byte aligned */
+		if (IS_ALIGNED(unaligned_offset, 4))
+			unaligned_offset |= 2;
+		if (!unaligned_offset)
+			unaligned_offset = 3;
+	} else {
+		unaligned_offset = ACCESS_MEM_UNALIGNED_OFFSET;
+	}
+
+	kunit_info(test, "Using unaligned offset: 0x%x (%s)\n",
+		   unaligned_offset, use_random_offset ? "random" : "predefined");
+
+	buf = kvmalloc(ACCESS_MEM_BO_SIZE, GFP_KERNEL);
+	if (!buf) {
+		KUNIT_FAIL(test, "Failed to allocate buffer\n");
+		return;
+	}
+
+	bo = xe_bo_create_user(xe, NULL, ACCESS_MEM_BO_SIZE,
+			       DRM_XE_GEM_CPU_CACHING_WC,
+			       bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS, NULL);
+	if (IS_ERR(bo)) {
+		KUNIT_FAIL(test, "Failed to create bo: %pe\n", bo);
+		goto free_buf;
+	}
+
+	/* Prime the BO */
+	for (j = 0; j < ACCESS_MEM_NUM_CELLS; j++)
+		((u32 *)buf)[j] = j;
+
+	kunit_info(test, "Writing %lu KiB to VRAM bo\n",
+		   (unsigned long)ACCESS_MEM_BO_SIZE / SZ_1K);
+
+	xe_bo_lock(bo, false);
+
+	/* The BO is unpinned, so make sure it is in VRAM once locked */
+	ret = xe_bo_validate(bo, NULL, false, exec);
+	if (ret) {
+		KUNIT_FAIL(test, "Failed to validate bo: %d\n", ret);
+		goto cleanup_bo;
+	}
+
+	if (!xe_bo_is_vram(bo)) {
+		KUNIT_FAIL(test, "BO is not in VRAM after validation\n");
+		goto cleanup_bo;
+	}
+
+	timeout = dma_resv_wait_timeout(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
+					true, 5 * HZ);
+	if (timeout <= 0) {
+		KUNIT_FAIL(test, "Failed to wait for bo to become idle: %ld\n",
+			   timeout);
+		goto cleanup_bo;
+	}
+
+	ret = xe_migrate_access_memory(m, bo, 0, buf, ACCESS_MEM_BO_SIZE, true);
+	if (ret) {
+		KUNIT_FAIL(test, "Failed to write bo: %d\n", ret);
+		goto cleanup_bo;
+	}
+
+	/* Full read */
+	memset(buf, 0, ACCESS_MEM_BO_SIZE);
+	kunit_info(test, "Full read: bo_offset=0x0 bytes=0x%x\n", ACCESS_MEM_BO_SIZE);
+
+	ret = xe_migrate_access_memory(m, bo, 0, buf, ACCESS_MEM_BO_SIZE, false);
+	if (ret) {
+		KUNIT_FAIL(test, "Full read failed: %d\n", ret);
+		goto cleanup_bo;
+	}
+
+	for (j = 0; j < ACCESS_MEM_NUM_CELLS; j++) {
+		u32 expected = j;
+		u32 got = ((u32 *)buf)[j];
+
+		if (got != expected) {
+			KUNIT_FAIL(test,
+				   "Full read mismatch at cell %u: expected 0x%08x, got 0x%08x\n",
+				   j, expected, got);
+			goto cleanup_bo;
+		}
+	}
+	kunit_info(test, "Full read verified\n");
+
+	access_memory_test_unaligned_bo_offset(test, m, bo, buf, unaligned_offset);
+	access_memory_test_unaligned_dst(test, m, bo, buf, unaligned_offset);
+	access_memory_test_unaligned_dst_aligned_size(test, m, bo, buf, unaligned_offset);
+
+cleanup_bo:
+	xe_bo_unlock(bo);
+	xe_bo_put(bo);
+free_buf:
+	kvfree(buf);
+}
+
+static int access_memory_test_run_device(struct xe_device *xe)
+{
+	struct kunit *test = kunit_get_current_test();
+	struct xe_tile *tile;
+	int id;
+
+	if (!IS_DGFX(xe)) {
+		kunit_skip(test, "non-discrete device\n");
+		return 0;
+	}
+
+	guard(xe_pm_runtime)(xe);
+	for_each_tile(tile, xe, id) {
+		kunit_info(test, "Testing tile id %d (predefined offset)\n", id);
+		access_memory_test_run_tile(xe, tile, test, false);
+
+		kunit_info(test, "Testing tile id %d (random offset)\n", id);
+		access_memory_test_run_tile(xe, tile, test, true);
+	}
+
+	return 0;
+}
+
+static void xe_migrate_access_memory_kunit(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+
+	access_memory_test_run_device(xe);
+}
+
 static struct kunit_case xe_migrate_tests[] = {
 	KUNIT_CASE_PARAM(xe_migrate_sanity_kunit, xe_pci_live_device_gen_param),
 	KUNIT_CASE_PARAM(xe_validate_ccs_kunit, xe_pci_live_device_gen_param),
+	KUNIT_CASE_PARAM(xe_migrate_access_memory_kunit, xe_pci_live_device_gen_param),
 	{}
 };
 
-- 
2.43.0

