Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B7EC55172
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 05:12:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0FD10E0EF;
	Tue,  4 Aug 2026 05:12:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rzp5+pw9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EE710E0EF
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 05:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785820351; x=1817356351;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=enkYIvpGbSNpw9Dn6DCmUBfjQKCOmvidUjPx3//q2tA=;
 b=Rzp5+pw9tvJrq0NZiBE6slBwBgOKEIYO57zEnMDZWFEKpNG9O7eaI82x
 FXmJnjBvI75nUEG+VMJYPRc4LvzL29Yi7FwEyyKvyWKMV55yww4Ipfdm7
 tzHOPkvtz4xZbXaQ5WjNnFZBD2nVEmHZzfTH99hn7FnqNZ+5NVWNM6UIL
 vYLkxEL/UjgSb6vtsMCIXdF14qKB96tjkEE8ljvpkcFsOxD+/+KX56BiN
 GJ5tZmSEVAREuHk4RPxbzApPZM/oH44dfE2zLxcc0Ze3K7s5XN4cIElRK
 pMiGFGfewsoW/8lULfaRlo+FyAj18/rtzsqHJISiBnQMyx47pZHiU7ICe g==;
X-CSE-ConnectionGUID: WEbeFrjLRVqeelqxc4/40w==
X-CSE-MsgGUID: Wb2JclkvSqi1Hk2YyoXb+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86374917"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="86374917"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 22:12:30 -0700
X-CSE-ConnectionGUID: qaUJMPK+QRekyMfEQYRLJg==
X-CSE-MsgGUID: CaBEysCRSbWPnbRlTuCczQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="257519582"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa010.fm.intel.com with ESMTP; 03 Aug 2026 22:12:29 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, soham.purkait@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/ras: Fix invalid health error code
Date: Tue,  4 Aug 2026 10:42:14 +0530
Message-ID: <20260804051214.1202957-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
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

We use -EBADMSG for corrupted responses from sysctrl. Fix the error code.

Fixes: 53a7115f9862 ("drm/xe/xe_ras: Add RAS GPU health indicator")
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_ras.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index f7af4da8172c..bdad0621ae12 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -700,7 +700,7 @@ static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr
 	if (response.health >= XE_RAS_HEALTH_MAX) {
 		xe_err(xe, "sysctrl: invalid health state %u\n",
 		       response.health);
-		return -EIO;
+		return -EBADMSG;
 	}
 
 	health = gpu_health_states[response.health];
@@ -753,7 +753,7 @@ static ssize_t gpu_health_store(struct device *dev, struct device_attribute *att
 	if (response.health >= XE_RAS_HEALTH_MAX) {
 		xe_err(xe, "sysctrl: invalid health state %u\n",
 		       response.health);
-		return -EIO;
+		return -EBADMSG;
 	}
 
 	health = gpu_health_states[response.health];
-- 
2.43.0

