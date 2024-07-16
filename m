Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5B1C3DA59
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 21:40:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6301A10E8E2;
	Tue, 16 Jul 2024 21:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NfWWmPfp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD90A10E8E0
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 21:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721165997; x=1752701997;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sjno06+Owy1BvZXqKvBPo3RuTpMJvd05s/Rd5DVfW4M=;
 b=NfWWmPfplPbsBSAy5PlsopG4eBRBTEZj8tZJ2vIObYaX8FXkKbK8G7xl
 DPC9nzWVK6dqtQFkvN1elWHijASiNFM0ny66U5Prcsg6z2VU96TlZ47YG
 uQLYkXLU9Wb3BAjTYCnSn2jT5gY3/EPkJ2NK04dsTk9UvvOr9rMVMHTPF
 tK+qbU6WzHfGs6hMxs2bZ6VRoycyyGMa/rfR8vJV5Gzxf6rS5IDP98kcY
 pT7AnyjU0Cdd4dhTMUD1KIPl6hFRzj+Q3UyZnL0XGdJ/JXXDFMYyzMQy6
 6aiTrhE60hdr1/sgN3DCmBjCZImVup5UxyoYC+Mqn1D4eIIhSIINZvLL1 Q==;
X-CSE-ConnectionGUID: /kA4sR0dRlSF9UQwZtSETg==
X-CSE-MsgGUID: TymtzvfTQOKC5258KSUEQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="44063148"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="44063148"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 14:39:57 -0700
X-CSE-ConnectionGUID: 3WPcPPQETCq7Uuf490IgWw==
X-CSE-MsgGUID: VnaD4ONmQTO4RN3X66ph4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="73364357"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.36.158])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 14:39:56 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/7] drm/xe: Introduce const cast helper
Date: Tue, 16 Jul 2024 23:38:55 +0200
Message-Id: <20240716213901.398-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240716213901.398-1-michal.wajdeczko@intel.com>
References: <20240716213901.398-1-michal.wajdeczko@intel.com>
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

