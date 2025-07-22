Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCE3C83F1A
	for <intel-xe@archiver.kernel.org>; Tue, 22 Jul 2025 12:56:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B74110E68E;
	Tue, 22 Jul 2025 12:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XDh+bsdv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E022110E689;
 Tue, 22 Jul 2025 12:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753188999; x=1784724999;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cpRNJnUt3ccdybAlSsjkkebZyJzi2RqSTfWujp6+OUs=;
 b=XDh+bsdvLNDti7oceKMMB1ZO4+z56PEmhWylFiLgYPMMvcoPLXrJdujr
 t+zVE9P6OsExq7gHg2TtfbgublNetW5232aLT+pCcG7Fwm4zluEJthoZD
 /qPxvZ8/mJj/RBRr/7ub0otXPzLDvJ0M+3yS5t5VZgnCmMWDr3BHms6SG
 v/NnEEUXrpSlaLd8szKS1/cGjFWfyadxzghJyyWUVchSPdDGtX8Uhay5d
 ljJewE+l6dbd4wlwVCpr48l9DIkz0XMC/UDODkEjKMA2/jd4nUmIb7n2E
 OXQ5oCxm26xU8wAsExDzOL+Yp2wEuXZeVKZ0fcZ5BLyAlqNqBf8QcFITz A==;
X-CSE-ConnectionGUID: 74q6JPIJRZi3N0hAmoe3WQ==
X-CSE-MsgGUID: VPJ+5XbrTT6Nhx/qHSH+ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="66121552"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="66121552"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 05:56:38 -0700
X-CSE-ConnectionGUID: m8s/PiY8R2+nJxdgoz3rqQ==
X-CSE-MsgGUID: UvRtsLhCQGu+k9zVgcfEug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="164604161"
Received: from agladkov-desk.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.245.0])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 05:56:37 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: gustavo.sousa@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH v3 4/4] drm/i915/display: Set C10_VDR_CTRL_MSGBUS_ACCESS
 before phy reg read
Date: Tue, 22 Jul 2025 15:56:18 +0300
Message-ID: <20250722125618.1842615-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722125618.1842615-1-jouni.hogander@intel.com>
References: <20250722125618.1842615-1-jouni.hogander@intel.com>
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

According to C10 VDR Register programming sequence we need set
C10_VDR_CTRL_MSGBUS_ACCESS before accessing PHY internal registers from
MsgBus.

v2: set C10_VDR_CTRL_MSGBUS_ACCESS once for all owned lanes

Bspec: 68962
Fixes: 9dc619680de4 ("drm/i915/display: Add function to configure LFPS sending")
Suggested-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cx0_phy.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
index a203937d66db..801235a5bc0a 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
@@ -3251,6 +3251,10 @@ void intel_lnl_mac_transmit_lfps(struct intel_encoder *encoder,
 
 	wakeref = intel_cx0_phy_transaction_begin(encoder);
 
+	if (intel_encoder_is_c10phy(encoder))
+		intel_cx0_rmw(encoder, owned_lane_mask, PHY_C10_VDR_CONTROL(1), 0,
+			      C10_VDR_CTRL_MSGBUS_ACCESS, MB_WRITE_COMMITTED);
+
 	for (i = 0; i < 4; i++) {
 		int tx = i % 2 + 1;
 		u8 lane_mask = i < 2 ? INTEL_CX0_LANE0 : INTEL_CX0_LANE1;
-- 
2.43.0

