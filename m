Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84804CFD2F6
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 10:41:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E5B10E7C7;
	Thu, 27 Nov 2025 10:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aGQ38+Ce";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C9610E7C7
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 10:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764240097; x=1795776097;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nR0UTZ/ipIdNVR4AEgGzQ0mYzft+wRiRJArUwy5Wjd4=;
 b=aGQ38+Ce62syDD9uklazIir4fBEZSyPeA0VqEP+kGW5pP37lozjdYYM0
 QzDR+KLtC9nHfBfZCJ/gsbXegMRPDoLF0otxae9Tb0qxPTvIiEvQwlUer
 FY788j6QCBSR5+gihQafnpJYGG7lm8vPh8wwKIWcuh/YOV8NDKEngVNv9
 6yOsP3TsUUbbJhn4aFQje39AUp0a7SCWQiXrCCfwghRUieQwipV6CTNK7
 4Ri5xrF+2mhs1rUJ3t3kSv7wzKgMWrdFOiyiRfMAXBmO/9567KA+zm0dX
 XEo2/55J+ae9SvPVxOY+wf8BlC5DlNYNgthcQ+FI2Js5O2jUM7SaC+WrP w==;
X-CSE-ConnectionGUID: ccooFF+jSzmTzLLlxEg7/w==
X-CSE-MsgGUID: ARTmg4KjTtKNlz24fftubw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="91765404"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="91765404"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 02:41:37 -0800
X-CSE-ConnectionGUID: kzj1iiYZRDGnwh3authBPw==
X-CSE-MsgGUID: NzmVAo3aTqmPzo2Vb/CHog==
X-ExtLoop1: 1
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.92])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 02:41:35 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH] drm/xe/pf: Add tracepoints for VF migration state and data
 transfer
Date: Thu, 27 Nov 2025 11:41:31 +0100
Message-ID: <20251127104131.591299-1-marcin.bernatowicz@linux.intel.com>
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

VF migration currently provides no lightweight visibility into its internal
save/restore flow, making it difficult to measure migration latency, VF
stun time, or the amount of data transferred per VF and per data type
(VRAM/GGTT/MMIO/GuC).

This patch introduces two tracepoints that instrument the VF state machine
and each migration-data producer:

  * xe_sriov_vf_state
      - emits the tile/gt/vf identifier and the effective VF state
      - placed on SAVE_WIP, SAVED, RESTORE_WIP and RESTORED transitions
      - allows tracking the duration of individual save/restore phases
        for each VF

  * xe_sriov_vf_mig_data_chunk
      - records the type of migrated data (VRAM/GGTT/MMIO/GuC), direction
        (save/restore), offset and size in bytes
      - emitted once per chunk after it is produced/consumed
      - enables reconstruction of migration throughput and per-type byte
        distribution

These tracepoints are low-overhead when disabled and integrate with
existing tooling such as trace-cmd and perf. They make it possible to
correlate VF state transitions with data movement timings and to profile
migration behaviour under various workloads or provisioning scenarios.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  8 +++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 49 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_trace.h                 | 47 ++++++++++++++++++
 3 files changed, 104 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
index bf48b05797de..de327ef14218 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
@@ -24,6 +24,7 @@
 #include "xe_sriov_pf_migration.h"
 #include "xe_sriov_pf_service.h"
 #include "xe_tile.h"
+#include "xe_trace.h"
 
 static const char *control_cmd_to_string(u32 cmd)
 {
@@ -836,6 +837,8 @@ static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
 		pf_enter_vf_state_machine_bug(gt, vfid);
 
 	xe_gt_sriov_dbg(gt, "VF%u saved!\n", vfid);
+	trace_xe_sriov_vf_state(gt, vfid,
+				XE_GT_SRIOV_STATE_SAVED);
 
 	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
 	pf_exit_vf_mismatch(gt, vfid);
@@ -944,6 +947,7 @@ static void pf_exit_vf_save_wait_data(struct xe_gt *gt, unsigned int vfid)
 static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
 {
 	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
+		trace_xe_sriov_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
 		xe_gt_sriov_pf_migration_save_init(gt, vfid);
 		pf_enter_vf_wip(gt, vfid);
 		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
@@ -1113,6 +1117,8 @@ static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
 		pf_enter_vf_state_machine_bug(gt, vfid);
 
 	xe_gt_sriov_dbg(gt, "VF%u restored!\n", vfid);
+	trace_xe_sriov_vf_state(gt, vfid,
+				XE_GT_SRIOV_STATE_RESTORED);
 
 	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
 	pf_exit_vf_mismatch(gt, vfid);
@@ -1195,6 +1201,8 @@ static void pf_exit_vf_restore_wait_data(struct xe_gt *gt, unsigned int vfid)
 static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
 {
 	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
+		trace_xe_sriov_vf_state(gt, vfid,
+					XE_GT_SRIOV_STATE_RESTORE_WIP);
 		pf_enter_vf_wip(gt, vfid);
 		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
 		pf_queue_vf(gt, vfid);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index d5d918ddce4f..0e8f5e8e5d7a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -25,6 +25,7 @@
 #include "xe_sriov_packet.h"
 #include "xe_sriov_packet_types.h"
 #include "xe_sriov_pf_migration.h"
+#include "xe_trace.h"
 
 #define XE_GT_SRIOV_PF_MIGRATION_RING_SIZE 5
 
@@ -86,6 +87,12 @@ static int pf_save_vf_ggtt_mig_data(struct xe_gt *gt, unsigned int vfid)
 	if (ret)
 		goto fail;
 
+	trace_xe_sriov_vf_mig_data_chunk(gt, vfid,
+					 XE_SRIOV_PACKET_TYPE_GGTT,
+					 true,   /* is_save */
+					 data->hdr.offset,
+					 data->hdr.size);
+
 	return 0;
 
 fail:
@@ -108,6 +115,12 @@ static int pf_restore_vf_ggtt_mig_data(struct xe_gt *gt, unsigned int vfid,
 		return ret;
 	}
 
+	trace_xe_sriov_vf_mig_data_chunk(gt, vfid,
+					 XE_SRIOV_PACKET_TYPE_GGTT,
+					 false, /* restore */
+					 data->hdr.offset,
+					 data->hdr.size);
+
 	return 0;
 }
 
@@ -274,6 +287,12 @@ static int pf_save_vf_guc_mig_data(struct xe_gt *gt, unsigned int vfid)
 	if (ret)
 		goto fail_free;
 
+	trace_xe_sriov_vf_mig_data_chunk(gt, vfid,
+					 XE_SRIOV_PACKET_TYPE_GUC,
+					 true, /* is_save */
+					 data->hdr.offset,
+					 data->hdr.size);
+
 	return 0;
 
 fail_free:
@@ -332,6 +351,12 @@ static int pf_restore_vf_guc_state(struct xe_gt *gt, unsigned int vfid,
 	if (ret < 0)
 		goto fail;
 
+	trace_xe_sriov_vf_mig_data_chunk(gt, vfid,
+					 XE_SRIOV_PACKET_TYPE_GUC,
+					 false, /* restore */
+					 data->hdr.offset,
+					 data->hdr.size);
+
 	return 0;
 
 fail:
@@ -442,6 +467,12 @@ static int pf_save_vf_mmio_mig_data(struct xe_gt *gt, unsigned int vfid)
 	if (ret)
 		goto fail;
 
+	trace_xe_sriov_vf_mig_data_chunk(gt, vfid,
+					 XE_SRIOV_PACKET_TYPE_MMIO,
+					 true,   /* is_save */
+					 data->hdr.offset,
+					 data->hdr.size);
+
 	return 0;
 
 fail:
@@ -465,6 +496,12 @@ static int pf_restore_vf_mmio_mig_data(struct xe_gt *gt, unsigned int vfid,
 		return ret;
 	}
 
+	trace_xe_sriov_vf_mig_data_chunk(gt, vfid,
+					 XE_SRIOV_PACKET_TYPE_MMIO,
+					 false, /* restore */
+					 data->hdr.offset,
+					 data->hdr.size);
+
 	return 0;
 }
 
@@ -589,6 +626,12 @@ static int pf_save_vram_chunk(struct xe_gt *gt, unsigned int vfid,
 	if (ret)
 		goto fail;
 
+	trace_xe_sriov_vf_mig_data_chunk(gt, vfid,
+					 XE_SRIOV_PACKET_TYPE_VRAM,
+					 true,  /* is_save */
+					 data->hdr.offset,
+					 data->hdr.size);
+
 	return 0;
 
 fail:
@@ -672,6 +715,12 @@ static int pf_restore_vf_vram_mig_data(struct xe_gt *gt, unsigned int vfid,
 
 	xe_bo_put(vram);
 
+	trace_xe_sriov_vf_mig_data_chunk(gt, vfid,
+					 XE_SRIOV_PACKET_TYPE_VRAM,
+					 false, /* restore */
+					 data->hdr.offset,
+					 data->hdr.size);
+
 	return 0;
 err:
 	xe_bo_put(vram);
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 79a97b086cb2..0e714b754179 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -464,6 +464,53 @@ TRACE_EVENT(xe_exec_queue_reach_max_job_count,
 		      __entry->class, __entry->logical_mask, __entry->guc_id)
 );
 
+TRACE_EVENT(xe_sriov_vf_state,
+	    TP_PROTO(const struct xe_gt *gt, u16 vfid, u32 vf_state),
+	    TP_ARGS(gt, vfid, vf_state),
+	    TP_STRUCT__entry(__field(u8,  tile_id)
+			     __field(u8,  gt_id)
+			     __field(u16, vfid)
+			     __field(u32, vf_state)
+			    ),
+	    TP_fast_assign(__entry->tile_id  = gt->tile->id;
+			   __entry->gt_id    = gt->info.id;
+			   __entry->vfid     = vfid;
+			   __entry->vf_state = vf_state;
+			  ),
+	    TP_printk("tile=%u gt=%u vf=%u state=0x%x",
+		      __entry->tile_id, __entry->gt_id,
+		      __entry->vfid, __entry->vf_state)
+);
+
+TRACE_EVENT(xe_sriov_vf_mig_data_chunk,
+	    TP_PROTO(const struct xe_gt *gt, u16 vfid,
+		     u8 data_type, bool is_save,
+		     u64 offset, u64 bytes),
+	    TP_ARGS(gt, vfid, data_type, is_save, offset, bytes),
+	    TP_STRUCT__entry(__field(u8,  tile_id)
+			     __field(u8,  gt_id)
+			     __field(u16, vfid)
+			     __field(u8,  data_type)
+			     __field(u8,  is_save)
+			     __field(u64, offset)
+			     __field(u64, bytes)
+			    ),
+	    TP_fast_assign(__entry->tile_id   = gt->tile->id;
+			   __entry->gt_id     = gt->info.id;
+			   __entry->vfid      = vfid;
+			   __entry->data_type = data_type;
+			   __entry->is_save   = is_save;
+			   __entry->offset    = offset;
+			   __entry->bytes     = bytes;
+			  ),
+	    TP_printk("tile=%u gt=%u vf=%u type=%u %s off=%llu size=%llu",
+		      __entry->tile_id, __entry->gt_id, __entry->vfid,
+		      __entry->data_type,
+		      __entry->is_save ? "save" : "restore",
+		      (unsigned long long)__entry->offset,
+		      (unsigned long long)__entry->bytes)
+);
+
 #endif
 
 /* This part must be outside protection */
-- 
2.43.0

