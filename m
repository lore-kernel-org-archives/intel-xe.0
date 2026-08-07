Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FD4C5AC7A
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 12:34:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B616C10F4A1;
	Fri,  7 Aug 2026 12:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W7qBUZLy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF3810F4A9;
 Fri,  7 Aug 2026 12:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786106063; x=1817642063;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Iyh5wxo+KyUpQRvjkRbt8lDzJDG54sBxjCXMbH6OWdw=;
 b=W7qBUZLypMm02J6KCk8JhMnQap97gocNDFtEPMnauaFAVCLVCrn505SE
 i+zWW2wbxua0mz8WZ4dOku1GaQPJraxeJoJdSYnpn7GtEMZIW2HR1I5m4
 dVYBcgcaloSI21M/VlGIPlSiMZsT8vx/QvcmRrvOaiNkRNWr/XxCAsUnm
 A4VzhpT2j/aK6MHmTDlKrz2mxgBH9Ed2A6rfOQkzBesHjINiNUQtYTrIh
 jg+rDsTE96fwR3/g/O5t+iWFOzzFEYfe+nxv/4dVm24IrVdBCHRsZ8NxG
 BA1yjol62d31acp6astYOusWaJjKWEn+r+hlgYyQEax6rUB9tAKV+NKBR A==;
X-CSE-ConnectionGUID: EzaaeQW6RCKAVxCCh2bXxQ==
X-CSE-MsgGUID: ZtFTpqvZQGeq2bcYWsrveQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86824036"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86824036"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 05:34:23 -0700
X-CSE-ConnectionGUID: BLUt7LexQQKt5GAc/qQaug==
X-CSE-MsgGUID: jwZpHrDyQKarAFD5PdpqCQ==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.152])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 05:34:21 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	jani.nikula@intel.com
Subject: [PATCH 2/4] drm/i915/dp: Limit for_each_joiner_candidate() on joiner
 pipes available
Date: Fri,  7 Aug 2026 15:34:05 +0300
Message-ID: <efc330687f8299e5725564c3ed90d5d8e6aa0eb2.1786105831.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1786105831.git.jani.nikula@intel.com>
References: <cover.1786105831.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

Make intel_dp_can_join(), and subsequently
intel_dp_joiner_candidate_valid() and for_each_joiner_candidate() more
strict about pipes actually available for joining by using
intel_joiner_valid_primary_pipe_mask().

This rejects some invalid combos early for both mode enumeration and
compute config.

Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 437b9e7bb864..e1604bc895e5 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1274,17 +1274,7 @@ bool intel_dp_can_join(struct intel_dp *intel_dp,
 	if (num_joined_pipes > 1 && !intel_dp_has_joiner(intel_dp))
 		return false;
 
-	switch (num_joined_pipes) {
-	case 1:
-		return true;
-	case 2:
-		return HAS_BIGJOINER(display) ||
-		       HAS_UNCOMPRESSED_JOINER(display);
-	case 4:
-		return HAS_ULTRAJOINER(display);
-	default:
-		return false;
-	}
+	return intel_joiner_valid_primary_pipe_mask(display, num_joined_pipes);
 }
 
 bool intel_dp_dotclk_valid(struct intel_display *display,
-- 
2.47.3

