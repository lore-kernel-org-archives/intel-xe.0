Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4504CC4829A
	for <intel-xe@archiver.kernel.org>; Tue, 13 Feb 2024 03:38:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACC410E7AC;
	Tue, 13 Feb 2024 03:38:56 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B381C10E759;
 Tue, 13 Feb 2024 03:38:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Fix_modpost_war?=
 =?utf-8?q?ning_on_xe=5Fmocs_kunit_module?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Feb 2024 03:38:55 -0000
Message-ID: <170779553573.1201024.3173539831259810196@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240213033548.76219-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240213033548.76219-1-ashutosh.dixit@intel.com>
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

Series: drm/xe: Fix modpost warning on xe_mocs kunit module
URL   : https://patchwork.freedesktop.org/series/129806/
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
commit 41e9627aabcd556171a3eff5860bdbc7158ecb84
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Mon Feb 12 19:35:48 2024 -0800

    drm/xe: Fix modpost warning on xe_mocs kunit module
    
    $ make W=1 -j100 M=drivers/gpu/drm/xe
    MODPOST drivers/gpu/drm/xe/Module.symvers
    WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/xe/tests/xe_mocs_test.o
    
    Fix is identical to '1d425066f15f ("drm/xe: Fix modpost warning on kunit
    modules")'.
    
    Fixes: a6a4ea6d7d37 ("drm/xe: Add mocs kunit")
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch bd80d96780e6c0ce95fa6e69b2616388a1397ce9 drm-intel
41e9627aa drm/xe: Fix modpost warning on xe_mocs kunit module
-:13: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'a6a4ea6d7d37', maybe rebased or not pulled?
#13: 
Fixes: a6a4ea6d7d37 ("drm/xe: Add mocs kunit")

total: 0 errors, 1 warnings, 0 checks, 5 lines checked


