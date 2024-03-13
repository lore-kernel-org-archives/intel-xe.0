Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061AEC54E66
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 14:52:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A387389343;
	Wed, 13 Mar 2024 14:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iR2N84RO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D105A89343
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 14:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710341555; x=1741877555;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EKZIBKqqSHTpx+SFaZX1qlAWZRwfkx4GHlXweO2pe7I=;
 b=iR2N84ROeYeo3uy0iU8GDQyU4jMVc9R8innVn62c69qPnD2NB8hfkqRD
 OjCamt3Z+LEwhLgVA7ttW4IL5bNVZnsmhFR2N2zugxYwWMqFjrjB/CQLJ
 FGngct1t//6X6GE1iGZsTLG338YdPIv3lghIKhY59Wj8Ajyrv8AKRG642
 XCNcCC4xEc19QXZ2lXVsGbMcxiLE+AC/d6YlfjXErk1XO45M0O/pZjsbg
 Wij2GRXYxp5INeWx39d/aVd6DTMn/6yIb8FZSD7DRGQipZg305at2hU3O
 as2yTcB4RrRt3H0zIG6T9Qomkoy9AxYVHJ2aGGpb3LSIyEy5VaCdDkCuV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="22623983"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="22623983"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 07:52:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; d="scan'208";a="16545916"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa004.fm.intel.com with ESMTP; 13 Mar 2024 07:52:32 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v2 0/2] Minor fixes for errors reported by static analyzer
Date: Wed, 13 Mar 2024 20:35:43 +0530
Message-Id: <20240313150545.2830408-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
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

Series focuses on addressing few issues reported by static analyzer
tool.

v2:
Drop patch(2) from v1. consider it as false positive.

Himal Prasad Ghimiray (2):
  drm/xe: Return if kobj creation is failed
  drm/xe/xe_exec : In xe_exec_ioctl remove deadcode

 drivers/gpu/drm/xe/xe_exec.c      | 5 +----
 drivers/gpu/drm/xe/xe_vram_freq.c | 4 +++-
 2 files changed, 4 insertions(+), 5 deletions(-)

-- 
2.25.1

