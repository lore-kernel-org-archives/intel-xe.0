Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DB9CD8C83
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 21:05:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DD9112C1F;
	Fri,  5 Jun 2026 21:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DfMVtLAQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7128D112C1E;
 Fri,  5 Jun 2026 21:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780693542; x=1812229542;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ObHa+CKKCJ5pI4SGqwkGQZlPbdi6mey9UdKl/WyzJIs=;
 b=DfMVtLAQB2JMY3FqZfjgQRwEummrWjS3+EGN7R2YIQ6Fh7FmeE9kXBe+
 7nAEanuD+mytLE4IgqGs3y0mB8skqgpdRioXCzK62ZWsTn76KBcGy2KX0
 Qzknx8JL+Wax/aWgOs4SUOo/smWYH6XKssYRyJjNnUGNJJ70Dh65ZDDC+
 Ep7ypQ8FfFY7xIDlBiidN8YZQjx6oERvvd/g7KtHCOtPc40VC2dPPo/4A
 gJKK4eCELS7I0OS5VMCLzYSbBLL4ln/0/8sGhHf7hLkHR5Svvepg+YTAf
 b55ql4O//9rRrruZtQC7x0x1mLsZn6tsDFmvOG++Zgu7YJHz1IHtUOIDu w==;
X-CSE-ConnectionGUID: xThUi0+WQ6645eSmF2ksdA==
X-CSE-MsgGUID: 3tD5OQdsSTiakGoGgYXM0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="69064548"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="69064548"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 14:05:42 -0700
X-CSE-ConnectionGUID: 5gfSxfseQW+pK/pplmAe1g==
X-CSE-MsgGUID: OAff4eM9SR6v/7eAhwG5iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="244994694"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 14:05:40 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 raag.jadav@intel.com, Michal.Wajdeczko@intel.com
Subject: [PATCH v3 1/5] drm/xe/printk: Add xe_warn_once()
Date: Sat,  6 Jun 2026 05:05:30 +0800
Message-ID: <20260605210534.3843211-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260605210534.3843211-1-jonathan.cavitt@intel.com>
References: <20260605210534.3843211-1-jonathan.cavitt@intel.com>
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

Create a wrapper function xe_warn_once() that calls drm_warn_once().

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_printk.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_printk.h b/drivers/gpu/drm/xe/xe_printk.h
index c5be2385aa95..afa787fcdeb6 100644
--- a/drivers/gpu/drm/xe/xe_printk.h
+++ b/drivers/gpu/drm/xe/xe_printk.h
@@ -27,6 +27,9 @@
 #define xe_warn(_xe, _fmt, ...) \
 	xe_printk((_xe), warn, _fmt, ##__VA_ARGS__)
 
+#define xe_warn_once(_xe, _fmt, ...) \
+	xe_printk((_xe), warn_once, _fmt, ##__VA_ARGS__)
+
 #define xe_notice(_xe, _fmt, ...) \
 	xe_printk((_xe), notice, _fmt, ##__VA_ARGS__)
 
-- 
2.53.0

