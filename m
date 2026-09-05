Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41468C79F8B
	for <intel-xe@archiver.kernel.org>; Sat,  5 Sep 2026 20:02:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98CE10E326;
	Sat,  5 Sep 2026 20:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ey1mhExR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F83B10E326
 for <intel-xe@lists.freedesktop.org>; Sat,  5 Sep 2026 20:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788638530; x=1820174530;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jICggD8DVexYyuYTDgesoyMMkMmYVwnWN8sdfkxvKuU=;
 b=Ey1mhExRz9J/PciqyyEq3Ru74M2NPFNu66tfGFEfIa1NJxD3T+P+YUlF
 Fl64suVCEf7Z39vuvRPAKpKZWHoPjz7I9PY3B2Fr+jG3QAirM7pBE/+cC
 01XycIevX9OWZsstAeFOWxVi6QMuQEvK1FVmRvU3CG62vNQI4/i0roBnp
 Md6uHFps6kTe5ZEguG+KROyVfGZgFr2T0ndMXLouslktDbN2cmCdAqokC
 VuFLCOBg/lxozcMOBztPC81GKh1iLJyS3CogETQQPXdw0wuS1EhpgtR+r
 sqFJiNsOsBj2HmffbqTrxTzXsoj496XhsNFF4Azc1jIFIe8y4aubHqB/5 Q==;
X-CSE-ConnectionGUID: dxXJ/jSSR/ec843LxSQPfA==
X-CSE-MsgGUID: g15s5U3IRKGdCRg6Mx3SKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11897"; a="88248624"
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; d="scan'208";a="88248624"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2026 13:02:09 -0700
X-CSE-ConnectionGUID: 1ecsiEUQQaelOZ/a+yuwyQ==
X-CSE-MsgGUID: hvhs+q50QRSO3j3gstoE1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; d="scan'208";a="274154545"
Received: from yshashi-mobl1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.113.202])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2026 13:02:07 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH 0/2] drm/xe/tests: Fix subplatform selection
Date: Sat,  5 Sep 2026 22:01:55 +0200
Message-ID: <20260905200157.3164-1-michal.wajdeczko@intel.com>
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

Sashiko pointed out that in some cases we could wrongly select a pointer
to a sentinel element of subplatform descriptors list instead of NULL.

While around, make default subplatform selection future proof.

[1] https://lore.kernel.org/intel-xe/20260904171419.E21DF1F00A3D@smtp.kernel.org/

Cc: Gustavo Sousa <gustavo.sousa@intel.com>

Michal Wajdeczko (2):
  drm/xe/tests: Fix default subplatform selection
  drm/xe/tests: Fix subplatform selection

 drivers/gpu/drm/xe/tests/xe_pci.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

-- 
2.47.1

