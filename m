Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2764EC8303C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 22:30:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22B710E798;
	Wed,  2 Jul 2025 22:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B0GzIn7A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FB910E798
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 22:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751495456; x=1783031456;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qXiZo6jshGaynaUfe+4jk1VWQGlwcjE7pij0uz8g7Yg=;
 b=B0GzIn7A13SAC0tHVF7EfF+0qSbUBXqspfr8Khx9HUWtV9tYAhsp17MC
 ouTHOwQ0LIaDMVOMstvADsMfbyJtOV2dK4Xw7RRzpMDvm9saxGR1iVCBC
 7DPhWyiCLCiDHgjvtYRHzz1AFjaB094pNhhUnz7K073U0ZjBmR2CShHLK
 iw03DHO0gp1+15kzWqk/gWisKAyVhPYASrfWoLg/vjevbWZkIPfjtTDSS
 Nl3ntLj5FbwgZdU0dQF7lZ+AR+SllIVrfaGJP8f7nbrtSJcCxGKJo/CuD
 +zByll7iB6yOciOKtkD8PO42S0JbpFnw1pOccmqJ1/NyBW+TJ8xJcordd w==;
X-CSE-ConnectionGUID: 3BJ8PUOTQDmb25apKb+eig==
X-CSE-MsgGUID: U626BEl/R06+CVjxfRkdzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53737230"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="53737230"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 15:30:55 -0700
X-CSE-ConnectionGUID: o8GUST6qQbeI5QHkxCxMHw==
X-CSE-MsgGUID: VxGfPgg0Qs2A8Dgeqk8aNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="153645293"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.112.168])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 15:30:54 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/3] LMTT invalidation
Date: Thu,  3 Jul 2025 00:30:38 +0200
Message-Id: <20250702223041.1700-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Michal Wajdeczko (3):
  drm/xe/pf: Force GuC virtualization mode
  drm/xe/pf: Invalidate LMTT during LMEM unprovisioning
  drm/xe/pf: Invalidate LMTT after completing changes

 drivers/gpu/drm/xe/xe_device.h              |  4 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  | 43 +++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 35 +++++++++++++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  2 +
 drivers/gpu/drm/xe/xe_lmtt.c                | 56 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_lmtt.h                |  1 +
 6 files changed, 140 insertions(+), 1 deletion(-)

-- 
2.47.1

