Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03132C61DB2
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 10:23:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3ED810E963;
	Fri, 13 Jun 2025 10:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jL2vgBiF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2D010E939;
 Fri, 13 Jun 2025 10:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749810198; x=1781346198;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u+A4djWyxul/7aUftPaPaTVrtFp/KVcNv7uVgzQeTx4=;
 b=jL2vgBiFXBXB1UXRpR7e4QUPFNLF+aRSTbeH0OK6DYVklAF9dL5Lnk+z
 z4nSEKszBZN8H46B8mn0QVaJfx4Dsgb/HyNrl1pHGgjZWE84eP5DygMEY
 8yph0Xb5lSTDc8Xy3kZAMPPTtLb95f7qTBsNdOftgvh0JNFLU+3/IPeEH
 JU6tPtBDMOGdmmUVoK59F21qCcwlI5eQ72jrF43HKBCI0HktzLbKsqurx
 a6bCiSrHPEVyGYjvASZJIBaZLAY/ndjOvjBqSyXFUOQmU+hBoIUvRoDs0
 VK4VYVo8OaM/E1GL4y7N4rSOAbWsp4H2U6ag1ngtjJzWP+TdWS4GbNHqB A==;
X-CSE-ConnectionGUID: eT4NSX4wQLaA1MEUYjV61g==
X-CSE-MsgGUID: jYfnR8+bQVSl9I994fKNzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="62673635"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="62673635"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 03:23:18 -0700
X-CSE-ConnectionGUID: xtTTexjnT6S61eSH003J/Q==
X-CSE-MsgGUID: 7JDs+AojSfqt3F3FlleePQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="152758938"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa004.jf.intel.com with ESMTP; 13 Jun 2025 03:23:16 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v6 1/9] drm/i915/xe3lpd: Add support for display version 30.02
Date: Fri, 13 Jun 2025 15:52:48 +0530
Message-Id: <20250613102256.3508267-2-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613102256.3508267-1-dnyaneshwar.bhadane@intel.com>
References: <20250613102256.3508267-1-dnyaneshwar.bhadane@intel.com>
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

From: Matt Roper <matthew.d.roper@intel.com>

Display version 30.02 should be treated the same as other Xe3 IP, but
will have a slightly different set of workarounds.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
index a4070f40e26f..089cffabbad5 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.c
+++ b/drivers/gpu/drm/i915/display/intel_display_device.c
@@ -1480,6 +1480,7 @@ static const struct {
 	{ 14,  1, &xe2_hpd_display },
 	{ 20,  0, &xe2_lpd_display },
 	{ 30,  0, &xe2_lpd_display },
+	{ 30,  2, &xe2_lpd_display },
 };
 
 static const struct intel_display_device_info *
-- 
2.34.1

