Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD451C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  9 Aug 2024 17:35:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B5310E0E7;
	Fri,  9 Aug 2024 17:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TVVEfLIY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED0110E0E7
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Aug 2024 17:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723224930; x=1754760930;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WfdMDbUHb9T1YJHYKend6P0I7aE5WVjsGWSz1s3JEM0=;
 b=TVVEfLIY3bzp91dij0U5ZYWjqbxUXfrIRqnen8MyaS/kFPkXy/zwLnW0
 6ckx+zQPBw/8G0D2FWtKrhMKaKfDKd5/4qr/NUXvDIadLt1DtXEuCUdbL
 N9XF69p7memL9WjR5IWcz7S7gTaPtbHcFXVhO1GbtUnCbZ2NX1tf0tdY5
 NwvdwlVFmkT1AqXDSHZYtGtmn+3OFQjxA1rLIq3yD2QNLqwFnf4IJLAan
 V/AVZGcak9KvZv1f7D3j7Lt80mjlQwP2NJFhgDy+aWZxznM1i82XmD/y/
 gt68HzG9Bor+6Nqn0wcpXZZ+NSWP/wR5IIEiSIxKkV8H7XE9LdyJDNEfg Q==;
X-CSE-ConnectionGUID: e56Y25bRTGKsfASGxE7Nng==
X-CSE-MsgGUID: cT6y++gnTO+pfkfG4YwRsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="21539461"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="21539461"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 10:35:30 -0700
X-CSE-ConnectionGUID: D526mZntRZmejaQsPdg5SQ==
X-CSE-MsgGUID: 7eZavL81Qymrc7ZQCF6OKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; d="scan'208";a="57859695"
Received: from msatwood-mobl.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.125.108.193])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 10:35:29 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH xe-for-ci] fixup! drm/xe/guc: Pre-release GuC firmware
 v70.29.2 for PVC
Date: Fri,  9 Aug 2024 14:34:52 -0300
Message-ID: <20240809173459.78732-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.45.2
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

We are moving away from the intel-for-ci branch in drm/firmware[1] and
we sill use intel-staging for all public firmware, those under test and
those that get upstreamed to linux-firmware.

We recently pushed a commit that makes the GuC v70.29.2 also available
in intel-staging with the "intel-ci/" prefix removed. Let's now update
the kernel side by removing the prefix in the firmware definition as
well.

[1] https://gitlab.freedesktop.org/drm/firmware

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 41c4ac6ba42a..d4809ec7d634 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -109,7 +109,7 @@ struct fw_blobs_by_type {
 	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
 	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
-	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 29, 2))	\
+	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 29, 2))	\
 	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 29, 2))	\
 	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 29, 2))	\
 	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 29, 2))	\
-- 
2.45.2

