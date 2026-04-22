Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A97F9EDC4
	for <intel-xe@archiver.kernel.org>; Wed, 22 Apr 2026 12:14:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4718210E2A8;
	Wed, 22 Apr 2026 12:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P67sSmgd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 648A710E29D
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Apr 2026 12:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776860063; x=1808396063;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WY6CLX+8L0aR8BmUQTAbukep8DK62wk66Bply/IY0EA=;
 b=P67sSmgd7htHo5/K+hElut0vZSX/hk3iEFHXJ1nmxYaGKiAgZnV9hbX3
 +UdAZuNTstXtpcf1fpymoggF1D1euOYXUUWqlnBveKQB/O732qYkfk54A
 m3SAcbgcc2mVSCCQYJuAkRRphD1QWMXrKN7j/l9d4IzCcHkMnFTw2DBa9
 CO2aQKF+by7GwmjzwYk97A7rL8HEyjWNqJVKzrxV6a5+FTjr6/ZDmfryO
 6ghL4fBoQAqc4tqJyYG9rucDGI5ODxVOgXklEB9/WUIp0mZmOutWgCXzf
 UXaf5NJZACxollDXKzlu746HTcDWNpRv9uQXTjWdYLo1vuTaGB0ldKxHx w==;
X-CSE-ConnectionGUID: OuSrWEEKQI6X0jHinxrPDw==
X-CSE-MsgGUID: leo6L1S7Qiqbol0dAgQ9FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="89197451"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="89197451"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 05:14:23 -0700
X-CSE-ConnectionGUID: nQFSE9gvSc+C7Td+ZGCOXg==
X-CSE-MsgGUID: 8sfmheb7SgeivHuEoOfmeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; d="scan'208";a="231305919"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa006.jf.intel.com with ESMTP; 22 Apr 2026 05:14:21 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, vinay.belgaumkar@intel.com,
 badal.nilawar@intel.com, sk.anirban@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 2/2] drm/xe/gt: Drop redundant forcewake
Date: Wed, 22 Apr 2026 17:40:57 +0530
Message-ID: <20260422121128.1002031-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260422121128.1002031-1-raag.jadav@intel.com>
References: <20260422121128.1002031-1-raag.jadav@intel.com>
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

xe_gt_suspend_prepare() doesn't require forcewake in it's code path.
Drop it.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 6d6f5a10fe85..168c700af701 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -1041,7 +1041,6 @@ void xe_gt_reset_async(struct xe_gt *gt)
 
 void xe_gt_suspend_prepare(struct xe_gt *gt)
 {
-	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	xe_uc_suspend_prepare(&gt->uc);
 }
 
-- 
2.43.0

