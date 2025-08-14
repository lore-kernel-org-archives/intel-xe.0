Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3868CA0EE4
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 14:59:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C6110E8A1;
	Thu, 14 Aug 2025 14:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dL4mjQaQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9A310E8A1
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 14:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755183597; x=1786719597;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iz1W63WKVs307+Q42BprwJlAO12xGWmKFTAq94s6sBE=;
 b=dL4mjQaQtoueHTvLGz9XD38/2fCToItksiWerBeh8eEQNmrq6zmrWOHa
 L5yEl5SPK1R/mAEcJ7aVdfYVpbXNprAiVKgZI//dn4xaF5Z5eRGjbjtvf
 rUPz8dcsqIZ2gJK8Mx7m9KKg4Z43egOOvo1kkSpqcwWi1ZWGjEaGRjZmJ
 yXJ1w8chgzKmPdsJNEU2iaYxakYnRruKRppGg76wfHCoL7RgZxjdHWdCa
 s2mpgVopUwfsKK5G0uAMwQRrqIT6GBwZNzjEY2bZjwLTT5HWw+lttKCOL
 i0IfMKU0wwUmHR6WrV9n5p8co0ZVwnwgy42l+jeMTqBnSqNw+eSQmCr1K A==;
X-CSE-ConnectionGUID: 3zV4SjXDSU+OwcfjVbnUbw==
X-CSE-MsgGUID: dYegmV7LScK6KPOX/1Y4eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="56709739"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="56709739"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 07:59:57 -0700
X-CSE-ConnectionGUID: UlpvFkF4R1ePGTWovZ78mw==
X-CSE-MsgGUID: eEe2LWsfSYeJQzsOHQjADg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="166000150"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.85.180])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 07:59:55 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/xe/tests: Make cross-device dma-buf BOs CPU-visible on
 small BAR
Date: Thu, 14 Aug 2025 16:59:50 +0200
Message-Id: <20250814145950.430231-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

Small-BAR systems (e.g., SR-IOV VFs in VMs) expose only a subset of
VRAM via PCI/BAR. Exporting a BO outside that window fails, and the
selftests also do CPU fill/verify.

Set XE_BO_FLAG_NEEDS_CPU_ACCESS for cross-device variants to force
CPU-mappable placement and keep tests reliable. Large-BAR/P2P setups
are unaffected.

Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_dma_buf.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index c53f67ce4b0a..4c3b16835c93 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -206,7 +206,7 @@ static const struct dma_buf_attach_ops nop2p_attach_ops = {
 static const struct dma_buf_test_params test_params[] = {
 	{.mem_mask = XE_BO_FLAG_VRAM0,
 	 .attach_ops = &xe_dma_buf_attach_ops},
-	{.mem_mask = XE_BO_FLAG_VRAM0,
+	{.mem_mask = XE_BO_FLAG_VRAM0 | XE_BO_FLAG_NEEDS_CPU_ACCESS,
 	 .attach_ops = &xe_dma_buf_attach_ops,
 	 .force_different_devices = true},
 
@@ -238,7 +238,8 @@ static const struct dma_buf_test_params test_params[] = {
 
 	{.mem_mask = XE_BO_FLAG_SYSTEM | XE_BO_FLAG_VRAM0,
 	 .attach_ops = &xe_dma_buf_attach_ops},
-	{.mem_mask = XE_BO_FLAG_SYSTEM | XE_BO_FLAG_VRAM0,
+	{.mem_mask = XE_BO_FLAG_SYSTEM | XE_BO_FLAG_VRAM0 |
+		     XE_BO_FLAG_NEEDS_CPU_ACCESS,
 	 .attach_ops = &xe_dma_buf_attach_ops,
 	 .force_different_devices = true},
 
-- 
2.31.1

