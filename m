Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FAFEEB566
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 18:49:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E0810E0F9;
	Fri,  8 Sep 2023 18:49:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D403E10E0F4
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 18:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694198982; x=1725734982;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=iP8zNJVrYrJbVj3fs+TVAdIkYjrQufJOTZSkbGg2R8g=;
 b=BTPsrw5Qhmg+DK3XH84C/0sjFf1DaalkQIB145zsqs90ao1nQMcHURLh
 DT5X9BPZcsu/fD+B6lJBwqG6LWqtLdUXbdAuBhb3tHkd6Guclhyzlp4AD
 MG/WijJxQ83CZH1VUTdnqZT527fl0mxYEyALfrACp0IdoXY/bhMLzD4Ju
 UHesTUtyms1rcXp5jC6ERhiDwH+6YqXFp+rnRpCs9QF56h2hCZLd5KcI+
 A0/N9Jd/I10JcQzOM8k4r7zH4DWGjr/8UdpZjK8HT5Fdx7+VRVwX6NeBz
 wlVLf0OFvCgKxfjsmcx+BNVeCoWjWsu6gPVTMaHxO0KghSvTHQv/dtKok g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="367985556"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="367985556"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 11:49:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="742600217"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="742600217"
Received: from dinahclx-mobl1.amr.corp.intel.com (HELO
 gjsousa-mobl2.intel.com) ([10.213.169.125])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 11:49:41 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  8 Sep 2023 15:49:28 -0300
Message-ID: <20230908184928.65815-2-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230908184928.65815-1-gustavo.sousa@intel.com>
References: <20230908184928.65815-1-gustavo.sousa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/1] fixup! drm/xe/display: Implement display
 support
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

In Xe initialization path, the function intel_init_display_hooks() is
being called twice, which is redundant. To remove redundancy, let's
remove one of the calls.

That function sets up hooks that are called from: (i) later in the
initialization path (i.e. intel_display_driver_probe_nogem()), (ii)
resume, or (iii) mode set commits.

In both call sites, none of the scenarios above are reached yet, so it
would be safe to remove the redundant call from either of the two.
However, since intel_display_driver_early_probe() is shared by both i915
and Xe, prefer to remove the call done from xe_display_init_nommio().

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_display.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
index a453946ad108..5823e3f2de1c 100644
--- a/drivers/gpu/drm/xe/xe_display.c
+++ b/drivers/gpu/drm/xe/xe_display.c
@@ -159,8 +159,6 @@ int xe_display_init_nommio(struct xe_device *xe)
 	if (err)
 		return err;
 
-	intel_init_display_hooks(xe);
-
 	return drmm_add_action_or_reset(&xe->drm, xe_display_fini_nommio, xe);
 }
 
-- 
2.41.0

