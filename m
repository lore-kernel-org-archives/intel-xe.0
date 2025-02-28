Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37560C282C5
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 07:31:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058D110E217;
	Fri, 28 Feb 2025 07:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GsHJlILL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5EB10E217
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 07:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740727876; x=1772263876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GNI35ffPdLNANFCbuTvB3jq0HX/20SvIig/LQAVb0hM=;
 b=GsHJlILLjB+8cFJ1mXRIErasXjt7yFpwFOQHI1sMRvZcJe0AfrjCGWmB
 AdA6cCUSgkdu/LdNbksji3Q4gQgUeDCSkwpoF2fptyzpecToU3QRuW+go
 hoy9DejpPe1OtXo4u7ICuGYMBDg+iWRHsd+3IDMfIjGTNnD2NoKRtUkr7
 j99ZjmK6QaCIpLcv8kDlm7i9Qpe8485Y1sJRYufZumnHrfX0WRT+PrUZf
 HlsErm21bPdL7qWz+sPhcTCHtoCaktGd3VD09WbxEH9x6RqMhH3jy6yVb
 anKq0HcbMuJg+D7LcLoxa5Al9rrIa5PNouGOOgtyU8YgZDZuR11JHd+r4 Q==;
X-CSE-ConnectionGUID: cu1jbZlZSi+xVOJxe/v2pw==
X-CSE-MsgGUID: ucI/UU37QO6icRfXrngxLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="45297766"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="45297766"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 23:31:16 -0800
X-CSE-ConnectionGUID: M0VY/HUuT6+HCU7tFplwKQ==
X-CSE-MsgGUID: EAk35QkaS76zeme5cBW2Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121386232"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.232])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 23:31:14 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 stable@vger.kernel.org
Subject: [PATCH v2 2/4] drm/xe/vm: Fix a misplaced #endif
Date: Fri, 28 Feb 2025 08:30:56 +0100
Message-ID: <20250228073058.59510-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228073058.59510-1-thomas.hellstrom@linux.intel.com>
References: <20250228073058.59510-1-thomas.hellstrom@linux.intel.com>
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

Fix a (harmless) misplaced #endif leading to declarations
appearing multiple times.

Fixes: 0eb2a18a8fad ("drm/xe: Implement VM snapshot support for BO's and userptr")
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: <stable@vger.kernel.org> # v6.9+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index f66075f8a6fe..7c8e39049223 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -282,9 +282,9 @@ static inline void vm_dbg(const struct drm_device *dev,
 			  const char *format, ...)
 { /* noop */ }
 #endif
-#endif
 
 struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
 void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
 void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
 void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
+#endif
-- 
2.48.1

