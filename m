Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA1CCD37B6
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 10:10:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57FF710EDC1;
	Wed, 13 May 2026 10:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aFavV7zs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE3110EDC1;
 Wed, 13 May 2026 10:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778667016; x=1810203016;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9GA7yrJX3qsaOvGNA8YZYZU2zql7q7T5FhkjtXqrHGM=;
 b=aFavV7zs8lsHeMvK0Ez2pZmG6SqoDXMNe3HLc2+xDrRPs940be5cvbTw
 O/z+tsT12vt4xjuYJUo+Opsse7wbvwqyqRfIa/3+4ZJ71lA2CS4PVXilS
 XHuZUdnLeOiat8ZYAUflFU5Nf6t3ZIjbn9AA6ma0Le5iFq8v/Tkg3p6zc
 xwcGgqYLHjcpyut4Y/CDQebz/Xh4ewsdT5KkZOBy0N02beYtVrZWvVMUv
 iFo0hx8A3z1c0Jmw3XF5yivdId2PpADzLcXHDMecJLXgN1fUpyqoUbVpb
 GRJwMnNhnBgBm1zFQKtPOddH+OgxHh4TuyhWGs3nFnjjWQQavyf2AmXpB w==;
X-CSE-ConnectionGUID: 9FrWiPfiQuuAeFxTU+z9DA==
X-CSE-MsgGUID: 7v5PyluhSum/oYWZ7a/RqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="90973151"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="90973151"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 03:10:16 -0700
X-CSE-ConnectionGUID: lYMae2dsS7yWU47wt8QUeA==
X-CSE-MsgGUID: MlfLNW5lTDKZGMnQ+seJfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="233770335"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.102])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:10:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH v3 0/6] drm/i915: add display irq hooks
Date: Wed, 13 May 2026 13:10:05 +0300
Message-ID: <cover.1778666967.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

v3 of [1].


[1] https://lore.kernel.org/r/cover.1777933454.git.jani.nikula@intel.com


Jani Nikula (6):
  drm/i915/irq: deduplicate dg1_de_irq_postinstall() and
    gen11_de_irq_postinstall()
  drm/i915/irq: constify pipe stats parameters
  drm/i915/irq: add display irq funcs, start with
    intel_display_irq_reset()
  drm/i915/irq: add intel_display_irq_postinstall() to irq funcs
  drm/i915/irq: add intel_display_irq_ack() to irq funcs
  drm/i915/irq: add intel_display_irq_handler() to irq funcs

 .../gpu/drm/i915/display/intel_display_core.h |   3 +
 .../gpu/drm/i915/display/intel_display_irq.c  | 238 +++++++++++++++---
 .../gpu/drm/i915/display/intel_display_irq.h  |  37 +--
 drivers/gpu/drm/i915/i915_irq.c               | 182 +++++---------
 drivers/gpu/drm/xe/display/xe_display.c       |   6 +-
 5 files changed, 277 insertions(+), 189 deletions(-)

-- 
2.47.3

