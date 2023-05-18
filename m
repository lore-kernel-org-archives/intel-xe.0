Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B71AC77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 21:25:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3577110E562;
	Thu, 18 May 2023 21:25:19 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED4D10E558
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 21:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684445116; x=1715981116;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0JmSld7R30q+gK1TNgqeMwuTeE2LzHeZAf6bTAn5yIM=;
 b=NEXepSYufhvDLAbyR6C3UYKLE4E2XjeXeF6FM3KGtvPSDQcSMXT8vZ1h
 N16jqXGHQy1+WmwZpKaVCHklzN9HQB/Oum06DSmp+ulw389AzjFW+fA5L
 /Kj4l1catidDlXvvc+MLSQcpTp+8MAZ6WMdukIvN/aOT7/RHHWFqJAscY
 0MqBD9lxEYYFav1pHFIHNmJZFjW71YWPwpmDcp2rXW4cI1cAr7HgRO895
 ivuL2QUlFWHpagsKGgqevQbZIUKWjYr1TVQEcLTC5pESTCa9zH1CCaQvY
 vDdpF9aZc8BKzjQYk5KkLfW/K+iS53S89wcoUpcewNskpd9ko2lxwT10L Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="354543573"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="354543573"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 14:25:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="948846698"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="948846698"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 14:25:15 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 18 May 2023 14:24:43 -0700
Message-Id: <20230518212446.3570168-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/3] kernel-doc fixups
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

To be paired with https://gitlab.freedesktop.org/drm/xe/ci/-/merge_requests/13
so I reduce my ability to break it on every other commit.

Lucas De Marchi (3):
  fixup! drm/xe: Update GuC/HuC firmware autoselect logic
  fixup! drm/xe/rtp: Improve magic macros for RTP tables
  fixup! drm/xe: Introduce xe_reg/xe_reg_mcr

 drivers/gpu/drm/xe/regs/xe_reg_defs.h | 16 +++++++++-------
 drivers/gpu/drm/xe/xe_rtp.h           |  3 ---
 drivers/gpu/drm/xe/xe_uc_fw_types.h   |  2 +-
 3 files changed, 10 insertions(+), 11 deletions(-)

-- 
2.40.1

