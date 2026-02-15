Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45650E63F14
	for <intel-xe@archiver.kernel.org>; Sun, 15 Feb 2026 20:33:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECDF710E23D;
	Sun, 15 Feb 2026 20:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AVNOeYbH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5625710E231
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Feb 2026 20:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771187628; x=1802723628;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WZvaI5sc9l3HskgQ4RzVv42VzV6qhITYc58Yyjs6ToA=;
 b=AVNOeYbHp9fzBmdFxzmnf5yiRTc0DtYqBh9EXH/rNvUcZYQ9312Ch/98
 n952Lm8S37DTM6UF0hZTuYyaRS3ro15eC3c+6eeumXLnto8MJHsoYP8su
 tkWnfkb3Is5uIyoKpHwfgF/Y57AVIl7CwhavvAlL1NXmrT+iPOTINWPLR
 dUWC0aZwEewlWQGY6m0cBcCx2lIEMLndRi5++OiAAY/IP9oeHaSiUJmYc
 tYYlqmWU0EuiJOYfbJm430/Ek8uM+A0yWQUYJjgyYymTOD+6qnDlGP58k
 F42GQzBuvgNLdSd5hZn2wB4lEb52P/Wucms184Mu1ADRjoTJjvb+zJviM Q==;
X-CSE-ConnectionGUID: hwNWWMPYTOeM+xY7ydP10w==
X-CSE-MsgGUID: g3UdtZDaTGylR8LNHbtoFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="71996393"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="71996393"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2026 12:33:48 -0800
X-CSE-ConnectionGUID: DwoNtE/lS8y3VE7LYxQMng==
X-CSE-MsgGUID: fb+4rQufSiGxgu6T4KLjlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="251096612"
Received: from shealy-mobl3.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.64.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2026 12:33:48 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 7/9] drm/xe/pf: Prefer guard(mutex) when doing fair LMEM
 provisioning
Date: Sun, 15 Feb 2026 21:33:21 +0100
Message-ID: <20260215203323.595-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260215203323.595-1-michal.wajdeczko@intel.com>
References: <20260215203323.595-1-michal.wajdeczko@intel.com>
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

We will add more code there and with guard() it will easier to
avoid mistakes in unlocking.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 43041af81518..1a9f3b85526c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1962,10 +1962,9 @@ int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid,
 	if (!xe_device_has_lmtt(gt_to_xe(gt)))
 		return 0;
 
-	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
+	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
+
 	fair = pf_estimate_fair_lmem(gt, num_vfs);
-	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
-
 	if (!fair)
 		return -ENOSPC;
 
@@ -1975,7 +1974,7 @@ int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid,
 		xe_gt_sriov_info(gt, "Using non-profile provisioning (%s %llu vs %llu)\n",
 				 "VRAM", fair, profile);
 
-	return xe_gt_sriov_pf_config_bulk_set_lmem(gt, vfid, num_vfs, fair);
+	return xe_gt_sriov_pf_config_bulk_set_lmem_locked(gt, vfid, num_vfs, fair);
 }
 
 /**
-- 
2.47.1

