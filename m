Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4937D6A25D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 23:44:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479A410E06F;
	Thu, 14 Nov 2024 23:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QXww0D2A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C225E10E06F
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 23:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731627855; x=1763163855;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ev7gbkJ/zt5XpKY27r954Sd6oS0cWhpuXX/IGP89uKc=;
 b=QXww0D2AXJm+Z+MogWxdBPAOG1QyAktse+J1fdkmq5+sTnl91V6O64bv
 nKv4VincjqkjC2mQ7MLu/RkOunE/sI8vsJJ5Pgf4OhqcflN8bKYBxe1wi
 YWdVeYOcpPikNtihWPxZrgGy/fOPa2fn4TlQhPhQfmfCrFc/R9hMGwHnO
 DT4tBptm2OJgyc14x8H9n0/VgrOwvj/VXn6udOMO/fHxz8mv7Y60vPwRq
 NHE70i4Z3TTvn1ExnZ84KwlhFVhNTi8+X9FDsplCBYjvdJNGoF/wqSGly
 CiQm5fS1gSFfm3uva1ZObgjNZR/PJnKeuSVDUNmtwd35xl/JOfdOL4teL g==;
X-CSE-ConnectionGUID: BGsXYy4JRBejRpvToDut6A==
X-CSE-MsgGUID: NB0vMw7/SVCDz4iOQeiT/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="19216683"
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; d="scan'208";a="19216683"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 15:44:14 -0800
X-CSE-ConnectionGUID: 7/qJVxCkQFK56NoJOWGykQ==
X-CSE-MsgGUID: VmgHWcbzRk6NjCVbFHR2sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; d="scan'208";a="88512780"
Received: from msatwood-mobl.jf.intel.com ([10.24.12.180])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 15:44:14 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH] drm/xe/ptl: Add another PTL PCI ID
Date: Thu, 14 Nov 2024 15:44:10 -0800
Message-ID: <20241114234410.145863-1-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.45.0
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

An additional pci id has been added to bspec.

Bspec: 72574
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 include/drm/intel/pciids.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index 32480b5563db..7883384acd5e 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -829,6 +829,7 @@
 	MACRO__(0xB092, ## __VA_ARGS__), \
 	MACRO__(0xB0A0, ## __VA_ARGS__), \
 	MACRO__(0xB0A1, ## __VA_ARGS__), \
-	MACRO__(0xB0A2, ## __VA_ARGS__)
+	MACRO__(0xB0A2, ## __VA_ARGS__), \
+	MACRO__(0xB0B0, ## __VA_ARGS__)
 
 #endif /* __PCIIDS_H__ */
-- 
2.45.0

