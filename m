Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9719DCAC5BE
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 15:59:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A0810EA99;
	Fri, 26 Sep 2025 15:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cq7Zji4b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B418C890B2
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 15:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758902390; x=1790438390;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tK1ZOUzQfOY8UPfjVgio/nsYne+Io+M4854poCAESCA=;
 b=Cq7Zji4bcOqyemcjOPHY3X21Y7W4JDNisG5+kjBbpmuKtdwaYeEyHMpZ
 hpr1QyhAf+5MSfF2l3Nf3kaix5ArcRqMtrKmfLYMzfr98qEpggjNFZQ1b
 rMsKNhb9aNcRpf2wqXL8N7uU8AFlK0/mipETJLLWIzulgTw/OjnAGFRap
 BH4GUb1v6iadW+PxAQKnAXYHEew4AYG8nAcPapy+dS5Mem1VoNxWPSdUl
 edJifwmOr3f3nvEfrVxJfvx5uoCZAFVJ93jBGuPAI5dAcmDDGy+WNjN7E
 SwEbgBzQq8wTriy112ve1cUYxfDd2897OqJv4JK2U5ot6lQZmhs2dCicM Q==;
X-CSE-ConnectionGUID: 6po0hJ1TRCOye0H3b2diyw==
X-CSE-MsgGUID: YIiwwoLoRhaWH0jiV8hBdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="63872185"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="63872185"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 08:59:49 -0700
X-CSE-ConnectionGUID: 13aDXiEZRi2Tj25FLuPRIA==
X-CSE-MsgGUID: ds9OG9R7Rk6M/f1Wb6E50w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="182914413"
Received: from dut4086lnl.fm.intel.com ([10.105.10.69])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 08:59:50 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 michal.wajdeczko@intel.com
Subject: [PATCH 0/5] drm/xe: Guard against NULL return for xe_device_get_gt 
Date: Fri, 26 Sep 2025 15:59:49 +0000
Message-ID: <20250926155948.145934-7-jonathan.cavitt@intel.com>
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

Static analysis reveals the following issue:
xe_device_get_gt is theoretically able to return NULL in some cases, but
several use cases don't check the return value before performing a
dereference, resulting in a NULL pointer dereference.

In many cases, this can be prevented by using xe_root_mmio_gt instead of
xe_device_get_gt.  Add guards for all other cases.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Jonathan Cavitt (5):
  drm/xe: Guard against NULL GT in xe_sriov_vf.c
  drm/xe: Guard against NULL GT in xe_pmu.c
  drm/xe: Don't call xe_device_get_gt twice in xe_hw_engine_lookup
  drm/xe: Guard against NULL GT in xe_guc.c
  drm/xe/tests: Use xe_root_mmio_gt instead of xe_device_get_gt

 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c   | 2 +-
 drivers/gpu/drm/xe/tests/xe_guc_db_mgr_test.c | 2 +-
 drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c    | 2 +-
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 2 +-
 drivers/gpu/drm/xe/tests/xe_guc_relay_test.c  | 2 +-
 drivers/gpu/drm/xe/xe_guc.c                   | 2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             | 3 +--
 drivers/gpu/drm/xe/xe_pmu.c                   | 9 ++++++++-
 drivers/gpu/drm/xe/xe_sriov_vf.c              | 7 ++++++-
 9 files changed, 21 insertions(+), 10 deletions(-)

-- 
2.43.0

