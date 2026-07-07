Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D82C43458
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 19:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D51C10EEEE;
	Tue,  7 Jul 2026 19:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BMhy/FSR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 420B110EEE9
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 19:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783452363; x=1814988363;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gbWt02jkRShUeU6vv1uLlTAHIckZ6swbaa86BRFD1h4=;
 b=BMhy/FSRUqRQgPtI7TDMgcJY4sI3a6qdZu/iBly3feFGpzXJeXo5DN71
 WX8lkPwr3y3X3Orc8YtQcfihxFlsWUUVnfkSg0u5gCEhHyI4U/P99tXx0
 xtNY1FMJaQ82WC9YjqfXZHCIdG6gv3LhYXokRiR1FzSMJpCUMiRG2h+Eq
 o22tfi2Bpd2SUnlwnCFnrgLDxcFUnqHmMJ1SZvR2fDSmeBgrlyFp3ACOT
 uvcmm50TxHWuipVBUy0qn/0z7V0besMSw/wkkSooIoyrI+z8um9N7vnf4
 BeaV0kgOHONvfkNKk8cifzSiC2CZQcmeygRDskzM6sG4uUdtbd181DR+1 Q==;
X-CSE-ConnectionGUID: 1RkCklglQcig8NM1gmryWw==
X-CSE-MsgGUID: tMX2owwDQsOwQF8iC/ceyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="101657857"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="101657857"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 12:26:03 -0700
X-CSE-ConnectionGUID: yOIXxQIIR4C9dk98Uj9QIA==
X-CSE-MsgGUID: FqgGxzSCSTenOCVfle5QdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="257960812"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 12:26:03 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v2 3/6] Revert "topic/xe-for-CI: Define GuC firmware for NVL-S"
Date: Tue,  7 Jul 2026 12:24:39 -0700
Message-ID: <20260707192547.50535-11-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260707192547.50535-8-julia.filipchuk@intel.com>
References: <20260707192547.50535-8-julia.filipchuk@intel.com>
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

This reverts commit 2a84c68e719ef0bbce56ed75f41ce98c8a0e161d.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 3ef3b3740e29..498c89452779 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,7 +115,6 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 70, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 54, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\
-- 
2.51.0

