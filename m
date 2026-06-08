Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24E3CD6E79
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 18:31:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B18D10E36F;
	Mon,  8 Jun 2026 18:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZS3w66lq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D3010E367;
 Mon,  8 Jun 2026 18:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780943459; x=1812479459;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ObHa+CKKCJ5pI4SGqwkGQZlPbdi6mey9UdKl/WyzJIs=;
 b=ZS3w66lqt6Hu+ofn2MKxCPg7xY/JZVFCfW6boqOhHlPTV+gwPgVC5Mg3
 0xFKX9GhD8dLHgcJMw0UNFWAASYC+xFa3ygBewtmTnn68d7b0a998h/yj
 HoLrzwE05yRHuzO98EEMaqTYtQjftySkTeyppucmbHCBkTxu+fE+Rb1Zx
 hQdHgwj7ocKjns1Erm4FVZLS95iT26v5DaSC4Z4fT0EQHw6KSQawIUPdE
 6qEtQAhzH4EF2/ADJR/ik/8wkZ9eBDVoOjDMzyHDQYPNi9mHZIOBPg9VI
 MLVVzKjE8NctPmAEJYg2DZHjp0TMhXQFvYMjC0N18JEhGPeEjp/ediXQN w==;
X-CSE-ConnectionGUID: mJu9NBa0T1KgNOxLIEBhmg==
X-CSE-MsgGUID: Sl6Zh5MhTu+l3PhLjrCvPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="85543979"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="85543979"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 11:30:58 -0700
X-CSE-ConnectionGUID: 6U+cT/5kSF2+lsjuMUaJBQ==
X-CSE-MsgGUID: 2c+YCSf0SHu5+ZJcBXLbYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="249542015"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 11:30:57 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 raag.jadav@intel.com, Michal.Wajdeczko@intel.com
Subject: [PATCH v4 1/5] drm/xe/printk: Add xe_warn_once()
Date: Tue,  9 Jun 2026 02:30:46 +0800
Message-ID: <20260608183050.3875235-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608183050.3875235-1-jonathan.cavitt@intel.com>
References: <20260608183050.3875235-1-jonathan.cavitt@intel.com>
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

