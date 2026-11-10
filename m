Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17FA606A320
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 18:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K7caehul
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732A110E969;
	Tue, 10 Nov 2026 18:47:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF5B10F066;
 Tue, 10 Nov 2026 18:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794336426; x=1825872426;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=br9B5EKL6PGLRV5ns/5eWSlO0D98k2E6y0e7w/39AfY=;
 b=K7caehul93HXJRFs1wvKnoxPnV6pymSCmbcOBSdPX36kBrthpVuPcvld
 FWTtapPg1+AhRRRCULOyTQkmtIt9WNV12DAXVQotWrjWYiqz5UwVy3ybP
 3aLxm9NgL2ZUefgdUmB0t79bNHfe+ynQX6hFbIlU+PoXUt1bg//gV61qi
 /tk8Jf23iD7iuVp31GMBwxqnIs10W+odSI9rzqDJ7bxrSw09L57Zde9OI
 jtS465S7iS5FsX8+uCIt4KbnUhGpk9PJPt5z62I1uH5Yp+u93ofl7sNRa
 /Hvni4TyTxhgh3L85JM/84/aogJgytgdc9gYbPgRUEM8qkrpfhNxkHoJf w==;
X-CSE-ConnectionGUID: 94lCb7AXTVqEZfKMHWH6ew==
X-CSE-MsgGUID: v3NY1WqwQyG1TJcm+YaToA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2975361"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2975361"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 10:47:05 -0800
X-CSE-ConnectionGUID: RHKqmDpWSoGmz4vGo40BHQ==
X-CSE-MsgGUID: WBdi9G0jT+qzx2ZrmS2ZwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; d="scan'208";a="10007718"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.86])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 10:47:04 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 09/10] drm/i915/de: Stop using intel_uncore_{read,write}()
Date: Tue, 10 Nov 2026 20:46:20 +0200
Message-ID: <20261110184622.1721-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110184622.1721-1-ville.syrjala@linux.intel.com>
References: <20261110184622.1721-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Stop using the heavier intel_uncore_{read,write}() and
just use intel_uncore_{read,write}_fw() for all display
register accesses.

The main functional change here is that we now stop
grabbing uncore.lock for display registers. Its job
is now fully taken over by the display mmio.lock.

The one little thing we want to keep from the uncore
implementation is the runtime pm asserts (sadly xe
doesn't implement them, but i915 does). We have the
parent interface for it, so just use it. That is one
extra vfunc call, but not sure there's any way around
it.

One somewhat unexpected side effect (or bonus) is that
on ILK we also lose ilk_dummy_write(), which is currently
done ahead of all (non-fw) mmio accesses. The only
purpose of the dummy write is to wake the GT from
RC6 ahead of the actual mmio access. Display has
nothing to do with RC6, and I don't think we actually
ever enabled RC6 on ILK, so the whole thing is pointless.

As a result of eliminating ilk_dummy_write() display
register accesses become faster on ILK (numbers in
nanoseconds):
      | fw  |   non-fw   |
read  | 140 | 430 -> 140 |
write | 170 | 470 -> 170 |

Register accesses on TGL also get a bit faster,
compared against the original code before the
display mmio vfuncs were introduced:
      | fw  |   non-fw   | theoretical non-fw(*)
read  | 230 | 970 -> 840 | 2*230+230 = 690
write | 100 | 820 -> 740 | 2*230+100 = 560

(*) two FPGA_DBG reads + the actual register access

I presume the improvement was due to some combination of
eliminating the extra debug lock and just reducing the
runtime overhead in general. The remaining delta between
theory and practice seems to be mostly due to mmio.lock.
We'll probably want to think of ways to eliminate the lock
entirely, on the platforms that don't need it for register
access serialization...

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
index 451d6db3c560..9ca5b27eb768 100644
--- a/drivers/gpu/drm/i915/display/intel_de.c
+++ b/drivers/gpu/drm/i915/display/intel_de.c
@@ -9,6 +9,7 @@
 
 #include "intel_de.h"
 #include "intel_display_regs.h"
+#include "intel_display_rpm.h"
 
 static int intel_de_wait_for_register(struct intel_display *display,
 				      intel_reg_t reg, u32 mask, u32 value,
@@ -341,11 +342,13 @@ __intel_de_read(struct intel_display *display, intel_reg_t reg,
 	unsigned long irqflags;
 	u32 val;
 
+	assert_display_rpm_held(display);
+
 	__mmio_wakelock_pre(display, reg, mmio_flags);
 	__mmio_lock_pre(display, &irqflags, mmio_flags);
 	__mmio_unclaimed_pre(display, reg, false, mmio_flags);
 
-	val = intel_uncore_read(__to_uncore(display), reg);
+	val = intel_de_read_fw(display, reg);
 
 	__mmio_unclaimed_post(display, reg, false, mmio_flags);
 	__mmio_lock_post(display, irqflags, mmio_flags);
@@ -360,11 +363,13 @@ __intel_de_write(struct intel_display *display, intel_reg_t reg, u32 val,
 {
 	unsigned long irqflags;
 
+	assert_display_rpm_held(display);
+
 	__mmio_wakelock_pre(display, reg, mmio_flags);
 	__mmio_lock_pre(display, &irqflags, mmio_flags);
 	__mmio_unclaimed_pre(display, reg, true, mmio_flags);
 
-	intel_uncore_write(__to_uncore(display), reg, val);
+	intel_de_write_fw(display, reg, val);
 
 	__mmio_unclaimed_post(display, reg, true, mmio_flags);
 	__mmio_lock_post(display, irqflags, mmio_flags);
-- 
2.56.0

