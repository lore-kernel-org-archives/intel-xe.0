Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC4ED6C287
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 19:32:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA4210E363;
	Tue, 19 Nov 2024 19:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SxLoBvIY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB4E10E363
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 19:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732044720; x=1763580720;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i0DEWH/SZ2DXNvp89E1qaWnaBmMr7UCQra50jR5CCbA=;
 b=SxLoBvIYWpvY1OWSgUue3VuQiEaihU9j3oi8G9mpcPcG8PYVwzcO2Xze
 DG1asrFcNMaYlU61WZ/nHo1cg1aPzJaw45NOmdav+CKfbFzNWV0wjkB4E
 CiZc5w9oozwJgdzYk1F7eeWi5FG1YjAXtDqpQrZbY8L8nHwPVWpgagLkp
 zEgv2O8lCChWMF9lvvLJzVnWbUbaFUSp/UpgkCARDLRbytfEjg4fShZY1
 giKn90SSsXdSZ7zCT3pyPsck9+fuobrhIVb7RCybm74yVUhssI5NPhq5g
 Bn2fiPnPnoxPgIxvaat4kf9UzWm7In0ca/nabV+0dZi4PWCq0HftGyQQn g==;
X-CSE-ConnectionGUID: hLLozyVbRxi1D2BT8XC5Nw==
X-CSE-MsgGUID: mvKxwBuIRfWRFdc1TdSBCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31447524"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="31447524"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 11:32:00 -0800
X-CSE-ConnectionGUID: exvw7rV1R+a66SDrTLvojg==
X-CSE-MsgGUID: 7Gi2W4TfSDuxjojxsfTC7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="94714745"
Received: from msatwood-mobl.amr.corp.intel.com (HELO
 msatwood-mobl.hsd1.or.comcast.net) ([10.125.109.97])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 11:31:59 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH topic/xe-for-ci] drm/xe/ptl: Update PTL GuC revision
Date: Tue, 19 Nov 2024 11:31:56 -0800
Message-ID: <20241119193156.12951-1-matthew.s.atwood@intel.com>
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

Update PTL guc version to 7.36.0.

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index b0deb082ab2b..9c14b0adad0c 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -107,7 +107,7 @@ struct fw_blobs_by_type {
 };
 
 #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
-	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 33, 2))	\
+	fw_def(PANTHERLAKE,	mmp_ver(xe,	guc,	ptl,	70, 36, 0))	\
 	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 2))	\
 	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 2))	\
 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 29, 2))	\
-- 
2.45.0

