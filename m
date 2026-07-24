Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA22AC531D0
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 00:40:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 772D710E2E9;
	Fri, 24 Jul 2026 00:40:59 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D48810E2E9;
 Fri, 24 Jul 2026 00:40:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_memory_barr?=
 =?utf-8?q?ier_before_H2G_tail_write_on_wrap?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Jul 2026 00:40:57 -0000
Message-ID: <178485365764.222631.8308256231910915025@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260724003108.1561414-1-matthew.brost@intel.com>
In-Reply-To: <20260724003108.1561414-1-matthew.brost@intel.com>
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

Series: drm/xe: Add memory barrier before H2G tail write on wrap
URL   : https://patchwork.freedesktop.org/series/171034/
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
commit d1769ef82fb694119995d54666cbd03b0e5081d6
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Jul 23 17:31:08 2026 -0700

    drm/xe: Add memory barrier before H2G tail write on wrap
    
    When the H2G buffer wraps, it is padded with NOPs before updating the
    H2G descriptor tail. However, the tail update is performed without a
    memory barrier, allowing the GuC to observe the new tail value before
    the NOP writes become visible.
     
    This can result in the GuC reading stale H2G commands, potentially
    causing a variety of failures. Fix this by inserting a memory barrier
    before updating the H2G descriptor tail.
    
    Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
    Cc: stable@vger.kernel.org
    Reported-by: Sashiko <sashiko-bot@kernel.org>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 14d5aecf2acddcc01849c22468d654de384bf04c drm-intel
d1769ef82fb6 drm/xe: Add memory barrier before H2G tail write on wrap
-:20: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: or Link: with a URL to the report
#20: 
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>

total: 0 errors, 1 warnings, 0 checks, 7 lines checked


