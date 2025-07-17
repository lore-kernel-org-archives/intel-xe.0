Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6B8C83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 06:36:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29CA410E6B0;
	Thu, 17 Jul 2025 06:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V2+Fvm3Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5759310E6B0
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 06:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752734174; x=1784270174;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o7Wjt8cPM1T2sqxn96VLm5KcJuDDcP4oR9z4oLW4liE=;
 b=V2+Fvm3QwxGvBN4SYOR2WNiIfmtOr3AuqONYIaYHb48acbrD8rcSh6nY
 sS1NzsDZE4j+hiw7OPp8/FI9N+rPC7BrNttEJEWSpqpO2xnh7s39mX16L
 BYqDZ6vYjcvQEPkdRqF0pueSjKpcFqtFsbqTEhw+aZnvmkI63pbwgZnTz
 9JvYLv/xYdu7RohQHq7jDpI0URbYfryuc4Z3TPNTyIP6NSaOyGbiAzCzW
 SVpnp+v/WYAKSPhfBzxdF3KuBy4cOUGJvS9ANmjD4BopC/2zfm8ROv886
 haiel8BedPlvXRnPysNC1qmrp86OI3r9wYTgK+v7xwcvGXU4XqcFec0FW A==;
X-CSE-ConnectionGUID: aVxRenvaTUK6F5vlfEbT8g==
X-CSE-MsgGUID: AewyQf6FQHGqFqDiPV6JzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54214633"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; d="scan'208";a="54214633"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 23:36:14 -0700
X-CSE-ConnectionGUID: fnoCdKRAQyWgr8Wf+oZN0A==
X-CSE-MsgGUID: DhxYtf1kRZS4XwtnKByYAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; d="scan'208";a="157102680"
Received: from unknown (HELO priyanka.iind.intel.com) ([10.190.216.153])
 by orviesa010.jf.intel.com with ESMTP; 16 Jul 2025 23:36:13 -0700
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com,
	intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/uapi: Add documentation for
 DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING
Date: Thu, 17 Jul 2025 12:06:11 +0530
Message-Id: <20250717063611.3280681-1-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add documentation for drm_xe_gem_create structure flag
DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 include/uapi/drm/xe_drm.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index e2426413488f..0e87609f9ad1 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -760,7 +760,10 @@ struct drm_xe_device_query {
  * gem creation
  *
  * The @flags can be:
- *  - %DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING
+ *  - %DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING - It changes allocation strategy
+ *    by deferring memory allocation until VM_BIND time or when the GEM object
+ *    is accessed by the CPU. This means that no memory is allocated at the time
+ *    of GEM object creation, avoiding immediate eviction of other buffer objects.
  *  - %DRM_XE_GEM_CREATE_FLAG_SCANOUT
  *  - %DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM - When using VRAM as a
  *    possible placement, ensure that the corresponding VRAM allocation
-- 
2.34.1

