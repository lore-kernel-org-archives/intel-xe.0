Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2987C636D3
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jan 2023 18:51:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B3410E004;
	Mon, 30 Jan 2023 18:51:03 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B1D10E004
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jan 2023 18:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675104661; x=1706640661;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H6zwl46peKkDwUJhuKrEvC4uDW0YKp7Tbdww6+LswM4=;
 b=BmLlxIV5OfvxNASWZ7OgpQX5wMy1utCulUA8eN/t7zqUQlLanwje4Uiz
 jHb86VjCpVdQ5KcYWvwicMXHX2EREJ+z+RlgCGFZQ6fCRyl19aY7yR8Yb
 D9JFllVJgCQp+mjmClBAHz9MMo+qH7Z2bi2G/PMYYCtsZ9NNpPML/0HKY
 GPOrbiQSpgkSc+jWb8+nOPWXE5VzQWs+PLHz6cPu6mjU5gu75CZYoamsq
 FsRLQyQaM9jpUwrA5COr1p2Wd9YyuJnh0HIPASlmZ6vf1EdRqCaEOpoV0
 gAmVubF2MgH7QaXRjWGT/zNeIl42hpNV3sXcyx3Vz+iBTLIfZtRn6TkW7 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="329754637"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="329754637"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 10:51:00 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="696522718"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; d="scan'208";a="696522718"
Received: from unknown (HELO josouza-mobl2.fso.intel.com) ([10.230.18.148])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2023 10:50:58 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 30 Jan 2023 10:50:53 -0800
Message-Id: <20230130185053.105296-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3] drm/xe: Add fake workaround to maintain
 backward compatible in MI_BATCH_BUFFER_START
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

i915 has the same fake workaround to return MI_BATCH_BUFFER_START
nested batch buffer behavior in DG2 and newer platforms to the same
behavior as older platforms.

So here cleaning up TGL_NESTED_BB_EN in MI_MODE to disable third level
chained batch buffer level.

v2:
- replace IP_VERSION_FOREVER by XE_RTP_END_VERSION_UNDEFINED
- move fake workaround to lrc_additional_programming table

v3:
- drop xe_wa_process_lrc_additional_programming()

Bspec: 45974, 45718
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 3325de3edf691..03fb7208c164d 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -288,6 +288,21 @@ static const struct xe_rtp_entry lrc_was[] = {
 	{}
 };
 
+static const struct xe_rtp_entry lrc_additional_programming[] = {
+	{ XE_RTP_NAME("FakeWaDisableNestedBBMode"),
+	  /*
+	   * This is a "fake" workaround defined by software to ensure we
+	   * maintain reliable, backward-compatible behavior for userspace with
+	   * regards to how nested MI_BATCH_BUFFER_START commands are handled.
+	   */
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1255, XE_RTP_END_VERSION_UNDEFINED)),
+	  XE_RTP_CLR(RING_MI_MODE(0),
+		     TGL_NESTED_BB_EN,
+		     XE_RTP_FLAG(MASKED_REG, ENGINE_BASE))
+	},
+	{}
+};
+
 static const struct xe_rtp_entry register_whitelist[] = {
 	{ XE_RTP_NAME("WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
@@ -360,6 +375,7 @@ void xe_wa_process_engine(struct xe_hw_engine *hwe)
 void xe_wa_process_lrc(struct xe_hw_engine *hwe)
 {
 	xe_rtp_process(lrc_was, &hwe->reg_lrc, hwe->gt, hwe);
+	xe_rtp_process(lrc_additional_programming, &hwe->reg_lrc, hwe->gt, hwe);
 }
 
 /**
-- 
2.39.1

