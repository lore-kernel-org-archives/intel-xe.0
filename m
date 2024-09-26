Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39A0CDE025
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 16:57:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF42110E037;
	Thu, 26 Sep 2024 16:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HM7rJrEz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A04110EBB0;
 Thu, 26 Sep 2024 16:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727369875; x=1758905875;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Rwlir2Ekco1GUYaay2Eilaif2d8TZLV9sjAJ0hPrTc0=;
 b=HM7rJrEzM23I7tfBkbSgDj3K6E5/5Zr+cXi+NNkedBWEP3Dt+yP/4w13
 GHu1jyl1ofvmR+dUjgUXhX6P4HrhIbQ7e24lElV/ntu+BJGqq2EyAGVR6
 +9lz5qk8n3ZV0B+iKnWNNBqEgzX/DP03bYYMgIINtNuL+wMWQAO6T3RiJ
 OBPjVOuRpTAet4FCMiZOLu8xOqLKicGlKdm0WRd2iiykLrkMhNgGJCb97
 74Cs0lNmM1L172NAysTEvvOExg8f187aK0nceAplKPDphRABMkskXh71g
 XjFL+JpMq+5OuuXJQ6ytc/n9NdAheTv7RbDQBLl49QHd9KKI7uVF1BWJC w==;
X-CSE-ConnectionGUID: Z8jNiuhLSlqGF/EE6BL2pQ==
X-CSE-MsgGUID: e8qenlKgRnqIcwniu+5PdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26353664"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="26353664"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 09:57:54 -0700
X-CSE-ConnectionGUID: lxoe20loRia7P5oYCidLlw==
X-CSE-MsgGUID: foawyDHKQ76SAiQoK5FVeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="72543421"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.160])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 09:57:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 0/3] drm/i915/irq: clean up irq reset/init macro hacks
Date: Thu, 26 Sep 2024 19:57:45 +0300
Message-Id: <cover.1727369787.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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

Add a struct to hold IMR/IER/IIR registers, and pass them together
instead of the ugly macro hacks with macro name concatenation etc.

BR,
Jani.

Jani Nikula (3):
  drm/i915/irq: add struct i915_irq_regs triplet
  drm/i915/irq: remove GEN3_IRQ_RESET() and GEN3_IRQ_INIT() macros
  drm/i915/irq: remove GEN8_IRQ_RESET_NDX() and GEN8_IRQ_INIT_NDX()
    macros

 .../gpu/drm/i915/display/intel_display_irq.c  | 52 ++++++++--------
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        | 24 ++++----
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  4 ++
 drivers/gpu/drm/i915/i915_irq.c               | 59 +++++++++----------
 drivers/gpu/drm/i915/i915_irq.h               | 34 +----------
 drivers/gpu/drm/i915/i915_reg.h               | 53 +++++++++++++++++
 drivers/gpu/drm/i915/i915_reg_defs.h          | 10 ++++
 drivers/gpu/drm/xe/display/ext/i915_irq.c     | 31 +++++-----
 8 files changed, 150 insertions(+), 117 deletions(-)

-- 
2.39.2

