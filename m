Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060C8C3DA64
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 16:43:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BEE10E688;
	Wed, 31 Jul 2024 16:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d9DktHON";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88DDD10E688
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jul 2024 16:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722444213; x=1753980213;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IXAJqHDo68u2Ns+qFkN9a4+mCR4LX1emQgvhukw2M6U=;
 b=d9DktHONOA7BP0d1rQ9G0C0nkcobeWKNXGQtDpTTfpZmp6JUNP/C0796
 Or4ilABCKvS3ZIZ60nFstGKOQhUVi/1XMUPVcVIDKFvN3J4v58YLyf3vz
 smuGT90GTrejw6hPFtzR8P0D/jJIRoqnnWn7Cq0LOlMBkVTxc5iMX7wcn
 8QNdquboSTM8gAuUUWnG+4XSv5Ywyj3IUXfN5ptPC+LqXhMRbtOr8pVtk
 e3ByrbW4/jWU6v4NYb27kILPiPZWFHb9XOFg5yHwcnz/wBshJnxzl0Wt3
 v9DHdSbIRYpD+Tnfb1Cga9AGMdl+FP51HXrglKVGBuM9RiiAAA567fjeb Q==;
X-CSE-ConnectionGUID: Eh+0TPXERMyDOq283IpwSg==
X-CSE-MsgGUID: vV+BmqDdR9ugVH42pjzc7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="12808867"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="12808867"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 09:43:33 -0700
X-CSE-ConnectionGUID: P+r0rX/bRweH8IH44DPqsw==
X-CSE-MsgGUID: 6z8wD/JqQcme78253jQQBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="59584963"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 09:43:30 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, ashutosh.dixit@intel.com,
 rodrigo.vivi@intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t] drm/xe/hwmon: Fix PL1 disable flow in
 xe_hwmon_power_max_write
Date: Wed, 31 Jul 2024 22:26:36 +0530
Message-Id: <20240731165636.1401533-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

In xe_hwmon_power_max_write, for PL1 disable supported case, instead of
returning after PL1 disable, PL1 enable was path also being run.
Fixed it by returing after disable.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Fixes: fef6dd12b45a ("drm/xe/hwmon: Protect hwmon rw attributes with hwmon_lock")
---
 drivers/gpu/drm/xe/xe_hwmon.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 0c8ce09e5025..832ea81faeee 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -203,9 +203,10 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long va
 		reg_val = xe_mmio_rmw32(hwmon->gt, rapl_limit, PKG_PWR_LIM_1_EN, 0);
 		reg_val = xe_mmio_read32(hwmon->gt, rapl_limit);
 		if (reg_val & PKG_PWR_LIM_1_EN) {
+			drm_warn(&gt_to_xe(hwmon->gt)->drm, "PL1 disable is not supported!\n");
 			ret = -EOPNOTSUPP;
-			goto unlock;
 		}
+		goto unlock;
 	}
 
 	/* Computation in 64-bits to avoid overflow. Round to nearest. */
-- 
2.25.1

