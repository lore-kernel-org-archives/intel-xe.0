Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8ADCDB482
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 06:57:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9777010E5BE;
	Fri, 13 Oct 2023 06:57:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0306D10E5BE
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 06:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697180275; x=1728716275;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7/gJA4ses7+/+SuLLvqsVLwhIH+sUF14BtV9Cf9oJiQ=;
 b=hEooShgSnNHqWddDkGqhN7UusTbJUYusBFK/dkNYwIBbja9j1UQYEBbs
 vVxWcrJMEKLSCCHI4iFhhphK5XYzzTIJNA1QglaHDv40v7QQnHXtfRxwR
 S4MxRzHZNEfgTcVlGOofeiKfHZE6pXfx2I5klOwGcP8Hn4udewox6asHE
 Nx8ZjpCS0jhJ+hS9Ajc211bxO7OJfw/tqi+APTAIY4jez/UilX+ZO41I2
 MKIjdB+CK596mSKgXzsZD8LLcsVwuYqq1x5VbocCNoYICBb+gdYZueGYP
 VsVexVDkmw2ftgtaAkbjptJ+M8ZloNBKjtnyW61eo0D6cA/Q7YEbjGu1P A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="384954550"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="384954550"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 23:57:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="731243479"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; d="scan'208";a="731243479"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orsmga006.jf.intel.com with ESMTP; 12 Oct 2023 23:57:48 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 13 Oct 2023 12:23:17 +0530
Message-Id: <20231013065323.2233783-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 0/6] Fix compatibility issue for intel_dmc
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
Cc: lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This series reverts hacky #ifdefs from intel_dmc

v2: Rebase
v3: Add compat headers as fixup patches to
    "drm/xe/display: Implement display support"
v4: Do not specify directory for firmware repository path

Chaitanya Kumar Borah (6):
  Revert "FIXME: drm/i915/dmc: xe way of getting at stepping"
  drm/i915: Add wrapper for getting display step
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support

 drivers/gpu/drm/i915/display/intel_dmc.c      | 19 ++----------------
 drivers/gpu/drm/i915/intel_step.c             |  5 +++++
 drivers/gpu/drm/i915/intel_step.h             |  1 +
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h |  4 +++-
 .../xe/compat-i915-headers/i915_gpu_error.h   | 17 ++++++++++++++++
 .../drm/xe/compat-i915-headers/intel_step.h   | 20 +++++++++++++++++++
 .../drm/xe/compat-i915-headers/intel_uc_fw.h  | 11 ++++++++++
 7 files changed, 59 insertions(+), 18 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h

-- 
2.25.1

