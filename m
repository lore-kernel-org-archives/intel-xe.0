Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B99C76188
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 16:47:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CECCC10E52E;
	Mon,  3 Apr 2023 16:47:03 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4373010E51D
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 16:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680540421; x=1712076421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f6ci8t3+mikhPAkY1ueA9DEnrgrVLtp8PkQWKcoboP0=;
 b=gj49VzPC9mHDamT8tjxA1P+GDO83twXIX60FLgGddrAEag9+AgaYenl8
 ZgYk5Q+Vw10gDerYIiOhuiB3Nw1iFaJrXqP42tQj+QNdwV2KBMAYW6MFw
 zChKtKekPl6K4orxh/KDHhmVCYCjsYyd89wTFArRKH5C3As1cmx8KTQmD
 QoYSTUTqov7llDvokpUfd9r7bXpwGpFjjtvR44j3h6L/EVT0UwXz/NM+i
 UTSFEOo0nnz8gQTnrvl5TnXfs1DdkFGFl/4mYAByw7lTWke3RKZ8ON5Ha
 LNouTgmwbtSQ6IOsPSm3eGCINPf0DeEMY/OunnuQjGHz1/cAQrxXyRJA7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="322350734"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="322350734"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 09:46:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="797132351"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="797132351"
Received: from unknown (HELO josouza-mobl2.fso.intel.com) ([10.230.18.148])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 09:46:29 -0700
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  3 Apr 2023 09:46:13 -0700
Message-Id: <20230403164615.131633-3-jose.souza@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403164615.131633-1-jose.souza@intel.com>
References: <20230403164615.131633-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/5] drm/xe/display: Enable modular fia in TGL
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
index be95d096fcc64..f3fdb53649cb1 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -488,7 +488,10 @@ void xe_display_info_init(struct xe_device *xe)
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

