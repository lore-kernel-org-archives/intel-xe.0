Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE687C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 21:46:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E82410E28F;
	Wed, 19 Jun 2024 21:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Laahoj0S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E3810E28F
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 21:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718833587; x=1750369587;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ktfg6Cwx+6q0E5U1S1afsga1uQo+usDE+M/avwx57Us=;
 b=Laahoj0SLoZhDfg2IcNlm8kuWiYLpHvGLFRb4x8GutK+vcQpyLh54FTh
 V3EeT9Nhrfk/Cv1IYfRMoPaGtPoJkjSa761wtRStBnMo/hVtyY94cqSuT
 uLTimh1kaqi+t18F1e7q40e8Z13tZVspSdAL4nyMT8aI0JU1bSBtQ3AMq
 1oI1ZHifvSwhM8QQ77oIlukCZZxgZ1TSHZa4PC5zgH29OwW7MjyU/BJmG
 n/0vk2OApfe7Ng0QtmLwrRdo8A2pJo6AIknc90QlNI76SPAdPsS7H/Pcz
 TJjct3tCGa4COasFBhfe6thXQFFvz+SGMTrwUUeMIrg3YpruPYoQtP/Yh g==;
X-CSE-ConnectionGUID: /RQxc8WDRgq0oKK7c4SiOw==
X-CSE-MsgGUID: bAmEmVDYQ+eycC9CsVxERw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15662973"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15662973"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 14:46:27 -0700
X-CSE-ConnectionGUID: Ih+L8QHLRSeGWXwV8T0o6w==
X-CSE-MsgGUID: 6I1XBfbCQ3WaTkIT23BVNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42157804"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.119.62])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 14:46:26 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/9] drm/xe/vf: Disable features that do not apply to VFs
Date: Wed, 19 Jun 2024 23:45:49 +0200
Message-Id: <20240619214557.905-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240619214557.905-1-michal.wajdeczko@intel.com>
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
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

We already maintain several flags that control the availability
of features on a given device. Disable features, like PCODE or
GuC PC or GSC, that do not apply to a VF device.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 75d4c8ae9234..603e85da5748 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -486,6 +486,16 @@ static int wait_for_lmem_ready(struct xe_device *xe)
 	return 0;
 }
 
+static void update_device_info(struct xe_device *xe)
+{
+	/* disable features that are not available/applicable to VFs */
+	if (IS_SRIOV_VF(xe)) {
+		xe->info.has_heci_gscfi = 0;
+		xe->info.skip_guc_pc = 1;
+		xe->info.skip_pcode = 1;
+	}
+}
+
 /**
  * xe_device_probe_early: Device early probe
  * @xe: xe device instance
@@ -506,6 +516,8 @@ int xe_device_probe_early(struct xe_device *xe)
 
 	xe_sriov_probe_early(xe);
 
+	update_device_info(xe);
+
 	err = xe_pcode_probe_early(xe);
 	if (err)
 		return err;
-- 
2.43.0

