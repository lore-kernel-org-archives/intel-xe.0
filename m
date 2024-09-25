Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1722ACF9C69
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 01:21:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C887A10E085;
	Wed, 25 Sep 2024 01:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ver328Ub";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC8C10E085
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 01:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727227271; x=1758763271;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fk0HhYRk4hoKuxd4XVEle/uUKupb65B3Ouw7xPlzXZo=;
 b=Ver328Ub64FdCKkfVDphLq3//FyuOzeNa0Sbnym+P9kXj3z75RHDLNRr
 sr+f/qV/g8o1xlGdUUGmrpAIju1rWUss2hbgorvbk65BxRAOCvAXt9rgy
 n/2imQeilmfVSv1jg9gh6nhlwNoH2QaD0IUyzymhzIQ8Y2sfrE5kIO3q8
 g2LYyC4GOCpb+78Zp89qUiSVFsAS7wm6ZxUc2mZAx5hyx8c45K7mc9SS7
 VbPMys7Dlmdym6qHYCOsEPaISDIolN64TOJHZOUlDGqatVxQNvITAW0SB
 0GkHuwWbXCOq9MOQJ7vUqVBTc+1v2iOHqXi3fm5iQuqU942xvIL/Y/uSX w==;
X-CSE-ConnectionGUID: 3TDRwnjmTWmtt+Z7btnFIQ==
X-CSE-MsgGUID: GzC5MpHkRy2D7PuIbPjd5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26406434"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="26406434"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 18:21:11 -0700
X-CSE-ConnectionGUID: bQZhCOEwRiyBbjYeQRXtfw==
X-CSE-MsgGUID: QZJjgGwsQda5XbaByQzIBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="71235298"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa007.fm.intel.com with ESMTP; 24 Sep 2024 18:21:11 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v3 0/1] drm/xe: Prevent null pointer access in xe_migrate_copy
Date: Tue, 24 Sep 2024 18:21:09 -0700
Message-Id: <20240925012110.493257-1-zhanjun.dong@intel.com>
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

xe_migrate_copy designed to copy content of TTM resources. When source resource
is null, it will trigger xe_migrate_copy have null pointer derefrenece. To
avoid this situation, update lacks source flag to true for this case, the flage
will trigger xe_migrate_clear rather than xe_migrate_copy.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>

Changes from prior revs:
 v3:- Update commit message to include Fixes and issue stack trace
 v2:- Drop changes in xe_migrate_copy
      Update condition expression as suggested

Zhanjun Dong (1):
  drm/xe: Prevent null pointer access in xe_migrate_copy

 drivers/gpu/drm/xe/xe_bo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1

