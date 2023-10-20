Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0471ACDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 20 Oct 2023 07:34:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B96E010E590;
	Fri, 20 Oct 2023 07:34:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF5610E58D
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Oct 2023 07:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697787277; x=1729323277;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding:sender;
 bh=/Y3JJVj0NkhyUQReOsTI/KdKvEaDV5UCKzMdsf7p/ss=;
 b=KWNie2/vGEhGKHQn7e82h9sejIp27A/rSza42Ns5PADZ1393jLJbALWy
 bzllN972lqtsC7DeoCpX+qBoEjBf65xS7U5yXbK1C+LBoPfZgBRHBzEJ6
 lGYU9CI7WCL1nyzyUXbiccECXKeNE6VmwdIU687DpwyidPjJdAXYRrbWW
 kAWynAFR/tGpYInPQ/7H5hvQ9SHUSxUzRHqa4jM1lNc9hval1XWYUKsVz
 rsQK8rUE3B5grSIcxwOGyLERiagpBHpMJH8ZKELaCOExN3Uy0oQdXIpQY
 5MzW+xq3fTT7+Q+clJEAwrF4iIPFUT2DS2Mmlr0mfcBC/m+srm1OECEAu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="452926709"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="452926709"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 00:34:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="848005967"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="848005967"
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 00:34:35 -0700
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.0.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 3971F580E30;
 Fri, 20 Oct 2023 00:34:35 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96.1)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qtk1g-000QwW-2N;
 Fri, 20 Oct 2023 09:34:32 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 20 Oct 2023 09:32:14 +0200
Message-ID: <20231020073430.103493-2-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020073430.103493-1-mauro.chehab@linux.intel.com>
References: <20231020073430.103493-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] misc: mei: fix Kconfig dependencies
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

The dependency chain for INTEL_MEI is not properly addressed, as
reported by LKP:

   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [y]:
   - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])

Basically, all symbols selecting INTEL_MEI shall also depends on
both X86 and PCI.

Add such dependency, as otherwise the dependencies won't be
properly followed.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202310201234.ZZLwdoiy-lkp@intel.com/
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 drivers/misc/mei/gsc_proxy/Kconfig | 1 +
 drivers/misc/mei/hdcp/Kconfig      | 1 +
 drivers/misc/mei/pxp/Kconfig       | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/misc/mei/gsc_proxy/Kconfig b/drivers/misc/mei/gsc_proxy/Kconfig
index 5f68d9f3d691..6053ebbf536d 100644
--- a/drivers/misc/mei/gsc_proxy/Kconfig
+++ b/drivers/misc/mei/gsc_proxy/Kconfig
@@ -4,6 +4,7 @@
 config INTEL_MEI_GSC_PROXY
 	tristate "Intel GSC Proxy services of ME Interface"
 	select INTEL_MEI_ME
+	depends on X86 && PCI
 	depends on DRM_I915
 	help
          MEI Support for GSC Proxy Services on Intel platforms.
diff --git a/drivers/misc/mei/hdcp/Kconfig b/drivers/misc/mei/hdcp/Kconfig
index 2ac9148988d4..a5e8d3e9fc92 100644
--- a/drivers/misc/mei/hdcp/Kconfig
+++ b/drivers/misc/mei/hdcp/Kconfig
@@ -4,6 +4,7 @@
 config INTEL_MEI_HDCP
 	tristate "Intel HDCP2.2 services of ME Interface"
 	select INTEL_MEI_ME
+	depends on X86 && PCI
 	depends on DRM_I915 || DRM_XE
 	help
 	  MEI Support for HDCP2.2 Services on Intel platforms.
diff --git a/drivers/misc/mei/pxp/Kconfig b/drivers/misc/mei/pxp/Kconfig
index 4029b96afc04..3acc05fea744 100644
--- a/drivers/misc/mei/pxp/Kconfig
+++ b/drivers/misc/mei/pxp/Kconfig
@@ -4,6 +4,7 @@
 #
 config INTEL_MEI_PXP
 	tristate "Intel PXP services of ME Interface"
+	depends on X86 && PCI
 	select INTEL_MEI_ME
 	depends on DRM_I915
 	help
-- 
2.41.0

