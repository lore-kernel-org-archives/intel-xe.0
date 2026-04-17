Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7022FF436B4
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 16:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3050610EA7E;
	Fri, 17 Apr 2026 16:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iZED3jre";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B7D10EA7E
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 16:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776442753; x=1807978753;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DFw/6QSzpM5ZiiaAU9ReJtnnBXPjOWk2itTlBvEV4Xc=;
 b=iZED3jreyGHJrOYo2kQKEOKBeLl5QWandOaCd9GKGw3kW8FSaHTixVyK
 YdOXl9D6/wvgD9600N+PQ1oO1QEkdRviYYA08rA6ZSGZw0yy9m8dDmX70
 W3+EFZUr5KMcer20ohyZESAhmZjVjcmmUfr/f1oGBC5lZxqd0jxONukiC
 T6Swe8xqQArg/wdLZUoo3UKTvRroH/pxU6zD+fPaID4sYB9Dlqfd53k2o
 ZNOL+TTinjA8CAntPhWkE0jN/5xigcPcPmjrF5uDLkMJNAAwcGEI4aUog
 +zOSgiOeh5p0nUBQnCiUd7SEQosn4rMQX7mFlKWf6PQ4eVVzqodiSmwSp A==;
X-CSE-ConnectionGUID: W3wWXAQ0TRih2fZp9O0URQ==
X-CSE-MsgGUID: FGL7yAXQRX+8ax29o37hlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="87760128"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="87760128"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 09:19:12 -0700
X-CSE-ConnectionGUID: BXfT3pf3SeaaC3Eo/JNQsQ==
X-CSE-MsgGUID: zGUq7vjJSkuLt3RWPA0BNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="230222159"
Received: from osgcshtiger.sh.intel.com ([10.239.81.49])
 by orviesa010.jf.intel.com with ESMTP; 17 Apr 2026 09:19:12 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH 0/2] drm/xe: Fix double-free of managed BOs in error paths
Date: Fri, 17 Apr 2026 16:18:59 +0000
Message-Id: <20260417161901.3416021-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.34.1
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

Two callers of xe_managed_bo_create_pin_map() explicitly free the BO via
xe_bo_unpin_map_no_vm() in their error paths. Since the managed BO
already has a devm cleanup action registered, this causes a double-free
when devm unwinds during probe failure.

Remove the explicit frees and let devm handle cleanup, consistent with
all other xe_managed_bo_create_pin_map() callers.

Shuicheng Lin (2):
  drm/xe/gsc: Fix double-free of managed BO in error path
  drm/xe/hw_engine: Fix double-free of managed BO in error path

 drivers/gpu/drm/xe/xe_gsc.c       | 5 +----
 drivers/gpu/drm/xe/xe_hw_engine.c | 4 +---
 2 files changed, 2 insertions(+), 7 deletions(-)

-- 
2.43.0

