Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795DDCCA462
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 07:19:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3919911261A;
	Fri, 16 Oct 2026 07:19:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E89911261E
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 07:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792135147; x=1823671147;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=25N7t/zE5x/9FTJGnaXy+hb0cALAkTH7oEIhrf5L8wE=;
 b=j5gKiIIIMjDv9D42SJNKUBiXYPsS2UO2d0eNwtQMNkk0dC1EfOfNLHA3
 YppK4UWnEv7KY4UdL3PAlLsL/6ge8n43Tg2wTY6J7a3r9p6g3Dc0LKhCM
 snWm1PF0Yh3S2ThzvR/D4D0fEZjBUdfeHrAIKOWnUhH2kawCaYuJtgalB
 V5PLOvsO0n2Z4EaCienlQadsUlKwKEDVGOWhcrhb7/4mmNBO4OvhSEWd0
 TG4C8PGMYZG6weBxaWj+yAHiO9UDMRmxugMKO++Z5mhMUZmpE8IfqkENZ
 pdC+3kbPEAlXTS8wkaODXfDm3YiIooOuCC9zSZUBK65uwSNxawyOUht6l A==;
X-CSE-ConnectionGUID: lszoUEmaRkiP1JTv7Mx+hg==
X-CSE-MsgGUID: 71wuX9ChQY+9IEPhs9K5Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="813659"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="813659"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:56 -0700
X-CSE-ConnectionGUID: uWcI8VbET86M2MGouig0Jw==
X-CSE-MsgGUID: PyOC7cX1SWerUmi+uThu7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1787292"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 00:18:55 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI-only v3 15/18] drm/xe/ttm: Reject VRAM allocations on wedged
 devices
Date: Fri, 16 Oct 2026 12:48:25 +0530
Message-ID: <20261016071832.222574-16-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016071832.222574-1-arvind.yadav@intel.com>
References: <20261016071832.222574-1-arvind.yadav@intel.com>
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

DO NOT REVIEW


VRAM is no longer usable after the device is wedged. Reject observed
VRAM allocations with -ENODEV and stop placement fallback.

An allocation racing with the wedge may still complete. The wedged fault
path prevents new VRAM CPU mappings, and device teardown releases the
resource.

v2:
 - Return -ENODEV to stop placement fallback after a permanent wedge.
   (Rodrigo)

Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 8bf6bbc2f0ae..7d61621871a2 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -105,6 +105,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 			       const struct ttm_place *place,
 			       struct ttm_resource **res)
 {
+	struct xe_device *xe = ttm_to_xe_device(tbo->bdev);
 	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
 	struct xe_ttm_vram_mgr_resource *vres;
 	struct gpu_buddy *mm = &mgr->mm;
@@ -112,6 +113,9 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	unsigned long lpfn;
 	int err;
 
+	if (xe_device_wedged(xe))
+		return -ENODEV;
+
 	lpfn = place->lpfn;
 	if (!lpfn || lpfn > man->size >> PAGE_SHIFT)
 		lpfn = man->size >> PAGE_SHIFT;
-- 
2.43.0

