Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43428C3DA41
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 11:12:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F326289864;
	Tue,  9 Jul 2024 11:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jlprjyU0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B0389864
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 11:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720523568; x=1752059568;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=unm30hCEDjy2NeAMUGGNGGUFQCWZ/jw7i2RYWQTLYeQ=;
 b=jlprjyU0ofqqaRpWbHY7DaDz8cPkupdDg19RaJCDCiIIjq1jr9IZZ2NM
 wSgIEd+qdzU06v8C1sL8K54l6aJj5QJndTYL+TJsdZ7sBRUHTruffbmZ3
 1nSKRY6y7jNmlaW8zmnrmltbebH4ZHpUmczz2goUSGyrJBF8W0NZl9wZT
 Bb7hEGs/hTmYDTKtbjWYDtjpr4e4u89XSX0WujlJHuw+uq+JFqUtdjdVq
 kV4LfPMp24RHgbAk/qXCHzxJTp9efmhE++5zgWcYEzQWB21Rka60xFSgT
 vTnlsR8KTxtte4y4KUMONP88xC8S3cR2saLgI9QzL3XhPF3darrhIkidl g==;
X-CSE-ConnectionGUID: CmhCTAtSTFCKuinH+NbDlQ==
X-CSE-MsgGUID: ID6907zfS66T+G5XxZVsIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17589471"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="17589471"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 04:12:48 -0700
X-CSE-ConnectionGUID: 0Nqit/UuTym1C+UPVtgB/Q==
X-CSE-MsgGUID: l19jzpxQT4yf2ir5YeZVfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="85365599"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 04:12:46 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 0/2] Restrict Xe2 to use 64K pages for scanout buffers
Date: Tue,  9 Jul 2024 13:12:29 +0200
Message-Id: <20240709111231.490440-1-zbigniew.kempczynski@intel.com>
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

Cc: Matthew Auld <matthew.auld@intel.com>

Zbigniew Kempczyński (2):
  drm/xe: Separate 64K physical allocation for display
  drm/xe: Use 64K pages for scanout buffers for Xe2

 drivers/gpu/drm/xe/xe_bo.c           | 9 +++++++--
 drivers/gpu/drm/xe/xe_device_types.h | 1 +
 drivers/gpu/drm/xe/xe_pci.c          | 1 +
 3 files changed, 9 insertions(+), 2 deletions(-)

-- 
2.34.1

