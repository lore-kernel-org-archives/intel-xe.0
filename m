Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D200EEE25C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 20:38:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D5810EC55;
	Thu, 12 Sep 2024 20:38:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E2MkKC65";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F2110EC50
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 20:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726173522; x=1757709522;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XHIG91K9KOyo1Lk7Lq9ZTlz71WW2FMeSyC+AuCYQKII=;
 b=E2MkKC65nCgOW6glnpl72MLMjwGMX1EFayP5xaM78fU+gSqW284cJovU
 fElbolpy/UcNNHjmFzOSJuFbc/R8gPNTg8agXig/Gte1BuQ2AzU+vxT8f
 jUII3jFRUfODAeNaAxcnQtmLvwNWp5j4zOGR8IB6+cqlSiCi6zbA2hJop
 wgpfXpbASNkiAY2LYVsH3SdLi3sLo/cF7tka7rlei+RW0PV2y5N6bWtL8
 fKeIpc6kyxt/lhV5735oyd3fAp8QRe9Mh3Myh8Vm2g9Z2D9bghjvEJrqs
 Yz7s99IOjPdLEm9TeKZUjmISc5O1fmr6hH0NDt1BFZGoyy+kZqEwO3EfA w==;
X-CSE-ConnectionGUID: 9MOVoNayQk688DPEAwuEcA==
X-CSE-MsgGUID: G7HKl+4aQqWGDiaOkApecg==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="35725123"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="35725123"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 13:38:41 -0700
X-CSE-ConnectionGUID: xGSzf8nHTZmAn9KEgQRvdg==
X-CSE-MsgGUID: U6qK0OqhT86R9OlPMMC7Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="68126848"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.84.117])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 13:38:40 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH 6/6] drm/xe/pf: Allow to trigger VF GuC state restore from
 debugfs
Date: Thu, 12 Sep 2024 22:38:17 +0200
Message-Id: <20240912203817.1880-7-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240912203817.1880-1-michal.wajdeczko@intel.com>
References: <20240912203817.1880-1-michal.wajdeczko@intel.com>
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

For feature enabling and testing purposes, allow to restore saved
or replaced VF GuC state from debugfs, bypassing normal migration
flow. This is available only under strict debug config.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
index e990a63ec998..ccbcf6e572d0 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
@@ -313,6 +313,9 @@ static const struct {
 	{ "stop", xe_gt_sriov_pf_control_stop_vf },
 	{ "pause", xe_gt_sriov_pf_control_pause_vf },
 	{ "resume", xe_gt_sriov_pf_control_resume_vf },
+#ifdef CONFIG_DRM_XE_DEBUG_SRIOV
+	{ "restore!", xe_gt_sriov_pf_migration_restore_guc_state },
+#endif
 };
 
 static ssize_t control_write(struct file *file, const char __user *buf, size_t count, loff_t *pos)
-- 
2.43.0

