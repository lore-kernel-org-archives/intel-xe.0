Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB79FD61014
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 12:52:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7180B10E0F8;
	Thu, 29 Jan 2026 12:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PBzOBUec";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1019510E0F8
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 12:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769691121; x=1801227121;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W+rqh1BjuvuvLeKqbB5ffoM3AXx+kzHnXoJG5L2ufjM=;
 b=PBzOBUecE+lQ1TtZOKsvSMSwhC17i4+jLYzJGWg+aKfstJNJI5iWkQyK
 vFkIyRYomjR4pJmh86lgGQFeJkhx2kqAdRyWVdcw9K8RzJ+eCzJ42oDOn
 nbT11jRTunjSywlAZvdG4oAKs7hxRUKz7T3zRVIHT6Z8C0hNVLHCypGFZ
 9duEB/bg6aIuouKZQsQRfVNksClEK8KjZ8iWkNmID5/xmi8vVs0RV/LHt
 SGJHeUQreXDN5nvCic3QURGEHdCiUrdgiHbdmIgbSRMIj1xtpz2MT/IJh
 3GdrWslxZ+Xb5vZRMjOHxUDRaXGBl0Vai0vQvdlMvmeXmKhk7bScg7Ejo Q==;
X-CSE-ConnectionGUID: 3itruTZDT0mFPQrNDlXoiw==
X-CSE-MsgGUID: JJOddmdTTYuf1ro56nTiPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70129153"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="70129153"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 04:52:00 -0800
X-CSE-ConnectionGUID: Fgqx8hO3QBOdtb+i0hW9UQ==
X-CSE-MsgGUID: SAGK2yNdTxOS4izQ3Rn7hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="208995084"
Received: from gsd-build.iind.intel.com ([10.190.229.167])
 by fmviesa009.fm.intel.com with ESMTP; 29 Jan 2026 04:51:58 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH 0/2] Fix fs_reclaim deadlock caused by CCS save/restore
Date: Thu, 29 Jan 2026 12:51:42 +0000
Message-ID: <20260129125141.523087-4-satyanarayana.k.v.p@intel.com>
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

CCS save/restore batch buffers are currently attached during BO allocation
and detached during BO teardown. The shrinker also triggers xe_bo_move(),
which is used for both allocation and deletion paths.

When BO allocation and shrinking occur concurrently, a circular locking
dependency involving fs_reclaim and swap_guard can occur, leading to a
deadlock such as:

======================================================
WARNING: possible circular locking dependency detected
------------------------------------------------------
CPU0                    CPU1
----                    ----
lock(fs_reclaim);
                        lock(&sa_manager->swap_guard);
                        lock(fs_reclaim);
lock(&sa_manager->swap_guard);
***  DEADLOCK   ***
=====================================================

To avoid this, allocate CCS save/restore BB BOs using GFP_ATOMIC,
preventing reclaim from being invoked in this context.

Satyanarayana K V P (2):
  drm/xe/vf: Fix fs_reclaim warning with CCS save/restore BB allocation
  drm/xe/sa: Add lockdep annotations for SA manager swap_guard

 drivers/gpu/drm/xe/xe_bb.c | 4 ++--
 drivers/gpu/drm/xe/xe_sa.c | 6 ++++++
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.43.0

