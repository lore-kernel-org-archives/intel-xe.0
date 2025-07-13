Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FC2C83F1D
	for <intel-xe@archiver.kernel.org>; Sun, 13 Jul 2025 17:30:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B1010E18C;
	Sun, 13 Jul 2025 17:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jLTrMN0p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BC110E18C
 for <intel-xe@lists.freedesktop.org>; Sun, 13 Jul 2025 17:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752427805; x=1783963805;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lFJAoaBsqvLfWqq9QLWuaiPqon8ZGhk3HZHjCdijZ1Y=;
 b=jLTrMN0pivJcUax3PdMknl5v5tbGQFsX+ax4J6AQrqRu8tNv7ML1fNII
 CdzdBLjEVALyYXFADtqoREaAww7AVFoGrWUwJDFQJ4srzv8z9AcqVNdNT
 +ZwxRvhwfc67nsLBbzKqFU9LhHg4MZZJ9rnthMei15ThRvW1ghYLzz4R/
 y7OHxqKzcI25bZ5e7c+Tiv6ljvIuHlSWaLcF2EO5xEynLvGC3zD+HH2Kz
 FD4UsGOp0wTaFjziC3bmoALOQJon3fay6jQKNHEHLwupJSZSx4+UUxQh+
 UyEdaxQxEmz61qqH5AK1UW4PqU/ugKUub05ZsqnuWnyw4a8JnmgTwjOku w==;
X-CSE-ConnectionGUID: gq0ZxeI2S8OFgHEhKtnLRA==
X-CSE-MsgGUID: xamIaIxDTTaZFqxDZrclBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65334134"
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; d="scan'208";a="65334134"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2025 10:30:05 -0700
X-CSE-ConnectionGUID: E8bk0nnISN+gVflGnuVVyA==
X-CSE-MsgGUID: 1Zxdns9KRxOK71gL3XccCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; d="scan'208";a="161069290"
Received: from mgoodin-mobl3.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.223.19])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2025 10:30:03 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com, simona@ffwll.ch,
 david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v8 05/13] platform/x86/intel/pmt: mutex clean up
Date: Sun, 13 Jul 2025 13:29:35 -0400
Message-ID: <20250713172943.7335-6-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250713172943.7335-1-michael.j.ruhl@intel.com>
References: <20250713172943.7335-1-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The header file for mutex usage and mutex_destroy() cleanup code is
absent from the crashlog.c module.

Add the header file and mutex_destroy().

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index d40c8e212733..6e32fc1f8f1d 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -12,6 +12,7 @@
 #include <linux/intel_vsec.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
@@ -262,8 +263,12 @@ static void pmt_crashlog_remove(struct auxiliary_device *auxdev)
 	struct pmt_crashlog_priv *priv = auxiliary_get_drvdata(auxdev);
 	int i;
 
-	for (i = 0; i < priv->num_entries; i++)
-		intel_pmt_dev_destroy(&priv->entry[i].entry, &pmt_crashlog_ns);
+	for (i = 0; i < priv->num_entries; i++) {
+		struct crashlog_entry *crashlog = &priv->entry[i];
+
+		intel_pmt_dev_destroy(&crashlog->entry, &pmt_crashlog_ns);
+		mutex_destroy(&crashlog->control_mutex);
+	}
 }
 
 static int pmt_crashlog_probe(struct auxiliary_device *auxdev,
-- 
2.50.0

