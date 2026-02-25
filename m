Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE76FD3764
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 14:40:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FBC10E799;
	Wed, 25 Feb 2026 14:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k7HnX94W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE4B10E17F;
 Wed, 25 Feb 2026 14:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772030414; x=1803566414;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=g0sH2iqMGsKuqGdm3SMd4WoJr8xlE0KZMiC0E5inzKo=;
 b=k7HnX94WVAc7Sxf9QUMKHAkqiYBTL1WAzeYxbkwAfwde99PLTNWEAhPV
 x85GnMw8JWBCReXm7zN7gnavTgkanONsK7rbE8relJ3P3L5qRiUWgbcvm
 5zilMC8GiZtuMEeodVZllZrnjWutxaO2XI2upEyu73QpODbvoe598fIPa
 cxJKHeVa/NhkQxY0B2j6aE2oedqdvkKjabgiH/WrpdZYLcVb8mpjppaAX
 +3pTJ5kQAC9evZCgAp1RFL9C4D9yVx7C2Vqx/epsQPn7QtfDPY1f3GglO
 8ZhsEstAcAhNE1BK61LUbVpEnGdB5ZmbqJG09Nawm6QrrxEpJlD3IkX2r w==;
X-CSE-ConnectionGUID: FIy4itsTTzu57qnGsj4viA==
X-CSE-MsgGUID: Djj1IzVZQeuYxySR3PX75A==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73042708"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="73042708"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 06:40:13 -0800
X-CSE-ConnectionGUID: Jccg5kSmSr+TeEI1GeRzAQ==
X-CSE-MsgGUID: S423A3hFR1uUvfp6FlPHYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="216133261"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.9])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 06:40:08 -0800
Date: Wed, 25 Feb 2026 16:40:05 +0200
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
Subject: [PULL] drm-intel-fixes
Message-ID: <aZ8JxQkN5oMxXsT6@jlahtine-mobl>
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

Here's drm-intel-fixes PR towards v7.0-rc2.

Just one PSR issue (#7153) fix on the display side.

Regards, Joonas

***

drm-intel-fixes-2026-02-25:

- Fix #7153: Panel Replay stuck with X during mode transitions on Panther Lake

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-fixes-2026-02-25

for you to fetch changes up to eb4a7139e97374f42b7242cc754e77f1623fbcd5:

  drm/i915/alpm: ALPM disable fixes (2026-02-23 12:44:06 +0200)

----------------------------------------------------------------
- Fix #7153: Panel Replay stuck with X during mode transitions on Panther Lake

----------------------------------------------------------------
Jouni Högander (1):
      drm/i915/alpm: ALPM disable fixes

 drivers/gpu/drm/i915/display/intel_alpm.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)
