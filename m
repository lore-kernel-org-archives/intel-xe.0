Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657ABD2F33D
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 16:32:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222A610E515;
	Tue, 13 Jan 2026 16:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hTVJCXIq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63E410E515
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 16:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768321970; x=1799857970;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tdyFxb8ShtT8cW27+J4Wc2g1kLnSW6VDCnFWjBdsxlw=;
 b=hTVJCXIqg3Jq77s5416tfXUC46bwQi3RtoHRn5CkqsYYk9sOqP9ACr98
 tvfAdTI0clnayu3QvMrwrKiuAZVa7X9nNKznRg4eLKqHp7shW9pyyb2Nk
 cieUZR4npdb7TktptE/jt9LkLX9c/Rs/Npn+HqvVWsAuOkwifOtvZ7zVk
 mcFHQK/vvMNLNvzcBadlX1wIAsSst1QB4x4i0WAL0ufgWjPfpjPEjbYli
 r/oSJEdNz+Vv3qctj4NuLLjkHg6d23w4Ffi32XfeGkZ+kPTKqQwlS+vZe
 eKXDPvPum9hAIeTh9szKQ5+1tMCZZHFpgj0bE8kJQ3YXIU3CIKvg5CXnj Q==;
X-CSE-ConnectionGUID: yfQBvcO1RYetXyc65vS4ZQ==
X-CSE-MsgGUID: yoLz6TE6S/yFwbJ3L+BbLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69521102"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69521102"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 08:32:50 -0800
X-CSE-ConnectionGUID: +HigFG2vRNS2Y02pQyDCaA==
X-CSE-MsgGUID: yigGqjmvSB+uDEiv6q2DDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204060372"
Received: from bnilawar-desk2.iind.intel.com ([10.190.239.41])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 08:32:46 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org
Cc: anshuman.gupta@intel.com, rafael@kernel.org, lenb@kernel.org,
 bhelgaas@google.com, ilpo.jarvinen@linux.intel.com, rodrigo.vivi@intel.com,
 varun.gupta@intel.com, ville.syrjala@linux.intel.com,
 uma.shankar@intel.com, karthik.poosa@intel.com, matthew.auld@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com
Subject: [PATCH v6 12/12] drm/xe/vrsr: Introduce a debugfs node named
 vrsr_capable
Date: Tue, 13 Jan 2026 22:12:13 +0530
Message-ID: <20260113164200.1151788-26-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113164200.1151788-14-badal.nilawar@intel.com>
References: <20260113164200.1151788-14-badal.nilawar@intel.com>
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

Add a debugfs node named vrsr_capable to check if the device
supports VRSR.

V2: Use debugfs_create_bool for vrsr_capable node (Karthik)

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 844cfafe1ec7..60b78d3f91da 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -550,6 +550,8 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("disable_late_binding", 0600, root, xe,
 			    &disable_late_binding_fops);
 
+	debugfs_create_bool("vrsr_capable", 0400, root,
+			    &xe->d3cold.vrsr_capable);
 	/*
 	 * Don't expose page reclaim configuration file if not supported by the
 	 * hardware initially.
-- 
2.52.0

