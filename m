Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADD6C0018C
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 13:51:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A2610E5F3;
	Tue,  7 Nov 2023 13:51:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE04810E5EE
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 13:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699365087; x=1730901087;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tXkEkdouSGqjpSmp69dGBr2atkMtY9MAl6fJ0kw7+M8=;
 b=gTZWjEwIQzJjQs/IbATH5rFo56Ow1xlDr++QFDQGAJA86giksrUVCnU5
 8LRtqRlEnpLd4piZFX922GuPQmBnbY1E2yKWL3u5jqHHuTE2RDNKdDZ8y
 GvNzOyrTtHNz0MGd4Kks5aWd/05CfchxUlcOQsc8bbS3VqfavKWA23du2
 ttQQXilMzO5vkbutdXd2LK6jh5tQUH6ERRB3TbBCsc9yr2MDGS9W6NgPR
 o5b0X5SPf9iPcEHPf9P+0hW4tXJ4lNoPCUOAbRGSSnIFV5cWXtZ9Akmjl
 k0aRZAKtxQLMk3oH9JKAIVnxNa5uOVQPINNvh0MLlVddoRNDaYdY8n0sT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="420618974"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="420618974"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 05:51:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="762705092"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="762705092"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 05:51:24 -0800
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Tue,  7 Nov 2023 15:46:02 +0200
Message-Id: <20231107134606.316651-2-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107134606.316651-1-alexander.usyskin@intel.com>
References: <20231107134606.316651-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/5] Revert "mei/hdcp: Also enable for XE"
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

