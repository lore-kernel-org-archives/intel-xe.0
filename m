Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496C8D44D75
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 14:15:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182EF10E2DF;
	Wed,  6 Nov 2024 14:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VL/evXV9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4C710E2DF
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Nov 2024 14:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730902549; x=1762438549;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lJqMeNLderbcah9wO2LPJgoQvwDuPcV0L6aqhSIfnkU=;
 b=VL/evXV99EMa4EYr0gR98BflZdIYNmTMYrBPWJ1oYXon1FC3WEknQsdP
 8r0dSa83zimF1Y7cf0v4wUI2dEq+DJmRt+EJUrR+VXN5jxG0OS28etpy7
 m9On/xnCzivngDFK8721ZYqg+qCjSGBbh+TNRbkGhL6C8FTjWbGlLQK4+
 ZuoFBINaNP92Oo9yHCbN+T732iBHJmf2cFd20IJcx6AkwIgye1d4xPfyb
 6HJMq5BiYw/U3QDMx6sEPea0dr9ZzfC5BhUmLRFC9t8BvpQdi4gnsWd+N
 CSiIbqNKpwrK6IGQlFdUsK4E2j/i6Jc9yWWjPUa6VufDDjwUtivOU6/OG w==;
X-CSE-ConnectionGUID: Itg2wi9PRO+sumzzzGzIDA==
X-CSE-MsgGUID: KcVRnADHRDiqckujPVAexQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="33545981"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="33545981"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 06:15:48 -0800
X-CSE-ConnectionGUID: 45dGoobVQSKn38kaNfMwgA==
X-CSE-MsgGUID: 1MBq5/XoQQegHdyAbokHgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="88532466"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.98.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 06:15:47 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Tomasz Lis <tomasz.lis@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v3 2/5] drm/xe/vf: Document SRIOV VF restore flow
Date: Wed,  6 Nov 2024 15:15:14 +0100
Message-Id: <20241106141514.2035-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20241104213449.1455694-3-tomasz.lis@intel.com>
References: <20241104213449.1455694-3-tomasz.lis@intel.com>
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

From: Tomasz Lis <tomasz.lis@intel.com>

This adds a documentation chapter, containing high level flow
of VF restore procedure.

v2: Better describe initial conditions, include GuC states on
  sequence diagram (Michal)
v3: moved DOC to .c (Michal)

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_vf.c | 107 +++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index 2fe49296a79d..ab334cea2a1c 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -12,6 +12,113 @@
 #include "xe_sriov_printk.h"
 #include "xe_sriov_vf.h"
 
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
+ * proper state. The PF driver can ensure GuC set it to VF_READY state
+ * by provisioning the VF, which in turn can be done after Function Level
+ * Reset of said VF (or after it was freshly created - in that case FLR
+ * is not needed). The FLR procedure ends with GuC sending message
+ * `GUC_PF_NOTIFY_VF_FLR_DONE`, and then provisioning data is sent to GuC.
+ * After the provisioning is completed, the VF needs to be paused, and
+ * at that point the actual restore can begin.
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
+ *     [ ]                              |                               |
+ *     [ ] PF2GUC_VF_CONTROL(pause)     |                               |
+ *     [ ]---------------------------> [ ]                              |
+ *     [ ]                             [ ]  GuC sets new VF state to    |
+ *     [ ]                             [ ]------- VF_READY_PAUSED       |
+ *     [ ]                             [ ]      |                       |
+ *     [ ]                             [ ] <-----                       |
+ *     [ ] success                     [ ]                              |
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
+ *     [ ]                             [ ] <-----                       |
+ *     [ ]                             [ ]                              |
+ *     [ ]                             [ ]  GuC sets new VF state to    |
+ *     [ ]                             [ ]------- VF_RESFIX_PAUSED      |
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
+ *      |                              [ ]------- VF_RUNNING           [ ]
+ *      |                              [ ]      |                      [ ]
+ *      |                              [ ] <-----                      [ ]
+ *      |                              [ ]                     success [ ]
+ *      |                              [ ]---------------------------> [ ]
+ *      |                               |                               |
+ *      |                               |                               |
+ */
+
 static void migration_worker_func(struct work_struct *w);
 
 /**
-- 
2.43.0

