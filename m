Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0B2C83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 17 Jul 2025 15:54:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5AC10E312;
	Thu, 17 Jul 2025 15:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XQV0bdix";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD01C10E312
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Jul 2025 15:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752767667; x=1784303667;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9so5Anz1ElZmIwukvTesAXD6Itw+kd0pv26XZ34U9Q0=;
 b=XQV0bdixwl+dq1sDF0DmnrnuHn5pmMi3lp4k5OZKRcDzg/js592Ru7YD
 odeUwsbD6dOYmYpM431ZsOmlsHvv7U+JjQESbtZ51FC8XLVFEXH4lAJoi
 EWXOLj/psN2qDKbVc152NOAf7xW+NaHp/kaM2qfE8gM9x0MPOnN07LP8r
 uj382W8gHhdpqNcj+35n8pdepwCVUqLfvJP00ZWAOhZUp+JAJAIcLBhKb
 kPC8jR9RYqaz7Ozg4F4eJK9S6ZshfWA7N4RJjopidiUbydQ0eja7NFkOj
 e5ICKkRJ59r4Lurc6xKcuICIto3cTJJm67L8ISKDJF5wonXW+QScrshmg Q==;
X-CSE-ConnectionGUID: CmkMJW1sRq2lQ+QLsykTpA==
X-CSE-MsgGUID: NV9QKpB9S0u+nhx39q9pFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="42677450"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="42677450"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 08:54:26 -0700
X-CSE-ConnectionGUID: xaePAAo3RBWNUtZYUrIMVw==
X-CSE-MsgGUID: rPZMtpoKTcySZR7bx+vA1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; d="scan'208";a="158536482"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 08:54:25 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com,
	lukasz.laguna@intel.com
Subject: [PATCH] drm/xe/vf: Don't register I2C devices if VF
Date: Thu, 17 Jul 2025 17:54:20 +0200
Message-Id: <20250717155420.25298-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

VF drivers can't access I2C devices, so skip their registration when
running as VF.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_i2c.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index 1f19718db559..bc7dc2099470 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -283,6 +283,9 @@ int xe_i2c_probe(struct xe_device *xe)
 	if (xe->info.platform != XE_BATTLEMAGE)
 		return 0;
 
+	if (IS_SRIOV_VF(xe))
+		return 0;
+
 	xe_i2c_read_endpoint(xe_root_tile_mmio(xe), &ep);
 	if (ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
 		return 0;
-- 
2.40.0

