Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF053C5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 18:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0BA10E032;
	Tue,  3 Jun 2025 18:57:42 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BBB10E032;
 Tue,  3 Jun 2025 18:57:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/ttm=3A_Fix_build_with?=
 =?utf-8?q?_CONFIG=5FDEBUG=5FFS=3Dn?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Jun 2025 18:57:41 -0000
Message-ID: <174897706168.45422.3888496254526108742@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250603184750.3304647-2-lucas.demarchi@intel.com>
In-Reply-To: <20250603184750.3304647-2-lucas.demarchi@intel.com>
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

Series: drm/ttm: Fix build with CONFIG_DEBUG_FS=n
URL   : https://patchwork.freedesktop.org/series/149797/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b7988235e298b8979a7340dcfb7937b4f6fb7524
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue Jun 3 11:47:51 2025 -0700

    drm/ttm: Fix build with CONFIG_DEBUG_FS=n
    
    Move the define outside the ifdef for CONFIG_DEBUG_FS to fix the build.
    This currently breaks drm kunit tests:
    
            $ ./tools/testing/kunit/kunit.py run --kunitconfig drivers/gpu/drm/ttm/tests/.kunitconfig
            ERROR:root:../drivers/gpu/drm/ttm/ttm_pool.c: In function ‘ttm_pool_mgr_init’:
            ../drivers/gpu/drm/ttm/ttm_pool.c:1335:30: error: ‘TTM_SHRINKER_BATCH’ undeclared (first use in this function)
             1335 |         mm_shrinker->batch = TTM_SHRINKER_BATCH;
    
    Fixes: 22b929b25293 ("drm/ttm: Increase pool shrinker batch target")
    Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Cc: Christian König <christian.koenig@amd.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch ba486e3b10ce5b4ee4d1ffc58aa4cc3b669c02a3 drm-intel
b7988235e298 drm/ttm: Fix build with CONFIG_DEBUG_FS=n
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
	$ ./tools/testing/kunit/kunit.py run --kunitconfig drivers/gpu/drm/ttm/tests/.kunitconfig

total: 0 errors, 1 warnings, 0 checks, 18 lines checked


