Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59585E7E632
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 13:04:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B67F10E3DA;
	Tue, 26 Sep 2023 13:04:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C4A10E3D8
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 13:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695733452; x=1727269452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=392is5n5HR3DgSzXMZPFqOj2IALBlJDl5Y73ge4/ShM=;
 b=a1JNFVb0rQA9ELMlETQnt/5Btf1cjyC3a14Lo+6MinO7Q+nry8UVqEKm
 Uwy4JgnaiQ0ZYQQvVqA+34CMFh6KDiidDjQkPFMvM4uQMJsPHgCm5l/iW
 c+d1wNhZVwfy1HCdDQ6g4+bXdXtg3ph8ZJRpzE/e9W1Psl74bY1xZm1q2
 SR9Mf+kf3CacbmPSYybQ5rJKpA5e4wKAIQ0X4o/Li3nJIVyZ989PCLUT4
 DEjCPSP15fEtb2o2+vTTUa4dJjGBGtNGVmPpQXcZC3uawZkfVkddTgZ8H
 1BrVh+vPmz+fclJFUxQHVkVhhahgt55ba994UkY3Dj/viqvVMZPNPrJGL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="366617329"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="366617329"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:56:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="139741"
Received: from hblancoa-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.50.200])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 05:56:32 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 26 Sep 2023 12:55:36 +0000
Message-Id: <20230926125540.7-27-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230926125540.7-1-francois.dugast@intel.com>
References: <20230926125540.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 26/30] drm/xe/uapi: Add pad to
 drm_xe_engine_class_instance
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add pad to reserve space for future uses such as special configurations
for media.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/uapi/drm/xe_drm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 79e47708d526..84091860c7d2 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -143,6 +143,8 @@ struct drm_xe_engine_class_instance {
 
 	__u16 engine_instance;
 	__u16 gt_id;
+	/** @pad: MBZ */
+	__u32 pad;
 };
 
 /**
-- 
2.34.1

