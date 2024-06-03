Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0FCC25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 14:28:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DF410E00B;
	Mon,  3 Jun 2024 14:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VdN1UYDX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C6A10E00B
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 14:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717424879; x=1748960879;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rfeG2quDfbVufcRCq0jo6ETCJJsPy9N5RrzAn5Rw0kc=;
 b=VdN1UYDXBlTNCVCj2ZAtmWAUe6GeFu7taVmvZZy+HlQ+gI3An9RcNT8z
 fns1dahCqMIk3O873X1sZ+aNRf7J4XG5EMMG9cTHIqY9kdk+MZ/QjaUV+
 V7tSuRQH8GGEBKzbv9yIzUiYBk1xNT3WOF2rgtGBHG1FaCxm7r93EjqaI
 oXne8SY8amYyBCdTHLTTIrgXWO1Cxy/bo0t3Ukvz0jrVXEOM/EGFtTcp+
 /kp/Mk6NlbiQah69nStgOkDfaO3kpJyGRadlspW+vSdgj1N0Afjcfrhsn
 Ee/wSISyW8A1G3UMeE2IotpRgTQrhd0qyRq9aNAZsk9nsMTG1SbEW0CCp w==;
X-CSE-ConnectionGUID: +VXyMqLGTvi2DsN7TmKTZg==
X-CSE-MsgGUID: Ok9ZBW86QkWx8LTYGr62jw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="13670499"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="13670499"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 07:27:59 -0700
X-CSE-ConnectionGUID: /XiMSaw/RfWCMCLI/ZLIVw==
X-CSE-MsgGUID: VA/Si0nsSAWV5XLQB0C4hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="68055255"
Received: from tejas-super-server.iind.intel.com ([10.145.169.166])
 by fmviesa001.fm.intel.com with ESMTP; 03 Jun 2024 07:27:58 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe: validate client of BO inside lock
Date: Mon,  3 Jun 2024 19:58:23 +0530
Message-Id: <20240603142823.720213-1-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.25.1
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

As client of BO getting referenced inside lock of BOs
list, its good practice to move these WARN_ONs also
under same lock to validate existance of bo->client.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 4a19b771e3a0..7881b02fa117 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -131,10 +131,9 @@ void __xe_drm_client_free(struct kref *kref)
 void xe_drm_client_add_bo(struct xe_drm_client *client,
 			  struct xe_bo *bo)
 {
+	spin_lock(&client->bos_lock);
 	XE_WARN_ON(bo->client);
 	XE_WARN_ON(!list_empty(&bo->client_link));
-
-	spin_lock(&client->bos_lock);
 	bo->client = xe_drm_client_get(client);
 	list_add_tail(&bo->client_link, &client->bos_list);
 	spin_unlock(&client->bos_lock);
-- 
2.25.1

