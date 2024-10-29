Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968CED74943
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 21:44:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB8110E3B1;
	Tue, 29 Oct 2024 21:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WLcnyCNj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E765A10E3B6
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 21:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730238257; x=1761774257;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vg3y+vD7EE3o7TGHxZKYEcfYPaA/GxIv4TrChEOlsuU=;
 b=WLcnyCNjcsnl5IIrsU+KCcr73Nb7Cz0byIR1qn/LK07q6In4wp1n216p
 NcyWbi+A9gZcdMQSJARNsNj8skxpJ3Nonp12Q2rx5fj55K5O0qghQqpw9
 7d90bG+aC2fCChY73gKFQ9gaSBgUOCYgYF4XL6iEPZUyXNfSYVpKESWGz
 ujCoXmcEk3iLsxRi/tNVezz0ppEMz0zzhiA3aNQQ/FVDWmAJ5xaYhfLrG
 pQuxxXeLgRQuAihTx3JPhLJCvfsMO09oY5V6kDwVXXPpRb9smCzwrKme+
 a/Cai5N3zZEboomO8rRVH3AEaQJv1wGhC+7ghbPaYevLsw4w63Frtdgay g==;
X-CSE-ConnectionGUID: BMASzISeQQmWOSGZs5U9pQ==
X-CSE-MsgGUID: woe2AwfbTqW3YOOLKcC8Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="40523811"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; d="scan'208";a="40523811"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 14:44:16 -0700
X-CSE-ConnectionGUID: tpr8YJsoTgu7H5qvAcAjhA==
X-CSE-MsgGUID: 56Cr5jOBQTiL0rSuvDqO1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; d="scan'208";a="119579600"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 14:44:16 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 3/4] drm/xe: Reword exec_queue.lock doc
Date: Tue, 29 Oct 2024 14:43:50 -0700
Message-ID: <20241029214351.776293-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029214351.776293-1-lucas.demarchi@intel.com>
References: <20241029214351.776293-1-lucas.demarchi@intel.com>
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

Reword documentation to possibly what it meant to be.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 85bede4dd6461..ef7412d653d2e 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -597,7 +597,7 @@ struct xe_file {
 		/** @vm.xe: xarray to store VMs */
 		struct xarray xa;
 		/**
-		 * @vm.lock: Protects VM lookup + reference and removal a from
+		 * @vm.lock: Protects VM lookup + reference and removal from
 		 * file xarray. Not an intended to be an outer lock which does
 		 * thing while being held.
 		 */
@@ -610,8 +610,8 @@ struct xe_file {
 		struct xarray xa;
 		/**
 		 * @exec_queue.lock: Protects exec queue lookup + reference and
-		 * removal a frommfile xarray. Not an intended to be an outer
-		 * lock which does thing while being held.
+		 * removal from file xarray. Not intended to be an outer lock
+		 * which does things while being held.
 		 */
 		struct mutex lock;
 	} exec_queue;
-- 
2.47.0

