Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B5EC4829A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 21:49:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD63710E931;
	Tue, 13 Feb 2024 21:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hcHue3tY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB7810E931
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Feb 2024 21:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707860963; x=1739396963;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8JX3icNn0RU2Y/67NOJAak8GGLVJDCnpBnR8ekrTyrc=;
 b=hcHue3tYcd/ARqRauJJq0LyR7IR5o09hsdwM/gPJ1tOvznGzFqWy31x1
 ACAzxVKruQEm/qvGdZdgBe3LbCNA/PfXU9PAlMJ4V/5r3RDHVHabOmbqG
 7vrdv9guMuho4hqEjO4eeOgS1HGLbToSDGqdnk66bvRv5x5f7ELieToSP
 xM+/Bs/Ctjfb6v/Sc0mLbb4e8LIr3/YnaJQOfB1d45cSh5D+kGpB/XQJP
 bUvq9e/FRXnU93s1FxkD2aNqdp3gvB0Sip94CcZAkU8uOe30uTbRJnmDw
 UZ5h6YlX7OeYrYhPKBCHJVt4XH3VCimWi0AnygKYWO9wTTZv3/FUk07Te A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="13276769"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; d="scan'208";a="13276769"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 13:49:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="826224954"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; d="scan'208";a="826224954"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.153.144])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 13:49:17 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/guc: Fix include guard for SR-IOV ABI
Date: Tue, 13 Feb 2024 22:49:08 +0100
Message-Id: <20240213214908.1481-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

Use include guard macro name that follows naming used by the other
GuC ABI files.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
index 5496a5890847..fe7a93ce3aa5 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
@@ -3,8 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#ifndef _GUC_ACTIONS_PF_ABI_H
-#define _GUC_ACTIONS_PF_ABI_H
+#ifndef _ABI_GUC_ACTIONS_SRIOV_ABI_H
+#define _ABI_GUC_ACTIONS_SRIOV_ABI_H
 
 #include "guc_communication_ctb_abi.h"
 
-- 
2.43.0

