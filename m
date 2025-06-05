Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AC6C5AE59
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 18:45:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBAD310E30D;
	Thu,  5 Jun 2025 18:45:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RbS3hm0/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72EB10E316
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 18:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749149131; x=1780685131;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3zGaaI2Tt6uZqgfQb9gVOR7zHW+K28NJnwQluJOmn1s=;
 b=RbS3hm0/dlW2NNwmS2UBZ+BPora/IPINt6HTTXtqS/NROzRJpoqIFpXs
 Pnh+HNN0wmhBQ6JhDSaz3+IeV29Jr7cVWMqvZEebMhmMIz3JTIrUOI87e
 QCH7GXLUR0AEdQEUTEBA1814lZRqQzCkK/dxFRFbj/T+81YI1VNAa8d+c
 dt58G/qY89vUk1OCDxECW+FJJdoXNHFsmuD80e251cUwpz2pRiq3oi9oJ
 YkZuy5tJcGzBO4LrxYtjQ2snXzTkrvCkvdC00grF1d3l8GhiUvXTukydW
 1THbKiki+G2lQ9J1ascxse+Tqj0O4U7g9NK0y+LzwxpptDXPuVExs+i0C Q==;
X-CSE-ConnectionGUID: QGeDcdvBRN6vZpio9bZ7DQ==
X-CSE-MsgGUID: tdPPr4mMR32HTzwfrnFBLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="38916641"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="38916641"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 11:45:31 -0700
X-CSE-ConnectionGUID: ZD4BDshvSYStZgWeVRM4qg==
X-CSE-MsgGUID: JoG8cmoDRjaZv2DAMgXUZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="182782496"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com)
 ([10.124.222.42])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 11:45:30 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com, simona@ffwll.ch,
 david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v3 06/11] platform/x86/intel/pmt: re-order trigger logic
Date: Thu,  5 Jun 2025 14:44:39 -0400
Message-ID: <20250605184444.515556-7-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605184444.515556-1-michael.j.ruhl@intel.com>
References: <20250605184444.515556-1-michael.j.ruhl@intel.com>
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

Setting the clear bit or checking the complete bit before checking to
see if crashlog is disabled seems incorrect.

Check disable before accessing any other bits.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 94858bfb52f8..aa3f57fbe018 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -191,6 +191,10 @@ trigger_store(struct device *dev, struct device_attribute *attr,
 
 	guard(mutex)(&entry->control_mutex);
 
+	/* if device is currently disabled, return busy */
+	if (pmt_crashlog_disabled(&entry->entry))
+		return -EBUSY;
+
 	if (!trigger) {
 		pmt_crashlog_set_clear(&entry->entry);
 		return count;
@@ -200,10 +204,6 @@ trigger_store(struct device *dev, struct device_attribute *attr,
 	if (pmt_crashlog_complete(&entry->entry))
 		return -EEXIST;
 
-	/* if device is currently disabled, return busy */
-	if (pmt_crashlog_disabled(&entry->entry))
-		return -EBUSY;
-
 	pmt_crashlog_set_execute(&entry->entry);
 
 	return count;
-- 
2.49.0

