Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A1BCA1012
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 21:37:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37A510E93D;
	Wed,  3 Sep 2025 21:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cFBVYopu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C2B10E94B
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 21:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756935444; x=1788471444;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NCAjG/dODK9iprv0HHEOtDwdu8rsC6IMQ85Ig8kEnSg=;
 b=cFBVYopuqFIp1LzfsWEzgE9AIUl9AZqEriMEokNUPi6y0vrbteeu2860
 f7aBGfnJ2zg9qcVac1IDVKvNMNLtmymH215IadHWE8VVj3h/a5Qvr005n
 yhpZRXnKs95qmZCtLB5Dswd95CKChLOLlUyjM1Rmr+eP/9RV91pOT9Q/V
 D59lQjqUc2Ds6GVa/vDHHA76uxoQDaeT4bUxUIH1B76sfsCZkMlLNBS1L
 XFlX/UwA1SFQmIbx7pHKdmjHlfItTwD8G08K68lC8c2tYxHMLcX8JqyQZ
 gWkGLYqP15FqIf5Ukk4EVGggY2iLWiQJbGYy2zQ1wSgg2tuOp5awJyjRI Q==;
X-CSE-ConnectionGUID: bRBcW8B3T+61OU/3kRlhCg==
X-CSE-MsgGUID: lGh5vCtNQ8CIE8lf2Au2EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59178971"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59178971"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 14:37:24 -0700
X-CSE-ConnectionGUID: RNHQTIPFTEmF1kRIW67Syg==
X-CSE-MsgGUID: 46btGcU9QLK9AHQEJwggGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="170957518"
Received: from ruymanre-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.70])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 14:37:22 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 0/7] RFC: Add dedicated printk macros for tile and device
Date: Wed,  3 Sep 2025 23:36:05 +0200
Message-ID: <20250903213712.6364-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Michal Wajdeczko (7):
  drm/xe: Keep xe_gt_err() macro definitions together
  drm/xe: Drop "gt_" prefix from xe_gt_WARN() macros
  drm/xe: Prepare format for GT-oriented messages in one place
  drm/xe: Add dedicated printk macros for tile and device
  drm/xe: Define verbose debug macros
  drm/xe: Use tile-oriented messages in GGTT code
  drm/xe: Use tile-oriented messages in LMTT code

 drivers/gpu/drm/xe/xe_ggtt.c        |  12 +--
 drivers/gpu/drm/xe/xe_gt_printk.h   |  40 +++++----
 drivers/gpu/drm/xe/xe_lmtt.c        |   3 +-
 drivers/gpu/drm/xe/xe_printk.h      | 135 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tile_printk.h | 133 +++++++++++++++++++++++++++
 5 files changed, 301 insertions(+), 22 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_printk.h
 create mode 100644 drivers/gpu/drm/xe/xe_tile_printk.h

-- 
2.47.1

