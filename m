Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A393C4167B
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 11:36:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DAC710E353;
	Mon,  4 Dec 2023 11:36:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747CA10E351
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Dec 2023 11:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701689758; x=1733225758;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LXEPzIMU9Eb9sEnjg6gmkeZSMxNv0gPvWgHoeFMQftI=;
 b=MhVpNj2J6fHH2u8l5bWMprXrJwXuHs2US/RFdavwd/8FfKKehdFolVW9
 TTRupKxI8gavqtFZ/EbXmUpnb4OBl8DYtkLriD5sk/vldCJyKFUr14HOU
 GnwwH2yrzbbZO4oMXDRaGSrzghDV6i3UOXULzrehKTuNNd8qb28AHslQx
 XolvNEINaW62qP01m36PiQYuqLDLJj74seohxPjUJiXFKrfiGI4rdYv9w
 3SxDmqZ69fk9vNTEWbGs+AWLgQR31WzQxonTIiWUFxRZ4Dj/MyTQ6HLcm
 /b5EliMJKKgSr+BXjRC50zTxX/LINkbejWQoIaUqy0rwp0mCzpoY1EJI4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="617927"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="617927"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 03:35:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="720292746"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="720292746"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by orsmga003.jf.intel.com with ESMTP; 04 Dec 2023 03:35:56 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  4 Dec 2023 17:15:25 +0530
Message-Id: <20231204114525.791141-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Apply mask to RING IMR
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

As per bspec RING interrupt mask register will have
lower 16 bit masked by upper 16 bit.

Bspec 60352

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 444ff9b83bb1..d9013c698710 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -39,7 +39,7 @@
 #define RING_MI_MODE(base)			XE_REG((base) + 0x9c)
 #define RING_NOPID(base)			XE_REG((base) + 0x94)
 
-#define RING_IMR(base)				XE_REG((base) + 0xa8)
+#define RING_IMR(base)				XE_REG((base) + 0xa8, XE_REG_OPTION_MASKED)
 #define   RING_MAX_NONPRIV_SLOTS  12
 
 #define RING_EIR(base)				XE_REG((base) + 0xb0)
-- 
2.25.1

