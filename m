Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93588CC6B1D
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 12:06:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5535310FD1D;
	Wed, 14 Oct 2026 12:06:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE29E10FD40;
 Wed, 14 Oct 2026 12:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791979565; x=1823515565;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rEaXSvZR6mohSINKWxErJDUxTLW/qFScsHfceYQGhyU=;
 b=kjAOr/UymkqJXoAqnZuwSJySEA3qGeFcryzvdgnG7QOHC3aaV30YNYmk
 XT6nc9pnjnxRvnjQlKWJ/frteX3WsVoe5G4sXkCPb29/+rvgxagpV2k27
 cODUTZiDmwqXu6RncQPixVt7LW0zCz4SW5clNYmTum687ohHUB3SC218W
 1DLnTLKDLQN+0ekhWA/J/JvPs/uHQuaE2QHECwSgkFruMyaW2V5erKk/1
 m2fgsEOAiy3l9F+vw3Doiogfe0f5A2ZjJEqArqVwPJt67Azc/maCf9UWj
 Y0hBsqgCxNClAuxrWlDjvbJh83VfkAblJ8YL+QzdnsDJkiTUjui86gp+g Q==;
X-CSE-ConnectionGUID: IxhKB4uITSenrBJf42o2HQ==
X-CSE-MsgGUID: vnHC1RJXS9ObLIDqjNbPZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="726975"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="726975"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 05:06:05 -0700
X-CSE-ConnectionGUID: +BoXiUWBRfaGAJJzP+xZrQ==
X-CSE-MsgGUID: ND+aCU2QSze+HIUjOSeGqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1359301"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 05:06:03 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 5/6] drm/i915/de: Implement intel_de_posting_read() via
 intel_de_read()
Date: Wed, 14 Oct 2026 15:05:41 +0300
Message-ID: <20261014120542.29675-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014120542.29675-1-ville.syrjala@linux.intel.com>
References: <20261014120542.29675-1-ville.syrjala@linux.intel.com>
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

Simplify the intel_de_posting_read() implementation by just
calling intel_de_read(). The only difference between a normal
read and posting read is the return value (u32 vs. void).

This will reduce the uncore usage footprint of intel_de.h,
which will help with cleaning up the final uncore i915 vs. xe
mess.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915/display/intel_de.h
index 3339567496e9..5d3aeaf6a70f 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -50,11 +50,7 @@ intel_de_read64_2x32(struct intel_display *display, intel_reg_t reg)
 static inline void
 intel_de_posting_read(struct intel_display *display, intel_reg_t reg)
 {
-	intel_dmc_wl_get(display, reg);
-
-	intel_uncore_posting_read(__to_uncore(display), reg);
-
-	intel_dmc_wl_put(display, reg);
+	intel_de_read(display, reg);
 }
 
 static inline void
-- 
2.55.0

