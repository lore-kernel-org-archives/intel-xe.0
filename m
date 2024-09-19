Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E409CF3975
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 22:42:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 025C110E77A;
	Thu, 19 Sep 2024 22:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UWFOgASj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA6410E77A
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 22:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726785742; x=1758321742;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1FwVF09jU7jwVQNzfneVbxYP9Hy8x0+9DXUkNmN0f8g=;
 b=UWFOgASj0vkAez/w2VG1xtDwerssVcrWVnsvK1DKvx1tQDGWoHkzSIqQ
 HCis2dF7O4hqlXSIFRd3qj0pDH6Gb4d7ZXuE3DPEWMQuxzv3tLq+CdD32
 Y+IU3qDX6IPfH28eE30iTO3jXp0ZmLI5CSb3Qx4rmR6x25w0YgSey4CGY
 ww+0TABaQGkVvVPTUZ2pf0AK4osKZQ7tyMDmUO1da3+I+h1IrMH7DDSVr
 1jmZVtwsg0GpOB6rReMxCfXFjSuxFnbO6QxLBJwtvv5CSGZXSD7/YpQ8X
 +ZANSC3/t37LHFcWgzfdc3vpHCL5FFBDq8AnnVVV+LY8DHtSbs2+ItmNg g==;
X-CSE-ConnectionGUID: ndsTaa+2RlW+/rpJbdD+fA==
X-CSE-MsgGUID: itytXNwMQoCoVU8RR5cK/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="51188519"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="51188519"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 15:42:22 -0700
X-CSE-ConnectionGUID: YeYXArlwRq2GjCXGXcs/Tg==
X-CSE-MsgGUID: cUeM2gbQQxi0GG3gGyVmjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="69681054"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa007.fm.intel.com with ESMTP; 19 Sep 2024 15:42:21 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v2 0/1] drm/xe: Prevent null pointer access in xe_migrate_copy
Date: Thu, 19 Sep 2024 15:42:19 -0700
Message-Id: <20240919224220.1325739-1-zhanjun.dong@intel.com>
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

Update lacks source flag to include resource is null case. This will
prevent null pointer derefrence in xe_migrate_copy.

Patchwork v1 link:
https://patchwork.freedesktop.org/series/138847/


Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>

Changes from prior revs:
 v2:- Drop changes in xe_migrate_copy
      Update condition expression as suggested

Zhanjun Dong (1):
  drm/xe: Prevent null pointer access in xe_migrate_copy

 drivers/gpu/drm/xe/xe_bo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1

