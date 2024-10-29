Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EB5D3A699
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 19:40:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F29410E6F3;
	Tue, 29 Oct 2024 19:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZrTkSy4k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A7910E6F0
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 19:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730230802; x=1761766802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V4hBJ7LjtcdIvbJsmLvL/EUIjMiirepKVSqwYoVCQkE=;
 b=ZrTkSy4kefUtnWijypu5ZpWe9q8wRMn9Z/qBMlKJay5DeCXcLFiskqu1
 9q9CEDSnZ7rzuIXPBrEe1sowGChWXIYOWBlk+cEBqPZsrKSPM797QJ8pO
 faqr8q/VnBlyZOERqzWDPmu2U9UzLHt9kfShwSLfRHsPQdAGmPyvvCUgT
 nz2BMPwpMzQQxU9X5PhfE6L5igTMiwRBY61g6KU0+GY3bKDXhdAc6yGue
 p+os8sPKVczHcH2ELJtjO/kKmY+OELRSXDdLpYge5hyB2BSsifR7WdiYf
 9E+3ZLah4SnczuC8F17us9lJYVakdYuglQBn9IXm5gGQAahECb+BhE6Mv g==;
X-CSE-ConnectionGUID: 3TXRfVn5TzCAVEBUVtGDqw==
X-CSE-MsgGUID: wF11J87hQLOLD3Ml7cxLFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="17537324"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="17537324"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 12:40:02 -0700
X-CSE-ConnectionGUID: EjHd8eB0T0uTxODWdMdonQ==
X-CSE-MsgGUID: nC3i7nVTRsuhhSPQhmI91Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="81996518"
Received: from gkczarna.igk.intel.com ([10.102.139.130])
 by orviesa009.jf.intel.com with ESMTP; 29 Oct 2024 12:40:02 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH v5 2/5] drm/xe/vf: Document SRIOV VF restore flow
Date: Tue, 29 Oct 2024 20:39:53 +0100
Message-Id: <20241029193956.1043614-3-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029193956.1043614-1-tomasz.lis@intel.com>
References: <20241029193956.1043614-1-tomasz.lis@intel.com>
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

This adds a documentation chapter, containing high level flow
of VF restore procedure.

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_vf.h | 93 ++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
index 7b8622cff2b7..22683dd643f8 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
@@ -8,6 +8,99 @@
 
 struct xe_device;
 
+/**
+ * DOC: VF restore procedure in PF KMD and VF KMD
+ *
+ * Restoring previously saved state of a VF is one of core features of
+ * SR-IOV. All major VM Management applications allow saving and restoring
+ * the VM state, and doing that to a VM which uses SRIOV VF as one of
+ * the accessible devices requires support from KMD on both PF and VF side.
+ * VMM initiates all required operations through VFIO module, which then
+ * translates them into PF KMD calls. This description will focus on these
+ * calls, leaving out the module which initiates these steps (VFIO).
+ *
+ * In order to start the restore procedure, GuC needs to keep the VF in
+ * proper state. The PF driver can ensure VF entered this state by
+ * performing Function Level Reset on said VF. The FLR procedure ends with
+ * GuC sending message `GUC_PF_NOTIFY_VF_FLR_DONE`, and then the actual
+ * restore can begin.
+ *
+ * During VF Restore, state of several resources is restored. These may
+ * include local memory content (system memory is restored by VMM itself),
+ * values of MMIO registers, stateless compression metadata and others.
+ * The final resource which also needs restoring is state of the VF
+ * submission maintained within GuC. For that, `GUC_PF_OPCODE_VF_RESTORE`
+ * message is used, with reference to the state blob to be consumed by
+ * GuC.
+ *
+ * Next, when VFIO is asked to set the VM into running state, the PF driver
+ * sends `GUC_PF_TRIGGER_VF_RESUME` to GuC. When sent after restore, this
+ * changes VF state within GuC to `VF_RESFIX_BLOCKED` rather than the
+ * usual `VF_RUNNING`. At this point GuC triggers an interrupt to inform
+ * the VF KMD within the VM that it was migrated.
+ *
+ * As soon as Virtual GPU of the VM starts, the VF driver within receives
+ * the MIGRATED interrupt and schedules post-migration recovery worker.
+ * That worker queries GuC for new provisioning (using MMIO communication),
+ * and applies fixups to any non-virtualized resources used by the VF.
+ *
+ * When the VF driver is ready to continue operation on the newly connected
+ * hardware, it sends `VF2GUC_NOTIFY_RESFIX_DONE` which causes it to
+ * enter the long awaited `VF_RUNNING` state, and therefore start handling
+ * CTB messages and scheduling workloads from the VF::
+ *
+ *      PF                             GuC                              VF
+ *     [ ]                             [ ]                              |
+ *     [ ] GUC_PF_NOTIFY_VF_FLR_DONE   [ ]                              |
+ *     [ ] <---------------------------[ ]                              |
+ *     [ ]                              |                               |
+ *     [ ] PF loads resources from the  |                               |
+ *     [ ]------- saved image supplied  |                               |
+ *     [ ]      |                       |                               |
+ *     [ ] <-----                       |                               |
+ *     [ ]                              |                               |
+ *     [ ] GUC_PF_OPCODE_VF_RESTORE     |                               |
+ *     [ ]---------------------------> [ ]                              |
+ *     [ ]                             [ ]  GuC loads contexts and CTB  |
+ *     [ ]                             [ ]------- state from image      |
+ *     [ ]                             [ ]      |                       |
+ *     [ ] success                     [ ] <-----                       |
+ *     [ ] <---------------------------[ ]                              |
+ *     [ ]                              |                               |
+ *     [ ] GUC_PF_TRIGGER_VF_RESUME     |                               |
+ *     [ ]---------------------------> [ ]                              |
+ *     [ ]                             [ ]  GuC sets new VF state to    |
+ *     [ ]                             [ ]------- VF_RESFIX_BLOCKED     |
+ *     [ ]                             [ ]      |                       |
+ *     [ ]                             [ ] <-----                       |
+ *     [ ]                             [ ]                              |
+ *     [ ]                             [ ] GUC_INTR_SW_INT_0            |
+ *     [ ] success                     [ ]---------------------------> [ ]
+ *     [ ] <---------------------------[ ]                             [ ]
+ *      |                               |      VF2GUC_QUERY_SINGLE_KLV [ ]
+ *      |                              [ ] <---------------------------[ ]
+ *      |                              [ ]                             [ ]
+ *      |                              [ ]        new VF provisioning  [ ]
+ *      |                              [ ]---------------------------> [ ]
+ *      |                               |                              [ ]
+ *      |                               |       VF driver applies post [ ]
+ *      |                               |      migration fixups -------[ ]
+ *      |                               |                       |      [ ]
+ *      |                               |                       -----> [ ]
+ *      |                               |                              [ ]
+ *      |                               |    VF2GUC_NOTIFY_RESFIX_DONE [ ]
+ *      |                              [ ] <---------------------------[ ]
+ *      |                              [ ]                             [ ]
+ *      |                              [ ]  GuC sets new VF state to   [ ]
+ *      |                              [ ]------- VF_READY             [ ]
+ *      |                              [ ]      |                      [ ]
+ *      |                              [ ] <-----                      [ ]
+ *      |                              [ ]                     success [ ]
+ *      |                              [ ]---------------------------> [ ]
+ *      |                               |                               |
+ *      |                               |                               |
+ */
+
 void xe_sriov_vf_init_early(struct xe_device *xe);
 void xe_sriov_vf_start_migration_recovery(struct xe_device *xe);
 
-- 
2.25.1

