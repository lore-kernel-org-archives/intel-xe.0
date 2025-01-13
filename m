Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFA9C02183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jan 2025 15:16:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3030C10E6D1;
	Mon, 13 Jan 2025 15:16:19 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4749D10E6D2;
 Mon, 13 Jan 2025 15:16:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/display=3A_Re-use_?=
 =?utf-8?q?display_vmas_when_possible_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 13 Jan 2025 15:16:18 -0000
Message-ID: <173678137828.3272335.10148860437963434538@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241206182032.196307-1-dev@lankhorst.se>
In-Reply-To: <20241206182032.196307-1-dev@lankhorst.se>
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

Series: drm/xe/display: Re-use display vmas when possible (rev4)
URL   : https://patchwork.freedesktop.org/series/136033/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8ac415a30c4bc144eb4792db2b7fffef3ca83b1d
Author: Maarten Lankhorst <dev@lankhorst.se>
Date:   Fri Dec 6 19:20:32 2024 +0100

    drm/xe/display: Re-use display vmas when possible
    
    i915 has this really nice, infrastructure where everything becomes
    complicated, GGTT needs eviction, etc..
    
    Lets not do that, and make the dumbest possible interface instead.
    Try to retrieve the VMA from old_plane_state, or intel_fbdev if kernel
    fb.
    
    Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
+ /mt/dim checkpatch 26615f392d2232d75d405c54944e21aa1d28c204 drm-intel
8ac415a30c4b drm/xe/display: Re-use display vmas when possible
-:175: ERROR:CODE_INDENT: code indent should use tabs where possible
#175: FILE: drivers/gpu/drm/xe/display/xe_fb_pin.c:395:
+^I            sizeof(new_plane_state->view.gtt))) {$

total: 1 errors, 0 warnings, 0 checks, 163 lines checked


