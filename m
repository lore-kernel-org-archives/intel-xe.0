Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4CECD37AC
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 19:21:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3898110E0EA;
	Thu, 14 May 2026 19:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gN5Unc3P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F5F8922E;
 Thu, 14 May 2026 19:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778786503; x=1810322503;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=LNa5WDeIDNJypgUwAhWujpis3y1y7JLlFynSvVWjt48=;
 b=gN5Unc3PpADgyntjs1aersF/XSY6XO1I7huLLVzSsZj1zsdBDtnIb5BB
 qXNH0Ah2x9752q2mHBClDvrdoPIHkDIjAhCXQ92QyjLR6hOqn4I5vqalQ
 ax3U3Xq2ybrAO9UrioaV+0UctvbHBn+R4G8JupZwGCP6W2hw9PEe9VXWP
 8NiJRj/hQ7ACix+9+QKDygdR45/Y4qRb3ybXylTDoCYGhOP6RF2ZXbxky
 D/TvGAG/ed0G9nOejUBJ0wla+JsmHlJJYAjw+gsdc6xmTU8YKpHXFwrkR
 sEWEIPHV3y1rn4RnuV4lAw7xUIGpw+NsZZK617DKbzv4I2U1ZGRZ8THpP w==;
X-CSE-ConnectionGUID: vAglWVIiRIqP/tuQ0wrTpQ==
X-CSE-MsgGUID: djOsHSabRrWXqI+ZpBqBuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="83351245"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="83351245"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 12:21:43 -0700
X-CSE-ConnectionGUID: rto3iFN+QH+/VUPmP7wYbQ==
X-CSE-MsgGUID: VonnthgBRGie/B0tlx/GeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="237611794"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.221.189])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 12:21:42 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v3 0/5] drm/i915/bw: Split bandwidth params into platform-
 and display-IP-specific structs
Date: Thu, 14 May 2026 16:19:29 -0300
Message-Id: <20260514-separate-platform-from-diplay-ip-specific-bw-params-v3-0-68727d6fe3ec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6XOwQ6CMAyA4VcxO1szhgziyfcwHrbRSRNgy7agh
 PDuDi561uPfNP26sIiBMLLLYWEBJ4rkxhzl8cBMp8YHArW5meBC8jNvIKJXQSUE36tkXRjABjd
 AS7lnIA/RoyFLBvQTttUhgqy01YpLXmpk+bIPaOm1q7d77o5icmHen5iKbfqfNxXAQZSmKpVVd
 av5lcaE/cm4gW3eJD5GVRS/GSIbWEthdCOlaNW3sa7rGxsEFcBaAQAA
X-Change-ID: 20260408-separate-platform-from-diplay-ip-specific-bw-params-65bfba0603be
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Jani Nikula <jani.nikula@intel.com>, Matt Roper <matthew.d.roper@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>
X-Mailer: b4 0.15-dev
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

Some of the parameters of used in display bandwidth calculations are
tied to the platform and are orthogonal to the display IP.  After talking
with the hardware team, we now have the information (and Bspec has been
updated) that the members deprogbwlimit and derating of struct
intel_sa_info are such platform-specific ones.

With that, we are now able to make the driver code more aligned with the
hardware by splitting structs intel_sa_info into two different structs:
one that is platform-specific and another that is display-IP-specific.

That change also allows us to simplify how we select the parameters for
the calculation.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
Changes in v3:
- Incorporated review feedback; see each individual patch for details.
- Link to v2: https://patch.msgid.link/20260511-separate-platform-from-diplay-ip-specific-bw-params-v2-0-e762cb8662da@intel.com

Changes in v2:
- Incorporated review feedback; see each individual patch for details.
- Link to v1: https://patch.msgid.link/20260408-separate-platform-from-diplay-ip-specific-bw-params-v1-0-23c53afa7db0@intel.com

---
Gustavo Sousa (5):
      drm/i915/bw: Don't call intel_dram_info() too early
      drm/i915/bw: Extract platform-specific parameters
      drm/i915/bw: Deduplicate intel_sa_info instances
      drm/i915/bw: Rename struct intel_sa_info to intel_display_bw_params
      drm/i915/bw: Extract get_display_bw_params()

 drivers/gpu/drm/i915/display/intel_bw.c | 218 +++++++++++++++++++++-----------
 1 file changed, 141 insertions(+), 77 deletions(-)
---
base-commit: dee34cfbffbfe2196a9332f966b006cd2e54e976
change-id: 20260408-separate-platform-from-diplay-ip-specific-bw-params-65bfba0603be

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

