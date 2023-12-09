Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF159C4167B
	for <intel-xe@archiver.kernel.org>; Sat,  9 Dec 2023 15:19:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 758E510E19D;
	Sat,  9 Dec 2023 15:19:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A2210E19C
 for <intel-xe@lists.freedesktop.org>; Sat,  9 Dec 2023 15:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702135144; x=1733671144;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZxQvHQWDffUD+wzTl4dayA7Q0J8aqKnL0+rqDcutR+A=;
 b=mwOcyxtZfXyijgN1bPIJb+7srWU0btG84Q/ltRKlh7HelF+b6S1VmA4U
 ZgBVz2eJnY8zTOc9Ke7JfzwLlS1pSVcU6sewKoKnG20w7Oox12xrr4EZL
 06zSH/Zf3oabbWEImYI2V1gpRSt2FHqtMugT8i74PDp9Z/bcpe5UlecO8
 8X6agH/n3jYi1f0LZIWEZn+nx7b3Fr6bVjzIeVfAuGF1S9NrCGPVNLHU0
 +TR8ZqQkSfDkDPcQjhKZi8aANZ7nm5tLIJNzYCc51a6wHVVCAnuscGgYm
 eXQmlTmHo5SI4PafhJmV/lJd8FYu88YXQ6VWBJdBgxZkiVT9764kEuD6h A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="398376892"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; d="scan'208";a="398376892"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2023 07:19:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; d="scan'208";a="17500273"
Received: from pplotits-mobl2.ccr.corp.intel.com (HELO fedora..)
 ([10.249.254.23])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2023 07:19:02 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 0/2] Huge PTE and scratch page updates
Date: Sat,  9 Dec 2023 16:18:40 +0100
Message-ID: <20231209151843.7903-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The first patch restricts encoding of huge PTEs to 1GiB and adds a define
for the maximum level for which huge PTEs are available.

The second patch replaces scratch PTEs with NULL PTEs.

v3:
- Rebase

Cc: Brian Welty <brian.welty@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Thomas Hellström (2):
  drm/xe: Restrict huge PTEs to 1GiB
  drm/xe: Use NULL PTEs as scratch PTEs

 drivers/gpu/drm/xe/xe_pt.c       | 68 +++++---------------------
 drivers/gpu/drm/xe/xe_pt.h       |  6 +--
 drivers/gpu/drm/xe/xe_vm.c       | 84 ++++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_vm.h       | 11 +++++
 drivers/gpu/drm/xe/xe_vm_types.h |  1 -
 5 files changed, 82 insertions(+), 88 deletions(-)

-- 
2.42.0



Thomas Hellström (2):
  drm/xe: Restrict huge PTEs to 1GiB
  drm/xe: Use NULL PTEs as scratch PTEs

 drivers/gpu/drm/xe/xe_pt.c       | 68 ++++++--------------------------
 drivers/gpu/drm/xe/xe_pt.h       |  6 +--
 drivers/gpu/drm/xe/xe_vm.c       | 68 ++++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_vm.h       | 11 ++++++
 drivers/gpu/drm/xe/xe_vm_types.h |  1 -
 5 files changed, 81 insertions(+), 73 deletions(-)

-- 
2.42.0

