Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECD4C77B7F
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 14:47:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8973210E2E5;
	Mon,  8 May 2023 14:47:30 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB7A10E2E9
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 14:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683557247; x=1715093247;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jDg3Pw7DW/EugTiBJMYtDyJ1M6DjrYodYrvyztWBEVM=;
 b=KL8ckruChRRInRjS/MM/JMdZJF+4MHyRRoLp060leZ/q2a2WMv2c3xYq
 u6AFOHFQMd2jmZwpfxEF1bXy+EYH+v7eyfV1wcDycxnsPGI54ujRXpoCY
 smxdSAfDIfAc0KEGh0qt6KAR4YMVid52GoiacCOq4aeEUI0JwSzE33yZG
 lnSuOstdRxsixS2xjePsXcvF0ryJ4Hr9IEjGx8MYPAiKkrJxfFfo8O+Ec
 xYiH2QA1hkPbL73+7CaZoxZG8ZvlBawZgCDA9QKX4OKyxNSZo5z29spq1
 KbI/BUcEa0otvUyxkaha7cr4HLmmaDZelBaB09UMxcBeFUp7wdsGYW8x/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="349697916"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="349697916"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 07:47:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="648908168"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="648908168"
Received: from heid-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.62.78])
 by orsmga003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 07:47:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  8 May 2023 17:46:11 +0300
Message-Id: <20230508144618.162140-12-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508144618.162140-1-jani.nikula@intel.com>
References: <20230508144618.162140-1-jani.nikula@intel.com>
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

