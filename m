Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D703CCAC5BB
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 10:42:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4D010EBC0;
	Fri, 10 Oct 2025 10:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BjydqLZn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D53310EBA6
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 10:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760092931; x=1791628931;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f0B36qCMWZRHbn4nCh33+gsTPQy7U9WghsQ6hy8el8I=;
 b=BjydqLZnJQHr6vr5RgYpoGR1PD+1I/NNeTt1UKcRq+8UtRqIwBrbVgwk
 TwGdfWdLKqAhG7eeoQ/pVBkfN7T4CvgQBzmIrgcWY13gCGOvhRlMyae7n
 O5cqX/ChoqtptyTl6gQR8e9ZedH7+tUBh39MJuULWeHfcebHxmW5SDd1q
 i8uSBkdHCn9vA2JqxGezAmOMvPLi0/0D4uwq9CuI0hMpKLXROzSU4Vakj
 zStknXgPM1aZUGmeOoqyNDHjqnntoDZOo2S9twiFoY9C1uaNsqE2kwlG4
 9gRC/FG8Em3wn4jKURGLut+F0NwWCosTvIdb1xjZl+02J3ibOsJFJDS6w w==;
X-CSE-ConnectionGUID: AOaX79dLSsaD2U/cdnRz9Q==
X-CSE-MsgGUID: ULrrW7uVS0yVej3PbW8JIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="66166182"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="66166182"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 03:42:10 -0700
X-CSE-ConnectionGUID: mUL10iXESSKLnAlCCuZHPg==
X-CSE-MsgGUID: CjokoeKsTDuSLWmK4zUKeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="186214901"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.245.154])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 03:42:09 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 0/2] SVM migration fixes
Date: Fri, 10 Oct 2025 12:41:47 +0200
Message-ID: <20251010104149.72783-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
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

Two small migration fixes. The first patch ensures
data is migrated to system on faults when there is
an madvise for the system location.

The second allows userptr data that was put in VRAM
by SVM migration to remain in VRAM also for
userptr maps.

v2:
- Fix a redundant assignment.
- Remove a Fixes: tag.

Matthew Brost (1):
  drm/xe: Allow mixed mappings for userptr

Thomas Hellström (1):
  drm/xe/svm: Ensure data will be migrated to system if indicated by
    madvise.

 drivers/gpu/drm/drm_gpusvm.c    | 6 ++++--
 drivers/gpu/drm/xe/xe_svm.c     | 4 +++-
 drivers/gpu/drm/xe/xe_userptr.c | 4 +++-
 include/drm/drm_gpusvm.h        | 4 ++++
 4 files changed, 14 insertions(+), 4 deletions(-)

-- 
2.51.0

