Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E969CD4F25
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 18:34:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4ED910EBEB;
	Tue, 12 May 2026 18:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jT/YKfqH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E291C10EBE8
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 18:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778610842; x=1810146842;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8+8ev71W9oiYrgkYYkKo0Qm0NiqIh3xP7rAOIvbPI2E=;
 b=jT/YKfqHgDlA+bIVkkRpEwdk6AayVSz2ZHjNpDPeBJHg8VjEoGJEpQAF
 8MSOZHCB/tTITRefQSNizytGtt8+K/QCp2AOAuWGIV/MzLXPJeoSkGIck
 kkxnsTMLbBwXSpepA4DPmOzvZIm3kFc9wk/Wzl9eekAGyhdpLn5EhA2wv
 R78YwfRzChCZ2zYkJqO+k+58cerKmzyMInC3u9i9RtFCpsOdfYKqhAID1
 q1V0TJM+jKo+hX5V2to5KPVC+DTVwbV2JONpRTQGbtQYbK/FRFpRc1sBC
 m7Nompkrte0pXyIMuUQPj8JNp6X2A3acTgrKI73uoYwxua66erpbWwOWT g==;
X-CSE-ConnectionGUID: SLjGA5WiTmSJNFDPBLhYqA==
X-CSE-MsgGUID: PFSJM0kOTU6K9nuFBHiJsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79425745"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="79425745"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 11:34:02 -0700
X-CSE-ConnectionGUID: jfdPwmcRS+SxYWXvrCvxmg==
X-CSE-MsgGUID: rLNiBkCERhSV6bzgSikXyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="234791112"
Received: from dmagui1x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.118.167])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 11:34:00 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 7/7] drm/xe: Make drm_driver const
Date: Tue, 12 May 2026 20:33:42 +0200
Message-ID: <20260512183342.3374-8-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512183342.3374-1-michal.wajdeczko@intel.com>
References: <20260512183342.3374-1-michal.wajdeczko@intel.com>
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

After removing runtime modification to our drm_driver definitions,
we can make them const as they should be.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 7519cda3f42c..576095cf0952 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -391,7 +391,7 @@ bool xe_is_xe_file(const struct file *file)
 	return file->f_op == &xe_driver_fops;
 }
 
-static struct drm_driver regular_driver = {
+static const struct drm_driver regular_driver = {
 	.driver_features =
 	    XE_DISPLAY_DRIVER_FEATURES |
 	    DRIVER_GEM |
@@ -424,7 +424,7 @@ static const struct drm_ioctl_desc xe_ioctls_admin_only[] = {
 	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
 };
 
-static struct drm_driver admin_only_driver = {
+static const struct drm_driver admin_only_driver = {
 	.driver_features =
 	    XE_DISPLAY_DRIVER_FEATURES |
 	    DRIVER_GEM | DRIVER_RENDER | DRIVER_GEM_GPUVA,
@@ -478,7 +478,7 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent)
 {
-	struct drm_driver *driver = &regular_driver;
+	const struct drm_driver *driver = &regular_driver;
 	struct xe_device *xe;
 	int err;
 
-- 
2.47.1

