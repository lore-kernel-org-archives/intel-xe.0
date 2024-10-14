Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5BFCFC502
	for <intel-xe@archiver.kernel.org>; Mon, 14 Oct 2024 07:38:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B4E410E3AA;
	Mon, 14 Oct 2024 07:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jF4UlN55";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C72110E3A4
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Oct 2024 07:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728891493; x=1760427493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pyPKYo/UCb20P5k1kNcXIbUBqKMDUhTNJXYzcPAZrTc=;
 b=jF4UlN55BUM8THO8n6D9iydv6kkSRsj7Bu7bS9grmzpvY5Ez51kR1NOS
 d+gk75ApE8gyAvlVEZKnGBJL/2QUU6R22dj/T+VULZQlljMgwVYPE7dnt
 zvnsFGAjvHGlyeplNBLopr5OHl8wyzA5bgBcDXLa6+Bm/yndK97iVycIA
 clmSYcTnC3lShMRbQt6oGOhnpLUq4hrms+KManW1ZvOvqpz4QWIbxuSJf
 qH3HBB+MwrzsxF5aIiY4PCm8zchG7GXiUDtppcG/hbaRZ7MhPBexLdfjn
 2oATg86A08HrczPEm4f0FeaBL/OSL1tu6dcPrPGQ634nAEQFwtrG49eZi Q==;
X-CSE-ConnectionGUID: QyXzIGN1SGqmtVhA/8OOjg==
X-CSE-MsgGUID: B3qnYrwKQ6u7/ElpsrWWGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="27686823"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="27686823"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 00:38:13 -0700
X-CSE-ConnectionGUID: nmMXjP1/QsO4F1rbtIjtdw==
X-CSE-MsgGUID: 1sDfJ5FgTSuM6cOLMupyOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="82268799"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orviesa005.jf.intel.com with ESMTP; 14 Oct 2024 00:38:11 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v9 25/26] drm/xe: Ensure __must_check for xe_force_wake_get()
 return
Date: Mon, 14 Oct 2024 13:26:00 +0530
Message-Id: <20241014075601.2324382-26-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
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

Add __must_check attribute for xe_force_wake_get().

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> (#rev1)
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/xe_force_wake.c | 4 ++--
 drivers/gpu/drm/xe/xe_force_wake.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 7f285dbe6e2c..c60db78c44e6 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -169,8 +169,8 @@ static int domain_sleep_wait(struct xe_gt *gt,
  * Return: opaque reference to woken domains or zero if none of requested
  * domains were awake.
  */
-unsigned int xe_force_wake_get(struct xe_force_wake *fw,
-			       enum xe_force_wake_domains domains)
+unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
+					    enum xe_force_wake_domains domains)
 {
 	struct xe_gt *gt = fw->gt;
 	struct xe_force_wake_domain *domain;
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index f0b27dbe7581..70faec9ae2d9 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -15,8 +15,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt,
 			   struct xe_force_wake *fw);
 void xe_force_wake_init_engines(struct xe_gt *gt,
 				struct xe_force_wake *fw);
-unsigned int xe_force_wake_get(struct xe_force_wake *fw,
-			       enum xe_force_wake_domains domains);
+unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
+					    enum xe_force_wake_domains domains);
 int xe_force_wake_put(struct xe_force_wake *fw,
 		      unsigned int fw_ref);
 
-- 
2.34.1

