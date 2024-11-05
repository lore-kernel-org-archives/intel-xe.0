Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDEBD1CA15
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 00:38:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF48C10E4F9;
	Tue,  5 Nov 2024 00:38:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HGGz9Ig6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508C610E2C4
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 00:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730767085; x=1762303085;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=DZ1sA3F2AyzBWQWLrknwRHpxaw0U9zpTfQ+MiflZPAU=;
 b=HGGz9Ig6SSig7VAhAEbbxLeYe6qaDfaFUTBzesJLp3IGCsnVVS0dkjNj
 S2f1X80i0UL8ANZiWA1XTLOzSa8cjE+R0OoObWmVtqWQE+Y11jume8nvM
 9xcXbGruLwPifG7iReIO1Ka2nbrpECjqFxur4VwAQWgZ3zNHCj1vPHAPb
 hi0NUWHBkaDomoDVVZR1I6bVDTsqR6mMfsz5YgzmoyreOAXOgF/fv4wfc
 9Ccs+qtc+QoPkRJcCBZ4XOSEJCW1v+2hw+qQSD58SZBoa6xAZ8HtyJK4/
 ak2z4G2PnS47MXoruNe4G5nN4yO6mPkIB4e/FZOhWKGJO1JEUFofkOi84 Q==;
X-CSE-ConnectionGUID: WfjTEb4kR6Wja9XEGSxC3A==
X-CSE-MsgGUID: 3TsYv3sDRD+fvF5xmCc+NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34181157"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="34181157"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 16:38:04 -0800
X-CSE-ConnectionGUID: tiEFd/sKSUO66HKe27vMWw==
X-CSE-MsgGUID: QMAN80EmQ1yve8L1w+7F4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="83756448"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 16:38:04 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe: Fix possible exec queue leak in exec IOCTL
Date: Mon,  4 Nov 2024 16:38:30 -0800
Message-Id: <20241105003832.4021758-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105003832.4021758-1-matthew.brost@intel.com>
References: <20241105003832.4021758-1-matthew.brost@intel.com>
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

In a couple of places after an exec queue is looked up the exec IOCTL
returns on input errors without dropping the exec queue ref. Fix this
ensuring the exec queue ref is dropped on input error.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: stable <stable@kernel.org>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index f23ac1e2ed88..6de12f91b865 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -132,12 +132,16 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (XE_IOCTL_DBG(xe, !q))
 		return -ENOENT;
 
-	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM))
-		return -EINVAL;
+	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM)) {
+		err = -EINVAL;
+		goto err_exec_queue;
+	}
 
 	if (XE_IOCTL_DBG(xe, args->num_batch_buffer &&
-			 q->width != args->num_batch_buffer))
-		return -EINVAL;
+			 q->width != args->num_batch_buffer)) {
+		err = -EINVAL;
+		goto err_exec_queue;
+	}
 
 	if (XE_IOCTL_DBG(xe, q->ops->reset_status(q))) {
 		err = -ECANCELED;
-- 
2.34.1

