Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F79EC52CDA
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 14:17:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F3310E9A5;
	Fri, 26 Jul 2024 14:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BlYVupev";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139D010E9A2
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 14:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722003451; x=1753539451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HK6ER/OH/qybE0AgswMfGhBXdEsVmxNoZz2XqhkLRqk=;
 b=BlYVupevKSgX06/7tgyU9DX+H/T5a+2pPyFzQjWPsJEVuLgmFKyfqaN0
 0XRT1jI0UCL9/LOgyzLSYClVjYTXWkq/0EeDZXe1IHrs1LpU75JDA1m80
 wS7VlLc8vgFdk0re00hTjJ1DhO7T8OaVQXic7H3XLQ9J/ylwVOPTvSfgq
 WXxO1Qi3V8KVC4Ez9Fwqq+3XAeyg3jcz1ghS3XP//QPYsm/4hxollnOVO
 zxMUO7yAFz0uwXqHV2j62libkCQW8i8/BEdCqGU+jArwZU7zc8tIDppPj
 Igxiwg6t5B7SrK5DRT8iS03Ss/EWRPoa+O2OKKMceQi1XbuOFExpmUWQT Q==;
X-CSE-ConnectionGUID: HwO217FlReqVAd8ybkS3XA==
X-CSE-MsgGUID: PcFMCeGkTcCkpPCTGf3Okw==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="23598750"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="23598750"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:17:23 -0700
X-CSE-ConnectionGUID: 1ORgIw81QSy02PYYS2SNtw==
X-CSE-MsgGUID: r1bNYs+DTDyLZaab81ji2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="57861359"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:17:22 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 05/21] drm/xe/eudebug: Use ptrace_may_access for
 xe_eudebug_attach
Date: Fri, 26 Jul 2024 17:08:02 +0300
Message-Id: <20240726140818.54304-6-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
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

From: Jonathan Cavitt <jonathan.cavitt@intel.com>

xe_eudebug_attach wants to use ptrace_may_access for determining when
the user has the right to attach a debugger to a given process.  With
ptrace_may_access now exported, this has become possible.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_eudebug.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 8aab02824f8a..c4bc66660218 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -246,14 +246,13 @@ xe_eudebug_attach(struct xe_device *xe, struct xe_eudebug *d,
 {
 	struct task_struct *target;
 	struct xe_eudebug *iter;
-	kuid_t uid = current_uid();
 	int ret = 0;
 
 	target = find_get_target(pid_nr);
 	if (!target)
 		return -ENOENT;
 
-	if (!uid_eq(uid, task_uid(target)) && !capable(CAP_SYS_ADMIN)) {
+	if (!ptrace_may_access(target, PTRACE_MODE_READ_REALCREDS)) {
 		put_task_struct(target);
 		return -EACCES;
 	}
-- 
2.34.1

