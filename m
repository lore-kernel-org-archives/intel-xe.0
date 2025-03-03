Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99FAC282D1
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 17:35:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B61910E4BC;
	Mon,  3 Mar 2025 17:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N3owzj8h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FDB10E4BA
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Mar 2025 17:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741023338; x=1772559338;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pv9nYeC8rW4voFoPQwb2h+a2awsHBpe9Qf04XsLNSTM=;
 b=N3owzj8hIhdycmsbzaO9ngBaucM9bf8wNAYwmdoUvAe3MEEg01UMGCpQ
 mDhUBddaAYKfX+/8TtW5ZRbrDiboFkm0/6zCB/gm/a5Hi0UscZsJxbvCN
 oChsC5uMrfoBAyJg99Sgv7tx37TB56Ys3BKTyUT8OSlFcrLLBVPtFiaN/
 UgcSXZorsw7lFZVJeunZ1jJoYQDhGNClJbwqkdp2x8FcDamPxY/Ivo0OD
 S2wjGwH8yGTbQ+y7dV+IW104nfiVwUWj2rnML+CTt7XQSrj2FwR152Aj8
 gERMejbLXlcI0itK/3P2J4IMqlyEVtvDdCx9PzxiIqCz8w1Wi2jXK/qL2 A==;
X-CSE-ConnectionGUID: 76+vpR7aTdSyPcmOtfomrQ==
X-CSE-MsgGUID: 58A1korcSniFQHZl+swlUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41937516"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41937516"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 09:35:37 -0800
X-CSE-ConnectionGUID: vPAP0vwGQ4+0RoBN/nKg2w==
X-CSE-MsgGUID: AnCp11UnSHad2xCx9nacuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="118101189"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.245.99.10])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 09:35:34 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Michal Winiarski <michal.winiarski@intel.com>
Subject: [PATCH 0/5] Use MI_MATH to apply RMW WA in LRC
Date: Mon,  3 Mar 2025 18:35:17 +0100
Message-Id: <20250303173522.1822-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

It was noticed that on VF we skip applying LRC WAs since we don't
process any RTP rules in xe_rtp_process_to_sr() and also because
during preparation of the WA job driver may read some registers
to perform RMW operation. By converting WA job to use MI_MATH we
can run this job also on VF. Inspired by i915 series [1].

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>

[1] https://patchwork.freedesktop.org/series/67276/

Michal Wajdeczko (5):
  drm/xe: Add MI_LOAD_REGISTER_REG command definition
  drm/xe: Add MI_MATH and ALU instruction definitions
  drm/xe: Avoid reading RMW registers in emit_wa_job
  drm/xe/vf: Stop applying save-restore MMIOs if VF
  drm/xe/vf: Unblock xe_rtp_process_to_sr for VFs

 .../gpu/drm/xe/instructions/xe_alu_commands.h | 72 ++++++++++++++++
 .../gpu/drm/xe/instructions/xe_mi_commands.h  |  5 ++
 drivers/gpu/drm/xe/regs/xe_engine_regs.h      |  4 +
 drivers/gpu/drm/xe/xe_gt.c                    | 84 ++++++++++++++-----
 drivers/gpu/drm/xe/xe_reg_sr.c                |  3 +
 drivers/gpu/drm/xe/xe_rtp.c                   |  3 -
 6 files changed, 147 insertions(+), 24 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/instructions/xe_alu_commands.h

-- 
2.47.1

