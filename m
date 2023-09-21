Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1A1C04AAC
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 11:34:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC82710E5C6;
	Thu, 21 Sep 2023 11:34:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C1710E5C6
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 11:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695296041; x=1726832041;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YUIHLAsLqldG2eRg+cHzDZryTHjSpzLRdNLjETBA9d4=;
 b=e4tCpS0O+iR4N4ceDU/71nnF0jrrrX3Lkw3hR/GmvqQGdNMjvSy8By7f
 e4rOjNqvpOXAV5b388H5MsU1UUPTndhQgyWawIJIP06fkbfzlqua8R17O
 re5Q144RRfUWWI/dpvyUkFpSSvBDVnAhIEq0gDVKzwBWlzX8CC+U4uI/e
 DICi41MyFOlDK6wt6KGsZi5wfKJsdxUgMFJV08RTc7702kbRXpmpLTQf5
 279V6OSbq2P3ykyFW70iEk2xquLvI0laESUlO66/K4i6mYPHI0C7ALKHr
 4LiT5ZFkWljpaJUvs2PzZJhIt5hUpe3Doiyj1+0RRFhfRYiU2j1F2HApa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="383232789"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="383232789"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 04:34:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="994043332"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="994043332"
Received: from aravind-dev.iind.intel.com ([10.145.162.146])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 04:33:58 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 21 Sep 2023 17:06:37 +0530
Message-Id: <20230921113637.386651-1-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] fixup! fixup! drm/xe/pmu: Enable PMU interface
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

Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 include/uapi/drm/xe_drm.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 6ab85c7fed36..d48d8e3c898c 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1056,12 +1056,14 @@ struct drm_xe_vm_madvise {
 /**
  * DOC: XE PMU event config IDs
  *
- * Check 'man perf_event_open' to use these ID's in 'struct perf_event_attr'
- * as part of perf_event_open syscall to read a particular event.
+ * Check 'man perf_event_open' to use the ID's XE_PMU_XXXX listed in xe_drm.h
+ * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
+ * particular event.
  *
  * For example to open the XE_PMU_INTERRUPTS(0):
  *
  * .. code-block:: C
+ *
  *	struct perf_event_attr attr;
  *	long long count;
  *	int cpu = 0;
-- 
2.25.1

