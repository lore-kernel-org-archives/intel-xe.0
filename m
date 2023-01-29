Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4E5C05027
	for <intel-xe@archiver.kernel.org>; Sun, 29 Jan 2023 21:31:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781ED10E009;
	Sun, 29 Jan 2023 21:31:00 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E1A510E009
 for <intel-xe@lists.freedesktop.org>; Sun, 29 Jan 2023 21:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675027859; x=1706563859;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=71m4KF2Fw5jBU4+1iZAyQuN/riJ4lZQURAsTvb3FnvM=;
 b=ch4wdx7fzvtNHWG6I5Xdg9xaiuiR7FcREqYZKmM9kIGz90ZgCL30JKFJ
 5dITyQ77BAkdHG1dpgdIOWaQVj9BoUTjBKKYHXRtxDhBohA9eOVrv/TAg
 xJZVfT0AM6Ucm7/OII9TJCh6LuRoQCXQK+P0TI7OUkOqArhcob/PIJdU4
 V2Ycuphl1csrYpp1dVsiP/DPzNmhEiOmKy2Liu4WUBTGdVghS09mkyER3
 FeQsCV70LT4cWoFD7pDuihaIPuGfMzsujILjgZAX+IFXB15Mrk7SirpHO
 vMpQgVvApeStsZGfIWOyG5ru8xybLOZPoBK8tU4wy8xT9mdJzaOunHD9u w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="413656379"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; d="scan'208";a="413656379"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2023 13:30:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="752602352"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; d="scan'208";a="752602352"
Received: from davidcao-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.10.127])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2023 13:30:55 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sun, 29 Jan 2023 13:30:44 -0800
Message-Id: <20230129213044.100693-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Add fake workaround to maintain backward
 compatible in MI_BATCH_BUFFER_START
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

i915 has the same fake workaround to return MI_BATCH_BUFFER_START
nested batch buffer behavior in DG2 and newer platforms to the same
behavior as older platforms.

So here cleaning up TGL_NESTED_BB_EN in MI_MODE to disable third level
chained batch buffer level.

Bspec: 45974, 45718
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp_types.h |  2 ++
 drivers/gpu/drm/xe/xe_wa.c        | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
index 14e5d4dbb4c15..72f3e2e83014f 100644
--- a/drivers/gpu/drm/xe/xe_rtp_types.h
+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
@@ -52,6 +52,8 @@ enum {
 	XE_RTP_MATCH_FUNC,
 };
 
+#define IP_VERSION_FOREVER 9900
+
 /** struct xe_rtp_rule - match rule for processing entry */
 struct xe_rtp_rule {
 	u8 match_type;
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 3325de3edf691..3616b2284d186 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -285,6 +285,17 @@ static const struct xe_rtp_entry lrc_was[] = {
 		     DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE,
 		     XE_RTP_FLAG(MASKED_REG))
 	},
+	{ XE_RTP_NAME("FakeWaDisableNestedBBMode"),
+	  /*
+	   * This is a "fake" workaround defined by software to ensure we
+	   * maintain reliable, backward-compatible behavior for userspace with
+	   * regards to how nested MI_BATCH_BUFFER_START commands are handled.
+	   */
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1255, IP_VERSION_FOREVER)),
+	  XE_RTP_CLR(RING_MI_MODE(0),
+		     TGL_NESTED_BB_EN,
+		     XE_RTP_FLAG(MASKED_REG, ENGINE_BASE))
+	},
 	{}
 };
 
-- 
2.39.1

