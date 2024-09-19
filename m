Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97146CF395D
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 16:51:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9CD10E096;
	Thu, 19 Sep 2024 16:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CCn1fB3+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5618710E096
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 16:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726764710; x=1758300710;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TDkI/mncN54bMQtVp4ivU1IjqeD5BoFmfH/wJni/9PM=;
 b=CCn1fB3+I9cfRihPD9XREIuOCPGu1PNzReJCOXr/DCz5DPriPjLom+cx
 VVJpRX1RHfRwzmxoKIkxoX8f8lIe9s6gXWFSzjlIVIuvk3V+3jBbbYtua
 qI1hVA1U2PENkJPHuQ6Trm3T2k4/mvZFkbXNwyTPHhEPyk6BOIUyjUq6A
 Du6muTWSV0FfsL6VwOll+wB4KUgjQSohE5+Fv9FQDMMdu9rKnwPPnxW4f
 HQI0myJI6AwmK9jctz4uORFAkw55yMNj7bQs4L2qoXa2jt3yRZDbC73Iw
 FXyJoM8ClwoO0bH+OMtrwV15aHl9iPdtFouhHqcsuVvTP1dHX1MRbe5Kk g==;
X-CSE-ConnectionGUID: 1WJU6gy+T76/z//G3Ul7RA==
X-CSE-MsgGUID: KOdUuhVwQ4ytSus6Np9Opw==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="51155978"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="51155978"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 09:51:49 -0700
X-CSE-ConnectionGUID: e2jmjyKBTE6RYuikty3SNA==
X-CSE-MsgGUID: vdI/0T3GQ5iYdEfG+4BABA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="74782991"
Received: from ettammin-desk.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.88])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 09:51:48 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [CI] drm/xe: Attempt to reduce execution time for the xe_bo_shrink
 dynamic test
Date: Thu, 19 Sep 2024 18:51:22 +0200
Message-ID: <20240919165122.17751-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 7d3fd720478b..9aa6d30345e4 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -440,7 +440,7 @@ static int shrink_test_run_device(struct xe_device *xe)
 	LIST_HEAD(bos);
 	struct xe_bo_link *link, *next;
 	struct sysinfo si;
-	size_t ram, ram_and_swap, purgeable, alloced, to_alloc, limit;
+	size_t ram, ram_and_swap, purgeable, alloced, to_alloc;
 	unsigned int interrupted = 0, successful = 0, count = 0;
 	struct rnd_state prng;
 	u64 rand_seed;
@@ -451,25 +451,18 @@ static int shrink_test_run_device(struct xe_device *xe)
 	kunit_info(test, "Random seed is 0x%016llx.\n",
 		   (unsigned long long)rand_seed);
 
-	/* Skip if execution time is expected to be too long. */
-
-	limit = SZ_32G;
-	/* IGFX with flat CCS needs to copy when swapping / shrinking */
-	if (!IS_DGFX(xe) && xe_device_has_flat_ccs(xe))
-		limit = SZ_16G;
-
 	si_meminfo(&si);
 	ram = (size_t)si.freeram * si.mem_unit;
-	if (ram > limit) {
-		kunit_skip(test, "Too long expected execution time.\n");
-		return 0;
-	}
 	to_alloc = ram * 2;
 
-	ram_and_swap = ram + get_nr_swap_pages() * PAGE_SIZE;
+	ram_and_swap = get_nr_swap_pages() * PAGE_SIZE;
+	/* Don't use more that 4G swap to save execution time. */
+	ram_and_swap = min_t(size_t, ram_and_swap, SZ_4G);
+	ram_and_swap += ram;
+	purgeable = 0;
 	if (to_alloc > ram_and_swap)
 		purgeable = to_alloc - ram_and_swap;
-	purgeable += purgeable / 5;
+	purgeable += to_alloc / 128;
 
 	kunit_info(test, "Free ram is %lu bytes. Will allocate twice of that.\n",
 		   (unsigned long)ram);
-- 
2.46.0

