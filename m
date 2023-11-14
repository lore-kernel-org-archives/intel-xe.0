Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA17C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 10:14:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D9410E1F1;
	Tue, 14 Nov 2023 10:14:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDEE610E1EF
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 10:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699956837; x=1731492837;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4t72hUDTI8sj9BJl8D4JTpmfLJLpVhSB6X4lNquFlUY=;
 b=R0SPcMFinjecs1qZaNW5miZuwOuyaPWxV+2oT9LxVhZ1QEyaEdJERbNI
 Bf9QglsxT+mu689PLHlmMDoqUURwThdYZfQW9G/5w4HGMDDpuG4uKz7ku
 P4cs7W6V7sqNQeFAQaBp967EXG1/K8wd42rtLNoJikNrP7WXfFFmc2K5Z
 6D32gyjPmOzJZX8RHus2tLJjf8wBxWmLGnPF6to+TOYJIu/ehL1U5PeGW
 X6YWLQ13SS86aAtglQOJzczXG55DAfnAvfo5sZZDz0wGZX6TX13JRQEjt
 uDHb2566853lun8Sy1FAcaAYkCs4nnwCVStOZXOtT3ew0+eSUeXQ/2Cv4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="375669082"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; d="scan'208";a="375669082"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 02:13:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="5974145"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 02:13:55 -0800
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Tue, 14 Nov 2023 12:08:39 +0200
Message-Id: <20231114100843.1923977-2-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231114100843.1923977-1-alexander.usyskin@intel.com>
References: <20231114100843.1923977-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/5] Revert "mei/hdcp: Also enable for XE"
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
Cc: linux-kernel@vger.kernel.org, Tomas Winkler <tomas.winkler@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This reverts commit 62db7d00efe48c614b006086f306d5addedf8f83.

It will be replaced by match without driver name.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
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
2.34.1

