Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2493EEC142F
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 11:08:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1615110E795;
	Tue,  3 Mar 2026 11:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MwA8xYGW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE84610E794;
 Tue,  3 Mar 2026 11:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772536119; x=1804072119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=93s9BD7y5m2vVaruxnKkUz45pgWoEnGmE3KlK/IPEBc=;
 b=MwA8xYGWwS2c3/tb/mv+QSv5pc38xWpgHMIAnCuZAUIyG6675UsyPn+R
 HqCJ6CzGZlAtzW2P1bWL7v9jjBNW38xJVlykEWpLSX9/0A/cGT6jLDZqA
 j2ucHcyZmHlWBhyGuQBRzO0PhNR3Z4vKXbyzUUZIlkPCxO43sFGTg/ub+
 QS4P3710uSLDKovsRV1okKTwMO7ldy4l0s6wbvfOc/Vh9GFXzIwq4cXm/
 Zi1kCx1zf5HP3q4gFvDtAQBcmpgSHUCX6qx3nG9QzeALmbpFUrC/SCRK7
 ZYc40Cg0/Yv62q/b4zOqfWVLZ/EZtW5BE+2+Ormytq1Dktffm54Z/0jB6 A==;
X-CSE-ConnectionGUID: hfYZjOmrRL662bAacyI+mA==
X-CSE-MsgGUID: fBKfhE8JQQquX2eQrgCwyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="77410083"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="77410083"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 03:08:39 -0800
X-CSE-ConnectionGUID: iAV73t4zSda54+u4lbduvA==
X-CSE-MsgGUID: dL2GVTVuTX+sPILdQHqnsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="248459997"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa002.jf.intel.com with ESMTP; 03 Mar 2026 03:08:36 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 christian.koenig@amd.com, andrealmeid@igalia.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 1/3] drm/doc: Update documentation for 'none' recovery
 method
Date: Tue,  3 Mar 2026 16:35:17 +0530
Message-ID: <20260303110556.3577612-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303110556.3577612-1-raag.jadav@intel.com>
References: <20260303110556.3577612-1-raag.jadav@intel.com>
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

Expand 'none' recovery method for wedged event to include debug cases
where driver wants to hint "no recovery" without resetting the device
from driver context.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 Documentation/gpu/drm-uapi.rst | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index d98428a592f1..af20136108b7 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -439,13 +439,11 @@ following expectations.
     =============== ========================================
 
 The only exception to this is ``WEDGED=none``, which signifies that the device
-was temporarily 'wedged' at some point but was recovered from driver context
-using device specific methods like reset. No explicit recovery is expected from
-the consumer in this case, but it can still take additional steps like gathering
-telemetry information (devcoredump, syslog). This is useful because the first
-hang is usually the most critical one which can result in consequential hangs or
-complete wedging.
-
+was temporarily 'wedged' at some point but no explicit recovery is expected
+from the consumer in this case. The consumer can still try to gather telemetry
+information (devcoredump, syslog) for debug purpose in order to root cause the
+hang. This is useful because the first hang is usually the most critical one
+which can result in consequential hangs or complete wedging.
 
 Vendor Specific Recovery
 ------------------------
-- 
2.43.0

