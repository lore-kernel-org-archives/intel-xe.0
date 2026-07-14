Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5FBC44507
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 10:50:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E7B10ECF0;
	Tue, 14 Jul 2026 10:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dcTW5hJm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B5410ECD7;
 Tue, 14 Jul 2026 10:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784026212; x=1815562212;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gq2/CKMS+xdFvuKZumJ9Kl+cbr8qnc0+OuCFmxv9iWM=;
 b=dcTW5hJmwpJKcD4popy3qT53JCFDEPkHnrdYNEGk5EKoYwx1ZS2/ehCL
 9JLbMOox2fPjkHFnm3zfSnFgIST5kAOKCUEv/kG+1Vw6QtLPf1zG5Mxdb
 KndgG5KJJH3lS8WXKLFOonE7up2JIey+HZDxiXY4a4OjKz69VDGmp6gRn
 912iR/qsfEGvj1BouGVh4CN+WdAj62Wi4YM4fMfzsKJ/XKk2jYVLylyZo
 frF4nxzF3ZOcTaKdBK2qtZ0Aw9yI1k7utEmKn3dZQKGx+wG/dBwaVcpzl
 WRNuiBcmGlIoVXFNast3BodYzdBh0aQqCclp1X+cig73hcQrhs1OAbyzq w==;
X-CSE-ConnectionGUID: 6M+Y8PVrRMi6qbi4i7RJQA==
X-CSE-MsgGUID: q9oRVH88SuKKRF+AjYf5ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="88544454"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="88544454"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 03:50:12 -0700
X-CSE-ConnectionGUID: nxpkDo0oRt6b1uDFlTc90Q==
X-CSE-MsgGUID: hFu21UNhRd+4BD67rna4Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="260134527"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa005.jf.intel.com with ESMTP; 14 Jul 2026 03:50:11 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v3 7/8] drm/i915/vrr: Return from CMRR compute config in case
 of PSR2 enabled
Date: Tue, 14 Jul 2026 16:09:36 +0530
Message-ID: <20260714103938.2371448-8-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260714103938.2371448-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260714103938.2371448-1-mitulkumar.ajitkumar.golani@intel.com>
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

CMRR is mutually exclusive to PSR2, hence return from CMRR if PSR2
is already computed.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 52fe40fdbdb3..ca3cac5aa6ab 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -202,6 +202,9 @@ intel_vrr_cmrr_compute_config(struct intel_crtc_state *crtc_state)
 	if (!HAS_CMRR(display))
 		return;
 
+	if (crtc_state->has_sel_update)
+		return;
+
 	/* No CMRR ratio configured through debugfs */
 	if (!crtc->force_cmrr.numerator)
 		return;
-- 
2.48.1

