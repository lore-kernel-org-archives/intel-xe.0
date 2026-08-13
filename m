Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F429C5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 19:36:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C108910E03F;
	Thu, 13 Aug 2026 19:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ebUSUMev";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A65710E03F
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 19:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786649796; x=1818185796;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/f6S7r/8pSI16wRPBnNahAK+gcVAq6m9h1LeMeKq8t0=;
 b=ebUSUMevdRGHpFpOLCAy47fK2ArTPxK14y+IWysGY4DDrTCww2BZJzSr
 fYsKYle80PcUmtP/+FzD82mJ1atZUCW1K7dBTxOuocNpnkb4Umvn4H6ZT
 GuuJ4t5VEC7NhhE5f3XxgWhsa2+k6et1vTQdvZgTAMbMvnZY5tGayC/i/
 Bpcp7ypf24mCq7Y3fpBfzD8teID5MbM6tW+X11H+Tne1WZPYTgT3gLSau
 wAM5p9GQKQx2MGO36d5x3Vv2AGkVBUsk6WLP/+ZrYJI0lK7nhroeZX6tg
 392z9SymlxGd4S0E6bu8TmdnoUOEMFJDxHHjOLCBu3I48Mokp2+uPsFwp g==;
X-CSE-ConnectionGUID: Ne7EHb77TfGGvVjPWeViWQ==
X-CSE-MsgGUID: d6qkOqchTseQFJW658asyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87094754"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="87094754"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 12:36:36 -0700
X-CSE-ConnectionGUID: OaSgTMHjQSSbL/hxiMZwQg==
X-CSE-MsgGUID: CycQZ8OlR8iQikcXPGB3aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="302274027"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 12:36:34 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2] drm/xe/hwmon: Enable package and vram temperatures for CRI
Date: Fri, 14 Aug 2026 01:05:46 +0530
Message-Id: <20260813193546.511093-1-karthik.poosa@intel.com>
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

Enable package and vram temperatures support from hwmon on CRI.
The required MMIO offsets of these are same as on BMG.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---

v2: Add missing vram in commit message.

 drivers/gpu/drm/xe/xe_hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 49f7e0edcc4b..5284cab6703d 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -266,7 +266,7 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 
 	switch (hwmon_reg) {
 	case REG_TEMP:
-		if (xe->info.platform == XE_BATTLEMAGE) {
+		if (xe->info.platform == XE_BATTLEMAGE || xe->info.platform == XE_CRESCENTISLAND) {
 			if (channel == CHANNEL_PKG)
 				return BMG_PACKAGE_TEMPERATURE;
 			else if (channel == CHANNEL_VRAM)
-- 
2.25.1

