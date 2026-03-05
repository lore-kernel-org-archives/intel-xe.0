Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF16F30946
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 13:10:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1EF810E299;
	Thu,  5 Mar 2026 13:10:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FTdbPUP+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81EFA10E1F6;
 Thu,  5 Mar 2026 13:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772716242; x=1804252242;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=19ZBJciV/3f34+szOdw3sGUpss6QEDroUKaum5Xvfu4=;
 b=FTdbPUP+qsRR6MmoIdWMhPDv9KmwG/4qJNKvhA+2EgPmg/mxOAvoC3ju
 8hlj/mFQ4euZk8321RmYNAcMTHXUt3laGTM2Nw1MAnPWfKRO5GEZXkQpF
 CkztzAMeRPXZIqQPnVEE+XGSiXuVf8rCuYOK1o6oFTvgR6w61FLfME10+
 qv1FKS4VpvrMVuv7rBVTgf63jE9fGTwRm1YJXRowVFX9Xfw7/wq9cJks2
 vPMkF4XvPKFO174ejxyKqh1pxs+OLgHvQaoJIQyAVJdeLfy9+hwE7BRJg
 lZ0avh7XPQZuWB3coA6q+5RuMhxWQzLf2/MJP7TsXb1/ExlbLZ50lUbG0 w==;
X-CSE-ConnectionGUID: oSMt4KAERkiYzI3I1nPA7g==
X-CSE-MsgGUID: 2HvtY3YqRYSVptTSfX1qHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="96418630"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="96418630"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 05:10:41 -0800
X-CSE-ConnectionGUID: wZAZ0OQbT4W4Y5r6FuO58g==
X-CSE-MsgGUID: joOIULePT1Cua0T0MZhKzA==
X-ExtLoop1: 1
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 05 Mar 2026 05:10:38 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 matthew.brost@intel.com, rodrigo.vivi@intel.com, riana.tauro@intel.com,
 christian.koenig@amd.com, andrealmeid@igalia.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 0/3] Update 'none' recovery method for DRM wedged event
Date: Thu,  5 Mar 2026 18:36:46 +0530
Message-ID: <20260305130720.3685754-1-raag.jadav@intel.com>
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

Currently 'none' recovery method for wedged event expects no explicit
recovery from userspace consumer but it expects driver to have reset
the device, which may not always be the case. Update documentation and
log to reflect this expectation.

v2: Rephrase documentation (Rodrigo)

Raag Jadav (3):
  drm/doc: Update documentation for 'none' recovery method
  drm: Update log for 'none' recovery method
  drm/xe: Send 'none' recovery method for
    XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET

 Documentation/gpu/drm-uapi.rst | 14 +++++++-------
 drivers/gpu/drm/drm_drv.c      |  2 +-
 drivers/gpu/drm/xe/xe_device.c |  9 ++++++++-
 3 files changed, 16 insertions(+), 9 deletions(-)

-- 
2.43.0

