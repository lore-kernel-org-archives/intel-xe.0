Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4879FCA5FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 15:00:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF9210F48A;
	Wed, 30 Sep 2026 15:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lh5wUb2E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697EF10F478;
 Wed, 30 Sep 2026 15:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790780431; x=1822316431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QMDZ0KJ/cPD+0pQShs1pbL1G1S3N3A/KEWMyvHxfmPM=;
 b=Lh5wUb2ERdOxNTr6uCCFDqhzBorzJQK6T08uRu8YaJoDP2w9Nv4MbEAX
 K6i0DTcxtskNjguAMsW2lhwlUW/VeV4U5XB8/7Nb41NXu5vnQdFFXYzyi
 bTHgqWY/XPFaK9qASpCdKDWr/OASAfFezrY/T9wR3M73gSCb+/igyO6AY
 DB/zYy/PhOloWnVwEE1VN8Sx73Kuo1woVaE9jj7ooaoBH31TEGalbmoXF
 C5FfHgDcOUxmP/akjlb05ncANVU4MjWgyThc8PXD75QfpIlZAFWLfNcWL
 vYKrfbehgynPYV9WNWxsfFQgo4jlUmYaGYtVtAPSsnqGt2ButwiJJOl3I g==;
X-CSE-ConnectionGUID: UvNgPVWcRr60tyf0p9Xczg==
X-CSE-MsgGUID: 27XV1ygsRSaUYhj7x0uoDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="107904923"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="107904923"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 08:00:30 -0700
X-CSE-ConnectionGUID: XM7foprpT6SI3aVHY2GRXw==
X-CSE-MsgGUID: 0n7Gj3woTWyTmMLCT+64xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="275752974"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.107])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 08:00:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, maarten.lankhorst@linux.intel.com,
 ville.syrjala@linux.intel.com, Maarten Lankhorst <dev@lankhorst.se>
Subject: [CI v2 04/10] drm/intel: add intel_gtt_view_is_partial() for
 completeness
Date: Wed, 30 Sep 2026 18:00:00 +0300
Message-ID: <be522421df45be071ec8f298f4d5b7a49fa6bab8.1790780340.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790780340.git.jani.nikula@intel.com>
References: <cover.1790780340.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/intel/gtt_view_types.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/drm/intel/gtt_view_types.h b/include/drm/intel/gtt_view_types.h
index 3ad2a1026db1..d77292897d64 100644
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
 #endif /* __DRM_INTEL_GTT_VIEW_TYPES_H__ */
-- 
2.47.3

