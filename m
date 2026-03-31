Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB7A109B48F
	for <intel-xe@archiver.kernel.org>; Tue, 31 Mar 2026 15:36:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D09A10E8FC;
	Tue, 31 Mar 2026 15:36:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kNI7jLFW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E8810E8FC
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Mar 2026 15:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774971363; x=1806507363;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qALkGTG6AlX/3INdBXYqVSvkCDPkMUFEjXQ/WFBsfIY=;
 b=kNI7jLFWXSDha5i8ko6BF4YHnxs8ND37hBonSdV95nyoUeVv4U1IQemn
 7+FCW92MLBhNa6HNv2uVOJdeuO7VPqXFjj8m7rFhzsZ9MFM0sW9/G5Gf5
 mGZHak+oIiuhBK0uCd5pFXUFXNGVhMus9HjR+zOJkIDTkqJBl3sgYbZ0r
 TGjcLN6sa3+E6i7QefX1NaBJd6KrxFpFx/eQn19RHC/JcaOQkJ1woVX1F
 80fKPJtjGHZRoTANXIjvaN34l4ehI77fMfWu0kxIW7+l4M69nTmmYJLvm
 3fdz2AiDzDzqIgqHL6TfOXwnlPaXWRxJxvSnLvzU2zVMKFjkuSHabkh6v w==;
X-CSE-ConnectionGUID: bYJ7nvhYSrSyPOzEzsDh6g==
X-CSE-MsgGUID: ovBmy22/SBKE/Fq1oZG5XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="78582354"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="78582354"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 08:36:03 -0700
X-CSE-ConnectionGUID: blHiZkYHRyeZS4gDgWV9Jw==
X-CSE-MsgGUID: tMEu8y23Rm+/IO7NMeoLYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="264337594"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 08:36:01 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe/sriov: Mark NVL as SR-IOV capable
Date: Tue, 31 Mar 2026 15:22:59 +0000
Message-Id: <20260331152259.58270-1-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Enable SR-IOV support for NVL platforms.

Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 1df3f08e2e1c..e7d7f0b6b998 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -443,6 +443,7 @@ static const struct xe_device_desc nvls_desc = {
 	.has_display = true,
 	.has_flat_ccs = 1,
 	.has_pre_prod_wa = 1,
+	.has_sriov = true,
 	.max_gt_per_tile = 2,
 	MULTI_LRC_MASK,
 	.require_force_probe = true,
@@ -481,6 +482,7 @@ static const struct xe_device_desc nvlp_desc = {
 	.has_flat_ccs = 1,
 	.has_page_reclaim_hw_assist = true,
 	.has_pre_prod_wa = true,
+	.has_sriov = true,
 	.max_gt_per_tile = 2,
 	MULTI_LRC_MASK,
 	.require_force_probe = true,
-- 
2.34.1

