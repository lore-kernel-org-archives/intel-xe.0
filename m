Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FFFC001DC
	for <intel-xe@archiver.kernel.org>; Mon, 31 Jul 2023 14:15:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC3710E14B;
	Mon, 31 Jul 2023 14:15:34 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id E412510E14B;
 Mon, 31 Jul 2023 14:15:32 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E06E8AADDC;
 Mon, 31 Jul 2023 14:15:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Date: Mon, 31 Jul 2023 14:15:32 -0000
Message-ID: <169081293291.10565.1532217135672737104@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230731141021.2854827-5-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20230731141021.2854827-5-janusz.krzysztofik@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_ku?=
 =?utf-8?q?nit=3A_Expose_some_built-in_features_to_modules_=28rev3=29?=
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

Series: kunit: Expose some built-in features to modules (rev3)
URL   : https://patchwork.freedesktop.org/series/121534/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a902a6e1875e2e9bcf92dfb96290396c9e2796c2
Author: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date:   Mon Jul 31 16:10:25 2023 +0200

    kunit: Allow kunit test modules to use test filtering
    
    External tools, e.g., Intel GPU tools (IGT), support execution of
    individual selftests provided by kernel modules.  That could be also
    applicable to kunit test modules if they provided test filtering.  But
    test filtering is now possible only when kunit code is built into the
    kernel.  Moreover, a filter can be specified only at boot time, then
    reboot is required each time a different filter is needed.
    
    Build the test filtering code also when kunit is configured as a module,
    expose test filtering functions to other kunit source files, and use them
    in kunit module notifier callback functions.  Userspace can then reload
    the kunit module with a value of the filter_glob parameter tuned to a
    specific kunit test module every time it wants to limit the scope of tests
    executed on that module load.  Make the kunit.filter_glob parameter
    visible in sysfs for user convenience.
    
    v3: Fix CONFIG_GLOB, required by filtering fuctions, not selected when
        building as a module.
    v2: Fix new name of a structure moved to kunit namespace not updated
        across all uses.
    
    Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
+ /mt/dim checkpatch d74e8f8407bc922b04ba50e8f4e888bedb31330a drm-intel
df233f946 kunit: Report the count of test suites in a module
443552161 kunit: Make 'list' action available to kunit test modules
a902a6e18 kunit: Allow kunit test modules to use test filtering
-:21: WARNING:TYPO_SPELLING: 'fuctions' may be misspelled - perhaps 'functions'?
#21: 
v3: Fix CONFIG_GLOB, required by filtering fuctions, not selected when
                                           ^^^^^^^^

total: 0 errors, 1 warnings, 0 checks, 166 lines checked


