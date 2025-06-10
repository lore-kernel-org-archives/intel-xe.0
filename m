Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43990C61DB2
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 21:55:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0922010E5BF;
	Tue, 10 Jun 2025 21:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dlAmTVuh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23E810E5BF
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 21:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749592541; x=1781128541;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yZuCAH0nRp3ypcHgbKa4IRmmM8FQQrOAO6X85T/IuMs=;
 b=dlAmTVuhV6PbCO6RsJChrVaWF/QdJalj9zLHAskay78jF/IsFsEqMR6d
 YIB9txmd9fVPX32QZ5N5HfclmHNR3rHsRziSjJa0vqQB3MIRYfIEJ7rIj
 1VIGplF/VB/XeJqr8G7V0N5ZmezBEW1WkYhrWpfz0eLUbpDitimKwVWCy
 6jTCyXaY5sfDx3gBhbc/KorJ4hlpOe1FY6LFPS+sKs1M9IP1EbrDdeeFR
 Kzie4nYYyiiF9I2X3Dbs7MEcF99BL+F7Q8df/DuVGz5/t+MXk5MqnYTuO
 DQbP+jDB8Hi972GE/HXZjhmUwyZhCp8Y+xVUEtZ4k2yLgoZp5nWgx4PkH g==;
X-CSE-ConnectionGUID: WxYc+Oy1TNSzUJR63eRdWw==
X-CSE-MsgGUID: Zydv9w0WSPimkXo5OkmEww==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51821320"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; d="scan'208";a="51821320"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 14:55:41 -0700
X-CSE-ConnectionGUID: Y9jpQwKTQ9iXpgmIgqsPmw==
X-CSE-MsgGUID: s1Z5uH/MSIKAUBPLOvzy4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; d="scan'208";a="177876582"
Received: from bfilipch-desk.jf.intel.com ([10.165.21.204])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 14:55:42 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: John Harrison <John.C.Harrison@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [topic/xe-for-CI] fixup! drm/xe/ptl: Add GuC firmware definition
Date: Tue, 10 Jun 2025 14:55:23 -0700
Message-ID: <20250610215523.645368-1-julia.filipchuk@intel.com>
X-Mailer: git-send-email 2.49.0
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

Update PTL GuC to load firmware v70.46.2 with Compatibility UAPI 1.22.2

Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 7b2d01d39b86..a22178b1f9ab 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -114,7 +114,7 @@ struct fw_blobs_by_type {
 #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
-	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	ptl,	70, 44, 1))	\
+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	ptl,	70, 46, 2))	\
 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 44, 1))	\
 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 44, 1))	\
 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 44, 1))	\
-- 
2.49.0

