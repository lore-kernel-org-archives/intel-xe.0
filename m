Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB68DC678D4
	for <intel-xe@archiver.kernel.org>; Thu,  2 Mar 2023 09:55:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C5010E424;
	Thu,  2 Mar 2023 09:55:41 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD56110E424
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Mar 2023 09:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677750939; x=1709286939;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=prMdBO/E6csr0Qf+gHzkTX3NtMgM5Vyw5unl1O2inbA=;
 b=W8FCooqkNtA1usM1ZlzNT1PpCKbdCZBw7a6lLraVwbKRgpDLq+QguNt4
 Cihp0eRdOd4Vz2uJFKROguffhOfjzF0M/Aq2SHUbvHIVMMAnazXwQZ5X1
 j8pEadgfK7NYYykYtdDknFNr5EdgvVMcU13e+ZBifIDfvAnob3dXBgOaC
 tnBBdcTZt4kKCHSIo3lpgsEfbsQUnVS/3tLdrLr0tIy/gobg1qazElxt9
 lGHdqurvXlC+G6IZAhMt/m6LonmsLgrmjIEUIC96GGa/R51PVK1QN1ayv
 3amk2nx0rKlwJSyMCEBWVmvAQN7PKPahB5Q6wq0aqQrA29CYBRWjSfKlv g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="420940755"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="420940755"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 01:55:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="784748625"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="784748625"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 01:55:36 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  2 Mar 2023 01:55:28 -0800
Message-Id: <20230302095528.20469-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe/migrate: Fix number of PT structs in
 docbook
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
Cc: thomas.hellstrom@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Update xe_migrate_doc.h with 32 page table structs (not 48)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate_doc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate_doc.h b/drivers/gpu/drm/xe/xe_migrate_doc.h
index 6a68fdff08dc..584972c4d3be 100644
--- a/drivers/gpu/drm/xe/xe_migrate_doc.h
+++ b/drivers/gpu/drm/xe/xe_migrate_doc.h
@@ -21,7 +21,7 @@
  * table BOs for updates, and identity map the entire device's VRAM with 1 GB
  * pages.
  *
- * Currently the page structure consists of 48 phyiscal pages with 16 being
+ * Currently the page structure consists of 32 phyiscal pages with 16 being
  * reserved for BO mapping during copies and clear, 1 reserved for kernel binds,
  * several pages are needed to setup the identity mappings (exact number based
  * on how many bits of address space the device has), and the rest are reserved
-- 
2.21.0.rc0.32.g243a4c7e27

