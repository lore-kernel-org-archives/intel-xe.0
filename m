Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC076C3DA41
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 12:25:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6963F10E532;
	Tue,  9 Jul 2024 12:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V0d/ZXdc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E7810E532
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 12:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720527924; x=1752063924;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=L/TIPzebwywEKBWl6tdPup3FzmV74tX7jgH4/Y4A78o=;
 b=V0d/ZXdcgOttpWNbaEgeZu25QVGfyDeWFS5hK8ALeU+TkoW7SJSQyFvH
 V8gh1AA90mUaQIUnZeZMWT/xiCgQMTfmwGSU+bEJO/7hQqznoZDGbOA3N
 Q/Kcem0utwncIM3fSeY76XKcWNwPRp01YptDxno21cTvohQlNm3qlPLMP
 iWUU7SlW1jYvmY2M8riks6yj132ugdOkxfw6fHp+mPdUicjf90hh8uYg2
 T/AKP65nKS3qapQ2oyARgqT6nrz5XT8RGdpujdbPPztltgKuiDhCrWkss
 4aeMi6wgrNJV2aznJyOFfvg0qZdVkB0YVrJik/a9bcexcgINLxtpAjLzs Q==;
X-CSE-ConnectionGUID: WKLqlpuHQhuVqM8pwkPVIg==
X-CSE-MsgGUID: k7NmCShWQp6LUE85Szvh4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17647143"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="17647143"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 05:25:23 -0700
X-CSE-ConnectionGUID: UKaQdoyzTeaj84tCFJzsxA==
X-CSE-MsgGUID: FXDLMY1xQj29mliFI3jX3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="47774069"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.59])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 05:25:21 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 0/2] Restrict BMG to use 64K pages for scanout buffers
Date: Tue,  9 Jul 2024 14:25:12 +0200
Message-Id: <20240709122514.538137-1-zbigniew.kempczynski@intel.com>
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

Requires also changes from userspace perspective, due to necessity
allocating buffers with 64K pages.

v2: Limit restriction to BMG

Cc: Matthew Auld <matthew.auld@intel.com>

Zbigniew Kempczyński (2):
  drm/xe: Separate 64K physical allocation for display
  drm/xe: Use 64K pages for scanout buffers for Battlemage

 drivers/gpu/drm/xe/xe_bo.c           | 9 +++++++--
 drivers/gpu/drm/xe/xe_device_types.h | 1 +
 drivers/gpu/drm/xe/xe_pci.c          | 9 ++++++++-
 3 files changed, 16 insertions(+), 3 deletions(-)

-- 
2.34.1

