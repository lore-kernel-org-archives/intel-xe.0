Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8E9CD128A
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 15:31:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D291C10E868;
	Tue,  9 Apr 2024 15:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nZPMQJir";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE0C10E7B3
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 15:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712676701; x=1744212701;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M4I0AVbwKFQlG8m4fSWmlprlAcKgW42+le2IsSoYr5A=;
 b=nZPMQJirsiABnbYvsoOYSKhEi8p7JDqVx6f3VEwzl92DrE2jdE5hbI9s
 451fwbuGOh5OrrJK3+6gLQ4Z3MTZMpcpaw5fYaK/M1vM8G5FXYvHFMCYs
 Q7duJOZFjoFZwj4BLu1xtivrQIijffDMq55WORv7dnJWhV++cWQ9qAGaN
 UWgt3Nyod4C68krNiZf0vPEIQcO+Kx97h2NTAkxIRJFQ5UYMAA8hht3jK
 Tntb2Ii7LIBoUqL40W+sJyPADibYX+MhyFTLOTA43sw4zkOZ5te8JWnVa
 UyHFNFMrlj+oTQTw+hFv5REB4Rq6nawGopDwqb9E7nwgNKHvaFRfF4Ogs Q==;
X-CSE-ConnectionGUID: exL7Id31RZqNdv/Aaihodg==
X-CSE-MsgGUID: rjw7tjCySXmxVPKU6zTnig==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11838070"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="11838070"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 08:31:40 -0700
X-CSE-ConnectionGUID: kmfx+4syT9ybqy+v78WE+w==
X-CSE-MsgGUID: 5p0LUvVgQIyKe2TMcbcgcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="20699968"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.158.230])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 08:31:40 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Check result of drmm_mutex_init()
Date: Tue,  9 Apr 2024 17:31:32 +0200
Message-Id: <20240409153132.1111-1-michal.wajdeczko@intel.com>
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

Although it's unlikely that drmm_mutex_init() will fail during
driver initialization, however we shouldn't ignore this case.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 9083f5e02dd9..ba3643906d9e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -273,7 +273,9 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 
 	init_waitqueue_head(&xe->ufence_wq);
 
-	drmm_mutex_init(&xe->drm, &xe->usm.lock);
+	err = drmm_mutex_init(&xe->drm, &xe->usm.lock);
+	if (err)
+		goto err;
 	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC);
 
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
-- 
2.43.0

