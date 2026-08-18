Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66EBC5DF81
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 23:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A88710E6F7;
	Tue, 18 Aug 2026 23:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CiFk95QF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5E910E5F0
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 23:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787095038; x=1818631038;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=DKK5ho5qUSTSMt3VqDQZ+L1YXhVdK0O8LHNKUbIQf2E=;
 b=CiFk95QFJLCLwD1ibjga70klKZCZ3GEwU5gPnPJ4aYvz0aFsgEeAKFjX
 LNOoaSRxIb8ljRypsoHWGSv7H1s0mSQyGsuvmLkGDNefq26XWfRDEStw1
 rrMN4Jyi0fZl+PQ4i1p55nUIDi70SHlngjJBmsVUup397yBxNTqKLUKMm
 S0GTqPz+xkZijY61RBjvETA4PDRsEdMv7Lak2aW3eOSwStEFk2d0nzv8t
 9rQvxYopLDEo4bgoZp5/LzLeIhlSrHwAgUrmJ2tmQIJs9BjhV7MYtgbEf
 E/nbTu//bN6SnvdxA1+g82z37atFYcjrvyD5CUIJp2+SnBaGrG4+ml6vn Q==;
X-CSE-ConnectionGUID: qXSoN6R0QRyIAWRPGmN+kg==
X-CSE-MsgGUID: VOJmbf9ySbG5Ku07+F08/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="110384424"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="110384424"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 16:17:18 -0700
X-CSE-ConnectionGUID: V3nRwUTfSMefPCmykOhEZg==
X-CSE-MsgGUID: ItE6mQt9QrWpwRcRPq9OPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="268883496"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 16:17:18 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com, michal.wajdeczko@intel.com,
 aravind.iddamsetty@linux.intel.com, mallesh.koujalagi@intel.com
Subject: [PATCH 1/2] drm/xe/ras: Report internal HW errors from CSC
Date: Tue, 18 Aug 2026 16:17:18 -0700
Message-ID: <20260818231716.731788-5-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260818231716.731788-4-umesh.nerlige.ramappa@intel.com>
References: <20260818231716.731788-4-umesh.nerlige.ramappa@intel.com>
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

Report internal HW errors from CSC using the xe_log_comp() helper. Since
the error triggers survivability mode, use CPER_SEV_FATAL as the
severity.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index d25d25f77531..13ae54afedf7 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -342,9 +342,10 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
 		 * is required.
 		 */
 		if (csc_error->hec_fw_error) {
-			xe_err(xe, "[RAS]: CSC %s detected: 0x%x\n",
-			       sev_to_str(counter->common.severity),
-			       csc_error->hec_fw_error);
+			xe_log_comp(xe, CPER_SEV_FATAL, SOC_INTERNAL, counter, sizeof(*counter),
+				    "CSC %s detected: 0x%x\n",
+				    sev_to_str(counter->common.severity),
+				    csc_error->hec_fw_error);
 			xe_survivability_mode_runtime_enable(xe);
 			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
 		}
-- 
2.51.0

