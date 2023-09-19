Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EFACD3440
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 06:26:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E905B10E315;
	Tue, 19 Sep 2023 06:26:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A127B10E315
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 06:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695104794; x=1726640794;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GvOgzYgElAirJd8BASH4deGPgnVT1wUPBmlKCT7/zVw=;
 b=cZfPRjAQTfE1YSjHPqh42d2ra5SANGhj8W0aPyJbFhHv3oE50PDfgwP0
 4oQhJchDULYR6T5H3RF8JaLYwszZOjFE86jA/8UKbXiwghJyhQSL7D0qJ
 RH7dF22fy4yB7DkRZxzey1EWfRJK3rdLJhSEv4QQ6Y7yaST4lM53LHeId
 ZrNLEpo3datFi/AiOtBfQIQkbqILl8RPQ6TReKIuWDsWbxEzMC248KZ+Y
 p17KM3YtizxbCtM+WjLD0Bq6XwOLgcvoE0YpwzthySHPupMkNnZY6D7AB
 wgCjF5A1rz3KpZvtc/1r1QPWBij4D8l8T2387ZuwGRUbG/yLAF1k2cXad A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="364910900"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; d="scan'208";a="364910900"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 23:26:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="749343971"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000"; d="scan'208";a="749343971"
Received: from aravind-dev.iind.intel.com ([10.145.162.80])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 23:26:32 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 19 Sep 2023 12:06:11 +0530
Message-Id: <20230919063611.14236-1-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix kernel doc warning for PMU events
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

Add DOC keyword to PMU events comment in include/drm/xe_drm.h to make it
kernel doc format.

Fixes: 4a9681392cec ("drm/xe/pmu: Enable PMU interface")

Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 include/uapi/drm/xe_drm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 63863eda8355..6ab85c7fed36 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1054,7 +1054,7 @@ struct drm_xe_vm_madvise {
 };
 
 /**
- * XE PMU event config IDs
+ * DOC: XE PMU event config IDs
  *
  * Check 'man perf_event_open' to use these ID's in 'struct perf_event_attr'
  * as part of perf_event_open syscall to read a particular event.
-- 
2.25.1

