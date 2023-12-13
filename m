Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7F7C4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 17:51:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFAE810E7EB;
	Wed, 13 Dec 2023 17:51:15 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6A17210E7EB;
 Wed, 13 Dec 2023 17:51:14 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6419FAADFA;
 Wed, 13 Dec 2023 17:51:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_drm/xe/exec=3A_move_fence_reservation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Wed, 13 Dec 2023 17:51:14 -0000
Message-ID: <170248987440.10263.13102217408394468990@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231213174703.536989-3-matthew.auld@intel.com>
In-Reply-To: <20231213174703.536989-3-matthew.auld@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [1/2] drm/xe/exec: move fence reservation
URL   : https://patchwork.freedesktop.org/series/127758/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3e9c52a2d20f7a36efbfcac40f10a2c92829f82c
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Wed Dec 13 17:47:05 2023 +0000

    drm/xe/exec: reserve fence slot for CPU bind
    
    Looks possible to switch from CPU binding to GPU binding mid exec, and
    if that happens for the same dma-resv we might use two fence slots, once
    for the dummy fence, and another for the actual GPU bind.
    
    References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/698
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 5cd1893366708380854f4694ae57417192458a6b drm-intel
d14dff218 drm/xe/exec: move fence reservation
-:19: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#19: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/698

total: 0 errors, 1 warnings, 0 checks, 52 lines checked
3e9c52a2d drm/xe/exec: reserve fence slot for CPU bind
-:13: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#13: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/698

total: 0 errors, 1 warnings, 0 checks, 19 lines checked


