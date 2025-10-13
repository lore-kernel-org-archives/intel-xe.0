Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40321CCD18A
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 08:09:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5BCD10E3F0;
	Mon, 13 Oct 2025 08:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PswjCBsV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21EC510E02F
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 08:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760342945; x=1791878945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M88AY0mjmoXLcQpn/07djbqUvpMm4SdvfjfjXgXJThY=;
 b=PswjCBsVVeFHeu0TyO/aC7vCjfEuu6h9ux50h/TDdGkvuxJHy0fP12RX
 eGe/ssPsS9YbWYBH87yU+F60V3uOobXSWKg/5NiUMP6DPvK02kW+oNRkx
 UN+X9CZOy2qU+6RjwLwctPLx44MWxhevuvaqa70HrumP/SpKbrfY6jTu7
 PvCS1SbgCTVtHyj8LbR/MmU11tsDNDJndhDSHJeHTXaB4cPqyGXDDO7ll
 TywSoG9N47N6DbAK+7wa820snyO63ei269D52xicyQ+ArI5z/nvDfMDPV
 5AOnQqUWlsC7scPwTeusFSWhtFhb5tM893DeOQMVGyoTHqZRASFxNQTWo A==;
X-CSE-ConnectionGUID: tYl+s4WGRieSzaZtTkls3w==
X-CSE-MsgGUID: BK9vGGrQTCaDZHhbXkPAjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="87935128"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="87935128"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 01:09:05 -0700
X-CSE-ConnectionGUID: nrRiOOe5SgSK2Q1H5as8cA==
X-CSE-MsgGUID: d1Bh6MY1S2eP1q6skDXRWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="181965869"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 01:09:03 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH 1/2] drm/xe/gt: Synchronize GT reset with device unbind
Date: Mon, 13 Oct 2025 13:39:02 +0530
Message-ID: <20251013080900.1507609-5-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013080900.1507609-4-balasubramani.vivekanandan@intel.com>
References: <20251013080900.1507609-4-balasubramani.vivekanandan@intel.com>
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

When unbinding wait for any GT reset in progress to complete. Unbinding
will release the mmio mapping but mmio operations are performed during
GT reset causing Kernel panic.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 6 ++++++
 drivers/gpu/drm/xe/xe_gt.c     | 5 +++++
 drivers/gpu/drm/xe/xe_gt.h     | 1 +
 3 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 386940323630..243c0438a1f7 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -975,6 +975,12 @@ int xe_device_probe(struct xe_device *xe)
 
 void xe_device_remove(struct xe_device *xe)
 {
+	struct xe_gt *gt;
+	u8 id;
+
+	for_each_gt(gt, xe, id)
+		xe_gt_device_remove(gt);
+
 	xe_display_unregister(xe);
 
 	xe_nvm_fini(xe);
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index b77572a19548..a58882065395 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -650,6 +650,11 @@ int xe_gt_init(struct xe_gt *gt)
 	return 0;
 }
 
+void xe_gt_device_remove(struct xe_gt *gt)
+{
+	disable_work_sync(&gt->reset.worker);
+}
+
 /**
  * xe_gt_mmio_init() - Initialize GT's MMIO access
  * @gt: the GT object
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 41880979f4de..03d4dc2ff37d 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -49,6 +49,7 @@ void xe_gt_record_user_engines(struct xe_gt *gt);
 void xe_gt_suspend_prepare(struct xe_gt *gt);
 int xe_gt_suspend(struct xe_gt *gt);
 void xe_gt_shutdown(struct xe_gt *gt);
+void xe_gt_device_remove(struct xe_gt *gt);
 int xe_gt_resume(struct xe_gt *gt);
 void xe_gt_reset_async(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
-- 
2.43.0

