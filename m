Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CBDC3DA4B
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 05:43:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB5410E944;
	Wed, 17 Jul 2024 05:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XWGw/jWr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22DF10E940
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 05:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721194973; x=1752730973;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JjEoBkfGUjhWzwR2nmX3kO2MIvOuqJ3Yqb9/O57/exw=;
 b=XWGw/jWrmkfvRoprzkJ1RO/OqFeDPKUiz20mnwPhjLrA0XF9qblARAi4
 IpvedynzY5n+1+ogz6L4aWecr2wmcprY/4GSfMQOwB789qEVZprUkK+Kp
 F58PWDDIREBCVxpGwqdJrvJ2QwUyTqIb9TyagLvW5i/Jzv2dIiimp/C7z
 Jxj0f/U8e5ITclK/m4Lk4w1Rl5IbHvA4fP8oBHkWMeaIwT+roo2X0sKbv
 j4oxLaJVWJk5X48r2fPaATrRUbMljZ7U9xPtKsH+Seh0zK7i8z1mRa8ia
 QCz891gUVo5SoZREcaMoLWMPOYummqgh8IwvLh8Q6CQX5eth4d3/+U2bV w==;
X-CSE-ConnectionGUID: fvZtsh/URH+qcRqiSMiFyQ==
X-CSE-MsgGUID: rrIRPbNKQWqNhZ73GjgGIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18289389"
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; d="scan'208";a="18289389"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 22:42:51 -0700
X-CSE-ConnectionGUID: /nqSfuezQ2WrAsYazuRXEw==
X-CSE-MsgGUID: 39+cV9g4TmC7t/KW73+Ltw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; d="scan'208";a="49999947"
Received: from dut1107bmgfrd.igk.intel.com ([10.211.177.88])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 22:42:50 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com, matthew.d.roper@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH 0/1] drm/xe/xe2: Introduce performance changes
Date: Wed, 17 Jul 2024 05:42:45 +0000
Message-Id: <cover.1721194667.git.akshata.jahagirdar@intel.com>
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

v1: drm/xe/xe2: Introduce compression performance changes for Xe2

Akshata Jahagirdar (1):
  drm/xe/xe2: Introduce performance changes

 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 10 ++++++++++
 drivers/gpu/drm/xe/xe_tuning.c       | 13 +++++++++++++
 2 files changed, 23 insertions(+)

-- 
2.34.1

