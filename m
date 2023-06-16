Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092C4EB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 09:55:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D075710E05A;
	Fri, 16 Jun 2023 09:55:25 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4DC10E05A
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 09:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686909323; x=1718445323;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x8TPWojFdP1vhGv0vTYtXW3OGWOko/OzdSXRiTgt0tg=;
 b=kCUbvdBexkUoZOKB0m7tBumE9r424Qqi86JVcPoFbPW+N5g0E5GgA+8T
 NVSpyCvNozmrtZbR6n5Pce3OLhWbEfd33OudEflrpDGuAuqzTOr5JFTa2
 4yB3LPRUijUZlV2BCpVwFzpO320u9UwEQnQJmxIuKGUUuqWRfyumIkopC
 wQJVYGroLkchLBt92msq/I1LU9fyaVw+R47mQfHXmfSncm/6XQP6tytw5
 VeQtMcs/2+74gMiOdZbFhtDLO5wrBXXzEC5kFJfAkre5pKHIZlCeA90wV
 V9429JVrlWhSTNL7aND2i9S9fTNYvqE5n4Ig+AS9YeONzBVdPahtDbvQi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="343916534"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="343916534"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 02:55:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="959557764"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; d="scan'208";a="959557764"
Received: from nurha65x-mobl2.gar.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.148])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 02:55:19 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 16 Jun 2023 11:54:58 +0200
Message-Id: <20230616095504.17084-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/6] drm/xe: Eviction fixes and optimizations
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


Thomas Hellström (6):
  drm/xe/bo: Don't limit the TT manager to half of system memory
  drm/xe/bo: Fix swapin when moving to VRAM
  drm/xe/bo: Avoid creating a system resource when allocating a fresh
    VRAM bo
  drm/xe/bo: Gracefully handle errors from ttm_bo_move_accel_cleanup().
  drm/xe/bo: Evict VRAM to TT rather than to system
  drm/ttm: Don't shadow the operation context

 drivers/gpu/drm/ttm/ttm_bo.c        |  3 +-
 drivers/gpu/drm/xe/xe_bo.c          | 66 ++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_ttm_sys_mgr.c |  2 -
 3 files changed, 46 insertions(+), 25 deletions(-)

-- 
2.40.1

