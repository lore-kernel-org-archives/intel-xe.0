Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E107CC25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 18:13:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811B710E314;
	Wed,  5 Jun 2024 18:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SfJOTI90";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7704E10E314
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 18:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717611212; x=1749147212;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=as1P+YQvKwzq/SV0lCXTZ0hNYBaA22K+R28nCRaD17A=;
 b=SfJOTI90vuLk/3ZtyE1TcBMr5CYWUsn0qH4KkZGVHy6gen3BzGHc7lYe
 je0sPqo7DfX9zCoNWR06247bB7KCfjwlLEyQ3ur0AcBBUKXAmCyqCw9yF
 d4IKhSSwVrrK4db4f30My1Klli5X7SF6VZadwFH2Hw3n+Sb9dreLe5xeI
 nEPqf2oQLFPn3zB1pOQ7NGVLJGDytN0Yow6I9nqOFxIQqsZipPQW6rpj9
 k58MxwapgbuC24qXyZrHYSX1oCVYDjRCuKPR/GYrOrNvn3Cshe78Uqxe1
 sLv866qyURGU0oTyGOZWTvAc7/M/Vp+cl/vTXX+HN5EtxRIWJpew4IRbD w==;
X-CSE-ConnectionGUID: DC3CnXAuRSqczHVhziR+6Q==
X-CSE-MsgGUID: IzJKGZwqRW6K8qSAtHMc8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14362213"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="14362213"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 11:13:31 -0700
X-CSE-ConnectionGUID: QDjcl1VCTUSoNf+e2Yu2cg==
X-CSE-MsgGUID: FsU8mfLrTYm5wmq2P2mOTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="42637715"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 11:13:31 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: Fei Yang <fei.yang@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 1/1] drm/xe: uninitialized fence causing null ptr dereference
Date: Wed,  5 Jun 2024 11:15:28 -0700
Message-Id: <20240605181528.2047987-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240605181528.2047987-1-fei.yang@intel.com>
References: <20240605181528.2047987-1-fei.yang@intel.com>
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

From: Fei Yang <fei.yang@intel.com>

[  141.256160] BUG: kernel NULL pointer dereference, address: 0000000000000028
[  141.257162] #PF: supervisor read access in kernel mode
[  141.257943] #PF: error_code(0x0000) - not-present page
[  141.258722] PGD 800000018c95c067 P4D 800000018c95c067 PUD 18c95d067 PMD 0
[  141.259751] Oops: 0000 [#1] PREEMPT SMP PTI
[  141.260409] CPU: 0 PID: 7277 Comm: gemm_bf16 Kdump: loaded Tainted: G     U             6.9.0-xe-474+ #1
[  141.261812] Hardware name: Bochs Bochs, BIOS Bochs 01/01/2007
[  141.262669] RIP: 0010:trace_event_raw_event_xe_sched_job+0x50/0x100 [xe]
[  141.263644] Code: 02 00 00 0f 85 ad 00 00 00 ba 30 00 00 00 4c 89 e6 48 8d 7d b8 e8 a0 c4 78 e0 48 85 c0 74 7b 48 8b 93 18 01 00 00 48 8d 7d b8 <48> 8b 52 28 89 50 08 8b 93 38 01 00 00 89 50 0c 48 8b 93 08 01 00
[  141.266281] RSP: 0000:ffffc900017ff1c0 EFLAGS: 00010282
[  141.267075] RAX: ffff8881001c4208 RBX: ffff888188499380 RCX: 00000000000007a3
[  141.268100] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffc900017ff1c0
[  141.269123] RBP: ffffc900017ff208 R08: 0000000000000002 R09: 0000000000000001
[  141.270145] R10: 0000000000000034 R11: c0673accd9eb118e R12: ffff888157969908
[  141.271166] R13: ffff888188499380 R14: ffff888188499380 R15: 0000000000000001
[  141.272187] FS:  00007f38147d4780(0000) GS:ffff888237e00000(0000) knlGS:0000000000000000
[  141.273402] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  141.274250] CR2: 0000000000000028 CR3: 0000000188490005 CR4: 0000000000570ef0
[  141.275268] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  141.276284] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
[  141.277297] PKRU: 55555554
[  141.277758] Call Trace:
[  141.278186]  <TASK>
[  141.278571]  ? show_regs+0x67/0x70
[  141.279114]  ? __die_body+0x20/0x70
[  141.279666]  ? __die+0x2b/0x40
[  141.280164]  ? page_fault_oops+0x153/0x4b0
[  141.280782]  ? search_bpf_extables+0x96/0x160
[  141.281439]  ? trace_event_raw_event_xe_sched_job+0x50/0x100 [xe]
[  141.282317]  ? search_exception_tables+0x5f/0x70
[  141.283004]  ? kernelmode_fixup_or_oops.isra.0+0x61/0x80
[  141.283771]  ? __bad_area_nosemaphore+0x18e/0x290
[  141.284466]  ? __lock_acquire+0xa22/0x30a0
[  141.285080]  ? bad_area_nosemaphore+0x16/0x20
[  141.285733]  ? do_user_addr_fault+0x338/0xa80
[  141.286384]  ? trace_clock_local+0x10/0x30
[  141.286993]  ? __rb_reserve_next+0x62/0x4c0
[  141.287611]  ? exc_page_fault+0x87/0x2a0
[  141.288197]  ? asm_exc_page_fault+0x27/0x30
[  141.288813]  ? trace_event_raw_event_xe_sched_job+0x50/0x100 [xe]
[  141.289678]  xe_sched_job_create+0x29d/0x2e0 [xe]
[  141.290373]  __xe_bb_create_job+0x93/0x220 [xe]

Fixes: 0ac7a2c745e8 ("drm/xe: Don't initialize fences at xe_sched_job_create()")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 drivers/gpu/drm/xe/xe_sched_job.h | 2 +-
 drivers/gpu/drm/xe/xe_trace.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sched_job.h b/drivers/gpu/drm/xe/xe_sched_job.h
index 002c3b5c0a5c..0c3ddbb7e25f 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.h
+++ b/drivers/gpu/drm/xe/xe_sched_job.h
@@ -70,7 +70,7 @@ to_xe_sched_job(struct drm_sched_job *drm)
 
 static inline u32 xe_sched_job_seqno(struct xe_sched_job *job)
 {
-	return job->fence->seqno;
+	return (job->fence) ? job->fence->seqno : 0;
 }
 
 static inline u32 xe_sched_job_lrc_seqno(struct xe_sched_job *job)
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 450f407c66e8..ea61387e0f5e 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -270,7 +270,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
 			   __entry->guc_state =
 			   atomic_read(&job->q->guc->state);
 			   __entry->flags = job->q->flags;
-			   __entry->error = job->fence->error;
+			   __entry->error = (job->fence) ? job->fence->error : 0;
 			   __entry->fence = job->fence;
 			   __entry->batch_addr = (u64)job->ptrs[0].batch_addr;
 			   ),
-- 
2.25.1

