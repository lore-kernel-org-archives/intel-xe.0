Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCBBC07E97
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 15:15:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1FD10E56F;
	Tue, 28 Nov 2023 15:15:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003D210E56D
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 15:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701184522; x=1732720522;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mc6hVWyw3DCanXt5WmuogFo3I3PHzGEQXItVzscYwnc=;
 b=MCfTcdudgVGYAgOplx/iQDWymSIOsiGtrDmCb1IH/Bf7GOuH3sgm6kDF
 itGnkL/uVLuSSR3T2UcqNiTQdZ6uYpg58r/zt8VijUQ7hkA7Qv96j63Aq
 15cgiUy70Rvt2zSJ9/vGf/vKirMDJO2NpEZzFQss3T15TFEuc0b6qLMc4
 oXkbjjSjlotA0JfKYWBT5qqdoCPYCAgguwOGSEklyat7SM2234dWWFiyZ
 gAcOKteQpBGCEYx70F98qqDqIHN0OuqNMkfnh0t6G+sOO3IQh0QfSYd2L
 dk0jMD9nc2fwzbAa0zCjK0OCYB9V47XDDZC+ijDTElDsIU3v7UPu03cii g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="11637939"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="11637939"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 07:15:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="744937008"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="744937008"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.140.124])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 07:15:19 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Nov 2023 16:15:02 +0100
Message-Id: <20231128151507.1015-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/5] Introduce Local Memory Translation Table
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

The Local Memory Translation Table (LMTT) is required to support
SR-IOV on discrete GPUs. In addition to the core LMTT code also
introduce helpers that will be used by other upcoming SR-IOV code.

Michal Wajdeczko (5):
  drm/xe: Define DRM_XE_DEBUG_SRIOV config
  drm/xe: Introduce SR-IOV logging macros
  drm/xe/pf: Introduce Local Memory Translation Table
  drm/xe/kunit: Enable CONFIG_PCI_IOV in .kunitconfig
  drm/xe/kunit: Add test for LMTT operations

 drivers/gpu/drm/xe/.kunitconfig         |   1 +
 drivers/gpu/drm/xe/Kconfig.debug        |  10 +
 drivers/gpu/drm/xe/Makefile             |   5 +
 drivers/gpu/drm/xe/regs/xe_sriov_regs.h |  17 +
 drivers/gpu/drm/xe/tests/xe_lmtt_test.c |  73 ++++
 drivers/gpu/drm/xe/xe_device_types.h    |   8 +
 drivers/gpu/drm/xe/xe_gt.c              |  10 +
 drivers/gpu/drm/xe/xe_lmtt.c            | 506 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lmtt.h            |  27 ++
 drivers/gpu/drm/xe/xe_lmtt_2l.c         | 150 +++++++
 drivers/gpu/drm/xe/xe_lmtt_ml.c         | 161 ++++++++
 drivers/gpu/drm/xe/xe_lmtt_types.h      |  63 +++
 drivers/gpu/drm/xe/xe_sriov_printk.h    |  46 +++
 13 files changed, 1077 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_sriov_regs.h
 create mode 100644 drivers/gpu/drm/xe/tests/xe_lmtt_test.c
 create mode 100644 drivers/gpu/drm/xe/xe_lmtt.c
 create mode 100644 drivers/gpu/drm/xe/xe_lmtt.h
 create mode 100644 drivers/gpu/drm/xe/xe_lmtt_2l.c
 create mode 100644 drivers/gpu/drm/xe/xe_lmtt_ml.c
 create mode 100644 drivers/gpu/drm/xe/xe_lmtt_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_printk.h

-- 
2.25.1

