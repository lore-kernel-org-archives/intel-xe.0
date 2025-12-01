Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100F1D116F1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 10:32:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C740A10E37B;
	Mon,  1 Dec 2025 10:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QbWaQ8TJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5A610E38C
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 10:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764585124; x=1796121124;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PffhjmRq/WlG63+9MikAZdLY7yaDIpKfSuLRpV6VfHQ=;
 b=QbWaQ8TJXhMGeDC+PpoU+XNMbsQ3WGywQdBFVQkr3XfHFv/NHTd2Dwq/
 +tTejFl7UBL4/cecA5SPWxyUjsuFV0wrDnhBp/mawPZcW6ufuB+i3W+XH
 GC8k3ceVAVUeGsSBRPMAWHaVYUaTiAb5MPBhJINfx4qutXTxBczQC1uC0
 oEY3K8WyKDCwSETgm0ijTrj7botG0xGargn/pdwtLTCRTky5h7609DbOt
 611QSAkLnah4iZ/jyQhcUKGdbODuGkfvxmeFOqzfSqN8HqQA+yEYbD09h
 zwMiPQgKqfrNK049WYNpKW01Qzu9Bw6FFnAiWySuOHCOx8ZsPq75kP/LG Q==;
X-CSE-ConnectionGUID: jgNlX2kiSjinTEpUzdNLZw==
X-CSE-MsgGUID: aj3synGmSTSnZFmdGTcwlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="70131294"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="70131294"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 02:32:04 -0800
X-CSE-ConnectionGUID: CVLqoI99TEag7qndoMV3bA==
X-CSE-MsgGUID: DBxW+VEETo6/NREJA0/cSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="194134174"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa008.jf.intel.com with ESMTP; 01 Dec 2025 02:32:01 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: rodrigo.vivi@intel.com,
	jani.nikula@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 badal.nilawar@intel.com, ville.syrjala@linux.intel.com,
 karthik.poosa@intel.com, anshuman.gupta@intel.com,
 matthew.d.roper@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 2/4] drm/xe/sysfs: Use PCODE_FALLBACK_MAGIC
Date: Mon,  1 Dec 2025 15:57:56 +0530
Message-ID: <20251201102902.362650-3-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201102902.362650-1-raag.jadav@intel.com>
References: <20251201102902.362650-1-raag.jadav@intel.com>
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

Use PCODE_FALLBACK_MAGIC to check for mailbox command support on the
device while exposing respective sysfs attributes.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device_sysfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
index a73e0e957cb0..f384cae3502c 100644
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
@@ -160,11 +160,11 @@ static umode_t late_bind_attr_is_visible(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
 	struct xe_tile *root = xe_device_get_root_tile(xe);
+	u32 mbox = PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0);
 	u32 cap = 0;
 	int ret;
 
-	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
-			    &cap, NULL);
+	ret = xe_pcode_read(root, mbox | PCODE_FALLBACK_MAGIC, &cap, NULL);
 	if (ret)
 		return 0;
 
-- 
2.43.0

