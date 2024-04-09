Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCCCC67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 10:51:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0F3112CB2;
	Tue,  9 Apr 2024 10:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PBcp2iy3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AA6112CB2
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 10:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712659887; x=1744195887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NCkTeNz9rHRusFbGUamlmma79Hsgzh/+Pl+BrLbqEB0=;
 b=PBcp2iy3hsgijHKxa816Smbj3i1HBRuK0hmi/OFjXklyqyJliYQwC5cF
 gZOr+GNWkF9+Uh2jruDB+q4f0PYdMLqcSElICc1laYPp22Tfh4KjTI6cI
 IcQVGykQZEwR7YERmi4yiWj9kj+UNXhGFHCuunXJK8i/YSrkD9Q3ucXtO
 b6A4+gWnf02sRvqlYFIwYVoATdjXcYtcIxop5RJ4zrFlvvX8qe/tWxMAN
 4ToZRdkLKXZiJaWK63eF5Vloqcz6irY2m4c/VZQKX2lWK3gFen/osYp7x
 8DbapaSmoScAovF5RT8E3l4BiVMOrcYP2xhctAKXcX6L7Ii1ujS2OxKqR A==;
X-CSE-ConnectionGUID: jmHN88XETD6KFaqp2urouQ==
X-CSE-MsgGUID: FT8pRvlRRDu6nGzC+l6ecg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="10939851"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="10939851"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 03:51:26 -0700
X-CSE-ConnectionGUID: IoKMU2/YR22XrUMNKVHTUA==
X-CSE-MsgGUID: h0ovBAkvSoittzghGizluQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="24825644"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.158.230])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 03:51:26 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/2] drm/xe: Check pat.ops before dumping PAT settings
Date: Tue,  9 Apr 2024 12:51:06 +0200
Message-Id: <20240409105106.1067-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240409105106.1067-1-michal.wajdeczko@intel.com>
References: <20240409105106.1067-1-michal.wajdeczko@intel.com>
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

We may leave pat.ops unset when running on brand new platform or
when running as a VF.  While the former is unlikely, the latter
is valid (future) use case and will cause NPD when someone will
try to dump PAT settings by debugfs.

It's better to check pointer to pat.ops instead of specific .dump
hook, as we have this hook always defined for every .ops variant.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index 026e4a9fe124..4118c3084398 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -451,7 +451,7 @@ void xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 
-	if (!xe->pat.ops->dump)
+	if (!xe->pat.ops)
 		return;
 
 	xe->pat.ops->dump(gt, p);
-- 
2.43.0

