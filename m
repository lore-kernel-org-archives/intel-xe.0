Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAB4CD3431
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 09:47:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6636710E719;
	Wed,  4 Sep 2024 09:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hS9vujG7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C22B10E719
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 09:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725443229; x=1756979229;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KvpCxu0Tj7tqpJV+MUdxSgh9M5Mrg1ls5Hp4x9K3qCA=;
 b=hS9vujG7vWX5RS6U7qzHhZ7zImfrg0H9AbZv3oL3Z6nXQCAjWAlkPTSM
 j+wteqJvSa0GtvrSLwRh8GiUBlE6QZNrzLG5/KXTAKCtloTyrh4nVBZHs
 hrYbDvk/+1msnuVYStcPHm6KKukU3U1K7VkSo/ZhJVovxukO64v/qEpSz
 jmiqCFPcg5i6USkkYW8KbNPXR+D99PapCpliCRrUQXxKswuN41m1P3Ncp
 6qWV8o61q38Kh5ytuZ95BWSTA2ElPV1vW/0yIDTwIdjQarA9pcyXi5HOS
 7+gnbNeBPgF6+2xKJUXQTKPRJmgYz8zYutg6enOgzT8UWcEqZjRsv3LUn A==;
X-CSE-ConnectionGUID: njodiMXOSfumNnL7pJE37Q==
X-CSE-MsgGUID: djNXOZvEQZGS8EdjCirADw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="41564293"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="41564293"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 02:47:09 -0700
X-CSE-ConnectionGUID: KeTMDeWaTbimyE5CfooQag==
X-CSE-MsgGUID: qhIKLq2sTvqpnS4CXL5WSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="96013954"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.18])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 02:47:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Subject: [PATCH 0/3] drm/xe/pciids: more ADL-N, cleanups
Date: Wed,  4 Sep 2024 12:46:46 +0300
Message-Id: <cover.1725443121.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

The (hopefully) non-controversial xe specific cleanups from [1].

BR,
Jani.

[1] https://lore.kernel.org/r/cover.1725297097.git.jani.nikula@intel.com


Jani Nikula (3):
  drm/xe/pciids: add some missing ADL-N PCI IDs
  drm/xe/pciids: separate RPL-U and RPL-P PCI IDs
  drm/xe/pciids: separate ARL and MTL PCI IDs

 drivers/gpu/drm/xe/xe_pci.c   |  2 ++
 include/drm/intel/xe_pciids.h | 18 +++++++++++-------
 2 files changed, 13 insertions(+), 7 deletions(-)

-- 
2.39.2

