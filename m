Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E961E80A9A
	for <intel-xe@archiver.kernel.org>; Wed, 27 Sep 2023 07:31:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E0810E399;
	Wed, 27 Sep 2023 07:31:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E79810E399
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Sep 2023 07:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695799900; x=1727335900;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2NfOmn4DuiJWs5FACTdlUW2zX9sRSnaAI4BuwmqsSRo=;
 b=KJTgcbG6k6BSVI+hqJDNfrC0/PmgFdvBLPUzOfuxe5LD/hUpnmnBJHZz
 3T81T3BpcsIsBchwQMH2OegtHqZbP6MbQSstYbCmn+CaJjgLNmgAYRBWF
 OvrNFcOEAsrN+rMcbEUYjeQXJLczawbsnxlUjN+ChJVhVVvjVJCz1y2e1
 uTpCB0VDzgREUnbCTj8he/xepGboyV3+iP/DZBpbIa06ExrhraySeLsrU
 TsQ6moc/77xe12vlsr573V7hRlL2LcVDhe+Vj5E31cJ9jcX8s+6FkBu7X
 +18IiV9aiYzoCE4u0M4Mo0d9hmBJP22oBoZbrRpKkBIcZ5nypefwo3TBY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="372091614"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="372091614"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 00:31:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="922684496"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="922684496"
Received: from petrovam-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.220.182])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 00:31:36 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 27 Sep 2023 10:31:22 +0300
Message-Id: <20230927073125.3825836-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 0/3] Xe dma fence handling on atomic commit
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This patch set is reverting current changes to fence handling during
atomic commit. A new compatibility header addressing lack of
i915_sw_fence implementation in Xe is introduced. This header contains
dma fence handling during atomic commit for Xe driver and interfaces
are following current i915_sw_fence implementation.

Additionally change to current atomic commit code and i915_sw_fence is
needed. This patch has to go to i915 upstream. It is needed due to
missing GT reset status in Xe driver. In case of i915 this status is
polled while waiting for dma fences and in case of GT reset atomic
commit is completed even if dma fences are not signalled. I'm not sure
how GT reset is supposed to be handled in case of Xe? Maybe dma fences
are signaled if GT reset occures?

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>

Jouni Högander (3):
  Revert "FIXME: drm/i915: fence stuff"
  drm/i915/display: Move fence completion wait away from display code
  fixup! drm/xe/display: Implement display support

 drivers/gpu/drm/i915/display/intel_atomic.c   |   2 -
 drivers/gpu/drm/i915/display/intel_display.c  |  50 +-------
 .../drm/i915/display/intel_display_types.h    |   3 +-
 drivers/gpu/drm/i915/i915_sw_fence.c          |  28 +++++
 drivers/gpu/drm/i915/i915_sw_fence.h          |   4 +
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h |   1 -
 .../xe/compat-i915-headers/i915_sw_fence.h    | 111 ++++++++++++++++++
 7 files changed, 145 insertions(+), 54 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_sw_fence.h

-- 
2.34.1

