Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D2FC0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 20:00:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F35CA10E887;
	Wed, 29 Jan 2025 20:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PzNClY+C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C11810E887
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jan 2025 20:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738180802; x=1769716802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OaGqKouARwETcdr4oSU1OoJxKm1A6AF4rICLghUufC8=;
 b=PzNClY+Cg9u2l7Fqt1FkWMbAekgZ9567pNpa8UatB4TI3bH5BnL1p1cD
 dQ3etRP1hYMOyWzrG97NVDJ4x9Mg/WxvbeqKEVpxkmwfOzZ5Hj3l4+AFm
 jnBfClGs65jv7lmzr99loxO1ijps8a83YHz8clNi2tb0SgYmcvo8qZp3P
 SOctIAMiv9J4+yzWj/l9bORGCwpZ1dE8X5/WqLxj+0Ls/tIBoeYSORgmk
 fAsGkojk1XQkj5qVc6pHWIsqlgEq+tBd8Nh1/HYDU/vHegNE/QqWwZblL
 lHCzoT96c2rtEbv/9aSu2OhwnSL4SIrkrHQD1AewzbSWZuS3Jt4r5NpGZ g==;
X-CSE-ConnectionGUID: J0KkL5/xTTGO9XNCiByFwQ==
X-CSE-MsgGUID: 10dBxT2WT1a3RLhbtf01zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50134001"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50134001"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 12:00:02 -0800
X-CSE-ConnectionGUID: 8Iu2VxZ/Q/aXDjXWDwNI6g==
X-CSE-MsgGUID: vBRyfvg4QNO+oJ46Erji8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="109710069"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.5.201])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 12:00:01 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 1/2] drm/xe/pf: Don't send BEGIN_ID if VF has no
 context/doorbells
Date: Wed, 29 Jan 2025 20:59:46 +0100
Message-Id: <20250129195947.764-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250129195947.764-1-michal.wajdeczko@intel.com>
References: <20250129195947.764-1-michal.wajdeczko@intel.com>
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

It turned out that GuC validates VF configuration immediately
after receiving "some" set of configuration KLVs and complains
if one of the critical, from GuC understanding, resource is left
unprovisioned, even if PF should be still allowed to make late VF
config adjustments, since VF was not yet started.

This issue was discovered after we decided to asynchronously
re-send configuration KLVs after GT reset/resume, as then fair
VF auto-provisioning could already allocate some of the resources,
which was a prerequiste for sending those config KLVs:

 # fair GGTT provisioning
 [] xe 0000:00:02.0: [drm] GT0: PF: pushed VF1 config with 2 KLVs:
 [] xe 0000:00:02.0: [drm] GT0: { key 0x0001 : 64b value 0x176a000 } # ggtt_start
 [] xe 0000:00:02.0: [drm] GT0: { key 0x0002 : 64b value 0xfd696000 } # ggtt_size
 [] xe 0000:00:02.0: [drm] GT0: PF: VF1 provisioned with 4251541504 (3.96 GiB) GGTT
 # re-provisioning worker
 [] xe 0000:00:02.0: [drm] *ERROR* GT0: H2G request 0x5503 failed: error 0x60 hint 0x0
 [] xe 0000:00:02.0: [drm] GT0: PF: Failed to push VF1 14 config KLVs (-EIO)
 [] xe 0000:00:02.0: [drm] GT0: { key 0x0001 : 64b value 0x176a000 } # ggtt_start
 [] xe 0000:00:02.0: [drm] GT0: { key 0x0002 : 64b value 0xfd696000 } # ggtt_size
 [] xe 0000:00:02.0: [drm] GT0: { key 0x8a0b : 32b value 0 } # begin_ctx_id
 [] xe 0000:00:02.0: [drm] GT0: { key 0x0004 : 32b value 0 } # num_contexts
 [] xe 0000:00:02.0: [drm] GT0: { key 0x8a0a : 32b value 0 } # begin_db_id
 [] xe 0000:00:02.0: [drm] GT0: { key 0x0006 : 32b value 0 } # num_doorbells
 [] xe 0000:00:02.0: [drm] GT0: { key 0x8a01 : 32b value 0 } # exec_quantum
 [] xe 0000:00:02.0: [drm] GT0: { key 0x8a02 : 32b value 0 } # preempt_timeout
 [] xe 0000:00:02.0: [drm] GT0: { key 0x8a03 : 32b value 0 } # cat_error_count
 [] xe 0000:00:02.0: [drm] GT0: { key 0x8a04 : 32b value 0 } # engine_reset_count
 [] xe 0000:00:02.0: [drm] GT0: { key 0x8a05 : 32b value 0 } # page_fault_count
 [] xe 0000:00:02.0: [drm] GT0: { key 0x8a06 : 32b value 0 } # guc_time_us
 [] xe 0000:00:02.0: [drm] GT0: { key 0x8a07 : 32b value 0 } # irq_time_us
 [] xe 0000:00:02.0: [drm] GT0: { key 0x8a08 : 32b value 0 } # doorbell_time_us
 [] xe 0000:00:02.0: [drm] GT0: PF: Failed to push VF1 configuration (-EIO)

To avoid such errors stop sending BEGIN_CONTEXT/DOORBELL_ID KLVs
if no GuC context/doorbell IDs were provisioned to VF.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4176
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 9db1c920219d..c219c55f23ab 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -264,7 +264,7 @@ static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool
 
 	n += encode_config_ggtt(cfg, config, details);
 
-	if (details) {
+	if (details && config->num_ctxs) {
 		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_BEGIN_CONTEXT_ID);
 		cfg[n++] = config->begin_ctx;
 	}
@@ -272,7 +272,7 @@ static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool
 	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_NUM_CONTEXTS);
 	cfg[n++] = config->num_ctxs;
 
-	if (details) {
+	if (details && config->num_dbs) {
 		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_BEGIN_DOORBELL_ID);
 		cfg[n++] = config->begin_db;
 	}
-- 
2.47.1

