Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81134C7618A
	for <intel-xe@archiver.kernel.org>; Thu, 16 Mar 2023 21:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A25F10E31F;
	Thu, 16 Mar 2023 21:03:54 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFBC10E36C
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Mar 2023 21:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679000633; x=1710536633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c+Aa6mebo40L3YSVM5959xkPjARBsD23UlP3Ynd+Ee0=;
 b=E76pUDeoFIuxsb6jXQDh1spXHx7+l94CEG3zAqfdu7/eCBbRVolnYXQY
 X7PPtSiHtQcx0x3AwGcgunUQxATIeXqNMQs3b/lNalcvYyWY5R/VE9763
 BiXDFqUgt4Fm5bhCBrCsArV4TmvwGLIan/uotCHRoGa16r7hio1OGVdSQ
 tWmT4tB/u4/mf1RWUHxrSq41vyn/vxgz0fvG5++FK0gQAjcnEbK+ELctd
 FJADLBx2MIDbHIvCaPz0zVh0JVgqpwJ4mPe4Yn3zkEIMFvgI+GDUubPCK
 ituvb0V2y9K3xEaGKkVV63UN14Y/EAh3/YGxt4vZUIN9f6ncbChyt6PKz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="338127578"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="338127578"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 14:03:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="657320512"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="657320512"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 14:03:52 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Mar 2023 14:03:39 -0700
Message-Id: <20230316210341.3547058-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230316210341.3547058-1-lucas.demarchi@intel.com>
References: <20230316210341.3547058-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/3] fixup! drm/xe: Introduce a new DRM driver
 for Intel GPUs
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
Cc: mauro.chehab@intel.com, thomas.hellstrom@intel.com,
 Matt Roper <matthew.d.roper@intel.com>, maarten.lankhorst@intel.com
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

