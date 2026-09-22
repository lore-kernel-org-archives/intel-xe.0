Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC452C98302
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 16:56:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B5710E6E9;
	Tue, 22 Sep 2026 16:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TIgplIr+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75AA910E6E9
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 16:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790096216; x=1821632216;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M4fFOLkXthYBFbSDGymthdZ4PwkGHljZfHBCCJZp/4w=;
 b=TIgplIr+TFa0hdI01MYQQxqArrZXQHibjW5FempiH9dwYpp530hvPsoX
 O9nd7KFMBbUnMr6dTOY9EN8FtkQX3sGBAtbSHpyQGmHRYEnjuELEPkrG3
 l98GfmoUMmvmh3FsDKBTAP3WEORWtmPcH9RisAFSr7n4Am0zA1O4SpwBb
 loanctVqpaWz1jY1NMpHz9ZAe6O8dGP8h8oCXbeSmA7xwWn75uUAuda2l
 kFycQNPaH92hgfTLcfcbamJDrKWN7qDNpePTaSOd9QTL8chmWDQi/m/TO
 VtdUjRoMH2zE4Cdk2wwktWbmGaBborLgsl1MEMMP53jSEHTRAx+CkkhUd w==;
X-CSE-ConnectionGUID: x9Nm8oadRkmcgTLRMUK7gQ==
X-CSE-MsgGUID: zM4dUS7aQRS1w49QIvpp6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90743009"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="90743009"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 09:56:56 -0700
X-CSE-ConnectionGUID: jhWQ7/LaSOOfrrxdSDSsgw==
X-CSE-MsgGUID: 2Hbyyb/QQkORZB3kT314Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="273409457"
Received: from vmonti-desk.jf.intel.com ([10.24.80.72])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 09:56:55 -0700
From: Violet Monti <violet.monti@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Violet Monti <violet.monti@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH] drm/xe/ptl: Add a new PTL PCI ID
Date: Tue, 22 Sep 2026 09:56:08 -0700
Message-ID: <20260922165607.129560-2-violet.monti@intel.com>
X-Mailer: git-send-email 2.43.0
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

A new PCI ID for PTL.

Bspec: 72574

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
Signed-off-by: Violet Monti <violet.monti@intel.com>
---
 include/drm/intel/pciids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index dff389b56eb3..32c88a690ad8 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -880,6 +880,7 @@
 	MACRO__(0xB08F, ## __VA_ARGS__), \
 	MACRO__(0xB090, ## __VA_ARGS__), \
 	MACRO__(0xB0A0, ## __VA_ARGS__), \
+	MACRO__(0xB0A1, ## __VA_ARGS__), \
 	MACRO__(0xB0B0, ## __VA_ARGS__)
 
 /* WCL */
-- 
2.43.0

