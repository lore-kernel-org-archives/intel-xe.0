Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1220606A32D
	for <intel-xe@archiver.kernel.org>; Tue,  3 Nov 2026 10:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JuAaG8VY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871EE10F4D5;
	Tue,  3 Nov 2026 10:03:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AEB510F4B5;
 Tue,  3 Nov 2026 10:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793700227; x=1825236227;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=KyclV3LvhfGmRe2G/PY1jI0XPvwtJUw/A5HluN2cFsk=;
 b=JuAaG8VYgd7OG5jVEyf/VmTPRwcgX7BP/MHAwhZurkYnuZxfxKJjajH3
 tzAcoLgMOsz5UyaK80Fh2EQUbRE5AjBaTdELdN2dnQEXBB8ZOWrnuHcVZ
 leQn17DzbCGtEw6NkJdAFUg00pvTRA9Jbq54/RLaDMRTtVKyBXoZrHw8Z
 JsCB0S1/A9CuE4bSmEwHXKu1aHt4QUBujviAlxKReGWPsrdd6K/HrXd8f
 zl1lHZUPZ5cBf6pxudMLf/iFARQ2wV5bcctq9r/CAm7zKvy+POB2Z+aiT
 2ki4EcpYredWUnbODv6D4gtAHqLiVxsDmPXID2+CWPiGxXpY39wn930PP w==;
X-CSE-ConnectionGUID: KCZ8ASw7QEipvpok7i6Fkw==
X-CSE-MsgGUID: 0kaw58J/StCZPN/IgGkIjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2296976"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2296976"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 02:03:47 -0800
X-CSE-ConnectionGUID: Q+vm0g4dTymeIOKhjgvObg==
X-CSE-MsgGUID: GaA110dBTLqfT8w6W0RxoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6718605"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa001.fm.intel.com with ESMTP; 03 Nov 2026 02:03:44 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 03 Nov 2026 15:28:19 +0530
Subject: [PATCH v4 4/7] drm/i915/display: Add HAS_DP_SYMBOL_TG()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-vlk-64036-dp-symbol-tg-v4-4-6cf8a588b54c@intel.com>
References: <20261103-vlk-64036-dp-symbol-tg-v4-0-6cf8a588b54c@intel.com>
In-Reply-To: <20261103-vlk-64036-dp-symbol-tg-v4-0-6cf8a588b54c@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 chaitanya.kumar.borah@intel.com, uma.shankar@intel.com, 
 suraj.kandpal@intel.com, Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a macro for the display versions with the DP link layer (LL) symbol
based timing generator.

Bspec: 68922
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_device.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index 7121e7cd95124f3df88fa39f4307db4a209feea1..9c4cafd15c19c39bc0403a05c3b2da58adce1aee 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -169,6 +169,7 @@ struct intel_display_platforms {
 #define HAS_DOUBLE_WIDE(__display)	(DISPLAY_VER(__display) < 4)
 #define HAS_DP20(__display)		((__display)->platform.dg2 || DISPLAY_VER(__display) >= 14)
 #define HAS_DPT(__display)		(DISPLAY_VER(__display) >= 13)
+#define HAS_DP_SYMBOL_TG(__display)	(DISPLAY_VER(__display) >= 35)
 #define HAS_DP_MST(__display)		(DISPLAY_INFO(__display)->has_dp_mst)
 #define HAS_DSB(__display)		(DISPLAY_INFO(__display)->has_dsb)
 #define HAS_DSC(__display)		(DISPLAY_RUNTIME_INFO(__display)->has_dsc)

-- 
2.25.1

