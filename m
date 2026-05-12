Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68366CD343F
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 18:33:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEEC510EBDB;
	Tue, 12 May 2026 18:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iAPBg1PH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA11A10E59D
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 18:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778610834; x=1810146834;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MnbXcz2F2xPw5LYd2E3uChSE2rQ7S1Fj6dWe+C+r8iU=;
 b=iAPBg1PHmD256wlNG3fCiZhO8PyuQ3V+9Cewx5nsII3/3TPBqha721kA
 0YcU8AI0frl3bBHs5mjeR2MRZNIvncbEOZYxlxLUAAn8ugSkNGFiasjQq
 jvAErMLvBs4Y3OKmg1FkdpIU9kkzZktSYbDGb1MA02ffUufzgA13z2AcC
 ZF3W9/xFpBtocGDd1pZTpf3ilNLFEyDwThO8ycIWanJUXVTaocJCArnhN
 YqvXz8zjHWB1kUI4/JEOLMNVB4JyNwSfrYkvSJzRYM5zIAWhCQGHX8gOA
 5jCFw4DN+Npctmv0gVcCY04tkuSK9V1MCOz9KnQazn1HFxVWJf9GfLyRC Q==;
X-CSE-ConnectionGUID: qZRtmPawTTmz9F1gZyClWQ==
X-CSE-MsgGUID: TVcR5YGDR+W7o8nzW3NmtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79425712"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="79425712"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 11:33:54 -0700
X-CSE-ConnectionGUID: yauDVq2fR4KEX7f8OMMHzw==
X-CSE-MsgGUID: 7duqEfz2QB+5svCFONkI2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="234791078"
Received: from dmagui1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.118.167])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 11:33:52 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 1/7] drm/xe: Drop unused drm/drm_atomic_helper.h include
Date: Tue, 12 May 2026 20:33:36 +0200
Message-ID: <20260512183342.3374-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512183342.3374-1-michal.wajdeczko@intel.com>
References: <20260512183342.3374-1-michal.wajdeczko@intel.com>
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

We don't need this header in xe_device.c file.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 4b45b617a039..6512f1dfe691 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -10,7 +10,6 @@
 #include <linux/fault-inject.h>
 #include <linux/units.h>
 
-#include <drm/drm_atomic_helper.h>
 #include <drm/drm_client.h>
 #include <drm/drm_gem_ttm_helper.h>
 #include <drm/drm_ioctl.h>
-- 
2.47.1

