Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69C6C53200
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 09:25:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B0A010E66E;
	Wed, 29 Jul 2026 09:25:03 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2ED10E15A;
 Wed, 29 Jul 2026 09:25:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_GPU_buddy_allocator_test_?=
 =?utf-8?q?fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Krzysztof Niemiec" <krzysztof.niemiec@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Jul 2026 09:25:02 -0000
Message-ID: <178531710288.336.12534736875944694790@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260729091816.27860-2-krzysztof.niemiec@intel.com>
In-Reply-To: <20260729091816.27860-2-krzysztof.niemiec@intel.com>
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

Series: GPU buddy allocator test fixes
URL   : https://patchwork.freedesktop.org/series/171240/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0d7537549c5745005f467baefded3a984bdda1ae
Author: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Date:   Wed Jul 29 11:18:17 2026 +0200

    gpu/tests: Add a dedicated .kunitconfig
    
    Add a dedicated .kunitconfig for running the GPU buddy allocator tests.
    
    Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
    Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
    Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
    Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
+ /mt/dim checkpatch 2af7be980ab54de6662090938fb20e8e2aa8c2dd drm-intel
87eeafcc2ca0 gpu: Fix dependencies in CONFIG_GPU_BUDDY_KUNIT_TEST
0d7537549c57 gpu/tests: Add a dedicated .kunitconfig
-:14: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#14: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 2 lines checked


