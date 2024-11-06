Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116D5D3E783
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 02:21:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD05710E659;
	Wed,  6 Nov 2024 02:21:41 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356CD10E659;
 Wed,  6 Nov 2024 02:21:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe=3A_improve_hibernation_on_igpu?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Nov 2024 02:21:41 -0000
Message-ID: <173085970121.1414592.3879029780379102248@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241106021725.4156175-1-matthew.brost@intel.com>
In-Reply-To: <20241106021725.4156175-1-matthew.brost@intel.com>
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

Series: series starting with [1/2] drm/xe: improve hibernation on igpu
URL   : https://patchwork.freedesktop.org/series/140973/
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
commit 5b6bd185b0efa9c5972fd6b3e119b66d281aac38
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Nov 5 18:17:25 2024 -0800

    drm/xe: Clear GGTT in xe_bo_restore_kernel
    
    Part of what xe_bo_restore_kernel does, is restore BO's GGTT mappings
    which may have been lost during a power state change. Missing is
    restoring the GGTT entries without BO mappings to a known state (e.g.,
    scratch pages). Update xe_bo_restore_kernel to clear the entire GGTT
    before restoring BO's GGTT mappings.
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Cc: <stable@vger.kernel.org> # v6.8+
+ /mt/dim checkpatch e806a414a0f1d780d467171712a598f2af2e17db drm-intel
e7e5f9702ffb drm/xe: improve hibernation on igpu
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
[drm] *ERROR* GT0: load failed: status = 0x400000A0, time = 10ms, freq = 1250MHz (req 1300MHz), done = -1

total: 0 errors, 1 warnings, 0 checks, 92 lines checked
5b6bd185b0ef drm/xe: Clear GGTT in xe_bo_restore_kernel


