Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08EDDCAC581
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 10:21:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0ABF10E4BE;
	Mon,  8 Sep 2025 10:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d7z9XUax";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF82A10E4BE
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Sep 2025 10:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757326866; x=1788862866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6cCxCD2J8T7ivN/1K+t50ND58BmMsMp9qiHrybCcjVQ=;
 b=d7z9XUaxfpL486dWvQ2buvyLEZ2ZgllNnnZdaJvkbp33q6TDeLDH3XTj
 bGuqkhXYN3ttzhCOWJdUWwlKTe6a/0sExyPwT42a6MMc6gUW0ckuEP54N
 imKr2UvHn3Gt3my1nXDNZ98Orp6H95wi0RSbN2GWAjHrF7/GKQDBnGQxg
 3M9BabTtzuxIRbWduZQotDG5uho6ooTuA9VNw9nbdQ2NKmkoG6+yq8dwQ
 ksIqXIioYv3QS170tcz/omdyGGhziQUVz4O4jqvykfWSIhG2r38ACEqAa
 Iy8JKFr9DX/r/mcPs+ehT8i5a3kn8m6QlZ08Wa/x2iOnZpZXB7Bkg/XKF A==;
X-CSE-ConnectionGUID: CcQy91urSIm5u6MkWgJoWQ==
X-CSE-MsgGUID: dqVA3pKVQUSFfBZywFbP5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="59276868"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="59276868"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 03:21:06 -0700
X-CSE-ConnectionGUID: OS87kzjlRoWkGs1tCwinYQ==
X-CSE-MsgGUID: wJRD16g7S9y3/WDDOVcO5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="177981313"
Received: from abaranow-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.83.253])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 03:21:04 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 2/2] drm/xe/guc: Don't invoke disable_ct action during
 replacement
Date: Mon,  8 Sep 2025 12:20:52 +0200
Message-ID: <20250908102053.539-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908102053.539-1-michal.wajdeczko@intel.com>
References: <20250908102053.539-1-michal.wajdeczko@intel.com>
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

During second CT initialization step, known as post_hwconfig, we
want to replace previously registered CT disable devm action to
make sure it will be invoked prior to releasing underlying BO.

But to replace this action we don't need to execute it right away
since we know that CT was disabled prior to that late init step
and we already assert that. Use devm_remove_action() instead to
avoid extra message about 'disabling CT' that could be seen now:

 [drm:guc_ct_change_state [xe]] GT0: GuC CT communication channel disabled
 ...
 DEVRES REM ff11000149320940 guc_action_disable_ct (16 bytes)
 [drm:guc_ct_change_state [xe]] GT0: GuC CT communication channel disabled
 DEVRES ADD ff110001664fc040 guc_action_disable_ct (16 bytes)

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 12372d5b7067..bb8650fdeb45 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -306,7 +306,7 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct)
 			return ret;
 	}
 
-	devm_release_action(xe->drm.dev, guc_action_disable_ct, ct);
+	devm_remove_action(xe->drm.dev, guc_action_disable_ct, ct);
 	return devm_add_action_or_reset(xe->drm.dev, guc_action_disable_ct, ct);
 }
 
-- 
2.47.1

