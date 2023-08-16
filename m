Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DD9C001DF
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 18:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCF510E3A6;
	Wed, 16 Aug 2023 18:05:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFAD10E39F
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 18:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692209112; x=1723745112;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=go1IFGLmGSEHavi0qXg0EKxwvZ4SG62pOiLKVtjfUPk=;
 b=Erd3QOMjUJXRQ4DWlIT2ctMHkkpO0nNsFp+TNL3Z9q59xh+B+tSiEQQ+
 gD4N2SLBiylxG2nRnqD+l+MNiGx0gqNCrNur877Cr2l1D0RWAM9jNcGfl
 C7fjV/VpCWvUprsNqv8AoN+sy2iQOCqPKo4AbfRma4yk9rlRsr1o8EBVv
 JZiEjzhz4ENIIXDvvmhiya+xr0OFfwFR0jMG0xwFv8GtMMPlH+6aOK870
 evWIo/MMx8sGfD/xRD63KlcozrS3m+GATf/Gj/iTMiqDHqLV+nUbh/t+y
 Kgy1f2PMS64nowe8Rhuo6vVvG3hbvkK3ZXC2ocDvuvFUCuca7KkmvjUgn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="458956587"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="458956587"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 11:04:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="980816388"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="980816388"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 11:04:37 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 16 Aug 2023 11:04:25 -0700
Message-ID: <20230816180425.1481448-7-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816180425.1481448-1-daniele.ceraolospurio@intel.com>
References: <20230816180425.1481448-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 6/6] drm/xe: don't expose the GSCCS to users
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

The kernel is the only expected user of the GSCCS, so we don't want to
expose it to userspace.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 7ce3e740c508..ee417b7aeee5 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -794,6 +794,9 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
 	struct xe_gt *gt = hwe->gt;
 	struct xe_device *xe = gt_to_xe(gt);
 
+	if (hwe->class == XE_ENGINE_CLASS_OTHER)
+		return true;
+
 	return xe->info.supports_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
 		hwe->instance == gt->usm.reserved_bcs_instance;
 }
-- 
2.41.0

