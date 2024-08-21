Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9911FC52D6F
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 21:00:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A29D10E483;
	Wed, 21 Aug 2024 21:00:05 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FCFF10E46A
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 21:00:02 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2.1] drm/i915/display: Allowing looking up invalid modifiers
 to make xe happy
Date: Wed, 21 Aug 2024 22:59:59 +0200
Message-ID: <20240821205959.566669-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240821205637.552424-4-maarten.lankhorst@linux.intel.com>
References: <20240821205637.552424-4-maarten.lankhorst@linux.intel.com>
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

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_fb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index f23547a88b1fb..e049608dc65dc 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -382,6 +382,10 @@ bool intel_fb_is_tiled_modifier(u64 modifier)
  */
 bool intel_fb_is_ccs_modifier(u64 modifier)
 {
+	const struct intel_modifier_desc *desc = lookup_modifier_or_null(modifier);
+	if (!desc)
+		return false;
+
 	return plane_caps_contain_any(lookup_modifier(modifier)->plane_caps,
 				      INTEL_PLANE_CAP_CCS_MASK);
 }
-- 
2.45.2

