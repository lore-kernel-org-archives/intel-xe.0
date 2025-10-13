Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC4FCCD185
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 08:09:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C7510E3EF;
	Mon, 13 Oct 2025 08:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LRoIoFXq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B29E10E3EF
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 08:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760342945; x=1791878945;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J3H2xpxyrLYGK3RYGlaDS+YgXaa7q2E/Z6PNQ99ILgo=;
 b=LRoIoFXqODkroLcPfs7jkYTyMGnmyWYxW9fVhTFgLXZE/rAsDtL6+6vY
 k8IDYYPzgf1plzTNMPAmOrrYGy2rjg0sZKWxuxfBWHewkrEnrr+8DGqfJ
 w/K49PNDJVW2hi7zqIoWLmhCCjIHrHpvzo0WtyEF6dj2B6mt6lHsA021J
 f58a1exxj05IaJirU4Fzci6c4KAtDmJ9Fvb8DIvoPeHys8zXYQGSvs7qK
 7mG63pDXk0LO+ex4Y1JWIaiDjy30LhVN1XCFXk1RgwzXtNF8r+s+vtO+R
 RvgiuIsNezVAvX/NDt1489HVKrvm8G3LjqpoRSeG4dNdxIzAQqtUnoVll A==;
X-CSE-ConnectionGUID: 0JdbJXW+Tj6RR9xoCXX9gQ==
X-CSE-MsgGUID: G4Rm2y6AQpGAuJ9dREMHSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="87935127"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="87935127"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 01:09:05 -0700
X-CSE-ConnectionGUID: B5/j81RUSEyiPiMQGfCNhg==
X-CSE-MsgGUID: 13Wt/XHPQKmvN0HfntF6XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; d="scan'208";a="181965866"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 01:09:01 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH 0/2] Fix user-after-free during driver unbind
Date: Mon, 13 Oct 2025 13:39:01 +0530
Message-ID: <20251013080900.1507609-4-balasubramani.vivekanandan@intel.com>
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

There are a couple of worker threads in the driver which could be
running while unbinding the driver. Ensure those threads are stopped
before unbinding the driver to avoid any user-after-free from those
workers.

Balasubramani Vivekanandan (2):
  drm/xe/gt: Synchronize GT reset with device unbind
  drm/xe/guc: Synchronize Dead CT worker with unbind

 drivers/gpu/drm/xe/xe_device.c | 6 ++++++
 drivers/gpu/drm/xe/xe_gt.c     | 5 +++++
 drivers/gpu/drm/xe/xe_gt.h     | 1 +
 drivers/gpu/drm/xe/xe_guc_ct.c | 3 +++
 4 files changed, 15 insertions(+)

-- 
2.43.0

