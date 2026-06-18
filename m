Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310B0CD98ED
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 09:52:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D074310EDB0;
	Thu, 18 Jun 2026 09:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LvWLP81R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E938F10ED8C;
 Thu, 18 Jun 2026 09:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781776355; x=1813312355;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f1dvI/ta2tXYzk8q4VCztgxtaKTjH0/UAyL2WpZBUno=;
 b=LvWLP81RGKVOZThWN3azsQ9HcJ+5PoqnufZITSO6fH9hnOLFiugJFkuL
 scQrRCFPgRw7R4SDAsnv9GH70+NWyfhqUFUjRc2HLJa4tzOotoOMW27JH
 B3JMPiYR3bqodDG+yaJW0w53qQ7KevyEU5XUugq7LSVZ7h6RDaYJ4W0SM
 2cKzPXB231FKxy61MHCDhLRPGTsOrFgWgHFsF1EuQ78dCuKbXWU9DB2jD
 3G8Let06aqArIymQe6iMDXpOVz8mgzTgCf6W0DaprcuVDCgRTQHv2nTzv
 GCbDtxm93qroTObIyz/zVFflqPTlKU/5CdE4DhZTRzg+PTLwRowTYlLv0 g==;
X-CSE-ConnectionGUID: PKlwbp1pTymYGbQGISj8zg==
X-CSE-MsgGUID: GlMzhKtsRmO82YRCDq1uug==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82476036"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="82476036"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 02:52:34 -0700
X-CSE-ConnectionGUID: oI2mZsFRQ6OcfiKwVu6yEQ==
X-CSE-MsgGUID: 0F0o0KXOTKG3/6NfjYzZLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="247175507"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.245.248])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 02:52:33 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v2] drm/i915/psr: Force fastset on debugfs write for each
 connector supporting PSR
Date: Thu, 18 Jun 2026 12:52:09 +0300
Message-ID: <20260618095210.853339-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Currently intel_psr_fast_set_force is forcing fastset only for eDP
connectors. Panel Replay is supported on DP as well and writing
i915_edp_psr_debug is setting debug parameters for each DP transcoder
(struct intel_dp:psr:debug). Force fastset for each connector supporting
PSR or Panel Replay. While modifying the code also switch to
for_each_intel_connector_iter.

v2:
  - use for_each_intel_connector_iter
  - update and improve commit message

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 911afb9cb24e3..622edfb6a7fb2 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -3375,7 +3375,7 @@ static int intel_psr_fastset_force(struct intel_display *display)
 	struct drm_connector_list_iter conn_iter;
 	struct drm_modeset_acquire_ctx ctx;
 	struct drm_atomic_commit *state;
-	struct drm_connector *conn;
+	struct intel_connector *connector;
 	int err = 0;
 
 	state = drm_atomic_commit_alloc(display->drm);
@@ -3389,14 +3389,15 @@ static int intel_psr_fastset_force(struct intel_display *display)
 
 retry:
 	drm_connector_list_iter_begin(display->drm, &conn_iter);
-	drm_for_each_connector_iter(conn, &conn_iter) {
+	for_each_intel_connector_iter(connector, &conn_iter) {
 		struct drm_connector_state *conn_state;
 		struct drm_crtc_state *crtc_state;
 
-		if (conn->connector_type != DRM_MODE_CONNECTOR_eDP)
+		if (!connector->dp.psr_caps.support &&
+		    !connector->dp.panel_replay_caps.support)
 			continue;
 
-		conn_state = drm_atomic_get_connector_state(state, conn);
+		conn_state = drm_atomic_get_connector_state(state, &connector->base);
 		if (IS_ERR(conn_state)) {
 			err = PTR_ERR(conn_state);
 			break;
-- 
2.43.0

