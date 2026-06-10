Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06062CD98CC
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 21:28:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B6E10EBF9;
	Wed, 10 Jun 2026 21:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DTBqeLBk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5718010EBF9
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 21:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781126919; x=1812662919;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=INdUSoP3ZFj/1y6SjgGyX/VlPkGfy+KpWDdIasiEbfc=;
 b=DTBqeLBkFj/7xcV/cDlY+myG1ShzG1aNS2iICph+qiyYkabmjIS9sukF
 eMJYr7ZBP1+1k3LJtRzqZgv/EAAQh/ihd081FZB5aK9uvWwTJccFCQAA4
 R+9Yrw5rCOeNsz01A9dKgkeeDgQFqR5tx4p0+msRUUUaZBxAGiifL+u+0
 QrRPBq1XMegz2hafVXQYMRwW4B9EAE71GK6GDwL335B4meDvx6RUYNSjj
 DMzKqwmD+Z/JJuabXcAlvOQ9THE51loQFlbgwvPsKiSuyvR1zkii88kKr
 1x9YRHjnRHMvVeMVdCLOlm3NC2XEdqqqVewI6ETk+Dt8CgjDxRMdWg3VJ g==;
X-CSE-ConnectionGUID: xdrrOfM2R+ijOaCYTf64NQ==
X-CSE-MsgGUID: A1yTeLbkTK+nKOY1BznOLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81934681"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="81934681"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 14:28:38 -0700
X-CSE-ConnectionGUID: qxLJaLdCRUm+2RgA/S6UuA==
X-CSE-MsgGUID: b0KQnjIPRIOt+ZsnyQPqKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="270292051"
Received: from dut4425arlh.fm.intel.com ([10.1.81.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 14:28:37 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: michal.wajdeczko@intel.com, ilia.levi@intel.com, x.wang@intel.com,
 rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 alan.previn.teres.alexis@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 02/11] drm/xe: Handle NULL in xe_exec_queue_get_unless_zero()
Date: Wed, 10 Jun 2026 21:28:34 +0000
Message-ID: <20260610212833.153366-15-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610212833.153366-13-stuart.summers@intel.com>
References: <20260610212833.153366-13-stuart.summers@intel.com>
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

The function currently dereferences @q unconditionally. Add a NULL
guard so callers can pass NULL without a crash, which simplifies
call sites that conditionally wrap the call.

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: Copilot:claude-sonnet-4.6
---
 drivers/gpu/drm/xe/xe_exec_queue.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 0225426c57b0..2624aa676517 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -38,7 +38,7 @@ void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance);
 static inline struct xe_exec_queue *
 xe_exec_queue_get_unless_zero(struct xe_exec_queue *q)
 {
-	if (kref_get_unless_zero(&q->refcount))
+	if (q && kref_get_unless_zero(&q->refcount))
 		return q;
 
 	return NULL;
-- 
2.43.0

