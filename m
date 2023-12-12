Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A40C4167D
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 21:56:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEADB10E0A3;
	Tue, 12 Dec 2023 21:56:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D582710E0A3
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 21:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702418172; x=1733954172;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NVoRJTaJH44yOF/KacLpT4r4J8+oN/DF3t2ZBd1pigo=;
 b=Kuazq0AOU72EH6rauzD7nzZ35Zo5HIyosncuB0ucZrTi22EIgq9LLwCV
 XMYVZdEXH6HvA1pPY1ZQqHTWXFMO9JsHPvWHE3JYLQkpPlYcB1G7p5abC
 DC4Xdtqd6zmHNJ/YAQ9ODbqz0M/B1ivSHkcggSx2Y3BHy7Wc7PxuRp4On
 tQV5qrrojMwHMZgY1KiNsrZ/WXhqwAHkkAB5c3n+HNaQczr36wuJErBqC
 IbyMpPkMCwWDoQpNaHKK+KFPVXmFJ20yud3cMBHZglBhx+uST8dwuyp5h
 vAhlqA2VD4q7xYhjSm5d0oot7e4oZsJUsOCljs92X+kYwl+D8lr7BgLi0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="398718073"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="398718073"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 13:56:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="749860261"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="749860261"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 13:56:12 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Remove duplicate RING_MAX_NONPRIV_SLOTS definition
Date: Tue, 12 Dec 2023 13:56:04 -0800
Message-ID: <20231212215603.2041841-2-matthew.d.roper@intel.com>
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The engine register header wound up with two definitions for
RING_MAX_NONPRIV_SLOTS, likely due to a rebase mistake.  Keep the
definition that's in an appropriate place (i.e., with the
FORCE_TO_NONPRIV register definition) and remove the other.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 3942db268b01..1a857c4edcf5 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -40,7 +40,6 @@
 #define RING_NOPID(base)			XE_REG((base) + 0x94)
 
 #define RING_IMR(base)				XE_REG((base) + 0xa8)
-#define   RING_MAX_NONPRIV_SLOTS  12
 
 #define RING_EIR(base)				XE_REG((base) + 0xb0)
 #define RING_EMR(base)				XE_REG((base) + 0xb4)
-- 
2.43.0

