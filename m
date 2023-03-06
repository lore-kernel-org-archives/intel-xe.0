Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF96C6FA99
	for <intel-xe@archiver.kernel.org>; Mon,  6 Mar 2023 13:35:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB91F10E245;
	Mon,  6 Mar 2023 13:35:06 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CEEE10E245
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Mar 2023 13:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678109705; x=1709645705;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SQogCGgC0KCdkmkkL/L5zntGYBrIfyOzqOWA9ZvZf68=;
 b=RkU/z6Ana1nJtK/4o8RTzCg71OkjUSJ1UyutKLLu9tYpRhudtdYCPRnO
 0H7cuSdAPknSxVfowzAHAGTWSmAmsZl/rSCbtn9cg8GHYMHLmgqElFKDs
 Lywo0o7+BqXq864v7JOvQ3FAOF9nJ7VQTf0llUWcCEtw5tSpIDUA4xQgA
 anlC8mrF5lSySlMdemX2MD/51IznQd2qhZKBCc1xm2bn1jlUOLyi1eNF4
 bMo80D5QWXINF4F4z88+sKh6+s7+FwP7obze5S2bKcbV7WfQJ9+4yX93E
 dhwUA1FzUCBb+xzrbi8imNLj3nNDOJ7FMWzhEx6kGm2mjGXTNk7phWKKr A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="398133385"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; d="scan'208";a="398133385"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 05:35:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="740324377"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; d="scan'208";a="740324377"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 05:35:03 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Mar 2023 05:34:59 -0800
Message-Id: <20230306133459.7803-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe/migrate: Fix number of PT structs in
 docbook
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
Cc: dev@mblankhorst.nl, thomas.hellstrom@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Update xe_migrate_doc.h with 32 page table structs (not 48)

v2: minor typo fix

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_migrate_doc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate_doc.h b/drivers/gpu/drm/xe/xe_migrate_doc.h
index 6a68fdff08dc..63c7d67b5b62 100644
--- a/drivers/gpu/drm/xe/xe_migrate_doc.h
+++ b/drivers/gpu/drm/xe/xe_migrate_doc.h
@@ -21,7 +21,7 @@
  * table BOs for updates, and identity map the entire device's VRAM with 1 GB
  * pages.
  *
- * Currently the page structure consists of 48 phyiscal pages with 16 being
+ * Currently the page structure consists of 32 physical pages with 16 being
  * reserved for BO mapping during copies and clear, 1 reserved for kernel binds,
  * several pages are needed to setup the identity mappings (exact number based
  * on how many bits of address space the device has), and the rest are reserved
-- 
2.21.0.rc0.32.g243a4c7e27

