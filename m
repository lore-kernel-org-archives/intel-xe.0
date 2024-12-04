Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E89EE77170
	for <intel-xe@archiver.kernel.org>; Wed,  4 Dec 2024 16:49:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E58D10E092;
	Wed,  4 Dec 2024 16:49:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hIHL7x/i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CC010E092
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Dec 2024 16:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733330988; x=1764866988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KEi6Lqm1htQlU7moSsVVdQ9vV/6xbmr71xqCGDRu1os=;
 b=hIHL7x/ivgBgRh4Iq/1KACTgHD8q1usMUECBI/6n9G9GpD+u804dOtqW
 uveBRgLA4XukOMo1aCPgyyz8ih/bOlj6I+9MRSHfEZf3otcXkso2IJyOC
 jjFPy2TXjhgyDJsJ4uFoWUZLDmRkIxZbIvWhvJloyIrhfQ3e05FmF2Epx
 tDcIJ7boy9OtYlj3dEdf/WAb4IGX+vineMkw+/kiIcP+wzOhfkiKKoexG
 x8M53X94WYcxO9j8MfliLLsKJZc+34w6EaUIn6UlPhkqQmXvn1XAQxjVl
 fc/0RxzBEpclrVEE5EKwnrb25QUYJ72RDhXrcBknk+FxlIQyjY2KClRhn Q==;
X-CSE-ConnectionGUID: +WuCK9HkTGm5UXeLDrnrKg==
X-CSE-MsgGUID: RFboado7Tr2POhGGyIeLVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44273668"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="44273668"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 08:49:48 -0800
X-CSE-ConnectionGUID: /bT2UV5WSTqXwdqi2sMSQQ==
X-CSE-MsgGUID: cUAioTg7QUuFn6+FiDlgOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="98840567"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 08:49:46 -0800
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Piotr Piorkowski <piotr.piorkowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Michal Winiarski <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH] drm/xe/vf: Don't check has flat ccs in bios on VF
Date: Wed,  4 Dec 2024 16:40:59 +0000
Message-Id: <20241204164059.1366627-2-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241204164059.1366627-1-jakub1.kolakowski@intel.com>
References: <20241204164059.1366627-1-jakub1.kolakowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Don't check for flat ccs from VF-level as VF does not have direct
access to the register.

Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Suggested-by: Piotr Piorkowski <piotr.piorkowski@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piorkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 930bb2750e2e..5d827b07cf02 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -600,7 +600,7 @@ static int probe_has_flat_ccs(struct xe_device *xe)
 	u32 reg;
 
 	/* Always enabled/disabled, no runtime check to do */
-	if (GRAPHICS_VER(xe) < 20 || !xe->info.has_flat_ccs)
+	if (GRAPHICS_VER(xe) < 20 || !xe->info.has_flat_ccs || IS_SRIOV_VF(xe))
 		return 0;
 
 	gt = xe_root_mmio_gt(xe);
-- 
2.25.1

