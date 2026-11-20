Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE37606A330
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 09:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eZg4eFQ8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FAD7112869;
	Fri, 20 Nov 2026 09:56:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BF411285E;
 Fri, 20 Nov 2026 09:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795168561; x=1826704561;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/eVziy227bAGQDwW2Q0RXwDduDXPWeTATTZqKRpybc8=;
 b=eZg4eFQ8ljHuAm+kGlYAimU3PZ1eONuMB2you5+AEkS0mJTWaXllufib
 cR9SqJpiTDQIN1TVZctyrFw0TfqWvPMtx0pRBkiq7ZwRzHj2wE1W/1OgQ
 n/uAA5dpA0bueBFfHpWQAVeESXya9ufDsnRCY4jb4iKl4woWauxTTyR/a
 flCjz6DEF0RxlXrFqa2j3ZTEET8eXgXz/cR1ppa0QbmYzZ+qvI/Bu69Wl
 OfdUcSYEpm+K8CJPZCnMfsi7chZ889WdXht3IESUBWcP6+JWM9pUDbT/S
 Z5qLX/V7fmARS/+C3LPmGka3RM4zjPnRu0qX/tmvyVnDKKJUgw4+fBkX+ g==;
X-CSE-ConnectionGUID: fMo3P6xwRuqBnbkjz71lRQ==
X-CSE-MsgGUID: xlgLAjzfR7GwMM2CnVPC1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4072512"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4072512"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 01:56:01 -0800
X-CSE-ConnectionGUID: DhoYb2LyRXCjulG6uo467Q==
X-CSE-MsgGUID: fG6wRV2TTtWU62fVPXn95Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="10566984"
Received: from lpankiew-mobl.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.221])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 01:55:59 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 0/4] Fix selective fetch update
Date: Fri, 20 Nov 2026 11:55:37 +0200
Message-ID: <20261120095541.1325118-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Remove adding all enabled planes before the plane checks: planes added
that way have no damage clips and can make every selective update
cover the full pipe.

Disabling Selective Fetch for biplanar planes or fetching them only
partially seem to cause visual corruption. Work around this by allways
adding enabled biplanar planes fully into selective update area.

Update planes when the early-transport SU start moves.

Add a display tracepoint for the final selective update area, including
pipe, frame and full update status.

Jouni Högander (4):
  drm/i915/psr: Update planes when early transport SU start moves
  drm/i915/psr: Keep planar planes in the selective update area
  drm/i915/psr: Don't add all enabled planes into state before SU
    calculation
  drm/i915/psr: Add trace for selective update area

 .../drm/i915/display/intel_display_trace.h    | 33 ++++++++
 drivers/gpu/drm/i915/display/intel_plane.c    | 10 ---
 drivers/gpu/drm/i915/display/intel_psr.c      | 84 ++++++++++++++++++-
 3 files changed, 114 insertions(+), 13 deletions(-)

-- 
2.53.0

