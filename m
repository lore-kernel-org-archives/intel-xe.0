Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB72FEC0F3
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 18:28:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A357010E622;
	Tue, 24 Mar 2026 18:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O/3peO+C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D4C10E630
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 18:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774376932; x=1805912932;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GKe/EXZjrvvFLm2o1REABiNBlbOEmmD3kXUz7Z1tW20=;
 b=O/3peO+Ce3QhpAJCwbd9ranLAzIiaybOYl2OgeHzcUNwq24+VXYVYux9
 wBtKGh1EfcCsh02V848So2XBlhgqN6N80KEfQfvzKTk0cSDd6wqy6VgY+
 xGFsO06b4biIiBBzx8J1Qe7B08u6ZPEIsygbcPYmHf5FvhJ5lUCmjwGiF
 EPdaSKb+JXeQzImibG7xGLyM2Dik+0CWSeVHEBAPmexXB7q5wrxgDmTif
 A+lJZEwqj3rINC4RK2WTedLzK7tKLyu72/+RUbn+F56T4Bn8cFzebUwiN
 JBzYuOD9dh+5ACadO5QiTjrtu54bqID0gKW2C+hHk1bXZnLcRKHaOmw9t A==;
X-CSE-ConnectionGUID: a6NqWzTfQwyZdJscDK1D4A==
X-CSE-MsgGUID: wENCLHVJRw+/HJ8WcBVlrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75291449"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75291449"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 11:28:51 -0700
X-CSE-ConnectionGUID: c0AlmCvxSBOuI4oXbedczA==
X-CSE-MsgGUID: l/H+/AQbSH++Tawf7jux4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="229373569"
Received: from nkumarg-desk.iind.intel.com ([10.190.216.171])
 by orviesa005.jf.intel.com with ESMTP; 24 Mar 2026 11:28:49 -0700
From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, stuart.summers@intel.com,
 Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
Subject: [PATCH v3 0/1] drm/xe: Set GT rp min frequency as 1.2GHz default for
 BMG/CRI
Date: Tue, 24 Mar 2026 23:51:37 +0530
Message-ID: <20260324182136.709386-3-naresh.kumar.g@intel.com>
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

Performance degradation occurs in multi-BMG GPU configurations 
during Peer-to-Peer transactions when one of the two GPUs remains idle
with no engine activity.
The root cause has been identified as frequency downscaling:
the idle remote GPU reduces its operating frequency to the minimum 400MHz,
which negatively impacts the bandwidth available for P2P transactions 
initiated by the active local GPU.

To address above problem this patch ensures for the platform BMG/CRI
of graphics(GT0) tile.the default GT rp frquency min set as 1.2GHz
to ensure effetive P2P transaction bandwidth.

Note: 
While frequency boosting improves performance, 
it also increases power consumption. In single GPU mode,
it causes the GPU to operate at unnecessarily high frequencies by default
and as of now we do not have any mechanism to limit this for single
GPU.

v2:
- Fix Indentation(Thomas)
- Add comment about power impact(Stuart)

v3:(Thomas/Ankur/Matt Roper)
- Add setting frequency to only GT0(Graphics) Tile of BMG/CRI

Nareshkumar Gollakoti (1):
  drm/xe: Set GT rp min frequency as 1.2GHz default for BMG/CRI

 drivers/gpu/drm/xe/xe_guc_pc.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

-- 
2.43.0

