Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68444606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 07:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NJhXadyU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EE4112031;
	Thu, 29 Oct 2026 07:56:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76491112016;
 Thu, 29 Oct 2026 07:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793260550; x=1824796550;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=KyclV3LvhfGmRe2G/PY1jI0XPvwtJUw/A5HluN2cFsk=;
 b=NJhXadyU86t1WdPkNjXNMxUyh5wAApb9WAE4M3vItGuECJncpH/HqyLu
 2yfDyTi6j5gPDg1N84F0WXiAlIBEfAkNiR/hGCvpiGK+WuSrMgNmjPt6K
 Tc1Uv9q2KLuzqhHHXM8zlhv9uMK9mvjmdBs+sXrplTOSOTx2GF827WYSr
 jFEcRIf6vsQN8IPxBqjKR9nyBnp9S7Io5bUFElVBVLWknNqq65F6LVTjj
 gsGzKvOwVhYEnU9uooMJibIpdNzZ50PjKYJxk7cjOR+z8sB4HUcHXSrN1
 K2KVks7JhjDJlbGgLc6kHWiSR+UnFtthm96atIli+6XdID6Jto7w0+K39 w==;
X-CSE-ConnectionGUID: sptZNvDTTSShyBg9o3k+/w==
X-CSE-MsgGUID: PzksbgrgR3+fZsn9QUOV6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1873326"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1873326"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 00:55:50 -0700
X-CSE-ConnectionGUID: TzvPwF/YQmqylSdptVczIA==
X-CSE-MsgGUID: TB3KqTPhTF+CwLeWi+92fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5079929"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa004.fm.intel.com with ESMTP; 29 Oct 2026 00:55:48 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Thu, 29 Oct 2026 13:20:30 +0530
Subject: [PATCH v3 4/7] drm/i915/display: Add HAS_DP_SYMBOL_TG()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-vlk-64036-dp-symbol-tg-v3-4-69022424ef17@intel.com>
References: <20261029-vlk-64036-dp-symbol-tg-v3-0-69022424ef17@intel.com>
In-Reply-To: <20261029-vlk-64036-dp-symbol-tg-v3-0-69022424ef17@intel.com>
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
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

