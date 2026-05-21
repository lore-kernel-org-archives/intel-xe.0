Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3188ECD5BAC
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 18:06:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4E310F3D4;
	Thu, 21 May 2026 18:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="agQpJQGG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A42310F3D4
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 18:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779386759; x=1810922759;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=9CxriJTjsJNegit8HiUYuFzHYV7hw/ic8RjDH/tvhZk=;
 b=agQpJQGGaYvHT1cl1MvQkdj3dNpdZpGeQdqD0s4GJkOjwS7MXWk6dgmn
 VeFsYoN+X8h0Jsq7/w5v8dFI4z3FTsP6hhWpsV28LI27MWMxhCywfS4YM
 MnJW99Z3o39RQUOiA7kviLtVoIEJ1W93/mTmFziQ/aD1mjnm/UGI5REWO
 oh1OsFdnTp1S68WjON5jntVFaSvHHHhh+BoO9H2okTdYJkF8iJm6ocwKb
 tsa3/GBUtp6hR1CmU9lQBQ9LdbPL82IaEzyAiRlo+2D+KsOKH+M9p/Mc9
 BOTga1E9lJ5rFdeRqwKKxPQfiE6b5jV538KzGnVX/R8NTUqxGd+ARAnz0 g==;
X-CSE-ConnectionGUID: 4Gv+HnFqSISdRDLGe7zc3Q==
X-CSE-MsgGUID: Br/B9qCITGylQ4yt1jlpYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="79463575"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="79463575"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 11:05:58 -0700
X-CSE-ConnectionGUID: de9JvKXfTi+RtyLb+ibQ5w==
X-CSE-MsgGUID: 1DqXCh3ER0KmPx3hTFXB0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="245641873"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.223.115])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 11:05:57 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 21 May 2026 15:03:59 -0300
Subject: [PATCH] drm/xe/nvls: Update PCI IDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-nvl-s-update-pci-ids-v1-1-ec59e5d6bf12@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MWwqAIBAArxL73YIKPa8SfVhutRAmbkUg3T3pc
 xhmEghFJoG+SBDpZuHDZ9BlAfNm/UrILjMYZWpVGY3+3lHwCs6ehGHm7AUn3TXV4hpLroWchkg
 LP/92GN/3A9AbWJtmAAAA
X-Change-ID: 20260521-nvl-s-update-pci-ids-b1975fd7aed8
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

Bspec has been updated with respect to NVL-S PCI IDs. Update
INTEL_NVLS_IDS() accordingly.

Bspec: 74201
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 include/drm/intel/pciids.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index e32ef763427c..dff389b56eb3 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -893,8 +893,9 @@
 	MACRO__(0xD741, ## __VA_ARGS__), \
 	MACRO__(0xD742, ## __VA_ARGS__), \
 	MACRO__(0xD743, ## __VA_ARGS__), \
-	MACRO__(0xD744, ## __VA_ARGS__), \
-	MACRO__(0xD745, ## __VA_ARGS__)
+	MACRO__(0xD745, ## __VA_ARGS__), \
+	MACRO__(0xD74A, ## __VA_ARGS__), \
+	MACRO__(0xD74B, ## __VA_ARGS__)
 
 /* CRI */
 #define INTEL_CRI_IDS(MACRO__, ...) \

---
base-commit: 977b8c213db701a9ec0987be82f00f7d5bc0a330
change-id: 20260521-nvl-s-update-pci-ids-b1975fd7aed8

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

