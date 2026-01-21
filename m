Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD22C44506
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 21:42:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3D210E1D4;
	Wed, 21 Jan 2026 21:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fH7Pe05U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D07B10E88E
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 21:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769031755; x=1800567755;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G32pqJnW+zPZRxNP87mryshO7z+1nYZjkdtaHwUFk2g=;
 b=fH7Pe05UsI7XlkwP/yepCNxEEDcpeBSIQ6qM/oU3wmSBtuuNiJhefiEG
 VBkWkyKgSkg75obWjs9Bk0ePK66CFdf9rmJKsBULiznO2EyE8GkNSrEjb
 J1LnHsY5FPpnjWnmSHLAL7vcHQxTr5kNcRB2X50DfboYhbxmrNKWGihZ5
 0FjHSieQHfybjmjO6/ZK1MzmO20Mko5UKkIIjxmLMgV41NUpmeS/PYYoh
 Zl9rzWXfW6sJKkKAIMR6KnPEdjNtVOeqdgRsX1iDGKq9XuL6pWttEUkNm
 3+QyQ8DH2tUkOQb83agYqBDhTiZ+kndqLAPqBFznDoClPXvMZqObCvTTB Q==;
X-CSE-ConnectionGUID: /DeMKSgGQD6KFAJ7oK+oWA==
X-CSE-MsgGUID: 1fZdTcWOSsq9SUZ0tjiQ+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70433938"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="70433938"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 13:42:34 -0800
X-CSE-ConnectionGUID: NGwg5yo6QyKusd5QHWK/uA==
X-CSE-MsgGUID: ovH0AjMHQoKAVe+SXhf1mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="205691617"
Received: from lalin-p14sg4.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.33.19])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 13:42:32 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/5] drm/xe/configfs: Use proper notation for local include
Date: Wed, 21 Jan 2026 22:42:13 +0100
Message-ID: <20260121214218.2817-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260121214218.2817-1-michal.wajdeczko@intel.com>
References: <20260121214218.2817-1-michal.wajdeczko@intel.com>
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

For local includes we should use "" notation, not <>.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index fed57be0b90e..510888354a7c 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -8,7 +8,7 @@
 #include <linux/limits.h>
 #include <linux/types.h>
 
-#include <xe_hw_engine_types.h>
+#include "xe_hw_engine_types.h"
 
 struct pci_dev;
 
-- 
2.47.1

