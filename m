Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1008C77B7A
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 14:25:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7403810E174;
	Fri,  2 Jun 2023 14:25:23 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A1910E174
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 14:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685715921; x=1717251921;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xPjxR615OBwdEFb9ffatZKPlbMjJoxJWw9tmbBFrbS8=;
 b=kiZS3GWhjJXaHfu51vOh8L+Hc1U0ClCgra9bxGrwMa43F/iuvXWWIALh
 qtLVCQOPgO27kiIWml2e2V8ZXwT4gUriy44l8iPMLCNyn0Cb0pX7xRQWt
 4M/DPP00MxMK/6mcQBoV184fo5QWLosI/mI7waIB/iGfyhr3JIsJqpFiG
 2klJhDTHLRHEDvocUvEz/Pf2Ha+qqof1CxLZ6Hll6crz3Af7GalUHWTS0
 FCig3PuTxf86Fx4hPFprFf7AxM7o75IVXgUGTUMaN9pQqwLOSc9ApoNTD
 5vR1cqXwb6MafePOOx0UrWyj3qEk0tDg6GhA10ZPNLEDpO5+czBLUYcAK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354726210"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="354726210"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 07:25:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="832000680"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; d="scan'208";a="832000680"
Received: from pbabu1x-mobl.ger.corp.intel.com (HELO db6d3cf1941b.intel.com)
 ([10.252.57.1])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 07:25:18 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  2 Jun 2023 14:25:00 +0000
Message-Id: <20230602142501.6-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 0/1] drm/xe: Introduce function pointers for
 MMIO functions
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
Cc: ofir1.bitton@intel.com, ohadshar@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This explores a possible code split between generic and device specific
functions. The minimal hardware abstraction layer is implemented with a
structure of function pointers, similarly to what is done in accel/habanalabs
and in drm/amd/amdgpu.

The objective is to ease the addition of new platforms by limiting the need to
modify the common code and centralizing specific code in separate functions.

It is a new look at the series below but focused on the particular case of some
MMIO functions required by Hanaba for simulation:
https://patchwork.freedesktop.org/series/114630

The inline xe_mmio_*() functions in xe_mmio.h are left for convenience and also
to avoid a massive search and replace with xe->mmio_funcs->*() while this RFC is
being discussed. This is the reason why struct xe_mmio_funcs is exposed in
xe_mmio.h for now.

A posssible improvement suggested by Ohad Sharabi is to replace the switch with
a table lookup after device probe, using an index carried by xe_device_desc.

Francois Dugast (1):
  drm/xe: Introduce function pointers for MMIO functions

 drivers/gpu/drm/xe/xe_device_types.h |  3 ++
 drivers/gpu/drm/xe/xe_mmio.c         | 81 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_mmio.h         | 35 ++++++------
 3 files changed, 99 insertions(+), 20 deletions(-)

-- 
2.34.1

