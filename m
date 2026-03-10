Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B132FD2D62
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 12:00:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2771A10E704;
	Tue, 10 Mar 2026 12:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jSkU8lbe";
	dkim-atps=neutral
Received: from mgamail.intel.com (unknown [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28F410E702;
 Tue, 10 Mar 2026 12:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773144051; x=1804680051;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aSMZDpvUgLluBKOIRlanJKEP/gkSJLftLRgZUIk89GQ=;
 b=jSkU8lbe/Vk43HekiKKxHrJhr0QwGW6NFfUkqBehYYQoHCSI/niw5qKU
 XFlGVQ/hnnRCvHcVhQrRAHdjwufnn9s2D+AqdZ5uSiqYqS/OYERkx/jAw
 Lr2C7m+T1gNwopbS7ll74vp/QnFZ5B5UWZYU2hAzIgCmVhJRH6xUFpTlN
 WdSTMzOTG5adKCwRpOszdO/P4fmoHx2c4jJIEnEosQQPwvVGJwsIvXM4D
 cYf35jflWwiTZ2F/JQw8SNHU0xxViwrkz24eJssY2Tp5ASQK9/f1y4LD9
 emVDWgu6F7ndNN3Fs9ozqFRCXZFJCtI2rO54CJ36oMXIYocwCAq7T5fzh Q==;
X-CSE-ConnectionGUID: wcjMJeZ/Q1e9y4J/nVnVDw==
X-CSE-MsgGUID: L0xeg+3yQmq36u8RKVVZig==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84897879"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="84897879"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 04:57:38 -0700
X-CSE-ConnectionGUID: 9WIlatWxQcOiYBNiHHrqiw==
X-CSE-MsgGUID: BbqkrnYaTOGdoo4yt+6izQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="224773038"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa005.fm.intel.com with ESMTP; 10 Mar 2026 04:57:33 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: contact@emersion.fr, alex.hung@amd.com, harry.wentland@amd.com,
 daniels@collabora.com, mwen@igalia.com, sebastian.wick@redhat.com,
 uma.shankar@intel.com, ville.syrjala@linux.intel.com,
 maarten.lankhorst@linux.intel.com, jani.nikula@intel.com,
 louis.chauvet@bootlin.com, stable@vger.kernel.org,
 chaitanya.kumar.borah@intel.com
Subject: [PATCH v2 0/2] drm/colorop: Keep colorop state consistent across
 atomic commits
Date: Tue, 10 Mar 2026 17:02:36 +0530
Message-Id: <20260310113238.3495981-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
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

This series aims to keep colorop state consistent across atomic
transactions by ensuring it accurately reflects committed hardware
state and remains part of the atomic update whenever its associated
plane is involved.

It contains two changes:
- Preserves the bypass value in duplicated colorop state.

_drm_atomic_helper_colorop_duplicate_state() unconditionally reset
bypass to true, which means the duplicated state no longer reflects the
committed hardware state. Since bypass directly controls whether the
colorop is active in hardware, this can lead to an unintended disable
during subsequent commits.

This could potentially be a problem also for colorops where bypass value
is immutably false.

Conceptually, I consider 'bypass' to behave similar to 'visible' in plane 
state - it represents current HW state and should therefore be preserved
across duplication.

- Add affected colorops with affected plane

Colorops are unique in the DRM model. While they are DRM objects with their
own states, they are logically attached to a plane and exposed through
a plane property. In some sense, they share the same hierarchy as CRTC and
planes while following a different 'ownership' model.

Given that enabling a CRTC pulls in all its affected planes into the atomic
state, it follows that when a plane is added, its associated colorops are
also included. Otherwise, during modesets or internal commits, colorop state
may be missing from the transaction, resulting in inconsistent or incomplete
state updates.

That said, I do have a concern about potentially inflating the atomic
state by automatically pulling in colorops from the core. It is not
entirely clear to me whether inclusion of affected colorops should be
handled in core, or left to individual drivers.

My understanding of the atomic framework is still evolving, so
I would appreciate feedback from those more familiar with the intended
design direction.

==
Chaitanya

P.S/Background/TL;DR:

I discovered inconsistency with the colorop state while analysing CRC mismatches
in kms_color_pipeline test cases[1]. Visual inspection reveals that while CRC is
being collected degamma block has been reset. This was traced back to the internal
commit that the driver does to disable PSR2 and selective fetch for CRC collection.

crtc_crc_open
    -> intel_crtc_set_crc_source
        -> intel_crtc_crc_setup_workarounds
            -> drm_atomic_commit

During this flow colorop states are never added to the atomic state which in turn
makes intel_plane_color_copy_uapi_to_hw_state() disable the colorops.

If we add the colorops, to the atomic state, the problem still persisted because
while duplicating the colorop state, 'bypass' was getting reset to true.

The two changes made in this series fixes the issue.

[1] https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18001/shard-mtlp-6/igt@kms_color_pipeline@plane-lut1d.html

v2:
  - Add affected colorops only when a pipeline is enabled

Cc: Simon Ser <contact@emersion.fr>
Cc: Alex Hung <alex.hung@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Daniel Stone <daniels@collabora.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Alex Hung <alex.hung@amd.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: <stable@vger.kernel.org> #v6.19+

Chaitanya Kumar Borah (2):
  drm/colorop: Preserve bypass value in duplicate_state()
  drm/atomic: Add affected colorops with affected planes

 drivers/gpu/drm/drm_atomic.c  | 7 +++++++
 drivers/gpu/drm/drm_colorop.c | 2 --
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.25.1

