Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3177AC761A6
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 18:06:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0877510E544;
	Mon,  3 Apr 2023 18:06:40 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D7310E53F
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 18:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680545198; x=1712081198;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GVrIw2/4hOHB17hqPVIpdLU99HPO00iV19gjUrbM5yw=;
 b=MJumHoBI4wk5PhWNXIiTgXW/DpSDiWCdXG5rcQ+5eBAgpXXJ0Lbrtud+
 RQ4vOh2NNKxBhoxKYRQNoK/Fyvl+FeNH4C16+6PjwvwQpUL/4BhFGPFL0
 enF47YW7kjMo2Pa9pM0ErUMbwFZQCXVFsO007ch5NyzMvsDXiTiLbCAUi
 +qQUkBopl89u1eMxQEDuVVGJhAslAe3CZ/SRV7sugEWsF/C3NSElFIsur
 NS0L8A47y5vVuRYXFkUX2G5XEETSwHZfO7FS1ZNI7tuSavnGz3JLoOAFb
 Dvr7scJ6jX9WmUw7L1TNbQ0HgDv+yY1Tq+v5UzBgh0av/9besXeHv/WMh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="369787246"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="369787246"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 11:06:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="860307772"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="860307772"
Received: from unknown (HELO josouza-mobl2.fso.intel.com) ([10.230.18.148])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 11:06:27 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  3 Apr 2023 11:06:12 -0700
Message-Id: <20230403180614.197711-4-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403180614.197711-1-jose.souza@intel.com>
References: <20230403180614.197711-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 4/6] drm/xe/display: Enable modular fia in TGL
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

TGL is the first platform tha has it.
Enabling it for DG1 don't cause any issues as DG1 don't have any real
TC ports, so intel_tc_port_init() will not be called for DG1.

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_display.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index e9b3997c40287..8101ca940fbdb 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -486,7 +486,10 @@ void xe_display_info_init(struct xe_device *xe)
 	switch (xe->info.platform) {
 	case XE_TIGERLAKE:
 	case XE_DG1:
-		xe->info.display = (struct xe_device_display_info) { GEN12_DISPLAY };
+		xe->info.display = (struct xe_device_display_info) {
+			GEN12_DISPLAY,
+			.has_modular_fia = 1,
+		};
 		break;
 	case XE_ALDERLAKE_S:
 		xe->info.display = (struct xe_device_display_info) {
-- 
2.40.0

