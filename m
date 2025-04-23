Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDBCC369CB
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 17:51:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D2C10E22D;
	Wed, 23 Apr 2025 17:51:43 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E31F10E22D;
 Wed, 23 Apr 2025 17:51:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5Bv?=
 =?utf-8?q?3=2C1/2=5D_drm/i915/display=3A_Ensure_enough_lines_between_delaye?=
 =?utf-8?q?d_VBlank_and_VBlank?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 23 Apr 2025 17:51:42 -0000
Message-ID: <174543070239.1595.1666933232998359517@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250423102704.1368310-1-jouni.hogander@intel.com>
In-Reply-To: <20250423102704.1368310-1-jouni.hogander@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [v3,1/2] drm/i915/display: Ensure enough lines between delayed VBlank and VBlank
URL   : https://patchwork.freedesktop.org/series/148126/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 632efcb24b15f8e64f7325e62dcb5a98ffe5336d
Author: Jouni Högander <jouni.hogander@intel.com>
Date:   Wed Apr 23 13:27:04 2025 +0300

    drm/i915/psr: Move PSR workaround to intel_psr.c
    
    Logical place for PSR workaround needing vblank delay is in
    intel_psr_min_vblank_delay. Move it there.
    
    Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
+ /mt/dim checkpatch a8900c1b61e733563cb6dfa5173ff5cd8bb0e494 drm-intel
3a0bdb5cd8a1 drm/i915/display: Ensure enough lines between delayed VBlank and VBlank
632efcb24b15 drm/i915/psr: Move PSR workaround to intel_psr.c


