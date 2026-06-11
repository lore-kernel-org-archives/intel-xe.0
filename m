Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0C2CD98C7
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 09:15:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60DA510E739;
	Thu, 11 Jun 2026 09:15:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kvw3tB0z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E7A10E739
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 09:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781169342; x=1812705342;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E2H4R90Z1dHvu1hNuS73qwc329vhCj9vfjROz5esE40=;
 b=Kvw3tB0zMFJNNExer9KeX5BoRMfTJar1fjxPmL9O8vZP668baGN5vM8S
 xQ5i/IhVnh5LoJ/xBTYsaAgYRqMycDP7K4YIvBO50Fr9XXgSvLb8YGP9G
 UsATjEZFIxR5JAb4FvC/70WUvgkvttEjciO2yFAhTJma4F+mN/6XnvZOs
 q3YXGamtL/Ts17EP9jVrbnbDyl7hlRhBUxQqxQtEknDpDxjcWjdybps+j
 deSlRwjQWN8DNN78N1sOOeYD71xRtWaVrmLUDgppPmHUPU8D5WzphQnRt
 7NQvh1qFjMESs2/5fKsIzKUzvDnWwL/U1HiuSeEDPjoDvNn4FJ6i/33Li A==;
X-CSE-ConnectionGUID: AJP9XsFdT8W/MLIF8qErIA==
X-CSE-MsgGUID: fDeu0tLTTdmLkKFl0JMoUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92654736"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="92654736"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 02:15:41 -0700
X-CSE-ConnectionGUID: 6iym+i8lQAaK/iRImocl2Q==
X-CSE-MsgGUID: gUMF0tDYQ965smySot1+vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; d="scan'208";a="250346663"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa003.jf.intel.com with ESMTP; 11 Jun 2026 02:15:38 -0700
From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, aravind.iddamsetty@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com, sk.anirban@intel.com,
 raag.jadav@intel.com, Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Subject: [PATCH 0/2] drm/xe: Structured RAS error logging infrastructure
Date: Thu, 11 Jun 2026 14:42:25 +0530
Message-ID: <20260611091224.17275-4-mallesh.koujalagi@intel.com>
X-Mailer: git-send-email 2.43.0
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

Today XE logs GPU errors with ad-hoc drm_err()/drm_warn() calls that
have no standard format, making it hard to identify what failed, where
on the GPU it happened, and how to correlate events.

This series adds a lightweight structured logging layer:

- Introduces xe_sig_ids.h (Signature IDs that name each error
  class) and xe_ras_log.c (__xe_ras_log()), which emits every error in
  a fixed format:

    [xe-err] SIG_ID=<id> Severity=<sev> Location=<loc> Errno=<n> 
    Message="<msg>"

- Converts the first call site: the open-coded drm_err() in
  xe_device_declare_wedged() is replaced with XE_RAS_WEDGED(), routing
  wedge events through the new common path.

Mallesh Koujalagi (2):
  drm/xe: add structured RAS error logging infrastructure
  drm/xe: use XE_RAS_WEDGED macro in xe_device_declare_wedged

 drivers/gpu/drm/xe/Makefile     |   1 +
 drivers/gpu/drm/xe/xe_device.c  |  11 ++--
 drivers/gpu/drm/xe/xe_ras_log.c |  64 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sig_ids.h | 101 ++++++++++++++++++++++++++++++++
 4 files changed, 171 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_ras_log.c
 create mode 100644 drivers/gpu/drm/xe/xe_sig_ids.h

-- 
2.34.1

