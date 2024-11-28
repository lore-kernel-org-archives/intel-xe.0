Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB56AD70DEB
	for <intel-xe@archiver.kernel.org>; Thu, 28 Nov 2024 21:20:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A918B10E273;
	Thu, 28 Nov 2024 21:20:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gAG3G7mR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC39B10E273
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Nov 2024 21:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732828831; x=1764364831;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iNWJPGiDLewEe5Xjw91U64wSS/H5niGqvcOx+IzTM3o=;
 b=gAG3G7mRI01f7jsDESjE0701EMWNOwD2K6UwYMBPL016bGUQdkjdq+ry
 YzOHyfLmZi/mlBQNDlQrFSIuXhR7a+T+93T6j5M/qKx4bI6e1ypTsvB+E
 vW8tR+NJrECO7+1+EXFoWMaST1uou0Gonzgy2zQR5LHR7joBm6nuhB+ch
 RFiZJzcWoktPyf7ds0N1PP9H/45I7SPJROgTaMnHZBtsWFRj0PwDBQ6yE
 PAqchM8jorJ7JwAvXZ0+CdSNRY7wBHo06TmfWa+gMdWimT41Cqr/tWi+6
 5b19zbjM3E6dOqKxqmpFJfvPoP0Ma54/zC81chQZHMfOHhoHjE4tLgcP+ A==;
X-CSE-ConnectionGUID: G6lQd4bzSsGDLbnYGtBnQQ==
X-CSE-MsgGUID: HbXm7CSNTTuGe04ZV8OW2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33209056"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; d="scan'208";a="33209056"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 13:20:31 -0800
X-CSE-ConnectionGUID: /KekC+sKQZiDgYGPUjaO4Q==
X-CSE-MsgGUID: I/InOWyOS+e+Z6DgqGjdXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="97371024"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 13:20:31 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com
Subject: [PATCH] drm/xe: unlock object in an error condition
Date: Thu, 28 Nov 2024 16:34:08 -0500
Message-Id: <20241128213408.1821171-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
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

In xe_gem_fault, we reserved a buffer object but didn't unreserve
it under an error condition. Unreserve it.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index f51d86511cb9e..634a1b54ca60d 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1286,7 +1286,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	}
 
 	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
-		goto out;
+		goto unlock;
 	/*
 	 * ttm_bo_vm_reserve() already has dma_resv_lock.
 	 */
@@ -1297,6 +1297,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 		mutex_unlock(&xe->mem_access.vram_userfault.lock);
 	}
 
+unlock:
 	dma_resv_unlock(tbo->base.resv);
 out:
 	if (needs_rpm)
-- 
2.26.3

