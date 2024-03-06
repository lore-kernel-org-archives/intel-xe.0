Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312D0C5475B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 18:32:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65E1113428;
	Wed,  6 Mar 2024 18:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dQVHgbKR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E6E113425;
 Wed,  6 Mar 2024 18:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709749928; x=1741285928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qY+3QDD4wZqnWwZZZg9q1i9qy3oLuTtB8EQmaITq5OM=;
 b=dQVHgbKRvRjqErt0SFUhBn7qauWwN4gMW0uE+NhqxbIkY4oQLJhXFcjO
 lbK7yPKYYnuOL+UBSVBoYfESTavwfh0ZYUoBSVMmQJgCbvzEmnbI3uJtk
 gVJf+X67nBKsru/MpMQNNm76vnhswzNRcwvoBl/FGtzNZkzXNJmeARPy4
 DauMAlhdUML5FIDilAcUBARwYG1wzcVAdnFlcg6WDeHsWq94gW2EZfxTX
 ft1jeldOnahNG0BMMvayJ/QDIg7aDrd7J13c5/z7d8/2rkPqkd3darXgj
 KBq5Pq8Kr646rEMgk9y0G5FUCv4eo/izGKCLjrvvKMjb+QlHjme7ECQO7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="8142866"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="8142866"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:31:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9709799"
Received: from rjongalo-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.33.211])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 10:31:50 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 03/22] drm/kunit: fix drm_kunit_helpers.h kernel-doc
Date: Wed,  6 Mar 2024 20:31:08 +0200
Message-Id: <f909224abc8d542a89b66b957a32f152f42e9bba.1709749576.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709749576.git.jani.nikula@intel.com>
References: <cover.1709749576.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

s/_features/_feat/ to match code.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_kunit_helpers.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_kunit_helpers.h b/include/drm/drm_kunit_helpers.h
index 6e99627edf45..e7cc17ee4934 100644
--- a/include/drm/drm_kunit_helpers.h
+++ b/include/drm/drm_kunit_helpers.h
@@ -75,7 +75,7 @@ __drm_kunit_helper_alloc_drm_device(struct kunit *test,
  * @_dev: The parent device object
  * @_type: the type of the struct which contains struct &drm_device
  * @_member: the name of the &drm_device within @_type.
- * @_features: Mocked DRM device driver features
+ * @_feat: Mocked DRM device driver features
  *
  * This function creates a struct &drm_driver and will create a struct
  * &drm_device from @_dev and that driver.
-- 
2.39.2

