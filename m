Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83CCEB64DB
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jun 2023 15:22:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE8310E21B;
	Mon, 19 Jun 2023 15:22:40 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27A310E21A
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jun 2023 15:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687188158; x=1718724158;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rlzllkFLlHDkSVEVnKj2IHIJ6BoH/TDNY21YmxKkJFA=;
 b=K3rvLqUCVgOr/QpOuZJsAVyq6Q8FrwjBq9RsCZf3lVGWWdn25gP5O0Xf
 4d7bwf5vB7mz346ZZBOomCCuLsJHF2a+LIh9Hdyn40NLmJEiLCP6aFTKS
 KD4mfM4wyKCpzbFOyPLBwHm47ajdfQje6h1es2ew/ubjqREFOtPp97Qug
 tKgM6KOOJmuxAJa5XUhKEgKOManhFRcNvzhdldfaDKvRz6MOX5II9woOE
 r72OACJbi1EUGu7s5Y5u/V1eDqI+RS9ERHkGWh9Hx/2f3A8c41oiFDCBL
 KVD1fLXwAYd6TSSoNHYWQuijZkz9KcgVVvJIe7jY2ePSqidqC7FqwIarN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="349381535"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="349381535"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 08:22:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="858250585"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; d="scan'208";a="858250585"
Received: from yeidelbe-mobl.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.162])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2023 08:22:35 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 19 Jun 2023 17:22:16 +0200
Message-Id: <20230619152222.11733-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/6] drm/xe: Eviction fixes and optimizations
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

MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Attempt to fix some xe_evict igt tests, and allow for pipelined eviction.
Some tests, like evict-large-multi-vm-cm still fail due to memory
allocation errors, and those may require some deeper TTM surgery.

Moving forward we should also look at moving out same-vm bos to TT that
has XE_PL_TT as a compatible placement when VRAM is full.

v2:
- Minor fixes to address review comments from Matthew Brost
- Proper Cc for the TTM patch 6.

Thomas Hellström (6):
  drm/xe/bo: Don't limit the TT manager to half of system memory
  drm/xe/bo: Fix swapin when moving to VRAM
  drm/xe/bo: Avoid creating a system resource when allocating a fresh
    VRAM bo
  drm/xe/bo: Gracefully handle errors from ttm_bo_move_accel_cleanup().
  drm/xe/bo: Evict VRAM to TT rather than to system
  drm/ttm: Don't shadow the operation context

 drivers/gpu/drm/ttm/ttm_bo.c        |  3 +-
 drivers/gpu/drm/xe/xe_bo.c          | 73 ++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c |  2 -
 3 files changed, 52 insertions(+), 26 deletions(-)

-- 
2.40.1

