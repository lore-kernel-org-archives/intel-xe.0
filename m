Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6D2CD98ED
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 14:53:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC2310EC25;
	Tue, 16 Jun 2026 14:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XgrjzKJj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CC010EC3C;
 Tue, 16 Jun 2026 14:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781621608; x=1813157608;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zBNeSWWKd8q2xiUEw9PeomvK7aS+4jZtSPQTW0xN2IM=;
 b=XgrjzKJjP4N3N1SIG9srjhf8J6hhQdY5HCnqKBc0Ap53rjs7HWqsthHL
 MOOnTLq1ltUnzK6bAlLIJZrahbaTuisXBdDPzhU1bDxvhWvY7LSJPDsYL
 K8dQ+jMfK9YqRi2PxMR/zXGsmpmLuO2X7Kb/LGQ/IPPhht87LF/58+gjG
 MZqrpEtsR+50In90MmtJMB5odJKeAgIGnOXfdscKjLkjBugJbJnjIF6/L
 aQj8GHvoOKbQvdEYsILcwyD8FFS8OzVeYTXwbqBWry1JFCt3hmNeccT39
 3OOd7EOkKyX+Cx1BOLyLxNeVFFs34xpOpBKCgpNH0QFzxItaRERBZ56FU A==;
X-CSE-ConnectionGUID: oBXBv+FhSFGFOQpZUql2Pg==
X-CSE-MsgGUID: lbEBsAkUQ/+EHCV3hujIEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="69932848"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="69932848"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 07:53:28 -0700
X-CSE-ConnectionGUID: IcEhazFoTnqJFBp9nkBpJA==
X-CSE-MsgGUID: hTmD+4sBRMW9matMMz3XVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="285896356"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa001.jf.intel.com with ESMTP; 16 Jun 2026 07:53:26 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 chaitanya.kumar.borah@intel.com
Subject: [PATCH v2 09/11] drm/i915/vrr: Remove TODO as CMRR is exclusive to
 Adaptive mode
Date: Tue, 16 Jun 2026 20:12:30 +0530
Message-ID: <20260616144233.832276-10-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260616144233.832276-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260616144233.832276-1-mitulkumar.ajitkumar.golani@intel.com>
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

CMRR is subset of fix refresh rate, it is exclusive from
Adaptive mode, it does not need to set a separate mode flag during
state checker. Remove the pre-added TODO for the same.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index b2c5b148c487..92ded2e68b01 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -1202,11 +1202,6 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
 
 	intel_vrr_get_dc_balance_config(crtc_state);
 
-	/*
-	 * #TODO: For Both VRR and CMRR the flag I915_MODE_FLAG_VRR is set for mode_flags.
-	 * Since CMRR is currently disabled, set this flag for VRR for now.
-	 * Need to keep this in mind while re-enabling CMRR.
-	 */
 	if (crtc_state->vrr.enable)
 		crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
 
-- 
2.48.1

