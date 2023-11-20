Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2657C197A0
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 06:59:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4F910E122;
	Mon, 20 Nov 2023 06:59:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA7210E122
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 06:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700463587; x=1731999587;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ye5BZ1qVsXCtR2CgHHXm8r686oKNpMnMuNHeRuYteZk=;
 b=V/viCYQfpwVmERGbk3fO21fnZg7DegYIoOoSIsRuX22oPtLq8lb00zy9
 BC26O5QzIFpAnCgvVFV5T2HK9CyPKYBfQH0feWXhrcFilO/3yTE0QPfqE
 B552JSuWwFbYXnYKiXamy6MaOMnWkTFYd2OaBm7UVY5iUQivo9xHp9DSp
 zX924H6D21offkKFdhpBz4ma63V6cwXhrLqivpHi/z4aWe5ufMCBpZS9R
 wDNwlr0G+FG6YjNqo9+P2OeTddQEkIwLya0aWFD6/iIxj7975HcvFd3jg
 AFxCT52dehVwQIs/A2fgk01EyVOxUYNcPFpwF6N9w9qixlxzy0TencsJR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="458063418"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="458063418"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2023 22:59:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="856904024"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; d="scan'208";a="856904024"
Received: from haridhar-ms-7d25.iind.intel.com ([10.190.238.53])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2023 22:59:44 -0800
From: Haridhar Kalvala <haridhar.kalvala@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 20 Nov 2023 12:25:07 +0530
Message-Id: <20231120065507.1543676-1-haridhar.kalvala@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: ATS-M device ID update
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

ATS-M device ID update.

BSpec: 44477

Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
---
 include/drm/xe_pciids.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
index 68fbab161feb..712eb53f1f83 100644
--- a/include/drm/xe_pciids.h
+++ b/include/drm/xe_pciids.h
@@ -157,7 +157,8 @@
 	XE_DG2_G12_IDS(MACRO__, ## __VA_ARGS__)
 
 #define XE_ATS_M150_IDS(MACRO__, ...)		\
-	MACRO__(0x56C0, ## __VA_ARGS__)
+	MACRO__(0x56C0, ## __VA_ARGS__),	\
+	MACRO__(0x56C2, ## __VA_ARGS__)
 
 #define XE_ATS_M75_IDS(MACRO__, ...)		\
 	MACRO__(0x56C1, ## __VA_ARGS__)
-- 
2.25.1

