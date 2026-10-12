Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46F8CA9EC5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 23:31:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E7B10E60E;
	Mon, 12 Oct 2026 23:31:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0124710E60E
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 23:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791847866; x=1823383866;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nNO5K3JeP6e73p3iQoVD/7MtCK7R6Hiss74TyccM/00=;
 b=mSb8b5O/orVGTlOSQhBvgoomyxnOyPsd/sCu9elUWed6wKWDQS7M4U5n
 N86X0jfWhKtlr0S9lIw0sdEjuCExKqnpb7mKxM1jBCCeJ7lW2fSRLefn/
 RCdCaOfQXuCn2JpPQZ7rYOyzzanRWhZ50emZxJB6f8K4IAJt+LFJcyTjA
 UE+CVP2agm3xBhv8CrUJ9kF5OpevIwYUqWNmald9gyPwRTuI7gpS4dj65
 65DfEVkskT+eTyDIQmNNEz22SuCoqgcdsk1UPcW+dY9El/CirGsTNz+MZ
 dmScUqxveMY+PTY1ReXhuF9BzrCutDycMWkd+jpPYTHxxYkjqk1f3Ns9y A==;
X-CSE-ConnectionGUID: iEkW/Mm4SSySZAJXlH/vJw==
X-CSE-MsgGUID: OSflNWKjREKJpiIqmoWyJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="464078"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="464078"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 16:31:05 -0700
X-CSE-ConnectionGUID: AEmWhZZURK2OMj48QzrP/g==
X-CSE-MsgGUID: q8sn4LIdSa6AaS71gC5o1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1001208"
Received: from mdroper-desk1.fm.intel.com ([10.121.64.167])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 16:31:05 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH] drm/xe/cri: Implement workaround Wa_15020021844
Date: Mon, 12 Oct 2026 16:30:36 -0700
Message-ID: <20261012233035.1277288-2-matthew.d.roper@intel.com>
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

On Crescent Island platforms, the pcode is signaling "ready" to the
driver prematurely since one last sysctrl firmware initialization step
is still underway and not fully complete.  Since the driver's
initialization is racing with the end of the firmware's init, this can
lead to error messages like:

   xe 0000:be:00.0: [drm] *ERROR* sysctrl: Firmware error: 0x06
   xe 0000:be:00.0: [drm] *ERROR* sysctrl: Mailbox command failed: -EIO

The current recommenedation to work around this is for the driver to
wait an additional 0.5 seconds after getting the "ready" response,
before moving on with other initialization tasks.

Note that the official definition of this workaround is still being
finalized, so "Wa_15020021844" is a bit of a placeholder/guess.  It's
possible that the actual number could still change, although the request
to wait the additional half second is pretty well set at this point.

Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device_wa_oob.rules | 1 +
 drivers/gpu/drm/xe/xe_pcode.c             | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
index d8dc41851425c..0488a20461d81 100644
--- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
@@ -7,3 +7,4 @@
 14026633728	PLATFORM(CRESCENTISLAND)
 14026746987	PLATFORM(CRESCENTISLAND)
 14026779378	PLATFORM(CRESCENTISLAND)
+15020021844	PLATFORM(CRESCENTISLAND)
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 266deecbb100a..897d44ecae42b 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -11,6 +11,7 @@
 
 #include <drm/drm_managed.h>
 
+#include "generated/xe_device_wa_oob.h"
 #include "regs/xe_pmt.h"
 #include "xe_assert.h"
 #include "xe_device.h"
@@ -20,6 +21,7 @@
 #include "xe_pm.h"
 #include "xe_printk.h"
 #include "xe_vsec.h"
+#include "xe_wa.h"
 
 /**
  * DOC: PCODE
@@ -320,6 +322,9 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
 		xe_log_err(tile, PCODE, ret, "initialization timedout after %ld seconds\n",
 			   timeout_us / USEC_PER_SEC);
 
+	if (!ret && XE_DEVICE_WA(xe, 15020021844))
+		msleep(500);
+
 	return ret;
 }
 
-- 
2.43.0

