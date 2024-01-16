Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A61C47DA9
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 14:56:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E10A10E511;
	Tue, 16 Jan 2024 14:56:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1651310E5D4
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 14:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705416988; x=1736952988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YBgTBMOgCxufjbbnoKeHc32VWKQ9iD6KmOaaq4qyJnc=;
 b=buOn4V/3K6yB/GF0xiGQJ91/ILF3ZdHf6HogepiP7K6aP3MVhAtiEh5o
 qfXM/TwgRCaNE7krxdvwlYs4db4jH0cwIR+eBjZKiwAxeMkjDZ0QSD4E0
 Pg1kcx5Vss5hsliC4uYsAP73eHoiZVp3CrLfTwIesUhkxIPcp4ZuxllMS
 1il99dHE1bGIlEUyMXDfd6mapu2KYylLK1EPbOl0o8Dw5cS4AryVDtLBg
 wPzTVdukWks95Xgho1JChuXkxrLuas2Q5r9zy5Gjd+i+XFNQqww2Kwekt
 WQyKj5DEl7vKb3kzHp4RYAkcIsjbO740H4YbBJsKRFx995fmwdSKIVpnc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="466262438"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="466262438"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 06:56:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="854374872"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; d="scan'208";a="854374872"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.50.177])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 06:56:27 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/6] drm/xe: Assert size of the struct xe_reg
Date: Tue, 16 Jan 2024 15:56:12 +0100
Message-Id: <20240116145617.1177-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240116145617.1177-1-michal.wajdeczko@intel.com>
References: <20240116145617.1177-1-michal.wajdeczko@intel.com>
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

We want to keep the struct xe_reg as small as possible.
Make sure we don't accidentally change its size.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_reg_defs.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
index c50e7650c09a..114b07db962f 100644
--- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
@@ -6,6 +6,8 @@
 #ifndef _XE_REG_DEFS_H_
 #define _XE_REG_DEFS_H_
 
+#include <linux/build_bug.h>
+
 #include "compat-i915-headers/i915_reg_defs.h"
 
 /**
@@ -44,6 +46,7 @@ struct xe_reg {
 		u32 raw;
 	};
 };
+static_assert(sizeof(struct xe_reg) == sizeof(u32));
 
 /**
  * struct xe_reg_mcr - MCR register definition
-- 
2.25.1

