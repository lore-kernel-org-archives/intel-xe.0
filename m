Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF77AC5516B
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 11:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFDA210EEF9;
	Thu, 30 Jul 2026 11:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aVR2HP/c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CA310EEE6;
 Thu, 30 Jul 2026 11:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785409789; x=1816945789;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SQs/67OU2M6M54ydREqTiHtwdWrSxCq4XP/L4QlLNzg=;
 b=aVR2HP/cTTelyMfFC/cc4qT7CdtVQlu3zD6erYU1ncVzbQiPgcSO9eJB
 dM7/qLKG+3brOvG9kbuhQXCdiydwV1yhx4+966K52ERPX4fSYBgCKQ0qo
 kty6fDkS9WGCZTpxH7HiUeR+UoI46vy4qoyARGE5euGepfW0q2z1zIznp
 B/sC7rCzZwBK7NnWuK3bUNjnmuPMSJCVSxE4U0oBD9B8tJOcEH5a6Kxbh
 dbJkxHK1emBSG1OZsH0xPrJz5Qx8hPcjqzNhArXypuUrfaRbPHvFyRfaL
 IRkiMWVHFRRVTNnZjnN5ezQJwSb6z+BE1FE0lnTQOBqRANJLh7lk5syzH w==;
X-CSE-ConnectionGUID: OnYmoB/+SA6mD7i9oCirHw==
X-CSE-MsgGUID: QOjxY2MPSriNNjVVp3mEag==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86217242"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="86217242"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 04:09:49 -0700
X-CSE-ConnectionGUID: ZotN8HgSTgqc5q41mDbAbg==
X-CSE-MsgGUID: yZ/xWDPVSHmXpGKHKBOq8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="298482324"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa001.jf.intel.com with ESMTP; 30 Jul 2026 04:09:47 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v8 10/10] drm/i915/vrr: Enable cmrr
Date: Thu, 30 Jul 2026 16:29:17 +0530
Message-ID: <20260730105919.3913412-11-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260730105919.3913412-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260730105919.3913412-1-mitulkumar.ajitkumar.golani@intel.com>
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

Set crtc_state->vrr.cmrr.enable at the end of
intel_vrr_cmrr_compute_config() so that CMRR is actually enabled once
the M/N parameters have been computed. This is the final step that
turns on CMRR, with all the parameter computation handled in the
earlier patches.

--v2:
- Everything else except enable compute to handle before this patch
(Chaitanya)

--v3:
- Remove redundant return from compute config

--v4:
- Update CMRR commit message (Chaitanya)

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 653581ed4e90..e36db1174440 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -269,6 +269,8 @@ intel_vrr_cmrr_compute_config(struct intel_crtc_state *crtc_state)
 	adjusted_mode->crtc_vtotal = div64_u64_rem(dividend,
 						   crtc_state->vrr.cmrr.cmrr_n,
 						   &crtc_state->vrr.cmrr.cmrr_m);
+
+	crtc_state->vrr.cmrr.enable = true;
 }
 
 static
-- 
2.48.1

