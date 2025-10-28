Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8CFCCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 12:25:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB38110E5CB;
	Tue, 28 Oct 2025 12:25:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j/eZI5mv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FBD410E5CD
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 12:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761654313; x=1793190313;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zl8pUlsxR4LKfo2jCitWyUfZNc2LeEtA2QRLhZEjC8o=;
 b=j/eZI5mvFLrFJSdh9MsWpQnJqp9a8C++bO4qBbqyq7HFp2HD4CObBOzb
 npnZguEvW9mD7hrtKyjnKav3OF/m4LHZ2UHqSNHp7xKSsKoUobqyAHXBc
 ze9GOssyPNWcvWvPyFGPWsaEqjWpsUKJyVbXTcyreWHTxDIsf59EFZr3A
 GKPBow9nqLG4O/5/U4xsDmN0WkJ1EwkjtAH5WHJOvxGO/SBviVHEijOKG
 eF6VEnXAR3xBMxqMpEzcqSNTy5jx+Fasn8+4r5WQrjqf3T+Oe4Xd8qJyC
 6KQHjbiA6qiJoUUDBi+uJ1oXxruzLBRm7vLL1ATP+pMkiTaZYKinsxefT Q==;
X-CSE-ConnectionGUID: 7RMmdjXySU+Z4tq1Z1kRnw==
X-CSE-MsgGUID: dF8Eug2BTPOVoF6rIMXmAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62956642"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="62956642"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:25:13 -0700
X-CSE-ConnectionGUID: l8c7EBZsR2Wb3Haoz0vxVg==
X-CSE-MsgGUID: l4JsU4oSSaeehZogb8AlsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="190524461"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:25:11 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com
Subject: [RFC PATCH 6/9] drm/xe/bo: Prevent mmap of purged buffer objects
Date: Tue, 28 Oct 2025 17:54:12 +0530
Message-ID: <20251028122415.1136721-7-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028122415.1136721-1-arvind.yadav@intel.com>
References: <20251028122415.1136721-1-arvind.yadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add validation in `xe_gem_mmap_offset_ioctl()` to prevent userspace
from obtaining an mmap offset for a buffer object (BO) that has been
purged.

When a BO is in the `XE_MADV_PURGEABLE_PURGED` state, its backing memory
has been reclaimed by the kernel. Allowing an application to get an mmap
offset for such a BO is invalid, as any subsequent attempt to access the
mapped memory would result in a `SIGBUS` signal.

This patch checks the BO's madvise state before returning the offset. If
the state is `XE_MADV_PURGEABLE_PURGED`, the ioctl now fails with `-EINVAL`.
This provides clear and immediate feedback to the application that the
operation is not permitted.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4b2ecf4152b0..206ccccd07cd 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -3346,6 +3346,8 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 	struct xe_device *xe = to_xe_device(dev);
 	struct drm_xe_gem_mmap_offset *args = data;
 	struct drm_gem_object *gem_obj;
+	struct xe_bo *bo;
+	int state;
 
 	if (XE_IOCTL_DBG(xe, args->extensions) ||
 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
@@ -3375,6 +3377,13 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 	if (XE_IOCTL_DBG(xe, !gem_obj))
 		return -ENOENT;
 
+	bo = gem_to_xe_bo(gem_obj);
+	state = atomic_read(&bo->madv_purgeable);
+	if (state == XE_MADV_PURGEABLE_PURGED) {
+		xe_bo_put(bo);
+		return -EINVAL;
+	}
+
 	/* The mmap offset was set up at BO allocation time. */
 	args->offset = drm_vma_node_offset_addr(&gem_obj->vma_node);
 
-- 
2.43.0

