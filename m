Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63FB6CA0FF0
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 16:04:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD6010E1A5;
	Fri, 29 Aug 2025 16:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CCCFVT1W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D7010E1A5
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 16:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756483480; x=1788019480;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=534fBMrev/joXHzYDtQF4jsqQYjt1D9VuJMW7mqW020=;
 b=CCCFVT1WMPdH8vS8T8AAj0lSOFeLwRCrJ3KnBvZHtkZb/UjkccAyKDSW
 plPZFqr5QLaeFVfL/FbBRbOpK0ckzy9nVZTFpvAPIWot3LTUXkX6OYm7b
 UPu9z+hLIN7alI25uvkT9A3IYCkfl289FzwMUUWh12Nnz8kAlBlmzGVuY
 MPrlIr67a3plb8gJPQjrUafsey1yjcVo7nw6Qy/Mw0JY+aN8l70txefPk
 3j1NMPEgDdhuqZYvKfamNdUhUm9fxbKdl0lDHICG6f58OQWVE0Hggxi9m
 sjun7S61g/l0dOeqy+zvxxVU/CYDtwBcCDNXRC5yTfgIAVJIzzC3gvoEL Q==;
X-CSE-ConnectionGUID: 2ML1wAPRTAihcMqO1svHdQ==
X-CSE-MsgGUID: E+dr8ZLTQUC6Cy3FxVYfRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="69480890"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="69480890"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 09:04:31 -0700
X-CSE-ConnectionGUID: u4Qi7WiQS5eQucf0WLX2mQ==
X-CSE-MsgGUID: DzGk7+KsTJyC/zI+wRlK5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170583328"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa008.jf.intel.com with ESMTP; 29 Aug 2025 09:04:30 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: john.c.harrison@intel.com, stuart.summers@intel.com,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v2] drm/xe/guc: Increase GuC crash dump buffer size
Date: Fri, 29 Aug 2025 12:04:27 -0400
Message-Id: <20250829160427.1245732-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

There are platforms already have a maximum dump size of 12KB, to avoid
data truncating, increase GuC crash dump buffer size to 16KB.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

---
Change history:
v2: Update commit message.
---
 drivers/gpu/drm/xe/xe_guc_log.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index f1e2b0be90a9..98a47ac42b08 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -17,7 +17,7 @@ struct xe_device;
 #define DEBUG_BUFFER_SIZE       SZ_8M
 #define CAPTURE_BUFFER_SIZE     SZ_2M
 #else
-#define CRASH_BUFFER_SIZE	SZ_8K
+#define CRASH_BUFFER_SIZE	SZ_16K
 #define DEBUG_BUFFER_SIZE	SZ_64K
 #define CAPTURE_BUFFER_SIZE	SZ_1M
 #endif
-- 
2.34.1

