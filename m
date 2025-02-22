Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519F4C021B8
	for <intel-xe@archiver.kernel.org>; Sat, 22 Feb 2025 00:11:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4C210EB47;
	Sat, 22 Feb 2025 00:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WTc6S9Zu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F7B10EB47
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Feb 2025 00:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740183070; x=1771719070;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ABhY140VmFf/aXsjFjYMD/Gk7QneDh4tdmL4wbra1Kk=;
 b=WTc6S9Zu8ces3GBLAcIVNOyq/Libt87yx7i/qcgpPg5Wx1GUj3JX2Z0C
 6pQf4rGknajl9ZUGxh5+2RA8P9E0c1TbpPQguW7h9WnYiwjEsyWdOc2px
 xI4QDGrTjiD6Oud60DwuBEOfPA4+0fM5HsczFqKxHmeLwFupEJ9pz3D/L
 FnLqI1tmL0GkNAv8goau6BPXB0wBpGjUxkZ4B7mH9zcA14YJ/9oS+bqEY
 l7UIJ8zK2A0KsF82dnquJGx+s3kgcxt3Mjz7Lu2xgv/QQBNHnmJasdRcb
 3olLFt/l/ZnSJKJGTZS3uzIbLVOIXKcFVkwAJNQNeWkOW/yzHf2ehlp2F A==;
X-CSE-ConnectionGUID: AtbHnxtOTNS+PPdRecWMEw==
X-CSE-MsgGUID: I1PKwMCeQSeQ+cDu381AqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="44926400"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="44926400"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 16:11:09 -0800
X-CSE-ConnectionGUID: k3H0IsJ9SDiGMyb3tyFk/w==
X-CSE-MsgGUID: EymG9hPRR6y4kZeNm/GvBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; d="scan'208";a="115704965"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 16:11:09 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v2 11/11] drm/xe: Stop ignoring errors from
 xe_ttm_sys_mgr_init()
Date: Fri, 21 Feb 2025 16:10:51 -0800
Message-ID: <20250222001051.3012936-12-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250222001051.3012936-1-lucas.demarchi@intel.com>
References: <20250222001051.3012936-1-lucas.demarchi@intel.com>
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

xe_ttm_sys_mgr_init() already cleans up after itself, just return error
if that failed.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 79525bc4c6962..9454b51f7ad8e 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -748,6 +748,7 @@ int xe_device_probe(struct xe_device *xe)
 		return err;
 
 	xe->info.mem_region_mask = 1;
+
 	err = xe_set_dma_info(xe);
 	if (err)
 		return err;
@@ -756,7 +757,9 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	xe_ttm_sys_mgr_init(xe);
+	err = xe_ttm_sys_mgr_init(xe);
+	if (err)
+		return err;
 
 	for_each_gt(gt, xe, id) {
 		err = xe_gt_init_early(gt);
-- 
2.48.1

