Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FB9E77187
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 23:00:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6271410E27C;
	Tue, 17 Dec 2024 23:00:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BSXgJcbq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B09A10E27C
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Dec 2024 23:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734476415; x=1766012415;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=76IYMBpCPQr3/n75Rt82BA+8f+S7g5A4J+MapXKoJxA=;
 b=BSXgJcbqCMOpjcHnx/YbHkPS8HXOyOTysIfM1gi1j3vF0+KbfFPdaQar
 lmu0GAs102bTyYfaMfDZD7C9r/R+x5i+t8BzbLHMi9nnt8yFk3lavBD/s
 G1HfdAcE+VWkeL0EuRUO9yeL7mW9kB1fWLp6V6sdi8wK7ED7/Uzhf4+ml
 QQTKwZs76LaIclNbaC5FrnkZV42snmgSxsvxBNPNrCszJ3TDbqh17UFhO
 MZTsmodKc5WDGbP5HiMxk+xGRPy5FPZaACOmTnLsyw1AymcQbq3CNp+ia
 Li1Zu79jr1q0Xhp5xF+O7GqqhlevvdwhsR5ALhELbPBsEL4p+iYXmoryl w==;
X-CSE-ConnectionGUID: xTjXbe2qRMWgquJ9BdGiLg==
X-CSE-MsgGUID: Dji3XVUPRRuxMi+Av7Htvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="35072198"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="35072198"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:00:14 -0800
X-CSE-ConnectionGUID: mQeNKt87Q+OF/YplOrDm1Q==
X-CSE-MsgGUID: IS2u2bPqRJmTfM1qse+rbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="97901073"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:00:13 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH 0/3] drm/xe: Small trace print improvements
Date: Tue, 17 Dec 2024 18:14:17 -0500
Message-Id: <20241217231420.2361302-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
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

1. Trace bo create
2. Print vm flags in xe_vm trace print
3. Print vm parameter in xe_vma trace

Oak Zeng (3):
  drm/xe: trace bo create
  drm/xe: Print vm flags in xe_vm trace print
  drm/xe: Print vm parameter in xe_vma trace

 drivers/gpu/drm/xe/xe_bo.c       |  1 +
 drivers/gpu/drm/xe/xe_trace_bo.h | 19 +++++++++++++++----
 2 files changed, 16 insertions(+), 4 deletions(-)

-- 
2.26.3

