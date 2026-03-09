Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACA8FCA193
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 21:40:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A8510E5D0;
	Mon,  9 Mar 2026 21:40:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KfMY1A5O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A5610E5D1
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 21:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773092416; x=1804628416;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=RUUaSHv0+kC51wjyfOYgBcX6PVqYbB9u0Zkw7dh9F84=;
 b=KfMY1A5OhM7NUITEpmRLuW+jbsSJdjsdgMCsuXgnmQvjKzcdfQ7I/tOv
 fmdSfMyAfNC/Bd+qIkYqiHe0QiWggcoazqZkaXzMQXyBJzdNerONjnNZW
 wd8lElGIhvetWb7ulVsyI+BZin4WULSZTRdQHtttkNXkfnFBMJKMVckz3
 Fz8bxAo1U5bkdEFdSnU0VLpAEawv7lMWkYmZ2o7MJRO8/TNso3gsxWGgn
 3praEVhXF+812tZKkZ4HMbC+Z8YmWeu1RpF4nrOUvcLUOLKqONgyC9TQv
 PedCxz6wdG9EV2Xq6ej2fzVsemGtgG3DJTCptzQurow1ySzll5trNv7kJ w==;
X-CSE-ConnectionGUID: Jr0tNJwcS4G7gZ2aE+VU1w==
X-CSE-MsgGUID: UpwH52XlRPeFfwT7ut4TrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="91702270"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="91702270"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 14:40:16 -0700
X-CSE-ConnectionGUID: 0C6lCuW0QhKDaNfJKrCyrg==
X-CSE-MsgGUID: QFWVe/MhQZmdG05dT3OP2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="216346732"
Received: from jjgreens-desk21.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.146])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 14:40:14 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 09 Mar 2026 18:39:48 -0300
Subject: [PATCH v4 5/8] drm/xe: Call xe_wa_process_device_oob() after
 xe_sriov_probe_early()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-extra-nvl-p-enabling-patches-v4-5-2e7fcead971a@intel.com>
References: <20260309-extra-nvl-p-enabling-patches-v4-0-2e7fcead971a@intel.com>
In-Reply-To: <20260309-extra-nvl-p-enabling-patches-v4-0-2e7fcead971a@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.15-dev
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

We will need to use FUNC(xe_rtp_match_not_sriov_vf) in an upcoming
device OOB workaround and we need the SRIOV mode already defined by the
time that workaround check is done.  Move the call to
xe_wa_process_device_oob() to happen after  xe_sriov_probe_early() to
allow usage of FUNC(xe_rtp_match_not_sriov_vf).

v2:
  - Move the call a bit further down, after vf_update_device_info(), to
    keep SRIOV-related function calls grouped. (Michal)

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com> # v1
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 3462645ca13c..f39e73d6ba87 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -699,9 +699,6 @@ int xe_device_probe_early(struct xe_device *xe)
 {
 	int err;
 
-	xe_wa_device_init(xe);
-	xe_wa_process_device_oob(xe);
-
 	err = xe_mmio_probe_early(xe);
 	if (err)
 		return err;
@@ -711,6 +708,9 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (IS_SRIOV_VF(xe))
 		vf_update_device_info(xe);
 
+	xe_wa_device_init(xe);
+	xe_wa_process_device_oob(xe);
+
 	/*
 	 * Check for pcode uncore_init status to confirm if the SoC
 	 * initialization is complete. Until done, any MMIO or lmem access from

-- 
2.52.0

