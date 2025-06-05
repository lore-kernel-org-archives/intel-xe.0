Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FCCC5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 22:54:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE6B10E38D;
	Thu,  5 Jun 2025 22:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YJynblAW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C132E10E95B
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 22:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749164043; x=1780700043;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gl6tG/qhdWwIQmdkCJO1SCDYZxJuwX9LWgl/I+ETBuI=;
 b=YJynblAWA6dxwRjPVbBhHu4XVSB/8SHKfZDSckVvw++LFnoJ0c+kuOXu
 u4ZzgbeObvkSC67GIZJOEOkjYyyj9CfoiymEaXBMM6WKtIFTfmnH2Ef+j
 DBC36xp2V+lml6uEzk8dsyDSfBePG4zRjWQUYFV08eqGsvBenXRpaROnD
 vW5wZ3wkBlfmCMl+SHqrUCB8hap/QSxJkS9lnbffCpWIiiodyV2UwhwdF
 uDReIUktyCJaM1rVGt6T2Ld6+u8g2XIp6XAFlEk9Gjv6QEN7vst9Nm8GY
 +vMvRd/dasxzD/D2bo+LmqbdZkDjRvS9LBdRhA1YUb2ZTjcLM9QjuKGgF w==;
X-CSE-ConnectionGUID: JlKzJNh3ThSfFL4txjSazA==
X-CSE-MsgGUID: odUAql1eSo+ho4Yh6/PFNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="53933017"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="53933017"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 15:54:02 -0700
X-CSE-ConnectionGUID: lZC77NRgTdOBWmcP0ulE5g==
X-CSE-MsgGUID: IT5vbE0YSiijlpYYfFJnjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="182835490"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 15:54:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH] drm/xe: GSM size should be constant on most platforms
Date: Thu,  5 Jun 2025 15:53:53 -0700
Message-ID: <20250605225352.2333981-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
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

On old Intel platforms, the size of the GSM (i.e., the stolen memory
that holds the GGTT page table entries) could vary, so the driver needed
to read the actual size from the PCI config space.  However from Xe_HP
onward, the GSM is now always guaranteed to be exactly 8MB (which
translates to a 4GB GGTT address space); this is always true regardless
of what the platform's much larger PPGTT address space is.

The bspec doesn't document the PCI config space as being a valid way to
query the size of the GSM after Xe_LP platforms, although so far it
still seems to be giving us proper values for Xe_HP, Xe2, and Xe3.
However we suspect that the config space will stop providing correct
values on some upcoming platforms, so we should stop relying on it.
Instead just use the hardcoded 8MB value as documented elsewhere in the
bspec.

Bspec: 49636, 67090, 50589
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index b9a0fd5ccaba..3c811f6e79c9 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -219,7 +219,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	unsigned int gsm_size;
 	int err;
 
-	if (IS_SRIOV_VF(xe))
+	if (IS_SRIOV_VF(xe) || GRAPHICS_VERx100(xe) >= 1250)
 		gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
 	else
 		gsm_size = probe_gsm_size(pdev);
-- 
2.49.0

