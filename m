Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BE0CDB47C
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 02:53:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6D710E143;
	Thu, 25 Jun 2026 02:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HqPgmrKC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00A410E143
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 02:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782356034; x=1813892034;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HURGOYrZ+fcZg/4nXwaZrdjwe1bUvDhxt1DgXP3zmSY=;
 b=HqPgmrKC0E79KKGecd7imps82sALDFb4phQ4YHeTXepXBkzUM7ZqH+jz
 mcTy5EVUPvpk9QG/Ujrn3zDwbvUbq7I2Zvd5QWmvqLpFfzhRK1yYs5E/1
 BbMAxG+3inGNINT0NnVfLRni3Chxfyjqg3XYjs+o0nKKUzHCv8il3adFc
 44CHYzyfWAFvbTdqNZEU8dYG7JjhdLH8brqsvWcjpCt4VCY3adq6q4s8z
 CRXhLZpzjwzGaRauTQ/ZR7IGtethWg1gX4fIIHs/0mr71KIJeu5gHpXAv
 tCSmnpiYmkFIMnPnK7SKeoZX7YuKVw/qME2NAie9FrBagoVFpwx1EcMua w==;
X-CSE-ConnectionGUID: qUcL8if+S2yHkUH6dlkk1w==
X-CSE-MsgGUID: f9D7Wv4tTr2USJuJhWtFeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="93781078"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="93781078"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 19:53:54 -0700
X-CSE-ConnectionGUID: 0aceur4zTPei02BXf5/ueg==
X-CSE-MsgGUID: USDm7peAQJGRujxsg3mfWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; d="scan'208";a="254118529"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 19:53:54 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH 0/5] drm/xe: balance exec queue suspend/resume
Date: Wed, 24 Jun 2026 19:53:49 -0700
Message-ID: <20260625025348.1620469-7-niranjana.vishwanathapura@intel.com>
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

This series fixes and hardens the exec queue suspend/resume balance in
the Xe driver, and builds on that to make multi-queue group suspend
actually preempt the group's GuC context.

Today a consumer that suspends an exec queue (preempt fences, the hw
engine group fault-mode switch, ...) unconditionally issues the
matching resume(), even when the suspend() never took effect because the
queue was killed, banned or wedged in the meantime. Resuming a queue
that was never suspended is incorrect: with the GuC backend it can trip
the !suspend_pending assertion or leave scheduling state inconsistent.

The series addresses this in layers:

 - Track whether a consumer's suspend() actually succeeded and only
   issue resume() when one is owed (patch 1), and apply the same
   discipline to the hw engine group fault-mode switch, including
   undoing partial suspends on failure (patch 2).

 - Harden the GuC suspend wait so an in-flight suspend is not abandoned
   by an arbitrary (non-fatal) signal, and so a GuC timeout bans the
   queue and tears it down instead of leaving it suspended forever
   (patch 3).

 - Add a suspend reference count to the exec queue ops so overlapping
   suspends from independent callers stay balanced (patch 4).

 - Use that refcount to forward a multi-queue secondary's suspend to the
   group's primary, so suspending a secondary actually disables the
   primary's GuC context and preempts the group's in-flight GPU work
   (patch 5).

Assisted-by: Github-Copilot:Claude-opus-4.8
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (4):
  drm/xe: only resume exec queues that were actually suspended
  drm/xe/hw_engine_group: propagate suspend failures during mode switch
  drm/xe/guc: wait killably for suspend and ban queue on timeout
  drm/xe/multi_queue: preempt primary on queue group suspend

Thomas Hellström (1):
  drm/xe/guc: Add suspend refcount to exec queue ops

 drivers/gpu/drm/xe/xe_exec_queue.c           |   1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |  18 ++
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   7 +
 drivers/gpu/drm/xe/xe_guc_submit.c           | 197 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_hw_engine_group.c      |  76 ++++++-
 drivers/gpu/drm/xe/xe_preempt_fence.c        |   7 +
 drivers/gpu/drm/xe/xe_vm.c                   |  18 +-
 7 files changed, 299 insertions(+), 25 deletions(-)

-- 
2.43.0

