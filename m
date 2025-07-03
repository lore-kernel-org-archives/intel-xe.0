Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C5AC83F03
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 21:12:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2206610E8F0;
	Thu,  3 Jul 2025 21:12:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TGTFkYcf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AAF010E8F0
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 21:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751577143; x=1783113143;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k7OnI7U7Wz1ru9DPsR2JE/ukHM10lhYx6INguoad3i0=;
 b=TGTFkYcfC33GWurBnqkEi3JpfL7+FiTt1yERRklBAlCkMxb8CuOVJJE2
 9ZhyHTJJbf32NmR69DDMDlmMPvzZIhGLismhmHEwpC1OCzAFNVusTQqKN
 wFPDcQw0IjI6oZFyGlmi8ecqGeUxPv7795SaIqgvIiA+3AFNXa+NRFbdy
 DQqAln/y6MYlDYpCG0ZfAmA28ceqZYSryw2FZlCvzA0Ukm4+leS1y+YpG
 mKjj9ddDx9SRCwdMoLSxKxtgBGSWgnFw26JXD6swUrgKizuE3b1bbblEh
 gzLxB/XM6rFMfROsLpbKszOTWmSaMeFc0MySBuC9/KfenhW/4+p7l4fnd Q==;
X-CSE-ConnectionGUID: Db1VX5I8TNSKX8ndLz+8aw==
X-CSE-MsgGUID: 4YSemACXSU+MpsDcXEDOFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="79353013"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="79353013"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 14:12:22 -0700
X-CSE-ConnectionGUID: 1DsHGKBiRLSDeMpVP4/8ng==
X-CSE-MsgGUID: Z2LyvHDWRfCKaFMuQvTzOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="154240039"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.223.97])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 14:12:20 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com, simona@ffwll.ch,
 david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v6 04/12] platform/x86/intel/pmt: mutex clean up
Date: Thu,  3 Jul 2025 17:11:42 -0400
Message-ID: <20250703211150.135320-5-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703211150.135320-1-michael.j.ruhl@intel.com>
References: <20250703211150.135320-1-michael.j.ruhl@intel.com>
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

The header file for mutex usage and mutex_destroy() cleanup code is
absent from this module.

Add the header file and mutex_destroy().

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
2.49.0

