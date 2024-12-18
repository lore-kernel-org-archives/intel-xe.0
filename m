Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E28BE77187
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 12:19:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C82110EB92;
	Wed, 18 Dec 2024 12:19:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ixeEqWLl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA7910EBA2
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 12:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734524349; x=1766060349;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X6zAt8DBEDDts7kCiCUEggvNYKdr2CHjUdRPlGYEQRw=;
 b=ixeEqWLl2xuyWMVu9X09akSoTK5X/dXIO4Yb+0/Vs/JeehOWUUJ/DybV
 V/i0nu1DR/+Cu8DTntHcurbCPggZu8Woj2IsfUIhgSn2iNPhsH0CMsJSG
 10R6j7LE7osfkDet2IU6svyViiFEfHWdeNsawjsR9gv3/WHak1jYg4wRP
 MJM7XcAXFAxIABd1ErLw5cfpIfpXF6MqgL4l8OWVtOHC5yUQSwN5T4jgK
 Jw8pEbmxT7Ss3ogweN51CFcGqLMpPc30hJQX8EDcp7DZJ8JXaURr8Vy2Y
 7aUXBwJFr1DI4eCACGIOwR82JahAG3TuEc0HjWEEX5UKZuvsG5cepU8i4 Q==;
X-CSE-ConnectionGUID: cZNiXATZSFiNCgYI1CxM6A==
X-CSE-MsgGUID: GCKUf5efRQ2m9U5VwhSK7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35028077"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="35028077"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 04:19:08 -0800
X-CSE-ConnectionGUID: mdJo2GyNScG41u/6ZLgX+g==
X-CSE-MsgGUID: tkuB+QczRouLI7v8LIXrbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="97633526"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.74])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 04:19:08 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/7] Improve SRIOV VRAM provisioning
Date: Wed, 18 Dec 2024 12:18:38 +0000
Message-ID: <20241218121837.226393-9-matthew.auld@intel.com>
X-Mailer: git-send-email 2.47.1
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

Support non-contig VRAM for pinned kernel objects. Main current usecase is
when provisioning VRAM for SRIOV usecase (final patch). Currently we are
artificially limited to using contig VRAM, however the allocations here are
very large and the contig restriction can result in failing to provision
the VF, even when there is enough free space (we just need at least 2M
pages).

v2:
 - Various fixes for CI reported issues.

-- 
2.47.1

