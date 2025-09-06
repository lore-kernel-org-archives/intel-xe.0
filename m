Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FE7CA101C
	for <intel-xe@archiver.kernel.org>; Sat,  6 Sep 2025 05:50:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5144510E2FF;
	Sat,  6 Sep 2025 05:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nPgKymXk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1254010E1A3
 for <intel-xe@lists.freedesktop.org>; Sat,  6 Sep 2025 05:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757137853; x=1788673853;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=whbSPgSovGorQRz3CK+sgjzfR8UIEidG+oN6o34ecYI=;
 b=nPgKymXkY0/LIAxK0l83w8MPp6fIItx1XoHdlsxPxNHfVU6HJhVnpbA+
 aRkFR2Q7PCM/S0+A+Hq37b2KAFpadq6RCZuDqOzpU2J6I4k91w8mREgJU
 1ec/+EClOf9d9yMjXEQICYep4dKXd1XCSm/GtXeloY+FzAXwMQ/OVapWC
 PeE57+xlEmEORAnpIJg/i5IwcXLVuJaTrSlotSsi7qNsgGohIcQLtgJie
 g8rgOBM5aWtcu8v+ldeADI0U3mpb2VSOgSxskR0RLUnArVd3PO8aKwHgP
 KY5CI4jAGTfKx681Crpc7uPNTii7cdUtQCT1yYoAJduTW2LM0FBGYwORS g==;
X-CSE-ConnectionGUID: ekdcvG98QHKcQrlMWk3qxg==
X-CSE-MsgGUID: XPTEVYhESSSN96ol0M70tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="59628641"
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; d="scan'208";a="59628641"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 22:50:52 -0700
X-CSE-ConnectionGUID: SV2XjhB6TGKVo7fWbQhdgg==
X-CSE-MsgGUID: fEUWI/hfT9evS133xORYkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; d="scan'208";a="203262834"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 22:50:52 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 2/6] drm/xe/configfs: Fix documentation warning
Date: Fri,  5 Sep 2025 22:50:30 -0700
Message-ID: <20250905-wa-bb-cmds-v3-2-3da2b7bdc73e@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250905-wa-bb-cmds-v3-0-3da2b7bdc73e@intel.com>
References: <20250905-wa-bb-cmds-v3-0-3da2b7bdc73e@intel.com>
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

Fix this warning while building the documentation:

	Documentation/gpu/xe/xe_configfs:9: drivers/gpu/drm/xe/xe_configfs.c:138:
	WARNING: Definition list ends without a blank line; unexpected unindent.

That also makes it better formatted in the output.

While at it, also fix the underline length in "Overview".

Fixes: e2b33fce5eb0 ("drm/xe/configfs: Improve documentation steps")
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
index 0337811864cd9..acdabb3a6b50d 100644
--- a/drivers/gpu/drm/xe/xe_configfs.c
+++ b/drivers/gpu/drm/xe/xe_configfs.c
@@ -21,7 +21,7 @@
  * DOC: Xe Configfs
  *
  * Overview
- * =========
+ * ========
  *
  * Configfs is a filesystem-based manager of kernel objects. XE KMD registers a
  * configfs subsystem called ``xe`` that creates a directory in the mounted
@@ -34,7 +34,7 @@
  *
  * To create a device, the ``xe`` module should already be loaded, but some
  * attributes can only be set before binding the device. It can be accomplished
- * by blocking the driver autoprobe:
+ * by blocking the driver autoprobe::
  *
  *	# echo 0 > /sys/bus/pci/drivers_autoprobe
  *	# modprobe xe

-- 
2.50.1

