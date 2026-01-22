Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECCBC44536
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 08:02:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8286210E903;
	Thu, 22 Jan 2026 08:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VuNPKZkb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE26F10E8FF;
 Thu, 22 Jan 2026 08:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769068950; x=1800604950;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=j3/obGyZSfY07pSaseTvUrKPQrCLFo8RG9DRrGoS0/Y=;
 b=VuNPKZkb1hOdEStTn5HBMWWARIpRsfiD4gLWiSN5QjmQ3M8H/XubjdF4
 JUWTKgP+1g2Uadf1Nc+KdSROvt4yiJzUnNnEPgqR7mH7ReZOfflr5ecu+
 SmqhG/I2En4dbtImuaUasPAP6drFlhq90pko6UUVCe5iTPifDwqAlY099
 RWMmJQPo6ikB5xJERh/1JamZoLy9BW4kxo5izCGwLOna6cnvOxiuxUCE9
 mvoGNRQtze1h2Ze7fanZHNLDHBh8ETq7MPH48P7KpNvZiN17B8Xhwkf6i
 RjHihuIN7udO3GH4ivHD++o8HKFmtUb/ALvSh3rJ8ieJX3ja93s8eWkZ8 Q==;
X-CSE-ConnectionGUID: WpRuK8d6TBihnu5GflilgA==
X-CSE-MsgGUID: cpdhxlPFQK+YiW6qcs2lOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="80930066"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="80930066"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 00:02:29 -0800
X-CSE-ConnectionGUID: 3REEHnnQRgisop9wZjSZIg==
X-CSE-MsgGUID: O+rtvrNbQqSkGsDgUOUbiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; d="scan'208";a="206576860"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.237])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 00:02:25 -0800
Date: Thu, 22 Jan 2026 10:02:22 +0200
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org
Subject: [PULL] drm-intel-next-fixes
Message-ID: <aXHZjieG9PkFKjZ2@jlahtine-mobl>
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

Hi Dave & Sima,

Here's drm-intel-next-fixes PR towards 6.19-rc7.

Just one display PSR related fix.

Regards, Joonas

***

drm-intel-next-fixes-2026-01-22:

- Don't enable Panel Replay on sink if globally disabled

The following changes since commit 95adee9a04fa1eaa352e960e9d3387055fa03bb3:

  Merge tag 'drm-intel-gt-next-2026-01-16' of https://gitlab.freedesktop.org/drm/i915/kernel into drm-next (2026-01-19 13:51:10 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-fixes-2026-01-22

for you to fetch changes up to 69f83f167463bad26104af7fbc114ce1f80366b0:

  drm/i915/psr: Don't enable Panel Replay on sink if globally disabled (2026-01-19 11:55:31 +0200)

----------------------------------------------------------------
- Don't enable Panel Replay on sink if globally disabled

----------------------------------------------------------------
Jouni Högander (1):
      drm/i915/psr: Don't enable Panel Replay on sink if globally disabled

 drivers/gpu/drm/i915/display/intel_psr.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
