Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FB1C5475B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 04:23:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B3310F2AE;
	Fri,  8 Mar 2024 04:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dLgpHD6x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7CB810F2AE
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 04:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709871829; x=1741407829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UxCWtTyak2eXF1dx0PNRInIy67iXxk3vbxz8+onmwDc=;
 b=dLgpHD6xZ9G8cdQ0HUflXTzCSDqxeXliwPOCfjy0UkcOt2vs+5PPYPbc
 V+UZkPFEWS2Eo7i9XmjMRIVhoq0erOjTlaiIYv2Py5fmn1l9hg7Vujcvg
 ++nM5Fey3xDgtCYE8CbdBykhxQ6FGi1pcOtyZV2mq63V59iQdWmaFN1gy
 S08nPQBQdZ/fbrPIytnds628zdw1NviECVfB2Wf0g9zQbToO9GKqdwRHi
 Y9X/6PoP4wgW57LrDwTDPMlS1aK3AsjVkCOMHzZb8zPK0qx5VpXdyAazg
 65uwR9ZknXY23j/CNQYR3rdZy/N7c7oxl8f+c/6aNQWuCEThvW447NaVb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4431961"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4431961"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 20:23:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="10456305"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa006.fm.intel.com with ESMTP; 07 Mar 2024 20:23:47 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Subject: [PATCH 1/3] drm/xe: Return if kobj creation is failed
Date: Fri,  8 Mar 2024 10:06:49 +0530
Message-Id: <20240308043651.2010165-2-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240308043651.2010165-1-himal.prasad.ghimiray@intel.com>
References: <20240308043651.2010165-1-himal.prasad.ghimiray@intel.com>
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

Return after warning regarding kobj creation failure.

Fixes: 4ae3aeab32d7 ("drm/xe: Add vram frequency sysfs attributes")
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_vram_freq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_freq.c
index 079cc283a186..c5f6b5a5d117 100644
--- a/drivers/gpu/drm/xe/xe_vram_freq.c
+++ b/drivers/gpu/drm/xe/xe_vram_freq.c
@@ -111,8 +111,10 @@ void xe_vram_freq_sysfs_init(struct xe_tile *tile)
 		return;
 
 	kobj = kobject_create_and_add("memory", tile->sysfs);
-	if (!kobj)
+	if (!kobj) {
 		drm_warn(&xe->drm, "failed to add memory directory, err: %d\n", -ENOMEM);
+		return;
+	}
 
 	err = sysfs_create_group(kobj, &freq_group_attrs);
 	if (err) {
-- 
2.25.1

