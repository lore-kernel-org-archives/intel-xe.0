Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F074FCA0EFC
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 16:18:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B858A10E38E;
	Thu, 21 Aug 2025 16:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UnEOK4dw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404E410E38A
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 16:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755793117; x=1787329117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HqndTNVgWU46dKlNKZddJb4DoXTN2X0dvk2cRn9r3Ew=;
 b=UnEOK4dw3TT42cUMLH+uodA4DTnZ/uo5+BXXSHG+XfSQFB9lumrKISNT
 B5BwuG0r72Ss4SaJDzoGJZ7DQvZXVAWAVP0tkRPu9vpQhTE/7Xh+YqdZ1
 MGbzSwU5mrGVUXFTGbOp6CXZVNq4VKAxnHcDawMPIfPqzXIuyB+/niByu
 AmBlux/yD0m1a1jNaiF4UHhJzP8jAd1XcuStUtZ/vQXwMmidadDj3ie2b
 Xe4l7Xpf7XI8NpsRpWrWGc8QhSDfZf2Hh88nAUxe/ry1prEHopgkZCEVb
 DrFB4SnDx4zYVyCQ2rXGXD40LCH0SQcxucRNAaInwuvn9N61uV6EiL6/9 A==;
X-CSE-ConnectionGUID: Df09fUKyTDyv1B+gonVFDQ==
X-CSE-MsgGUID: TpaYJY9bTlS22RA8Uyhlnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69527900"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="69527900"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 09:18:37 -0700
X-CSE-ConnectionGUID: FkY3g3pSQFWWAdOUQic03g==
X-CSE-MsgGUID: Ja+MKinoTFOPISiXiRmAHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="199326748"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 09:18:36 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, prashanth.kumar@intel.com,
 dnyaneshwar.bhadane@intel.com
Subject: [PATCH v5 11/12] drm/xe/configfs: Minor fixes to documentation
Date: Thu, 21 Aug 2025 09:18:06 -0700
Message-ID: <20250821-psmi-v5-11-34ab7550d3d8@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821-psmi-v5-0-34ab7550d3d8@intel.com>
References: <20250821-psmi-v5-0-34ab7550d3d8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
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

Add a few missing punctuation and line breaks and make the syntax for
code snippets common to all of them.

Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 089e21fefcfd8..26c5e1b292636 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -24,9 +24,10 @@
  * =========
  *
  * Configfs is a filesystem-based manager of kernel objects. XE KMD registers a
- * configfs subsystem called ``'xe'`` that creates a directory in the mounted configfs directory
- * The user can create devices under this directory and configure them as necessary
- * See Documentation/filesystems/configfs.rst for more information about how configfs works.
+ * configfs subsystem called ``xe`` that creates a directory in the mounted
+ * configfs directory. The user can create devices under this directory and
+ * configure them as necessary. See Documentation/filesystems/configfs.rst for
+ * more information about how configfs works.
  *
  * Create devices
  * ==============
@@ -113,7 +114,7 @@
  *
  * The created device directories can be removed using ``rmdir``::
  *
- *	rmdir /sys/kernel/config/xe/0000:03:00.0/
+ *	# rmdir /sys/kernel/config/xe/0000:03:00.0/
  */
 
 struct xe_config_group_device {

-- 
2.50.1

