Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1823C5ACB3
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 08:40:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4673710E298;
	Tue, 21 Nov 2023 08:40:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F0110E298
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Nov 2023 08:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700556024; x=1732092024;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zpZd5E21GGFIfnjjAYqI8o8F5alI+tXy6IvholGBSm4=;
 b=QejE3CxI0rkiP2dyiXtlFH35yG70OzCgZoyUzqIk6wr3zH+fhlGFmTix
 wvD6oOzQQZoyJ4T49oJwAxuJpVl6pik4YHj1r3sWaM44Cwfdb2O3PspsS
 RFldugn9KcTKp+KcOodG3140lldl/D8bFMuHJhiay2wLFgRHOrm1RYNOk
 pBv7fJwsgUSR8c0P7ZWgwHih7LSFd7vSkML/JM3VQGrnFvU6JQjbFLhff
 AsfOgluSlrWSoDqj7ulKmbYSa9C/33d9+GNYe7w53c/jWI6KjrmUmMwpg
 HfdHFwTnc7qB/DhVzWxzUGVN3mGAtcnbtf1FJTcIe/rvLU6FSqRu6Gxr8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="394636944"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; d="scan'208";a="394636944"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 00:40:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="8010281"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 00:40:22 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 21 Nov 2023 14:17:31 +0530
Message-Id: <20231121084731.2588879-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3] fixup! drm/xe/pmu: Drop interrupt pmu event
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

Interrupt pmu event was dropped in a previous patch
and the configs for the rest of the events were changed
in uapi header.

Change the configs in pmu file too.

v2: change to fixup patch
v3: rebase

Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index b4c69046d90d..6dd5c97129f2 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -353,10 +353,10 @@ create_event_attributes(struct xe_pmu *pmu)
 		const char *unit;
 		bool global;
 	} events[] = {
-		__event(1, "render-group-busy", "ns"),
-		__event(2, "copy-group-busy", "ns"),
-		__event(3, "media-group-busy", "ns"),
-		__event(4, "any-engine-group-busy", "ns"),
+		__event(0, "render-group-busy", "ns"),
+		__event(1, "copy-group-busy", "ns"),
+		__event(2, "media-group-busy", "ns"),
+		__event(3, "any-engine-group-busy", "ns"),
 	};
 
 	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
-- 
2.40.0

