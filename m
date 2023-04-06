Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8204FC76196
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 14:34:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D2010EC12;
	Thu,  6 Apr 2023 14:34:16 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC5E10EC13
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 14:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680791655; x=1712327655;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B/hiOVKjJ8br7HbeU6ymIT50pEUXTvKt8GylEcgJdME=;
 b=cVeyRYF92HsZdxcOlzAwKa3ZVkFMMnxrVM3o1mD1KYmqp+eEPEfnjNI4
 XUGCrX/cxWYIAT19mJZlqDRT6mOKM7hwT28US91uHa70WZtKh+IdfB48i
 3oRmsVK5Gu+IoY7EtxENtI0vACddKDwL+/sHFg2qhQIIsaUfywhUJD90l
 LjCKMMOs1EZjDToaAjCsrkaMCj21Dx1sEiIMq1RpHchVS85UJLmIjJXUf
 bMVq+/2NSj9+AC0IvTrbjZ5p02PwPdDJ4wyan8SVRKKlXrLINCPHwMuMd
 Uac+z8d3DPppYbfQerNlIidhqzOcz9wp/aS9VO0r1A9vz89O2F5/oWi7M A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="331384595"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="331384595"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 07:31:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="664488494"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="664488494"
Received: from josouza-mobl2.fso.intel.com ([10.230.18.148])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 07:31:46 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  6 Apr 2023 07:31:32 -0700
Message-Id: <20230406143133.29474-5-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230406143133.29474-1-jose.souza@intel.com>
References: <20230406143133.29474-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 rebased 5/6] drm/xe/display: Disable PSR HW
 tracking for DG2 and MTL
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

Of the platforms supported by Xe, only TGL and DG1 has PSR HW
tracking.

Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/xe/xe_display.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index 0001a9d02495d..edbc88500ed1e 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -469,7 +469,8 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 	.has_fpga_dbg = 1,						\
 	.has_hdcp = 1,							\
 	.has_ipc = 1,							\
-	.has_psr = 1
+	.has_psr = 1,							\
+	.has_psr_hw_tracking = 0
 
 #define XE_LPDP								\
 	XE_LPD,								\
@@ -502,8 +503,7 @@ void xe_display_info_init(struct xe_device *xe)
 		xe->info.display = (struct xe_device_display_info) {
 			XE_LPD,
 			.has_cdclk_crawl = 1,
-			.has_modular_fia = 1,
-			.has_psr_hw_tracking = 0,
+			.has_modular_fia = 1
 		};
 		break;
 	case XE_DG2:
-- 
2.40.0

