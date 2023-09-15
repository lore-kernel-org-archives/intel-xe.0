Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5C7EED61E
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 18:06:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE87510E660;
	Fri, 15 Sep 2023 18:06:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A4F10E660
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 18:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694801189; x=1726337189;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EC8hTPCE03dlykC0fSFix2G4X1Gzihr07SoazgKtZR0=;
 b=AH0Ip4/kUe3csbq66P5x/QG6jwQLjXwbNlZk3KpBEA+DO0Zvv5SNGHVJ
 8u/liEWEj2rpNvdMSQA0GdoXSvU0e2GOICN8P0ZhHbnD7VW/0nQFLAfBb
 Qf0jZ7Q8d7zNwA/Jtf//D8l0itGWcXqzDIFkNuaZVjDVqQEOKrhB7QiTb
 /mZKmFVKrPTShdvH5ZCX3ie7k2mI6IrYxZrmblZXCjMGwelnSeu4JxGy2
 cFEsmN7R2n1IB12lwpYxWtthr5Uh1LH2OWN7fGRXYTG62FitWM2yjOgY9
 kNJh77VCKt1Ggx4f74m9ztVK1UVE5bEWPZuZmXdDwyCS6zM0GvivmKR/Q w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="369631925"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="369631925"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 11:06:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="868824653"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="868824653"
Received: from cschimpe-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.223])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 11:06:27 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 15 Sep 2023 20:06:10 +0200
Message-ID: <20230915180610.39266-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH] drm/xe/display: Select some missing configs
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

When selecting CONFIG_XE_DISPLAY, the following missing symbols can be
seen unless something else has selected the corresponding configs.

ERROR: modpost: "cfb_copyarea" [drivers/gpu/drm/xe/xe.ko] undefined!
ERROR: modpost: "cfb_fillrect" [drivers/gpu/drm/xe/xe.ko] undefined!
ERROR: modpost: "cfb_imageblit" [drivers/gpu/drm/xe/xe.ko] undefined

Make sure these are included in the Xe Display build.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 096bd066afa8..ed2dd73f153b 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -45,6 +45,9 @@ config DRM_XE
 config DRM_XE_DISPLAY
 	bool "Enable display support"
 	depends on DRM_XE && EXPERT
+	select FB_CFB_COPYAREA
+	select FB_CFB_FILLRECT
+	select FB_CFB_IMAGEBLIT
 	select I2C
 	select I2C_ALGOBIT
 	default y
-- 
2.41.0

