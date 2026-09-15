Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7A7C88E7D
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 20:09:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5A710E2CE;
	Tue, 15 Sep 2026 20:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mLICYgMz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E97610E2FC;
 Tue, 15 Sep 2026 20:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789502985; x=1821038985;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2ymeHKuWNN0J+r3JW9LLTALQL98YlvOh8oz7TMhptI4=;
 b=mLICYgMzwPddP3rab1kiDzdYk28EypCowwJ39P9jYQSBDJfEPbZJsRTW
 8iajhHQMtQSIKglkfD+651IfwzvdtETWA8zZUesiQNdFQBuCA+ORZu7Lu
 QhEUxFsTrxoGUkFSQi6cN5FXbg8dAeTFomM6PwQoRNN4xwIjooxKglfZx
 +gw+dXfDDvL4SQf3OVxn8ZAvZygsyeXZX45VSxU64UDQZK44RXDSMw8be
 SJwelGj98hBV/Ns3c0QfZCxyobfNOR1+VRigldVdFOVdf384jwhikwnGN
 ED89TI0z01Cuuq4ZjWwuBST01DVdBKQ62XHEnm0tpVy+W+pPgytzaF+Ef w==;
X-CSE-ConnectionGUID: JMWEbvURQeGCOtISL+Fw/Q==
X-CSE-MsgGUID: EXkuLnOnRW66MOc6G46cNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89015005"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89015005"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 13:09:44 -0700
X-CSE-ConnectionGUID: 5sM7Ye/dQ8eB4rbkUS6ppA==
X-CSE-MsgGUID: ogpKPzB7RqeHcg4r+a9Arw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="272644406"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.243])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 13:09:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 04/10] drm/intel: add intel_gtt_view_is_partial() for
 completeness
Date: Tue, 15 Sep 2026 23:09:15 +0300
Message-ID: <4f277bb8560090abc588e3a440e2d6467515e71b.1789502902.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789502902.git.jani.nikula@intel.com>
References: <cover.1789502902.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

There's a helper for all other view types, add one for
intel_gtt_view_is_partial() too.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/intel/gtt_view_types.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/drm/intel/gtt_view_types.h b/include/drm/intel/gtt_view_types.h
index 2f1793a31b1a..d235a3ad50c3 100644
--- a/include/drm/intel/gtt_view_types.h
+++ b/include/drm/intel/gtt_view_types.h
@@ -71,4 +71,9 @@ static inline bool intel_gtt_view_is_rotated(const struct intel_gtt_view *view)
 	return view->type == I915_GTT_VIEW_ROTATED;
 }
 
+static inline bool intel_gtt_view_is_partial(const struct intel_gtt_view *view)
+{
+	return view->type == I915_GTT_VIEW_PARTIAL;
+}
+
 #endif
-- 
2.47.3

