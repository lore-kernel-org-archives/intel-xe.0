Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB79D767C5
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 10:23:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9DF710EE3E;
	Fri, 19 Dec 2025 10:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QnIpHnsd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C5710EDA5
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 10:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766139789; x=1797675789;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eMGo77EY3FchwZCSxZ1rKuaPb2Xdd56y6gAJriDtGu4=;
 b=QnIpHnsdFEZvP9i3i94GX0Krh235Biu3HsUROV/E3L+HRynS85GJU8AW
 fI7E4bNP70bjbqVSkFjoA0yb10ZIxa9EAE5JmRlA5QIGyk7KKHB7ImVPZ
 famNz6uVs7wHV/9gohNVuGEo9Y52OYGqwccDwRfZkjLOweJsVTLzdZrjW
 LDx5NVN3DUuGbJROLHmOg0BAxNUMlXZRk9yw1qR0h7ZPZUIBhGjIYoBuM
 2venVYd+gUR2gGCnK1lS4vWIPS2BJvUTYYb8DmLbDOPmBcidH9Nq9LsQL
 fhwRzmIyJt2hJBSNR09hSKUCTBbKluvg2WV5pzNLtCWtHph10If1ilsIm Q==;
X-CSE-ConnectionGUID: LwmAC8ZySyivy48AJcm4eA==
X-CSE-MsgGUID: 05tx6m9bSjOaxFX0xbb3sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67995804"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="67995804"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 02:23:09 -0800
X-CSE-ConnectionGUID: dmBoY//ARqukL2yjJaJJTA==
X-CSE-MsgGUID: TTmOkxdYQcyNrlfBjqTzcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="199647400"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 02:23:07 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com, jonathan.cavitt@intel.com
Subject: [PATCH v3 2/2] drm/xe/xe_survivability: Add index bound check
Date: Fri, 19 Dec 2025 16:22:27 +0530
Message-ID: <20251219105224.871930-6-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20251219105224.871930-4-riana.tauro@intel.com>
References: <20251219105224.871930-4-riana.tauro@intel.com>
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

Fix static analysis tool reported issue. Add index bound check before
accessing info array to prevent out of bound.

Fixes: f4e9fc967afd ("drm/xe/xe_survivability: Redesign survivability mode")
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_survivability_mode.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
index e6e326dfb92b..ce55859a9a84 100644
--- a/drivers/gpu/drm/xe/xe_survivability_mode.c
+++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
@@ -258,10 +258,14 @@ static umode_t survivability_info_attrs_visible(struct kobject *kobj, struct att
 	struct xe_survivability *survivability = &xe->survivability;
 	u32 *info = survivability->info;
 
-	/* FDO mode is visible only when supported */
-	if (idx >= MAX_SCRATCH_REG && survivability->version >= 2)
+	/*
+	 * Last index in survivability_info_attrs is fdo mode and is applicable only in
+	 * version 2 of survivability mode
+	 */
+	if (idx == MAX_SCRATCH_REG && survivability->version >= 2)
 		return 0400;
-	else if (info[idx])
+
+	if (idx < MAX_SCRATCH_REG && info[idx])
 		return 0400;
 
 	return 0;
-- 
2.47.1

