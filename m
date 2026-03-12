Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D91FED2F1
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 08:54:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D9A10E9B2;
	Thu, 12 Mar 2026 08:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="naja8ZIB";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0221710E9A3;
 Thu, 12 Mar 2026 08:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YjDlyOnCfo2a+nrGi13xXHyMQ5y5kSAnR94RLevB/p4=; b=naja8ZIBI8htCLoeyiAmJTvTvv
 9kNDfBxxhKunOKdOm5oUo3WLHUnaIpeHI5B8M9ly6PuyFcCgW0fUiymazZ7dMgMuCTVAv+Ma0bo4/
 FGHTmZY/CIwZIksYubng8rkmbve8/vAz12AMuTCriCa3+F8NwYqz46U/r8aWtYkBElGjY2vlsf0aK
 QfN+Z+w0XsjH+oATkReTVQ2fNMR1l+T6FQCNy3ZduQsqVFX+izLSNcG547qQPm8O2nyG4V3ZxTRJ0
 Pv3XBiLI+VtN2gNO1TD/CSleBf+lF23jnQkyoMIFiIMbHNUkQOeyriTTPddJIdKoZchF6OLAs0PM7
 FtrkykRA==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1w0bo2-00EPMd-GL; Thu, 12 Mar 2026 09:54:10 +0100
Date: Thu, 12 Mar 2026 08:54:09 +0000
From: Tvrtko Ursulin <tursulin@igalia.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-fixes
Message-ID: <abJ_MQ7o-5ghyaNW@linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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


Hi Dave, Sima,

This week's fixes are a fix to avoid ICL hang when configuring VRR,
fix to the eDP ALPM read-out sequence, two fixes for PSR Selective
Update handling (with two dependecies) and a fix for sg table overflow
when shmem folio allocations are larger than 4GB.

Tvrtko

drm-intel-fixes-2026-03-12:
- Avoid hang when configuring VRR [icl] (Ville Syrjälä)
- Fix sg_table overflow with >4GB folios (Janusz Krzysztofik)
- Fix PSR Selective Update handling [psr] (Jouni Högander)
- Fix eDP ALPM read-out sequence [dp] (Arun R Murthy)
The following changes since commit 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681:

  Linux 7.0-rc3 (2026-03-08 16:56:54 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2026-03-12

for you to fetch changes up to 335b237d902c7362cb7228802e68374406b24acf:

  drm/i915/dp: Read ALPM caps after DPCD init (2026-03-10 08:26:33 +0000)

----------------------------------------------------------------
- Avoid hang when configuring VRR [icl] (Ville Syrjälä)
- Fix sg_table overflow with >4GB folios (Janusz Krzysztofik)
- Fix PSR Selective Update handling [psr] (Jouni Högander)
- Fix eDP ALPM read-out sequence [dp] (Arun R Murthy)

----------------------------------------------------------------
Arun R Murthy (1):
      drm/i915/dp: Read ALPM caps after DPCD init

Janusz Krzysztofik (1):
      drm/i915: Fix potential overflow of shmem scatterlist length

Jouni Högander (4):
      drm/i915/psr: Repeat Selective Update area alignment
      drm/i915/dsc: Add Selective Update register definitions
      drm/i915/dsc: Add helper for writing DSC Selective Update ET parameters
      drm/i915/psr: Write DSC parameters on Selective Update in ET mode

Ville Syrjälä (1):
      drm/i915/vrr: Configure VRR timings after enabling TRANS_DDI_FUNC_CTL

 drivers/gpu/drm/i915/display/intel_alpm.c      |  6 ---
 drivers/gpu/drm/i915/display/intel_display.c   |  1 -
 drivers/gpu/drm/i915/display/intel_dp.c        |  7 +++
 drivers/gpu/drm/i915/display/intel_psr.c       | 60 ++++++++++++++++++++------
 drivers/gpu/drm/i915/display/intel_vdsc.c      | 23 ++++++++++
 drivers/gpu/drm/i915/display/intel_vdsc.h      |  3 ++
 drivers/gpu/drm/i915/display/intel_vdsc_regs.h | 12 ++++++
 drivers/gpu/drm/i915/display/intel_vrr.c       | 14 ++++++
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c      | 12 ++++--
 9 files changed, 116 insertions(+), 22 deletions(-)
