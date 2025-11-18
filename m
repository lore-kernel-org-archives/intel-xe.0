Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537FACEBF92
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 09:02:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 178EC10E470;
	Tue, 18 Nov 2025 09:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RRkRDksL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01DD10E47A
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 09:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763456536; x=1794992536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gIo8gZ5CJlIzJ6e8Mnq4xsWc+ZkfeyD9/o7TScvYNdU=;
 b=RRkRDksLIO7lidoGfq0T8t0hXXybSks4YfD3grCD8T8DOY1YwCsVT8aY
 FxfUeETtsZiqmt9alLir7X6hiZS25kTkIuNfriA5FDuftDP0M20ivwcvp
 QVq6wrefr9kOGF02YDSw6B4tcinxpWn4tZQwTH7DRgxpUTozBcunHc1o3
 H7Dh0d0aH8qPI3qC0Nz2L+ZGc7CuQgG99gRZX06mbKyeR9q+PVfZfjUcj
 y1A/enXg7ZCZ5S5HNXhHONiIoYqDXHQBee+HE95sAcsQRTCItc78wbnEr
 WBbhIF9Ju7o+pZ+l5TLH5zQ7SS/I/dpOvb2otftpLHq8E2OEnbyAIwsXs g==;
X-CSE-ConnectionGUID: j9OcCNBVRq+kmtctm/LpLQ==
X-CSE-MsgGUID: FVipjFWcRRuULHmsMY3uvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="53042293"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="53042293"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 01:02:16 -0800
X-CSE-ConnectionGUID: jD2UUNhSSgyutJI5qwMv+A==
X-CSE-MsgGUID: EZPofDolSDmrcEB53q+W7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="228042558"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa001.jf.intel.com with ESMTP; 18 Nov 2025 01:02:12 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com,
	jani.nikula@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 badal.nilawar@intel.com, ville.syrjala@linux.intel.com,
 karthik.poosa@intel.com, anshuman.gupta@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 4/4] drm/xe/late_bind: Use xe_pcode_read_probe() to check
 for mailbox command support
Date: Tue, 18 Nov 2025 14:29:20 +0530
Message-ID: <20251118090012.608250-5-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118090012.608250-1-raag.jadav@intel.com>
References: <20251118090012.608250-1-raag.jadav@intel.com>
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

Use xe_pcode_read_probe() to check for mailbox command support on the
device while initializing late binding firmware.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_late_bind_fw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
index 768442ca7da6..3dc88655d29e 100644
--- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
+++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
@@ -189,8 +189,9 @@ static int xe_late_bind_fw_num_fans(struct xe_late_bind *late_bind, u32 *num_fan
 	struct xe_device *xe = late_bind_to_xe(late_bind);
 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
 
-	return xe_pcode_read(root_tile,
-			     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), num_fans, NULL);
+	return xe_pcode_read_probe(root_tile,
+				   PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0),
+				   num_fans, NULL);
 }
 
 void xe_late_bind_wait_for_worker_completion(struct xe_late_bind *late_bind)
-- 
2.43.0

