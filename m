Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D410C87FD2
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 23:43:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B1110E656;
	Tue,  5 Aug 2025 23:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SMpBLefj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A3110E2C7
 for <Intel-Xe@lists.freedesktop.org>; Tue,  5 Aug 2025 23:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754437377; x=1785973377;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f7+5WsWs9NPfRUCAx67x8Drk40nLaKa9YZAKxqf/6C4=;
 b=SMpBLefjTviQwO+gAOwBz8d1DtiiMiFM8Fe2+J6X2/aKmGTNH8bcVjvN
 wUtfJhvd8n3CX3c7yrjPWkKJRCkuJeI589dzGjGJDYSxULpLR0koUE3ki
 qYw8qgqveLG1NsWE59xv3KWGACEyf4Ll/1HehL+a651I5yZoydNdI+k6K
 YivMPiWhbN+91TMQZ1pC8Eg4sjyUBhTscLUWeR3aeEtOr05e8pFDBGkuu
 6FTWD+Lw6v6QFGgIlQY08Pvr+9E82OesTzP9OrAxvv+IVKAlGTOzpajgW
 48eLRj6BjfV6uFvbN/gy4kI2SDUSDDdeQlnvC3LLYECPDJi+yHWFCzUQw g==;
X-CSE-ConnectionGUID: 1m3jeUjARIK/6uRcpo4bNA==
X-CSE-MsgGUID: Lc4V0ZfETNaxeu7Rd1aV/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="44340229"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="44340229"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:42:57 -0700
X-CSE-ConnectionGUID: PH+1kB1EQNi04SQPNb51rA==
X-CSE-MsgGUID: f8Kbw/9XR0i9LNLs7Fb8xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="163862599"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa006.jf.intel.com with ESMTP; 05 Aug 2025 16:42:57 -0700
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v2 3/4] drm/xe: Allow freeing of a managed bo
Date: Tue,  5 Aug 2025 16:42:54 -0700
Message-ID: <20250805234256.1021020-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250805234256.1021020-1-John.C.Harrison@Intel.com>
References: <20250805234256.1021020-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

If a bo is created via xe_managed_bo_create_pin_map() then it cannot be
freed by the driver using xe_bo_unpin_map_no_vm(), or indeed any other
existing function. The DRM layer will still have a pointer stashed
away for later freeing, causing a invalid memory access on driver
unload. So add a helper for releasing the DRM action as well.

v2: Drop 'xe' parameter (review feedbak from Michal W)

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 5 +++++
 drivers/gpu/drm/xe/xe_bo.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index ffca1cea5585..87aa0f5b2b2a 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2222,6 +2222,11 @@ struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
 	return bo;
 }
 
+void xe_managed_bo_unpin_map_no_vm(struct xe_bo *bo)
+{
+	devm_release_action(xe_bo_device(bo)->drm.dev, __xe_bo_unpin_map_no_vm, bo);
+}
+
 struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
 					     const void *data, size_t size, u32 flags)
 {
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 8cce413b5235..298eef403505 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -122,6 +122,7 @@ struct xe_bo *xe_bo_create_pin_map_at_aligned(struct xe_device *xe,
 					      u64 alignment);
 struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
 					   size_t size, u32 flags);
+void xe_managed_bo_unpin_map_no_vm(struct xe_bo *bo);
 struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
 					     const void *data, size_t size, u32 flags);
 int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src);
-- 
2.49.0

