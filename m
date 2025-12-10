Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA112D3C91A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 14:57:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE5910E73A;
	Wed, 10 Dec 2025 14:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mrxQeMQm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913A110E73A
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 14:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765378662; x=1796914662;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uMEvHkLnQ+WlNOSbtrrqf8uz/WUb9bVC3rkEuJ7jR0A=;
 b=mrxQeMQm3ZAdmJqrQO4UWN4WArqInPPsk8jDbzWw/FKmsJC+UGnRnvEa
 pb/jT1O6a1RnVNGkqQBN/RnsTvTVWhjZAYABzwlbYkRjZCx4K5a1nZb8L
 blhEjAU9kzMVzZ5eXL5GocFKZWKf5uYvZbtI9esd8H54Cd/nvzwXo2GtE
 eRZr2KnnVcQPgJdPO2asCfU6t6I9FQvbJMFtYcrUlKI+XUgJSGW2kEaC7
 5e9aNBAOPnRj6fX0LF5AOt57co8VuhX5jwZEKX/SiXbfK84KXOuxzsi5x
 kgJfxXU6srAaHwgDgh8kJJ6NiBlW97o+UvxE9L6M56R/mVJH2mUm2VNKT Q==;
X-CSE-ConnectionGUID: mMXJvMCEQ7CvDBd7UneqjQ==
X-CSE-MsgGUID: mflIn86oSEm3yMZIkIDEdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="70971498"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="70971498"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 06:57:15 -0800
X-CSE-ConnectionGUID: z2HFDLVVQhGc9Wnld5BF3Q==
X-CSE-MsgGUID: 6EilZs8hTW+lMjfg0S9ZzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="195600246"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 06:57:15 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: maciej.patelczyk@intel.com, joonas.lahtinen@linux.intel.com,
 matthew.brost@intel.com, Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 0/1] drm/xe: Restore engine registers before restarting
 schedulers after GT reset
Date: Wed, 10 Dec 2025 15:56:17 +0100
Message-Id: <20251210145618.169625-1-jan.maslak@intel.com>
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

Jan Maslak (1):
  drm/xe: Restore engine registers before restarting schedulers after GT
    reset

 drivers/gpu/drm/xe/xe_gt.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.34.1

