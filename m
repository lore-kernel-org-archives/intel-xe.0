Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F76BCCD195
	for <intel-xe@archiver.kernel.org>; Mon, 20 Oct 2025 02:06:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D3A10E23B;
	Mon, 20 Oct 2025 02:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fU7xjCEV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291F210E238
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Oct 2025 02:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760925985; x=1792461985;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E8ySZfNsQOihWU4M5BKQcmhJ4rjaBOGbbZTNZsI3gf0=;
 b=fU7xjCEVUdehW/8MxuW/6TKIaI0b4ZZcTtA18vo3wi4GHKiUJ+raPGOP
 LvgoXe6nkDommB23Nyao2n8NMgzRnJkCRaobNEc0YqzGFroFfcMebdMYk
 Rpdp9eZubvocgF3cQ8lgsmoEdclx/+IXHGpgilU9riz5VgfPkl8q5myQR
 jnv1EL5caT2BAFDkbnbXh2IGn1BSXLAWqidoBlZQXwFSJ098s9V6tYusm
 iP+YJyE0mL3+t0UX3/NFkpNDuYjmxPa4vs/0syNzzOmtNUE/REqOW5duz
 bNeeRWLwXgKMhtBvwEk+K3L0ewtNQYoiQfi8QgcmvPlWFXqg3XTsyVwjM A==;
X-CSE-ConnectionGUID: uweOjY+LQbyZQlaOfovfSA==
X-CSE-MsgGUID: fko5YWUyRhOSSvQQFhGVkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="66909990"
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; d="scan'208";a="66909990"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2025 19:06:24 -0700
X-CSE-ConnectionGUID: ZO+vRdtVQDykt1QBMZoKEg==
X-CSE-MsgGUID: J9YzXyObSGWvj67pr/oMMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; d="scan'208";a="183705651"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2025 19:06:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Brian Welty <brian.welty@intel.com>
Subject: [PATCH 0/2] drm/xe/xe3p: Use main gamctrl if available
Date: Sun, 19 Oct 2025 19:05:45 -0700
Message-ID: <20251019-xe3p-gamctrl-v1-0-ad66d3c1908f@intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251019-xe3p-gamctrl-7644824ae307
X-Mailer: b4 0.15-dev-bd47d
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

These patches got dropped after v1 of the xe3p addition[1] while
it needed to be clarified with HW / spec. Now that is done, we can bring
these patches back.

[1] https://patchwork.freedesktop.org/patch/680596/?series=155866&rev=1#comment_1249896

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
Balasubramani Vivekanandan (1):
      drm/xe/xe3p_lpm: Add special check in Media GT for Main GAMCTRL

Brian Welty (1):
      drm/xe/xe3p_lpm: Configure MAIN_GAMCTRL_QUEUE_SELECT

 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  9 +++++++
 drivers/gpu/drm/xe/xe_guc.c          | 46 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc.h          |  1 +
 drivers/gpu/drm/xe/xe_guc_ads.c      |  6 ++++-
 drivers/gpu/drm/xe/xe_guc_fwif.h     |  1 +
 5 files changed, 62 insertions(+), 1 deletion(-)

base-commit: f0958801c4269d078ef9df13a38f7904234070d7
change-id: 20251019-xe3p-gamctrl-7644824ae307

Lucas De Marchi

