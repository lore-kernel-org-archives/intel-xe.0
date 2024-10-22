Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F1FD17151
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 01:01:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266EA10E5CF;
	Tue, 22 Oct 2024 01:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d7tfXvRW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13B210E5CF
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Oct 2024 01:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729558884; x=1761094884;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7sliDGgpDhBeMHJ21XJ3gMeYCQVs90JeViUCLloe+G8=;
 b=d7tfXvRWkzckomWVIOl7Jf3dR1XZPkFYDMIGkhKObIlD3P7FzSlNOv2A
 0UgZV6mIEOXSHMR+B/TLW+JKRS1v1cwzzngGwjO7OePNBRZLK8VQZPDtE
 oFCcC9WnklZbmTqwUrKNHnqiSx/EsI9vsfdrKDFQcrqmDsceM1QPKNbAM
 eTy0Aewg/Qo9tv8OMm8SeQU9X0vk8bRaPn4WZR9jL+r9eIakh0DLetbU3
 7CwBQnPFblBiEEHqgyZdVOTrjsjxxVMtC4NW7PtR33mTOI6LcK3zI052f
 KOia4so8nc7JhKfftzkrqzZG/sxHe/hUl77T7HgCPFCILZf6HDedFgsPX A==;
X-CSE-ConnectionGUID: yyCQ1v4KTMOEy8J2wn1LKg==
X-CSE-MsgGUID: ytQJ8Z1SSTqJeaeM5wygMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="29168482"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="29168482"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 18:01:24 -0700
X-CSE-ConnectionGUID: qX0yfvckQiu0tfjdjCX0Og==
X-CSE-MsgGUID: Pzac2VTWT4Gma8o7MOoTpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="79622270"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa009.jf.intel.com with ESMTP; 21 Oct 2024 18:01:23 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 0/1] drm/xe/guc: Prevent GuC register capture running on VF
Date: Mon, 21 Oct 2024 18:01:15 -0700
Message-Id: <20241022010116.342240-1-zhanjun.dong@intel.com>
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

GuC based register capture is not supported by VF, thus prevent it
running on VF.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Changes from prior revs:
 v2:-  Remove 2 unnecessary SRIOV check

Zhanjun Dong (1):
  drm/xe/guc: Prevent GuC register capture running on VF

 drivers/gpu/drm/xe/xe_guc_capture.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

-- 
2.34.1

