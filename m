Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267C5D6A221
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 18:00:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E404F10E36C;
	Thu, 14 Nov 2024 18:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="attrcqm9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA3B10E36C
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 18:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731607215; x=1763143215;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ezv/wETsF+6T79RiFOZ+t4BXxqbnzEKSYlhJU0nsTA0=;
 b=attrcqm9gAN6hJ6Ad1/r3eIwuHYBgsitSrNOM8c8fP3Rrf6rg853Me8r
 X9cfImy8jGiVoXChTQdzPbA4NdxSU0XXEgqJiJ2zPtlYXyCdpZjRixSjW
 6uGAYCK9H7XCEmQ+ZN9KMrcg7i+zkL7q+TxlKCy5UFpTEY1ME9AG7YBhX
 vo/3ZY9Kgc9z5dNOLFDFI7K3vQho84cvjTl72DpTpAZ6uxgZgGVU3mBql
 ksUhA8BlLTHDbctW9AvgC+rTIQ7iGkrhRbFrgv/waViBdUekfNa5gxzpB
 Jef3CxjipbOzRAs0ZduaK0VhMAB6nZAIhNGdQCXl4PHHyj/GTsruYphMo w==;
X-CSE-ConnectionGUID: CzU+xde5QvCTRLYekmjukQ==
X-CSE-MsgGUID: 5zmY4dVOT6WkzRJCv4g/ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="35290769"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="35290769"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 10:00:15 -0800
X-CSE-ConnectionGUID: KRQmBjcHT+q+m2xGDKvIug==
X-CSE-MsgGUID: w5XTwC8wQUy4I2zl47Uk3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="119224727"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.98.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 10:00:14 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH 2/2] drm/xe/vf: Perform early GT MMIO initialization to read
 GMDID
Date: Thu, 14 Nov 2024 18:59:55 +0100
Message-Id: <20241114175955.2299-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241114175955.2299-1-michal.wajdeczko@intel.com>
References: <20241114175955.2299-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

VFs need to communicate with the GuC to obtain the GMDID value
and existing GuC functions used for that assume that the GT has
it's MMIO members already setup. However, due to recent refactoring
the gt->mmio is initialized later, and any attempt by the VF to use
xe_mmio_read|write() from GuC functions will lead to NPD crash due
to unset MMIO register address:

[] xe 0000:00:02.1: [drm] Running in SR-IOV VF mode
[] xe 0000:00:02.1: [drm] GT0: sending H2G MMIO 0x5507
[] BUG: unable to handle page fault for address: 0000000000190240

Since we are already tweaking the id and type of the primary GT to
mimic it's a Media GT before initializing the GuC communication,
we can also call xe_gt_mmio_init() to perform early setup of the
gt->mmio which will make those GuC functions work again.

Fixes: 58548b91101f ("drm/xe: Defer gt->mmio initialization until after multi-tile setup")
Fixes: 0afda5d7bba4 ("drm/xe/pci: Convert register access to use xe_mmio")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 9b81e7d00a86..8388a92c8fc2 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -507,6 +507,7 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
 			gt->info.type = XE_GT_TYPE_MAIN;
 		}
 
+		xe_gt_mmio_init(gt);
 		xe_guc_comm_init_early(&gt->uc.guc);
 
 		/* Don't bother with GMDID if failed to negotiate the GuC ABI */
-- 
2.43.0

