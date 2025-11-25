Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D45CFD372
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 01:42:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7577010E33E;
	Tue, 25 Nov 2025 01:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JHlc5rOm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFDA910E33E
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 01:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764034934; x=1795570934;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tNa6K2hGafIdJ5CDO2WVMHnT3fxiollmw1nEKi7PqKw=;
 b=JHlc5rOmJ0CHmAYi+rupTytRuzqvdjZ2f9xmi+uTnSxOq8gzGaiQdSDf
 xMijoPDjYrGhNvV3V3GdBtwbidDql5XW7PIqqGMTxjssDV99mbUd6UAqm
 KUS71DPA5tzDJ32Zu04BoKDc2R7oNlnRxnbOFE9V5IxZHB4l+LjKiBO6n
 mvyJMVcH3uJRtrQP27Y3MEjUUUoe8kB1RgUOreHqN3Ambr/+MjDilyOSY
 SVCuS+vsUSLBKCxdzqDFbx30/DHS170l97D9sO8V9Lbf0Uxc6TlLDYDBE
 eCFaQHvWOQweW3exfM+IcgpnoTfKJnLB5ekRLnfpce1fnz2H8Uq0xgn70 A==;
X-CSE-ConnectionGUID: aB+gAsh7TPu2fvicR8nZDg==
X-CSE-MsgGUID: S0ZlLbbySq2srzqdQgcjbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="83437216"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="83437216"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 17:42:14 -0800
X-CSE-ConnectionGUID: hL5eaEusTx6Ey2TQnWaD9Q==
X-CSE-MsgGUID: jMksvNZxTIuz6ek65zlsAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="196960966"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 17:42:14 -0800
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 6/8] drm/xe/pvc: Add GuC firmware definition
Date: Mon, 24 Nov 2025 17:41:41 -0800
Message-ID: <20251125014134.2075988-16-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251125014134.2075988-10-julia.filipchuk@intel.com>
References: <20251125014134.2075988-10-julia.filipchuk@intel.com>
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

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Add pre-release support for PVC.

UAPI version 1.13.4.

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250403185619.1555853-7-John.C.Harrison@Intel.com
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
(cherry picked from commit c7b439f36e31f930bf6cbdf833d7700621686c5b)
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index dcb4a32e7a64..cacbf89e8f68 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -119,6 +119,7 @@ struct fw_blobs_by_type {
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 54, 0))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 53, 0))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 53, 0))	\
+	fw_def(PVC,		GT_TYPE_ANY,	mmp_ver(xe,	guc,	pvc,	70, 44, 1))	\
 	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 53, 0))	\
 	fw_def(DG1,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg1,	70, 44, 1))	\
 	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))	\
-- 
2.51.0

