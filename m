Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC153C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 13:51:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0C810E5FA;
	Tue,  7 Nov 2023 13:51:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E98B410E5F9
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 13:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699365095; x=1730901095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u05kUvN+yAfDdXI2QKGLoiNXnlaVTRU1zJvK+Z7HCwY=;
 b=IIN6lSuMyvr3GrA9i2hPP1vv1a/ruTRWzOMZEblLbLWiowlNDdVnrmaX
 viXw27Yt2nWe9JI8kTJvjGdAYSLrQ5P5vz4XFKhVv9G0PpsB42vKF1fvI
 PAQiAb5DxXZyT2hvY4QT3uw/R8LDoy2XO3a/bOFynBc5nPm0oZHH9xo4P
 Ud40p+OSWg8ieb2eyFCbT06+PGcTXgBezy4uGoJziJfrTqlYqqW0yGlBh
 4seRSEwYp6RFxrsVDMdBKhFcO6DGtkkEH3wB9D+ZVq1Q0IX4iomxZEdMz
 ++9sSJyBnGtQz8fl44IeZ/3Cd6QooAJ+Fzb1BprdfsT2bYB9X6AtbT+Ln w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="420618992"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="420618992"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 05:51:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="762705140"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="762705140"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 05:51:33 -0800
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Tue,  7 Nov 2023 15:46:05 +0200
Message-Id: <20231107134606.316651-5-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107134606.316651-1-alexander.usyskin@intel.com>
References: <20231107134606.316651-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/5] mei: hdcp: add dependency on Xe driver
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

Optionally depend on either i915 or Xe drivers.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/misc/mei/hdcp/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/mei/hdcp/Kconfig b/drivers/misc/mei/hdcp/Kconfig
index 54e1c9526909..2ac9148988d4 100644
--- a/drivers/misc/mei/hdcp/Kconfig
+++ b/drivers/misc/mei/hdcp/Kconfig
@@ -4,7 +4,7 @@
 config INTEL_MEI_HDCP
 	tristate "Intel HDCP2.2 services of ME Interface"
 	select INTEL_MEI_ME
-	depends on DRM_I915
+	depends on DRM_I915 || DRM_XE
 	help
 	  MEI Support for HDCP2.2 Services on Intel platforms.
 
-- 
2.34.1

