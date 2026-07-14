Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6F3C44509
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 10:50:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4FFD10ECE1;
	Tue, 14 Jul 2026 10:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="askr1aU/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BAD710E060;
 Tue, 14 Jul 2026 10:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784026214; x=1815562214;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uwffkij6CNpLnIGm9VgcDZKdtaAxVqVyYDQl6auC5vQ=;
 b=askr1aU/tW/lNdkyH1ZhxvHAkcMWPYT78BzucVdX/zrU/ruEPnSN644U
 3MGgBy+VV7FkPxVbXBCIprb4rjEH5M9zRgO7jssE6sEMVIGM10FQd7mAQ
 ko+o89InMAARg2eWw0oQS/aHvN3yIFRHpGcm5NebEdAgw5Xc/hScS8TCw
 xzXSC5l3SMxxiznF542bLlpVMxtd4Wdulz0qEjT/mVg/RrMAzj2xlfsPH
 hvdz5EaN9W1wSMpyTXIRJndJdRMCjejIAIZzVK+A0K1zfqbgAJg8LmGQJ
 Cr2kfMbWTQh4eXOuQZNJWFcrTnpjh3qeWoFRjbFuXP5DeaHAmhG8fNYY4 w==;
X-CSE-ConnectionGUID: LV7b9BBdS6OJYy7aftvExQ==
X-CSE-MsgGUID: e+13u9wfTParRYGt+bI4WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="88544456"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="88544456"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 03:50:14 -0700
X-CSE-ConnectionGUID: xe3keGWiTjSjbMLWvquw7w==
X-CSE-MsgGUID: 7ZQrkQgcS3a+ogK9tTKl+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="260134532"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa005.jf.intel.com with ESMTP; 14 Jul 2026 03:50:12 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v3 8/8] drm/i915/vrr: Enable cmrr
Date: Tue, 14 Jul 2026 16:09:37 +0530
Message-ID: <20260714103938.2371448-9-mitulkumar.ajitkumar.golani@intel.com>
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

Enable CMRR during compute config and add related state
checker for the same.

--v2:
- Everything else except enable compute to handle before this patch
(Chaitanya)

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index ca3cac5aa6ab..ce4148fa1687 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -256,6 +256,8 @@ intel_vrr_cmrr_compute_config(struct intel_crtc_state *crtc_state)
 						   crtc_state->vrr.cmrr.cmrr_n,
 						   &crtc_state->vrr.cmrr.cmrr_m);
 
+	crtc_state->vrr.cmrr.enable = true;
+
 	return;
 }
 
-- 
2.48.1

