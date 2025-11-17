Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBB3CE8D6B
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 20:53:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332E610E076;
	Mon, 17 Nov 2025 20:53:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fMt3uj0u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF75610E076
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 20:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763412802; x=1794948802;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eMYt0bIy34HqxvsPOT7mLNV9U75nqImraOEZua0UWGI=;
 b=fMt3uj0uyvZzcqnIUui+a342TLxqDtuZmwWeL8CLUoeLr+/NmLxAnZpj
 72lu9nLv4Tw6AwEgc3HZUgjryd6N2vf+h2UeaZUmPMw1uN91hsCwx2MQf
 KWbr5NgMLnp7PDZfYGh22BdvixlOq5Wwv5+aFFAeTL026YVq94FinRieZ
 ygqSbtpVM03LiyqRXILPgdVdi6xy4WgDAvb8Wlraqj0Gu0QBuiVv8hnro
 TTfn7/HgO4A0cOq5cq2IzCccL9fl9JvYU+A/PLihTpLXNBZySM8rjUp65
 LS0kK7JFAcFW8Tz/i3HBlbmtCegoJTlh8VxnDerBvDvtXZjrfdnDaj37Q Q==;
X-CSE-ConnectionGUID: nzaLgM/hQ3CxGuDcyjSUkw==
X-CSE-MsgGUID: Jf3tIEz4QjSWiNMJ30l0sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65516550"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="65516550"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 12:53:21 -0800
X-CSE-ConnectionGUID: o34TS4rURMGJS3LwesUe+A==
X-CSE-MsgGUID: z6qEf+ibStCA7jZ9nj4WfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="190227335"
Received: from unerlige-desk1.jf.intel.com ([10.88.27.165])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 12:53:21 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: badal.nilawar@intel.com, lucas.demarchi@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH v2 0/4] Add SoC remapper support for system controller
Date: Mon, 17 Nov 2025 12:53:16 -0800
Message-ID: <20251117205315.1458477-6-umesh.nerlige.ramappa@intel.com>
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

Add system controller configuration using SoC remapper for Xe3p

v2:
- s/remapper/soc_remapper/
- return status from init during probe
- reorder patches 1 and 2 from earlier series
- fix copyright year
- retain comment
- s/BITS/MASK/

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (4):
  drm/xe/soc_remapper: Initialize SoC remapper during Xe probe
  drm/xe/soc_remapper: Use SoC remapper herlper from VSEC code
  drm/xe/soc_remapper: Add system controller config for SoC remapper
  drm/xe/remapper: Reprogram remapper index on PM resume events

 drivers/gpu/drm/xe/Makefile                   |  1 +
 drivers/gpu/drm/xe/regs/xe_pmt.h              |  3 --
 .../gpu/drm/xe/regs/xe_soc_remapper_regs.h    | 14 +++++
 drivers/gpu/drm/xe/xe_device.c                |  5 ++
 drivers/gpu/drm/xe/xe_device_types.h          | 12 +++++
 drivers/gpu/drm/xe/xe_pm.c                    |  5 ++
 drivers/gpu/drm/xe/xe_soc_remapper.c          | 54 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_soc_remapper.h          | 18 +++++++
 drivers/gpu/drm/xe/xe_vsec.c                  |  4 +-
 9 files changed, 111 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_soc_remapper_regs.h
 create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.c
 create mode 100644 drivers/gpu/drm/xe/xe_soc_remapper.h

-- 
2.43.0

