Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BB8C0218A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 17:51:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BB410E125;
	Tue, 28 Jan 2025 17:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b/xoYAfa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB97010E125
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 17:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738086667; x=1769622667;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HYuohixjemwu65mFA+RQAYhwOjZDt9+c7gk7ujFDzlw=;
 b=b/xoYAfakIY0vv3I5nlMyQrI3mbq9/Q4B4F8qZoUlk76NCa8rMyXvE+W
 lnz8CJ4iwQZZK7qVByRKtA5HcItLAcC9CvY6TY7osUQ221V9yR7vSlC8Z
 pZQpIeWoYSO83IcoSk+3r614CxkDrBO7k9PoJmjhMf+VQHywNGRFQZ1CN
 rcYiUq15IsOLoJwv3dkhSKFbLR4XT2XWXNdguRXRNFSJpaj/U2ZGmsroj
 Jb1W4kNAVEHzyOODSHTexSfgo2xYQDtdobQytsRlkQl23cYXafPvYJ6rn
 Q/Fy4C4a1vk9jTP+MeQw9oZDZg/C+kg0305UndD+pjInbGrk58EusanYf w==;
X-CSE-ConnectionGUID: wZ0we0WzRyKnNWAdBOO1zA==
X-CSE-MsgGUID: tqQ6pyHnTHKOd17PnvJt1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="49172871"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="49172871"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 09:51:06 -0800
X-CSE-ConnectionGUID: uXsxSGCtSeC/Zh5+sUXPBA==
X-CSE-MsgGUID: qaHG284PR42biVjKNoX4HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113419754"
Received: from msatwood-mobl.amr.corp.intel.com (HELO msatwood-mobl.intel.com)
 ([10.125.108.49])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 09:51:06 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH] drm/xe/ptl: Update the PTL pci id table
Date: Tue, 28 Jan 2025 09:51:02 -0800
Message-ID: <20250128175102.45797-1-matthew.s.atwood@intel.com>
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

Update to current bspec table.

Bspec: 72574

Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 include/drm/intel/pciids.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index 9c3a339e26af..70b75e31edff 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -856,12 +856,10 @@
 	MACRO__(0xB080, ## __VA_ARGS__), \
 	MACRO__(0xB081, ## __VA_ARGS__), \
 	MACRO__(0xB082, ## __VA_ARGS__), \
+	MACRO__(0xB083, ## __VA_ARGS__), \
+	MACRO__(0xB08F, ## __VA_ARGS__), \
 	MACRO__(0xB090, ## __VA_ARGS__), \
-	MACRO__(0xB091, ## __VA_ARGS__), \
-	MACRO__(0xB092, ## __VA_ARGS__), \
 	MACRO__(0xB0A0, ## __VA_ARGS__), \
-	MACRO__(0xB0A1, ## __VA_ARGS__), \
-	MACRO__(0xB0A2, ## __VA_ARGS__), \
 	MACRO__(0xB0B0, ## __VA_ARGS__)
 
 #endif /* __PCIIDS_H__ */
-- 
2.45.0

