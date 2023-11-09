Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C3CC4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 16:18:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193E48902A;
	Thu,  9 Nov 2023 16:18:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B81210E8EA
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 16:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699546708; x=1731082708;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n5jz0+i3ofGfD3ZJZVIVKkMDXkLmj3uEQAv4n9ewEi8=;
 b=H4LJRa7McZhhHMw2roX5ylQt2Qb9/+d3KCwHMEkrwWtes31tkIrlfafL
 UPBxz0vK0N26y9vHZpa5T9Ou+/ZzFn+kZIi0NcmCa+XcUE30ceMnx8xQL
 S2RA619YSzpiaFcZ1Jmdw2Eqn2quzgR2TqLUMpt37MWwf7NYoyIqqKdPG
 0oE45r4R+UH6jA6iFYlsXP8DagJ9G9/Dk5y3TM9vXXhVPudkiUNPQt7w7
 c3+sI1jSHcR56fWLrp3HoRaVDQiemhdmxPYO9HInxN2XG/aDQ9qynRWt+
 ln7WonpiiMIP99p113x/ILhCWDdx+3iTh9i6RUMejlg/2dXNN8MpZsWe6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11563265"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11563265"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 08:18:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="4764588"
Received: from unknown (HELO localhost) ([10.237.66.162])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 08:18:05 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  9 Nov 2023 18:17:54 +0200
Message-Id: <cover.1699546565.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/4] xe&i915 display pxp cleanup
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add slightly cleaner abstractions for plane protection.

Not to be merged before patches 2&3 have been merged to i915 upstream.

Jani Nikula (4):
  Revert "FIXME: drm/i915/pxp: some hack to bypass pxp"
  drm/i915: abstract plane protection check
  drm/i915: remove excess functions from plane protection check
  fixup! drm/xe/display: Implement display support

 .../drm/i915/display/skl_universal_plane.c    | 31 +++++++------------
 .../xe/compat-i915-headers/pxp/intel_pxp.h    | 28 +++++++++++++++++
 drivers/gpu/drm/xe/xe_device_types.h          |  2 ++
 3 files changed, 41 insertions(+), 20 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h

-- 
2.39.2

