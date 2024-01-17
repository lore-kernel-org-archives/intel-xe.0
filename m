Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04F6C47258
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 13:41:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9884810E6BD;
	Wed, 17 Jan 2024 13:41:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBA910E6D8
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 13:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705498875; x=1737034875;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yAhInUr8+AbSbVzH4yc2yDeIoYZJTeijTmDwr/mFTsY=;
 b=PZvKBFFT5brAcvmhMA6KmqYBaXmVEXXEyShYoZ7xQSxxC4ucoKxRs7Kc
 Yv/kLe1OUWpcEy/vQR5ad/ciRrEK1oKpjTAY6GrXwvBnhoFe3z5Bv113F
 7qjd9E4lZn0mlbuTqzJguB4bxQ9TTgiAGd/SLn8Gc8CA2VIjHaNjxdN6S
 AS4rZz97IU+VtQib2sp4degiR5HOaD6lZktl0WlqthZo5nL1HIxfBZunk
 ckkchWuAG2StL6v4Ej/rvh8zaq29Y83WtS7nXLHYmK0iu0ZPi6RcFq8DG
 LBOg5NjvsV/s6BG84bXCpVzUcjWsRTMO3QOCDuFk0xTiYJ++cNeTCp3tc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="466549619"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="466549619"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 05:41:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="927831067"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="927831067"
Received: from clanggaa-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.57])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 05:41:03 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/5] Fixes for sparse warning
Date: Wed, 17 Jan 2024 14:40:43 +0100
Message-ID: <20240117134048.165425-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

A couple of assorted sparse warning fixes.

Thomas Hellström (5):
  drm/xe/dmabuf: Make xe_dmabuf_ops static
  drm/xe/ggtt: Use ioread64 to dereference ggtt::gsm
  drm/xe: Annotate mcr_[un]lock()
  drm/xe: Don't use __user error pointers
  drm/xe: Use a NULL pointer instead of 0.

 drivers/gpu/drm/xe/xe_dma_buf.c |  2 +-
 drivers/gpu/drm/xe/xe_ggtt.c    |  4 +--
 drivers/gpu/drm/xe/xe_gt_mcr.c  |  4 +--
 drivers/gpu/drm/xe/xe_hwmon.c   |  2 +-
 drivers/gpu/drm/xe/xe_query.c   | 50 ++++++++++++++++-----------------
 5 files changed, 31 insertions(+), 31 deletions(-)

-- 
2.43.0

