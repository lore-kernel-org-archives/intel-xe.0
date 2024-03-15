Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7590C54E69
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 09:54:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5BC1120C9;
	Fri, 15 Mar 2024 09:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Td0xYnc9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6A11120C9
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 09:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710496498; x=1742032498;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sKlNLpA3SKsgGuYwvyzoWqRK3dx9KIej7W033Lx/JXE=;
 b=Td0xYnc9kYh0rdqXvwJ4acpiQ++VC4RjBQRHwX8QvFsTRBYqwWaZwN15
 ho9qMPhr+OJQNOt4XLJ3dU0L7IEHNciseB+OND9ZbDDBMwj1GlkEyNDRI
 TEi+vAQRyQtuUjyL6zjh9sYp9nNCs7i4++kWwlUxE6FhMewuUJ+74Mhjj
 h7s+1u6G53iEVA7OYHWwnChbwDLYLS7a8Di2pwVY3Ax0p5deNXX7GOILw
 Rtyox7VqRFgsPcGIYZ8dnSmQIIBT93pKHNtUvTrJO8KcNrfzUl3vY7SY8
 xArZX5Lg3NUGK0X82/lfvaduF6raNt9BHsdqjh7Bbv2UnpcZtabn8ENdI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="15906930"
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="15906930"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 02:54:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,128,1708416000"; d="scan'208";a="17225577"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 02:54:53 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v2 0/3] Pcode init status and lmem check
Date: Fri, 15 Mar 2024 15:35:27 +0530
Message-Id: <20240315100530.3051944-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
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

Check pcode init status on root gt of root tile and
reorder lmem init to be after pcode init check.

Rev2: change function names for pcode init check
      fix review comments
      add fault injection for LMEM check

Riana Tauro (3):
  drm/xe: check pcode init status only on root gt of root tile
  drm/xe: re-order lmem init check and wait for initialization to
    complete
  RFC drm/xe: add fault injection for lmem init check

 drivers/gpu/drm/xe/xe_device.c | 102 +++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_mmio.c   |  29 ---------
 drivers/gpu/drm/xe/xe_module.c |   5 ++
 drivers/gpu/drm/xe/xe_module.h |   3 +
 drivers/gpu/drm/xe/xe_pcode.c  | 115 ++++++++++++++++++++-------------
 drivers/gpu/drm/xe/xe_pcode.h  |   6 +-
 drivers/gpu/drm/xe/xe_pm.c     |  16 ++---
 7 files changed, 183 insertions(+), 93 deletions(-)

-- 
2.40.0

