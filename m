Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F095C77B60
	for <intel-xe@archiver.kernel.org>; Tue, 21 Mar 2023 22:06:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6824410E100;
	Tue, 21 Mar 2023 22:06:26 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4415310E090
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Mar 2023 22:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679436380; x=1710972380;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zxHMr7bbJM/qaURVIyduPa1eqXhgPbQPLPIksnxFW4c=;
 b=BHCN2WU7JiZn1qLo+YT+p9NAW9dHwPp3qqSTyC6urbAlWpDTgS+Gqzvb
 ioY/4oxzI9Z+pR7WiYOsrscZlEpQqz2aT9+yVRBTilp1K4h3siBYpJwCC
 dOA5H//Do3Ai6kOj61EFfanwBWfLixDCTZN+PMLb1CU0H3xliWB7Y+gw7
 DKiVA7F4nM2wb9IKnYZQq9Pf6fWWUJRqhTGrgTghtzw+eCwgVCXKm6G7p
 JvUQKwFm9gp1GHBCjRtM9uyJIrP5Vw5mbrYBTqC3MeWsZhlTQ9/SvlrRY
 p4kHDUVdB3yjFrZRHKZQd8T+uwvKBckv7XasuPJJlky7ILFQ/rcZKR7mK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="339109502"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="339109502"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 15:06:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="684065712"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; d="scan'208";a="684065712"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 15:06:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Mar 2023 15:05:26 -0700
Message-Id: <20230321220527.595462-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230321220527.595462-1-lucas.demarchi@intel.com>
References: <20230321220527.595462-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/7] drm/xe/reg_sr: Save errors for kunit
 integration
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

When there's an entry that is dropped when xe_reg_sr_add(), there's
not much we can do other than reporting the error - it's for certain a
driver issue or conflicting workarounds/tunings. Save the number of
errors to be used later by kunit to report where it happens.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_sr.c       | 8 ++++++++
 drivers/gpu/drm/xe/xe_reg_sr_types.h | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 9eaf1be27886..83f29aeb9250 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -84,6 +84,13 @@ static bool compatible_entries(const struct xe_reg_sr_entry *e1,
 	return true;
 }
 
+static void reg_sr_inc_error(struct xe_reg_sr *sr)
+{
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+	sr->errors++;
+#endif
+}
+
 int xe_reg_sr_add(struct xe_reg_sr *sr, u32 reg,
 		  const struct xe_reg_sr_entry *e)
 {
@@ -121,6 +128,7 @@ int xe_reg_sr_add(struct xe_reg_sr *sr, u32 reg,
 	DRM_ERROR("Discarding save-restore reg %04lx (clear: %08x, set: %08x, masked: %s): ret=%d\n",
 		  idx, e->clr_bits, e->set_bits,
 		  str_yes_no(e->masked_reg), ret);
+	reg_sr_inc_error(sr);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_reg_sr_types.h b/drivers/gpu/drm/xe/xe_reg_sr_types.h
index 3d2257891005..91469784fd90 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr_types.h
+++ b/drivers/gpu/drm/xe/xe_reg_sr_types.h
@@ -32,6 +32,10 @@ struct xe_reg_sr {
 	} pool;
 	struct xarray xa;
 	const char *name;
+
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+	unsigned int errors;
+#endif
 };
 
 #endif
-- 
2.39.0

