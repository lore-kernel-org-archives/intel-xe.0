Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53110D1AD48
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 11:32:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF1810E2E7;
	Wed, 16 Oct 2024 11:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OxXmG0op";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73E010E2DA
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 11:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729078349; x=1760614349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FcVv71Mx/UuXNrxP1khmfFbNSUa8LiOi4bfNRNEawEI=;
 b=OxXmG0opTEpPGSMlwP+V280q+KKa+qj+2eoqmYEK7TC+Pgi/GklNrSS9
 31kejOxMoh9u0qUAqM7p/dKs2mcdCxhCAD1YRKWcPxgsUINqD4H2fmIk8
 57qWiWx7lTHBPyUhbF9OcbZv769jw32XDD4Gnct1CTlX7NnVyrxD5p9f5
 jYtJT0+dh8ry/RJ7elQllvZc01H+sIoMkka4VH+VECx9uIHDVrLp+LREU
 Im2PFHlVKg8FE1Ev5TuC/KWTDAFC0pLC56dnHCAJ75T3IfvbVWQurwA8n
 iapGJ/BN54B+Y8zJaT1I3t1X1MskgPVu4+NqlPuk3Olfx+IimXzzfulAL A==;
X-CSE-ConnectionGUID: INzDiH53QkGthksH3hKuhg==
X-CSE-MsgGUID: tFJnwqOYSKSqiq00sf3c6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28472519"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28472519"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 04:32:28 -0700
X-CSE-ConnectionGUID: jiYq/AMhR3q8J+lAbGrreQ==
X-CSE-MsgGUID: vRty0UThTzewARFskom0zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="108941613"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 04:32:26 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, john.c.harrison@intel.com,
 rodrigo.vivi@intel.com, matthew.brost@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v2 2/2] drm/xe/guc/ct: Flush g2h worker in case of g2h
 response timeout
Date: Wed, 16 Oct 2024 17:22:56 +0530
Message-Id: <20241016115256.349791-3-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016115256.349791-1-badal.nilawar@intel.com>
References: <20241016115256.349791-1-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

In case if g2h worker doesn't get opportunity to within specified
timeout delay then flush the g2h worker explicitly.

v2:
  - Describe change in comment and add TODO (Matt B/John H)
  - Add xe_gt_warn on fence done after G2H flush (John H)

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2902
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 3096baa4c9f4..c4e06d6722f0 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1028,6 +1028,21 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
 
 	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ * 3);
 
+	/*
+	 * Explicitly flush g2h_worker if it hasn’t had the chance to run after being queued due
+	 * to delays in workqueue scheduling.
+	 *
+	 * TODO: Drop this change once workqueue scheduling delay issue root caused and fixed.
+	 */
+	if (!ret) {
+		flush_work(&ct->g2h_worker);
+		if (g2h_fence.done) {
+			xe_gt_warn(gt, "G2H fence %u, action %04x, done %s after G2H flush\n",
+				   g2h_fence.seqno, action[0], str_yes_no(g2h_fence.done));
+			ret = 1;
+		}
+	}
+
 	/*
 	 * Ensure we serialize with completion side to prevent UAF with fence going out of scope on
 	 * the stack, since we have no clue if it will fire after the timeout before we can erase
-- 
2.34.1

