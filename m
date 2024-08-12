Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA52C52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 10:30:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993B910E058;
	Mon, 12 Aug 2024 10:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LFJ0547Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A361110E047
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 10:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723458628; x=1754994628;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RtQpXfjwYe/Z48DqRzXN0s2lo2D59TTaElhgB8iKHOo=;
 b=LFJ0547ZCrnGvaeWu0uQn/XRFokizi0yUBv34DKD13z+5Ky+zi7eG2HE
 Zv3kooxsWWXOtW1o4ok82FB+aqUGkiSdzjOOJe12bTNVJ4rv+PaCdpLmW
 qSzyCxeL/PDB6hGsOeeL2/AEVsel+KnOHTw0bCMs9kj03E3UyStFSrFVv
 NEJpnRd/OAFbJwO5oYIHWxAzqyMoKNsdxmuZXEZuXD5otBKrMgdhFIS+6
 ZVWa4qToZ/XbzZ1jwlWO+CU4A3NBy9oFogZjHIOYIa4BCYxIrUldn+cH/
 Gogrsj32rzKGqh7zPjwU8ELBfwKpxDcSQAmsGBm7XYTeSkEe95FPPZaCA A==;
X-CSE-ConnectionGUID: cteR/+wbTx2G6TIS0shw1A==
X-CSE-MsgGUID: 8Z5ia3AsQpq2hsfv/s0d7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21439059"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="21439059"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 03:30:28 -0700
X-CSE-ConnectionGUID: SP2r07o+QpCNsat8m0jK0w==
X-CSE-MsgGUID: J203ttEjRlir9nvLgBM4eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="62876453"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.117])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 03:30:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, Gustavo Sousa <gustavo.sousa@intel.com>,
 jani.nikula@intel.com
Subject: [PATCH 0/3] drm/xe: drvdata cleanups
Date: Mon, 12 Aug 2024 13:30:18 +0300
Message-Id: <cover.1723458544.git.jani.nikula@intel.com>
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

The first patches from [1] just for xe, to be merged via drm-xe-next.

BR,
Jani.

[1] https://patchwork.freedesktop.org/series/136621/ 


Jani Nikula (3):
  drm/xe/tests: remove unused leftover xe_call_for_each_device()
  drm/xe: use pdev_to_xe_device() instead of pci_get_drvdata() directly
  drm/xe: add kdev_to_xe_device() helper and use it

 drivers/gpu/drm/xe/tests/xe_pci.c      | 52 --------------------------
 drivers/gpu/drm/xe/tests/xe_pci_test.h |  1 -
 drivers/gpu/drm/xe/xe_device.h         |  5 +++
 drivers/gpu/drm/xe/xe_gsc_proxy.c      |  9 +----
 drivers/gpu/drm/xe/xe_pci.c            |  2 +-
 5 files changed, 8 insertions(+), 61 deletions(-)

-- 
2.39.2

