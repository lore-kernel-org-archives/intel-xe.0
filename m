Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7B5C369B8
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 06:58:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF89110E2A6;
	Tue, 15 Apr 2025 06:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NWhJof0V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE57310E2A6
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 06:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744700334; x=1776236334;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YcN/QN5+W961/DDmHWxqOUboHFmOMd7a/arfoqiVBr0=;
 b=NWhJof0VN+m2ootD9PP64LLcCQBR5bjFcG+op3eHeHWhZoZcGlsQo6p9
 o0ej2mL/eQsuVpJY+9SnjcRkghkLq3TM18iLUe5JPp6GDpkcrEEpSgIwB
 yGTd/9lhv7c/MYS6Ur3ikBv+6Ue61vliFpDcEW9W5jF/yq1UjxynPxg6X
 GzJOvdcC2fgmisVk1ir7Vo8IghR8tMa1bgI1RWcoABDlPYcBJLzbqN82B
 SHLzFGNCsr8CCPfl+nO8LHeHvpKNvx3JNPE8srMyzP0cnABt82W30bFWG
 yXDO1zMO9q2Nj9eAvSguo6u4dXjO1Wkf+duSaQsOdci23e42O18iPpS/g g==;
X-CSE-ConnectionGUID: DF7vcdTqTfCdemlaU4xViw==
X-CSE-MsgGUID: 0xKLyiDDQ8eMuYZNx4S+ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="63733261"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="63733261"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 23:58:54 -0700
X-CSE-ConnectionGUID: 3NWCPBM/SpWrao9Vsc8v5Q==
X-CSE-MsgGUID: rJS8YAb/ThaVH/9/c1pQ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="130360800"
Received: from gsd-build.iind.intel.com ([10.190.229.173])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 23:58:52 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com,
	tejas.upadhyay@intel.com
Subject: [PATCH 2/2] drm/xe: Add fault injection for xe_hw_engine_class_to_str
Date: Tue, 15 Apr 2025 06:42:11 +0000
Message-Id: <20250415064211.2889970-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415064211.2889970-1-sobin.thomas@intel.com>
References: <20250415064211.2889970-1-sobin.thomas@intel.com>
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

- Added fault injection for `xe_hw_engine_class_to_str` to enhance coverage.
- can be tested with igt@inject-fault-probe-function-xe_hw_engine_class_to_str

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 93241fd0a4ba..56d95635374a 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -1011,6 +1011,7 @@ const char *xe_hw_engine_class_to_str(enum xe_engine_class class)
 
 	return NULL;
 }
+ALLOW_ERROR_INJECTION(xe_hw_engine_class_to_str, NULL);
 
 u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
 {
-- 
2.34.1

