Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6923CCD3431
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 09:47:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2561A10E71E;
	Wed,  4 Sep 2024 09:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jdikEft4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3960F10E71E
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 09:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725443239; x=1756979239;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GC88TiFkoRFvKoZap2MfbrqdfoY3q5hXlYxJQQVkJsY=;
 b=jdikEft49hfhBx6EGDJqJP21O8wIHX1pTBrdW2UXsWanJKGO0W1hFYsJ
 OXCq9/zEAQ9cJ33Du36GQ1XJVeLCqoO2tlrJGmknc0poJt3944dISmBww
 bXEqJZPuMjhCYE6P6rQvrrJsGlgHHfx6XB0oWvt9rBZE9NztX7p6CxVfT
 XZDKu6J9+rxw4lfduJU2wzZti8umiZmtxqmZtErqXADNfrYVM68tI2kG8
 CyggaikYYE4ZZg8H/GxfnJp/9NOWtBvntzmwLX5Qxtmw55P2IYHEaCfsc
 A5RHC2OIJzqGVo47LfPoLpxBCvaFkCBdkWNFh4BK7DtbPekLHAqZuJJ9F A==;
X-CSE-ConnectionGUID: 2YW1LFiTSmeYkqNXXhJonQ==
X-CSE-MsgGUID: BJx2nww7Sca9HoTwTtkm7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="41564307"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="41564307"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 02:47:18 -0700
X-CSE-ConnectionGUID: hljO/DtXQjini1NdiS4TxQ==
X-CSE-MsgGUID: 1Q7ABqQzTTePWOKk1KHUcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="96013975"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.18])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 02:47:12 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH 1/3] drm/xe/pciids: add some missing ADL-N PCI IDs
Date: Wed,  4 Sep 2024 12:46:47 +0300
Message-Id: <47d543393e4026588401a03c4e3ce12ce29780e3.1725443121.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1725443121.git.jani.nikula@intel.com>
References: <cover.1725443121.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Similar to commit 425b463859ed ("drm/i915: Update ADL-N PCI IDs").

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/intel/xe_pciids.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
index 73d972a8aca1..41617c5ac6ab 100644
--- a/include/drm/intel/xe_pciids.h
+++ b/include/drm/intel/xe_pciids.h
@@ -97,7 +97,9 @@
 #define XE_ADLN_IDS(MACRO__, ...)		\
 	MACRO__(0x46D0, ## __VA_ARGS__),	\
 	MACRO__(0x46D1, ## __VA_ARGS__),	\
-	MACRO__(0x46D2, ## __VA_ARGS__)
+	MACRO__(0x46D2, ## __VA_ARGS__),	\
+	MACRO__(0x46D3, ## __VA_ARGS__),	\
+	MACRO__(0x46D4, ## __VA_ARGS__)
 
 /* RPL-S */
 #define XE_RPLS_IDS(MACRO__, ...)		\
-- 
2.39.2

