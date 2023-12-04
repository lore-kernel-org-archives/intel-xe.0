Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD250C10F05
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 05:18:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41EF610E194;
	Mon,  4 Dec 2023 05:18:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAAC110E190
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Dec 2023 05:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701667132; x=1733203132;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iZZ1o+Ih3+kVhundjqI9Ss0DQkyE0+qHzdcOvwMrWo0=;
 b=m0O4abaVDVzIBArq4tqWqO+Jo7v7H8RoQJynovLf3lMXrMpx3fVZLRJi
 M4cz2NFo+K2xxm/KR6FTUO9bMOhHwsxdev+9I1biIU5uIuVvpzgSo2LqB
 9wTDh0gEXvzSvS8gHlBNzsWvuqVCZPSJJc5JKNzI155rXGOzzTeNm/KDD
 CXt6Bgw6GEeJlaz4sxe8XrrgL70b3sk7UVUtQMKn73VqYLSqD/Wvp4r0m
 mssQyVmuq4pSBC2mEeRfjBdFfLV325fgu9rq/DGH0dgTk9ZUOJmpmCMtC
 C/QeXfLgv5Rdg5Nj+Bur8yB+r4SKQNGmgP6ZaPpuIU+VMNXDVoFTbaNII A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="396494421"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; d="scan'208";a="396494421"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 21:18:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="774143114"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; d="scan'208";a="774143114"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2023 21:18:45 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  4 Dec 2023 10:56:07 +0530
Message-Id: <20231204052609.3283031-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Fix deadlock issue on d3cold
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

kernel BOs need to be restored to the same place in VRAM, and with
d3cold that means that any VRAM allocation can
potentially steal the spot from kernel BOs which then blows up when
waking the device up.

However if we end up moving xe_device_mem_access_get() much higher
up in the hierarchy (start of the gem_create_ioctl) then
this is no longer possible.

This patch fixes the deadlock issue seen in
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/256
Also enables d3cold to get CI results

Riana Tauro (2):
  RFC drm/xe: Move xe_device_mem_access_get to the top of
    gem_create_ioctl
  CI drm/xe: Enable d3cold

 drivers/gpu/drm/xe/xe_bo.c | 26 ++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_pm.h |  2 +-
 2 files changed, 21 insertions(+), 7 deletions(-)

-- 
2.40.0

