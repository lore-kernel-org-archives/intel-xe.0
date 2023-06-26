Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74670EB64DA
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 10:51:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444F410E1E8;
	Mon, 26 Jun 2023 10:51:15 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2967110E1E1
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 10:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687776671; x=1719312671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xlUWzDiQtDZ9MzGxJzRdnV9fgCXh+hm4Rar2ZwZhsLs=;
 b=kaStjjDpG3tHRIbfQN+Q8ltSQ8dEVFSM4EMPLWv0tIMCJTwiIAYNOwIW
 MjIdR1TW1dudrqpxY7T3GYNyW6W/omGaCdMzdJ8KbGz4wF6AJtzqQ+OPy
 Ezz0pbS7A6k0Tah4IMFVo6n9p/GjKET0aY8ezhxMqfMKGoW54ilNEHOna
 7UFmJ45Ea1QNGEfc2TlvSy8zTIHm3RHEh2u55QMPddk9exTzqFO9H2r9+
 swFcebjTTaYQktehSiAUoCklPKJ+Zlj056D1vr6aBwKfPOn3Cr1jBqxva
 mgy2qpReo/LllJVTLpS/LZr0+SaVYcECpIIeZ1ojGuDbuHMmauzrmQqhT Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="361279985"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="361279985"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 03:51:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="829182794"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="829182794"
Received: from cbrady5x-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.8.226])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 03:51:09 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jun 2023 11:50:43 +0100
Message-ID: <20230626105037.43780-20-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230626105037.43780-15-matthew.auld@intel.com>
References: <20230626105037.43780-15-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v12 05/13] drm/xe/mmio: grab mem_access in
 xe_mmio_ioctl
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Any kind of device memory access should first ensure the device is not
suspended, mmio included.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index f1336803b915..300537bfc559 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -476,6 +476,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 	 */
 	reg = XE_REG(args->addr);
 
+	xe_device_mem_access_get(xe);
 	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 
 	if (args->flags & DRM_XE_MMIO_WRITE) {
@@ -519,6 +520,7 @@ int xe_mmio_ioctl(struct drm_device *dev, void *data,
 
 exit:
 	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	xe_device_mem_access_put(xe);
 
 	return ret;
 }
-- 
2.41.0

