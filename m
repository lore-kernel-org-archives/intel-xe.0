Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A166C83F33
	for <intel-xe@archiver.kernel.org>; Mon,  4 Sep 2023 18:16:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C75510E3D4;
	Mon,  4 Sep 2023 18:16:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9169410E3D4
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Sep 2023 18:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693851367; x=1725387367;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=45S/s8UTE8iiEknQf+gNOJ+vzGzV3O4lSI/iF7IVEc0=;
 b=P35u5fPFis36f1yEOspy8WxWfIOZrrAt2UJfLpLGWwPbzGtgGGinc9js
 kL+bBsRvrk8fVGPsioyUPEdXBJ9VMagtOJ/jaFbFSBXFB1mZGEffMnIax
 o7BypuGf0fS0urA97j8cLDPEJxVTXD0MgVZiirI5OtL/grQLFQrxBUwvo
 W2i9SDTgJ0apNgc5Cc6aMv56oN4dFA9/ek2CrCOoaHXQJeoYUzJLPP32M
 vv2nctFWICrNeSU4Uz/nsl+T6XG+FNtxzDovsIUPn95L3IUf5hvEPsWjd
 1hb60t7OoF5mYqyuGHpMi4o8u6dO4VKe46QbplM8QX2LZSxVrj/gNiVIO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="366867384"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; d="scan'208";a="366867384"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 11:16:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="1071692688"
X-IronPort-AV: E=Sophos;i="6.02,227,1688454000"; d="scan'208";a="1071692688"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 11:16:04 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	linux-hwmon@vger.kernel.org
Date: Mon,  4 Sep 2023 23:52:53 +0530
Message-Id: <20230904182258.2291881-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230904182258.2291881-1-badal.nilawar@intel.com>
References: <20230904182258.2291881-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 1/6] drm/xe: Add XE_MISSING_CASE macro
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
Cc: linux@roeck-us.net
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add XE_MISSING_CASE macro to handle missing switch case

Cc: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_macros.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
index daf56c846d03..21ba859d5f80 100644
--- a/drivers/gpu/drm/xe/xe_macros.h
+++ b/drivers/gpu/drm/xe/xe_macros.h
@@ -15,4 +15,7 @@
 			    "Ioctl argument check failed at %s:%d: %s", \
 			    __FILE__, __LINE__, #cond), 1))
 
+#define XE_MISSING_CASE(x) WARN(1, "Missing case (%s == %ld)\n", \
+				__stringify(x), (long)(x))
+
 #endif
-- 
2.25.1

