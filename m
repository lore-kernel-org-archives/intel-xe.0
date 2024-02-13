Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CF6C4829A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 11:27:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD3210E3F9;
	Tue, 13 Feb 2024 11:27:43 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD5A10E4A6;
 Tue, 13 Feb 2024 11:27:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_avoid_function_?=
 =?utf-8?q?cast_warnings?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Feb 2024 11:27:41 -0000
Message-ID: <170782366150.1201024.6302170908259064823@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240213095719.454865-1-arnd@kernel.org>
In-Reply-To: <20240213095719.454865-1-arnd@kernel.org>
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

Series: drm/xe: avoid function cast warnings
URL   : https://patchwork.freedesktop.org/series/129823/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit eb6c0bc890219860e3d0224d01be5ccb4e607740
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Tue Feb 13 10:56:48 2024 +0100

    drm/xe: avoid function cast warnings
    
    clang-16 warns about a cast between incompatible function types:
    
    drivers/gpu/drm/xe/xe_range_fence.c:155:10: error: cast from 'void (*)(const void *)' to 'void (*)(struct xe_range_fence *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
      155 |         .free = (void (*)(struct xe_range_fence *rfence)) kfree,
          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    Avoid this with a trivial helper function that calls kfree() here.
    
    Fixes: 845f64bdbfc9 ("drm/xe: Introduce a range-fence utility")
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
    Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch d395a4fdb0e78537f06bb401a9501b8467c774a3 drm-intel
eb6c0bc89 drm/xe: avoid function cast warnings
-:17: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '845f64bdbfc9', maybe rebased or not pulled?
#17: 
Fixes: 845f64bdbfc9 ("drm/xe: Introduce a range-fence utility")

-:29: ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#29: FILE: drivers/gpu/drm/xe/xe_range_fence.c:154:
+static void xe_range_fence_free(struct xe_range_fence * rfence)

total: 1 errors, 1 warnings, 0 checks, 12 lines checked


