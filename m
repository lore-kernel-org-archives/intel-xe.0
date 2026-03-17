Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F05FF6E89
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 22:01:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B4710E215;
	Tue, 17 Mar 2026 22:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJvIMTGg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8127410E215
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 22:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773784912; x=1805320912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xqGY9Er9MKaaqD/Djj+8XaL6MpRoilndn1dE9BWFdxw=;
 b=AJvIMTGgLa/IqANsOygp6/4iIE7hHl2vtGVI4dLZhrVyYbnYEl1oEZo9
 Dgygo56TA7mnGKqbxBGXrwsXgIhBQqgfTa8No8U9D1HnutVKARLWuKa16
 /so74PqLdxi8A0wvgYIAXrF8FSyXUPAQEvMCWLw6KRWxLBptTn9LsH1wH
 59upIX0QCrMruW2G6kkWOyku5jGx0cc+wfd/K61R9tfqlCa41OSU7YT1+
 vFNURfEFOoLJ+WsvEvDW8PC8uWoUBwXU0fDcyOhE5aEENdbBx6NtyZ2ey
 xXoIh7I2SOUXlBwuocoKgGU++RiQ0hCj6kk6AgHgxs/PjhRiNC+PzhjLr Q==;
X-CSE-ConnectionGUID: SAsjea+uQ3ySyrAQWrlAUA==
X-CSE-MsgGUID: 3LE1jwT8QHyqZEkUlstDgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74011923"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="74011923"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 15:01:51 -0700
X-CSE-ConnectionGUID: nj0KKkQHR2Ooy2BIhXtLBQ==
X-CSE-MsgGUID: flTuNsHdSC+Z52hsRqYvIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="245427915"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by fmviesa002.fm.intel.com with ESMTP; 17 Mar 2026 15:01:50 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH 2/5] drm/xe: Add missing _H to include guard suffixes
Date: Tue, 17 Mar 2026 21:57:18 +0000
Message-ID: <20260317215732.2208976-9-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260317215732.2208976-7-shuicheng.lin@intel.com>
References: <20260317215732.2208976-7-shuicheng.lin@intel.com>
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

Ten headers use _XE_<NAME>_ or __XE_<NAME>__ as their include guard but
omit the _H that the rest of the xe codebase uses. Normalize them to
_XE_<NAME>_H_ to follow the dominant convention (_XE_<BASENAME>_H_) used
by ~232 of ~260 xe headers.

Files fixed:
  - xe_migrate.h:       _XE_MIGRATE_       -> _XE_MIGRATE_H_
  - xe_pt_walk.h:       __XE_PT_WALK__     -> _XE_PT_WALK_H_
  - xe_reg_sr.h:        _XE_REG_SR_        -> _XE_REG_SR_H_
  - xe_reg_sr_types.h:  _XE_REG_SR_TYPES_  -> _XE_REG_SR_TYPES_H_
  - xe_reg_whitelist.h: _XE_REG_WHITELIST_ -> _XE_REG_WHITELIST_H_
  - xe_rtp.h:           _XE_RTP_           -> _XE_RTP_H_
  - xe_rtp_helpers.h:   _XE_RTP_HELPERS_   -> _XE_RTP_HELPERS_H_
  - xe_rtp_types.h:     _XE_RTP_TYPES_     -> _XE_RTP_TYPES_H_
  - xe_tuning.h:        _XE_TUNING_        -> _XE_TUNING_H_
  - xe_wa.h:            _XE_WA_            -> _XE_WA_H_

No functional change.

Suggested-by: Nitin Gote <nitin.r.gote@intel.com>
Assisted-by: GitHub Copilot:claude-opus-4.6
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.h       | 4 ++--
 drivers/gpu/drm/xe/xe_pt_walk.h       | 4 ++--
 drivers/gpu/drm/xe/xe_reg_sr.h        | 4 ++--
 drivers/gpu/drm/xe/xe_reg_sr_types.h  | 4 ++--
 drivers/gpu/drm/xe/xe_reg_whitelist.h | 4 ++--
 drivers/gpu/drm/xe/xe_rtp.h           | 4 ++--
 drivers/gpu/drm/xe/xe_rtp_helpers.h   | 4 ++--
 drivers/gpu/drm/xe/xe_rtp_types.h     | 4 ++--
 drivers/gpu/drm/xe/xe_tuning.h        | 4 ++--
 drivers/gpu/drm/xe/xe_wa.h            | 4 ++--
 10 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 169279d9d8c2..965c45889c72 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -3,8 +3,8 @@
  * Copyright © 2020 Intel Corporation
  */
 
-#ifndef _XE_MIGRATE_
-#define _XE_MIGRATE_
+#ifndef _XE_MIGRATE_H_
+#define _XE_MIGRATE_H_
 
 #include <linux/types.h>
 
diff --git a/drivers/gpu/drm/xe/xe_pt_walk.h b/drivers/gpu/drm/xe/xe_pt_walk.h
index 6a1741f83f36..f45a424bed53 100644
--- a/drivers/gpu/drm/xe/xe_pt_walk.h
+++ b/drivers/gpu/drm/xe/xe_pt_walk.h
@@ -2,8 +2,8 @@
 /*
  * Copyright © 2022 Intel Corporation
  */
-#ifndef __XE_PT_WALK__
-#define __XE_PT_WALK__
+#ifndef _XE_PT_WALK_H_
+#define _XE_PT_WALK_H_
 
 #include <linux/pagewalk.h>
 #include <linux/types.h>
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.h b/drivers/gpu/drm/xe/xe_reg_sr.h
index 1ec6e8ecf278..d26cf4713383 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.h
+++ b/drivers/gpu/drm/xe/xe_reg_sr.h
@@ -3,8 +3,8 @@
  * Copyright © 2022 Intel Corporation
  */
 
-#ifndef _XE_REG_SR_
-#define _XE_REG_SR_
+#ifndef _XE_REG_SR_H_
+#define _XE_REG_SR_H_
 
 /*
  * Reg save/restore bookkeeping
diff --git a/drivers/gpu/drm/xe/xe_reg_sr_types.h b/drivers/gpu/drm/xe/xe_reg_sr_types.h
index ebe11f237fa2..0a6695db2967 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr_types.h
+++ b/drivers/gpu/drm/xe/xe_reg_sr_types.h
@@ -3,8 +3,8 @@
  * Copyright © 2022 Intel Corporation
  */
 
-#ifndef _XE_REG_SR_TYPES_
-#define _XE_REG_SR_TYPES_
+#ifndef _XE_REG_SR_TYPES_H_
+#define _XE_REG_SR_TYPES_H_
 
 #include <linux/types.h>
 #include <linux/xarray.h>
diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.h b/drivers/gpu/drm/xe/xe_reg_whitelist.h
index 69b121d377da..3b64b42fe96e 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.h
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.h
@@ -3,8 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#ifndef _XE_REG_WHITELIST_
-#define _XE_REG_WHITELIST_
+#ifndef _XE_REG_WHITELIST_H_
+#define _XE_REG_WHITELIST_H_
 
 #include <linux/types.h>
 
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 0fc20ce24fe8..54a1c7dffb5a 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -3,8 +3,8 @@
  * Copyright © 2022 Intel Corporation
  */
 
-#ifndef _XE_RTP_
-#define _XE_RTP_
+#ifndef _XE_RTP_H_
+#define _XE_RTP_H_
 
 #include <linux/types.h>
 #include <linux/xarray.h>
diff --git a/drivers/gpu/drm/xe/xe_rtp_helpers.h b/drivers/gpu/drm/xe/xe_rtp_helpers.h
index a33b0ae98bbc..2c7b9e984b06 100644
--- a/drivers/gpu/drm/xe/xe_rtp_helpers.h
+++ b/drivers/gpu/drm/xe/xe_rtp_helpers.h
@@ -3,8 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
-#ifndef _XE_RTP_HELPERS_
-#define _XE_RTP_HELPERS_
+#ifndef _XE_RTP_HELPERS_H_
+#define _XE_RTP_HELPERS_H_
 
 #ifndef _XE_RTP_INCLUDE_PRIVATE_HELPERS
 #error "This header is supposed to be included by xe_rtp.h only"
diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
index 166251615be1..0265c16d2762 100644
--- a/drivers/gpu/drm/xe/xe_rtp_types.h
+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
@@ -3,8 +3,8 @@
  * Copyright © 2022 Intel Corporation
  */
 
-#ifndef _XE_RTP_TYPES_
-#define _XE_RTP_TYPES_
+#ifndef _XE_RTP_TYPES_H_
+#define _XE_RTP_TYPES_H_
 
 #include <linux/types.h>
 
diff --git a/drivers/gpu/drm/xe/xe_tuning.h b/drivers/gpu/drm/xe/xe_tuning.h
index c1cc5927fda7..d18e187debf6 100644
--- a/drivers/gpu/drm/xe/xe_tuning.h
+++ b/drivers/gpu/drm/xe/xe_tuning.h
@@ -3,8 +3,8 @@
  * Copyright © 2022 Intel Corporation
  */
 
-#ifndef _XE_TUNING_
-#define _XE_TUNING_
+#ifndef _XE_TUNING_H_
+#define _XE_TUNING_H_
 
 struct drm_printer;
 struct xe_gt;
diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
index 8fd6a5af0910..a5f7d33c1b32 100644
--- a/drivers/gpu/drm/xe/xe_wa.h
+++ b/drivers/gpu/drm/xe/xe_wa.h
@@ -3,8 +3,8 @@
  * Copyright © 2022 Intel Corporation
  */
 
-#ifndef _XE_WA_
-#define _XE_WA_
+#ifndef _XE_WA_H_
+#define _XE_WA_H_
 
 #include "xe_assert.h"
 
-- 
2.43.0

