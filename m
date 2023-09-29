Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DD1E7F156
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 10:51:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A874810E110;
	Fri, 29 Sep 2023 10:51:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39DE510E110
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 10:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695984667; x=1727520667;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HB8OsM1SWbexNHO+FYaW9D4OcOx0tpnCCYGa7z9y47k=;
 b=eVV3KzNwc9A+qmHRHxVTOOmX6Xi0hZ2BYnQGv4ze7oB0779KLXYU/Pc1
 QHlcEAHVg5czDHcQaCwxRyt1O8XpVa07MhlAXRSjwCqFEuJ2bYneVAd6y
 KSyj3e/KwjnN56QxcXRGWz2uspAsxNDXDOcJZo7Ws7rbcVkeGt6qaLOSx
 eM4TyjfmBSwnNDiNf+Ou7LqEU7RY95mgwZwG3kvni5ClwibmihXqqIAEG
 sFE34zjq1pOaE2rj9CgPiCILBhmLsv5dY37a/NXs3yZkHTzm5R3tTNV+R
 TKMI7yiozHPaiHdwrDMgk0IuwTH59Jof+gZXFWcZnQf1HXb8gqKiMgg87 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="386138623"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; d="scan'208";a="386138623"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 03:51:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="699609185"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; d="scan'208";a="699609185"
Received: from hkatter-mobl2.amr.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.249.33.4])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 03:51:04 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 29 Sep 2023 13:50:28 +0300
Message-Id: <20230929105030.1132290-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Backport set frontbuffer return value check
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
 Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This patch set is backporting set frontbuffer value check patch from
upstream and reverting similar patch we have in drm-xe-next branch.

Cc: Jani Nikula <jani.nikula@intel.com>

Jouni Högander (2):
  Revert "drm/i915: Ignore set frontbuffer return value on release"
  drm/i915: Warn on if set frontbuffer return value is not NULL on
    release

 drivers/gpu/drm/i915/display/intel_frontbuffer.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.34.1

