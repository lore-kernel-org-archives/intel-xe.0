Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C93FC5B543
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 20:34:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1831710E87A;
	Fri, 30 May 2025 20:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nGRvQ2Er";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AAF410E87A
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 20:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748637262; x=1780173262;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=anO5uSxXGHeVN2wZdaUxm+8Bhoy2yyCKRXoSKuFsiLI=;
 b=nGRvQ2Erh5y+Xi3I0s37qOZwMbnXjDK/p4mafw8w65Kj2ip+5gexBIbd
 u9DMQNp6Xwi1UnHXvUwbId4xXltFTJ/0VZBRvj/aRJILX1hmz9Xumw2BI
 96AHheQAX8q7pOFKZRVGIzcb9R5oflfhoaXnq69X1eDx1V4nm2Mhw1v3M
 bxSmabJx1dblx6ui0ZO6B0OYbOagwitrYYGcxw5h6YvOOgsR/9uUmUR0D
 oLcUZWyrkhjqopXRkxDv+3rR7diPSzeWTLvi5H0y5y3m7nj0fzbFBf+sU
 W3L586zEeCgq55mduuBVoQRcJ7jtKwm2ubEm2HMX8Pp6n4xawFjWnIJQd w==;
X-CSE-ConnectionGUID: ELYBHnf9SkylDRTv+WKS+Q==
X-CSE-MsgGUID: KJ2NxxcSQVSq8HeGFG/7bQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="54405773"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="54405773"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 13:34:22 -0700
X-CSE-ConnectionGUID: /2ibRHgTQeq4Q8bUzQwUmQ==
X-CSE-MsgGUID: BXigwwfaSOuRmXOqHmJPAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="149246649"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.223.23])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 13:34:20 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH 03/10] platform/x86/intel/pmt: use guard(mutex)
Date: Fri, 30 May 2025 16:33:40 -0400
Message-ID: <20250530203356.190234-3-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530203356.190234-1-michael.j.ruhl@intel.com>
References: <20250530203356.190234-1-michael.j.ruhl@intel.com>
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

Update the mutex paths to use the new guard() mechanism.

With the removal of goto, do some minor cleanup of the current
logic path.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 32 +++++++++++------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index d40c8e212733..c6d8a7a61d39 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -155,9 +155,9 @@ enable_store(struct device *dev, struct device_attribute *attr,
 	if (result)
 		return result;
 
-	mutex_lock(&entry->control_mutex);
+	guard(mutex)(&entry->control_mutex);
+
 	pmt_crashlog_set_disable(&entry->entry, !enabled);
-	mutex_unlock(&entry->control_mutex);
 
 	return count;
 }
@@ -189,26 +189,24 @@ trigger_store(struct device *dev, struct device_attribute *attr,
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
2.49.0

