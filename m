Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2470CAC59A
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 09:22:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9437C10E67A;
	Thu, 18 Sep 2025 09:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L57oYMAl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818A410E103
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 09:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758187351; x=1789723351;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cq7admhadtp1f5GjKzTymUD+vbVUrhVVgRQk7ncWN0E=;
 b=L57oYMAlu1XkqoQQQAQPVd5bL4Ir5y8F2RmoDFuv+u99iDXuhR7l9y24
 BhRF3cJVBMcw4XpwmR5NrQcIgleTcOys/SiW3s51UEQspPRTGd+okR4Oo
 uSh/kBIHnaUH0WWUCQsFVQU6dZyPjLdqVHyqIti25wOR9tLHdIBNd5VXv
 R26Q56bZThXfz4IX6KYnjGgLih0r1VfKO33xnmTGN+OqGUy83QNM1pqB2
 US/yhpPIHOn67hjZgbEd8kNTdugnSEyuX7izzFiVycwbM/RK47TzcB5Cf
 DjmhVNTlQazy6sJ0W11apGYq16w8msMSqmk0dNHHX0gNtjHkaGTsrAiWW A==;
X-CSE-ConnectionGUID: 3Qm3zBH6TdGBGxbGPtRlzQ==
X-CSE-MsgGUID: Hcbp2JScSheFUnUTpxfoZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="48081690"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="48081690"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 02:22:31 -0700
X-CSE-ConnectionGUID: OV+wg80/R9C2/8caRSV3zQ==
X-CSE-MsgGUID: it/0Yn9dQ9OKX0SyxdL/Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="206284860"
Received: from abityuts-desk.ger.corp.intel.com (HELO fedora)
 ([10.245.244.175])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 02:22:31 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 2/3] drm/xe: Pre-allocate system memory for pinned external
 bos in the pm notfier
Date: Thu, 18 Sep 2025 11:22:06 +0200
Message-ID: <20250918092207.54472-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918092207.54472-1-thomas.hellstrom@linux.intel.com>
References: <20250918092207.54472-1-thomas.hellstrom@linux.intel.com>
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

Similarly to what we do for other pinned bos, pre-allocate
system memory for pinned external bos in the pm notifier,
where swapping is still possible.

This hasn't been needed until now when we're about to allow
pinning of exernal VRAM bos.

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo_evict.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index d5dbc51e8612..1a12675b2ea9 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -73,6 +73,11 @@ int xe_bo_notifier_prepare_all_pinned(struct xe_device *xe)
 					    &xe->pinned.late.kernel_bo_present,
 					    xe_bo_notifier_prepare_pinned);
 
+	if (!ret)
+		ret = xe_bo_apply_to_pinned(xe, &xe->pinned.late.external,
+					    &xe->pinned.late.external,
+					    xe_bo_notifier_prepare_pinned);
+
 	return ret;
 }
 
@@ -93,6 +98,10 @@ void xe_bo_notifier_unprepare_all_pinned(struct xe_device *xe)
 	(void)xe_bo_apply_to_pinned(xe, &xe->pinned.late.kernel_bo_present,
 				    &xe->pinned.late.kernel_bo_present,
 				    xe_bo_notifier_unprepare_pinned);
+
+	(void)xe_bo_apply_to_pinned(xe, &xe->pinned.late.external,
+				    &xe->pinned.late.external,
+				    xe_bo_notifier_unprepare_pinned);
 }
 
 /**
-- 
2.51.0

