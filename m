Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30852C83F03
	for <intel-xe@archiver.kernel.org>; Fri,  4 Jul 2025 10:35:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F1410E9E5;
	Fri,  4 Jul 2025 10:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vd6df5nb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B197910E9E5
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Jul 2025 10:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751625341; x=1783161341;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4EhNp/j395K7B7WPp4sHKRkecn5iPs7Qf+MsTn7p13o=;
 b=Vd6df5nbc/kFCWCEu5QmQx7gPfvdH6rGXU61HgPpe7IFSpbbCa3IEbuV
 dBrye1z5u5/4gpGC8TX7eV+fr8ZkfbLhAxJpZ/moSEqAUMYgvaWsHYy38
 adUguvpwALD69lqIuO1M+CHmFYqBe4BSMIKhLbBt1crHEoM4ziuL0yV2/
 F6IcIyFAjR4QkGd1edRo1pJKVkbD2669xcfU2jeNlkayQ/6zJtBR7snML
 o+cwcvhNfybJmafsuEGMJkYVy61tzqIrDfscUAH8aM2EMBLRU1uu7ueNb
 o+PuCK3D56Ai/k25mxM0rSh2X3jPKOFz/gmrMgpCgLWdHX20Qnkuz7fCm A==;
X-CSE-ConnectionGUID: xwhwAjzLSp+VsUrIjHPMUA==
X-CSE-MsgGUID: W6GX/KsGTomiORRgCnpDGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="54077987"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="54077987"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 03:35:41 -0700
X-CSE-ConnectionGUID: bcpStWiNRHiKGhqJEhUDdQ==
X-CSE-MsgGUID: l4IrQYpKQn29LRZgD2xfeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="160128298"
Received: from unknown (HELO rvodapal-mobl.iind.intel.com) ([10.190.239.40])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 03:35:39 -0700
From: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: balasubramani.vivekanandan@intel.com,
	"Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>,
	Vodapalli@freedesktop.org
Subject: [PATCH] drm/xe/bmg: Add one additional PCI ID
Date: Fri,  4 Jul 2025 16:05:27 +0530
Message-Id: <20250704103527.100178-1-ravi.kumar.vodapalli@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>

One additional PCI ID is added in Bspec for BMG, Add it so that
driver recognizes this device with this new ID.

Bspec: 68090
Signed-off-by: Vodapalli, Ravi Kumar <ravi.kumar.vodapalli@intel.com>
---
 include/drm/intel/pciids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index a0180d10e260..76f8d26f9cc9 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -846,6 +846,7 @@
 /* BMG */
 #define INTEL_BMG_IDS(MACRO__, ...) \
 	MACRO__(0xE202, ## __VA_ARGS__), \
+	MACRO__(0xE209, ## __VA_ARGS__), \
 	MACRO__(0xE20B, ## __VA_ARGS__), \
 	MACRO__(0xE20C, ## __VA_ARGS__), \
 	MACRO__(0xE20D, ## __VA_ARGS__), \
-- 
2.34.1

