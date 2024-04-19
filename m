Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995A8C04FFE
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 12:36:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FAD10FEAC;
	Fri, 19 Apr 2024 12:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OtMWvF/V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6B810FEC0
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 12:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713530160; x=1745066160;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=v5ErWGp1lHnTvS1hFMi+GcpFZmRiBbOYNanMSjjDsHo=;
 b=OtMWvF/VJDjH64GOb4rcLYkHzxCaWayfxLoi/ModopjDFG5XLbCpo1IM
 8Hn/VPUhqnWVSo9n4utbdakvpmMmHmOMmnhx+Ry05m7vtc5RiW64gQeay
 fCX9eN8rEqpEfgMGmcJbML7TfaOWYn8XeZhPvzvlZ719H5IPkDtEFl7Mr
 F6EiitVu/udYwwLvveVi3i4vs+TQe09KT2xWWZYZOOOjTeJh6PPI3Nc9J
 mhQbSoUouoMNBocx06o4waChliUH4CzLUSKtgm+JIZxU+S1nUH7aXVol/
 v9/A55M2XCjfEnr97Fw9L85xPSoQ4X2MimLy/+80RvOBBJ4lkBxteg/SY Q==;
X-CSE-ConnectionGUID: 3qff627GTOy7xvBLiAGoxg==
X-CSE-MsgGUID: MdVEUKMrQUKPSs/qv4FgyA==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="12918893"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="12918893"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 05:36:00 -0700
X-CSE-ConnectionGUID: 47v2EgJOQO+0iEGqbSAfYQ==
X-CSE-MsgGUID: ZZ8oEzf0T62mpWyHDJioDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="23185868"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.63.117])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 05:35:59 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/2] drm/xe/guc: Update VF configuration KLVs definitions
Date: Fri, 19 Apr 2024 14:35:42 +0200
Message-Id: <20240419123543.270-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240419123543.270-1-michal.wajdeczko@intel.com>
References: <20240419123543.270-1-michal.wajdeczko@intel.com>
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

GuC firmware specification says that maximum value for the execution
quantum KLV is 100s and anything exceeding that will be clamped.
The same limitation applies to the preemption timeout KLV.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 511cf974d585..e53ffaee2fcd 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -201,7 +201,11 @@ enum  {
  *      it to take effect. Such cases might typically happen on a 1PF+1VF
  *      Virtualization config enabled for heavier workloads like AI/ML.
  *
+ *      The max value for this KLV is 100 seconds, anything exceeding that
+ *      will be clamped to the max.
+ *
  *      :0: infinite exec quantum (default)
+ *      :100000: maximum exec quantum (100000ms == 100s)
  *
  * _`GUC_KLV_VF_CFG_PREEMPT_TIMEOUT` : 0x8A02
  *      This config sets the VF-preemption-timeout in microseconds.
@@ -219,7 +223,11 @@ enum  {
  *      on a 1PF+1VF Virtualization config enabled for heavier workloads like
  *      AI/ML.
  *
+ *      The max value for this KLV is 100 seconds, anything exceeding that
+ *      will be clamped to the max.
+ *
  *      :0: no preemption timeout (default)
+ *      :100000000: maximum preemption timeout (100000000us == 100s)
  *
  * _`GUC_KLV_VF_CFG_THRESHOLD_CAT_ERR` : 0x8A03
  *      This config sets threshold for CAT errors caused by the VF.
@@ -291,9 +299,11 @@ enum  {
 
 #define GUC_KLV_VF_CFG_EXEC_QUANTUM_KEY		0x8a01
 #define GUC_KLV_VF_CFG_EXEC_QUANTUM_LEN		1u
+#define GUC_KLV_VF_CFG_EXEC_QUANTUM_MAX_VALUE	100000u
 
-#define GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_KEY	0x8a02
-#define GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_LEN	1u
+#define GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_KEY		0x8a02
+#define GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_LEN		1u
+#define GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_MAX_VALUE	100000000u
 
 #define GUC_KLV_VF_CFG_THRESHOLD_CAT_ERR_KEY		0x8a03
 #define GUC_KLV_VF_CFG_THRESHOLD_CAT_ERR_LEN		1u
-- 
2.43.0

