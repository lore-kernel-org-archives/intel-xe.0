Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09770CD3427
	for <intel-xe@archiver.kernel.org>; Sun, 10 May 2026 20:56:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C8510E0D1;
	Sun, 10 May 2026 20:56:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m3qevZeQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E1C10E0D1
 for <intel-xe@lists.freedesktop.org>; Sun, 10 May 2026 20:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778446580; x=1809982580;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eo6zfHQFl4JBrN7gJX7wmVzfhiKRmk6QKfAIm3RirJM=;
 b=m3qevZeQf7dqMJjEhi9zqoLoBfzZx8hkLbSsxv1E4F9F9dJINzv706xA
 ioScy7w6zWPxIyTyCrYJnr8IdP1LVx9Z2WuIZPmC80w4eilb1Sl/ihh9Z
 FA962xOxR0XCEbq6N9AzMvy1OidedtqR5kis88jWPFP9qqs5SmEtvC9Nz
 jbfP3GOgZUJ74gF6eL0NI+L2iRX0nz9piir9ro0Q4GMLrcs00amX1s2XA
 wcSKbdaSF0AtgkEgc9dvwKlCfkMRXOPp8qcLVH8hQQ7bg2yDN5ut+KUpP
 Sn+aYMotym/pRkBkK8yHWoXbvqw7IHG4KOQ39XEKRzSLQD/9pjQlnLa5T w==;
X-CSE-ConnectionGUID: QTmSXkJDQ/2kxxSzEPvpyQ==
X-CSE-MsgGUID: hdSzjEQmRnWFJerGIiT1iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79523319"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="79523319"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 13:56:19 -0700
X-CSE-ConnectionGUID: I4AuEw6FThiVpG1G16u8AA==
X-CSE-MsgGUID: M0NlKBmmStSm/8h0Iyf4mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="267640674"
Received: from unknown (HELO mwajdecz-hp.clients.intel.com) ([10.94.249.94])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2026 13:56:17 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH] drm/xe: Drop unused ggtt_balloon field
Date: Sun, 10 May 2026 22:56:05 +0200
Message-ID: <20260510205605.642-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

During recent GGTT refactoring we missed to drop now unused field
from the xe_tile. Drop it now.

Fixes: e904c56ba6e0 ("drm/xe: Rewrite GGTT VF initialization")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_tile_types.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tile_types.h b/drivers/gpu/drm/xe/xe_tile_types.h
index 33932fd547d7..0048100ccb72 100644
--- a/drivers/gpu/drm/xe/xe_tile_types.h
+++ b/drivers/gpu/drm/xe/xe_tile_types.h
@@ -106,8 +106,6 @@ struct xe_tile {
 			struct xe_lmtt lmtt;
 		} pf;
 		struct {
-			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
-			struct xe_ggtt_node *ggtt_balloon[2];
 			/** @sriov.vf.self_config: VF configuration data */
 			struct xe_tile_sriov_vf_selfconfig self_config;
 		} vf;
-- 
2.47.1

