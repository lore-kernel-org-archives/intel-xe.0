Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C395C52D6F
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 15:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C868A10E2D8;
	Mon, 19 Aug 2024 15:39:42 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B758210E2D8;
 Mon, 19 Aug 2024 15:39:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Ensure_display_?=
 =?utf-8?q?fb_is_aligned_in_GGTT_to_a_multiple_of_64k=2C_through_padding?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 19 Aug 2024 15:39:41 -0000
Message-ID: <172408198174.694772.17400561075700196216@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240819153127.235831-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240819153127.235831-1-maarten.lankhorst@linux.intel.com>
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

Series: drm/xe: Ensure display fb is aligned in GGTT to a multiple of 64k, through padding
URL   : https://patchwork.freedesktop.org/series/137462/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 91c54ea93a8df194a4c1a19a37a7c9c12d15e02b
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Mon Aug 19 17:31:27 2024 +0200

    drm/xe: Ensure display fb is aligned in GGTT to a multiple of 64k, through padding
    
    This workaround is needed on battlemage to ensure that there is no
    corruption when CCS is used.
    
    For testing, always enable the workaround. Should be easier to see if something blows up. :)
    
    Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
+ /mt/dim checkpatch 4574b385fd4f5016478f5ddc29e0a8b5e338b0ac drm-intel
91c54ea93a8d drm/xe: Ensure display fb is aligned in GGTT to a multiple of 64k, through padding
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
For testing, always enable the workaround. Should be easier to see if something blows up. :)

-:22: WARNING:LONG_LINE: line length of 101 exceeds 100 columns
#22: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:18:
+static inline bool needs_bmg_64k_workaround(struct xe_device *xe, const struct intel_framebuffer *fb)

-:56: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#56: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:52:
+	/* Start over with the first few pages, dpt is always aligned to a multiple
+		* of 512 pages, which means that there is enough padding here

total: 0 errors, 3 warnings, 0 checks, 137 lines checked


