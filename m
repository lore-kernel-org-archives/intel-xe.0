Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464ACC83F0A
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 22:16:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36EB10E868;
	Wed,  9 Jul 2025 22:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hSCaQHQF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05A710E0E5
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 22:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752099370; x=1783635370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xPkQ4fcLPWnK4/xwo4L6yHohEwKB4Bl4nzW1smZPy4A=;
 b=hSCaQHQFdMIbgs5wxJcHj0HC8UifEMa6Nivgb1w0riC7mJ1i9/YJQCqp
 tjV0x2DL6AqpJw/ap0I2Rc51zCKazAr63xK3Y5GxBGJEUpzkGX1aW190p
 EjlVLiZfvoEU45tb7BDjTU27fKclonmAilJPdc3lWEfOWv+doIL93xaV/
 0YK5XgLBWN5ndjf1DEGFjBcvswvfXZp48an3snk3w90AMGG0ZEqXi6hGB
 P9c1JUyxRpwtyVhLJhQrNqMCcEo1lN06AmOqzQZa8BP7+omQOEZExAQH+
 O8CEO0It5rKGpaMRGAAmx1DmcbjCFr+NXCWmyp3xJYUgNQYWK5KSebvlj A==;
X-CSE-ConnectionGUID: qMMxvbmqS+unsHGtTT0mqg==
X-CSE-MsgGUID: pBb6bZh0SielkPcI9G/8QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54518056"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="54518056"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 15:16:10 -0700
X-CSE-ConnectionGUID: Z6/1cGZeReWaTlu6TXXDNg==
X-CSE-MsgGUID: PWkx587CSaahcCdcNTkpZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="193096136"
Received: from msatwood-mobl.jf.intel.com ([10.24.13.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 15:16:10 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH v6 2/6] drm/xe: add xe_device_wa infrastructure
Date: Wed,  9 Jul 2025 15:16:01 -0700
Message-ID: <20250709221605.172516-3-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250709221605.172516-1-matthew.s.atwood@intel.com>
References: <20250709221605.172516-1-matthew.s.atwood@intel.com>
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

There are some workarounds that must be appplied before gt init,
wa_15015404425 for example. Instead of sprinking them conditionally
throughout the driver as we did for i915 generate an oob.rules file
reusing the RTP infrastructure to make these easier to track.

v2: rename xe_soc_wa to xe_device_wa
v5: derive prefix from argument rather than hard coding the values.
v6: split out xe_gen-wa_oob changes

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/Makefile               | 9 ++++++++-
 drivers/gpu/drm/xe/xe_device_wa_oob.rules | 0
 2 files changed, 8 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/xe/xe_device_wa_oob.rules

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 1d97e5b63f4e..42fce65bc110 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -21,6 +21,13 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
 		 $(src)/xe_wa_oob.rules
 	$(call cmd,wa_oob)
 
+generated_device_oob := $(obj)/generated/xe_device_wa_oob.c $(obj)/generated/xe_device_wa_oob.h
+quiet_cmd_device_wa_oob = GEN	$(notdir $(generated_device_oob))
+      cmd_device_wa_oob = mkdir -p $(@D); $^ $(generated_device_oob)
+$(obj)/generated/%_device_wa_oob.c $(obj)/generated/%_device_wa_oob.h: $(obj)/xe_gen_wa_oob \
+		 $(src)/xe_device_wa_oob.rules
+	$(call cmd,device_wa_oob)
+
 # Please keep these build lists sorted!
 
 # core driver code
@@ -340,4 +347,4 @@ $(obj)/%.hdrtest: $(src)/%.h FORCE
 	$(call if_changed_dep,hdrtest)
 
 uses_generated_oob := $(addprefix $(obj)/, $(xe-y))
-$(uses_generated_oob): $(obj)/generated/xe_wa_oob.h
+$(uses_generated_oob): $(obj)/generated/xe_wa_oob.h $(obj)/generated/xe_device_wa_oob.h
diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
new file mode 100644
index 000000000000..e69de29bb2d1
-- 
2.49.0

