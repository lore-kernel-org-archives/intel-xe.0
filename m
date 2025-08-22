Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DB0CA0EEB
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 09:40:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3FA10EAB0;
	Fri, 22 Aug 2025 09:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DbCn6d6r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 061AC10EAAD
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 09:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755855656; x=1787391656;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SmcGQkd/xUaA9RWuW8K+O56KYwuS7Dq+cwPIL/8SQtI=;
 b=DbCn6d6rZGmBeITEqZhlz28DecyubZ9yKk/BdLk4FZfzCvHg70OEtksJ
 +MayD1qinst1jjPr09elePyLfRTGJRdh/owR+0hP1LjTD9Ir1TBiUs0ha
 82f4HK31ehYXHHCVk7OWrAkNZ2KebAw5nMF2Vl85TpBd3lumqOZmg2n9L
 d2DxrjHvTdKlnU+TPNm9So3UMAMEWHpFNGrhPtn/Nyirf8cOHUaBNvlNn
 gfSJIsZwr/GQzhz+mv/TxcoaBjtu0nM4JjvOQX1fE7CXgAH6bNS1jXGa6
 xK4SyWoLjcKnVxj4h3DfT0FhoITXLTrtsSOPofQr6k8hguPzXg7+yMu7D A==;
X-CSE-ConnectionGUID: TOBLsWi0S9uQAOxd595WpA==
X-CSE-MsgGUID: xh/bSHr3QlqrUhgjov2I4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="80760597"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="80760597"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 02:40:56 -0700
X-CSE-ConnectionGUID: R0I/lPzNSEaM0csl6LUKmw==
X-CSE-MsgGUID: oZ2gwabGRzq1/EArZ9XfMw==
X-ExtLoop1: 1
Received: from ncintean-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.244.108])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 02:40:54 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 02/16] drm/xe/tests/xe_dma_buf: Set the drm_object::dma_buf
 member
Date: Fri, 22 Aug 2025 11:40:16 +0200
Message-ID: <20250822094030.3499-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250822094030.3499-1-thomas.hellstrom@linux.intel.com>
References: <20250822094030.3499-1-thomas.hellstrom@linux.intel.com>
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

This member is set when exporting using prime. However
the xe_gem_prime_export() alone doesn't set it, since it's done
later in the prime export flow.
For the test, set it manually and remove the hack that set it
temporarily when it was really needed.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index c53f67ce4b0a..cde9530bef8c 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -57,16 +57,12 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
 		return;
 
 	/*
-	 * Evict exporter. Note that the gem object dma_buf member isn't
-	 * set from xe_gem_prime_export(), and it's needed for the move_notify()
-	 * functionality, so hack that up here. Evicting the exported bo will
+	 * Evict exporter. Evicting the exported bo will
 	 * evict also the imported bo through the move_notify() functionality if
 	 * importer is on a different device. If they're on the same device,
 	 * the exporter and the importer should be the same bo.
 	 */
-	swap(exported->ttm.base.dma_buf, dmabuf);
 	ret = xe_bo_evict(exported);
-	swap(exported->ttm.base.dma_buf, dmabuf);
 	if (ret) {
 		if (ret != -EINTR && ret != -ERESTARTSYS)
 			KUNIT_FAIL(test, "Evicting exporter failed with err=%d.\n",
@@ -139,6 +135,7 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
 			   PTR_ERR(dmabuf));
 		goto out;
 	}
+	bo->ttm.base.dma_buf = dmabuf;
 
 	import = xe_gem_prime_import(&xe->drm, dmabuf);
 	if (!IS_ERR(import)) {
@@ -186,6 +183,7 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
 		KUNIT_FAIL(test, "dynamic p2p attachment failed with err=%ld\n",
 			   PTR_ERR(import));
 	}
+	bo->ttm.base.dma_buf = NULL;
 	dma_buf_put(dmabuf);
 out:
 	drm_gem_object_put(&bo->ttm.base);
-- 
2.50.1

