Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46115C87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 13:07:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04BE510E847;
	Fri,  1 Aug 2025 13:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ki/MZh5H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACAD10E847
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 13:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754053673; x=1785589673;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VwTAOX2aLb3m/qLyQNe69ezQOyyB47Plo8AEeDIqR9s=;
 b=Ki/MZh5HdMG/0AokH2EcJqNdSrKiTZmfh1upXK5eEobz/R6p2LLyFxQH
 xeACHitewqRpniN+dZSOc6iF+d0v8XMa3bnG3UjJkx9/85cRpxxTzpqNu
 xWY7wAWn0RhfUiAzxaU1fdXB59HojvdcJSSu429iSmOjPaWUSXBL0Kvh6
 gN0OdYZM8SRmF36TzxnwR08Aj1kDXw/bvAO12j23h8MJSo3ck596ih8DI
 x3cU1yx9ZyfAHnB1jaITzPW/dWAlCmHO7kDQebzG4fJ5vcWDS7DBS3J+v
 GuKn3C9/yLmMRedpPygIYHJoK0qtvZ8Rpx1AXMc5SMPYnyw4TJr5Qo/Vs g==;
X-CSE-ConnectionGUID: +sln8xXWQDS5X70mFxl8MA==
X-CSE-MsgGUID: OyzP+lpwSa6x6zGNlOc2vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67762902"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="67762902"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 06:07:53 -0700
X-CSE-ConnectionGUID: O0b16drJREqzPuy3un3K/w==
X-CSE-MsgGUID: Ex9Tv+uyTBK866cZOLtRLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="167743897"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa003.fm.intel.com with ESMTP; 01 Aug 2025 06:07:51 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v2 0/2] Improve CCS save restore series
Date: Fri,  1 Aug 2025 18:54:39 +0530
Message-ID: <20250801132441.25463-1-satyanarayana.k.v.p@intel.com>
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

Previously, CCS save/restore operations created separate migration
contexts with new VM memory allocations, resulting in significant
overhead.

This series eliminates redundant context creation reusing the default
migration context by registering new execution queues for CCS save and
restore on the existing migrate VM.

Also fixed corruption issue with save/restore followed by S3/S4 cycle.

V1 -> V2:
- Fix kernel-doc issues reported by patchworks.
- Added new commit "Re-register CCS save/restore contexts post S3/S4
resume"

Satyanarayana K V P (2):
  drm/xe/vf: Refactor CCS save/restore to use default migration context
  drm/xe: Re-register CCS save/restore contexts post S3/S4 resume

 drivers/gpu/drm/xe/xe_migrate.c            | 18 ++++----
 drivers/gpu/drm/xe/xe_migrate.h            |  2 +-
 drivers/gpu/drm/xe/xe_pm.c                 |  3 ++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 49 ++++++++++++----------
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  2 +
 5 files changed, 42 insertions(+), 32 deletions(-)

-- 
2.43.0

