Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0DEEE7FF4
	for <intel-xe@archiver.kernel.org>; Mon, 11 Sep 2023 13:50:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563B010E301;
	Mon, 11 Sep 2023 13:50:39 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5779810E301;
 Mon, 11 Sep 2023 13:50:37 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 59F03AADF3;
 Mon, 11 Sep 2023 13:50:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Date: Mon, 11 Sep 2023 13:50:37 -0000
Message-ID: <169444023736.31366.50887640778197665@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230911130323.7037-2-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20230911130323.7037-2-janusz.krzysztofik@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/tests=3A_Fix_incorrect_argument_in_drm=5Ftest=5Fmm=5Finsert?=
 =?utf-8?q?=5Frange?=
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

Series: drm/tests: Fix incorrect argument in drm_test_mm_insert_range
URL   : https://patchwork.freedesktop.org/series/123542/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 377c31ab02b646ffe65e7b049f378fa86d2e6e89
Author: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date:   Mon Sep 11 15:03:24 2023 +0200

    drm/tests: Fix incorrect argument in drm_test_mm_insert_range
    
    While drm_mm test was converted form igt selftest to kunit, unexpected
    value of "end" argument equal "start" was introduced to one of calls to a
    function that executes the drm_test_mm_insert_range for specific start/end
    pair of arguments.  As a consequence, DRM_MM_BUG_ON(end <= start) is
    triggered.  Fix it by restoring the original value.
    
    Fixes: fc8d29e298cf ("drm: selftest: convert drm_mm selftest to KUnit")
    Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
    Cc: "Maíra Canal" <mairacanal@riseup.net>
    Cc: Arthur Grillo <arthurgrillo@riseup.net>
    Cc: Javier Martinez Canillas <javierm@redhat.com>
    Cc: Daniel Latypov <dlatypov@google.com>
    Cc: stable@vger.kernel.org # v6.1+
+ /mt/dim checkpatch 0533b5d42b2f8ec916646c10715ac45215e87689 drm-intel
377c31ab0 drm/tests: Fix incorrect argument in drm_test_mm_insert_range
-:15: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'fc8d29e298cf', maybe rebased or not pulled?
#15: 
Fixes: fc8d29e298cf ("drm: selftest: convert drm_mm selftest to KUnit")

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


