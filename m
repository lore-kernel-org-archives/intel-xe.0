Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476A2C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 16:34:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F339110ED3B;
	Wed, 19 Jun 2024 16:34:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U6FJgBTD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C1910ED31
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 16:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718814865; x=1750350865;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wiaQ+VXmRjyZjG75/JwcjayhG7MEu3nvqk0/TGmwPAE=;
 b=U6FJgBTDZo3XakpZ6wt69ciDEKDcEs6HACOli9Ez8PKTLFWIoGNqUSEp
 3Gh5a/ZaK5x5sEKbbw5uun+VY30k3NhooFq9MqtCsNFMCZe5EgW2v+DQI
 GuhYaUoeRy2xJwews0W3tKpcUjKrmuInxNavvJ0B7KiqijKKIB0ciYS4T
 sW24l6GKsunYJmKmgyqA7PE7OxJr0Hi3r2frsv4xvTm38lrSBnJbmF4z+
 pIiowv3av/EY50XsVa72EaxTFjYRQnDbgxzM5dP7+JUJdD6XK4vUNcXDT
 YE406Xzfn35fDHFEA3tv88M1eScpOYTJbO9EMkP5U/UZCOf2hvXb5nMud w==;
X-CSE-ConnectionGUID: OH+z9muiSeqpHf+0BiVIcw==
X-CSE-MsgGUID: WpZPk9LgQf2i3ZkRbeDtZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="27183421"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="27183421"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 09:34:23 -0700
X-CSE-ConnectionGUID: 6TRz2KEaSAu6T55rg3XAKw==
X-CSE-MsgGUID: Cm/VimF2TSy2QxbOWrLa2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42098436"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 09:34:21 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe/guc: Move ARAT interrupts enabling to the upload step
Date: Wed, 19 Jun 2024 18:34:13 +0200
Message-Id: <20240619163413.817-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Even though ARAT interrupts are enabled by default, we still want
to keep the code that enables them. But instead doing that in the
CTB enabling step, move this code to the upload step, where we
already setup few other registers related to GuC.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 7ecb509c87d7..02c028d0e91b 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -476,6 +476,9 @@ static void guc_prepare_xfer(struct xe_guc *guc)
 	xe_mmio_write32(gt, GUC_SHIM_CONTROL, shim_flags);
 
 	xe_mmio_write32(gt, GT_PM_CONFIG, GT_DOORBELL_ENABLE);
+
+	/* Make sure GuC receives ARAT interrupts */
+	xe_mmio_rmw32(gt, PMINTRMSK, ARAT_EXPIRED_INTRMSK, 0);
 }
 
 /*
@@ -865,9 +868,6 @@ int xe_guc_enable_communication(struct xe_guc *guc)
 		guc_enable_irq(guc);
 	}
 
-	xe_mmio_rmw32(guc_to_gt(guc), PMINTRMSK,
-		      ARAT_EXPIRED_INTRMSK, 0);
-
 	err = xe_guc_ct_enable(&guc->ct);
 	if (err)
 		return err;
-- 
2.43.0

