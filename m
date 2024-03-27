Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02C7CD1283
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 18:28:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750BD10FB68;
	Wed, 27 Mar 2024 18:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OwQQqNX1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC5E10F8F1
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Mar 2024 18:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711564080; x=1743100080;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IRDlhjNBRGx0eD/HrTcWXm6lbhDYCeInhv0b86maS2U=;
 b=OwQQqNX1tmvhjF/lGhrd5Lbc2swFGQvfe0B1CKIrfaWm+a/bSCeNkW2j
 8oHp8FinEZTCAbLPinKKtwzWQWKb56aQTLqEhWYdHnxNRNt1gD0KoU6CQ
 xEKdta8xr9V7V3dgVhzz5pIytVKMQByT4dQyEV1jshjIL/74UCdIWCAJr
 OBltDbHKyzBBj66cVfcBvNZMCoyizTwra8rPCU/BSO0mHEKoGh3joumhU
 E4q93tF3nfyP1EEZBEANEZ4T8XiTqFkYRn8fktliLWfeYX3Ql6c5Qvouh
 TkSR2c4gnL0UKkRadG8nAXaNoN98bknojVxXNW2fYoF6lKDWKZXpB/hoT w==;
X-CSE-ConnectionGUID: h7pbcMPhTW+uGWK77THz5w==
X-CSE-MsgGUID: M4G+vPu/SOesPTvUAzcfXg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="18074624"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="18074624"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 11:28:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="20917434"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.157.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 11:27:59 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/3] drm/xe: Move SR-IOV probe to xe_device_probe_early()
Date: Wed, 27 Mar 2024 19:27:39 +0100
Message-Id: <20240327182740.407-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240327182740.407-1-michal.wajdeczko@intel.com>
References: <20240327182740.407-1-michal.wajdeczko@intel.com>
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

SR-IOV mode detection requires access to the MMIO register and
this can be done now in xe_device_probe_early().

We can also drop explicit has_sriov parameter as this flag is now
already available from xe->info.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 ++
 drivers/gpu/drm/xe/xe_pci.c    | 2 --
 drivers/gpu/drm/xe/xe_sriov.c  | 4 ++--
 drivers/gpu/drm/xe/xe_sriov.h  | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 286ebccc3fc8..01bd5ccf05ca 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -424,6 +424,8 @@ int xe_device_probe_early(struct xe_device *xe)
 	if (err)
 		return err;
 
+	xe_sriov_probe_early(xe);
+
 	err = xe_mmio_verify_vram(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 3c94154051a8..c47ab4b67467 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -740,8 +740,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		return err;
 
-	xe_sriov_probe_early(xe, desc->has_sriov);
-
 	err = xe_device_probe_early(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index f295d91886b1..2bcef998c8a9 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -31,7 +31,6 @@ const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode)
 /**
  * xe_sriov_probe_early - Probe a SR-IOV mode.
  * @xe: the &xe_device to probe mode on
- * @has_sriov: flag indicating hardware support for SR-IOV
  *
  * This function should be called only once and as soon as possible during
  * driver probe to detect whether we are running a SR-IOV Physical Function
@@ -40,9 +39,10 @@ const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode)
  * SR-IOV PF mode detection is based on PCI @dev_is_pf() function.
  * SR-IOV VF mode detection is based on dedicated MMIO register read.
  */
-void xe_sriov_probe_early(struct xe_device *xe, bool has_sriov)
+void xe_sriov_probe_early(struct xe_device *xe)
 {
 	enum xe_sriov_mode mode = XE_SRIOV_MODE_NONE;
+	bool has_sriov = xe->info.has_sriov;
 
 	/* TODO: replace with proper mode detection */
 	xe_assert(xe, !has_sriov);
diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
index 1545552162c9..9e3f58874e98 100644
--- a/drivers/gpu/drm/xe/xe_sriov.h
+++ b/drivers/gpu/drm/xe/xe_sriov.h
@@ -12,7 +12,7 @@
 
 const char *xe_sriov_mode_to_string(enum xe_sriov_mode mode);
 
-void xe_sriov_probe_early(struct xe_device *xe, bool has_sriov);
+void xe_sriov_probe_early(struct xe_device *xe);
 int xe_sriov_init(struct xe_device *xe);
 
 static inline enum xe_sriov_mode xe_device_sriov_mode(struct xe_device *xe)
-- 
2.43.0

