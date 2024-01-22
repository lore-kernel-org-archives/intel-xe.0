Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFDAC47DD3
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 18:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC33710EC36;
	Mon, 22 Jan 2024 18:08:29 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F176710EC36;
 Mon, 22 Jan 2024 18:08:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_kunit=3A_Mark_filter*_par?=
 =?utf-8?q?ams_as_rw?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Mon, 22 Jan 2024 18:08:27 -0000
Message-ID: <170594690798.664962.7466799015438952960@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240122171408.3328510-1-lucas.demarchi@intel.com>
In-Reply-To: <20240122171408.3328510-1-lucas.demarchi@intel.com>
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

Series: kunit: Mark filter* params as rw
URL   : https://patchwork.freedesktop.org/series/129043/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e7f730565356938dd6c63cd498218fdc5d6a22b0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8cd913a43dcee417ada138551793640038365b74
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Mon Jan 22 09:14:08 2024 -0800

    kunit: Mark filter* params as rw
    
    By allowing the filter_glob parameter to be written to, it's possible to
    tweak the testsuites that will be executed on new module loads. This
    makes it easier to run specific tests without having to reload kunit and
    provides a way to filter tests on real HW even if kunit is builtin.
    Example for xe driver:
    
    1) Run just 1 test
            # echo -n xe_bo > /sys/module/kunit/parameters/filter_glob
            # modprobe -r xe_live_test
            # modprobe xe_live_test
            # ls /sys/kernel/debug/kunit/
            xe_bo
    
    2) Run all tests
            # echo \* > /sys/module/kunit/parameters/filter_glob
            # modprobe -r xe_live_test
            # modprobe xe_live_test
            # ls /sys/kernel/debug/kunit/
            xe_bo  xe_dma_buf  xe_migrate  xe_mocs
    
    For completeness and to cover other use cases, also change filter and
    filter_action to rw.
    
    Link: https://lore.kernel.org/intel-xe/dzacvbdditbneiu3e3fmstjmttcbne44yspumpkd6sjn56jqpk@vxu7sksbqrp6/
    Reviewed-by: Rae Moar <rmoar@google.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 6c50b86b2afe0f6c5929aa3f48b36b31cd736ab9 drm-intel
8cd913a43 kunit: Mark filter* params as rw


