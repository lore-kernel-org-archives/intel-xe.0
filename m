Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C80CFD65A
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 15:54:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF05110E1A9;
	Wed,  7 Jan 2026 15:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="linY6gK3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E3910E1A9
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jan 2026 15:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767801269; x=1799337269;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s34MYtGh0JXAOpGak3mwOo37VuxcNsUc7BuQy6vVAGk=;
 b=linY6gK3PiBBfWStMUh26X0SmgmoiixRS0OTyF2gd/naaWtqH+eIKOnm
 CFgkQYA1HUaEi94mcGv/rJnaik+7lCH4AsULLwjgFk9awhoeai5FVjqJy
 WBdEN8FPuQAPMoMapomfyGXYOhyl4tVeExujWq0nueGC3facJFR5DJ1Zy
 uBtbSe2nrW5Q7JdZWtjLaygrns8JGQHUeM0tCJoder0AbjFzicMwHVYUy
 b/Nk8f9ZtE4pF7knmq368ce9dk6bLwnJJzH2tfiDyyGvwre7bSZXyBYV3
 6ztJ2bbdkV9M5szN2uYwEu7wYidiNrPyfqibsIp9DyLeBxTJfWBZwuMiL A==;
X-CSE-ConnectionGUID: GVxThiETShSrlPUJR56n6A==
X-CSE-MsgGUID: 6OZw8QK3RTyi3549TBFJmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="56734590"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="56734590"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 07:54:29 -0800
X-CSE-ConnectionGUID: TBYPXIJXT/KB2YxvnaYyJQ==
X-CSE-MsgGUID: uvweaiZHQ/KERsz4GuSwVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="207109415"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.60])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 07:54:26 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 4/5] drm/xe/vm: fix xe_vm_validation_exec() kernel-doc
Date: Wed,  7 Jan 2026 17:54:00 +0200
Message-ID: <20260107155401.2379127-4-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260107155401.2379127-1-jani.nikula@intel.com>
References: <20260107155401.2379127-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Fix kernel-doc warnings on xe_vm_validation_exec():

Warning: ../drivers/gpu/drm/xe/xe_vm.h:392 expecting prototype for
  xe_vm_set_validation_exec(). Prototype was for xe_vm_validation_exec()
  instead

Fixes: 0131514f9789 ("drm/xe: Pass down drm_exec context to validation")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 7d11ca47d73e..6cc98df47291 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -382,7 +382,7 @@ static inline void xe_vm_set_validation_exec(struct xe_vm *vm, struct drm_exec *
 }
 
 /**
- * xe_vm_set_validation_exec() - Accessor to read the drm_exec object
+ * xe_vm_validation_exec() - Accessor to read the drm_exec object
  * @vm: The vm we want to register a drm_exec object with.
  *
  * Return: The drm_exec object used to lock the vm's resv. The value
-- 
2.47.3

