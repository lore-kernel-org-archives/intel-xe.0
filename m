Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B409C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 11:17:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA2E10E87E;
	Thu,  7 Dec 2023 11:17:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8A210E87E
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 11:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701947844; x=1733483844;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Hwli00kiLgqiTjh5dJFq0mkiltXsPeKIsDjZ2eLq4G8=;
 b=F7b4JWGvFhUlON6PxH/iQ7VUuPcmgPpfHYLN8SvyXJvuc/DOHCnUGWpk
 v6IW7p+Cwak1nD1cEmZ4JRDYK7Pyu1h1vJKVa4CO+uGLar/iX+9Fv4vo7
 TwBpLkDUaGlFZco16nRdfUI5DEVbCxujT1++cJDQa3X7pSjTnwcUZtSaE
 AfVqliiAW2BgO01qCYcqi0lz+/NFPsIpoZQz7RkjeVriKQYtQdxx9qD1o
 wNEGzYvX7uifE8968vXUf3SUph03qbHrgzqITkUbCP+49fJbzs8u+dHHG
 0tCdoZ8G2AstGleH/BFMkB71QMo8X3cnUb6DBhdmp/h+NVGbhkGokyIZi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="460704528"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="460704528"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 03:17:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="837685884"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="837685884"
Received: from rlgreyi-mobl.amr.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.46.17])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 03:17:20 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/9] Handle remaining ifdefs in hack patch
Date: Thu,  7 Dec 2023 13:16:57 +0200
Message-Id: <20231207111706.2293105-1-jouni.hogander@intel.com>
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

One patch is supposed to be backport of i915 patch which is already
reviewed, but not yet merged:

https://patchwork.freedesktop.org/series/127300/

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
 drivers/gpu/drm/i915/display/intel_display.c  | 35 ----------------
 .../drm/i915/display/intel_display_types.h    |  4 --
 .../drm/i915/display/skl_universal_plane.c    |  4 --
 .../compat-i915-headers/gem/i915_gem_lmem.h   |  1 +
 .../compat-i915-headers/gem/i915_gem_object.h | 40 +++++++++++++++++++
 .../gpu/drm/xe/compat-i915-headers/i915_vma.h |  6 +++
 7 files changed, 53 insertions(+), 49 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_lmem.h

-- 
2.34.1

