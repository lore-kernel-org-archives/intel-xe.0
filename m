Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8F5CD6E68
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 12:26:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B49E10E77B;
	Wed, 11 Oct 2023 12:26:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE24A10E77B
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 12:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697027201; x=1728563201;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ILkFhqlLPe9GKkmTai8rzkZyNRSz0yoWsYFuCEh/HiA=;
 b=XhW2g8FP+nq4v5RKOtXElyO0YKOTyA1ZYMsfQXNkJ42hGI+v0vv9Z8kl
 If8kYdClKWIm5zgGanUDWR2wBp/esWtlTnjwAr8Q5HhhzsPUu2m90bxBG
 cMwUu1P+XxoXtqTMFM4ihCXJwiVW/3L5rbUcP5I20Qpybjeot+Rbgvstd
 FKMyT7gLwzN49tA893v2XQpZcftTJHVWqmarJVOvl2a3IIziPHFj/WX8R
 OKCA+CeVPzxz1XmcblrpQ/xUu937qHHjiVHYHoUmHziRatmgesl+xP2NF
 DyLMqew3UYdch8hARiSzbYrwX8TtZM1RmysIpUmgxzvjexRHyFNY80ijh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="364010296"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="364010296"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 05:26:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="844543792"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="844543792"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Oct 2023 05:26:37 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 11 Oct 2023 17:52:09 +0530
Message-Id: <20231011122215.2025850-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/6] Fix compatibility issue for intel_dmc
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

This series reverts hacky #ifdefs from intel_dmc

Chaitanya Kumar Borah (6):
  Revert "FIXME: drm/i915/dmc: xe way of getting at stepping"
  drm/i915: Add wrapper for getting display step
  fixup! drm/xe/display: Implement display support
  drm/xe: Add intel_step.h compatibility header
  drm/xe: Add i915_gpu_error.h compatibility header
  drm/xe: Add intel_uc_fw.h compatibility header

 drivers/gpu/drm/i915/display/intel_dmc.c      | 19 ++----------------
 drivers/gpu/drm/i915/intel_step.c             |  5 +++++
 drivers/gpu/drm/i915/intel_step.h             |  1 +
 .../gpu/drm/xe/compat-i915-headers/i915_drv.h |  4 +++-
 .../xe/compat-i915-headers/i915_gpu_error.h   | 18 +++++++++++++++++
 .../drm/xe/compat-i915-headers/intel_step.h   | 20 +++++++++++++++++++
 .../drm/xe/compat-i915-headers/intel_uc_fw.h  | 12 +++++++++++
 7 files changed, 61 insertions(+), 18 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h

-- 
2.25.1

