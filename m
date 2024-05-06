Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4CCC25B10
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 20:53:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE0310E3CC;
	Mon,  6 May 2024 20:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fbtaSTbF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A326910E3CC
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 20:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715028784; x=1746564784;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=goYJYvvUy0wrY1S6+yk/lQXr/YDI0kctEae+DFz28d0=;
 b=fbtaSTbF4sFat99qU22twKcGDWfIwaR62Z1HCrf1vsLixVb9fMYZAzmY
 tXGUDN6m9gd2sEucY+4SFgQ62u4xjHUHz0Pe7vZ9oqk27JGzShdrC69X3
 NOOvY7NwBbxdfiY0aVdUZAHXEtd8P1pj6C/WBmV7GKtvt0A9Y/1AWJkwh
 lGU/3y+YjTgaUjce4S2YhHg55vAVOhI714JpUE6XH5pnFu8ShV+n6BYe9
 95megm8AzI3QSdqf70V5D4dD3lyRanL3XER82B/cPG6aBQm6ORJT1HOPN
 y8D6TpkKoUweokpsrssNKR4WTDPSKjfM5qBLuGSbqsTVYkiIqHHXMwFy7 A==;
X-CSE-ConnectionGUID: wxQeS0lxQ9y9DNGCdazvLQ==
X-CSE-MsgGUID: DP7pQqNWTce7WMbqUfvW2A==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10643189"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="10643189"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 13:53:03 -0700
X-CSE-ConnectionGUID: axKIycyOTYe+p7q42QSuIg==
X-CSE-MsgGUID: YeTrKn3ARvifRdyuvGVB2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="33088488"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.128])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 13:53:03 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Fix xe_mocs.h
Date: Mon,  6 May 2024 22:52:54 +0200
Message-Id: <20240506205254.2659-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

We don't need to include <linux/types.h>.
We don't use struct xe_exec_queue here.
We should sort forward declarations.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_mocs.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mocs.h b/drivers/gpu/drm/xe/xe_mocs.h
index d6fa4485a6e9..dc972ffd4d07 100644
--- a/drivers/gpu/drm/xe/xe_mocs.h
+++ b/drivers/gpu/drm/xe/xe_mocs.h
@@ -6,11 +6,8 @@
 #ifndef _XE_MOCS_H_
 #define _XE_MOCS_H_
 
-#include <linux/types.h>
-
-struct xe_exec_queue;
-struct xe_gt;
 struct drm_printer;
+struct xe_gt;
 
 void xe_mocs_init_early(struct xe_gt *gt);
 void xe_mocs_init(struct xe_gt *gt);
-- 
2.43.0

