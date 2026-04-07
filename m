Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B415105D98C
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 23:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB8610E4DC;
	Tue,  7 Apr 2026 23:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IA51wxOP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F207B10E4DC
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 23:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775602978; x=1807138978;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tA3t4+CZMW4JgSqKGuJYa0k7IYFSroCl5y6OYM8R5cg=;
 b=IA51wxOPxVLQbjj2INUd+DsNpsFTTj+/zbKz+IvgXYKkV3HVJVrQMAk6
 tVjJvMVVEpp1EOcsdEY8sgPanRNWROPHHu6hXK7CK0UU1pCkpehnPSYe2
 bwKb4vJkm9ShPN8z9uKC5lsWs3PajCcaVF79XWcvr+TPx8MF5sJVNspKs
 IaIqmMmY6dtsPdx1/VZAICfNmHiIkugeZVlELqaNTRvVopNFlGeSay+3+
 fevX3CeDDcMgtFKdtEsBBCjE6poTJh5VUizN/Rv1vNNW3g07Fvn3jDpO2
 kP1/XG2ej2m3EIz6HgrtAoHLM6su4uoDo0kVSVGAcbqQ3c5xQyn8mZFlc w==;
X-CSE-ConnectionGUID: 4eUDUzu+Qu+/M8OPuTRvqQ==
X-CSE-MsgGUID: vH+z3XzkT5aEc8+T8Fmqhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76542537"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="76542537"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 16:02:58 -0700
X-CSE-ConnectionGUID: O5ua/VAPT46vcevuN5GrlQ==
X-CSE-MsgGUID: fEYH3D6FQjmVJQZe3AzfRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="232342611"
Received: from shosgclin.sh.intel.com ([10.112.232.103])
 by orviesa003.jf.intel.com with ESMTP; 07 Apr 2026 16:02:57 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 0/2] drm/xe/ras: Fix and clean up xe_drm_ras
Date: Tue,  7 Apr 2026 22:59:11 +0000
Message-ID: <20260407225913.3397059-1-shuicheng.lin@intel.com>
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

Patch 1 fixes error handling in register_nodes(): missing cleanup of
previously registered nodes on mid-loop failure, and an invalid kfree()
of an ERR_PTR when allocate_and_copy_counters() fails.

Patch 2 follows up with pure coding style cleanups.

Both patches apply to xe_drm_ras.c introduced by commit b40db12b542f
("drm/xe/xe_drm_ras: Add support for XE DRM RAS").

Shuicheng Lin (2):
  drm/xe/ras: Fix error handling in register_nodes()
  drm/xe/ras: Clean up coding style in xe_drm_ras

 drivers/gpu/drm/xe/xe_drm_ras.c | 50 ++++++++++++++++++++-------------
 1 file changed, 30 insertions(+), 20 deletions(-)

-- 
2.43.0

