Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A08DFB5E81
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 22:31:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1067710E3F7;
	Mon, 16 Mar 2026 22:31:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bzwj1yOK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE22510E3F7
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Mar 2026 22:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773700270; x=1805236270;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KOkoJ/9iLdB6bFo3RsXdoNdNnj6Te5rgHl4XrLTkHKQ=;
 b=Bzwj1yOK6sc4xvOnI0Ew6/H1Z0tMzHCdg8CubfFLWfbh9WG2iLU1p49k
 ueC+g4d4/WzkqWGkAJyIyd45/GeD25fMuW0UwGZbjtGrQ8ABQ/d8JORT9
 x/XITIHJpTzCYGivPCSGnqPDe9dhAMOn3f1Hlm7n2Isq3TYzY7oRtCLu7
 rTlsgTZTKwibSY3gZPebqP6CKtEFDKLptkX4Uc0dmT15n8jPNLKTornsQ
 1PwAQDwr7JUO5Z5wwKt8YTTaPfmYUfSzO52sTjLOnKDwvoC8KaKJGZK67
 venM0chf2o71V7jOT1CddAV7D7ANbm6titjrKxSXPlPJXgbAh0W9+xSWZ g==;
X-CSE-ConnectionGUID: h7Vm3uhBR62hnnoREC4SPw==
X-CSE-MsgGUID: CApcuqRkQZq23vgBxbS69Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="85043913"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="85043913"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 15:31:10 -0700
X-CSE-ConnectionGUID: A487vjV/ROKjIkL+9+pQWg==
X-CSE-MsgGUID: Xu/Pic49RPu674c+fNouFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="222274535"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by orviesa007.jf.intel.com with ESMTP; 16 Mar 2026 15:31:09 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/ggtt: Remove duplicate XE_GGTT_FLAGS_64K macro
 definition
Date: Mon, 16 Mar 2026 22:27:23 +0000
Message-ID: <20260316222723.1722591-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
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

XE_GGTT_FLAGS_64K is defined twice in xe_ggtt.c: once at file scope
(alongside XE_GGTT_FLAGS_ONLINE) and once inside struct xe_ggtt. The
duplicate inside the struct was originally the only definition when the
struct lived in xe_ggtt_types.h, but when commit 4f3a998a173b ("drm/xe:
Open-code GGTT MMIO access protection") added the file-scope definitions
for both FLAGS_64K and FLAGS_ONLINE, it did not remove the pre-existing
one inside the struct.

Remove the redundant definition inside struct xe_ggtt, keeping only the
file-scope pair at the top of the file.

Fixes: 4f3a998a173b ("drm/xe: Open-code GGTT MMIO access protection")
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 21071b64b09d..68d54ddfcdb1 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -115,7 +115,6 @@ struct xe_ggtt {
 	/** @size: Total usable size of this GGTT */
 	u64 size;
 
-#define XE_GGTT_FLAGS_64K BIT(0)
 	/**
 	 * @flags: Flags for this GGTT
 	 * Acceptable flags:
-- 
2.43.0

