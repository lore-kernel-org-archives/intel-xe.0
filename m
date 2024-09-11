Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1DBEE021C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 09:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3278410E97A;
	Wed, 11 Sep 2024 09:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D3GPiANI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D1E10E97A
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 09:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726046729; x=1757582729;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4OlXdlR81+uBQ3y8PzbWAwjPRnWPgbGsfDl01dOZV8Q=;
 b=D3GPiANIJq0Sv9WrhsQ5xEgQNbvDAuE37a+Ze5LHuyEG1837BtW073an
 31tkr8FXcyVVC1XolqpZ0jNvqrv2TTIZNLe5c5U/p7djuDHSs461j6UXt
 LRObsEUPXnNBb/4WrB/RVw13amYkdUisxEeHKqIfDwhmJwfRGL0/N5kQ6
 PhNCceV5V1H1TjUHy//ZMP4KTlKLe3H2Lek+a/rP7Yr3HBtLdv2loYl3o
 9acKEtZ7IE6arsm3QwyY85+7lNcEov9KNkJ70Mn2XVkJWOEYyT/gIUQsZ
 R3vRuxxkJxlvAphoC0ECtSf86S0M0soUzUUTdeFbLfQB3HLslcXiU4D7A w==;
X-CSE-ConnectionGUID: 3Vtgs03bQ+O09VQJupz/uQ==
X-CSE-MsgGUID: EXaTkuuzTPKLwh+3XAuzew==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="13469469"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="13469469"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 02:25:28 -0700
X-CSE-ConnectionGUID: N9r93z0UQheyczTbfJLfVw==
X-CSE-MsgGUID: m9HMYag8SaeJB4J1/Lu4TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="67535639"
Received: from pltuser2-ms-7d25.iind.intel.com ([10.190.239.58])
 by fmviesa010.fm.intel.com with ESMTP; 11 Sep 2024 02:25:28 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH] drm/xe/pciid: Add new PCI id for ARL
Date: Wed, 11 Sep 2024 14:56:57 +0530
Message-Id: <20240911092657.2348978-1-dnyaneshwar.bhadane@intel.com>
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

Add new PCI id for ARL platform.

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 include/drm/intel/xe_pciids.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
index 79001afa7d27d..5758924a5b4ca 100644
--- a/include/drm/intel/xe_pciids.h
+++ b/include/drm/intel/xe_pciids.h
@@ -181,7 +181,8 @@
 	MACRO__(0x7D41, ## __VA_ARGS__),	\
 	MACRO__(0x7D51, ## __VA_ARGS__),        \
 	MACRO__(0x7D67, ## __VA_ARGS__),	\
-	MACRO__(0x7DD1, ## __VA_ARGS__)
+	MACRO__(0x7DD1, ## __VA_ARGS__),	\
+	MACRO__(0xB650, ## __VA_ARGS__)
 
 /* MTL */
 #define XE_MTL_IDS(MACRO__, ...)		\
-- 
2.34.1

