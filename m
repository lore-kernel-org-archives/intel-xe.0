Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE54F53D73
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 16:40:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF5410E279;
	Mon, 16 Mar 2026 16:40:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RCF3/GZA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD45610E277;
 Mon, 16 Mar 2026 16:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773679198; x=1805215198;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S0tmqSE9wpP9ZCWw39CCGMfpCCMMwPuihMcdkzDv0t8=;
 b=RCF3/GZAUrPWUEwjYtqzEJLtDCvhAHXuDBolqYUeeNsB5m67GqUDq4I0
 UC0oROkvkfFuvHYW+0gAuhaG7grljSSxjF6XwGJTmKvdjh260X4o3CyTA
 ST4OkT+lHaVbcEoXUnsoeB5BF1MW0706CttFIOzLpkXbo3TzU4G656lZy
 sJ+DuT73CdU3B85HP7IVixd9ODKAXClYTqwSLioOsaiD+pvxRVbGZSpXc
 uS3nYcMSyTK7Um/zd8IEX6xVE3Tw/GuNoZZAnxJqeoC7x09zF0t4u+4fC
 iKAqBQ/G5Yrl1wPbIO4iPVETM456UZsgUcNsVO3vJvgz9SfwlqqaGbHSv w==;
X-CSE-ConnectionGUID: h7dHGj72TQWnnnYmjdQUAw==
X-CSE-MsgGUID: HO8S3pqVT9SXPIS4mgayVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74735663"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="74735663"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 09:39:57 -0700
X-CSE-ConnectionGUID: j51aoWXYSEyHR1mnmZuceA==
X-CSE-MsgGUID: tpluhAKDQ3moJtTA9DbnxA==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.42])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 09:39:55 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
 Khaled Almahallawy <khaled.almahallawy@intel.com>
Subject: [PATCH 0/3] drm/i915: Fix NV12 Y plane handling
Date: Mon, 16 Mar 2026 18:39:50 +0200
Message-ID: <20260316163953.12905-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Apparently I broke the NV12 Y plane handling a bit at some
point. Fix it up.

Cc: Khaled Almahallawy <khaled.almahallawy@intel.com>

Ville Syrjälä (3):
  drm/i915: Unlink NV12 planes earlier
  drm/i915: Relocate unlink_nv12_plane()
  drm/i915: Skip redundant NV12 plane unlinking

 drivers/gpu/drm/i915/display/intel_plane.c | 61 ++++++++++------------
 1 file changed, 27 insertions(+), 34 deletions(-)

-- 
2.52.0

