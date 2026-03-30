Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B668B1061B1E
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 20:41:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CEF210E7D8;
	Mon, 30 Mar 2026 20:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jTWfXXnh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D9F10E7D8
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Mar 2026 20:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774903259; x=1806439259;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JfwmwOAZgeRVXt4TKZgCa1LOQI8VRxQKdU/hiQCCEpk=;
 b=jTWfXXnhySgemfgccPFGoqSVCtwz314DMfH8a3JNm6w5/O2am4IUY/xN
 tQszu2JNL2CxXlhB49kdUOzSNp3gLE0IUtsq4Oyek65fOpTObAom8Jon5
 b+pfdbB5WlaQtmPJS82JYeW1AsWiLhbIiACwI6quOgifvnwzXPHVswa3D
 HRdHgULm/R+YW/j906vVCgjDt7tITObirqA7DD4G4ba36Dcf0zGyOcU4X
 o9Ttk/SEhGSjfHry4c+9S4aPUMM0MdsI32FQOhtkrXPxfpfr9ZcJHERzN
 asm4zPyME5D6wLvyGnghtpEFEbnaNb3wXHEVVu55e9e/bqzwE+1+bKh0I A==;
X-CSE-ConnectionGUID: bMomYSQOQo+ohszwjOcluA==
X-CSE-MsgGUID: 2OnqK/N7T9e2imEPOKBWCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75923697"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="75923697"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 13:40:59 -0700
X-CSE-ConnectionGUID: oYMMzhjdQPWGLwx8H0At3A==
X-CSE-MsgGUID: ymCUbNikQ6eT00mMrgHysA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="225329330"
Received: from liyantan-mobl1.gar.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.17.179])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 13:40:58 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 01/13] drm/xe/guc: Update POLICY_SCHED_IF_IDLE documentation
Date: Mon, 30 Mar 2026 22:40:32 +0200
Message-ID: <20260330204046.567-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330204046.567-1-michal.wajdeczko@intel.com>
References: <20260330204046.567-1-michal.wajdeczko@intel.com>
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

Starting from the GuC firmware version 70.12.0 the meaning of the
POLICY_SCHED_IF_IDLE has changed, which now acts as a bulk update
of the VF_CFG_SCHED_PRIORITY configurations of all VFs.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index e33bd622ab44..7106fad7beef 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -192,6 +192,13 @@ enum  {
  * `GuC KLV`_ keys available for use with PF2GUC_UPDATE_VGT_POLICY.
  *
  * _`GUC_KLV_VGT_POLICY_SCHED_IF_IDLE` : 0x8001
+ *      [From 70.12.0]
+ *      This config allows to update scheduling priority of PF and all VFs at once.
+ *      Setting this policy to 0 updates all VFs scheduling priorities to LOW, and
+ *      setting this policy to 1 updates all VFs scheduling priorities to NORMAL.
+ *      Those changes will take effect on the next VF-Switch event.
+ *
+ *      [Before 70.12.0]
  *      This config sets whether strict scheduling is enabled whereby any VF
  *      that doesn’t have work to submit is still allocated a fixed execution
  *      time-slice to ensure active VFs execution is always consistent even
-- 
2.47.1

