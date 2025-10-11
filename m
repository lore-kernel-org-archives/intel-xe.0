Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197B8CCA476
	for <intel-xe@archiver.kernel.org>; Sat, 11 Oct 2025 12:35:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2EAF10E070;
	Sat, 11 Oct 2025 12:35:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PCTSVPXo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D361510E070
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Oct 2025 12:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760186143; x=1791722143;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MxiTTsgk8C+JDTILAgEEG45PnZAJZGB043InjQa0POc=;
 b=PCTSVPXohHsLTnOuCjwzSCiyzRsQt6wqajREmBG9ZmerdgSR6f1Qoceo
 De9J8s6yvcyeJkCn4VDithYEGr5251Rf8dahx6e+T1hLc+pQpIzCwQgDk
 yj/Mcn6AoaYd20wRjAKUvtNmRwkmeT3LwgWNb+0JvNntBfZVMu7Ww/yua
 EzXfdHf45k8xFsDJ+0VQmMv0ULvCMGA0FM1JfpKdgyfmm5oZ4boFr/c4y
 en0oAntEK0Dure9mgWcmygZhGo4hOQlQhapWlRjx8F++H/Uma52E87DcP
 XjcdewnOsIluqOLn7mpX+10mpsrQkW7O6b38Jrm3TgD+f6wqkj7ehmmTM g==;
X-CSE-ConnectionGUID: rG18xlU5Rt259D6WsRhiCQ==
X-CSE-MsgGUID: MFmFrF4QRASUOK9ZeuyqHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="79828060"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="79828060"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 05:35:42 -0700
X-CSE-ConnectionGUID: IKbakzmVTYiEQnApaREw/Q==
X-CSE-MsgGUID: XpaTL6yeQu+fTjG9Yghz/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="180876080"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa007.fm.intel.com with ESMTP; 11 Oct 2025 05:35:40 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v3 0/2] Wire up reset/postinstall for I2C IRQ
Date: Sat, 11 Oct 2025 18:05:07 +0530
Message-Id: <20251011123509.3233213-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
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

This series wires up reset/postinstall handles for I2C IRQ so that it
can be routed to SGunit or PUnit when needed.

v2: Integrate DISABLE_MSI_CAP changes (Heikki)
v3: Drop DISABLE_MSI_CAP changes as they are not required for the usecase

Raag Jadav (2):
  drm/xe/i2c: Introduce xe_i2c_irq_present()
  drm/xe/i2c: Wire up reset/postinstall for I2C IRQ

 drivers/gpu/drm/xe/regs/xe_i2c_regs.h |  3 +++
 drivers/gpu/drm/xe/xe_i2c.c           | 28 ++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_i2c.h           |  4 ++++
 drivers/gpu/drm/xe/xe_irq.c           |  2 ++
 4 files changed, 36 insertions(+), 1 deletion(-)

-- 
2.34.1

