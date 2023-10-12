Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2522CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 12:58:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF4610E4C9;
	Thu, 12 Oct 2023 12:58:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618DA10E4C9
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 12:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697115519; x=1728651519;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R/Jyuezvbi7fVtyBOyir3U6PURTujrDnQuHtuWZ/bKs=;
 b=YKZyC0jVtJpm7rCuH/uy2gxc61UWm7rQIjxFUqUKAPiogFsca6bazW+r
 X4BFHotFUklj6SgNT9SDBfPB6KFDjYOGfR0pPoQg1NSzVSwfwLNm/s14r
 afQILURZIpFthuv2KxFt6IEa1Ez+rtKSkNhOg9aIO4LyaFCXPHzLJpQ1G
 qBkBJNuqpYUqkmfGTcEmGrHHolkNcFtWb+tbXIKrwsWET55169kIp896P
 b7OwiviLfPDqUWhKMfvYco9mBGOEVN9rZgcy+ckYiS+3H6nbBXGXKKqkb
 xIIH3YLRCaKma5wxYkRNAjmwsdtIz7k1edZElCDnBgQwYoH8uockj0t2W g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375259049"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="375259049"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 05:58:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1001541436"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="1001541436"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmsmga006.fm.intel.com with ESMTP; 12 Oct 2023 05:58:36 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 12 Oct 2023 18:24:04 +0530
Message-Id: <20231012125410.2127337-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/6] Fix compatibility issue for intel_dmc
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

v2: Rebase
v3: Add compat headers as fixup patches to
    "drm/xe/display: Implement display support"

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

