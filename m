Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71AAC47077
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 01:37:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672A210E040;
	Fri, 12 Jan 2024 01:37:04 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B070D10E040;
 Fri, 12 Jan 2024 01:37:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_kunit=3A_Mark_filter=5Fgl?=
 =?utf-8?q?ob_param_as_rw?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Fri, 12 Jan 2024 01:37:02 -0000
Message-ID: <170502342272.331655.10720957192797182425@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240112001240.1710962-1-lucas.demarchi@intel.com>
In-Reply-To: <20240112001240.1710962-1-lucas.demarchi@intel.com>
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

Series: kunit: Mark filter_glob param as rw
URL   : https://patchwork.freedesktop.org/series/128696/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
faa12d3432d7ef7793d934cd9338c555e95a5aad
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1839ef65983a33ebe573b9f0469eeccc2920b4e1
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Thu Jan 11 16:12:40 2024 -0800

    kunit: Mark filter_glob param as rw
    
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
    
    References: https://lore.kernel.org/intel-xe/dzacvbdditbneiu3e3fmstjmttcbne44yspumpkd6sjn56jqpk@vxu7sksbqrp6/
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 3095fbb4deb0722d417b6a4ad4213e2ed9ecd052 drm-intel
1839ef659 kunit: Mark filter_glob param as rw
-:26: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#26: 
References: https://lore.kernel.org/intel-xe/dzacvbdditbneiu3e3fmstjmttcbne44yspumpkd6sjn56jqpk@vxu7sksbqrp6/

-:26: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#26: 
References: https://lore.kernel.org/intel-xe/dzacvbdditbneiu3e3fmstjmttcbne44yspumpkd6sjn56jqpk@vxu7sksbqrp6/

total: 0 errors, 2 warnings, 0 checks, 8 lines checked


