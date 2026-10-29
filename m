Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4633A606A31E
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 12:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HSMyz765
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC9F112246;
	Thu, 29 Oct 2026 12:21:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40690112246
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 12:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793276504; x=1824812504;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ot7YFClwm0bDSKMUPdfDQw/40+ZpDoXUBZOgRId7//M=;
 b=HSMyz765CStdincR3Q9AyO2cdGiXDZy83Vu3FLzklDLqYmuj9EVlTte3
 IqhONh8fpKITn9Iw73URVUVE3cF6ITtjCqBvq+9tgGQbCoQmwkWw8DtHN
 iuj/ldb+6CvePGb9cmGpV3Qa7Cvpx9qXUSKgHIJHY7Z3utuCTOVd2xWXH
 VOt1rREEx4rKrLQ4gwwZqgAuYS+d81McTyhu9m9NRhD28q3qxka5A7l5r
 HLliqwY8E93An57z4y5ETyeW5gAwSZ9HlL8w1z/iABz0tBSwuKy4HiS/X
 o6Vd3ZpY1tAVWyj9MW8L8ZRf+SH/k+ko0PLQQCT8iZU8uurZEsltF66RR Q==;
X-CSE-ConnectionGUID: XcFSKVbjRVeDg8gUoX8UrQ==
X-CSE-MsgGUID: S3YdoWFASk2D5LJG1oGtcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1894852"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1894852"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 05:21:44 -0700
X-CSE-ConnectionGUID: C/unZMJzTFKYJW6BzHgMaQ==
X-CSE-MsgGUID: A/KuOnhATjq3f/Lgrh2yAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5471503"
Received: from szadworn-mobl.ger.corp.intel.com (HELO mkuoppal-desk.home.arpa)
 ([10.245.246.253])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 05:21:42 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 3/3] drm/xe/tests: Keep bounce buffered accesses short in
 access_memory test
Date: Thu, 29 Oct 2026 14:21:30 +0200
Message-ID: <20261029122130.2795549-3-mika.kuoppala@linux.intel.com>
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

Without MEM_COPY, the unaligned accesses go through a cacheline sized
bounce buffer, one job per 64 bytes. On ATS-M each of the unaligned
reads over the 512K bo takes 10-15s and the case 75s, tripping the hung
task detector.

The bounce loop only differs in its first and last iteration, so cap
those accesses to 16K on platforms without MEM_COPY. Platforms with
MEM_COPY keep the full length.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9663
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 57c5de5032d2..56c49d8507d7 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -776,6 +776,7 @@ static void xe_validate_ccs_kunit(struct kunit *test)
 #define ACCESS_MEM_BO_SIZE		SZ_512K
 #define ACCESS_MEM_NUM_CELLS		(ACCESS_MEM_BO_SIZE / sizeof(u32))
 #define ACCESS_MEM_UNALIGNED_OFFSET	0x215ee
+#define ACCESS_MEM_BOUNCE_LEN		SZ_16K
 
 /*
  * Verify byte-by-byte that data read from the BO matches expected cell pattern.
@@ -848,12 +849,22 @@ static bool verify_access_memory_read(struct kunit *test, u8 *buf,
 	return true;
 }
 
+/* Bounce buffering without MEM_COPY is slow, keep those accesses short */
+static u32 access_memory_test_len(struct xe_migrate *m, u32 len)
+{
+	if (!tile_to_xe(m->tile)->info.has_mem_copy_instr)
+		return min(len, ACCESS_MEM_BOUNCE_LEN);
+
+	return len;
+}
+
 static void access_memory_test_unaligned_bo_offset(struct kunit *test,
 						   struct xe_migrate *m,
 						   struct xe_bo *bo, u8 *buf,
 						   u32 unaligned_offset)
 {
-	u32 partial_size = ACCESS_MEM_BO_SIZE - unaligned_offset;
+	u32 partial_size = access_memory_test_len(m, ACCESS_MEM_BO_SIZE -
+						     unaligned_offset);
 	int ret;
 
 	memset(buf, 0, ACCESS_MEM_BO_SIZE);
@@ -880,7 +891,8 @@ static void access_memory_test_unaligned_dst(struct kunit *test,
 					     struct xe_bo *bo, u8 *buf,
 					     u32 unaligned_offset)
 {
-	u32 partial_size = ACCESS_MEM_BO_SIZE - unaligned_offset;
+	u32 partial_size = access_memory_test_len(m, ACCESS_MEM_BO_SIZE -
+						     unaligned_offset);
 	int ret;
 
 	memset(buf, 0, ACCESS_MEM_BO_SIZE);
@@ -908,7 +920,8 @@ static void access_memory_test_unaligned_dst_aligned_size(struct kunit *test,
 							  u8 *buf,
 							  u32 unaligned_offset)
 {
-	u32 partial_size = round_down(ACCESS_MEM_BO_SIZE - unaligned_offset, 4);
+	u32 partial_size = round_down(access_memory_test_len(m, ACCESS_MEM_BO_SIZE -
+								unaligned_offset), 4);
 	int ret;
 
 	memset(buf, 0, ACCESS_MEM_BO_SIZE);
-- 
2.53.0

