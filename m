Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631A6C6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 16 Mar 2023 18:30:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBA010EDB3;
	Thu, 16 Mar 2023 18:30:15 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E81A10EDD6
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Mar 2023 18:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678991412; x=1710527412;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c+Aa6mebo40L3YSVM5959xkPjARBsD23UlP3Ynd+Ee0=;
 b=AfnxSzbH/+vCZ1MOgYX6HQsjxFyJLMfJP39jysTZ+e0YskHN2Z71ZrEi
 FlTpuVUZACSkABBljXcWZCMF6pgvyp+g+oZFHIVa5cvjiCAzffWybh2Pf
 OEqiam3pFQONt+91nbVDg5vQy01dUWo2HRKl7QPxXr7V2QmyRh56ZPDhu
 /iZDD15OTXSoIJ8PzqqZuKMjMd6aply1cilbGJWwb2HvM7NiK7czcpDcz
 PlPm881EUHzZSZ/JT4nRXGjW1K7LiR1o+X/fwU1iQqfzkmbKwsXAJhKf0
 EmHgMLNgSFZCXwSk77MONph3zLbskt1JIQaGFlcI8gGaEr6yhGzq+2xG4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="326446564"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="326446564"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 11:30:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="1009348374"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="1009348374"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 11:30:09 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Mar 2023 11:29:51 -0700
Message-Id: <20230316182951.3441696-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! drm/xe: Introduce a new DRM driver for
 Intel GPUs
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, thomas.hellstrom@intel.com,
 mauro.chehab@intel.com, maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Introduced with the 6.2 rebase due to
commit 000458b5966f ("drm: Only select I2C_ALGOBIT for drivers that
actually need it"). Make a similar selection when CONFIG_DRM_XE_DISPLAY
is enabled. Also, provide this as a fixup-only commit, to be squashed in
the next rebase. With this, the following command works again:

	./tools/testing/kunit/kunit.py build \
		--kunitconfig drivers/gpu/drm/xe/.kunitconfig

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 4684e99549d3..aeaf3ce19c4f 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -44,6 +44,8 @@ config DRM_XE
 config DRM_XE_DISPLAY
 	bool "Enable display support"
 	depends on DRM_XE && EXPERT
+	select I2C
+	select I2C_ALGOBIT
 	default y
 	help
 	  Disable this option only if you want to compile out display support.
-- 
2.39.0

