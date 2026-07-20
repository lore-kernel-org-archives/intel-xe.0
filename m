Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3212BC4451B
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 08:05:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC56D10E7DA;
	Mon, 20 Jul 2026 08:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cI8DdC+Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD2810E7DA
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jul 2026 08:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784534727; x=1816070727;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n2xVY1GiaYhAhWymUupwGNLqVS1shO5u2cTlckjtEv0=;
 b=cI8DdC+Zg9g0u2GtMSRsrBqCirfJLFkFaazkZDTihUturqdbrmitD0ai
 k/UI9tewYx3U2HXg2ygmDRyGUNw0DIsqN6fGpaGpcPjKadlU8jNNB6Vlf
 xRFrfMFyinusxlgbLUBofUn556GaT7s8V0hHKgDizCxjqb/ylsnIZZUUx
 9sCmRF/5PMkOrrP7AwSSWLf0cfJKQNrQjE0Ue6hx19vOC1lCZFJ+mbWtH
 JLlfLlXwx7WcSiGTKuHqd03QkPPaQIypfQKghbrnURhSgxaOm+exY71c/
 j01N+sYO2zGOZ9wmW7qsLPvTAI6zRuiWA+tdvCeZYKMm0Y1G5TfkWmyAi Q==;
X-CSE-ConnectionGUID: 2wxJYUeZT6q2dU06tB3Adw==
X-CSE-MsgGUID: 6N8AK5zzQUG7GHvEmTDjRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="85227640"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="85227640"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 01:05:27 -0700
X-CSE-ConnectionGUID: Ch3ZrxzVSHKcU4zR7hirfg==
X-CSE-MsgGUID: wBszZSYLRl+4yQCJDefe9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="262354282"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 01:05:25 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com,
	lukasz.laguna@intel.com
Subject: [PATCH] drm/xe/pf: Hold pci_rescan_remove_lock while disabling VFs
Date: Mon, 20 Jul 2026 10:05:10 +0200
Message-ID: <20260720080510.2743242-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
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

When unbinding PF with VFs enabled, xe_pci_remove() calls
xe_pci_sriov_configure(), which reaches pci_disable_sriov() and VF
teardown. It requires pci_rescan_remove_lock to be held and triggers
warning otherwise.

Take pci_rescan_remove_lock around xe_pci_sriov_configure() in
xe_pci_remove() to follow PCI core locking requirement and avoid the
warning.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 123ffd4c1ee9..f9adf62dce03 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1112,8 +1112,11 @@ static void xe_pci_remove(struct pci_dev *pdev)
 {
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 
-	if (IS_SRIOV_PF(xe))
+	if (IS_SRIOV_PF(xe)) {
+		pci_lock_rescan_remove();
 		xe_pci_sriov_configure(pdev, 0);
+		pci_unlock_rescan_remove();
+	}
 
 	if (xe_survivability_mode_is_boot_enabled(xe))
 		return;
-- 
2.43.0

