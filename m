Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24BCC54F4C
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 15:11:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E8B10E95A;
	Tue, 28 Jul 2026 15:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CPsU+6pC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E84610E950;
 Tue, 28 Jul 2026 15:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785251489; x=1816787489;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bj/DTOt6vt0cjtwIsaoTAqIQHz2z0bn9+mnJYxz75Lo=;
 b=CPsU+6pC6M8Xm7gW4GJdiFZuooZEpfQBWxvwlexlfALE4LH+tmCk5G70
 adBr1ZZzt0zgCyTf6nkwJ5ldSg37+SbdQcBkORK3N1Hss5IvSntDGOnE1
 w8CrAUkb/wvBBTI9ocHABgT0+mKR/YDw2jHyOOcUx97xgkGEzmYg7GsZ6
 /Waz32NRPNCnCukfILk7V0kA8ojdAQ8HZvgNeX9elBXGA4rZm4Q9DebcY
 nE51w/A6wOL4q19eBkxd67Dond8cv2jk3Je9IAqq64jh4rKhQEDHdcHII
 Nsx19B+WsLI595MAOP31PuFfFJwNo06KyZDXELA0P9ZLW8PYIkJnTxK9J w==;
X-CSE-ConnectionGUID: pDI9/MBoS/KhCnvaj8xl9g==
X-CSE-MsgGUID: IcG25JwtQJGqXCwtppJCWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="88376988"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="88376988"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 08:10:15 -0700
X-CSE-ConnectionGUID: TlbTI/wUQHCwQDRO4F+/zA==
X-CSE-MsgGUID: P0cBW6NjQ1qSLyMD3JtcpA==
X-ExtLoop1: 1
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa003.fm.intel.com with ESMTP; 28 Jul 2026 08:10:13 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v7 10/10] drm/i915/vrr: Enable cmrr
Date: Tue, 28 Jul 2026 20:29:42 +0530
Message-ID: <20260728145943.3848704-11-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260728145943.3848704-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260728145943.3848704-1-mitulkumar.ajitkumar.golani@intel.com>
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

Enable CMRR during compute config and add related state
checker for the same.

--v2:
- Everything else except enable compute to handle before this patch
(Chaitanya)

--v3:
- Remove redundant return from compute config

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 8d871aa58cab..c17df4675ec1 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -277,6 +277,8 @@ intel_vrr_cmrr_compute_config(struct intel_crtc_state *crtc_state)
 	adjusted_mode->crtc_vtotal = div64_u64_rem(dividend,
 						   crtc_state->vrr.cmrr.cmrr_n,
 						   &crtc_state->vrr.cmrr.cmrr_m);
+
+	crtc_state->vrr.cmrr.enable = true;
 }
 
 static
-- 
2.48.1

