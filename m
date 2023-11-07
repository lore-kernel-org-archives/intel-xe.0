Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A654C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 16:51:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E548B10E624;
	Tue,  7 Nov 2023 16:51:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5CC910E0CB
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 16:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699375872; x=1730911872;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FagaIswCYLf+oxsbb/mc9UM4uSGA1kFFj5GJGwSdQ7w=;
 b=FPFw+rcpqqHbMdJABnU26/7bjYTRutpa0DYeEaYKgYP/mVwGv793IAZF
 C3nJBrQB4hr42hSMPkyPse8oX3JeMw+3RZ/JRQBzDNzt/zMjqjcYnG4TE
 hhpAhMnqlAyLA6Juoes4b92xhuJ8OcntvNx1lSVNKmqeVPm8FuStTiY8P
 4UEqwoRa0WRF/w2pd+ZhgUWMWwvYLiWLsOViunx4G3qda63sM7ySTihs9
 TI+jjm8csAyGwKM6jufGPv9hVBxdo0aNCCxSU+nh0MISlcrdhpFTymAx7
 BlWpbx/M5DBspDAO+NAkVSfsplC2q6aVYauLZW+6ibyTygxO8ynYBoS7F w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="393451551"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="393451551"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 08:50:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="756252589"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="756252589"
Received: from shekharc-desk.iind.intel.com ([10.190.239.54])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 08:50:38 -0800
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  7 Nov 2023 22:20:26 +0530
Message-Id: <20231107165026.1797349-1-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/pvc: Add pci ids for PVC
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add two newly added PCI IDs for PVC

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 include/drm/xe_pciids.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
index fa1c8201c1cf..68fbab161feb 100644
--- a/include/drm/xe_pciids.h
+++ b/include/drm/xe_pciids.h
@@ -168,6 +168,8 @@
 
 /* PVC */
 #define XE_PVC_XT_IDS(MACRO__, ...)		\
+	MACRO__(0x0B69, ## __VA_ARGS__),	\
+	MACRO__(0x0B6E, ## __VA_ARGS__),	\
 	MACRO__(0x0BD5, ## __VA_ARGS__),	\
 	MACRO__(0x0BD6, ## __VA_ARGS__),	\
 	MACRO__(0x0BD7, ## __VA_ARGS__),	\
-- 
2.34.1

