Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BA5F30956
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 13:10:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2EA310E29E;
	Thu,  5 Mar 2026 13:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KUORK4sO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11CD10E29E;
 Thu,  5 Mar 2026 13:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772716249; x=1804252249;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WqtAM8bzKPJlSaqRtvK/cj91YfXOSmVv8MMgMMscGpU=;
 b=KUORK4sOi534iQQ/LHcfEB/9XUUepCvJhxh8TS1GqljfRhiCP4LWLUqR
 tBIET5t1MJhHV+opD+zUERKRXolERoC+9PiYyyqm+EvYN2f3pSAC1Tbec
 uAc0CPKaPilFCgmikV1FYDWZBp6acZh6g0J5XPLjcypOnpLvcwSaJe21i
 s59bEUQgiHvvA9m4LsvmX/HRsAjj3sylalOk4hWzYZRUfHnVsNe7Y+oqW
 DCJSHP1NDW4HIXenR222P9QvLiEh7CA39x+CR98ba3lF9TLElF9/g0KPb
 0yO2AzhFK3dUgNzt3wVQGEOzPsrCDSoS68dW1B6vP9gCJfk/i7Pd7DMtq w==;
X-CSE-ConnectionGUID: WShV7FQ6T4Skj0KMM4uqfQ==
X-CSE-MsgGUID: 0oI4lk9CSzSd1cxFS5KiiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="96418648"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="96418648"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 05:10:44 -0800
X-CSE-ConnectionGUID: tvIQZWeESP2aaEvwK940cQ==
X-CSE-MsgGUID: 4kAcD7l8QmmziVtokOR3Gg==
X-ExtLoop1: 1
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 05 Mar 2026 05:10:41 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 christian.koenig@amd.com, andrealmeid@igalia.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 1/3] drm/doc: Update documentation for 'none' recovery
 method
Date: Thu,  5 Mar 2026 18:36:47 +0530
Message-ID: <20260305130720.3685754-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305130720.3685754-1-raag.jadav@intel.com>
References: <20260305130720.3685754-1-raag.jadav@intel.com>
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
 Documentation/gpu/drm-uapi.rst | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index d98428a592f1..579e87cb9ff7 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -438,14 +438,14 @@ following expectations.
     unknown         consumer policy
     =============== ========================================
 
-The only exception to this is ``WEDGED=none``, which signifies that the device
-was temporarily 'wedged' at some point but was recovered from driver context
-using device specific methods like reset. No explicit recovery is expected from
-the consumer in this case, but it can still take additional steps like gathering
-telemetry information (devcoredump, syslog). This is useful because the first
-hang is usually the most critical one which can result in consequential hangs or
-complete wedging.
+No Recovery
+-----------
 
+Here ``WEDGED=none`` signifies that no recovery is expected from the consumer
+but it can still try to gather telemetry information (devcoredump, syslog) for
+debug purpose in order to root cause the hang. This is useful because the first
+hang is usually the most critical one which can result in consequential hangs
+or complete wedging.
 
 Vendor Specific Recovery
 ------------------------
-- 
2.43.0

