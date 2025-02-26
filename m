Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EF9C19F2E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 15:34:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE7F10E943;
	Wed, 26 Feb 2025 15:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="at/LPoqj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6B310E943
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Feb 2025 15:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740584078; x=1772120078;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GNI35ffPdLNANFCbuTvB3jq0HX/20SvIig/LQAVb0hM=;
 b=at/LPoqj1ow1oE0MWCkjiIV1cUn37aYycXeq6k/KR/GxjLySOggGRRDy
 EyTg9RpXXSFJH/Gy2aXieCO8ObNe8vx/QdIM3aHn/kGJgzw1aQ6B6PQf+
 fxK/m77vt0l42cVmT0GfIk6ifFhArZL/kn3kyCYfFerL680Rtmu/0o0ME
 zvis+T5a7CVP47LGKamc7iXekhPOQIvnodrLcUT4HsXv7hW/ri3ZnjLkI
 OE8ggz/Lh6Y94EWVcPJgZwNTs2JmDVSWgbJwDwKi493En0xU+/JMHIJg5
 O9Mz3gi9JrDKwjDDrqqJLFdTBdcBEca3SgDR9blCIu2iGnBJq4H5/n7Hv w==;
X-CSE-ConnectionGUID: JSTuDiyPTvSZ5gi5vgjVZw==
X-CSE-MsgGUID: Beg6SCupTW++D4KN6YUUkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="44260325"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="44260325"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 07:34:38 -0800
X-CSE-ConnectionGUID: Bl0h1TMUQ7KkZ+ymOU+JUA==
X-CSE-MsgGUID: RNpSc36zRgWbqQwhaoR+Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; d="scan'208";a="116917923"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.81])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 07:34:36 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 stable@vger.kernel.org
Subject: [PATCH 2/4] drm/xe/vm: Fix a misplaced #endif
Date: Wed, 26 Feb 2025 16:33:42 +0100
Message-ID: <20250226153344.58175-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250226153344.58175-1-thomas.hellstrom@linux.intel.com>
References: <20250226153344.58175-1-thomas.hellstrom@linux.intel.com>
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

