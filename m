Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF8FCCFA18
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 04:46:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4987310E1EA;
	Thu, 13 Nov 2025 04:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lZj4jZ17";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B3F710E1EA
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 04:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763009201; x=1794545201;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y9LoTYEBosS5Zg35oTrfNA0j+jA12Fbd4OgXr/2gpzI=;
 b=lZj4jZ17c4MraPfxwdwONVEO7CkTuxjOvaI/cDyQoOnO0lhkjnnD9PD8
 rAeTOPi3xBB52d2BjNIjUa7pr+Wo6WnHlmcfxVo2Dq+6HwKaRGZO1bGVp
 NGauiXFi7zoZd+lIbwcYlY7bnke58CCZtzTtSjjlg8csbqPY74OnvhsSC
 Sqw8k/1HA2GI7el/1+g2uyhJBh0u49duBZZF0R4g6WQ/jzKXpn46ik256
 L6kgShKQywlZxW87x6L+SkE2PAZ+njB4Ga0BSxJKjqMIvXAUhAIKSOCW8
 QkOzD3qM54wHw6oe72ILevVXlhxXNWbEx/vlBtXZKJOLKZmWWTiSu+sVM w==;
X-CSE-ConnectionGUID: E9yxoutCQ5G/YzxC5zWHHw==
X-CSE-MsgGUID: uGv4On3MRguAOVCjFlvY1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="64288299"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="64288299"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 20:46:41 -0800
X-CSE-ConnectionGUID: H+HnWGLiRIiaRT8daFE+iw==
X-CSE-MsgGUID: Bgu2blPRR0eA1XHPFH/VCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="189067703"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 12 Nov 2025 20:46:37 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com,
	jani.nikula@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 badal.nilawar@intel.com, ville.syrjala@linux.intel.com,
 karthik.poosa@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3] drm/xe/pcode: Allow checking for mailbox command support
 during driver probe
Date: Thu, 13 Nov 2025 10:14:46 +0530
Message-ID: <20251113044620.537345-1-raag.jadav@intel.com>
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

If the device is running older pcode firmware, it is possible that newer
mailbox commands are not supported by it. The respective functionality
isn't useful in that case but nor is error logging, since it doesn't
particularly signify anything wrong with pcode firmware or device as a
whole. Log such failures as debug messages during driver probe which allows
the caller to check for mailbox command support without it being reported
as an error. This is useful in cases where we want to make a decision on
driver functionality based on pcode return codes and a relatively simpler
design choice compared to other solutions like checking pcode firmware
version, which comes with additional complexity of binding every single
command to a specific version and deems pcode commands useless in case the
driver fails to obtain it for reasons unrelated to pcode.

This only silences command related failures and still reports other
failures as errors, so we don't end up hiding the genuine ones.

v2: Split unsupported command cases
v3: Add device bound check

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---

I've not followed the documented device_lock() rule here because

1. It'll deadlock in ->probe() path.
2. I don't know the code well enough to tell if it's really needed for
   our case.

So feel free to weigh in.

 drivers/gpu/drm/xe/xe_device.h | 7 +++++++
 drivers/gpu/drm/xe/xe_pcode.c  | 8 ++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 32cc6323b7f6..e8f997546ae1 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -12,6 +12,13 @@
 #include "xe_gt_types.h"
 #include "xe_sriov.h"
 
+static inline bool xe_is_bound(struct xe_device *xe)
+{
+	struct device *dev = xe->drm.dev;
+
+	return device_is_bound(dev);
+}
+
 static inline struct xe_device *to_xe_device(const struct drm_device *dev)
 {
 	return container_of(dev, struct xe_device, drm);
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index 0d33c14ea0cf..0f1edf5155c4 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -57,8 +57,12 @@ static int pcode_mailbox_status(struct xe_tile *tile)
 	}
 
 	if (err) {
-		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
-			err_decode, err_str);
+		if (err_decode == -ENXIO && !xe_is_bound(tile_to_xe(tile)))
+			drm_dbg(&tile_to_xe(tile)->drm, "PCODE Mailbox unsupported: %d %s",
+				err_decode, err_str);
+		else
+			drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
+				err_decode, err_str);
 
 		return err_decode;
 	}
-- 
2.43.0

