Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2A7606A31D
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 12:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TUbeLaJ9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E4910E153;
	Thu, 29 Oct 2026 12:21:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DFE10E153
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 12:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793276503; x=1824812503;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JY+fQzCL9oxvWef0Lr+hqB9DjEc4MnL9X9hLyKCVR6o=;
 b=TUbeLaJ9kOIkdlCteSsITdiw6cmQ2TVx2qm3nhGXuM+uoZojtMKlhTnH
 nzZ9uGBR0xQTbCBgH19Io58iMOFKRhfhLRpB7LOEB6VHIuyZluwe+zyd2
 ogfEXdGQwUK9syfVF8rs3dxGVpQK4CeHaPAyvdLtzuKdlihkZrZcLZpdb
 FVudbS/mGtoEHKXNvoYOerlJK96VrMO5QnDB4sZ4ESKeGRshclvAtnkx4
 o505HXewYZ7itHKw9kQHYpXm+u/GisTO9Y8jmtb1mG5ngREz5la4KJtNu
 LlUevusxGMTTmi7NCEvTpbMZT0rppUaxMTkiBhXEjMcVujfAL7AqFXRPg A==;
X-CSE-ConnectionGUID: 507IKt+SSw2DTVyV2LxDeA==
X-CSE-MsgGUID: T+9kodtqS5mSmfTWSOpmRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1894851"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1894851"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 05:21:42 -0700
X-CSE-ConnectionGUID: AC+ymO5PTqKNZTWSXuTwKw==
X-CSE-MsgGUID: Dpoj0VZWThCC9RlFPuzPYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5471489"
Received: from szadworn-mobl.ger.corp.intel.com (HELO mkuoppal-desk.home.arpa)
 ([10.245.246.253])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 05:21:41 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 2/3] drm/xe/tests: Cover a large write to an unaligned bo
 offset
Date: Thu, 29 Oct 2026 14:21:29 +0200
Message-ID: <20261029122130.2795549-2-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029122130.2795549-1-mika.kuoppala@linux.intel.com>
References: <20261029122130.2795549-1-mika.kuoppala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Write a contiguous 16M bo from a cacheline offset with
xe_migrate_access_memory() and read it back. Aligning the vram side
leaves buf mid page, so the following full chunk has to stay within
MAX_PREEMPTDISABLE_TRANSFER. Without MEM_COPY, an offset that is not
cacheline aligned would go through the bounce buffer instead and never
reach the chunking.

v2: Use XE_CACHELINE_BYTES to avoid excessive bounce buffering (Sashiko)

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 51 +++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index a9ef8f2dcebb..57c5de5032d2 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -1041,6 +1041,54 @@ static void access_memory_test_run_tile(struct xe_device *xe,
 	kvfree(buf);
 }
 
+static void access_memory_test_unaligned_large_write(struct kunit *test,
+						     struct xe_tile *tile)
+{
+	/* Not cacheline aligned would take the slow bounce buffer path */
+	const u32 size = SZ_16M, offset = XE_CACHELINE_BYTES;
+	struct xe_bo *bo;
+	u32 j;
+	u8 *buf;
+	int ret;
+
+	buf = kvmalloc(size, GFP_KERNEL);
+	if (!buf) {
+		KUNIT_FAIL(test, "Failed to allocate buffer\n");
+		return;
+	}
+
+	bo = xe_bo_create_pin_map_novm(tile_to_xe(tile), tile, size,
+				       ttm_bo_type_kernel,
+				       XE_BO_FLAG_VRAM_IF_DGFX(tile), false);
+	if (IS_ERR(bo)) {
+		KUNIT_FAIL(test, "Failed to create bo: %pe\n", bo);
+		goto free_buf;
+	}
+
+	for (j = 0; j < size / sizeof(u32); j++)
+		((u32 *)buf)[j] = j;
+
+	xe_bo_lock(bo, false);
+	ret = xe_migrate_access_memory(tile->migrate, bo, offset, buf,
+				       size - offset, true);
+	if (!ret) {
+		memset(buf, 0, size);
+		ret = xe_migrate_access_memory(tile->migrate, bo, offset, buf,
+					       size - offset, false);
+	}
+	xe_bo_unlock(bo);
+
+	if (ret)
+		KUNIT_FAIL(test, "Unaligned large write failed: %d\n", ret);
+	else
+		verify_access_memory_read(test, buf, 0, 0, size - offset,
+					  "Unaligned large write");
+
+	xe_bo_unpin_map_no_vm(bo);
+free_buf:
+	kvfree(buf);
+}
+
 static int access_memory_test_run_device(struct xe_device *xe)
 {
 	struct kunit *test = kunit_get_current_test();
@@ -1059,6 +1107,9 @@ static int access_memory_test_run_device(struct xe_device *xe)
 
 		kunit_info(test, "Testing tile id %d (random offset)\n", id);
 		access_memory_test_run_tile(xe, tile, test, true);
+
+		kunit_info(test, "Testing tile id %d (unaligned large write)\n", id);
+		access_memory_test_unaligned_large_write(test, tile);
 	}
 
 	return 0;
-- 
2.53.0

