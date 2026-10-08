Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E7DCA600B
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 12:25:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE6010E801;
	Thu,  8 Oct 2026 12:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KKItF2Br";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63ED710E801
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Oct 2026 12:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791462355; x=1822998355;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7xwgQxREYfa9DjXklxD1WelDZov6dPA/gwuZH8ou62U=;
 b=KKItF2BrhwXpkDgiYwyP+I20Gl2XXork6ZqUQDgqr/p0Bb+pNP0fmiIM
 l2Xm230Dnoag9qEr7oBwRFZg0cyLLGIrFvbiPPk6RTIYoHBz8jpo3WTFY
 ZI3nn5en7YAfIMGbUFPVTlL8nB9sDR5+a3UoCBl6edLODVS/gCQ5uIK/b
 Spi19UomHCklYrwv4xvZDB3lmAxfzS5HJatogEp/dTl13TPlcQW4Ov1uj
 K5ObjRYjNaJx9vRUtJMXRaenHA2tTadj3HUAXVAzsgoGWvBz+oqCBsfgY
 AIS7t2vLN+Of+P/r/VOXr+au76g+x6kU632Alx7a7SNAUnSyV98lQmAdW g==;
X-CSE-ConnectionGUID: B1Kub75JTMKQjCv2HZp1Gg==
X-CSE-MsgGUID: ai3KH/3tRRKa41T7xNrPuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="141495"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="141495"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 05:25:55 -0700
X-CSE-ConnectionGUID: YPGw5flrT7KUcdKwirr55g==
X-CSE-MsgGUID: giKpBfc8RYiH733cOJ6LRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="50911"
Received: from gsd-build.iind.intel.com ([10.190.229.108])
 by orviesa004.jf.intel.com with ESMTP; 08 Oct 2026 05:25:55 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH 0/1] Fix kernel crash during driver teardown
Date: Thu,  8 Oct 2026 12:25:44 +0000
Message-ID: <20261008122543.390356-3-satyanarayana.k.v.p@intel.com>
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


Satyanarayana K V P (1):
  drm/xe: Prevent VF memory IRQ from accessing a torn-down engine

 drivers/gpu/drm/xe/xe_hw_engine.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.43.0

