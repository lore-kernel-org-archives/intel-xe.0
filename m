Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F320C61DBE
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 14:11:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BFC10EA86;
	Tue, 25 Aug 2026 14:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ltxK0mbt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0960310E1E4
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 14:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787667084; x=1819203084;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/PZzDpmCGduJDhE1SGmsZqO0eE0q4BYEVHsRd4g9XgM=;
 b=ltxK0mbtrzelsGBrRUx0DrMg/9lH7yTAZ8CRhOZX/dyytrVa2dxg6yG0
 GLeVhbeFbPTqWiLgBmtVYS6lUuXazWhhAaBYJIdzwpjHOk8M+i4RokUfC
 504obIAMccLg+NOQCB5S65NvUb4oQw6JsL+qLA97E2S9+dxZINS2xax7d
 sEKlsxduNYkCDDWD23TyrMBFLMzoexjx/31Gzsz77rqdf2bxWyU+JpkON
 zOTujdE/DF5XfaNOBqW3ooB2WfMG088pQO0fDevgUobv9utmpsEKQjw0Q
 5Qwc6FQOoSpIzLdcoei9fwPVtfHSEzarkz2P/KW7YvMdrNRiyVp5GM7+X A==;
X-CSE-ConnectionGUID: CrUHm7mQRtW1g+I5+YOU4A==
X-CSE-MsgGUID: IBKiQ5BNQNe13HA0V+eHbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="90648424"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="90648424"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 07:11:24 -0700
X-CSE-ConnectionGUID: hWC9iFILRiSvs8s4qM4EYA==
X-CSE-MsgGUID: 3ZnI+UlMTBiQDyD/CJVBOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="265996087"
Received: from unknown (HELO rtauro-desk.iind.intel.com) ([10.190.238.50])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 07:11:21 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: [PATCH 0/2] Add error handling support for PCIe and fabric components
Date: Tue, 25 Aug 2026 19:41:10 +0530
Message-ID: <20260825141109.3797483-4-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

Add support for handling PCIe and Fabric component handling. 

Fabric Errors: SAF MHB errors caused by data payload parity are treated
as recoverable and logged without triggering a reset. All other Fabric
errors require Secondary Bus Reset(SBR) to recover.

PCIe Errors: PCIe SS GPMA errors require a Secondary Bus Reset(SBR) to
recover. Rest of PCIe non-fatal errors are only logged.

Riana Tauro (2):
  drm/xe/xe_ras: Add Fabric error handling
  drm/xe/xe_ras: Add support for PCIe error component handling

 drivers/gpu/drm/xe/xe_ras.c       | 38 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h |  5 ++++
 2 files changed, 43 insertions(+)

-- 
2.47.1

