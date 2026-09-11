Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A37C88E4D
	for <intel-xe@archiver.kernel.org>; Fri, 11 Sep 2026 12:16:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7361410E3B9;
	Fri, 11 Sep 2026 12:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AcD8EPKW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C01E10E3B9
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Sep 2026 12:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789128983; x=1820664983;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aqyhMy+cfr86ney0ALSuUXNjiw3ZUY5PgU9Eoadq+4k=;
 b=AcD8EPKWUYLmc2WlXHVH5GvzY7RDQt8WfE/kYswELXF9gQmcT6v2TeNm
 fTSjapr7DwRdMTj15yNbdSOF/Hlv3YAKsrmQKPmFk1W1KAIcZzSc6Y1ne
 0XDSDrtLh4w9Yb/MHtxaXLHcp/Q7hs1c3GVyLzYRRaALQfVSx+7O50XZ9
 I6DhVaxHq9s+j6HVUUhSQgsl6PGtZafr3FIZrLinzb23zn8F8y2OIxJ5l
 xPFgrmvxVQ2Th8rsQV8c3aZ6w6bmH+2CQRDV6JiqUZkAdi+qBMF3+9+fv
 EP2vA9vEvHLh0o/1vN2UFqkvV+mLWfgBWpvGJQY1N+vHfQv8DLUvDvR9t Q==;
X-CSE-ConnectionGUID: BYDhb+ahTg+PR/zh2K+2HQ==
X-CSE-MsgGUID: rudYbj76TbWuT9+AuvNlCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100253574"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="100253574"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 05:16:22 -0700
X-CSE-ConnectionGUID: tKQf1lm2R+KO4ZGDm7+zbw==
X-CSE-MsgGUID: NtfhkpFRQ6ahcnAqFB0VAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; d="scan'208";a="270144125"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa006.jf.intel.com with ESMTP; 11 Sep 2026 05:16:19 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: heikki.krogerus@linux.intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2] drm/xe/i2c: Disable IRQ on unbind
Date: Fri, 11 Sep 2026 17:45:47 +0530
Message-ID: <20260911121547.2407261-1-raag.jadav@intel.com>
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

Currently, struct xe_i2c is freed before SGUnit IRQ is disabled in unbind
path, leaving a potential UAF in case I2C IRQ is hit during this small
window. Explicitly disable I2C IRQ in xe_i2c_remove() and fix this.

Fixes: 0bb78ce09926 ("drm/xe/i2c: Wire up reset/postinstall for I2C IRQ")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_i2c.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index d8fa68206f41..51ca9fb73b70 100644
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
@@ -335,6 +337,7 @@ static void xe_i2c_remove(void *data)
 
 	bus_unregister_notifier(&i2c_bus_type, &i2c->bus_notifier);
 	xe_i2c_unregister_adapter(i2c);
+	xe->i2c = NULL;
 }
 
 /**
-- 
2.43.0

