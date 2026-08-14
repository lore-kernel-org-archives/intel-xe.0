Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2712C5CFCF
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 14:38:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF0E10E56E;
	Fri, 14 Aug 2026 14:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lQ8VwR9p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AA610E57B
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 14:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786718282; x=1818254282;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nFRrgdCS15THSZZctUskcw5sBjZJpKin5bs6CCU0tGk=;
 b=lQ8VwR9pBOAcTNeOQIEJZg22OG6XlpkjMXVTOogrepX28eKanxZpIfps
 BSmt8r/6KCYIXJXP5u5aSGK2Ja21VA1AgZ7fNTMgpOx1G+S38RYprQXzW
 XZf8CNVQQPJnY6cNKiGL/kHWL39Fdz+m3b0V9Q4uDotptQxPLvBmtcV9z
 PSbnxNzTLmEYehAFMHJuwAaivwhtq23LmfRXOjqWZpC1YDpNhlVDmH+Vl
 VJPqKG5F2yS9EdtLSvgrXt5EstAZl+XT14TaWWQKZyvxhb78yq6s2A+6e
 ryF0JjIr1KkRpFF7FKdOP1BBb2BOLApdUwJWLFEKQZV5exnYwW+MRI2bB Q==;
X-CSE-ConnectionGUID: Mo3OfUAxTWS/O9X/FoG9WA==
X-CSE-MsgGUID: btX1EK/PTqiTt8k+Tao0Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="98655218"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98655218"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 07:38:01 -0700
X-CSE-ConnectionGUID: huGc6dXOT6WHuV+RF0eNDA==
X-CSE-MsgGUID: 4il1IorhS4yTs0IMQ5WKTg==
X-ExtLoop1: 1
Received: from rvuia-mobl.ger.corp.intel.com (HELO fedora) ([10.245.244.164])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 07:38:00 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v2 0/2] drm/xe: Adjust the bo shrinker batch size
Date: Fri, 14 Aug 2026 16:37:35 +0200
Message-ID: <20260814143737.49684-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Shamelessly stolen from i915, To avoid gpu stalls for small
shrinker request, Set the shrinker batch size to the average
size of system buffer objects. Use the number of
populated struct ttm_tts to compute the average size.

v2:
- Fix the average object size estimate to account for the full
  shrinkable and purgeable population.

Thomas Hellström (2):
  drm/xe: Track number of populated ttm_tts in the shrinker
  drm/xe: Update shrinker batch size based on average BO size

 drivers/gpu/drm/xe/xe_bo.c       | 12 +++++-----
 drivers/gpu/drm/xe/xe_shrinker.c | 41 ++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_shrinker.h |  3 ++-
 3 files changed, 45 insertions(+), 11 deletions(-)

-- 
2.55.0

