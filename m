Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5848DEC8759
	for <intel-xe@archiver.kernel.org>; Thu,  7 Sep 2023 23:49:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BF910E0AD;
	Thu,  7 Sep 2023 23:49:18 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 41FE510E838;
 Thu,  7 Sep 2023 23:49:16 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 439A8A02F0;
 Thu,  7 Sep 2023 23:49:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Thu, 07 Sep 2023 23:49:16 -0000
Message-ID: <169413055627.17900.18122296137639814822@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230907135339.7971-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230907135339.7971-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/tests=3A_Fix_for_UAF_and_a_test_for_drm=5Fexec_lock_alloc_tra?=
 =?utf-8?q?cking_warning?=
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

Series: drm/tests: Fix for UAF and a test for drm_exec lock alloc tracking warning
URL   : https://patchwork.freedesktop.org/series/123394/
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
commit 7a92259dedbcbe780348e92d46388904659bd595
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Thu Sep 7 15:53:39 2023 +0200

    drm/tests/drm_exec: Add a test for object freeing within drm_exec_fini()
    
    Check that object freeing from within drm_exec_fini() works as expected
    and is unlikely to generate any warnings.
    
    v3:
    - Condition the test on CONFIG_DEBUG_LOCK_ALLOC
    - Make the test fail if the situation that generates the lockdep
      warning occurs. (Maxime Ripard)
    
    Cc: Maxime Ripard <mripard@kernel.org>
    Cc: Christian König <christian.koenig@amd.com>
    Cc: dri-devel@lists.freedesktop.org
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Acked-by: Maxime Ripard <mripard@kernel.org>
+ /mt/dim checkpatch 758f01ec2a6774fda1e8f8075d31f42b81783caf drm-intel
b0c870902 drm/tests: helpers: Avoid a driver uaf
-:134: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'd98780310719', maybe rebased or not pulled?
#134: 
Fixes: d98780310719 ("drm/tests: helpers: Allow to pass a custom drm_driver")

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
7a92259de drm/tests/drm_exec: Add a test for object freeing within drm_exec_fini()


