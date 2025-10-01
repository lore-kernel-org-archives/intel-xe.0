Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED81CAC5B8
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 00:53:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7797810E044;
	Wed,  1 Oct 2025 00:53:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L32fr4Kn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5CD10E044
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 00:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759280002; x=1790816002;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oXkzkh1L8gcJxscqIQx3mIalE+PCmU7Nf3okBHRyTEc=;
 b=L32fr4KnOvMXn0a4IfyZIPvYe2PbR27A74umceDUGgZs0lliiN5uGC83
 nRVdoYdslgYXON0YOk24DwZo4yo+y2R5EJUIbfnso32OG7+fic8W5qo3E
 Bl0Nv9gumebCIIFD+dtyhd7Y936mVP61l2tWTa2s6M6o6Q1bqnkSmlOqw
 89wDikXWjwcoNs6W59ktHQJI/mmirVNreJYzlUbne83Br6B0bh16aaWnb
 UPFkI4VhlpXj1ErVzz+RNcKT65ZL3YuteYb7MC0z98iJcEl9HQ1o88H3Y
 unt8moAHfGtEtBqYpJcw5XvCtAS8EJD9+Rks1PmdJev30XovJbKFRG2s1 Q==;
X-CSE-ConnectionGUID: R4HiSc7nRciqELcD/rmLSg==
X-CSE-MsgGUID: WwL8J5fQTYORnY5QgY2LMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72224258"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="72224258"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 17:53:21 -0700
X-CSE-ConnectionGUID: R9nwjiTsSsODXhkRHLNPvA==
X-CSE-MsgGUID: 12z76t5MTjiv7X7DZRWuuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="202342957"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa002.fm.intel.com with ESMTP; 30 Sep 2025 17:53:18 -0700
From: mallesh.koujalagi@intel.com
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, sk.anirban@intel.com, raag.jadav@intel.com,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH] drm/xe/xe_late_bind_fw: Initialize uval variable in
 xe_late_bind_fw_num_fans()
Date: Wed,  1 Oct 2025 06:23:15 +0530
Message-Id: <20251001005315.3179379-1-mallesh.koujalagi@intel.com>
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

From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

Initialize the uval variable to 0 in xe_late_bind_fw_num_fans() to fix
a potential use of uninitialized variable warning and ensure predictable
behavior.

The variable is passed by reference to xe_pcode_read() which should
populate it on success, but initializing it to 0 provides a safe
default value and follows kernel coding best practices.

Fixes: 45832bf9c10f3 ("drm/xe/xe_late_bind_fw: Initialize late binding firmware")
Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 38f3feb2aecd..a86d7fa611e2 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -188,7 +188,7 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind)
 {
 	struct xe_device *xe = late_bind_to_xe(late_bind);
 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
-	u32 uval;
+	u32 uval = 0;
 
 	if (!xe_pcode_read(root_tile,
 			   PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), &uval, NULL))
-- 
2.34.1

