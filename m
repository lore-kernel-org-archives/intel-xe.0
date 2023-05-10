Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFA1C77B7D
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 12:13:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B99D10E486;
	Wed, 10 May 2023 12:13:07 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF03010E486
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 12:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683720785; x=1715256785;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DY1MEPM4isSPU0R+VFlvCtPjrX/5Noq7HMwOO2/cyls=;
 b=L+ZypIz1YV8+EXcfnZPG7oPGntmxNEwpq8IoFjN31pUA/nHitgO45CJf
 BX5qblU0DA/MCE9c7JlVNk53q1tSJaDBKdazZ+n6P+IAyHxOFkcjCPriq
 ViwH/w3q8CJr9/fVqHCMqdhqmRXpsKipZqVmvsrkTKgETiNvGCNJp1XEs
 5hpXVJmggCxC1ufmNHnHlYOCzEE2/0zZBOWeYgzGiEkN+KnbTpYWpXFQH
 qZqUkiA/06Y1Izi6JEU6qHBiEKFh477+GTGZBDG0sje5Jd58JSIPYAgU6
 iHg0mr6QmsHinuTrma9VUNxCzivz4h0tlh9pqaKllRLzXt6H0z0qRUWCI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="353268252"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="353268252"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:13:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="788906399"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="788906399"
Received: from iisaev-mobl2.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.62.141])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 05:13:02 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 15:11:48 +0300
Message-Id: <20230510121152.736148-20-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510121152.736148-1-jouni.hogander@intel.com>
References: <20230510121152.736148-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH v2 19/23] drm/i915/display: Use
 drm_gem_object_get/put
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
Cc: jani.nikula@intel.com, rodrigo.vivi@kernel.org,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 ville.syrjala@linux.intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Use drm_gem_object_ge/put directly instead of i915_gem_object_get/put.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_frontbuffer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index 51fb0ca0267e..6c3f9b4f76cb 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -237,7 +237,8 @@ static void frontbuffer_release(struct kref *ref)
 
 	i915_active_fini(&front->write);
 
-	i915_gem_object_put(obj);
+	drm_gem_object_put(&intel_bo_to_drm_bo(obj));
+
 	kfree_rcu(front, rcu);
 }
 
-- 
2.34.1

