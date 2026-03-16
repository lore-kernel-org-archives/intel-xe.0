Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DEAEFCBBB
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 06:41:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B664010E0B1;
	Mon, 16 Mar 2026 06:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mo6NUx8h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5792E10E0B1
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Mar 2026 06:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773643269; x=1805179269;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yMqprRqv1F9/jVWB/6Wjau8MrdRjDCUVHr2vnX1s86k=;
 b=mo6NUx8hPfrzCzNwSXkoXE0RAFYgDrx1QtH45MkHlwqdAnHGtP+0u645
 DTMvwE5N8i6iXdXJ6BW7z8p9Qm4lkNjP7IlkbJVmS9R0t0nPon0ZRmUtS
 kwKWti0G6nAOXnsyiBUYEttbvX9/0n3c/mWvyCNYh9YyhjRKkJqhFrLBf
 4L9TiTRCMzoqXEPcnQ3lRNyZfTf6FlTFSguz6PXKk7/TPB86wtxyoNgBN
 5Rt5pL7jIcy4uEsxlYby31MQwtZAoTOXJ1Bf3QEfwJDPM7YPKQ1PjacxX
 4Pn4aQdsatiIZ4bNPVZ0NZpDoQggnWZfVi9PM7T540p2JsGenf1/rYuUJ A==;
X-CSE-ConnectionGUID: QX38RvzxRU6Ql59u/tNIhQ==
X-CSE-MsgGUID: di88G1W3TR64nirwOsjdjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="100111374"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="100111374"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2026 23:41:09 -0700
X-CSE-ConnectionGUID: qmrDKGfPSWukv2Ay5/RcDg==
X-CSE-MsgGUID: T7yqXYVWTR2YgpZNCeGCrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="225929012"
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by orviesa003.jf.intel.com with ESMTP; 15 Mar 2026 23:41:07 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [RFC v6 0/1] Do not create drm device for PF only admin mode
Date: Mon, 16 Mar 2026 06:41:01 +0000
Message-ID: <20260316064100.2542412-3-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

When the PF is configured for admin‑only mode, it is restricted to
management functions and should not allow users to run workloads.
Suppress device capabilities to userspace in admin-only PF mode.

---
V5 -> V6:
- Updated commit message.
- Make content of query_engines and query_mem_regions as empty in
admin-only PF mode instead of query size as zero.
- Allow all other query IOCTLs excepts query_engines and query_mem_regions
(Michal Wajdeczko).

V4 -> V5:
- Updated commit message (Matt B).
- Introduced new driver_admin_only_pf structure (Michal Wajdeczko).
- Updated all query configs (Michal Wajdeczko).
- Renamed xe_device_is_admin_only() to xe_device_is_admin_only_pf()
- Fixed other review comments (Michal Wajdeczko).

V3 -> V4:
- Suppressed device capabilities in admin-only PF mode. (Wajdeczko)

V2 -> V3:
- Introduced new helper function xe_debugfs_create_files() to create
debugfs entries based on admin_only_pf mode or normal mode.

V1 -> V2:
- Rebased to latest drm-tip.
- Update update_minor_dev() to debugfs_minor_dev().

Satyanarayana K V P (1):
  drm/xe/pf: Restrict device query responses in admin-only PF mode

 drivers/gpu/drm/xe/xe_device.c | 60 +++++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_device.h |  1 +
 drivers/gpu/drm/xe/xe_query.c  |  6 ++++
 3 files changed, 63 insertions(+), 4 deletions(-)

-- 
2.43.0

