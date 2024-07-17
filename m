Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FAEC3DA62
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 19:52:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BA410E3CC;
	Wed, 17 Jul 2024 19:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E2Dq3FI8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA1010E3CC
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 19:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721245927; x=1752781927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sjno06+Owy1BvZXqKvBPo3RuTpMJvd05s/Rd5DVfW4M=;
 b=E2Dq3FI8QRSThpXGD93o3ACaTdz7ASJ+ZPLLATRyUNKFrRGpHubWSVLE
 1B9bs2/Wvmdfln3JwwIHoneiE/t9zj7Ik+StaQys/PuNt/yBJ8Ov4yEPe
 k9F0tBwR1GRdBa200ifeNoyOsxRcADVFSij7lwZ6f6LD9Zu51ag+JWpUY
 vpuZbN4yOrGUx+DeH2ekINVuCkm2Y4uCeEXXuQ/yl0aRHzyvY+8T5G7xL
 B+Ff3gHS8jYhZ24J0M6eWhlDpQ9UI/nYYfnx4kOwIRmkQvV8gnbjBwedu
 yUKRZo5znwiHL84/OJUPwdUA5wA95rPMMiXj99hcMZ7qvLznquo27n42f A==;
X-CSE-ConnectionGUID: c/ty9wGzTWiUyPsV3dEa6A==
X-CSE-MsgGUID: J46ylyu3TO2WE57PVEYCbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18472915"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="18472915"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 12:52:07 -0700
X-CSE-ConnectionGUID: f/6LCWeWQfGVfTJZ0vGMMw==
X-CSE-MsgGUID: bYVq5jf3Twq/p8vNpISfJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="54690357"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.1.253])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 12:52:05 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 1/7] drm/xe: Introduce const cast helper
Date: Wed, 17 Jul 2024 21:51:49 +0200
Message-Id: <20240717195155.442-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240717195155.442-1-michal.wajdeczko@intel.com>
References: <20240717195155.442-1-michal.wajdeczko@intel.com>
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

Typically we want to preserve pointer constness when converting
from one xe pointer to another, but in some rare cases, like kunit
parameter conversions, we might want to discard this constness.
Add a helper that we will use to clearly indicate our intention.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 0a2a3e7fd402..c2b1f9f066bd 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -20,6 +20,11 @@ static inline struct xe_device *pdev_to_xe_device(struct pci_dev *pdev)
 	return pci_get_drvdata(pdev);
 }
 
+static inline struct xe_device *xe_device_const_cast(const struct xe_device *xe)
+{
+	return pdev_to_xe_device(to_pci_dev(xe->drm.dev));
+}
+
 static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
 {
 	return container_of(ttm, struct xe_device, ttm);
-- 
2.43.0

