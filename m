Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75127D358E0
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 08:54:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B9C10E310;
	Thu, 29 Jan 2026 08:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H2g0WTmq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0373710E310;
 Thu, 29 Jan 2026 08:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769676885; x=1801212885;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=uz5xvlD86mwwG9UMw451LFd5CbY7UvwzMxtOjK+ZAl0=;
 b=H2g0WTmqubA5He1P6IQja8Z0gEdvjxXwi2/N7cfXw8ZgWiOwq/qRHIba
 YGVD3K9Pl0qpdVE3fww2BGkU0lkX5EDKjuMucC/eiLpXvfga7F8qqt4Gc
 AvDaK/LunPp3jW9jQ8/YY8XVQjl2T3/hgU2WJB2KyqEv15+CSWag5HZ0q
 gjErRdN+WVKGhbGQsuBEt2b0+do/sLTVdXTeRjtzlYO9aUKYwkQysqWKI
 rTEswSEMBLr6Z8+m2aPg8OFhxNZTCIMkxbsbGzQYViNbYDiw20uWCzJhy
 SKC149uAW6l2njm1sQgcanNXQGFIYBeKQk7yXlnXyiYThqkvVpwnXILsL A==;
X-CSE-ConnectionGUID: 63pQNCa6RZG2sLHnatIezQ==
X-CSE-MsgGUID: 5Nlf5sIhSNGZ7grQLe6MLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="69919922"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="69919922"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:54:44 -0800
X-CSE-ConnectionGUID: gRtGNHfxQD6+WElbrF6NXw==
X-CSE-MsgGUID: wb5BBubYTzyc+mNStQseSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="213019508"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa005.fm.intel.com with ESMTP; 29 Jan 2026 00:54:39 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v8 0/7] User readable error codes on atomic_ioctl failure
Date: Thu, 29 Jan 2026 14:22:57 +0530
Message-Id: <20260129-atomic-v8-0-4cb7b0faa051@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOkfe2kC/0XMQQrDIBCF4auEWXdK1BiTrnqP0oXo2AzUWFRCI
 eTulULp8oP3vx0KZaYCl26HTBsXTmvDdOrALXZ9ELJvBtlL3Rs5oa0pskM3G6GCV9rQAG38yhT
 4/T263ZtDThHrksn+81GaX74JFDja2VkhvPJ6uPJa6Xl2KcJxfACcohyxlgAAAA==
X-Change-ID: 20250728-atomic-c9713fd357e4
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org, 
 harry.wentland@amd.com, uma.shankar@intel.com, louis.chauvet@bootlin.com, 
 naveen1.kumar@intel.com, ramya.krishna.yella@intel.com
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>, 
 Suraj Kandpal <suraj.kandpal@intel.com>
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

The series focuses on providing a user readable error value on a failure
in drm_atomic_ioctl(). Usually -EINVAL is returned in most of the error
cases and it is difficult for the user to decode the error and get to
know the real cause for the error. If user gets to know the reason for
the error then corrective measurements can be taken up.

User will have to check for the capability
DRM_CAP_ATOMIC_ERROR_REPORTING before using this feature so as to ensure
that the driver supports failure reporting.

TODO: driver specific error codes are to be added and will be done in
the follow-up patches.

TODO: Once the series is merged the element 'reserved' used for sending
the failure code in struct drm_mode_atomic is to changed to err_code.

The IGT related changes are pushed for review @
https://patchwork.freedesktop.org/series/153330/

    To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
    To: suraj.kandpal@intel.com>
    To: Maxime Ripard <mripard@kernel.org>
    To: Thomas Zimmermann <tzimmermann@suse.de>
    To: David Airlie <airlied@gmail.com>
    To: Simona Vetter <simona@ffwll.ch>
    To: Jani Nikula <jani.nikula@linux.intel.com>
    To: Rodrigo Vivi <rodrigo.vivi@intel.com>
    To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
    To: Tvrtko Ursulin <tursulin@ursulin.net>
    To: xaver.hugl@kde.org
    To: harry.wentland@amd.com
    To: uma.shankar@intel.com
    To: louis.chauvet@bootlin.com
    To: naveen1.kumar@intel.com
    To: ramya.krishna.yella@intel.com
    Cc: dri-devel@lists.freedesktop.org
    Cc: intel-gfx@lists.freedesktop.org
    Cc: intel-xe@lists.freedesktop.org
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
Arun R Murthy (7):
      drm: Define user readable error codes for atomic ioctl
      drm/atomic: Add error_code element in atomic_state
      drm/atomic: Allocate atomic_state at the beginning of atomic_ioctl
      drm/atomic: Call complete_signaling only if prepare_signaling is done
      drm/atomic: Return user readable error in atomic_ioctl
      drm/i915/display: Error codes for async flip failures
      drm: Introduce DRM_CAP_ATOMIC_ERROR_REPORTING

 drivers/gpu/drm/drm_atomic.c                 | 31 ++++++++++
 drivers/gpu/drm/drm_atomic_uapi.c            | 91 +++++++++++++++++++---------
 drivers/gpu/drm/drm_ioctl.c                  |  3 +
 drivers/gpu/drm/i915/display/intel_display.c | 25 ++++----
 include/drm/drm_atomic.h                     | 10 +++
 include/uapi/drm/drm.h                       |  7 +++
 include/uapi/drm/drm_mode.h                  | 37 +++++++++++
 7 files changed, 165 insertions(+), 39 deletions(-)
---
base-commit: 6a3c9a03d943eb112c916c7419a837bc7de3a296
change-id: 20250728-atomic-c9713fd357e4

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

