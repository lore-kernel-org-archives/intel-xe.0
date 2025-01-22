Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A84C0218C
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 21:50:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8298910E768;
	Wed, 22 Jan 2025 21:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nlrp+7L9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED9710E1CD
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jan 2025 21:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737582647; x=1769118647;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RWACQ3Qk3Hf+/u50r5qowZbZdIhWau6CPbTgUKi8AaE=;
 b=nlrp+7L9OcuofEbwpO7je6AvO0e3brtunOhnAjXDjpUVIURFlRGodFtu
 1SVoqGKB1g4Jr+A0m1rA+W0dHokKCYyG/o8qySDuZbHJh+r7eEgwD7NTA
 EDKkbU9C/mp1vZ75hbID5KU8XQrd7sLVj974xAxkoL9O9AcEVk8Yp+xMG
 vdfXXY0TRzwJdcMppBmX0TVSj3p21EiL/srvpflgM1V0YABRH+teZP7s3
 19soC6EcqlE+EZ/ZmSe+idTlL6g+9jbO72o7rSRlHQ9eI+2N35sCP4Nu/
 Rhxcfv4g3U5CP6dri2ibQErxD+ythMTZ3gT3Pk1HB5D5i/gB89RJNSd16 Q==;
X-CSE-ConnectionGUID: 1JiAdhdgR7uhDMPQJTYHkw==
X-CSE-MsgGUID: raFcnolPTQOSVSxeEooxBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="41730980"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="41730980"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 13:50:47 -0800
X-CSE-ConnectionGUID: LMhXmJe4Toiwl167WKcjyQ==
X-CSE-MsgGUID: Fs2F50MJTS+vcA779zdRbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112365856"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.80.89])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 13:50:45 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 3/3] drm/xe: Don't treat SR-IOV platforms as reclaim unsafe
Date: Wed, 22 Jan 2025 22:49:55 +0100
Message-Id: <20250122214955.632-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20250122214955.632-1-michal.wajdeczko@intel.com>
References: <20250122214955.632-1-michal.wajdeczko@intel.com>
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

We believe that we stopped allocating memory during resume or
restart steps thus we can say that SRIOV is now reclaim safe.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index c9cc0c091dfd..1c42c47a3005 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -90,7 +90,7 @@ static struct lockdep_map xe_pm_runtime_nod3cold_map = {
  */
 bool xe_rpm_reclaim_safe(const struct xe_device *xe)
 {
-	return !xe->d3cold.capable && !xe->info.has_sriov;
+	return !xe->d3cold.capable;
 }
 
 static void xe_rpm_lockmap_acquire(const struct xe_device *xe)
-- 
2.47.1

