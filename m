Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9896FCAC5B0
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 15:03:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8E410E7F9;
	Thu,  2 Oct 2025 15:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J8Uo4Sb6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EDB10E1B8
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 15:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759417385; x=1790953385;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cDdhocOZegx3HkJKVSqjjpuogoMbn6idkko9pKEWrhM=;
 b=J8Uo4Sb6oCul8Od9mGkWf2er6aSz4Y2VD3zZxhYaqUbAo9IqCGI19PTt
 A5LS5Tpc1XDJ4/X3CxUI9bf4edGEsXt8opzt/Kw00n+wx6eg3aQ4KnG7m
 l6/G0iqoAgIUgbcsVCL9Wrve28R3GkHW75H36xwICw2A1xAN4oCTD9iqb
 lJdVRXQbbOdVt51VbkSid25Dy1yJ6/OAFgYv6uvDRSdhahl33gofIlFms
 lgIJmpGh6Ix11JCTEoMJ9sseTnsi7eHZonaTqZLZhGe6l7ft7kCrYpV6P
 +VqNbkGjTM/GzF6sU9H6rhF/3rBgHiQNLz18CDZweMtqexJLZPV8UXgKU g==;
X-CSE-ConnectionGUID: zPZvqnFCSD6rW4Ru7wD5aA==
X-CSE-MsgGUID: PWHDqZmSQnCDUSHvrksIHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="60741283"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="60741283"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 08:03:04 -0700
X-CSE-ConnectionGUID: 3ZdVWuAiSbeEztjRc7G3Fg==
X-CSE-MsgGUID: UzyD+G2CTtSWyC6iKV++4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="178334913"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa010.jf.intel.com with ESMTP; 02 Oct 2025 08:03:04 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com,
	Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v4 0/2] drm/xe/guc: Cleanup GuC log buffer macros and helpers
Date: Thu,  2 Oct 2025 11:03:00 -0400
Message-Id: <20251002150302.99524-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

Cleanup GuC log buffer macros and helpers, add Xe style macro prefix.
Update buffer type values to align with the GuC specification
---
Cc: michal.wajdeczko@intel.com
---
Change list:
v4: Replace helper functions with macros
    Rename log type xxx_DEBUG to xxx_EVENT_LOG
v3: Update comments
v2: Use SZ_4K, instead of PAGE_SIZE
    Expand for loop with switch and fallthrough

Zhanjun Dong (2):
  drm/xe/guc: Add prefix to guc log buffer macros
  drm/xe/guc: Update GuC log buffer type value

 drivers/gpu/drm/xe/abi/guc_log_abi.h |  2 +-
 drivers/gpu/drm/xe/xe_guc.c          | 22 ++++-----
 drivers/gpu/drm/xe/xe_guc_capture.c  |  6 +--
 drivers/gpu/drm/xe/xe_guc_log.c      | 71 +++++++---------------------
 drivers/gpu/drm/xe/xe_guc_log.h      | 14 +++---
 5 files changed, 37 insertions(+), 78 deletions(-)

-- 
2.34.1

