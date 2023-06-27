Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6C9EB64D9
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jun 2023 10:22:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F0910E2DB;
	Tue, 27 Jun 2023 10:22:46 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E24C10E2DB
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jun 2023 10:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687861364; x=1719397364;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=y7Zibe5PqP2SN1GJ37tt808sqFYWqE/nKpM22iTDXC4=;
 b=cA4zWpUmLIgyhHc8oZd7g5kIk3W3NokF7/3nurxWBv+Yeg95x6XDyHKh
 Z/+eg/tw+QIvdLoEJLQgSQIyhJreLimGAvt4Th0sdpmukJGlzk91iPoF+
 u5BvT+VG+mYE0kdF5jfR0HwE8DYLLFKG6KkSw0rXNavEFq2ck3I6h9bAb
 5wHqvNjhlAgkGkZTrngAC2Yj3Uf4Pujp24ZkTX7+bTjKTT+Cp4pgSrf3i
 e3XAzg3kkdRY/b3vGyWxu4sGuNjPW9n6PXG1xvIlomopCN8OaX1ie+SHj
 myrmSJ9tHfqDy33/yIqu8mHB4JyT6LtKaQtKVC8JtPOG2Llr9GTgvTqKI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="346295371"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="346295371"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 03:22:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="746146006"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="746146006"
Received: from jwerner6-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.48])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 03:22:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 27 Jun 2023 13:22:18 +0300
Message-Id: <20230627102223.260893-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/5] xe & i915 display integration, display irqs
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
Cc: jani.nikula@intel.com, lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Reuse i915 display/intel_display_irq.[ch] instead of duplicating
it. There's more to be done, but let's try to do small incremental
steps.

Jani Nikula (5):
  drm/i915/uncore: add intel_uncore_regs() helper
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support

 .../gpu/drm/i915/display/intel_display_irq.c  |   4 +-
 .../drm/i915/gt/intel_execlists_submission.c  |   6 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        |   8 +-
 drivers/gpu/drm/i915/gt/intel_sa_media.c      |   2 +-
 drivers/gpu/drm/i915/i915_irq.c               |  20 +-
 drivers/gpu/drm/i915/intel_uncore.h           |   5 +
 drivers/gpu/drm/i915/selftests/intel_uncore.c |   2 +-
 drivers/gpu/drm/xe/Makefile                   |   3 +-
 .../drm/xe/compat-i915-headers/gt/intel_rps.h |  11 +
 .../drm/xe/compat-i915-headers/intel_pcode.h  |  16 +-
 .../xe/compat-i915-headers/intel_runtime_pm.h |   7 +
 .../drm/xe/compat-i915-headers/intel_uncore.h |  82 +-
 drivers/gpu/drm/xe/display/ext/i915_irq.c     | 897 +-----------------
 drivers/gpu/drm/xe/display/ext/i915_irq.h     | 110 +--
 .../drm/xe/display/ext/intel_device_info.c    |   4 -
 drivers/gpu/drm/xe/xe_device_types.h          |   5 +-
 drivers/gpu/drm/xe/xe_display.c               |   1 +
 17 files changed, 175 insertions(+), 1008 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gt/intel_rps.h

-- 
2.39.2

