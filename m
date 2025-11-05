Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87328CCF9F8
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 13:43:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B72A10E74F;
	Wed,  5 Nov 2025 13:43:28 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA75A10E74F;
 Wed,  5 Nov 2025 13:43:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/pf=3A_Allow_to_loc?=
 =?utf-8?q?kdown_the_PF_using_custom_guard_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Nov 2025 13:43:27 -0000
Message-ID: <176235020769.20673.7444286095195954712@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251105130105.582-1-michal.wajdeczko@intel.com>
In-Reply-To: <20251105130105.582-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/pf: Allow to lockdown the PF using custom guard (rev4)
URL   : https://patchwork.freedesktop.org/series/156795/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f867e605613af1770f90c4b0afd4a8f06424d1f0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e25cb8a73111a5e7ccd2d1810c7f5f1edbac87f2
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed Nov 5 14:00:54 2025 +0100

    drm/xe/pf: Allow to lockdown the PF using custom guard
    
    Some driver components, like eudebug or ccs-mode, can't be used
    when VFs are enabled.  Add functions to allow those components
    to block the PF from enabling VFs for the requested duration.
    
    Introduce trivial counter to allow lockdown or exclusive access
    that can be used in the scenarios where we can't follow the strict
    owner semantics as required by the rw_semaphore implementation.
    
    Before enabling VFs, the PF will try to arm the "vfs_enabling"
    guard for the exclusive access.  This will fail if there are
    some lockdown requests already initiated by the other components.
    
    For testing purposes, add debugfs file which will call these new
    functions from the file's open/close hooks.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Christoph Manszewski <christoph.manszewski@intel.com>
+ /mt/dim checkpatch 8043455e28fb7b8089e55e4390547a4c3d7bd4dc drm-intel
e25cb8a73111 drm/xe/pf: Allow to lockdown the PF using custom guard
-:26: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#26: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 354 lines checked


