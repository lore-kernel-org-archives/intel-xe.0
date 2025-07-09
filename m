Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC0AC83F0F
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 18:45:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94BE10E07D;
	Wed,  9 Jul 2025 18:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TAoqaFLC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF8510E35B
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 18:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752086727; x=1783622727;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oT3Jm2YcLIrEEoTNBNUIreW51zAojhlRHEqzz+kiMug=;
 b=TAoqaFLC3gfRY2MlQPaayBZCGe+iNKgrKqTkUl6yFFd+Eow7Ce2n8B0D
 IH072sGn42LGAR4mA4Xd7GbR5E+1abmG04doCB+l0d8d/BQ0WPETkWhui
 pkdqkNGO5RwNK//5A5y/xQvxvI/3motirN7m1aREnCNjwdlZMjDs2LyTu
 CPHCLhJ1HmGHkn6YoWmiflfrRxlGv6MevTfnkO0tGd3E3ALC8lUAgQWNp
 pRAx4VV1yfmdu14qNesaNgUS0d3A5nnod0c88MjrfTuCpM2T/j9YvqpHN
 eYXOMwVPtO/pVH4pf8OcR6IgUtaC0w+kIVv3oV3pJlksCAsC8D8NvSwzk Q==;
X-CSE-ConnectionGUID: Yxc2f1ILR+CriyjAZqeVXg==
X-CSE-MsgGUID: +m+rqGWwRGW+jI8hUL36rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54451052"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54451052"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 11:45:27 -0700
X-CSE-ConnectionGUID: CquQCLIkSyyk8DG1z02rmw==
X-CSE-MsgGUID: DaccBxN4Qvm28r7lQS4iOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="161404867"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.221.121])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 11:45:26 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com, simona@ffwll.ch,
 david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v7 05/12] platform/x86/intel/pmt: use guard(mutex)
Date: Wed,  9 Jul 2025 14:44:51 -0400
Message-ID: <20250709184458.298283-6-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250709184458.298283-1-michael.j.ruhl@intel.com>
References: <20250709184458.298283-1-michael.j.ruhl@intel.com>
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

Update the mutex paths to use the new guard() mechanism.

With the removal of goto, do some minor cleanup of the current logic
path.

Reviewed-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 33 +++++++++++------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 6e32fc1f8f1d..c3ca95854aba 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/auxiliary_bus.h>
+#include <linux/cleanup.h>
 #include <linux/intel_vsec.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -156,9 +157,9 @@ enable_store(struct device *dev, struct device_attribute *attr,
 	if (result)
 		return result;
 
-	mutex_lock(&entry->control_mutex);
+	guard(mutex)(&entry->control_mutex);
+
 	pmt_crashlog_set_disable(&entry->entry, !enabled);
-	mutex_unlock(&entry->control_mutex);
 
 	return count;
 }
@@ -190,26 +191,24 @@ trigger_store(struct device *dev, struct device_attribute *attr,
 	if (result)
 		return result;
 
-	mutex_lock(&entry->control_mutex);
+	guard(mutex)(&entry->control_mutex);
 
 	if (!trigger) {
 		pmt_crashlog_set_clear(&entry->entry);
-	} else if (pmt_crashlog_complete(&entry->entry)) {
-		/* we cannot trigger a new crash if one is still pending */
-		result = -EEXIST;
-		goto err;
-	} else if (pmt_crashlog_disabled(&entry->entry)) {
-		/* if device is currently disabled, return busy */
-		result = -EBUSY;
-		goto err;
-	} else {
-		pmt_crashlog_set_execute(&entry->entry);
+		return count;
 	}
 
-	result = count;
-err:
-	mutex_unlock(&entry->control_mutex);
-	return result;
+	/* we cannot trigger a new crash if one is still pending */
+	if (pmt_crashlog_complete(&entry->entry))
+		return -EEXIST;
+
+	/* if device is currently disabled, return busy */
+	if (pmt_crashlog_disabled(&entry->entry))
+		return -EBUSY;
+
+	pmt_crashlog_set_execute(&entry->entry);
+
+	return count;
 }
 static DEVICE_ATTR_RW(trigger);
 
-- 
2.50.0

