Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C62B1125854
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 17:08:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A4F10E088;
	Wed, 11 Mar 2026 17:08:08 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5AFF10E088;
 Wed, 11 Mar 2026 17:08:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Scan_all_holes_when_fence?=
 =?utf-8?q?s_are_disabled_in_SA?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Mar 2026 17:08:06 -0000
Message-ID: <177324888665.346258.15054154065242350857@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260311155233.1903253-5-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260311155233.1903253-5-satyanarayana.k.v.p@intel.com>
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

Series: Scan all holes when fences are disabled in SA
URL   : https://patchwork.freedesktop.org/series/163042/
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
commit ef1edeac724533711bdb4aff50ad535812fb712c
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Date:   Wed Mar 11 15:52:37 2026 +0000

    drm/tests: Add KUnit test for suballocator allocation
    
    Add KUnit test to verify DRM suballocator allocation and insertion over
    multiple iterations with randomized sizes. Tests both successful
    allocations and allocation-free cycles to exercise fragmentation handling.
    
    Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Maarten Lankhorst <dev@lankhorst.se>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Christian König <christian.koenig@amd.com>
    Cc: dri-devel@lists.freedesktop.org
+ /mt/dim checkpatch 4a30f5fa0fe382b3915a8208a483d0044c40b9eb drm-intel
8c1ec15e0c45 drm/sa: Scan all holes when fences are disabled
6fa1ab55c100 drm/xe/vf: Disable fences while initializing CCS read/write sub-allocs
ef1edeac7245 drm/tests: Add KUnit test for suballocator allocation
-:55: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#55: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 97 lines checked


