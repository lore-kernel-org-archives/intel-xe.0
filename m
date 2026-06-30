Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747FCC43602
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 13:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B8510E50F;
	Tue, 30 Jun 2026 13:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mTCoVTd0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AEEB10E1A3
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 13:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782826004; x=1814362004;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cf/j5lTK49LcQxhP7927CcZm6zDz8g55nxPJI/BGtGg=;
 b=mTCoVTd03nWJgvwOQoq/qKAPEWtMSiNGJB6Ia8QsmdVOKeupEF4YS4gk
 f5qTSeYt0cFLo/Gq9G8/kg44AjhXyJLw1WgXD9q4HJca+DaJcB6vH+Xbe
 ysAiimEbIbHz8fVwxasQgKAxCvl3JX4MVje3SMi2H0dTh/w4tUooQmvFz
 J6pxfCJo8bm8gpzeX2c9xkUicRRj7gtS+CR14NTFjcOaDld94KuT7oz4V
 RgYDq7YTLOH7vbEMTkfWRY6uYBeAJd/lpkZ/vg6lphRrUpGwDxKt3LzTY
 ytMdj38Z8K6dQvwNVhCSyU31XyQKCUV/+fljtm7cXEW8J4qAdlJ2R1F3e Q==;
X-CSE-ConnectionGUID: SzJCOsSLRKCEmp6/lz8xLw==
X-CSE-MsgGUID: /gxhR9SwSAemb1wJ8nKgrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83623508"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="83623508"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 06:26:43 -0700
X-CSE-ConnectionGUID: tG5+QX8gT3OiFNq4ImSS6g==
X-CSE-MsgGUID: SdArxeDXQWG0z/WUKbuvxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="256182177"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 06:26:43 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 00/13] drm/xe: Add and use more KLV helpers
Date: Tue, 30 Jun 2026 15:26:19 +0200
Message-ID: <20260630132633.32804-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

During the VF migration, we already have a place where PF needs to prepare
some KLVs during the VF state save and also be able to parse them back on
the VF restore. Since we plan to extend that scenario by adding more KLVs
and we also plan to add a new scenario where encoding and parsing KLVs will
be required, introduce customized KLV helpers and add tests for them.

Michal Wajdeczko (13):
  drm/xe/guc: Allow to print single KLV
  drm/xe/guc: Prepare to print group KLVs
  drm/xe/guc: Add basic KLV encoding helpers
  drm/xe/guc: Add string KLV encoding helper
  drm/xe/guc: Add object KLV encoding helper
  drm/xe/guc: Add KLV parsing helper
  drm/xe/guc: Formalize Reserved KLVs
  drm/xe/tests: Add GuC KLV helpers basic tests
  drm/xe/tests: Add string encoding helper test
  drm/xe/tests: Add object encoding helper test
  drm/xe/tests: Add GuC KLV printer test
  drm/xe/tests: Add migration packet test
  drm/xe/pf: Handle migration descriptor using KLV helpers

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  17 +
 drivers/gpu/drm/xe/abi/xe_driver_klvs_abi.h   |  27 ++
 .../drm/xe/tests/xe_guc_klv_helpers_kunit.c   | 348 ++++++++++++++++++
 .../gpu/drm/xe/tests/xe_sriov_packet_kunit.c  |  83 +++++
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c       | 251 ++++++++++++-
 drivers/gpu/drm/xe/xe_guc_klv_helpers.h       |  10 +
 drivers/gpu/drm/xe/xe_sriov_packet.c          | 117 +++---
 7 files changed, 778 insertions(+), 75 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/abi/xe_driver_klvs_abi.h
 create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_sriov_packet_kunit.c

-- 
2.47.1

