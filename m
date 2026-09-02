Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D96C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 17:56:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6639010F301;
	Wed,  2 Sep 2026 17:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m4cz7mpa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2EE110F301
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 17:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788371812; x=1819907812;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z7wdxpVO+RltQivC7U8c9NZ3cgKPhejZtYtetPBCT/I=;
 b=m4cz7mpaRXdTK62HeKDGA3MgC2VBNTR2dWcGkVNPaWleEzeqDMFHcjlG
 axy7AqnDWxtkaoYYCKYdsOf/aeh6Q//9fgb0EtPHgQrARhaL5fP5Xqa8g
 eSrShb6gkNv/EV8niHXY30TC3vWdPuRTxSLN+u2lZxPR64uNLQHrK3Vdj
 pt32/hxVNYKAQOhGJJ6eyvY05PLabP6dbaKsxghOXU+/UPg1glHvmbjKb
 ZBb5cFUJQMs96Jbk5QUArvyDtfCQdlAx+aC9jF4WfTlFtWmOSKYrUb6Ax
 thk/y70HSjRT1q/KXaLdR2yyOq2hldtlCWuHc/niIL5gtF9mGrEFG3JQb A==;
X-CSE-ConnectionGUID: UQG+pIfrTPyb7GPGZ+IZuQ==
X-CSE-MsgGUID: B6rcTIKWQz2yoiRzm9+qFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="76393489"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="76393489"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 10:56:52 -0700
X-CSE-ConnectionGUID: qfGWazvJRLykr1NDFecESA==
X-CSE-MsgGUID: +376gRdzSjaEHqgnvQCqbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="273638035"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 10:56:50 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 3/5] drm/xe/hwmon: Correct group selection for memory
 controller temperature
Date: Wed,  2 Sep 2026 23:25:05 +0530
Message-Id: <20260902175507.3910573-4-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260902175507.3910573-1-karthik.poosa@intel.com>
References: <20260902175507.3910573-1-karthik.poosa@intel.com>
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

Read all the necessary groups when reading memory controller
temperature in get_mc_temp().

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Fixes: 3a0cb885e111 ("drm/xe/hwmon: Expose memory controller temperature")
---

v2:
 - Address review comment from sashiko.
 - Change the hwmon->temp.value[] size from U8_MAX to U8_MAX+1.

 drivers/gpu/drm/xe/xe_hwmon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index a7c04c25e1c2..2a5d91fa3afa 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -149,7 +149,7 @@ struct xe_hwmon_thermal_info {
 	/** @vram_count: number of VRAM temperature sensors available for the platform */
 	u8 vram_count;
 	/** @value: signed value from each sensor */
-	s8 value[U8_MAX];
+	s8 value[U8_MAX + 1];
 	/** @vram_label: vram label names, dynamically allocated based on vram_count */
 	char (*vram_label)[MAX_LABEL_SIZE];
 };
@@ -907,7 +907,7 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
 	int ret, i, count = 0;
 	s32 average = 0;
 
-	for (i = 0; i < DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32)); i++) {
+	for (i = 0; i < DIV_ROUND_UP(hwmon->temp.count, sizeof(u32)); i++) {
 		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
 				    (dword + i), NULL);
 		if (ret)
-- 
2.25.1

