Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFCAC07548
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 11:29:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B6110E04A;
	Wed, 15 Nov 2023 11:29:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0BD10E04A
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 11:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700047773; x=1731583773;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vkC2ZFaQQIJmZxHNAVRIFPkHbBLQHY6Uy93SIpbb4jU=;
 b=XReN7e3pmAcW8UHzB1/UbZ4FD/xQAW7ClGdmHTMdI0dDmeT1LpEcOhcQ
 K5By7+qrXjKh82ZZSBWggoMnS/qSD6pTSOCqpDDkf0zEPHD1skoCtX5RF
 ZiQ+SFkVRWyqMgrrctet+SByq45rsGfHallZW3MzjME15FQx5a+2yIZur
 hfrLZy5RIizbWhvxMgIrbIkKZvGVL1T72wrkbi8bknUWxnChfDkDNlW3R
 uGZRDgASLV2H0C2MQJcGq4E/uNHRNDpLDYQ+OVRMbQsFdDZi9pYOqOGpW
 2TQXeSH4r8IRV0ErckwU5jLyUXP18EdCK+WJ7v2rV79odN3GVQJDFxOX2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="3975267"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; 
   d="scan'208";a="3975267"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 03:29:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="835367114"
X-IronPort-AV: E=Sophos;i="6.03,304,1694761200"; d="scan'208";a="835367114"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.135.24])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 03:29:31 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 15 Nov 2023 12:29:21 +0100
Message-Id: <20231115112921.1905-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/doc: Include documentation about
 xe_assert()
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

Our xe_assert() macros are well documented.
Include that in master documentation.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 Documentation/gpu/xe/index.rst        | 1 +
 Documentation/gpu/xe/xe_debugging.rst | 7 +++++++
 2 files changed, 8 insertions(+)
 create mode 100644 Documentation/gpu/xe/xe_debugging.rst

diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index 5c4d6bb370f3..c224ecaee81e 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -22,3 +22,4 @@ DG2, etc is provided to prototype the driver.
    xe_rtp
    xe_firmware
    xe_tile
+   xe_debugging
diff --git a/Documentation/gpu/xe/xe_debugging.rst b/Documentation/gpu/xe/xe_debugging.rst
new file mode 100644
index 000000000000..d65e56ff3500
--- /dev/null
+++ b/Documentation/gpu/xe/xe_debugging.rst
@@ -0,0 +1,7 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+=========
+Debugging
+=========
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_assert.h
-- 
2.25.1

