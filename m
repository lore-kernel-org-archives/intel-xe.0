Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96388C5AC82
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 06:41:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B24A10E66E;
	Mon, 10 Aug 2026 06:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LEyzthNf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D834D10E676
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Aug 2026 06:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786344096; x=1817880096;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6EJ9EKpNxyXxFQJcvxpEJ8/ZOiJ+JHFVvL1AS0N0e+Q=;
 b=LEyzthNfjqDIgJWkDgRgnED2jQ+O+BasBRSMBBF89bo/flTEu1yXg636
 1mrgQet+dWi0RpUgyqYXFIi8TA5NXwRMwxtVDGjRmrFQPCoRX+dVKR85b
 KXlxpqfvhSy9tWncOxcre+XvKg5Lii1ncBtNka176L8cmOUoQp/+7zuUy
 Jw+/107AyWmXBTHm7FZUsrx2fUij3KdD7DMb+P3weNAqBHxrC4GmhpbJe
 UtTF0Th61dJiyWdnb9PW1IO88pZjO3+esXtqB/c3DSMEVSTO/Xu6jA1Z8
 V97JbHlFU0ayhApGOMT1snU3X4k0Eo1YAfhe9G3wcrxInmtdMkfU1QxB/ Q==;
X-CSE-ConnectionGUID: eJW5QgIjTeK4IYwMLFma2A==
X-CSE-MsgGUID: ssCZHSgkQA6AIgkqqHtCbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="112396112"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="112396112"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2026 23:41:36 -0700
X-CSE-ConnectionGUID: NI7+0Uo1QZ2AT9BB2WPHsw==
X-CSE-MsgGUID: 9iMkng2ARyabeUnmeFEkeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="258673493"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2026 23:41:32 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH] drm/xe/hwmon: Enable package and vram temperatures for CRI
Date: Mon, 10 Aug 2026 12:20:53 +0530
Message-Id: <20260810065053.620270-1-karthik.poosa@intel.com>
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

Enable package and temperatures support from hwmon on CRI.
The required MMIO offsets of these are same as on BMG.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
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

