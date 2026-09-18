Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8B2C982D8
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 18:19:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C9010F4C6;
	Fri, 18 Sep 2026 18:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HWPajqYx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B914D10F4B0
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 18:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789755568; x=1821291568;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NZToeswPlLWfT1s5jIdK9N9aUoG/1K8ehUCS8+KvlP4=;
 b=HWPajqYxf6mKk+NKgH+E9yr6XS9qY7P+wDd7E9LRD5FMdgu3RLVvruom
 31xoFgB5ylpOYQ5pMehjTI4d+SSWsFwz0FSvVg0/67BWFWUW2TPXnDihL
 xsC+9wasqpiaiB8j+ourx8dAVsEzyKF5oGrNwKx+mh8g0FPVojbyDqeKR
 blTaB9vrRBdw81A2OMzvu1+fG4y1xUyzHxlF4DScbcr1x8zs0mf7tGCAi
 Y4UdQKDTfdnVoQeaMuXfh7Ai/bbO+OwLuXUhFn4dEkDV06NlsOE5xq0U9
 qcGZ1ZT0Xtdnce/yn6JhVnuvg1/fNJfYrthrYLRqF2SHmfm3aPLVDBdAH A==;
X-CSE-ConnectionGUID: W3fg8zVpSFCdwlPfb8OJUg==
X-CSE-MsgGUID: 8IiZyWijQaaVoyZ4fPvG7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="115812350"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="115812350"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 11:19:27 -0700
X-CSE-ConnectionGUID: 85UDXi4CTiK+JzO5XJo5VQ==
X-CSE-MsgGUID: KcMFO+LoSeOTCp143HgRJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2987896"
Received: from unknown (HELO msatwood-mobl.jf.intel.com) ([10.241.243.206])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 11:19:28 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH] drm/xe/ptl: Add a new PTL PCI ID
Date: Fri, 18 Sep 2026 11:19:23 -0700
Message-ID: <20260918181923.35930-1-matthew.s.atwood@intel.com>
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
---
 include/drm/intel/pciids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index e32ef763427c..aecb6fee1a2f 100644
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

