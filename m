Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FD9CD691B
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 09:41:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C26A210E1BE;
	Tue, 10 Oct 2023 09:41:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595A110E1BE
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Oct 2023 09:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696930872; x=1728466872;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hnEqN7mYJNnDEflHD5043A9vJkU/H+bTlzRpZpK0Xko=;
 b=K6//hrED+gsdu6m1CY6Cpfu49wHrukCkTRa1EqC1OkKdctul4dEFkbeI
 EUp/u4oKmTi0Ax/4hcTNCoZfPPXSJ76CKhinYaaS82HVk9atFd8YKC0KT
 F/1HYQ6Rl7WIZsr3VZWDHjQbIT5xgY7CBzpznR0UbneIqtKH+g4KDeL04
 +ylGOG9tY+tzhrtzWwNlYALdoB+BhvBaXuvO0t9ra2U5RkrnXgzbyzNEG
 A92OfnS10Bv9sPNOGSskQhCg3Efm76Z6GwA3M3VBdz7c98/wF9BK6GQA0
 TvIbrGwaxPzEQ3kbMXpIjbWKD6PBQPxNp1jlASGRTHuMfA2ZpP9Uv/093 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="381611161"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="381611161"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 02:40:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="897111112"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="897111112"
Received: from sereda-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.251.222.216])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 02:39:04 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 10 Oct 2023 09:40:31 +0000
Message-Id: <20231010094031.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe/hw_engine: Document difference between
 instance and logical instance
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add explanation provided by Matt next to the definition, so that
it can easily found later.

v2: Fix typos, make comment more generic, remove FIXME (Rodrigo Vivi)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c       |  1 -
 drivers/gpu/drm/xe/xe_hw_engine_types.h | 11 ++++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index b5b084590888..ee7066041a29 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -474,7 +474,6 @@ static void hw_engine_setup_logical_mapping(struct xe_gt *gt)
 {
 	int class;
 
-	/* FIXME: Doing a simple logical mapping that works for most hardware */
 	for (class = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
 		struct xe_hw_engine *hwe;
 		enum xe_hw_engine_id id;
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index 5d4ee2904240..ccf014f5f994 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -114,7 +114,16 @@ struct xe_hw_engine {
 	enum xe_engine_class class;
 	/** @instance: physical instance of this hw engine */
 	u16 instance;
-	/** @logical_instance: logical instance of this hw engine */
+	/**
+	 * @logical_instance: logical identification of this hardware
+	 * engine. A 0..n sequencing number assigned at driver
+	 * initialization for each engine of a giving class of a specific
+	 * GT. Although it is per-class and per-GT, it might be different
+	 * from the @engine on platforms where we can have gaps on the
+	 * hardware assigned number such as platforms where we have VCS0
+	 * and VCS2, but no VCS1. Only logical instance numbers should be
+	 * exposed to user space.
+	 */
 	u16 logical_instance;
 	/** @mmio_base: MMIO base address of this hw engine*/
 	u32 mmio_base;
-- 
2.34.1

