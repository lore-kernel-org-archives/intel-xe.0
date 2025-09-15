Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF45CAC597
	for <intel-xe@archiver.kernel.org>; Mon, 15 Sep 2025 21:47:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B3810E5B6;
	Mon, 15 Sep 2025 21:47:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yd/M0bTM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1286010E5B6
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Sep 2025 21:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757972872; x=1789508872;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y4ETYaTe6EjC3DlKUfPS444oQVLFEpvhkDg8XlEgMVw=;
 b=Yd/M0bTMob1ljVA1iM7eEsPNzLYftOgRW8KeERfPduAeEWMZ7m8/xlVy
 aMtV6ezjg0JGIBXD3n0C1V9u8cj88JDu3ub7/scu9/n5VGRLxjRdlq4rf
 tsmqGq7cRAX9/rVH/OTH0+SpkZN5GE2Ry3vXKluLobkGfgiE+j9pHfp0g
 31gvXaWfhHZsMjUioFs1xYRoOVPP0/xFiOJHqu8niAi7ghQq3Vwhh7kEk
 hvrpEmt2r+aust3WmTjODTc9xj+Q9aBaRnafjf+kRgeCFGJDQQYuZ3/fV
 kErZOlGbPPEUL6cEmF9uB/6USC7RYIoy1VaGRF4kpATl5orjXxJ5RuykU w==;
X-CSE-ConnectionGUID: Zh2aSZP2Tw6KCP2K2Aoc4w==
X-CSE-MsgGUID: 09w0OQbGSVqz6FoefM4sxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="60388753"
X-IronPort-AV: E=Sophos;i="6.18,267,1751266800"; d="scan'208";a="60388753"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 14:47:44 -0700
X-CSE-ConnectionGUID: TU4Hh7xcQaGoRio1NwaSkA==
X-CSE-MsgGUID: TYeHyKOJQ8eCzUKDeEkimg==
X-ExtLoop1: 1
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa003.fm.intel.com with ESMTP; 15 Sep 2025 14:47:43 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH v3 0/2] drm/xe/xe_device_sysfs: modify sysfs clean up process.
Date: Tue, 16 Sep 2025 05:47:14 +0800
Message-Id: <20250915214716.1327379-1-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910183233.3971054-1-zongyao.bai@intel.com>
References: <20250910183233.3971054-1-zongyao.bai@intel.com>
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

xe_device_sysfs_init(): 
    on partial failure, any sysfs files created before the failure will be 
    cleaned up via xe_device_sysfs_fini, ensuring no leaked sysfs entries.

late_bind_remove_files() and late_bind_remove_files():
    Adjust remove order to follow the rule LIFO(Last In, First Out).	
    Remove configuration and status checking, 
    call the sysfs removal unconditionally.

Zongyao Bai (2):
  drm/xe/xe_device_sysfs: Add cleanup action in xe_device_sysfs_init
  drm/xe/xe_device_sysfs: Remove sysfs unconditionally while clean sysfs
    entries

 drivers/gpu/drm/xe/xe_device_sysfs.c | 41 +++++++++-------------------
 1 file changed, 13 insertions(+), 28 deletions(-)

-- 
2.34.1

