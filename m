Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9926C5AD5A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 21:55:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E3F010F113;
	Wed, 12 Aug 2026 21:55:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gIibuwl5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D54A10F13A;
 Wed, 12 Aug 2026 21:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786571721; x=1818107721;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CX6Lv63z6xnAQnUP0ZSDNwHWo3DgyY9NaupX2BBPWYE=;
 b=gIibuwl5hUcg45nidDMexIPrDebF9mq3kMrUv0y0WI7o3L2SBt5McmvI
 JGHxwx+sMKUzYxYXXe7o8zWpfYP84cB+4y8DQGJY1V5RMJNu+aMe4EIdu
 jVc/G0AcWNkBwpDGl1fHuBH7x+ocDCJBGk6sBLRFexN36+gGgUf/yrfFw
 G/a7IpCNw8NltvZ9+6eocft45tYw3OKsp4EafgPdKiw6sFo+Hp3yx9Yqs
 Mw0h2GBfAjL7tZb8u7+zSgi7ESUgQfiDdu2RqpB0t7YuwCzzT5DtRKYJf
 4GOajgh3vUsiyIvqnH1kC1JDS2QywX7izxMptP5x5sVVxDm8sVXlO4YV9 g==;
X-CSE-ConnectionGUID: lJOBGNlcSUShV64EqMemlw==
X-CSE-MsgGUID: TSg8hbZ8Srq3JTTl+HOCeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97803625"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="97803625"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 14:55:13 -0700
X-CSE-ConnectionGUID: a7jucGYBT0CqJvb6h4eqDg==
X-CSE-MsgGUID: cVlbVyEAQ7iHSa2AcdPBRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; d="scan'208";a="260456724"
Received: from chu13-desk.fm.intel.com ([10.80.209.189])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 14:55:13 -0700
From: Austin Hu <austin.hu@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, maarten.lankhorst@linux.intel.com,
 vinod.govindapillai@intel.com
Subject: [PATCH 0/2] drm/i915/fbc: Dirty rectangle bounds enforcement and CFB
 nuke handling
Date: Wed, 12 Aug 2026 14:53:48 -0700
Message-Id: <20260812215350.3753102-1-austin.hu@intel.com>
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

This series improves Frame Buffer Compression (FBC) dirty rectangle
handling in compliance with hardware requirements.

The first patch restricts dirty rectangle vertical coordinates to the
valid frame buffer range [y_offset, y_end], adding explicit coordinate
inversion handling for 180-degree plane rotation and debug logging when
clamping occurs[cite: 10].

The second patch tracks plane state attribute changes during atomic commits[cite: 9].
When FBC Dirty Rectangle mode is active, partial updates only apply to
surface address changes (PLANE_SURF)[cite: 9]. Modifications to any other
plane state parameters require fetching full-plane pixel data from memory to
re-compress and update the entire CFB in stolen memory[cite: 9]. Once fully
re-compressed, subsequent atomic commits can resume selective dirty
rectangle updates[cite: 9].

Austin Hu (1):
  drm/i915/fbc: nuke CFB if Plane setting (except for surf addr) changes[cite: 9]

Charlton Lin (1):
  drm/i915/fbc: fbc_dirty_rect restrictions and logging[cite: 10]

 drivers/gpu/drm/i915/display/intel_fbc.c | 158 +++++++++++++++++++++-[cite: 9, 10]
 1 file changed, 151 insertions(+), 7 deletions(-)[cite: 9, 10]
