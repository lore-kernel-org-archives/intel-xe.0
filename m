Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58635F55437
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 01:38:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7DA10E348;
	Wed, 25 Feb 2026 01:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ntlku/6z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D7110E348
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 01:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771983492; x=1803519492;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gRBuTCP+6qKAtNOHgg5VB1BEP2KonECenw4LCWkpUwI=;
 b=ntlku/6zW4YlP/dLxHrKu6LLEjB2klq/YKipMKL44dMxDSl/zopIlUMU
 XHzaB3AAtFsnmWMILqjatm+4r98fsDYqLPUCPetWpfO9J6j+43XPpZy29
 Z7d1E4VjUUq7XucdryFhRfsXBeqfOYDp+lMt4iXTY+2qANYLocP7Uwqhq
 J3FseA8tT0cJ9f9xPN6fJnHzjL4LzGxfIbIqeCtxvJKVSqm6BzwjBKlJ1
 jWAGagiRfjgfxnixWNbvRQxtEUEUUI6h+rrzhikMW5eCzVZDvHG8hmS2e
 Fg+Q9mszEZnRm8KmLjM/aFGEdP/VslxAvAGkUJ+pZ4knbQo6tI3zXCzZx w==;
X-CSE-ConnectionGUID: dcET+fkyTBaRibiMjmEv5g==
X-CSE-MsgGUID: FkO4XTTqTtueSaWiPQB0Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="95628910"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="95628910"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 17:38:11 -0800
X-CSE-ConnectionGUID: ZBtRlIoNR3WKMwjmgQTE6Q==
X-CSE-MsgGUID: 5wMYHZiPT82+lnVnDhRCnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="220682159"
Received: from osgc-linux-buildserver.sh.intel.com (HELO
 shosgclin.sh.intel.com) ([10.112.232.103])
 by fmviesa005.fm.intel.com with ESMTP; 24 Feb 2026 17:38:10 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH] drm/xe/configfs: Free ctx_restore_mid_bb in release
Date: Wed, 25 Feb 2026 01:34:49 +0000
Message-ID: <20260225013448.3547687-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
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

ctx_restore_mid_bb memory is allocated in wa_bb_store(), but
xe_config_device_release() only frees ctx_restore_post_bb.

Free ctx_restore_mid_bb[0].cs as well to avoid leaking the allocation
when the configfs device is removed.

Fixes: b30d5de3d40c ("drm/xe/configfs: Add mid context restore bb")
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index d8c3fbe81aa6..af1599f21338 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -833,6 +833,7 @@ static void xe_config_device_release(struct config_item *item)
 
 	mutex_destroy(&dev->lock);
 
+	kfree(dev->config.ctx_restore_mid_bb[0].cs);
 	kfree(dev->config.ctx_restore_post_bb[0].cs);
 	kfree(dev);
 }
-- 
2.50.1

