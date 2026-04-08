Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261B11073C99
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 11:08:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D659910E611;
	Wed,  8 Apr 2026 11:08:03 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA81C10E612;
 Wed,  8 Apr 2026 11:08:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_USE_drm_mm_instead_of_drm?=
 =?utf-8?q?_SA_for_CCS_read/write_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Apr 2026 11:08:02 -0000
Message-ID: <177564648287.441898.5849668892108868722@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260408110145.1639937-4-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260408110145.1639937-4-satyanarayana.k.v.p@intel.com>
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

Series: USE drm mm instead of drm SA for CCS read/write (rev4)
URL   : https://patchwork.freedesktop.org/series/163588/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0d93d3585aa5595b1cf95a25fb62efb00f045c4f
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Date:   Wed Apr 8 11:01:48 2026 +0000

    drm/xe/vf: Use drm mm instead of drm sa for CCS read/write
    
    The suballocator algorithm tracks a hole cursor at the last allocation
    and tries to allocate after it. This is optimized for fence-ordered
    progress, where older allocations are expected to become reusable first.
    
    In fence-enabled mode, that ordering assumption holds. In fence-disabled
    mode, allocations may be freed in arbitrary order, so limiting allocation
    to the current hole window can miss valid free space and fail allocations
    despite sufficient total space.
    
    Use DRM memory manager instead of sub-allocator to get rid of this issue
    as CCS read/write operations do not use fences.
    
    Fixes: 864690cf4dd6 ("drm/xe/vf: Attach and detach CCS copy commands with BO")
    Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Maarten Lankhorst <dev@lankhorst.se>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 1debea0fa06176e70720a9c53b23c398b971fa5b drm-intel
46ac0bbf1186 drm/xe: Add memory pool with shadow support
-:31: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#31: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 466 lines checked
0d93d3585aa5 drm/xe/vf: Use drm mm instead of drm sa for CCS read/write


