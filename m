Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AF6CD8C9D
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 11:43:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CD310F254;
	Mon,  8 Jun 2026 11:43:05 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4524C10F254;
 Mon,  8 Jun 2026 11:43:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Enable_joiner_cursor_fast?=
 =?utf-8?q?_updates_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Jun 2026 11:43:04 -0000
Message-ID: <178091898427.53486.18328529128729011813@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260608062629.820477-1-nemesa.garg@intel.com>
In-Reply-To: <20260608062629.820477-1-nemesa.garg@intel.com>
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

Series: Enable joiner cursor fast updates (rev3)
URL   : https://patchwork.freedesktop.org/series/165272/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5b9bdcda2301621be9a75997da867bde8c327f99
Author: Nemesa Garg <nemesa.garg@intel.com>
Date:   Mon Jun 8 11:56:29 2026 +0530

    drm/i915/cursor: Allow joiner cursor fast path update
    
    The legacy cursor path forced all joiner updates to the
    slow path by checking joiner_pipes.
    Drop the condition so that joiner cursor updates can use
    the fast path.
    
    Assisted-by: Claude:claude-sonnet-4.6
    Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
+ /mt/dim checkpatch 044152a1643f7150f482c8d326caa5023ae4c397 drm-intel
67a570a33e2f drm/i915/cursor: Check joiner cursor commit status
c2a5b1845a3c drm/i915/cursor: Add helper to update cursor plane
b445dac92269 drm/i915/cursor: Handle secondary cursor state
-:168: WARNING:LONG_LINE: line length of 103 exceeds 100 columns
#168: FILE: drivers/gpu/drm/i915/display/intel_cursor.c:1107:
+						 drm_crtc_accurate_vblank_count(&owner_crtc->base) + 1,

total: 0 errors, 1 warnings, 0 checks, 175 lines checked
98db988d8e7a drm/i915/cursor: Sync joiner secondary cursor state
ee9f45527650 drm/i915/cursor: Program secondary cursor planes
5b9bdcda2301 drm/i915/cursor: Allow joiner cursor fast path update


