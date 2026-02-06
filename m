Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEE5EA795C
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 05:03:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFE710E2FF;
	Fri,  6 Feb 2026 05:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xw2wtW3i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744A410E29E;
 Fri,  6 Feb 2026 05:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770354214; x=1801890214;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q3CGqflbld4xztl2k+rkudDcBj0Ky2f/zru2HWf0EdU=;
 b=Xw2wtW3iKIH9Ow1xTgxqJyPW/rmnqAnkM/mVgwegV6Bk9uQuGgZ9Px7J
 0EE/Kor08ZThs7hVstK0PYP4iv2E42n3bF9pEvxG4+FEEXxFfdi59cbP6
 FDq2NLSua0ogRLa9HceqxhXUMBKBQ8TfnvtdNy0F2jfLs6n+BejcNjr0a
 G3JbWhPa1+W9TbU9IMbynIsdFstHqvAfCegepxOvo2DRsnOXhOixhba9d
 c9XIBH7jWojobCML+eDKf3OEK0N5R1lNDPJRiDzipHFmekCV4mqeyhkmv
 Ybst8foZL8Xsgx3fyjW1EIo6ejUrs0Pu7sWygQ1ytEwxCHtIoekS5wktX A==;
X-CSE-ConnectionGUID: XikZ3jkARFWn+Ax33wTcqg==
X-CSE-MsgGUID: a5IR/1KYT+SVRLkokh/MCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="88984785"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="88984785"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 21:03:34 -0800
X-CSE-ConnectionGUID: MMC8ijJTQn+vUqNjrKekhw==
X-CSE-MsgGUID: +R5886MsRIeRGgALQLDFZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; d="scan'208";a="214935138"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 21:03:32 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, imre.deak@intel.com,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 2/2] drm/i915/dp: Restore the missing check for
 intel_dp_has_joiner
Date: Fri,  6 Feb 2026 10:17:53 +0530
Message-ID: <20260206044753.808631-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260205083623.793902-3-ankit.k.nautiyal@intel.com>
References: <20260205083623.793902-3-ankit.k.nautiyal@intel.com>
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

Commit ad121a62d566 ("drm/i915/dp: Rework pipe joiner logic in mode_valid")
replaced intel_dp_num_joined_pipes() with an explicit joiner candidate
iteration. The previous code implicitly checked for DP joiner capability
via intel_dp_has_joiner(), but this check was lost during the refactor.

Restore the missing intel_dp_has_joiner() check in intel_dp_can_join() so
that DP specific joiner conditions are taken into account.

v2: Derive intel_dp from intel_attached_dp(). (Imre)

Fixes: ad121a62d566 ("drm/i915/dp: Rework pipe joiner logic in mode_valid")
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 4f5b89f80e55..7da4310b399e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1397,9 +1397,14 @@ bool intel_dp_has_dsc(const struct intel_connector *connector)
 }
 
 static
-bool intel_dp_can_join(struct intel_display *display,
+bool intel_dp_can_join(struct intel_dp *intel_dp,
 		       int num_joined_pipes)
 {
+	struct intel_display *display = to_intel_display(intel_dp);
+
+	if (num_joined_pipes > 1 && !intel_dp_has_joiner(intel_dp))
+		return false;
+
 	switch (num_joined_pipes) {
 	case 1:
 		return true;
@@ -7218,8 +7223,9 @@ bool intel_dp_joiner_candidate_valid(struct intel_connector *connector,
 				     int num_joined_pipes)
 {
 	struct intel_display *display = to_intel_display(connector);
+	struct intel_dp *intel_dp = intel_attached_dp(connector);
 
-	if (!intel_dp_can_join(display, num_joined_pipes))
+	if (!intel_dp_can_join(intel_dp, num_joined_pipes))
 		return false;
 
 	if (hdisplay > num_joined_pipes * intel_dp_max_hdisplay_per_pipe(display))
-- 
2.45.2

