Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB09C0219E
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 09:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F090210E1C6;
	Wed, 12 Feb 2025 09:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g+jsjNrD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11CA10E1C6
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Feb 2025 09:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739352735; x=1770888735;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NSzuB+QpzgGs6xfHUsQu7iCMufX9OrIzsGphHQQmeY8=;
 b=g+jsjNrDlpzQ+8pNhX61j4OtAYzgDK7/e9LRDAHpdiR+Reyd1pF6OEUk
 9I35MnT82jos1AqnYonyokSu1BJEc6CdrcOtd5Wo79Ph/JSkZ6v2ju5C7
 AHL9nFXA2Majbj5NWRe8U9BA8UbfP2pTJF7r4xgtcBOTRHQieupGb/kP/
 2VZ3YaIC4wQDajsAI309htsb9ArUePvQBA5l8AvvUavKdiCHqbpyHnVFb
 UVgRNftZccAUQQ2WfcvDxJRlBNHFrh6H3BdXtmvOOAfBfM/u67BNkvb7s
 L5+j6kRoMUk8Ane8dt66MrQUW/rBqUoRHAhnosdBVecSQKvnMmNDwIDxs Q==;
X-CSE-ConnectionGUID: KaJtTGg2Q2qbmtIiVuIGVw==
X-CSE-MsgGUID: 9Fxz8rmnTc+w64Nl3sXR5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="51394375"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="51394375"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 01:32:15 -0800
X-CSE-ConnectionGUID: tpX5CB4SQNeeA0OTByqeJA==
X-CSE-MsgGUID: YRKGZiBNS3CzW5vafX6kjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113261056"
Received: from dut1069atsm.igk.intel.com ([10.211.176.182])
 by orviesa007.jf.intel.com with ESMTP; 12 Feb 2025 01:32:14 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, francois.dugast@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe: Add fault injection for xe_sync_entry_parse
Date: Wed, 12 Feb 2025 09:32:12 +0000
Message-Id: <20250212093212.3069356-1-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add fault injection for xe_sync_entry_parse to allow it to fail while
executing xe_vm_bind_ioctl().
This need to be added as it cannot be reached by injecting error through
IOCTL arguments.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 drivers/gpu/drm/xe/xe_sync.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 42f5bebd09e5..f87276df18f2 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -210,6 +210,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 
 	return 0;
 }
+ALLOW_ERROR_INJECTION(xe_sync_entry_parse, ERRNO);
 
 int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct xe_sched_job *job)
 {
-- 
2.34.1

