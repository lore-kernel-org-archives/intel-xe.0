Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98A4CA5FD7
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 14:35:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BBB010E7CB;
	Wed, 21 Jan 2026 14:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CoBcO8l/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F8010E7CB
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 14:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769006146; x=1800542146;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lpvl2MnPG3U1z5NNHo6jZjE5r6LRnQfeZjsWQQJFFx8=;
 b=CoBcO8l/j19kZlorHqn18NcTax2gp+b3JwjqHDaFF7ibHZnG9oe3dmGZ
 erEmJzWgt0XRFB+tjyNJ6hb9wIRQRolX3Mpd4TrejDOMD5TS2+gjJkYqK
 R/piv+X6MaEPzIr1RVq9JXFVqPadPpHJH54hCFNnrKapFr1NCy2zKG1yF
 TSAHswY6zKvNrPHVt4K9VroddtU+8EQAZw1nSxOWcStPzEbWxv8DHKk7+
 QB9LdP4GuLXHDki7fFwj+HpqahcZJLTmgOpDAWfoTwW7lFUFRmMHFGmzq
 rD8xJGSjnP6B9BwRdOBfkLzw8IzEQyBbzgTiC3SvaCSRyIjsinjfh7eIC g==;
X-CSE-ConnectionGUID: 79MswE8URV6n+ltpYIVUaQ==
X-CSE-MsgGUID: C0nvFnPpQ46bM3T9iLgoIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="87645212"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="87645212"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 06:35:46 -0800
X-CSE-ConnectionGUID: CzQnl8aZRpmqBwqqrVf94w==
X-CSE-MsgGUID: nbQnazZwRFa30RGyuWqcBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="237706640"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 06:35:43 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH] drm/xe/xe3p: Disable GuC Dynamic ICS for Xe3p
Date: Wed, 21 Jan 2026 20:07:33 +0530
Message-ID: <20260121143732.523081-2-balasubramani.vivekanandan@intel.com>
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

From: Gustavo Sousa <gustavo.sousa@intel.com>

The Dynamic Inhibit Context Switch (ICS) feature is not currently
supported on Xe3p due to conflict with multi-queue feature on the GuC
side. Disable ICS so multi-queue can be introduced for Xe3p platforms.

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 44360437beeb..e350ded92544 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -608,6 +608,13 @@ static bool supports_dynamic_ics(struct xe_guc *guc)
 	if (xe_gt_is_media_type(gt) || gt->ccs_mode > 1)
 		return false;
 
+	/*
+	 * The feature is currently not compatible with platforms with support
+	 * to multi-queue, even if the feature is not enabled/used.
+	 */
+	if (GRAPHICS_VER(xe) >= 35)
+		return false;
+
 	/*
 	 * Dynamic ICS requires GuC v70.40.1, which maps to compatibility
 	 * version v1.18.4.
-- 
2.43.0

