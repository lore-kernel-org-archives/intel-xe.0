Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17BFC27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 11:18:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8044810E844;
	Wed, 26 Jun 2024 11:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HTj0Eh44";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18DCA10E02C
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 11:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719400720; x=1750936720;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+sKrN+uFqwyfDqVYo8N9b+hAcVHzElVQTO5xFKej10U=;
 b=HTj0Eh44Nzf9CD0yIAxl3bbPPNTZKufZYxV9RwpDLfbF0+PVnilpnVLJ
 vBl/z9yxQPwWOyL2UgbTs067VfW6qStwV09XxlUIjbCI7T7nYKF8vWgwO
 a3ee8LSnhKBvH+rgDjOap/2u2tz72myepOgRzb1OstfyuFqS8d+vJO2jR
 Y8eyloh8rhvD8MzM8Y/q0JND6rNo4mIcpEZiUKzhRsCDCFDp7GU8QMu5L
 kL6vXRWC2HeOkzML6rBVhSKdPwYZcCGpN2jw0mY862Q4feSvykey5zC7s
 /uIPRI8OczQjYRQ/74/Z0U8N3dHj3tO9Ca0IInH9Q5QR1h2CpcpNlnqo1 w==;
X-CSE-ConnectionGUID: 6B9nD+BjSY6SIgl0NQLkOw==
X-CSE-MsgGUID: UEUmmhhIQTOOaiTPC2uHMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16149286"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="16149286"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 04:18:40 -0700
X-CSE-ConnectionGUID: 7RolKJvNSnyuRoM2vvaZjw==
X-CSE-MsgGUID: lUBHr0WfTF6y8g7ovEquyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="81510191"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.34.68])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 04:18:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH 1/2] drm/xe/pf: Disable VFs on remove
Date: Wed, 26 Jun 2024 13:18:26 +0200
Message-Id: <20240626111827.1389-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240626111827.1389-1-michal.wajdeczko@intel.com>
References: <20240626111827.1389-1-michal.wajdeczko@intel.com>
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

We shouldn't leave VFs enabled when unloading the PF driver.
Otherwise we will get a message like:

 [ ] xe 0000:4d:00.0: driver left SR-IOV enabled after remove

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ebff5ea79b1d..4b91a9878f41 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -749,6 +749,11 @@ static void xe_pci_remove(struct pci_dev *pdev)
 	if (!xe) /* driver load aborted, nothing to cleanup */
 		return;
 
+#ifdef CONFIG_PCI_IOV
+	if (IS_SRIOV_PF(xe))
+		xe_pci_sriov_configure(pdev, 0);
+#endif
+
 	xe_device_remove(xe);
 	xe_pm_runtime_fini(xe);
 	pci_set_drvdata(pdev, NULL);
-- 
2.43.0

