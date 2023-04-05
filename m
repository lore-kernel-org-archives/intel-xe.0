Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E0AC6FD1D
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 02:59:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14AE10E077;
	Wed,  5 Apr 2023 02:59:23 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF58110E077
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 02:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680663561; x=1712199561;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2vRfain6Tz0kELtHbWNd4wfgW2vWLR8wmT3aLW4Z19U=;
 b=A93bzmassSqCR3MyPZaJ8Jeu6i5+y8ry0harjXXA3Xcf8HU0cK5743XF
 fscfjkljfw9ja7Fi6Mne7P93ncb+cEfUGSmNNytZwyHgM2p3GEAc3nMT2
 cIh5S1HC56B+UPtz7xPqXZA21Szjwrb4ahwn9PH3mlqoClzpU2VwuHVr2
 OUcc/S/bAmnikSCIWYqKxNyHCxrJtfdjKbFqTsNs0QSCH2v4w4KRbMoN0
 ODqNXjBPBfMr7F8PR7EB6FsVeJfteUAWeq5so1ZhVyyvVklMsuS2KYLHV
 p4sN3OZTuCryr0Puy/mebUfVyXT0aRCkqr88vG1inrW78/SmWToDRc1k0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="341080946"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="341080946"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 19:59:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="932661743"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="932661743"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 19:59:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue,  4 Apr 2023 19:59:19 -0700
Message-Id: <20230405025919.3975162-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Fix error handling in
 xe_gt_record_default_lrcs
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

Kill engines if an error is encountered in xe_gt_record_default_lrcs so
the driver can free these resources on driver teardown.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index bc821f431c45..3adde2205b39 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -301,8 +301,12 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 
 		gt->default_lrc[hwe->class] = default_lrc;
 put_nop_e:
+		if (err)
+			xe_engine_kill(nop_e);
 		xe_engine_put(nop_e);
 put_engine:
+		if (err)
+			xe_engine_kill(e);
 		xe_engine_put(e);
 put_vm:
 		xe_vm_put(vm);
@@ -310,6 +314,10 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 			break;
 	}
 
+	/* Wait for engine kill */
+	if (err)
+		msleep(50);
+
 	return err;
 }
 
-- 
2.34.1

