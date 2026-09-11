Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B3BC88E41
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 04:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 937A610E01F;
	Fri, 11 Sep 2026 04:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hrrgmxQl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3E710E01F
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 04:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789101647; x=1820637647;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1Bpk7B8g5gjvhmfTvOQoptAm+itcWQre2LzwKyFD1aU=;
 b=hrrgmxQlwu8mBOJG6bRJv6LxhYY9xNM2ZtUYktgPww9a1Rsib26sqE0R
 ywNVBG3vv1gLZknwzsyQtKFtwMIqJfp7yRtlxmuKm29C1jhJu51J+RG9v
 /reAs/3+jTIN90V+v7fZygguVtDlUcnBkdJVO1vhdERuj3f1w1x4pDegP
 QYdyui2vfF6TKjFo8z0C8Xmo4bhh7u6x6PnLd1+6WSYyWgXHRZadUcqV5
 eno7ElhrccYB7gx2kTS9wy2QCJ6gFf32MfP+vKD7qOKiikECmBnTBmy9B
 Kuwq5haBiCAZHhIC0g7KX6kW4+2XZueZtLofWEbjD2j1K15RPzHLowlis g==;
X-CSE-ConnectionGUID: 34CZzCEzQe+gpTX+LXxDbA==
X-CSE-MsgGUID: jw+3yqjqQJaWKSvcYcKx0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="99893798"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="99893798"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 21:40:46 -0700
X-CSE-ConnectionGUID: z7UWCboXSGOV28Q7yVtspQ==
X-CSE-MsgGUID: vROlSwjqQrqBA2/Qbf0/fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="271345495"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa008.jf.intel.com with ESMTP; 10 Sep 2026 21:40:45 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: heikki.krogerus@linux.intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/i2c: Disable IRQ on unbind
Date: Fri, 11 Sep 2026 10:10:21 +0530
Message-ID: <20260911044021.2393342-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

Currently, struct xe_i2c is freed before SGUnit IRQ is disabled, leaving
a potential UAF in case the IRQ is hit in that small window. Explicitly
disable I2C IRQ as part of xe_i2c_remove() and fix this.

Fixes: 0bb78ce09926 ("drm/xe/i2c: Wire up reset/postinstall for I2C IRQ")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_i2c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index d8fa68206f41..82b22c5412ba 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -324,8 +324,10 @@ void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold)
 static void xe_i2c_remove(void *data)
 {
 	struct xe_i2c *i2c = data;
+	struct xe_device *xe = tile_to_xe(i2c->mmio->tile);
 	unsigned int i;
 
+	xe_i2c_irq_reset(xe);
 	xe_amc_exit(i2c);
 
 	for (i = 0; i < XE_I2C_MAX_CLIENTS; i++) {
-- 
2.43.0

