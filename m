Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D25CCF9E5
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 12:32:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD7510E468;
	Mon, 27 Oct 2025 12:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bKt4UGv8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1725910E46B
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 12:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761568324; x=1793104324;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lxhqCEM7uivECYLLIVmoD5hvhyU9SaFgCkzZjy17/mY=;
 b=bKt4UGv8oqYDrHdITtpjw4rYzcbDkzH8N7z5ADhgCUBrbCs7t+pPHP4A
 lH4slU15UfJ+YtY98mjJlG1Bv7z71UhAMTuJIhKeP0/4Lljm62xaXzKwB
 5Yg3r4ZLjGenKhjzYp8ebLxaGI+7QxaQd5dgih/lVxIECwZK5Uoj5wh4j
 8fBeD5yZ/EGiFJnVPNe5HWhUBkLY10hK2C2Yp45u1nKuuq06PN11gnsx2
 BQWtkfX04l8qHBaHx2TjKT2yVJnWHZldJ3FIhUaadv8XQfGtulrcOs9nH
 xBk1IG/gcnx8oov4NzRh1yI5onbUN9NrLgoNUSBPlzWppZCJVGzz1kyU7 Q==;
X-CSE-ConnectionGUID: qbGjAf4fSAiTA/dU1UFQiA==
X-CSE-MsgGUID: 0F/Q/nmPRma6shwXKMT8tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63678882"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="63678882"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 05:32:04 -0700
X-CSE-ConnectionGUID: rscE/1L8TvqTDaVDauMtCw==
X-CSE-MsgGUID: 45MynndnQ72dIP6QIDqlXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="184729554"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 27 Oct 2025 05:32:01 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, badal.nilawar@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v7 3/4] drm/xe/pm: Assert on runtime suspend if VFs are enabled
Date: Mon, 27 Oct 2025 18:00:56 +0530
Message-Id: <20251027123057.3738059-4-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027123057.3738059-1-raag.jadav@intel.com>
References: <20251027123057.3738059-1-raag.jadav@intel.com>
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

We hold an additional reference to the runtime PM to keep PF in D0
during VFs lifetime, as our VFs do not implement the PM capability.
This means we should never be runtime suspending as long as VFs are
enabled.

Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 6e59642e7820..ab4b8c48c86c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1152,6 +1152,14 @@ static int xe_pci_runtime_suspend(struct device *dev)
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 	int err;
 
+	/*
+	 * We hold an additional reference to the runtime PM to keep PF in D0
+	 * during VFs lifetime, as our VFs do not implement the PM capability.
+	 * This means we should never be runtime suspending as long as VFs are
+	 * enabled.
+	 */
+	xe_assert(xe, !pci_num_vf(pdev));
+
 	err = xe_pm_runtime_suspend(xe);
 	if (err)
 		return err;
-- 
2.34.1

