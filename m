Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE2AC7618E
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 15:39:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8910E10E19F;
	Fri, 21 Apr 2023 15:39:04 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45EF110E19F
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 15:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682091543; x=1713627543;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Tpqrs8WnxCeW5zHsMgjSdZ/3aTmwQHrZKawglyOtsNU=;
 b=mSldR+4b5IdKzD/NbTWVG+OJKuNgYYegAjf3u9yHc+J5NTUwifgf6Q+W
 0LzzNAB6HnVHxhxdz3wUsRYxTIipPhHIkbnl/i/LsPeYGYvGEHu9HGlHv
 YRw74fd0vGf2lxMGGBTkwoyobfwnzNY+lH5+Yihsnidj6enEzIa33R0r3
 /UeFtcfLs8oTSzDlcKNOaV39qAWph9QLytPZL5YhlrWSMeH/II+e9+eZf
 qNUagGOlsEJ4pCELP5QlL18VbaXHXLNGDNQ6u2UNr8TSoicqIZQDBSu2a
 Xv8vYgsBWMtOKnzv6OevqcE3tRXDLdmRkC6hjVqZElNewSA5oY7vKH70j Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="326350816"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="326350816"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 08:39:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="938526996"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="938526996"
Received: from sshaheed-mobl.gar.corp.intel.com (HELO bvivekan-mobl.fritz.box)
 ([10.213.91.130])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 08:39:02 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 21 Apr 2023 21:08:52 +0530
Message-Id: <20230421153852.329899-2-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230421153852.329899-1-balasubramani.vivekanandan@intel.com>
References: <20230421153852.329899-1-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Change log level of error prints
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

Error prints are logged using drm_err log level.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 8bd39c3e65ae..7a0fcb37aab0 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -59,8 +59,8 @@ _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
 
 	ret = pci_resize_resource(pdev, resno, bar_size);
 	if (ret) {
-		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe)\n",
-			 resno, 1 << bar_size, ERR_PTR(ret));
+		drm_err(&xe->drm, "Failed to resize BAR%d to %dM (%pe)\n",
+			resno, 1 << bar_size, ERR_PTR(ret));
 		return -1;
 	}
 
@@ -119,7 +119,7 @@ static int xe_resize_vram_bar(struct xe_device *xe, resource_size_t vram_size)
 	}
 
 	if (!root_res) {
-		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
+		drm_err(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
 		return -1;
 	}
 
-- 
2.34.1

