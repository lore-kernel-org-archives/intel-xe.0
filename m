Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36ED2E63F12
	for <intel-xe@archiver.kernel.org>; Sun, 15 Feb 2026 20:33:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC5710E231;
	Sun, 15 Feb 2026 20:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YEdfZE4F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66ABF10E0A3
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Feb 2026 20:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771187624; x=1802723624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JEnG4WhiNRBhzr1XikuIfIyWA6tUnJ6ZZKZy8mO71OQ=;
 b=YEdfZE4FefGv6um8l+4vdeqDYMZHbE6fIY2KOcRGxP2w5nq9nZfVNC06
 PQgAJeSkrCwW2T6gr1ihaGW1xWHK1qT/y8tgqIjFeOxWPwFoAF7VJzP6s
 /fc6Af9Axg85BOhw9nh2y2jFhMqrSjTtxnUDOYhN5qCwqaVzKkFBn9Vvd
 2HvXHoysiJ6EWtkMAsU/XwYmmppKDJ4gSNV2R1OLc+w3ip9Cf1c3+urD/
 3sa1k43n+gwDtASi8yvNzbP/ceD3ipsNJmd0MX4AJtr4PDDMa9o05AaiP
 4+1eVnnNHU0V2H6zVhUGluDQ6DDsOni/4uuBxju5fMJsBL6O1L0gjdPd6 Q==;
X-CSE-ConnectionGUID: E0N5R+TIRgucnPqVcU7wfg==
X-CSE-MsgGUID: w0o0heRmR7CzocgJQMJKUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="71996390"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="71996390"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2026 12:33:44 -0800
X-CSE-ConnectionGUID: 5je+01wcTSSMzmtT0PLJMA==
X-CSE-MsgGUID: TLSL7vWyRv+ueR7AJ46ZfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="251096599"
Received: from shealy-mobl3.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.64.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2026 12:33:44 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 4/9] drm/xe/pf: Use migration-friendly VRAM auto-provisioning
Date: Sun, 15 Feb 2026 21:33:18 +0100
Message-ID: <20260215203323.595-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260215203323.595-1-michal.wajdeczko@intel.com>
References: <20260215203323.595-1-michal.wajdeczko@intel.com>
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

Instead of trying very hard to find the largest fair VRAM (aka LMEM)
size that could be allocated for VFs on the current tile, pick some
smaller rounded down to power-of-two value that is more likely to be
provisioned in the same manner by the other PF instances.

In some cases, the outcome of above calculation might not be optimal,
but it's expected that admin will do fine-tuning using sysfs files.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 23af49dc1bfa..43041af81518 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1919,6 +1919,26 @@ static u64 pf_estimate_fair_lmem(struct xe_gt *gt, unsigned int num_vfs)
 	return fair;
 }
 
+static u64 pf_profile_fair_lmem(struct xe_gt *gt, unsigned int num_vfs)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+	bool admin_only_pf = xe_sriov_pf_admin_only(tile->xe);
+	u64 usable = xe_vram_region_usable_size(tile->mem.vram);
+	u64 shareable = ALIGN_DOWN(usable, SZ_1G);
+	u64 alignment = pf_get_lmem_alignment(gt);
+	u64 fair;
+
+	if (admin_only_pf)
+		fair = div_u64(shareable, num_vfs);
+	else
+		fair = div_u64(shareable, 1 + num_vfs);
+
+	if (!admin_only_pf && fair)
+		fair = rounddown_pow_of_two(fair);
+
+	return ALIGN_DOWN(fair, alignment);
+}
+
 /**
  * xe_gt_sriov_pf_config_set_fair_lmem - Provision many VFs with fair LMEM.
  * @gt: the &xe_gt (can't be media)
@@ -1932,6 +1952,7 @@ static u64 pf_estimate_fair_lmem(struct xe_gt *gt, unsigned int num_vfs)
 int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid,
 					unsigned int num_vfs)
 {
+	u64 profile;
 	u64 fair;
 
 	xe_gt_assert(gt, vfid);
@@ -1948,6 +1969,12 @@ int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid,
 	if (!fair)
 		return -ENOSPC;
 
+	profile = pf_profile_fair_lmem(gt, num_vfs);
+	fair = min(fair, profile);
+	if (fair < profile)
+		xe_gt_sriov_info(gt, "Using non-profile provisioning (%s %llu vs %llu)\n",
+				 "VRAM", fair, profile);
+
 	return xe_gt_sriov_pf_config_bulk_set_lmem(gt, vfid, num_vfs, fair);
 }
 
-- 
2.47.1

