Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBE8EE6432
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 07:49:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7063010E5C6;
	Fri, 15 Sep 2023 07:49:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CEAE10E5C6
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 07:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694764145; x=1726300145;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bMuSRJrIaXHefj09edlEGIX2jakiHM24zMjkAYwp0qw=;
 b=HWk7AvEQTC7pg18KHAl89qUtdBs8EhLYbm2d/9VxTSFoIVaXAiOmg7pR
 m18QOimpf8IgGyNrdOIylmKSgiw2+48aVl89046ciaQC0b2FvvCpAB1Z5
 gooJkmJhEAovGHaGUpoYQ04o2EnPdScQ9iWBOrhBFHY1pEFQKut0KQFtQ
 TcJruzxTy+KBmaXJPFmmRW2gNfKVfcmrjlW1MKHJ3T4hQwy6m668zydVU
 cOfwday7VmfIU5wrKNJsp3Cgn4hAbCi/TRbPxBa9lHT/5Xt5oKum4R2u5
 nUbGtaXeqjHDj2gjswXBEU3PYQtzxxJQES+ImrNCRdib3t0RMQ5AtrnY8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="369507561"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; d="scan'208";a="369507561"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 00:48:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="1075711583"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; d="scan'208";a="1075711583"
Received: from cohrs-mobl1.ger.corp.intel.com (HELO jhogande-mobl1.intel.com)
 ([10.252.48.100])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 00:48:36 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 15 Sep 2023 10:48:11 +0300
Message-Id: <20230915074818.903353-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/7] Frontbuffer tracking and dirtyfb
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Generic dirtyfb implementation which Xe is currently using is doing atomic
commit which is inefficient. We have now dma fence handling in our dirtyfb
implementation. This works with Xe and CPU/GPU frontbuffer rendering as
long as sync objects are imported by userspace
(dma_buf_import_sync_file).

This patch set is backporting dirtyfb dma fence handling into our
custom dirtyfb implementation and switching to that on Xe as well.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>

Jouni Högander (7):
  drm/xe: Add empty def for i915_gem_object_flush_if_display
  fixup! FIXME: drm/i915/display: Remaining changes to make xe compile
  drm/i915/fbc: Clear frontbuffer busy bits on flip
  drm/i915/psr: Clear frontbuffer busy bits on flip
  drm/i915: Add new frontbuffer tracking interface to queue flush
  drm/i915: Handle dma fences in dirtyfb callback
  drm/i915/display: Use intel_bo_to_drm_bo instead of obj->base

 drivers/gpu/drm/i915/display/intel_fb.c       | 66 ++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_fbc.c      |  6 +-
 .../gpu/drm/i915/display/intel_frontbuffer.c  | 29 ++++++++
 .../gpu/drm/i915/display/intel_frontbuffer.h  |  4 ++
 drivers/gpu/drm/i915/display/intel_psr.c      |  6 ++
 drivers/gpu/drm/xe/xe_bo.h                    |  1 +
 6 files changed, 99 insertions(+), 13 deletions(-)

-- 
2.34.1

