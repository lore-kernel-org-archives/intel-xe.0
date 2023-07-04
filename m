Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4746EB64D9
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 15:33:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C039510E1C5;
	Tue,  4 Jul 2023 15:33:00 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E2210E1C5
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 15:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688484778; x=1720020778;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FO2uy9IshiTFTiFmLelIQajEewRCr+ltQB2LzNpfmhw=;
 b=Xa20QRiTg64Cw5OwtU6DFkLgpkImgkd4HptNwhLTGZlnUCzGd06q7NKs
 66Y/IzVppl8dI+IQwuZMvZvlh0QiZUwRkpcylnQY3ZygSVCn5MuaC1UF7
 smqHRg1Xy4FXzU7sdeE/BeETzFiAMHMDn9m317tG+yyL9oYG4rjTEcQXf
 Bpaw+jjBRFqhMnhXU9LwLDzhOKhWR/mnlAR9YeG4W3VSbOEJ/wZ9lJAKn
 MNYgAfCEP4GA/lYnY+IWmBYLGQnMZ+PASmSS07PLAy8AigDN2rvjrr1rS
 AWJjfSTmh6mBQY8IP2m/fxO2X21gB5nRclieHzG5eMEaXIg0xzYVK55p4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="343480172"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="343480172"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 08:32:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="712913909"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="712913909"
Received: from jbouhlil-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.48.173])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 08:32:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  4 Jul 2023 18:32:41 +0300
Message-Id: <20230704153243.2489821-3-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704153243.2489821-1-jani.nikula@intel.com>
References: <20230704153243.2489821-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/4] drm/xe/mmio: add xe_mmio_read16()
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Little by little, make stuff feature complete.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 3c547d78afba..4953a9a3f1fb 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -31,6 +31,16 @@ static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
 	return readb(tile->mmio.regs + reg.addr);
 }
 
+static inline u16 xe_mmio_read16(struct xe_gt *gt, struct xe_reg reg)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+
+	if (reg.addr < gt->mmio.adj_limit)
+		reg.addr += gt->mmio.adj_offset;
+
+	return readw(tile->mmio.regs + reg.addr);
+}
+
 static inline void xe_mmio_write32(struct xe_gt *gt,
 				   struct xe_reg reg, u32 val)
 {
-- 
2.39.2

