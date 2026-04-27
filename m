Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C23CFF8870
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 22:11:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F312E10E967;
	Mon, 27 Apr 2026 22:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AUeHP9E8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57DD010E963
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 22:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777327897; x=1808863897;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P5r37d1FazmS+bffAYRpU3wfkeMPp5mzH1UgJcH5NJA=;
 b=AUeHP9E8hE+kC6ncTrRwkMjdunbIhfRWtP0E7ppAVXUsJJAPN3xwlla7
 YHdl585+JrtoFzaF4NOPVs0UrIAlxDwX2EP96ad16NOZg6jJpL7O3ESYT
 IgZS/P6VDu5IpIJ+TmywZirWpyrYa4uiMReYpXaCyklDm89+HyJxUO+eg
 fjLZSivMtkddIjrunYAGn22E8N6aqOYYYuL0UCth/bNFSbJsJI5YDw+bq
 bO5Gycgp6SNN1Atvu5cgFuZWV7GaCpc6D/ts/LILxZe6f56iK7zKhfPBz
 HApwcPqbrXLlbdeD1ya4AukbDCoTmpHwJZOK7uG5Y1WnBHqM62le9wleu g==;
X-CSE-ConnectionGUID: 0RQ2aRmwSJmvDaL6ger0XQ==
X-CSE-MsgGUID: IGYzpAfTTfyQZFbGKBaOXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="89607636"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="89607636"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 15:11:37 -0700
X-CSE-ConnectionGUID: vHzJm6JmS2u4CTzS3Y+spw==
X-CSE-MsgGUID: 3QxWqmOVRzaYNZkJBjOO+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="257076308"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 15:11:37 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v8 0/3] drm/xe/oa: Wa_14026633728
Date: Mon, 27 Apr 2026 15:11:30 -0700
Message-ID: <20260427221133.2500532-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
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

v7 though v2: Change to Patch 1 (see changelog in Patch 1)
v8: Change to Patch 3 (see changelog in Patch 3)

Ashutosh Dixit (3):
  drm/xe/oa: Use xe_map layer
  drm/xe/oa: Use drm_gem_mmap_obj for OA buffer mmap
  drm/xe/oa: Implement Wa_14026633728

 drivers/gpu/drm/xe/xe_device_wa_oob.rules |   1 +
 drivers/gpu/drm/xe/xe_oa.c                | 126 ++++++++++++----------
 drivers/gpu/drm/xe/xe_oa_types.h          |   4 +-
 3 files changed, 73 insertions(+), 58 deletions(-)

-- 
2.54.0

