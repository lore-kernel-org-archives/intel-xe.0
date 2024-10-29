Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9140FD2AB3A
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 12:43:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FC4910E262;
	Tue, 29 Oct 2024 12:43:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GDQCVF5R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4940F10E262
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 12:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730205803; x=1761741803;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+c7uqtwM0LtCVyXtTwKf77mzC8r+EFwaFYB6Ujodsbc=;
 b=GDQCVF5RycY4n8KpFJgz0z7Bu/CtLrjDF31dfgIvJPV40Foj8UEJ9Q9q
 XUvapZEC8NU+ux/gzeJlMqWAt+xBg5iAWPruDm8mNgud4O8Z+LWDxIUU0
 xxMlYbid7uz/t9aohIFONPEQlxCKomNs/ns4oNDbfe3dd5Jv4HJ5o8B7f
 XEPVEhftiPkgeQVkWaiOSucjBcn9AytFb3s2U2AvOpvVOsZNILl3W7IRM
 4BeuWVxZJvsruub48rS1opjGCbnhCJ0m+9SJND+Bgc93HFFU3aDpV+M2C
 KvyzRt17KdaAbd0hZuuWQgTPQuSOobRWk2fb97SP912MR0D/FEDozqh8K A==;
X-CSE-ConnectionGUID: JnJf4Re7RXqcUfqkKkMD3Q==
X-CSE-MsgGUID: nc3/NPZaRK6cbF3NPRgBZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="29950445"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="29950445"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 05:43:23 -0700
X-CSE-ConnectionGUID: cQzMpvw5SfqdyVvUDlfTNA==
X-CSE-MsgGUID: 6p8GlB13TJeH2su0r5eOyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="82021954"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 05:43:21 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, stable@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v5 2/3] drm/xe/ufence: Flush xe ordered_wq in case of ufence
 timeout
Date: Tue, 29 Oct 2024 13:01:16 +0100
Message-ID: <20241029120117.449694-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241029120117.449694-1-nirmoy.das@intel.com>
References: <20241029120117.449694-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany, Commercial Register: Amtsgericht Muenchen HRB 186928
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

Flush xe ordered_wq in case of ufence timeout which is observed
on LNL and that points to recent scheduling issue with E-cores.

This is similar to the recent fix:
commit e51527233804 ("drm/xe/guc/ct: Flush g2h worker in case of g2h
response timeout") and should be removed once there is a E-core
scheduling fix for LNL.

v2: Add platform check(Himal)
    s/__flush_workqueue/flush_workqueue(Jani)
v3: Remove gfx platform check as the issue related to cpu
    platform(John)
v4: Use the Common macro(John) and print when the flush resolves
    timeout(Matt B)

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: <stable@vger.kernel.org> # v6.11+
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2754
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index f5deb81eba01..5b4264ea38bd 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -155,6 +155,13 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 		}
 
 		if (!timeout) {
+			LNL_FLUSH_WORKQUEUE(xe->ordered_wq);
+			err = do_compare(addr, args->value, args->mask,
+					 args->op);
+			if (err <= 0) {
+				drm_dbg(&xe->drm, "LNL_FLUSH_WORKQUEUE resolved ufence timeout\n");
+				break;
+			}
 			err = -ETIME;
 			break;
 		}
-- 
2.46.0

