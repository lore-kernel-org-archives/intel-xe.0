Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C76C5B572
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 14:05:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79DD10E464;
	Wed, 19 Aug 2026 14:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EANw8Em4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA4210E14A;
 Wed, 19 Aug 2026 14:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787148319; x=1818684319;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ucjcoGDwzjv4BxbbW2UKeAHcc+/uoJ/ymva2SDCA6+o=;
 b=EANw8Em4JUM5fw0/01SHeL4P2PyG4D1O+g8MLq4WdtuSpofmFrHY0jGw
 wH0bQGPWtjRb+noYOM5RsbguM7Q1mHUPWYvLD2MFOVWP9ZgXSacpqICc8
 O/IJILA+YB5ZwKmKwR1EYH1cZbUMhyRk96rJthbZHxgglfeDwHjzmGEBp
 Td80WoJ5P+1MuMQ0bglj7uM9pj5aO4g5J+WcBwsRx3/9H3EQ44+Qn0IYZ
 9wZGFlIQ7Ux9t99iW1aU9mpV4fmKVDGftdZnmKvNwCdrIyF/eX6qZeSMl
 2SQBPtLhNV+1fPB9n/eDBVVGaGkuc6RWi9V3dTmyG+EVjv/qbxRMCJBuM Q==;
X-CSE-ConnectionGUID: r58yXgByRuGTMYMjIK+Cwg==
X-CSE-MsgGUID: jVrkq1cjQY+ABmzaevN23g==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87582400"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="87582400"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 07:05:18 -0700
X-CSE-ConnectionGUID: AlAOv4YNQxWB2nZD2b+qeQ==
X-CSE-MsgGUID: bSgwB1m6TT6itsVIyzJAZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="259393228"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.152])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 07:05:16 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, maarten.lankhorst@linux.intel.com,
 ville.syrjala@linux.intel.com
Subject: [PATCH 0/4] drm/{i915,
 xe}/display: another stab at i915_fence_timeout() removal
Date: Wed, 19 Aug 2026 17:05:09 +0300
Message-ID: <cover.1787148235.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
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

Another go, with cleanups first.

Jani Nikula (4):
  drm/i915/display: use struct intel_atomic_state *state variable naming
  drm/i915/display: reduce indent in intel_atomic_commit_fence_wait()
  drm/i915/display: debug log about fence wait timeouts and other errors
  drm/i915/display: use fixed 10 second timeout for fence wait

 drivers/gpu/drm/i915/display/intel_display.c  | 25 +++++++++++--------
 .../drm/xe/compat-i915-headers/i915_config.h  | 16 ------------
 2 files changed, 15 insertions(+), 26 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_config.h

-- 
2.47.3

