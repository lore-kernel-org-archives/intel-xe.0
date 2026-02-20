Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9C9C5AD4E
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:28:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8D410E82F;
	Fri, 20 Feb 2026 17:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LOZORbIE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DAA10E81F
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771608497; x=1803144497;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=I71uZG2XFYZ0owiEtgxlq9ZLlSuuG3SNcq5Vuws08UA=;
 b=LOZORbIE5pq5UL8BL4yKefoGQMwICsit7ABfaTssrcdht+YOOfEbwqlw
 KA26O4vrt5GnucQikQUY9ioO32RrOSAJl/Ymjz7i+wKWg7lJ2lWMnaiSE
 L+ALFj9xw+oHIVAUCRgnPrkoswB3YLCoh6WQK1YlI/r/VYolyRyk+A3Cu
 uFPGszs1fQLnqJVKCFiHHPoSL3pgdcFKpMJIlY7k8EeJNB9/xHz4SsDhU
 jmRSqv7JsOuXZrV0WaHKZ7NfONJUnwNfN5Cuz0sMsnQmohXaHREmaELXn
 0JjqEYmLJlIgkoMG/+V3PWIBBsoe652Zz5LArsrNsR3AFIiXdiO8bdEDr w==;
X-CSE-ConnectionGUID: LUDUxD+4Q1KkhuaGHNwP3Q==
X-CSE-MsgGUID: 2oaW+tD8S8C31jzlUfUHfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72606730"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72606730"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:16 -0800
X-CSE-ConnectionGUID: kKC9rPfKQgeVCM2GJQtBLQ==
X-CSE-MsgGUID: lOFQ6nGSThGFY1zcg/X8IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="214138673"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:28:17 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri, 20 Feb 2026 09:27:25 -0800
Subject: [PATCH v2 03/23] drm/xe/wa: Document new policy regarding
 workaround IP ranges
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-forupstream-wa_cleanup-v2-3-b12005a05af6@intel.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>, 
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3730;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=I71uZG2XFYZ0owiEtgxlq9ZLlSuuG3SNcq5Vuws08UA=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBpmJmsNLiw7F6qFXQdiFaSM9R4Va+i/0bhREYGR
 y1rX6VFHDKJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCaZiZrAAKCRBNeSQFyHKQ
 BAv4D/4+EVU6VK/Ma/ThLUFZdZ0SEZ4Qym+4tFGtBgjLM2of5oXyQwaP3a8YlgL7p9Cj5rKgLVq
 arnon3l98t4+p7qhG09UWbm734Yikq0H41dI1P2Mon1Q2HvZX3EVmIiaxvAfC7vXnhBr57NGL/k
 nxbFjqkV8hh8GXV/YAVecs/dt7+/9mjSZk6QiCi564O4TwVVkYGLIsj+skjDRFpAUOUEyOqDs39
 Zg5vFDtikmJ8x1/YeROYvIERqTHuMgoGWXa5Zw+sj0gYjIUTuGhKztDhfBodoxcj57eCNwMpdlB
 7dM3O6UbOJ6WAPVw6pJGYgHVNVIllCGcb5D4CiqvndzS0DJGekRw2pC54shmBq15RtvzEI+PXsU
 8eg6sLIbPb016V1kTILlfcHoOOdY3IotJx/IIq1HEkg29py5+gG7R6qBa9eV3R/+xb/Y+JVYjeZ
 JgQSx2OKu+X62qX9rlpeEn9V8St/OtP7q112bjkDMyQCF198viyYhbJ+H/QQKe5C8RIDzUd0Txy
 L/dYPT/pPLaaQLQz7v5zjcCL83fGynFcwyRqVhuNFDHY+JF9xMBXVaXtsc2jwthN7t/p7GV2pW7
 YBynxHTp7BperlV79gonmMkI2Hqa1IiGAkv+POqNomDIrl2anTZXpmWwxj4qdlZR6C09V8aFq+m
 oyV7o3cLmQYvxVw==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

During early Xe driver development, our policy for applying workarounds
to ranges of IP versions was to only use GRAPHICS_VERSION_RANGE and
MEDIA_VERSION_RANGE rules when all of the affected IP versions had
consecutive version numbers; otherwise separate RTP entries should be
used.  For example, a workaround that applies to all Xe2-based platforms
would be implemented in the driver with two RTP entries:  one using
GRAPHICS_VERSION_RANGE(2001, 2002) and the other using
GRAPHICS_VERSION(2004).  This ensured that if a new IP variant showed up
in the future with currently unused version 20.03, an old workaround
entry wouldn't automatically apply to it by accident (and we could
always consolidate those two distinct entries in the future if the
workaround database did explicitly indicate that 20.03 also needed the
workaround).

Now that we're a couple years down the road with this driver, the number
of IP versions supported is much larger (several Xe2 20.xx versions,
several Xe3 30.xx versions, and a couple Xe3p 35.xx versions).  When new
workarounds are discovered that need to apply to a wide range of IPs,
it's becoming more of a pain to create independent entries for each
non-contiguous range of versions, and the general consensus is that we
should revisit our previous policy and start allowing use of
VERSION_RANGE constructs for non-contiguous version ranges.

Note that allowing ranges that cover currently unused versions will
require additional care if/when some of those intermediate version
numbers start being used in the future.  We'll need to re-check every
workaround that has a range including the new IP version and check the
hardware database to see whether the workaround also applies to the new
version (no code change required) or whether we need to split the
existing range into two separate ranges that don't cover the new
version.  The platform enabling engineers are willing to take on this
extra review burden at the time we first enable a new IP in the driver
(see lore link below for one recent discussion).

Update the kerneldoc for the workaround file to make the new policy
official.

Link: https://lore.kernel.org/all/20260203233600.GT458797@mdroper-desk1.amr.corp.intel.com/
Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 4b2c77f51fd830fe2439708865fb0b966545bc71..c3d694947bd5d2b178e9da08bb937dc6a171b326 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -111,6 +111,17 @@
  *    difference of how they are maintained in the code. In xe it uses the
  *    xe_rtp infrastructure so the workarounds can be kept in tables, following
  *    a more declarative approach rather than procedural.
+ *
+ * .. note::
+ *    When a workaround applies to every single known IP version in a range,
+ *    the preferred handling is to use a single range-based RTP entry rather
+ *    than individual entries for each version, even if some of the intermediate
+ *    version numbers are currently unused.  If a new intermediate IP version
+ *    appears in the future and is enabled in the driver, any existing
+ *    range-based entries that contain the new version number will need to be
+ *    analyzed to determine whether their workarounds should apply to the new
+ *    version, or whether any existing range based entries needs to be split
+ *    into two entries that do not include the new intermediate version.
  */
 
 #undef XE_REG_MCR

-- 
2.53.0

