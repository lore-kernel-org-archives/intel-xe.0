Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04409CA0ECA
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 11:46:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9731510E401;
	Tue, 12 Sep 2023 11:46:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788EF10E406
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 11:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694519217; x=1726055217;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gm0XFSlaQL4P9sWF/J0gi4Wbe+Sqop0P+a43GPgNZx8=;
 b=VAr2+gU9ztLyWlter9/741KmAjYiJMk4V2SYaJJRMhoc7LFST2tsvjCu
 onc/R2Fqn794lc1tru9gYgfIQNA2FV8DFYqq/pTujPABKFpGoCKlQ0ZE0
 y1+g96XVgOZqTAbOcXdYzwzFggkwfX6HWlMOG6IUR7pVKdqI6lW1/GWZQ
 I/+kfgdIlgLeEVb5EEqMczbmjoPDAF5o5syQrF1PK4UdJKdNLzB2hPd0g
 S3rQItMEkJba4PQaMQBdNVTzRUb13jytA3JV4uuWN3QHwoyOo0+EFfRmn
 CX5tRIrc3KDrTUjzpSxVMN+9cUozVgIbMcMRYoF60CTu4kn/DnLtwlM9n g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="444784445"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="444784445"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:46:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="778767954"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="778767954"
Received: from sptommas-mobl1.ger.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.216.207])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:46:52 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 12 Sep 2023 14:46:39 +0300
Message-Id: <20230912114641.2990078-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Remove extra headers added into
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

