Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7387AC3DA64
	for <intel-xe@archiver.kernel.org>; Thu,  1 Aug 2024 20:40:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407D410E8B9;
	Thu,  1 Aug 2024 20:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DXH0TEGT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B68D10E8B9
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Aug 2024 20:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722544821; x=1754080821;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fw6zgc/+nGabk2uZbMgHsqaw+8/L/rR8mqSvxR/IYyo=;
 b=DXH0TEGTZuB7CMGSlGoN7ilxhOCGeIFy1VNhgb7ravk9CMuH44UxhWAt
 Roa5K+MiGztEjwiEYoAq3jIkTcqAfnjOMQGWYOJCZG5yMqv8XuK/RD4fZ
 oLxb2+/s/VLyUQEyGUMqUPxDkp2ZOSn/FRAACijb51IsO3HRvxEWJ+Bnf
 gT0LX+OOJXfGXqUoBvqVDVa1T4vF7ju4tSa5qxdDu+/Bp1/5/HBvd9RvD
 0h0qWRtbRPSctDwCZ3R/umuJnCMHN6nNIwuSG27sbpnlN6SITLqktsDAv
 WOw3mGL7GwpWzfJZZKJaUDWfeUn2cPkCe5rpdMYqe2V5ABoCC3CFNXWi6 A==;
X-CSE-ConnectionGUID: U6bPSAEeTZCeCdnWYYcS2g==
X-CSE-MsgGUID: Cyn2v82mR5S8/4SF/4ADaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20698334"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="20698334"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 13:40:21 -0700
X-CSE-ConnectionGUID: iF0ySQ4MQb6FbHVn3td5qA==
X-CSE-MsgGUID: CnOfexiuTjqmOfH3AlBk5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="55084629"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 13:40:21 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 3/3] drm/xe/guc: Pick for-ci GuC firmware for PVC
Date: Thu,  1 Aug 2024 13:40:10 -0700
Message-ID: <20240801204010.3042850-4-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240801204010.3042850-1-julia.filipchuk@intel.com>
References: <20240801204010.3042850-1-julia.filipchuk@intel.com>
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

UAPI version 1.10.2.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 89bea1461d20..e1d91fa07f5a 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -109,6 +109,7 @@ struct fw_blobs_by_type {
 	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
 	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
+	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 24, 0))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 19, 2))	\
 	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
-- 
2.45.2

