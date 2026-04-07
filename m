Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB071FB5189
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 03:04:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51E210E335;
	Tue,  7 Apr 2026 03:04:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bzRBnSfz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C79310E335
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 03:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775531075; x=1807067075;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=facvrLXuEzhm2wSxMMldJIQUpzS7e8uFf1p94EkmmAY=;
 b=bzRBnSfzNMUSHumwD/sbPd8tDMuA5uSTYQVl3aXcutkWqfKkUb5xLEuO
 LmlYIYNfAeYj9UOvgWbtlG4OtbXujW0bpZpaB0U1eecyu8bzb/PW+0YrY
 812+5I4VI0FLPK96VntBS9C0eFWw5x4A5TpDT2Usy6UHt+uSOuWoptp59
 KNQEF8PrbHKepYpXXmstLRPMryh4R0PFCRD++lWifzBKlmtpc2EI3NI+4
 FkxSuhZRvACsn3iNVGNVxvK1QtW9kOHk1sghRzCZVT0JLSE94uXPXeNxO
 EFi3C+TBSy7L1gWOtDwpPIAt4uyQWaddXqj2TfTSjx47tTnRIEYtRPhte w==;
X-CSE-ConnectionGUID: iG9Wsk0ATHmf6X1j+HREfg==
X-CSE-MsgGUID: PVKB7ch0TSaF30aHVW61UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76201129"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="76201129"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 20:04:34 -0700
X-CSE-ConnectionGUID: CjIk/wdEQbqYVBkmEkG8ew==
X-CSE-MsgGUID: /m0HPqBSRJOxfKfXnzguSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="225295054"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by fmviesa008.fm.intel.com with ESMTP; 06 Apr 2026 20:04:33 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH v3 0/6] drm/xe/uapi: Update xe_drm.h documentation
Date: Tue,  7 Apr 2026 03:00:40 +0000
Message-ID: <20260407030046.3394004-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
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

This series fixes various documentation issues in the Xe DRM                    
UAPI header (xe_drm.h). All changes are doc-comment-only with                   
no functional impact.

v2: Split 1 patch to 5 for ease review and with more fix.
v3: Split cross-reference fix to patch 4.
    more fix for patch 5 and 6 (patch 4 and 5 of v2).

Shuicheng Lin (6):
  drm/xe/uapi: Fix typos and spelling errors in xe_drm.h documentation
  drm/xe/uapi: Fix grammar errors in xe_drm.h documentation
  drm/xe/uapi: Fix wrong names and references in xe_drm.h
  drm/xe/uapi: Fix kernel-doc cross-reference syntax in xe_drm.h
  drm/xe/uapi: Fix code examples in xe_drm.h documentation
  drm/xe/uapi: Fix doc formatting and completeness in xe_drm.h

 include/uapi/drm/xe_drm.h | 206 +++++++++++++++++++-------------------
 1 file changed, 103 insertions(+), 103 deletions(-)

-- 
2.43.0

