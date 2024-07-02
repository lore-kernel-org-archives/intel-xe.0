Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD64C3065C
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jul 2024 18:37:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1B010E67B;
	Tue,  2 Jul 2024 18:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q9s3S0ks";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905AE10E67B
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jul 2024 18:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719945442; x=1751481442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tEtL1kSdIQzSK/RDxTEnF3xOxznXXfE6wI4xXd9IaB8=;
 b=Q9s3S0kskZSIUkg4wb2a+XiYOIaAaGJ+58VIKm+8ph5GgNGDm8R4dfkv
 91D81dyKCW+0UVNTyizq8OUtGn53B7baD4oQAcixbu9DNCEuvNaa+1TUx
 nPl/YhKf1iREtcNNVYSleI7rCPMQWstvlaD6T48tcwZglmyP4YnG6htR4
 I0XwnxDwVb8mgtjYo0WchCfbwDFS9WU2AoQ+g3nQHJ+8/rmm+k4PNpOLE
 fmaLMtBM2piS6hAcOue0wMzxyKK7ZknRn2SpktHSo+rz6levNE5OEijMP
 UDm0nkuS3qmeqm+R0LJfpuglTQzsnLwfKj79sh2azqXMVENFMWQx2xrxa g==;
X-CSE-ConnectionGUID: 0Q3+72y9QIW+d2G1/BClvQ==
X-CSE-MsgGUID: UYkT9s/zQHelVrhASbr+5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="27756733"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="27756733"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 11:37:22 -0700
X-CSE-ConnectionGUID: bksaDIpOQgWbKREXaKFGOA==
X-CSE-MsgGUID: L21iY3VJT1GH+KuoR2F3zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="50604356"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.82.99])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 11:37:21 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH 3/3] drm/xe: Use VF_CAP_REG for device wmb
Date: Tue,  2 Jul 2024 20:37:04 +0200
Message-Id: <20240702183704.1022-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240702183704.1022-1-michal.wajdeczko@intel.com>
References: <20240702183704.1022-1-michal.wajdeczko@intel.com>
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

To force a write barrier on the device memory, we write to the
SOFTWARE_FLAGS_SPR33 register, but this particular register was
selected because it was one of the writable and unused register.

Since a write barrier should also work if we use the read-only
register, switch to VF_CAP_REG register that is also marked as
accessible for VFs.

While at it, add simple kernel-doc for xe_device_wmb() function.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index cfda7cb5df2c..74beddb55284 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -744,13 +744,22 @@ void xe_device_shutdown(struct xe_device *xe)
 {
 }
 
+/**
+ * xe_device_wmb() - Device specific write memory barrier
+ * @xe: the &xe_device
+ *
+ * While wmb() is sufficient for a barrier if we use system memory, on discrete
+ * platforms with device memory we additionally need to issue a register write.
+ * Since it doesn't matter which register we write to, use the read-only VF_CAP
+ * register that is also marked as accessible by the VFs.
+ */
 void xe_device_wmb(struct xe_device *xe)
 {
 	struct xe_gt *gt = xe_root_mmio_gt(xe);
 
 	wmb();
 	if (IS_DGFX(xe))
-		xe_mmio_write32(gt, SOFTWARE_FLAGS_SPR33, 0);
+		xe_mmio_write32(gt, VF_CAP_REG, 0);
 }
 
 /**
-- 
2.43.0

