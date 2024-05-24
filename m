Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5ADC25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 18:24:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F283010EA38;
	Fri, 24 May 2024 18:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UBkzjzRH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF29E10EA38
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 18:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716575051; x=1748111051;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vexEnM2bfVv2khaiMp0qIGkeAcAXjimSRwMyGDek9zA=;
 b=UBkzjzRH2z+ssfiRiXOA82XKpDy2cDThxoWEGnHfjlPxkoOs7e+Zjpk0
 6Jh+E+lWQkIkx35YpGyU3w29/hMYc51mY4h6BzF4N4OpTlFTO03mJvtlS
 kmr5pg1Sxn+a+JJ3rHDDUHflktPly5C3RN/2T9AMoMF7Ak1C4I818aU8m
 vT7ganzuc95PG2DLbaRrVDgfCJ7jHneoeUD1TDVkgeMoaKRLUW/akqBON
 dKxrKhuuAiu4t3lRb52Oaxl9vY3BdJbng3J7oAsbBlA/F/umBlhs/GLsB
 ntbjdEFrrHXvHos897RWc5izTbvObTHX1U5JnoIlpRumPE0jLy4+vPGyH A==;
X-CSE-ConnectionGUID: UY6ST1EYSLehjfh4/CECaQ==
X-CSE-MsgGUID: yhBO0Gs1TDWTHI+CB0uR4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="12749821"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="12749821"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 11:24:10 -0700
X-CSE-ConnectionGUID: nDa8soK5QeuQqMOHn22iWQ==
X-CSE-MsgGUID: MPS1oTgNTIqxoUN9IiCrbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="65333066"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 11:24:11 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/1] Xe OA Consolidated Diffs
Date: Fri, 24 May 2024 11:24:03 -0700
Message-ID: <20240524182404.133725-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Because Xe OA changes between successive revisions are distributed across
multiple patches, I am providing a combined diff of all changes in a single
patch to help with the code review.

These changes pertain to: https://patchwork.freedesktop.org/series/121084/

Ashutosh Dixit (1):
  drm/xe/oa: Combined diff of changes between v13 and v14

 drivers/gpu/drm/xe/regs/xe_oa_regs.h |  4 ++
 drivers/gpu/drm/xe/xe_guc_pc.c       |  9 +--
 drivers/gpu/drm/xe/xe_oa.c           | 98 +++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_oa_types.h     |  3 +
 include/uapi/drm/xe_drm.h            | 21 +++---
 5 files changed, 93 insertions(+), 42 deletions(-)

-- 
2.41.0

