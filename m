Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE04109C05A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 18:54:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5F810E832;
	Wed, 25 Mar 2026 18:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P0tq1mfh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86A610E863;
 Wed, 25 Mar 2026 18:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774464860; x=1806000860;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N5JRKXg4wTx/Bcw7904rFg89dPs2FKfkBPgB/SV5F5A=;
 b=P0tq1mfhrgqhOVSbgk1Yg+gmURlNaz0IwKlq9e6wsj40pedjlH0Lp/Yk
 40bPavc9BIWQAxiJ0ZNMBksUDNEf06iZd2DmNxd/n4+Eec1PnaY19lLkU
 nkcd52W9nRhBhIIuG5rADpaUrlec2/erBOWqqTfo1RuSrGoVzT95vmT3G
 YB1l7KUzkybCo8q0jPloQN7RANb58/q/c4P/XaLClpZ1QaUPvnmrplOFE
 pucGWsqbh2acBNWREjTAlLft9H/NGkgCaGi/oPrFdLzYMw6yOqRRjeNDJ
 qWioC8rVGS0UYC3TbLNGEkk9XJxVyPAFJc1IzQB6AmKIJ/2CJLE8VuRod w==;
X-CSE-ConnectionGUID: BOOCcbT6RDmPjwS//+8BXA==
X-CSE-MsgGUID: BV3Z22qVSw+cp/fekXdG1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86991648"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="86991648"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 11:54:19 -0700
X-CSE-ConnectionGUID: KfUNs/o0TxKDGBZMrrbEuQ==
X-CSE-MsgGUID: z4xqQ0p0SSO3Qv6uV5HX9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="221448699"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.117])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 11:54:18 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 09/12] drm/i915/de: Add a simple intel_de_read64_2x32()
Date: Wed, 25 Mar 2026 20:53:38 +0200
Message-ID: <20260325185342.11482-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260325185342.11482-1-ville.syrjala@linux.intel.com>
References: <20260325185342.11482-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

intel_de_read64_2x32_volatile() is a complex beast because
it needs to deal with volatile register values. For simpler
cases we can simply do a pair normal intel_de_read()s.

My main reason for hating overuse of intel_de_read64_2x32_volatile()
is that it makes register tracepoints confusing. It always
does three accesses in the somewhat weird udw,ldw,udw order,
confusing the reader of the trace. Much more clear if we just
observe the two reads in the natural little endian order.

We also have no non-volatile use case where the LDW and UDW
are stored in non-consecutive registers, so we can just pass
along a single register offset.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index 295e7176b732..624a0627b95c 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -53,6 +53,19 @@ intel_de_read64_2x32_volatile(struct intel_display *display,
 	return val;
 }
 
+static inline u64
+intel_de_read64_2x32(struct intel_display *display,
+		     i915_reg_t reg)
+{
+	i915_reg_t upper_reg = _MMIO(i915_mmio_reg_offset(reg) + 4);
+	u32 lower, upper;
+
+	lower = intel_de_read(display, reg);
+	upper = intel_de_read(display, upper_reg);
+
+	return (u64)upper << 32 | lower;
+}
+
 static inline void
 intel_de_posting_read(struct intel_display *display, i915_reg_t reg)
 {
-- 
2.52.0

