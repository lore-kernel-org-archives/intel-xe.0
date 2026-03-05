Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8724F30959
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 13:10:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFCB110EB22;
	Thu,  5 Mar 2026 13:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EiqcRDiL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F9610E29F;
 Thu,  5 Mar 2026 13:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772716249; x=1804252249;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bJAS14HlwMSZ0k7p9SVndoNwBQeOxKemHNDCjyeWlHs=;
 b=EiqcRDiLktkFHyZzw5o43wl1/pYIbhgKKA5wwG9QIePucM75KQnXzWWz
 muW067lUSwuwT85qjlrpxrKHMMGAqomAynx8EmqpsEeEGWJ5eEegzV51w
 50IzbOpSQtrdxsKDwoHD1np/lnggfBAUFWjjMeUO8nFgyNPzZdUJMfHgj
 qHQC0xxEhKExAaZKJ6AI6tcFjlsf8sTSX9rYPaOdGbYKb02GGx9k+5QUm
 D9RuZ8zQ3wGw4Lv0Bok3WMC9ugdEpZIuHu9VCRGojPB6sC/z5E45rgmzJ
 BNUvnQ48mCdUrgtbauFA8tu+RabmCcFkn31BY88wa4tS+0KcxSSYYEW3x g==;
X-CSE-ConnectionGUID: M6yR7BIsTx2szwK48FGAxQ==
X-CSE-MsgGUID: 829hCXk0SjKm9U3vnGg4hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="96418661"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="96418661"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 05:10:47 -0800
X-CSE-ConnectionGUID: NVTNJGtzSSSnQ0tqOHQFXQ==
X-CSE-MsgGUID: qqgpG5udQIKmvFJMufpfTA==
X-ExtLoop1: 1
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 05 Mar 2026 05:10:44 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 christian.koenig@amd.com, andrealmeid@igalia.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 2/3] drm: Update log for 'none' recovery method
Date: Thu,  5 Mar 2026 18:36:48 +0530
Message-ID: <20260305130720.3685754-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305130720.3685754-1-raag.jadav@intel.com>
References: <20260305130720.3685754-1-raag.jadav@intel.com>
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

Update log for 'none' recovery method for wedged event where driver wants
to hint "no recovery" without resetting the device from driver context.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 2915118436ce..72e7e09225c7 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -586,7 +586,7 @@ int drm_dev_wedged_event(struct drm_device *dev, unsigned long method,
 		snprintf(event_string, sizeof(event_string), "%s", "WEDGED=unknown");
 
 	drm_info(dev, "device wedged, %s\n", method == DRM_WEDGE_RECOVERY_NONE ?
-		 "but recovered through reset" : "needs recovery");
+		 "but no recovery needed" : "needs recovery");
 
 	if (info && (info->comm[0] != '\0') && (info->pid >= 0)) {
 		snprintf(pid_string, sizeof(pid_string), "PID=%u", info->pid);
-- 
2.43.0

