Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53818C79FB7
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 06:19:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C2C10EED5;
	Wed,  9 Sep 2026 06:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V73ouTAr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F6010EED5
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Sep 2026 06:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788934763; x=1820470763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sc8v+N7ux6kzU4ddAW74R2F20KuJWlHyCsO4FxtDHiY=;
 b=V73ouTArTWJLiYh2ctmSSj2bHYBbRZSvZk8KItKX0JGTu8NvOMqB6S1B
 xwflqWnrbYebzTGk7+nLEBJYVj4XchRZaOYupFjcvPVEmh8aGcBJMIUNX
 RYeefb7UigGPs3ltf/lB3iOj7m4cSA1IP3dMF1WEFvhjhKkzvaz0jrDxR
 y8AjJHqqz9qY7VRJY9yghmc1xhj54cF8k2gXIQSW5ZCo2T7rfpTbMlrmK
 a0VakAEklcRcUYymfSMMZe6oLiaV0S2t+Z17YhldYS69lC0sqCa7DR8Tl
 AUSGCtMwfcGwczTwjkFgdWIEDqToDtwjBSjZRigft2YJ3IXUVCc++yCmQ g==;
X-CSE-ConnectionGUID: CmZJaNpdSxSC78IUdbOTRw==
X-CSE-MsgGUID: Np0RfQJJSJGMpdHKlpP7rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89220600"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89220600"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 23:19:13 -0700
X-CSE-ConnectionGUID: 4YMB6nJyTiW8mKhFsJ4fVA==
X-CSE-MsgGUID: aCZDthiQTW29JJGIrn1F0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="270733929"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 23:19:12 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 Jan Maslak <jan.maslak@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH v3 4/4] drm/xe/tests: Add xe_migrate_access_memory subtest
Date: Wed,  9 Sep 2026 08:18:45 +0200
Message-ID: <20260909061845.4048047-5-jan.maslak@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909061845.4048047-1-jan.maslak@intel.com>
References: <20260909061845.4048047-1-jan.maslak@intel.com>
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
 drivers/gpu/drm/xe/tests/xe_migrate.c | 278 ++++++++++++++++++++++++++
 1 file changed, 278 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index f10d9513747b..9e18fcd51e26 100644
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
@@ -770,9 +773,284 @@ static void xe_validate_ccs_kunit(struct kunit *test)
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
+	unsigned int bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile);
+	struct xe_migrate *m = tile->migrate;
+	u32 j, unaligned_offset;
+	struct xe_bo *bo;
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
+			KUNIT_FAIL(test, "Full read mismatch at cell %u: expected 0x%08x, got 0x%08x\n",
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

