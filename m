Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816D6C02194
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 18:12:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2B110E079;
	Tue,  4 Feb 2025 18:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AYMeFiXJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E87910E079
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 18:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738692764; x=1770228764;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mykj+NIvHIIoTcNLnjJ6hi6V6qWZZSP2zirn7fhWtSI=;
 b=AYMeFiXJPjZ5at8YUVZaoek6UQrdGpxllZzmaQxjc/7dQQUtZMV4yKIP
 uUenRuVUM9wmjGrmh84c+lJu6mseI0abW/EJJMrC6o3ri3f63dmB18Gkb
 tQe4tQHgXS2d5l65rG2Dmrr9E2FbUsEEuSGlFUV5iNQYkA2WMAFhX1n5I
 AFN86KKKAfyqZ4NIasFKsz6n8d1LM9Rsv0tLlIMFuRLib2gN4Ksl/41Fz
 17ODXOVXGff6kRuYyLRC2G1WlsuvQOiIzpPmERFcxuF0b1B/EQVtNjI03
 ygNIohz3lj3gt9MnhhfhRdP7Mhc7ehf1jHjl2/kXzF9t5s25wC50hQvMa w==;
X-CSE-ConnectionGUID: XOISFRrwRhu+4QQjrpuT7Q==
X-CSE-MsgGUID: fWMs41y6T1WeqND42dIIPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39374699"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="39374699"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 10:12:44 -0800
X-CSE-ConnectionGUID: 6UT9v1ulT3uo8iVekq2nSA==
X-CSE-MsgGUID: Eb8I1xtqSxGN3e8ytwTS2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="110656158"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa006.jf.intel.com with ESMTP; 04 Feb 2025 10:12:43 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 0/2] drm/xe/pmu: Add GT frequency events
Date: Tue,  4 Feb 2025 10:09:03 -0800
Message-Id: <20250204180905.1347210-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

Enable PMU events for GT actual and requested frequency.

Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Vinay Belgaumkar (2):
  drm/xe/pmu: Add event tracking
  drm/xe/pmu: Add GT frequency events

 drivers/gpu/drm/xe/xe_pmu.c       | 182 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pmu_types.h |  30 +++++
 2 files changed, 209 insertions(+), 3 deletions(-)

-- 
2.38.1

