Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1F2CED274
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 07:36:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC9410E482;
	Tue,  8 Oct 2024 07:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hCds3PIe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA15010E482
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 07:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728373001; x=1759909001;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8mhceZLWD8UI5Wa0YEv+9KGPVrbrWUX1OmJcY0xCR2c=;
 b=hCds3PIeuiSa+FYUiWASAATtQsGustQni5hRWsu55vWvKM/LHrJBY1TR
 9h4bPv4zGeEOpo3JNIE1Q8/UOdfzmwKm8kTrHI9ZENh3zb9x9jvwIkWXJ
 kIOkoCiMN1rkrLF8D/s/TbJcnKQudlz/srVYSIDEGU6AT3vXsp6EQd351
 qOjjAv1pqq72zoJUM3NScUriCwKnjK3Ff/JYWfux4jjibzAujDvNXUy16
 XqunTpUuQOYuY5TG6T/NKxkUIZ8YHG/DnmtGa4Z6OE3urw85VyTew3ZRK
 CSTIQah0Pu+7B+SNXssqvljmuleqMbysGcW8ME/1v/WsgPgnQXBhr4a3L w==;
X-CSE-ConnectionGUID: 7pPqYPvMRR+xX5lrn7rIiQ==
X-CSE-MsgGUID: mqB0VU0tSb2Us6v1TMThRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38938136"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="38938136"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 00:36:41 -0700
X-CSE-ConnectionGUID: 8R5WJ87bT/2hW+KYuwNzAg==
X-CSE-MsgGUID: Iql532oeTDSTW6RnHh/1rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="75601208"
Received: from unknown (HELO bvivekan-DESK.iind.intel.com) ([10.190.238.63])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 00:36:39 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v2 0/2] compute mode change refactoring
Date: Tue,  8 Oct 2024 13:06:26 +0530
Message-Id: <20241008073628.377433-1-balasubramani.vivekanandan@intel.com>
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

Balasubramani Vivekanandan (2):
  drm/xe/xe3p: Set mask bits for CCS_MODE register
  drm/xe: Use the filelist from drm for ccs_mode change

 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  2 +-
 drivers/gpu/drm/xe/xe_device.c       | 10 ----------
 drivers/gpu/drm/xe/xe_device_types.h |  9 ---------
 drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 15 +++++++++++----
 4 files changed, 12 insertions(+), 24 deletions(-)

-- 
2.34.1

