Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F745EDE988
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 06:32:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D628A10E507;
	Thu, 14 Sep 2023 06:32:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849B010E507
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 06:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694673151; x=1726209151;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Fa+bfqZUIu0h11l4EhoPuF08EvFMGmFfdiXba/NkiFs=;
 b=mmKIGLrUmR+LeFmeQthMpbhgofAsxWkSQHU4koqhYwJPnSD8nkFkRsVx
 9YBUZh49d0mU23bCBD9oDjEsUjq7YgWJeh2nTcDZQoaSHTe3/Zi2s5bUT
 wXCIAdZS76vycnmc7E2wzRzyyhjVjx5UITXeJjqC1GCoH4+YiIeyynfBI
 8FCk3DK+pifDnN39++yVN7tIaheECISWRckYUE+AA1SYluwO5X/tljIc9
 Sw/pqmAp7iNQJV13r0W3ZfkQxu+oO4y0ltuSp3WDXuPzMn4d8YOZGRTZX
 J/wj9jMpa62b2+Q+bRJN07xSY62SRTvTMs9IaQP7SD5OSF3MbQcf2jfyv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="359127199"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="359127199"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 23:32:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="721110725"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; d="scan'208";a="721110725"
Received: from stoicaan-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.252.36.89])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 23:32:21 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 14 Sep 2023 09:32:09 +0300
Message-Id: <20230914063211.5210-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/2] Remove extra headers added into
 intel_display_power.h
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

These patches are making temporary patch unnecessary:

FIXME: drm/i915: add a lot of includes in intel_display_power.h

and reverting it.

v2: rebase

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Jouni Högander (2):
  fixup! drm/xe/display: Implement display support
  Revert "FIXME: drm/i915: add a lot of includes in
    intel_display_power.h"

 drivers/gpu/drm/i915/display/intel_display_power.h | 5 -----
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  | 1 +
 2 files changed, 1 insertion(+), 5 deletions(-)

-- 
2.34.1

