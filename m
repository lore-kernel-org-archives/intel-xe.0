Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5212FC10DCE
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 07:56:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1027210E9F3;
	Fri,  8 Dec 2023 07:56:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F1910E9F3
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 07:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702022196; x=1733558196;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZAeHHfLKdCwEBNTMNQQSWnOlzQ/z/yU4VUgruupD5Ok=;
 b=XH51VKN56JVQaDoFlct1Q7FI2HcMG+UaOf5tnjhNo+US3Uj8nqvEao+t
 LPhOKQJirN7u6DkobD7s9t8jNAblv+yqkEAA8Zi6+mKK1zdM8Z3mh3pTx
 +33Y2uAjmbyUbaq8s68e+UDN4EpPEe1K6bmtdjaPpIEv1jbaCmYgFnRxy
 LgJNc/SM9UWV5e33dqE/sFEOzGCFEcdZLdCbQ5lEymHqWtJUkhMxAXzoL
 HovbNT9YlR7epCFU4kWpRruGdxBRlqBLOPAThLhLbEEWtKPhj2RKRSjHM
 bZ2zMLp4caKbRNqYfhM6TfnJ+T5OR+tMojgRbSMYQ9uvHd6+HEfWTzMVw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="391542398"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="391542398"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 23:56:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="838044692"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="838044692"
Received: from cannonro-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.63.126])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 23:56:33 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 0/9] Handle remaining ifdefs in hack patch
Date: Fri,  8 Dec 2023 09:56:01 +0200
Message-Id: <20231208075610.3005795-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is removing rest of the ifdefs added by hack patch
"drm/i915/display: Remaining changes to make xe compile" after
intel_fb.c refactoring set is merged (still under work):

https://patchwork.freedesktop.org/series/126505/

Many patches are identical with earlier set from Maarten Lankhorst
<maarten.lankhorst@linux.intel.com>. They are just a reordered and
split a bit more to make more clear what is changed and why:

https://patchwork.freedesktop.org/series/125685/

Patch 2. is a backport from i915 driver tree.

v3: Rebase
v2: Patch 2. backported

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>

Jouni Högander (8):
  fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support
  fixup! drm/xe/display: Implement display support
  fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
  fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
  fixup! drm/xe/display: Implement display support
  fixup! FIXME: drm/i915/display: Remaining changes to make xe compile

Maarten Lankhorst (1):
  drm/i915/display: Use i915_gem_object_get_dma_address to get dma
    address

 drivers/gpu/drm/i915/display/intel_cursor.c   | 12 +++---
 drivers/gpu/drm/i915/display/intel_display.c  | 35 -----------------
 .../drm/i915/display/intel_display_types.h    |  4 --
 .../drm/i915/display/skl_universal_plane.c    |  4 --
 .../compat-i915-headers/gem/i915_gem_lmem.h   |  1 +
 .../compat-i915-headers/gem/i915_gem_object.h | 38 +++++++++++++++++++
 .../gpu/drm/xe/compat-i915-headers/i915_vma.h |  6 +++
 7 files changed, 51 insertions(+), 49 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h

-- 
2.34.1

