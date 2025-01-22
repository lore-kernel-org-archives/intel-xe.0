Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA8CC02181
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 21:50:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F3810E0B0;
	Wed, 22 Jan 2025 21:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="igVvW+cd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E6F10E1CD
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jan 2025 21:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737582643; x=1769118643;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Dd/thARMO4F6n7hFqsIDl5zpLLzbezcW15Z2h1rBEfw=;
 b=igVvW+cdcKeq9sFYuIu2Psjo//wi6AnQF7lQyZ5umBzHm6Sgil5BJohT
 t8U9xbcl/99DmLr67BA87eJTFhTyhMCKKf3DwQEmxxgQJVo91xMgdj+/V
 SCZknPPFN2SffHzmKr++oGkxzmPUhpNFXvxH8VdvEW0QGZQzl9SPa698Z
 ndhzGjSJtQm2nL9l2GSBBT+Ym96WTOU9mZOvKbRwsA8YwoQ7n1kjN+GCH
 +6vNzCIc3OuSs5QY2idRuhABB8KW6BWbFOJk5idWjKeCVRP7fexbMWzav
 C+/NrcaxMZPWH2G0FVz4rp0O57WDJJJOCkhI2jAClKraXJtq8dkGPLMm4 A==;
X-CSE-ConnectionGUID: eBlbR8TbTCKQ0L8nf3ob0Q==
X-CSE-MsgGUID: fI/7985HQSKJZ539QPGktg==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="41730975"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="41730975"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 13:50:42 -0800
X-CSE-ConnectionGUID: F+f15QjmRu2RRUetnN62Yw==
X-CSE-MsgGUID: f8aUOiOHR4S2npXpW+rjbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112365815"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.80.89])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 13:50:41 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 0/3] Fix SRIOV RPM resume lockdep issues
Date: Wed, 22 Jan 2025 22:49:52 +0100
Message-Id: <20250122214955.632-1-michal.wajdeczko@intel.com>
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

Attempt to fix SRIOV lockdep issues reported by Thomas in [1]

[1] https://lore.kernel.org/intel-xe/3e13401972fd49240f486fd7d47580e576794c78.camel@intel.com/

Michal Wajdeczko (3):
  drm/xe/pf: Use GuC Buffer Cache during policy provisioning
  drm/xe/pf: Add reclaim annotation to the PF master mutex
  drm/xe: Don't treat SR-IOV platforms as reclaim unsafe

 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c | 50 +++++++++++-----------
 drivers/gpu/drm/xe/xe_pm.c                 |  2 +-
 drivers/gpu/drm/xe/xe_sriov_pf.c           | 19 +++++++-
 3 files changed, 43 insertions(+), 28 deletions(-)

-- 
2.47.1

