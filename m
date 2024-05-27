Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227CCC25B74
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 11:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B573810E94D;
	Mon, 27 May 2024 11:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j4obMP6l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01AE610E94D
 for <intel-xe@lists.freedesktop.org>; Mon, 27 May 2024 11:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716810857; x=1748346857;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fausJq0gasfLhThNu0/QLeqT8ZL05uPTMzT87uo9ZjI=;
 b=j4obMP6lS0eS38OTXAoR3fG74bGwvLYVAH0xbzhEHpHRKCpivpZaElOd
 laBMQE4P6eJfWjb8/NDHv50+p57qY8/gF+/CzmfTWx6ysXyFY8fwzdNSq
 NmOAUV3IG6uDAb/UgVDmm3k2W21ASX4ARMiff155+Wqg9s6OmI6/jMOC1
 PdsQAO6SDvdBzwtwYgUeOIpUn9/qNKI8xhxZprMLPsbFCONTCkywlTMn2
 QfOUxL7IDCtHU8dv/ngvRMatFJ4bDPz9jAskD4ZQN6nt+M2FBT+suMNO/
 DKl8dqn9ia7SebIf/MigmeRmfewICzDEYO4cbw/pQB01GU7gnsviyPTwY g==;
X-CSE-ConnectionGUID: We2JnE+CTM+qFvCjXZEntg==
X-CSE-MsgGUID: Inr9c8pxQqe3Tz8CLqJqYA==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="16073227"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="16073227"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 04:54:16 -0700
X-CSE-ConnectionGUID: W/mNdDlWQzaTnyRdYPy+ug==
X-CSE-MsgGUID: YIKXm20ZSuKa9AFo4ZU4/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="39522557"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.33.240])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 04:54:15 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/pf: Update the LMTT when freeing VF GT config
Date: Mon, 27 May 2024 13:54:08 +0200
Message-Id: <20240527115408.1064-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

The LMTT must be updated whenever we change the VF LMEM configuration.
We missed that step when freeing the whole VF GT config, which could
result in stale PTE in LMTT or LMTT PT object leaks. Fix that.

Fixes: ac6598aed1b3 ("drm/xe/pf: Add support to configure SR-IOV VFs")
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index f678cd1ad9c5..f49fc2917f93 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1842,6 +1842,7 @@ static void pf_release_vf_config(struct xe_gt *gt, unsigned int vfid)
 	if (!xe_gt_is_media_type(gt)) {
 		pf_release_vf_config_ggtt(gt, config);
 		pf_release_vf_config_lmem(gt, config);
+		pf_update_vf_lmtt(gt_to_xe(gt), vfid);
 	}
 	pf_release_config_ctxs(gt, config);
 	pf_release_config_dbs(gt, config);
-- 
2.43.0

