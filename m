Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CFBC25B7B
	for <intel-xe@archiver.kernel.org>; Mon, 20 May 2024 15:45:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D7310E58D;
	Mon, 20 May 2024 15:45:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d3kqmSei";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0965310E4C2
 for <intel-xe@lists.freedesktop.org>; Mon, 20 May 2024 15:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716219946; x=1747755946;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6euySp+QP3Ffahd88M12XxZgpbSux6NV49Ojq3DriAc=;
 b=d3kqmSeiHWnFybo6YQWXg43gspxF1v9w4SlpaVOy5+jzUMUGQEhOsqu9
 fikR4DkmttSvwwk3wWjYattZuhJYQkmZFAOt8esP5YJOFCe6FWlRqhPfS
 5+ydHESlIeY6ipS7STKNheX67r/x5LL+hOFX9o+h4wFrpdd/FfxuVB31b
 PJvzTJs28fHdvhXH5tLJX3/jsNR3KtFGoc2AVGKjM2k49FXIfbntoyVmv
 j4Zq0+jYVt6FpRqLF2kZlHuVNtBzM+oMpnWSPHcwO0XxYTYGdrrPJ+0fU
 OvIdC7jWn2Opxb+6U0BXUePNczzD5TH6gnAo1BSfG4b0b6Fs21hsJ0rTy g==;
X-CSE-ConnectionGUID: LlufXQQBSKyDcOCpzXGX7w==
X-CSE-MsgGUID: qMUvc8XMSGiHPzp+BM+3rg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="34873180"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="34873180"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:45:45 -0700
X-CSE-ConnectionGUID: 3w7ZckHgQSiAg6puyf7O3Q==
X-CSE-MsgGUID: 0mgUtu+QRaqCoREn3zI99Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="32610479"
Received: from unknown (HELO mwauld-desk.intel.com) ([10.245.244.203])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 08:45:45 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [CI v2 09/18] drm/xe/device: move flr to devm
Date: Mon, 20 May 2024 16:42:58 +0100
Message-ID: <20240520154249.52888-27-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240520154249.52888-19-matthew.auld@intel.com>
References: <20240520154249.52888-19-matthew.auld@intel.com>
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

Should be called when driver is removed, not when this particular driver
instance is destroyed.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f17283c9dcb9..861b4f73207e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -380,7 +380,7 @@ static void xe_driver_flr(struct xe_device *xe)
 	xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
 }
 
-static void xe_driver_flr_fini(struct drm_device *drm, void *arg)
+static void xe_driver_flr_fini(void *arg)
 {
 	struct xe_device *xe = arg;
 
@@ -585,7 +585,7 @@ int xe_device_probe(struct xe_device *xe)
 	err = xe_devcoredump_init(xe);
 	if (err)
 		return err;
-	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
+	err = devm_add_action_or_reset(xe->drm.dev, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
 
-- 
2.45.1

