Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300F2CD4F26
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 11:42:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D903010E08D;
	Fri, 19 Jun 2026 11:42:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gHvnMtBd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A1F10E08D;
 Fri, 19 Jun 2026 11:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781869352; x=1813405352;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4SW8WibIK+hvKSU6PpNjMqwSCXy/WbRMpPZ1gAYI/Ls=;
 b=gHvnMtBdKBaOnRr8Nqx+Aif8hu94eHZN1i7bktWdUaY/DUe/2VG1Szs6
 KhCpedIcZ/jHHy+WNRPW+ZyFAkNXNfHpu7DZp+Jka1/+GT3Vh2XbCwPeM
 41p1LIvHuyoCBJkpsSiqrZDcZArJcC8OOIvGPY+cXLBXJnAsTFJaxXXao
 ixwqvNf7hhz5CwUpBQqEZrC2W63DjdWkSHaXTLPNXiFosW7W4hJgXbA6E
 Rog13y1KruH4/IDg0sUiOttemNy5hQ6+OnMGLT8nwk8pQbII4iq6TE4Im
 T3zLfobR0m5bY6cel1j0U15Jr0oYOu7QfSHuJpqMAz/N/S3JVGodOVtVs g==;
X-CSE-ConnectionGUID: f5vIXTK+SDKNbsYxvvAEqg==
X-CSE-MsgGUID: IzNqSUexRJG6UaliNg1fZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="70229410"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="70229410"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 04:42:32 -0700
X-CSE-ConnectionGUID: qmv0y5mNTeePrSqn06+kKg==
X-CSE-MsgGUID: zh4VmOz6Qg2iZvubu2WW7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="286738202"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa001.jf.intel.com with ESMTP; 19 Jun 2026 04:42:30 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 0/4]  DSC max delta bpp support
Date: Fri, 19 Jun 2026 17:09:01 +0530
Message-Id: <20260619113905.1413453-1-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
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

    Some sinks exposes DSC max bpp through delta based
DPCD fields. To support those sinks, add DP DPCD field
field and logic to decode the delta value in bppx16
format.

Nemesa Garg (4):
  drm/dp: Add DP_DSC_MAX_BPP_DELTA register
  drm/dp: Rename YCbCr420 bpp delta mask to native
  drm/dp: Add max bpp delta computation constants
  drm/i915/dp: Decode dsc max delta bpp from sink dpcd

 drivers/gpu/drm/i915/display/intel_dp.c | 43 +++++++++++++++++++++++--
 include/drm/display/drm_dp.h            | 13 ++++++--
 2 files changed, 52 insertions(+), 4 deletions(-)

-- 
2.25.1

