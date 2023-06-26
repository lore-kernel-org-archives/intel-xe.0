Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B0DEB64D7
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 18:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3BAC10E240;
	Mon, 26 Jun 2023 18:18:00 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E86110E23D
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 18:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687803478; x=1719339478;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mh79NaVPGfF/eqQG1W8juwrw6X2mIii2wA0lf6n5bus=;
 b=nHSjB/BfEJ6OdBirNu3HIO8/K2PmDfk1/cCblVjVPRdHpybd8G/CmSpt
 tzqifgqesHhcGx+KwkHlx3ByBsFqCP3karamzKQUonIj6qYzR2qdzGsUd
 Og1eBDeZmISWZLTNYIvaIdcX4DKngxStCFMSJKHuV2TTag3nsR1WLxc/v
 roIBIfUaV+qygYCcIsNzuOe1+aF6rxxomdNiIuwZIWUkLyuctgkvYSk9c
 areqqDCTBeIzkaEnweH7IJ6vJzf23qFKGSjpZEjdW5UCecCeAF5NtUSEI
 PKpnMQXpBL4yTA2BzesrLGEtS9Mpg7usvztqllYbC1kNk9CqE/SJ93AKZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="341689101"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="341689101"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 11:17:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="890369727"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="890369727"
Received: from ettammin-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.105])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 11:17:51 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jun 2023 20:17:37 +0200
Message-Id: <20230626181741.32820-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/4] drm/xe: Eviction fixes and optimizations
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

v3:
- Remove patch 1 and 6
- Fix a NULL pointer dereference

Thomas Hellström (4):
  drm/xe/bo: Fix swapin when moving to VRAM
  drm/xe/bo: Avoid creating a system resource when allocating a fresh
    VRAM bo
  drm/xe/bo: Gracefully handle errors from ttm_bo_move_accel_cleanup().
  drm/xe/bo: Evict VRAM to TT rather than to system

 drivers/gpu/drm/xe/xe_bo.c | 75 ++++++++++++++++++++++++++------------
 1 file changed, 52 insertions(+), 23 deletions(-)

-- 
2.40.1

