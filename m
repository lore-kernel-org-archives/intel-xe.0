Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA5DE7717D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 06:42:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD22810E06B;
	Wed, 11 Dec 2024 06:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OFgnThVc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D2A10E06B
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Dec 2024 06:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733899340; x=1765435340;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HKLPy09RWqG7xDQxkzlWQRxnjFrInOF2LYOyrg1fjOU=;
 b=OFgnThVcTt3tm7qCkz3G8lOERwV3QYlmOIZbNfzqKp1yfm480jdkE9B/
 TszKsBqwq6n21fFySTpKmtOEKEwG0+b6aOdpy5EJ/36G48BqspCQDBC9K
 d3IuDDCP5kMKtDwtFC8X0b4b8vezkqmh6za6r4VBb4NPQNAZjKpexcWXc
 Pvk8mJt7UyWn+a5KFLNjPQBPncWYT5lG52eipeuNH4gdulSJGU7Kac3rY
 EiUMqb66fASUODTMJXmcEQyQgOAaHYE8IrAwSdg34YLeintcxw+IIqMaP
 MFr9uP24TBzL4uEpZKP9H6AtSZOEwlJlIN0bVUTX6N2xnNRhldPOmqOGL w==;
X-CSE-ConnectionGUID: M946z9Y2R32SHQjDhTSi/w==
X-CSE-MsgGUID: baUinfdtR7e6Nn5vgz/iDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44739287"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208,223";a="44739287"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 22:42:20 -0800
X-CSE-ConnectionGUID: PDhYLxbFTzK3evS0tvwI8A==
X-CSE-MsgGUID: acKssk4ARS+5DAR3NIF3mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
 d="scan'208,223";a="126605977"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.97.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 22:42:16 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Michal Winiarski <michal.winiarski@intel.com>,
 Narasimha C V <narasimha.c.v@intel.com>,
 Piotr Piorkowski <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v2 0/3] VF: Avoid reading inaccessible registers
Date: Wed, 11 Dec 2024 07:42:08 +0100
Message-Id: <20241211064211.781820-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

From VF-level some registers are not accessible. Don't check for flat
ccs from VF-level, also don't use Wa_22019338487 for VF.

v2: Updated description for has_flat_ccs flag setting on VF
    when disabled in BIOS. (Matt)
    Reworked workaround ommision on VF to use the RTP mechanism. (Matt)

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michal Winiarski <michal.winiarski@intel.com>
Cc: Narasimha C V <narasimha.c.v@intel.com>
Cc: Piotr Piorkowski <piotr.piorkowski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Tomasz Lis <tomasz.lis@intel.com>

Jakub Kolakowski (1):
  drm/xe/vf: Don't check has flat ccs in bios on VF

Marcin Bernatowicz (2):
  drm/xe/rtp: Add match helper to omit SR-IOV VF device
  drm/xe/vf: Don't apply Wa_22019338487 for VF

 drivers/gpu/drm/xe/xe_device.c     |  2 +-
 drivers/gpu/drm/xe/xe_rtp.c        |  5 +++++
 drivers/gpu/drm/xe/xe_rtp.h        | 11 +++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules |  2 +-
 4 files changed, 18 insertions(+), 2 deletions(-)

-- 
2.31.1

