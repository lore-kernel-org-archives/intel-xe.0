Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03092EDB7E7
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 10:04:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51E810E3A1;
	Tue,  7 Apr 2026 10:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hTMIxI4q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFBA10E3A1;
 Tue,  7 Apr 2026 10:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775556284; x=1807092284;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=08LsQ0QB2YNVcMVETmHaDmF+sCQipjgLUuMdhPxKN10=;
 b=hTMIxI4qNJZv8hK3Dsc49EluIFKHqiOWWQNr1gb3khsvLv3fTDS/2U0J
 SZ9lkP3Jq5uBB/3JdGGWCsZWRk0RSyd+KwkBDK5jKxqmIHtG+yttXLx64
 gf7S0pqkxz8zaWtbfXas80cnyVkv/ZkGhab8fxGUdXHfrc542ozh/MI7o
 J3B9N9cxkVu/64TKYNQ95Cx51F/QsyDXp4yHT7Scow2vz4Tzm0fxn1NLc
 eXxI5eKoc9TBZgbIb5nv95DVA9fD+CT2ixROWdZ0OnRp1SpWYkgCTwKoL
 UMtObu/61n9f0B+SXSkvrvKRsO5/H0Rw1hsn9Pmb2uzsS+NgWVV6iehLu w==;
X-CSE-ConnectionGUID: xpYJ8KAdQkSSvHy7Q9a1gA==
X-CSE-MsgGUID: sWI42+KxRdWXB5rn/r6JIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76705445"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="76705445"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 03:04:43 -0700
X-CSE-ConnectionGUID: rFvQ+OCHRQ+BcSX43/1blg==
X-CSE-MsgGUID: kJHqoaiCReGKucWYb67sAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="224936657"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.244])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 03:04:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH 0/3] drm/i915/pin: refactor to i915 core
Date: Tue,  7 Apr 2026 13:04:34 +0300
Message-ID: <cover.1775556190.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
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

Something I started last week before Ville said he'd look into the whole
pin stuff. If this is helpful, let's merge, but if it's in the way, it
was pretty quick and can be thrown away.

BR,
Jani.

Jani Nikula (3):
  drm/i915: move intel_fb_pin.c to i915_fb_pin.c
  drm/i915/pin: s/dev_priv/i915/ and drop struct drm_device usage
  drm/i915/pin: switch to i915 core runtime pm

 drivers/gpu/drm/i915/Makefile                 |  2 +-
 .../{display/intel_fb_pin.c => i915_fb_pin.c} | 44 +++++++++----------
 2 files changed, 22 insertions(+), 24 deletions(-)
 rename drivers/gpu/drm/i915/{display/intel_fb_pin.c => i915_fb_pin.c} (90%)

-- 
2.47.3

