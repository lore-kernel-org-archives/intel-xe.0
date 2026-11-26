Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91D0606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 21:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YpTF/yrA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E5810EA9A;
	Thu, 26 Nov 2026 21:27:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBC510EA3A;
 Thu, 26 Nov 2026 21:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795728459; x=1827264459;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kxu2+gY3KEH5i1qUGyZPIUsVIjcjQOC21rmHnW9rytc=;
 b=YpTF/yrAFD6tjtaLvK8bNP9uTMbpBLUVKpZtHsYbljIxyJfNLffgvRnK
 fuvx95KmUqmAERqIkRBsxXYW7YwdQPprxYqneFv9jkRN9iGPJzxO82VZe
 3iyOk0i9/cC8UsTIif9g3XH142DKCxTIhC633T2bdKz17kWDeQRhpueKl
 /e5Trl14UQ219zE3k2L2Q6xSGZmp+/98dCks8vo3wIW+UlsHFxQClKG8O
 4JKiikjEecH7cp9bIfxUzjiNT/YYs2l/Ob+8k05RbQZPr7pbMhgmQlQ+3
 MTN3jgPnSo8wH8WRnk4quEMTCdhyomGUnC1KyoRv6bgcjOnG05dkZhAxT A==;
X-CSE-ConnectionGUID: Q/6+qi2GSuyYoaAmYOrvfQ==
X-CSE-MsgGUID: qSw2W13LTkSLpNNVhnUKZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4531792"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4531792"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 13:27:38 -0800
X-CSE-ConnectionGUID: 2PHyt/xSSsmXG5/QngPVJQ==
X-CSE-MsgGUID: hWhJYtEvQVSRSq1H5fbGOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12037772"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.221])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 13:27:37 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/7] drm/i915/de: Move the register tracepoint to display
Date: Thu, 26 Nov 2026 23:27:22 +0200
Message-ID: <20261126212728.9034-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126212728.9034-1-ville.syrjala@linux.intel.com>
References: <20261126212728.9034-1-ville.syrjala@linux.intel.com>
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

Implement the register read/write tracepoint directly in display
code. The goal is to eliminate the uncore stuff completely
and this is one step towards it.

Having a display exclusive tracepoint does mean that one has
to enable both the core xe/i915 tracepoint and the display
tracepoint to get a full view of the system (ignoring all
the completely untraced exceptions in i915). But in general
I think this is an improvement for pure display work as you
no longer have to filter out all kinds of irrelevant registers.
The only thing I might end up missing from the core side is
the top level interrupt registers. With just the display
tracepoint enabled you'll not catch those.

Until we eliminate the remaining uncore usage you will see
double traces for display registers on xe if you have
both tracepoints enabled. i915 does not trace the _fw()
stuff (which we use to implement the display register
accessors) so on i915 you will get just the display traces
for display registers.

Support for 64bit register values is dropped since we
don't use those in the display. The few 64bit registers that
we have in display are accessed as a pair of 32bit registers.

The display code always passed 'true' as the condition to the
i915 tracpoint, so there is no point in making the new
tracepoint conditional.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.c       | 21 ++++++++++++----
 .../drm/i915/display/intel_display_trace.h    | 24 +++++++++++++++++++
 2 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i915/display/intel_de.c
index bb008e1ee8fd..fe77e8769c9b 100644
--- a/drivers/gpu/drm/i915/display/intel_de.c
+++ b/drivers/gpu/drm/i915/display/intel_de.c
@@ -10,8 +10,8 @@
 #include "intel_de.h"
 #include "intel_display_regs.h"
 #include "intel_display_rpm.h"
+#include "intel_display_trace.h"
 #include "intel_uncore.h"
-#include "intel_uncore_trace.h"
 
 static inline struct intel_uncore *__to_uncore(struct intel_display *display)
 {
@@ -151,25 +151,36 @@ int intel_de_wait_for_clear_ms(struct intel_display *display, intel_reg_t reg,
 
 u8 intel_de_read8(struct intel_display *display, intel_reg_t reg)
 {
+	u8 val;
+
 	/* this is only used on VGA registers (possible on pre-g4x) */
 	drm_WARN_ON(display->drm, DISPLAY_VER(display) >= 5 || display->platform.g4x);
 
-	return intel_uncore_read8(__to_uncore(display), reg);
+	val = intel_uncore_read8(__to_uncore(display), reg);
+	trace_intel_reg_rw(false, reg, val, sizeof(val));
+
+	return val;
 }
 
 void intel_de_write8(struct intel_display *display, intel_reg_t reg, u8 val)
 {
 	drm_WARN_ON(display->drm, DISPLAY_VER(display) >= 5 || display->platform.g4x);
 
+	trace_intel_reg_rw(true, reg, val, sizeof(val));
 	intel_uncore_write8(__to_uncore(display), reg, val);
 }
 
 u16 intel_de_read16(struct intel_display *display, intel_reg_t reg)
 {
+	u16 val;
+
 	/* this is only used on MCHBAR registers on pre-SNB */
 	drm_WARN_ON(display->drm, DISPLAY_VER(display) >= 6);
 
-	return intel_uncore_read16(__to_uncore(display), reg);
+	val = intel_uncore_read16(__to_uncore(display), reg);
+	trace_intel_reg_rw(false, reg, val, sizeof(val));
+
+	return val;
 }
 
 static __always_inline u32
@@ -178,7 +189,7 @@ __intel_de_read_fw(struct intel_display *display, intel_reg_t reg)
 	u32 val;
 
 	val = intel_uncore_read_fw(__to_uncore(display), reg);
-	trace_i915_reg_rw(false, reg, val, sizeof(val), true);
+	trace_intel_reg_rw(false, reg, val, sizeof(val));
 
 	return val;
 }
@@ -186,7 +197,7 @@ __intel_de_read_fw(struct intel_display *display, intel_reg_t reg)
 static __always_inline void
 __intel_de_write_fw(struct intel_display *display, intel_reg_t reg, u32 val)
 {
-	trace_i915_reg_rw(true, reg, val, sizeof(val), true);
+	trace_intel_reg_rw(true, reg, val, sizeof(val));
 	intel_uncore_write_fw(__to_uncore(display), reg, val);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_trace.h b/drivers/gpu/drm/i915/display/intel_display_trace.h
index 98ba7e20ca30..fe69d203549b 100644
--- a/drivers/gpu/drm/i915/display/intel_display_trace.h
+++ b/drivers/gpu/drm/i915/display/intel_display_trace.h
@@ -959,6 +959,30 @@ TRACE_EVENT(intel_frontbuffer_flush,
 		      __get_str(dev), __entry->frontbuffer_bits, __entry->origin)
 );
 
+TRACE_EVENT(intel_reg_rw,
+	TP_PROTO(bool write, intel_reg_t reg, u32 val, int len),
+
+	TP_ARGS(write, reg, val, len),
+
+	TP_STRUCT__entry(
+		__field(u32, val)
+		__field(u32, reg)
+		__field(u16, write)
+		__field(u16, len)
+		),
+
+	TP_fast_assign(
+		__entry->val = val;
+		__entry->reg = intel_reg_offset(reg);
+		__entry->write = write;
+		__entry->len = len;
+		),
+
+	TP_printk("%s reg=0x%x, len=%d, val=0x%x",
+		__entry->write ? "write" : "read",
+		__entry->reg, __entry->len, __entry->val)
+);
+
 #endif /* __INTEL_DISPLAY_TRACE_H__ */
 
 /* This part must be outside protection */
-- 
2.56.1

