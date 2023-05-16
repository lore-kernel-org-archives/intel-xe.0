Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E167BC77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 13:32:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1FEF10E1F0;
	Tue, 16 May 2023 13:32:59 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24BD410E0A6
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 13:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684243976; x=1715779976;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rNIJxbYqttxr9vblH/Ij3ARNbrmoW9tXakHQ38TSZ3Y=;
 b=bCbLoJQHlc73jOzejKeZgud6uQ7zpTsGagq4u2uM07V4Tz1fmM8S5Wgn
 TdRo7fKi9b3x+Oc3aWFLKHAB7yd84pudDejZi8fZKEis+8lRPllkSwXXl
 zSHFkbyWbfBQpNuk7wXBF59nEK9UHKIJux4LDOX6e51eH0ykurUwNFeeM
 w46qR42tngpaBgb+3o+aN6fTArH+3dFi6JWEbt3nnHM+g+51SxZ2yUSt1
 lENYogisodC93avnedxkUI5QF6HnCV4puArOtfzshU1ZVnXudJIminQNl
 dxX/plP8G03clhgNAj8h4ntdQS4BW6HTr5Zoutzoc9bAukz4UxU2g5r1o A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="353758177"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="353758177"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 06:32:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="875621823"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="875621823"
Received: from khach-mobl.ger.corp.intel.com (HELO localhost) ([10.252.49.69])
 by orsmga005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 06:32:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 16 May 2023 16:32:30 +0300
Message-Id: <20230516133234.2778034-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/4] drm/xe: use hotplug irq code from i915
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Use hotplug irq code from i915 instead of copy-paste.

The same for rest of the display irq code to follow, there were more
issues with that.

BR,
Jani.

Jani Nikula (4):
  drm/i915/irq: relocate gmbus and dp aux irq handlers
  drm/i915/irq: convert gen8_de_irq_handler() to void
  drm/i915/irq: split out hotplug irq handling
  fixup! drm/xe/display: Implement display support

 drivers/gpu/drm/i915/Makefile                 |    1 +
 drivers/gpu/drm/i915/display/intel_crt.c      |    1 +
 drivers/gpu/drm/i915/display/intel_dp.c       |    1 +
 drivers/gpu/drm/i915/display/intel_dp_aux.c   |    5 +
 drivers/gpu/drm/i915/display/intel_dp_aux.h   |    3 +
 drivers/gpu/drm/i915/display/intel_gmbus.c    |    5 +
 drivers/gpu/drm/i915/display/intel_gmbus.h    |    2 +
 drivers/gpu/drm/i915/display/intel_hotplug.c  |    1 +
 .../gpu/drm/i915/display/intel_hotplug_irq.c  | 1442 ++++++++++++++++
 .../gpu/drm/i915/display/intel_hotplug_irq.h  |   35 +
 drivers/gpu/drm/i915/i915_irq.c               | 1522 +----------------
 drivers/gpu/drm/i915/i915_irq.h               |   12 +-
 drivers/gpu/drm/xe/Makefile                   |    1 +
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h |    1 +
 drivers/gpu/drm/xe/display/ext/i915_irq.c     |  579 +------
 drivers/gpu/drm/xe/display/ext/i915_irq.h     |   11 +-
 drivers/gpu/drm/xe/xe_device_types.h          |    6 +-
 17 files changed, 1598 insertions(+), 2030 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_hotplug_irq.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_hotplug_irq.h

-- 
2.39.2

