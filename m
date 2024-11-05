Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E417FD1CA23
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 04:34:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96CF610E149;
	Tue,  5 Nov 2024 04:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mf6j1BrW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF17D10E149
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 04:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730781298; x=1762317298;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8+ZdvZRNjdoNnZ7vcfpl0e8ZHfEOgiefQpM8uFNLHeI=;
 b=Mf6j1BrWCOF0bf3rngGXJV0w8shcLV9NAlUWQ+qgscKMNLlo29HAtnDt
 E4b/B35KKWgyEkna2vEARKlZPuyjRiXvQ7osreJf4WVIh4AfK1+LYDl9L
 iurMzQZob5T2Tr6Kr/HQ8dHh1of+nqlPoWAQFMHsEheL/Zt6BwwkhR0B8
 jdcXSmFmVChtHSS5kAZnnOW+36YZtoQwThtVbKzBPHkywZ/slAtbqWF8S
 BCMfZTymgA9ifL/CZ1Ben2mJ4ZlBDvqtJNQDxlwCZ8C3yKUDY8gbjw0li
 aqluMV7bsxAKANrz1ENwqpvZzkvV9HXfpO0pgclImV2gj6rCEdWiwW1Ua w==;
X-CSE-ConnectionGUID: riTgG7JuR1WOG3y0vDxfMg==
X-CSE-MsgGUID: Lv5nMAkYSsWmk1nQ+Q51Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34197693"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="34197693"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 20:34:57 -0800
X-CSE-ConnectionGUID: 0D5LA4K0TlehNnETsRTVkg==
X-CSE-MsgGUID: eubazN/qTriYrenUoc4IRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="121350700"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 20:34:57 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe: Drop VM dma-resv lock on xe_sync_in_fence_get
 failure in exec IOCTL
Date: Mon,  4 Nov 2024 20:35:24 -0800
Message-Id: <20241105043524.4062774-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105043524.4062774-1-matthew.brost@intel.com>
References: <20241105043524.4062774-1-matthew.brost@intel.com>
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

Upon failure all locks need to be dropped before returning to the user.

Fixes: 58480c1c912f ("drm/xe: Skip VMAs pin when requesting signal to the last XE_EXEC")
Cc: stable <stable@kernel.org>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 6de12f91b865..756b492f13b0 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -224,6 +224,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			fence = xe_sync_in_fence_get(syncs, num_syncs, q, vm);
 			if (IS_ERR(fence)) {
 				err = PTR_ERR(fence);
+				xe_vm_unlock(vm);
 				goto err_unlock_list;
 			}
 			for (i = 0; i < num_syncs; i++)
-- 
2.34.1

