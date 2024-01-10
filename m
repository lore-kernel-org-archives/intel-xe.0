Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640CEC4707B
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 15:57:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 299C610E628;
	Wed, 10 Jan 2024 15:57:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A3E10E628
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jan 2024 15:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704902225; x=1736438225;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rvp/kVnwJhbzLIhMYNE9icgdTVdBkS2at3QZ1eqDlsg=;
 b=kVtcYfQnTR+xMx7cnpiSzDPcfAdfv1pAFhgyD3N3xHct/Ap8OWYhMvjl
 tCC74J/XEbwtlkY8abb/xZQns4oSQ7QcmfCf/uDr5XQcjf5Hak0jwel+c
 fRpOSErhMbn5I46ReKg7dD9orxOxpTbvagOPU7Wr9VvKNo8+GWvtLwNMd
 ndsgpSzbM3wBvkPz9bdlJLvBZt59t43bSni+PjOWZ6qUaXQ9d/1KDGYr6
 ib7mid9Qchx3w0eGQ/ClxmZonluELvTFJmoUDr0ky9+A5+OdIh+Uflen4
 zHYZvIm13605NVYTdw0PedudeUBtHnfJOdgXozyr800Fu+rE9WIrdYvv0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="398249221"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="398249221"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 07:57:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="925680635"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="925680635"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.28])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 07:57:04 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 1/2] Revert "mei/hdcp: Also enable for XE"
Date: Wed, 10 Jan 2024 16:56:44 +0100
Message-ID: <20240110155645.523818-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

This reverts commit 52383b58eb8cf7d6a090928c568dfbe5560f848a.
---
 drivers/misc/mei/hdcp/Kconfig    | 2 +-
 drivers/misc/mei/hdcp/mei_hdcp.c | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/mei/hdcp/Kconfig b/drivers/misc/mei/hdcp/Kconfig
index 2ac9148988d4..54e1c9526909 100644
--- a/drivers/misc/mei/hdcp/Kconfig
+++ b/drivers/misc/mei/hdcp/Kconfig
@@ -4,7 +4,7 @@
 config INTEL_MEI_HDCP
 	tristate "Intel HDCP2.2 services of ME Interface"
 	select INTEL_MEI_ME
-	depends on DRM_I915 || DRM_XE
+	depends on DRM_I915
 	help
 	  MEI Support for HDCP2.2 Services on Intel platforms.
 
diff --git a/drivers/misc/mei/hdcp/mei_hdcp.c b/drivers/misc/mei/hdcp/mei_hdcp.c
index 94beb5667faa..51359cc5ece9 100644
--- a/drivers/misc/mei/hdcp/mei_hdcp.c
+++ b/drivers/misc/mei/hdcp/mei_hdcp.c
@@ -782,8 +782,7 @@ static int mei_hdcp_component_match(struct device *dev, int subcomponent,
 {
 	struct device *base = data;
 
-	if (!dev->driver ||
-	    (strcmp(dev->driver->name, "i915") && strcmp(dev->driver->name, "xe")) ||
+	if (!dev->driver || strcmp(dev->driver->name, "i915") ||
 	    subcomponent != I915_COMPONENT_HDCP)
 		return 0;
 
-- 
2.43.0

