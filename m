Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07E3CAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 23:04:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251CA10E0CF;
	Thu,  2 Oct 2025 23:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kD+ZE1hQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2DA10E858
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 23:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759446288; x=1790982288;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g6wQHDqM/l1n16EmnhJ3NJnEajkPhM0hz4bpTTQa0jo=;
 b=kD+ZE1hQNYePWkM6FZa/ZOZYD1KAdhn176nZVjAKn2qQncswSFwx76vW
 2rbRdoprMX11YShHTJteZUxIW5Z7M6JmQgJl393tsS6mBpIJP/P+pM7dI
 d+t9dcRC7EuDuZzheWiuKWmT5/6HENqW/LR3SXjQYTQ3pu0VyzbQoNgky
 sg2kw07B6IuuChzy60oKD7YG4w1WNjUITu7uOwiU+SleXOU7u8QTKT4AT
 MqpcQwDbwOsffwtACeFU5iU0uFEz0zpfoSHFzo/JnzYSr0NtY0/u0f50l
 /J8vRTXs2Fi3avFGmmR5iLWa7IwDDH+8CP72sGZiYS9hC0SxD6wscxdWs A==;
X-CSE-ConnectionGUID: IuhYDT2PSGKhtpXT7nxuFg==
X-CSE-MsgGUID: An7q6vVJQEuK5fhC2+/yHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="79165580"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="79165580"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 16:04:47 -0700
X-CSE-ConnectionGUID: Upgb5JhASTWvFvV5SPd24w==
X-CSE-MsgGUID: TniJOOQpQdq3FQuLAt0i+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="179566722"
Received: from dut4351arlh.fm.intel.com ([10.105.10.106])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 16:04:46 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: intel-xe@lists.freedesktop.org, Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 3/7] drm/xe: Add the BO pointer info to the BO trace
Date: Thu,  2 Oct 2025 23:04:40 +0000
Message-Id: <20251002230444.313505-4-stuart.summers@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002230444.313505-1-stuart.summers@intel.com>
References: <20251002230444.313505-1-stuart.summers@intel.com>
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

Just a little extra detail to make BOs easier to track
through the trace event log.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_trace_bo.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
index 238311cfb816..0d795733e0f0 100644
--- a/drivers/gpu/drm/xe/xe_trace_bo.h
+++ b/drivers/gpu/drm/xe/xe_trace_bo.h
@@ -27,6 +27,7 @@ DECLARE_EVENT_CLASS(xe_bo,
 
 		    TP_STRUCT__entry(
 			     __string(dev, __dev_name_bo(bo))
+			     __field(struct xe_bo *, bo)
 			     __field(size_t, size)
 			     __field(u32, flags)
 			     __field(struct xe_vm *, vm)
@@ -34,13 +35,14 @@ DECLARE_EVENT_CLASS(xe_bo,
 
 		    TP_fast_assign(
 			   __assign_str(dev);
+			   __entry->bo = bo;
 			   __entry->size = xe_bo_size(bo);
 			   __entry->flags = bo->flags;
 			   __entry->vm = bo->vm;
 			   ),
 
-		    TP_printk("dev=%s, size=%zu, flags=0x%02x, vm=%p",
-			      __get_str(dev), __entry->size,
+		    TP_printk("dev=%s, %p, size=%zu, flags=0x%02x, vm=%p",
+			      __get_str(dev), __entry->bo, __entry->size,
 			      __entry->flags, __entry->vm)
 );
 
-- 
2.34.1

