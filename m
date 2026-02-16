Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F902EF5867
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 17:27:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC28710E3D9;
	Mon, 16 Feb 2026 17:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ejK/r4Qj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC7610E3D9
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 17:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771262833; x=1802798833;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JBZyFB4/s7I253KvSZ9m1NhfTUWaNGWXmgGC5eWH200=;
 b=ejK/r4QjEpOM8F4WjDEasSpvaK010UmGWpfN8ybrZDjt2WLEk2eGtG1t
 7dD2qBF2fr0QOyeXriGdorrJ09Li43e6w+ylRtq3Sse43k4RaLG2BOEtz
 1My855AHQS4ARuJTP5cza/fQqpdBCmIYWrBG2nybZm+7fA8yIK3AInISX
 f99w1DfcAMn8EPxlgBh90i36VvAQPIlseCHXNJ6MUPBS6dFmgGCUq8T+p
 mkN/o2fVyiMWpDiNMErnxnnZd82FX80gJeNx5h7GNF8c9SsqoiWmC6+LQ
 qCbCtApMOE4+OIEKTlhohJau45ETYO56BT3iSyhcV560arPIPqNYAsCR8 Q==;
X-CSE-ConnectionGUID: TCOg48ISTI2dShWRd80c+w==
X-CSE-MsgGUID: rPnb3GUSSzy1zWb8cu0CPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72440185"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="72440185"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 09:27:13 -0800
X-CSE-ConnectionGUID: c3CVghfQScq4bl9D50XDqA==
X-CSE-MsgGUID: gs/kAsDzRSG4Gza5qAMTbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="213765360"
Received: from wbakowsk-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.21.212])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 09:27:12 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH] drm/xe/pf: Don't configure VFs if already wedged
Date: Mon, 16 Feb 2026 18:26:59 +0100
Message-ID: <20260216172659.520-1-michal.wajdeczko@intel.com>
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

If driver has already declared device being in the wedged state,
there is no point in attempting to enable or disable VFs.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_sriov.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index 3fd22034f03e..ddc081f55657 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -232,6 +232,9 @@ int xe_pci_sriov_configure(struct pci_dev *pdev, int num_vfs)
 	if (num_vfs && pci_num_vf(pdev))
 		return -EBUSY;
 
+	if (xe_device_wedged(xe))
+		return -EHOSTDOWN;
+
 	guard(xe_pm_runtime)(xe);
 	if (num_vfs > 0)
 		return pf_enable_vfs(xe, num_vfs);
-- 
2.47.1

