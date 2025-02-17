Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38652C021A9
	for <intel-xe@archiver.kernel.org>; Mon, 17 Feb 2025 13:28:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDBB310E1D3;
	Mon, 17 Feb 2025 13:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aWZip9EC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A6110E1D3
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Feb 2025 13:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739798886; x=1771334886;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8Vea3maW0+7uicStgurHRoJFrba9hRFBFDP2kM7PyOo=;
 b=aWZip9EChK3sTCmUDMsmNd5E7C0QmWp50cmg3Wu77K9T8D9SicxfjU0y
 AjD00JGaGrihzwmwE+WRsDFG3FlFGjBSCrN2lMm/NVEw96acsWVmIW1Nx
 xLk9FFp86e7WqZeZ2USnuvwXtDjyTZqLGGF5a2Fck4HY8hh/lu6wdsb4i
 WG2BD5nwF9KUmIDwU8RyI4dbbPHDwG4JxnfmSgkI+2vl8UXYGPfzvuHJ6
 sYKvjLn1RLQnG/GLbmMyNhzW6VOVYr8dX0DwtyYy5oppoSjVeQ0leN2LD
 hQBmo7CcdvUdKDSjf7RHImKRZ2Wa/AJQ+cB52Qa1M6aPnNSXaUqJhQ4Kn w==;
X-CSE-ConnectionGUID: yoDv5OAUQB6gP89yA+UkRg==
X-CSE-MsgGUID: hHdDQ9trTauHvRcTHfTcpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="39710128"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="39710128"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 05:28:06 -0800
X-CSE-ConnectionGUID: jbPgifYMQ5euQxaeIJBz0g==
X-CSE-MsgGUID: dnyJ9wlsQ9K0TYmmkFvrfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="137360685"
Received: from unknown (HELO tejas-super-server..) ([10.190.239.37])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 05:28:04 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH]  drm/xe/client: Limit 80 char per line
Date: Mon, 17 Feb 2025 19:04:40 +0530
Message-Id: <20250217133440.188256-1-tejas.upadhyay@intel.com>
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

codeline exceeding 80 char per line, correct that
to make checkpatch happy.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 2d4874d2b922..84e30a4d5f1e 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -252,7 +252,8 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
 
 	xe_bo_put_commit(&deferred);
 
-	for (mem_type = XE_PL_SYSTEM; mem_type < TTM_NUM_MEM_TYPES; ++mem_type) {
+	for (mem_type = XE_PL_SYSTEM; mem_type < TTM_NUM_MEM_TYPES;
+	     ++mem_type) {
 		if (!xe_mem_type_to_name[mem_type])
 			continue;
 
-- 
2.34.1

