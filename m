Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F22D0EE17
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 16:39:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0860D10EB4D;
	Fri, 11 Oct 2024 16:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C4Kw9wOG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D3810EB4D
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Oct 2024 16:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728664765; x=1760200765;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z1+0sbY3+cmOCgMTYnH3iYm0fBj9KNHcxUioAMxMEFU=;
 b=C4Kw9wOGDt1qT5tL+R0CaPM6ZZVLqBIUUFMDILBPI7twch/xzo5Q0j1l
 qgFQayUNbdFeqzu6et6i/1d1AEks0w1qYjz13syl7bQbHfDPmPi8cdBHF
 hbRWtr78Hqqx/oXFVvrVRsv2CC5Mzumko0pc2TR9g/qhnQcpNTTfa4CAm
 foFRDV4Lyd7uE3sR3oAWC40smn5FSR/KslTid2QM6LPcvfq+ydJa4amEE
 n3v5M/ycS0RaECsDhE38g83AIDspJEhfSptN3D+YWTqCFzuKm+/iuJNVh
 JA5ssN6yo3AGnnCDo92dl5BVvCYi94OEg3SNrf36iuWQoogd7uMWlsVOC g==;
X-CSE-ConnectionGUID: XOf9Nva8R8OWCKE1rUrX5g==
X-CSE-MsgGUID: p3Z9sYSYQ0mClFdFNUjdpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28210330"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="28210330"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 09:39:25 -0700
X-CSE-ConnectionGUID: 6eTgHWDUT0SSjFOJ1vl0KA==
X-CSE-MsgGUID: WSeLboBZQqma8CSruvNTGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="114419071"
Received: from unknown (HELO msatwood-mobl.jf.intel.com) ([10.24.12.132])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 09:39:24 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, Clint Taylor <clinton.a.taylor@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH topic/xe-for-ci] drm/xe/ptl: Add GuC firmware definition
Date: Fri, 11 Oct 2024 09:39:20 -0700
Message-ID: <20241011163920.7926-1-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.45.0
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

From: Clint Taylor <clinton.a.taylor@intel.com>

Define the GuC firmware to load on the platform.

Signed-off-by: Clint Taylor <clinton.a.taylor@intel.com>
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 087fb96f707e..555ba12e0304 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -107,6 +107,7 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
+	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 33, 2))	\
 	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
 	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
-- 
2.45.0

