Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01725CA5FF0
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 13:52:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B42D489711;
	Mon,  5 Oct 2026 13:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AIlx1t5P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A18989711
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 13:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791208319; x=1822744319;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8BMjbcP+je+mqSJpaew5b2eLfTji0d8pNXM5Dgqru1w=;
 b=AIlx1t5PUBYGf0mACkdxumeBarl8gigq0eAs4eXw946Q0M74KzTwgsrY
 uRhQafhWIxJrsz1BlkmAXFGKJmWR+AIaCUcT+qN/CTDquWCVNbsXYXitb
 jF8H7mAPjzhmuf3nfhf+6IAro9Od4IPHhdVvDIbEHFEPJI1E1VxGl+u8d
 09R+6pB4A7UOXCXi64Q9mFIKM/lkMmg8JD0r4kzQrkik52w7dnTQfncrx
 D7O/wqQrI1/8QrMrahVfwZTDnhPEO/MPXzchqi9d3/MMwQjh0ZDyLkuTk
 m4+ZRR/Uj0iowdxDctaSz+5nOgHwWvi+xkUUEOsYyAZcIwIVfJ55eBbgf A==;
X-CSE-ConnectionGUID: lgBly6HVSEGugVS50Bgtuw==
X-CSE-MsgGUID: itZNp4PZQOOZwZOEErdaRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="108256459"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="108256459"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 06:51:58 -0700
X-CSE-ConnectionGUID: H+svBdnjRQuUR3WeaKwMQw==
X-CSE-MsgGUID: 1tjxN673TAW7gVi5TiPCKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="280109725"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.245.209])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 06:51:57 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Don't allow XE_VALIDATION_UNIMPLEMENTED outside of
 debug builds
Date: Mon,  5 Oct 2026 15:51:35 +0200
Message-ID: <20261005135135.161447-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.55.0
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

The XE_VALIDATION_UNIMPLEMENTED macro is only intended for convenience
use during development. It is not allowed in production builds.

Ensure that by conditioning it on CONFIG_DRM_XE_DEBUG.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_validation.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_validation.h b/drivers/gpu/drm/xe/xe_validation.h
index 4cd955ce6cd2..e3a5385ef1c3 100644
--- a/drivers/gpu/drm/xe/xe_validation.h
+++ b/drivers/gpu/drm/xe/xe_validation.h
@@ -48,9 +48,11 @@ static inline void xe_validation_lockdep(void)
  * XE_VALIDATION_OPT_OUT is for simplification of kunit tests where
  * exhaustive eviction isn't necessary.
  */
+#ifdef CONFIG_DRM_XE_DEBUG
 #define __XE_VAL_UNIMPLEMENTED -EINVAL
 #define XE_VALIDATION_UNIMPLEMENTED (xe_validation_lockdep(),		\
 				     (struct drm_exec *)ERR_PTR(__XE_VAL_UNIMPLEMENTED))
+#endif
 
 #define __XE_VAL_UNSUPPORTED -EOPNOTSUPP
 #define XE_VALIDATION_UNSUPPORTED ((struct drm_exec *)ERR_PTR(__XE_VAL_UNSUPPORTED))
-- 
2.55.0

