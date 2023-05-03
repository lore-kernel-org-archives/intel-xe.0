Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB49C7EE22
	for <intel-xe@archiver.kernel.org>; Wed,  3 May 2023 13:11:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE34A10E29A;
	Wed,  3 May 2023 13:11:12 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F3610E29A
 for <intel-xe@lists.freedesktop.org>; Wed,  3 May 2023 13:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683119470; x=1714655470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jDg3Pw7DW/EugTiBJMYtDyJ1M6DjrYodYrvyztWBEVM=;
 b=D8lyFPV7vpjzlqyRR+GX9T9dRwFn36Kg0WoUBZV0OmQhxwkwIiiLEWVi
 2iVkgchwayR7hA2Tr/OFjXHIFnwWF4FwAdtM+oCJnmVaTGt+9GPbsfnw8
 K2RebgVgxMLRoCbY7TZkbIRCVXL+R+CBbDqY5MwU9bpXRYwFrjGCXMk0i
 9Un3WUORMwHTaPEgRUkdyK34VeDnU58xk/hEDhLoT1NLkOLax9XCZIitn
 gQkAX8qZ2Rrj7lqm2BnZBnc/uTINft6bwcBhiB3V+k0xolyIku6jHUnsO
 8vC9kY6ZJFAc9L+IhydMA3hFzkGk2Bdgy+qwnzJUP7gPzkEcBafLo5Odu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="350726796"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="350726796"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 06:11:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="1026493480"
X-IronPort-AV: E=Sophos;i="5.99,247,1677571200"; d="scan'208";a="1026493480"
Received: from ebrosekx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.204])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2023 06:11:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  3 May 2023 16:09:58 +0300
Message-Id: <20230503131005.1602412-12-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503131005.1602412-1-jani.nikula@intel.com>
References: <20230503131005.1602412-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 11/18] fixup! drm/xe: Introduce a new DRM driver
 for Intel GPUs
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add the read8 accessor to support intel_de_read8.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 1a32e0f52261..b72a0a75259f 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -17,6 +17,14 @@ struct xe_device;
 
 int xe_mmio_init(struct xe_device *xe);
 
+static inline u8 xe_mmio_read8(struct xe_gt *gt, u32 reg)
+{
+	if (reg < gt->mmio.adj_limit)
+		reg += gt->mmio.adj_offset;
+
+	return readb(gt->mmio.regs + reg);
+}
+
 static inline void xe_mmio_write32(struct xe_gt *gt,
 				   u32 reg, u32 val)
 {
-- 
2.39.2

