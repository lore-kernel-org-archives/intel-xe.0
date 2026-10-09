Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD2ECA6019
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 14:59:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212D410E19D;
	Fri,  9 Oct 2026 14:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZnDS7bdQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65E810E19D
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 14:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791557952; x=1823093952;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2Bh8MT8q2ZfioaH5bn50ZeD6p9rZN8kcIvAHPjaTRec=;
 b=ZnDS7bdQNo7M4/pU+Pite610Qy8QX53Vr8kKSCUvoiX+NH+NSUG9mFTk
 FSCYgaBMXmNb/nunPL+SGHAs8SW/93t6TC2yV3xk2zyxjTWJTMNeih82M
 sVi3xu9x+k2f7504e41qLcXRgM6vgo/+EPnJnFrQcY9TWAHIFPnQX5R/l
 SBlD8GtsZSmo0l4mXkfi/GLQY+hS8HpUvtEdCnos9343aRoH4jeHL1j4T
 nDLiQPngX6WrJwbhM1v2aiOKwG77cN98gUUqeSVCoSL5WIZhNcVq9u4Bk
 nw8Qp7wDikvzlPZ+ZO0Px+xpJB80UJ3KewJt4OOX7/OHSNZ04+AaCPKLI Q==;
X-CSE-ConnectionGUID: f1cawpi3Q3Krn2Gj9Q7QnA==
X-CSE-MsgGUID: eexPWFFcSWGUKXz2WHHQIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="251622"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="251622"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 07:59:11 -0700
X-CSE-ConnectionGUID: UzkpVEj8QWy+1x9Dz+19Kw==
X-CSE-MsgGUID: +swWvSguRUy2hox3gYsnfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="305956"
Received: from gsd-build.iind.intel.com ([10.190.229.108])
 by orviesa002.jf.intel.com with ESMTP; 09 Oct 2026 07:59:10 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v4 0/3] Fix kernel crash during driver teardown
Date: Fri,  9 Oct 2026 14:59:07 +0000
Message-ID: <20261009145906.886719-5-satyanarayana.k.v.p@intel.com>
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

During driver release, the hardware engine is only partially invalidated
during teardown. Its name remains set, so the memory IRQ handler can still
identify the engine and access its state after teardown. This can result
in a NULL pointer dereference.

Invalidate the hardware engine name during teardown so the IRQ handler no
longer treats the engine as available.

The crash log below shows an example of the failure.

BUG: kernel NULL pointer dereference, address: 0000000000000000
PF: supervisor read access in kernel mode
PF: error_code(0x0000) - not-present page
PGD 0 P4D 0
Oops: Oops: 0000 [#1] SMP NOPTI
Tainted: [U]=USER
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
2025.11-3ubuntu7 03/31/2026
RIP: 0010:xe_hw_engine_handle_irq+0x18/0x70 [xe]
Code: 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f
44 00 00 55 48 89 e5 41 54 41 89 f4 48 89 d6 53 48 8b 07 48 89 fb <48> 8b 00 48
8b 38 e8 5d 84 08 00 48 8b 83 b8 00 00 00 48 85 c0 74
RSP: 0018:ffffd07840003e80 EFLAGS: 00010046
RAX: 0000000000000000 RBX: ffff8904657fa740 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff8904657fa740
RBP: ffffd07840003e90 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000001
R13: ffff89046a490000 R14: ffff89046a491af8 R15: ffff8904657faf20
FS:  0000000000000000(0000) GS:ffff8905fd219000(0000)
knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000103705005 CR4: 0000000000772ef0
PKRU: 55555554
Call Trace:
 <IRQ>
 xe_memirq_handler+0xc3/0x200 [xe]
 vf_mem_irq_handler+0x46/0x90 [xe]
 __handle_irq_event_percpu+0x59/0x200
 handle_irq_event+0x36/0x90
 handle_edge_irq+0xc5/0x190
 __common_interrupt+0x50/0x160
 ? irq_enter_rcu+0x84/0xb0
 common_interrupt+0xb0/0xe0
 </IRQ>

 ---
 V3 -> V4:
 - Fix race condition reported by LLM (Sashiko).

 V2 -> V3:
 - Fixed race condition with guc_exec_queue_timedout_job(). (Sashiko).
 - Disable GT reset worker before engine teardown (LLM).

 V1 -> V2:
 - Fix race with xe_memirq_handler() and hw_engine_fini() (Sashiko
 & Piotr).

Satyanarayana K V P (3):
  drm/xe: Prevent VF memory IRQ from accessing a torn-down engine
  drm/xe/guc: Protect timeout handling from device unplug
  drm/xe/gt: Disable GT reset worker before engine teardown

 drivers/gpu/drm/xe/xe_gt.c         | 29 ++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_guc_submit.c | 12 +++++++++++-
 drivers/gpu/drm/xe/xe_hw_engine.c  | 17 ++++++++++++++---
 drivers/gpu/drm/xe/xe_irq.c        |  3 +++
 drivers/gpu/drm/xe/xe_memirq.c     |  3 +++
 5 files changed, 53 insertions(+), 11 deletions(-)

-- 
2.43.0

