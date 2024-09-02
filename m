Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F0CCA0ED3
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 17:14:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7407510E371;
	Mon,  2 Sep 2024 17:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DldRc3LF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B2410E36E;
 Mon,  2 Sep 2024 17:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725297282; x=1756833282;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GC88TiFkoRFvKoZap2MfbrqdfoY3q5hXlYxJQQVkJsY=;
 b=DldRc3LFEEAtFLtqQ3y/5coVhG0eXJVwGoqlv1tIb4wR+4Zgr+z8TWCz
 ll877R7MDkvV0Xjti8Q48uXtxPLlm7B3h4VOmrctCZceL2l/mBaPKUQod
 DQspXcOdXLu4qDZrdcGkvmJgJFVaVlpwJUigeCJ6HrwbVYwezHZtTzXTj
 eiij2jy7aRVm5BSRC75ppN3pr2gkqafSb/VxmAU4VM1ZPy9porKkJXx4n
 mB/X6cF1oE418nfP6C4vofK55IJRkJwFOBJTGKFBRArG4neBPzvxS/eYl
 sux64EtDA8UGy5MssQLNJ6rV1OFxhrS7gUUp0Ym/Xs4wX8NYFXUd4UfRx w==;
X-CSE-ConnectionGUID: NadLUy5WTHmJEub2Bi8+pw==
X-CSE-MsgGUID: mBpiKScJQM+hr69b7rToSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="23690151"
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; d="scan'208";a="23690151"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 10:14:42 -0700
X-CSE-ConnectionGUID: si2MceDLSnSeyGYmFVw2gg==
X-CSE-MsgGUID: mj67xxb8T7KIOvoKeignMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,196,1719903600"; d="scan'208";a="95382313"
Received: from ltuz-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.4])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 10:14:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	rodrigo.vivi@intel.com,
	lucas.demarchi@intel.com
Subject: [PATCH 3/8] drm/xe/pciids: add some missing ADL-N PCI IDs
Date: Mon,  2 Sep 2024 20:14:02 +0300
Message-Id: <5355d06812398b53decc25892c205768ba255de8.1725297097.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1725297097.git.jani.nikula@intel.com>
References: <cover.1725297097.git.jani.nikula@intel.com>
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

