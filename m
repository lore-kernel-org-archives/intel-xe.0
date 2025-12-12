Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682B6D59D77
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 17:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D80010E8D1;
	Fri, 12 Dec 2025 17:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hge8sviy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D854710E304
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 17:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765560904; x=1797096904;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7DhmGQBCDzUTE1K27Ey8+dwgecwaJuwi4tylroUGRP8=;
 b=Hge8sviyrRnQyDf45yUpuUEkhR1aAV/s/Pb/zlR5C42GRpq9aGBc0vdk
 Y/PlzMLrjNsuwucVZxKFBt7s9GRioLlRiH/Hn26KH+QMrhMEVUsREDIkk
 nyHJssKmATUyFm3fe2v7Ki+TS7s+dNbIlbgFPKqJKyfvZ8lcUFmKh39If
 s+spSDvixhFH4J/R8W4XFlkubyUit4LXcEYAI86bKkrL4M+vXpXHm4SZu
 eHUnL8uN8sSHugAXw4HYOkq/F+BaZ9IpiYZZ+PqYsKv2HVMeOwtZHByct
 MgYq4CPS55VTlKuVDonxYvV8FlsDfY62wTTqmtjEBP9QPgA3jfiMMmZfJ w==;
X-CSE-ConnectionGUID: eO0ZgW00QayZMjMf1jzDxA==
X-CSE-MsgGUID: nLxzn1DhRIyrcQPgFtj9iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71414745"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="71414745"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 09:35:03 -0800
X-CSE-ConnectionGUID: F/KlCor9T/6QWK1rMXHx9g==
X-CSE-MsgGUID: Nw6/l5ohR8yhaOjDEJAMWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="197205044"
Received: from mrbroom-desk1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.20.17])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 09:35:02 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH 0/3] PF: Add handling for new adverse event thresholds
Date: Fri, 12 Dec 2025 18:34:46 +0100
Message-ID: <20251212173449.192639-1-michal.wajdeczko@intel.com>
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

We want to extend our macro-based KLV list definitions with new
information about the version from which given KLV is supported.

Instead of using magic version like 0.0.0 for legacy KLVs, add
utility IF_ARGS macro that can be used in code generators to emit
different code based on the presence of any additional arguments.

This series cherry-picks one patch from the EGS series [1] and
can be merged separately.

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

[1] https://patchwork.freedesktop.org/series/158142/#rev3

Daniele Ceraolo Spurio (1):
  drm/xe/pf: Add handling for MLRC adverse event threshold

Michal Wajdeczko (2):
  drm/xe: Introduce IF_ARGS macro utility
  drm/xe/pf: Prepare for new threshold KLVs

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  9 ++++
 drivers/gpu/drm/xe/tests/xe_args_test.c       | 53 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_args.h                  | 18 +++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 20 ++++---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  9 ++--
 drivers/gpu/drm/xe/xe_guc.h                   | 18 +++++++
 .../drm/xe/xe_guc_klv_thresholds_set_types.h  |  6 +++
 7 files changed, 123 insertions(+), 10 deletions(-)

-- 
2.47.1

