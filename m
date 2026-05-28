Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADABCD6E45
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 21:53:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E0C10F656;
	Thu, 28 May 2026 21:53:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gqopQQ6W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A8010F657
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 21:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780005185; x=1811541185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qit7zH0VfG9u3VwFvos0U2WIMM5HHYwZSj+4/XnFQx4=;
 b=gqopQQ6WT1Zto/w995vjqGa4mSsFXeZyeKIyGQSEq9vIW3uKlhA6rmt+
 KuSWsudFYJi/vjIby7N639FvJ7B2R/BgtGv10e19Vey9PVOTWK88aMFwS
 gmaKhPIwljDOn5qgadt11gDNtPxSvpA+un4lmcX1L/Uja6TtEWCAdtrDW
 MKiaK9h8bPWI1tnopZa6jXaa1DuLVvUMBNDu0/bCRWfZbfbZq23cve/Ft
 ruqtBdGYPboae6SjNz3W3+yLeBqsD81ElGK9hNTopD+XM4eapKZ/Yz+eE
 IcJNTNjRLKL4Ng2zWDlN7cagtSV3HT6QU7GXIR14kT1v8SPl/73mFP1r1 Q==;
X-CSE-ConnectionGUID: p772F8IuQBqD3CB5He7/qQ==
X-CSE-MsgGUID: 8jr3pxmxSSWxrHqtTyFWBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80710778"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; d="scan'208";a="80710778"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 14:53:04 -0700
X-CSE-ConnectionGUID: MvgpQbOXTPq4Qs0ZQjDk6A==
X-CSE-MsgGUID: tuxlVjUiRYK0eKa2EmmOKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; d="scan'208";a="272994705"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 14:53:04 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH 07/10] Reapply "topic/for-xe-CI: drm/xe/cri: Define GuC
 firmware for CRI"
Date: Thu, 28 May 2026 14:51:34 -0700
Message-ID: <20260528215227.1282471-19-julia.filipchuk@intel.com>
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

This reverts commit 51e94c566cad63181fe22946995ca2c4abfb8c68.

Undo previous revert.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 24853bf16023..b772eafd04b5 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -115,6 +115,7 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
+	fw_def(CRESCENTISLAND,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	cri,	70, 55, 4))	\
 	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 65, 0))	\
 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 65, 0))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 65, 0))	\
-- 
2.51.0

