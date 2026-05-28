Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72283CD5BD5
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 21:53:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F61610F655;
	Thu, 28 May 2026 21:53:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B7VlihG3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D8510F657
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 21:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780005183; x=1811541183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HQg58gZHyyk1gyVzFv1UIxRd4lmOpnutb2AzTHGAJSQ=;
 b=B7VlihG3lsz5yt+4rwGmZav/dlKVn0Z+l1UGORvI5ZSeGM6KR47i0rag
 tpVPJoEvySFRjsPlG6OTfrG2F2mr2g6UcdvG3cBg0xgsp0UfEgio2vJHQ
 OQSO1pqvebfZyUF/08e14sIggSUXwlWS6/pOKuVhAhoxlTYMq257QG4Iu
 +Ed4iAtgPv7/0yxmPLplSWJvGbxKwmVeymQo2wQTGP6qmcpPoy21a4OhT
 tnqx1uKlDFhA5aNiZUYk6KuiVDCoBeS7889d4y6+khKrrORfM+f0GQPG6
 yCNO+WYJYVVPwnqrGCg0bph2AIL2H9O0BqXJf+wZpW1r3arBWXJRP6yqE g==;
X-CSE-ConnectionGUID: YTu3PQWlT8C0owkq09lMDg==
X-CSE-MsgGUID: LQuyJJF0T3+akZYs9833bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80710774"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; d="scan'208";a="80710774"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 14:53:03 -0700
X-CSE-ConnectionGUID: ncpqjVYNT7CYvPa+K37Q7Q==
X-CSE-MsgGUID: 8oKZOqDKR+eh2MGlS8GrbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; d="scan'208";a="272994699"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 14:53:03 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 06/10] Reapply "drm/xe/pvc: Add GuC firmware definition"
Date: Thu, 28 May 2026 14:51:33 -0700
Message-ID: <20260528215227.1282471-18-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260528215227.1282471-12-julia.filipchuk@intel.com>
References: <20260528215227.1282471-12-julia.filipchuk@intel.com>
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

This reverts commit 970ed6f09d5bf13235b41daaa828ec666e1681e2.

Undo previous revert.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 203546122479..24853bf16023 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -120,6 +120,7 @@ struct fw_blobs_by_type {
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 65, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 65, 0))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 53, 0))	\
+	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 44, 1))	\
 	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 53, 0))	\
 	fw_def(DG1,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg1,	70, 44, 1))	\
 	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))	\
-- 
2.51.0

