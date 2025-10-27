Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7711CCCF9E5
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 13:12:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392DD10E48A;
	Mon, 27 Oct 2025 13:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hIJgCD6l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83CE410E48A
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 13:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761570767; x=1793106767;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kOxSMP3Sp7AjUyuTXFBkZoSvJ0M4gXf/g1ePxNUPnd8=;
 b=hIJgCD6lXgVfstHMFu3T3H2gXekv2IYyv38H2CZRI4V9EyK4Dc1Ir5Tn
 quQxuPVVT/Fyf+w5Ob49KVJBCFLabUvTKh/ohQlKeC2glBwiARa90KJIS
 SOWjQYf2mor1QfH/4ojYYTR1MO1i0/5Rj6ykA/fgVU8x+fkrJxPvfiClY
 YeVpZzhTeXa7INS+Vef5ouk7udYgWV2sWxfGKO9TO4Kmol39nNZ8NeyZF
 jaCmSpu95w5vVGE5IRlfYvAn2h+fyMoH6NTO0b3x3hHaxpvod/wtIOgCK
 mDnSgHqxnseyEcsVD5h9Iby9ZB8tOOWBc2QgnmvPdQ4n26Kl9zt9NaQBa Q==;
X-CSE-ConnectionGUID: reGCicA4TVqb+ZfUucw91A==
X-CSE-MsgGUID: l3dtOIGjRx+tA5ZiiGfbMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62853728"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="62853728"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 06:12:47 -0700
X-CSE-ConnectionGUID: zRb1kYHqTrGBe2/UUOaQmA==
X-CSE-MsgGUID: hTeDpgWlQneeMcdvTO0lbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="184265816"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fedora) ([10.245.244.2])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 06:12:45 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Fix uninitialized return value from
 xe_validation_guard()
Date: Mon, 27 Oct 2025 14:12:28 +0100
Message-ID: <20251027131228.12098-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
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

The parameter _ret is assigned in xe_validation_guard() not
realizing we're assigning a parameter in a function rather than
in a macro. That means it's value is not propagated to the caller.

Fix this by making the _ret parameter a pointer.

Fixes: c460bc2311df ("drm/xe: Introduce an xe_validation wrapper around drm_exec")
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6220
Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_validation.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_validation.h b/drivers/gpu/drm/xe/xe_validation.h
index fec331d791e7..b2d09c596714 100644
--- a/drivers/gpu/drm/xe/xe_validation.h
+++ b/drivers/gpu/drm/xe/xe_validation.h
@@ -166,10 +166,10 @@ xe_validation_device_init(struct xe_validation_device *val)
  */
 DEFINE_CLASS(xe_validation, struct xe_validation_ctx *,
 	     if (_T) xe_validation_ctx_fini(_T);,
-	     ({_ret = xe_validation_ctx_init(_ctx, _val, _exec, _flags);
-	       _ret ? NULL : _ctx; }),
+	     ({*_ret = xe_validation_ctx_init(_ctx, _val, _exec, _flags);
+	       *_ret ? NULL : _ctx; }),
 	     struct xe_validation_ctx *_ctx, struct xe_validation_device *_val,
-	     struct drm_exec *_exec, const struct xe_val_flags _flags, int _ret);
+	     struct drm_exec *_exec, const struct xe_val_flags _flags, int *_ret);
 static inline void *class_xe_validation_lock_ptr(class_xe_validation_t *_T)
 {return *_T; }
 #define class_xe_validation_is_conditional true
@@ -186,7 +186,7 @@ static inline void *class_xe_validation_lock_ptr(class_xe_validation_t *_T)
  * exhaustive eviction.
  */
 #define xe_validation_guard(_ctx, _val, _exec, _flags, _ret)		\
-	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret) \
+	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, &_ret) \
 	drm_exec_until_all_locked(_exec)
 
 #endif
-- 
2.51.0

