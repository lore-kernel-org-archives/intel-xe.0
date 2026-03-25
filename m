Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4D6FEC11B
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 11:08:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2635F10E867;
	Wed, 25 Mar 2026 11:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UsUHpLXD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E761410E865;
 Wed, 25 Mar 2026 11:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774436903; x=1805972903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p+9PZgOJtXhdVe7z5ER1GWY+9EdC0tMiZdNow41wc7g=;
 b=UsUHpLXDmNxDqZMp2l9kzidGLcKHIDv2lTNiMcr/KUcCfuSiTPV2YSEY
 zjB6JJ5DlMgg7Ty5uKMEThYiEWOFSZTgkJ1aaBpVABQtfkB3Td/tAw0Rv
 vIcz6ftoQkC699FhyA0gIf0yiZCHVsz4U7604lfKm4YJAbzKq8JiuQRY5
 wOmZMdttqNcF1wPj7lbEs9rJI0QnV1bGKRlR3xE6f8XsulwE/HP3hJJ4J
 +HbyK/beO7OneMPWxjTtiQ+6+SXmSw9eXRz7J5d/BTuW/Von+fJCJdF/N
 L6srAhMLnmmbjVG0sRf7ggR18D7V8RX0wnzdPfWVcZ7r6oUlxm9IazUVK g==;
X-CSE-ConnectionGUID: wFG86n1BSqygrwlB170ViA==
X-CSE-MsgGUID: sh6/IiQMT3OX3NiHSollqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="93047523"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="93047523"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 04:08:23 -0700
X-CSE-ConnectionGUID: xw1rLlvBTwWWSGlHp15fog==
X-CSE-MsgGUID: ZiNB9QV1THSIKJjh2j066g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="219798379"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa006.fm.intel.com with ESMTP; 25 Mar 2026 04:08:21 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: sowmiya.s@intel.com, uma.shankar@intel.com, swati2.sharma@intel.com,
 chaitanya.kumar.borah@intel.com, arun.r.murthy@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v3 13/26] drm/i915/writeback: Define function for connector
 function detect
Date: Wed, 25 Mar 2026 16:37:31 +0530
Message-Id: <20260325110744.1096786-14-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325110744.1096786-1-suraj.kandpal@intel.com>
References: <20260325110744.1096786-1-suraj.kandpal@intel.com>
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

detect function always returns connector_status_connected if
writeback connector has been initialized.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_writeback.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_writeback.c b/drivers/gpu/drm/i915/display/intel_writeback.c
index b9350d97de09..e677cdfa6207 100644
--- a/drivers/gpu/drm/i915/display/intel_writeback.c
+++ b/drivers/gpu/drm/i915/display/intel_writeback.c
@@ -154,11 +154,19 @@ static void intel_writeback_cleanup_job(struct drm_connector *connector,
 	job->priv = NULL;
 }
 
+static enum drm_connector_status
+intel_writeback_detect(struct drm_connector *connector,
+		       bool force)
+{
+	return connector_status_connected;
+}
+
 static const struct drm_encoder_funcs drm_writeback_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
 
 const struct drm_connector_funcs conn_funcs = {
+	.detect = intel_writeback_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_duplicate_state = intel_digital_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-- 
2.34.1

