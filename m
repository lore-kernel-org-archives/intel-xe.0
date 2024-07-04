Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6764C41513
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jul 2024 05:59:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7AF010E0AD;
	Thu,  4 Jul 2024 05:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WPSNDhVB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF2310E07F
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jul 2024 05:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720072763; x=1751608763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9TLrFAN9aGRmzBqzRDjSue3+RWDyuK0mJeXj/6l+tP4=;
 b=WPSNDhVB002p3EAxIFB2ewrP/3hjniNxPTcruEQk6fgIHRZX7tw5sihu
 sVWXyTmJnW9pA6bRmxk7BqU7qv8kmu0rWrlOouGsK8sOkO/h3en5L+ToB
 3OsZ0Ixikc/HLfjp9Av1RHc/3OK0u9Jn2PpCtJYEEivcg6R8ChfMjE1+4
 Zq3KHP93FkjGhuoGy9MaMem+GdXs7wE0zGwkGopS9VC17sfeYDl8zaLK8
 Yvh2Tdigx7h8n4QOC6+ZFa2BCXwXR/G7BvMHtH2OwIx5RrWSQvq/6WU8x
 x524y7YdHV2jRdj4yWBPXXzKrLAoIZlfRq/Fkan9ouB6Zo2SBsHn4YlRj Q==;
X-CSE-ConnectionGUID: RsxVO/q+Rv6PEHiRgFXlFQ==
X-CSE-MsgGUID: TbmCphi7R0aBB4+g49ICLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="28006995"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="28006995"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 22:59:23 -0700
X-CSE-ConnectionGUID: npiIPGs9SV6eadYWHF19uQ==
X-CSE-MsgGUID: yRy1yOxCSNaiKQB+3Pl0KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="50933280"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 22:59:20 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com
Subject: [PATCH v3 1/2] drm/xe: move GuC CT set state function to header
Date: Thu,  4 Jul 2024 11:42:02 +0530
Message-Id: <20240704061203.3464835-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240704061203.3464835-1-riana.tauro@intel.com>
References: <20240704061203.3464835-1-riana.tauro@intel.com>
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

Move GuC CT set state function to header file to be used by
runtime suspend and resume functions.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 4 ++--
 drivers/gpu/drm/xe/xe_guc_ct.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 7d2e937da1d8..9f183146a5ff 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -318,8 +318,8 @@ static int guc_ct_control_toggle(struct xe_guc_ct *ct, bool enable)
 	return ret > 0 ? -EPROTO : ret;
 }
 
-static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
-				enum xe_guc_ct_state state)
+void xe_guc_ct_set_state(struct xe_guc_ct *ct,
+			 enum xe_guc_ct_state state)
 {
 	mutex_lock(&ct->lock);		/* Serialise dequeue_one_g2h() */
 	spin_lock_irq(&ct->fast_lock);	/* Serialise CT fast-path */
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 190202fce2d0..ab073cd21657 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -14,6 +14,8 @@ int xe_guc_ct_init(struct xe_guc_ct *ct);
 int xe_guc_ct_enable(struct xe_guc_ct *ct);
 void xe_guc_ct_disable(struct xe_guc_ct *ct);
 void xe_guc_ct_stop(struct xe_guc_ct *ct);
+void xe_guc_ct_set_state(struct xe_guc_ct *ct,
+			 enum xe_guc_ct_state state);
 void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
 
 struct xe_guc_ct_snapshot *
-- 
2.40.0

