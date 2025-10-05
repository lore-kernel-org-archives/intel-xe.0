Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7628CAC5B8
	for <intel-xe@archiver.kernel.org>; Sun,  5 Oct 2025 13:36:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 399A210E2A6;
	Sun,  5 Oct 2025 13:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RNpoFEuY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8D610E2A6
 for <intel-xe@lists.freedesktop.org>; Sun,  5 Oct 2025 13:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759671411; x=1791207411;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ip6MeHFbhx26XL5JZpWECynoFEaY3kOo2axwwtuhu4U=;
 b=RNpoFEuYmAiY7/m/NT9djzCpUX7Wl+D0ttdsd/oJWeeoT7odOw6wkggE
 dcVi9P/Ad6u42KuyTccQFbnhVqhVqLur4TmWTeAT7eFHol3891ex0G1AP
 nuSHsTYJ/YXyUPs+wooYRpsVfX+bnpb7f/SE6slm9+UVmIXt4fZKVUmaW
 iOy7zkk9VhHUL4RRqlTVXiFdFFikQwa52CMqHciNDDNhE8M3avjuevnXv
 T3X6KrdWj/SZrycJZ6sST6DQ7ZmhICH2k9lmP5S7Ithpr4GXGolEA3XMg
 Sp8zJRDhU4k7zN/UK8sMdGu8tG69rbqSAPWBT8rmziNju8ncaQUOyMI/c A==;
X-CSE-ConnectionGUID: hpdNYdDaQ0m3CwE0SZYWRA==
X-CSE-MsgGUID: r3PrMleIQCO4JzayI4EXwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="61779317"
X-IronPort-AV: E=Sophos;i="6.18,318,1751266800"; d="scan'208";a="61779317"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2025 06:36:50 -0700
X-CSE-ConnectionGUID: lRRlTEazTtyX1KGKMe9m0Q==
X-CSE-MsgGUID: PhxpP/vsRaq45FYYjczbtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,318,1751266800"; d="scan'208";a="179348590"
Received: from smanmadh-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.173])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2025 06:36:49 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/4] Update tile-based messages
Date: Sun,  5 Oct 2025 15:36:36 +0200
Message-ID: <20251005133641.2651-1-michal.wajdeczko@intel.com>
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

Michal Wajdeczko (4):
  drm/xe: Update SRIOV printk macros
  drm/xe: Add tile-based SRIOV printk macros
  drm/xe/pf: Update LMTT to use tile-based messages
  drm/xe: Update MEMIRQ to use tile-based printk macros

 drivers/gpu/drm/xe/xe_gt_sriov_printk.h   |  7 +++--
 drivers/gpu/drm/xe/xe_lmtt.c              | 11 ++++----
 drivers/gpu/drm/xe/xe_memirq.c            |  5 ++--
 drivers/gpu/drm/xe/xe_sriov_printk.h      | 12 ++++-----
 drivers/gpu/drm/xe/xe_tile_sriov_printk.h | 33 +++++++++++++++++++++++
 5 files changed, 51 insertions(+), 17 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_printk.h

-- 
2.47.1

