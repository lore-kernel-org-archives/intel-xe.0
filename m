Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50854EB64DA
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jun 2023 22:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA6510E5B6;
	Thu, 22 Jun 2023 22:44:06 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BEE10E5B6
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jun 2023 22:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687473843; x=1719009843;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i8CyudUGb5N9q3tvZBfL126dMSB1+jwl+T7yZ6wD8ZE=;
 b=COQXjhT1AnAeU7XaA8GYI0/D9wyML5aZukMr9PM55byQ7sQrJF7Grwzr
 uwt5RN6XtJV2CRPWovLTtSoBtanxCgatvFW0+sUHBO6hSiuU1u+35/FYS
 ygp3Yqz8+i0FYvlF7uSpv9nOv4gs095qt48aS+4jLMbvGvDzHCFgJDFrX
 qOKcappFErOaSDJ9vMOgAVvtPwRc91mIjWx/SdRZ6kcA0MWJfUqZzUm27
 xbvqDrP3wAmPW5s2hvxYleGUr8UGKcXuhUOSR3l3OYuEabk7y6BCUlIqi
 JnhxzsocUKan617fa8l/otw3+jGnaTSyOm0eClvKP3PRtMzI2GPyuWLZw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="350394298"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; d="scan'208";a="350394298"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 15:44:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="804987493"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; d="scan'208";a="804987493"
Received: from unknown (HELO przanoni-mobl.amr.corp.intel.com)
 ([10.165.21.200])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Jun 2023 15:44:02 -0700
From: Paulo Zanoni <paulo.r.zanoni@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 22 Jun 2023 15:42:55 -0700
Message-Id: <20230622224255.760156-2-paulo.r.zanoni@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230622224255.760156-1-paulo.r.zanoni@intel.com>
References: <20230622224255.760156-1-paulo.r.zanoni@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: properly check bounds for
 xe_wait_user_fence_ioctl()
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

If !no_engines, then we use copy_from_user to copy to the 'eci' array,
which has XE_HW_ENGINE_MAX_INSTANCE members. The amount of members
copied is given by the user in args->num_engines, so add code to check
that args->num_engines does not exceed XE_HW_ENGINE_MAX_INSTANCE. It's
an unsigned value so there's no need to check for negative values.

Fixes error messages such as:

    Buffer overflow detected (54 < 18446744073709551520)!

Very simple reproducer:

    https://people.freedesktop.org/~pzanoni/wait-user-fence-bug/

Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
---
 drivers/gpu/drm/xe/xe_wait_user_fence.c | 3 +++
 1 file changed, 3 insertions(+)


On a side note, I noticed the timeout is in jiffies. That is a very weird thing
to ask from user space.

Also, shouldn't we be using mostly copy_from_user() instead of
__copy_from_user()?

diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 3122374341d6..098e2a4cff3f 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -121,6 +121,9 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
 			 addr & 0x7))
 		return -EINVAL;
 
+	if (XE_IOCTL_ERR(xe, args->num_engines > XE_HW_ENGINE_MAX_INSTANCE))
+		return -EINVAL;
+
 	if (!no_engines) {
 		err = copy_from_user(eci, user_eci,
 				     sizeof(struct drm_xe_engine_class_instance) *
-- 
2.39.2

